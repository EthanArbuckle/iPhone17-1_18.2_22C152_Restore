@interface CIFaceMaskCalculator
- (CIImage)inputImage;
- (CIVector)inputFacesCenterX;
- (CIVector)inputFacesCenterY;
- (CIVector)inputFacesChinX;
- (CIVector)inputFacesChinY;
- (CIVector)inputFacesLeftEyeX;
- (CIVector)inputFacesLeftEyeY;
- (CIVector)inputFacesRightEyeX;
- (CIVector)inputFacesRightEyeY;
- (NSDictionary)inputTuningParameters;
- (NSNumber)inputApertureScaling;
- (NSNumber)inputFacesCapMultip;
- (NSNumber)inputFacesDistToBlurScaling;
- (NSNumber)inputFacesEyeToEyebrowRatio;
- (NSNumber)inputFacesGainMultip;
- (NSNumber)inputFacesLinearBlurGrowthC;
- (NSNumber)inputFacesLinearBlurGrowthM;
- (NSNumber)inputFacesMaxBlurDistFromFocus;
- (NSNumber)inputFacesMaxBlurOnEyes;
- (NSNumber)inputMaxBlur;
- (id)_kernel;
- (id)metalKernel;
- (id)outputImage;
- (id)outputImage_V4;
- (void)setInputApertureScaling:(id)a3;
- (void)setInputFacesCapMultip:(id)a3;
- (void)setInputFacesCenterX:(id)a3;
- (void)setInputFacesCenterY:(id)a3;
- (void)setInputFacesChinX:(id)a3;
- (void)setInputFacesChinY:(id)a3;
- (void)setInputFacesDistToBlurScaling:(id)a3;
- (void)setInputFacesEyeToEyebrowRatio:(id)a3;
- (void)setInputFacesGainMultip:(id)a3;
- (void)setInputFacesLeftEyeX:(id)a3;
- (void)setInputFacesLeftEyeY:(id)a3;
- (void)setInputFacesLinearBlurGrowthC:(id)a3;
- (void)setInputFacesLinearBlurGrowthM:(id)a3;
- (void)setInputFacesMaxBlurDistFromFocus:(id)a3;
- (void)setInputFacesMaxBlurOnEyes:(id)a3;
- (void)setInputFacesRightEyeX:(id)a3;
- (void)setInputFacesRightEyeY:(id)a3;
- (void)setInputImage:(id)a3;
- (void)setInputMaxBlur:(id)a3;
- (void)setInputTuningParameters:(id)a3;
@end

@implementation CIFaceMaskCalculator

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_faceMaskCalculator];
}

- (id)metalKernel
{
  if (-[CIFaceMaskCalculator metalKernel]::onceToken != -1) {
    dispatch_once(&-[CIFaceMaskCalculator metalKernel]::onceToken, &__block_literal_global_170);
  }
  return (id)-[CIFaceMaskCalculator metalKernel]::kernel;
}

id __35__CIFaceMaskCalculator_metalKernel__block_invoke()
{
  id result = +[CIKernel SDOFV2MetalKernelNamed:@"_FMCalculator"];
  -[CIFaceMaskCalculator metalKernel]::kernel = (uint64_t)result;
  return result;
}

