@interface AAUIBadgeImageFactory
- (AAUIAchievementResourceProvider)resourceProvider;
- (AAUIBadgeImageFactory)init;
- (AAUIBadgeView)earnedBadgeView;
- (AAUIBadgeView)unearnedBadgeView;
- (BOOL)hasCachedThumbnailImageForAchievement:(id)a3 size:(CGSize)a4;
- (BOOL)hasCachedThumbnailImageForAchievements:(id)a3 size:(CGSize)a4 alignment:(int)a5;
- (BOOL)hasCachedThumbnailImageForAchievements:(id)a3 size:(CGSize)a4 alignment:(int)a5 stackType:(int)a6;
- (CGGradient)_makeShadowGradient;
- (CGGradient)_makeShadowSolidGradient;
- (CGRect)_initialFrameForSize:(CGSize)a3 isRTL:(BOOL)a4 isStack:(BOOL)a5;
- (NSMutableDictionary)cache;
- (OS_dispatch_queue)imageCreationQueue;
- (double)_stackBadgeOverlapForStackType:(int)a3;
- (id)_availableAchievementsForStackType:(int)a3 andAchievements:(id)a4;
- (id)_makeGradientImage:(id)a3 solidGradient:(CGGradient *)a4 gradient:(CGGradient *)a5 isRTL:(BOOL)a6;
- (id)_perfectCropForImage:(id)a3 andDirections:(unint64_t)a4;
- (id)_queue_generateImageForConfiguration:(id)a3 size:(CGSize)a4 stackType:(int)a5 isRTL:(BOOL)a6 unearned:(BOOL)a7;
- (id)_queue_thumbnailImageForAchievements:(id)a3 size:(CGSize)a4 alignment:(int)a5 stackType:(int)a6;
- (id)thumbnailImageForAchievement:(id)a3 size:(CGSize)a4;
- (id)thumbnailImageForAchievements:(id)a3 size:(CGSize)a4 alignment:(int)a5;
- (id)thumbnailImageForAchievements:(id)a3 size:(CGSize)a4 alignment:(int)a5 stackType:(int)a6;
- (os_unfair_lock_s)cacheLock;
- (void)clearAllCachedImages;
- (void)setCache:(id)a3;
- (void)setCacheLock:(os_unfair_lock_s)a3;
- (void)setEarnedBadgeView:(id)a3;
- (void)setImageCreationQueue:(id)a3;
- (void)setResourceProvider:(id)a3;
- (void)setUnearnedBadgeView:(id)a3;
- (void)thumbnailImageForAchievement:(id)a3 size:(CGSize)a4 completion:(id)a5;
- (void)thumbnailImageForAchievements:(id)a3 size:(CGSize)a4 alignment:(int)a5 completion:(id)a6;
- (void)thumbnailImageForAchievements:(id)a3 size:(CGSize)a4 alignment:(int)a5 stackType:(int)a6 completion:(id)a7;
@end

@implementation AAUIBadgeImageFactory

