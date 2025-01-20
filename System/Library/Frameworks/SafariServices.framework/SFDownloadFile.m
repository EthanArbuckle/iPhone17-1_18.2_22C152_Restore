@interface SFDownloadFile
- (NSData)bookmarkData;
- (NSOperationQueue)presentedItemOperationQueue;
- (NSURL)URL;
- (NSURL)presentedItemURL;
- (SFDownloadFile)initWithBookmarkData:(id)a3;
- (SFDownloadFile)initWithURL:(id)a3;
- (SFDownloadFile)initWithURL:(id)a3 bookmarkData:(id)a4;
- (SFDownloadFileDelegate)delegate;
- (void)_resumeWithCurrentURL:(id)a3 previousURL:(id)a4;
- (void)_startResuming;
- (void)_suspend;
- (void)accommodatePresentedItemDeletionWithCompletionHandler:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)presentedItemDidChange;
- (void)presentedItemDidMoveToURL:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation SFDownloadFile

- (SFDownloadFile)initWithURL:(id)a3
{
  return [(SFDownloadFile *)self initWithURL:a3 bookmarkData:0];
}

- (SFDownloadFile)initWithBookmarkData:(id)a3
{
  return [(SFDownloadFile *)self initWithURL:0 bookmarkData:a3];
}

- (SFDownloadFile)initWithURL:(id)a3 bookmarkData:(id)a4
{
  uint64_t v6 = (uint64_t)a3;
  unint64_t v7 = (unint64_t)a4;
  if (!(v6 | v7))
  {
    v8 = 0;
    uint64_t v6 = 0;
    goto LABEL_6;
  }
  v8 = (void *)v7;
  if (!v6)
  {
    LOBYTE(location) = 0;
    id v29 = 0;
    uint64_t v6 = [objc_alloc(MEMORY[0x1E4F1CB10]) initByResolvingBookmarkData:v7 options:0 relativeToURL:0 bookmarkDataIsStale:&location error:&v29];
    id v11 = v29;
    if (v11 || (_BYTE)location)
    {
      v15 = WBS_LOG_CHANNEL_PREFIXDownloads();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[SFDownloadFile initWithURL:bookmarkData:](v15, v11);
      }
      [(id)v6 stopAccessingSecurityScopedResource];

      goto LABEL_6;
    }
    getpid();
    uint64_t v6 = (uint64_t) (id) v6;
    uint64_t v23 = [(id)v6 fileSystemRepresentation];
    if (sandbox_check()) {
      LOBYTE(v9) = objc_msgSend((id)v6, "startAccessingSecurityScopedResource", v23);
    }
    else {
      LOBYTE(v9) = 1;
    }
    goto LABEL_20;
  }
  if (v7)
  {
    LOBYTE(v9) = 0;
    goto LABEL_20;
  }
  int v9 = [(id)v6 startAccessingSecurityScopedResource];
  id v28 = 0;
  v8 = [(id)v6 bookmarkDataWithOptions:0 includingResourceValuesForKeys:0 relativeToURL:0 error:&v28];
  id v12 = v28;
  if (v12)
  {
    v13 = v12;
    v14 = WBS_LOG_CHANNEL_PREFIXDownloads();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      -[SFDownloadFile initWithURL:bookmarkData:](v14, v13);
      if (!v9) {
        goto LABEL_15;
      }
    }
    else if (!v9)
    {
LABEL_15:

      goto LABEL_6;
    }
    [(id)v6 stopAccessingSecurityScopedResource];
    goto LABEL_15;
  }
LABEL_20:
  v27.receiver = self;
  v27.super_class = (Class)SFDownloadFile;
  self = [(SFDownloadFile *)&v27 init];
  if (self)
  {
    objc_initWeak(&location, self);
    objc_storeStrong((id *)&self->_URL, (id)v6);
    objc_storeStrong((id *)&self->_bookmarkData, v8);
    self->_usingSecurityScopedURL = v9;
    objc_msgSend(NSString, "stringWithFormat:", @"SFDownloadFile.%p", self);
    id v16 = objc_claimAutoreleasedReturnValue();
    v17 = (const char *)[v16 UTF8String];
    v18 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v19 = dispatch_queue_attr_make_with_qos_class(v18, QOS_CLASS_USER_INITIATED, 0);
    v20 = (OS_dispatch_queue *)dispatch_queue_create(v17, v19);
    queue = self->_queue;
    self->_queue = v20;

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __43__SFDownloadFile_initWithURL_bookmarkData___block_invoke;
    block[3] = &unk_1E5C725B8;
    objc_copyWeak(&v25, &location);
    dispatch_async(MEMORY[0x1E4F14428], block);
    self = self;
    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
    v10 = self;
    goto LABEL_22;
  }
LABEL_6:
  v10 = 0;
LABEL_22:

  return v10;
}

void __43__SFDownloadFile_initWithURL_bookmarkData___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    v2 = [MEMORY[0x1E4FB1438] sharedApplication];
    uint64_t v3 = [v2 applicationState];

    if (v3 == 2) {
      v5[10] = 1;
    }
    else {
      [MEMORY[0x1E4F28CA0] addFilePresenter:v5];
    }
    v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 addObserver:v5 selector:sel__suspend name:*MEMORY[0x1E4FB2640] object:0];
    [v4 addObserver:v5 selector:sel__startResuming name:*MEMORY[0x1E4FB2730] object:0];

    WeakRetained = v5;
  }
}