- (id)outputImage_V4
{
  v57[13] = *MEMORY[0x1E4F143B8];
  inputImage = self->inputImage;
  if (inputImage)
  {
    uint64_t v47 = 0;
    v48 = &v47;
    uint64_t v49 = 0x5012000000;
    v50 = __Block_byref_object_copy__7;
    v51 = __Block_byref_object_dispose__7;
    v52 = "";
    long long v4 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
    long long v53 = *MEMORY[0x1E4F1DB20];
    long long v54 = v4;
    [(CIImage *)inputImage extent];
    double v6 = v5;
    [(CIImage *)self->inputImage extent];
    *(float *)&double v6 = v6;
    float v8 = v7;
    v59.origin.x = addPoints(self->inputFacesLeftEyeX, self->inputFacesLeftEyeY, *(CGRect *)(v48 + 6), *(float *)&v6, v8);
    *(CGRect *)(v48 + 6) = v59;
    v60.origin.x = addPoints(self->inputFacesRightEyeX, self->inputFacesRightEyeY, v59, *(float *)&v6, v8);
    *(CGRect *)(v48 + 6) = v60;
    CGRect v61 = CGRectIntegral(v60);
    *(CGRect *)(v48 + 6) = CGRectInset(v61, -1.0, -1.0);
    [(NSNumber *)self->inputMaxBlur floatValue];
    LODWORD(v6) = v9;
    [(NSNumber *)self->inputFacesMaxBlurOnEyes floatValue];
    float v11 = v10;
    [(NSNumber *)self->inputFacesMaxBlurDistFromFocus floatValue];
    float v13 = v12;
    [(NSNumber *)self->inputFacesEyeToEyebrowRatio floatValue];
    v15 = +[CIVector vectorWithX:*(float *)&v6 Y:v11 Z:v13 W:v14];
    [(NSNumber *)self->inputFacesLinearBlurGrowthM floatValue];
    LODWORD(v6) = v16;
    [(NSNumber *)self->inputFacesLinearBlurGrowthC floatValue];
    float v18 = v17;
    [(NSNumber *)self->inputFacesDistToBlurScaling floatValue];
    float v20 = v19;
    [(NSNumber *)self->inputFacesCapMultip floatValue];
    v22 = +[CIVector vectorWithX:*(float *)&v6 Y:v18 Z:v20 W:v21];
    [(NSNumber *)self->inputFacesGainMultip floatValue];
    v24 = +[CIVector vectorWithX:v23 Y:1.0 Z:1.0 W:0.5];
    [(CIImage *)self->inputImage extent];
    double v26 = v25;
    [(CIImage *)self->inputImage extent];
    double v28 = v27;
    [(NSNumber *)self->inputApertureScaling floatValue];
    float v30 = v29;
    [(CIImage *)self->inputImage extent];
    double v32 = v31;
    [(CIImage *)self->inputImage extent];
    float v33 = v26 / v28;
    v34 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v33, v30, v32);
    inputFacesCenterX = self->inputFacesCenterX;
    inputFacesCenterY = self->inputFacesCenterY;
    v57[0] = self->inputImage;
    v57[1] = inputFacesCenterX;
    inputFacesLeftEyeX = self->inputFacesLeftEyeX;
    inputFacesLeftEyeY = self->inputFacesLeftEyeY;
    v57[2] = inputFacesCenterY;
    v57[3] = inputFacesLeftEyeX;
    inputFacesRightEyeX = self->inputFacesRightEyeX;
    inputFacesRightEyeY = self->inputFacesRightEyeY;
    v57[4] = inputFacesLeftEyeY;
    v57[5] = inputFacesRightEyeX;
    inputFacesChinX = self->inputFacesChinX;
    v57[6] = inputFacesRightEyeY;
    v57[7] = inputFacesChinX;
    v57[8] = self->inputFacesChinY;
    v57[9] = v15;
    v57[10] = v22;
    v57[11] = v24;
    v57[12] = v34;
    uint64_t v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:v57 count:13];
    id v43 = [(CIFaceMaskCalculator *)self metalKernel];
    v55 = @"kCIKernelOutputFormat";
    uint64_t v56 = objc_msgSend(NSNumber, "numberWithInt:", 2056, MEMORY[0x1E4F143A8], 3221225472, __38__CIFaceMaskCalculator_outputImage_V4__block_invoke, &unk_1E5771720, &v47);
    v44 = objc_msgSend(v43, "applyWithExtent:roiCallback:arguments:options:", &v46, v42, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v56, &v55, 1), 0.0, 0.0, 5.0, 1.0);
    _Block_object_dispose(&v47, 8);
    return v44;
  }
  else
  {
    return +[CIImage emptyImage];
  }
}

double __38__CIFaceMaskCalculator_outputImage_V4__block_invoke(uint64_t a1)
{
  return *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 48);
}

