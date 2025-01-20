@interface PHAnimatedImage
+ (int64_t)requestAnimatedImageWithURL:(id)a3 completion:(id)a4;
+ (int64_t)requestAnimatedImageWithURL:(id)a3 options:(id)a4 completion:(id)a5;
+ (void)cancelAnimatedImageRequest:(int64_t)a3;
- (PFAnimatedImage)pf_animatedImage;
- (PHAnimatedImage)init;
- (PHAnimatedImage)initWithURL:(id)a3;
- (PHAnimatedImage)initWithURL:(id)a3 cachingStrategy:(int64_t)a4 useSharedDecoding:(BOOL)a5;
- (double)duration;
- (unint64_t)frameCount;
- (unint64_t)loopCount;
- (unint64_t)pixelHeight;
- (unint64_t)pixelWidth;
- (void)_initializePropertiesWithAnimatedImage:(id)a3;
@end

@implementation PHAnimatedImage

- (void).cxx_destruct
{
}

- (PFAnimatedImage)pf_animatedImage
{
  return self->_pf_animatedImage;
}

- (unint64_t)pixelHeight
{
  return self->_pixelHeight;
}

- (unint64_t)pixelWidth
{
  return self->_pixelWidth;
}

- (double)duration
{
  return self->_duration;
}

- (unint64_t)loopCount
{
  return self->_loopCount;
}

- (unint64_t)frameCount
{
  return self->_frameCount;
}

- (void)_initializePropertiesWithAnimatedImage:(id)a3
{
  id v4 = a3;
  self->_frameCount = [v4 frameCount];
  self->_loopCount = [v4 loopCount];
  [v4 duration];
  self->_duration = v5;
  [v4 pixelSize];
  double v7 = v6;
  double v9 = v8;

  self->_pixelWidth = (unint64_t)v7;
  self->_pixelHeight = (unint64_t)v9;
}

- (PHAnimatedImage)initWithURL:(id)a3 cachingStrategy:(int64_t)a4 useSharedDecoding:(BOOL)a5
{
  BOOL v5 = a5;
  double v8 = (objc_class *)MEMORY[0x1E4F8CB98];
  id v9 = a3;
  v10 = (void *)[[v8 alloc] initWithURL:v9 cachingStrategy:a4 useGlobalDecodeQueue:v5];

  if (v10)
  {
    v15.receiver = self;
    v15.super_class = (Class)PHAnimatedImage;
    v11 = [(PHAnimatedImage *)&v15 init];
    v12 = v11;
    if (v11)
    {
      objc_storeStrong((id *)&v11->_pf_animatedImage, v10);
      [(PHAnimatedImage *)v12 _initializePropertiesWithAnimatedImage:v12->_pf_animatedImage];
    }
    self = v12;
    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (PHAnimatedImage)initWithURL:(id)a3
{
  return [(PHAnimatedImage *)self initWithURL:a3 cachingStrategy:2 useSharedDecoding:0];
}

- (PHAnimatedImage)init
{
}

+ (void)cancelAnimatedImageRequest:(int64_t)a3
{
  id v3 = +[_PHAnimatedImageLoadOperation _removeOperation:a3];
  [v3 cancel];
}

+ (int64_t)requestAnimatedImageWithURL:(id)a3 options:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = v9;
  v11 = 0;
  if (v7 && v9)
  {
    v12 = (PHAnimatedImageRequestOptions *)v8;
    if (!v12) {
      v12 = objc_alloc_init(PHAnimatedImageRequestOptions);
    }
    v13 = +[_PHAnimatedImageLoadOperation _animatedImageSharedLoadingQueue];
    v11 = +[_PHAnimatedImageLoadOperation nextRequestID];
    if ([(PHAnimatedImageRequestOptions *)v12 allowPreCaching]) {
      uint64_t v14 = 2;
    }
    else {
      uint64_t v14 = 0;
    }
    objc_super v15 = [[_PHAnimatedImageLoadOperation alloc] initWithURL:v7 cachingStrategy:v14 useSharedDecoding:[(PHAnimatedImageRequestOptions *)v12 useSharedImageDecoding]];
    objc_initWeak(&location, v15);
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    v19 = __66__PHAnimatedImage_requestAnimatedImageWithURL_options_completion___block_invoke;
    v20 = &unk_1E5842310;
    v22[1] = v11;
    id v21 = v10;
    objc_copyWeak(v22, &location);
    [(_PHAnimatedImageLoadOperation *)v15 setCompletionBlock:&v17];
    +[_PHAnimatedImageLoadOperation _registerOperation:forRequestID:](_PHAnimatedImageLoadOperation, "_registerOperation:forRequestID:", v15, v11, v17, v18, v19, v20);
    [v13 addOperation:v15];
    objc_destroyWeak(v22);

    objc_destroyWeak(&location);
  }

  return (int64_t)v11;
}

void __66__PHAnimatedImage_requestAnimatedImageWithURL_options_completion___block_invoke(uint64_t a1)
{
  id v2 = +[_PHAnimatedImageLoadOperation _removeOperation:*(void *)(a1 + 48)];
  uint64_t v3 = *(void *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = [WeakRetained animatedImage];
  (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);
}

+ (int64_t)requestAnimatedImageWithURL:(id)a3 completion:(id)a4
{
  return [a1 requestAnimatedImageWithURL:a3 options:0 completion:a4];
}

@end