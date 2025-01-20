@interface WKNavigationResponse
+ (BOOL)accessInstanceVariablesDirectly;
- (BOOL)canShowMIMEType;
- (BOOL)isForMainFrame;
- (NSString)_downloadAttribute;
- (NSString)description;
- (NSURLRequest)_request;
- (NSURLResponse)response;
- (Object)_apiObject;
- (WKFrameInfo)_frame;
- (void)dealloc;
@end

@implementation WKNavigationResponse

+ (BOOL)accessInstanceVariablesDirectly
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  char v3 = WTF::linkedOnOrAfterSDKWithBehavior();
  if ((v3 & 1) == 0 && (+[WKNavigationResponse accessInstanceVariablesDirectly]::didLogFault & 1) == 0)
  {
    +[WKNavigationResponse accessInstanceVariablesDirectly]::didLogFault = 1;
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
    v5 = *(WTF::StringImpl **)&self[8]._navigationResponse.data.__lx[40];
    *(void *)&self[8]._navigationResponse.data.__lx[40] = 0;
    if (v5)
    {
      if (*(_DWORD *)v5 == 2) {
        WTF::StringImpl::destroy(v5, v4);
      }
      else {
        *(_DWORD *)v5 -= 2;
      }
    }
    int v6 = *(const void **)&self[8]._navigationResponse.data.__lx[16];
    *(void *)&self[8]._navigationResponse.data.__lx[16] = 0;
    if (v6) {
      CFRelease(v6);
    }
    WebCore::ResourceResponseBase::~ResourceResponseBase((WebCore::ResourceResponseBase *)&self[4]._navigationResponse, v4);
    Class isa = self[4].super.isa;
    self[4].super.Class isa = 0;
    if (isa) {
      CFRelease(isa);
    }
    WebCore::ResourceRequestBase::~ResourceRequestBase((WebCore::ResourceRequestBase *)&self->_navigationResponse.data.__lx[24]);
    uint64_t v8 = *(void *)&self->_navigationResponse.data.__lx[16];
    *(void *)&self->_navigationResponse.data.__lx[16] = 0;
    if (v8) {
      CFRelease(*(CFTypeRef *)(v8 + 8));
    }
    v9.receiver = self;
    v9.super_class = (Class)WKNavigationResponse;
    [(WKNavigationResponse *)&v9 dealloc];
  }
}

- (NSString)description
{
  char v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; response = %@>",
                       NSStringFromClass(v4),
                       self,
                       [(WKNavigationResponse *)self response]);
}

- (BOOL)isForMainFrame
{
  return *(unsigned char *)(*(void *)&self->_navigationResponse.data.__lx[16] + 16);
}

- (NSURLResponse)response
{
  return (NSURLResponse *)WebCore::ResourceResponse::nsURLResponse((WebCore::ResourceResponse *)&self[4]._navigationResponse);
}

- (BOOL)canShowMIMEType
{
  return self[8]._navigationResponse.data.__lx[32];
}

- (Object)_apiObject
{
  return (Object *)&self->_navigationResponse;
}

- (WKFrameInfo)_frame
{
  return *(WKFrameInfo **)(*(void *)&self->_navigationResponse.data.__lx[16] + 8);
}

- (NSURLRequest)_request
{
  return (NSURLRequest *)WebCore::ResourceRequest::nsURLRequest();
}

- (NSString)_downloadAttribute
{
  result = *(NSString **)&self[8]._navigationResponse.data.__lx[40];
  if (result) {
    return (NSString *)WTF::StringImpl::operator NSString *();
  }
  return result;
}

@end