@interface SSSScreenshotImageProvider
- (BOOL)hasChangedBackingImage;
- (BOOL)hasOriginalUneditedImage;
- (BOOL)highQualityQueueHasBeenResumed;
- (BOOL)highQualityQueueIsValid;
- (OS_dispatch_queue)highQualityImageQueue;
- (OS_dispatch_queue)potentiallyLowQualityImageQueue;
- (SSSScreenshot)screenshot;
- (SSSScreenshotImageProvider)initWithScreenshot:(id)a3;
- (SSSScreenshotModificationInfo)cachedModificationInfo;
- (UIImage)cachedCGImageBackedUneditedImageForUI;
- (UIImage)cachedOutputImage;
- (id)_outputImageOnCurrentUneditedImage;
- (id)pdfDocument;
- (id)requestCGImageBackedUneditedImageForUIBlocking;
- (id)requestOutputImageForSavingBlocking;
- (id)requestOutputImageForUIBlocking;
- (id)requestUneditedImageForUIBlocking;
- (void)_loadUneditedImageIfNecessaryWithCompletionBlock:(id)a3;
- (void)_resumeHighQualityQueueIfNecessary;
- (void)dealloc;
- (void)processImageIdentifier:(id)a3;
- (void)requestCGImageBackedUneditedImageForUI:(id)a3;
- (void)requestOutputImageForSaving:(id)a3;
- (void)requestOutputImageForUI:(id)a3;
- (void)requestOutputImageInTransition:(BOOL)a3 forSaving:(id)a4;
- (void)requestUneditedImageForUI:(id)a3;
- (void)scheduleDeletionBlock:(id)a3;
- (void)setCachedCGImageBackedUneditedImageForUI:(id)a3;
- (void)setCachedModificationInfo:(id)a3;
- (void)setCachedOutputImage:(id)a3;
- (void)setHasChangedBackingImage:(BOOL)a3;
- (void)setHasOriginalUneditedImage:(BOOL)a3;
- (void)setHighQualityImageQueue:(id)a3;
- (void)setHighQualityQueueHasBeenResumed:(BOOL)a3;
- (void)setHighQualityQueueIsValid:(BOOL)a3;
- (void)setPotentiallyLowQualityImageQueue:(id)a3;
- (void)setScreenshot:(id)a3;
@end

@implementation SSSScreenshotImageProvider

- (SSSScreenshotImageProvider)initWithScreenshot:(id)a3
{
  v18.receiver = self;
  v18.super_class = (Class)SSSScreenshotImageProvider;
  id v3 = a3;
  id v4 = [(SSSScreenshotImageProvider *)&v18 init];
  objc_storeWeak((id *)v4 + 2, v3);

  *((_DWORD *)v4 + 2) = 0;
  v5 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
  dispatch_queue_t v6 = dispatch_queue_create("ScreenshotPotentiallyLowQualityOutputImageQueue", v5);
  v7 = (void *)*((void *)v4 + 3);
  *((void *)v4 + 3) = v6;

  dispatch_queue_t v8 = dispatch_queue_create("ScreenshotHighQualityOutputImageQueue", v5);
  v9 = (void *)*((void *)v4 + 4);
  *((void *)v4 + 4) = v8;

  *((unsigned char *)v4 + 13) = 1;
  dispatch_set_target_queue(*((dispatch_object_t *)v4 + 4), *((dispatch_queue_t *)v4 + 3));
  dispatch_suspend(*((dispatch_object_t *)v4 + 4));
  v10 = [v4 screenshot];
  v11 = [v10 modelModificationInfo];
  id v12 = [v11 copy];
  v13 = (void *)*((void *)v4 + 7);
  *((void *)v4 + 7) = v12;

  v14 = [v4 screenshot];
  uint64_t v15 = [v14 backingImage];
  v16 = (void *)*((void *)v4 + 5);
  *((void *)v4 + 5) = v15;

  return (SSSScreenshotImageProvider *)v4;
}

