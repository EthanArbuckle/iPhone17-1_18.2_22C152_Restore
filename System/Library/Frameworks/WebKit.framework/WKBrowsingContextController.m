@interface WKBrowsingContextController
+ (WTF::StringImpl)registerSchemeForCustomProtocol:(uint64_t)a1;
+ (WTF::StringImpl)unregisterSchemeForCustomProtocol:(uint64_t)a1;
+ (id)_browsingContextControllerForPageRef:(OpaqueWKPage *)a3;
+ (id)customSchemes;
+ (uint64_t)registerSchemeForCustomProtocol:(WTF *)this;
+ (uint64_t)unregisterSchemeForCustomProtocol:(WTF *)this;
+ (void)registerSchemeForCustomProtocol:(id)a3;
+ (void)registerSchemeForCustomProtocol:(void *)a1;
+ (void)unregisterSchemeForCustomProtocol:(id)a3;
+ (void)unregisterSchemeForCustomProtocol:(void *)a1;
- (BOOL)_webProcessIsResponsive;
- (BOOL)canGoBack;
- (BOOL)canGoForward;
- (BOOL)hasOnlySecureContent;
- (BOOL)isLoading;
- (BOOL)paginationBehavesLikeColumns;
- (BOOL)paginationLineGridEnabled;
- (NSArray)certificateChain;
- (NSString)applicationNameForUserAgent;
- (NSString)customUserAgent;
- (NSString)title;
- (NSURL)activeURL;
- (NSURL)committedURL;
- (NSURL)provisionalURL;
- (NSURL)unreachableURL;
- (OpaqueWKPage)_pageRef;
- (WKBackForwardList)backForwardList;
- (WKBrowsingContextHandle)handle;
- (WKBrowsingContextHistoryDelegate)historyDelegate;
- (WKBrowsingContextLoadDelegate)loadDelegate;
- (WKBrowsingContextPolicyDelegate)policyDelegate;
- (_WKRemoteObjectRegistry)_remoteObjectRegistry;
- (double)estimatedProgress;
- (double)gapBetweenPages;
- (double)pageLength;
- (double)pageZoom;
- (double)textZoom;
- (id).cxx_construct;
- (id)_initWithPageRef:(OpaqueWKPage *)a3;
- (int)processIdentifier;
- (unint64_t)pageCount;
- (unint64_t)paginationMode;
- (void)dealloc;
- (void)goBack;
- (void)goForward;
- (void)goToBackForwardListItem:(id)a3;
- (void)loadAlternateHTMLString:(id)a3 baseURL:(id)a4 forUnreachableURL:(id)a5;
- (void)loadData:(id)a3 MIMEType:(id)a4 textEncodingName:(id)a5 baseURL:(id)a6;
- (void)loadData:(id)a3 MIMEType:(id)a4 textEncodingName:(id)a5 baseURL:(id)a6 userData:(id)a7;
- (void)loadFileURL:(id)a3 restrictToFilesWithin:(id)a4;
- (void)loadFileURL:(id)a3 restrictToFilesWithin:(id)a4 userData:(id)a5;
- (void)loadHTMLString:(id)a3 baseURL:(id)a4;
- (void)loadHTMLString:(id)a3 baseURL:(id)a4 userData:(id)a5;
- (void)loadRequest:(id)a3;
- (void)loadRequest:(id)a3 userData:(id)a4;
- (void)reload;
- (void)reloadFromOrigin;
- (void)setApplicationNameForUserAgent:(id)a3;
- (void)setCustomUserAgent:(id)a3;
- (void)setGapBetweenPages:(double)a3;
- (void)setHistoryDelegate:(id)a3;
- (void)setLoadDelegate:(id)a3;
- (void)setPageLength:(double)a3;
- (void)setPageZoom:(double)a3;
- (void)setPaginationBehavesLikeColumns:(BOOL)a3;
- (void)setPaginationMode:(unint64_t)a3;
- (void)setPolicyDelegate:(id)a3;
- (void)setTextZoom:(double)a3;
- (void)stopLoading;
@end

@implementation WKBrowsingContextController

+ (void)registerSchemeForCustomProtocol:(id)a3
{
  v4 = (WTF::WorkQueue *)[MEMORY[0x1E4F29060] isMainThread];
  if (v4)
  {
    MEMORY[0x19972EAD0](&v11, a3);
    WebKit::WebProcessPool::registerGlobalURLSchemeAsHavingCustomProtocolHandlers((WebKit *)&v11, v5);
    v7 = v11;
    v11 = 0;
    if (v7)
    {
      if (*(_DWORD *)v7 == 2) {
        WTF::StringImpl::destroy(v7, v6);
      }
      else {
        *(_DWORD *)v7 -= 2;
      }
    }
  }
  else
  {
    uint64_t v8 = WTF::WorkQueue::main(v4);
    if (a3) {
      CFRetain(a3);
    }
    v9 = (WTF::StringImpl *)WTF::fastMalloc((WTF *)0x10);
    *(void *)v9 = &unk_1EE9C2B38;
    *((void *)v9 + 1) = a3;
    v11 = v9;
    (*(void (**)(uint64_t, WTF::StringImpl **))(*(void *)v8 + 32))(v8, &v11);
    v10 = v11;
    v11 = 0;
    if (v10) {
      (*(void (**)(WTF::StringImpl *))(*(void *)v10 + 8))(v10);
    }
  }
}

