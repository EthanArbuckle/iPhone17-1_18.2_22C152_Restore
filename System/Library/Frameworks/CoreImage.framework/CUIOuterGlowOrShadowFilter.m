@interface CUIOuterGlowOrShadowFilter
+ (id)customAttributes;
- (CIColor)inputColor;
- (CIImage)inputImage;
- (CIVector)inputOffset;
- (NSNumber)inputRadius;
- (NSNumber)inputRange;
- (NSNumber)inputSize;
- (NSNumber)inputSpread;
- (id)_kernel;
- (id)outputImage;
- (void)setInputColor:(id)a3;
- (void)setInputImage:(id)a3;
- (void)setInputOffset:(id)a3;
- (void)setInputRadius:(id)a3;
- (void)setInputRange:(id)a3;
- (void)setInputSize:(id)a3;
- (void)setInputSpread:(id)a3;
@end

@implementation CUIOuterGlowOrShadowFilter

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_outerGorS];
}

+ (id)customAttributes
{
  v16[6] = *MEMORY[0x1E4F143B8];
  v15[0] = @"inputOffset";
  v13[0] = @"CIAttributeDefault";
  v13[1] = @"CIAttributeType";
  v14[0] = +[CIVector vectorWithX:0.0 Y:0.0];
  v14[1] = @"CIAttributeTypeOffset";
  v16[0] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
  v15[1] = @"inputRange";
  v11[0] = @"CIAttributeMin";
  v11[1] = @"CIAttributeSliderMin";
  v12[0] = &unk_1EE4AA2F0;
  v12[1] = &unk_1EE4AA2F0;
  v11[2] = @"CIAttributeSliderMax";
  v11[3] = @"CIAttributeMax";
  v12[2] = &unk_1EE4AA320;
  v12[3] = &unk_1EE4AA320;
  v11[4] = @"CIAttributeDefault";
  v11[5] = @"CIAttributeType";
  v12[4] = &unk_1EE4AA320;
  v12[5] = @"CIAttributeTypeScalar";
  v16[1] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:6];
  v15[2] = @"inputRadius";
  v9[0] = @"CIAttributeMin";
  v9[1] = @"CIAttributeSliderMin";
  v10[0] = &unk_1EE4AA2F0;
  v10[1] = &unk_1EE4AA2F0;
  v9[2] = @"CIAttributeSliderMax";
  v9[3] = @"CIAttributeMax";
  v10[2] = &unk_1EE4AA300;
  v10[3] = &unk_1EE4AA330;
  v9[4] = @"CIAttributeDefault";
  v9[5] = @"CIAttributeType";
  v10[4] = &unk_1EE4AA340;
  v10[5] = @"CIAttributeTypeScalar";
  v16[2] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:6];
  v15[3] = @"inputSize";
  v7[0] = @"CIAttributeMin";
  v7[1] = @"CIAttributeSliderMin";
  v8[0] = &unk_1EE4AA2F0;
  v8[1] = &unk_1EE4AA2F0;
  v7[2] = @"CIAttributeSliderMax";
  v7[3] = @"CIAttributeMax";
  v8[2] = &unk_1EE4AA300;
  v8[3] = &unk_1EE4AA330;
  v7[4] = @"CIAttributeDefault";
  v7[5] = @"CIAttributeType";
  v8[4] = &unk_1EE4AA340;
  v8[5] = @"CIAttributeTypeScalar";
  v16[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:6];
  v15[4] = @"inputSpread";
  v5[0] = @"CIAttributeMin";
  v5[1] = @"CIAttributeSliderMin";
  v6[0] = &unk_1EE4AA2F0;
  v6[1] = &unk_1EE4AA2F0;
  v5[2] = @"CIAttributeSliderMax";
  v5[3] = @"CIAttributeMax";
  v6[2] = &unk_1EE4AA310;
  v6[3] = &unk_1EE4AA310;
  v5[4] = @"CIAttributeDefault";
  v5[5] = @"CIAttributeType";
  v6[4] = &unk_1EE4AA2F0;
  v6[5] = @"CIAttributeTypeScalar";
  v16[4] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:6];
  v15[5] = @"inputColor";
  v3[1] = @"CIAttributeType";
  v4[0] = +[CIColor colorWithRed:0.0, 0.0, 0.0, 0.0, @"CIAttributeDefault" green blue alpha];
  v4[1] = @"CIAttributeTypeColor";
  v16[5] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:2];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:6];
}