- (void)dealloc
{
  if ([(SSSScreenshotImageProvider *)self highQualityQueueIsValid]
    && ![(SSSScreenshotImageProvider *)self highQualityQueueHasBeenResumed])
  {
    [(SSSScreenshotImageProvider *)self setHighQualityQueueIsValid:0];
    potentiallyLowQualityImageQueue = self->_potentiallyLowQualityImageQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000271E8;
    block[3] = &unk_100099A20;
    block[4] = self;
    dispatch_sync(potentiallyLowQualityImageQueue, block);
    dispatch_sync((dispatch_queue_t)self->_potentiallyLowQualityImageQueue, &stru_10009A2D0);
  }
  v4.receiver = self;
  v4.super_class = (Class)SSSScreenshotImageProvider;
  [(SSSScreenshotImageProvider *)&v4 dealloc];
}

- (void)_resumeHighQualityQueueIfNecessary
{
  if (![(SSSScreenshotImageProvider *)self highQualityQueueHasBeenResumed])
  {
    [(SSSScreenshotImageProvider *)self setHighQualityQueueHasBeenResumed:1];
    id v3 = [(SSSScreenshotImageProvider *)self highQualityImageQueue];
    dispatch_resume(v3);
  }
}

- (id)_outputImageOnCurrentUneditedImage
{
  p_outputImageLock = &self->_outputImageLock;
  os_unfair_lock_lock(&self->_outputImageLock);
  objc_super v4 = [(SSSScreenshotImageProvider *)self screenshot];
  v5 = v4;
  if (v4)
  {
    cachedModificationInfo = self->_cachedModificationInfo;
    v7 = [v4 modelModificationInfo];
    if ([(SSSScreenshotModificationInfo *)cachedModificationInfo isEqual:v7])
    {
      unsigned __int8 v8 = [(SSSScreenshotImageProvider *)self hasChangedBackingImage];

      if ((v8 & 1) == 0) {
        goto LABEL_12;
      }
    }
    else
    {
    }
  }
  else if (![(SSSScreenshotImageProvider *)self hasChangedBackingImage])
  {
    goto LABEL_12;
  }
  if ([(SSSScreenshotImageProvider *)self hasChangedBackingImage]) {
    [(SSSScreenshotImageProvider *)self setHasChangedBackingImage:0];
  }
  if (v5)
  {
    v9 = +[UIImage _sss_imageFromScreenshot:v5];
    [(SSSScreenshotImageProvider *)self setCachedOutputImage:v9];

    v10 = [v5 modelModificationInfo];
    id v11 = [v10 copy];
    [(SSSScreenshotImageProvider *)self setCachedModificationInfo:v11];
  }
LABEL_12:
  os_unfair_lock_unlock(p_outputImageLock);
  id v12 = self->_cachedOutputImage;

  return v12;
}

- (void)requestOutputImageForSaving:(id)a3
{
}

- (void)requestOutputImageInTransition:(BOOL)a3 forSaving:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  objc_initWeak(&location, self);
  v7 = [(SSSScreenshotImageProvider *)self screenshot];
  unsigned __int8 v8 = [v7 imageGenerator];

  v9 = +[SSSSpringAnimationParameters scaleAnimationParameters];
  [v9 duration];
  double v11 = v10;

  if (v4)
  {
    double v12 = v11 * 1000000000.0;
    if (v11 >= 0.5) {
      double v12 = 500000000.0;
    }
    dispatch_time_t v13 = dispatch_time(0, (uint64_t)v12);
  }
  else
  {
    dispatch_time_t v13 = 0;
  }
  highQualityImageQueue = self->_highQualityImageQueue;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100027530;
  v17[3] = &unk_100099BF8;
  objc_copyWeak(&v20, &location);
  id v18 = v8;
  id v19 = v6;
  id v15 = v6;
  id v16 = v8;
  dispatch_after(v13, highQualityImageQueue, v17);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

