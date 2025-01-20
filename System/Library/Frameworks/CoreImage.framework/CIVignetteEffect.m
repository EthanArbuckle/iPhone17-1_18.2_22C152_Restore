@interface CIVignetteEffect
+ (id)customAttributes;
- (BOOL)_isIdentity;
- (CIImage)inputImage;
- (CIVector)inputCenter;
- (NSNumber)inputFalloff;
- (NSNumber)inputIntensity;
- (NSNumber)inputRadius;
- (id)_negkernel;
- (id)_poskernel;
- (id)outputImage;
- (void)setInputCenter:(id)a3;
- (void)setInputFalloff:(id)a3;
- (void)setInputImage:(id)a3;
- (void)setInputIntensity:(id)a3;
- (void)setInputRadius:(id)a3;
@end

@implementation CIVignetteEffect

+ (id)customAttributes
{
  v11[6] = *MEMORY[0x1E4F143B8];
  v10[0] = @"CIAttributeFilterCategories";
  v9[0] = @"CICategoryColorEffect";
  v9[1] = @"CICategoryVideo";
  v9[2] = @"CICategoryInterlaced";
  v9[3] = @"CICategoryStillImage";
  v9[4] = @"CICategoryHighDynamicRange";
  v9[5] = @"CICategoryBuiltIn";
  v11[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:6];
  v11[1] = @"7";
  v10[1] = @"CIAttributeFilterAvailable_iOS";
  v10[2] = @"CIAttributeFilterAvailable_Mac";
  v11[2] = @"10.9";
  v10[3] = @"inputRadius";
  v7[0] = @"CIAttributeSliderMin";
  v7[1] = @"CIAttributeSliderMax";
  v8[0] = &unk_1EE4AA1C0;
  v8[1] = &unk_1EE4AA1E0;
  v7[2] = @"CIAttributeMin";
  v7[3] = @"CIAttributeDefault";
  v8[2] = &unk_1EE4AA1C0;
  v8[3] = &unk_1EE4AA1F0;
  v7[4] = @"CIAttributeType";
  v8[4] = @"CIAttributeTypeDistance";
  v11[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:5];
  v10[4] = @"inputIntensity";
  v5[0] = @"CIAttributeSliderMin";
  v5[1] = @"CIAttributeSliderMax";
  v6[0] = &unk_1EE4AA1A0;
  v6[1] = &unk_1EE4AA1B0;
  v5[2] = @"CIAttributeMin";
  v5[3] = @"CIAttributeMax";
  v6[2] = &unk_1EE4AA1A0;
  v6[3] = &unk_1EE4AA1B0;
  v5[4] = @"CIAttributeDefault";
  v5[5] = @"CIAttributeIdentity";
  v6[4] = &unk_1EE4AA1B0;
  v6[5] = &unk_1EE4AA1C0;
  v5[6] = @"CIAttributeType";
  v6[6] = @"CIAttributeTypeScalar";
  v11[4] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:7];
  v10[5] = @"inputFalloff";
  v3[0] = @"CIAttributeSliderMin";
  v3[1] = @"CIAttributeSliderMax";
  v4[0] = &unk_1EE4AA1C0;
  v4[1] = &unk_1EE4AA1B0;
  v3[2] = @"CIAttributeMin";
  v3[3] = @"CIAttributeMax";
  v4[2] = &unk_1EE4AA1C0;
  v4[3] = &unk_1EE4AA1B0;
  v3[4] = @"CIAttributeDefault";
  v3[5] = @"CIAttributeType";
  v4[4] = &unk_1EE4AA200;
  v4[5] = @"CIAttributeTypeScalar";
  v11[5] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:6];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:6];
}

- (BOOL)_isIdentity
{
  [(NSNumber *)self->inputIntensity doubleValue];
  return fabs(v2) < 0.01;
}

- (id)_poskernel
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_vignetteeffect];
}

- (id)_negkernel
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_vignetteeffectneg];
}

- (id)outputImage
{
  v27[3] = *MEMORY[0x1E4F143B8];
  if (!self->inputImage) {
    return 0;
  }
  if ([(CIVignetteEffect *)self _isIdentity])
  {
    v3 = self->inputImage;
    return v3;
  }
  else
  {
    [(NSNumber *)self->inputIntensity doubleValue];
    double v6 = fmin(fmax(v5, -1.0), 1.0);
    [(NSNumber *)self->inputFalloff doubleValue];
    [(NSNumber *)self->inputRadius doubleValue];
    v8 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", 1.0 / fmax(v7, 0.001));
    if (v6 >= 0.0)
    {
      id v9 = [(CIVignetteEffect *)self _poskernel];
      [(CIImage *)self->inputImage extent];
      double v11 = v21;
      double v13 = v22;
      double v15 = v23;
      double v17 = v24;
      inputCenter = self->inputCenter;
      v27[0] = self->inputImage;
      v27[1] = inputCenter;
      v27[2] = v8;
      v19 = (void *)MEMORY[0x1E4F1C978];
      v20 = v27;
    }
    else
    {
      id v9 = [(CIVignetteEffect *)self _negkernel];
      [(CIImage *)self->inputImage extent];
      double v11 = v10;
      double v13 = v12;
      double v15 = v14;
      double v17 = v16;
      v18 = self->inputCenter;
      v26[0] = self->inputImage;
      v26[1] = v18;
      v26[2] = v8;
      v19 = (void *)MEMORY[0x1E4F1C978];
      v20 = v26;
    }
    return (id)objc_msgSend(v9, "applyWithExtent:arguments:", objc_msgSend(v19, "arrayWithObjects:count:", v20, 3), v11, v13, v15, v17);
  }
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

- (NSNumber)inputRadius
{
  return self->inputRadius;
}

- (void)setInputRadius:(id)a3
{
}

- (NSNumber)inputIntensity
{
  return self->inputIntensity;
}

- (void)setInputIntensity:(id)a3
{
}

- (NSNumber)inputFalloff
{
  return self->inputFalloff;
}

- (void)setInputFalloff:(id)a3
{
}

@end