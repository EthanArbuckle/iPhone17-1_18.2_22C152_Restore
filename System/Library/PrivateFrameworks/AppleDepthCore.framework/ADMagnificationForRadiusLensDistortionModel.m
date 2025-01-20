@interface ADMagnificationForRadiusLensDistortionModel
- (ADMagnificationForRadiusLensDistortionModel)initWithDictionary:(id)a3;
- (ADMagnificationForRadiusLensDistortionModel)initWithDistortionCenter:(CGPoint)a3 lensDistortionLookupTable:(id)a4 inverseLensDistortionLookupTable:(id)a5;
- (BOOL)isEqual:(id)a3;
- (CGPoint)distortionCenter;
- (NSData)inverseLensDistortionLookupTable;
- (NSData)lensDistortionLookupTable;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation:(BOOL)a3;
- (uint64_t)applyDistortionModelToPixels:(double)a3 inPixels:(double)a4 intrinsicsMatrix:(double)a5 referenceDimensions:(double)a6 magnificationLookupTable:(uint64_t)a7 outPixels:(uint64_t)a8;
- (unint64_t)hash;
- (void)adjustForImageRotation:(int64_t)a3 forDimensions:(CGSize)a4;
- (void)crop:(CGRect)a3 fromDimensions:(CGSize)a4;
- (void)distortPixels:(unint64_t)a3 undistortedPixels:(const CGPoint *)a4 withCameraCalibration:(id)a5 outDistortedPixels:(CGPoint *)a6;
- (void)scale:(float)a3;
- (void)setDistortionCenter:(CGPoint)a3;
- (void)setInverseLensDistortionLookupTable:(id)a3;
- (void)setLensDistortionLookupTable:(id)a3;
- (void)undistortPixels:(unint64_t)a3 distortedPixels:(const CGPoint *)a4 withCameraCalibration:(id)a5 outUndistortedPixels:(CGPoint *)a6;
@end

@implementation ADMagnificationForRadiusLensDistortionModel

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inverseLensDistortionLookupTable, 0);

  objc_storeStrong((id *)&self->_lensDistortionLookupTable, 0);
}

- (void)setInverseLensDistortionLookupTable:(id)a3
{
}

- (NSData)inverseLensDistortionLookupTable
{
  return self->_inverseLensDistortionLookupTable;
}

- (void)setLensDistortionLookupTable:(id)a3
{
}

- (NSData)lensDistortionLookupTable
{
  return self->_lensDistortionLookupTable;
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

- (id)dictionaryRepresentation:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = objc_opt_new();
  CFDictionaryRef DictionaryRepresentation = CGPointCreateDictionaryRepresentation(self->_distortionCenter);
  [v5 setObject:DictionaryRepresentation forKeyedSubscript:@"lensDistortionCenter"];

  if (v3)
  {
    v7 = dataToFloatsArray(self->_lensDistortionLookupTable);
    [v5 setObject:v7 forKeyedSubscript:@"distortedRadii"];

    v8 = dataToFloatsArray(self->_inverseLensDistortionLookupTable);
    [v5 setObject:v8 forKeyedSubscript:@"undistortedRadii"];
  }
  else
  {
    [v5 setObject:self->_lensDistortionLookupTable forKeyedSubscript:@"distortedRadii"];
    [v5 setObject:self->_inverseLensDistortionLookupTable forKeyedSubscript:@"undistortedRadii"];
  }

  return v5;
}

