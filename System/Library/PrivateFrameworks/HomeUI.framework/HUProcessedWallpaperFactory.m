@interface HUProcessedWallpaperFactory
+ (id)_defaultBackdropSettings;
- (CGRect)_scaledCropRectForBounds:(CGRect)a3 wallpaper:(id)a4 image:(id)a5;
- (NSArray)supportedVariants;
- (id)_croppedImageFromWallpaper:(id)a3 image:(id)a4;
- (id)_darkContentBlurredImageForWallpaper:(id)a3 image:(id)a4;
- (id)_darkContentDarkModeBlurredImageForWallpaper:(id)a3 image:(id)a4;
- (id)_imageByApplyingLayerEffects:(id)a3 toImage:(id)a4;
- (id)_layerWithCompositingFilterType:(id)a3 color:(id)a4;
- (id)_lightContentBlurredImageForWallpaper:(id)a3 image:(id)a4;
- (id)_processedImageForWallpaper:(id)a3 image:(id)a4;
- (id)applyCustomFilterForWallpaper:(id)a3 image:(id)a4;
- (id)processedImageForVariant:(int64_t)a3 wallpaper:(id)a4 image:(id)a5;
- (unint64_t)processVersionNumber;
@end

@implementation HUProcessedWallpaperFactory

- (unint64_t)processVersionNumber
{
  return 5;
}

- (id)applyCustomFilterForWallpaper:(id)a3 image:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  id v9 = sub_1BE57A8C8(v7, objc_msgSend(v6, sel_type) == (id)6);

  return v9;
}

- (NSArray)supportedVariants
{
  if (_MergedGlobals_637 != -1) {
    dispatch_once(&_MergedGlobals_637, &__block_literal_global_76_2);
  }
  v2 = (void *)qword_1EBA47998;

  return (NSArray *)v2;
}

void __48__HUProcessedWallpaperFactory_supportedVariants__block_invoke_2()
{
  v0 = (void *)qword_1EBA47998;
  qword_1EBA47998 = (uint64_t)&unk_1F19B5A08;
}

- (id)processedImageForVariant:(int64_t)a3 wallpaper:(id)a4 image:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v10 = v9;
  if (!a3)
  {
    NSLog(&cfstr_AskingForOrigi.isa, v8);
    if (v10) {
      goto LABEL_3;
    }
LABEL_6:
    v12 = 0;
    goto LABEL_12;
  }
  if (!v9) {
    goto LABEL_6;
  }
LABEL_3:
  switch(a3)
  {
    case 1:
      id v11 = [(HUProcessedWallpaperFactory *)self _processedImageForWallpaper:v8 image:v10];
      break;
    case 2:
      id v11 = [(HUProcessedWallpaperFactory *)self _darkContentBlurredImageForWallpaper:v8 image:v10];
      break;
    case 3:
      id v11 = [(HUProcessedWallpaperFactory *)self _lightContentBlurredImageForWallpaper:v8 image:v10];
      break;
    case 4:
      id v11 = [(HUProcessedWallpaperFactory *)self _darkContentDarkModeBlurredImageForWallpaper:v8 image:v10];
      break;
    default:
      id v11 = v10;
      break;
  }
  v12 = v11;
LABEL_12:

  return v12;
}

- (CGRect)_scaledCropRectForBounds:(CGRect)a3 wallpaper:(id)a4 image:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  id v8 = a4;
  id v9 = a5;
  [v9 scale];
  CGFloat v11 = v10;
  v12 = [v8 cropInfo];

  if (v12)
  {
    v13 = [v8 cropInfo];
    [v13 scale];
    double v15 = v14;

    v16 = [v8 cropInfo];
    [v16 center];
    double v18 = v17;
    double v20 = v19;

    CGFloat v11 = 1.0;
  }
  else
  {
    [v9 size];
    double v15 = v21 / width;
    [v9 size];
    if (v15 >= v22 / height) {
      double v15 = v22 / height;
    }
    [v9 size];
    UIRectGetCenter();
    double v18 = v23;
    double v20 = v24;
  }
  CGFloat v25 = width * v15;
  CGFloat v26 = height * v15;
  CGAffineTransformMakeScale(&v35, v11, v11);
  v36.origin.CGFloat x = v18 - round(v25 * 0.5);
  v36.origin.CGFloat y = v20 - round(v26 * 0.5);
  v36.size.double width = v25;
  v36.size.double height = v26;
  CGRect v37 = CGRectApplyAffineTransform(v36, &v35);
  CGFloat x = v37.origin.x;
  CGFloat y = v37.origin.y;
  CGFloat v29 = v37.size.width;
  CGFloat v30 = v37.size.height;

  double v31 = x;
  double v32 = y;
  double v33 = v29;
  double v34 = v30;
  result.size.double height = v34;
  result.size.double width = v33;
  result.origin.CGFloat y = v32;
  result.origin.CGFloat x = v31;
  return result;
}

