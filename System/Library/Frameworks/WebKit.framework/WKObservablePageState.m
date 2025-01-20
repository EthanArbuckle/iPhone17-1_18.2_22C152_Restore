@interface WKObservablePageState
- (BOOL)_webProcessIsResponsive;
- (BOOL)hasOnlySecureContent;
- (BOOL)isLoading;
- (NSString)title;
- (NSURL)URL;
- (NSURL)unreachableURL;
- (WKObservablePageState)initWithPage:(void *)a3;
- (__SecTrust)serverTrust;
- (double)estimatedProgress;
- (id).cxx_construct;
- (uint64_t)dealloc;
- (void)dealloc;
@end

@implementation WKObservablePageState

- (WKObservablePageState)initWithPage:(void *)a3
{
  v11.receiver = self;
  v11.super_class = (Class)WKObservablePageState;
  v4 = [(WKObservablePageState *)&v11 init];
  v5 = (objc_object *)v4;
  if (v4)
  {
    v6 = *(WebPageProxy **)a3;
    *(void *)a3 = 0;
    m_ptr = v4->_page.m_ptr;
    v4->_page.m_ptr = v6;
    if (m_ptr) {
      CFRelease(*((CFTypeRef *)m_ptr + 1));
    }
    v8 = (WebKit::PageLoadStateObserver *)WTF::fastMalloc((WTF *)0x20);
    WebKit::PageLoadStateObserver::PageLoadStateObserver(v8, v5, &cfstr_Url_0.isa);
    Class isa = v5[2].isa;
    v5[2].Class isa = v8;
    if (isa)
    {
      (*(void (**)(Class))(*(void *)isa + 8))(isa);
      v8 = v5[2].isa;
    }
    WTF::WeakHashSet<WebKit::FrameLoadStateObserver,WTF::DefaultWeakPtrImpl,(WTF::EnableWeakPtrThreadingAssertions)1>::add<WebKit::FrameLoadStateObserver>(*((void *)v5[1].isa + 4) + 976, (unsigned int *)v8, (uint64_t)v12);
  }
  return (WKObservablePageState *)v5;
}

- (void)dealloc
{
  *a1 = &unk_1EE9C1888;
  uint64_t v2 = a1[2];
  a1[2] = 0;
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  uint64_t v3 = a1[1];
  a1[1] = 0;
  if (v3) {
    CFRelease(*(CFTypeRef *)(v3 + 8));
  }
  return a1;
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

- (NSURL)URL
{
  uint64_t v2 = (void *)MEMORY[0x1E4F1CB10];
  WebKit::PageLoadState::activeURL((unsigned __int8 *)(*((void *)self->_page.m_ptr + 4) + 1000), &v7);
  unsigned int v4 = (NSURL *)objc_msgSend(v2, "_web_URLWithWTFString:", &v7);
  v5 = v7;
  v7 = 0;
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

- (BOOL)hasOnlySecureContent
{
  return WebKit::PageLoadState::hasOnlySecureContent((WebKit::PageLoadState *)(*((void *)self->_page.m_ptr + 4) + 1000), (const Data *)a2);
}

- (BOOL)_webProcessIsResponsive
{
  uint64_t v2 = *((void *)self->_page.m_ptr + 32);
  return *(unsigned char *)(v2 + 104) && *(unsigned char *)(v2 + 496) != 0;
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

- (NSURL)unreachableURL
{
  return (NSURL *)objc_msgSend(MEMORY[0x1E4F1CB10], "_web_URLWithWTFString:", *((void *)self->_page.m_ptr + 4) + 1072);
}

- (__SecTrust)serverTrust
{
  return *(__SecTrust **)(*((void *)self->_page.m_ptr + 4) + 1160);
}

- (void).cxx_destruct
{
  value = self->_observer.__ptr_.__value_;
  self->_observer.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(PageLoadStateObserver *, SEL))(*(void *)value + 8))(value, a2);
  }
  m_ptr = self->_page.m_ptr;
  self->_page.m_ptr = 0;
  if (m_ptr)
  {
    v5 = (const void *)*((void *)m_ptr + 1);
    CFRelease(v5);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

- (uint64_t)dealloc
{
  return WTF::WeakHashSet<WebKit::FrameLoadStateObserver,WTF::DefaultWeakPtrImpl,(WTF::EnableWeakPtrThreadingAssertions)1>::remove<WebKit::FrameLoadStateObserver>(*(void *)(*(void *)(a1 + 8) + 32) + 976, *(void **)(a1 + 16));
}

@end