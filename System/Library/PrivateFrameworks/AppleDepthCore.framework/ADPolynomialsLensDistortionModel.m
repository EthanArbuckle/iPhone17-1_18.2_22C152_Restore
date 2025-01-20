@interface ADPolynomialsLensDistortionModel
+ (BOOL)isEqualPolynomials:(const ADDistortionPolynomials *)a3 otherPolynomials:(const ADDistortionPolynomials *)a4;
+ (unint64_t)hashPolynomials:(const ADDistortionPolynomials *)a3;
- (ADPolynomialsLensDistortionModel)initWithDictionary:(id)a3;
- (ADPolynomialsLensDistortionModel)initWithDistortionCenter:(CGPoint)a3 andPolynomials:(const ADDistortionPolynomials *)a4;
- (BOOL)isEqual:(id)a3;
- (CGPoint)distortionCenter;
- (const)distortionPolynomials;
- (double)getMaxDistortedRadius:(CGSize)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation:(BOOL)a3;
- (unint64_t)hash;
- (void)adjustForImageRotation:(int64_t)a3 forDimensions:(CGSize)a4;
- (void)crop:(CGRect)a3 fromDimensions:(CGSize)a4;
- (void)distortPixels:(unint64_t)a3 undistortedPixels:(const CGPoint *)a4 withCameraCalibration:(id)a5 outDistortedPixels:(CGPoint *)a6;
- (void)distortPixels:(unint64_t)a3 undistortedPixels:(const CGPoint *)a4 withPixelSize:(float)a5 referenceDimensions:(CGSize)a6 outDistortedPixels:(CGPoint *)a7;
- (void)scale:(float)a3;
- (void)setDistortionCenter:(CGPoint)a3;
- (void)setDistortionPolynomials:(const ADDistortionPolynomials *)a3;
- (void)undistortPixels:(unint64_t)a3 distortedPixels:(const CGPoint *)a4 withCameraCalibration:(id)a5 outUndistortedPixels:(CGPoint *)a6;
- (void)undistortPixels:(unint64_t)a3 distortedPixels:(const CGPoint *)a4 withPixelSize:(float)a5 referenceDimensions:(CGSize)a6 outUndistortedPixels:(CGPoint *)a7;
@end

@implementation ADPolynomialsLensDistortionModel

- (void)scale:(float)a3
{
  self->_distortionCenter = (CGPoint)vmulq_n_f64((float64x2_t)self->_distortionCenter, a3);
}

- (void)crop:(CGRect)a3 fromDimensions:(CGSize)a4
{
  CGFloat v4 = self->_distortionCenter.y - a3.origin.y;
  self->_distortionCenter.x = self->_distortionCenter.x - a3.origin.x;
  self->_distortionCenter.y = v4;
}

