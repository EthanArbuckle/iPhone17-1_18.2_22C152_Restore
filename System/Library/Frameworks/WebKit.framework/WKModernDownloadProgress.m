@interface WKModernDownloadProgress
- (WKModernDownloadProgress)initWithDownloadTask:(id)a3 download:(void *)a4 URL:(id)a5 useDownloadPlaceholder:(BOOL)a6 resumePlaceholderURL:(id)a7 liveActivityAccessToken:(id)a8;
- (id).cxx_construct;
- (uint64_t)begin;
- (uint64_t)initWithDownloadTask:download:URL:useDownloadPlaceholder:resumePlaceholderURL:liveActivityAccessToken:;
- (unsigned)begin;
- (unsigned)initWithDownloadTask:download:URL:useDownloadPlaceholder:resumePlaceholderURL:liveActivityAccessToken:;
- (void)begin;
- (void)dealloc;
- (void)didFinish:(id)a3;
- (void)initWithDownloadTask:download:URL:useDownloadPlaceholder:resumePlaceholderURL:liveActivityAccessToken:;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)performCancel;
- (void)resume:(id)a3;
- (void)startUpdatingDownloadProgress;
@end

@implementation WKModernDownloadProgress

- (void)performCancel
{
  m_ptr = self->m_download.m_impl.m_ptr;
  if (!m_ptr)
  {
    self->m_download.m_impl.m_ptr = 0;
    return;
  }
  uint64_t v4 = *((void *)m_ptr + 1);
  if (!v4)
  {
    self->m_download.m_impl.m_ptr = 0;
LABEL_9:
    if (atomic_fetch_add((atomic_uint *volatile)m_ptr, 0xFFFFFFFF) == 1)
    {
      atomic_store(1u, (unsigned int *)m_ptr);
      WTF::fastFree((WTF *)m_ptr, (void *)a2);
    }
    return;
  }
  v5 = (void *)WTF::fastMalloc((WTF *)0x10);
  void *v5 = &unk_1EEA0F670;
  v7 = v5;
  WebKit::Download::cancel(v4, (uint64_t *)&v7, 0);
  uint64_t v6 = (uint64_t)v7;
  v7 = 0;
  if (v6) {
    (*(void (**)(uint64_t))(*(void *)v6 + 8))(v6);
  }
  m_ptr = self->m_download.m_impl.m_ptr;
  self->m_download.m_impl.m_ptr = 0;
  if (m_ptr) {
    goto LABEL_9;
  }
}

- (void)begin
{
  uint64_t v1 = *(void *)(a1 + 8);
  if (v1)
  {
    v2 = *(WebKit::Download **)(v1 + 8);
    if (v2) {
      WebKit::Download::setPlaceholderURL(v2, *(void **)(a1 + 16), 0);
    }
  }
}

- (void)resume:(id)a3
{
  if (_MergedGlobals_6())
  {
    m_ptr = self->m_downloadMonitor.m_ptr;
    [m_ptr resumeMonitoring:a3 completionHandler:&__block_literal_global_41];
  }
  else
  {
    char v6 = objc_opt_respondsToSelector();
    v7 = self->m_downloadProgress.m_ptr;
    if (v6)
    {
      [v7 resumeWithCompletionHandler:a3 completionHandler:&__block_literal_global_10];
    }
    else if (objc_opt_respondsToSelector())
    {
      uint64_t v8 = 0;
      [self->m_downloadProgress.m_ptr resume:a3 error:&v8];
    }
  }
}

