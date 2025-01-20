@interface CIBlurredRectangleGenerator
+ (id)customAttributes;
- (CIColor)inputColor;
- (CIVector)inputExtent;
- (NSNumber)inputSigma;
- (id)outputImage;
- (void)setInputColor:(id)a3;
- (void)setInputExtent:(id)a3;
- (void)setInputSigma:(id)a3;
@end

@implementation CIBlurredRectangleGenerator

+ (id)customAttributes
{
  v11[6] = *MEMORY[0x1E4F143B8];
  v10[0] = @"CIAttributeFilterCategories";
  v9[0] = @"CICategoryGenerator";
  v9[1] = @"CICategoryStillImage";
  v9[2] = @"CICategoryHighDynamicRange";
  v9[3] = @"CICategoryBuiltIn";
  v11[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:4];
  v11[1] = @"17";
  v10[1] = @"CIAttributeFilterAvailable_iOS";
  v10[2] = @"CIAttributeFilterAvailable_Mac";
  v11[2] = @"14.0";
  v10[3] = @"inputExtent";
  v7[0] = @"CIAttributeDefault";
  v7[1] = @"CIAttributeType";
  v8[0] = +[CIVector vectorWithX:0.0 Y:0.0 Z:100.0 W:100.0];
  v8[1] = @"CIAttributeTypeRectangle";
  v11[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];
  v10[4] = @"inputSigma";
  v5[0] = @"CIAttributeMin";
  v5[1] = @"CIAttributeSliderMin";
  v6[0] = &unk_1EE4A9960;
  v6[1] = &unk_1EE4A9960;
  v5[2] = @"CIAttributeSliderMax";
  v5[3] = @"CIAttributeDefault";
  v6[2] = &unk_1EE4A9970;
  v6[3] = &unk_1EE4AAE38;
  v5[4] = @"CIAttributeType";
  v6[4] = @"CIAttributeTypeDistance";
  v11[4] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:5];
  v10[5] = @"inputColor";
  v3[0] = @"CIAttributeDefault";
  v3[1] = @"CIAttributeType";
  v4[0] = +[CIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
  v4[1] = @"CIAttributeTypeColor";
  v11[5] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:2];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:6];
}

- (id)outputImage
{
  v21[3] = *MEMORY[0x1E4F143B8];
  [(CIVector *)self->inputExtent CGRectValue];
  double x = v23.origin.x;
  double y = v23.origin.y;
  double width = v23.size.width;
  double height = v23.size.height;
  if (CGRectIsEmpty(v23) || ([(CIColor *)self->inputColor alpha], v7 == 0.0))
  {
    return +[CIImage emptyImage];
  }
  else
  {
    v24.origin.double x = x;
    v24.origin.double y = y;
    v24.size.double width = width;
    v24.size.double height = height;
    if (CGRectIsInfinite(v24))
    {
      inputColor = self->inputColor;
      return +[CIImage imageWithColor:inputColor];
    }
    else
    {
      [(NSNumber *)self->inputSigma floatValue];
      float v11 = fmaxf(v10, 0.0);
      if (v11 >= 0.01)
      {
        v13 = +[CIKernel kernelWithInternalRepresentation:&CI::_blurredrect];
        v14 = +[CIVector vectorWithX:x Y:y Z:x + width W:y + height];
        v25.origin.double x = x;
        v25.origin.double y = y;
        v25.size.double width = width;
        v25.size.double height = height;
        CGRect v26 = CGRectInset(v25, v11 * -3.0, v11 * -3.0);
        double v15 = v26.origin.x;
        double v16 = v26.origin.y;
        double v17 = v26.size.width;
        double v18 = v26.size.height;
        *(float *)&v26.origin.double x = v11;
        uint64_t v19 = objc_msgSend(NSNumber, "numberWithFloat:", v26.origin.x, v14);
        v20 = self->inputColor;
        v21[1] = v19;
        v21[2] = v20;
        return -[CIColorKernel applyWithExtent:arguments:](v13, "applyWithExtent:arguments:", [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:3], v15, v16, v17, v18);
      }
      else
      {
        v12 = +[CIImage imageWithColor:self->inputColor];
        return -[CIImage imageByCroppingToRect:](v12, "imageByCroppingToRect:", x, y, width, height);
      }
    }
  }
}

- (CIVector)inputExtent
{
  return self->inputExtent;
}

- (void)setInputExtent:(id)a3
{
}

- (NSNumber)inputSigma
{
  return self->inputSigma;
}

- (void)setInputSigma:(id)a3
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