- (void)dealloc
{
  [(SFDownloadFile *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SFDownloadFile;
  [(SFDownloadFile *)&v3 dealloc];
}

- (void)invalidate
{
  if (!self->_invalidated)
  {
    if (!self->_suspended) {
      [MEMORY[0x1E4F28CA0] removeFilePresenter:self];
    }
    objc_super v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 removeObserver:self];

    self->_invalidated = 1;
    if (self->_usingSecurityScopedURL)
    {
      URL = self->_URL;
      [(NSURL *)URL stopAccessingSecurityScopedResource];
    }
  }
}

- (void)_suspend
{
  if (!self->_invalidated)
  {
    if (self->_hasPendingResume)
    {
      self->_hasPendingResume = 0;
    }
    else
    {
      self->_suspended = 1;
      v2 = (void *)MEMORY[0x1E4F28CA0];
      objc_super v3 = self;
      [v2 removeFilePresenter:v3];
    }
  }
}

- (void)_startResuming
{
  if (!self->_invalidated && !self->_hasPendingResume)
  {
    self->_hasPendingResume = 1;
    objc_super v3 = self->_bookmarkData;
    v4 = self->_URL;
    objc_initWeak(&location, self);
    queue = self->_queue;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __32__SFDownloadFile__startResuming__block_invoke;
    v8[3] = &unk_1E5C77DD0;
    int v9 = v3;
    v10 = v4;
    uint64_t v6 = v4;
    unint64_t v7 = v3;
    objc_copyWeak(&v11, &location);
    dispatch_async(queue, v8);
    objc_destroyWeak(&v11);

    objc_destroyWeak(&location);
  }
}

void __32__SFDownloadFile__startResuming__block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F1CB10]);
  uint64_t v3 = *(void *)(a1 + 32);
  id v15 = 0;
  v4 = (void *)[v2 initByResolvingBookmarkData:v3 options:0 relativeToURL:0 bookmarkDataIsStale:0 error:&v15];
  id v5 = v15;
  if (v5)
  {
    uint64_t v6 = WBS_LOG_CHANNEL_PREFIXDownloads();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 40);
      v8 = v6;
      int v9 = objc_msgSend(v5, "safari_privacyPreservingDescription");
      *(_DWORD *)buf = 138740227;
      uint64_t v17 = v7;
      __int16 v18 = 2114;
      v19 = v9;
      _os_log_impl(&dword_1A690B000, v8, OS_LOG_TYPE_DEFAULT, "Could not resolve bookmark previously at %{sensitive}@; %{public}@",
        buf,
        0x16u);
    }
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __32__SFDownloadFile__startResuming__block_invoke_13;
  v11[3] = &unk_1E5C72808;
  objc_copyWeak(&v14, (id *)(a1 + 48));
  id v12 = v4;
  id v13 = *(id *)(a1 + 40);
  id v10 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v11);

  objc_destroyWeak(&v14);
}

void __32__SFDownloadFile__startResuming__block_invoke_13(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _resumeWithCurrentURL:*(void *)(a1 + 32) previousURL:*(void *)(a1 + 40)];
    id WeakRetained = v3;
  }
}

- (void)_resumeWithCurrentURL:(id)a3 previousURL:(id)a4
{
  id v10 = a3;
  id v7 = a4;
  if (!self->_invalidated && self->_hasPendingResume)
  {
    *(_WORD *)&self->_suspended = 0;
    objc_storeStrong((id *)&self->_URL, a3);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    URL = self->_URL;
    if (URL)
    {
      if (([(NSURL *)URL isEqual:v7] & 1) == 0) {
        [WeakRetained downloadFileDidChangeURL:self];
      }
    }
    else
    {
      [WeakRetained downloadFileWillBeDeleted:self];
    }
    if (!self->_invalidated) {
      [MEMORY[0x1E4F28CA0] addFilePresenter:self];
    }
  }
}

- (NSURL)presentedItemURL
{
  return self->_URL;
}

- (NSOperationQueue)presentedItemOperationQueue
{
  return (NSOperationQueue *)[MEMORY[0x1E4F28F08] mainQueue];
}

- (void)presentedItemDidMoveToURL:(id)a3
{
  objc_storeStrong((id *)&self->_URL, a3);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained downloadFileDidChangeURL:self];
}

- (void)presentedItemDidChange
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained downloadFileContentsDidChange:self];
}

- (void)accommodatePresentedItemDeletionWithCompletionHandler:(id)a3
{
  p_delegate = &self->_delegate;
  uint64_t v6 = (void (**)(id, void))a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained downloadFileWillBeDeleted:self];

  v6[2](v6, 0);
}

- (SFDownloadFileDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SFDownloadFileDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSURL)URL
{
  return self->_URL;
}

- (NSData)bookmarkData
{
  return self->_bookmarkData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bookmarkData, 0);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)initWithURL:(void *)a1 bookmarkData:(void *)a2 .cold.1(void *a1, void *a2)
{
  id v3 = a1;
  v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_0_0(&dword_1A690B000, v5, v6, "Failed to create bookmark data for download file: %{public}@", v7, v8, v9, v10, 2u);
}

- (void)initWithURL:(void *)a1 bookmarkData:(void *)a2 .cold.2(void *a1, void *a2)
{
  id v3 = a1;
  v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_0_0(&dword_1A690B000, v5, v6, "Failed to resolve download file bookmark data: %{public}@", v7, v8, v9, v10, 2u);
}

@end