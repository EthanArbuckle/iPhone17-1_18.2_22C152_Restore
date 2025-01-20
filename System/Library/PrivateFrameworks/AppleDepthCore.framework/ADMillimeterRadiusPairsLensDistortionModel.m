@interface ADMillimeterRadiusPairsLensDistortionModel
- (ADMillimeterRadiusPairsLensDistortionModel)initWithDictionary:(id)a3;
- (ADMillimeterRadiusPairsLensDistortionModel)initWithDistortionCenter:(CGPoint)a3 distortedRadii:(id)a4 undistortedRadii:(id)a5;
- (BOOL)isEqual:(id)a3;
- (CGPoint)distortionCenter;
- (NSData)distortedRadii;
- (NSData)undistortedRadii;
- (float)applyDistortionModelToPixels:(double)a3 inPixels:(double)a4 intrinsicsMatrix:(float)a5 pixelSize:(uint64_t)a6 distort:(uint64_t)a7 outPixels:(double *)a8;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation:(BOOL)a3;
- (unint64_t)hash;
- (void)adjustForImageRotation:(int64_t)a3 forDimensions:(CGSize)a4;
- (void)crop:(CGRect)a3 fromDimensions:(CGSize)a4;
- (void)distortPixels:(unint64_t)a3 undistortedPixels:(const CGPoint *)a4 withCameraCalibration:(id)a5 outDistortedPixels:(CGPoint *)a6;
- (void)scale:(float)a3;
- (void)setDistortedRadii:(id)a3;
- (void)setDistortionCenter:(CGPoint)a3;
- (void)setUndistortedRadii:(id)a3;
- (void)undistortPixels:(unint64_t)a3 distortedPixels:(const CGPoint *)a4 withCameraCalibration:(id)a5 outUndistortedPixels:(CGPoint *)a6;
@end

@implementation ADMillimeterRadiusPairsLensDistortionModel

- (ADMillimeterRadiusPairsLensDistortionModel)initWithDictionary:(id)a3
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
        self = -[ADMillimeterRadiusPairsLensDistortionModel initWithDistortionCenter:distortedRadii:undistortedRadii:](self, "initWithDistortionCenter:distortedRadii:undistortedRadii:", v6, v10, self->_distortionCenter.x, self->_distortionCenter.y);
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

- (ADMillimeterRadiusPairsLensDistortionModel)initWithDistortionCenter:(CGPoint)a3 distortedRadii:(id)a4 undistortedRadii:(id)a5
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v10 = a4;
  id v11 = a5;
  v12 = v11;
  if (!v10)
  {
    v17 = @"distortedRadii cannot be nil";
    goto LABEL_13;
  }
  if (!v11)
  {
    v17 = @"undistortedRadii cannot be nil";
LABEL_13:
    id v18 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:v17 userInfo:0];
    objc_exception_throw(v18);
  }
  v20.receiver = self;
  v20.super_class = (Class)ADMillimeterRadiusPairsLensDistortionModel;
  v13 = [(ADMillimeterRadiusPairsLensDistortionModel *)&v20 init];
  if (!v13)
  {
LABEL_6:
    v15 = v13;
    goto LABEL_10;
  }
  uint64_t v14 = [v10 length];
  if (v14 == [v12 length])
  {
    v13->_distortionCenter.CGFloat x = x;
    v13->_distortionCenter.CGFloat y = y;
    objc_storeStrong((id *)&v13->_distortedRadii, a4);
    objc_storeStrong((id *)&v13->_undistortedRadii, a5);
    goto LABEL_6;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v19 = 0;
    _os_log_error_impl(&dword_247EC4000, &_os_log_internal, OS_LOG_TYPE_ERROR, "ADMillimeterRadiusPairsLensDistortionModel: cannot init when distorted and undistorted radii are not with the same length", v19, 2u);
  }
  v15 = 0;
LABEL_10:

  return v15;
}

- (void)distortPixels:(unint64_t)a3 undistortedPixels:(const CGPoint *)a4 withCameraCalibration:(id)a5 outDistortedPixels:(CGPoint *)a6
{
  id v18 = a5;
  [v18 intrinsicMatrix];
  double v16 = v11;
  double v17 = v10;
  double v15 = v12;
  [v18 pixelSize];
  LODWORD(v14) = v13;
  -[ADMillimeterRadiusPairsLensDistortionModel applyDistortionModelToPixels:inPixels:intrinsicsMatrix:pixelSize:distort:outPixels:](self, "applyDistortionModelToPixels:inPixels:intrinsicsMatrix:pixelSize:distort:outPixels:", a3, a4, 1, a6, v17, v16, v15, v14);
}

- (void)undistortPixels:(unint64_t)a3 distortedPixels:(const CGPoint *)a4 withCameraCalibration:(id)a5 outUndistortedPixels:(CGPoint *)a6
{
  id v18 = a5;
  [v18 intrinsicMatrix];
  double v16 = v11;
  double v17 = v10;
  double v15 = v12;
  [v18 pixelSize];
  LODWORD(v14) = v13;
  -[ADMillimeterRadiusPairsLensDistortionModel applyDistortionModelToPixels:inPixels:intrinsicsMatrix:pixelSize:distort:outPixels:](self, "applyDistortionModelToPixels:inPixels:intrinsicsMatrix:pixelSize:distort:outPixels:", a3, a4, 0, a6, v17, v16, v15, v14);
}

