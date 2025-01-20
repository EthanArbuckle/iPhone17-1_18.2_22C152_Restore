@interface CIPortraitLightingNeckContour
+ (id)customAttributes;
- (CIImage)inputImage;
- (CIVector)inputCenter;
- (CIVector)inputChin;
- (NSNumber)inputFaceOrientation;
- (NSNumber)inputHeight;
- (NSNumber)inputOrientation;
- (NSNumber)inputScale;
- (NSNumber)inputStrength;
- (NSNumber)inputWidth;
- (id)_neckContourKernel;
- (id)outputImage;
- (void)setInputCenter:(id)a3;
- (void)setInputChin:(id)a3;
- (void)setInputFaceOrientation:(id)a3;
- (void)setInputHeight:(id)a3;
- (void)setInputImage:(id)a3;
- (void)setInputOrientation:(id)a3;
- (void)setInputScale:(id)a3;
- (void)setInputStrength:(id)a3;
- (void)setInputWidth:(id)a3;
@end

@implementation CIPortraitLightingNeckContour

+ (id)customAttributes
{
  v12[0] = kCIAttributeFilterCategories;
  v11[0] = kCICategoryColorAdjustment;
  v11[1] = kCICategoryVideo;
  v11[2] = kCICategoryStillImage;
  v11[3] = kCICategoryInterlaced;
  v11[4] = kCICategoryNonSquarePixels;
  v11[5] = kCICategoryBuiltIn;
  v11[6] = kCICategoryApplePrivate;
  v13[0] = +[NSArray arrayWithObjects:v11 count:7];
  v13[1] = @"11";
  v12[1] = kCIAttributeFilterAvailable_iOS;
  v12[2] = kCIAttributeFilterAvailable_Mac;
  v13[2] = @"10.12";
  v12[3] = @"inputStrength";
  v9[0] = kCIAttributeMin;
  v9[1] = kCIAttributeSliderMin;
  v10[0] = &off_79A30;
  v10[1] = &off_79A30;
  v9[2] = kCIAttributeSliderMax;
  v9[3] = kCIAttributeDefault;
  v10[2] = &off_79A80;
  v10[3] = &off_79A30;
  v9[4] = kCIAttributeIdentity;
  v9[5] = kCIAttributeType;
  v10[4] = &off_79A30;
  v10[5] = kCIAttributeTypeScalar;
  v13[3] = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:6];
  v12[4] = @"inputScale";
  v7[0] = kCIAttributeMin;
  v7[1] = kCIAttributeSliderMin;
  v8[0] = &off_79A30;
  v8[1] = &off_79A30;
  v7[2] = kCIAttributeSliderMax;
  v7[3] = kCIAttributeDefault;
  v8[2] = &off_79A20;
  v8[3] = &off_79A80;
  v7[4] = kCIAttributeIdentity;
  v7[5] = kCIAttributeType;
  v8[4] = &off_79A80;
  v8[5] = kCIAttributeTypeScalar;
  v13[4] = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:6];
  v12[5] = @"inputFaceOrientation";
  v5[0] = kCIAttributeMin;
  v5[1] = kCIAttributeSliderMin;
  v6[0] = &off_79AD0;
  v6[1] = &off_79AD0;
  v5[2] = kCIAttributeSliderMax;
  v5[3] = kCIAttributeDefault;
  v6[2] = &off_79AA0;
  v6[3] = &off_79A30;
  v5[4] = kCIAttributeIdentity;
  v5[5] = kCIAttributeType;
  v6[4] = &off_79A30;
  v6[5] = kCIAttributeTypeScalar;
  v13[5] = +[NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:6];
  v12[6] = @"inputOrientation";
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
  v13[6] = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:6];
  return +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:7];
}

- (id)_neckContourKernel
{
  if (qword_8CAD0 != -1) {
    dispatch_once(&qword_8CAD0, &stru_74E20);
  }
  return (id)qword_8CAC8;
}

