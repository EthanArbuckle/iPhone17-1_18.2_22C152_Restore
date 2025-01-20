@interface RedEyeRecolor
- (CIImage)inputMask;
- (CIImage)inputSource;
- (CIVector)inputExtent;
- (NSNumber)inputBrightness;
- (NSNumber)inputChroma;
- (NSNumber)inputNoiseAmount;
- (NSNumber)inputRecovery;
- (NSNumber)inputWhiteCutoff;
- (id)kernelRecovery;
- (id)kernelRepair;
- (id)outputImage;
- (void)setInputBrightness:(id)a3;
- (void)setInputChroma:(id)a3;
- (void)setInputExtent:(id)a3;
- (void)setInputMask:(id)a3;
- (void)setInputNoiseAmount:(id)a3;
- (void)setInputRecovery:(id)a3;
- (void)setInputSource:(id)a3;
- (void)setInputWhiteCutoff:(id)a3;
@end

@implementation RedEyeRecolor

- (id)kernelRepair
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_drr_repair];
}

- (id)kernelRecovery
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_drr_recovery];
}

- (id)outputImage
{
  v47[1] = *MEMORY[0x1E4F143B8];
  [(CIVector *)self->inputExtent CGRectValue];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  inputSource = self->inputSource;
  inputImage = self->inputImage;
  v46 = @"inputExtent";
  v47[0] = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:");
  uint64_t v13 = -[CIImage imageByClampingToExtent](-[CIImage imageByApplyingFilter:withInputParameters:](inputImage, "imageByApplyingFilter:withInputParameters:", @"CIAreaAverage", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v47 forKeys:&v46 count:1]), "imageByClampingToExtent");
  v14 = self->inputImage;
  if ([(NSNumber *)self->inputRecovery BOOLValue])
  {
    v44 = @"inputExtent";
    v45 = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:", v4, v6, v8, v10);
    uint64_t v15 = -[CIImage imageByClampingToExtent](-[CIImage imageByApplyingFilter:withInputParameters:](inputSource, "imageByApplyingFilter:withInputParameters:", @"CIAreaAverage", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v45 forKeys:&v44 count:1]), "imageByClampingToExtent");
    [(CIImage *)v14 extent];
    CGFloat v17 = v16;
    CGFloat v19 = v18;
    CGFloat v21 = v20;
    CGFloat v23 = v22;
    [(CIImage *)inputSource extent];
    v50.origin.double x = v24;
    v50.origin.double y = v25;
    v50.size.double width = v26;
    v50.size.double height = v27;
    v48.origin.double x = v17;
    v48.origin.double y = v19;
    v48.size.double width = v21;
    v48.size.double height = v23;
    CGRect v49 = CGRectUnion(v48, v50);
    double x = v49.origin.x;
    double y = v49.origin.y;
    double width = v49.size.width;
    double height = v49.size.height;
    id v32 = [(RedEyeRecolor *)self kernelRecovery];
    v43[0] = v14;
    v43[1] = inputSource;
    v43[2] = v13;
    v43[3] = v15;
    v43[4] = self->inputRecovery;
    v14 = (CIImage *)objc_msgSend((id)objc_msgSend(v32, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v43, 5), x, y, width, height), "imageByCroppingToRect:", v4, v6, v8, v10);
  }
  v33 = [+[CIFilter filterWithName:@"CheapRandomness" withInputParameters:&unk_1EE4AB158] outputImage];
  id v34 = [(RedEyeRecolor *)self kernelRepair];
  [(CIImage *)v14 extent];
  v42[0] = v14;
  v42[1] = inputSource;
  v42[2] = self->inputMask;
  v42[3] = v13;
  inputBrightness = self->inputBrightness;
  v42[4] = v33;
  v42[5] = inputBrightness;
  inputWhiteCutoff = self->inputWhiteCutoff;
  v42[6] = self->inputNoiseAmount;
  v42[7] = inputWhiteCutoff;
  v42[8] = self->inputChroma;
  return (id)objc_msgSend(v34, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v42, 9), v37, v38, v39, v40);
}

- (CIImage)inputSource
{
  return self->inputSource;
}

- (void)setInputSource:(id)a3
{
}

- (CIImage)inputMask
{
  return self->inputMask;
}

- (void)setInputMask:(id)a3
{
}

- (NSNumber)inputNoiseAmount
{
  return self->inputNoiseAmount;
}

- (void)setInputNoiseAmount:(id)a3
{
}

- (NSNumber)inputBrightness
{
  return self->inputBrightness;
}

- (void)setInputBrightness:(id)a3
{
}

- (NSNumber)inputRecovery
{
  return self->inputRecovery;
}

- (void)setInputRecovery:(id)a3
{
}

- (CIVector)inputExtent
{
  return self->inputExtent;
}

- (void)setInputExtent:(id)a3
{
}

- (NSNumber)inputWhiteCutoff
{
  return self->inputWhiteCutoff;
}

- (void)setInputWhiteCutoff:(id)a3
{
}

- (NSNumber)inputChroma
{
  return self->inputChroma;
}

- (void)setInputChroma:(id)a3
{
}

@end