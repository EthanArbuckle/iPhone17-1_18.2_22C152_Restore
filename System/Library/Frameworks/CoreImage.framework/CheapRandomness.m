@interface CheapRandomness
- (NSNumber)inputDither;
- (NSNumber)inputScale;
- (id)outputImage;
- (void)setInputDither:(id)a3;
- (void)setInputScale:(id)a3;
@end

@implementation CheapRandomness

- (id)outputImage
{
  v15[2] = *MEMORY[0x1E4F143B8];
  v3 = +[CIKernel kernelWithInternalRepresentation:&CI::_drr_noise];
  double v4 = *MEMORY[0x1E4F1DB10];
  double v5 = *(double *)(MEMORY[0x1E4F1DB10] + 8);
  double v6 = *(double *)(MEMORY[0x1E4F1DB10] + 16);
  double v7 = *(double *)(MEMORY[0x1E4F1DB10] + 24);
  inputScale = self->inputScale;
  v15[0] = self->inputDither;
  v15[1] = inputScale;
  id v9 = -[CIColorKernel applyWithExtent:roiCallback:arguments:](v3, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_20, [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2], v4, v5, v6, v7);
  [(NSNumber *)self->inputScale floatValue];
  if (v10 > 1.0)
  {
    v11 = self->inputScale;
    v13 = @"inputRadius";
    v14 = v11;
    return (id)objc_msgSend(v9, "imageByApplyingFilter:withInputParameters:", @"CIBoxBlur", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1));
  }
  return v9;
}

- (NSNumber)inputDither
{
  return self->inputDither;
}

- (void)setInputDither:(id)a3
{
}

- (NSNumber)inputScale
{
  return self->inputScale;
}

- (void)setInputScale:(id)a3
{
}

@end