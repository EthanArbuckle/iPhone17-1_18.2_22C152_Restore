@interface WKWebProcessPlugInBrowserContextController
+ (id)lookUpBrowsingContextFromHandle:(id)a3;
- (BOOL)_defersLoading;
- (BOOL)_usesNonPersistentWebsiteDataStore;
- (NSString)_groupIdentifier;
- (Object)_apiObject;
- (OpaqueWKBundlePage)_bundlePageRef;
- (WKBrowsingContextHandle)handle;
- (WKDOMDocument)mainFrameDocument;
- (WKDOMRange)selectedRange;
- (WKWebProcessPlugInEditingDelegate)_editingDelegate;
- (WKWebProcessPlugInFormDelegatePrivate)_formDelegate;
- (WKWebProcessPlugInFrame)mainFrame;
- (WKWebProcessPlugInLoadDelegate)loadDelegate;
- (_WKRemoteObjectRegistry)_remoteObjectRegistry;
- (id).cxx_construct;
- (void)_setEditingDelegate:(id)a3;
- (void)_setFormDelegate:(id)a3;
- (void)dealloc;
- (void)setLoadDelegate:(id)a3;
@end

@implementation WKWebProcessPlugInBrowserContextController

- (id).cxx_construct
{
  *((_OWORD *)self + 158) = 0u;
  *((_OWORD *)self + 157) = 0u;
  return self;
}

- (_WKRemoteObjectRegistry)_remoteObjectRegistry
{
  result = (_WKRemoteObjectRegistry *)self->_remoteObjectRegistry.m_ptr;
  if (!result)
  {
    result = [[_WKRemoteObjectRegistry alloc] _initWithWebPage:&self->_page];
    m_ptr = self->_remoteObjectRegistry.m_ptr;
    self->_remoteObjectRegistry.m_ptr = result;
    if (m_ptr)
    {
      CFRelease(m_ptr);
      return (_WKRemoteObjectRegistry *)self->_remoteObjectRegistry.m_ptr;
    }
  }
  return result;
}

- (NSString)_groupIdentifier
{
  if (*(void *)(*(void *)&self->_anon_38[48] + 16)) {
    return (NSString *)WTF::StringImpl::operator NSString *();
  }
  else {
    return (NSString *)&stru_1EEA10550;
  }
}

- (void)_setFormDelegate:(id)a3
{
  objc_storeWeak(&self->_formDelegate.m_weakReference, a3);
  if (a3)
  {
    uint64_t v5 = WTF::fastMalloc((WTF *)0x10);
    *(void *)uint64_t v5 = &unk_1EE9D7728;
    *(void *)(v5 + 8) = 0;
    objc_initWeak((id *)(v5 + 8), self);
    p_page = &self->_page;
    v7 = (void *)v5;
  }
  else
  {
    p_page = &self->_page;
    v7 = 0;
  }
  WebKit::WebPage::setInjectedBundleFormClient((uint64_t)p_page, &v7);
  if (v7) {
    (*(void (**)(void *))(*v7 + 8))(v7);
  }
}

