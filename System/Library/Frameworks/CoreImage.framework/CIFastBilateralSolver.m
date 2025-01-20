@interface CIFastBilateralSolver
+ (id)customAttributes;
- (CIImage)inputConfidenceMapImage;
- (CIImage)inputDisparityImage;
- (CIImage)inputImage;
- (NSNumber)inputLambda;
- (NSNumber)inputMaxNumIterations;
- (NSNumber)inputMaxNumVertices;
- (NSNumber)inputSigmaRChroma;
- (NSNumber)inputSigmaRLuma;
- (NSNumber)inputSigmaS;
- (id)outputImage;
- (void)setInputConfidenceMapImage:(id)a3;
- (void)setInputDisparityImage:(id)a3;
- (void)setInputImage:(id)a3;
- (void)setInputLambda:(id)a3;
- (void)setInputMaxNumIterations:(id)a3;
- (void)setInputMaxNumVertices:(id)a3;
- (void)setInputSigmaRChroma:(id)a3;
- (void)setInputSigmaRLuma:(id)a3;
- (void)setInputSigmaS:(id)a3;
@end

@implementation CIFastBilateralSolver

+ (id)customAttributes
{
  v17[9] = *MEMORY[0x1E4F143B8];
  v16[0] = @"CIAttributeFilterCategories";
  v15[0] = @"CICategoryColorAdjustment";
  v15[1] = @"CICategoryStillImage";
  v15[2] = @"CICategoryBuiltIn";
  v15[3] = @"CICategoryApplePrivate";
  v17[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:4];
  v17[1] = @"11";
  v16[1] = @"CIAttributeFilterAvailable_iOS";
  v16[2] = @"CIAttributeFilterAvailable_Mac";
  v17[2] = @"10.13";
  v16[3] = @"inputMaxNumVertices";
  v13[0] = @"CIAttributeDefault";
  v13[1] = @"CIAttributeType";
  v14[0] = &unk_1EE4AA928;
  v14[1] = @"CIAttributeTypeInteger";
  v17[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
  v16[4] = @"inputSigmaS";
  v11[0] = @"CIAttributeDefault";
  v11[1] = @"CIAttributeType";
  v12[0] = &unk_1EE4AA940;
  v12[1] = @"CIAttributeTypeInteger";
  v17[4] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  v16[5] = @"inputSigmaRLuma";
  v9[0] = @"CIAttributeDefault";
  v9[1] = @"CIAttributeType";
  v10[0] = &unk_1EE4AA940;
  v10[1] = @"CIAttributeTypeInteger";
  v17[5] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  v16[6] = @"inputSigmaRChroma";
  v7[0] = @"CIAttributeDefault";
  v7[1] = @"CIAttributeType";
  v8[0] = &unk_1EE4AA940;
  v8[1] = @"CIAttributeTypeInteger";
  v17[6] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];
  v16[7] = @"inputLambda";
  v5[0] = @"CIAttributeDefault";
  v5[1] = @"CIAttributeType";
  v6[0] = &unk_1EE4AB660;
  v6[1] = @"CIAttributeTypeScalar";
  v17[7] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:2];
  v16[8] = @"inputMaxNumIterations";
  v3[0] = @"CIAttributeDefault";
  v3[1] = @"CIAttributeType";
  v4[0] = &unk_1EE4AA958;
  v4[1] = @"CIAttributeTypeInteger";
  v17[8] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:2];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:9];
}

