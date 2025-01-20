@interface CIPortraitLightingEdge
+ (id)customAttributes;
- (CIImage)inputImage;
- (CIVector)inputCenter;
- (NSNumber)inputHeight;
- (NSNumber)inputRotate;
- (NSNumber)inputStrength;
- (NSNumber)inputWidth;
- (id)_darken;
- (id)_faceContourMask;
- (id)outputImage;
- (void)setInputCenter:(id)a3;
- (void)setInputHeight:(id)a3;
- (void)setInputImage:(id)a3;
- (void)setInputRotate:(id)a3;
- (void)setInputStrength:(id)a3;
- (void)setInputWidth:(id)a3;
@end

@implementation CIPortraitLightingEdge

+ (id)customAttributes
{
  v6[0] = kCIAttributeFilterCategories;
  v5[0] = kCICategoryColorAdjustment;
  v5[1] = kCICategoryVideo;
  v5[2] = kCICategoryStillImage;
  v5[3] = kCICategoryInterlaced;
  v5[4] = kCICategoryNonSquarePixels;
  v5[5] = kCICategoryBuiltIn;
  v5[6] = kCICategoryApplePrivate;
  v7[0] = +[NSArray arrayWithObjects:v5 count:7];
  v7[1] = @"11";
  v6[1] = kCIAttributeFilterAvailable_iOS;
  v6[2] = kCIAttributeFilterAvailable_Mac;
  v7[2] = @"10.12";
  v6[3] = @"inputStrength";
  v3[0] = kCIAttributeMin;
  v3[1] = kCIAttributeSliderMin;
  v4[0] = &off_79A10;
  v4[1] = &off_79A10;
  v3[2] = kCIAttributeSliderMax;
  v3[3] = kCIAttributeDefault;
  v3[4] = kCIAttributeIdentity;
  v3[5] = kCIAttributeType;
  v4[2] = &off_79A20;
  v4[3] = &off_79A30;
  v4[4] = &off_79A30;
  v4[5] = kCIAttributeTypeScalar;
  v7[3] = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:6];
  return +[NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:4];
}

- (id)_faceContourMask
{
  if (qword_8CB50 != -1) {
    dispatch_once(&qword_8CB50, &stru_74F20);
  }
  return (id)qword_8CB48;
}

- (id)_darken
{
  if (qword_8CB60 != -1) {
    dispatch_once(&qword_8CB60, &stru_74F40);
  }
  return (id)qword_8CB58;
}

- (id)outputImage
{
  if (!self->inputImage) {
    return 0;
  }
  [(NSNumber *)self->inputHeight floatValue];
  float v4 = v3;
  [(NSNumber *)self->inputWidth floatValue];
  float v6 = v5;
  [(NSNumber *)self->inputStrength floatValue];
  float v52 = v7;
  if (fabsf(v4) < 1.0e-10)
  {
    [(CIVector *)self->inputCenter Y];
    double v9 = v8;
    [(CIVector *)self->inputCenter W];
    *(float *)&double v10 = v9 - v10;
    float v4 = *(float *)&v10 * 0.85;
  }
  if (fabsf(v6) >= 1.0e-10) {
    float v11 = v6;
  }
  else {
    float v11 = v4 * 0.5;
  }
  [(CIVector *)self->inputCenter X];
  double v13 = v12;
  [(CIVector *)self->inputCenter Z];
  *(float *)&double v13 = v13 - v14;
  [(CIVector *)self->inputCenter Y];
  double v16 = v15;
  [(CIVector *)self->inputCenter W];
  *(float *)&double v17 = v16 - v17;
  double v18 = atan2f(-*(float *)&v17, *(float *)&v13) + 1.57079633;
  [(NSNumber *)self->inputRotate floatValue];
  float v20 = v18 + v19;
  double v21 = v20;
  __double2 v22 = __sincos_stret(v20);
  double v23 = v11;
  double v24 = sin(v21 + v21);
  v25 = +[CIVector vectorWithX:v22.__cosval * v22.__cosval / ((v23 + v23) * v23) + v22.__sinval * v22.__sinval / ((v4 + v4) * v4) Y:v24 / (v4 * 4.0 * v4) - v24 / (v23 * 4.0 * v23) Z:v22.__sinval * v22.__sinval / ((v23 + v23) * v23) + v22.__cosval * v22.__cosval / ((v4 + v4) * v4) W:1.0];
  inputCenter = self->inputCenter;
  float v27 = v4 * 1.3;
  float v28 = v23 * 1.4;
  v29 = +[CIVector vectorWithX:v22.__cosval * v22.__cosval / ((v28 + v28) * v28) + v22.__sinval * v22.__sinval / ((v27 + v27) * v27) Y:v24 / (v27 * 4.0 * v27) - v24 / (v28 * 4.0 * v28) Z:v22.__sinval * v22.__sinval / ((v28 + v28) * v28) + v22.__cosval * v22.__cosval / ((v27 + v27) * v27) W:v52];
  id v30 = [(CIPortraitLightingEdge *)self _faceContourMask];
  [(CIImage *)self->inputImage extent];
  v58[0] = self->inputImage;
  v58[1] = inputCenter;
  v58[2] = v25;
  v58[3] = v29;
  id v35 = objc_msgSend(v30, "applyWithExtent:arguments:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v58, 4), v31, v32, v33, v34);
  id v36 = [(CIPortraitLightingEdge *)self _darken];
  inputImage = self->inputImage;
  CFStringRef v56 = @"inputStrength";
  [(NSNumber *)self->inputStrength floatValue];
  v57 = +[NSNumber numberWithDouble:v38 * -0.25];
  v39 = [(CIImage *)inputImage imageByApplyingFilter:@"CIHighKey" withInputParameters:+[NSDictionary dictionaryWithObjects:&v57 forKeys:&v56 count:1]];
  [(CIImage *)self->inputImage extent];
  double v41 = v40;
  double v43 = v42;
  double v45 = v44;
  double v47 = v46;
  v55[0] = v39;
  [(NSNumber *)self->inputStrength floatValue];
  v55[1] = +[NSNumber numberWithDouble:v48 * 0.3];
  id v49 = objc_msgSend(v36, "applyWithExtent:arguments:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v55, 2), v41, v43, v45, v47);
  v50 = self->inputImage;
  v53[0] = @"inputBackgroundImage";
  v53[1] = @"inputMaskImage";
  v54[0] = v50;
  v54[1] = v35;
  return objc_msgSend(v49, "imageByApplyingFilter:withInputParameters:", @"CIBlendWithMask", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v54, v53, 2));
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
}

- (CIVector)inputCenter
{
  return self->inputCenter;
}

- (void)setInputCenter:(id)a3
{
}

- (NSNumber)inputWidth
{
  return self->inputWidth;
}

- (void)setInputWidth:(id)a3
{
}

- (NSNumber)inputHeight
{
  return self->inputHeight;
}

- (void)setInputHeight:(id)a3
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

@end