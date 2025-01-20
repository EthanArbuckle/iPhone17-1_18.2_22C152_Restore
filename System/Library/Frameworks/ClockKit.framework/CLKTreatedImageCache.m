@interface CLKTreatedImageCache
+ (id)sharedInstance;
- (CLKTreatedImageCache)init;
- (id)_imageForKey:(id)a3;
- (id)imageForRawImage:(id)a3 maxSDKSize:(CGSize)a4 maxDeviceSize:(CGSize)a5 cornerRadius:(double)a6;
- (id)imageForRawImage:(id)a3 maxSDKSize:(CGSize)a4 maxDeviceSize:(CGSize)a5 maskMode:(int64_t)a6;
- (id)imageForRawImage:(id)a3 scale:(double)a4 sdkDeviceScale:(double)a5 cornerRadius:(double)a6;
- (id)imageForRawImage:(id)a3 scale:(double)a4 sdkDeviceScale:(double)a5 maskMode:(int64_t)a6;
- (void)_queue_pruneCacheIfNecessary;
- (void)purgeCache;
@end

@implementation CLKTreatedImageCache

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_4 != -1) {
    dispatch_once(&sharedInstance_onceToken_4, &__block_literal_global_23);
  }
  v2 = (void *)sharedInstance_sharedCache;

  return v2;
}

void __38__CLKTreatedImageCache_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(CLKTreatedImageCache);
  v1 = (void *)sharedInstance_sharedCache;
  sharedInstance_sharedCache = (uint64_t)v0;

  id v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 addObserver:sharedInstance_sharedCache selector:sel_purgeCache name:@"CLKClearCacheRequestNotification" object:0];
}

- (void)purgeCache
{
  [(NSMutableDictionary *)self->_cache removeAllObjects];
  recentlyUsedKeys = self->_recentlyUsedKeys;

  [(NSMutableArray *)recentlyUsedKeys removeAllObjects];
}

- (CLKTreatedImageCache)init
{
  v10.receiver = self;
  v10.super_class = (Class)CLKTreatedImageCache;
  id v2 = [(CLKTreatedImageCache *)&v10 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    cache = v2->_cache;
    v2->_cache = v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    recentlyUsedKeys = v2->_recentlyUsedKeys;
    v2->_recentlyUsedKeys = v5;

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.ClockKit.CLKTreatedImageCache", 0);
    internalQueue = v2->_internalQueue;
    v2->_internalQueue = (OS_dispatch_queue *)v7;
  }
  return v2;
}

- (id)imageForRawImage:(id)a3 scale:(double)a4 sdkDeviceScale:(double)a5 maskMode:(int64_t)a6
{
  id v10 = a3;
  v11 = v10;
  if (!v10 || ([v10 size], v12 <= 0.0))
  {
    v16 = 0;
    v15 = v11;
    goto LABEL_6;
  }
  [v11 size];
  double v14 = v13;

  if (v14 > 0.0)
  {
    v15 = +[CLKTreatedImageKey keyWithRawImage:v11 scale:a6 sdkDeviceScale:a4 maskMode:a5];
    v16 = [(CLKTreatedImageCache *)self _imageForKey:v15];
LABEL_6:

    goto LABEL_7;
  }
  v16 = 0;
LABEL_7:

  return v16;
}

- (id)imageForRawImage:(id)a3 scale:(double)a4 sdkDeviceScale:(double)a5 cornerRadius:(double)a6
{
  id v10 = a3;
  v11 = v10;
  if (!v10 || ([v10 size], v12 <= 0.0))
  {
    v16 = 0;
    v15 = v11;
    goto LABEL_6;
  }
  [v11 size];
  double v14 = v13;

  if (v14 > 0.0)
  {
    v15 = +[CLKTreatedImageKey keyWithRawImage:v11 scale:a4 sdkDeviceScale:a5 cornerRadius:a6];
    v16 = [(CLKTreatedImageCache *)self _imageForKey:v15];
LABEL_6:

    goto LABEL_7;
  }
  v16 = 0;
LABEL_7:

  return v16;
}

