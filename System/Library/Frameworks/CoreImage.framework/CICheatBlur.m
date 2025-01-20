@interface CICheatBlur
+ (id)customAttributes;
- (id)_CIBox4;
- (id)_CIBox6;
- (id)_CICross4;
- (id)outputImage;
@end

@implementation CICheatBlur

- (id)_CIBox4
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_box4];
}

- (id)_CIBox6
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_box6];
}

- (id)_CICross4
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_cross4];
}

- (id)outputImage
{
  v46[1] = *MEMORY[0x1E4F143B8];
  [(NSNumber *)self->inputAmount floatValue];
  double v4 = v3;
  inputImage = self->inputImage;
  double v6 = 1.0;
  if (v3 >= 9.0)
  {
    do
    {
      [(CIImage *)inputImage extent];
      CGFloat v8 = v7;
      CGFloat v10 = v9;
      CGFloat v12 = v11;
      CGFloat v14 = v13;
      CGAffineTransformMakeScale(&v43, 0.166666667, 0.166666667);
      v47.origin.double x = v8;
      v47.origin.double y = v10;
      v47.size.double width = v12;
      v47.size.double height = v14;
      CGRect v48 = CGRectApplyAffineTransform(v47, &v43);
      double x = v48.origin.x;
      double y = v48.origin.y;
      double width = v48.size.width;
      double height = v48.size.height;
      id v19 = [(CICheatBlur *)self _CIBox6];
      v46[0] = inputImage;
      inputImage = (CIImage *)objc_msgSend(v19, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_4, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v46, 1), x, y, width, height);
      double v4 = v4 * 0.166666667;
      double v6 = v6 * 6.0;
    }
    while (v4 >= 9.0);
  }
  if (v4 >= 6.0)
  {
    [(CIImage *)inputImage extent];
    CGFloat v21 = v20;
    CGFloat v23 = v22;
    CGFloat v25 = v24;
    CGFloat v27 = v26;
    CGAffineTransformMakeScale(&v42, 0.25, 0.25);
    v49.origin.double x = v21;
    v49.origin.double y = v23;
    v49.size.double width = v25;
    v49.size.double height = v27;
    CGRect v50 = CGRectApplyAffineTransform(v49, &v42);
    double v28 = v50.origin.x;
    double v29 = v50.origin.y;
    double v30 = v50.size.width;
    double v31 = v50.size.height;
    id v32 = [(CICheatBlur *)self _CIBox4];
    v45 = inputImage;
    inputImage = (CIImage *)objc_msgSend(v32, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_5, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v45, 1), v28, v29, v30, v31);
    double v4 = v4 * 0.25;
    double v6 = v6 * 4.0;
  }
  if (v4 >= 3.0)
  {
    v41[0] = 0x3FE0000000000000;
    v41[1] = 0;
    v41[2] = 0;
    v41[3] = 0x3FE0000000000000;
    v41[4] = 0;
    v41[5] = 0;
    inputImage = [(CIImage *)inputImage imageByApplyingTransform:v41];
    double v4 = v4 * 0.5;
    double v6 = v6 + v6;
  }
  if (v4 >= 0.0)
  {
    [(CIImage *)inputImage extent];
    CGRect v52 = CGRectInset(v51, -2.0, -2.0);
    double v33 = v52.origin.x;
    double v34 = v52.origin.y;
    double v35 = v52.size.width;
    double v36 = v52.size.height;
    id v37 = [(CICheatBlur *)self _CICross4];
    v44[0] = inputImage;
    double v38 = v4 * 0.333333333;
    *(float *)&double v38 = v4 * 0.333333333;
    v44[1] = [NSNumber numberWithFloat:v38];
    inputImage = (CIImage *)objc_msgSend(v37, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_7, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v44, 2), v33, v34, v35, v36);
  }
  if (v6 > 1.0)
  {
    *(double *)v40 = v6;
    v40[1] = 0;
    v40[2] = 0;
    *(double *)&v40[3] = v6;
    v40[4] = 0;
    v40[5] = 0;
    return [(CIImage *)inputImage imageByApplyingTransform:v40];
  }
  return inputImage;
}

double __26__CICheatBlur_outputImage__block_invoke(double a1, double a2, double a3, double a4)
{
  v5.origin.double x = a1 * 6.0;
  v5.origin.double y = a2 * 6.0;
  v5.size.double width = a3 * 6.0;
  v5.size.double height = a4 * 6.0;
  *(void *)&double result = (unint64_t)CGRectInset(v5, -3.0, -3.0);
  return result;
}

double __26__CICheatBlur_outputImage__block_invoke_2(double a1, double a2, double a3, double a4)
{
  v5.origin.double x = a1 * 4.0;
  v5.origin.double y = a2 * 4.0;
  v5.size.double width = a3 * 4.0;
  v5.size.double height = a4 * 4.0;
  *(void *)&double result = (unint64_t)CGRectInset(v5, -2.0, -2.0);
  return result;
}

double __26__CICheatBlur_outputImage__block_invoke_3(double a1, double a2, double a3, double a4)
{
  *(void *)&double result = (unint64_t)CGRectInset(*(CGRect *)&a1, -2.0, -2.0);
  return result;
}

+ (id)customAttributes
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v7[0] = @"CIAttributeFilterCategories";
  v6[0] = @"CICategoryBlur";
  v6[1] = @"CICategoryVideo";
  v6[2] = @"CICategoryStillImage";
  v6[3] = @"CICategoryBuiltIn";
  v6[4] = @"CICategoryApplePrivate";
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:5];
  v7[1] = @"inputAmount";
  v8[0] = v2;
  v4[0] = @"CIAttributeMin";
  v4[1] = @"CIAttributeSliderMin";
  v4[2] = @"CIAttributeSliderMax";
  v4[3] = @"CIAttributeDefault";
  v5[2] = &unk_1EE4A7EC0;
  v5[3] = &unk_1EE4A7ED0;
  v4[4] = @"CIAttributeIdentity";
  v4[5] = @"CIAttributeType";
  v5[0] = &unk_1EE4A7EB0;
  v5[1] = &unk_1EE4A7EB0;
  v5[4] = &unk_1EE4A7EB0;
  v5[5] = @"CIAttributeTypeDistance";
  v8[1] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:6];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];
}

@end