- (void)dealloc
{
  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainRunLoop(v3, (objc_object *)self) & 1) == 0)
  {
    if (byte_1EB3597C1)
    {
      v5 = &qword_1EB359000;
      if (qword_1EB3597D0)
      {
        m_ptr = self->_page.m_ptr;
        int v7 = *(_DWORD *)(qword_1EB3597D0 - 8);
        unint64_t v8 = ((unint64_t)m_ptr + ~((void)m_ptr << 32)) ^ (((unint64_t)m_ptr + ~((void)m_ptr << 32)) >> 22);
        unint64_t v9 = 9 * ((v8 + ~(v8 << 13)) ^ ((v8 + ~(v8 << 13)) >> 8));
        unint64_t v10 = (v9 ^ (v9 >> 15)) + ~((v9 ^ (v9 >> 15)) << 27);
        unsigned int v11 = v7 & ((v10 >> 31) ^ v10);
        for (int i = 1; ; ++i)
        {
          uint64_t v13 = v11;
          uint64_t v14 = *(void *)(qword_1EB3597D0 + 16 * v11);
          if (v14 != -1)
          {
            if (!v14) {
              goto LABEL_24;
            }
            uint64_t v15 = *(void *)(v14 + 8);
            uint64_t v16 = v15 ? v15 - 16 : 0;
            if ((WebPageProxy *)v16 == m_ptr) {
              break;
            }
          }
          unsigned int v11 = (v13 + i) & v7;
        }
        if (v13 != *(_DWORD *)(qword_1EB3597D0 - 4))
        {
          v17 = (void *)(qword_1EB3597D0 + 16 * v13);
          void *v17 = 0;
          if (atomic_fetch_add((atomic_uint *volatile)v14, 0xFFFFFFFF) == 1)
          {
            atomic_store(1u, (unsigned int *)v14);
            v24 = v17;
            WTF::fastFree((WTF *)v14, v4);
            v17 = v24;
            v5 = &qword_1EB359000;
          }
          void *v17 = -1;
          uint64_t v18 = v5[250];
          ++*(_DWORD *)(v18 - 16);
          if (v18) {
            int v19 = *(_DWORD *)(v18 - 12) - 1;
          }
          else {
            int v19 = -1;
          }
          *(_DWORD *)(v18 - 12) = v19;
          uint64_t v20 = v5[250];
          if (v20)
          {
            unsigned int v21 = 6 * *(_DWORD *)(v20 - 12);
            unsigned int v22 = *(_DWORD *)(v20 - 4);
            if (v21 < v22 && v22 >= 9) {
              WTF::HashTable<WTF::WeakRef<WebKit::WebPageProxy,WTF::DefaultWeakPtrImpl>,WTF::KeyValuePair<WTF::WeakRef<WebKit::WebPageProxy,WTF::DefaultWeakPtrImpl>,WKBrowsingContextController *>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WTF::WeakRef<WebKit::WebPageProxy,WTF::DefaultWeakPtrImpl>,WKBrowsingContextController *>>,WTF::DefaultHash<WTF::WeakRef<WebKit::WebPageProxy,WTF::DefaultWeakPtrImpl>>,WTF::HashMap<WTF::WeakRef<WebKit::WebPageProxy,WTF::DefaultWeakPtrImpl>,WKBrowsingContextController *,WTF::DefaultHash<WTF::WeakRef<WebKit::WebPageProxy,WTF::DefaultWeakPtrImpl>>,WTF::HashTraits<WTF::WeakRef<WebKit::WebPageProxy,WTF::DefaultWeakPtrImpl>>,WTF::HashTraits<WKBrowsingContextController *>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WTF::WeakRef<WebKit::WebPageProxy,WTF::DefaultWeakPtrImpl>>>::rehash(v22 >> 1);
            }
          }
        }
      }
    }
    else
    {
      qword_1EB3597D0 = 0;
      byte_1EB3597C1 = 1;
    }
LABEL_24:
    WTF::WeakHashSet<WebKit::FrameLoadStateObserver,WTF::DefaultWeakPtrImpl,(WTF::EnableWeakPtrThreadingAssertions)1>::remove<WebKit::FrameLoadStateObserver>(*((void *)self->_page.m_ptr + 4) + 976, self->_pageLoadStateObserver.__ptr_.__value_);
    v25.receiver = self;
    v25.super_class = (Class)WKBrowsingContextController;
    [(WKBrowsingContextController *)&v25 dealloc];
  }
}

+ (void)unregisterSchemeForCustomProtocol:(id)a3
{
  v4 = (WTF::WorkQueue *)[MEMORY[0x1E4F29060] isMainThread];
  if (v4)
  {
    MEMORY[0x19972EAD0](&v11, a3);
    WebKit::WebProcessPool::unregisterGlobalURLSchemeAsHavingCustomProtocolHandlers((WebKit *)&v11, v5);
    int v7 = v11;
    unsigned int v11 = 0;
    if (v7)
    {
      if (*(_DWORD *)v7 == 2) {
        WTF::StringImpl::destroy(v7, v6);
      }
      else {
        *(_DWORD *)v7 -= 2;
      }
    }
  }
  else
  {
    uint64_t v8 = WTF::WorkQueue::main(v4);
    if (a3) {
      CFRetain(a3);
    }
    unint64_t v9 = (WTF::StringImpl *)WTF::fastMalloc((WTF *)0x10);
    *(void *)unint64_t v9 = &unk_1EE9C2B60;
    *((void *)v9 + 1) = a3;
    unsigned int v11 = v9;
    (*(void (**)(uint64_t, WTF::StringImpl **))(*(void *)v8 + 32))(v8, &v11);
    unint64_t v10 = v11;
    unsigned int v11 = 0;
    if (v10) {
      (*(void (**)(WTF::StringImpl *))(*(void *)v10 + 8))(v10);
    }
  }
}

- (void)loadRequest:(id)a3
{
}

