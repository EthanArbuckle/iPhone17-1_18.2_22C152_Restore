@interface MPArtworkResizeUtility
- (MPArtworkResizeUtility)init;
- (MPArtworkResizeUtility)initWithQualityOfService:(int64_t)a3;
- (NSMapTable)artworkResizingOperations;
- (NSOperationQueue)artworkResizingOperationQueue;
- (OS_dispatch_queue)artworkResizingAccessQueue;
- (id)resizeImage:(id)a3 scaledFittingSize:(CGSize)a4 useExactFittingSizeAsDestinationSize:(BOOL)a5 saveToDestinationURL:(id)a6 completionHandler:(id)a7;
- (int64_t)qualityOfService;
- (void)cancelResizeImage:(id)a3;
- (void)setArtworkResizingAccessQueue:(id)a3;
- (void)setArtworkResizingOperationQueue:(id)a3;
- (void)setArtworkResizingOperations:(id)a3;
- (void)setQualityOfService:(int64_t)a3;
@end

@implementation MPArtworkResizeUtility

- (MPArtworkResizeUtility)initWithQualityOfService:(int64_t)a3
{
  v15.receiver = self;
  v15.super_class = (Class)MPArtworkResizeUtility;
  v4 = [(MPArtworkResizeUtility *)&v15 init];
  v5 = v4;
  if (v4)
  {
    [(MPArtworkResizeUtility *)v4 setQualityOfService:a3];
    if (a3 <= 16)
    {
      if (a3 == -1)
      {
        dispatch_qos_class_t v6 = QOS_CLASS_DEFAULT;
        goto LABEL_14;
      }
      if (a3 == 9)
      {
        dispatch_qos_class_t v6 = QOS_CLASS_BACKGROUND;
        goto LABEL_14;
      }
    }
    else
    {
      switch(a3)
      {
        case 17:
          dispatch_qos_class_t v6 = QOS_CLASS_UTILITY;
          goto LABEL_14;
        case 33:
          dispatch_qos_class_t v6 = QOS_CLASS_USER_INTERACTIVE;
          goto LABEL_14;
        case 25:
          dispatch_qos_class_t v6 = QOS_CLASS_USER_INITIATED;
LABEL_14:
          v7 = dispatch_queue_attr_make_with_qos_class(0, v6, 0);
          dispatch_queue_t v8 = dispatch_queue_create("com.apple.mediaplayer.artworkservice.resizing.queue", v7);
          [(MPArtworkResizeUtility *)v5 setArtworkResizingAccessQueue:v8];

          id v9 = objc_alloc_init(MEMORY[0x1E4F28F08]);
          [(MPArtworkResizeUtility *)v5 setArtworkResizingOperationQueue:v9];

          v10 = [(MPArtworkResizeUtility *)v5 artworkResizingOperationQueue];
          [v10 setQualityOfService:a3];

          v11 = [(MPArtworkResizeUtility *)v5 artworkResizingOperationQueue];
          [v11 setName:@"com.apple.mediaplayer.artworkservice.resizing.OperationQueue"];

          v12 = [(MPArtworkResizeUtility *)v5 artworkResizingOperationQueue];
          [v12 setMaxConcurrentOperationCount:15];

          v13 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
          [(MPArtworkResizeUtility *)v5 setArtworkResizingOperations:v13];

          return v5;
      }
    }
    dispatch_qos_class_t v6 = QOS_CLASS_UNSPECIFIED;
    goto LABEL_14;
  }
  return v5;
}

- (NSOperationQueue)artworkResizingOperationQueue
{
  return self->_artworkResizingOperationQueue;
}

- (void)setQualityOfService:(int64_t)a3
{
  self->_qualityOfService = a3;
}

- (void)setArtworkResizingOperations:(id)a3
{
}

- (void)setArtworkResizingOperationQueue:(id)a3
{
}

- (void)setArtworkResizingAccessQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworkResizingOperations, 0);
  objc_storeStrong((id *)&self->_artworkResizingOperationQueue, 0);

  objc_storeStrong((id *)&self->_artworkResizingAccessQueue, 0);
}

- (int64_t)qualityOfService
{
  return self->_qualityOfService;
}

- (NSMapTable)artworkResizingOperations
{
  return self->_artworkResizingOperations;
}

- (OS_dispatch_queue)artworkResizingAccessQueue
{
  return self->_artworkResizingAccessQueue;
}

- (void)cancelResizeImage:(id)a3
{
  id v4 = a3;
  v5 = [(MPArtworkResizeUtility *)self artworkResizingAccessQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__MPArtworkResizeUtility_cancelResizeImage___block_invoke;
  v7[3] = &unk_1E57F9F98;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __44__MPArtworkResizeUtility_cancelResizeImage___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) artworkResizingOperations];
  id v3 = [v2 objectForKey:*(void *)(a1 + 40)];

  [v3 cancel];
}

