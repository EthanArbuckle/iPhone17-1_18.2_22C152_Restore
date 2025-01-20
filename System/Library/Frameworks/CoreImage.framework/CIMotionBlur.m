@interface CIMotionBlur
+ (id)customAttributes;
- (BOOL)_isIdentity;
- (CIImage)inputImage;
- (NSNumber)inputAngle;
- (NSNumber)inputRadius;
- (id)_blur:(id)a3 pass:(int)a4 weightsFactor:(float)a5 legacyExtent:(CGRect *)a6;
- (id)_kernel;
- (id)outputImage;
- (void)setInputAngle:(id)a3;
- (void)setInputImage:(id)a3;
- (void)setInputRadius:(id)a3;
@end

@implementation CIMotionBlur

+ (id)customAttributes
{
  v7[4] = *MEMORY[0x1E4F143B8];
  v6[0] = @"CIAttributeFilterCategories";
  v5[0] = @"CICategoryBlur";
  v5[1] = @"CICategoryStillImage";
  v5[2] = @"CICategoryVideo";
  v5[3] = @"CICategoryBuiltIn";
  v7[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:4];
  v7[1] = @"8.3";
  v6[1] = @"CIAttributeFilterAvailable_iOS";
  v6[2] = @"CIAttributeFilterAvailable_Mac";
  v7[2] = @"10.4";
  v6[3] = @"inputRadius";
  v3[0] = @"CIAttributeMin";
  v3[1] = @"CIAttributeSliderMin";
  v4[0] = &unk_1EE4A94A0;
  v4[1] = &unk_1EE4A94A0;
  v3[2] = @"CIAttributeSliderMax";
  v3[3] = @"CIAttributeIdentity";
  v4[2] = &unk_1EE4A94B0;
  v4[3] = &unk_1EE4A94A0;
  v3[4] = @"CIAttributeDefault";
  v3[5] = @"CIAttributeType";
  v4[4] = &unk_1EE4A94C0;
  v4[5] = @"CIAttributeTypeDistance";
  v7[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:6];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:4];
}

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_motionBlur];
}

- (id)_blur:(id)a3 pass:(int)a4 weightsFactor:(float)a5 legacyExtent:(CGRect *)a6
{
  char v8 = a4;
  v33[2] = *MEMORY[0x1E4F143B8];
  [(NSNumber *)self->inputAngle floatValue];
  float v12 = sinf(v11);
  float v13 = (float)(1 << v8);
  [(NSNumber *)self->inputAngle floatValue];
  float v15 = cosf(v14) * v13;
  float v16 = fabsf(v12 * v13);
  float v17 = ceil(v16 + v16);
  float v18 = fabsf(v15);
  float v19 = ceil(v18 + v18);
  v20 = +[CIVector vectorWithX:v15 Y:(float)(v12 * v13) Z:(float)(1.0 - a5) + a5 * 0.375 W:a5 * 0.25];
  [a3 extent];
  CGRect v35 = CGRectInset(v34, (float)-v19, (float)-v17);
  double y = v35.origin.y;
  double x = v35.origin.x;
  double width = v35.size.width;
  double height = v35.size.height;
  float v22 = -v15;
  if (v15 >= 0.0) {
    float v22 = v15;
  }
  double v23 = -floor(v22 + v22);
  float v24 = -(float)(v12 * v13);
  if ((float)(v12 * v13) >= 0.0) {
    float v24 = v12 * v13;
  }
  *a6 = CGRectInset(*a6, v23, -floor(v24 + v24));
  id v25 = [(CIMotionBlur *)self _kernel];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __54__CIMotionBlur__blur_pass_weightsFactor_legacyExtent___block_invoke;
  v30[3] = &__block_descriptor_40_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
  float v31 = v19;
  float v32 = v17;
  v33[0] = a3;
  v33[1] = v20;
  return (id)objc_msgSend(v25, "applyWithExtent:roiCallback:arguments:", v30, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v33, 2), x, y, width, height);
}

double __54__CIMotionBlur__blur_pass_weightsFactor_legacyExtent___block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  *(void *)&double result = (unint64_t)CGRectInset(*(CGRect *)&a2, (float)-*(float *)(a1 + 32), (float)-*(float *)(a1 + 36));
  return result;
}

- (BOOL)_isIdentity
{
  [(NSNumber *)self->inputRadius floatValue];
  return v2 < 0.001;
}

- (id)outputImage
{
  if (!self->inputImage) {
    return 0;
  }
  if ([(CIMotionBlur *)self _isIdentity])
  {
    v3 = self->inputImage;
    return v3;
  }
  else
  {
    [(NSNumber *)self->inputRadius floatValue];
    float v6 = v5 * v5;
    float v7 = 1.0833;
    uint64_t v8 = 0;
    if (v6 > 1.0833)
    {
      float v9 = 1.0;
      do
      {
        float v10 = v7;
        uint64_t v8 = (v8 + 1);
        float v9 = v9 * 4.0;
        float v7 = v7 + v9;
      }
      while (v6 > v7);
      float v6 = v6 - v10;
      float v7 = v7 - v10;
    }
    float v11 = v6 / v7;
    inputImage = self->inputImage;
    [(CIImage *)inputImage extent];
    double v19 = v13;
    double v20 = v14;
    double v21 = v15;
    double v22 = v16;
    if ((int)v8 < 1)
    {
      uint64_t v8 = 0;
    }
    else
    {
      uint64_t v17 = 0;
      do
      {
        LODWORD(v13) = 1.0;
        inputImage = [(CIMotionBlur *)self _blur:inputImage pass:v17 weightsFactor:&v19 legacyExtent:v13];
        uint64_t v17 = (v17 + 1);
      }
      while (v8 != v17);
    }
    *(float *)&double v13 = v11;
    id v18 = [(CIMotionBlur *)self _blur:inputImage pass:v8 weightsFactor:&v19 legacyExtent:v13];
    return (id)objc_msgSend(v18, "imageByCroppingToRect:", v19, v20, v21, v22);
  }
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

- (NSNumber)inputAngle
{
  return self->inputAngle;
}

- (void)setInputAngle:(id)a3
{
}

@end