- (void)loadRequest:(id)a3 userData:(id)a4
{
  m_ptr = self->_page.m_ptr;
  MEMORY[0x199732A50](v6, a3);
  WebKit::WebPageProxy::loadRequest((uint64_t)m_ptr, (WebCore::ResourceRequestBase *)v6, 0, 0, 0, &v8);
  if (v8) {
    CFRelease(*(CFTypeRef *)(v8 + 8));
  }
  CFTypeRef v5 = cf;
  CFTypeRef cf = 0;
  if (v5) {
    CFRelease(v5);
  }
  WebCore::ResourceRequestBase::~ResourceRequestBase((WebCore::ResourceRequestBase *)v6);
}

- (void)loadFileURL:(id)a3 restrictToFilesWithin:(id)a4
{
}

- (void)loadFileURL:(id)a3 restrictToFilesWithin:(id)a4 userData:(id)a5
{
  if (![a3 isFileURL] || a4 && (objc_msgSend(a4, "isFileURL") & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Attempted to load a non-file URL"];
  }
  m_ptr = self->_page.m_ptr;
  WTF::bytesAsString((uint64_t *)&v16, (WTF *)a3, v8);
  WTF::bytesAsString((uint64_t *)&v15, (WTF *)a4, v10);
  WebKit::WebPageProxy::loadFile((WebKit::WebPageProxy *)m_ptr, (const WTF::String *)&v16, (const WTF::String *)&v15, 0, 0);
  uint64_t v12 = v17;
  uint64_t v17 = 0;
  if (v12) {
    CFRelease(*(CFTypeRef *)(v12 + 8));
  }
  uint64_t v13 = v15;
  uint64_t v15 = 0;
  if (v13)
  {
    if (*(_DWORD *)v13 == 2) {
      WTF::StringImpl::destroy(v13, v11);
    }
    else {
      *(_DWORD *)v13 -= 2;
    }
  }
  uint64_t v14 = v16;
  uint64_t v16 = 0;
  if (v14)
  {
    if (*(_DWORD *)v14 == 2) {
      WTF::StringImpl::destroy(v14, v11);
    }
    else {
      *(_DWORD *)v14 -= 2;
    }
  }
}

- (void)loadHTMLString:(id)a3 baseURL:(id)a4
{
}

- (void)loadHTMLString:(id)a3 baseURL:(id)a4 userData:(id)a5
{
  int v19 = (WebCore::FragmentedSharedBuffer *)objc_msgSend(a3, "dataUsingEncoding:", 4, a4, a5);
  m_ptr = self->_page.m_ptr;
  WebCore::SharedBuffer::create<NSData *&>(&v19, v8, (uint64_t *)&v17);
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v16 = v20;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v15 = v20;
  WTF::bytesAsString((uint64_t *)&v20, (WTF *)a4, v9);
  WebKit::WebPageProxy::loadData((uint64_t)m_ptr, &v17, &v16, &v15, &v20, 0, 0, &v18);
  if (v18) {
    CFRelease(*(CFTypeRef *)(v18 + 8));
  }
  unsigned int v11 = v20;
  uint64_t v20 = 0;
  if (v11)
  {
    if (*(_DWORD *)v11 == 2) {
      WTF::StringImpl::destroy(v11, v10);
    }
    else {
      *(_DWORD *)v11 -= 2;
    }
  }
  uint64_t v12 = v15;
  uint64_t v15 = 0;
  if (v12)
  {
    if (*(_DWORD *)v12 == 2) {
      WTF::StringImpl::destroy(v12, v10);
    }
    else {
      *(_DWORD *)v12 -= 2;
    }
  }
  uint64_t v13 = v16;
  uint64_t v16 = 0;
  if (v13)
  {
    if (*(_DWORD *)v13 == 2) {
      WTF::StringImpl::destroy(v13, v10);
    }
    else {
      *(_DWORD *)v13 -= 2;
    }
  }
  uint64_t v14 = (unsigned int *)v17;
  uint64_t v17 = 0;
  if (v14) {
    WTF::ThreadSafeRefCounted<WebCore::FragmentedSharedBuffer,(WTF::DestructionThread)0>::deref(v14, v10);
  }
}

- (void)loadAlternateHTMLString:(id)a3 baseURL:(id)a4 forUnreachableURL:(id)a5
{
  CFURLRef v8 = (const void *)[a3 dataUsingEncoding:4];
  m_ptr = self->_page.m_ptr;
  int v19 = v8;
  if (v8) {
    CFRetain(v8);
  }
  WebCore::DataSegment::create();
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v18 = v17[0];
  MEMORY[0x19972E8A0](v17, a4);
  MEMORY[0x19972E8A0](v16, a5);
  WebKit::WebPageProxy::loadAlternateHTML((uint64_t)m_ptr, &v20, &v18, (uint64_t)v17, (uint64_t)v16, 0);
  unsigned int v11 = v16[0];
  v16[0] = 0;
  if (v11)
  {
    if (*(_DWORD *)v11 == 2) {
      WTF::StringImpl::destroy(v11, v10);
    }
    else {
      *(_DWORD *)v11 -= 2;
    }
  }
  uint64_t v12 = v17[0];
  v17[0] = 0;
  if (v12)
  {
    if (*(_DWORD *)v12 == 2) {
      WTF::StringImpl::destroy(v12, v10);
    }
    else {
      *(_DWORD *)v12 -= 2;
    }
  }
  uint64_t v13 = v18;
  uint64_t v18 = 0;
  if (v13)
  {
    if (*(_DWORD *)v13 == 2) {
      WTF::StringImpl::destroy(v13, v10);
    }
    else {
      *(_DWORD *)v13 -= 2;
    }
  }
  uint64_t v14 = (unsigned int *)v20;
  uint64_t v20 = 0;
  if (v14) {
    WTF::ThreadSafeRefCounted<WebCore::DataSegment,(WTF::DestructionThread)0>::deref(v14, v10);
  }
  uint64_t v15 = v19;
  int v19 = 0;
  if (v15) {
    CFRelease(v15);
  }
}

- (void)loadData:(id)a3 MIMEType:(id)a4 textEncodingName:(id)a5 baseURL:(id)a6
{
}

- (void)loadData:(id)a3 MIMEType:(id)a4 textEncodingName:(id)a5 baseURL:(id)a6 userData:(id)a7
{
  unsigned int v22 = (WebCore::FragmentedSharedBuffer *)a3;
  m_ptr = self->_page.m_ptr;
  WebCore::SharedBuffer::create<NSData *&>(&v22, (NSData *)a2, (uint64_t *)&v20);
  MEMORY[0x19972EAD0](&v19, a4);
  MEMORY[0x19972EAD0](&v18, a5);
  WTF::bytesAsString((uint64_t *)&v17, (WTF *)a6, v11);
  WebKit::WebPageProxy::loadData((uint64_t)m_ptr, &v20, &v19, &v18, &v17, 0, 0, &v21);
  if (v21) {
    CFRelease(*(CFTypeRef *)(v21 + 8));
  }
  uint64_t v13 = v17;
  uint64_t v17 = 0;
  if (v13)
  {
    if (*(_DWORD *)v13 == 2) {
      WTF::StringImpl::destroy(v13, v12);
    }
    else {
      *(_DWORD *)v13 -= 2;
    }
  }
  uint64_t v14 = v18;
  uint64_t v18 = 0;
  if (v14)
  {
    if (*(_DWORD *)v14 == 2) {
      WTF::StringImpl::destroy(v14, v12);
    }
    else {
      *(_DWORD *)v14 -= 2;
    }
  }
  uint64_t v15 = v19;
  int v19 = 0;
  if (v15)
  {
    if (*(_DWORD *)v15 == 2) {
      WTF::StringImpl::destroy(v15, v12);
    }
    else {
      *(_DWORD *)v15 -= 2;
    }
  }
  uint64_t v16 = (unsigned int *)v20;
  uint64_t v20 = 0;
  if (v16) {
    WTF::ThreadSafeRefCounted<WebCore::FragmentedSharedBuffer,(WTF::DestructionThread)0>::deref(v16, v12);
  }
}

- (void)stopLoading
{
}

- (void)reload
{
  WebKit::WebPageProxy::reload((uint64_t)self->_page.m_ptr, 0, &v3);
  uint64_t v2 = v3;
  uint64_t v3 = 0;
  if (v2) {
    CFRelease(*(CFTypeRef *)(v2 + 8));
  }
}

- (void)reloadFromOrigin
{
  WebKit::WebPageProxy::reload((uint64_t)self->_page.m_ptr, 2, &v3);
  uint64_t v2 = v3;
  uint64_t v3 = 0;
  if (v2) {
    CFRelease(*(CFTypeRef *)(v2 + 8));
  }
}

- (NSString)applicationNameForUserAgent
{
  result = (NSString *)*((void *)self->_page.m_ptr + 45);
  if (result) {
    return (NSString *)WTF::StringImpl::operator NSString *();
  }
  return result;
}

- (void)setApplicationNameForUserAgent:(id)a3
{
  m_ptr = self->_page.m_ptr;
  MEMORY[0x19972EAD0](&v12, a3);
  WTF::String::operator=((uint64_t *)m_ptr + 46, &v12);
  int v7 = v12;
  uint64_t v12 = 0;
  if (v7)
  {
    if (*(_DWORD *)v7 == 2) {
      WTF::StringImpl::destroy(v7, v6);
    }
    else {
      *(_DWORD *)v7 -= 2;
    }
  }
  CFURLRef v8 = (WTF **)self->_page.m_ptr;
  MEMORY[0x19972EAD0](&v12, a3);
  WebKit::WebPageProxy::setApplicationNameForUserAgent(v8, &v12, v9);
  CFURLRef v11 = v12;
  uint64_t v12 = 0;
  if (v11)
  {
    if (*(_DWORD *)v11 == 2) {
      WTF::StringImpl::destroy(v11, v10);
    }
    else {
      *(_DWORD *)v11 -= 2;
    }
  }
}

- (NSString)customUserAgent
{
  result = (NSString *)*((void *)self->_page.m_ptr + 47);
  if (result) {
    return (NSString *)WTF::StringImpl::operator NSString *();
  }
  return result;
}

- (void)setCustomUserAgent:(id)a3
{
  m_ptr = (WTF **)self->_page.m_ptr;
  MEMORY[0x19972EAD0](&v7, a3);
  WebKit::WebPageProxy::setCustomUserAgent(m_ptr, &v7, v4);
  v6 = v7;
  int v7 = 0;
  if (v6)
  {
    if (*(_DWORD *)v6 == 2) {
      WTF::StringImpl::destroy(v6, v5);
    }
    else {
      *(_DWORD *)v6 -= 2;
    }
  }
}

- (void)goForward
{
  WebKit::WebPageProxy::goForward((WebKit::WebPageProxy *)self->_page.m_ptr, &v3);
  uint64_t v2 = v3;
  uint64_t v3 = 0;
  if (v2) {
    CFRelease(*(CFTypeRef *)(v2 + 8));
  }
}

- (BOOL)canGoForward
{
  return WebKit::WebBackForwardList::forwardItem(*((void *)self->_page.m_ptr + 83)) != 0;
}

- (void)goBack
{
  WebKit::WebPageProxy::goBack((WebKit::WebPageProxy *)self->_page.m_ptr, &v3);
  uint64_t v2 = v3;
  uint64_t v3 = 0;
  if (v2) {
    CFRelease(*(CFTypeRef *)(v2 + 8));
  }
}

- (BOOL)canGoBack
{
  return WebKit::WebBackForwardList::backItem(*((void *)self->_page.m_ptr + 83)) != 0;
}

- (void)goToBackForwardListItem:(id)a3
{
  WebKit::WebPageProxy::goToBackForwardItem((uint64_t)self->_page.m_ptr, [a3 _item], 3u, &v4);
  if (v4)
  {
    uint64_t v3 = *(const void **)(v4 + 8);
    CFRelease(v3);
  }
}

- (WKBackForwardList)backForwardList
{
  return *(WKBackForwardList **)(*((void *)self->_page.m_ptr + 83) + 8);
}

- (BOOL)isLoading
{
  uint64_t v2 = *((void *)self->_page.m_ptr + 4);
  if (*(void *)(v2 + 1016))
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    unsigned int v4 = *(unsigned __int8 *)(v2 + 1000);
    if (v4 > 2) {
      LOBYTE(v3) = 0;
    }
    else {
      return (3u >> (v4 & 7)) & 1;
    }
  }
  return v3;
}

