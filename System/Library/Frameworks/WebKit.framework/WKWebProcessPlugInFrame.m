@interface WKWebProcessPlugInFrame
+ (id)lookUpContentFrameFromWindowOrFrameElement:(id)a3;
+ (id)lookUpFrameFromHandle:(id)a3;
+ (id)lookUpFrameFromJSContext:(id)a3;
- (BOOL)_hasCustomContentProvider;
- (BOOL)containsAnyFormElements;
- (BOOL)isMainFrame;
- (NSArray)appleTouchIconURLs;
- (NSArray)childFrames;
- (NSArray)faviconURLs;
- (NSURL)URL;
- (Object)_apiObject;
- (_WKFrameHandle)handle;
- (__SecTrust)_serverTrust;
- (id)_browserContextController;
- (id)_certificateChain;
- (id)_parentFrame;
- (id)_provisionalURL;
- (id)_securityOrigin;
- (id)hitTest:(CGPoint)a3;
- (id)hitTest:(CGPoint)a3 options:(unint64_t)a4;
- (id)jsCSSStyleDeclarationForCSSStyleDeclarationHandle:(id)a3 inWorld:(id)a4;
- (id)jsContextForServiceWorkerWorld:(id)a3;
- (id)jsContextForWorld:(id)a3;
- (id)jsNodeForNodeHandle:(id)a3 inWorld:(id)a4;
- (id)jsRangeForRangeHandle:(id)a3 inWorld:(id)a4;
- (void)dealloc;
@end

@implementation WKWebProcessPlugInFrame

- (Object)_apiObject
{
  return (Object *)&self->_frame;
}

+ (id)lookUpFrameFromHandle:(id)a3
{
  uint64_t v4 = WebKit::WebProcess::singleton((WebKit::WebProcess *)a1);
  id result = (id)WebKit::WebProcess::webFrame(v4, *((void *)a3 + 3), *((void *)a3 + 4));
  if (result) {
    return (id)*((void *)result + 1);
  }
  return result;
}

+ (id)lookUpFrameFromJSContext:(id)a3
{
  v3 = (WebKit::WebFrame *)[a3 JSGlobalContextRef];
  WebKit::WebFrame::frameForContext(v3, v4, &v10);
  uint64_t v5 = v10;
  if (v10)
  {
    v6 = *(const void **)(v10 + 8);
    if (v6)
    {
      CFRetain(*(CFTypeRef *)(v10 + 8));
      v7 = *(const void **)(v5 + 8);
    }
    else
    {
      v7 = 0;
    }
    CFRelease(v7);
  }
  else
  {
    v6 = 0;
  }
  v8 = (void *)CFMakeCollectable(v6);

  return v8;
}

+ (id)lookUpContentFrameFromWindowOrFrameElement:(id)a3
{
  uint64_t v4 = (WebKit::WebFrame *)objc_msgSend((id)objc_msgSend(a3, "context"), "JSGlobalContextRef");
  uint64_t v5 = (const OpaqueJSContext *)[a3 JSValueRef];
  WebKit::WebFrame::contentFrameForWindowOrFrameElement(v4, v5, v6, &v12);
  uint64_t v7 = v12;
  if (v12)
  {
    v8 = *(const void **)(v12 + 8);
    if (v8)
    {
      CFRetain(*(CFTypeRef *)(v12 + 8));
      v9 = *(const void **)(v7 + 8);
    }
    else
    {
      v9 = 0;
    }
    CFRelease(v9);
  }
  else
  {
    v8 = 0;
  }
  uint64_t v10 = (void *)CFMakeCollectable(v8);

  return v10;
}

- (void)dealloc
{
  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainRunLoop(v3, (objc_object *)self) & 1) == 0)
  {
    (**(void (***)(void))self->_frame.data.__lx)();
    v4.receiver = self;
    v4.super_class = (Class)WKWebProcessPlugInFrame;
    [(WKWebProcessPlugInFrame *)&v4 dealloc];
  }
}

- (id)jsContextForWorld:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F30920];
  uint64_t v4 = WebKit::WebFrame::jsContextForWorld((WebKit::WebFrame *)&self->_frame, *(WebCore::DOMWrapperWorld **)([a3 _scriptWorld] + 24));

  return (id)[v3 contextWithJSGlobalContextRef:v4];
}