- (id)_croppedImageFromWallpaper:(id)a3 image:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [MEMORY[0x1E4F69778] contentSizeForWallpaper];
  double v9 = v8;
  double v11 = v10;
  objc_msgSend(v7, "hf_sizeInScreenScale");
  double v13 = v12;
  double v15 = v14;
  double v16 = v11;
  double v17 = v9;
  if ([MEMORY[0x1E4F69758] isAMac])
  {
    double v18 = v13 / v9;
    double v19 = v15 / v11;
    BOOL v20 = v13 / v9 < 1.0 || v19 < 1.0;
    double v16 = v11;
    double v17 = v9;
    if (v20)
    {
      if (v18 >= v19) {
        double v18 = v15 / v11;
      }
      double v17 = v9 * v18;
      double v16 = v11 * v18;
    }
  }
  if ([v6 type] == 2
    || [v6 type] == 3
    || [v6 type] == 4
    || [v6 type] == 5)
  {
    goto LABEL_14;
  }
  double v23 = [v6 cropInfo];
  if (v23)
  {
  }
  else if (v17 == v13 && v16 == v15)
  {
LABEL_14:
    id v21 = v7;
    goto LABEL_15;
  }
  double v24 = [v7 imageWithNormalizedOrientation];
  CGFloat v25 = [MEMORY[0x1E4F42D90] mainScreen];
  [v25 scale];
  CGFloat v27 = v26;
  v43.double width = v17;
  v43.double height = v16;
  UIGraphicsBeginImageContextWithOptions(v43, 1, v27);

  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextTranslateCTM(CurrentContext, 0.0, v16);
  CGFloat v29 = UIGraphicsGetCurrentContext();
  CGContextScaleCTM(v29, 1.0, -1.0);
  -[HUProcessedWallpaperFactory _scaledCropRectForBounds:wallpaper:image:](self, "_scaledCropRectForBounds:wallpaper:image:", v6, v7, 0.0, 0.0, v9, v11);
  CGFloat v31 = v30;
  CGFloat v33 = v32;
  CGFloat v35 = v34;
  CGFloat v37 = v36;
  id v38 = v24;
  v39 = (CGImage *)[v38 CGImage];
  v44.origin.CGFloat x = v31;
  v44.origin.CGFloat y = v33;
  v44.size.double width = v35;
  v44.size.double height = v37;
  v40 = CGImageCreateWithImageInRect(v39, v44);
  v41 = UIGraphicsGetCurrentContext();
  v45.origin.CGFloat x = 0.0;
  v45.origin.CGFloat y = 0.0;
  v45.size.double width = v17;
  v45.size.double height = v16;
  CGContextDrawImage(v41, v45, v40);
  UIGraphicsGetImageFromCurrentImageContext();
  id v21 = (id)objc_claimAutoreleasedReturnValue();
  CGImageRelease(v40);
  UIGraphicsEndImageContext();

LABEL_15:

  return v21;
}

- (id)_processedImageForWallpaper:(id)a3 image:(id)a4
{
  v21[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(HUProcessedWallpaperFactory *)self _croppedImageFromWallpaper:v6 image:a4];
  if ([v6 type] == 4
    || [v6 type] == 5
    || [v6 type] == 1
    || [v6 type] == 6)
  {
    id v8 = v7;
  }
  else
  {
    if ([v6 type] == 2 || objc_msgSend(v6, "type") == 3)
    {
      uint64_t v10 = *MEMORY[0x1E4F3A078];
      double v11 = [MEMORY[0x1E4F428B8] colorWithWhite:0.0 alpha:0.08];
      double v12 = [(HUProcessedWallpaperFactory *)self _layerWithCompositingFilterType:v10 color:v11];

      uint64_t v13 = *MEMORY[0x1E4F3A070];
      double v14 = (void *)MEMORY[0x1E4F428B8];
      double v15 = 0.04;
    }
    else
    {
      uint64_t v16 = *MEMORY[0x1E4F3A078];
      double v17 = [MEMORY[0x1E4F428B8] colorWithWhite:0.0 alpha:0.15];
      double v12 = [(HUProcessedWallpaperFactory *)self _layerWithCompositingFilterType:v16 color:v17];

      uint64_t v13 = *MEMORY[0x1E4F3A070];
      double v14 = (void *)MEMORY[0x1E4F428B8];
      double v15 = 0.1;
    }
    double v18 = [v14 colorWithWhite:0.0 alpha:v15];
    double v19 = [(HUProcessedWallpaperFactory *)self _layerWithCompositingFilterType:v13 color:v18];

    v21[0] = v12;
    v21[1] = v19;
    BOOL v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
    id v8 = [(HUProcessedWallpaperFactory *)self _imageByApplyingLayerEffects:v20 toImage:v7];
  }

  return v8;
}