- (NSURL)activeURL
{
  uint64_t v2 = (void *)MEMORY[0x1E4F1CB10];
  WebKit::PageLoadState::activeURL((unsigned __int8 *)(*((void *)self->_page.m_ptr + 4) + 1000), &v7);
  unsigned int v4 = (NSURL *)objc_msgSend(v2, "_web_URLWithWTFString:", &v7);
  CFTypeRef v5 = v7;
  int v7 = 0;
  if (v5)
  {
    if (*(_DWORD *)v5 == 2) {
      WTF::StringImpl::destroy(v5, v3);
    }
    else {
      *(_DWORD *)v5 -= 2;
    }
  }
  return v4;
}

- (NSURL)provisionalURL
{
  return (NSURL *)objc_msgSend(MEMORY[0x1E4F1CB10], "_web_URLWithWTFString:", *((void *)self->_page.m_ptr + 4) + 1024);
}

- (NSURL)committedURL
{
  return (NSURL *)objc_msgSend(MEMORY[0x1E4F1CB10], "_web_URLWithWTFString:", *((void *)self->_page.m_ptr + 4) + 1032);
}

- (NSURL)unreachableURL
{
  return (NSURL *)objc_msgSend(MEMORY[0x1E4F1CB10], "_web_URLWithWTFString:", *((void *)self->_page.m_ptr + 4) + 1072);
}

