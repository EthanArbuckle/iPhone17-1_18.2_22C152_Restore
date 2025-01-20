@interface CISeedFill
- (CIImage)inputCenter;
- (CIVector)inputExtent;
- (NSNumber)inputSplat;
- (NSNumber)inputThreshold;
- (id)outputImage;
- (void)setInputCenter:(id)a3;
- (void)setInputExtent:(id)a3;
- (void)setInputSplat:(id)a3;
- (void)setInputThreshold:(id)a3;
@end

@implementation CISeedFill

- (id)outputImage
{
  v32[2] = *MEMORY[0x1E4F143B8];
  v3 = -[CIImage imageByCroppingToRect:](self->inputCenter, "imageByCroppingToRect:", 0.0, 0.0, 1.0, 1.0);
  [(CIVector *)self->inputExtent CGRectValue];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  uint64_t v29 = 0;
  inputImage = self->inputImage;
  [(NSNumber *)self->inputSplat floatValue];
  if (v13 > 0.0)
  {
    inputCenter = self->inputCenter;
    [(CIVector *)self->inputExtent CGRectValue];
    CGFloat v16 = v15;
    CGFloat v18 = v17;
    CGFloat v20 = v19;
    CGFloat v22 = v21;
    [(NSNumber *)self->inputSplat floatValue];
    float v24 = v23;
    v33.origin.x = v16;
    v33.origin.y = v18;
    v33.size.width = v20;
    v33.size.height = v22;
    v25 = RRradialCentroidMask(inputCenter, v33, v24, 1.0, 1);
    inputImage = (void *)RRmaximumRh(inputImage, v25);
  }
  v32[0] = inputImage;
  v32[1] = v3;
  uint64_t v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:2];
  inputThreshold = self->inputThreshold;
  v30 = @"kThreshold";
  v31 = inputThreshold;
  return +[CIImageProcessorKernel applyWithExtent:inputs:arguments:error:](CISeedFillProcessor, "applyWithExtent:inputs:arguments:error:", v26, [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v31 forKeys:&v30 count:1], &v29, v5, v7, v9, v11);
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

- (CIVector)inputExtent
{
  return self->inputExtent;
}

- (void)setInputExtent:(id)a3
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