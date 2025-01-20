@interface CLKTreatedImageKey
+ (id)keyWithRawImage:(id)a3 maxSDKSize:(CGSize)a4 maxDeviceSize:(CGSize)a5 cornerRadius:(double)a6;
+ (id)keyWithRawImage:(id)a3 maxSDKSize:(CGSize)a4 maxDeviceSize:(CGSize)a5 maskMode:(int64_t)a6;
+ (id)keyWithRawImage:(id)a3 scale:(double)a4 sdkDeviceScale:(double)a5 cornerRadius:(double)a6;
+ (id)keyWithRawImage:(id)a3 scale:(double)a4 sdkDeviceScale:(double)a5 maskMode:(int64_t)a6;
- (BOOL)isEqual:(id)a3;
- (CGSize)maxDeviceSize;
- (CGSize)maxSDKSize;
- (UIImage)rawImage;
- (double)cornerRadius;
- (double)scale;
- (double)sdkDeviceScale;
- (int64_t)maskMode;
- (int64_t)scaleMode;
- (unint64_t)hash;
@end

@implementation CLKTreatedImageKey

+ (id)keyWithRawImage:(id)a3 scale:(double)a4 sdkDeviceScale:(double)a5 maskMode:(int64_t)a6
{
  v9 = (UIImage *)a3;
  v10 = objc_alloc_init(CLKTreatedImageKey);
  rawImage = v10->_rawImage;
  v10->_rawImage = v9;

  v10->_scaleMode = 1;
  v10->_scale = a4;
  v10->_sdkDeviceScale = a5;
  v10->_maskMode = a6;

  return v10;
}

+ (id)keyWithRawImage:(id)a3 scale:(double)a4 sdkDeviceScale:(double)a5 cornerRadius:(double)a6
{
  v9 = (UIImage *)a3;
  v10 = objc_alloc_init(CLKTreatedImageKey);
  rawImage = v10->_rawImage;
  v10->_rawImage = v9;

  v10->_scaleMode = 1;
  v10->_scale = a4;
  v10->_sdkDeviceScale = a5;
  v10->_maskMode = 2;
  v10->_cornerRadius = a6;

  return v10;
}

+ (id)keyWithRawImage:(id)a3 maxSDKSize:(CGSize)a4 maxDeviceSize:(CGSize)a5 maskMode:(int64_t)a6
{
  CGFloat height = a5.height;
  CGFloat width = a5.width;
  CGFloat v9 = a4.height;
  CGFloat v10 = a4.width;
  v11 = (UIImage *)a3;
  v12 = objc_alloc_init(CLKTreatedImageKey);
  rawImage = v12->_rawImage;
  v12->_rawImage = v11;

  v12->_scaleMode = 0;
  v12->_maxSDKSize.CGFloat width = v10;
  v12->_maxSDKSize.CGFloat height = v9;
  v12->_maxDeviceSize.CGFloat width = width;
  v12->_maxDeviceSize.CGFloat height = height;
  v12->_maskMode = a6;

  return v12;
}

