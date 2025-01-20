@interface _WKDownload
+ (id)downloadWithDownload:(id)a3;
- (BOOL)wasUserInitiated;
- (NSArray)redirectChain;
- (NSData)resumeData;
- (NSURLRequest)request;
- (Object)_apiObject;
- (WKFrameInfo)originatingFrame;
- (WKWebView)originatingWebView;
- (_WKDownload)initWithDownload2:(id)a3;
- (id).cxx_construct;
- (uint64_t)cancel;
- (void)cancel;
- (void)publishProgressAtURL:(id)a3;
@end

@implementation _WKDownload

- (_WKDownload)initWithDownload2:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_WKDownload;
  v4 = [(_WKDownload *)&v7 init];
  if (v4)
  {
    if (a3) {
      CFRetain(a3);
    }
    m_ptr = v4->_download.m_ptr;
    v4->_download.m_ptr = a3;
    if (m_ptr) {
      CFRelease(m_ptr);
    }
  }
  return v4;
}

+ (id)downloadWithDownload:(id)a3
{
  id result = (id)[(id)downloadWrapperMap() objectForKey:a3];
  if (!result)
  {
    v5 = [[_WKDownload alloc] initWithDownload2:a3];
    [(id)downloadWrapperMap() setObject:v5 forKey:a3];
    v6 = (void *)CFMakeCollectable(v5);
    return v6;
  }
  return result;
}

- (void)cancel
{
  uint64_t v2 = a1[1];
  *a1 = &unk_1EE9C9620;
  a1[1] = 0;
  if (v2) {
    CFRelease(*(CFTypeRef *)(v2 + 8));
  }
  return a1;
}

- (void)publishProgressAtURL:(id)a3
{
  v3 = (WebKit::DownloadProxy *)((char *)self->_download.m_ptr + 8);
  MEMORY[0x19972E8A0](v6, a3);
  WebKit::DownloadProxy::publishProgress(v3, (const WTF::URL *)v6);
  v5 = v6[0];
  v6[0] = 0;
  if (v5)
  {
    if (*(_DWORD *)v5 == 2) {
      WTF::StringImpl::destroy(v5, v4);
    }
    else {
      *(_DWORD *)v5 -= 2;
    }
  }
}

- (NSURLRequest)request
{
  return (NSURLRequest *)WebCore::ResourceRequest::nsURLRequest();
}

- (WKWebView)originatingWebView
{
  uint64_t v2 = *((void *)self->_download.m_ptr + 37);
  if (!v2) {
    return 0;
  }
  uint64_t v3 = *(void *)(v2 + 8);
  if (!v3) {
    return 0;
  }
  WebKit::WebPageProxy::cocoaView((WebKit::WebPageProxy *)(v3 - 16), &cf);
  v4 = (void *)CFMakeCollectable(cf);

  return (WKWebView *)v4;
}

- (NSArray)redirectChain
{
  m_ptr = self->_download.m_ptr;
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:*((unsigned int *)m_ptr + 79)];
  uint64_t v4 = *((unsigned int *)m_ptr + 79);
  if (v4)
  {
    uint64_t v5 = m_ptr[38];
    uint64_t v6 = 40 * v4;
    do
    {
      uint64_t v7 = WTF::URL::operator NSURL *();
      if (v7) {
        [v3 addObject:v7];
      }
      v5 += 40;
      v6 -= 40;
    }
    while (v6);
  }
  v8 = (void *)CFMakeCollectable(v3);

  return (NSArray *)v8;
}

- (BOOL)wasUserInitiated
{
  return *((unsigned char *)self->_download.m_ptr + 320);
}

- (NSData)resumeData
{
  uint64_t v2 = *((void *)self->_download.m_ptr + 9);
  if (v2) {
    return *(NSData **)(v2 + 8);
  }
  else {
    return 0;
  }
}

- (WKFrameInfo)originatingFrame
{
  uint64_t v2 = *((void *)self->_download.m_ptr + 41);
  if (v2) {
    return *(WKFrameInfo **)(v2 + 8);
  }
  else {
    return 0;
  }
}

- (Object)_apiObject
{
  return (Object *)((char *)self->_download.m_ptr + 8);
}

- (void).cxx_destruct
{
  m_ptr = self->_download.m_ptr;
  self->_download.m_ptr = 0;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

- (uint64_t)cancel
{
  return (*(uint64_t (**)(void))(**(void **)(*(void *)(a1 + 8) + 48) + 96))();
}

@end