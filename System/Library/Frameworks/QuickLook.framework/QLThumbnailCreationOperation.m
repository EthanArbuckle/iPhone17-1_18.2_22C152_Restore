@interface QLThumbnailCreationOperation
- (BOOL)_finishIfCancelled;
- (BOOL)generateIfNeeded;
- (BOOL)isConcurrent;
- (BOOL)isExecuting;
- (BOOL)isFinished;
- (CGRect)contentRect;
- (NSError)error;
- (NSURL)documentURL;
- (UIImage)image;
- (double)maximumDimension;
- (double)scaleFactor;
- (unint64_t)useMode;
- (void)_finish;
- (void)_finishWithError:(id)a3;
- (void)main;
- (void)retrieveThumbnailForTaggedLogicalURL:(id)a3;
- (void)setContentRect:(CGRect)a3;
- (void)setDocumentURL:(id)a3;
- (void)setError:(id)a3;
- (void)setExecuting:(BOOL)a3;
- (void)setFinished:(BOOL)a3;
- (void)setGenerateIfNeeded:(BOOL)a3;
- (void)setImage:(id)a3;
- (void)setMaximumDimension:(double)a3;
- (void)setScaleFactor:(double)a3;
- (void)setUseMode:(unint64_t)a3;
- (void)start;
- (void)updateLastHitDateOfAddition:(id)a3 onPhysicalURL:(id)a4;
@end

@implementation QLThumbnailCreationOperation

- (void)setFinished:(BOOL)a3
{
  if (self->_finished != a3)
  {
    [(QLThumbnailCreationOperation *)self willChangeValueForKey:@"isFinished"];
    self->_finished = a3;
    [(QLThumbnailCreationOperation *)self didChangeValueForKey:@"isFinished"];
  }
}

- (void)setExecuting:(BOOL)a3
{
  if (self->_executing != a3)
  {
    [(QLThumbnailCreationOperation *)self willChangeValueForKey:@"isExecuting"];
    self->_executing = a3;
    [(QLThumbnailCreationOperation *)self didChangeValueForKey:@"isExecuting"];
  }
}

- (BOOL)isConcurrent
{
  return 1;
}

- (void)start
{
  [(QLThumbnailCreationOperation *)self setExecuting:1];

  [(QLThumbnailCreationOperation *)self main];
}

- (void)_finish
{
}

- (void)_finishWithError:(id)a3
{
  [(QLThumbnailCreationOperation *)self setError:a3];
  [(QLThumbnailCreationOperation *)self setExecuting:0];

  [(QLThumbnailCreationOperation *)self setFinished:1];
}

- (BOOL)_finishIfCancelled
{
  int v3 = [(QLThumbnailCreationOperation *)self isCancelled];
  if (v3)
  {
    v4 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F07F70] code:3072 userInfo:0];
    [(QLThumbnailCreationOperation *)self _finishWithError:v4];
  }
  return v3;
}

- (void)main
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v2 = self;
  objc_sync_enter(v2);
  if (![(QLThumbnailCreationOperation *)v2 _finishIfCancelled])
  {
    int v3 = [(QLThumbnailCreationOperation *)v2 documentURL];
    v4 = (void *)_CFURLPromiseCopyPhysicalURL();

    v5 = (NSObject **)MEMORY[0x263F62940];
    v6 = *MEMORY[0x263F62940];
    if (v4)
    {
      if (!v6)
      {
        QLSInitLogging();
        v6 = *v5;
      }
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v4;
        _os_log_impl(&dword_217F61000, v6, OS_LOG_TYPE_DEFAULT, "_CFURLPromiseCopyPhysicalURL returned %@ #Thumbnail", buf, 0xCu);
      }
      id v7 = [(QLThumbnailCreationOperation *)v2 documentURL];
      [(QLThumbnailCreationOperation *)v2 retrieveThumbnailForTaggedLogicalURL:v7];
    }
    else
    {
      if (!v6)
      {
        QLSInitLogging();
        v6 = *v5;
      }
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_217F61000, v6, OS_LOG_TYPE_DEFAULT, "Untagged logical URL, coordinating to get the physical URL #Thumbnail", buf, 2u);
      }
      id v7 = objc_alloc_init(MEMORY[0x263F08830]);
      v8 = (void *)MEMORY[0x263F08820];
      v9 = [(QLThumbnailCreationOperation *)v2 documentURL];
      v10 = [v8 readingIntentWithURL:v9 options:4];

      v11 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x263F08A48]);
      operationQueue = v2->_operationQueue;
      v2->_operationQueue = v11;

      [(NSOperationQueue *)v2->_operationQueue setMaxConcurrentOperationCount:1];
      v18 = v10;
      v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v18 count:1];
      v14 = v2->_operationQueue;
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __36__QLThumbnailCreationOperation_main__block_invoke;
      v16[3] = &unk_2642F5F00;
      v16[4] = v2;
      id v15 = v10;
      id v17 = v15;
      [v7 coordinateAccessWithIntents:v13 queue:v14 byAccessor:v16];
    }
  }
  objc_sync_exit(v2);
}

