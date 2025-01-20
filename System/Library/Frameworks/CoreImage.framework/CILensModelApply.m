@interface CILensModelApply
- (CIImage)inputImage;
- (CIImage)inputLensModelParams;
- (id)kernel;
- (id)outputImage;
- (void)setInputImage:(id)a3;
- (void)setInputLensModelParams:(id)a3;
@end

@implementation CILensModelApply

- (id)kernel
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_CILensModelApply];
}

- (id)outputImage
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id result = self->inputImage;
  if (result)
  {
    if (self->inputLensModelParams)
    {
      id v4 = [(CILensModelApply *)self kernel];
      [(CIImage *)self->inputImage extent];
      double v6 = v5;
      double v8 = v7;
      double v10 = v9;
      double v12 = v11;
      v13[0] = self->inputImage;
      v13[1] = [(CIImage *)self->inputLensModelParams imageByClampingToExtent];
      return (id)objc_msgSend(v4, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v13, 2), v6, v8, v10, v12);
    }
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

- (CIImage)inputLensModelParams
{
  return self->inputLensModelParams;
}

- (void)setInputLensModelParams:(id)a3
{
}

@end