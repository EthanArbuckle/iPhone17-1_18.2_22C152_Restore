@interface WKScriptMessage
- (NSString)name;
- (WKContentWorld)world;
- (WKFrameInfo)frameInfo;
- (WKWebView)webView;
- (id).cxx_construct;
- (id)_initWithBody:(id)a3 webView:(id)a4 frameInfo:(id)a5 name:(id)a6 world:(id)a7;
- (id)body;
@end

@implementation WKScriptMessage

- (id)_initWithBody:(id)a3 webView:(id)a4 frameInfo:(id)a5 name:(id)a6 world:(id)a7
{
  v20.receiver = self;
  v20.super_class = (Class)WKScriptMessage;
  v12 = [(WKScriptMessage *)&v20 init];
  if (v12)
  {
    uint64_t v13 = [a3 copy];
    m_ptr = v12->_body.m_ptr;
    v12->_body.m_ptr = (void *)v13;
    if (m_ptr) {
      CFRelease(m_ptr);
    }
    objc_storeWeak(&v12->_webView.m_weakReference, a4);
    if (a5) {
      CFRetain(a5);
    }
    v15 = v12->_frameInfo.m_ptr;
    v12->_frameInfo.m_ptr = a5;
    if (v15) {
      CFRelease(v15);
    }
    uint64_t v16 = [a6 copy];
    v17 = v12->_name.m_ptr;
    v12->_name.m_ptr = (void *)v16;
    if (v17) {
      CFRelease(v17);
    }
    if (a7) {
      CFRetain(a7);
    }
    v18 = v12->_world.m_ptr;
    v12->_world.m_ptr = a7;
    if (v18) {
      CFRelease(v18);
    }
  }
  return v12;
}

- (id)body
{
  return self->_body.m_ptr;
}

- (WKWebView)webView
{
  return (WKWebView *)objc_loadWeak(&self->_webView.m_weakReference);
}

- (WKFrameInfo)frameInfo
{
  return (WKFrameInfo *)self->_frameInfo.m_ptr;
}

- (NSString)name
{
  return (NSString *)self->_name.m_ptr;
}

- (WKContentWorld)world
{
  return (WKContentWorld *)self->_world.m_ptr;
}

- (void).cxx_destruct
{
  m_ptr = self->_world.m_ptr;
  self->_world.m_ptr = 0;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
  v4 = self->_name.m_ptr;
  self->_name.m_ptr = 0;
  if (v4) {
    CFRelease(v4);
  }
  v5 = self->_frameInfo.m_ptr;
  self->_frameInfo.m_ptr = 0;
  if (v5) {
    CFRelease(v5);
  }
  objc_destroyWeak(&self->_webView.m_weakReference);
  v6 = self->_body.m_ptr;
  self->_body.m_ptr = 0;
  if (v6)
  {
    CFRelease(v6);
  }
}

- (id).cxx_construct
{
  *((void *)self + 5) = 0;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

@end