@interface WKWebPrivacyNotificationListener
- (WKWebPrivacyNotificationListener)init;
- (id).cxx_construct;
- (void)dealloc;
- (void)didUpdate:(id)a3;
- (void)listenForLinkFilteringDataChanges:(id)a3;
- (void)listenForRestrictedOpenerDomainsChanges:(id)a3;
- (void)listenForStorageAccessPromptQuirkChanges:(id)a3;
- (void)listenForStorageAccessUserAgentStringQuirkChanges:(id)a3;
@end

@implementation WKWebPrivacyNotificationListener

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

- (WKWebPrivacyNotificationListener)init
{
  v5.receiver = self;
  v5.super_class = (Class)WKWebPrivacyNotificationListener;
  v2 = [(WKWebPrivacyNotificationListener *)&v5 init];
  if (v2 && PAL::WebPrivacyLibrary((PAL *)1))
  {
    v3 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 addObserver:v2 selector:sel_didUpdate_ name:PAL::get_WebPrivacy_WPResourceDataChangedNotificationName((PAL *)v3) object:0];
  }
  return v2;
}

- (void)listenForLinkFilteringDataChanges:(id)a3
{
  v4 = _Block_copy(a3);
  _Block_release(self->_linkFilteringDataCallback.m_block);
  self->_linkFilteringDataCallback.m_block = v4;

  _Block_release(0);
}

- (void)listenForStorageAccessUserAgentStringQuirkChanges:(id)a3
{
  v4 = _Block_copy(a3);
  _Block_release(self->_storageAccessUserAgentStringQuirksDataCallback.m_block);
  self->_storageAccessUserAgentStringQuirksDataCallback.m_block = v4;

  _Block_release(0);
}

- (void)listenForStorageAccessPromptQuirkChanges:(id)a3
{
  v4 = _Block_copy(a3);
  _Block_release(self->_storageAccessPromptQuirksDataCallback.m_block);
  self->_storageAccessPromptQuirksDataCallback.m_block = v4;

  _Block_release(0);
}

- (void)listenForRestrictedOpenerDomainsChanges:(id)a3
{
  v4 = _Block_copy(a3);
  _Block_release(self->_restrictedOpenerDomainsCallback.m_block);
  self->_restrictedOpenerDomainsCallback.m_block = v4;

  _Block_release(0);
}

- (void)dealloc
{
  if (PAL::WebPrivacyLibrary((PAL *)1))
  {
    v3 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 removeObserver:self name:PAL::get_WebPrivacy_WPResourceDataChangedNotificationName((PAL *)v3) object:0];
  }
  v4.receiver = self;
  v4.super_class = (Class)WKWebPrivacyNotificationListener;
  [(WKWebPrivacyNotificationListener *)&v4 dealloc];
}

- (void)didUpdate:(id)a3
{
  objc_super v4 = (void *)[a3 userInfo];
  objc_super v5 = (void *)[v4 objectForKey:PAL::get_WebPrivacy_WPNotificationUserInfoResourceTypeKey((PAL *)v4)];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && v5)
  {
    if (self->_linkFilteringDataCallback.m_block && [v5 integerValue] == 2) {
      (*((void (**)(void))self->_linkFilteringDataCallback.m_block + 2))();
    }
    if (self->_storageAccessPromptQuirksDataCallback.m_block && [v5 integerValue] == 7) {
      (*((void (**)(void))self->_storageAccessPromptQuirksDataCallback.m_block + 2))();
    }
    if (self->_storageAccessUserAgentStringQuirksDataCallback.m_block && [v5 integerValue] == 6) {
      (*((void (**)(void))self->_storageAccessUserAgentStringQuirksDataCallback.m_block + 2))();
    }
    if (self->_restrictedOpenerDomainsCallback.m_block && [v5 integerValue] == 8)
    {
      v6 = (void (*)(void))*((void *)self->_restrictedOpenerDomainsCallback.m_block + 2);
      v6();
    }
  }
}

- (void).cxx_destruct
{
  _Block_release(self->_restrictedOpenerDomainsCallback.m_block);
  _Block_release(self->_storageAccessUserAgentStringQuirksDataCallback.m_block);
  _Block_release(self->_storageAccessPromptQuirksDataCallback.m_block);
  id m_block = self->_linkFilteringDataCallback.m_block;

  _Block_release(m_block);
}

@end