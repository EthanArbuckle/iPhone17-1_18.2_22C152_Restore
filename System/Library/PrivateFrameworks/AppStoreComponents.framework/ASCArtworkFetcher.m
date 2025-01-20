@interface ASCArtworkFetcher
+ (ASCArtworkFetcher)sharedFetcher;
- (ASCArtworkFetcher)initWithURLSession:(id)a3 scale:(double)a4;
- (ASCTaskCoordinator)fetchCoordinator;
- (NSURLSession)urlSession;
- (double)scale;
- (id)URLWithContentsOfArtwork:(id)a3 preferredSize:(CGSize)a4;
- (id)dataWithContentsOfURL:(id)a3;
- (id)imageForContentsOfArtwork:(id)a3 withSize:(CGSize)a4;
- (id)imageWithContentsOfURL:(id)a3;
@end

@implementation ASCArtworkFetcher

+ (ASCArtworkFetcher)sharedFetcher
{
  if (sharedFetcher_onceToken != -1) {
    dispatch_once(&sharedFetcher_onceToken, &__block_literal_global_4);
  }
  v2 = (void *)sharedFetcher_sharedFetcher;

  return (ASCArtworkFetcher *)v2;
}

void __34__ASCArtworkFetcher_sharedFetcher__block_invoke()
{
  id v6 = [MEMORY[0x1E4F290F0] defaultSessionConfiguration];
  [v6 setRequestCachePolicy:2];
  v0 = [MEMORY[0x1E4F290E0] sessionWithConfiguration:v6];
  v1 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v1 scale];
  double v3 = v2;

  v4 = [[ASCArtworkFetcher alloc] initWithURLSession:v0 scale:v3];
  v5 = (void *)sharedFetcher_sharedFetcher;
  sharedFetcher_sharedFetcher = (uint64_t)v4;
}

- (ASCArtworkFetcher)initWithURLSession:(id)a3 scale:(double)a4
{
  id v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ASCArtworkFetcher;
  v8 = [(ASCArtworkFetcher *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_urlSession, a3);
    v9->_scale = a4;
    v10 = [[ASCTaskCoordinator alloc] initWithName:@"ASCArtworkFetcher"];
    fetchCoordinator = v9->_fetchCoordinator;
    v9->_fetchCoordinator = v10;
  }
  return v9;
}

- (id)URLWithContentsOfArtwork:(id)a3 preferredSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  v29[4] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v8 = [v7 preferredCrop];
  [v7 width];
  double v10 = v9;
  [v7 height];
  double v12 = ASCArtworkCropScaleSizeToFit(v8, width, height, v10, v11);
  double v14 = v13;

  [(ASCArtworkFetcher *)self scale];
  double v16 = v12 * v15;
  [(ASCArtworkFetcher *)self scale];
  double v18 = v14 * v17;
  v28[0] = @"{w}";
  v19 = [NSNumber numberWithInteger:(uint64_t)v16];
  v20 = [v19 stringValue];
  v29[0] = v20;
  v28[1] = @"{h}";
  v21 = [NSNumber numberWithInteger:(uint64_t)v18];
  v22 = [v21 stringValue];
  v29[1] = v22;
  v28[2] = @"{c}";
  v23 = [v7 preferredCrop];
  v29[2] = v23;
  v28[3] = @"{f}";
  v24 = [v7 preferredFormat];
  v29[3] = v24;
  v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:4];
  v26 = [v7 makeURLWithSubstitutions:v25];

  return v26;
}

- (id)dataWithContentsOfURL:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4F4DDB0];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  id v7 = [(ASCArtworkFetcher *)self urlSession];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __43__ASCArtworkFetcher_dataWithContentsOfURL___block_invoke;
  v12[3] = &unk_1E645DAC0;
  id v8 = v6;
  id v13 = v8;
  double v9 = [v7 dataTaskWithURL:v5 completionHandler:v12];

  [v9 resume];
  id v10 = v8;

  return v10;
}

