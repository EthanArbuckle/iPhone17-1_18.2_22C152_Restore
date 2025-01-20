@interface CIStraightenFilter
+ (id)customAttributes;
- (CIImage)inputImage;
- (NSNumber)inputAngle;
- (id)outputImage;
- (void)setInputAngle:(id)a3;
- (void)setInputImage:(id)a3;
@end

@implementation CIStraightenFilter

+ (id)customAttributes
{
  v5[3] = *MEMORY[0x1E4F143B8];
  v4[0] = @"CIAttributeFilterCategories";
  v3[0] = @"CICategoryGeometryAdjustment";
  v3[1] = @"CICategoryVideo";
  v3[2] = @"CICategoryStillImage";
  v3[3] = @"CICategoryBuiltIn";
  v5[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:4];
  v5[1] = @"5";
  v4[1] = @"CIAttributeFilterAvailable_iOS";
  v4[2] = @"CIAttributeFilterAvailable_Mac";
  v5[2] = @"10.7";
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:3];
}

- (id)outputImage
{
  if (!self->inputImage) {
    return 0;
  }
  [(NSNumber *)self->inputAngle doubleValue];
  double v4 = v3;
  __double2 v5 = __sincos_stret(v3);
  double v6 = fabs(v5.__sinval);
  inputImage = self->inputImage;
  if (v6 >= 0.001 || v5.__cosval <= 0.0)
  {
    [(CIImage *)inputImage extent];
    CGRect v35 = CGRectStandardize(v34);
    CGFloat x = v35.origin.x;
    double width = v35.size.width;
    CGFloat height = v35.size.height;
    double y = v35.origin.y;
    double MidX = CGRectGetMidX(v35);
    double v27 = x;
    v36.origin.CGFloat x = x;
    double v13 = height;
    double v14 = width;
    v36.origin.double y = y;
    v36.size.double width = width;
    v36.size.CGFloat height = v13;
    double MidY = CGRectGetMidY(v36);
    if (v6 >= 0.001 || v5.__cosval >= 0.0)
    {
      double v17 = fmax(width, v13);
      double v18 = fmin(width, v13);
      if (fabs(v5.__cosval) >= 0.001)
      {
        double v26 = hypot(v17, v18);
        double v22 = atan2(v17, v18);
        double v23 = -v4;
        double v24 = fabs(cos(v22 - v4));
        double v25 = v26 * fmax(v24, fabs(cos(v23 - v22))) / v18;
        v20 = self->inputImage;
        v30[0] = v5.__cosval * v25;
        v30[1] = v5.__sinval * v25;
        v30[2] = -(v5.__sinval * v25);
        v30[3] = v5.__cosval * v25;
        v30[4] = MidX - v5.__cosval * v25 * MidX + v5.__sinval * v25 * MidY;
        v30[5] = MidY - v5.__sinval * v25 * MidX - v5.__cosval * v25 * MidY;
        v21 = v30;
      }
      else
      {
        double v19 = -v17;
        if (v5.__sinval > 0.0) {
          double v19 = v17;
        }
        v20 = self->inputImage;
        v31[0] = 0;
        *(double *)&v31[1] = v19 / v18;
        *(double *)&v31[2] = -(v19 / v18);
        v31[3] = 0;
        *(double *)&v31[4] = MidX + v19 / v18 * MidY;
        *(double *)&v31[5] = MidY - v19 / v18 * MidX;
        v21 = (double *)v31;
      }
      return -[CIImage imageByCroppingToRect:]([(CIImage *)v20 imageByApplyingTransform:v21], "imageByCroppingToRect:", v27, y, v14, v13);
    }
    else
    {
      v16 = self->inputImage;
      v32[0] = 0xBFF0000000000000;
      v32[1] = 0;
      v32[2] = 0;
      v32[3] = 0xBFF0000000000000;
      *(double *)&v32[4] = MidX + MidX;
      *(double *)&v32[5] = MidY + MidY;
      return [(CIImage *)v16 imageByApplyingTransform:v32];
    }
  }
  else
  {
    v8 = inputImage;
    return v8;
  }
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
}

- (NSNumber)inputAngle
{
  return self->inputAngle;
}

- (void)setInputAngle:(id)a3
{
}

@end