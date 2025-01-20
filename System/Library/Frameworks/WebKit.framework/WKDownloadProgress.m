@interface WKDownloadProgress
- (WKDownloadProgress)initWithDownloadTask:(id)a3 download:(void *)a4 URL:(id)a5 sandboxExtension:()RefPtr<WebKit:()WTF:(WTF::DefaultRefDerefTraits<WebKit::SandboxExtension>>)a6 :RawPtrTraits<WebKit::SandboxExtension> :SandboxExtension;
- (id).cxx_construct;
- (uint64_t)initWithDownloadTask:download:URL:sandboxExtension:;
- (void)_updateProgressExtendedAttributeOnProgressFile;
- (void)dealloc;
- (void)initWithDownloadTask:download:URL:sandboxExtension:;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)performCancel;
- (void)publish;
- (void)unpublish;
@end

@implementation WKDownloadProgress

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
  void *v5 = &unk_1EEA0F698;
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

- (WKDownloadProgress)initWithDownloadTask:(id)a3 download:(void *)a4 URL:(id)a5 sandboxExtension:()RefPtr<WebKit:()WTF:(WTF::DefaultRefDerefTraits<WebKit::SandboxExtension>>)a6 :RawPtrTraits<WebKit::SandboxExtension> :SandboxExtension
{
  v10 = [(WKDownloadProgress *)self initWithParent:0 userInfo:0];
  if (v10)
  {
    if (a3) {
      CFRetain(a3);
    }
    m_ptr = v10->m_task.m_ptr;
    v10->m_task.m_ptr = a3;
    if (m_ptr) {
      CFRelease(m_ptr);
    }
    WTF::WeakPtrFactory<WebPushD::PushServiceConnection,WTF::DefaultWeakPtrImpl>::initializeIfNeeded((unsigned int *)a4 + 2, (uint64_t)a4);
    v13 = (atomic_uint *)*((void *)a4 + 1);
    if (v13) {
      atomic_fetch_add(v13, 1u);
    }
    v14 = (unsigned int *)v10->m_download.m_impl.m_ptr;
    v10->m_download.m_impl.m_ptr = (DefaultWeakPtrImpl *)v13;
    if (v14 && atomic_fetch_add((atomic_uint *volatile)v14, 0xFFFFFFFF) == 1)
    {
      atomic_store(1u, v14);
      WTF::fastFree((WTF *)v14, v12);
    }
    [a3 addObserver:v10 forKeyPath:@"countOfBytesExpectedToReceive" options:5 context:off_1EC2B21B8];
    [a3 addObserver:v10 forKeyPath:@"countOfBytesReceived" options:5 context:off_1EC2B21C0];
    [(WKDownloadProgress *)v10 setKind:*MEMORY[0x1E4F28898]];
    [(WKDownloadProgress *)v10 setFileOperationKind:*MEMORY[0x1E4F28858]];
    [(WKDownloadProgress *)v10 setFileURL:a5];
    v15 = *(SandboxExtension **)a6.m_ptr;
    if (*(void *)a6.m_ptr) {
      ++*(_DWORD *)v15;
    }
    v16 = (const char ***)v10->m_sandboxExtension.m_ptr;
    v10->m_sandboxExtension.m_ptr = v15;
    if (v16) {
      WTF::RefCounted<WebKit::SandboxExtension>::deref(v16);
    }
    [(WKDownloadProgress *)v10 setCancellable:1];
    id v19 = 0;
    objc_initWeak(&v19, v10);
    id to = 0;
    objc_moveWeak(&to, &v19);
    v17 = malloc_type_malloc(0x28uLL, 0x10E0040799C3B1DuLL);
    *(void *)v17 = MEMORY[0x1E4F14398];
    *((void *)v17 + 1) = 50331650;
    *((void *)v17 + 2) = WTF::BlockPtr<void ()(void)>::fromCallable<-[WKDownloadProgress initWithDownloadTask:download:URL:sandboxExtension:]::$_8>(-[WKDownloadProgress initWithDownloadTask:download:URL:sandboxExtension:]::$_8)::{lambda(void *)#1}::__invoke;
    *((void *)v17 + 3) = &WTF::BlockPtr<void ()(void)>::fromCallable<-[WKDownloadProgress initWithDownloadTask:download:URL:sandboxExtension:]::$_8>(-[WKDownloadProgress initWithDownloadTask:download:URL:sandboxExtension:]::$_8)::descriptor;
    *((void *)v17 + 4) = 0;
    objc_moveWeak((id *)v17 + 4, &to);
    objc_destroyWeak(&to);
    [(WKDownloadProgress *)v10 setCancellationHandler:v17];
    _Block_release(v17);
    objc_destroyWeak(&v19);
  }
  return v10;
}

- (void)publish
{
  m_ptr = self->m_sandboxExtension.m_ptr;
  if (m_ptr)
  {
    uint64_t v4 = *((void *)m_ptr + 2);
    *((void *)m_ptr + 2) = v4 + 1;
    if (!v4) {
      WebKit::SandboxExtensionImpl::consume(*((WebKit::SandboxExtensionImpl **)m_ptr + 1));
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)WKDownloadProgress;
  [(WKDownloadProgress *)&v5 publish];
}

- (void)unpublish
{
  [(WKDownloadProgress *)self _updateProgressExtendedAttributeOnProgressFile];
  v5.receiver = self;
  v5.super_class = (Class)WKDownloadProgress;
  [(WKDownloadProgress *)&v5 unpublish];
  m_ptr = self->m_sandboxExtension.m_ptr;
  if (m_ptr)
  {
    uint64_t v4 = *((void *)m_ptr + 2) - 1;
    *((void *)m_ptr + 2) = v4;
    if (v4)
    {
      self->m_sandboxExtension.m_ptr = 0;
    }
    else
    {
      *(void *)(*((void *)m_ptr + 1) + 8) = 0;
      sandbox_extension_release();
      m_ptr = self->m_sandboxExtension.m_ptr;
      self->m_sandboxExtension.m_ptr = 0;
      if (!m_ptr) {
        return;
      }
    }
    WTF::RefCounted<WebKit::SandboxExtension>::deref((const char ***)m_ptr);
  }
}

- (void)_updateProgressExtendedAttributeOnProgressFile
{
  uint64_t v3 = [(WKDownloadProgress *)self totalUnitCount];
  uint64_t v4 = [(WKDownloadProgress *)self completedUnitCount];
  if (v3 < 1) {
    double v5 = -1.0;
  }
  else {
    double v5 = (float)((float)v4 / (float)v3);
  }
  uint64_t v6 = objc_msgSend([NSString alloc], "initWithFormat:", @"%.3f", *(void *)&v5);
  setxattr((const char *)objc_msgSend((id)-[WKDownloadProgress fileURL](self, "fileURL"), "fileSystemRepresentation"), "com.apple.progress.fractionCompleted", (const void *)objc_msgSend(v6, "UTF8String"), objc_msgSend(v6, "lengthOfBytesUsingEncoding:", 4), 0, 0);
  if (v6)
  {
    CFRelease(v6);
  }
}

- (void)dealloc
{
  [self->m_task.m_ptr removeObserver:self forKeyPath:@"countOfBytesExpectedToReceive"];
  [self->m_task.m_ptr removeObserver:self forKeyPath:@"countOfBytesReceived"];
  v3.receiver = self;
  v3.super_class = (Class)WKDownloadProgress;
  [(WKDownloadProgress *)&v3 dealloc];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (off_1EC2B21B8 == a6)
  {
    v7 = objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E4F284C8], a4);
    v8 = v7;
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
    [(WKDownloadProgress *)self setTotalUnitCount:v10];
  }
  else
  {
    if (off_1EC2B21C0 != a6)
    {
      v12.receiver = self;
      v12.super_class = (Class)WKDownloadProgress;
      -[WKDownloadProgress observeValueForKeyPath:ofObject:change:context:](&v12, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
      return;
    }
    v11 = objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E4F284C8], a4);
    v8 = v11;
    if (v11) {
      CFRetain(v11);
    }
    -[WKDownloadProgress setCompletedUnitCount:](self, "setCompletedUnitCount:", [v8 longLongValue]);
  }
  if (v8)
  {
    CFRelease(v8);
  }
}

