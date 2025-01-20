@interface CIPortraitBlurDirectionalBlur
- (CIImage)inputImage;
- (NSNumber)inputAntiAliasBlurStrength;
- (NSNumber)inputHorizontalBlur;
- (NSNumber)inputMaxBlur;
- (NSNumber)inputUseMetal;
- (id)_kernel;
- (id)_kernelMetal;
- (id)outputImage;
- (void)setInputAntiAliasBlurStrength:(id)a3;
- (void)setInputHorizontalBlur:(id)a3;
- (void)setInputImage:(id)a3;
- (void)setInputMaxBlur:(id)a3;
- (void)setInputUseMetal:(id)a3;
@end

@implementation CIPortraitBlurDirectionalBlur

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_CIPortraitBlurDir];
}

- (id)_kernelMetal
{
  if (-[CIPortraitBlurDirectionalBlur _kernelMetal]::onceToken != -1) {
    dispatch_once(&-[CIPortraitBlurDirectionalBlur _kernelMetal]::onceToken, &__block_literal_global_110);
  }
  return (id)-[CIPortraitBlurDirectionalBlur _kernelMetal]::k;
}

id __45__CIPortraitBlurDirectionalBlur__kernelMetal__block_invoke()
{
  id result = +[CIKernel SDOFV2MetalKernelNamed:@"_CIPortraitBlurDirM"];
  -[CIPortraitBlurDirectionalBlur _kernelMetal]::k = (uint64_t)result;
  return result;
}

- (id)outputImage
{
  v30[1] = *MEMORY[0x1E4F143B8];
  if (self->inputImage)
  {
    uint64_t v22 = 0;
    v23 = &v22;
    uint64_t v24 = 0x2020000000;
    BOOL v25 = 0;
    BOOL v25 = [(NSNumber *)self->inputHorizontalBlur BOOLValue];
    if ([(NSNumber *)self->inputUseMetal BOOLValue]) {
      id v3 = [(CIPortraitBlurDirectionalBlur *)self _kernelMetal];
    }
    else {
      id v3 = [(CIPortraitBlurDirectionalBlur *)self _kernel];
    }
    id v5 = v3;
    if (!v3) {
      id v5 = [(CIPortraitBlurDirectionalBlur *)self _kernel];
    }
    inputImage = self->inputImage;
    v29 = @"wrap_mode";
    v30[0] = @"clamp";
    v7 = +[CISampler samplerWithImage:options:](CISampler, "samplerWithImage:options:", inputImage, [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:&v29 count:1]);
    [(NSNumber *)self->inputAntiAliasBlurStrength floatValue];
    float v9 = v8;
    [(NSNumber *)self->inputMaxBlur floatValue];
    double v11 = (float)(v9 * v10);
    double v12 = 1.0;
    if (*((unsigned char *)v23 + 24)) {
      double v13 = 1.0;
    }
    else {
      double v13 = 0.0;
    }
    if (*((unsigned char *)v23 + 24)) {
      double v12 = 0.0;
    }
    v14 = +[CIVector vectorWithX:v11 Y:v13 Z:v12];
    double v15 = *MEMORY[0x1E4F1DB10];
    double v16 = *(double *)(MEMORY[0x1E4F1DB10] + 8);
    double v17 = *(double *)(MEMORY[0x1E4F1DB10] + 16);
    double v18 = *(double *)(MEMORY[0x1E4F1DB10] + 24);
    v28[0] = v7;
    v28[1] = v14;
    uint64_t v19 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v28, 2, MEMORY[0x1E4F143A8], 3221225472, __44__CIPortraitBlurDirectionalBlur_outputImage__block_invoke, &unk_1E5771720, &v22);
    v26 = @"kCIKernelOutputFormat";
    uint64_t v27 = [NSNumber numberWithInt:264];
    v20 = objc_msgSend(v5, "applyWithExtent:roiCallback:arguments:options:", &v21, v19, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1), v15, v16, v17, v18);
    _Block_object_dispose(&v22, 8);
    return v20;
  }
  else
  {
    return +[CIImage emptyImage];
  }
}

double __44__CIPortraitBlurDirectionalBlur_outputImage__block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  double v5 = -3.0;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    double v6 = -3.0;
  }
  else {
    double v6 = 0.0;
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    double v5 = 0.0;
  }
  *(void *)&double result = (unint64_t)CGRectInset(*(CGRect *)&a2, v6, v5);
  return result;
}

- (CIImage)inputImage
{
  return (CIImage *)objc_getProperty(self, a2, 80, 1);
}

- (void)setInputImage:(id)a3
{
}

- (NSNumber)inputHorizontalBlur
{
  return self->inputHorizontalBlur;
}

- (void)setInputHorizontalBlur:(id)a3
{
}

- (NSNumber)inputMaxBlur
{
  return self->inputMaxBlur;
}

- (void)setInputMaxBlur:(id)a3
{
}

- (NSNumber)inputAntiAliasBlurStrength
{
  return self->inputAntiAliasBlurStrength;
}

- (void)setInputAntiAliasBlurStrength:(id)a3
{
}

- (NSNumber)inputUseMetal
{
  return self->inputUseMetal;
}

- (void)setInputUseMetal:(id)a3
{
}

@end