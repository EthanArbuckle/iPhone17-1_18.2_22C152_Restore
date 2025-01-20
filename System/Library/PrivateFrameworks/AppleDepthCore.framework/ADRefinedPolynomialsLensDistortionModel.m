@interface ADRefinedPolynomialsLensDistortionModel
- (ADRefinedPolynomialsLensDistortionModel)initWithDistortionCenter:(CGPoint)a3 pixelSize:(float)a4 focalLength:(float)a5 polynomialsBase:(const ADDistortionPolynomials *)a6 polynomialsDynamic:(const ADDistortionPolynomials *)a7;
- (BOOL)isEqual:(id)a3;
- (float)focalLength;
- (float)pixelSize;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)distortPixels:(unint64_t)a3 undistortedPixels:(const CGPoint *)a4 withCameraCalibration:(id)a5 outDistortedPixels:(CGPoint *)a6;
- (void)setDynamicFactor:(float)a3;
- (void)setFocalLength:(float)a3;
- (void)setPixelSize:(float)a3;
- (void)undistortPixels:(unint64_t)a3 distortedPixels:(const CGPoint *)a4 withCameraCalibration:(id)a5 outUndistortedPixels:(CGPoint *)a6;
- (void)updateDynamicFactor;
@end

@implementation ADRefinedPolynomialsLensDistortionModel

- (float)focalLength
{
  return self->_pixelSize;
}

- (float)pixelSize
{
  return *(&self->super._dynamicFactor + 1);
}

- (void)undistortPixels:(unint64_t)a3 distortedPixels:(const CGPoint *)a4 withCameraCalibration:(id)a5 outUndistortedPixels:(CGPoint *)a6
{
  id v10 = a5;
  int v11 = *((_DWORD *)&self->super._dynamicFactor + 1);
  id v15 = v10;
  [v10 referenceDimensions];
  double v13 = v12;
  LODWORD(v12) = v11;
  -[ADPolynomialsLensDistortionModel undistortPixels:distortedPixels:withPixelSize:referenceDimensions:outUndistortedPixels:](self, "undistortPixels:distortedPixels:withPixelSize:referenceDimensions:outUndistortedPixels:", a3, a4, a6, v12, v13, v14);
}

- (void)distortPixels:(unint64_t)a3 undistortedPixels:(const CGPoint *)a4 withCameraCalibration:(id)a5 outDistortedPixels:(CGPoint *)a6
{
  id v10 = a5;
  int v11 = *((_DWORD *)&self->super._dynamicFactor + 1);
  id v15 = v10;
  [v10 referenceDimensions];
  double v13 = v12;
  LODWORD(v12) = v11;
  -[ADPolynomialsLensDistortionModel distortPixels:undistortedPixels:withPixelSize:referenceDimensions:outDistortedPixels:](self, "distortPixels:undistortedPixels:withPixelSize:referenceDimensions:outDistortedPixels:", a3, a4, a6, v12, v13, v14);
}

- (ADRefinedPolynomialsLensDistortionModel)initWithDistortionCenter:(CGPoint)a3 pixelSize:(float)a4 focalLength:(float)a5 polynomialsBase:(const ADDistortionPolynomials *)a6 polynomialsDynamic:(const ADDistortionPolynomials *)a7
{
  if (!a6 || !a7)
  {
    objc_msgSend(MEMORY[0x263EFF940], "exceptionWithName:reason:userInfo:", *MEMORY[0x263EFF4A0], @"distortion polynomials cannot be nil", 0, a3.x, a3.y);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v11);
  }
  *(float *)&double v9 = a4 * a5;
  v12.receiver = self;
  v12.super_class = (Class)ADRefinedPolynomialsLensDistortionModel;
  result = -[ADDynamicPolynomialsLensDistortionModel initWithDistortionCenter:dynFactor:polynomialsBase:polynomialsDynamic:](&v12, sel_initWithDistortionCenter_dynFactor_polynomialsBase_polynomialsDynamic_, a3.x, a3.y, v9);
  if (result)
  {
    result->_pixelSize = a5;
    *(&result->super._dynamicFactor + 1) = a4;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [ADRefinedPolynomialsLensDistortionModel alloc];
  [(ADPolynomialsLensDistortionModel *)self distortionCenter];
  double v6 = v5;
  double v8 = v7;
  int v9 = *((_DWORD *)&self->super._dynamicFactor + 1);
  float pixelSize = self->_pixelSize;
  id v11 = [(ADDynamicPolynomialsLensDistortionModel *)self distortionPolynomialsBase];
  objc_super v12 = [(ADDynamicPolynomialsLensDistortionModel *)self distortionPolynomialsDynamic];
  LODWORD(v13) = v9;
  *(float *)&double v14 = pixelSize;

  return -[ADRefinedPolynomialsLensDistortionModel initWithDistortionCenter:pixelSize:focalLength:polynomialsBase:polynomialsDynamic:](v4, "initWithDistortionCenter:pixelSize:focalLength:polynomialsBase:polynomialsDynamic:", v11, v12, v6, v8, v13, v14);
}