- (id)jsContextForServiceWorkerWorld:(id)a3
{
  p_frame = &self->_frame;
  [a3 _scriptWorld];
  id result = (id)WebKit::WebFrame::jsContextForServiceWorkerWorld((uint64_t)p_frame);
  if (result)
  {
    id v5 = result;
    v6 = (void *)MEMORY[0x1E4F30920];
    return (id)[v6 contextWithJSGlobalContextRef:v5];
  }
  return result;
}

- (id)hitTest:(CGPoint)a3
{
  CGPoint v10 = a3;
  lx = (unsigned int *)self->_frame.data.__lx;
  WebCore::IntPoint::IntPoint((WebCore::IntPoint *)&v8, &v10);
  WebKit::WebFrame::hitTest(lx, &v9);
  uint64_t v4 = v9;
  if (v9)
  {
    id v5 = *(const void **)(v9 + 8);
    if (v5)
    {
      CFRetain(*(CFTypeRef *)(v9 + 8));
      v6 = *(const void **)(v4 + 8);
    }
    else
    {
      v6 = 0;
    }
    CFRelease(v6);
  }
  else
  {
    id v5 = 0;
  }
  return (id)(id)CFMakeCollectable(v5);
}

- (id)hitTest:(CGPoint)a3 options:(unint64_t)a4
{
  CGPoint v11 = a3;
  lx = (unsigned int *)self->_frame.data.__lx;
  WebCore::IntPoint::IntPoint((WebCore::IntPoint *)&v9, &v11);
  WebKit::WebFrame::hitTest(lx, &v10);
  uint64_t v5 = v10;
  if (v10)
  {
    v6 = *(const void **)(v10 + 8);
    if (v6)
    {
      CFRetain(*(CFTypeRef *)(v10 + 8));
      uint64_t v7 = *(const void **)(v5 + 8);
    }
    else
    {
      uint64_t v7 = 0;
    }
    CFRelease(v7);
  }
  else
  {
    v6 = 0;
  }
  return (id)(id)CFMakeCollectable(v6);
}

- (id)jsCSSStyleDeclarationForCSSStyleDeclarationHandle:(id)a3 inWorld:(id)a4
{
  uint64_t v6 = WebKit::WebFrame::jsWrapperForWorld((uint64_t)&self->_frame, [a3 _cssStyleDeclarationHandle], objc_msgSend(a4, "_scriptWorld"));
  uint64_t v7 = (void *)MEMORY[0x1E4F30938];
  id v8 = [(WKWebProcessPlugInFrame *)self jsContextForWorld:a4];

  return (id)[v7 valueWithJSValueRef:v6 inContext:v8];
}

- (id)jsNodeForNodeHandle:(id)a3 inWorld:(id)a4
{
  uint64_t v6 = WebKit::WebFrame::jsWrapperForWorld((uint64_t)&self->_frame, [a3 _nodeHandle], objc_msgSend(a4, "_scriptWorld"));
  uint64_t v7 = (void *)MEMORY[0x1E4F30938];
  id v8 = [(WKWebProcessPlugInFrame *)self jsContextForWorld:a4];

  return (id)[v7 valueWithJSValueRef:v6 inContext:v8];
}

- (id)jsRangeForRangeHandle:(id)a3 inWorld:(id)a4
{
  uint64_t v6 = WebKit::WebFrame::jsWrapperForWorld((uint64_t)&self->_frame, [a3 _rangeHandle], objc_msgSend(a4, "_scriptWorld"));
  uint64_t v7 = (void *)MEMORY[0x1E4F30938];
  id v8 = [(WKWebProcessPlugInFrame *)self jsContextForWorld:a4];

  return (id)[v7 valueWithJSValueRef:v6 inContext:v8];
}

