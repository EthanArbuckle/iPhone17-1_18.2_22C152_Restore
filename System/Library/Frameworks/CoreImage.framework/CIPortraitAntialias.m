@interface CIPortraitAntialias
- (CIImage)inputImage;
- (CIVector)inputRect;
- (CIVector)inputSensorSize;
- (NSNumber)inputAntiAliasRadius;
- (NSNumber)inputLumaNoiseAmpl;
- (NSNumber)inputLumaNoiseModelCoeff;
- (NSNumber)inputMaxBlurInPixels;
- (NSNumber)inputScale;
- (id)_kernel:(BOOL)a3 withAddedNoise:(BOOL)a4;
- (id)_noiseGeneratorKernel;
- (id)noiseColorKernel;
- (id)outputImage;
- (id)outputImage:(id)a3 horizontal:(BOOL)a4;
- (void)setInputAntiAliasRadius:(id)a3;
- (void)setInputImage:(id)a3;
- (void)setInputLumaNoiseAmpl:(id)a3;
- (void)setInputLumaNoiseModelCoeff:(id)a3;
- (void)setInputMaxBlurInPixels:(id)a3;
- (void)setInputRect:(id)a3;
- (void)setInputScale:(id)a3;
- (void)setInputSensorSize:(id)a3;
@end

@implementation CIPortraitAntialias

- (id)_kernel:(BOOL)a3 withAddedNoise:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v6 = SDOFV2MetalLibURL();
  v7 = @"_sparserendering_antialias_y_no_noise";
  if (v4) {
    v7 = @"_sparserendering_antialias_y";
  }
  if (v5) {
    v8 = @"_sparserendering_antialias_x";
  }
  else {
    v8 = v7;
  }

  return +[CIKernel cachedKernelWithFunctionName:v8 fromMetalLibrary:v6 error:0];
}

- (id)_noiseGeneratorKernel
{
  uint64_t v2 = SDOFV2MetalLibURL();

  return +[CIKernel cachedKernelWithFunctionName:@"_noiseGenerator" fromMetalLibrary:v2 error:0];
}

- (id)noiseColorKernel
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_sparserendering_add_noise];
}

- (id)outputImage:(id)a3 horizontal:(BOOL)a4
{
  v92[4] = *MEMORY[0x1E4F143B8];
  if (a3
    && ((BOOL v4 = a4,
         [(NSNumber *)[(CIPortraitAntialias *)self inputScale] floatValue],
         float v8 = v7,
         v7 == 1.0)
      ? (int v9 = 1)
      : (int v9 = v4),
        (id v10 = [(CIPortraitAntialias *)self _kernel:v4 withAddedNoise:(v7 == 1.0) & ~v4]) != 0))
  {
    v11 = v10;
    uint64_t v76 = 0;
    v77 = (float *)&v76;
    uint64_t v78 = 0x2020000000;
    int v79 = 0;
    [(NSNumber *)self->inputAntiAliasRadius floatValue];
    int v79 = v12;
    if (v8 < 1.0)
    {
      float v13 = v8 * v77[6];
      if (v13 < 3.0) {
        float v13 = 3.0;
      }
      v77[6] = v13;
    }
    [(NSNumber *)self->inputMaxBlurInPixels floatValue];
    float v15 = v14;
    float v16 = v77[6];
    [(NSNumber *)self->inputLumaNoiseModelCoeff floatValue];
    float v18 = v17;
    [(NSNumber *)self->inputLumaNoiseAmpl floatValue];
    v20 = +[CIVector vectorWithX:v15 Y:v16 Z:v18 W:v19];
    [(CIVector *)self->inputRect Z];
    double v22 = v21;
    [(CIVector *)self->inputRect W];
    double v23 = v8;
    v25 = +[CIVector vectorWithX:v22 Y:v24 Z:v23];
    if (v4)
    {
      inputMaxBlurInPixels = self->inputMaxBlurInPixels;
      v92[0] = a3;
      v92[1] = inputMaxBlurInPixels;
      *(float *)&double v26 = v77[6];
      uint64_t v28 = [NSNumber numberWithFloat:v26];
      inputScale = self->inputScale;
      v92[2] = v28;
      v92[3] = inputScale;
      v30 = v92;
      uint64_t v31 = 4;
    }
    else
    {
      v91[0] = a3;
      v91[1] = v20;
      v30 = v91;
      uint64_t v31 = 3;
      v91[2] = v25;
    }
    uint64_t v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:v31];
    if (v9)
    {
      uint64_t v34 = v33;
      double v35 = *MEMORY[0x1E4F1DB10];
      double v36 = *(double *)(MEMORY[0x1E4F1DB10] + 8);
      double v37 = *(double *)(MEMORY[0x1E4F1DB10] + 16);
      double v38 = *(double *)(MEMORY[0x1E4F1DB10] + 24);
      v74[0] = MEMORY[0x1E4F143A8];
      v74[1] = 3221225472;
      v74[2] = __46__CIPortraitAntialias_outputImage_horizontal___block_invoke;
      v74[3] = &unk_1E5772960;
      BOOL v75 = v4;
      v74[4] = &v76;
      v89 = @"kCIKernelOutputFormat";
      uint64_t v90 = [NSNumber numberWithInt:2056];
      uint64_t v39 = objc_msgSend(v11, "applyWithExtent:roiCallback:arguments:options:", v74, v34, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v90, &v89, 1), v35, v36, v37, v38);
    }
    else
    {
      id v40 = [(CIPortraitAntialias *)self _kernel:0 withAddedNoise:0];
      [(NSNumber *)self->inputMaxBlurInPixels floatValue];
      v42 = +[CIVector vectorWithX:v41 Y:v77[6] Z:v23];
      double v43 = *MEMORY[0x1E4F1DB10];
      double v44 = *(double *)(MEMORY[0x1E4F1DB10] + 8);
      double v45 = *(double *)(MEMORY[0x1E4F1DB10] + 16);
      double v46 = *(double *)(MEMORY[0x1E4F1DB10] + 24);
      v73[0] = MEMORY[0x1E4F143A8];
      v73[1] = 3221225472;
      v73[2] = __46__CIPortraitAntialias_outputImage_horizontal___block_invoke_2;
      v73[3] = &unk_1E5771720;
      v73[4] = &v76;
      v88[0] = a3;
      v88[1] = v42;
      uint64_t v47 = [MEMORY[0x1E4F1C978] arrayWithObjects:v88 count:2];
      v86 = @"kCIKernelOutputFormat";
      uint64_t v87 = [NSNumber numberWithInt:2056];
      v48 = objc_msgSend(v40, "applyWithExtent:roiCallback:arguments:options:", v73, v47, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v87, &v86, 1), v43, v44, v45, v46);
      [(NSNumber *)self->inputLumaNoiseModelCoeff floatValue];
      LODWORD(v43) = v49;
      [(NSNumber *)self->inputLumaNoiseAmpl floatValue];
      v51 = +[CIVector vectorWithX:*(float *)&v43 Y:v50];
      id v52 = [(CIPortraitAntialias *)self _noiseGeneratorKernel];
      [(CIVector *)self->inputSensorSize X];
      double v54 = v53;
      [(CIVector *)self->inputSensorSize Y];
      double v55 = v54 * 0.5;
      double v57 = v56 * 0.5;
      v85 = +[CIVector vectorWithX:v55 Y:v56 * 0.5];
      uint64_t v58 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v85 count:1];
      v83 = @"kCIKernelOutputFormat";
      uint64_t v84 = [NSNumber numberWithInt:2053];
      v59 = objc_msgSend(v52, "applyWithExtent:arguments:options:", v58, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v84, &v83, 1), 0.0, 0.0, v55, v57);
      CGAffineTransformMakeScale(&v72, v23, v23);
      uint64_t v60 = [v59 imageByApplyingTransform:&v72 highQualityDownsample:0];
      id v61 = [(CIPortraitAntialias *)self noiseColorKernel];
      [v48 extent];
      double v63 = v62;
      double v65 = v64;
      double v67 = v66;
      double v69 = v68;
      v82[0] = v48;
      v82[1] = v60;
      v82[2] = v51;
      uint64_t v70 = [MEMORY[0x1E4F1C978] arrayWithObjects:v82 count:3];
      v80 = @"kCIKernelOutputFormat";
      uint64_t v81 = [NSNumber numberWithInt:2056];
      uint64_t v39 = objc_msgSend(v61, "applyWithExtent:arguments:options:", v70, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v81, &v80, 1), v63, v65, v67, v69);
    }
    v71 = (void *)v39;
    _Block_object_dispose(&v76, 8);
    return v71;
  }
  else
  {
    return +[CIImage emptyImage];
  }
}