- (ADMagnificationForRadiusLensDistortionModel)initWithDictionary:(id)a3
{
  v4 = (NSDictionary *)a3;
  if (getDistortionCenterFromDictionary(v4, &self->_distortionCenter))
  {
    v5 = [(NSDictionary *)v4 objectForKeyedSubscript:@"distortedRadii"];
    v6 = getTableAsNSData(v5);

    if ((v6
       || ([(NSDictionary *)v4 objectForKeyedSubscript:@"lensDistortionLookupTable"],
           v7 = (objc_object *)objc_claimAutoreleasedReturnValue(),
           getTableAsNSData(v7),
           v6 = objc_claimAutoreleasedReturnValue(),
           v7,
           v6))
      && ([v6 length] & 3) == 0)
    {
      v9 = [(NSDictionary *)v4 objectForKeyedSubscript:@"undistortedRadii"];
      v10 = getTableAsNSData(v9);

      if ((v10
         || (-[NSDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", @"inverseLensDistortionLookupTable"), v11 = (objc_object *)objc_claimAutoreleasedReturnValue(), getTableAsNSData(v11), v10 = objc_claimAutoreleasedReturnValue(), v11, v10))&& ([v10 length] & 3) == 0)
      {
        self = -[ADMagnificationForRadiusLensDistortionModel initWithDistortionCenter:lensDistortionLookupTable:inverseLensDistortionLookupTable:](self, "initWithDistortionCenter:lensDistortionLookupTable:inverseLensDistortionLookupTable:", v6, v10, self->_distortionCenter.x, self->_distortionCenter.y);
        v8 = self;
      }
      else
      {
        v8 = 0;
      }
    }
    else
    {
      v8 = 0;
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)undistortPixels:(unint64_t)a3 distortedPixels:(const CGPoint *)a4 withCameraCalibration:(id)a5 outUndistortedPixels:(CGPoint *)a6
{
  id v18 = a5;
  [v18 intrinsicMatrix];
  double v16 = v11;
  double v17 = v10;
  double v15 = v12;
  [v18 referenceDimensions];
  -[ADMagnificationForRadiusLensDistortionModel applyDistortionModelToPixels:inPixels:intrinsicsMatrix:referenceDimensions:magnificationLookupTable:outPixels:](self, "applyDistortionModelToPixels:inPixels:intrinsicsMatrix:referenceDimensions:magnificationLookupTable:outPixels:", a3, a4, self->_lensDistortionLookupTable, a6, v17, v16, v15, v13, v14);
}

- (void)distortPixels:(unint64_t)a3 undistortedPixels:(const CGPoint *)a4 withCameraCalibration:(id)a5 outDistortedPixels:(CGPoint *)a6
{
  id v18 = a5;
  [v18 intrinsicMatrix];
  double v16 = v11;
  double v17 = v10;
  double v15 = v12;
  [v18 referenceDimensions];
  -[ADMagnificationForRadiusLensDistortionModel applyDistortionModelToPixels:inPixels:intrinsicsMatrix:referenceDimensions:magnificationLookupTable:outPixels:](self, "applyDistortionModelToPixels:inPixels:intrinsicsMatrix:referenceDimensions:magnificationLookupTable:outPixels:", a3, a4, self->_inverseLensDistortionLookupTable, a6, v17, v16, v15, v13, v14);
}

- (uint64_t)applyDistortionModelToPixels:(double)a3 inPixels:(double)a4 intrinsicsMatrix:(double)a5 referenceDimensions:(double)a6 magnificationLookupTable:(uint64_t)a7 outPixels:(uint64_t)a8
{
  id v17 = a10;
  double v18 = *(double *)(a1 + 24);
  double v19 = *(double *)(a1 + 32);
  if (v18 <= a5 - v18) {
    double v20 = a5 - v18;
  }
  else {
    double v20 = *(double *)(a1 + 24);
  }
  if (v19 <= a6 - v19) {
    double v21 = a6 - v19;
  }
  else {
    double v21 = *(double *)(a1 + 32);
  }
  id v35 = v17;
  uint64_t v22 = [v35 bytes];
  unint64_t v23 = [v35 length];
  if (v23 > 3)
  {
    id v24 = v35;
    if (a8)
    {
      float v25 = v20;
      float v26 = v21;
      float v27 = sqrtf((float)(v26 * v26) + (float)(v25 * v25));
      uint64_t v28 = (v23 >> 2) - 1;
      do
      {
        float64x2_t v29 = *(float64x2_t *)(a1 + 24);
        float32x2_t v30 = vcvt_f32_f64(vsubq_f64(*a9, v29));
        float v31 = sqrtf(vmlas_n_f32(COERCE_FLOAT(vmul_f32(v30, v30).i32[1]), v30.f32[0], v30.f32[0]));
        if (v31 >= v27)
        {
          float v33 = *(float *)(v22 + 4 * v28);
        }
        else
        {
          float v32 = (float)((float)(unint64_t)v28 / v27) * v31;
          float v33 = (float)((float)(v32 - (float)(int)v32) * *(float *)(v22 + 4 * (int)v32 + 4))
              + (float)((float)(1.0 - (float)(v32 - (float)(int)v32)) * *(float *)(v22 + 4 * (int)v32));
        }
        *a11++ = vaddq_f64(v29, vcvtq_f64_f32(vmla_n_f32(v30, v30, v33)));
        ++a9;
        --a8;
      }
      while (a8);
    }
  }
  else
  {
    unint64_t v23 = (unint64_t)memcpy(a11, a9, 16 * a8);
    id v24 = v35;
  }

  return MEMORY[0x270F9A758](v23, v24);
}

- (ADMagnificationForRadiusLensDistortionModel)initWithDistortionCenter:(CGPoint)a3 lensDistortionLookupTable:(id)a4 inverseLensDistortionLookupTable:(id)a5
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v10 = a4;
  id v11 = a5;
  double v12 = v11;
  if (!v10)
  {
    double v16 = @"lensDistortionLookupTable cannot be nil";
    goto LABEL_8;
  }
  if (!v11)
  {
    double v16 = @"inverseLensDistortionLookupTable cannot be nil";
LABEL_8:
    id v17 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:v16 userInfo:0];
    objc_exception_throw(v17);
  }
  v18.receiver = self;
  v18.super_class = (Class)ADMagnificationForRadiusLensDistortionModel;
  double v13 = [(ADMagnificationForRadiusLensDistortionModel *)&v18 init];
  double v14 = v13;
  if (v13)
  {
    v13->_distortionCenter.CGFloat x = x;
    v13->_distortionCenter.CGFloat y = y;
    objc_storeStrong((id *)&v13->_lensDistortionLookupTable, a4);
    objc_storeStrong((id *)&v14->_inverseLensDistortionLookupTable, a5);
  }

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [ADMagnificationForRadiusLensDistortionModel alloc];
  double x = self->_distortionCenter.x;
  double y = self->_distortionCenter.y;
  v7 = (void *)[(NSData *)self->_lensDistortionLookupTable copy];
  v8 = (void *)[(NSData *)self->_inverseLensDistortionLookupTable copy];
  v9 = -[ADMagnificationForRadiusLensDistortionModel initWithDistortionCenter:lensDistortionLookupTable:inverseLensDistortionLookupTable:](v4, "initWithDistortionCenter:lensDistortionLookupTable:inverseLensDistortionLookupTable:", v7, v8, x, y);

  return v9;
}

- (unint64_t)hash
{
  BOOL v3 = [NSNumber numberWithDouble:self->_distortionCenter.x];
  uint64_t v4 = [v3 hash];

  v5 = [NSNumber numberWithDouble:self->_distortionCenter.y];
  uint64_t v6 = v4 ^ (2 * [v5 hash]);

  uint64_t v7 = v6 ^ (3 * [(NSData *)self->_lensDistortionLookupTable hash]);
  return v7 ^ (4 * [(NSData *)self->_inverseLensDistortionLookupTable hash]);
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (ADMagnificationForRadiusLensDistortionModel *)a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_8;
  }
  if (self == v4)
  {
    char v16 = 1;
    goto LABEL_13;
  }
  if ([(ADMagnificationForRadiusLensDistortionModel *)v4 isMemberOfClass:objc_opt_class()])
  {
    uint64_t v6 = v5;
    double x = self->_distortionCenter.x;
    double y = self->_distortionCenter.y;
    [(ADMagnificationForRadiusLensDistortionModel *)v6 distortionCenter];
    LOBYTE(v10) = 1;
    if (x == v11 && y == v9)
    {
      lensDistortionLookupTable = self->_lensDistortionLookupTable;
      double v13 = [(ADMagnificationForRadiusLensDistortionModel *)v6 lensDistortionLookupTable];
      if ([(NSData *)lensDistortionLookupTable isEqualToData:v13])
      {
        inverseLensDistortionLookupTable = self->_inverseLensDistortionLookupTable;
        double v15 = [(ADMagnificationForRadiusLensDistortionModel *)v6 inverseLensDistortionLookupTable];
        int v10 = ![(NSData *)inverseLensDistortionLookupTable isEqualToData:v15];
      }
      else
      {
        LOBYTE(v10) = 1;
      }
    }
    char v16 = v10 ^ 1;
  }
  else
  {
LABEL_8:
    char v16 = 0;
  }
LABEL_13:

  return v16;
}

- (void)adjustForImageRotation:(int64_t)a3 forDimensions:(CGSize)a4
{
  self->_distortionCenter.double x = rotateUVPoint(a3, self->_distortionCenter.x, self->_distortionCenter.y, a4.width, a4.height);
  self->_distortionCenter.double y = v5;
}

- (void)scale:(float)a3
{
  self->_distortionCenter = (CGPoint)vmulq_n_f64((float64x2_t)self->_distortionCenter, a3);
}

- (void)crop:(CGRect)a3 fromDimensions:(CGSize)a4
{
  CGFloat v4 = self->_distortionCenter.y - a3.origin.y;
  self->_distortionCenter.double x = self->_distortionCenter.x - a3.origin.x;
  self->_distortionCenter.double y = v4;
}

@end