void __87__AAUIBadgeImageFactory__queue_thumbnailImageForAchievements_size_alignment_stackType___block_invoke_2(uint64_t a1, void *a2, unint64_t a3, unsigned char *a4)
{
  id v19 = a2;
  v7 = (void *)MEMORY[0x22A6B4B30]();
  v8 = [*(id *)(a1 + 32) badgeConfigurationForAchievement:v19];
  v9 = objc_msgSend(*(id *)(a1 + 40), "_queue_generateImageForConfiguration:size:stackType:isRTL:unearned:", v8, *(unsigned int *)(a1 + 112), *(unsigned __int8 *)(a1 + 116), objc_msgSend(v19, "unearned"), *(double *)(a1 + 80), *(double *)(a1 + 80));
  v10 = v9;
  if (v9)
  {
    if (*(unsigned char *)(a1 + 117))
    {
      [v9 size];
      double v12 = v11 * *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 56);
      [v10 size];
      *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 48) = v12 / v13;
      uint64_t v14 = *(void *)(*(void *)(a1 + 56) + 8);
      double v15 = *(double *)(v14 + 32);
      if (*(unsigned char *)(a1 + 116))
      {
        if (v15 >= *(double *)(a1 + 72) - *(double *)(v14 + 48)) {
          double v15 = *(double *)(a1 + 72) - *(double *)(v14 + 48);
        }
      }
      else
      {
        double v15 = fmax(v15 - *(double *)(v14 + 48), 0.0);
      }
      *(double *)(v14 + 32) = v15;
    }
    objc_msgSend(v10, "drawInRect:", *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 32), *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 48), *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 56));
    if (*(unsigned char *)(a1 + 117) && [*(id *)(a1 + 48) count] - 1 > a3)
    {
      v16 = [*(id *)(a1 + 40) _makeGradientImage:v10 solidGradient:*(void *)(a1 + 88) gradient:*(void *)(a1 + 96) isRTL:*(unsigned __int8 *)(a1 + 116)];
      objc_msgSend(v16, "drawInRect:blendMode:alpha:", 22, *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 32), *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 48), *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 56), 1.0);
    }
    uint64_t v17 = *(void *)(*(void *)(a1 + 56) + 8);
    if (*(unsigned char *)(a1 + 116)) {
      double v18 = *(double *)(a1 + 104) + *(double *)(v17 + 32);
    }
    else {
      double v18 = *(double *)(v17 + 32) + *(double *)(v17 + 48) - *(double *)(a1 + 104);
    }
    *(double *)(v17 + 32) = v18;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
    *a4 = 1;
  }
}

BOOL __76__AAUIBadgeImageFactory__availableAchievementsForStackType_andAchievements___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 badgeShapeName];

  if (!v3)
  {
    v4 = ACHLogDefault();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      __76__AAUIBadgeImageFactory__availableAchievementsForStackType_andAchievements___block_invoke_cold_1(v2, v4);
    }
  }
  return v3 != 0;
}

- (id)_availableAchievementsForStackType:(int)a3 andAchievements:(id)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  v6 = objc_msgSend(a4, "hk_filter:", &__block_literal_global);
  if (![v6 count])
  {
    v4 = (void *)MEMORY[0x263EFFA68];
    goto LABEL_13;
  }
  if ((a3 - 2) < 2)
  {
    unint64_t v8 = [v6 count];
    BOOL v9 = v8 >= 3;
    uint64_t v10 = 3;
LABEL_9:
    if (v9) {
      unint64_t v11 = v10;
    }
    else {
      unint64_t v11 = v8;
    }
    v4 = objc_msgSend(v6, "subarrayWithRange:", 0, v11);
    goto LABEL_13;
  }
  if (a3 == 1)
  {
    unint64_t v8 = [v6 count];
    BOOL v9 = v8 >= 5;
    uint64_t v10 = 5;
    goto LABEL_9;
  }
  if (!a3)
  {
    v7 = [v6 objectAtIndexedSubscript:0];
    v13[0] = v7;
    v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
  }
LABEL_13:

  return v4;
}

void __91__AAUIBadgeImageFactory_thumbnailImageForAchievements_size_alignment_stackType_completion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "thumbnailImageForAchievements:size:alignment:stackType:", *(void *)(a1 + 40), *(unsigned int *)(a1 + 72), *(unsigned int *)(a1 + 76), *(double *)(a1 + 56), *(double *)(a1 + 64));
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (id)thumbnailImageForAchievements:(id)a3 size:(CGSize)a4 alignment:(int)a5 stackType:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v7 = *(void *)&a5;
  double height = a4.height;
  double width = a4.width;
  id v11 = a3;
  if ([v11 count])
  {
    double v12 = AAUIAchievementBadgeCacheKey(v11, v7, v6);
    p_cacheLock = &self->_cacheLock;
    os_unfair_lock_lock(&self->_cacheLock);
    uint64_t v14 = [(AAUIBadgeImageFactory *)self cache];
    double v15 = [v14 objectForKey:v12];

    os_unfair_lock_unlock(&self->_cacheLock);
    if (v15)
    {
      id v16 = v15;
    }
    else
    {
      uint64_t v17 = [(AAUIBadgeImageFactory *)self _availableAchievementsForStackType:v6 andAchievements:v11];
      id v16 = 0;
      if ([v17 count])
      {
        if (!v6)
        {
          double width = width + -10.0;
          double height = height + -10.0;
        }
        if (width > 0.0 && height > 0.0)
        {
          -[AAUIBadgeImageFactory _queue_thumbnailImageForAchievements:size:alignment:stackType:](self, "_queue_thumbnailImageForAchievements:size:alignment:stackType:", v17, v7, v6, width, height);
          id v16 = (id)objc_claimAutoreleasedReturnValue();
          if (v16)
          {
            os_unfair_lock_lock(&self->_cacheLock);
            double v18 = [(AAUIBadgeImageFactory *)self cache];
            [v18 setObject:v16 forKey:v12];

            os_unfair_lock_unlock(p_cacheLock);
          }
          else
          {
            id v19 = ACHLogDefault();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
              -[AAUIBadgeImageFactory thumbnailImageForAchievements:size:alignment:stackType:](v11, v19, width, height);
            }
          }
        }
      }
    }
  }
  else
  {
    id v16 = 0;
  }

  return v16;
}

