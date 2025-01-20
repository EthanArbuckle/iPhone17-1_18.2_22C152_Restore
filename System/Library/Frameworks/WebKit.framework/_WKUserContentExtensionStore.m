@interface _WKUserContentExtensionStore
+ (id)defaultStore;
+ (id)storeWithURL:(id)a3;
- (Object)_apiObject;
- (WKContentRuleListStore)_contentRuleListStore;
- (id).cxx_construct;
- (id)_initWithWKContentRuleListStore:(id)a3;
- (void)_invalidateContentExtensionVersionForIdentifier:(id)a3;
- (void)_removeAllContentExtensions;
- (void)compileContentExtensionForIdentifier:(id)a3 encodedContentExtension:(id)a4 completionHandler:(id)a5;
- (void)lookupContentExtensionForIdentifier:(id)a3 completionHandler:(id)a4;
- (void)removeContentExtensionForIdentifier:(id)a3 completionHandler:(id)a4;
@end

@implementation _WKUserContentExtensionStore

+ (id)defaultStore
{
  v2 = (void *)CFMakeCollectable([[_WKUserContentExtensionStore alloc] _initWithWKContentRuleListStore:+[WKContentRuleListStore defaultStoreWithLegacyFilename]]);

  return v2;
}

+ (id)storeWithURL:(id)a3
{
  v3 = (void *)CFMakeCollectable([[_WKUserContentExtensionStore alloc] _initWithWKContentRuleListStore:+[WKContentRuleListStore storeWithURLAndLegacyFilename:a3]]);

  return v3;
}

- (void)compileContentExtensionForIdentifier:(id)a3 encodedContentExtension:(id)a4 completionHandler:(id)a5
{
  m_ptr = self->_contentRuleListStore.m_ptr;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __111___WKUserContentExtensionStore_compileContentExtensionForIdentifier_encodedContentExtension_completionHandler___block_invoke;
  v6[3] = &unk_1E5812940;
  v6[4] = a5;
  [m_ptr compileContentRuleListForIdentifier:a3 encodedContentRuleList:a4 completionHandler:v6];
}

- (void)lookupContentExtensionForIdentifier:(id)a3 completionHandler:(id)a4
{
  m_ptr = self->_contentRuleListStore.m_ptr;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __86___WKUserContentExtensionStore_lookupContentExtensionForIdentifier_completionHandler___block_invoke;
  v5[3] = &unk_1E5812940;
  v5[4] = a4;
  [m_ptr lookUpContentRuleListForIdentifier:a3 completionHandler:v5];
}

- (void)removeContentExtensionForIdentifier:(id)a3 completionHandler:(id)a4
{
  m_ptr = self->_contentRuleListStore.m_ptr;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __86___WKUserContentExtensionStore_removeContentExtensionForIdentifier_completionHandler___block_invoke;
  v5[3] = &unk_1E5812968;
  v5[4] = a4;
  [m_ptr removeContentRuleListForIdentifier:a3 completionHandler:v5];
}

- (Object)_apiObject
{
  return (Object *)[self->_contentRuleListStore.m_ptr _apiObject];
}

- (void).cxx_destruct
{
  m_ptr = self->_contentRuleListStore.m_ptr;
  self->_contentRuleListStore.m_ptr = 0;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

- (void)_removeAllContentExtensions
{
}

- (void)_invalidateContentExtensionVersionForIdentifier:(id)a3
{
}

- (id)_initWithWKContentRuleListStore:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_WKUserContentExtensionStore;
  v4 = [(_WKUserContentExtensionStore *)&v7 init];
  if (v4)
  {
    if (a3) {
      CFRetain(a3);
    }
    m_ptr = v4->_contentRuleListStore.m_ptr;
    v4->_contentRuleListStore.m_ptr = a3;
    if (m_ptr) {
      CFRelease(m_ptr);
    }
  }
  return v4;
}

- (WKContentRuleListStore)_contentRuleListStore
{
  return (WKContentRuleListStore *)self->_contentRuleListStore.m_ptr;
}

@end