- (void)setLoadDelegate:(id)a3
{
  objc_storeWeak(&self->_loadDelegate.m_weakReference, a3);
  if (a3)
  {
    long long v32 = 0u;
    long long v33 = 0u;
    long long v29 = 0u;
    uint64_t v31 = 0;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v24 = 0u;
    uint64_t v26 = 0;
    uint64_t v20 = 0;
    uint64_t v23 = 0;
    long long v17 = 0u;
    uint64_t v19 = 0;
    long long v14 = 0u;
    *(void *)&long long v6 = 11;
    *((void *)&v6 + 1) = self;
    v7 = didStartProvisionalLoadForFrame;
    v8 = didReceiveServerRedirectForProvisionalLoadForFrame;
    v10 = didCommitLoadForFrame;
    v11 = didFinishDocumentLoadForFrame;
    v9 = didFailProvisionalLoadWithErrorForFrame;
    *(void *)&long long v13 = didFailLoadWithErrorForFrame;
    *((void *)&v13 + 1) = didSameDocumentNavigationForFrame;
    v12 = didFinishLoadForFrame;
    v18 = didClearWindowObjectForFrame;
    v25 = globalObjectIsAvailableForFrame;
    v36 = serviceWorkerGlobalObjectIsAvailableForFrame;
    v34 = willInjectUserScriptForFrame;
    v16 = didRemoveFrameFromHierarchy;
    v21 = didHandleOnloadEventsForFrame;
    v15 = didFirstVisuallyNonEmptyLayoutForFrame;
    v22 = didLayoutForFrame;
    v30 = didReachLayoutMilestone;
    v35 = layoutMilestones;
    WKBundlePageSetPageLoaderClient(*(void **)&self->_page.data.__lx[8], &v6);
    v10 = 0;
    long long v13 = 0u;
    *(void *)&long long v6 = 1;
    v8 = willSendRequestForFrame;
    *((void *)&v6 + 1) = self;
    v7 = didInitiateLoadForResource;
    v9 = didReceiveResponseForResource;
    v11 = didFinishLoadForResource;
    v12 = didFailLoadForResource;
    WKBundlePageSetResourceLoadClient(*(void **)&self->_page.data.__lx[8], &v6);
  }
  else
  {
    WKBundlePageSetPageLoaderClient(*(void **)&self->_page.data.__lx[8], 0);
    uint64_t v5 = *(void **)&self->_page.data.__lx[8];
    WKBundlePageSetResourceLoadClient(v5, 0);
  }
}

- (Object)_apiObject
{
  return (Object *)&self->_page;
}

- (WKWebProcessPlugInLoadDelegate)loadDelegate
{
  return (WKWebProcessPlugInLoadDelegate *)objc_loadWeak(&self->_loadDelegate.m_weakReference);
}

- (void)dealloc
{
  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainRunLoop(v3, (objc_object *)self) & 1) == 0)
  {
    m_ptr = self->_remoteObjectRegistry.m_ptr;
    if (m_ptr) {
      [m_ptr _invalidate];
    }
    (**(void (***)(void))self->_page.data.__lx)();
    v5.receiver = self;
    v5.super_class = (Class)WKWebProcessPlugInBrowserContextController;
    [(WKWebProcessPlugInBrowserContextController *)&v5 dealloc];
  }
}

- (WKDOMDocument)mainFrameDocument
{
  uint64_t v2 = *(void *)self->_anon_38;
  if (v2 && (uint64_t v3 = *(void *)(v2 + 160)) != 0 && !*(unsigned char *)(v3 + 144)) {
    return (WKDOMDocument *)WebKit::toWKDOMNode(*(WebKit **)(v3 + 296), (WebCore::Node *)a2);
  }
  else {
    return 0;
  }
}

- (WKDOMRange)selectedRange
{
  WebKit::WebPage::currentSelectionAsRange((WebKit **)&self->_page, (WebCore::Page *)a2, (uint64_t)v6);
  if (v6[32])
  {
    WebCore::createLiveRange();
    uint64_t v3 = (WKDOMRange *)WebKit::toWKDOMRange(v5, v2);
    if (v5)
    {
      if (*((_DWORD *)v5 + 2) == 1) {
        (*(void (**)())(*(void *)v5 + 8))();
      }
      else {
        --*((_DWORD *)v5 + 2);
      }
    }
  }
  else
  {
    uint64_t v3 = 0;
  }
  std::__optional_destruct_base<WebCore::SimpleRange,false>::~__optional_destruct_base[abi:sn180100]((uint64_t)v6);
  return v3;
}

- (WKWebProcessPlugInFrame)mainFrame
{
  return *(WKWebProcessPlugInFrame **)(*(void *)&self->_anon_38[40] + 8);
}

- (void).cxx_destruct
{
  m_ptr = self->_remoteObjectRegistry.m_ptr;
  self->_remoteObjectRegistry.m_ptr = 0;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
  objc_destroyWeak(&self->_editingDelegate.m_weakReference);
  objc_destroyWeak(&self->_formDelegate.m_weakReference);

  objc_destroyWeak(&self->_loadDelegate.m_weakReference);
}