- (NSMutableDictionary)cache
{
  return self->_cache;
}

- (id)_queue_thumbnailImageForAchievements:(id)a3 size:(CGSize)a4 alignment:(int)a5 stackType:(int)a6
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v10 = a3;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy_;
  v25 = __Block_byref_object_dispose_;
  id v26 = 0;
  id v11 = [(AAUIBadgeImageFactory *)self imageCreationQueue];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __87__AAUIBadgeImageFactory__queue_thumbnailImageForAchievements_size_alignment_stackType___block_invoke;
  v15[3] = &unk_264860AB8;
  int v20 = a6;
  CGFloat v18 = width;
  CGFloat v19 = height;
  v15[4] = self;
  id v16 = v10;
  uint64_t v17 = &v21;
  id v12 = v10;
  dispatch_sync(v11, v15);

  id v13 = (id)v22[5];
  _Block_object_dispose(&v21, 8);

  return v13;
}

- (OS_dispatch_queue)imageCreationQueue
{
  return self->_imageCreationQueue;
}

- (id)_queue_generateImageForConfiguration:(id)a3 size:(CGSize)a4 stackType:(int)a5 isRTL:(BOOL)a6 unearned:(BOOL)a7
{
  BOOL v8 = a6;
  double height = a4.height;
  double width = a4.width;
  id v13 = a3;
  uint64_t v14 = [(AAUIBadgeImageFactory *)self imageCreationQueue];
  dispatch_assert_queue_V2(v14);

  double v15 = width * 1.4;
  double v16 = height * 1.4;
  if (a7) {
    [(AAUIBadgeImageFactory *)self unearnedBadgeView];
  }
  else {
  uint64_t v17 = [(AAUIBadgeImageFactory *)self earnedBadgeView];
  }
  [v17 setConfiguration:v13];

  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __92__AAUIBadgeImageFactory__queue_generateImageForConfiguration_size_stackType_isRTL_unearned___block_invoke;
  aBlock[3] = &unk_264860B00;
  id v18 = v17;
  id v30 = v18;
  long long v31 = *MEMORY[0x263F001A8];
  double v32 = v15;
  double v33 = v16;
  CGFloat v19 = (void (**)(void))_Block_copy(aBlock);
  if ([MEMORY[0x263F08B88] isMainThread])
  {
    v19[2](v19);
  }
  else
  {
    uint64_t v24 = MEMORY[0x263EF8330];
    uint64_t v25 = 3221225472;
    id v26 = __92__AAUIBadgeImageFactory__queue_generateImageForConfiguration_size_stackType_isRTL_unearned___block_invoke_2;
    v27 = &unk_264860B28;
    v28 = v19;
    dispatch_sync(MEMORY[0x263EF83A0], &v24);
  }
  int v20 = objc_msgSend(v18, "snapshot", v24, v25, v26, v27);
  [v18 cleanupAfterSnapshot];
  if (a5)
  {
    if (v8) {
      uint64_t v21 = 13;
    }
    else {
      uint64_t v21 = 14;
    }
    uint64_t v22 = [(AAUIBadgeImageFactory *)self _perfectCropForImage:v20 andDirections:v21];

    int v20 = (void *)v22;
  }

  return v20;
}

- (AAUIBadgeView)unearnedBadgeView
{
  return self->_unearnedBadgeView;
}

