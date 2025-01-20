@interface HFCameraImageCache
+ (id)faceCropKeyForPersonName:(id)a3;
+ (id)heroFrameKeyForCameraClipIdentifierString:(id)a3;
+ (id)personNameForFaceCropKey:(id)a3;
+ (id)posterFrameKeyForCameraClipIdentifierString:(id)a3 withOffset:(float)a4;
- (BSUIMappedImageCache)imageCache;
- (HFCameraImageCache)init;
- (HFCameraImageCache)initWithUniqueIdentifier:(id)a3;
- (id)imageForKey:(id)a3;
- (void)addImage:(id)a3 forKey:(id)a4;
- (void)purgeAllImages;
- (void)releaseRecoverableResources;
- (void)setImageCache:(id)a3;
@end

@implementation HFCameraImageCache

- (HFCameraImageCache)init
{
  return [(HFCameraImageCache *)self initWithUniqueIdentifier:@"com.apple.Home.HFCameraImageCache"];
}

- (HFCameraImageCache)initWithUniqueIdentifier:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)HFCameraImageCache;
  v5 = [(HFCameraImageCache *)&v22 init];
  v6 = v5;
  if (v5)
  {
    v5->_imageCacheLock._os_unfair_lock_opaque = 0;
    v7 = +[HFUtilities cachesDirectoryURL];
    v8 = [v7 URLByAppendingPathComponent:@"MappedImageCache"];
    v9 = [v8 URLByAppendingPathComponent:v4];

    if ([v9 checkResourceIsReachableAndReturnError:0])
    {
      v10 = HFLogForCategory(0x15uLL);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = [v9 path];
        *(_DWORD *)buf = 136315394;
        v24 = "-[HFCameraImageCache initWithUniqueIdentifier:]";
        __int16 v25 = 2112;
        v26 = v11;
        _os_log_impl(&dword_20B986000, v10, OS_LOG_TYPE_DEFAULT, "%s: existing image cache found. Attempting to remove it: %@", buf, 0x16u);
      }
      uint64_t v12 = dispatch_get_global_queue(9, 0);
      if (v12)
      {
        imageCache = v12;
        objc_initWeak((id *)buf, v6);
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __47__HFCameraImageCache_initWithUniqueIdentifier___block_invoke;
        block[3] = &unk_264098230;
        id v19 = v9;
        objc_copyWeak(&v21, (id *)buf);
        id v20 = v4;
        dispatch_async(imageCache, block);

        objc_destroyWeak(&v21);
        objc_destroyWeak((id *)buf);
LABEL_11:

        goto LABEL_12;
      }
      v14 = HFLogForCategory(0x15uLL);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v17 = [v9 path];
        *(_DWORD *)buf = 136315394;
        v24 = "-[HFCameraImageCache initWithUniqueIdentifier:]";
        __int16 v25 = 2112;
        v26 = v17;
        _os_log_error_impl(&dword_20B986000, v14, OS_LOG_TYPE_ERROR, "%s: Could not get a global queue with priority background to delete an image cache. Keeping the old one for now: %@", buf, 0x16u);
      }
    }
    uint64_t v15 = [objc_alloc(MEMORY[0x263F29D40]) initWithUniqueIdentifier:v4];
    imageCache = v6->_imageCache;
    v6->_imageCache = (BSUIMappedImageCache *)v15;
    goto LABEL_11;
  }
LABEL_12:

  return v6;
}

void __47__HFCameraImageCache_initWithUniqueIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v3 = *(void *)(a1 + 32);
  id v9 = 0;
  char v4 = [v2 removeItemAtURL:v3 error:&v9];
  id v5 = v9;

  if ((v4 & 1) == 0)
  {
    v6 = HFLogForCategory(0x15uLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v11 = "-[HFCameraImageCache initWithUniqueIdentifier:]_block_invoke";
      __int16 v12 = 2112;
      id v13 = v5;
      _os_log_error_impl(&dword_20B986000, v6, OS_LOG_TYPE_ERROR, "%s: error attempting to remove existing image cache: %@", buf, 0x16u);
    }
  }
  v7 = (void *)[objc_alloc(MEMORY[0x263F29D40]) initWithUniqueIdentifier:*(void *)(a1 + 40)];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained setImageCache:v7];
}

