@interface CAMAspectCropUtilities
+ (CGRect)cropRectForAspectRatio:(int64_t)a3 inImageBounds:(CGRect)a4;
+ (CGSize)finalExpectedSizeWithCaptureDimensions:(id)a3 orientation:(int)a4 aspectRatio:(int64_t)a5;
+ (CGSize)finalExpectedSizeWithPhotoMetadata:(id)a3 aspectRatio:(int64_t)a4;
+ (id)cropFilterForAspectRatio:(int64_t)a3 imageSize:(CGSize)a4;
@end

@implementation CAMAspectCropUtilities

+ (CGRect)cropRectForAspectRatio:(int64_t)a3 inImageBounds:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  if (!CGRectIsEmpty(a4))
  {
    v17.origin.CGFloat x = x;
    v17.origin.CGFloat y = y;
    v17.size.CGFloat width = width;
    v17.size.CGFloat height = height;
    if (!CGRectIsNull(v17))
    {
      v18.origin.CGFloat x = x;
      v18.origin.CGFloat y = y;
      v18.size.CGFloat width = width;
      v18.size.CGFloat height = height;
      if (!CGRectIsInfinite(v18))
      {
        if (a3)
        {
          UIRoundToScale();
          UIRoundToScale();
          UIRectCenteredIntegralRect();
          CGFloat x = v9;
          CGFloat y = v10;
          CGFloat width = v11;
          CGFloat height = v12;
        }
      }
    }
  }
  double v13 = x;
  double v14 = y;
  double v15 = width;
  double v16 = height;
  result.size.CGFloat height = v16;
  result.size.CGFloat width = v15;
  result.origin.CGFloat y = v14;
  result.origin.CGFloat x = v13;
  return result;
}

+ (id)cropFilterForAspectRatio:(int64_t)a3 imageSize:(CGSize)a4
{
  uint64_t v4 = *MEMORY[0x263F00148];
  double v5 = *(double *)(MEMORY[0x263F00148] + 8);
  objc_msgSend(a1, "cropRectForAspectRatio:inImageBounds:", a3, *MEMORY[0x263F00148], v5, a4.width, a4.height);
  double v7 = v6;
  double v23 = v8;
  double v10 = v9;
  double v12 = v11;
  double v13 = round(v9);
  double v14 = round(v11);
  if (fmod(v13, 2.0) != 0.0) {
    double v10 = v13 + -1.0;
  }
  long double v15 = fmod(v14, 2.0);
  CGFloat width = a4.width;
  if (v15 != 0.0) {
    double v12 = v14 + -1.0;
  }
  v26.origin.CGFloat x = v7;
  v26.origin.CGFloat y = v23;
  v26.size.CGFloat width = v10;
  v26.size.CGFloat height = v12;
  uint64_t v17 = v4;
  double v18 = v5;
  CGFloat height = a4.height;
  if (CGRectEqualToRect(v26, *(CGRect *)(&width - 2)))
  {
    v20 = 0;
  }
  else
  {
    v20 = [MEMORY[0x263F00640] filterWithName:@"CICrop"];
    v21 = objc_msgSend(MEMORY[0x263F00680], "vectorWithCGRect:", v7, v23, v10, v12);
    [v20 setValue:v21 forKey:@"inputRectangle"];
  }
  return v20;
}

+ (CGSize)finalExpectedSizeWithPhotoMetadata:(id)a3 aspectRatio:(int64_t)a4
{
  double v6 = CAMSizeForPhotoMetadata(a3);
  objc_msgSend(a1, "cropRectForAspectRatio:inImageBounds:", a4, 0.0, 0.0, v6, v7);
  double v9 = v8;
  double v11 = v10;
  result.CGFloat height = v11;
  result.CGFloat width = v9;
  return result;
}

+ (CGSize)finalExpectedSizeWithCaptureDimensions:(id)a3 orientation:(int)a4 aspectRatio:(int64_t)a5
{
  double var0 = (double)a3.var0;
  double var1 = (double)a3.var1;
  int v9 = PLExifOrientationSwapsWidthAndHeight();
  if (v9) {
    double v10 = var1;
  }
  else {
    double v10 = var0;
  }
  if (v9) {
    double v11 = var0;
  }
  else {
    double v11 = var1;
  }
  objc_msgSend(a1, "cropRectForAspectRatio:inImageBounds:", a5, 0.0, 0.0, v10, v11);
  double v13 = v12;
  double v15 = v14;
  result.CGFloat height = v15;
  result.CGFloat width = v13;
  return result;
}

@end