@interface CIWhitePointAdjust
+ (id)customAttributes;
- (BOOL)_isIdentity;
- (CIColor)inputColor;
- (CIImage)inputImage;
- (id)_kernel;
- (id)outputImage;
- (void)setInputColor:(id)a3;
- (void)setInputImage:(id)a3;
@end

@implementation CIWhitePointAdjust

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_whitepointadjust];
}

- (BOOL)_isIdentity
{
  [(CIColor *)self->inputColor red];
  if (fabs(v3 + -1.0) >= 0.0001) {
    return 0;
  }
  [(CIColor *)self->inputColor green];
  if (fabs(v4 + -1.0) >= 0.0001) {
    return 0;
  }
  [(CIColor *)self->inputColor blue];
  if (fabs(v5 + -1.0) >= 0.0001) {
    return 0;
  }
  [(CIColor *)self->inputColor alpha];
  return fabs(v6 + -1.0) < 0.0001;
}

- (id)outputImage
{
  v11[2] = *MEMORY[0x1E4F143B8];
  if (!self->inputImage || !self->inputColor) {
    return 0;
  }
  if ([(CIWhitePointAdjust *)self _isIdentity])
  {
    double v3 = self->inputImage;
    return v3;
  }
  else
  {
    id v5 = [(CIWhitePointAdjust *)self _kernel];
    [(CIImage *)self->inputImage extent];
    inputColor = self->inputColor;
    v11[0] = self->inputImage;
    v11[1] = inputColor;
    return (id)objc_msgSend(v5, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v11, 2), v7, v8, v9, v10);
  }
}

+ (id)customAttributes
{
  v7[4] = *MEMORY[0x1E4F143B8];
  v6[0] = @"CIAttributeFilterCategories";
  v5[0] = @"CICategoryColorAdjustment";
  v5[1] = @"CICategoryVideo";
  v5[2] = @"CICategoryStillImage";
  v5[3] = @"CICategoryInterlaced";
  v5[4] = @"CICategoryNonSquarePixels";
  v5[5] = @"CICategoryHighDynamicRange";
  v5[6] = @"CICategoryBuiltIn";
  v7[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:7];
  v7[1] = @"5";
  v6[1] = @"CIAttributeFilterAvailable_iOS";
  v6[2] = @"CIAttributeFilterAvailable_Mac";
  v7[2] = @"10.4";
  v6[3] = @"inputColor";
  v4[0] = +[CIColor colorWithRed:1.0, 1.0, 1.0, @"CIAttributeIdentity" green blue];
  v3[1] = @"CIAttributeDefault";
  v3[2] = @"CIAttributeType";
  v4[1] = +[CIColor colorWithRed:1.0 green:1.0 blue:1.0];
  v4[2] = @"CIAttributeTypeColor";
  v7[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:3];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:4];
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
}

- (CIColor)inputColor
{
  return self->inputColor;
}

- (void)setInputColor:(id)a3
{
}

@end