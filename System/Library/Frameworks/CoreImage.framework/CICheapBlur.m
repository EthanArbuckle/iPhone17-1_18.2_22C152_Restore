@interface CICheapBlur
+ (id)customAttributes;
- (id)_CICheapBlur;
- (id)_CILerp;
- (id)outputImage;
@end

@implementation CICheapBlur

- (id)_CICheapBlur
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_cheapBlur];
}

- (id)_CILerp
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_lerp];
}

- (id)outputImage
{
  v45[2] = *MEMORY[0x1E4F143B8];
  [(NSNumber *)self->inputPasses floatValue];
  float v4 = v3;
  [(NSNumber *)self->inputSampling floatValue];
  float v6 = v5;
  float v7 = floorf(v4);
  int v8 = (int)(float)(v7 + 1.0);
  inputImage = self->inputImage;
  BOOL v10 = v5 != 1.0 && v5 != 0.0;
  if (v10)
  {
    CGAffineTransformMakeScale(&v43, (float)(1.0 / v5), (float)(1.0 / v5));
    inputImage = [(CIImage *)inputImage imageByApplyingTransform:&v43];
  }
  if (v8 >= 1)
  {
    BOOL v38 = v10;
    float v39 = v6;
    float v37 = roundf((float)(v4 - v7) * 10.0) / 10.0;
    float v11 = 1.0;
    float v12 = 1.0;
    do
    {
      v13 = inputImage;
      double v14 = v11;
      v15 = +[CIVector vectorWithX:(float)(v12 * v11) / 3.0 Y:v11 / 3.0];
      [(CIImage *)v13 extent];
      CGRect v47 = CGRectInset(v46, (float)-v11 * 4.0 / 3.0, (float)-v11 * 4.0 / 3.0);
      double x = v47.origin.x;
      double y = v47.origin.y;
      double width = v47.size.width;
      double height = v47.size.height;
      float v20 = v11 * 4.0 / 3.0;
      id v21 = [(CICheapBlur *)self _CICheapBlur];
      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = __26__CICheapBlur_outputImage__block_invoke;
      v41[3] = &__block_descriptor_36_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
      float v42 = v20;
      v45[0] = v13;
      v45[1] = v15;
      inputImage = (CIImage *)objc_msgSend(v21, "applyWithExtent:roiCallback:arguments:", v41, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v45, 2), x, y, width, height);
      float v11 = v14 * 1.4142;
      float v12 = -v12;
      --v8;
    }
    while (v8);
    if (v13)
    {
      if (fabsf(v37) >= 0.01)
      {
        if (fabsf(v37 + -1.0) >= 0.01)
        {
          v22 = +[CIVector vectorWithX:v37];
          v48.origin.double x = x;
          v48.origin.double y = y;
          v48.size.double width = width;
          v48.size.double height = height;
          if (CGRectIsEmpty(v48))
          {
            [(CIImage *)inputImage extent];
            CGFloat v24 = v23;
            CGFloat v26 = v25;
            CGFloat v28 = v27;
            CGFloat v30 = v29;
            [(CIImage *)v13 extent];
            v51.origin.double x = v31;
            v51.origin.double y = v32;
            v51.size.double width = v33;
            v51.size.double height = v34;
            v49.origin.double x = v24;
            v49.origin.double y = v26;
            v49.size.double width = v28;
            v49.size.double height = v30;
            CGRect v50 = CGRectUnion(v49, v51);
            double x = v50.origin.x;
            double y = v50.origin.y;
            double width = v50.size.width;
            double height = v50.size.height;
          }
          id v35 = [(CICheapBlur *)self _CILerp];
          v44[0] = inputImage;
          v44[1] = v13;
          v44[2] = v22;
          inputImage = (CIImage *)objc_msgSend(v35, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v44, 3), x, y, width, height);
        }
      }
      else
      {
        inputImage = v13;
      }
    }
    float v6 = v39;
    BOOL v10 = v38;
  }
  if (v10)
  {
    CGAffineTransformMakeScale(&v40, v6, v6);
    inputImage = [(CIImage *)inputImage imageByApplyingTransform:&v40];
  }
  return inputImage;
}

double __26__CICheapBlur_outputImage__block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  *(void *)&double result = (unint64_t)CGRectInset(*(CGRect *)&a2, (float)-*(float *)(a1 + 32), (float)-*(float *)(a1 + 32));
  return result;
}

+ (id)customAttributes
{
  v9[3] = *MEMORY[0x1E4F143B8];
  v8[0] = @"CIAttributeFilterCategories";
  v7[0] = @"CICategoryBlur";
  v7[1] = @"CICategoryVideo";
  v7[2] = @"CICategoryStillImage";
  v7[3] = @"CICategoryBuiltIn";
  v7[4] = @"CICategoryApplePrivate";
  v9[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:5];
  v8[1] = @"inputPasses";
  v5[0] = @"CIAttributeMin";
  v5[1] = @"CIAttributeSliderMin";
  v6[0] = &unk_1EE4A7E70;
  v6[1] = &unk_1EE4A7E70;
  v5[2] = @"CIAttributeSliderMax";
  v5[3] = @"CIAttributeDefault";
  v6[2] = &unk_1EE4A7E80;
  v6[3] = &unk_1EE4A7E90;
  v5[4] = @"CIAttributeIdentity";
  v5[5] = @"CIAttributeType";
  v6[4] = &unk_1EE4A7E70;
  v6[5] = @"CIAttributeTypeDistance";
  v9[1] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:6];
  v8[2] = @"inputSampling";
  v3[0] = @"CIAttributeMin";
  v3[1] = @"CIAttributeSliderMin";
  v4[0] = &unk_1EE4A7EA0;
  v4[1] = &unk_1EE4A7EA0;
  v3[2] = @"CIAttributeSliderMax";
  v3[3] = @"CIAttributeDefault";
  v4[2] = &unk_1EE4A7E80;
  v4[3] = &unk_1EE4A7EA0;
  v3[4] = @"CIAttributeIdentity";
  v3[5] = @"CIAttributeType";
  v4[4] = &unk_1EE4A7EA0;
  v4[5] = @"CIAttributeTypeDistance";
  v9[2] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:6];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:3];
}

@end