- (BOOL)hasOnlySecureContent
{
  return WebKit::PageLoadState::hasOnlySecureContent((WebKit::PageLoadState *)(*((void *)self->_page.m_ptr + 4) + 1000), (const Data *)a2);
}

- (double)estimatedProgress
{
  uint64_t v2 = *((void *)self->_page.m_ptr + 4);
  double result = *(double *)(v2 + 1144);
  if (*(void *)(v2 + 1016)) {
    return 0.1;
  }
  return result;
}

- (NSString)title
{
  uint64_t v2 = *((void *)self->_page.m_ptr + 4);
  uint64_t v3 = 1088;
  if (!*(void *)(v2 + 1088)) {
    uint64_t v3 = 1080;
  }
  if (*(void *)(v2 + v3)) {
    return (NSString *)WTF::StringImpl::operator NSString *();
  }
  else {
    return (NSString *)&stru_1EEA10550;
  }
}

- (NSArray)certificateChain
{
  uint64_t v2 = *((void *)self->_page.m_ptr + 41);
  if (!v2) {
    return 0;
  }
  WebCore::CertificateInfo::certificateChainFromSecTrust((uint64_t *)&arg, *(WebCore::CertificateInfo **)(v2 + 256), (__SecTrust *)a2);
  double result = (NSArray *)arg;
  if (arg)
  {
    CFAutorelease(arg);
    return (NSArray *)arg;
  }
  return result;
}

- (double)textZoom
{
  return *((double *)self->_page.m_ptr + 87);
}

- (void)setTextZoom:(double)a3
{
}

- (double)pageZoom
{
  m_ptr = self->_page.m_ptr;
  uint64_t v3 = 720;
  if (!*((unsigned char *)m_ptr + 929)) {
    uint64_t v3 = 704;
  }
  return *(double *)((char *)m_ptr + v3);
}

- (void)setPageZoom:(double)a3
{
}

- (WKBrowsingContextLoadDelegate)loadDelegate
{
  return (WKBrowsingContextLoadDelegate *)objc_loadWeak(&self->_loadDelegate.m_weakReference);
}

- (void)setLoadDelegate:(id)a3
{
  objc_storeWeak(&self->_loadDelegate.m_weakReference, a3);
  m_ptr = self->_page.m_ptr;
  if (a3)
  {
    uint64_t v10 = 0;
    uint64_t v17 = 0;
    uint64_t v25 = 0;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v19 = 0;
    long long v18 = 0u;
    v8[0] = 0;
    long long v9 = 0u;
    v8[1] = self;
    CFURLRef v11 = didStartProvisionalNavigation;
    uint64_t v12 = didReceiveServerRedirectForProvisionalNavigation;
    uint64_t v13 = didFailProvisionalNavigation;
    uint64_t v14 = didCommitNavigation;
    uint64_t v15 = didFinishNavigation;
    uint64_t v16 = didFailNavigation;
    uint64_t v20 = canAuthenticateAgainstProtectionSpace;
    uint64_t v21 = didReceiveAuthenticationChallenge;
    unsigned int v22 = processDidCrash;
    if (m_ptr) {
      v6 = (void *)*((void *)m_ptr + 1);
    }
    else {
      v6 = 0;
    }
    WKPageSetPageNavigationClient(v6, (unsigned int *)v8);
  }
  else
  {
    if (m_ptr) {
      int v7 = (void *)*((void *)m_ptr + 1);
    }
    else {
      int v7 = 0;
    }
    WKPageSetPageNavigationClient(v7, 0);
  }
}