- (AAUIBadgeImageFactory)init
{
  v14.receiver = self;
  v14.super_class = (Class)AAUIBadgeImageFactory;
  id v2 = [(AAUIBadgeImageFactory *)&v14 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    cache = v2->_cache;
    v2->_cache = v3;

    v5 = objc_alloc_init(AAUIAchievementResourceProvider);
    resourceProvider = v2->_resourceProvider;
    v2->_resourceProvider = v5;

    uint64_t v7 = HKCreateSerialDispatchQueueWithQOSClass();
    imageCreationQueue = v2->_imageCreationQueue;
    v2->_imageCreationQueue = (OS_dispatch_queue *)v7;

    v2->_cacheLock._os_unfair_lock_opaque = 0;
    BOOL v9 = [[AAUIBadgeView alloc] initUsingEarnedShader:0];
    unearnedBadgeView = v2->_unearnedBadgeView;
    v2->_unearnedBadgeView = v9;

    id v11 = [[AAUIBadgeView alloc] initUsingEarnedShader:1];
    earnedBadgeView = v2->_earnedBadgeView;
    v2->_earnedBadgeView = v11;
  }
  return v2;
}

void __87__AAUIBadgeImageFactory__queue_thumbnailImageForAchievements_size_alignment_stackType___block_invoke(uint64_t a1)
{
  uint64_t IsRightToLeft = FIUILocaleIsRightToLeft();
  unsigned int v3 = *(_DWORD *)(a1 + 72);
  [*(id *)(a1 + 32) _stackBadgeOverlapForStackType:v3];
  double v4 = *(double *)(a1 + 64);
  v5 = (double *)(a1 + 56);
  double v7 = v4 * (1.0 - v6);
  double v8 = -(*(double *)(a1 + 56) - v4 * (double)(unint64_t)[*(id *)(a1 + 40) count]);
  uint64_t v9 = [*(id *)(a1 + 40) count];
  if (v7 >= v4 - v8 / (double)(unint64_t)(v9 - 1)) {
    double v7 = v4 - v8 / (double)(unint64_t)(v9 - 1);
  }
  v48[0] = 0;
  v48[1] = v48;
  v48[2] = 0x4010000000;
  v48[3] = "";
  long long v49 = 0u;
  long long v50 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "_initialFrameForSize:isRTL:isStack:", IsRightToLeft, v3 != 0, *v5, *(double *)(a1 + 64));
  *(void *)&long long v49 = v10;
  *((void *)&v49 + 1) = v11;
  *(void *)&long long v50 = v12;
  *((void *)&v50 + 1) = v13;
  if (v3)
  {
    objc_super v14 = (CGGradient *)[*(id *)(a1 + 32) _makeShadowGradient];
    double v15 = (CGGradient *)[*(id *)(a1 + 32) _makeShadowSolidGradient];
  }
  else
  {
    objc_super v14 = 0;
    double v15 = 0;
  }
  double v16 = [*(id *)(a1 + 32) resourceProvider];
  UIGraphicsBeginImageContextWithOptions(*(CGSize *)(a1 + 56), 0, 0.0);
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSetInterpolationQuality(CurrentContext, kCGInterpolationHigh);
  uint64_t v44 = 0;
  v45 = &v44;
  uint64_t v46 = 0x2020000000;
  char v47 = 0;
  id v18 = objc_msgSend(*(id *)(a1 + 40), "hk_reversed");
  uint64_t v28 = MEMORY[0x263EF8330];
  uint64_t v29 = 3221225472;
  id v30 = __87__AAUIBadgeImageFactory__queue_thumbnailImageForAchievements_size_alignment_stackType___block_invoke_2;
  long long v31 = &unk_264860A90;
  id v19 = v16;
  uint64_t v20 = *(void *)(a1 + 32);
  uint64_t v21 = *(void **)(a1 + 40);
  id v32 = v19;
  uint64_t v33 = v20;
  long long v37 = *(_OWORD *)v5;
  int v41 = *(_DWORD *)(a1 + 72);
  char v42 = IsRightToLeft;
  BOOL v43 = v3 != 0;
  v35 = v48;
  v38 = v15;
  v39 = v14;
  double v40 = v7;
  id v34 = v21;
  v36 = &v44;
  [v18 enumerateObjectsUsingBlock:&v28];

  if (*((unsigned char *)v45 + 24))
  {
    uint64_t v22 = ACHLogDefault();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      __87__AAUIBadgeImageFactory__queue_thumbnailImageForAchievements_size_alignment_stackType___block_invoke_cold_1(v22);
    }
    goto LABEL_11;
  }
  uint64_t v23 = UIGraphicsGetImageFromCurrentImageContext();
  uint64_t v24 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v25 = *(void **)(v24 + 40);
  *(void *)(v24 + 40) = v23;

  UIGraphicsEndImageContext();
  CGGradientRelease(v14);
  CGGradientRelease(v15);
  if (v3)
  {
    uint64_t v26 = objc_msgSend(*(id *)(a1 + 32), "_perfectCropForImage:andDirections:", *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), 3, v28, v29, v30, v31, v32, v33);
    uint64_t v27 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v22 = *(NSObject **)(v27 + 40);
    *(void *)(v27 + 40) = v26;
