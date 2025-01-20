@interface WKWebProcessPlugInHitTestResult
- (Object)_apiObject;
- (WKWebProcessPlugInNodeHandle)nodeHandle;
- (void)dealloc;
@end

@implementation WKWebProcessPlugInHitTestResult

- (void)dealloc
{
  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainRunLoop(v3, (objc_object *)self) & 1) == 0)
  {
    (**(void (***)(void))self->_hitTestResult.data.__lx)();
    v4.receiver = self;
    v4.super_class = (Class)WKWebProcessPlugInHitTestResult;
    [(WKWebProcessPlugInHitTestResult *)&v4 dealloc];
  }
}

- (WKWebProcessPlugInNodeHandle)nodeHandle
{
  v2 = *(WebKit::InjectedBundleNodeHandle **)&self[1]._hitTestResult.data.__lx[40];
  if (v2 && (WebKit::InjectedBundleNodeHandle::getOrCreate(v2, &v8), (v3 = v8) != 0))
  {
    objc_super v4 = (const void *)*((void *)v8 + 1);
    if (v4)
    {
      CFRetain(*((CFTypeRef *)v8 + 1));
      v5 = (const void *)*((void *)v3 + 1);
    }
    else
    {
      v5 = 0;
    }
    CFRelease(v5);
  }
  else
  {
    objc_super v4 = 0;
  }
  v6 = (void *)CFMakeCollectable(v4);

  return (WKWebProcessPlugInNodeHandle *)v6;
}

- (Object)_apiObject
{
  return (Object *)&self->_hitTestResult;
}

@end