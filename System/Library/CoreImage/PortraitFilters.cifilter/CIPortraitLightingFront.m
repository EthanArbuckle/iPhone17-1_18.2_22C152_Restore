@interface CIPortraitLightingFront
+ (id)customAttributes;
- (CIImage)inputImage;
- (CIVector)inputBottom1;
- (CIVector)inputBottom2;
- (CIVector)inputCenter1;
- (CIVector)inputCenter2;
- (NSNumber)inputBrighten;
- (NSNumber)inputContrast;
- (NSNumber)inputHeight1;
- (NSNumber)inputHeight2;
- (NSNumber)inputRotate1;
- (NSNumber)inputRotate2;
- (NSNumber)inputStrength;
- (NSNumber)inputWidth1;
- (NSNumber)inputWidth2;
- (id)_dualLightKernel;
- (id)outputImage;
- (void)setInputBottom1:(id)a3;
- (void)setInputBottom2:(id)a3;
- (void)setInputBrighten:(id)a3;
- (void)setInputCenter1:(id)a3;
- (void)setInputCenter2:(id)a3;
- (void)setInputContrast:(id)a3;
- (void)setInputHeight1:(id)a3;
- (void)setInputHeight2:(id)a3;
- (void)setInputImage:(id)a3;
- (void)setInputRotate1:(id)a3;
- (void)setInputRotate2:(id)a3;
- (void)setInputStrength:(id)a3;
- (void)setInputWidth1:(id)a3;
- (void)setInputWidth2:(id)a3;
@end

@implementation CIPortraitLightingFront

+ (id)customAttributes
{
  v10[0] = kCIAttributeFilterCategories;
  v9[0] = kCICategoryColorAdjustment;
  v9[1] = kCICategoryVideo;
  v9[2] = kCICategoryStillImage;
  v9[3] = kCICategoryInterlaced;
  v9[4] = kCICategoryNonSquarePixels;
  v9[5] = kCICategoryBuiltIn;
  v9[6] = kCICategoryApplePrivate;
  v11[0] = +[NSArray arrayWithObjects:v9 count:7];
  v11[1] = @"11";
  v10[1] = kCIAttributeFilterAvailable_iOS;
  v10[2] = kCIAttributeFilterAvailable_Mac;
  v11[2] = @"10.12";
  v10[3] = @"inputStrength";
  v7[0] = kCIAttributeMin;
  v7[1] = kCIAttributeSliderMin;
  v8[0] = &off_79A10;
  v8[1] = &off_79A10;
  v7[2] = kCIAttributeSliderMax;
  v7[3] = kCIAttributeDefault;
  v8[2] = &off_79A20;
  v8[3] = &off_79A30;
  v7[4] = kCIAttributeIdentity;
  v7[5] = kCIAttributeType;
  v8[4] = &off_79A30;
  v8[5] = kCIAttributeTypeScalar;
  v11[3] = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:6];
  v10[4] = @"inputBrighten";
  v5[0] = kCIAttributeMin;
  v5[1] = kCIAttributeSliderMin;
  v6[0] = &off_79A10;
  v6[1] = &off_79A10;
  v5[2] = kCIAttributeSliderMax;
  v5[3] = kCIAttributeDefault;
  v6[2] = &off_79AA0;
  v6[3] = &off_79A20;
  v5[4] = kCIAttributeIdentity;
  v5[5] = kCIAttributeType;
  v6[4] = &off_79A30;
  v6[5] = kCIAttributeTypeScalar;
  v11[4] = +[NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:6];
  v10[5] = @"inputContrast";
  v3[0] = kCIAttributeMin;
  v3[1] = kCIAttributeSliderMin;
  v4[0] = &off_79A30;
  v4[1] = &off_79A30;
  v3[2] = kCIAttributeSliderMax;
  v3[3] = kCIAttributeDefault;
  v4[2] = &off_79A80;
  v4[3] = &off_79A30;
  v3[4] = kCIAttributeIdentity;
  v3[5] = kCIAttributeType;
  v4[4] = &off_79A30;
  v4[5] = kCIAttributeTypeScalar;
  v11[5] = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:6];
  return +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:6];
}

- (id)_dualLightKernel
{
  if (qword_8CA80 != -1) {
    dispatch_once(&qword_8CA80, &stru_74D80);
  }
  return (id)qword_8CA78;
}

