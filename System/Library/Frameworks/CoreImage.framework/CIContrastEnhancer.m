@interface CIContrastEnhancer
+ (id)customAttributes;
- (NSNumber)inputIntensity;
- (NSNumber)inputLocal;
- (NSNumber)inputPerceptual;
- (NSNumber)inputScale;
- (id)outputImage;
- (void)setInputIntensity:(id)a3;
- (void)setInputLocal:(id)a3;
- (void)setInputPerceptual:(id)a3;
- (void)setInputScale:(id)a3;
@end

@implementation CIContrastEnhancer

+ (id)customAttributes
{
  v13[7] = *MEMORY[0x1E4F143B8];
  v12[0] = @"CIAttributeFilterCategories";
  v11[0] = @"CICategoryColorEffect";
  v11[1] = @"CICategoryNonSquarePixels";
  v11[2] = @"CICategoryStillImage";
  v11[3] = @"CICategoryBuiltIn";
  v11[4] = @"CICategoryApplePrivate";
  v13[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:5];
  v13[1] = @"12";
  v12[1] = @"CIAttributeFilterAvailable_iOS";
  v12[2] = @"CIAttributeFilterAvailable_Mac";
  v13[2] = @"10.14";
  v12[3] = @"inputIntensity";
  v9[0] = @"CIAttributeMin";
  v9[1] = @"CIAttributeMax";
  v10[0] = &unk_1EE4A85D0;
  v10[1] = &unk_1EE4A8600;
  v9[2] = @"CIAttributeSliderMin";
  v9[3] = @"CIAttributeSliderMax";
  v10[2] = &unk_1EE4A85D0;
  v10[3] = &unk_1EE4A8600;
  v9[4] = @"CIAttributeDefault";
  v9[5] = @"CIAttributeType";
  v10[4] = &unk_1EE4A8620;
  v10[5] = @"CIAttributeTypeScalar";
  v13[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:6];
  v12[4] = @"inputScale";
  v7[0] = @"CIAttributeMin";
  v7[1] = @"CIAttributeMax";
  v8[0] = &unk_1EE4A85D0;
  v8[1] = &unk_1EE4A8600;
  v7[2] = @"CIAttributeSliderMin";
  v7[3] = @"CIAttributeSliderMax";
  v8[2] = &unk_1EE4A85D0;
  v8[3] = &unk_1EE4A8600;
  v7[4] = @"CIAttributeDefault";
  v7[5] = @"CIAttributeType";
  v8[4] = &unk_1EE4A8630;
  v8[5] = @"CIAttributeTypeScalar";
  v13[4] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:6];
  v12[5] = @"inputLocal";
  v5[0] = @"CIAttributeDefault";
  v5[1] = @"CIAttributeType";
  v6[0] = MEMORY[0x1E4F1CC28];
  v6[1] = @"CIAttributeTypeBoolean";
  v13[5] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:2];
  v12[6] = @"inputPerceptual";
  v3[0] = @"CIAttributeDefault";
  v3[1] = @"CIAttributeType";
  v4[0] = MEMORY[0x1E4F1CC38];
  v4[1] = @"CIAttributeTypeBoolean";
  v13[6] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:2];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:7];
}

