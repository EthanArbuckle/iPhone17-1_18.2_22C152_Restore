@interface CIDisintegrateWithMaskTransition
+ (id)customAttributes;
- (CIImage)inputImage;
- (CIImage)inputMaskImage;
- (CIImage)inputTargetImage;
- (CIVector)inputShadowOffset;
- (NSNumber)inputShadowDensity;
- (NSNumber)inputShadowRadius;
- (NSNumber)inputTime;
- (id)_kernel;
- (id)_kernelG;
- (id)outputImage;
- (void)setInputImage:(id)a3;
- (void)setInputMaskImage:(id)a3;
- (void)setInputShadowDensity:(id)a3;
- (void)setInputShadowOffset:(id)a3;
- (void)setInputShadowRadius:(id)a3;
- (void)setInputTargetImage:(id)a3;
- (void)setInputTime:(id)a3;
@end

@implementation CIDisintegrateWithMaskTransition

+ (id)customAttributes
{
  v11[6] = *MEMORY[0x1E4F143B8];
  v10[0] = @"CIAttributeFilterCategories";
  v9[0] = @"CICategoryTransition";
  v9[1] = @"CICategoryVideo";
  v9[2] = @"CICategoryStillImage";
  v9[3] = @"CICategoryBuiltIn";
  v11[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:4];
  v11[1] = @"6";
  v10[1] = @"CIAttributeFilterAvailable_iOS";
  v10[2] = @"CIAttributeFilterAvailable_Mac";
  v11[2] = @"10.4";
  v10[3] = @"inputShadowRadius";
  v7[0] = @"CIAttributeMin";
  v7[1] = @"CIAttributeSliderMin";
  v8[0] = &unk_1EE4A84B0;
  v8[1] = &unk_1EE4A84B0;
  v7[2] = @"CIAttributeSliderMax";
  v7[3] = @"CIAttributeDefault";
  v8[2] = &unk_1EE4A84C0;
  v8[3] = &unk_1EE4A84D0;
  v7[4] = @"CIAttributeType";
  v8[4] = @"CIAttributeTypeDistance";
  v11[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:5];
  v10[4] = @"inputShadowDensity";
  v5[0] = @"CIAttributeMin";
  v5[1] = @"CIAttributeMax";
  v6[0] = &unk_1EE4A84B0;
  v6[1] = &unk_1EE4A84E0;
  v5[2] = @"CIAttributeSliderMin";
  v5[3] = @"CIAttributeSliderMax";
  v6[2] = &unk_1EE4A84B0;
  v6[3] = &unk_1EE4A84E0;
  v5[4] = @"CIAttributeDefault";
  v5[5] = @"CIAttributeIdentity";
  v6[4] = &unk_1EE4A84F0;
  v6[5] = &unk_1EE4A84B0;
  v5[6] = @"CIAttributeType";
  v6[6] = @"CIAttributeTypeScalar";
  v11[4] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:7];
  v10[5] = @"inputShadowOffset";
  v3[0] = @"CIAttributeDefault";
  v4[0] = +[CIVector vectorWithX:0.0 Y:-10.0];
  v3[1] = @"CIAttributeIdentity";
  v3[2] = @"CIAttributeType";
  v4[1] = +[CIVector vectorWithX:0.0 Y:0.0];
  v4[2] = @"CIAttributeTypeOffset";
  v11[5] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:3];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:6];
}

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_disintegrateWithMask];
}

- (id)_kernelG
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_disintegrateWithMaskG];
}

- (id)outputImage
{
  v39[7] = *MEMORY[0x1E4F143B8];
  if (!self->inputImage || !self->inputTargetImage || !self->inputMaskImage) {
    return 0;
  }
  [(NSNumber *)self->inputTime floatValue];
  if (v3 <= 0.0) {
    return self->inputImage;
  }
  if (v3 >= 1.0) {
    return self->inputTargetImage;
  }
  double v4 = v3;
  [(CIImage *)self->inputImage extent];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  [(CIImage *)self->inputTargetImage extent];
  v42.origin.double x = v13;
  v42.origin.double y = v14;
  v42.size.double width = v15;
  v42.size.double height = v16;
  v40.origin.double x = v6;
  v40.origin.double y = v8;
  v40.size.double width = v10;
  v40.size.double height = v12;
  CGRect v41 = CGRectUnion(v40, v42);
  double x = v41.origin.x;
  double y = v41.origin.y;
  double width = v41.size.width;
  double height = v41.size.height;
  [(NSNumber *)self->inputShadowRadius floatValue];
  double v22 = 1.0 / v21;
  [(NSNumber *)self->inputShadowDensity floatValue];
  v24 = +[CIVector vectorWithX:0.25 Y:v22 Z:v23 W:v4];
  [(CIVector *)self->inputShadowOffset X];
  *(float *)&double v4 = v25;
  [(CIVector *)self->inputShadowOffset Y];
  *(float *)&double v22 = v26;
  inputMaskImage = self->inputMaskImage;
  CGAffineTransformMakeTranslation(&v38, 1.0, 0.0);
  uint64_t v28 = [(CIImage *)inputMaskImage imageByApplyingTransform:&v38];
  v29 = self->inputMaskImage;
  CGAffineTransformMakeTranslation(&v37, 0.0, 1.0);
  uint64_t v30 = [(CIImage *)v29 imageByApplyingTransform:&v37];
  v31 = self->inputMaskImage;
  CGAffineTransformMakeTranslation(&v36, *(float *)&v4, *(float *)&v22);
  uint64_t v32 = [(CIImage *)v31 imageByApplyingTransform:&v36];
  id v33 = [(CIDisintegrateWithMaskTransition *)self _kernel];
  inputTargetImage = self->inputTargetImage;
  v39[0] = self->inputImage;
  v39[1] = inputTargetImage;
  v39[2] = self->inputMaskImage;
  v39[3] = v28;
  v39[4] = v30;
  v39[5] = v32;
  v39[6] = v24;
  return (id)objc_msgSend(v33, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v39, 7), x, y, width, height);
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

- (CIImage)inputMaskImage
{
  return self->inputMaskImage;
}

- (void)setInputMaskImage:(id)a3
{
}

- (NSNumber)inputTime
{
  return self->inputTime;
}

- (void)setInputTime:(id)a3
{
}

- (NSNumber)inputShadowRadius
{
  return self->inputShadowRadius;
}

- (void)setInputShadowRadius:(id)a3
{
}

- (NSNumber)inputShadowDensity
{
  return self->inputShadowDensity;
}

- (void)setInputShadowDensity:(id)a3
{
}

- (CIVector)inputShadowOffset
{
  return self->inputShadowOffset;
}

- (void)setInputShadowOffset:(id)a3
{
}

@end