- (id)resizeImage:(id)a3 scaledFittingSize:(CGSize)a4 useExactFittingSizeAsDestinationSize:(BOOL)a5 saveToDestinationURL:(id)a6 completionHandler:(id)a7
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v13 = a3;
  id v14 = a6;
  id v15 = a7;
  id v16 = v14;
  v17 = v16;
  if (!v16)
  {
    v18 = [MEMORY[0x1E4F29128] UUID];
    v17 = [v18 UUIDString];
  }
  v19 = [(MPArtworkResizeUtility *)self artworkResizingAccessQueue];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __132__MPArtworkResizeUtility_resizeImage_scaledFittingSize_useExactFittingSizeAsDestinationSize_saveToDestinationURL_completionHandler___block_invoke;
  v27[3] = &unk_1E57EEA90;
  v27[4] = self;
  id v20 = v17;
  id v28 = v20;
  id v29 = v13;
  CGFloat v32 = width;
  CGFloat v33 = height;
  BOOL v34 = a5;
  id v30 = v16;
  id v31 = v15;
  id v21 = v15;
  id v22 = v16;
  id v23 = v13;
  dispatch_async(v19, v27);

  v24 = v31;
  id v25 = v20;

  return v25;
}

void __132__MPArtworkResizeUtility_resizeImage_scaledFittingSize_useExactFittingSizeAsDestinationSize_saveToDestinationURL_completionHandler___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) artworkResizingOperations];
  id v3 = [v2 objectForKey:*(void *)(a1 + 40)];

  if (!v3)
  {
    id v3 = -[MPArtworkResizeOperation initWithImage:scaledFittingSize:useExactFittingSizeAsDestinationSize:destinationURL:]([MPArtworkResizeOperation alloc], "initWithImage:scaledFittingSize:useExactFittingSizeAsDestinationSize:destinationURL:", *(void *)(a1 + 48), *(unsigned __int8 *)(a1 + 88), *(void *)(a1 + 56), *(double *)(a1 + 72), *(double *)(a1 + 80));
    -[MPArtworkResizeOperation setQualityOfService:](v3, "setQualityOfService:", [*(id *)(a1 + 32) qualityOfService]);
    id v4 = [*(id *)(a1 + 32) artworkResizingOperations];
    [v4 setObject:v3 forKey:*(void *)(a1 + 40)];

    v5 = [(MPArtworkResizeOperation *)v3 operationGroup];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __132__MPArtworkResizeUtility_resizeImage_scaledFittingSize_useExactFittingSizeAsDestinationSize_saveToDestinationURL_completionHandler___block_invoke_2;
    v16[3] = &unk_1E57FA038;
    id v6 = *(void **)(a1 + 40);
    v16[4] = *(void *)(a1 + 32);
    id v17 = v6;
    id v18 = v5;
    v7 = v5;
    [(MPArtworkResizeOperation *)v3 setCompletionBlock:v16];
    dispatch_group_enter(v7);
    id v8 = [*(id *)(a1 + 32) artworkResizingOperationQueue];
    [v8 addOperation:v3];
  }
  id v9 = [(MPArtworkResizeOperation *)v3 operationGroup];
  v10 = [*(id *)(a1 + 32) artworkResizingAccessQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __132__MPArtworkResizeUtility_resizeImage_scaledFittingSize_useExactFittingSizeAsDestinationSize_saveToDestinationURL_completionHandler___block_invoke_4;
  block[3] = &unk_1E57F9140;
  id v11 = *(id *)(a1 + 64);
  id v14 = v3;
  id v15 = v11;
  v12 = v3;
  dispatch_group_notify(v9, v10, block);
}

void __132__MPArtworkResizeUtility_resizeImage_scaledFittingSize_useExactFittingSizeAsDestinationSize_saveToDestinationURL_completionHandler___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) artworkResizingAccessQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __132__MPArtworkResizeUtility_resizeImage_scaledFittingSize_useExactFittingSizeAsDestinationSize_saveToDestinationURL_completionHandler___block_invoke_3;
  block[3] = &unk_1E57FA038;
  id v3 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v5 = v3;
  id v6 = *(id *)(a1 + 48);
  dispatch_async(v2, block);
}

void __132__MPArtworkResizeUtility_resizeImage_scaledFittingSize_useExactFittingSizeAsDestinationSize_saveToDestinationURL_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  if (v1)
  {
    id v4 = [*(id *)(a1 + 32) resizedImage];
    id v3 = [*(id *)(a1 + 32) error];
    (*(void (**)(uint64_t, id, void *))(v1 + 16))(v1, v4, v3);
  }
}

void __132__MPArtworkResizeUtility_resizeImage_scaledFittingSize_useExactFittingSizeAsDestinationSize_saveToDestinationURL_completionHandler___block_invoke_3(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) artworkResizingOperations];
  [v2 removeObjectForKey:*(void *)(a1 + 40)];

  id v3 = *(NSObject **)(a1 + 48);

  dispatch_group_leave(v3);
}

- (MPArtworkResizeUtility)init
{
  return [(MPArtworkResizeUtility *)self initWithQualityOfService:-1];
}

@end