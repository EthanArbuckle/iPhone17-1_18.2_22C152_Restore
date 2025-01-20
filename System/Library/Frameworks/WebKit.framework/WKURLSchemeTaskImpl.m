@interface WKURLSchemeTaskImpl
- (BOOL)_requestOnlyIfCached;
- (NSURLRequest)request;
- (Object)_apiObject;
- (WKFrameInfo)_frame;
- (WKURLSchemeTaskImpl)init;
- (uint64_t)_didPerformRedirection:(WTF *)this newRequest:(void *)a2;
- (uint64_t)_didPerformRedirection:(uint64_t)a1 newRequest:;
- (uint64_t)_willPerformRedirection:(uint64_t)a1 newRequest:completionHandler:;
- (uint64_t)_willPerformRedirection:newRequest:completionHandler:;
- (uint64_t)didFailWithError:(WTF *)this;
- (uint64_t)didFailWithError:(uint64_t)a1;
- (uint64_t)didFinish;
- (uint64_t)didReceiveData:(WTF *)this;
- (uint64_t)didReceiveData:(uint64_t)a1;
- (uint64_t)didReceiveResponse:(WTF *)this;
- (uint64_t)didReceiveResponse:(uint64_t)a1;
- (void)_didPerformRedirection:(id)a3 newRequest:(id)a4;
- (void)_didPerformRedirection:(void *)a1 newRequest:;
- (void)_willPerformRedirection:(id)a3 newRequest:(id)a4 completionHandler:(id)a5;
- (void)dealloc;
- (void)didFailWithError:(id)a3;
- (void)didFailWithError:(void *)a1;
- (void)didFinish;
- (void)didReceiveData:(id)a3;
- (void)didReceiveData:(void *)a1;
- (void)didReceiveResponse:(id)a3;
- (void)didReceiveResponse:(void *)a1;
@end

@implementation WKURLSchemeTaskImpl

- (WKURLSchemeTaskImpl)init
{
  result = (WKURLSchemeTaskImpl *)80;
  __break(0xC471u);
  return result;
}

- (void)dealloc
{
  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainRunLoop(v3, (objc_object *)self) & 1) == 0)
  {
    WebKit::WebURLSchemeTask::~WebURLSchemeTask((WebKit::WebURLSchemeTask *)&self->_urlSchemeTask, v4);
    v5.receiver = self;
    v5.super_class = (Class)WKURLSchemeTaskImpl;
    [(WKURLSchemeTaskImpl *)&v5 dealloc];
  }
}

- (NSURLRequest)request
{
  return (NSURLRequest *)WebKit::WebURLSchemeTask::nsRequest((atomic_uchar *)&self->_urlSchemeTask);
}

- (BOOL)_requestOnlyIfCached
{
  return [(id)WebKit::WebURLSchemeTask::nsRequest((atomic_uchar *)&self->_urlSchemeTask) cachePolicy] == 3;
}

- (void)_willPerformRedirection:(id)a3 newRequest:(id)a4 completionHandler:(id)a5
{
  if (self) {
    CFRetain(self);
  }
  if (a3) {
    CFRetain(a3);
  }
  if (a4) {
    CFRetain(a4);
  }
  v9 = _Block_copy(a5);
  v10 = (void *)WTF::fastMalloc((WTF *)0x40);
  void *v10 = &unk_1EE9C4ED0;
  v10[1] = self;
  v10[2] = self;
  v10[3] = a3;
  v10[4] = a3;
  v10[5] = a4;
  v10[6] = a4;
  v10[7] = v9;
  v12 = v10;
  uint64_t ExceptionTypeFromMainRunLoop = getExceptionTypeFromMainRunLoop((uint64_t *)&v12);
  if (v12) {
    (*(void (**)(void *))(*v12 + 8))(v12);
  }
  raiseExceptionIfNecessary(ExceptionTypeFromMainRunLoop);

  _Block_release(0);
}

- (void)didReceiveResponse:(id)a3
{
  if (self) {
    CFRetain(self);
  }
  if (a3) {
    CFRetain(a3);
  }
  objc_super v5 = (void *)WTF::fastMalloc((WTF *)0x28);
  *objc_super v5 = &unk_1EE9C4F20;
  v5[1] = self;
  v5[2] = self;
  v5[3] = a3;
  v5[4] = a3;
  v7 = v5;
  uint64_t ExceptionTypeFromMainRunLoop = getExceptionTypeFromMainRunLoop((uint64_t *)&v7);
  if (v7) {
    (*(void (**)(void *))(*v7 + 8))(v7);
  }

  raiseExceptionIfNecessary(ExceptionTypeFromMainRunLoop);
}