- (id)outputImage
{
  v37[7] = *MEMORY[0x1E4F143B8];
  id result = self->inputImage;
  if (result)
  {
    if (self->inputDisparityImage && self->inputConfidenceMapImage)
    {
      [result extent];
      double v5 = v4;
      double v7 = v6;
      double v9 = v8;
      double v11 = v10;
      [(CIImage *)self->inputDisparityImage extent];
      v41.origin.x = v12;
      v41.origin.y = v13;
      v41.size.width = v14;
      v41.size.height = v15;
      v39.origin.x = v5;
      v39.origin.y = v7;
      v39.size.width = v9;
      v39.size.height = v11;
      if (!CGRectEqualToRect(v39, v41)) {
        goto LABEL_10;
      }
      [(CIImage *)self->inputConfidenceMapImage extent];
      v42.origin.x = v16;
      v42.origin.y = v17;
      v42.size.width = v18;
      v42.size.height = v19;
      v40.origin.x = v5;
      v40.origin.y = v7;
      v40.size.width = v9;
      v40.size.height = v11;
      if (CGRectEqualToRect(v40, v42))
      {
        inputMaxNumVertices = self->inputMaxNumVertices;
        v36[0] = @"inputMaxNumVertices";
        v36[1] = @"inputSigmaS";
        inputSigmaS = self->inputSigmaS;
        inputSigmaRLuma = self->inputSigmaRLuma;
        v37[0] = inputMaxNumVertices;
        v37[1] = inputSigmaS;
        inputSigmaRChroma = self->inputSigmaRChroma;
        v36[2] = @"inputSigmaRLuma";
        v36[3] = @"inputSigmaRChroma";
        v37[2] = inputSigmaRLuma;
        v37[3] = inputSigmaRChroma;
        inputLambda = self->inputLambda;
        v36[4] = @"inputLambda";
        v36[5] = @"inputMaxNumIterations";
        inputMaxNumIterations = self->inputMaxNumIterations;
        v37[4] = inputLambda;
        v37[5] = inputMaxNumIterations;
        v36[6] = @"fullROI";
        v37[6] = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:", v5, v7, v9, v11);
        uint64_t v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:v36 count:7];
        id v27 = +[CIImage imageYCC444:self->inputImage matrix:709 fullRange:1 colorSpace:0];
        inputConfidenceMapImage = self->inputConfidenceMapImage;
        inputDisparityImage = self->inputDisparityImage;
        v35[0] = v27;
        v35[1] = inputConfidenceMapImage;
        v35[2] = inputDisparityImage;
        uint64_t v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:3];
        uint64_t v33 = 0;
        v31 = +[CIImageProcessorKernel applyWithExtent:inputs:arguments:error:](FBSProcessorCPU, "applyWithExtent:inputs:arguments:error:", v30, v26, &v33, v5, v7, v9, v11);
        v32 = +[CIImageProcessorKernel applyWithExtent:inputs:arguments:error:](FBSProcessorGPU, "applyWithExtent:inputs:arguments:error:", v30, v26, &v33, v5, v7, v9, v11);
        v34[0] = v31;
        v34[1] = v32;
        return +[CIImage imageWithArrayOfImages:selector:](CIImage, "imageWithArrayOfImages:selector:", [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:2], &__block_literal_global_26);
      }
      else
      {
LABEL_10:
        NSLog(&cfstr_CannotUseCifas.isa);
        return self->inputDisparityImage;
      }
    }
  }
  else
  {
    return +[CIImage emptyImage];
  }
  return result;
}

uint64_t __36__CIFastBilateralSolver_outputImage__block_invoke(uint64_t a1, void *a2)
{
  if (_block_invoke_onceToken != -1) {
    dispatch_once(&_block_invoke_onceToken, &__block_literal_global_69);
  }
  int v3 = objc_msgSend((id)objc_msgSend(a2, "valueForKey:", @"kContextInfoIsSoftware"), "BOOLValue");
  return (v3 ^ 1) & _block_invoke_deviceSupportsMetal;
}

void __36__CIFastBilateralSolver_outputImage__block_invoke_2()
{
  id v0 = MTLCreateSystemDefaultDevice();
  if (v0)
  {
    _block_invoke_deviceSupportsMetal = 1;
    CFRelease(v0);
  }
}

- (CIImage)inputImage
{
  return (CIImage *)objc_getProperty(self, a2, 80, 1);
}

- (void)setInputImage:(id)a3
{
}

- (CIImage)inputDisparityImage
{
  return (CIImage *)objc_getProperty(self, a2, 88, 1);
}

- (void)setInputDisparityImage:(id)a3
{
}

- (CIImage)inputConfidenceMapImage
{
  return (CIImage *)objc_getProperty(self, a2, 96, 1);
}

- (void)setInputConfidenceMapImage:(id)a3
{
}

- (NSNumber)inputMaxNumVertices
{
  return self->inputMaxNumVertices;
}

- (void)setInputMaxNumVertices:(id)a3
{
}

- (NSNumber)inputSigmaS
{
  return self->inputSigmaS;
}

- (void)setInputSigmaS:(id)a3
{
}

- (NSNumber)inputSigmaRLuma
{
  return self->inputSigmaRLuma;
}

- (void)setInputSigmaRLuma:(id)a3
{
}

- (NSNumber)inputSigmaRChroma
{
  return self->inputSigmaRChroma;
}

- (void)setInputSigmaRChroma:(id)a3
{
}

- (NSNumber)inputLambda
{
  return self->inputLambda;
}

- (void)setInputLambda:(id)a3
{
}

- (NSNumber)inputMaxNumIterations
{
  return self->inputMaxNumIterations;
}

- (void)setInputMaxNumIterations:(id)a3
{
}

@end