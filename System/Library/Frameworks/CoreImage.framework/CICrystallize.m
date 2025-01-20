@interface CICrystallize
+ (id)customAttributes;
- (CIImage)inputImage;
- (CIVector)inputCenter;
- (NSNumber)inputRadius;
- (id)_CICrystallize;
- (id)outputImage;
- (void)setInputCenter:(id)a3;
- (void)setInputImage:(id)a3;
- (void)setInputRadius:(id)a3;
@end

@implementation CICrystallize

- (id)_CICrystallize
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_crystallize];
}

- (id)outputImage
{
  v20[4] = *MEMORY[0x1E4F143B8];
  [(CIImage *)self->inputImage extent];
  if (CGRectIsEmpty(v22))
  {
    return +[CIImage emptyImage];
  }
  else
  {
    [(NSNumber *)self->inputRadius floatValue];
    if (v4 >= 1.0)
    {
      double v5 = round(v4 * 0.5);
      float v6 = v5 + v5;
      [(CIVector *)self->inputCenter X];
      double v8 = round(v7);
      [(CIVector *)self->inputCenter Y];
      v10 = +[CIVector vectorWithX:v8 Y:round(v9)];
      id v11 = +[CIImage noiseImageNearest];
      [(CIImage *)self->inputImage extent];
      CGRect v24 = CGRectInset(v23, v6 * -1.5, v6 * -1.5);
      double x = v24.origin.x;
      double y = v24.origin.y;
      double width = v24.size.width;
      double height = v24.size.height;
      id v16 = [(CICrystallize *)self _CICrystallize];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __28__CICrystallize_outputImage__block_invoke;
      v18[3] = &__block_descriptor_36_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
      inputImage = self->inputImage;
      *(float *)&uint64_t v19 = v6;
      v20[2] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", v6, 1.0 / v6, MEMORY[0x1E4F143A8], 3221225472, __28__CICrystallize_outputImage__block_invoke, &__block_descriptor_36_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l, v19, inputImage, v11);
      v20[3] = v10;
      return (id)objc_msgSend(v16, "applyWithExtent:roiCallback:arguments:", v18, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v20, 4), x, y, width, height);
    }
    else
    {
      return self->inputImage;
    }
  }
}

double __28__CICrystallize_outputImage__block_invoke(uint64_t a1, int a2, double a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  if (a2 == 1) {
    return 0.0;
  }
  double v9 = a3;
  if (!a2)
  {
    float v16 = *(float *)(a1 + 32);
    CGFloat v15 = CGRectGetMinX(*(CGRect *)&a3) + 0.5;
    v17.origin.double x = v9;
    v17.origin.double y = a4;
    v17.size.double width = a5;
    v17.size.double height = a6;
    CGFloat v10 = CGRectGetMinY(v17) + 0.5;
    v18.origin.double x = v9;
    v18.origin.double y = a4;
    v18.size.double width = a5;
    v18.size.double height = a6;
    CGFloat v11 = CGRectGetMaxX(v18) + -0.5;
    v19.origin.double x = v9;
    v19.origin.double y = a4;
    v19.size.double width = a5;
    v19.size.double height = a6;
    CGFloat v12 = CGRectGetMaxY(v19) + -0.5;
    v20.origin.double x = (floor(v15 / v16 + -0.5) + 0.5) * v16 + 0.5;
    v20.origin.double y = (floor(v10 / v16 + -0.5) + 0.5) * v16 + 0.5;
    double v13 = (floor(v12 / v16 + -0.5) + 0.5) * v16 + 0.5 + v16;
    v20.size.double width = (floor(v11 / v16 + -0.5) + 0.5) * v16 + 0.5 + v16 - v20.origin.x;
    v20.size.double height = v13 - v20.origin.y;
    *(void *)&double v9 = (unint64_t)CGRectInset(v20, v16 * -0.325, v16 * -0.325);
  }
  return v9;
}

+ (id)customAttributes
{
  v7[4] = *MEMORY[0x1E4F143B8];
  v6[0] = @"CIAttributeFilterCategories";
  v5[0] = @"CICategoryStylize";
  v5[1] = @"CICategoryVideo";
  v5[2] = @"CICategoryStillImage";
  v5[3] = @"CICategoryHighDynamicRange";
  v5[4] = @"CICategoryBuiltIn";
  v7[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:5];
  v7[1] = @"9";
  v6[1] = @"CIAttributeFilterAvailable_iOS";
  v6[2] = @"CIAttributeFilterAvailable_Mac";
  v7[2] = @"10.4";
  v6[3] = @"inputRadius";
  v3[0] = @"CIAttributeMin";
  v3[1] = @"CIAttributeSliderMin";
  v3[2] = @"CIAttributeSliderMax";
  v3[3] = @"CIAttributeDefault";
  v4[2] = &unk_1EE4A8350;
  v4[3] = &unk_1EE4A8360;
  v3[4] = @"CIAttributeIdentity";
  v3[5] = @"CIAttributeType";
  v4[0] = &unk_1EE4A8340;
  v4[1] = &unk_1EE4A8340;
  v4[4] = &unk_1EE4A8340;
  v4[5] = @"CIAttributeTypeDistance";
  v7[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:6];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:4];
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
}

- (NSNumber)inputRadius
{
  return self->inputRadius;
}

- (void)setInputRadius:(id)a3
{
}

- (CIVector)inputCenter
{
  return self->inputCenter;
}

- (void)setInputCenter:(id)a3
{
}

@end