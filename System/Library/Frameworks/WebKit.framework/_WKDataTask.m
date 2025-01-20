@interface _WKDataTask
- (Object)_apiObject;
- (WKWebView)webView;
- (_WKDataTaskDelegate)delegate;
- (id).cxx_construct;
- (void)cancel;
- (void)dealloc;
- (void)setDelegate:(id)a3;
@end

@implementation _WKDataTask

- (void)cancel
{
  API::DataTask::cancel((API::DataTask *)&self->_dataTask);
  m_ptr = self->_delegate.m_ptr;
  self->_delegate.m_ptr = 0;
  if (m_ptr)
  {
    CFRelease(m_ptr);
  }
}

- (WKWebView)webView
{
  uint64_t v2 = *(void *)&self->_dataTask.data.__lx[24];
  if (!v2) {
    return 0;
  }
  uint64_t v3 = *(void *)(v2 + 8);
  if (!v3) {
    return 0;
  }
  WebKit::WebPageProxy::cocoaView((WebKit::WebPageProxy *)(v3 - 16), &cf);
  v4 = (WKWebView *)cf;
  if (cf) {
    CFRelease(cf);
  }
  return v4;
}

- (_WKDataTaskDelegate)delegate
{
  return (_WKDataTaskDelegate *)self->_delegate.m_ptr;
}

- (void)setDelegate:(id)a3
{
  if (a3) {
    CFRetain(a3);
  }
  m_ptr = self->_delegate.m_ptr;
  self->_delegate.m_ptr = a3;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
  uint64_t v6 = WTF::fastMalloc((WTF *)0x20);
  *(_DWORD *)(v6 + 8) = 1;
  *(void *)uint64_t v6 = &unk_1EE9C9568;
  *(void *)(v6 + 16) = 0;
  objc_initWeak((id *)(v6 + 16), a3);
  *(unsigned char *)(v6 + 24) = *(unsigned char *)(v6 + 24) & 0xFE | objc_opt_respondsToSelector() & 1;
  if (objc_opt_respondsToSelector()) {
    char v7 = 2;
  }
  else {
    char v7 = 0;
  }
  *(unsigned char *)(v6 + 24) = *(unsigned char *)(v6 + 24) & 0xFD | v7;
  if (objc_opt_respondsToSelector()) {
    char v8 = 4;
  }
  else {
    char v8 = 0;
  }
  *(unsigned char *)(v6 + 24) = *(unsigned char *)(v6 + 24) & 0xFB | v8;
  if (objc_opt_respondsToSelector()) {
    char v9 = 8;
  }
  else {
    char v9 = 0;
  }
  *(unsigned char *)(v6 + 24) = *(unsigned char *)(v6 + 24) & 0xF7 | v9;
  if (objc_opt_respondsToSelector()) {
    char v10 = 16;
  }
  else {
    char v10 = 0;
  }
  *(unsigned char *)(v6 + 24) = *(unsigned char *)(v6 + 24) & 0xEF | v10;
  v11 = *(_DWORD **)&self->_anon_38[48];
  *(void *)&self->_anon_38[48] = v6;
  if (v11)
  {
    if (v11[2] == 1)
    {
      v12 = *(void (**)(void))(*(void *)v11 + 8);
      v12();
    }
    else
    {
      --v11[2];
    }
  }
}

- (void)dealloc
{
  uint64_t v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainRunLoop(v3, (objc_object *)self) & 1) == 0)
  {
    (**(void (***)(void))self->_dataTask.data.__lx)();
    v4.receiver = self;
    v4.super_class = (Class)_WKDataTask;
    [(_WKDataTask *)&v4 dealloc];
  }
}

- (Object)_apiObject
{
  return (Object *)&self->_dataTask;
}

- (void).cxx_destruct
{
  m_ptr = self->_delegate.m_ptr;
  self->_delegate.m_ptr = 0;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
}

- (id).cxx_construct
{
  *((void *)self + 15) = 0;
  return self;
}

@end