- (ADPolynomialsLensDistortionModel)initWithDictionary:(id)a3
{
  CGFloat v4 = (NSDictionary *)a3;
  if (getDistortionCenterFromDictionary(v4, &self->_distortionCenter))
  {
    v5 = [(NSDictionary *)v4 objectForKeyedSubscript:@"gdcPolynomials"];
    v6 = v5;
    if (v5)
    {
      v7 = [v5 objectForKeyedSubscript:@"forwardOrders"];
      v8 = v7;
      if (v7 && [v7 count] == 8)
      {
        uint64_t v9 = 0;
        while (1)
        {
          v10 = [v8 objectAtIndexedSubscript:v9];
          v11 = v10;
          if (!v10) {
            break;
          }
          [v10 floatValue];
          v20[v9] = v12;

          if (++v9 == 8)
          {
            v13 = [v6 objectForKeyedSubscript:@"inverseOrders"];
            if ([v8 count] == 8)
            {
              uint64_t v14 = 0;
              while (1)
              {
                v15 = [v13 objectAtIndexedSubscript:v14];
                v16 = v15;
                if (!v15) {
                  break;
                }
                [v15 floatValue];
                v20[v14 + 8] = v17;

                if (++v14 == 8)
                {
                  self = -[ADPolynomialsLensDistortionModel initWithDistortionCenter:andPolynomials:](self, "initWithDistortionCenter:andPolynomials:", v20, self->_distortionCenter.x, self->_distortionCenter.y);
                  v18 = self;
                  goto LABEL_20;
                }
              }
            }
            v18 = 0;
LABEL_20:

            goto LABEL_15;
          }
        }
      }
      v18 = 0;
LABEL_15:
    }
    else
    {
      v18 = 0;
    }
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (id)dictionaryRepresentation:(BOOL)a3
{
  CGFloat v4 = objc_opt_new();
  CFDictionaryRef DictionaryRepresentation = CGPointCreateDictionaryRepresentation(self->_distortionCenter);
  [v4 setObject:DictionaryRepresentation forKeyedSubscript:@"lensDistortionCenter"];

  v6 = objc_opt_new();
  v7 = [MEMORY[0x263EFF980] arrayWithCapacity:8];
  v8 = [(ADPolynomialsLensDistortionModel *)self distortionPolynomials];
  for (uint64_t i = 0; i != 8; ++i)
  {
    *(float *)&double v9 = v8->forwardOrders[i];
    v11 = [NSNumber numberWithFloat:v9];
    [v7 addObject:v11];
  }
  int v12 = (void *)[v7 copy];
  [v6 setObject:v12 forKeyedSubscript:@"forwardOrders"];

  [v7 removeAllObjects];
  uint64_t v14 = 0;
  inverseOrders = v8->inverseOrders;
  do
  {
    *(float *)&double v13 = inverseOrders[v14];
    v16 = [NSNumber numberWithFloat:v13];
    [v7 addObject:v16];

    ++v14;
  }
  while (v14 != 8);
  [v6 setObject:v7 forKeyedSubscript:@"inverseOrders"];
  [v4 setObject:v6 forKeyedSubscript:@"gdcPolynomials"];

  return v4;
}

- (ADPolynomialsLensDistortionModel)initWithDistortionCenter:(CGPoint)a3 andPolynomials:(const ADDistortionPolynomials *)a4
{
  if (!a4)
  {
    objc_msgSend(MEMORY[0x263EFF940], "exceptionWithName:reason:userInfo:", *MEMORY[0x263EFF4A0], @"distortionPolynomials cannot be nil", 0, a3.x, a3.y);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v11);
  }
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  v12.receiver = self;
  v12.super_class = (Class)ADPolynomialsLensDistortionModel;
  result = [(ADPolynomialsLensDistortionModel *)&v12 init];
  if (result)
  {
    result->_distortionCenter.CGFloat x = x;
    result->_distortionCenter.CGFloat y = y;
    long long v8 = *(_OWORD *)a4->forwardOrders;
    long long v9 = *(_OWORD *)&a4->forwardOrders[4];
    long long v10 = *(_OWORD *)a4->inverseOrders;
    *(_OWORD *)&result->_polynomials.inverseOrders[4] = *(_OWORD *)&a4->inverseOrders[4];
    *(_OWORD *)result->_polynomials.inverseOrders = v10;
    *(_OWORD *)&result->_polynomials.forwardOrders[4] = v9;
    *(_OWORD *)result->_polynomials.forwardOrders = v8;
  }
  return result;
}

- (const)distortionPolynomials
{
  return &self->_polynomials;
}

- (void)setDistortionCenter:(CGPoint)a3
{
  self->_distortionCenter = a3;
}

- (CGPoint)distortionCenter
{
  double x = self->_distortionCenter.x;
  double y = self->_distortionCenter.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)undistortPixels:(unint64_t)a3 distortedPixels:(const CGPoint *)a4 withCameraCalibration:(id)a5 outUndistortedPixels:(CGPoint *)a6
{
  id v15 = a5;
  [v15 pixelSize];
  int v11 = v10;
  [v15 referenceDimensions];
  double v13 = v12;
  LODWORD(v12) = v11;
  -[ADPolynomialsLensDistortionModel undistortPixels:distortedPixels:withPixelSize:referenceDimensions:outUndistortedPixels:](self, "undistortPixels:distortedPixels:withPixelSize:referenceDimensions:outUndistortedPixels:", a3, a4, a6, v12, v13, v14);
}

- (void)undistortPixels:(unint64_t)a3 distortedPixels:(const CGPoint *)a4 withPixelSize:(float)a5 referenceDimensions:(CGSize)a6 outUndistortedPixels:(CGPoint *)a7
{
  -[ADPolynomialsLensDistortionModel getMaxDistortedRadius:](self, "getMaxDistortedRadius:", a6.width, a6.height);
  CGFloat x = self->_distortionCenter.x;
  CGFloat y = self->_distortionCenter.y;

  applyDistortionCoefficients(a3, (float64x2_t *)a4, a5, *(CGPoint *)&x, v12, self->_polynomials.forwardOrders, (float64x2_t *)a7);
}

- (void)distortPixels:(unint64_t)a3 undistortedPixels:(const CGPoint *)a4 withCameraCalibration:(id)a5 outDistortedPixels:(CGPoint *)a6
{
  id v15 = a5;
  [v15 pixelSize];
  int v11 = v10;
  [v15 referenceDimensions];
  double v13 = v12;
  LODWORD(v12) = v11;
  -[ADPolynomialsLensDistortionModel distortPixels:undistortedPixels:withPixelSize:referenceDimensions:outDistortedPixels:](self, "distortPixels:undistortedPixels:withPixelSize:referenceDimensions:outDistortedPixels:", a3, a4, a6, v12, v13, v14);
}

- (void)distortPixels:(unint64_t)a3 undistortedPixels:(const CGPoint *)a4 withPixelSize:(float)a5 referenceDimensions:(CGSize)a6 outDistortedPixels:(CGPoint *)a7
{
  -[ADPolynomialsLensDistortionModel getMaxDistortedRadius:](self, "getMaxDistortedRadius:", a6.width, a6.height);
  CGFloat x = self->_distortionCenter.x;
  double y = self->_distortionCenter.y;
  v20.CGFloat x = x;
  v20.double y = v14 + y;
  double v15 = a5;
  v22.CGFloat x = x;
  v22.double y = y;
  applyDistortionCoefficients(1, (float64x2_t *)&v20, v15, v22, v14 + v14, self->_polynomials.forwardOrders, &v19);
  double v16 = v19.f64[1] - y;
  CGFloat v17 = x;
  double v18 = y;

  applyDistortionCoefficients(a3, (float64x2_t *)a4, v15, *(CGPoint *)&v17, v16, self->_polynomials.inverseOrders, (float64x2_t *)a7);
}

- (double)getMaxDistortedRadius:(CGSize)a3
{
  double v3 = a3.width * 0.5;
  double v4 = a3.height * 0.5;
  double v5 = vabdd_f64(self->_distortionCenter.x, v3);
  double v6 = vabdd_f64(self->_distortionCenter.y, v4);
  return sqrt((v4 + v6) * (v4 + v6) + (v3 + v5) * (v3 + v5));
}

- (id)copyWithZone:(_NSZone *)a3
{
  double v4 = [ADPolynomialsLensDistortionModel alloc];
  double x = self->_distortionCenter.x;
  double y = self->_distortionCenter.y;

  return -[ADPolynomialsLensDistortionModel initWithDistortionCenter:andPolynomials:](v4, "initWithDistortionCenter:andPolynomials:", &self->_polynomials, x, y);
}

- (void)setDistortionPolynomials:(const ADDistortionPolynomials *)a3
{
  if (!a3)
  {
    id v6 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:@"distortionPolynomials cannot be nil" userInfo:0];
    objc_exception_throw(v6);
  }
  long long v3 = *(_OWORD *)a3->forwardOrders;
  long long v4 = *(_OWORD *)&a3->forwardOrders[4];
  long long v5 = *(_OWORD *)a3->inverseOrders;
  *(_OWORD *)&self->_polynomials.inverseOrders[4] = *(_OWORD *)&a3->inverseOrders[4];
  *(_OWORD *)self->_polynomials.inverseOrders = v5;
  *(_OWORD *)&self->_polynomials.forwardOrders[4] = v4;
  *(_OWORD *)self->_polynomials.forwardOrders = v3;
}

