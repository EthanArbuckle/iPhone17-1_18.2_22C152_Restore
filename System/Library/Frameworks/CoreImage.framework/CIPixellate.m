@interface CIPixellate
+ (id)customAttributes;
- (CIImage)inputImage;
- (CIVector)inputCenter;
- (NSNumber)inputScale;
- (id)_kernel;
- (id)outputImage;
- (void)setInputCenter:(id)a3;
- (void)setInputImage:(id)a3;
- (void)setInputScale:(id)a3;
@end

@implementation CIPixellate

+ (id)customAttributes
{
  v9[5] = *MEMORY[0x1E4F143B8];
  v8[0] = @"CIAttributeFilterCategories";
  v7[0] = @"CICategoryStylize";
  v7[1] = @"CICategoryVideo";
  v7[2] = @"CICategoryStillImage";
  v7[3] = @"CICategoryHighDynamicRange";
  v7[4] = @"CICategoryBuiltIn";
  v9[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:5];
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
  v8[4] = @"inputScale";
  v3[0] = @"CIAttributeMin";
  v3[1] = @"CIAttributeSliderMin";
  v4[0] = &unk_1EE4A9770;
  v4[1] = &unk_1EE4A9770;
  v3[2] = @"CIAttributeSliderMax";
  v3[3] = @"CIAttributeDefault";
  v4[2] = &unk_1EE4A9780;
  v4[3] = &unk_1EE4A9790;
  v3[4] = @"CIAttributeType";
  v4[4] = @"CIAttributeTypeDistance";
  v9[4] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:5];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:5];
}

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_pixellate];
}

- (id)outputImage
{
  v21[2] = *MEMORY[0x1E4F143B8];
  if (!self->inputImage) {
    return 0;
  }
  [(NSNumber *)self->inputScale floatValue];
  float v4 = v3;
  v5 = +[CIVector vectorWithX:(float)(1.0 / v3) Y:v3];
  [(CIVector *)self->inputCenter X];
  *(float *)&double v6 = v6;
  float v18 = *(float *)&v6;
  [(CIVector *)self->inputCenter Y];
  *(float *)&double v7 = v7;
  unint64_t v16 = __PAIR64__(LODWORD(v7), LODWORD(v18));
  float v17 = *(float *)&v7;
  [(CIImage *)self->inputImage extent];
  CGFloat v8 = -floor(v4 * 0.5);
  CGRect v23 = CGRectInset(v22, v8, v8);
  CGRect v24 = CGRectIntegral(v23);
  double x = v24.origin.x;
  double y = v24.origin.y;
  double width = v24.size.width;
  double height = v24.size.height;
  id v13 = [(CIPixellate *)self _kernel];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __26__CIPixellate_outputImage__block_invoke;
  v19[3] = &__block_descriptor_44_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
  v19[4] = v16;
  float v20 = v4;
  inputImage = self->inputImage;
  v21[0] = +[CIVector vectorWithX:v18 Y:v17];
  v21[1] = v5;
  return (id)objc_msgSend(v13, "applyWithExtent:roiCallback:inputImage:arguments:", v19, inputImage, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v21, 2), x, y, width, height);
}

double __26__CIPixellate_outputImage__block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  uint64_t v5 = *(void *)(a1 + 32);
  float v14 = *(float *)&v5;
  float v6 = *(float *)(a1 + 40);
  float v7 = *((float *)&v5 + 1);
  CGRect v16 = CGRectOffset(*(CGRect *)&a2, (float)-*(float *)&v5, (float)-*((float *)&v5 + 1));
  double v8 = v6;
  v16.origin.double x = v16.origin.x / v8;
  v16.origin.double y = v16.origin.y / v8;
  v16.size.double width = v16.size.width / v8;
  v16.size.double height = v16.size.height / v8;
  CGRect v17 = CGRectOffset(v16, 0.5, 0.5);
  CGRect v18 = CGRectIntegral(v17);
  CGFloat v9 = v18.origin.x * v8;
  double v10 = v18.origin.y * v8;
  double v11 = v18.size.width * v8;
  double v12 = v18.size.height * v8;

  *(void *)&double result = (unint64_t)CGRectOffset(*(CGRect *)&v9, v14, v7);
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

- (NSNumber)inputScale
{
  return self->inputScale;
}

- (void)setInputScale:(id)a3
{
}

@end