void __43__ASCArtworkFetcher_dataWithContentsOfURL___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v9 = a2;
  id v6 = a4;
  if (([*(id *)(a1 + 32) isCancelled] & 1) == 0)
  {
    id v7 = [v6 domain];
    if ([v7 isEqualToString:*MEMORY[0x1E4F289A0]])
    {
      uint64_t v8 = [v6 code];

      if (v8 == -999)
      {
        [*(id *)(a1 + 32) cancel];
        goto LABEL_7;
      }
    }
    else
    {
    }
    [*(id *)(a1 + 32) finishWithResult:v9 error:v6];
  }
LABEL_7:
}

- (id)imageWithContentsOfURL:(id)a3
{
  id v4 = a3;
  [(ASCArtworkFetcher *)self scale];
  uint64_t v6 = v5;
  id v7 = [(ASCArtworkFetcher *)self dataWithContentsOfURL:v4];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __44__ASCArtworkFetcher_imageWithContentsOfURL___block_invoke;
  v11[3] = &unk_1E645DAE8;
  uint64_t v13 = v6;
  id v12 = v4;
  id v8 = v4;
  id v9 = [v7 thenWithBlock:v11];

  return v9;
}

id __44__ASCArtworkFetcher_imageWithContentsOfURL___block_invoke(uint64_t a1, void *a2)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  double v3 = (objc_class *)MEMORY[0x1E4FB1818];
  id v4 = a2;
  uint64_t v5 = (void *)[[v3 alloc] initWithData:v4 scale:*(double *)(a1 + 40)];

  if (v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F4DDD0] promiseWithResult:v5];
  }
  else
  {
    id v7 = [NSString stringWithFormat:@"Response for %@ could not be decoded", *(void *)(a1 + 32)];
    id v8 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v12 = *MEMORY[0x1E4F28568];
    v13[0] = v7;
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    id v10 = [v8 errorWithDomain:@"ASCArtworkErrorDomain" code:2 userInfo:v9];

    uint64_t v6 = [MEMORY[0x1E4F4DDD0] promiseWithError:v10];
  }

  return v6;
}

- (id)imageForContentsOfArtwork:(id)a3 withSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  v25[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = v7;
  if (width > 2.22044605e-16 && height > 2.22044605e-16)
  {
    id v10 = [v7 embeddedImage];
    if (v10)
    {
      double v14 = [MEMORY[0x1E4F4DDB0] promiseWithResult:v10];
      goto LABEL_13;
    }
    uint64_t v13 = -[ASCArtworkFetcher URLWithContentsOfArtwork:preferredSize:](self, "URLWithContentsOfArtwork:preferredSize:", v8, width, height);
    if (v13)
    {
      double v15 = [(ASCArtworkFetcher *)self fetchCoordinator];
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __56__ASCArtworkFetcher_imageForContentsOfArtwork_withSize___block_invoke;
      v20[3] = &unk_1E645DB10;
      v20[4] = self;
      id v21 = v13;
      double v14 = [v15 taskForKey:v21 withCreatorBlock:v20];
    }
    else
    {
      double v15 = [NSString stringWithFormat:@"Could not derive URL for %@", v8];
      double v16 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v22 = *MEMORY[0x1E4F28568];
      v23 = v15;
      double v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v23 forKeys:&v22 count:1];
      double v18 = [v16 errorWithDomain:@"ASCArtworkErrorDomain" code:1 userInfo:v17];

      double v14 = [MEMORY[0x1E4F4DDB0] promiseWithError:v18];
    }
  }
  else
  {
    id v10 = [NSString stringWithFormat:@"Invalid artwork size {%f, %f}", *(void *)&width, *(void *)&height];
    double v11 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v24 = *MEMORY[0x1E4F28568];
    v25[0] = v10;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];
    uint64_t v13 = [v11 errorWithDomain:@"ASCArtworkErrorDomain" code:0 userInfo:v12];

    double v14 = [MEMORY[0x1E4F4DDB0] promiseWithError:v13];
  }

LABEL_13:

  return v14;
}

uint64_t __56__ASCArtworkFetcher_imageForContentsOfArtwork_withSize___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) imageWithContentsOfURL:*(void *)(a1 + 40)];
}

- (NSURLSession)urlSession
{
  return self->_urlSession;
}

- (double)scale
{
  return self->_scale;
}

- (ASCTaskCoordinator)fetchCoordinator
{
  return self->_fetchCoordinator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchCoordinator, 0);

  objc_storeStrong((id *)&self->_urlSession, 0);
}

@end