+ (id)keyWithRawImage:(id)a3 maxSDKSize:(CGSize)a4 maxDeviceSize:(CGSize)a5 cornerRadius:(double)a6
{
  CGFloat height = a5.height;
  CGFloat width = a5.width;
  CGFloat v9 = a4.height;
  CGFloat v10 = a4.width;
  v11 = (UIImage *)a3;
  v12 = objc_alloc_init(CLKTreatedImageKey);
  rawImage = v12->_rawImage;
  v12->_rawImage = v11;

  v12->_scaleMode = 0;
  v12->_maxSDKSize.CGFloat height = v9;
  v12->_maxDeviceSize.CGFloat width = width;
  v12->_maxDeviceSize.CGFloat height = height;
  v12->_maskMode = 2;
  v12->_cornerRadius = a6;
  v12->_maxSDKSize.CGFloat width = v10;

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CLKTreatedImageKey *)a3;
  if (v4 == self)
  {
    BOOL v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      rawImage = self->_rawImage;
      v6 = [(CLKTreatedImageKey *)v4 rawImage];
      if (![(UIImage *)rawImage isEqual:v6]) {
        goto LABEL_15;
      }
      double scale = self->_scale;
      [(CLKTreatedImageKey *)v4 scale];
      if (!CLKFloatEqualsFloat(scale, v8)) {
        goto LABEL_15;
      }
      double sdkDeviceScale = self->_sdkDeviceScale;
      [(CLKTreatedImageKey *)v4 sdkDeviceScale];
      if (!CLKFloatEqualsFloat(sdkDeviceScale, v10)) {
        goto LABEL_15;
      }
      [(CLKTreatedImageKey *)v4 maxSDKSize];
      BOOL v12 = 0;
      if (self->_maxSDKSize.width != v13) {
        goto LABEL_16;
      }
      if (self->_maxSDKSize.height != v11) {
        goto LABEL_16;
      }
      [(CLKTreatedImageKey *)v4 maxDeviceSize];
      BOOL v12 = 0;
      if (self->_maxDeviceSize.width != v15 || self->_maxDeviceSize.height != v14) {
        goto LABEL_16;
      }
      int64_t maskMode = self->_maskMode;
      if (maskMode == [(CLKTreatedImageKey *)v4 maskMode]
        && (int64_t scaleMode = self->_scaleMode, scaleMode == [(CLKTreatedImageKey *)v4 scaleMode]))
      {
        double cornerRadius = self->_cornerRadius;
        [(CLKTreatedImageKey *)v4 cornerRadius];
        BOOL v12 = CLKFloatEqualsFloat(cornerRadius, v19);
      }
      else
      {
LABEL_15:
        BOOL v12 = 0;
      }
LABEL_16:

      goto LABEL_17;
    }
    BOOL v12 = 0;
  }
LABEL_17:

  return v12;
}

- (unint64_t)hash
{
  double v3 = (double)(unint64_t)[(UIImage *)self->_rawImage hash];
  v4 = [NSNumber numberWithDouble:self->_sdkDeviceScale];
  double v5 = (double)(unint64_t)[v4 hash] * 1000000000.0 + v3 * 1.0e10;
  v6 = [NSNumber numberWithDouble:self->_scale];
  double v7 = v5 + (double)(unint64_t)[v6 hash] * 100000000.0;
  double v8 = [NSNumber numberWithInteger:self->_scaleMode];
  double v9 = v7 + (double)(unint64_t)[v8 hash] * 10000000.0;
  double v10 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGSize:", self->_maxDeviceSize.width, self->_maxDeviceSize.height);
  double v11 = v9 + (double)(unint64_t)[v10 hash] * 1000000.0;
  BOOL v12 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGSize:", self->_maxSDKSize.width, self->_maxSDKSize.height);
  double v13 = v11 + (double)(unint64_t)[v12 hash] * 100000.0;
  double v14 = [NSNumber numberWithInteger:self->_maskMode];
  double v15 = v13 + (double)(unint64_t)[v14 hash] * 10000.0;
  v16 = [NSNumber numberWithDouble:self->_cornerRadius];
  unint64_t v17 = (unint64_t)(v15 + (double)(unint64_t)[v16 hash] * 1000.0);

  return v17;
}

- (UIImage)rawImage
{
  return self->_rawImage;
}

- (int64_t)scaleMode
{
  return self->_scaleMode;
}

- (CGSize)maxSDKSize
{
  double width = self->_maxSDKSize.width;
  double height = self->_maxSDKSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)maxDeviceSize
{
  double width = self->_maxDeviceSize.width;
  double height = self->_maxDeviceSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (double)scale
{
  return self->_scale;
}

- (double)sdkDeviceScale
{
  return self->_sdkDeviceScale;
}

- (int64_t)maskMode
{
  return self->_maskMode;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void).cxx_destruct
{
}

@end