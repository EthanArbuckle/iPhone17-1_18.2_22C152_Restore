@interface CIPalettize
+ (id)customAttributes;
- (CIImage)inputImage;
- (CIImage)inputPaletteImage;
- (NSNumber)inputPerceptual;
- (id)_kernelApplyPalette;
- (id)outputImage;
- (void)outputImage;
- (void)setInputImage:(id)a3;
- (void)setInputPaletteImage:(id)a3;
- (void)setInputPerceptual:(id)a3;
@end

@implementation CIPalettize

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

- (id)_kernelApplyPalette
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_palettize];
}

- (id)outputImage
{
  v35[3] = *MEMORY[0x1E4F143B8];
  if (self->inputImage
    && (p_inputPaletteImage = &self->inputPaletteImage, (inputPaletteImage = self->inputPaletteImage) != 0))
  {
    [(CIImage *)inputPaletteImage extent];
    if (CGRectIsInfinite(v37) || ([(CIImage *)*p_inputPaletteImage extent], v5 > 1.0))
    {
      v6 = ci_logger_api();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        [(CIPalettize *)(id *)p_inputPaletteImage outputImage];
      }
      return +[CIImage emptyImage];
    }
    else
    {
      inputImage = self->inputImage;
      [(CIImage *)*p_inputPaletteImage extent];
      double v10 = v9;
      inputPerceptual = self->inputPerceptual;
      if (inputPerceptual) {
        BOOL v12 = [(NSNumber *)inputPerceptual BOOLValue];
      }
      else {
        BOOL v12 = 0;
      }
      unint64_t v13 = (unint64_t)v10;
      [(CIImage *)self->inputImage extent];
      double v15 = v14;
      double v17 = v16;
      double v19 = v18;
      double v21 = v20;
      id v22 = [(CIPalettize *)self _kernelApplyPalette];
      v23 = *p_inputPaletteImage;
      [(CIImage *)*p_inputPaletteImage extent];
      CGFloat v25 = -v24;
      [(CIImage *)*p_inputPaletteImage extent];
      CGAffineTransformMakeTranslation(&v34, v25, -v26);
      v27 = [(CIImage *)v23 imageByApplyingTransform:&v34];
      if (v12)
      {
        inputImage = [(CIImage *)inputImage imageByApplyingFilter:@"CILinearToSRGBToneCurve"];
        v27 = [(CIImage *)v27 imageByApplyingFilter:@"CILinearToSRGBToneCurve"];
      }
      uint64_t v28 = [(CIImage *)inputImage imageByUnpremultiplyingAlpha];
      double v29 = *MEMORY[0x1E4F1DB10];
      double v30 = *(double *)(MEMORY[0x1E4F1DB10] + 8);
      double v31 = *(double *)(MEMORY[0x1E4F1DB10] + 16);
      double v32 = *(double *)(MEMORY[0x1E4F1DB10] + 24);
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __26__CIPalettize_outputImage__block_invoke;
      v33[3] = &__block_descriptor_40_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
      v33[4] = v13;
      v35[0] = v28;
      v35[1] = v27;
      v35[2] = [NSNumber numberWithUnsignedLong:v13];
      id result = (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v22, "applyWithExtent:roiCallback:arguments:", v33, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v35, 3), v29, v30, v31, v32), "imageByCroppingToRect:", v15, v17, v19, v21), "imageByPremultiplyingAlpha");
      if (v12) {
        return (id)[result imageByApplyingFilter:@"CISRGBToneCurveToLinear"];
      }
    }
  }
  else
  {
    return +[CIImage emptyImage];
  }
  return result;
}

double __26__CIPalettize_outputImage__block_invoke(uint64_t a1, int a2)
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
  v8 = "-[CIPalettize outputImage]";
  __int16 v9 = 2048;
  uint64_t v10 = v5;
  __int16 v11 = 2048;
  uint64_t v12 = v6;
  _os_log_error_impl(&dword_193671000, a2, OS_LOG_TYPE_ERROR, "%{public}s The input palette should be a K x 1 image but received %.1f x %.1f]", (uint8_t *)&v7, 0x20u);
}

@end