@interface CILensModelApplyV3
- (CIImage)inputImage;
- (CIImage)inputLensModelImage;
- (id)kernel;
- (id)outputImage;
- (void)setInputImage:(id)a3;
- (void)setInputLensModelImage:(id)a3;
@end

@implementation CILensModelApplyV3

- (id)kernel
{
  if (-[CILensModelApplyV3 kernel]::onceToken != -1) {
    dispatch_once(&-[CILensModelApplyV3 kernel]::onceToken, &__block_literal_global_160);
  }
  return (id)-[CILensModelApplyV3 kernel]::k;
}

id __28__CILensModelApplyV3_kernel__block_invoke()
{
  id result = +[CIColorKernel SDOFV3MetalKernelNamed:@"disparity_refinement_slm_passthrough"];
  -[CILensModelApplyV3 kernel]::k = (uint64_t)result;
  return result;
}

- (id)outputImage
{
  v18[2] = *MEMORY[0x1E4F143B8];
  v3 = [(CIImage *)self->inputLensModelImage imageByClampingToExtent];
  id v4 = [(CILensModelApplyV3 *)self kernel];
  [(CIImage *)self->inputImage extent];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  inputImage = self->inputImage;
  v18[0] = v3;
  v18[1] = inputImage;
  uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
  v16 = @"kCIKernelOutputFormat";
  uint64_t v17 = [NSNumber numberWithInt:2053];
  return (id)objc_msgSend(v4, "applyWithExtent:arguments:options:", v14, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1), v6, v8, v10, v12);
}

- (CIImage)inputImage
{
  return (CIImage *)objc_getProperty(self, a2, 80, 1);
}

- (void)setInputImage:(id)a3
{
}

- (CIImage)inputLensModelImage
{
  return (CIImage *)objc_getProperty(self, a2, 88, 1);
}

- (void)setInputLensModelImage:(id)a3
{
}

@end