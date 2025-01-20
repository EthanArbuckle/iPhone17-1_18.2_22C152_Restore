@interface WKWebProcessPlugInRangeHandle
+ (id)rangeHandleWithJSValue:(id)x2_0 inContext:(id)a4;
- (NSString)text;
- (Object)_apiObject;
- (WKWebProcessPlugInFrame)frame;
- (id)detectDataWithTypes:(unint64_t)a3 context:(id)a4;
- (void)_rangeHandle;
- (void)dealloc;
@end

@implementation WKWebProcessPlugInRangeHandle

- (void)dealloc
{
  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainRunLoop(v3, (objc_object *)self) & 1) == 0)
  {
    (**(void (***)(void))self->_rangeHandle.data.__lx)();
    v4.receiver = self;
    v4.super_class = (Class)WKWebProcessPlugInRangeHandle;
    [(WKWebProcessPlugInRangeHandle *)&v4 dealloc];
  }
}

+ (id)rangeHandleWithJSValue:(id)x2_0 inContext:(id)a4
{
  v5 = (WebCore::JSRange **)[a4 JSGlobalContextRef];
  v6 = JSValueToObject((JSContextRef)v5, (JSValueRef)[x2_0 JSValueRef], 0);
  v7 = (WTF *)WebCore::JSRange::toWrapped(v5[7], v6, v16);
  WebKit::InjectedBundleRangeHandle::getOrCreate(v7, v8, &v14);
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

- (WKWebProcessPlugInFrame)frame
{
  WebKit::InjectedBundleNodeHandle::getOrCreate(*(WebKit::InjectedBundleNodeHandle **)(*(void *)(*(void *)(*(void *)&self->_rangeHandle.data.__lx[24] + 32)+ 48)+ 8), &v9);
  v2 = v9;
  WebKit::InjectedBundleNodeHandle::documentFrame((uint64_t)v9, &v10);
  uint64_t v3 = v10;
  if (v10)
  {
    uint64_t v10 = 0;
    objc_super v4 = *(const void **)(v3 + 8);
    if (v4)
    {
      CFRetain(*(CFTypeRef *)(v3 + 8));
      v5 = *(const void **)(v3 + 8);
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
  v6 = (id)CFMakeCollectable(v4);
  uint64_t v7 = v10;
  uint64_t v10 = 0;
  if (v7) {
    CFRelease(*(CFTypeRef *)(v7 + 8));
  }
  if (v2) {
    CFRelease(*((CFTypeRef *)v2 + 1));
  }
  return v6;
}

- (NSString)text
{
  WebKit::InjectedBundleRangeHandle::text((WebKit::InjectedBundleRangeHandle *)&self->_rangeHandle);
  if (!v5) {
    return (NSString *)&stru_1EEA10550;
  }
  uint64_t v3 = (NSString *)WTF::StringImpl::operator NSString *();
  if (*(_DWORD *)v5 == 2) {
    WTF::StringImpl::destroy(v5, v2);
  }
  else {
    *(_DWORD *)v5 -= 2;
  }
  return v3;
}

- (id)detectDataWithTypes:(unint64_t)a3 context:(id)a4
{
  WebCore::makeSimpleRange(v8, *(WebCore **)&self->_rangeHandle.data.__lx[24], (const Range *)a2);
  WebCore::DataDetection::extractReferenceDate((WebCore::DataDetection *)a4, v5);
  v6 = (void *)WebCore::DataDetection::detectContentInRange();
  WTF::Ref<WebCore::Node,WTF::RawPtrTraits<WebCore::Node>,WTF::DefaultRefDerefTraits<WebCore::Node>>::~Ref(&v9);
  WTF::Ref<WebCore::Node,WTF::RawPtrTraits<WebCore::Node>,WTF::DefaultRefDerefTraits<WebCore::Node>>::~Ref(v8);
  return v6;
}

- (void)_rangeHandle
{
  return &self->_rangeHandle;
}

- (Object)_apiObject
{
  return (Object *)&self->_rangeHandle;
}

@end