- (id)outputImage
{
  uint64_t v108 = *MEMORY[0x1E4F143B8];
  [(CIImage *)self->inputImage extent];
  if (CGRectIsInfinite(v109)) {
    return self->inputImage;
  }
  [(CIImage *)self->inputImage extent];
  if (CGRectIsEmpty(v110)) {
    return self->inputImage;
  }
  [(NSNumber *)self->inputIntensity floatValue];
  if (v3 <= 0.0) {
    return self->inputImage;
  }
  [(NSNumber *)self->inputIntensity floatValue];
  float v5 = v4;
  [(CIImage *)self->inputImage extent];
  double v7 = v6;
  [(CIImage *)self->inputImage extent];
  float v9 = v7 / v8;
  [(CIImage *)self->inputImage extent];
  double v11 = v10;
  [(CIImage *)self->inputImage extent];
  double v13 = v12;
  [(CIImage *)self->inputImage extent];
  if (v11 >= v13) {
    double v16 = v15;
  }
  else {
    double v16 = v14;
  }
  double v17 = 128.0;
  if (v16 <= 128.0)
  {
    [(CIImage *)self->inputImage extent];
    double v19 = v18;
    [(CIImage *)self->inputImage extent];
    double v21 = v20;
    [(CIImage *)self->inputImage extent];
    if (v19 < v21) {
      double v17 = v22;
    }
    else {
      double v17 = v23;
    }
  }
  double v24 = (double)(int)v17;
  double v25 = roundf(v9 * (float)(int)v17);
  [(NSNumber *)self->inputScale floatValue];
  float v27 = v26;
  BOOL v28 = [(NSNumber *)self->inputLocal BOOLValue];
  double v29 = v27;
  BOOL v97 = v28;
  if (!v28) {
    double v29 = 0.699999988;
  }
  double v30 = fmin(v29, 1.0);
  if (v24 <= v25) {
    long double v31 = v25;
  }
  else {
    long double v31 = v24;
  }
  float v32 = v30 * log2(v31);
  float v33 = roundf(v32);
  if (v33 <= 0.0) {
    float v33 = 0.0;
  }
  int v34 = (int)v33;
  [(CIImage *)self->inputImage extent];
  memset(&v99, 0, sizeof(v99));
  CGAffineTransformMakeScale(&v99, v24 / v35, v25 / v36);
  inputImage = self->inputImage;
  CGAffineTransform v98 = v99;
  v38 = [(CIImage *)inputImage imageByApplyingTransform:&v98];
  v39 = +[CIKernel kernelWithInternalRepresentation:&CI::_CEcomp_minmax];
  [(CIImage *)v38 extent];
  v106 = v38;
  v44 = -[CIColorKernel applyWithExtent:arguments:](v39, "applyWithExtent:arguments:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v106 count:1], v40, v41, v42, v43);
  [(CIImage *)v44 extent];
  double v46 = v45;
  double v48 = v47;
  CGAffineTransformMakeTranslation(&v107, -v49, -v50);
  v51 = -[CIImage imageByCroppingToRect:]([(CIImage *)v44 imageByApplyingTransform:&v107], "imageByCroppingToRect:", 0.0, 0.0, v46, v48);
  if ([(NSNumber *)self->inputPerceptual BOOLValue]) {
    v51 = [(CIImage *)v51 imageByApplyingFilter:@"CILinearToSRGBToneCurve"];
  }
  v52 = +[CIKernel kernelWithInternalRepresentation:&CI::_CEcomp_minmax];
  [(CIImage *)v51 extent];
  v105 = v51;
  v57 = -[CIColorKernel applyWithExtent:arguments:](v52, "applyWithExtent:arguments:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v105 count:1], v53, v54, v55, v56);
  v58 = +[CIKernel kernelWithInternalRepresentation:&CI::_DEminmax4];
  if (v34 >= 1)
  {
    v59 = v58;
    unsigned int v60 = v34 + 1;
    do
    {
      [(CIImage *)v57 extent];
      double v62 = v61;
      double v64 = v63;
      double v66 = ceil(v65 * 0.5);
      double v68 = ceil(v67 * 0.5);
      *(void *)&v107.a = v57;
      [(CIImage *)v57 extent];
      double v70 = v69;
      [(CIImage *)v57 extent];
      *(void *)&v107.b = +[CIVector vectorWithX:v70 Y:v71];
      v57 = -[CIKernel applyWithExtent:roiCallback:arguments:](v59, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_225, [MEMORY[0x1E4F1C978] arrayWithObjects:&v107 count:2], v62, v64, v66, v68);
      --v60;
    }
    while (v60 > 1);
  }
  if (v97)
  {
    [(CIImage *)self->inputImage extent];
    double v73 = v72;
    [(CIImage *)v57 extent];
    double v75 = v73 / v74;
    [(CIImage *)self->inputImage extent];
    double v77 = v76;
    [(CIImage *)v57 extent];
    v79 = +[CIVector vectorWithX:v75 Y:v77 / v78];
    v80 = [(CIImage *)v57 imageByClampingToExtent];
    v103 = @"inputScale";
    v104 = v79;
    uint64_t v81 = -[CIImage imageByApplyingFilter:withInputParameters:](v80, "imageByApplyingFilter:withInputParameters:", @"CISoftCubicUpsample", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v104 forKeys:&v103 count:1]);
  }
  else
  {
    [(CIImage *)v57 extent];
    v83 = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:");
    v101 = @"inputExtent";
    v102 = v83;
    uint64_t v81 = -[CIImage imageByClampingToExtent](-[CIImage imageByApplyingFilter:withInputParameters:](v57, "imageByApplyingFilter:withInputParameters:", @"CIAreaAverage", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v102 forKeys:&v101 count:1]), "imageByClampingToExtent");
  }
  uint64_t v84 = v81;
  float v85 = v5 + v5;
  v86 = [(CIImage *)self->inputImage imageByUnpremultiplyingAlpha];
  if ([(NSNumber *)self->inputPerceptual BOOLValue]) {
    v86 = [(CIImage *)v86 imageByApplyingFilter:@"CILinearToSRGBToneCurve"];
  }
  v87 = +[CIKernel kernelWithInternalRepresentation:&CI::_CEstretch];
  [(CIImage *)v86 extent];
  double v89 = v88;
  double v91 = v90;
  double v93 = v92;
  double v95 = v94;
  v100[0] = v86;
  v100[1] = v84;
  *(float *)&double v88 = v85;
  v100[2] = [NSNumber numberWithFloat:v88];
  v96 = -[CIColorKernel applyWithExtent:arguments:](v87, "applyWithExtent:arguments:", [MEMORY[0x1E4F1C978] arrayWithObjects:v100 count:3], v89, v91, v93, v95);
  if ([(NSNumber *)self->inputPerceptual BOOLValue]) {
    v96 = [(CIImage *)v96 imageByApplyingFilter:@"CISRGBToneCurveToLinear"];
  }
  return [(CIImage *)v96 imageByPremultiplyingAlpha];
}

- (NSNumber)inputIntensity
{
  return self->inputIntensity;
}

- (void)setInputIntensity:(id)a3
{
}

- (NSNumber)inputLocal
{
  return self->inputLocal;
}

- (void)setInputLocal:(id)a3
{
}

- (NSNumber)inputScale
{
  return self->inputScale;
}

- (void)setInputScale:(id)a3
{
}

- (NSNumber)inputPerceptual
{
  return self->inputPerceptual;
}

- (void)setInputPerceptual:(id)a3
{
}

@end