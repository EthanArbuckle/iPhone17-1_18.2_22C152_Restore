@interface CIPortraitBlurPreProcess
- (CIImage)inputBlurmapImage;
- (CIImage)inputImage;
- (NSNumber)inputUseMetal;
- (id)_kernel;
- (id)_kernelMetal;
- (id)outputImage;
- (void)setInputBlurmapImage:(id)a3;
- (void)setInputImage:(id)a3;
- (void)setInputUseMetal:(id)a3;
@end

@implementation CIPortraitBlurPreProcess

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_CIBlurPreProcess];
}

- (id)_kernelMetal
{
  if (-[CIPortraitBlurPreProcess _kernelMetal]::onceToken != -1) {
    dispatch_once(&-[CIPortraitBlurPreProcess _kernelMetal]::onceToken, &__block_literal_global_315);
  }
  return (id)-[CIPortraitBlurPreProcess _kernelMetal]::k;
}

id __40__CIPortraitBlurPreProcess__kernelMetal__block_invoke()
{
  id result = +[CIColorKernel SDOFV2MetalKernelNamed:@"_CIBlurPreProcessM"];
  -[CIPortraitBlurPreProcess _kernelMetal]::k = (uint64_t)result;
  return result;
}

- (id)outputImage
{
  v18[2] = *MEMORY[0x1E4F143B8];
  id result = self->inputImage;
  if (result)
  {
    if (self->inputBlurmapImage)
    {
      if ([(NSNumber *)self->inputUseMetal BOOLValue]) {
        id v4 = [(CIPortraitBlurPreProcess *)self _kernelMetal];
      }
      else {
        id v4 = [(CIPortraitBlurPreProcess *)self _kernel];
      }
      id v5 = v4;
      if (!v4) {
        id v5 = [(CIPortraitBlurPreProcess *)self _kernel];
      }
      [(CIImage *)self->inputImage extent];
      double v7 = v6;
      double v9 = v8;
      double v11 = v10;
      double v13 = v12;
      inputBlurmapImage = self->inputBlurmapImage;
      v18[0] = self->inputImage;
      v18[1] = inputBlurmapImage;
      uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
      v16 = @"kCIKernelOutputFormat";
      uint64_t v17 = [NSNumber numberWithInt:264];
      return (id)objc_msgSend(v5, "applyWithExtent:arguments:options:", v15, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1), v7, v9, v11, v13);
    }
  }
  else
  {
    return +[CIImage emptyImage];
  }
  return result;
}

- (CIImage)inputImage
{
  return (CIImage *)objc_getProperty(self, a2, 80, 1);
}

- (void)setInputImage:(id)a3
{
}

- (CIImage)inputBlurmapImage
{
  return (CIImage *)objc_getProperty(self, a2, 88, 1);
}

- (void)setInputBlurmapImage:(id)a3
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