- (void)requestOutputImageForUI:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = [(SSSScreenshotImageProvider *)self screenshot];
  id v6 = [v5 imageGenerator];

  potentiallyLowQualityImageQueue = self->_potentiallyLowQualityImageQueue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100027774;
  v10[3] = &unk_10009A320;
  id v11 = v6;
  id v12 = v4;
  id v8 = v4;
  id v9 = v6;
  objc_copyWeak(&v13, &location);
  dispatch_async(potentiallyLowQualityImageQueue, v10);
  objc_destroyWeak(&v13);

  objc_destroyWeak(&location);
}

- (id)requestOutputImageForSavingBlocking
{
  uint64_t v9 = 0;
  double v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = sub_10002792C;
  id v13 = sub_10002793C;
  id v14 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100027944;
  v6[3] = &unk_10009A348;
  id v8 = &v9;
  id v3 = dispatch_semaphore_create(0);
  v7 = v3;
  [(SSSScreenshotImageProvider *)self requestOutputImageForSaving:v6];
  dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
  id v4 = (id)v10[5];

  _Block_object_dispose(&v9, 8);

  return v4;
}

- (id)requestOutputImageForUIBlocking
{
  uint64_t v9 = 0;
  double v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = sub_10002792C;
  id v13 = sub_10002793C;
  id v14 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100027AD8;
  v6[3] = &unk_10009A348;
  id v8 = &v9;
  id v3 = dispatch_semaphore_create(0);
  v7 = v3;
  [(SSSScreenshotImageProvider *)self requestOutputImageForUI:v6];
  dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
  id v4 = (id)v10[5];

  _Block_object_dispose(&v9, 8);

  return v4;
}

- (void)requestUneditedImageForUI:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  potentiallyLowQualityImageQueue = self->_potentiallyLowQualityImageQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100027C08;
  block[3] = &unk_10009A370;
  id v8 = v4;
  id v6 = v4;
  objc_copyWeak(&v9, &location);
  dispatch_async(potentiallyLowQualityImageQueue, block);
  objc_destroyWeak(&v9);

  objc_destroyWeak(&location);
}

- (id)requestUneditedImageForUIBlocking
{
  uint64_t v9 = 0;
  double v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = sub_10002792C;
  id v13 = sub_10002793C;
  id v14 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100027DC0;
  v6[3] = &unk_10009A348;
  id v8 = &v9;
  id v3 = dispatch_semaphore_create(0);
  v7 = v3;
  [(SSSScreenshotImageProvider *)self requestUneditedImageForUI:v6];
  dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
  id v4 = (id)v10[5];

  _Block_object_dispose(&v9, 8);

  return v4;
}