- (float)applyDistortionModelToPixels:(double)a3 inPixels:(double)a4 intrinsicsMatrix:(float)a5 pixelSize:(uint64_t)a6 distort:(uint64_t)a7 outPixels:(double *)a8
{
  double v16 = (id *)(a1 + 8);
  unint64_t v17 = [*(id *)(a1 + 8) length];
  if (v17 > 3)
  {
    uint64_t v19 = v17;
    if (a9)
    {
      uint64_t v20 = [*(id *)(a1 + 16) bytes];
    }
    else
    {
      uint64_t v20 = [*(id *)(a1 + 8) bytes];
      double v16 = (id *)(a1 + 16);
    }
    result = (float *)[*v16 bytes];
    if (a7)
    {
      uint64_t v21 = 0;
      double v22 = a5;
      uint64_t v23 = ((unint64_t)v19 >> 2) - 1;
      do
      {
        double v24 = *((float *)&a4 + 1);
        double v25 = *(float *)&a4;
        if (a9)
        {
          double v25 = *(double *)(a1 + 24);
          double v24 = *(double *)(a1 + 32);
        }
        double v26 = a8[2 * v21 + 1] - v24;
        double v27 = (a8[2 * v21] - v25) * v22;
        double v28 = v26 * v22;
        double v29 = sqrt(v28 * v28 + v27 * v27);
        double v30 = 1.0;
        if (v29 != 0.0)
        {
          float v31 = *(float *)(v20 + 4 * v23);
          unint64_t v32 = v19 >> 2;
          v33 = (float *)v20;
          if (v29 >= v31)
          {
            if (v31 != 0.0) {
              double v30 = (float)(result[v23] / v31);
            }
          }
          else
          {
            do
            {
              unint64_t v34 = v32 >> 1;
              v35 = &v33[v32 >> 1];
              float v37 = *v35;
              v36 = v35 + 1;
              v32 += ~(v32 >> 1);
              if (v29 < v37) {
                unint64_t v32 = v34;
              }
              else {
                v33 = v36;
              }
            }
            while (v32);
            double v30 = (*(float *)((char *)v33 + (void)result - v20 - 4)
                 + (float)((float)(*(float *)((char *)v33 + (void)result - v20)
                                 - *(float *)((char *)v33 + (void)result - v20 - 4))
                         / (float)(*v33 - *(v33 - 1)))
                 * (v29 - *(v33 - 1)))
                / v29;
          }
        }
        double v38 = v28 * v30 / v22;
        if (a9)
        {
          double v39 = v38 + *((float *)&a4 + 1);
          double v40 = *(float *)&a4;
        }
        else
        {
          double v40 = *(double *)(a1 + 24);
          double v39 = v38 + *(double *)(a1 + 32);
        }
        v41 = (double *)&a10[16 * v21];
        double *v41 = v27 * v30 / v22 + v40;
        v41[1] = v39;
        ++v21;
      }
      while (v21 != a7);
    }
  }
  else
  {
    return (float *)memcpy(a10, a8, 16 * a7);
  }
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
    v7 = dataToFloatsArray(self->_distortedRadii);
    [v5 setObject:v7 forKeyedSubscript:@"distortedRadii"];

    v8 = dataToFloatsArray(self->_undistortedRadii);
    [v5 setObject:v8 forKeyedSubscript:@"undistortedRadii"];
  }
  else
  {
    [v5 setObject:self->_distortedRadii forKeyedSubscript:@"distortedRadii"];
    [v5 setObject:self->_undistortedRadii forKeyedSubscript:@"undistortedRadii"];
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_undistortedRadii, 0);

  objc_storeStrong((id *)&self->_distortedRadii, 0);
}

- (void)setUndistortedRadii:(id)a3
{
}

- (NSData)undistortedRadii
{
  return self->_undistortedRadii;
}

- (void)setDistortedRadii:(id)a3
{
}

- (NSData)distortedRadii
{
  return self->_distortedRadii;
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

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [ADMillimeterRadiusPairsLensDistortionModel alloc];
  double x = self->_distortionCenter.x;
  double y = self->_distortionCenter.y;
  v7 = (void *)[(NSData *)self->_distortedRadii copy];
  v8 = (void *)[(NSData *)self->_undistortedRadii copy];
  v9 = -[ADMillimeterRadiusPairsLensDistortionModel initWithDistortionCenter:distortedRadii:undistortedRadii:](v4, "initWithDistortionCenter:distortedRadii:undistortedRadii:", v7, v8, x, y);

  return v9;
}

- (unint64_t)hash
{
  BOOL v3 = [NSNumber numberWithDouble:self->_distortionCenter.x];
  uint64_t v4 = [v3 hash];

  v5 = [NSNumber numberWithDouble:self->_distortionCenter.y];
  uint64_t v6 = v4 ^ (2 * [v5 hash]);

  uint64_t v7 = v6 ^ (3 * [(NSData *)self->_distortedRadii hash]);
  return v7 ^ (4 * [(NSData *)self->_undistortedRadii hash]);
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (ADMillimeterRadiusPairsLensDistortionModel *)a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_8;
  }
  if (self == v4)
  {
    char v16 = 1;
    goto LABEL_13;
  }
  if ([(ADMillimeterRadiusPairsLensDistortionModel *)v4 isMemberOfClass:objc_opt_class()])
  {
    uint64_t v6 = v5;
    double x = self->_distortionCenter.x;
    double y = self->_distortionCenter.y;
    [(ADMillimeterRadiusPairsLensDistortionModel *)v6 distortionCenter];
    LOBYTE(v10) = 1;
    if (x == v11 && y == v9)
    {
      distortedRadii = self->_distortedRadii;
      int v13 = [(ADMillimeterRadiusPairsLensDistortionModel *)v6 distortedRadii];
      if ([(NSData *)distortedRadii isEqualToData:v13])
      {
        undistortedRadii = self->_undistortedRadii;
        double v15 = [(ADMillimeterRadiusPairsLensDistortionModel *)v6 undistortedRadii];
        int v10 = ![(NSData *)undistortedRadii isEqualToData:v15];
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