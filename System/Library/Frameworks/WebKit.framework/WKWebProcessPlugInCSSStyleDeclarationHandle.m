@interface WKWebProcessPlugInCSSStyleDeclarationHandle
+ (id)cssStyleDeclarationHandleWithJSValue:(id)a3 inContext:(id)a4;
- (Object)_apiObject;
- (void)_cssStyleDeclarationHandle;
- (void)dealloc;
@end

@implementation WKWebProcessPlugInCSSStyleDeclarationHandle

- (void)dealloc
{
  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainRunLoop(v3, (objc_object *)self) & 1) == 0)
  {
    (**(void (***)(void))self->_cssStyleDeclarationHandle.data.__lx)();
    v4.receiver = self;
    v4.super_class = (Class)WKWebProcessPlugInCSSStyleDeclarationHandle;
    [(WKWebProcessPlugInCSSStyleDeclarationHandle *)&v4 dealloc];
  }
}

+ (id)cssStyleDeclarationHandleWithJSValue:(id)a3 inContext:(id)a4
{
  objc_super v4 = JSValueToObject((JSContextRef)[a4 JSGlobalContextRef], (JSValueRef)objc_msgSend(a3, "JSValueRef"), 0);
  v6 = (WebCore::JSCSSStyleDeclaration **)((char *)v4 - 16);
  if ((v4 & 8) == 0) {
    v6 = (WebCore::JSCSSStyleDeclaration **)((unint64_t)v4 & 0xFFFFFFFFFFFFC000 | 8);
  }
  v7 = (WTF *)WebCore::JSCSSStyleDeclaration::toWrapped(*v6, v4, v5);
  WebKit::InjectedBundleCSSStyleDeclarationHandle::getOrCreate(v7, v8, &v14);
  uint64_t v9 = v14;
  if (v14)
  {
    v10 = *(const void **)(v14 + 8);
    if (v10)
    {
      CFRetain(*(CFTypeRef *)(v14 + 8));
      v11 = *(const void **)(v9 + 8);
    }
    else
    {
      v11 = 0;
    }
    CFRelease(v11);
  }
  else
  {
    v10 = 0;
  }
  v12 = (void *)CFMakeCollectable(v10);

  return v12;
}

- (void)_cssStyleDeclarationHandle
{
  return &self->_cssStyleDeclarationHandle;
}

- (Object)_apiObject
{
  return (Object *)&self->_cssStyleDeclarationHandle;
}

@end