LABEL_11:
  }
  _Block_object_dispose(&v44, 8);

  _Block_object_dispose(v48, 8);
}

- (AAUIAchievementResourceProvider)resourceProvider
{
  return self->_resourceProvider;
}

- (double)_stackBadgeOverlapForStackType:(int)a3
{
  double result = 0.0;
  if ((a3 - 1) <= 2) {
    return dbl_2292CED88[a3 - 1];
  }
  return result;
}

- (CGRect)_initialFrameForSize:(CGSize)a3 isRTL:(BOOL)a4 isStack:(BOOL)a5
{
  double height = a3.height;
  double v6 = 0.0;
  if (!a5 || a4) {
    a3.double width = 0.0;
  }
  double v7 = height;
  result.origin.x = a3.width;
  result.size.double height = v7;
  result.size.double width = height;
  result.origin.y = v6;
  return result;
}

- (void)thumbnailImageForAchievement:(id)a3 size:(CGSize)a4 completion:(id)a5
{
  double height = a4.height;
  double width = a4.width;
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v13 = a3;
  uint64_t v9 = (void *)MEMORY[0x263EFF8C0];
  id v10 = a5;
  id v11 = a3;
  uint64_t v12 = [v9 arrayWithObjects:&v13 count:1];

  -[AAUIBadgeImageFactory thumbnailImageForAchievements:size:alignment:stackType:completion:](self, "thumbnailImageForAchievements:size:alignment:stackType:completion:", v12, 0, 0, v10, width, height, v13, v14);
}

- (void)thumbnailImageForAchievements:(id)a3 size:(CGSize)a4 alignment:(int)a5 stackType:(int)a6 completion:(id)a7
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v13 = a3;
  id v14 = a7;
  if (v14)
  {
    double v15 = dispatch_get_global_queue(21, 0);
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __91__AAUIBadgeImageFactory_thumbnailImageForAchievements_size_alignment_stackType_completion___block_invoke;
    v16[3] = &unk_264860A68;
    v16[4] = self;
    id v17 = v13;
    CGFloat v19 = width;
    CGFloat v20 = height;
    int v21 = a5;
    int v22 = a6;
    id v18 = v14;
    dispatch_async(v15, v16);
  }
}

- (id)thumbnailImageForAchievement:(id)a3 size:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v12 = a3;
  double v7 = (void *)MEMORY[0x263EFF8C0];
  id v8 = a3;
  uint64_t v9 = [v7 arrayWithObjects:&v12 count:1];

  id v10 = -[AAUIBadgeImageFactory thumbnailImageForAchievements:size:alignment:stackType:](self, "thumbnailImageForAchievements:size:alignment:stackType:", v9, 0, 0, width, height, v12, v13);

  return v10;
}

- (id)thumbnailImageForAchievements:(id)a3 size:(CGSize)a4 alignment:(int)a5
{
  return -[AAUIBadgeImageFactory thumbnailImageForAchievements:size:alignment:stackType:](self, "thumbnailImageForAchievements:size:alignment:stackType:", a3, *(void *)&a5, 3, a4.width, a4.height);
}

- (void)thumbnailImageForAchievements:(id)a3 size:(CGSize)a4 alignment:(int)a5 completion:(id)a6
{
}

