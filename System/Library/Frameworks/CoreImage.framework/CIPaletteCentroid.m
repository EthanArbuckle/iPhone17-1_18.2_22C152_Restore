@interface CIPaletteCentroid
+ (id)customAttributes;
- (CIImage)inputImage;
- (CIImage)inputPaletteImage;
- (NSNumber)inputPerceptual;
- (id)_kernelClusterMask;
- (id)outputImage;
- (void)outputImage;
- (void)setInputImage:(id)a3;
- (void)setInputPaletteImage:(id)a3;
- (void)setInputPerceptual:(id)a3;
@end

@implementation CIPaletteCentroid

+ (id)customAttributes
{
  v7[4] = *MEMORY[0x1E4F143B8];
  v6[0] = @"CIAttributeFilterCategories";
  v5[0] = @"CICategoryColorEffect";
  v5[1] = @"CICategoryVideo";
  v5[2] = @"CICategoryStillImage";
  v5[3] = @"CICategoryBuiltIn";
  v7[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:4];
  v7[1] = @"13";
  v6[1] = @"CIAttributeFilterAvailable_iOS";
  v6[2] = @"CIAttributeFilterAvailable_Mac";
  v7[2] = @"10.15";
  v6[3] = @"inputPerceptual";
  v3[0] = @"CIAttributeMin";
  v3[1] = @"CIAttributeMax";
  v4[0] = MEMORY[0x1E4F1CC28];
  v4[1] = MEMORY[0x1E4F1CC38];
  v3[2] = @"CIAttributeDefault";
  v3[3] = @"CIAttributeType";
  v4[2] = MEMORY[0x1E4F1CC28];
  v4[3] = @"CIAttributeTypeBoolean";
  v7[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:4];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:4];
}

- (id)_kernelClusterMask
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_PC_coord];
}

- (id)outputImage
{
  v48[4] = *MEMORY[0x1E4F143B8];
  if (!self->inputImage
    || (p_inputPaletteImage = &self->inputPaletteImage, (inputPaletteImage = self->inputPaletteImage) == 0))
  {
    return +[CIImage emptyImage];
  }
  [(CIImage *)inputPaletteImage extent];
  if (CGRectIsInfinite(v50) || ([(CIImage *)*p_inputPaletteImage extent], v5 > 1.0))
  {
    v6 = ci_logger_api();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      [(CIPaletteCentroid *)(id *)p_inputPaletteImage outputImage];
    }
    return +[CIImage emptyImage];
  }
  [(CIImage *)*p_inputPaletteImage extent];
  unint64_t v9 = (unint64_t)v8;
  inputImage = self->inputImage;
  inputPerceptual = self->inputPerceptual;
  if (inputPerceptual) {
    BOOL v12 = [(NSNumber *)inputPerceptual BOOLValue];
  }
  else {
    BOOL v12 = 0;
  }
  [(CIImage *)self->inputImage extent];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  id v21 = [(CIPaletteCentroid *)self _kernelClusterMask];
  v22 = *p_inputPaletteImage;
  [(CIImage *)*p_inputPaletteImage extent];
  CGFloat v24 = -v23;
  [(CIImage *)*p_inputPaletteImage extent];
  CGAffineTransformMakeTranslation(&v45, v24, -v25);
  v26 = [(CIImage *)v22 imageByApplyingTransform:&v45];
  if (v12)
  {
    inputImage = [(CIImage *)inputImage imageByApplyingFilter:@"CILinearToSRGBToneCurve"];
    v26 = [(CIImage *)v26 imageByApplyingFilter:@"CILinearToSRGBToneCurve"];
  }
  uint64_t v27 = [(CIImage *)inputImage imageByUnpremultiplyingAlpha];
  v28 = +[CIImage emptyImage];
  if (v9)
  {
    uint64_t v29 = 0;
    uint64_t v43 = MEMORY[0x1E4F143A8];
    v42 = __32__CIPaletteCentroid_outputImage__block_invoke;
    v30 = (double *)MEMORY[0x1E4F1DB10];
    uint64_t v41 = 3221225472;
    do
    {
      double v31 = v18;
      double v32 = v16;
      double v33 = v14;
      double v34 = *v30;
      double v35 = v30[1];
      double v36 = v30[2];
      double v37 = v30[3];
      v48[0] = v27;
      v48[1] = v26;
      v48[2] = objc_msgSend(NSNumber, "numberWithUnsignedLong:", v9, v41, v42, v43, v43, v41, v42, &__block_descriptor_40_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l, v9);
      v48[3] = [NSNumber numberWithInt:v29];
      uint64_t v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:4];
      double v39 = v35;
      double v14 = v33;
      double v16 = v32;
      double v18 = v31;
      v40 = objc_msgSend(v21, "applyWithExtent:roiCallback:arguments:", &v44, v38, v34, v39, v36, v37);
      v46 = @"inputExtent";
      v47 = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:", v14, v16, v31, v20);
      v28 = (CIImage *)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v40, "imageByApplyingFilter:withInputParameters:", @"CIAreaRedCentroid", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1)), "imageByClampingToExtent"), "imageByCroppingToRect:", (double)(int)v29++, 0.0, 1.0, 1.0), "imageByCompositingOverImage:",
                         v28);
    }
    while (v9 != v29);
  }
  return [(CIImage *)v28 imageBySettingProperties:MEMORY[0x1E4F1CC08]];
}

double __32__CIPaletteCentroid_outputImage__block_invoke(uint64_t a1, int a2)
{
  if (a2) {
    return 0.0;
  }
  return result;
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
}

- (CIImage)inputPaletteImage
{
  return self->inputPaletteImage;
}

- (void)setInputPaletteImage:(id)a3
{
}

- (NSNumber)inputPerceptual
{
  return self->inputPerceptual;
}

- (void)setInputPerceptual:(id)a3
{
}

- (void)outputImage
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  [*a1 extent];
  uint64_t v5 = v4;
  [*a1 extent];
  int v7 = 136446722;
  double v8 = "-[CIPaletteCentroid outputImage]";
  __int16 v9 = 2048;
  uint64_t v10 = v5;
  __int16 v11 = 2048;
  uint64_t v12 = v6;
  _os_log_error_impl(&dword_193671000, a2, OS_LOG_TYPE_ERROR, "%{public}s The input palette should be a K x 1 image but received %.1f x %.1f]", (uint8_t *)&v7, 0x20u);
}

@end