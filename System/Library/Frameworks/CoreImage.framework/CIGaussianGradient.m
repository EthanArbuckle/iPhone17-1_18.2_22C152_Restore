@interface CIGaussianGradient
+ (id)customAttributes;
- (CIColor)inputColor0;
- (CIColor)inputColor1;
- (CIVector)inputCenter;
- (NSNumber)inputRadius;
- (id)_kernel;
- (id)outputImage;
- (void)setInputCenter:(id)a3;
- (void)setInputColor0:(id)a3;
- (void)setInputColor1:(id)a3;
- (void)setInputRadius:(id)a3;
@end

@implementation CIGaussianGradient

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_gaussianGradient];
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
  v13[1] = @"5";
  v12[1] = @"CIAttributeFilterAvailable_iOS";
  v12[2] = @"CIAttributeFilterAvailable_Mac";
  v13[2] = @"10.4";
  v12[3] = @"inputCenter";
  v9[0] = @"CIAttributeDefault";
  v9[1] = @"CIAttributeType";
  v10[0] = +[CIVector vectorWithX:150.0 Y:150.0];
  v10[1] = @"CIAttributeTypePosition";
  v13[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  v12[4] = @"inputRadius";
  v7[0] = @"CIAttributeMin";
  v7[1] = @"CIAttributeSliderMin";
  v8[0] = &unk_1EE4A8D20;
  v8[1] = &unk_1EE4A8D20;
  v7[2] = @"CIAttributeSliderMax";
  v7[3] = @"CIAttributeDefault";
  v8[2] = &unk_1EE4A8D30;
  v8[3] = &unk_1EE4A8D60;
  v7[4] = @"CIAttributeType";
  v8[4] = @"CIAttributeTypeDistance";
  v13[4] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:5];
  v12[5] = @"inputColor0";
  v5[0] = @"CIAttributeDefault";
  v5[1] = @"CIAttributeType";
  v6[0] = +[CIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
  v6[1] = @"CIAttributeTypeColor";
  v13[5] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:2];
  v12[6] = @"inputColor1";
  v3[1] = @"CIAttributeType";
  v4[0] = +[CIColor colorWithRed:0.0, 0.0, 0.0, 0.0, @"CIAttributeDefault" green blue alpha];
  v4[1] = @"CIAttributeTypeColor";
  v13[6] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:2];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:7];
}

- (id)outputImage
{
  v29[3] = *MEMORY[0x1E4F143B8];
  [(NSNumber *)self->inputRadius floatValue];
  double v4 = v3;
  if (v3 >= 0.01)
  {
    [(CIColor *)self->inputColor0 alpha];
    if (v7 == 0.0 && ([(CIColor *)self->inputColor1 alpha], v8 == 0.0))
    {
      return 0;
    }
    else
    {
      [(CIVector *)self->inputCenter X];
      double v10 = v9;
      [(CIVector *)self->inputCenter Y];
      v12 = +[CIVector vectorWithX:v10 Y:v11 Z:1.0 / v4];
      [(CIColor *)self->inputColor1 red];
      double v14 = v13;
      [(CIColor *)self->inputColor1 green];
      double v16 = v15;
      [(CIColor *)self->inputColor1 blue];
      double v18 = v17;
      [(CIColor *)self->inputColor1 alpha];
      if (fabs(v14) + fabs(v16) + fabs(v18) + fabs(v19) == 0.0)
      {
        [(CIVector *)self->inputCenter X];
        double v21 = v20;
        [(CIVector *)self->inputCenter Y];
        double v22 = v21 - v4;
        double v24 = v23 - v4;
        double v25 = v4 + v4;
      }
      else
      {
        double v25 = 1.79769313e308;
        double v22 = -8.98846567e307;
        double v24 = -8.98846567e307;
      }
      id v26 = [(CIGaussianGradient *)self _kernel];
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
      inputColor0 = self->inputColor0;
      v29[0] = v12;
      v29[1] = inputColor0;
      v29[2] = self->inputColor1;
      return (id)objc_msgSend(v26, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v29, 3), v22, v24, v25, v27);
    }
  }
  else
  {
    inputColor1 = self->inputColor1;
    return +[CIImage imageWithColor:inputColor1];
  }
}

- (CIVector)inputCenter
{
  return self->inputCenter;
}

- (void)setInputCenter:(id)a3
{
}

- (CIColor)inputColor0
{
  return self->inputColor0;
}

- (void)setInputColor0:(id)a3
{
}

- (CIColor)inputColor1
{
  return self->inputColor1;
}

- (void)setInputColor1:(id)a3
{
}

- (NSNumber)inputRadius
{
  return self->inputRadius;
}

- (void)setInputRadius:(id)a3
{
}

@end