- (BOOL)hasCachedThumbnailImageForAchievement:(id)a3 size:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v11 = a3;
  double v7 = (void *)MEMORY[0x263EFF8C0];
  id v8 = a3;
  uint64_t v9 = [v7 arrayWithObjects:&v11 count:1];

  LOBYTE(self) = -[AAUIBadgeImageFactory hasCachedThumbnailImageForAchievements:size:alignment:stackType:](self, "hasCachedThumbnailImageForAchievements:size:alignment:stackType:", v9, 0, 0, width, height, v11, v12);
  return (char)self;
}

- (BOOL)hasCachedThumbnailImageForAchievements:(id)a3 size:(CGSize)a4 alignment:(int)a5
{
  return -[AAUIBadgeImageFactory hasCachedThumbnailImageForAchievements:size:alignment:stackType:](self, "hasCachedThumbnailImageForAchievements:size:alignment:stackType:", a3, *(void *)&a5, 3, a4.width, a4.height);
}

- (BOOL)hasCachedThumbnailImageForAchievements:(id)a3 size:(CGSize)a4 alignment:(int)a5 stackType:(int)a6
{
  double v7 = AAUIAchievementBadgeCacheKey(a3, *(uint64_t *)&a5, *(uint64_t *)&a6);
  p_cacheLock = &self->_cacheLock;
  os_unfair_lock_lock(&self->_cacheLock);
  uint64_t v9 = [(AAUIBadgeImageFactory *)self cache];
  id v10 = [v9 objectForKey:v7];

  os_unfair_lock_unlock(p_cacheLock);
  return v10 != 0;
}

- (void)clearAllCachedImages
{
  p_cacheLock = &self->_cacheLock;
  os_unfair_lock_lock(&self->_cacheLock);
  double v4 = [(AAUIBadgeImageFactory *)self cache];
  [v4 removeAllObjects];

  os_unfair_lock_unlock(p_cacheLock);
}

- (id)_makeGradientImage:(id)a3 solidGradient:(CGGradient *)a4 gradient:(CGGradient *)a5 isRTL:(BOOL)a6
{
  BOOL v6 = a6;
  [a3 size];
  double width = v20.width;
  double height = v20.height;
  UIGraphicsBeginImageContextWithOptions(v20, 0, 0.0);
  CurrentContext = UIGraphicsGetCurrentContext();
  uint64_t v12 = CurrentContext;
  if (v6) {
    double v13 = 0.0;
  }
  else {
    double v13 = width;
  }
  if (v6) {
    double v14 = width - width * 0.25;
  }
  else {
    double v14 = width * 0.25;
  }
  if (v6) {
    double v15 = width;
  }
  else {
    double v15 = 0.0;
  }
  double v16 = height * 0.5;
  v22.x = v14;
  v22.y = height * 0.5;
  CGContextDrawLinearGradient(CurrentContext, a4, *(CGPoint *)&v15, v22, 3u);
  v21.x = v14;
  v21.y = height * 0.5;
  v23.x = v13;
  v23.y = height * 0.5;
  CGContextDrawLinearGradient(v12, a5, v21, v23, 3u);
  id v17 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  return v17;
}

uint64_t __92__AAUIBadgeImageFactory__queue_generateImageForConfiguration_size_stackType_isRTL_unearned___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  id v2 = *(void **)(a1 + 32);
  return [v2 resizeBadgeForCurrentViewSize];
}

uint64_t __92__AAUIBadgeImageFactory__queue_generateImageForConfiguration_size_stackType_isRTL_unearned___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (CGGradient)_makeShadowSolidGradient
{
  v10[2] = *MEMORY[0x263EF8340];
  id v2 = [MEMORY[0x263F825C8] whiteColor];
  unsigned int v3 = [v2 colorWithAlphaComponent:0.0];

  id v4 = v3;
  v10[0] = [v4 CGColor];
  id v5 = v4;
  v10[1] = [v5 CGColor];
  CFArrayRef v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:2];
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  id v8 = CGGradientCreateWithColors(DeviceRGB, v6, 0);
  CGColorSpaceRelease(DeviceRGB);

  return v8;
}