- (id)outputImage
{
  if (!self->inputImage) {
    return 0;
  }
  [(NSNumber *)self->inputWidth floatValue];
  float v4 = v3 * 0.18;
  [(NSNumber *)self->inputHeight floatValue];
  float v6 = v5 * 0.25;
  [(CIVector *)self->inputCenter X];
  double v8 = v7;
  [(CIVector *)self->inputChin X];
  *(float *)&double v8 = v8 - v9;
  [(CIVector *)self->inputCenter Y];
  double v11 = v10;
  [(CIVector *)self->inputChin Y];
  float v13 = v11 - v12;
  LODWORD(v8) = atan2f(*(float *)&v8, v13);
  [(NSNumber *)self->inputFaceOrientation floatValue];
  float v15 = v14 / 3.14159265;
  float v71 = v15;
  unsigned int v16 = [(NSNumber *)self->inputOrientation intValue];
  double v17 = *(float *)&v8;
  __double2 v18 = __sincos_stret(v17);
  double v19 = v4;
  double v20 = (v19 + v19) * v19;
  double v21 = v6;
  double v22 = (v21 + v21) * v21;
  float v23 = v18.__cosval * v18.__cosval / v20 + v18.__sinval * v18.__sinval / v22;
  long double v24 = sin(v17 + v17);
  float v25 = v24 / (v21 * 4.0 * v21) - v24 / (v19 * 4.0 * v19);
  float v26 = v18.__sinval * v18.__sinval / v20 + v18.__cosval * v18.__cosval / v22;
  v27 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v23, v25, v26);
  float v28 = v19 * 1.1;
  [(CIVector *)self->inputChin X];
  double v30 = v29;
  [(CIVector *)self->inputCenter X];
  *(float *)&double v30 = v30 - v31;
  [(CIVector *)self->inputCenter Y];
  double v33 = v32;
  [(CIVector *)self->inputChin Y];
  float v35 = v33 - v34;
  double v36 = atan2f(*(float *)&v30, v35);
  __double2 v37 = __sincos_stret(v36);
  double v38 = v28;
  double v39 = (v38 + v38) * v38;
  *(float *)&double v22 = v21 * 0.9;
  double v40 = *(float *)&v22;
  double v41 = (v40 + v40) * v40;
  *(float *)&double v17 = v37.__cosval * v37.__cosval / v39 + v37.__sinval * v37.__sinval / v41;
  long double v42 = sin(v36 + v36);
  float v43 = v42 / (v40 * 4.0 * v40) - v42 / (v38 * 4.0 * v38);
  float v44 = v37.__sinval * v37.__sinval / v39 + v37.__cosval * v37.__cosval / v41;
  v45 = +[CIVector vectorWithX:*(float *)&v17 Y:v43 Z:v44 W:0.7];
  [(CIVector *)self->inputCenter X];
  double v47 = v46;
  [(CIVector *)self->inputChin X];
  float v49 = (v47 + v48) * 0.5;
  [(CIVector *)self->inputCenter Y];
  double v51 = v50;
  [(CIVector *)self->inputChin Y];
  float v53 = (v51 + v52) * 0.5;
  [(CIVector *)self->inputCenter X];
  float v55 = v54;
  [(CIVector *)self->inputCenter Y];
  float v57 = v56;
  double v58 = v71 * -0.15;
  [(NSNumber *)self->inputWidth floatValue];
  double v60 = v59;
  [(NSNumber *)self->inputWidth floatValue];
  double v62 = v61;
  double v63 = -v58;
  if (v16 - 5 > 3)
  {
    float v49 = v49 + v58 * v60;
    float v55 = v55 + v63 * v62;
  }
  else
  {
    float v53 = v53 + v58 * v60;
    float v57 = v57 + v63 * v62;
  }
  v65 = +[CIVector vectorWithX:v55 Y:v57 Z:v49 W:v53];
  id v66 = [(CIPortraitLightingNeckContour *)self _neckContourKernel];
  [(CIImage *)self->inputImage extent];
  v72[0] = self->inputImage;
  v72[1] = v65;
  v72[2] = v27;
  v72[3] = v45;
  v72[4] = self->inputStrength;
  return objc_msgSend(v66, "applyWithExtent:arguments:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v72, 5), v67, v68, v69, v70);
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

- (CIVector)inputChin
{
  return self->inputChin;
}

- (void)setInputChin:(id)a3
{
}

- (NSNumber)inputHeight
{
  return self->inputHeight;
}

- (void)setInputHeight:(id)a3
{
}

- (NSNumber)inputWidth
{
  return self->inputWidth;
}

- (void)setInputWidth:(id)a3
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

- (NSNumber)inputFaceOrientation
{
  return self->inputFaceOrientation;
}

- (void)setInputFaceOrientation:(id)a3
{
}

- (NSNumber)inputScale
{
  return self->inputScale;
}

- (void)setInputScale:(id)a3
{
}

@end