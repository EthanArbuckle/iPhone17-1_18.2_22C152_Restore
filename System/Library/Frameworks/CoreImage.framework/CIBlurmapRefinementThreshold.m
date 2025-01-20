@interface CIBlurmapRefinementThreshold
- (CIImage)inputImage;
- (NSNumber)inputThreshold;
- (id)kernel;
- (id)outputImage;
- (void)setInputImage:(id)a3;
- (void)setInputThreshold:(id)a3;
@end

@implementation CIBlurmapRefinementThreshold

- (id)kernel
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_thresholdRed];
}

- (id)outputImage
{
  v20[2] = *MEMORY[0x1E4F143B8];
  v3 = +[CIImage emptyImage];
  if (self->inputImage)
  {
    id v4 = [(CIBlurmapRefinementThreshold *)self kernel];
    if (v4)
    {
      v5 = v4;
      inputImage = self->inputImage;
      [(CIImage *)inputImage extent];
      double v8 = v7;
      double v10 = v9;
      double v12 = v11;
      double v14 = v13;
      inputThreshold = self->inputThreshold;
      v20[0] = inputImage;
      v20[1] = inputThreshold;
      uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
      v18[0] = @"kCIKernelOutputFormat";
      v18[1] = @"kCIImageAlphaOne";
      v19[0] = [NSNumber numberWithInt:2053];
      v19[1] = MEMORY[0x1E4F1CC38];
      return (id)objc_msgSend(v5, "applyWithExtent:arguments:options:", v16, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v19, v18, 2), v8, v10, v12, v14);
    }
  }
  return v3;
}

- (CIImage)inputImage
{
  return (CIImage *)objc_getProperty(self, a2, 80, 1);
}

- (void)setInputImage:(id)a3
{
}

- (NSNumber)inputThreshold
{
  return (NSNumber *)objc_getProperty(self, a2, 88, 1);
}

- (void)setInputThreshold:(id)a3
{
}

@end