- (id)outputImage
{
  v66[4] = *MEMORY[0x1E4F143B8];
  if (self->inputImage)
  {
    if ((unint64_t)objc_msgSend((id)-[CIFaceMaskCalculator valueForKey:](self, "valueForKey:", @"__inputVersion"), "unsignedIntegerValue") < 3)
    {
      uint64_t v55 = 0;
      uint64_t v56 = &v55;
      uint64_t v57 = 0x5012000000;
      v58 = __Block_byref_object_copy__7;
      CGRect v59 = __Block_byref_object_dispose__7;
      CGRect v60 = "";
      CGSize v4 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
      CGPoint v61 = (CGPoint)*MEMORY[0x1E4F1DB20];
      CGSize v62 = v4;
      v71.origin = v61;
      v71.size = v4;
      v68.origin.x = addPoints(self->inputFacesLeftEyeX, self->inputFacesLeftEyeY, v71, 1.0, 1.0);
      *(CGRect *)(v56 + 6) = v68;
      v69.origin.x = addPoints(self->inputFacesRightEyeX, self->inputFacesRightEyeY, v68, 1.0, 1.0);
      *(CGRect *)(v56 + 6) = v69;
      CGRect v70 = CGRectIntegral(v69);
      *(CGRect *)(v56 + 6) = CGRectInset(v70, -1.0, -1.0);
      [(NSNumber *)self->inputMaxBlur floatValue];
      float v6 = v5;
      [(NSNumber *)self->inputFacesCapMultip floatValue];
      float v8 = v7;
      [(NSNumber *)self->inputFacesMaxBlurOnEyes floatValue];
      float v10 = v9;
      [(NSNumber *)self->inputFacesMaxBlurDistFromFocus floatValue];
      float v12 = +[CIVector vectorWithX:v6 Y:v8 Z:v10 W:v11];
      [(NSNumber *)self->inputFacesLinearBlurGrowthM floatValue];
      float v14 = v13;
      [(NSNumber *)self->inputFacesLinearBlurGrowthC floatValue];
      float v16 = v15;
      [(NSNumber *)self->inputFacesEyeToEyebrowRatio floatValue];
      float v18 = v17;
      [(NSNumber *)self->inputFacesDistToBlurScaling floatValue];
      float v20 = +[CIVector vectorWithX:v14 Y:v16 Z:v18 W:v19];
      [(NSNumber *)self->inputFacesGainMultip floatValue];
      float v22 = v21;
      [(CIImage *)self->inputImage extent];
      double v24 = v23;
      [(CIImage *)self->inputImage extent];
      double v26 = v25;
      [(CIImage *)self->inputImage extent];
      double v28 = v27;
      [(CIImage *)self->inputImage extent];
      float v29 = v24;
      float v30 = v26;
      long long v53 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v22, (float)(v29 / v30), v28);
      SDOFFaceMaskValue(@"chinVectorSnapping", self->inputTuningParameters);
      float v32 = v31;
      [(NSNumber *)self->inputApertureScaling floatValue];
      v52 = +[CIVector vectorWithX:v32 Y:v33 Z:0.0 W:0.0];
      for (uint64_t i = 0; i != 4; ++i)
      {
        -[CIVector valueAtIndex:](self->inputFacesLeftEyeX, "valueAtIndex:", i, v52);
        if (v35 == -1.0
          || ([(CIVector *)self->inputFacesLeftEyeY valueAtIndex:i], v36 == -1.0)
          || ([(CIVector *)self->inputFacesRightEyeX valueAtIndex:i], v37 == -1.0)
          || ([(CIVector *)self->inputFacesRightEyeY valueAtIndex:i], v38 == -1.0)
          || ([(CIVector *)self->inputFacesCenterX valueAtIndex:i], v39 == -1.0)
          || ([(CIVector *)self->inputFacesCenterY valueAtIndex:i], v40 == -1.0)
          || ([(CIVector *)self->inputFacesChinX valueAtIndex:i], v41 == -1.0))
        {
          BOOL v43 = 0;
        }
        else
        {
          [(CIVector *)self->inputFacesChinY valueAtIndex:i];
          BOOL v43 = v42 != -1.0;
        }
        *(double *)&v66[i] = (double)v43;
      }
      v44 = +[CIVector vectorWithValues:v66 count:4];
      inputFacesLeftEyeX = self->inputFacesLeftEyeX;
      v65[0] = self->inputImage;
      v65[1] = inputFacesLeftEyeX;
      inputFacesCenterX = self->inputFacesCenterX;
      v65[2] = self->inputFacesLeftEyeY;
      v65[3] = inputFacesCenterX;
      inputFacesRightEyeX = self->inputFacesRightEyeX;
      v65[4] = self->inputFacesCenterY;
      v65[5] = inputFacesRightEyeX;
      inputFacesChinX = self->inputFacesChinX;
      v65[6] = self->inputFacesRightEyeY;
      v65[7] = inputFacesChinX;
      v65[8] = self->inputFacesChinY;
      v65[9] = v12;
      v65[10] = v20;
      v65[11] = v53;
      v65[12] = v52;
      v65[13] = v44;
      uint64_t v49 = [MEMORY[0x1E4F1C978] arrayWithObjects:v65 count:14];
      id v50 = [(CIFaceMaskCalculator *)self _kernel];
      v54[0] = MEMORY[0x1E4F143A8];
      v54[1] = 3221225472;
      v54[2] = __35__CIFaceMaskCalculator_outputImage__block_invoke;
      v54[3] = &unk_1E5771720;
      v54[4] = &v55;
      v63 = @"kCIKernelOutputFormat";
      uint64_t v64 = [NSNumber numberWithInt:2056];
      v51 = objc_msgSend(v50, "applyWithExtent:roiCallback:arguments:options:", v54, v49, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v64, &v63, 1), 0.0, 0.0, 5.0, 1.0);
      _Block_object_dispose(&v55, 8);
      return v51;
    }
    else
    {
      return [(CIFaceMaskCalculator *)self outputImage_V4];
    }
  }
  else
  {
    return +[CIImage emptyImage];
  }
}

