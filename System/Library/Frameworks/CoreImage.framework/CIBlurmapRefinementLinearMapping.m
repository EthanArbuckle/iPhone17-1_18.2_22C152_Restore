@interface CIBlurmapRefinementLinearMapping
- (CIImage)inputImage;
- (CIImage)inputSecondaryImage;
- (NSNumber)inputScalingFactor;
- (id)kernel;
- (id)kernelNoSecondaryImage;
- (id)outputImage;
- (void)setInputImage:(id)a3;
- (void)setInputScalingFactor:(id)a3;
- (void)setInputSecondaryImage:(id)a3;
@end

@implementation CIBlurmapRefinementLinearMapping

- (id)kernelNoSecondaryImage
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_linearMappingNoSecondaryImage];
}

- (id)kernel
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_linearMapping];
}

- (id)outputImage
{
  v24[3] = *MEMORY[0x1E4F143B8];
  id result = +[CIImage emptyImage];
  if (result)
  {
    inputImage = self->inputImage;
    if (self->inputSecondaryImage) {
      id v5 = [(CIBlurmapRefinementLinearMapping *)self kernel];
    }
    else {
      id v5 = [(CIBlurmapRefinementLinearMapping *)self kernelNoSecondaryImage];
    }
    v6 = v5;
    inputSecondaryImage = self->inputSecondaryImage;
    if (inputSecondaryImage)
    {
      v24[0] = inputImage;
      v24[1] = inputSecondaryImage;
      v24[2] = self->inputScalingFactor;
      v8 = (void *)MEMORY[0x1E4F1C978];
      v9 = v24;
      uint64_t v10 = 3;
    }
    else
    {
      inputScalingFactor = self->inputScalingFactor;
      v23[0] = inputImage;
      v23[1] = inputScalingFactor;
      v8 = (void *)MEMORY[0x1E4F1C978];
      v9 = v23;
      uint64_t v10 = 2;
    }
    uint64_t v12 = [v8 arrayWithObjects:v9 count:v10];
    [(CIImage *)inputImage extent];
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    v21[1] = @"kCIImageAlphaOne";
    v22[0] = objc_msgSend(NSNumber, "numberWithInt:", 2053, @"kCIKernelOutputFormat");
    v22[1] = MEMORY[0x1E4F1CC38];
    return (id)objc_msgSend(v6, "applyWithExtent:arguments:options:", v12, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v22, v21, 2), v14, v16, v18, v20);
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

- (CIImage)inputSecondaryImage
{
  return (CIImage *)objc_getProperty(self, a2, 88, 1);
}

- (void)setInputSecondaryImage:(id)a3
{
}

- (NSNumber)inputScalingFactor
{
  return (NSNumber *)objc_getProperty(self, a2, 96, 1);
}

- (void)setInputScalingFactor:(id)a3
{
}

@end