- (id)_browserContextController
{
  uint64_t v2 = *(void *)&self->_frame.data.__lx[24];
  if (!v2) {
    return 0;
  }
  uint64_t v3 = *(void *)(v2 + 8);
  if (!v3) {
    return 0;
  }
  uint64_t v4 = *(void *)(v3 + 24);
  if (!v4) {
    return 0;
  }
  uint64_t v5 = *(void *)(v4 + 8);
  if (!v5) {
    return 0;
  }
  uint64_t v7 = *(void **)(*(void *)(v5 + 48) + 16);
  if (((*(uint64_t (**)(void *, SEL))(*v7 + 1368))(v7, a2) & 1) != 0 || !*(void *)(v7[2] + 8)) {
    return 0;
  }
  id v8 = *(void **)(*(void *)(*(void *)(*(void *)(*(void *)(*(void *)&self->_frame.data.__lx[24] + 8) + 24)
                                          + 8)
                              + 48)
                  + 16);
  (*(void (**)(void *))(*v8 + 1368))(v8);
  uint64_t v9 = *(void *)(v8[2] + 8);
  if (v9) {
    uint64_t v10 = v9 - 16;
  }
  else {
    uint64_t v10 = 0;
  }
  return *(id *)(v10 + 8);
}

- (NSURL)URL
{
  WebKit::WebFrame::url((WebKit::WebFrame *)&self->_frame, (uint64_t)&v6);
  uint64_t v3 = (NSURL *)WTF::URL::operator NSURL *();
  uint64_t v4 = v6;
  uint64_t v6 = 0;
  if (v4)
  {
    if (*(_DWORD *)v4 == 2) {
      WTF::StringImpl::destroy(v4, v2);
    }
    else {
      *(_DWORD *)v4 -= 2;
    }
  }
  return v3;
}

- (NSArray)childFrames
{
  WebKit::WebFrame::childFrames((WebKit::WebFrame *)&self->_frame, &v6);
  uint64_t v2 = *(const void **)(v6 + 8);
  if (v2) {
    CFRetain(*(CFTypeRef *)(v6 + 8));
  }
  uint64_t v3 = (id)CFMakeCollectable(v2);
  uint64_t v4 = v6;
  uint64_t v6 = 0;
  if (v4) {
    CFRelease(*(CFTypeRef *)(v4 + 8));
  }
  return v3;
}

- (BOOL)containsAnyFormElements
{
  return WebKit::WebFrame::containsAnyFormElements((WebKit::WebFrame *)&self->_frame);
}

- (BOOL)isMainFrame
{
  uint64_t v2 = *(void *)&self->_frame.data.__lx[24];
  return v2 && (uint64_t v3 = *(void *)(v2 + 8)) != 0 && *(void *)(*(void *)(v3 + 128) + 8) == v3;
}

- (_WKFrameHandle)handle
{
  uint64_t v2 = *(void *)&self[1]._frame.data.__lx[24];
  uint64_t v3 = *(void *)&self[1]._frame.data.__lx[32];
  uint64_t v4 = API::Object::newObject(0x28uLL, 11);
  *(void *)uint64_t v4 = &unk_1EE9D1E28;
  WebKit::InitializeWebKit2((WebKit *)v4);
  *(void *)uint64_t v4 = &unk_1EE9B3E30;
  *(void *)(v4 + 16) = v2;
  *(void *)(v4 + 24) = v3;
  *(unsigned char *)(v4 + 32) = 0;
  uint64_t v5 = *(const void **)(v4 + 8);
  if (v5) {
    CFRetain(*(CFTypeRef *)(v4 + 8));
  }
  uint64_t v6 = (id)CFMakeCollectable(v5);
  CFRelease(*(CFTypeRef *)(v4 + 8));
  return v6;
}

- (id)_securityOrigin
{
  uint64_t v2 = *(void *)&self->_frame.data.__lx[24];
  if (!v2) {
    return 0;
  }
  uint64_t v3 = *(void *)(v2 + 8);
  if (!v3 || *(unsigned char *)(v3 + 144)) {
    return 0;
  }
  uint64_t v5 = (WebCore::SecurityOrigin *)WebCore::SecurityContext::securityOrigin((WebCore::SecurityContext *)(*(void *)(v3 + 296) + 208));
  WebCore::SecurityOrigin::toString((uint64_t *)&v9, v5);
  if (!v9) {
    return &stru_1EEA10550;
  }
  uint64_t v4 = (void *)WTF::StringImpl::operator NSString *();
  uint64_t v7 = v9;
  uint64_t v9 = 0;
  if (v7)
  {
    if (*(_DWORD *)v7 == 2) {
      WTF::StringImpl::destroy(v7, v6);
    }
    else {
      *(_DWORD *)v7 -= 2;
    }
  }
  return v4;
}