- (id)outputImage
{
  if (!self->inputImage) {
    return 0;
  }
  [(NSNumber *)self->inputHeight1 floatValue];
  float v4 = v3;
  [(NSNumber *)self->inputWidth1 floatValue];
  float v6 = v5;
  [(NSNumber *)self->inputStrength floatValue];
  float v50 = v7;
  [(NSNumber *)self->inputBrighten floatValue];
  float v51 = v8;
  if (fabsf(v4) < 1.0e-10)
  {
    [(CIVector *)self->inputCenter1 Y];
    double v10 = v9;
    [(CIVector *)self->inputBottom1 Y];
    *(float *)&double v11 = v10 - v11;
    float v4 = *(float *)&v11 * 0.85;
  }
  if (fabsf(v6) >= 1.0e-10) {
    float v12 = v6;
  }
  else {
    float v12 = v4 * 0.5;
  }
  [(CIVector *)self->inputCenter1 X];
  double v14 = v13;
  [(CIVector *)self->inputBottom1 X];
  *(float *)&double v14 = v14 - v15;
  [(CIVector *)self->inputCenter1 Y];
  double v17 = v16;
  [(CIVector *)self->inputBottom2 Y];
  *(float *)&double v18 = v17 - v18;
  double v19 = atan2f(-*(float *)&v18, *(float *)&v14) + 1.57079633;
  [(NSNumber *)self->inputRotate1 floatValue];
  float v21 = v19 + v20;
  float v49 = v21;
  double v22 = v21;
  __double2 v23 = __sincos_stret(v21);
  long double v24 = sin(v22 + v22);
  v25 = +[CIVector vectorWithX:v23.__cosval * v23.__cosval / ((v12 + v12) * v12) + v23.__sinval * v23.__sinval / ((v4 + v4) * v4) Y:(double)(v24 / (v4 * 4.0 * v4) - v24 / (v12 * 4.0 * v12)) Z:v23.__sinval * v23.__sinval / ((v12 + v12) * v12) + v23.__cosval * v23.__cosval / ((v4 + v4) * v4) W:(float)(v50 * v51)];
  inputCenter1 = self->inputCenter1;
  [(NSNumber *)self->inputHeight2 floatValue];
  float v28 = v27;
  [(NSNumber *)self->inputWidth2 floatValue];
  float v30 = v29;
  if (fabsf(v28) < 1.0e-10)
  {
    [(CIVector *)self->inputCenter2 Y];
    double v32 = v31;
    [(CIVector *)self->inputBottom2 Y];
    float v28 = v32 - v33;
  }
  if (fabsf(v30) >= 1.0e-10) {
    float v34 = v30;
  }
  else {
    float v34 = v28 * 0.5;
  }
  [(NSNumber *)self->inputRotate2 floatValue];
  double v36 = (float)(v35 + v49);
  __double2 v37 = __sincos_stret(v36);
  long double v38 = sin(v36 + v36);
  v39 = +[CIVector vectorWithX:v37.__cosval * v37.__cosval / ((v34 + v34) * v34) + v37.__sinval * v37.__sinval / ((v28 + v28) * v28) Y:(double)(v38 / (v28 * 4.0 * v28) - v38 / (v34 * 4.0 * v34)) Z:v37.__sinval * v37.__sinval / ((v34 + v34) * v34) + v37.__cosval * v37.__cosval / ((v28 + v28) * v28) W:v50];
  inputCenter2 = self->inputCenter2;
  [(NSNumber *)self->inputContrast floatValue];
  v42 = +[CIVector vectorWithX:v50 Y:v41 Z:v51];
  id v43 = [(CIPortraitLightingFront *)self _dualLightKernel];
  [(CIImage *)self->inputImage extent];
  v52[0] = self->inputImage;
  v52[1] = inputCenter1;
  v52[2] = v25;
  v52[3] = inputCenter2;
  v52[4] = v39;
  v52[5] = v42;
  return objc_msgSend(v43, "applyWithExtent:arguments:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v52, 6), v44, v45, v46, v47);
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

- (CIVector)inputBottom1
{
  return self->inputBottom1;
}

- (void)setInputBottom1:(id)a3
{
}

- (CIVector)inputBottom2
{
  return self->inputBottom2;
}

- (void)setInputBottom2:(id)a3
{
}

- (NSNumber)inputWidth1
{
  return self->inputWidth1;
}

- (void)setInputWidth1:(id)a3
{
}

- (NSNumber)inputWidth2
{
  return self->inputWidth2;
}

- (void)setInputWidth2:(id)a3
{
}

- (NSNumber)inputHeight1
{
  return self->inputHeight1;
}

- (void)setInputHeight1:(id)a3
{
}

- (NSNumber)inputHeight2
{
  return self->inputHeight2;
}

- (void)setInputHeight2:(id)a3
{
}

- (NSNumber)inputRotate1
{
  return self->inputRotate1;
}

- (void)setInputRotate1:(id)a3
{
}

- (NSNumber)inputRotate2
{
  return self->inputRotate2;
}

- (void)setInputRotate2:(id)a3
{
}

- (NSNumber)inputStrength
{
  return self->inputStrength;
}

- (void)setInputStrength:(id)a3
{
}

- (NSNumber)inputBrighten
{
  return self->inputBrighten;
}

- (void)setInputBrighten:(id)a3
{
}

- (NSNumber)inputContrast
{
  return self->inputContrast;
}

- (void)setInputContrast:(id)a3
{
}

@end