double __46__CIPortraitAntialias_outputImage_horizontal___block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  float v5 = -*(float *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  double v6 = v5;
  if (*(unsigned char *)(a1 + 40)) {
    double v7 = v5;
  }
  else {
    double v7 = 0.0;
  }
  if (*(unsigned char *)(a1 + 40)) {
    double v6 = 0.0;
  }
  *(void *)&double result = (unint64_t)CGRectInset(*(CGRect *)&a2, v7, v6);
  return result;
}

double __46__CIPortraitAntialias_outputImage_horizontal___block_invoke_2(uint64_t a1, double a2, double a3, double a4, double a5)
{
  *(void *)&double result = (unint64_t)CGRectInset(*(CGRect *)&a2, 0.0, (float)-*(float *)(*(void *)(*(void *)(a1 + 32) + 8) + 24));
  return result;
}

- (id)outputImage
{
  [(CIImage *)self->inputImage extent];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  id v11 = [(CIPortraitAntialias *)self outputImage:[(CIPortraitAntialias *)self outputImage:[(CIImage *)self->inputImage imageByClampingToExtent] horizontal:1] horizontal:0];
  v14.origin.x = v4;
  v14.origin.y = v6;
  v14.size.width = v8;
  v14.size.height = v10;
  if (CGRectEqualToRect(*MEMORY[0x1E4F1DB10], v14)) {
    return v11;
  }

  return (id)objc_msgSend(v11, "imageByCroppingToRect:", v4, v6, v8, v10);
}

- (CIImage)inputImage
{
  return (CIImage *)objc_getProperty(self, a2, 80, 1);
}

- (void)setInputImage:(id)a3
{
}

- (NSNumber)inputMaxBlurInPixels
{
  return self->inputMaxBlurInPixels;
}

- (void)setInputMaxBlurInPixels:(id)a3
{
}

- (NSNumber)inputAntiAliasRadius
{
  return self->inputAntiAliasRadius;
}

- (void)setInputAntiAliasRadius:(id)a3
{
}

- (NSNumber)inputLumaNoiseAmpl
{
  return self->inputLumaNoiseAmpl;
}

- (void)setInputLumaNoiseAmpl:(id)a3
{
}

- (NSNumber)inputLumaNoiseModelCoeff
{
  return self->inputLumaNoiseModelCoeff;
}

- (void)setInputLumaNoiseModelCoeff:(id)a3
{
}

- (NSNumber)inputScale
{
  return self->inputScale;
}

- (void)setInputScale:(id)a3
{
}

- (CIVector)inputRect
{
  return self->inputRect;
}

- (void)setInputRect:(id)a3
{
}

- (CIVector)inputSensorSize
{
  return self->inputSensorSize;
}

- (void)setInputSensorSize:(id)a3
{
}

@end