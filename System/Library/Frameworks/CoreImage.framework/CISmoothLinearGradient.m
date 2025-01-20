@interface CISmoothLinearGradient
+ (id)customAttributes;
- (CIColor)inputColor0;
- (CIColor)inputColor1;
- (CIVector)inputPoint0;
- (CIVector)inputPoint1;
- (id)_kernel;
- (id)outputImage;
- (void)setInputColor0:(id)a3;
- (void)setInputColor1:(id)a3;
- (void)setInputPoint0:(id)a3;
- (void)setInputPoint1:(id)a3;
@end

@implementation CISmoothLinearGradient

- (void)setInputPoint1:(id)a3
{
}

- (void)setInputPoint0:(id)a3
{
}

- (void)setInputColor1:(id)a3
{
}

- (void)setInputColor0:(id)a3
{
}

+ (id)customAttributes
{
  v13[7] = *MEMORY[0x1E4F143B8];
  v12[0] = @"CIAttributeFilterCategories";
  v11[0] = @"CICategoryGradient";
  v11[1] = @"CICategoryVideo";
  v11[2] = @"CICategoryStillImage";
  v11[3] = @"CICategoryHighDynamicRange";
  v11[4] = @"CICategoryBuiltIn";
  v13[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:5];
  v13[1] = @"6";
  v12[1] = @"CIAttributeFilterAvailable_iOS";
  v12[2] = @"CIAttributeFilterAvailable_Mac";
  v13[2] = @"10.10";
  v12[3] = @"inputPoint0";
  v9[0] = @"CIAttributeDefault";
  v9[1] = @"CIAttributeType";
  v10[0] = +[CIVector vectorWithX:0.0 Y:0.0];
  v10[1] = @"CIAttributeTypePosition";
  v13[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  v12[4] = @"inputPoint1";
  v7[0] = @"CIAttributeDefault";
  v7[1] = @"CIAttributeType";
  v8[0] = +[CIVector vectorWithX:200.0 Y:200.0];
  v8[1] = @"CIAttributeTypePosition";
  v13[4] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];
  v12[5] = @"inputColor0";
  v5[0] = @"CIAttributeDefault";
  v5[1] = @"CIAttributeType";
  v6[0] = +[CIColor colorWithRed:1.0 green:1.0 blue:1.0];
  v6[1] = @"CIAttributeTypeColor";
  v13[5] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:2];
  v12[6] = @"inputColor1";
  v3[1] = @"CIAttributeType";
  v4[0] = +[CIColor colorWithRed:0.0, 0.0, 0.0, @"CIAttributeDefault" green blue];
  v4[1] = @"CIAttributeTypeColor";
  v13[6] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:2];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:7];
}

- (id)outputImage
{
  v25[5] = *MEMORY[0x1E4F143B8];
  [(CIColor *)self->inputColor0 alpha];
  if (v3 == 0.0)
  {
    [(CIColor *)self->inputColor1 alpha];
    if (v4 == 0.0) {
      return 0;
    }
  }
  [(CIVector *)self->inputPoint0 X];
  float64_t v23 = v6;
  [(CIVector *)self->inputPoint0 Y];
  v7.f64[0] = v23;
  v7.f64[1] = v8;
  float32x2_t v9 = vcvt_f32_f64(v7);
  [(CIVector *)self->inputPoint1 X];
  float64_t v24 = v10;
  [(CIVector *)self->inputPoint1 Y];
  v11.f64[0] = v24;
  v11.f64[1] = v12;
  float32x2_t v13 = vsub_f32(vcvt_f32_f64(v11), v9);
  uint64_t v14 = objc_msgSend(NSNumber, "numberWithDouble:", 1.0 / vaddv_f32(vmul_f32(v13, v13)));
  id v15 = [(CISmoothLinearGradient *)self _kernel];
  double v16 = *MEMORY[0x1E4F1DB10];
  double v17 = *(double *)(MEMORY[0x1E4F1DB10] + 8);
  double v18 = *(double *)(MEMORY[0x1E4F1DB10] + 16);
  double v19 = *(double *)(MEMORY[0x1E4F1DB10] + 24);
  inputPoint1 = self->inputPoint1;
  inputColor0 = self->inputColor0;
  inputColor1 = self->inputColor1;
  v25[0] = self->inputPoint0;
  v25[1] = inputPoint1;
  v25[2] = inputColor0;
  v25[3] = inputColor1;
  v25[4] = v14;
  return (id)objc_msgSend(v15, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v25, 5), v16, v17, v18, v19);
}

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_smoothLinearGradient];
}

- (CIVector)inputPoint0
{
  return self->inputPoint0;
}

- (CIVector)inputPoint1
{
  return self->inputPoint1;
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