- (id)outputImage
{
  v44[3] = *MEMORY[0x1E4F143B8];
  [(NSNumber *)self->inputRange doubleValue];
  double v4 = v3;
  [(NSNumber *)self->inputRadius doubleValue];
  double v6 = v5;
  if ([(NSNumber *)self->inputSize unsignedIntValue] > 0x31) {
    unsigned int v7 = 50;
  }
  else {
    unsigned int v7 = [(NSNumber *)self->inputSize unsignedIntValue];
  }
  if ([(NSNumber *)self->inputSpread unsignedIntValue] > 0x63) {
    unsigned int v8 = 100;
  }
  else {
    unsigned int v8 = [(NSNumber *)self->inputSpread unsignedIntValue];
  }
  if (!self->inputImage) {
    return 0;
  }
  double v9 = fmin(fmax(v6, 0.0), 50.0);
  if (v9 <= 0.0 || v7 == 0)
  {
    [(CIVector *)self->inputOffset Y];
    if (fabs(v11) < 0.5) {
      return 0;
    }
  }
  [(CIColor *)self->inputColor alpha];
  if (v12 <= 0.0) {
    return 0;
  }
  inputSize = self->inputSize;
  unsigned int v14 = vcvtmd_u64_f64(v9 * 2.85299993);
  double v15 = fmin(fmax(v4, 0.01), 1.0);
  if (inputSize) {
    unsigned int v16 = v8;
  }
  else {
    unsigned int v16 = 0;
  }
  if (inputSize) {
    unsigned int v17 = v7;
  }
  else {
    unsigned int v17 = v14;
  }
  v18 = _CUIMappedBlurImageWithSize(self->inputImage, v17, v16);
  [(CIVector *)self->inputOffset X];
  if (v19 != 0.0 || ([(CIVector *)self->inputOffset Y], v20 != 0.0))
  {
    [(CIVector *)self->inputOffset X];
    CGFloat v22 = v21;
    [(CIVector *)self->inputOffset Y];
    CGAffineTransformMakeTranslation(&v43, v22, v23);
    v18 = [(CIImage *)v18 imageByApplyingTransform:&v43];
  }
  id v24 = [(CUIOuterGlowOrShadowFilter *)self _kernel];
  [(CIImage *)self->inputImage extent];
  CGFloat v26 = v25;
  CGFloat v28 = v27;
  CGFloat v30 = v29;
  CGFloat v32 = v31;
  [(CIImage *)v18 extent];
  v47.origin.double x = v33;
  v47.origin.double y = v34;
  v47.size.double width = v35;
  v47.size.double height = v36;
  v45.origin.double x = v26;
  v45.origin.double y = v28;
  v45.size.double width = v30;
  v45.size.double height = v32;
  CGRect v46 = CGRectUnion(v45, v47);
  double x = v46.origin.x;
  double y = v46.origin.y;
  double width = v46.size.width;
  double height = v46.size.height;
  inputColor = self->inputColor;
  v44[0] = v18;
  v44[1] = inputColor;
  v44[2] = [NSNumber numberWithDouble:v15];
  return (id)objc_msgSend(v24, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v44, 3), x, y, width, height);
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

- (NSNumber)inputSize
{
  return self->inputSize;
}

- (void)setInputSize:(id)a3
{
}

- (NSNumber)inputSpread
{
  return self->inputSpread;
}

- (void)setInputSpread:(id)a3
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