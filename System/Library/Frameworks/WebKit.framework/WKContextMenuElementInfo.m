@interface WKContextMenuElementInfo
+ (BOOL)accessInstanceVariablesDirectly;
- (NSURL)linkURL;
- (Object)_apiObject;
- (id)_activatedElementInfo;
- (void)dealloc;
@end

@implementation WKContextMenuElementInfo

+ (BOOL)accessInstanceVariablesDirectly
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  char v3 = WTF::linkedOnOrAfterSDKWithBehavior();
  if ((v3 & 1) == 0 && (+[WKContextMenuElementInfo accessInstanceVariablesDirectly]::didLogFault & 1) == 0)
  {
    +[WKContextMenuElementInfo accessInstanceVariablesDirectly]::didLogFault = 1;
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
    v5 = *(const void **)&self[10]._elementInfo.data.__lx[16];
    *(void *)&self[10]._elementInfo.data.__lx[16] = 0;
    if (v5) {
      CFRelease(v5);
    }
    WebKit::InteractionInformationAtPosition::~InteractionInformationAtPosition((WebKit::InteractionInformationAtPosition *)&self->_elementInfo.data.__lx[16], v4);
    v6.receiver = self;
    v6.super_class = (Class)WKContextMenuElementInfo;
    [(WKContextMenuElementInfo *)&v6 dealloc];
  }
}

- (NSURL)linkURL
{
  return (NSURL *)WTF::URL::operator NSURL *();
}

- (Object)_apiObject
{
  return (Object *)&self->_elementInfo;
}

- (id)_activatedElementInfo
{
  v2 = &self->_elementInfo.data.__lx[16];
  char v3 = *(const void **)&self[10]._elementInfo.data.__lx[16];
  if (v3) {
    CFRetain(*(CFTypeRef *)&self[10]._elementInfo.data.__lx[16]);
  }
  v4 = +[_WKActivatedElementInfo activatedElementInfoWithInteractionInformationAtPosition:v2 userInfo:v3];
  if (v3) {
    CFRelease(v3);
  }
  return v4;
}

@end