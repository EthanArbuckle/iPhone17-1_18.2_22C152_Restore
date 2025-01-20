@interface CUIInnerGlowOrShadowFilter
+ (id)customAttributes;
- (CIColor)inputColor;
- (CIImage)inputImage;
- (CIVector)inputOffset;
- (NSNumber)inputRadius;
- (NSNumber)inputRange;
- (id)_kernel;
- (id)outputImage;
- (void)setInputColor:(id)a3;
- (void)setInputImage:(id)a3;
- (void)setInputOffset:(id)a3;
- (void)setInputRadius:(id)a3;
- (void)setInputRange:(id)a3;
@end

@implementation CUIInnerGlowOrShadowFilter

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_innerGorS];
}

+ (id)customAttributes
{
  v12[4] = *MEMORY[0x1E4F143B8];
  v11[0] = @"inputOffset";
  v9[0] = @"CIAttributeDefault";
  v9[1] = @"CIAttributeType";
  v10[0] = +[CIVector vectorWithX:0.0 Y:0.0];
  v10[1] = @"CIAttributeTypeOffset";
  v12[0] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  v11[1] = @"inputRange";
  v7[0] = @"CIAttributeMin";
  v7[1] = @"CIAttributeSliderMin";
  v8[0] = &unk_1EE4AA2F0;
  v8[1] = &unk_1EE4AA2F0;
  v7[2] = @"CIAttributeSliderMax";
  v7[3] = @"CIAttributeMax";
  v8[2] = &unk_1EE4AA320;
  v8[3] = &unk_1EE4AA320;
  v7[4] = @"CIAttributeDefault";
  v7[5] = @"CIAttributeType";
  v8[4] = &unk_1EE4AA320;
  v8[5] = @"CIAttributeTypeScalar";
  v12[1] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:6];
  v11[2] = @"inputRadius";
  v5[0] = @"CIAttributeMin";
  v5[1] = @"CIAttributeSliderMin";
  v6[0] = &unk_1EE4AA2F0;
  v6[1] = &unk_1EE4AA2F0;
  v5[2] = @"CIAttributeSliderMax";
  v5[3] = @"CIAttributeMax";
  v6[2] = &unk_1EE4AA300;
  v6[3] = &unk_1EE4AA330;
  v5[4] = @"CIAttributeDefault";
  v5[5] = @"CIAttributeType";
  v6[4] = &unk_1EE4AA340;
  v6[5] = @"CIAttributeTypeScalar";
  v12[2] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:6];
  v11[3] = @"inputColor";
  v3[0] = @"CIAttributeDefault";
  v3[1] = @"CIAttributeType";
  v4[0] = +[CIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.0];
  v4[1] = @"CIAttributeTypeColor";
  v12[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:2];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:4];
}

- (id)outputImage
{
  v29[3] = *MEMORY[0x1E4F143B8];
  [(NSNumber *)self->inputRange doubleValue];
  double v4 = v3;
  [(NSNumber *)self->inputRadius doubleValue];
  if (!self->inputImage) {
    return 0;
  }
  double v6 = fmin(fmax(v5, 0.0), 50.0);
  if (v6 <= 0.0)
  {
    [(CIVector *)self->inputOffset Y];
    if (fabs(v7) < 0.5) {
      return 0;
    }
  }
  [(CIColor *)self->inputColor alpha];
  if (v8 <= 0.0) {
    return 0;
  }
  double v9 = fmin(fmax(v4, 0.01), 1.0);
  float v10 = v6;
  v11 = _CUIMappedBlurImageWithSize(self->inputImage, vcvtms_u32_f32(v10 / 2.853), 0);
  [(CIVector *)self->inputOffset X];
  if (v12 != 0.0 || ([(CIVector *)self->inputOffset Y], v13 != 0.0))
  {
    [(CIVector *)self->inputOffset X];
    CGFloat v15 = v14;
    [(CIVector *)self->inputOffset Y];
    CGAffineTransformMakeTranslation(&v28, v15, v16);
    v11 = [(CIImage *)v11 imageByApplyingTransform:&v28];
  }
  id v17 = [(CUIInnerGlowOrShadowFilter *)self _kernel];
  [(CIImage *)v11 extent];
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  inputColor = self->inputColor;
  v29[0] = v11;
  v29[1] = inputColor;
  v29[2] = [NSNumber numberWithDouble:v9];
  return (id)objc_msgSend(v17, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v29, 3), v19, v21, v23, v25);
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
}

- (CIVector)inputOffset
{
  return self->inputOffset;
}

- (void)setInputOffset:(id)a3
{
}

- (NSNumber)inputRange
{
  return self->inputRange;
}

- (void)setInputRange:(id)a3
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

@end