@interface RedEyeSpecular
- (CIImage)inputImage;
- (CIImage)inputSource;
- (CIImage)inputSpecularMask;
- (NSNumber)inputDebugFlag;
- (NSNumber)inputSpecIntensity;
- (NSNumber)inputSpecularThreshold;
- (id)outputImage;
- (void)setInputDebugFlag:(id)a3;
- (void)setInputImage:(id)a3;
- (void)setInputSource:(id)a3;
- (void)setInputSpecIntensity:(id)a3;
- (void)setInputSpecularMask:(id)a3;
- (void)setInputSpecularThreshold:(id)a3;
@end

@implementation RedEyeSpecular

- (id)outputImage
{
  v13[6] = *MEMORY[0x1E4F143B8];
  v3 = +[CIKernel kernelWithInternalRepresentation:&CI::_drr_spec];
  v4 = +[CIKernel kernelWithInternalRepresentation:&CI::_drr_spec_debug];
  if ([(NSNumber *)self->inputDebugFlag intValue] > 0) {
    v3 = v4;
  }
  [(CIImage *)self->inputImage extent];
  inputSource = self->inputSource;
  v13[0] = self->inputImage;
  v13[1] = inputSource;
  inputSpecIntensity = self->inputSpecIntensity;
  v13[2] = self->inputSpecularMask;
  v13[3] = inputSpecIntensity;
  inputDebugFlag = self->inputDebugFlag;
  v13[4] = self->inputSpecularThreshold;
  v13[5] = inputDebugFlag;
  return -[CIColorKernel applyWithExtent:arguments:](v3, "applyWithExtent:arguments:", [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:6], v8, v9, v10, v11);
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
}

- (CIImage)inputSource
{
  return self->inputSource;
}

- (void)setInputSource:(id)a3
{
}

- (CIImage)inputSpecularMask
{
  return self->inputSpecularMask;
}

- (void)setInputSpecularMask:(id)a3
{
}

- (NSNumber)inputSpecularThreshold
{
  return self->inputSpecularThreshold;
}

- (void)setInputSpecularThreshold:(id)a3
{
}

- (NSNumber)inputSpecIntensity
{
  return self->inputSpecIntensity;
}

- (void)setInputSpecIntensity:(id)a3
{
}

- (NSNumber)inputDebugFlag
{
  return self->inputDebugFlag;
}

- (void)setInputDebugFlag:(id)a3
{
}

@end