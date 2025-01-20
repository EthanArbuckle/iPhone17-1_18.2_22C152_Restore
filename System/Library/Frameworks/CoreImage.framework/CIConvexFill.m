@interface CIConvexFill
- (CIImage)inputCenter;
- (CIVector)inputAreaThresholdLoHi;
- (NSNumber)inputSplat;
- (NSNumber)inputThreshold;
- (id)outputImage;
- (void)setInputAreaThresholdLoHi:(id)a3;
- (void)setInputCenter:(id)a3;
- (void)setInputSplat:(id)a3;
- (void)setInputThreshold:(id)a3;
@end

@implementation CIConvexFill

- (id)outputImage
{
  v17[2] = *MEMORY[0x1E4F143B8];
  double v3 = *MEMORY[0x1E4F1DB10];
  double v4 = *(double *)(MEMORY[0x1E4F1DB10] + 8);
  double v5 = *(double *)(MEMORY[0x1E4F1DB10] + 16);
  double v6 = *(double *)(MEMORY[0x1E4F1DB10] + 24);
  uint64_t v14 = 0;
  inputCenter = self->inputCenter;
  v17[0] = self->inputImage;
  v17[1] = inputCenter;
  uint64_t v8 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v17, 2, 0);
  v16[0] = self->inputThreshold;
  v15[0] = @"kThreshold";
  v15[1] = @"kAreaThresholdLo";
  v9 = NSNumber;
  [(CIVector *)self->inputAreaThresholdLoHi X];
  v16[1] = objc_msgSend(v9, "numberWithDouble:");
  v15[2] = @"kAreaThresholdHi";
  v10 = NSNumber;
  [(CIVector *)self->inputAreaThresholdLoHi Y];
  uint64_t v11 = objc_msgSend(v10, "numberWithDouble:");
  v15[3] = @"kSplatArea";
  inputSplat = self->inputSplat;
  v16[2] = v11;
  v16[3] = inputSplat;
  return +[CIImageProcessorKernel applyWithExtent:inputs:arguments:error:](ConvexFillProcessor, "applyWithExtent:inputs:arguments:error:", v8, [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:4], &v14, v3, v4, v5, v6);
}

- (CIImage)inputCenter
{
  return self->inputCenter;
}

- (void)setInputCenter:(id)a3
{
}

- (NSNumber)inputThreshold
{
  return self->inputThreshold;
}

- (void)setInputThreshold:(id)a3
{
}

- (CIVector)inputAreaThresholdLoHi
{
  return self->inputAreaThresholdLoHi;
}

- (void)setInputAreaThresholdLoHi:(id)a3
{
}

- (NSNumber)inputSplat
{
  return self->inputSplat;
}

- (void)setInputSplat:(id)a3
{
}

@end