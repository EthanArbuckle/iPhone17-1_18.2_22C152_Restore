@interface CIPortraitLightingContourV2
+ (id)customAttributes;
- (NSNumber)inputBlur;
- (id)_cheapEdgePreserve;
- (id)_contourLightKernel;
- (id)_extractRed;
- (id)outputImage;
- (void)setInputBlur:(id)a3;
@end

@implementation CIPortraitLightingContourV2

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
  v6[3] = @"inputBlur";
  v3[0] = kCIAttributeMin;
  v3[1] = kCIAttributeSliderMax;
  v4[0] = &off_79A30;
  v4[1] = &off_79A20;
  v3[2] = kCIAttributeDefault;
  v3[3] = kCIAttributeIdentity;
  v4[2] = &off_79AE0;
  v4[3] = &off_79A30;
  v3[4] = kCIAttributeType;
  v4[4] = kCIAttributeTypeScalar;
  v7[3] = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:5];
  return +[NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:4];
}

- (id)_extractRed
{
  if (qword_8CB20 != -1) {
    dispatch_once(&qword_8CB20, &stru_74EC0);
  }
  return (id)qword_8CB18;
}

- (id)_contourLightKernel
{
  if (qword_8CB30 != -1) {
    dispatch_once(&qword_8CB30, &stru_74EE0);
  }
  return (id)qword_8CB28;
}

- (id)_cheapEdgePreserve
{
  if (qword_8CB40 != -1) {
    dispatch_once(&qword_8CB40, &stru_74F00);
  }
  return (id)qword_8CB38;
}

- (id)outputImage
{
  if (!self->super.inputImage) {
    return 0;
  }
  [(NSNumber *)self->super.inputWidth floatValue];
  float v4 = v3;
  [(NSNumber *)self->super.inputStrength floatValue];
  float v57 = v5;
  [(NSNumber *)self->super.inputHeight floatValue];
  float v7 = v6;
  [(NSNumber *)self->super.inputRotate floatValue];
  double v9 = v8;
  __double2 v10 = __sincos_stret(v8);
  long double v11 = sin(v9 + v9);
  v12 = +[CIVector vectorWithX:v10.__cosval * v10.__cosval / ((v4 + v4) * v4) + v10.__sinval * v10.__sinval / ((v7 + v7) * v7) Y:(double)(v11 / (v7 * 4.0 * v7) - v11 / (v4 * 4.0 * v4)) Z:v10.__sinval * v10.__sinval / ((v4 + v4) * v4) + v10.__cosval * v10.__cosval / ((v7 + v7) * v7) W:v57];
  id v13 = [(CIPortraitLightingContourV2 *)self _extractRed];
  inputImage = self->super.inputImage;
  id v14 = objc_msgSend(v13, "applyWithExtent:arguments:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &inputImage, 1), CGRectInfinite.origin.x, CGRectInfinite.origin.y, CGRectInfinite.size.width, CGRectInfinite.size.height);
  [(CIImage *)self->super.inputImage extent];
  id v15 = objc_msgSend(v14, "imageByCroppingToRect:");
  [(CIImage *)self->super.inputImage extent];
  id v16 = objc_msgSend(v15, "imageByClampingToRect:");
  [(NSNumber *)self->super.inputScale floatValue];
  float v18 = v17;
  [(NSNumber *)self->inputBlur floatValue];
  id v20 = [v16 imageByApplyingGaussianBlurWithSigma:(float)(v18 * v19)];
  [(CIImage *)self->super.inputImage extent];
  id v21 = objc_msgSend(v20, "imageByCroppingToRect:");
  id v22 = [(CIPortraitLightingContourV2 *)self _cheapEdgePreserve];
  [(CIImage *)self->super.inputImage extent];
  v59[0] = v15;
  v59[1] = v21;
  id v27 = objc_msgSend(v22, "applyWithExtent:arguments:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v59, 2), v23, v24, v25, v26);
  id v28 = [(CIPortraitLightingContourV2 *)self _contourLightKernel];
  [(CIVector *)self->super.inputEyes X];
  double v30 = v29;
  [(CIVector *)self->super.inputEyes Z];
  double v32 = v30 - v31;
  [(CIVector *)self->super.inputEyes X];
  double v34 = v33;
  [(CIVector *)self->super.inputEyes Z];
  double v36 = v34 - v35;
  [(CIVector *)self->super.inputEyes Y];
  double v38 = v37;
  [(CIVector *)self->super.inputEyes W];
  double v40 = v38 - v39;
  [(CIVector *)self->super.inputEyes Y];
  double v42 = v41;
  [(CIVector *)self->super.inputEyes W];
  *(float *)&double v43 = v40 * (v42 - v43) + v32 * v36;
  float v44 = sqrtf(*(float *)&v43) * 0.35;
  [(CIImage *)self->super.inputImage extent];
  double v46 = v45;
  double v48 = v47;
  double v50 = v49;
  double v52 = v51;
  inputCenter = self->super.inputCenter;
  v58[0] = self->super.inputImage;
  v58[1] = v27;
  inputEyes = self->super.inputEyes;
  inputStrength = self->super.inputStrength;
  v58[2] = inputCenter;
  v58[3] = v12;
  v58[4] = inputEyes;
  v58[5] = inputStrength;
  *(float *)&double v45 = v44 * v44;
  v58[6] = +[NSNumber numberWithFloat:v45];
  return objc_msgSend(v28, "applyWithExtent:arguments:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v58, 7), v46, v48, v50, v52);
}

- (NSNumber)inputBlur
{
  return self->inputBlur;
}

- (void)setInputBlur:(id)a3
{
}

@end