- (WKModernDownloadProgress)initWithDownloadTask:(id)a3 download:(void *)a4 URL:(id)a5 useDownloadPlaceholder:(BOOL)a6 resumePlaceholderURL:(id)a7 liveActivityAccessToken:(id)a8
{
  BOOL v10 = a6;
  v14 = [(WKModernDownloadProgress *)self init];
  if (v14)
  {
    if (a3) {
      CFRetain(a3);
    }
    m_ptr = v14->m_task.m_ptr;
    v14->m_task.m_ptr = a3;
    if (m_ptr) {
      CFRelease(m_ptr);
    }
    WTF::WeakPtrFactory<WebPushD::PushServiceConnection,WTF::DefaultWeakPtrImpl>::initializeIfNeeded((unsigned int *)a4 + 2, (uint64_t)a4);
    v17 = (atomic_uint *)*((void *)a4 + 1);
    if (v17) {
      atomic_fetch_add(v17, 1u);
    }
    v18 = (unsigned int *)v14->m_download.m_impl.m_ptr;
    v14->m_download.m_impl.m_ptr = (DefaultWeakPtrImpl *)v17;
    if (v18 && atomic_fetch_add((atomic_uint *volatile)v18, 0xFFFFFFFF) == 1)
    {
      atomic_store(1u, v18);
      WTF::fastFree((WTF *)v18, v16);
    }
    v14->m_useDownloadPlaceholder = v10;
    v14->m_fileCreatedHandlerCalled = 0;
    [(WKModernDownloadProgress *)v14 setKind:*MEMORY[0x1E4F28898]];
    [(WKModernDownloadProgress *)v14 setFileOperationKind:*MEMORY[0x1E4F28858]];
    if (!v14->m_useDownloadPlaceholder) {
      [(WKModernDownloadProgress *)v14 setFileURL:a5];
    }
    [(WKModernDownloadProgress *)v14 setCancellable:1];
    id location = 0;
    objc_initWeak(&location, v14);
    id to = 0;
    objc_moveWeak(&to, &location);
    v19 = malloc_type_malloc(0x28uLL, 0x10E0040799C3B1DuLL);
    *(void *)v19 = MEMORY[0x1E4F14398];
    *((void *)v19 + 1) = 50331650;
    *((void *)v19 + 2) = WTF::BlockPtr<void ()(void)>::fromCallable<-[WKModernDownloadProgress initWithDownloadTask:download:URL:useDownloadPlaceholder:resumePlaceholderURL:liveActivityAccessToken:]::$_3>(-[WKModernDownloadProgress initWithDownloadTask:download:URL:useDownloadPlaceholder:resumePlaceholderURL:liveActivityAccessToken:]::$_3)::{lambda(void *)#1}::__invoke;
    *((void *)v19 + 3) = &WTF::BlockPtr<void ()(void)>::fromCallable<-[WKModernDownloadProgress initWithDownloadTask:download:URL:useDownloadPlaceholder:resumePlaceholderURL:liveActivityAccessToken:]::$_3>(-[WKModernDownloadProgress initWithDownloadTask:download:URL:useDownloadPlaceholder:resumePlaceholderURL:liveActivityAccessToken:]::$_3)::descriptor;
    *((void *)v19 + 4) = 0;
    objc_moveWeak((id *)v19 + 4, &to);
    objc_destroyWeak(&to);
    [(WKModernDownloadProgress *)v14 setCancellationHandler:v19];
    id v54 = a7;
    _Block_release(v19);
    objc_destroyWeak(&location);
    v20 = (atomic_uint *)v14->m_download.m_impl.m_ptr;
    if (v20) {
      atomic_fetch_add(v20, 1u);
    }
    id location = v20;
    id v57 = 0;
    objc_initWeak(&v57, v14);
    id v21 = location;
    id location = 0;
    id to = v21;
    id v59 = 0;
    objc_moveWeak(&v59, &v57);
    v22 = malloc_type_malloc(0x30uLL, 0x10E0040331879E5uLL);
    *(void *)v22 = MEMORY[0x1E4F14398];
    *((void *)v22 + 1) = 50331650;
    *((void *)v22 + 2) = WTF::BlockPtr<void ()(NSURL *)>::fromCallable<-[WKModernDownloadProgress initWithDownloadTask:download:URL:useDownloadPlaceholder:resumePlaceholderURL:liveActivityAccessToken:]::$_4>(-[WKModernDownloadProgress initWithDownloadTask:download:URL:useDownloadPlaceholder:resumePlaceholderURL:liveActivityAccessToken:]::$_4)::{lambda(void *,NSURL *)#1}::__invoke;
    *((void *)v22 + 3) = &WTF::BlockPtr<void ()(NSURL *)>::fromCallable<-[WKModernDownloadProgress initWithDownloadTask:download:URL:useDownloadPlaceholder:resumePlaceholderURL:liveActivityAccessToken:]::$_4>(-[WKModernDownloadProgress initWithDownloadTask:download:URL:useDownloadPlaceholder:resumePlaceholderURL:liveActivityAccessToken:]::$_4)::descriptor;
    id v23 = to;
    id to = 0;
    *((void *)v22 + 4) = v23;
    *((void *)v22 + 5) = 0;
    objc_moveWeak((id *)v22 + 5, &v59);
    objc_destroyWeak(&v59);
    v25 = (unsigned int *)to;
    id to = 0;
    if (v25 && atomic_fetch_add((atomic_uint *volatile)v25, 0xFFFFFFFF) == 1)
    {
      atomic_store(1u, v25);
      WTF::fastFree((WTF *)v25, v24);
    }
    objc_destroyWeak(&v57);
    v27 = (unsigned int *)location;
    id location = 0;
    if (v27 && atomic_fetch_add((atomic_uint *volatile)v27, 0xFFFFFFFF) == 1)
    {
      atomic_store(1u, v27);
      WTF::fastFree((WTF *)v27, v26);
    }
    v28 = (atomic_uint *)v14->m_download.m_impl.m_ptr;
    if (v28) {
      atomic_fetch_add(v28, 1u);
    }
    id location = v28;
    id v57 = 0;
    objc_initWeak(&v57, v14);
    id v29 = location;
    id location = 0;
    id to = v29;
    id v59 = 0;
    objc_moveWeak(&v59, &v57);
    v30 = malloc_type_malloc(0x30uLL, 0x10E0040331879E5uLL);
    *(void *)v30 = MEMORY[0x1E4F14398];
    *((void *)v30 + 1) = 50331650;
    *((void *)v30 + 2) = WTF::BlockPtr<void ()(BEURLWithBookmark *)>::fromCallable<-[WKModernDownloadProgress initWithDownloadTask:download:URL:useDownloadPlaceholder:resumePlaceholderURL:liveActivityAccessToken:]::$_5>(-[WKModernDownloadProgress initWithDownloadTask:download:URL:useDownloadPlaceholder:resumePlaceholderURL:liveActivityAccessToken:]::$_5)::{lambda(void *,BEURLWithBookmark *)#1}::__invoke;
    *((void *)v30 + 3) = &WTF::BlockPtr<void ()(BEURLWithBookmark *)>::fromCallable<-[WKModernDownloadProgress initWithDownloadTask:download:URL:useDownloadPlaceholder:resumePlaceholderURL:liveActivityAccessToken:]::$_5>(-[WKModernDownloadProgress initWithDownloadTask:download:URL:useDownloadPlaceholder:resumePlaceholderURL:liveActivityAccessToken:]::$_5)::descriptor;
    id v31 = to;
    id to = 0;
    *((void *)v30 + 4) = v31;
    *((void *)v30 + 5) = 0;
    objc_moveWeak((id *)v30 + 5, &v59);
    objc_destroyWeak(&v59);
    v33 = (unsigned int *)to;
    id to = 0;
    if (v33 && atomic_fetch_add((atomic_uint *volatile)v33, 0xFFFFFFFF) == 1)
    {
      atomic_store(1u, v33);
      WTF::fastFree((WTF *)v33, v32);
    }
    objc_destroyWeak(&v57);
    v35 = (unsigned int *)location;
    id location = 0;
    if (v35 && atomic_fetch_add((atomic_uint *volatile)v35, 0xFFFFFFFF) == 1)
    {
      atomic_store(1u, v35);
      WTF::fastFree((WTF *)v35, v34);
    }
    v36 = (atomic_uint *)v14->m_download.m_impl.m_ptr;
    if (v36) {
      atomic_fetch_add(v36, 1u);
    }
    id location = v36;
    id v57 = 0;
    objc_initWeak(&v57, v14);
    id v37 = location;
    id location = 0;
    id to = v37;
    id v59 = 0;
    objc_moveWeak(&v59, &v57);
    v38 = malloc_type_malloc(0x30uLL, 0x10E0040331879E5uLL);
    *(void *)v38 = MEMORY[0x1E4F14398];
    *((void *)v38 + 1) = 50331650;
    *((void *)v38 + 2) = WTF::BlockPtr<void ()(BEDownloadMonitorLocation *)>::fromCallable<-[WKModernDownloadProgress initWithDownloadTask:download:URL:useDownloadPlaceholder:resumePlaceholderURL:liveActivityAccessToken:]::$_6>(-[WKModernDownloadProgress initWithDownloadTask:download:URL:useDownloadPlaceholder:resumePlaceholderURL:liveActivityAccessToken:]::$_6)::{lambda(void *,BEDownloadMonitorLocation *)#1}::__invoke;
    *((void *)v38 + 3) = &WTF::BlockPtr<void ()(BEDownloadMonitorLocation *)>::fromCallable<-[WKModernDownloadProgress initWithDownloadTask:download:URL:useDownloadPlaceholder:resumePlaceholderURL:liveActivityAccessToken:]::$_6>(-[WKModernDownloadProgress initWithDownloadTask:download:URL:useDownloadPlaceholder:resumePlaceholderURL:liveActivityAccessToken:]::$_6)::descriptor;
    id v39 = to;
    id to = 0;
    *((void *)v38 + 4) = v39;
    *((void *)v38 + 5) = 0;
    objc_moveWeak((id *)v38 + 5, &v59);
    objc_destroyWeak(&v59);
    v41 = (unsigned int *)to;
    id to = 0;
    if (v41 && atomic_fetch_add((atomic_uint *volatile)v41, 0xFFFFFFFF) == 1)
    {
      atomic_store(1u, v41);
      WTF::fastFree((WTF *)v41, v40);
    }
    objc_destroyWeak(&v57);
    v43 = (unsigned int *)location;
    id location = 0;
    if (v43 && atomic_fetch_add((atomic_uint *volatile)v43, 0xFFFFFFFF) == 1)
    {
      atomic_store(1u, v43);
      WTF::fastFree((WTF *)v43, v42);
    }
    if (_MergedGlobals_6())
    {
      v44 = (objc_class *)objc_alloc((Class)_MergedGlobals_6());
      uint64_t v45 = 144;
    }
    else
    {
      v44 = (objc_class *)objc_alloc((Class)off_1EC2B21A8());
      uint64_t v45 = 136;
    }
    v46 = *(Class *)((char *)&v14->super.super.isa + v45);
    *(Class *)((char *)&v14->super.super.isa + v45) = v44;
    if (v46) {
      CFRelease(v46);
    }
    if (_MergedGlobals_6())
    {
      v47 = (const void *)objc_msgSend((id)objc_msgSend(a3, "currentRequest"), "URL");
      v48 = v47;
      if (v47) {
        CFRetain(v47);
      }
      else {
        v48 = (const void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:&stru_1EEA10550];
      }
      [v14->m_downloadMonitor.m_ptr initWithSourceURL:v48 destinationURL:a5 observedProgress:v14 liveActivityAccessToken:a8];
      if (v48) {
        CFRelease(v48);
      }
    }
    else
    {
      char v49 = objc_opt_respondsToSelector();
      v50 = v14->m_downloadProgress.m_ptr;
      if (v49) {
        objc_msgSend(v50, "initWithSourceURL:destinationURL:progress:liveActivityAccessToken:", objc_msgSend((id)objc_msgSend(a3, "currentRequest"), "URL"), a5, v14, a8);
      }
      else {
        objc_msgSend(v50, "initWithSourceURL:destinationURL:progress:", objc_msgSend((id)objc_msgSend(a3, "currentRequest"), "URL"), a5, v14);
      }
    }
    if (v10)
    {
      if (_MergedGlobals_6())
      {
        [v14->m_downloadMonitor.m_ptr useDownloadsFolderWithPlaceholderType:0 finalFileCreatedHandler:v38];
      }
      else if (off_1EC2B21B0())
      {
        [v14->m_downloadProgress.m_ptr setUsePlaceholder:1 type:0 fileCreatedHandler:v30];
      }
      else
      {
        uint64_t v52 = [v14->m_downloadProgress.m_ptr methodSignatureForSelector:sel_setUsePlaceholder_type_fileCreatedHandler_];
        v53 = (void *)[MEMORY[0x1E4F1CA18] invocationWithMethodSignature:v52];
        char v55 = 1;
        id to = 0;
        id location = v22;
        [v53 setArgument:&v55 atIndex:2];
        [v53 setArgument:&to atIndex:3];
        [v53 setArgument:&location atIndex:4];
        [v53 setSelector:sel_setUsePlaceholder_type_fileCreatedHandler_];
        [v53 invokeWithTarget:v14->m_downloadProgress.m_ptr];
      }
    }
    else
    {
      [v14->m_downloadProgress.m_ptr setUsePlaceholder:0 type:0 fileCreatedHandler:0];
    }
    if (v54) {
      -[WKModernDownloadProgress resume:](v14, "resume:");
    }
    else {
      [(WKModernDownloadProgress *)v14 begin];
    }
    _Block_release(v38);
    _Block_release(v30);
    _Block_release(v22);
  }
  return v14;
}

- (void)startUpdatingDownloadProgress
{
  [self->m_task.m_ptr addObserver:self forKeyPath:@"countOfBytesExpectedToReceive" options:5 context:off_1EC2B21B8];
  m_ptr = self->m_task.m_ptr;
  uint64_t v4 = off_1EC2B21C0;

  [m_ptr addObserver:self forKeyPath:@"countOfBytesReceived" options:5 context:v4];
}

- (void)didFinish:(id)a3
{
  uint64_t v5 = [(WKModernDownloadProgress *)self completedUnitCount];
  if (v5 != [(WKModernDownloadProgress *)self totalUnitCount]) {
    [(WKModernDownloadProgress *)self setTotalUnitCount:[(WKModernDownloadProgress *)self completedUnitCount]];
  }
  if (self->m_useDownloadPlaceholder && !self->m_fileCreatedHandlerCalled)
  {
    v7 = _Block_copy(a3);
    _Block_release(self->m_didFinishCompletionHandler.m_block);
    self->m_didFinishCompletionHandler.m_block = v7;
    _Block_release(0);
  }
  else
  {
    char v6 = (void (*)(id))*((void *)a3 + 2);
    v6(a3);
  }
}

- (void)dealloc
{
  [self->m_task.m_ptr removeObserver:self forKeyPath:@"countOfBytesExpectedToReceive"];
  [self->m_task.m_ptr removeObserver:self forKeyPath:@"countOfBytesReceived"];
  v3.receiver = self;
  v3.super_class = (Class)WKModernDownloadProgress;
  [(WKModernDownloadProgress *)&v3 dealloc];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (off_1EC2B21B8 == a6)
  {
    v7 = objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E4F284C8], a4);
    uint64_t v8 = v7;
    if (v7) {
      CFRetain(v7);
    }
    uint64_t v9 = [v8 longLongValue];
    if (v9 < 1) {
      uint64_t v10 = -1;
    }
    else {
      uint64_t v10 = v9;
    }
    [(WKModernDownloadProgress *)self setTotalUnitCount:v10];
  }
  else
  {
    if (off_1EC2B21C0 != a6)
    {
      v12.receiver = self;
      v12.super_class = (Class)WKModernDownloadProgress;
      -[WKModernDownloadProgress observeValueForKeyPath:ofObject:change:context:](&v12, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
      return;
    }
    v11 = objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E4F284C8], a4);
    uint64_t v8 = v11;
    if (v11) {
      CFRetain(v11);
    }
    -[WKModernDownloadProgress setCompletedUnitCount:](self, "setCompletedUnitCount:", [v8 longLongValue]);
  }
  if (v8)
  {
    CFRelease(v8);
  }
}

- (void).cxx_destruct
{
  _Block_release(self->m_didFinishCompletionHandler.m_block);
  m_ptr = self->m_downloadMonitor.m_ptr;
  self->m_downloadMonitor.m_ptr = 0;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
  uint64_t v5 = self->m_downloadProgress.m_ptr;
  self->m_downloadProgress.m_ptr = 0;
  if (v5) {
    CFRelease(v5);
  }
  char v6 = (unsigned int *)self->m_download.m_impl.m_ptr;
  self->m_download.m_impl.m_ptr = 0;
  if (v6 && atomic_fetch_add((atomic_uint *volatile)v6, 0xFFFFFFFF) == 1)
  {
    atomic_store(1u, v6);
    WTF::fastFree((WTF *)v6, v3);
  }
  v7 = self->m_task.m_ptr;
  self->m_task.m_ptr = 0;
  if (v7)
  {
    CFRelease(v7);
  }
}

- (id).cxx_construct
{
  *((void *)self + 15) = 0;
  *((void *)self + 16) = 0;
  *((void *)self + 17) = 0;
  *((void *)self + 18) = 0;
  *((void *)self + 19) = 0;
  return self;
}

- (unsigned)begin
{
  result = *(unsigned int **)(a1 + 32);
  *(void *)(a1 + 32) = 0;
  if (result)
  {
    if (atomic_fetch_add((atomic_uint *volatile)result, 0xFFFFFFFF) == 1)
    {
      atomic_store(1u, result);
      return (unsigned int *)WTF::fastFree((WTF *)result, a2);
    }
  }
  return result;
}

- (uint64_t)begin
{
  *(void *)this = &unk_1EEA0F4E0;
  objc_super v3 = (const void *)*((void *)this + 2);
  *((void *)this + 2) = 0;
  if (v3) {
    CFRelease(v3);
  }
  uint64_t v4 = (unsigned int *)*((void *)this + 1);
  *((void *)this + 1) = 0;
  if (v4 && atomic_fetch_add((atomic_uint *volatile)v4, 0xFFFFFFFF) == 1)
  {
    atomic_store(1u, v4);
    WTF::fastFree((WTF *)v4, a2);
  }

  return WTF::fastFree(this, a2);
}

- (void)initWithDownloadTask:download:URL:useDownloadPlaceholder:resumePlaceholderURL:liveActivityAccessToken:
{
  uint64_t v1 = *(void *)(a1 + 8);
  if (v1)
  {
    v2 = *(WebKit::Download **)(v1 + 8);
    if (v2)
    {
      WebKit::Download::setFinalURL(v2, (NSURL *)[*(id *)(a1 + 16) url], (NSData *)objc_msgSend(*(id *)(a1 + 16), "bookmarkData"));
      uint64_t v4 = (id *)(a1 + 24);
      id WeakRetained = objc_loadWeakRetained(v4);
      if (WeakRetained)
      {
        CFRelease(WeakRetained);
        char v6 = objc_loadWeakRetained(v4);
        v6[161] = 1;
        CFRelease(v6);
        v7 = objc_loadWeakRetained(v4);
        uint64_t v8 = v7[19];
        CFRelease(v7);
        if (v8)
        {
          uint64_t v9 = objc_loadWeakRetained(v4);
          (*(void (**)(void))(v9[19] + 16))();
          CFRelease(v9);
        }
      }
    }
  }
}

- (uint64_t)initWithDownloadTask:download:URL:useDownloadPlaceholder:resumePlaceholderURL:liveActivityAccessToken:
{
  *(void *)a1 = &unk_1EEA0F600;
  objc_destroyWeak((id *)(a1 + 24));
  objc_super v3 = *(const void **)(a1 + 16);
  *(void *)(a1 + 16) = 0;
  if (v3) {
    CFRelease(v3);
  }
  uint64_t v4 = *(unsigned int **)(a1 + 8);
  *(void *)(a1 + 8) = 0;
  if (v4 && atomic_fetch_add((atomic_uint *volatile)v4, 0xFFFFFFFF) == 1)
  {
    atomic_store(1u, v4);
    WTF::fastFree((WTF *)v4, v2);
  }
  return a1;
}

{
  void *v2;
  const void *v3;
  unsigned int *v4;
  uint64_t vars8;

  *(void *)a1 = &unk_1EEA0F600;
  objc_destroyWeak((id *)(a1 + 24));
  objc_super v3 = *(const void **)(a1 + 16);
  *(void *)(a1 + 16) = 0;
  if (v3) {
    CFRelease(v3);
  }
  uint64_t v4 = *(unsigned int **)(a1 + 8);
  *(void *)(a1 + 8) = 0;
  if (v4 && atomic_fetch_add((atomic_uint *volatile)v4, 0xFFFFFFFF) == 1)
  {
    atomic_store(1u, v4);
    WTF::fastFree((WTF *)v4, v2);
  }

  return WTF::fastFree((WTF *)a1, v2);
}

- (unsigned)initWithDownloadTask:download:URL:useDownloadPlaceholder:resumePlaceholderURL:liveActivityAccessToken:
{
  v12[1] = *(id *)MEMORY[0x1E4F143B8];
  uint64_t v4 = off_1EB358988;
  if (os_log_type_enabled((os_log_t)off_1EB358988, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136642819;
    *(void *)((char *)&buf + 4) = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "url"), "absoluteString"), "UTF8String");
    _os_log_impl(&dword_1985F2000, v4, OS_LOG_TYPE_DEFAULT, "File created handler for url %{sensitive}s", (uint8_t *)&buf, 0xCu);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  *(void *)(a1 + 32) = 0;
  *(void *)&long long buf = v5;
  *((void *)&buf + 1) = a2;
  if (a2) {
    CFRetain(a2);
  }
  v12[0] = 0;
  objc_moveWeak(v12, (id *)(a1 + 40));
  uint64_t v6 = WTF::fastMalloc((WTF *)0x20);
  *(void *)uint64_t v6 = &unk_1EEA0F600;
  *(void *)(v6 + 8) = buf;
  uint64_t v7 = *((void *)&buf + 1);
  long long buf = 0uLL;
  *(void *)(v6 + 16) = v7;
  *(void *)(v6 + 24) = 0;
  objc_moveWeak((id *)(v6 + 24), v12);
  WTF::ensureOnMainRunLoop();
  if (v6) {
    (*(void (**)(uint64_t))(*(void *)v6 + 8))(v6);
  }
  objc_destroyWeak(v12);
  uint64_t v9 = (const void *)*((void *)&buf + 1);
  *((void *)&buf + 1) = 0;
  if (v9) {
    CFRelease(v9);
  }
  result = (unsigned int *)buf;
  *(void *)&long long buf = 0;
  if (result)
  {
    if (atomic_fetch_add((atomic_uint *volatile)result, 0xFFFFFFFF) == 1)
    {
      atomic_store(1u, result);
      return (unsigned int *)WTF::fastFree((WTF *)result, v8);
    }
  }
  return result;
}

@end