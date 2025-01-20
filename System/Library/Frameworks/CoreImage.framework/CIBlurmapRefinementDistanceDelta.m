@interface CIBlurmapRefinementDistanceDelta
- (CIImage)inputImage;
- (CIImage)inputSecondaryImage;
- (NSNumber)inputDistance;
- (NSNumber)inputScalingFactor;
- (NSNumber)inputThreshold;
- (id)outputImage;
- (void)setInputDistance:(id)a3;
- (void)setInputImage:(id)a3;
- (void)setInputScalingFactor:(id)a3;
- (void)setInputSecondaryImage:(id)a3;
- (void)setInputThreshold:(id)a3;
@end

@implementation CIBlurmapRefinementDistanceDelta

- (id)outputImage
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id result = +[CIImage emptyImage];
  inputImage = self->inputImage;
  if (inputImage)
  {
    inputThreshold = self->inputThreshold;
    v31 = @"inputThreshold";
    v32[0] = inputThreshold;
    v6 = -[CIImage imageByApplyingFilter:withInputParameters:](inputImage, "imageByApplyingFilter:withInputParameters:", @"CIBlurmapRefinementThreshold", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:&v31 count:1]);
    [(CIImage *)v6 extent];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    v15 = [(CIImage *)v6 imageByClampingToExtent];
    inputDistance = self->inputDistance;
    v29 = @"inputRadius";
    v30 = inputDistance;
    id v17 = -[CIImage _imageByRenderingToIntermediate](-[CIImage imageByCroppingToRect:](-[CIImage imageByApplyingFilter:withInputParameters:](v15, "imageByApplyingFilter:withInputParameters:", @"CIGaussianBlur", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v30 forKeys:&v29 count:1]), "imageByCroppingToRect:", v8, v10, v12, v14), "_imageByRenderingToIntermediate");
    inputSecondaryImage = self->inputSecondaryImage;
    if (inputSecondaryImage)
    {
      v27[0] = @"inputSecondaryImage";
      v27[1] = @"inputScalingFactor";
      inputScalingFactor = self->inputScalingFactor;
      v28[0] = inputSecondaryImage;
      v28[1] = inputScalingFactor;
      v20 = (void *)MEMORY[0x1E4F1C9E8];
      v21 = (NSNumber **)v28;
      v22 = (__CFString **)v27;
      uint64_t v23 = 2;
    }
    else
    {
      v24 = self->inputScalingFactor;
      v25 = @"inputScalingFactor";
      v26 = v24;
      v20 = (void *)MEMORY[0x1E4F1C9E8];
      v21 = &v26;
      v22 = &v25;
      uint64_t v23 = 1;
    }
    return (id)objc_msgSend(v17, "imageByApplyingFilter:withInputParameters:", @"CIBlurmapRefinementLinearMapping", objc_msgSend(v20, "dictionaryWithObjects:forKeys:count:", v21, v22, v23));
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

- (NSNumber)inputThreshold
{
  return (NSNumber *)objc_getProperty(self, a2, 96, 1);
}

- (void)setInputThreshold:(id)a3
{
}

- (NSNumber)inputDistance
{
  return (NSNumber *)objc_getProperty(self, a2, 104, 1);
}

- (void)setInputDistance:(id)a3
{
}

- (NSNumber)inputScalingFactor
{
  return (NSNumber *)objc_getProperty(self, a2, 112, 1);
}

- (void)setInputScalingFactor:(id)a3
{
}

@end