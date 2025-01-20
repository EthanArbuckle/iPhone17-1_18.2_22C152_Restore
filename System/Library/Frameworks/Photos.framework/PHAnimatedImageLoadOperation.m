@interface PHAnimatedImageLoadOperation
@end

@implementation PHAnimatedImageLoadOperation

void __55___PHAnimatedImageLoadOperation__requestIsolationQueue__block_invoke()
{
  v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.PHAnimatedImage.isolation", v2);
  v1 = (void *)_requestIsolationQueue__requestIsolation;
  _requestIsolationQueue__requestIsolation = (uint64_t)v0;
}

void __68___PHAnimatedImageLoadOperation__inq_animatedImageLoadingOperations__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1CA60] dictionary];
  v1 = (void *)_inq_animatedImageLoadingOperations__loadingOperations;
  _inq_animatedImageLoadingOperations__loadingOperations = v0;
}

uint64_t __65___PHAnimatedImageLoadOperation__animatedImageSharedLoadingQueue__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28F08]);
  v1 = (void *)_animatedImageSharedLoadingQueue__loadingQueue;
  _animatedImageSharedLoadingQueue__loadingQueue = (uint64_t)v0;

  [(id)_animatedImageSharedLoadingQueue__loadingQueue setQualityOfService:25];
  v2 = (void *)_animatedImageSharedLoadingQueue__loadingQueue;

  return [v2 setMaxConcurrentOperationCount:3];
}

void __50___PHAnimatedImageLoadOperation__removeOperation___block_invoke(uint64_t a1)
{
  v2 = objc_msgSend(*(id *)(a1 + 40), "_inq_animatedImageLoadingOperations");
  v3 = [NSNumber numberWithLongLong:*(void *)(a1 + 48)];
  uint64_t v4 = [v2 objectForKey:v3];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  objc_msgSend(*(id *)(a1 + 40), "_inq_animatedImageLoadingOperations");
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  v7 = [NSNumber numberWithLongLong:*(void *)(a1 + 48)];
  [v8 removeObjectForKey:v7];
}

void __65___PHAnimatedImageLoadOperation__registerOperation_forRequestID___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 40), "_inq_animatedImageLoadingOperations");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = [NSNumber numberWithLongLong:*(void *)(a1 + 48)];
  [v4 setObject:v2 forKey:v3];
}

@end