- (id)_darkContentBlurredImageForWallpaper:(id)a3 image:(id)a4
{
  id v4 = a4;
  [v4 scale];
  double v6 = v5;
  id v7 = [MEMORY[0x1E4F42D90] mainScreen];
  [v7 scale];
  double v9 = v8;

  if (v6 != v9)
  {
    [v4 scale];
    uint64_t v11 = v10;
    double v12 = [MEMORY[0x1E4F42D90] mainScreen];
    [v12 scale];
    NSLog(&cfstr_WallpaperProce.isa, v11, v13);
  }
  double v14 = [(id)objc_opt_class() _defaultBackdropSettings];
  [v14 setSaturationDeltaFactor:5.0];
  double v15 = [MEMORY[0x1E4F428B8] colorWithWhite:0.9 alpha:1.0];
  [v14 setColorTint:v15];

  [v14 setColorTintAlpha:0.8];
  uint64_t v16 = [v4 _applyBackdropViewSettings:v14];

  return v16;
}

- (id)_darkContentDarkModeBlurredImageForWallpaper:(id)a3 image:(id)a4
{
  id v4 = a4;
  double v5 = [(id)objc_opt_class() _defaultBackdropSettings];
  [v5 setSaturationDeltaFactor:5.0];
  double v6 = [MEMORY[0x1E4F428B8] colorWithWhite:0.2 alpha:1.0];
  [v5 setColorTint:v6];

  [v5 setColorTintAlpha:0.8];
  id v7 = [v4 _applyBackdropViewSettings:v5];

  return v7;
}

- (id)_lightContentBlurredImageForWallpaper:(id)a3 image:(id)a4
{
  v17[2] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  double v6 = [(id)objc_opt_class() _defaultBackdropSettings];
  [v6 setRenderingHint:1];
  [v6 setSaturationDeltaFactor:4.0];
  [v6 setColorTint:0];
  [v6 setColorTintAlpha:0.0];
  uint64_t v7 = *MEMORY[0x1E4F3A2B8];
  double v8 = [MEMORY[0x1E4F428B8] colorWithWhite:0.305882353 alpha:0.3];
  double v9 = [(HUProcessedWallpaperFactory *)self _layerWithCompositingFilterType:v7 color:v8];

  uint64_t v10 = *MEMORY[0x1E4F3A2E0];
  uint64_t v11 = [MEMORY[0x1E4F428B8] colorWithWhite:0.396078431 alpha:0.32];
  double v12 = [(HUProcessedWallpaperFactory *)self _layerWithCompositingFilterType:v10 color:v11];

  v17[0] = v9;
  v17[1] = v12;
  uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
  double v14 = [v5 _applyBackdropViewSettings:v6];

  double v15 = [(HUProcessedWallpaperFactory *)self _imageByApplyingLayerEffects:v13 toImage:v14];

  return v15;
}

+ (id)_defaultBackdropSettings
{
  v2 = [MEMORY[0x1E4F430B0] settingsForPrivateStyle:-4];
  [v2 setRequiresColorStatistics:0];
  [v2 setGrayscaleTintAlpha:0.0];
  [v2 setGrayscaleTintMaskAlpha:0.0];
  [v2 setColorTintMaskAlpha:0.0];
  [v2 setColorBurnTintAlpha:0.0];
  [v2 setDarkeningTintAlpha:0.0];
  [v2 setFilterMaskAlpha:0.0];
  [v2 setBlurRadius:36.0];

  return v2;
}

- (id)_layerWithCompositingFilterType:(id)a3 color:(id)a4
{
  id v5 = (void *)MEMORY[0x1E4F39BE8];
  id v6 = a4;
  id v7 = a3;
  double v8 = [v5 layer];
  double v9 = [MEMORY[0x1E4F39BC0] filterWithType:v7];

  [v8 setCompositingFilter:v9];
  id v10 = v6;
  uint64_t v11 = [v10 CGColor];

  [v8 setBackgroundColor:v11];

  return v8;
}

- (id)_imageByApplyingLayerEffects:(id)a3 toImage:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  objc_msgSend(v6, "hf_sizeInScreenScale");
  double v8 = v7;
  double v10 = v9;
  double v11 = *MEMORY[0x1E4F1DAD8];
  double v12 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  uint64_t v13 = [MEMORY[0x1E4F39BE8] layer];
  id v14 = v6;
  objc_msgSend(v13, "setContents:", objc_msgSend(v14, "CGImage"));
  double v15 = [MEMORY[0x1E4F42D90] mainScreen];
  [v15 scale];
  objc_msgSend(v13, "setContentsScale:");

  objc_msgSend(v13, "setFrame:", v11, v12, v8, v10);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v16 = v5;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v29 != v19) {
          objc_enumerationMutation(v16);
        }
        id v21 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        objc_msgSend(v21, "setFrame:", v11, v12, v8, v10);
        [v13 addSublayer:v21];
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v18);
  }

  double v22 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42A58]), "initWithSize:", v8, v10);
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __68__HUProcessedWallpaperFactory__imageByApplyingLayerEffects_toImage___block_invoke;
  v26[3] = &unk_1E6390C80;
  id v27 = v13;
  id v23 = v13;
  double v24 = [v22 imageWithActions:v26];

  return v24;
}

uint64_t __68__HUProcessedWallpaperFactory__imageByApplyingLayerEffects_toImage___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = [a2 CGContext];

  return [v2 renderInContext:v3];
}

@end