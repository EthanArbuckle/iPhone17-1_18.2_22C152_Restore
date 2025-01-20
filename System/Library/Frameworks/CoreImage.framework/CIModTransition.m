@interface CIModTransition
+ (id)customAttributes;
- (CIImage)inputImage;
- (CIImage)inputTargetImage;
- (CIVector)inputCenter;
- (NSNumber)inputAngle;
- (NSNumber)inputCompression;
- (NSNumber)inputRadius;
- (NSNumber)inputTime;
- (id)_kernel;
- (id)outputImage;
- (void)setInputAngle:(id)a3;
- (void)setInputCenter:(id)a3;
- (void)setInputCompression:(id)a3;
- (void)setInputImage:(id)a3;
- (void)setInputRadius:(id)a3;
- (void)setInputTargetImage:(id)a3;
- (void)setInputTime:(id)a3;
@end

@implementation CIModTransition

+ (id)customAttributes
{
  v15[8] = *MEMORY[0x1E4F143B8];
  v14[0] = @"CIAttributeFilterCategories";
  v13[0] = @"CICategoryTransition";
  v13[1] = @"CICategoryVideo";
  v13[2] = @"CICategoryStillImage";
  v13[3] = @"CICategoryBuiltIn";
  v15[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:4];
  v15[1] = @"6";
  v14[1] = @"CIAttributeFilterAvailable_iOS";
  v14[2] = @"CIAttributeFilterAvailable_Mac";
  v15[2] = @"10.4";
  v14[3] = @"inputColor";
  v11[0] = @"CIAttributeDefault";
  v11[1] = @"CIAttributeType";
  v12[0] = +[CIVector vectorWithX:150.0 Y:150.0];
  v12[1] = @"CIAttributeTypePosition";
  v15[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  v14[4] = @"inputTime";
  v9[0] = @"CIAttributeMin";
  v9[1] = @"CIAttributeSliderMin";
  v10[0] = &unk_1EE4A9390;
  v10[1] = &unk_1EE4A9390;
  v9[2] = @"CIAttributeSliderMax";
  v9[3] = @"CIAttributeDefault";
  v10[2] = &unk_1EE4A93A0;
  v10[3] = &unk_1EE4A9390;
  v9[4] = @"CIAttributeType";
  v10[4] = @"CIAttributeTypeTime";
  v15[4] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:5];
  v14[5] = @"inputAngle";
  v7[0] = @"CIAttributeSliderMin";
  v7[1] = @"CIAttributeSliderMax";
  v8[0] = &unk_1EE4A93B0;
  v8[1] = &unk_1EE4A93C0;
  v7[2] = @"CIAttributeDefault";
  v7[3] = @"CIAttributeType";
  v8[2] = &unk_1EE4A93D0;
  v8[3] = @"CIAttributeTypeAngle";
  v15[5] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:4];
  v14[6] = @"inputRadius";
  v5[0] = @"CIAttributeMin";
  v5[1] = @"CIAttributeSliderMin";
  v6[0] = &unk_1EE4A93A0;
  v6[1] = &unk_1EE4A93A0;
  v5[2] = @"CIAttributeSliderMax";
  v5[3] = @"CIAttributeDefault";
  v6[2] = &unk_1EE4A93E0;
  v6[3] = &unk_1EE4A93F0;
  v5[4] = @"CIAttributeType";
  v6[4] = @"CIAttributeTypeDistance";
  v15[6] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:5];
  v14[7] = @"inputCompression";
  v3[0] = @"CIAttributeMin";
  v3[1] = @"CIAttributeSliderMin";
  v4[0] = &unk_1EE4A93A0;
  v4[1] = &unk_1EE4A9400;
  v3[2] = @"CIAttributeSliderMax";
  v3[3] = @"CIAttributeDefault";
  v4[2] = &unk_1EE4A9410;
  v4[3] = &unk_1EE4A9420;
  v3[4] = @"CIAttributeType";
  v4[4] = @"CIAttributeTypeDistance";
  v15[7] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:5];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:8];
}

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_modTransition];
}

- (id)outputImage
{
  v35[7] = *MEMORY[0x1E4F143B8];
  if (!self->inputImage || !self->inputTargetImage) {
    return 0;
  }
  [(NSNumber *)self->inputAngle floatValue];
  float v4 = v3;
  [(NSNumber *)self->inputRadius floatValue];
  float v6 = v5;
  [(NSNumber *)self->inputCompression floatValue];
  float v8 = v7;
  [(NSNumber *)self->inputTime floatValue];
  float v10 = v9;
  [(CIImage *)self->inputImage extent];
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  [(CIImage *)self->inputTargetImage extent];
  v38.origin.double x = v19;
  v38.origin.double y = v20;
  v38.size.double width = v21;
  v38.size.double height = v22;
  v36.origin.double x = v12;
  v36.origin.double y = v14;
  v36.size.double width = v16;
  v36.size.double height = v18;
  CGRect v37 = CGRectUnion(v36, v38);
  double x = v37.origin.x;
  double y = v37.origin.y;
  double width = v37.size.width;
  double height = v37.size.height;
  *(float *)&v37.origin.double x = v10 * 1.47303709;
  v27 = +[CIVector vectorWithX:(float)(17.0 / *(float *)&v37.origin.x) Y:-16.5 Z:1.0 / v8 W:(float)(v8 * 1.1738)];
  __float2 v28 = __sincosf_stret((float)(v10 * (float)(v4 + -0.7854)) + 0.7854);
  v29 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", (float)(v28.__cosval / v6), (float)(v28.__sinval / v6), (float)((float)-v28.__sinval / v6));
  v30 = +[CIVector vectorWithX:-0.643644094 Y:1.17377448 Z:1.5536536 W:-1.32363904];
  v31 = +[CIVector vectorWithX:0.643644094 Y:0.530130386 Z:-1.5536536 W:2.32363892];
  id v32 = [(CIModTransition *)self _kernel];
  inputTargetImage = self->inputTargetImage;
  v35[0] = self->inputImage;
  v35[1] = inputTargetImage;
  v35[2] = self->inputCenter;
  v35[3] = v27;
  v35[4] = v29;
  v35[5] = v30;
  v35[6] = v31;
  return (id)objc_msgSend(v32, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v35, 7), x, y, width, height);
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
}

- (CIImage)inputTargetImage
{
  return self->inputTargetImage;
}

- (void)setInputTargetImage:(id)a3
{
}

- (CIVector)inputCenter
{
  return self->inputCenter;
}

- (void)setInputCenter:(id)a3
{
}

- (NSNumber)inputTime
{
  return self->inputTime;
}

- (void)setInputTime:(id)a3
{
}

- (NSNumber)inputAngle
{
  return self->inputAngle;
}

- (void)setInputAngle:(id)a3
{
}

- (NSNumber)inputRadius
{
  return self->inputRadius;
}

- (void)setInputRadius:(id)a3
{
}

- (NSNumber)inputCompression
{
  return self->inputCompression;
}

- (void)setInputCompression:(id)a3
{
}

@end