- (void)didReceiveData:(id)a3
{
  if (self) {
    CFRetain(self);
  }
  if (a3) {
    CFRetain(a3);
  }
  objc_super v5 = (void *)WTF::fastMalloc((WTF *)0x28);
  *objc_super v5 = &unk_1EE9C4F48;
  v5[1] = self;
  v5[2] = self;
  v5[3] = a3;
  v5[4] = a3;
  v7 = v5;
  uint64_t ExceptionTypeFromMainRunLoop = getExceptionTypeFromMainRunLoop((uint64_t *)&v7);
  if (v7) {
    (*(void (**)(void *))(*v7 + 8))(v7);
  }

  raiseExceptionIfNecessary(ExceptionTypeFromMainRunLoop);
}

- (void)didFinish
{
  v2 = (const void *)a1[1];
  *a1 = &unk_1EE9C4F70;
  a1[1] = 0;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

- (void)didFailWithError:(id)a3
{
  if (self) {
    CFRetain(self);
  }
  if (a3) {
    CFRetain(a3);
  }
  objc_super v5 = (void *)WTF::fastMalloc((WTF *)0x28);
  *objc_super v5 = &unk_1EE9C4F98;
  v5[1] = self;
  v5[2] = self;
  v5[3] = a3;
  v5[4] = a3;
  v7 = v5;
  uint64_t ExceptionTypeFromMainRunLoop = getExceptionTypeFromMainRunLoop((uint64_t *)&v7);
  if (v7) {
    (*(void (**)(void *))(*v7 + 8))(v7);
  }

  raiseExceptionIfNecessary(ExceptionTypeFromMainRunLoop);
}

- (void)_didPerformRedirection:(id)a3 newRequest:(id)a4
{
  if (self) {
    CFRetain(self);
  }
  if (a3) {
    CFRetain(a3);
  }
  if (a4) {
    CFRetain(a4);
  }
  v7 = (void *)WTF::fastMalloc((WTF *)0x38);
  void *v7 = &unk_1EE9C4FC0;
  v7[1] = self;
  v7[2] = self;
  v7[3] = a3;
  v7[4] = a3;
  v7[5] = a4;
  v7[6] = a4;
  v9 = v7;
  uint64_t ExceptionTypeFromMainRunLoop = getExceptionTypeFromMainRunLoop((uint64_t *)&v9);
  if (v9) {
    (*(void (**)(void *))(*v9 + 8))(v9);
  }

  raiseExceptionIfNecessary(ExceptionTypeFromMainRunLoop);
}

- (WKFrameInfo)_frame
{
  return *(WKFrameInfo **)(*(void *)&self[4]._urlSchemeTask.data.__lx[32] + 8);
}

- (Object)_apiObject
{
  return (Object *)&self->_urlSchemeTask;
}

- (uint64_t)_willPerformRedirection:(uint64_t)a1 newRequest:completionHandler:
{
  uint64_t v2 = *(void *)(a1 + 16);
  WebCore::ResourceResponse::ResourceResponse((WebCore::ResourceResponse *)v14, *(NSURLResponse **)(a1 + 32));
  MEMORY[0x199732A50](v12, *(void *)(a1 + 48));
  uint64_t v3 = *(void *)(a1 + 56);
  *(void *)(a1 + 56) = 0;
  v4 = (void *)WTF::fastMalloc((WTF *)0x10);
  void *v4 = &unk_1EE9C4EF8;
  v4[1] = v3;
  v11 = v4;
  uint64_t v5 = WebKit::WebURLSchemeTask::willPerformRedirection(v2 + 8, (uint64_t)v14, (uint64_t)v12, (uint64_t *)&v11);
  uint64_t v6 = (uint64_t)v11;
  v11 = 0;
  if (v6) {
    (*(void (**)(uint64_t))(*(void *)v6 + 8))(v6);
  }
  _Block_release(0);
  CFTypeRef v7 = v13;
  CFTypeRef v13 = 0;
  if (v7) {
    CFRelease(v7);
  }
  WebCore::ResourceRequestBase::~ResourceRequestBase((WebCore::ResourceRequestBase *)v12);
  CFTypeRef v9 = cf;
  CFTypeRef cf = 0;
  if (v9) {
    CFRelease(v9);
  }
  WebCore::ResourceResponseBase::~ResourceResponseBase((WebCore::ResourceResponseBase *)v14, v8);
  return v5;
}

- (uint64_t)_willPerformRedirection:newRequest:completionHandler:
{
  uint64_t v1 = *(void *)(a1 + 8);
  uint64_t v2 = WebCore::ResourceRequest::nsURLRequest();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 16);

  return v3(v1, v2);
}