- (CGGradient)_makeShadowGradient
{
  v11[2] = *MEMORY[0x263EF8340];
  id v2 = [MEMORY[0x263F825C8] whiteColor];
  unsigned int v3 = [v2 colorWithAlphaComponent:0.0];

  id v4 = [MEMORY[0x263F825C8] whiteColor];
  id v5 = v3;
  v11[0] = [v5 CGColor];
  id v6 = v4;
  v11[1] = [v6 CGColor];
  CFArrayRef v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:2];
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  uint64_t v9 = CGGradientCreateWithColors(DeviceRGB, v7, 0);
  CGColorSpaceRelease(DeviceRGB);

  return v9;
}

- (id)_perfectCropForImage:(id)a3 andDirections:(unint64_t)a4
{
  char v4 = a4;
  id v5 = a3;
  id v6 = (CGImage *)[v5 CGImage];
  uint64_t Width = CGImageGetWidth(v6);
  uint64_t Height = CGImageGetHeight(v6);
  uint64_t v9 = 4 * Width;
  ColorSpace = CGImageGetColorSpace(v6);
  id v11 = CGBitmapContextCreate(0, Width, Height, 8uLL, 4 * Width, ColorSpace, 1u);
  if (v11)
  {
    uint64_t v12 = v11;
    v50.origin.x = 0.0;
    v50.origin.y = 0.0;
    v50.size.double width = (double)Width;
    v50.size.double height = (double)Height;
    CGContextDrawImage(v11, v50, v6);
    Data = CGBitmapContextGetData(v12);
    uint64_t v14 = 0;
    if ((v4 & 1) != 0 && Width >= 1)
    {
      uint64_t v14 = 0;
      uint64_t v15 = 0;
      uint64_t v16 = (uint64_t)&Data[4 * Width + 3];
      do
      {
        if (Height >= 1)
        {
          if (Data[4 * v15 + 3]) {
            break;
          }
          uint64_t v14 = v15 - 1;
          uint64_t v17 = Height;
          id v18 = (unsigned __int8 *)v16;
          while (--v17)
          {
            int v19 = *v18;
            v18 += v9;
            if (v19) {
              goto LABEL_12;
            }
          }
        }
        ++v15;
        v16 += 4;
      }
      while (v15 != Width);
    }
LABEL_12:
    uint64_t v20 = 0;
    if ((v4 & 2) != 0 && Width >= 1)
    {
      uint64_t v20 = 0;
      uint64_t v21 = (uint64_t)&Data[8 * Width - 1];
      uint64_t v22 = Width;
      do
      {
        if (Height >= 1)
        {
          if (Data[4 * v22 - 1]) {
            break;
          }
          uint64_t v20 = Width - v22;
          uint64_t v23 = Height;
          uint64_t v24 = (unsigned __int8 *)v21;
          while (--v23)
          {
            int v25 = *v24;
            v24 += v9;
            if (v25) {
              goto LABEL_23;
            }
          }
        }
        v21 -= 4;
        BOOL v26 = v22-- <= 1;
      }
      while (!v26);
    }
LABEL_23:
    uint64_t v27 = 0;
    if ((v4 & 4) != 0 && Height >= 1)
    {
      uint64_t v27 = 0;
      uint64_t v28 = 0;
      uint64_t v29 = Data + 7;
      do
      {
        if (Width >= 1)
        {
          if (Data[4 * v28 * Width + 3]) {
            break;
          }
          uint64_t v30 = Width;
          long long v31 = v29;
          while (--v30)
          {
            int v32 = *v31;
            v31 += 4;
            if (v32)
            {
              uint64_t v27 = v28;
              goto LABEL_36;
            }
          }
          uint64_t v27 = v28;
        }
        ++v28;
        v29 += v9;
      }
      while (v28 != Height);
    }
LABEL_36:
    if ((v4 & 8) != 0)
    {
      uint64_t v34 = 0;
      if (Height >= 1)
      {
        uint64_t v34 = 0;
        uint64_t v35 = (uint64_t)&Data[4 * Width * (Height - 1) + 7];
        uint64_t v36 = Height;
        do
        {
          uint64_t v37 = v36 - 1;
          if (Width >= 1)
          {
            if (Data[4 * v37 * Width + 3]) {
              break;
            }
            uint64_t v34 = Height - v37;
            uint64_t v38 = Width;
            v39 = (unsigned __int8 *)v35;
            while (--v38)
            {
              int v40 = *v39;
              v39 += 4;
              if (v40) {
                goto LABEL_49;
              }
            }
          }
          v35 -= 4 * Width;
          BOOL v26 = v36-- <= 1;
        }
        while (!v26);
      }
    }
    else
    {
      uint64_t v34 = 0;
    }
LABEL_49:
    CGContextRelease(v12);
    int v41 = [MEMORY[0x263F82B60] mainScreen];
    [v41 scale];
    double v43 = v42;

    double v44 = (double)(Width - (v14 + v20)) / v43;
    if (v44 <= 0.0 || (double v45 = (double)(Height - (v27 + v34)) / v43, v45 <= 0.0))
    {
      char v47 = ACHLogDefault();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
        -[AAUIBadgeImageFactory _perfectCropForImage:andDirections:](v47);
      }

      id v33 = 0;
    }
    else
    {
      UIGraphicsBeginImageContextWithOptions(*(CGSize *)&v44, 0, 0.0);
      CurrentContext = UIGraphicsGetCurrentContext();
      CGContextSetInterpolationQuality(CurrentContext, kCGInterpolationHigh);
      objc_msgSend(v5, "drawInRect:", (double)-v14 / v43, (double)-v27 / v43, (double)Width / v43, (double)Height / v43);
      UIGraphicsGetImageFromCurrentImageContext();
      id v33 = (id)objc_claimAutoreleasedReturnValue();
      UIGraphicsEndImageContext();
    }
  }
  else
  {
    id v33 = v5;
  }

  return v33;
}