- (void)setDynamicFactor:(float)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ADRefinedPolynomialsLensDistortionModel;
  -[ADDynamicPolynomialsLensDistortionModel setDynamicFactor:](&v5, sel_setDynamicFactor_);
  *(&self->super._dynamicFactor + 1) = a3;
  self->_float pixelSize = 1.0;
}

- (void)setFocalLength:(float)a3
{
  self->_float pixelSize = a3;
  [(ADRefinedPolynomialsLensDistortionModel *)self updateDynamicFactor];
}

- (void)setPixelSize:(float)a3
{
  *(&self->super._dynamicFactor + 1) = a3;
  [(ADRefinedPolynomialsLensDistortionModel *)self updateDynamicFactor];
}

- (void)updateDynamicFactor
{
  *(float *)&double v2 = *(&self->super._dynamicFactor + 1) * self->_pixelSize;
  v3.receiver = self;
  v3.super_class = (Class)ADRefinedPolynomialsLensDistortionModel;
  [(ADDynamicPolynomialsLensDistortionModel *)&v3 setDynamicFactor:v2];
}

- (unint64_t)hash
{
  v11.receiver = self;
  v11.super_class = (Class)ADRefinedPolynomialsLensDistortionModel;
  unint64_t v3 = [(ADDynamicPolynomialsLensDistortionModel *)&v11 hash];
  LODWORD(v4) = *((_DWORD *)&self->super._dynamicFactor + 1);
  objc_super v5 = [NSNumber numberWithFloat:v4];
  uint64_t v6 = [v5 hash];

  *(float *)&double v7 = self->_pixelSize;
  double v8 = [NSNumber numberWithFloat:v7];
  unint64_t v9 = v3 ^ (2 * v6) ^ (3 * [v8 hash]);

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  double v4 = (ADRefinedPolynomialsLensDistortionModel *)a3;
  objc_super v5 = v4;
  if (!v4) {
    goto LABEL_14;
  }
  if (self == v4)
  {
    BOOL v12 = 1;
    goto LABEL_16;
  }
  if ([(ADRefinedPolynomialsLensDistortionModel *)v4 isMemberOfClass:objc_opt_class()])
  {
    uint64_t v6 = v5;
    [(ADPolynomialsLensDistortionModel *)self distortionCenter];
    double v8 = v7;
    double v10 = v9;
    [(ADPolynomialsLensDistortionModel *)v6 distortionCenter];
    BOOL v12 = 0;
    if (v8 == v13 && v10 == v11)
    {
      BOOL v12 = 0;
      if (+[ADPolynomialsLensDistortionModel isEqualPolynomials:&self->super.super._polynomials otherPolynomials:[(ADPolynomialsLensDistortionModel *)v6 distortionPolynomials]])
      {
        [(ADDynamicPolynomialsLensDistortionModel *)self dynamicFactor];
        float v15 = v14;
        [(ADDynamicPolynomialsLensDistortionModel *)v6 dynamicFactor];
        if (v15 == v16)
        {
          if (+[ADPolynomialsLensDistortionModel isEqualPolynomials:[(ADDynamicPolynomialsLensDistortionModel *)self distortionPolynomialsBase] otherPolynomials:[(ADDynamicPolynomialsLensDistortionModel *)v6 distortionPolynomialsBase]])
          {
            if (+[ADPolynomialsLensDistortionModel isEqualPolynomials:[(ADDynamicPolynomialsLensDistortionModel *)self distortionPolynomialsDynamic] otherPolynomials:[(ADDynamicPolynomialsLensDistortionModel *)v6 distortionPolynomialsDynamic]])
            {
              float v17 = *(&self->super._dynamicFactor + 1);
              [(ADRefinedPolynomialsLensDistortionModel *)v6 pixelSize];
              if (v17 == v18)
              {
                float pixelSize = self->_pixelSize;
                [(ADRefinedPolynomialsLensDistortionModel *)v6 focalLength];
                if (pixelSize == v20) {
                  BOOL v12 = 1;
                }
              }
            }
          }
        }
      }
    }
  }
  else
  {
LABEL_14:
    BOOL v12 = 0;
  }
LABEL_16:

  return v12;
}

@end