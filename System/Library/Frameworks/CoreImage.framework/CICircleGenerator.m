@interface CICircleGenerator
+ (id)customAttributes;
- (id)_CICircle;
- (id)outputImage;
@end

@implementation CICircleGenerator

- (id)_CICircle
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_circle];
}

- (id)outputImage
{
  v19[2] = *MEMORY[0x1E4F143B8];
  [(NSNumber *)self->inputEdgeBlur floatValue];
  float v4 = v3;
  [(NSNumber *)self->inputRadius floatValue];
  float v6 = v5;
  [(CIVector *)self->inputCenter X];
  double v8 = (float)(v4 * 0.5);
  double v9 = v7 - v6 - v8;
  [(CIVector *)self->inputCenter Y];
  double v11 = v10 - v6 - v8;
  [(CIVector *)self->inputCenter X];
  double v13 = v12;
  [(CIVector *)self->inputCenter Y];
  v15 = +[CIVector vectorWithX:v13 Y:v14 Z:v6 W:1.0 / v4];
  id v16 = [(CICircleGenerator *)self _CICircle];
  inputColor = self->inputColor;
  v19[0] = v15;
  v19[1] = inputColor;
  return (id)objc_msgSend(v16, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v19, 2), v9, v11, (float)(v4 + (float)(v6 * 2.0)), (float)(v4 + (float)(v6 * 2.0)));
}

+ (id)customAttributes
{
  v11[4] = *MEMORY[0x1E4F143B8];
  v10[0] = @"CIAttributeFilterCategories";
  v9[0] = @"CICategoryGenerator";
  v9[1] = @"CICategoryVideo";
  v9[2] = @"CICategoryStillImage";
  v9[3] = @"CICategoryHighDynamicRange";
  v9[4] = @"CICategoryBuiltIn";
  v9[5] = @"CICategoryApplePrivate";
  v11[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:6];
  v10[1] = @"inputEdgeBlur";
  v7[0] = @"CIAttributeMin";
  v7[1] = @"CIAttributeSliderMin";
  v8[0] = &unk_1EE4A7F20;
  v8[1] = &unk_1EE4A7F20;
  v7[2] = @"CIAttributeSliderMax";
  v7[3] = @"CIAttributeDefault";
  v8[2] = &unk_1EE4A7F30;
  v8[3] = &unk_1EE4A7F40;
  v7[4] = @"CIAttributeType";
  v8[4] = @"CIAttributeTypeDistance";
  v11[1] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:5];
  v10[2] = @"inputRadius";
  v5[0] = @"CIAttributeMin";
  v5[1] = @"CIAttributeSliderMin";
  v6[0] = &unk_1EE4A7F20;
  v6[1] = &unk_1EE4A7F20;
  v5[2] = @"CIAttributeSliderMax";
  v5[3] = @"CIAttributeDefault";
  v6[2] = &unk_1EE4A7F50;
  v6[3] = &unk_1EE4A7F60;
  v5[4] = @"CIAttributeType";
  v6[4] = @"CIAttributeTypeDistance";
  v11[2] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:5];
  v10[3] = @"inputColor";
  float v3 = @"CIAttributeDefault";
  float v4 = +[CIColor colorWithRed:1.0 green:1.0 blue:1.0];
  v11[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v4 forKeys:&v3 count:1];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:4];
}

@end