- (void)setImageCache:(id)a3
{
  char v4 = (BSUIMappedImageCache *)a3;
  os_unfair_lock_lock(&self->_imageCacheLock);
  imageCache = self->_imageCache;
  self->_imageCache = v4;

  os_unfair_lock_unlock(&self->_imageCacheLock);
}

- (BSUIMappedImageCache)imageCache
{
  p_imageCacheLock = &self->_imageCacheLock;
  os_unfair_lock_lock(&self->_imageCacheLock);
  char v4 = self->_imageCache;
  os_unfair_lock_unlock(p_imageCacheLock);
  return v4;
}

- (void)addImage:(id)a3 forKey:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v14 = [MEMORY[0x263F08690] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"HFCameraImageCache.m", 94, @"Invalid parameter not satisfying: %@", @"image" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  uint64_t v15 = [MEMORY[0x263F08690] currentHandler];
  [v15 handleFailureInMethod:a2, self, @"HFCameraImageCache.m", 95, @"Invalid parameter not satisfying: %@", @"key" object file lineNumber description];

LABEL_3:
  v10 = [(HFCameraImageCache *)self imageCache];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __38__HFCameraImageCache_addImage_forKey___block_invoke;
  v16[3] = &unk_264098258;
  id v17 = v7;
  id v11 = v7;
  __int16 v12 = [v10 imageForKey:v9 generatingIfNecessaryWithBlock:v16];

  if (!v12)
  {
    id v13 = HFLogForCategory(0x15uLL);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v19 = v9;
      _os_log_impl(&dword_20B986000, v13, OS_LOG_TYPE_DEFAULT, "Unable to add image to CameraImageCache for key: %@", buf, 0xCu);
    }
  }
}

id __38__HFCameraImageCache_addImage_forKey___block_invoke(uint64_t a1, uint64_t *a2)
{
  int v4 = MGGetBoolAnswer();
  uint64_t v5 = 4;
  if (!v4) {
    uint64_t v5 = 0;
  }
  *a2 = v5;
  v6 = *(void **)(a1 + 32);
  return v6;
}

- (id)imageForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HFCameraImageCache *)self imageCache];
  v6 = [v5 imageForKey:v4 generatingIfNecessaryWithBlock:0];

  return v6;
}

+ (id)posterFrameKeyForCameraClipIdentifierString:(id)a3 withOffset:(float)a4
{
  return (id)[NSString stringWithFormat:@"%@-%.0f", a3, a4];
}

+ (id)faceCropKeyForPersonName:(id)a3
{
  return (id)[NSString stringWithFormat:@"%@%@", a3, @"-face-crop"];
}

+ (id)personNameForFaceCropKey:(id)a3
{
  return (id)[a3 stringByReplacingOccurrencesOfString:@"-face-crop" withString:&stru_26C081158];
}

+ (id)heroFrameKeyForCameraClipIdentifierString:(id)a3
{
  return (id)[NSString stringWithFormat:@"%@-hero", a3];
}

- (void)releaseRecoverableResources
{
  id v2 = [(HFCameraImageCache *)self imageCache];
  [v2 releaseRecoverableResources];
}

- (void)purgeAllImages
{
  id v2 = [(HFCameraImageCache *)self imageCache];
  [v2 removeAllImagesWithCompletion:&__block_literal_global_158];
}

void __36__HFCameraImageCache_purgeAllImages__block_invoke()
{
  v0 = HFLogForCategory(0x15uLL);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v1 = 0;
    _os_log_debug_impl(&dword_20B986000, v0, OS_LOG_TYPE_DEBUG, "Purged all camera images from the cache.", v1, 2u);
  }
}

- (void).cxx_destruct
{
}

@end