- (void)didReceiveResponse:(void *)a1
{
  *a1 = &unk_1EE9C4F20;
  uint64_t v2 = (const void *)a1[3];
  a1[3] = 0;
  if (v2) {
    CFRelease(v2);
  }
  uint64_t v3 = (const void *)a1[1];
  a1[1] = 0;
  if (v3) {
    CFRelease(v3);
  }
  return a1;
}

- (uint64_t)didReceiveResponse:(WTF *)this
{
  *(void *)this = &unk_1EE9C4F20;
  uint64_t v3 = (const void *)*((void *)this + 3);
  *((void *)this + 3) = 0;
  if (v3) {
    CFRelease(v3);
  }
  v4 = (const void *)*((void *)this + 1);
  *((void *)this + 1) = 0;
  if (v4) {
    CFRelease(v4);
  }

  return WTF::fastFree(this, a2);
}

- (uint64_t)didReceiveResponse:(uint64_t)a1
{
  uint64_t v1 = (WebKit::WebURLSchemeTask *)(*(void *)(a1 + 16) + 8);
  WebCore::ResourceResponse::ResourceResponse((WebCore::ResourceResponse *)v6, *(NSURLResponse **)(a1 + 32));
  uint64_t v3 = WebKit::WebURLSchemeTask::didReceiveResponse(v1, (const WebCore::ResourceResponse *)v6);
  CFTypeRef v4 = cf;
  CFTypeRef cf = 0;
  if (v4) {
    CFRelease(v4);
  }
  WebCore::ResourceResponseBase::~ResourceResponseBase((WebCore::ResourceResponseBase *)v6, v2);
  return v3;
}

- (void)didReceiveData:(void *)a1
{
  *a1 = &unk_1EE9C4F48;
  uint64_t v2 = (const void *)a1[3];
  a1[3] = 0;
  if (v2) {
    CFRelease(v2);
  }
  uint64_t v3 = (const void *)a1[1];
  a1[1] = 0;
  if (v3) {
    CFRelease(v3);
  }
  return a1;
}

- (uint64_t)didReceiveData:(WTF *)this
{
  *(void *)this = &unk_1EE9C4F48;
  uint64_t v3 = (const void *)*((void *)this + 3);
  *((void *)this + 3) = 0;
  if (v3) {
    CFRelease(v3);
  }
  CFTypeRef v4 = (const void *)*((void *)this + 1);
  *((void *)this + 1) = 0;
  if (v4) {
    CFRelease(v4);
  }

  return WTF::fastFree(this, a2);
}

- (uint64_t)didReceiveData:(uint64_t)a1
{
  uint64_t v2 = *(void *)(a1 + 16) + 8;
  WebCore::SharedBuffer::create<NSData *&>((WebCore::FragmentedSharedBuffer **)(a1 + 32), a2, (uint64_t *)&v7);
  uint64_t v4 = WebKit::WebURLSchemeTask::didReceiveData(v2, (uint64_t *)&v7);
  uint64_t v5 = v7;
  CFTypeRef v7 = 0;
  if (v5) {
    WTF::ThreadSafeRefCounted<WebCore::FragmentedSharedBuffer,(WTF::DestructionThread)0>::deref(v5, v3);
  }
  return v4;
}

- (uint64_t)didFinish
{
  uint64_t v1 = (WebKit::WebURLSchemeTask *)(*(void *)(a1 + 16) + 8);
  WebCore::ResourceErrorBase::ResourceErrorBase((uint64_t)&v9, 0);
  CFTypeRef cf = 0;
  char v13 = 1;
  uint64_t v3 = WebKit::WebURLSchemeTask::didComplete(v1, (const WebCore::ResourceError *)&v9);
  CFTypeRef v4 = cf;
  CFTypeRef cf = 0;
  if (v4) {
    CFRelease(v4);
  }
  uint64_t v5 = v11;
  v11 = 0;
  if (v5)
  {
    if (*(_DWORD *)v5 == 2) {
      WTF::StringImpl::destroy(v5, v2);
    }
    else {
      *(_DWORD *)v5 -= 2;
    }
  }
  uint64_t v6 = v10;
  v10 = 0;
  if (v6)
  {
    if (*(_DWORD *)v6 == 2) {
      WTF::StringImpl::destroy(v6, v2);
    }
    else {
      *(_DWORD *)v6 -= 2;
    }
  }
  CFTypeRef v7 = v9;
  CFTypeRef v9 = 0;
  if (v7)
  {
    if (*(_DWORD *)v7 == 2) {
      WTF::StringImpl::destroy(v7, v2);
    }
    else {
      *(_DWORD *)v7 -= 2;
    }
  }
  return v3;
}