void __36__QLThumbnailCreationOperation_main__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) URL];
  [v1 retrieveThumbnailForTaggedLogicalURL:v2];
}

- (void)updateLastHitDateOfAddition:(id)a3 onPhysicalURL:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (updateLastHitDateOfAddition_onPhysicalURL__once != -1) {
    dispatch_once(&updateLastHitDateOfAddition_onPhysicalURL__once, &__block_literal_global_6);
  }
  id v7 = updateLastHitDateOfAddition_onPhysicalURL__hitAdditionsQueue;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __74__QLThumbnailCreationOperation_updateLastHitDateOfAddition_onPhysicalURL___block_invoke_2;
  v10[3] = &unk_2642F50C8;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(v7, v10);
}

void __74__QLThumbnailCreationOperation_updateLastHitDateOfAddition_onPhysicalURL___block_invoke()
{
  id v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.quicklook.thumbnails-maintenance", v2);
  v1 = (void *)updateLastHitDateOfAddition_onPhysicalURL__hitAdditionsQueue;
  updateLastHitDateOfAddition_onPhysicalURL__hitAdditionsQueue = (uint64_t)v0;
}

void __74__QLThumbnailCreationOperation_updateLastHitDateOfAddition_onPhysicalURL___block_invoke_2(uint64_t a1)
{
  id v2 = [MEMORY[0x263F160D8] sharedInstance];
  [v2 updateLastHitDateOfAddition:*(void *)(a1 + 32) onPhysicalURL:*(void *)(a1 + 40)];
}

- (void)retrieveThumbnailForTaggedLogicalURL:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  if ([(QLThumbnailCreationOperation *)v5 _finishIfCancelled])
  {
    int v6 = 1;
    goto LABEL_35;
  }
  uint64_t v7 = _CFURLPromiseCopyPhysicalURL();
  id v8 = (void *)v7;
  if (v7) {
    id v9 = (void *)v7;
  }
  else {
    id v9 = v4;
  }
  id v10 = v9;

  id v11 = (NSObject **)MEMORY[0x263F62940];
  id v12 = *MEMORY[0x263F62940];
  if (!*MEMORY[0x263F62940])
  {
    QLSInitLogging();
    id v12 = *v11;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v4;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v10;
    _os_log_impl(&dword_217F61000, v12, OS_LOG_TYPE_DEFAULT, "Got logical URL %@, physicalURL %@ #Thumbnail", buf, 0x16u);
  }
  id v31 = 0;
  v13 = (void *)[objc_alloc(MEMORY[0x263F160C0]) initWithAdditionsPresentOnURL:v10 error:&v31];
  id v14 = v31;
  id v15 = v14;
  if (v13)
  {
    [(QLThumbnailCreationOperation *)v5 updateLastHitDateOfAddition:v13 onPhysicalURL:v10];
  }
  else
  {
    if (v14)
    {
      v23 = *v11;
      if (!*v11)
      {
        QLSInitLogging();
        v23 = *v11;
      }
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v15;
        _os_log_impl(&dword_217F61000, v23, OS_LOG_TYPE_ERROR, "Caught error while retrieving thumbnail: %@ #Thumbnail", buf, 0xCu);
      }
    }
    v24 = *v11;
    if (!*v11)
    {
      QLSInitLogging();
      v24 = *v11;
    }
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v10;
      _os_log_impl(&dword_217F61000, v24, OS_LOG_TYPE_DEFAULT, "No thumbnail found for %@, trying to download/generate one #Thumbnail", buf, 0xCu);
    }
    if (v5->_generateIfNeeded)
    {
      int v25 = _CFURLIsItemPromiseAtURL();
      v26 = (void *)MEMORY[0x263F160C0];
      if (!v25)
      {
        v29[0] = MEMORY[0x263EF8330];
        v29[1] = 3221225472;
        v29[2] = __69__QLThumbnailCreationOperation_retrieveThumbnailForTaggedLogicalURL___block_invoke;
        v29[3] = &unk_2642F5F00;
        v29[4] = v5;
        id v30 = v4;
        [v26 generateThumbnailIfPossibleAtLogicalURL:v30 completionHandler:v29];

LABEL_33:
        int v6 = 1;
        goto LABEL_34;
      }
      [MEMORY[0x263F160C0] downloadOrGenerateThumbnailAtURL:v4];
    }
  }
  if ([(QLThumbnailCreationOperation *)v5 _finishIfCancelled]) {
    goto LABEL_33;
  }
  long long v16 = *(_OWORD *)(MEMORY[0x263F001A8] + 16);
  *(_OWORD *)buf = *MEMORY[0x263F001A8];
  *(_OWORD *)&buf[16] = v16;
  [(QLThumbnailCreationOperation *)v5 maximumDimension];
  double v18 = v17;
  [(QLThumbnailCreationOperation *)v5 scaleFactor];
  uint64_t v20 = [v13 thumbnailWithMaximumDimension:buf contentRect:0 properties:v18 * v19];
  if ([(QLThumbnailCreationOperation *)v5 _finishIfCancelled]) {
    goto LABEL_33;
  }
  if (!v20)
  {
    if (v15)
    {
      [(QLThumbnailCreationOperation *)v5 setError:v15];
    }
    else
    {
      v27 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F160F8] code:102 userInfo:0];
      [(QLThumbnailCreationOperation *)v5 setError:v27];
    }
    v28 = [(QLThumbnailCreationOperation *)v5 error];
    [(QLThumbnailCreationOperation *)v5 _finishWithError:v28];

    goto LABEL_33;
  }
  uint64_t v21 = (void *)MEMORY[0x263F827E8];
  [(QLThumbnailCreationOperation *)v5 scaleFactor];
  v22 = objc_msgSend(v21, "imageWithCGImage:scale:orientation:", v20, 0);
  [(QLThumbnailCreationOperation *)v5 setImage:v22];

  -[QLThumbnailCreationOperation setContentRect:](v5, "setContentRect:", *(double *)buf, *(double *)&buf[8], *(_OWORD *)&buf[16]);
  int v6 = 0;
