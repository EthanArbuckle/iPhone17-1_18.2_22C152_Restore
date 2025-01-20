@interface CIHueSaturationValueGradient
+ (id)customAttributes;
- (NSNumber)inputDither;
- (NSNumber)inputRadius;
- (NSNumber)inputSoftness;
- (NSNumber)inputValue;
- (id)_kernel;
- (id)_kernelD;
- (id)inputColorSpace;
- (id)outputImage;
- (void)setInputColorSpace:(id)a3;
- (void)setInputDither:(id)a3;
- (void)setInputRadius:(id)a3;
- (void)setInputSoftness:(id)a3;
- (void)setInputValue:(id)a3;
@end

@implementation CIHueSaturationValueGradient

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_hsvwheel];
}

- (id)_kernelD
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_hsvwheeldithered];
}

+ (id)customAttributes
{
  v17[8] = *MEMORY[0x1E4F143B8];
  v2 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DC98]);
  v16[0] = @"CIAttributeFilterCategories";
  v15[0] = @"CICategoryGradient";
  v15[1] = @"CICategoryVideo";
  v15[2] = @"CICategoryStillImage";
  v15[3] = @"CICategoryBuiltIn";
  v17[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:4];
  v17[1] = @"10";
  v16[1] = @"CIAttributeFilterAvailable_iOS";
  v16[2] = @"CIAttributeFilterAvailable_Mac";
  v17[2] = @"10.12";
  v16[3] = @"inputRadius";
  v13[0] = @"CIAttributeMin";
  v13[1] = @"CIAttributeSliderMin";
  v14[0] = &unk_1EE4A8D20;
  v14[1] = &unk_1EE4A8D20;
  v13[2] = @"CIAttributeSliderMax";
  v13[3] = @"CIAttributeDefault";
  v14[2] = &unk_1EE4A8D30;
  v14[3] = &unk_1EE4A8D60;
  v13[4] = @"CIAttributeType";
  v14[4] = @"CIAttributeTypeDistance";
  v17[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:5];
  v16[4] = @"inputValue";
  v11[0] = @"CIAttributeMin";
  v11[1] = @"CIAttributeSliderMin";
  v12[0] = &unk_1EE4A8D20;
  v12[1] = &unk_1EE4A8D20;
  v11[2] = @"CIAttributeSliderMax";
  v11[3] = @"CIAttributeDefault";
  v12[2] = &unk_1EE4A8D70;
  v12[3] = &unk_1EE4A8D70;
  v11[4] = @"CIAttributeType";
  v12[4] = @"CIAttributeTypeScalar";
  v17[4] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:5];
  v16[5] = @"inputSoftness";
  v9[0] = @"CIAttributeMin";
  v9[1] = @"CIAttributeSliderMin";
  v10[0] = &unk_1EE4A8D20;
  v10[1] = &unk_1EE4A8D20;
  v9[2] = @"CIAttributeSliderMax";
  v9[3] = @"CIAttributeDefault";
  v10[2] = &unk_1EE4A8D70;
  v10[3] = &unk_1EE4A8D70;
  v9[4] = @"CIAttributeType";
  v10[4] = @"CIAttributeTypeScalar";
  v17[5] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:5];
  v16[6] = @"inputDither";
  v7[0] = @"CIAttributeMin";
  v7[1] = @"CIAttributeSliderMin";
  v8[0] = &unk_1EE4A8D20;
  v8[1] = &unk_1EE4A8D20;
  v7[2] = @"CIAttributeSliderMax";
  v7[3] = @"CIAttributeDefault";
  v8[2] = &unk_1EE4A8D80;
  v8[3] = &unk_1EE4A8D70;
  v7[4] = @"CIAttributeType";
  v8[4] = @"CIAttributeTypeScalar";
  v17[6] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:5];
  v16[7] = @"inputColorSpace";
  v5 = @"CIAttributeDefault";
  v6 = v2;
  v17[7] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v6 forKeys:&v5 count:1];
  v3 = (void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:8];
  CGColorSpaceRelease(v2);
  return v3;
}

- (id)outputImage
{
  v18[1] = *MEMORY[0x1E4F143B8];
  [(NSNumber *)self->inputRadius doubleValue];
  if (v3 >= 0.01)
  {
    double v5 = v3;
    [(NSNumber *)self->inputValue doubleValue];
    double v7 = fmin(fmax(v6, 0.0), 1.0);
    [(NSNumber *)self->inputDither doubleValue];
    double v9 = v8;
    [(NSNumber *)self->inputSoftness doubleValue];
    v11 = +[CIVector vectorWithX:v7 Y:v5 Z:1.0 / v5 W:v10];
    double v12 = ceil(v5 + v5);
    if (v9 >= 0.01)
    {
      id v13 = [(CIHueSaturationValueGradient *)self _kernelD];
      v17[1] = objc_msgSend(NSNumber, "numberWithDouble:", v9 * 0.00390625, v11);
      v14 = (void *)MEMORY[0x1E4F1C978];
      v15 = v17;
      uint64_t v16 = 2;
    }
    else
    {
      id v13 = [(CIHueSaturationValueGradient *)self _kernel];
      v18[0] = v11;
      v14 = (void *)MEMORY[0x1E4F1C978];
      v15 = v18;
      uint64_t v16 = 1;
    }
    id result = (id)objc_msgSend(v13, "applyWithExtent:arguments:", objc_msgSend(v14, "arrayWithObjects:count:", v15, v16), 0.0, 0.0, v12, v12);
    if (self->inputColorSpace) {
      return (id)objc_msgSend(result, "imageByColorMatchingColorSpaceToWorkingSpace:");
    }
  }
  else
  {
    return +[CIImage emptyImage];
  }
  return result;
}

- (NSNumber)inputValue
{
  return self->inputValue;
}

- (void)setInputValue:(id)a3
{
}

- (NSNumber)inputRadius
{
  return self->inputRadius;
}

- (void)setInputRadius:(id)a3
{
}

- (NSNumber)inputSoftness
{
  return self->inputSoftness;
}

- (void)setInputSoftness:(id)a3
{
}

- (NSNumber)inputDither
{
  return self->inputDither;
}

- (void)setInputDither:(id)a3
{
}

- (id)inputColorSpace
{
  return self->inputColorSpace;
}

- (void)setInputColorSpace:(id)a3
{
}

@end