- (unint64_t)hash
{
  long long v3 = [NSNumber numberWithDouble:self->_distortionCenter.x];
  uint64_t v4 = [v3 hash];

  long long v5 = [NSNumber numberWithDouble:self->_distortionCenter.y];
  uint64_t v6 = v4 ^ (2 * [v5 hash]);

  return v6 ^ (3
             * +[ADPolynomialsLensDistortionModel hashPolynomials:&self->_polynomials]);
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (ADPolynomialsLensDistortionModel *)a3;
  long long v5 = v4;
  if (!v4) {
    goto LABEL_8;
  }
  if (self == v4)
  {
    BOOL v10 = 1;
    goto LABEL_10;
  }
  if ([(ADPolynomialsLensDistortionModel *)v4 isMemberOfClass:objc_opt_class()])
  {
    uint64_t v6 = v5;
    double x = self->_distortionCenter.x;
    double y = self->_distortionCenter.y;
    [(ADPolynomialsLensDistortionModel *)v6 distortionCenter];
    BOOL v10 = 0;
    if (x == v11 && y == v9) {
      BOOL v10 = +[ADPolynomialsLensDistortionModel isEqualPolynomials:&self->_polynomials otherPolynomials:[(ADPolynomialsLensDistortionModel *)v6 distortionPolynomials]];
    }
  }
  else
  {
LABEL_8:
    BOOL v10 = 0;
  }
LABEL_10:

  return v10;
}

