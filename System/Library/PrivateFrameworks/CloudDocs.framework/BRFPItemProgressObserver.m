@interface BRFPItemProgressObserver
- (BRFPItemProgressObserver)initWithFPItem:(id)a3 queue:(id)a4;
- (FPItemID)fpItemID;
- (NSNumber)downloadPercentCompleted;
- (NSNumber)uploadPercentCompleted;
- (id)description;
- (id)progressHandler;
- (void)_startObservingProgress:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setProgressHandler:(id)a3;
- (void)start;
- (void)stop;
- (void)updateWithFPItem:(id)a3;
@end

@implementation BRFPItemProgressObserver

- (NSNumber)uploadPercentCompleted
{
  uploadProgress = self->_uploadProgress;
  if (uploadProgress)
  {
    v3 = NSNumber;
    [uploadProgress fractionCompleted];
    uploadProgress = [v3 numberWithDouble:v4 * 100.0];
  }

  return (NSNumber *)uploadProgress;
}

- (NSNumber)downloadPercentCompleted
{
  downloadProgress = self->_downloadProgress;
  if (downloadProgress)
  {
    v3 = NSNumber;
    [downloadProgress fractionCompleted];
    downloadProgress = [v3 numberWithDouble:v4 * 100.0];
  }

  return (NSNumber *)downloadProgress;
}

- (BRFPItemProgressObserver)initWithFPItem:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)BRFPItemProgressObserver;
  v8 = [(BRFPItemProgressObserver *)&v16 init];
  if (v8)
  {
    uint64_t v9 = [v6 itemID];
    fpItemID = v8->_fpItemID;
    v8->_fpItemID = (FPItemID *)v9;

    objc_storeStrong((id *)&v8->_queue, a4);
    uint64_t v11 = [v6 downloadingProgress];
    downloadProgress = v8->_downloadProgress;
    v8->_downloadProgress = (NSProgress *)v11;

    uint64_t v13 = [v6 uploadingProgress];
    uploadProgress = v8->_uploadProgress;
    v8->_uploadProgress = (NSProgress *)v13;
  }
  return v8;
}

- (id)description
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = [NSString stringWithFormat:@"<%@:%p %@, ulp:%@, dlp:%@>", objc_opt_class(), v2, v2->_fpItemID, v2->_uploadProgress, v2->_downloadProgress];
  objc_sync_exit(v2);

  return v3;
}

- (void)_startObservingProgress:(id)a3
{
}

- (void)updateWithFPItem:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = [v4 itemID];
  char v6 = [v5 isEqualToItemID:self->_fpItemID];

  if ((v6 & 1) == 0)
  {
    v15 = brc_bread_crumbs((uint64_t)"-[BRFPItemProgressObserver updateWithFPItem:]", 69);
    objc_super v16 = brc_default_log(0);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
      -[BRFPItemProgressObserver updateWithFPItem:]((uint64_t)v15, v16, v17, v18, v19, v20, v21, v22);
    }
  }
  id v7 = [v4 downloadingProgress];
  downloadProgress = self->_downloadProgress;

  if (v7 != downloadProgress)
  {
    [(NSProgress *)self->_downloadProgress removeObserver:self forKeyPath:@"fractionCompleted"];
    uint64_t v9 = [v4 downloadingProgress];
    v10 = self->_downloadProgress;
    self->_downloadProgress = v9;

    [(BRFPItemProgressObserver *)self _startObservingProgress:self->_downloadProgress];
  }
  uint64_t v11 = [v4 uploadingProgress];
  uploadProgress = self->_uploadProgress;

  if (v11 != uploadProgress)
  {
    [(NSProgress *)self->_uploadProgress removeObserver:self forKeyPath:@"fractionCompleted"];
    uint64_t v13 = [v4 uploadingProgress];
    v14 = self->_uploadProgress;
    self->_uploadProgress = v13;

    [(BRFPItemProgressObserver *)self _startObservingProgress:self->_uploadProgress];
  }
}

- (void)stop
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6(&dword_19ED3F000, v0, v1, "[DEBUG] %@ - stopping%@");
}

- (void)start
{
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v7 = a4;
  queue = self->_queue;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __75__BRFPItemProgressObserver_observeValueForKeyPath_ofObject_change_context___block_invoke;
  v10[3] = &unk_1E59AD648;
  v10[4] = self;
  id v11 = v7;
  id v9 = v7;
  dispatch_async(queue, v10);
}

void __75__BRFPItemProgressObserver_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(*(void *)(a1 + 32) + 8))
  {
    id v2 = *(id *)(a1 + 40);
    if (([v2 isIndeterminate] & 1) == 0) {
      (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 40) + 16))();
    }
  }
}

- (id)progressHandler
{
  return self->_progressHandler;
}

- (void)setProgressHandler:(id)a3
{
}

- (FPItemID)fpItemID
{
  return self->_fpItemID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fpItemID, 0);
  objc_storeStrong(&self->_progressHandler, 0);
  objc_storeStrong((id *)&self->_uploadProgress, 0);
  objc_storeStrong((id *)&self->_downloadProgress, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)updateWithFPItem:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end