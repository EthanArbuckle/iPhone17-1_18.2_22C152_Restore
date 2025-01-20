@interface CIPortraitLightingStrobe
+ (id)customAttributes;
- (CIImage)inputImage;
- (CIVector)inputCenter1;
- (CIVector)inputCenter2;
- (NSNumber)inputOrientation;
- (NSNumber)inputRotate;
- (NSNumber)inputStrength;
- (NSNumber)inputWidth;
- (id)_strobeKernel;
- (id)outputImage;
- (void)setInputCenter1:(id)a3;
- (void)setInputCenter2:(id)a3;
- (void)setInputImage:(id)a3;
- (void)setInputOrientation:(id)a3;
- (void)setInputRotate:(id)a3;
- (void)setInputStrength:(id)a3;
- (void)setInputWidth:(id)a3;
@end

@implementation CIPortraitLightingStrobe

+ (id)customAttributes
{
  v8[0] = kCIAttributeFilterCategories;
  v7[0] = kCICategoryColorAdjustment;
  v7[1] = kCICategoryVideo;
  v7[2] = kCICategoryStillImage;
  v7[3] = kCICategoryInterlaced;
  v7[4] = kCICategoryNonSquarePixels;
  v7[5] = kCICategoryBuiltIn;
  v7[6] = kCICategoryApplePrivate;
  v9[0] = +[NSArray arrayWithObjects:v7 count:7];
  v9[1] = @"11";
  v8[1] = kCIAttributeFilterAvailable_iOS;
  v8[2] = kCIAttributeFilterAvailable_Mac;
  v9[2] = @"10.12";
  v8[3] = @"inputStrength";
  v5[0] = kCIAttributeMin;
  v5[1] = kCIAttributeSliderMin;
  v6[0] = &off_79A10;
  v6[1] = &off_79A10;
  v5[2] = kCIAttributeSliderMax;
  v5[3] = kCIAttributeDefault;
  v6[2] = &off_79A20;
  v6[3] = &off_79A30;
  v5[4] = kCIAttributeIdentity;
  v5[5] = kCIAttributeType;
  v6[4] = &off_79A30;
  v6[5] = kCIAttributeTypeScalar;
  v9[3] = +[NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:6];
  v8[4] = @"inputOrientation";
  v3[0] = kCIAttributeMin;
  v3[1] = kCIAttributeSliderMin;
  v4[0] = &off_79A80;
  v4[1] = &off_79A80;
  v3[2] = kCIAttributeSliderMax;
  v3[3] = kCIAttributeDefault;
  v4[2] = &off_79A90;
  v4[3] = &off_79A80;
  v3[4] = kCIAttributeIdentity;
  v3[5] = kCIAttributeType;
  v4[4] = &off_79A80;
  v4[5] = kCIAttributeTypeScalar;
  v9[4] = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:6];
  return +[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:5];
}

- (id)_strobeKernel
{
  if (qword_8CA90 != -1) {
    dispatch_once(&qword_8CA90, &stru_74DA0);
  }
  return (id)qword_8CA88;
}

- (id)outputImage
{
  if (!self->inputImage) {
    return 0;
  }
  [(NSNumber *)self->inputWidth floatValue];
  float v4 = v3;
  [(NSNumber *)self->inputStrength floatValue];
  float v37 = v5;
  unsigned int v6 = [(NSNumber *)self->inputOrientation intValue] - 5;
  inputCenter2 = self->inputCenter2;
  if (v6 > 3)
  {
    [(CIVector *)inputCenter2 Y];
    double v19 = v18;
    [(CIVector *)self->inputCenter1 Y];
    *(float *)&double v20 = v19 - v20;
    float v11 = *(float *)&v20 * 0.35;
    [(CIVector *)self->inputCenter2 X];
    double v22 = v21;
    [(CIVector *)self->inputCenter1 X];
    *(float *)&double v23 = v22 - v23;
    LODWORD(v22) = atan2f(v11, -*(float *)&v23);
    [(NSNumber *)self->inputRotate floatValue];
    float v16 = *(float *)&v22 + v24;
  }
  else
  {
    [(CIVector *)inputCenter2 X];
    double v9 = v8;
    [(CIVector *)self->inputCenter1 X];
    *(float *)&double v10 = v9 - v10;
    float v11 = *(float *)&v10 * 0.35;
    [(CIVector *)self->inputCenter2 Y];
    double v13 = v12;
    [(CIVector *)self->inputCenter1 Y];
    float v15 = v13 - v14;
    float v16 = atan2f(v11, v15);
  }
  if (fabsf(v4) >= 1.0e-10) {
    float v25 = v4;
  }
  else {
    float v25 = v11 * 0.5;
  }
  double v26 = v16;
  __double2 v27 = __sincos_stret(v16);
  long double v28 = sin(v26 + v26);
  v29 = +[CIVector vectorWithX:v27.__sinval * v27.__sinval / ((v11 + v11) * v11) + v27.__cosval * v27.__cosval / ((v25 + v25) * v25) Y:(double)(v28 / (v11 * 4.0 * v11) - v28 / (v25 * 4.0 * v25)) Z:v27.__cosval * v27.__cosval / ((v11 + v11) * v11) + v27.__sinval * v27.__sinval / ((v25 + v25) * v25) W:v37];
  inputCenter1 = self->inputCenter1;
  id v31 = [(CIPortraitLightingStrobe *)self _strobeKernel];
  [(CIImage *)self->inputImage extent];
  v38[0] = self->inputImage;
  v38[1] = inputCenter1;
  inputStrength = self->inputStrength;
  v38[2] = v29;
  v38[3] = inputStrength;
  return objc_msgSend(v31, "applyWithExtent:arguments:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v38, 4), v33, v34, v35, v36);
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
}

- (CIVector)inputCenter1
{
  return self->inputCenter1;
}

- (void)setInputCenter1:(id)a3
{
}

- (CIVector)inputCenter2
{
  return self->inputCenter2;
}

- (void)setInputCenter2:(id)a3
{
}

- (NSNumber)inputWidth
{
  return self->inputWidth;
}

- (void)setInputWidth:(id)a3
{
}

- (NSNumber)inputRotate
{
  return self->inputRotate;
}

- (void)setInputRotate:(id)a3
{
}

- (NSNumber)inputStrength
{
  return self->inputStrength;
}

- (void)setInputStrength:(id)a3
{
}

- (NSNumber)inputOrientation
{
  return self->inputOrientation;
}

- (void)setInputOrientation:(id)a3
{
}

@end