@interface CIRoundedRectangleStrokeGenerator
+ (id)customAttributes;
- (CIColor)inputColor;
- (CIVector)inputExtent;
- (NSNumber)inputRadius;
- (NSNumber)inputWidth;
- (id)outputImage;
- (void)setInputColor:(id)a3;
- (void)setInputExtent:(id)a3;
- (void)setInputRadius:(id)a3;
- (void)setInputWidth:(id)a3;
@end

@implementation CIRoundedRectangleStrokeGenerator

+ (id)customAttributes
{
  v13[7] = *MEMORY[0x1E4F143B8];
  v12[0] = @"CIAttributeFilterCategories";
  v11[0] = @"CICategoryGenerator";
  v11[1] = @"CICategoryStillImage";
  v11[2] = @"CICategoryHighDynamicRange";
  v11[3] = @"CICategoryBuiltIn";
  v13[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:4];
  v13[1] = @"17";
  v12[1] = @"CIAttributeFilterAvailable_iOS";
  v12[2] = @"CIAttributeFilterAvailable_Mac";
  v13[2] = @"14.0";
  v12[3] = @"inputExtent";
  v9[0] = @"CIAttributeDefault";
  v9[1] = @"CIAttributeType";
  v10[0] = +[CIVector vectorWithX:0.0 Y:0.0 Z:100.0 W:100.0];
  v10[1] = @"CIAttributeTypeRectangle";
  v13[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  v12[4] = @"inputRadius";
  v7[0] = @"CIAttributeMin";
  v7[1] = @"CIAttributeSliderMin";
  v8[0] = &unk_1EE4A9960;
  v8[1] = &unk_1EE4A9960;
  v7[2] = @"CIAttributeSliderMax";
  v7[3] = @"CIAttributeDefault";
  v8[2] = &unk_1EE4A9970;
  v8[3] = &unk_1EE4AAE38;
  v7[4] = @"CIAttributeType";
  v8[4] = @"CIAttributeTypeDistance";
  v13[4] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:5];
  v12[5] = @"inputColor";
  v5[0] = @"CIAttributeDefault";
  v5[1] = @"CIAttributeType";
  v6[0] = +[CIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
  v6[1] = @"CIAttributeTypeColor";
  v13[5] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:2];
  v12[6] = @"inputWidth";
  v3[0] = @"CIAttributeMin";
  v3[1] = @"CIAttributeSliderMin";
  v4[0] = &unk_1EE4A9960;
  v4[1] = &unk_1EE4A9960;
  v3[2] = @"CIAttributeSliderMax";
  v3[3] = @"CIAttributeDefault";
  v4[2] = &unk_1EE4A9970;
  v4[3] = &unk_1EE4AAE38;
  v3[4] = @"CIAttributeType";
  v4[4] = @"CIAttributeTypeDistance";
  v13[6] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:5];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:7];
}

- (id)outputImage
{
  v31[3] = *MEMORY[0x1E4F143B8];
  [(CIVector *)self->inputExtent CGRectValue];
  double x = v33.origin.x;
  double y = v33.origin.y;
  double width = v33.size.width;
  double height = v33.size.height;
  if (CGRectIsEmpty(v33) || ([(CIColor *)self->inputColor alpha], v7 == 0.0))
  {
LABEL_3:
    return +[CIImage emptyImage];
  }
  v34.origin.double x = x;
  v34.origin.double y = y;
  v34.size.double width = width;
  v34.size.double height = height;
  if (CGRectIsInfinite(v34))
  {
    inputColor = self->inputColor;
    return +[CIImage imageWithColor:inputColor];
  }
  else
  {
    [(NSNumber *)self->inputWidth floatValue];
    float v11 = fmaxf(v10, 0.0);
    double v12 = v11;
    if (v11 < 0.01) {
      goto LABEL_3;
    }
    [(NSNumber *)self->inputRadius floatValue];
    float v14 = width * 0.5;
    float v15 = height * 0.5;
    float v16 = fminf(fminf(fmaxf(v13, 0.0), v14), v15);
    if (v16 >= 0.01 || (width * 0.5 > v12 ? (BOOL v17 = height * 0.5 > v12) : (BOOL v17 = 0), v17))
    {
      v19 = +[CIKernel kernelWithInternalRepresentation:&CI::_roundedstroke];
      v20 = +[CIKernel kernelWithInternalRepresentation:&CI::_rectstroke];
      v21 = +[CIVector vectorWithX:x Y:y Z:x + width W:y + height];
      if (v16 <= 0.5)
      {
        v31[0] = v21;
        *(float *)&double v22 = v11;
        uint64_t v28 = [NSNumber numberWithFloat:v22];
        v29 = self->inputColor;
        v31[1] = v28;
        v31[2] = v29;
        uint64_t v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:3];
        v27 = v20;
      }
      else
      {
        *(float *)&double v22 = v16;
        v30[1] = objc_msgSend(NSNumber, "numberWithFloat:", v22, v21);
        *(float *)&double v23 = v11;
        uint64_t v24 = [NSNumber numberWithFloat:v23];
        v25 = self->inputColor;
        v30[2] = v24;
        v30[3] = v25;
        uint64_t v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:4];
        v27 = v19;
      }
      return -[CIColorKernel applyWithExtent:arguments:](v27, "applyWithExtent:arguments:", v26, x, y, width, height);
    }
    else
    {
      v18 = +[CIImage imageWithColor:self->inputColor];
      return -[CIImage imageByCroppingToRect:](v18, "imageByCroppingToRect:", x, y, width, height);
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

- (NSNumber)inputRadius
{
  return self->inputRadius;
}

- (void)setInputRadius:(id)a3
{
}

- (CIColor)inputColor
{
  return self->inputColor;
}

- (void)setInputColor:(id)a3
{
}

- (NSNumber)inputWidth
{
  return self->inputWidth;
}

- (void)setInputWidth:(id)a3
{
}

@end