- (NSArray)appleTouchIconURLs
{
  uint64_t v2 = *(void *)&self->_frame.data.__lx[24];
  if (v2 && (uint64_t v3 = *(void *)(v2 + 8)) != 0)
  {
    if (*(unsigned char *)(v3 + 144)) {
      uint64_t v4 = 0;
    }
    else {
      uint64_t v4 = v3;
    }
  }
  else
  {
    uint64_t v4 = 0;
  }
  collectIcons(&cf, v4);
  uint64_t v5 = (void *)CFMakeCollectable(cf);

  return (NSArray *)v5;
}

- (NSArray)faviconURLs
{
  uint64_t v2 = *(void *)&self->_frame.data.__lx[24];
  if (v2 && (uint64_t v3 = *(void *)(v2 + 8)) != 0)
  {
    if (*(unsigned char *)(v3 + 144)) {
      uint64_t v4 = 0;
    }
    else {
      uint64_t v4 = v3;
    }
  }
  else
  {
    uint64_t v4 = 0;
  }
  collectIcons(&cf, v4);
  uint64_t v5 = (void *)CFMakeCollectable(cf);

  return (NSArray *)v5;
}

- (id)_parentFrame
{
  WebKit::WebFrame::parentFrame((unsigned int *)self->_frame.data.__lx, &v7);
  uint64_t v2 = v7;
  if (v7)
  {
    uint64_t v3 = *(const void **)(v7 + 8);
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
    uint64_t v3 = 0;
  }
  uint64_t v5 = (void *)CFMakeCollectable(v3);

  return v5;
}

- (BOOL)_hasCustomContentProvider
{
  uint64_t v2 = *(void *)&self->_frame.data.__lx[24];
  if (!v2) {
    return 0;
  }
  uint64_t v3 = *(void *)(v2 + 8);
  if (!v3 || *(void *)(*(void *)(v3 + 128) + 8) != v3) {
    return 0;
  }
  uint64_t v5 = *(void *)(v3 + 24);
  if (v5
    && (uint64_t v6 = *(void *)(v5 + 8)) != 0
    && (uint64_t v7 = *(void **)(*(void *)(v6 + 48) + 16),
        ((*(uint64_t (**)(void *, SEL))(*v7 + 1368))(v7, a2) & 1) == 0))
  {
    uint64_t v8 = *(void *)(v7[2] + 8);
    if (v8) {
      uint64_t v9 = (WebKit::WebPage *)(v8 - 16);
    }
    else {
      uint64_t v9 = 0;
    }
  }
  else
  {
    uint64_t v9 = 0;
  }

  return WebKit::WebPage::mainFrameHasCustomContentProvider(v9);
}

- (id)_certificateChain
{
  WebKit::WebFrame::certificateInfo((unsigned int *)self->_frame.data.__lx, &v6);
  uint64_t v2 = v6;
  WebCore::CertificateInfo::certificateChainFromSecTrust((uint64_t *)&arg, v6, v3);
  if (arg)
  {
    CFAutorelease(arg);
    CFTypeRef v4 = arg;
  }
  else
  {
    CFTypeRef v4 = 0;
  }
  CFTypeRef arg = 0;
  if (v2) {
    CFRelease(v2);
  }
  return (id)v4;
}

- (__SecTrust)_serverTrust
{
  WebKit::WebFrame::certificateInfo((unsigned int *)self->_frame.data.__lx, &cf);
  id result = (__SecTrust *)cf;
  if (cf)
  {
    uint64_t v3 = (__SecTrust *)cf;
    CFRelease(cf);
    return v3;
  }
  return result;
}

- (id)_provisionalURL
{
  uint64_t v2 = (void *)MEMORY[0x1E4F1CB10];
  WebKit::WebFrame::provisionalURL((unsigned int *)self->_frame.data.__lx, &v7);
  CFTypeRef v4 = objc_msgSend(v2, "_web_URLWithWTFString:", &v7);
  uint64_t v5 = v7;
  uint64_t v7 = 0;
  if (v5)
  {
    if (*(_DWORD *)v5 == 2) {
      WTF::StringImpl::destroy(v5, v3);
    }
    else {
      *(_DWORD *)v5 -= 2;
    }
  }
  return v4;
}

@end