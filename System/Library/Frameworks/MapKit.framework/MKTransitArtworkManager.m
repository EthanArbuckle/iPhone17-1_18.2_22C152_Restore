@interface MKTransitArtworkManager
+ (id)sharedInstance;
- (BOOL)_isMemoryConstrained;
- (MKTransitArtworkManager)initWithIconManager:(id)a3;
- (VKIconManager)iconManager;
- (id)_createImageWithBlockInAutoreleasePoolIfNeeded:(id)a3;
- (id)_imageFroMVKImage:(id)a3;
- (id)_imageWithDataSource:(id)a3 size:(int64_t)a4 featureType:(unint64_t)a5 scale:(double)a6 nightMode:(BOOL)a7 withWidthPaddingMultiple:(double)a8 fullBleedColor:(id *)a9;
- (id)_vkImageWithShieldDataSource:(id)a3 size:(int64_t)a4 featureType:(unint64_t)a5 scale:(double)a6 nightMode:(BOOL)a7 widthPaddingMultiple:(double)a8;
- (id)transitArtworkImageWithDataSource:(id)a3 size:(int64_t)a4 featureType:(unint64_t)a5 scale:(double)a6 nightMode:(BOOL)a7;
- (id)transitArtworkImageWithDataSource:(id)a3 size:(int64_t)a4 featureType:(unint64_t)a5 scale:(double)a6 nightMode:(BOOL)a7 withWidthPaddingMultiple:(double)a8;
- (id)transitArtworkImageWithDataSource:(id)a3 size:(int64_t)a4 featureType:(unint64_t)a5 scale:(double)a6 nightMode:(BOOL)a7 withWidthPaddingMultiple:(double)a8 fullBleedColor:(id *)a9;
- (id)transitArtworkImageWithShieldDataSource:(id)a3 size:(int64_t)a4 featureType:(unint64_t)a5 scale:(double)a6 nightMode:(BOOL)a7;
- (void)purge;
@end

@implementation MKTransitArtworkManager

+ (id)sharedInstance
{
  if (qword_1EB315D30 != -1) {
    dispatch_once(&qword_1EB315D30, &__block_literal_global_24);
  }
  v2 = (void *)_MergedGlobals_137;

  return v2;
}

void __41__MKTransitArtworkManager_sharedInstance__block_invoke()
{
  v0 = [MKTransitArtworkManager alloc];
  id v3 = [MEMORY[0x1E4FB3A20] sharedManager];
  uint64_t v1 = [(MKTransitArtworkManager *)v0 initWithIconManager:v3];
  v2 = (void *)_MergedGlobals_137;
  _MergedGlobals_137 = v1;
}

- (MKTransitArtworkManager)initWithIconManager:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MKTransitArtworkManager;
  v6 = [(MKTransitArtworkManager *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_iconManager, a3);
  }

  return v7;
}

- (void)purge
{
  id v2 = [(MKTransitArtworkManager *)self iconManager];
  [v2 purge];
}

- (BOOL)_isMemoryConstrained
{
  id v3 = [(MKTransitArtworkManager *)self iconManager];
  if (v3)
  {
    v4 = [(MKTransitArtworkManager *)self iconManager];
    int v5 = [v4 isCachingAtlases] ^ 1;
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (id)_vkImageWithShieldDataSource:(id)a3 size:(int64_t)a4 featureType:(unint64_t)a5 scale:(double)a6 nightMode:(BOOL)a7 widthPaddingMultiple:(double)a8
{
  BOOL v8 = a7;
  id v12 = a3;
  id v13 = objc_alloc_init(MEMORY[0x1E4FB3A28]);
  v14 = [v12 shieldText];
  [v13 setText:v14];

  v15 = [v12 shieldColorString];
  VKShieldColorsFromHexString();
  objc_msgSend(v13, "setTransitLineColor:");

  if (v8)
  {
    v16 = [(MKTransitArtworkManager *)self iconManager];
    objc_msgSend(v13, "setVariant:", objc_msgSend(v16, "darkVariant"));
  }
  v17 = [(MKTransitArtworkManager *)self iconManager];
  uint64_t v18 = [v12 shieldType];
  v19 = [v12 shieldText];
  *(float *)&double v20 = a6;
  v21 = [v17 imageForDataID:v18 text:v19 contentScale:a4 sizeGroup:v13 modifiers:v20];

  return v21;
}

- (id)transitArtworkImageWithShieldDataSource:(id)a3 size:(int64_t)a4 featureType:(unint64_t)a5 scale:(double)a6 nightMode:(BOOL)a7
{
  id v12 = a3;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __100__MKTransitArtworkManager_transitArtworkImageWithShieldDataSource_size_featureType_scale_nightMode___block_invoke;
  v16[3] = &unk_1E54B9898;
  v16[4] = self;
  id v17 = v12;
  int64_t v18 = a4;
  unint64_t v19 = a5;
  double v20 = a6;
  BOOL v21 = a7;
  id v13 = v12;
  v14 = [(MKTransitArtworkManager *)self _createImageWithBlockInAutoreleasePoolIfNeeded:v16];

  return v14;
}

id __100__MKTransitArtworkManager_transitArtworkImageWithShieldDataSource_size_featureType_scale_nightMode___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _vkImageWithShieldDataSource:*(void *)(a1 + 40) size:*(void *)(a1 + 48) featureType:*(void *)(a1 + 56) scale:*(unsigned __int8 *)(a1 + 72) nightMode:*(double *)(a1 + 64) widthPaddingMultiple:1.0];
  id v3 = [*(id *)(a1 + 32) _imageFroMVKImage:v2];

  return v3;
}