LABEL_34:

LABEL_35:
  objc_sync_exit(v5);

  if (!v6) {
    [(QLThumbnailCreationOperation *)v5 _finish];
  }
}

void __69__QLThumbnailCreationOperation_retrieveThumbnailForTaggedLogicalURL___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v9 = v3;
  if (v3)
  {
    id v4 = [v3 domain];
    uint64_t v5 = *MEMORY[0x263F160F8];
    if ([v4 isEqualToString:*MEMORY[0x263F160F8]])
    {
      uint64_t v6 = [v9 code];

      if (v6 == 106)
      {
        [MEMORY[0x263F160C0] downloadOrGenerateThumbnailAtURL:*(void *)(a1 + 40)];
        uint64_t v7 = *(void **)(a1 + 32);
        id v8 = [MEMORY[0x263F087E8] errorWithDomain:v5 code:102 userInfo:0];
        [v7 _finishWithError:v8];

        goto LABEL_8;
      }
    }
    else
    {
    }
    [*(id *)(a1 + 32) _finishWithError:v9];
  }
  else
  {
    [*(id *)(a1 + 32) retrieveThumbnailForTaggedLogicalURL:*(void *)(a1 + 40)];
  }
LABEL_8:
}

- (BOOL)isFinished
{
  return self->_finished;
}

- (BOOL)isExecuting
{
  return self->_executing;
}

- (CGRect)contentRect
{
  objc_copyStruct(v6, &self->_contentRect, 32, 1, 0);
  double v2 = *(double *)v6;
  double v3 = *(double *)&v6[1];
  double v4 = *(double *)&v6[2];
  double v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setContentRect:(CGRect)a3
{
  CGRect v3 = a3;
  objc_copyStruct(&self->_contentRect, &v3, 32, 1, 0);
}

- (UIImage)image
{
  return (UIImage *)objc_getProperty(self, a2, 272, 1);
}

- (void)setImage:(id)a3
{
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 280, 1);
}

- (void)setError:(id)a3
{
}

- (NSURL)documentURL
{
  return (NSURL *)objc_getProperty(self, a2, 288, 1);
}

- (void)setDocumentURL:(id)a3
{
}

- (double)maximumDimension
{
  return self->_maximumDimension;
}

- (void)setMaximumDimension:(double)a3
{
  self->_maximumDimension = a3;
}

- (double)scaleFactor
{
  return self->_scaleFactor;
}

- (void)setScaleFactor:(double)a3
{
  self->_scaleFactor = a3;
}

- (unint64_t)useMode
{
  return self->_useMode;
}

- (void)setUseMode:(unint64_t)a3
{
  self->_useMode = a3;
}

- (BOOL)generateIfNeeded
{
  return self->_generateIfNeeded;
}

- (void)setGenerateIfNeeded:(BOOL)a3
{
  self->_generateIfNeeded = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_documentURL, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_image, 0);

  objc_storeStrong((id *)&self->_operationQueue, 0);
}

@end