@interface CICircleSplashDistortion
+ (id)customAttributes;
- (CIImage)inputImage;
- (CIVector)inputCenter;
- (NSNumber)inputRadius;
- (id)_kernel;
- (id)outputImage;
- (void)setInputCenter:(id)a3;
- (void)setInputImage:(id)a3;
- (void)setInputRadius:(id)a3;
@end

@implementation CICircleSplashDistortion

+ (id)customAttributes
{
  v9[5] = *MEMORY[0x1E4F143B8];
  v8[0] = @"CIAttributeFilterCategories";
  v7[0] = @"CICategoryDistortionEffect";
  v7[1] = @"CICategoryVideo";
  v7[2] = @"CICategoryStillImage";
  v7[3] = @"CICategoryBuiltIn";
  v9[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:4];
  v9[1] = @"6";
  v8[1] = @"CIAttributeFilterAvailable_iOS";
  v8[2] = @"CIAttributeFilterAvailable_Mac";
  v9[2] = @"10.4";
  v8[3] = @"inputCenter";
  v5[0] = @"CIAttributeDefault";
  v5[1] = @"CIAttributeType";
  v6[0] = +[CIVector vectorWithX:150.0 Y:150.0];
  v6[1] = @"CIAttributeTypePosition";
  v9[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:2];
  v8[4] = @"inputRadius";
  v3[0] = @"CIAttributeMin";
  v3[1] = @"CIAttributeSliderMin";
  v4[0] = &unk_1EE4A7F70;
  v4[1] = &unk_1EE4A7F70;
  v3[2] = @"CIAttributeSliderMax";
  v3[3] = @"CIAttributeDefault";
  v4[2] = &unk_1EE4A7F80;
  v4[3] = &unk_1EE4A7F90;
  v3[4] = @"CIAttributeType";
  v4[4] = @"CIAttributeTypeDistance";
  v9[4] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:5];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:5];
}

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_circleSplash];
}

- (id)outputImage
{
  v25[2] = *MEMORY[0x1E4F143B8];
  if (!self->inputImage) {
    return 0;
  }
  [(CIVector *)self->inputCenter X];
  double v4 = v3;
  [(CIVector *)self->inputCenter Y];
  double v6 = v5;
  [(NSNumber *)self->inputRadius floatValue];
  double v8 = fmax(v7, 0.0);
  if (v8 >= 0.001)
  {
    *(float *)&uint64_t v11 = v4;
    float v12 = v6;
    float v22 = *(float *)&v11;
    float v23 = v12;
    *((float *)&v11 + 1) = v12;
    uint64_t v21 = v11;
    id v13 = [(CICircleSplashDistortion *)self _kernel];
    double v14 = *MEMORY[0x1E4F1DB10];
    double v15 = *(double *)(MEMORY[0x1E4F1DB10] + 8);
    double v16 = *(double *)(MEMORY[0x1E4F1DB10] + 16);
    double v17 = *(double *)(MEMORY[0x1E4F1DB10] + 24);
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __39__CICircleSplashDistortion_outputImage__block_invoke;
    v24[3] = &__block_descriptor_48_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
    v24[4] = v21;
    *(double *)&v24[5] = v8;
    inputImage = self->inputImage;
    v19 = +[CIVector vectorWithX:v22 Y:v23];
    inputRadius = self->inputRadius;
    v25[0] = v19;
    v25[1] = inputRadius;
    return (id)objc_msgSend(v13, "applyWithExtent:roiCallback:inputImage:arguments:", v24, inputImage, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v25, 2), v14, v15, v16, v17);
  }
  else
  {
    v9 = self->inputImage;
    return v9;
  }
}

double __39__CICircleSplashDistortion_outputImage__block_invoke(uint64_t a1)
{
  double v1 = *(double *)(a1 + 40);
  v3.origin.x = COERCE_FLOAT(*(void *)(a1 + 32)) - v1;
  v3.origin.y = COERCE_FLOAT(HIDWORD(*(void *)(a1 + 32))) - v1;
  v3.size.width = v1 + v1;
  v3.size.height = v3.size.width;
  *(void *)&double result = (unint64_t)CGRectInset(v3, -1.0, -1.0);
  return result;
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

@end