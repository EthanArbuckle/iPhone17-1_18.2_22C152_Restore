@interface _CIScreenFilter
+ (id)customAttributes;
- (CIImage)inputImage;
- (CIVector)inputCenter;
- (NSNumber)inputAngle;
- (NSNumber)inputSharpness;
- (NSNumber)inputWidth;
- (id)_kernel;
- (id)outputImage;
- (void)setInputAngle:(id)a3;
- (void)setInputCenter:(id)a3;
- (void)setInputImage:(id)a3;
- (void)setInputSharpness:(id)a3;
- (void)setInputWidth:(id)a3;
@end

@implementation _CIScreenFilter

+ (id)customAttributes
{
  v13[7] = *MEMORY[0x1E4F143B8];
  v12[0] = @"CIAttributeFilterCategories";
  v11[0] = @"CICategoryHalftoneEffect";
  v11[1] = @"CICategoryVideo";
  v11[2] = @"CICategoryStillImage";
  v11[3] = @"CICategoryBuiltIn";
  v13[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:4];
  v13[1] = @"6";
  v12[1] = @"CIAttributeFilterAvailable_iOS";
  v12[2] = @"CIAttributeFilterAvailable_Mac";
  v13[2] = @"10.4";
  v12[3] = @"inputCenter";
  v9[0] = @"CIAttributeDefault";
  v9[1] = @"CIAttributeType";
  v10[0] = +[CIVector vectorWithX:150.0 Y:150.0];
  v10[1] = @"CIAttributeTypePosition";
  v13[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  v12[4] = @"inputAngle";
  v7[0] = @"CIAttributeSliderMin";
  v7[1] = @"CIAttributeSliderMax";
  v8[0] = &unk_1EE4A8DE0;
  v8[1] = &unk_1EE4A8DF0;
  v7[2] = @"CIAttributeDefault";
  v7[3] = @"CIAttributeType";
  v8[2] = &unk_1EE4A8E00;
  v8[3] = @"CIAttributeTypeAngle";
  v13[4] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:4];
  v12[5] = @"inputWidth";
  v5[0] = @"CIAttributeMin";
  v5[1] = @"CIAttributeSliderMin";
  v6[0] = &unk_1EE4A8E10;
  v6[1] = &unk_1EE4A8E20;
  v5[2] = @"CIAttributeSliderMax";
  v5[3] = @"CIAttributeDefault";
  v6[2] = &unk_1EE4A8E30;
  v6[3] = &unk_1EE4A8E40;
  v5[4] = @"CIAttributeType";
  v6[4] = @"CIAttributeTypeDistance";
  v13[5] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:5];
  v12[6] = @"inputSharpness";
  v3[0] = @"CIAttributeMin";
  v3[1] = @"CIAttributeMax";
  v4[0] = &unk_1EE4A8E00;
  v4[1] = &unk_1EE4A8E10;
  v3[2] = @"CIAttributeSliderMin";
  v3[3] = @"CIAttributeSliderMax";
  v4[2] = &unk_1EE4A8E00;
  v4[3] = &unk_1EE4A8E10;
  v3[4] = @"CIAttributeDefault";
  v3[5] = @"CIAttributeType";
  v4[4] = &unk_1EE4A8E50;
  v4[5] = @"CIAttributeTypeScalar";
  v13[6] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:6];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:7];
}

- (id)_kernel
{
  return 0;
}

- (id)outputImage
{
  v21[3] = *MEMORY[0x1E4F143B8];
  if (!self->inputImage) {
    return 0;
  }
  [(NSNumber *)self->inputSharpness doubleValue];
  double v4 = 1.0 / (1.0 - fmin(fmax(v3, 0.0), 0.99999));
  [(NSNumber *)self->inputAngle doubleValue];
  double v6 = v5;
  [(NSNumber *)self->inputWidth doubleValue];
  double v8 = 1.0 / v7;
  __double2 v9 = __sincos_stret(v6);
  v10 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v9.__cosval * v8, v9.__sinval * v8, -(v9.__sinval * v8));
  [(CIVector *)self->inputCenter X];
  double v12 = v11;
  [(CIVector *)self->inputCenter Y];
  v14 = +[CIVector vectorWithX:v12 Y:v13 Z:v4];
  id v15 = [(_CIScreenFilter *)self _kernel];
  [(CIImage *)self->inputImage extent];
  v21[0] = self->inputImage;
  v21[1] = v14;
  v21[2] = v10;
  return (id)objc_msgSend(v15, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v21, 3), v16, v17, v18, v19);
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
}

- (CIVector)inputCenter
{
  return self->inputCenter;
}

- (void)setInputCenter:(id)a3
{
}

- (NSNumber)inputAngle
{
  return self->inputAngle;
}

- (void)setInputAngle:(id)a3
{
}

- (NSNumber)inputWidth
{
  return self->inputWidth;
}

- (void)setInputWidth:(id)a3
{
}

- (NSNumber)inputSharpness
{
  return self->inputSharpness;
}

- (void)setInputSharpness:(id)a3
{
}

@end