- (void)adjustForImageRotation:(int64_t)a3 forDimensions:(CGSize)a4
{
  self->_distortionCenter.double x = rotateUVPoint(a3, self->_distortionCenter.x, self->_distortionCenter.y, a4.width, a4.height);
  self->_distortionCenter.double y = v5;
}

+ (unint64_t)hashPolynomials:(const ADDistortionPolynomials *)a3
{
  uint64_t v5 = 0;
  unint64_t v6 = 0;
  do
  {
    *(float *)&double v3 = a3->forwardOrders[v5];
    v7 = [NSNumber numberWithFloat:v3];
    uint64_t v8 = [v7 hash];

    *(float *)&double v9 = a3->inverseOrders[v5];
    BOOL v10 = [NSNumber numberWithFloat:v9];
    v6 ^= (v8 * (v5 + 1)) ^ ([v10 hash] * (v5 + 9));

    ++v5;
  }
  while (v5 != 8);
  return v6;
}

+ (BOOL)isEqualPolynomials:(const ADDistortionPolynomials *)a3 otherPolynomials:(const ADDistortionPolynomials *)a4
{
  if (a3->forwardOrders[0] == a4->forwardOrders[0])
  {
    unint64_t v6 = 0;
    BOOL v4 = 0;
    inverseOrders = a4->inverseOrders;
    uint64_t v8 = a3->inverseOrders;
    do
    {
      if (*v8 != *inverseOrders) {
        break;
      }
      BOOL v4 = v6 > 6;
      if (v6 == 7) {
        break;
      }
      float v9 = *(v8 - 7);
      float v10 = *(inverseOrders - 7);
      ++inverseOrders;
      ++v8;
      ++v6;
    }
    while (v9 == v10);
  }
  else
  {
    return 0;
  }
  return v4;
}

@end