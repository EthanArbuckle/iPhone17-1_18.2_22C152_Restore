@interface WKFrameInfo
+ (BOOL)accessInstanceVariablesDirectly;
- (BOOL)_errorOccurred;
- (BOOL)_isFocused;
- (BOOL)_isLocalFrame;
- (BOOL)isMainFrame;
- (NSString)_title;
- (NSString)description;
- (NSURLRequest)request;
- (Object)_apiObject;
- (WKSecurityOrigin)securityOrigin;
- (WKWebView)webView;
- (_WKFrameHandle)_handle;
- (_WKFrameHandle)_parentFrameHandle;
- (int)_processIdentifier;
- (void)dealloc;
@end

@implementation WKFrameInfo

+ (BOOL)accessInstanceVariablesDirectly
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  char v3 = WTF::linkedOnOrAfterSDKWithBehavior();
  if ((v3 & 1) == 0 && (+[WKFrameInfo accessInstanceVariablesDirectly]::didLogFault & 1) == 0)
  {
    +[WKFrameInfo accessInstanceVariablesDirectly]::didLogFault = 1;
    v4 = qword_1EB357B50;
    if (os_log_type_enabled((os_log_t)qword_1EB357B50, OS_LOG_TYPE_FAULT))
    {
      int v6 = 136446210;
      Name = class_getName((Class)a1);
      _os_log_fault_impl(&dword_1985F2000, v4, OS_LOG_TYPE_FAULT, "Do not access private instance variables of %{public}s via key-value coding. This will raise an exception when linking against newer SDKs.", (uint8_t *)&v6, 0xCu);
    }
  }
  return v3 ^ 1;
}

- (void)dealloc
{
  char v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainRunLoop(v3, (objc_object *)self) & 1) == 0)
  {
    API::FrameInfo::~FrameInfo((API::FrameInfo *)&self->_frameInfo, v4);
    v5.receiver = self;
    v5.super_class = (Class)WKFrameInfo;
    [(WKFrameInfo *)&v5 dealloc];
  }
}

- (NSString)description
{
  char v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  objc_super v5 = NSStringFromClass(v4);
  int v6 = [(WKFrameInfo *)self webView];
  if ([(WKFrameInfo *)self isMainFrame]) {
    v7 = "YES";
  }
  else {
    v7 = "NO";
  }
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; webView = %p; isMainFrame = %s; request = %@>",
                       v5,
                       self,
                       v6,
                       v7,
                       [(WKFrameInfo *)self request]);
}

- (BOOL)isMainFrame
{
  return self->_frameInfo.data.__lx[16];
}

- (NSURLRequest)request
{
  return (NSURLRequest *)WebCore::ResourceRequest::nsURLRequest();
}

- (WKSecurityOrigin)securityOrigin
{
  API::SecurityOrigin::create(&v6);
  v2 = *(const void **)(v6 + 8);
  if (v2) {
    CFRetain(*(CFTypeRef *)(v6 + 8));
  }
  char v3 = (id)CFMakeCollectable(v2);
  uint64_t v4 = v6;
  uint64_t v6 = 0;
  if (v4) {
    CFRelease(*(CFTypeRef *)(v4 + 8));
  }
  return v3;
}

- (WKWebView)webView
{
  result = *(WKWebView **)&self[5]._frameInfo.data.__lx[32];
  if (result)
  {
    WebKit::WebPageProxy::cocoaView((WebKit::WebPageProxy *)result, &cf);
    char v3 = (void *)CFMakeCollectable(cf);
    return (WKWebView *)v3;
  }
  return result;
}

- (Object)_apiObject
{
  return (Object *)&self->_frameInfo;
}

- (_WKFrameHandle)_handle
{
  API::FrameInfo::handle((API::FrameInfo *)&self->_frameInfo, &v6);
  uint64_t v2 = v6;
  char v3 = *(const void **)(v6 + 8);
  if (v3) {
    CFRetain(*(CFTypeRef *)(v6 + 8));
  }
  uint64_t v4 = (id)CFMakeCollectable(v3);
  CFRelease(*(CFTypeRef *)(v2 + 8));
  return v4;
}

- (_WKFrameHandle)_parentFrameHandle
{
  API::FrameInfo::parentFrameHandle((API::FrameInfo *)&self->_frameInfo, &v7);
  uint64_t v2 = v7;
  if (v7)
  {
    char v3 = *(const void **)(v7 + 8);
    if (v3)
    {
      CFRetain(*(CFTypeRef *)(v7 + 8));
      uint64_t v4 = *(const void **)(v2 + 8);
    }
    else
    {
      uint64_t v4 = 0;
    }
    CFRelease(v4);
  }
  else
  {
    char v3 = 0;
  }
  objc_super v5 = (void *)CFMakeCollectable(v3);

  return (_WKFrameHandle *)v5;
}

- (int)_processIdentifier
{
  return *(_DWORD *)&self[5]._frameInfo.data.__lx[24];
}

- (BOOL)_isLocalFrame
{
  return self->_frameInfo.data.__lx[17] == 0;
}

- (BOOL)_isFocused
{
  return self[5]._frameInfo.data.__lx[28];
}

- (BOOL)_errorOccurred
{
  return self[5]._frameInfo.data.__lx[29];
}

- (NSString)_title
{
  API::FrameInfo::title((API::FrameInfo *)&self->_frameInfo, &v6);
  uint64_t v2 = v6;
  if (!v6) {
    return (NSString *)&stru_1EEA10550;
  }
  uint64_t v4 = (NSString *)WTF::StringImpl::operator NSString *();
  if (*(_DWORD *)v2 == 2) {
    WTF::StringImpl::destroy(v2, v3);
  }
  else {
    *(_DWORD *)v2 -= 2;
  }
  return v4;
}

@end