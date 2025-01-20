@interface WKNavigation
+ (BOOL)accessInstanceVariablesDirectly;
- (BOOL)_isUserInitiated;
- (Object)_apiObject;
- (WKContentMode)effectiveContentMode;
- (id)_request;
- (void)dealloc;
@end

@implementation WKNavigation

+ (BOOL)accessInstanceVariablesDirectly
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  char v3 = WTF::linkedOnOrAfterSDKWithBehavior();
  if ((v3 & 1) == 0 && (+[WKNavigation accessInstanceVariablesDirectly]::didLogFault & 1) == 0)
  {
    +[WKNavigation accessInstanceVariablesDirectly]::didLogFault = 1;
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
    (**(void (***)(void))self->_navigation.data.__lx)();
    v4.receiver = self;
    v4.super_class = (Class)WKNavigation;
    [(WKNavigation *)&v4 dealloc];
  }
}

- (id)_request
{
  return (id)WebCore::ResourceRequest::nsURLRequest();
}

- (BOOL)_isUserInitiated
{
  return self[8]._navigation.data.__lx[24];
}

- (WKContentMode)effectiveContentMode
{
  int v2 = self[53]._navigation.data.__lx[25];
  if (v2 == 2) {
    return 2;
  }
  else {
    return (unint64_t)(v2 == 1);
  }
}

- (Object)_apiObject
{
  return (Object *)&self->_navigation;
}

@end