- (id)transitArtworkImageWithDataSource:(id)a3 size:(int64_t)a4 featureType:(unint64_t)a5 scale:(double)a6 nightMode:(BOOL)a7
{
  return [(MKTransitArtworkManager *)self transitArtworkImageWithDataSource:a3 size:a4 featureType:a5 scale:a7 nightMode:a6 withWidthPaddingMultiple:1.0];
}

- (id)transitArtworkImageWithDataSource:(id)a3 size:(int64_t)a4 featureType:(unint64_t)a5 scale:(double)a6 nightMode:(BOOL)a7 withWidthPaddingMultiple:(double)a8
{
  id v14 = a3;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __119__MKTransitArtworkManager_transitArtworkImageWithDataSource_size_featureType_scale_nightMode_withWidthPaddingMultiple___block_invoke;
  v18[3] = &unk_1E54B98C0;
  v18[4] = self;
  id v19 = v14;
  int64_t v20 = a4;
  unint64_t v21 = a5;
  BOOL v24 = a7;
  double v22 = a6;
  double v23 = a8;
  id v15 = v14;
  v16 = [(MKTransitArtworkManager *)self _createImageWithBlockInAutoreleasePoolIfNeeded:v18];

  return v16;
}

id __119__MKTransitArtworkManager_transitArtworkImageWithDataSource_size_featureType_scale_nightMode_withWidthPaddingMultiple___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _imageWithDataSource:*(void *)(a1 + 40) size:*(void *)(a1 + 48) featureType:*(void *)(a1 + 56) scale:*(unsigned __int8 *)(a1 + 80) nightMode:0 withWidthPaddingMultiple:*(double *)(a1 + 64) fullBleedColor:*(double *)(a1 + 72)];
  id v3 = [*(id *)(a1 + 32) _imageFroMVKImage:v2];

  return v3;
}

