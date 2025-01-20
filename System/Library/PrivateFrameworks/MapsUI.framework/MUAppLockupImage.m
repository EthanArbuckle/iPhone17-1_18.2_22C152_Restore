@interface MUAppLockupImage
- (MUAppLockupImage)initWithRemoteURL:(id)a3 metrics:(id)a4;
- (MUAppLockupImageMetrics)metrics;
- (NSURL)url;
- (UIImage)cachedImage;
- (void)loadImageWithCompletion:(id)a3;
@end

@implementation MUAppLockupImage

- (MUAppLockupImage)initWithRemoteURL:(id)a3 metrics:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)MUAppLockupImage;
  v9 = [(MUAppLockupImage *)&v15 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_url, a3);
    objc_storeStrong((id *)&v10->_metrics, a4);
    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.maps.MUAppLockupImage.ImageProcessingQueue", v11);
    imageProcessingQueue = v10->_imageProcessingQueue;
    v10->_imageProcessingQueue = (OS_dispatch_queue *)v12;
  }
  return v10;
}

- (void)loadImageWithCompletion:(id)a3
{
  v4 = (void (**)(void))a3;
  v5 = [(MUAppLockupImage *)self cachedImage];

  if (v5)
  {
    v4[2](v4);
  }
  else
  {
    objc_initWeak(&location, self);
    v6 = [MEMORY[0x1E4F30E38] sharedImageManager];
    id v7 = [(MUAppLockupImage *)self url];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __44__MUAppLockupImage_loadImageWithCompletion___block_invoke;
    v8[3] = &unk_1E574F6F0;
    objc_copyWeak(&v10, &location);
    v9 = v4;
    [v6 loadAppImageAtURL:v7 completionHandler:v8];

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

void __44__MUAppLockupImage_loadImageWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    if (v3)
    {
      v6 = WeakRetained[1];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __44__MUAppLockupImage_loadImageWithCompletion___block_invoke_3;
      block[3] = &unk_1E574ECF8;
      objc_copyWeak(&v11, (id *)(a1 + 40));
      id v8 = v3;
      v9 = v5;
      id v10 = *(id *)(a1 + 32);
      dispatch_async(v6, block);

      objc_destroyWeak(&v11);
    }
    else
    {
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __44__MUAppLockupImage_loadImageWithCompletion___block_invoke_2;
      v12[3] = &unk_1E574EEA8;
      id v13 = *(id *)(a1 + 32);
      +[MapsUIUtilities performOnMainIfNecessary:v12];
    }
  }
}

uint64_t __44__MUAppLockupImage_loadImageWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __44__MUAppLockupImage_loadImageWithCompletion___block_invoke_3(id *a1)
{
  v28[1] = *MEMORY[0x1E4F143B8];
  v2 = a1 + 7;
  id WeakRetained = objc_loadWeakRetained(a1 + 7);
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = [WeakRetained metrics];
    [v5 frameSize];
    double v7 = v6;
    double v9 = v8;

    id v10 = [v4 metrics];
    [v10 scale];
    double v12 = v11;

    id v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F6F1E8]), "initWithCGImage:scale:", objc_msgSend(a1[4], "CGImage"), v12);
    id v14 = objc_alloc(MEMORY[0x1E4F6F248]);
    v28[0] = v13;
    objc_super v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:1];
    v16 = (void *)[v14 initWithImages:v15];

    v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F6F258]), "initWithSize:scale:", v7, v9, v12);
    v18 = [a1[5] metrics];
    uint64_t v19 = [v18 variant];

    if (v19 == 1)
    {
      uint64_t v20 = 5;
    }
    else
    {
      if (v19)
      {
LABEL_7:
        v21 = [v16 prepareImageForDescriptor:v17];
        v22 = objc_msgSend(MEMORY[0x1E4FB1818], "imageWithCGImage:", objc_msgSend(v21, "CGImage"));
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __44__MUAppLockupImage_loadImageWithCompletion___block_invoke_4;
        v24[3] = &unk_1E574F6C8;
        objc_copyWeak(&v27, v2);
        id v23 = v22;
        id v25 = v23;
        id v26 = a1[6];
        +[MapsUIUtilities performOnMainIfNecessary:v24];

        objc_destroyWeak(&v27);
        goto LABEL_8;
      }
      uint64_t v20 = 1;
    }
    [v17 setShape:v20];
    goto LABEL_7;
  }
LABEL_8:
}

void __44__MUAppLockupImage_loadImageWithCompletion___block_invoke_4(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    objc_storeStrong(WeakRetained + 2, *(id *)(a1 + 32));
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    id WeakRetained = v3;
  }
}

- (UIImage)cachedImage
{
  return self->_cachedImage;
}

- (NSURL)url
{
  return self->_url;
}

- (MUAppLockupImageMetrics)metrics
{
  return self->_metrics;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_cachedImage, 0);
  objc_storeStrong((id *)&self->_imageProcessingQueue, 0);
}

@end