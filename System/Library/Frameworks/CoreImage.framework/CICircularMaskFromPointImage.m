@interface CICircularMaskFromPointImage
+ (id)customAttributes;
- (CIImage)inputCoordinate;
- (CIImage)inputImage;
- (NSNumber)inputInnerRadius;
- (NSNumber)inputOuterRadius;
- (id)_kernelDraw;
- (id)outputImage;
- (void)setInputCoordinate:(id)a3;
- (void)setInputImage:(id)a3;
- (void)setInputInnerRadius:(id)a3;
- (void)setInputOuterRadius:(id)a3;
@end

@implementation CICircularMaskFromPointImage

+ (id)customAttributes
{
  v5[3] = *MEMORY[0x1E4F143B8];
  v4[0] = @"CIAttributeFilterCategories";
  v3[0] = @"CICategoryColorEffect";
  v3[1] = @"CICategoryBuiltIn";
  v3[2] = @"CICategoryApplePrivate";
  v5[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:3];
  v5[1] = @"12";
  v4[1] = @"CIAttributeFilterAvailable_iOS";
  v4[2] = @"CIAttributeFilterAvailable_Mac";
  v5[2] = @"10.13";
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:3];
}

- (id)_kernelDraw
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_PSDrawSpread];
}

- (id)outputImage
{
  v20[2] = *MEMORY[0x1E4F143B8];
  if (self->inputCoordinate)
  {
    inputInnerRadius = self->inputInnerRadius;
    if (!inputInnerRadius) {
      inputInnerRadius = (NSNumber *)&unk_1EE4AAEE0;
    }
    self->inputInnerRadius = inputInnerRadius;
    if (self->inputOuterRadius) {
      inputOuterRadius = self->inputOuterRadius;
    }
    else {
      inputOuterRadius = (NSNumber *)&unk_1EE4AAE50;
    }
    self->inputOuterRadius = inputOuterRadius;
    [(NSNumber *)inputOuterRadius floatValue];
    float v6 = v5;
    [(NSNumber *)self->inputInnerRadius floatValue];
    float v8 = v7;
    [(NSNumber *)self->inputInnerRadius floatValue];
    float v10 = v8 * v9;
    id v11 = [(CICircularMaskFromPointImage *)self _kernelDraw];
    double v12 = *MEMORY[0x1E4F1DB10];
    double v13 = *(double *)(MEMORY[0x1E4F1DB10] + 8);
    double v14 = *(double *)(MEMORY[0x1E4F1DB10] + 16);
    double v15 = *(double *)(MEMORY[0x1E4F1DB10] + 24);
    v20[0] = [(CIImage *)self->inputCoordinate imageByClampingToExtent];
    *(float *)&double v16 = v10;
    v20[1] = [NSNumber numberWithFloat:v16];
    v17 = objc_msgSend(v11, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v20, 2), v12, v13, v14, v15);
    [(NSNumber *)self->inputOuterRadius floatValue];
    if (v18 > 0.0001) {
      return (id)[v17 imageByApplyingGaussianBlurWithSigma:(float)(v6 / 3.0)];
    }
    return v17;
  }
  else
  {
    return +[CIImage emptyImage];
  }
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
}

- (CIImage)inputCoordinate
{
  return self->inputCoordinate;
}

- (void)setInputCoordinate:(id)a3
{
}

- (NSNumber)inputInnerRadius
{
  return self->inputInnerRadius;
}

- (void)setInputInnerRadius:(id)a3
{
}

- (NSNumber)inputOuterRadius
{
  return self->inputOuterRadius;
}

- (void)setInputOuterRadius:(id)a3
{
}

@end