- (id)_imageWithDataSource:(id)a3 size:(int64_t)a4 featureType:(unint64_t)a5 scale:(double)a6 nightMode:(BOOL)a7 withWidthPaddingMultiple:(double)a8 fullBleedColor:(id *)a9
{
  BOOL v11 = a7;
  id v16 = a3;
  int v17 = [v16 artworkSourceType];
  if (v17 == 2)
  {
    int64_t v18 = [v16 iconDataSource];
    int v22 = [v18 iconType];
    if (v22 == 1)
    {
      if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector())
      {
        uint64_t v37 = [v18 iconAttributeKey];
        uint64_t v38 = [v18 iconAttributeValue];
        id v34 = objc_alloc_init(MEMORY[0x1E4FB3A28]);
        if (v11)
        {
          v39 = [(MKTransitArtworkManager *)self iconManager];
          objc_msgSend(v34, "setVariant:", objc_msgSend(v39, "darkVariant"));
        }
        v40 = [(MKTransitArtworkManager *)self iconManager];
        *(float *)&double v41 = a6;
        unint64_t v21 = [v40 imageForKey:v37 value:v38 contentScale:a4 sizeGroup:v34 modifiers:v41];

        goto LABEL_22;
      }
    }
    else if (!v22 && (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      double v23 = [(MKTransitArtworkManager *)self iconManager];
      BOOL v24 = [(MKTransitArtworkManager *)self iconManager];
      uint64_t v25 = [v24 styleAttributeTransitSystemTypeKey];
      uint64_t v26 = [v18 cartoID];
      float v27 = a6;
      *(float *)&double v28 = v27;
      unint64_t v21 = [v23 imageForKey:v25 value:v26 contentScale:a4 sizeGroup:0 modifiers:v28];

      if (v21) {
        goto LABEL_23;
      }
      v29 = [(MKTransitArtworkManager *)self iconManager];
      v30 = [(MKTransitArtworkManager *)self iconManager];
      uint64_t v31 = [v30 styleAttributeTransitTypeKey];
      uint64_t v32 = [v18 defaultTransitType];
      *(float *)&double v33 = a6;
      unint64_t v21 = [v29 imageForKey:v31 value:v32 contentScale:a4 sizeGroup:0 modifiers:v33];

      if (v21)
      {
LABEL_23:
        if (a9 && v21)
        {
          if ([v21 calloutFillColor])
          {
            objc_msgSend(MEMORY[0x1E4F428B8], "colorWithCGColor:", objc_msgSend(v21, "calloutFillColor"));
            id v42 = objc_claimAutoreleasedReturnValue();
            *a9 = v42;
          }
          else
          {
            *a9 = 0;
          }
        }
        goto LABEL_28;
      }
      unint64_t v21 = [v16 iconFallbackShieldDataSource];

      if (!v21) {
        goto LABEL_28;
      }
      id v34 = [v16 iconFallbackShieldDataSource];
      double v35 = round(a6 * a8);
      double v36 = 1.0;
      if (a8 > 1.0) {
        double v36 = v35;
      }
      unint64_t v21 = [(MKTransitArtworkManager *)self _vkImageWithShieldDataSource:v34 size:a4 featureType:a5 scale:v11 nightMode:a6 widthPaddingMultiple:v36];
LABEL_22:

      goto LABEL_23;
    }
    unint64_t v21 = 0;
    goto LABEL_28;
  }
  if (v17 != 1)
  {
    unint64_t v21 = 0;
    goto LABEL_29;
  }
  int64_t v18 = [v16 shieldDataSource];
  double v19 = round(a6 * a8);
  double v20 = 1.0;
  if (a8 > 1.0) {
    double v20 = v19;
  }
  unint64_t v21 = [(MKTransitArtworkManager *)self _vkImageWithShieldDataSource:v18 size:a4 featureType:a5 scale:v11 nightMode:a6 widthPaddingMultiple:v20];
LABEL_28:

LABEL_29:

  return v21;
}

- (id)transitArtworkImageWithDataSource:(id)a3 size:(int64_t)a4 featureType:(unint64_t)a5 scale:(double)a6 nightMode:(BOOL)a7 withWidthPaddingMultiple:(double)a8 fullBleedColor:(id *)a9
{
  v10 = [(MKTransitArtworkManager *)self _imageWithDataSource:a3 size:a4 featureType:a5 scale:a7 nightMode:a9 withWidthPaddingMultiple:a6 fullBleedColor:a8];
  BOOL v11 = [(MKTransitArtworkManager *)self _imageFroMVKImage:v10];

  return v11;
}

- (id)_createImageWithBlockInAutoreleasePoolIfNeeded:(id)a3
{
  v4 = (void (**)(void))a3;
  if ([(MKTransitArtworkManager *)self _isMemoryConstrained])
  {
    int v5 = (void *)MEMORY[0x18C139870]();
    v6 = v4[2](v4);
  }
  else
  {
    v6 = v4[2](v4);
  }

  return v6;
}

- (id)_imageFroMVKImage:(id)a3
{
  id v4 = a3;
  if ([(MKTransitArtworkManager *)self _isMemoryConstrained])
  {
    int v5 = CGImageRetain((CGImageRef)[v4 image]);
    CGFloat Width = (double)CGImageGetWidth(v5);
    CGFloat Height = (double)CGImageGetHeight(v5);
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    size_t AlignedBytesPerRow = CGBitmapGetAlignedBytesPerRow();
    v10 = CGBitmapContextCreate(0, (unint64_t)Width, (unint64_t)Height, 8uLL, AlignedBytesPerRow, DeviceRGB, 0x2002u);
    v17.origin.x = 0.0;
    v17.origin.y = 0.0;
    v17.size.width = Width;
    v17.size.height = Height;
    CGContextClearRect(v10, v17);
    v18.origin.x = 0.0;
    v18.origin.y = 0.0;
    v18.size.width = Width;
    v18.size.height = Height;
    CGContextDrawImage(v10, v18, v5);
    Image = CGBitmapContextCreateImage(v10);
    id v12 = (void *)MEMORY[0x1E4F42A80];
    [v4 contentScale];
    id v14 = [v12 imageWithCGImage:Image scale:0 orientation:v13];
    CGImageRelease(v5);
    CGImageRelease(Image);
    CGColorSpaceRelease(DeviceRGB);
    CGContextRelease(v10);
  }
  else
  {
    id v14 = objc_msgSend(MEMORY[0x1E4F42A80], "_mapkit_imageFromVKImage:", v4);
  }

  return v14;
}

- (VKIconManager)iconManager
{
  return self->_iconManager;
}

- (void).cxx_destruct
{
}

@end