- (WKBrowsingContextPolicyDelegate)policyDelegate
{
  return (WKBrowsingContextPolicyDelegate *)objc_loadWeak(&self->_policyDelegate.m_weakReference);
}

- (void)setPolicyDelegate:(id)a3
{
  objc_storeWeak(&self->_policyDelegate.m_weakReference, a3);
  m_ptr = self->_page.m_ptr;
  if (a3)
  {
    void v8[2] = 0;
    long long v9 = 0u;
    v8[0] = 2;
    v8[1] = self;
    uint64_t v12 = setUpPagePolicyClient(WKBrowsingContextController *,WebKit::WebPageProxy &)::$_0::__invoke;
    v8[3] = setUpPagePolicyClient(WKBrowsingContextController *,WebKit::WebPageProxy &)::$_1::__invoke;
    uint64_t v10 = 0;
    CFURLRef v11 = setUpPagePolicyClient(WKBrowsingContextController *,WebKit::WebPageProxy &)::$_2::__invoke;
    if (m_ptr) {
      v6 = (void *)*((void *)m_ptr + 1);
    }
    else {
      v6 = 0;
    }
    WKPageSetPagePolicyClient(v6, (unsigned int *)v8);
  }
  else
  {
    if (m_ptr) {
      int v7 = (void *)*((void *)m_ptr + 1);
    }
    else {
      int v7 = 0;
    }
    WKPageSetPagePolicyClient(v7, 0);
  }
}

- (WKBrowsingContextHistoryDelegate)historyDelegate
{
  return (WKBrowsingContextHistoryDelegate *)objc_loadWeak(&self->_historyDelegate.m_weakReference);
}

- (void)setHistoryDelegate:(id)a3
{
}

+ (id)customSchemes
{
  if (_MergedGlobals_67 == 1) {
    return (id)qword_1EB3597C8;
  }
  id result = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  qword_1EB3597C8 = (uint64_t)result;
  _MergedGlobals_67 = 1;
  return result;
}