- (void).cxx_destruct
{
  m_ptr = (const char ***)self->m_sandboxExtension.m_ptr;
  self->m_sandboxExtension.m_ptr = 0;
  if (m_ptr) {
    WTF::RefCounted<WebKit::SandboxExtension>::deref(m_ptr);
  }
  uint64_t v4 = (unsigned int *)self->m_download.m_impl.m_ptr;
  self->m_download.m_impl.m_ptr = 0;
  if (v4 && atomic_fetch_add((atomic_uint *volatile)v4, 0xFFFFFFFF) == 1)
  {
    atomic_store(1u, v4);
    WTF::fastFree((WTF *)v4, (void *)a2);
  }
  double v5 = self->m_task.m_ptr;
  self->m_task.m_ptr = 0;
  if (v5)
  {
    CFRelease(v5);
  }
}

- (id).cxx_construct
{
  *((void *)self + 15) = 0;
  *((void *)self + 16) = 0;
  *((void *)self + 17) = 0;
  return self;
}

- (void)initWithDownloadTask:download:URL:sandboxExtension:
{
  id v3 = 0;
  objc_moveWeak(&v3, (id *)(a1 + 32));
  uint64_t v1 = WTF::fastMalloc((WTF *)0x10);
  *(void *)uint64_t v1 = &unk_1EEA0F648;
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

- (uint64_t)initWithDownloadTask:download:URL:sandboxExtension:
{
  id Weak = objc_loadWeak((id *)(a1 + 8));

  return [Weak performCancel];
}

@end