- (void)didFailWithError:(void *)a1
{
  *a1 = &unk_1EE9C4F98;
  uint64_t v2 = (const void *)a1[3];
  a1[3] = 0;
  if (v2) {
    CFRelease(v2);
  }
  uint64_t v3 = (const void *)a1[1];
  a1[1] = 0;
  if (v3) {
    CFRelease(v3);
  }
  return a1;
}

- (uint64_t)didFailWithError:(WTF *)this
{
  *(void *)this = &unk_1EE9C4F98;
  uint64_t v3 = (const void *)*((void *)this + 3);
  *((void *)this + 3) = 0;
  if (v3) {
    CFRelease(v3);
  }
  CFTypeRef v4 = (const void *)*((void *)this + 1);
  *((void *)this + 1) = 0;
  if (v4) {
    CFRelease(v4);
  }

  return WTF::fastFree(this, a2);
}

- (uint64_t)didFailWithError:(uint64_t)a1
{
  uint64_t v1 = (WebKit::WebURLSchemeTask *)(*(void *)(a1 + 16) + 8);
  MEMORY[0x199731570](&v9, *(void *)(a1 + 32));
  uint64_t v3 = WebKit::WebURLSchemeTask::didComplete(v1, (const WebCore::ResourceError *)&v9);
  CFTypeRef v4 = cf;
  CFTypeRef cf = 0;
  if (v4) {
    CFRelease(v4);
  }
  uint64_t v5 = v11;
  v11 = 0;
  if (v5)
  {
    if (*(_DWORD *)v5 == 2) {
      WTF::StringImpl::destroy(v5, v2);
    }
    else {
      *(_DWORD *)v5 -= 2;
    }
  }
  uint64_t v6 = v10;
  v10 = 0;
  if (v6)
  {
    if (*(_DWORD *)v6 == 2) {
      WTF::StringImpl::destroy(v6, v2);
    }
    else {
      *(_DWORD *)v6 -= 2;
    }
  }
  CFTypeRef v7 = v9;
  CFTypeRef v9 = 0;
  if (v7)
  {
    if (*(_DWORD *)v7 == 2) {
      WTF::StringImpl::destroy(v7, v2);
    }
    else {
      *(_DWORD *)v7 -= 2;
    }
  }
  return v3;
}

- (void)_didPerformRedirection:(void *)a1 newRequest:
{
  *a1 = &unk_1EE9C4FC0;
  uint64_t v2 = (const void *)a1[5];
  a1[5] = 0;
  if (v2) {
    CFRelease(v2);
  }
  uint64_t v3 = (const void *)a1[3];
  a1[3] = 0;
  if (v3) {
    CFRelease(v3);
  }
  CFTypeRef v4 = (const void *)a1[1];
  a1[1] = 0;
  if (v4) {
    CFRelease(v4);
  }
  return a1;
}

- (uint64_t)_didPerformRedirection:(WTF *)this newRequest:(void *)a2
{
  *(void *)this = &unk_1EE9C4FC0;
  uint64_t v3 = (const void *)*((void *)this + 5);
  *((void *)this + 5) = 0;
  if (v3) {
    CFRelease(v3);
  }
  CFTypeRef v4 = (const void *)*((void *)this + 3);
  *((void *)this + 3) = 0;
  if (v4) {
    CFRelease(v4);
  }
  uint64_t v5 = (const void *)*((void *)this + 1);
  *((void *)this + 1) = 0;
  if (v5) {
    CFRelease(v5);
  }

  return WTF::fastFree(this, a2);
}

- (uint64_t)_didPerformRedirection:(uint64_t)a1 newRequest:
{
  uint64_t v2 = *(void *)(a1 + 16);
  WebCore::ResourceResponse::ResourceResponse((WebCore::ResourceResponse *)v10, *(NSURLResponse **)(a1 + 32));
  MEMORY[0x199732A50](v8, *(void *)(a1 + 48));
  uint64_t v3 = WebKit::WebURLSchemeTask::didPerformRedirection(v2 + 8, (uint64_t)v10, (uint64_t)v8);
  CFTypeRef v4 = v9;
  CFTypeRef v9 = 0;
  if (v4) {
    CFRelease(v4);
  }
  WebCore::ResourceRequestBase::~ResourceRequestBase((WebCore::ResourceRequestBase *)v8);
  CFTypeRef v6 = cf;
  CFTypeRef cf = 0;
  if (v6) {
    CFRelease(v6);
  }
  WebCore::ResourceResponseBase::~ResourceResponseBase((WebCore::ResourceResponseBase *)v10, v5);
  return v3;
}

@end