- (id)_initWithPageRef:(OpaqueWKPage *)a3
{
  v31.receiver = self;
  v31.super_class = (Class)WKBrowsingContextController;
  unsigned int v4 = [(WKBrowsingContextController *)&v31 init];
  if (!v4) {
    return v4;
  }
  if (a3)
  {
    a3 = (OpaqueWKPage *)[(OpaqueWKPage *)a3 _apiObject];
    CFRetain(*((CFTypeRef *)a3 + 1));
  }
  m_ptr = v4->_page.m_ptr;
  v4->_page.m_ptr = (WebPageProxy *)a3;
  if (m_ptr) {
    CFRelease(*((CFTypeRef *)m_ptr + 1));
  }
  v6 = (WebKit::PageLoadStateObserver *)WTF::fastMalloc((WTF *)0x20);
  WebKit::PageLoadStateObserver::PageLoadStateObserver(v6, (objc_object *)v4, &cfstr_Activeurl.isa);
  value = v4->_pageLoadStateObserver.__ptr_.__value_;
  v4->_pageLoadStateObserver.__ptr_.__value_ = (PageLoadStateObserver *)v6;
  if (value)
  {
    (*(void (**)(PageLoadStateObserver *))(*(void *)value + 8))(value);
    v6 = (WebKit::PageLoadStateObserver *)v4->_pageLoadStateObserver.__ptr_.__value_;
  }
  WTF::WeakHashSet<WebKit::FrameLoadStateObserver,WTF::DefaultWeakPtrImpl,(WTF::EnableWeakPtrThreadingAssertions)1>::add<WebKit::FrameLoadStateObserver>(*((void *)v4->_page.m_ptr + 4) + 976, (unsigned int *)v6, (uint64_t)v32);
  if ((byte_1EB3597C1 & 1) == 0)
  {
    qword_1EB3597D0 = 0;
    byte_1EB3597C1 = 1;
  }
  CFURLRef v8 = v4->_page.m_ptr;
  WTF::WeakPtrFactory<IPC::MessageReceiver,WTF::DefaultWeakPtrImpl>::initializeIfNeeded((unsigned int *)v8 + 6, (uint64_t)v8 + 16);
  uint64_t v10 = *((void *)v8 + 3);
  atomic_fetch_add((atomic_uint *volatile)v10, 1u);
  uint64_t v11 = qword_1EB3597D0;
  if (qword_1EB3597D0
    || (WTF::HashTable<WTF::WeakRef<WebKit::WebPageProxy,WTF::DefaultWeakPtrImpl>,WTF::KeyValuePair<WTF::WeakRef<WebKit::WebPageProxy,WTF::DefaultWeakPtrImpl>,WKBrowsingContextController *>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WTF::WeakRef<WebKit::WebPageProxy,WTF::DefaultWeakPtrImpl>,WKBrowsingContextController *>>,WTF::DefaultHash<WTF::WeakRef<WebKit::WebPageProxy,WTF::DefaultWeakPtrImpl>>,WTF::HashMap<WTF::WeakRef<WebKit::WebPageProxy,WTF::DefaultWeakPtrImpl>,WKBrowsingContextController *,WTF::DefaultHash<WTF::WeakRef<WebKit::WebPageProxy,WTF::DefaultWeakPtrImpl>>,WTF::HashTraits<WTF::WeakRef<WebKit::WebPageProxy,WTF::DefaultWeakPtrImpl>>,WTF::HashTraits<WKBrowsingContextController *>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WTF::WeakRef<WebKit::WebPageProxy,WTF::DefaultWeakPtrImpl>>>::expand(),
        (uint64_t v11 = qword_1EB3597D0) != 0))
  {
    unsigned int v12 = *(_DWORD *)(v11 - 8);
  }
  else
  {
    unsigned int v12 = 0;
  }
  uint64_t v13 = 0;
  uint64_t v14 = *(void *)(v10 + 8);
  uint64_t v15 = v14 - 16;
  if (!v14) {
    uint64_t v15 = 0;
  }
  unint64_t v16 = (~(v15 << 32) + v15) ^ ((unint64_t)(~(v15 << 32) + v15) >> 22);
  unint64_t v17 = (9 * ((v16 + ~(v16 << 13)) ^ ((v16 + ~(v16 << 13)) >> 8))) ^ ((9
                                                                     * ((v16 + ~(v16 << 13)) ^ ((v16 + ~(v16 << 13)) >> 8))) >> 15);
  int v18 = ((v17 + ~(v17 << 27)) >> 31) ^ (v17 + ~(v17 << 27));
  for (int i = 1; ; ++i)
  {
    uint64_t v20 = v18 & v12;
    uint64_t v21 = (uint64_t *)(v11 + 16 * v20);
    uint64_t v22 = *v21;
    if (*v21 == -1)
    {
      uint64_t v13 = (void *)(v11 + 16 * v20);
      goto LABEL_27;
    }
    if (!v22)
    {
      if (v13)
      {
        *uint64_t v13 = 0;
        v13[1] = 0;
        --*(_DWORD *)(v11 - 16);
        *uint64_t v13 = v10;
      }
      else
      {
        *uint64_t v21 = v10;
        uint64_t v13 = (void *)(v11 + 16 * v20);
      }
      v13[1] = v4;
      if (qword_1EB3597D0) {
        int v26 = *(_DWORD *)(qword_1EB3597D0 - 12) + 1;
      }
      else {
        int v26 = 1;
      }
      *(_DWORD *)(qword_1EB3597D0 - 12) = v26;
      if (qword_1EB3597D0) {
        int v27 = *(_DWORD *)(qword_1EB3597D0 - 12);
      }
      else {
        int v27 = 0;
      }
      uint64_t v28 = (*(_DWORD *)(qword_1EB3597D0 - 16) + v27);
      unint64_t v29 = *(unsigned int *)(qword_1EB3597D0 - 4);
      if (v29 > 0x400)
      {
        if (v29 > 2 * v28) {
          return v4;
        }
      }
      else if (3 * v29 > 4 * v28)
      {
        return v4;
      }
      WTF::HashTable<WTF::WeakRef<WebKit::WebPageProxy,WTF::DefaultWeakPtrImpl>,WTF::KeyValuePair<WTF::WeakRef<WebKit::WebPageProxy,WTF::DefaultWeakPtrImpl>,WKBrowsingContextController *>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WTF::WeakRef<WebKit::WebPageProxy,WTF::DefaultWeakPtrImpl>,WKBrowsingContextController *>>,WTF::DefaultHash<WTF::WeakRef<WebKit::WebPageProxy,WTF::DefaultWeakPtrImpl>>,WTF::HashMap<WTF::WeakRef<WebKit::WebPageProxy,WTF::DefaultWeakPtrImpl>,WKBrowsingContextController *,WTF::DefaultHash<WTF::WeakRef<WebKit::WebPageProxy,WTF::DefaultWeakPtrImpl>>,WTF::HashTraits<WTF::WeakRef<WebKit::WebPageProxy,WTF::DefaultWeakPtrImpl>>,WTF::HashTraits<WKBrowsingContextController *>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WTF::WeakRef<WebKit::WebPageProxy,WTF::DefaultWeakPtrImpl>>>::expand();
      return v4;
    }
    uint64_t v23 = *(void *)(v22 + 8);
    BOOL v24 = v14 == v23 && v14 != 0;
    if (v23 ? v24 : v14 == 0) {
      break;
    }
LABEL_27:
    int v18 = i + v20;
  }
  *(void *)(v11 + 16 * v20 + 8) = v4;
  if (v10 && atomic_fetch_add((atomic_uint *volatile)v10, 0xFFFFFFFF) == 1)
  {
    atomic_store(1u, (unsigned int *)v10);
    WTF::fastFree((WTF *)v10, v9);
  }
  return v4;
}

+ (id)_browsingContextControllerForPageRef:(OpaqueWKPage *)a3
{
  if (byte_1EB3597C1)
  {
    if (a3)
    {
LABEL_3:
      uint64_t v3 = [(OpaqueWKPage *)a3 _apiObject];
      goto LABEL_4;
    }
  }
  else
  {
    qword_1EB3597D0 = 0;
    byte_1EB3597C1 = 1;
    if (a3) {
      goto LABEL_3;
    }
  }
  uint64_t v3 = 0;
LABEL_4:
  if (!qword_1EB3597D0) {
    return 0;
  }
  int v4 = *(_DWORD *)(qword_1EB3597D0 - 8);
  unint64_t v5 = (~(v3 << 32) + v3) ^ ((unint64_t)(~(v3 << 32) + v3) >> 22);
  unint64_t v6 = 9 * ((v5 + ~(v5 << 13)) ^ ((v5 + ~(v5 << 13)) >> 8));
  unint64_t v7 = (v6 ^ (v6 >> 15)) + ~((v6 ^ (v6 >> 15)) << 27);
  unsigned int v8 = v4 & ((v7 >> 31) ^ v7);
  for (int i = 1; ; ++i)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(void *)(qword_1EB3597D0 + 16 * v8);
    if (v11 != -1)
    {
      if (!v11) {
        return 0;
      }
      uint64_t v12 = *(void *)(v11 + 8);
      uint64_t v13 = v12 ? v12 - 16 : 0;
      if (v13 == v3) {
        break;
      }
    }
    unsigned int v8 = (v10 + i) & v4;
  }
  return *(id *)(qword_1EB3597D0 + 16 * v10 + 8);
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_policyDelegate.m_weakReference);
  objc_destroyWeak(&self->_loadDelegate.m_weakReference);
  value = self->_pageLoadStateObserver.__ptr_.__value_;
  self->_pageLoadStateObserver.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(PageLoadStateObserver *))(*(void *)value + 8))(value);
  }
  m_ptr = self->_page.m_ptr;
  self->_page.m_ptr = 0;
  if (m_ptr) {
    CFRelease(*((CFTypeRef *)m_ptr + 1));
  }

  objc_destroyWeak(&self->_historyDelegate.m_weakReference);
}