- (id)imageForRawImage:(id)a3 maxSDKSize:(CGSize)a4 maxDeviceSize:(CGSize)a5 maskMode:(int64_t)a6
{
  double height = a5.height;
  double width = a5.width;
  double v9 = a4.height;
  double v10 = a4.width;
  id v12 = a3;
  double v13 = v12;
  if (!v12 || ([v12 size], v14 <= 0.0))
  {
    v18 = 0;
    v17 = v13;
    goto LABEL_6;
  }
  [v13 size];
  double v16 = v15;

  if (v16 > 0.0)
  {
    v17 = +[CLKTreatedImageKey keyWithRawImage:maxSDKSize:maxDeviceSize:maskMode:](CLKTreatedImageKey, "keyWithRawImage:maxSDKSize:maxDeviceSize:maskMode:", v13, a6, v10, v9, width, height);
    v18 = [(CLKTreatedImageCache *)self _imageForKey:v17];
LABEL_6:

    goto LABEL_7;
  }
  v18 = 0;
LABEL_7:

  return v18;
}

- (id)imageForRawImage:(id)a3 maxSDKSize:(CGSize)a4 maxDeviceSize:(CGSize)a5 cornerRadius:(double)a6
{
  double height = a5.height;
  double width = a5.width;
  double v9 = a4.height;
  double v10 = a4.width;
  id v12 = a3;
  double v13 = v12;
  if (!v12 || ([v12 size], v14 <= 0.0))
  {
    v18 = 0;
    v17 = v13;
    goto LABEL_6;
  }
  [v13 size];
  double v16 = v15;

  if (v16 > 0.0)
  {
    v17 = +[CLKTreatedImageKey keyWithRawImage:maxSDKSize:maxDeviceSize:cornerRadius:](CLKTreatedImageKey, "keyWithRawImage:maxSDKSize:maxDeviceSize:cornerRadius:", v13, v10, v9, width, height, a6);
    v18 = [(CLKTreatedImageCache *)self _imageForKey:v17];
LABEL_6:

    goto LABEL_7;
  }
  v18 = 0;
LABEL_7:

  return v18;
}

- (void)_queue_pruneCacheIfNecessary
{
  if ((unint64_t)[(NSMutableDictionary *)self->_cache count] >= 0x1F)
  {
    do
    {
      v3 = [(NSMutableArray *)self->_recentlyUsedKeys firstObject];
      if (v3)
      {
        [(NSMutableDictionary *)self->_cache removeObjectForKey:v3];
        [(NSMutableArray *)self->_recentlyUsedKeys removeObjectAtIndex:0];
      }
    }
    while ((unint64_t)[(NSMutableDictionary *)self->_cache count] > 0x1E);
  }
}