- (void)requestCGImageBackedUneditedImageForUI:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = [(SSSScreenshotImageProvider *)self potentiallyLowQualityImageQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100027F14;
  v7[3] = &unk_10009A398;
  objc_copyWeak(&v9, &location);
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (id)requestCGImageBackedUneditedImageForUIBlocking
{
  uint64_t v9 = 0;
  double v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = sub_10002792C;
  id v13 = sub_10002793C;
  id v14 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000281B4;
  v6[3] = &unk_10009A348;
  id v8 = &v9;
  id v3 = dispatch_semaphore_create(0);
  v7 = v3;
  [(SSSScreenshotImageProvider *)self requestCGImageBackedUneditedImageForUI:v6];
  dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
  id v4 = (id)v10[5];

  _Block_object_dispose(&v9, 8);

  return v4;
}

- (void)_loadUneditedImageIfNecessaryWithCompletionBlock:(id)a3
{
  id v4 = (void (**)(void))a3;
  if (!self->_hasOriginalUneditedImage)
  {
    objc_initWeak(&location, self);
    dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
    id v6 = +[SSScreenshotAssetManager sharedAssetManager];
    v7 = [(SSSScreenshotImageProvider *)self screenshot];
    id v8 = [v7 identifier];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100028380;
    v10[3] = &unk_10009A3C0;
    objc_copyWeak(&v12, &location);
    uint64_t v9 = v5;
    uint64_t v11 = v9;
    [v6 imageWithPreviouslyRegisteredIdentifier:v8 withAccessBlock:v10];

    dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
    objc_destroyWeak(&v12);

    objc_destroyWeak(&location);
  }
  v4[2](v4);
}

- (void)processImageIdentifier:(id)a3
{
  id v4 = a3;
  dispatch_semaphore_t v5 = [(SSSScreenshotImageProvider *)self screenshot];
  [v5 setIdentifier:v4];

  objc_initWeak(&location, self);
  id v6 = [(SSSScreenshotImageProvider *)self potentiallyLowQualityImageQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002857C;
  v7[3] = &unk_100099BD0;
  objc_copyWeak(&v8, &location);
  dispatch_async(v6, v7);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (id)pdfDocument
{
  v2 = [(SSSScreenshotImageProvider *)self requestOutputImageForSavingBlocking];
  id v3 = [objc_alloc((Class)PDFPage) initWithImage:v2];
  [v2 size];
  double v5 = v4;
  [v2 size];
  [v3 setBounds:1 forBox:0.0, 0.0, v5, v6];
  id v7 = objc_alloc_init((Class)PDFDocument);
  [v7 insertPage:v3 atIndex:0];

  return v7;
}

- (void)scheduleDeletionBlock:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  double v5 = [(SSSScreenshotImageProvider *)self highQualityImageQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100028768;
  block[3] = &unk_100099EE8;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (SSSScreenshot)screenshot
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_screenshot);

  return (SSSScreenshot *)WeakRetained;
}

- (void)setScreenshot:(id)a3
{
}

- (OS_dispatch_queue)potentiallyLowQualityImageQueue
{
  return self->_potentiallyLowQualityImageQueue;
}

- (void)setPotentiallyLowQualityImageQueue:(id)a3
{
}

- (OS_dispatch_queue)highQualityImageQueue
{
  return self->_highQualityImageQueue;
}

- (void)setHighQualityImageQueue:(id)a3
{
}

- (BOOL)highQualityQueueHasBeenResumed
{
  return self->_highQualityQueueHasBeenResumed;
}

- (void)setHighQualityQueueHasBeenResumed:(BOOL)a3
{
  self->_highQualityQueueHasBeenResumed = a3;
}

- (BOOL)highQualityQueueIsValid
{
  return self->_highQualityQueueIsValid;
}

- (void)setHighQualityQueueIsValid:(BOOL)a3
{
  self->_highQualityQueueIsValid = a3;
}

- (BOOL)hasOriginalUneditedImage
{
  return self->_hasOriginalUneditedImage;
}

- (void)setHasOriginalUneditedImage:(BOOL)a3
{
  self->_hasOriginalUneditedImage = a3;
}

- (BOOL)hasChangedBackingImage
{
  return self->_hasChangedBackingImage;
}

- (void)setHasChangedBackingImage:(BOOL)a3
{
  self->_hasChangedBackingImage = a3;
}

- (UIImage)cachedOutputImage
{
  return self->_cachedOutputImage;
}

- (void)setCachedOutputImage:(id)a3
{
}

- (UIImage)cachedCGImageBackedUneditedImageForUI
{
  return self->_cachedCGImageBackedUneditedImageForUI;
}

- (void)setCachedCGImageBackedUneditedImageForUI:(id)a3
{
}

- (SSSScreenshotModificationInfo)cachedModificationInfo
{
  return self->_cachedModificationInfo;
}

- (void)setCachedModificationInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedModificationInfo, 0);
  objc_storeStrong((id *)&self->_cachedCGImageBackedUneditedImageForUI, 0);
  objc_storeStrong((id *)&self->_cachedOutputImage, 0);
  objc_storeStrong((id *)&self->_highQualityImageQueue, 0);
  objc_storeStrong((id *)&self->_potentiallyLowQualityImageQueue, 0);

  objc_destroyWeak((id *)&self->_screenshot);
}

@end