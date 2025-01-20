@interface CIRadialGradient
+ (id)customAttributes;
- (CIColor)inputColor0;
- (CIColor)inputColor1;
- (CIVector)inputCenter;
- (NSNumber)inputRadius0;
- (NSNumber)inputRadius1;
- (id)_kernel;
- (id)outputImage;
- (void)setInputCenter:(id)a3;
- (void)setInputColor0:(id)a3;
- (void)setInputColor1:(id)a3;
- (void)setInputRadius0:(id)a3;
- (void)setInputRadius1:(id)a3;
@end

@implementation CIRadialGradient

- (CIVector)inputCenter
{
  return self->inputCenter;
}

- (void)setInputRadius1:(id)a3
{
}

- (void)setInputRadius0:(id)a3
{
}

- (void)setInputColor1:(id)a3
{
}

- (void)setInputColor0:(id)a3
{
}

- (void)setInputCenter:(id)a3
{
}

- (id)outputImage
{
  v29[3] = *MEMORY[0x1E4F143B8];
  p_inputColor0 = &self->inputColor0;
  [(CIColor *)self->inputColor0 alpha];
  if (v4 == 0.0)
  {
    [(CIColor *)self->inputColor1 alpha];
    if (v5 == 0.0) {
      return 0;
    }
  }
  [(NSNumber *)self->inputRadius0 floatValue];
  float v8 = v7;
  [(NSNumber *)self->inputRadius1 floatValue];
  float v10 = v9;
  if (vabds_f32(v8, v9) < 0.001)
  {
    if (v8 <= v9) {
      float v8 = v8 + -0.001;
    }
    else {
      float v10 = v9 + -0.001;
    }
  }
  p_inputColor1 = p_inputColor0;
  if (v8 <= v10) {
    p_inputColor1 = &self->inputColor1;
  }
  [(CIColor *)*p_inputColor1 alpha];
  float v13 = v12;
  [(CIVector *)self->inputCenter X];
  double v15 = v14;
  [(CIVector *)self->inputCenter Y];
  v17 = +[CIVector vectorWithX:v15 Y:v16 Z:(float)(1.0 / (float)(v10 - v8)) W:(float)((float)-v8 / (float)(v10 - v8))];
  if (v13 == 0.0)
  {
    float v18 = fmaxf(fmaxf(v8, v10), 0.0);
    [(CIVector *)self->inputCenter X];
    double v20 = v19;
    [(CIVector *)self->inputCenter Y];
    double v21 = v18;
    double v22 = v20 - v18;
    double v24 = v23 - v21;
    double v25 = v21 + v21;
  }
  else
  {
    double v25 = 1.79769313e308;
    double v22 = -8.98846567e307;
    double v24 = -8.98846567e307;
  }
  id v26 = [(CIRadialGradient *)self _kernel];
  if (v25 == 1.79769313e308 && v22 == -8.98846567e307)
  {
    double v27 = v25;
    if (v24 == -8.98846567e307)
    {
      double v25 = *(double *)(MEMORY[0x1E4F1DB10] + 16);
      double v27 = *(double *)(MEMORY[0x1E4F1DB10] + 24);
      double v22 = *MEMORY[0x1E4F1DB10];
      double v24 = *(double *)(MEMORY[0x1E4F1DB10] + 8);
    }
  }
  else
  {
    double v27 = v25;
  }
  v28 = *p_inputColor0;
  v29[0] = v17;
  v29[1] = v28;
  v29[2] = self->inputColor1;
  return (id)objc_msgSend(v26, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v29, 3), v22, v24, v25, v27);
}

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_radialGradient];
}

+ (id)customAttributes
{
  v15[8] = *MEMORY[0x1E4F143B8];
  v14[0] = @"CIAttributeFilterCategories";
  v13[0] = @"CICategoryGradient";
  v13[1] = @"CICategoryVideo";
  v13[2] = @"CICategoryStillImage";
  v13[3] = @"CICategoryHighDynamicRange";
  v13[4] = @"CICategoryBuiltIn";
  v15[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:5];
  v15[1] = @"5";
  v14[1] = @"CIAttributeFilterAvailable_iOS";
  v14[2] = @"CIAttributeFilterAvailable_Mac";
  v15[2] = @"10.4";
  v14[3] = @"inputCenter";
  v11[0] = @"CIAttributeDefault";
  v11[1] = @"CIAttributeType";
  v12[0] = +[CIVector vectorWithX:150.0 Y:150.0];
  v12[1] = @"CIAttributeTypePosition";
  v15[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  v14[4] = @"inputRadius0";
  v9[0] = @"CIAttributeMin";
  v9[1] = @"CIAttributeSliderMin";
  v10[0] = &unk_1EE4A8D20;
  v10[1] = &unk_1EE4A8D20;
  v9[2] = @"CIAttributeSliderMax";
  v9[3] = @"CIAttributeDefault";
  v10[2] = &unk_1EE4A8D30;
  v10[3] = &unk_1EE4A8D40;
  v9[4] = @"CIAttributeType";
  v10[4] = @"CIAttributeTypeDistance";
  v15[4] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:5];
  v14[5] = @"inputRadius1";
  v7[0] = @"CIAttributeMin";
  v7[1] = @"CIAttributeSliderMin";
  v8[0] = &unk_1EE4A8D20;
  v8[1] = &unk_1EE4A8D20;
  v7[2] = @"CIAttributeSliderMax";
  v7[3] = @"CIAttributeDefault";
  v8[2] = &unk_1EE4A8D30;
  v8[3] = &unk_1EE4A8D50;
  v7[4] = @"CIAttributeType";
  v8[4] = @"CIAttributeTypeDistance";
  v15[5] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:5];
  v14[6] = @"inputColor0";
  v5[0] = @"CIAttributeDefault";
  v5[1] = @"CIAttributeType";
  v6[0] = +[CIColor colorWithRed:1.0 green:1.0 blue:1.0];
  v6[1] = @"CIAttributeTypeColor";
  v15[6] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:2];
  v14[7] = @"inputColor1";
  v3[1] = @"CIAttributeType";
  v4[0] = +[CIColor colorWithRed:0.0, 0.0, 0.0, @"CIAttributeDefault" green blue];
  v4[1] = @"CIAttributeTypeColor";
  v15[7] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:2];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:8];
}

- (NSNumber)inputRadius0
{
  return self->inputRadius0;
}

- (NSNumber)inputRadius1
{
  return self->inputRadius1;
}

- (CIColor)inputColor0
{
  return self->inputColor0;
}

- (CIColor)inputColor1
{
  return self->inputColor1;
}

@end