- (id)_imageForKey:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  double v13 = &v12;
  uint64_t v14 = 0x3032000000;
  double v15 = __Block_byref_object_copy__5;
  double v16 = __Block_byref_object_dispose__5;
  id v17 = 0;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__CLKTreatedImageCache__imageForKey___block_invoke;
  block[3] = &unk_26440F1F8;
  id v10 = v4;
  v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(internalQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

uint64_t __37__CLKTreatedImageCache__imageForKey___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKey:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    id v5 = *(id *)(a1 + 40);
    id v6 = [v5 rawImage];
    id v7 = +[CLKRenderingContext sharedRenderingContext];
    v8 = [v7 device];

    [v6 size];
    double v10 = v9;
    double v12 = v11;
    double v14 = *MEMORY[0x263F001B0];
    double v13 = *(double *)(MEMORY[0x263F001B0] + 8);
    uint64_t v15 = [v5 scaleMode];
    if (v15)
    {
      if (v15 == 1)
      {
        [v5 scale];
        if (v16 != 0.0)
        {
          [v5 scale];
          double v18 = v10 * v17;
          [v5 sdkDeviceScale];
          CLKFloorForDevice(v8, v18 * v19);
          double v10 = v20;
          [v5 scale];
          double v22 = v12 * v21;
          [v5 sdkDeviceScale];
          double v24 = v22 * v23;
LABEL_6:
          CLKFloorForDevice(v8, v24);
          double v12 = v25;
          double v26 = *MEMORY[0x263F00148];
          double v27 = *(double *)(MEMORY[0x263F00148] + 8);
          double v13 = v25;
          double v14 = v10;
          goto LABEL_26;
        }
LABEL_24:
        v41 = [v5 rawImage];
LABEL_33:

        uint64_t v51 = *(void *)(*(void *)(a1 + 48) + 8);
        v52 = *(void **)(v51 + 40);
        *(void *)(v51 + 40) = v41;

        [*(id *)(*(void *)(a1 + 32) + 8) setObject:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) forKey:*(void *)(a1 + 40)];
        goto LABEL_34;
      }
      double v26 = *MEMORY[0x263F001A8];
      double v27 = *(double *)(MEMORY[0x263F001A8] + 8);
      double v10 = *(double *)(MEMORY[0x263F001A8] + 16);
      double v12 = *(double *)(MEMORY[0x263F001A8] + 24);
    }
    else
    {
      [v5 maxDeviceSize];
      if (v29 == v14 && v28 == v13) {
        goto LABEL_24;
      }
      [v5 maxSDKSize];
      if (v32 == v14 && v31 == v13) {
        goto LABEL_24;
      }
      if (v10 == v14 && v12 == v13) {
        goto LABEL_24;
      }
      [v5 maxSDKSize];
      double v36 = v35 / v10;
      double v38 = v37 / v12;
      if (v36 >= v38) {
        double v39 = v38;
      }
      else {
        double v39 = v36;
      }
      if (v39 < 1.0)
      {
        CLKFloorForDevice(v8, v10 * v39);
        double v10 = v40;
        double v24 = v12 * v39;
        goto LABEL_6;
      }
      [v5 maxDeviceSize];
      double v56 = v55;
      double v58 = v57;
      [v5 maxSDKSize];
      if (!CLKSizeEqualsSize(v56, v58, v59, v60))
      {
        [v5 maxDeviceSize];
        double v62 = v61;
        [v5 maxSDKSize];
        double v10 = v10 * (v62 / v63);
        [v5 maxDeviceSize];
        double v65 = v64;
        [v5 maxSDKSize];
        double v12 = v12 * (v65 / v66);
      }
      [v5 maxDeviceSize];
      double v14 = v67;
      double v13 = v68;
      double v26 = (v67 - v10) * 0.5;
      double v27 = (v68 - v12) * 0.5;
    }
LABEL_26:
    [v8 screenScale];
    CGFloat v43 = v42;
    v70.double width = v14;
    v70.double height = v13;
    UIGraphicsBeginImageContextWithOptions(v70, 0, v43);
    uint64_t v44 = [v5 maskMode];
    if (v44 == 2)
    {
      v46 = (void *)MEMORY[0x263F824C0];
      [v5 cornerRadius];
      v45 = objc_msgSend(v46, "bezierPathWithRoundedRect:cornerRadius:", 0.0, 0.0, v14, v13, v47);
    }
    else
    {
      if (v44 != 1) {
        goto LABEL_31;
      }
      v45 = objc_msgSend(MEMORY[0x263F824C0], "bezierPathWithOvalInRect:", 0.0, 0.0, v14, v13);
    }
    v48 = v45;
    [v45 addClip];

LABEL_31:
    objc_msgSend(v6, "drawInRect:", v26, v27, v10, v12);
    v41 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    uint64_t v49 = [v41 renderingMode];
    if (v49 != [v6 renderingMode])
    {
      uint64_t v50 = objc_msgSend(v41, "imageWithRenderingMode:", objc_msgSend(v6, "renderingMode"));

      v41 = (void *)v50;
    }
    goto LABEL_33;
  }
LABEL_34:
  [*(id *)(*(void *)(a1 + 32) + 16) removeObject:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 32) + 16) addObject:*(void *)(a1 + 40)];
  v53 = *(void **)(a1 + 32);

  return objc_msgSend(v53, "_queue_pruneCacheIfNecessary");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_recentlyUsedKeys, 0);

  objc_storeStrong((id *)&self->_cache, 0);
}

@end