- (OpaqueWKBundlePage)_bundlePageRef
{
  return *(OpaqueWKBundlePage **)&self->_page.data.__lx[8];
}

- (WKBrowsingContextHandle)handle
{
  uint64_t v2 = (void *)CFMakeCollectable([[WKBrowsingContextHandle alloc] _initWithPage:&self->_page]);

  return (WKBrowsingContextHandle *)v2;
}

+ (id)lookUpBrowsingContextFromHandle:(id)a3
{
  {
    long long v6 = (WebKit::WebProcess *)WTF::fastMalloc((WTF *)0x330);
    WebKit::WebProcess::WebProcess(v6);
  }
  uint64_t v3 = WebKit::WebProcess::singleton(void)::process;
  uint64_t v4 = [a3 _webPageID];
  if ((unint64_t)(v4 - 1) >= 0xFFFFFFFFFFFFFFFELL)
  {
    __break(0xC471u);
    JUMPOUT(0x198E1367CLL);
  }
  uint64_t v7 = v4;
  id result = (id)WTF::HashMap<PAL::SessionID,std::unique_ptr<WebCore::NetworkStorageSession>,WTF::DefaultHash<PAL::SessionID>,WTF::HashTraits<PAL::SessionID>,WTF::HashTraits<std::unique_ptr<WebCore::NetworkStorageSession>>,WTF::HashTableTraits>::get<WTF::IdentityHashTranslator<WTF::HashMap<PAL::SessionID,std::unique_ptr<WebCore::NetworkStorageSession>,WTF::DefaultHash<PAL::SessionID>,WTF::HashTraits<PAL::SessionID>,WTF::HashTraits<std::unique_ptr<WebCore::NetworkStorageSession>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::DefaultHash<PAL::SessionID>>,PAL::SessionID>((uint64_t *)(v3 + 120), &v7);
  if (result) {
    return (id)*((void *)result + 1);
  }
  return result;
}

- (WKWebProcessPlugInFormDelegatePrivate)_formDelegate
{
  return (WKWebProcessPlugInFormDelegatePrivate *)objc_loadWeak(&self->_formDelegate.m_weakReference);
}

- (WKWebProcessPlugInEditingDelegate)_editingDelegate
{
  return (WKWebProcessPlugInEditingDelegate *)objc_loadWeak(&self->_editingDelegate.m_weakReference);
}

- (void)_setEditingDelegate:(id)a3
{
  p_editingDelegate = &self->_editingDelegate;
  objc_storeWeak(&self->_editingDelegate.m_weakReference, a3);
  if (a3)
  {
    uint64_t v6 = WTF::fastMalloc((WTF *)0x18);
    *(void *)uint64_t v6 = &unk_1EE9D77A0;
    *(void *)(v6 + 8) = self;
    id WeakRetained = objc_loadWeakRetained(&p_editingDelegate->m_weakReference);
    *(unsigned char *)(v6 + 16) = objc_opt_respondsToSelector() & 1;
    *(unsigned char *)(v6 + 17) = objc_opt_respondsToSelector() & 1;
    *(unsigned char *)(v6 + 18) = objc_opt_respondsToSelector() & 1;
    *(unsigned char *)(v6 + 19) = objc_opt_respondsToSelector() & 1;
    *(unsigned char *)(v6 + 20) = objc_opt_respondsToSelector() & 1;
    *(unsigned char *)(v6 + 21) = objc_opt_respondsToSelector() & 1;
    *(unsigned char *)(v6 + 22) = objc_opt_respondsToSelector() & 1;
    if (WeakRetained) {
      CFRelease(WeakRetained);
    }
    v8 = (void *)v6;
  }
  else
  {
    v8 = 0;
  }
  WebKit::WebPage::setInjectedBundleEditorClient((uint64_t)&self->_page, &v8);
  if (v8) {
    (*(void (**)(void *))(*v8 + 8))(v8);
  }
}

- (BOOL)_defersLoading
{
  return 0;
}

- (BOOL)_usesNonPersistentWebsiteDataStore
{
  return WebKit::WebPage::usesEphemeralSession((WebKit::WebPage *)&self->_page);
}

@end