- (id).cxx_construct
{
  *((void *)self + 5) = 0;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

- (OpaqueWKPage)_pageRef
{
  m_ptr = self->_page.m_ptr;
  if (m_ptr) {
    return (OpaqueWKPage *)*((void *)m_ptr + 1);
  }
  else {
    return 0;
  }
}

- (void)setPaginationMode:(unint64_t)a3
{
  if (a3 <= 4) {
    WebKit::WebPageProxy::setPaginationMode((uint64_t)self->_page.m_ptr, a3);
  }
}

- (unint64_t)paginationMode
{
  if (((*((unsigned char *)self->_page.m_ptr + 781) - 1) & 0xFC) != 0) {
    return 0;
  }
  else {
    return (*((unsigned char *)self->_page.m_ptr + 781) - 1) + 1;
  }
}

- (void)setPaginationBehavesLikeColumns:(BOOL)a3
{
}

- (BOOL)paginationBehavesLikeColumns
{
  return *((unsigned char *)self->_page.m_ptr + 782);
}

- (void)setPageLength:(double)a3
{
}

- (double)pageLength
{
  return *((double *)self->_page.m_ptr + 98);
}

- (void)setGapBetweenPages:(double)a3
{
}

- (double)gapBetweenPages
{
  return *((double *)self->_page.m_ptr + 99);
}

- (BOOL)paginationLineGridEnabled
{
  return 0;
}

- (unint64_t)pageCount
{
  return *((unsigned int *)self->_page.m_ptr + 233);
}

- (WKBrowsingContextHandle)handle
{
  uint64_t v2 = (void *)CFMakeCollectable([[WKBrowsingContextHandle alloc] _initWithPageProxy:self->_page.m_ptr]);

  return (WKBrowsingContextHandle *)v2;
}

- (_WKRemoteObjectRegistry)_remoteObjectRegistry
{
  return 0;
}

- (int)processIdentifier
{
  m_ptr = self->_page.m_ptr;
  if (*((unsigned char *)m_ptr + 801)) {
    return 0;
  }
  uint64_t v4 = *(void *)(*((void *)m_ptr + 32) + 136);
  if (!v4) {
    return 0;
  }
  else {
    return *(_DWORD *)(v4 + 108);
  }
}

- (BOOL)_webProcessIsResponsive
{
  uint64_t v2 = *((void *)self->_page.m_ptr + 32);
  return *(unsigned char *)(v2 + 104) && *(unsigned char *)(v2 + 496) != 0;
}

+ (void)registerSchemeForCustomProtocol:(void *)a1
{
  uint64_t v2 = (const void *)a1[1];
  *a1 = &unk_1EE9C2B38;
  a1[1] = 0;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

+ (uint64_t)registerSchemeForCustomProtocol:(WTF *)this
{
  uint64_t v3 = (const void *)*((void *)this + 1);
  *(void *)this = &unk_1EE9C2B38;
  *((void *)this + 1) = 0;
  if (v3) {
    CFRelease(v3);
  }

  return WTF::fastFree(this, a2);
}

+ (WTF::StringImpl)registerSchemeForCustomProtocol:(uint64_t)a1
{
  MEMORY[0x19972EAD0](&v4, *(void *)(a1 + 8));
  WebKit::WebProcessPool::registerGlobalURLSchemeAsHavingCustomProtocolHandlers((WebKit *)&v4, v1);
  id result = v4;
  uint64_t v4 = 0;
  if (result)
  {
    if (*(_DWORD *)result == 2) {
      return (WTF::StringImpl *)WTF::StringImpl::destroy(result, v2);
    }
    else {
      *(_DWORD *)result -= 2;
    }
  }
  return result;
}

+ (void)unregisterSchemeForCustomProtocol:(void *)a1
{
  uint64_t v2 = (const void *)a1[1];
  *a1 = &unk_1EE9C2B60;
  a1[1] = 0;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

+ (uint64_t)unregisterSchemeForCustomProtocol:(WTF *)this
{
  uint64_t v3 = (const void *)*((void *)this + 1);
  *(void *)this = &unk_1EE9C2B60;
  *((void *)this + 1) = 0;
  if (v3) {
    CFRelease(v3);
  }

  return WTF::fastFree(this, a2);
}

+ (WTF::StringImpl)unregisterSchemeForCustomProtocol:(uint64_t)a1
{
  MEMORY[0x19972EAD0](&v4, *(void *)(a1 + 8));
  WebKit::WebProcessPool::unregisterGlobalURLSchemeAsHavingCustomProtocolHandlers((WebKit *)&v4, v1);
  id result = v4;
  uint64_t v4 = 0;
  if (result)
  {
    if (*(_DWORD *)result == 2) {
      return (WTF::StringImpl *)WTF::StringImpl::destroy(result, v2);
    }
    else {
      *(_DWORD *)result -= 2;
    }
  }
  return result;
}

@end