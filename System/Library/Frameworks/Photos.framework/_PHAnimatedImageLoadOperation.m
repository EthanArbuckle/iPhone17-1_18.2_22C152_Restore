@interface _PHAnimatedImageLoadOperation
+ (id)_animatedImageSharedLoadingQueue;
+ (id)_inq_animatedImageLoadingOperations;
+ (id)_removeOperation:(int64_t)a3;
+ (id)_requestIsolationQueue;
+ (int64_t)nextRequestID;
+ (void)_registerOperation:(id)a3 forRequestID:(int64_t)a4;
- (PHAnimatedImage)animatedImage;
- (_PHAnimatedImageLoadOperation)initWithURL:(id)a3 cachingStrategy:(int64_t)a4 useSharedDecoding:(BOOL)a5;
- (void)main;
- (void)setAnimatedImage:(id)a3;
@end

@implementation _PHAnimatedImageLoadOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animatedImage, 0);

  objc_storeStrong((id *)&self->_animatedImageURL, 0);
}

- (void)setAnimatedImage:(id)a3
{
}

- (PHAnimatedImage)animatedImage
{
  return (PHAnimatedImage *)objc_getProperty(self, a2, 272, 1);
}

- (void)main
{
  if (([(_PHAnimatedImageLoadOperation *)self isCancelled] & 1) == 0)
  {
    v3 = [[PHAnimatedImage alloc] initWithURL:self->_animatedImageURL cachingStrategy:self->_cacheStrategy useSharedDecoding:self->_useSharedImageDecoding];
    [(_PHAnimatedImageLoadOperation *)self setAnimatedImage:v3];
  }
}

- (_PHAnimatedImageLoadOperation)initWithURL:(id)a3 cachingStrategy:(int64_t)a4 useSharedDecoding:(BOOL)a5
{
  id v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_PHAnimatedImageLoadOperation;
  v9 = [(_PHAnimatedImageLoadOperation *)&v13 init];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    animatedImageURL = v9->_animatedImageURL;
    v9->_animatedImageURL = (NSURL *)v10;

    v9->_cacheStrategy = a4;
    v9->_useSharedImageDecoding = a5;
  }

  return v9;
}

+ (id)_requestIsolationQueue
{
  if (_requestIsolationQueue_onceToken != -1) {
    dispatch_once(&_requestIsolationQueue_onceToken, &__block_literal_global_6);
  }
  v2 = (void *)_requestIsolationQueue__requestIsolation;

  return v2;
}

+ (id)_inq_animatedImageLoadingOperations
{
  if (_inq_animatedImageLoadingOperations_onceToken != -1) {
    dispatch_once(&_inq_animatedImageLoadingOperations_onceToken, &__block_literal_global_3_2845);
  }
  v2 = (void *)_inq_animatedImageLoadingOperations__loadingOperations;

  return v2;
}

+ (id)_animatedImageSharedLoadingQueue
{
  if (_animatedImageSharedLoadingQueue_onceToken != -1) {
    dispatch_once(&_animatedImageSharedLoadingQueue_onceToken, &__block_literal_global_2846);
  }
  v2 = (void *)_animatedImageSharedLoadingQueue__loadingQueue;

  return v2;
}

+ (id)_removeOperation:(int64_t)a3
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__2849;
  objc_super v13 = __Block_byref_object_dispose__2850;
  id v14 = 0;
  v5 = [a1 _requestIsolationQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50___PHAnimatedImageLoadOperation__removeOperation___block_invoke;
  block[3] = &unk_1E5846858;
  block[4] = &v9;
  block[5] = a1;
  block[6] = a3;
  dispatch_sync(v5, block);

  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

+ (void)_registerOperation:(id)a3 forRequestID:(int64_t)a4
{
  id v6 = a3;
  v7 = [a1 _requestIsolationQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65___PHAnimatedImageLoadOperation__registerOperation_forRequestID___block_invoke;
  block[3] = &unk_1E5845F98;
  id v10 = v6;
  id v11 = a1;
  int64_t v12 = a4;
  id v8 = v6;
  dispatch_sync(v7, block);
}

+ (int64_t)nextRequestID
{
  return atomic_fetch_add(&nextRequestID__lastRequestID, 1uLL);
}

@end