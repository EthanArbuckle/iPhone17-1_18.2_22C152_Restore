@interface WKDownload
+ (BOOL)accessInstanceVariablesDirectly;
- (BOOL)isUserInitiated;
- (NSProgress)progress;
- (NSURLRequest)originalRequest;
- (Object)_apiObject;
- (WKFrameInfo)originatingFrame;
- (WKWebView)webView;
- (id).cxx_construct;
- (id)delegate;
- (uint64_t)cancel:(const void *)a1;
- (uint64_t)cancel:(uint64_t)a1;
- (uint64_t)progress;
- (void)cancel:(void *)completionHandler;
- (void)dealloc;
- (void)progress;
- (void)setDelegate:(id)delegate;
@end

@implementation WKDownload

+ (BOOL)accessInstanceVariablesDirectly
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  char v3 = WTF::linkedOnOrAfterSDKWithBehavior();
  if ((v3 & 1) == 0 && (+[WKDownload accessInstanceVariablesDirectly]::didLogFault & 1) == 0)
  {
    +[WKDownload accessInstanceVariablesDirectly]::didLogFault = 1;
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

- (void)cancel:(void *)completionHandler
{
  v4 = _Block_copy(completionHandler);
  v5 = (void *)WTF::fastMalloc((WTF *)0x10);
  void *v5 = &unk_1EE9C2C50;
  v5[1] = v4;
  int v6 = v5;
  WebKit::DownloadProxy::cancel((uint64_t)&self->_download, (uint64_t *)&v6);
  if (v6) {
    (*(void (**)(void *))(*v6 + 8))(v6);
  }

  _Block_release(0);
}

- (NSURLRequest)originalRequest
{
  return (NSURLRequest *)WebCore::ResourceRequest::nsURLRequest();
}

- (WKWebView)webView
{
  uint64_t v2 = *(void *)&self->_anon_38[240];
  if (!v2) {
    return 0;
  }
  uint64_t v3 = *(void *)(v2 + 8);
  if (!v3) {
    return 0;
  }
  WebKit::WebPageProxy::cocoaView((WebKit::WebPageProxy *)(v3 - 16), &cf);
  v4 = (void *)CFMakeCollectable(cf);

  return (WKWebView *)v4;
}

- (BOOL)isUserInitiated
{
  return self->_anon_38[264];
}

- (WKFrameInfo)originatingFrame
{
  return *(WKFrameInfo **)(*(void *)&self->_anon_38[272] + 8);
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained(&self->_delegate.m_weakReference);
  uint64_t v3 = WeakRetained;
  if (WeakRetained) {
    CFRelease(WeakRetained);
  }
  return v3;
}

- (void)setDelegate:(id)delegate
{
  objc_storeWeak(&self->_delegate.m_weakReference, delegate);
  uint64_t v5 = WTF::fastMalloc((WTF *)0x20);
  *(_DWORD *)(v5 + 8) = 1;
  *(void *)uint64_t v5 = &unk_1EE9C2978;
  *(void *)(v5 + 16) = 0;
  objc_initWeak((id *)(v5 + 16), delegate);
  *(_WORD *)(v5 + 24) = *(_WORD *)(v5 + 24) & 0xFFFE | objc_opt_respondsToSelector() & 1;
  if (objc_opt_respondsToSelector()) {
    __int16 v6 = 2;
  }
  else {
    __int16 v6 = 0;
  }
  *(_WORD *)(v5 + 24) = *(_WORD *)(v5 + 24) & 0xFFFD | v6;
  objc_loadWeak((id *)(v5 + 16));
  if (objc_opt_respondsToSelector()) {
    __int16 v7 = 4;
  }
  else {
    __int16 v7 = 0;
  }
  *(_WORD *)(v5 + 24) = *(_WORD *)(v5 + 24) & 0xFFFB | v7;
  if (objc_opt_respondsToSelector()) {
    __int16 v8 = 8;
  }
  else {
    __int16 v8 = 0;
  }
  *(_WORD *)(v5 + 24) = *(_WORD *)(v5 + 24) & 0xFFF7 | v8;
  if (objc_opt_respondsToSelector()) {
    __int16 v9 = 16;
  }
  else {
    __int16 v9 = 0;
  }
  *(_WORD *)(v5 + 24) = *(_WORD *)(v5 + 24) & 0xFFEF | v9;
  if (objc_opt_respondsToSelector()) {
    __int16 v10 = 32;
  }
  else {
    __int16 v10 = 0;
  }
  *(_WORD *)(v5 + 24) = *(_WORD *)(v5 + 24) & 0xFFDF | v10;
  if (objc_opt_respondsToSelector()) {
    __int16 v11 = 64;
  }
  else {
    __int16 v11 = 0;
  }
  *(_WORD *)(v5 + 24) = *(_WORD *)(v5 + 24) & 0xFFBF | v11;
  if (objc_opt_respondsToSelector()) {
    __int16 v12 = 128;
  }
  else {
    __int16 v12 = 0;
  }
  *(_WORD *)(v5 + 24) = *(_WORD *)(v5 + 24) & 0xFF7F | v12;
  if (objc_opt_respondsToSelector()) {
    __int16 v13 = 256;
  }
  else {
    __int16 v13 = 0;
  }
  *(_WORD *)(v5 + 24) = *(_WORD *)(v5 + 24) & 0xFEFF | v13;
  if (objc_opt_respondsToSelector()) {
    __int16 v14 = 512;
  }
  else {
    __int16 v14 = 0;
  }
  *(_WORD *)(v5 + 24) = *(_WORD *)(v5 + 24) & 0xFDFF | v14;
  v15 = *(_DWORD **)self->_anon_38;
  *(void *)self->_anon_38 = v5;
  if (v15)
  {
    if (v15[2] == 1)
    {
      v16 = *(void (**)(void))(*(void *)v15 + 8);
      v16();
    }
    else
    {
      --v15[2];
    }
  }
}

- (NSProgress)progress
{
  uint64_t v2 = *(NSProgress **)&self->_anon_38[288];
  if (!v2)
  {
    uint64_t v2 = (NSProgress *)[MEMORY[0x1E4F28F90] progressWithTotalUnitCount:-1];
    [(NSProgress *)v2 setKind:*MEMORY[0x1E4F28898]];
    [(NSProgress *)v2 setFileOperationKind:*MEMORY[0x1E4F28858]];
    [(NSProgress *)v2 setCancellable:1];
    id v7 = 0;
    objc_initWeak(&v7, self);
    id to = 0;
    objc_moveWeak(&to, &v7);
    v4 = malloc_type_malloc(0x28uLL, 0x10E0040799C3B1DuLL);
    *(void *)v4 = MEMORY[0x1E4F14398];
    *((void *)v4 + 1) = 50331650;
    *((void *)v4 + 2) = WTF::BlockPtr<void ()(void)>::fromCallable<-[WKDownload progress]::$_8>(-[WKDownload progress]::$_8)::{lambda(void *)#1}::__invoke;
    *((void *)v4 + 3) = &WTF::BlockPtr<void ()(void)>::fromCallable<-[WKDownload progress]::$_8>(-[WKDownload progress]::$_8)::descriptor;
    *((void *)v4 + 4) = 0;
    objc_moveWeak((id *)v4 + 4, &to);
    objc_destroyWeak(&to);
    [(NSProgress *)v2 setCancellationHandler:v4];
    _Block_release(v4);
    objc_destroyWeak(&v7);
    if (v2) {
      CFRetain(v2);
    }
    uint64_t v5 = *(const void **)&self->_anon_38[288];
    *(void *)&self->_anon_38[288] = v2;
    if (v5) {
      CFRelease(v5);
    }
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainRunLoop(v3, (objc_object *)self) & 1) == 0)
  {
    (**(void (***)(void))self->_download.data.__lx)();
    v4.receiver = self;
    v4.super_class = (Class)WKDownload;
    [(WKDownload *)&v4 dealloc];
  }
}

- (Object)_apiObject
{
  return (Object *)&self->_download;
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((void *)self + 44) = 0;
  return self;
}

- (void)progress
{
  id v3 = 0;
  objc_moveWeak(&v3, (id *)(a1 + 32));
  uint64_t v1 = WTF::fastMalloc((WTF *)0x10);
  *(void *)uint64_t v1 = &unk_1EE9C2B10;
  *(void *)(v1 + 8) = 0;
  objc_moveWeak((id *)(v1 + 8), &v3);
  uint64_t v4 = v1;
  WTF::ensureOnMainRunLoop();
  uint64_t v2 = v4;
  uint64_t v4 = 0;
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  objc_destroyWeak(&v3);
}

- (uint64_t)progress
{
  id Weak = objc_loadWeak((id *)(a1 + 8));

  return [Weak cancel:0];
}

- (uint64_t)cancel:(uint64_t)a1
{
  uint64_t result = *(void *)(a1 + 8);
  if (result)
  {
    if (a2) {
      a2 = *(void *)(a2 + 8);
    }
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  }
  return result;
}

- (uint64_t)cancel:(const void *)a1
{
  *a1 = &unk_1EE9C2C50;
  _Block_release(a1[1]);

  return WTF::fastFree((WTF *)a1, v2);
}

@end