- (void)setCache:(id)a3
{
}

- (void)setResourceProvider:(id)a3
{
}

- (AAUIBadgeView)earnedBadgeView
{
  return self->_earnedBadgeView;
}

- (void)setEarnedBadgeView:(id)a3
{
}

- (void)setUnearnedBadgeView:(id)a3
{
}

- (void)setImageCreationQueue:(id)a3
{
}

- (os_unfair_lock_s)cacheLock
{
  return self->_cacheLock;
}

- (void)setCacheLock:(os_unfair_lock_s)a3
{
  self->_cacheLock = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageCreationQueue, 0);
  objc_storeStrong((id *)&self->_unearnedBadgeView, 0);
  objc_storeStrong((id *)&self->_earnedBadgeView, 0);
  objc_storeStrong((id *)&self->_resourceProvider, 0);
  objc_storeStrong((id *)&self->_cache, 0);
}

- (void)thumbnailImageForAchievements:(void *)a1 size:(NSObject *)a2 alignment:(CGFloat)a3 stackType:(CGFloat)a4 .cold.1(void *a1, NSObject *a2, CGFloat a3, CGFloat a4)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  CFArrayRef v7 = [a1 firstObject];
  id v8 = [v7 template];
  uint64_t v9 = [v8 uniqueName];
  v16.double width = a3;
  v16.double height = a4;
  id v10 = NSStringFromCGSize(v16);
  int v11 = 138543618;
  uint64_t v12 = v9;
  __int16 v13 = 2114;
  uint64_t v14 = v10;
  _os_log_error_impl(&dword_229290000, a2, OS_LOG_TYPE_ERROR, "[BadgeImageFactory] Got nil image generating thumbnail for achievement %{public}@, size %{public}@", (uint8_t *)&v11, 0x16u);
}

void __87__AAUIBadgeImageFactory__queue_thumbnailImageForAchievements_size_alignment_stackType___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_229290000, log, OS_LOG_TYPE_ERROR, "[BadgeImageFactory] Encountered error when generating thumbnail, returning nil...", v1, 2u);
}

void __76__AAUIBadgeImageFactory__availableAchievementsForStackType_andAchievements___block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  unsigned int v3 = [a1 template];
  char v4 = [v3 uniqueName];
  int v5 = 138543362;
  id v6 = v4;
  _os_log_fault_impl(&dword_229290000, a2, OS_LOG_TYPE_FAULT, "[BadgeImageFactory] Got nil badgeShapeName for achievement %{public}@", (uint8_t *)&v5, 0xCu);
}

- (void)_perfectCropForImage:(os_log_t)log andDirections:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_229290000, log, OS_LOG_TYPE_ERROR, "[BadgeImageFactory] Perfect Crop generated invalid final size, are we in foreground? Returning nil...", v1, 2u);
}

@end