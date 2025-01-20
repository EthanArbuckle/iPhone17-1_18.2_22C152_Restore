@interface MPArtworkColorAnalysisUtility
- (MPArtworkColorAnalysisUtility)init;
- (MPArtworkColorAnalysisUtility)initWithQualityOfService:(int64_t)a3;
- (NSMapTable)artworkColorAnalysisOperations;
- (NSOperationQueue)artworkColorAnalysisOperationQueue;
- (id)performColorAnalysisForImageAtUrl:(id)a3 preferredImageSize:(CGSize)a4 completionHandler:(id)a5;
- (int64_t)qualityOfService;
- (void)cancelColorAnalysis:(id)a3 withCompletionHandler:(id)a4;
- (void)setArtworkColorAnalysisOperationQueue:(id)a3;
- (void)setArtworkColorAnalysisOperations:(id)a3;
- (void)setQualityOfService:(int64_t)a3;
@end

@implementation MPArtworkColorAnalysisUtility

- (MPArtworkColorAnalysisUtility)initWithQualityOfService:(int64_t)a3
{
  v12.receiver = self;
  v12.super_class = (Class)MPArtworkColorAnalysisUtility;
  v4 = [(MPArtworkColorAnalysisUtility *)&v12 init];
  v5 = v4;
  if (v4)
  {
    v4->_lock._os_unfair_lock_opaque = 0;
    [(MPArtworkColorAnalysisUtility *)v4 setQualityOfService:a3];
    id v6 = objc_alloc_init(MEMORY[0x1E4F28F08]);
    [(MPArtworkColorAnalysisUtility *)v5 setArtworkColorAnalysisOperationQueue:v6];

    v7 = [(MPArtworkColorAnalysisUtility *)v5 artworkColorAnalysisOperationQueue];
    [v7 setQualityOfService:a3];

    v8 = [(MPArtworkColorAnalysisUtility *)v5 artworkColorAnalysisOperationQueue];
    [v8 setName:@"com.apple.mediaplayer.artworkservice.colorAnalysis.OperationQueue"];

    v9 = [(MPArtworkColorAnalysisUtility *)v5 artworkColorAnalysisOperationQueue];
    [v9 setMaxConcurrentOperationCount:5];

    v10 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    [(MPArtworkColorAnalysisUtility *)v5 setArtworkColorAnalysisOperations:v10];
  }
  return v5;
}

- (NSOperationQueue)artworkColorAnalysisOperationQueue
{
  return self->_artworkColorAnalysisOperationQueue;
}

- (void)setQualityOfService:(int64_t)a3
{
  self->_qualityOfService = a3;
}

- (void)setArtworkColorAnalysisOperations:(id)a3
{
}

- (void)setArtworkColorAnalysisOperationQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworkColorAnalysisOperations, 0);

  objc_storeStrong((id *)&self->_artworkColorAnalysisOperationQueue, 0);
}

- (int64_t)qualityOfService
{
  return self->_qualityOfService;
}

- (NSMapTable)artworkColorAnalysisOperations
{
  return self->_artworkColorAnalysisOperations;
}

- (void)cancelColorAnalysis:(id)a3 withCompletionHandler:(id)a4
{
  v11 = (void (**)(id, void *))a4;
  p_lock = &self->_lock;
  id v7 = a3;
  os_unfair_lock_lock(&self->_lock);
  v8 = [(MPArtworkColorAnalysisUtility *)self artworkColorAnalysisOperations];
  v9 = [v8 objectForKey:v7];

  [v9 cancel];
  if (v11)
  {
    v10 = [v9 error];
    v11[2](v11, v10);
  }
  os_unfair_lock_unlock(p_lock);
}

- (id)performColorAnalysisForImageAtUrl:(id)a3 preferredImageSize:(CGSize)a4 completionHandler:(id)a5
{
  id v7 = a3;
  v8 = (void (**)(id, void, void *))a5;
  if (v7)
  {
    id v9 = v7;
    os_unfair_lock_lock(&self->_lock);
    v10 = [(MPArtworkColorAnalysisUtility *)self artworkColorAnalysisOperations];
    v11 = [v10 objectForKey:v9];

    os_unfair_lock_unlock(&self->_lock);
    if (v11)
    {
      if (v8)
      {
        objc_super v12 = objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:debugDescription:", *MEMORY[0x1E4F778B0], 2, @"Color analysis operation already in process");
        v8[2](v8, 0, v12);
      }
    }
    else
    {
      v11 = [[MPArtworkColorAnalysisOperation alloc] initWithURL:v9];
      objc_initWeak(&location, v11);
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __104__MPArtworkColorAnalysisUtility_performColorAnalysisForImageAtUrl_preferredImageSize_completionHandler___block_invoke;
      v17[3] = &unk_1E57F3838;
      objc_copyWeak(&v20, &location);
      v19 = v8;
      v17[4] = self;
      id v13 = v9;
      id v18 = v13;
      [(MPArtworkColorAnalysisOperation *)v11 setCompletionBlock:v17];
      [(MPArtworkColorAnalysisOperation *)v11 setQualityOfService:[(MPArtworkColorAnalysisUtility *)self qualityOfService]];
      os_unfair_lock_lock(&self->_lock);
      v14 = [(MPArtworkColorAnalysisUtility *)self artworkColorAnalysisOperations];
      [v14 setObject:v11 forKey:v13];

      os_unfair_lock_unlock(&self->_lock);
      v15 = [(MPArtworkColorAnalysisUtility *)self artworkColorAnalysisOperationQueue];
      [v15 addOperation:v11];

      objc_destroyWeak(&v20);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:debugDescription:", *MEMORY[0x1E4F778B0], 1, @"Invalid source image URL=%@", 0);
    v11 = (MPArtworkColorAnalysisOperation *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, 0, v11);
  }

  return v7;
}

void __104__MPArtworkColorAnalysisUtility_performColorAnalysisForImageAtUrl_preferredImageSize_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v2 = [WeakRetained colorAnalysis];
  v3 = [WeakRetained error];
  uint64_t v4 = *(void *)(a1 + 48);
  if (v4) {
    (*(void (**)(uint64_t, void *, void *))(v4 + 16))(v4, v2, v3);
  }
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  v5 = [*(id *)(a1 + 32) artworkColorAnalysisOperations];
  [v5 removeObjectForKey:*(void *)(a1 + 40)];

  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
}

- (MPArtworkColorAnalysisUtility)init
{
  return [(MPArtworkColorAnalysisUtility *)self initWithQualityOfService:-1];
}

@end