double __35__CIFaceMaskCalculator_outputImage__block_invoke(uint64_t a1)
{
  return *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 48);
}

- (CIImage)inputImage
{
  return (CIImage *)objc_getProperty(self, a2, 80, 1);
}

- (void)setInputImage:(id)a3
{
}

- (CIVector)inputFacesLeftEyeX
{
  return self->inputFacesLeftEyeX;
}

- (void)setInputFacesLeftEyeX:(id)a3
{
}

- (CIVector)inputFacesLeftEyeY
{
  return self->inputFacesLeftEyeY;
}

- (void)setInputFacesLeftEyeY:(id)a3
{
}

- (CIVector)inputFacesRightEyeX
{
  return self->inputFacesRightEyeX;
}

- (void)setInputFacesRightEyeX:(id)a3
{
}

- (CIVector)inputFacesRightEyeY
{
  return self->inputFacesRightEyeY;
}

- (void)setInputFacesRightEyeY:(id)a3
{
}

- (CIVector)inputFacesCenterX
{
  return self->inputFacesCenterX;
}

- (void)setInputFacesCenterX:(id)a3
{
}

- (CIVector)inputFacesCenterY
{
  return self->inputFacesCenterY;
}

- (void)setInputFacesCenterY:(id)a3
{
}

- (CIVector)inputFacesChinX
{
  return self->inputFacesChinX;
}

- (void)setInputFacesChinX:(id)a3
{
}

- (CIVector)inputFacesChinY
{
  return self->inputFacesChinY;
}

- (void)setInputFacesChinY:(id)a3
{
}

- (NSNumber)inputMaxBlur
{
  return self->inputMaxBlur;
}

- (void)setInputMaxBlur:(id)a3
{
}

- (NSNumber)inputFacesCapMultip
{
  return self->inputFacesCapMultip;
}

- (void)setInputFacesCapMultip:(id)a3
{
}

- (NSNumber)inputFacesMaxBlurOnEyes
{
  return self->inputFacesMaxBlurOnEyes;
}

- (void)setInputFacesMaxBlurOnEyes:(id)a3
{
}

- (NSNumber)inputFacesMaxBlurDistFromFocus
{
  return self->inputFacesMaxBlurDistFromFocus;
}

- (void)setInputFacesMaxBlurDistFromFocus:(id)a3
{
}

- (NSNumber)inputFacesLinearBlurGrowthM
{
  return self->inputFacesLinearBlurGrowthM;
}

- (void)setInputFacesLinearBlurGrowthM:(id)a3
{
}

- (NSNumber)inputFacesLinearBlurGrowthC
{
  return self->inputFacesLinearBlurGrowthC;
}

- (void)setInputFacesLinearBlurGrowthC:(id)a3
{
}

- (NSNumber)inputFacesEyeToEyebrowRatio
{
  return self->inputFacesEyeToEyebrowRatio;
}

- (void)setInputFacesEyeToEyebrowRatio:(id)a3
{
}

- (NSNumber)inputFacesDistToBlurScaling
{
  return self->inputFacesDistToBlurScaling;
}

- (void)setInputFacesDistToBlurScaling:(id)a3
{
}

- (NSNumber)inputFacesGainMultip
{
  return self->inputFacesGainMultip;
}

- (void)setInputFacesGainMultip:(id)a3
{
}

- (NSNumber)inputApertureScaling
{
  return self->inputApertureScaling;
}

- (void)setInputApertureScaling:(id)a3
{
}

- (NSDictionary)inputTuningParameters
{
  return self->inputTuningParameters;
}

- (void)setInputTuningParameters:(id)a3
{
}

@end