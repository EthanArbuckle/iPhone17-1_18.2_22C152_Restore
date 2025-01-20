@interface CITorusLensDistortion
+ (id)customAttributes;
- (CIImage)inputImage;
- (id)_CITorusRefraction;
- (id)outputImage;
- (void)setInputImage:(id)a3;
@end

@implementation CITorusLensDistortion

- (id)_CITorusRefraction
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_torusRefraction];
}

- (id)outputImage
{
  v39[7] = *MEMORY[0x1E4F143B8];
  [(NSNumber *)self->inputRadius floatValue];
  float v4 = v3;
  [(NSNumber *)self->inputWidth floatValue];
  float v6 = v5;
  [(NSNumber *)self->inputRefraction floatValue];
  float v8 = v7;
  if (fabsf(v4) >= 0.001
    && ([(NSNumber *)self->inputWidth floatValue], fabsf(v9) >= 0.001)
    && (float v10 = fmaxf(v8, 0.0001), fabsf(v10 + -1.0) >= 0.001))
  {
    double v13 = v4;
    float v14 = (1.0 - (float)(v6 / v4)) * v4;
    *(float *)&unsigned int v15 = 2.0 / (float)(v4 - v14);
    float v16 = (float)-(float)(v4 + v14) / (float)(v4 - v14);
    float v37 = (float)(v4 - v14) * 0.5;
    [(CIVector *)self->inputCenter X];
    float64_t v36 = v17;
    [(CIVector *)self->inputCenter Y];
    v18.f64[0] = v36;
    v18.f64[1] = v19;
    float32x2_t v20 = vcvt_f32_f64(v18);
    [(CIVector *)self->inputCenter X];
    CGFloat v22 = v21 - v13;
    [(CIVector *)self->inputCenter Y];
    CGFloat v24 = v23 - v13;
    id v25 = [(CITorusLensDistortion *)self _CITorusRefraction];
    [(CIImage *)self->inputImage extent];
    v43.origin.double x = v22;
    v43.origin.double y = v24;
    v43.size.double width = v13 + v13;
    v43.size.double height = v13 + v13;
    CGRect v42 = CGRectUnion(v41, v43);
    double x = v42.origin.x;
    double y = v42.origin.y;
    double width = v42.size.width;
    double height = v42.size.height;
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __36__CITorusLensDistortion_outputImage__block_invoke;
    v38[3] = &unk_1E5770DE0;
    v38[5] = v20;
    v38[4] = self;
    inputCenter = self->inputCenter;
    v39[0] = self->inputImage;
    v39[1] = inputCenter;
    v39[2] = [NSNumber numberWithFloat:COERCE_DOUBLE((unint64_t)v15)];
    *(float *)&double v31 = v16;
    v39[3] = [NSNumber numberWithFloat:v31];
    *(float *)&double v32 = v37;
    v39[4] = [NSNumber numberWithFloat:v32];
    *(float *)&double v33 = v10;
    uint64_t v34 = [NSNumber numberWithFloat:v33];
    inputWidth = self->inputWidth;
    v39[5] = v34;
    v39[6] = inputWidth;
    return (id)objc_msgSend(v25, "applyWithExtent:roiCallback:arguments:", v38, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v39, 7), x, y, width, height);
  }
  else
  {
    v11 = self->inputImage;
    return v11;
  }
}

CGFloat __36__CITorusLensDistortion_outputImage__block_invoke(uint64_t a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  uint64_t v19 = *(void *)(a1 + 40);
  [*(id *)(*(void *)(a1 + 32) + 96) floatValue];
  float v11 = v10;
  [*(id *)(*(void *)(a1 + 32) + 104) floatValue];
  float v18 = v12;
  v24.origin.CGFloat x = (float)(*(float *)&v19 - v11);
  v24.origin.CGFloat y = (float)(*((float *)&v19 + 1) - v11);
  v24.size.CGFloat width = v11 + v11;
  v20.origin.CGFloat x = a2;
  v20.origin.CGFloat y = a3;
  v20.size.CGFloat width = a4;
  v20.size.CGFloat height = a5;
  v24.size.CGFloat height = v24.size.width;
  CGRect v21 = CGRectIntersection(v20, v24);
  CGFloat x = v21.origin.x;
  CGFloat y = v21.origin.y;
  CGFloat width = v21.size.width;
  CGFloat height = v21.size.height;
  if (!CGRectIsEmpty(v21))
  {
    v22.origin.CGFloat x = x;
    v22.origin.CGFloat y = y;
    v22.size.CGFloat width = width;
    v22.size.CGFloat height = height;
    CGRect v25 = CGRectInset(v22, v18 * -5.0, v18 * -5.0);
    v23.origin.CGFloat x = a2;
    v23.origin.CGFloat y = a3;
    v23.size.CGFloat width = a4;
    v23.size.CGFloat height = a5;
    *(void *)&a2 = (unint64_t)CGRectUnion(v23, v25);
  }
  return a2;
}

+ (id)customAttributes
{
  v11[6] = *MEMORY[0x1E4F143B8];
  v10[0] = @"CIAttributeFilterCategories";
  v9[0] = @"CICategoryDistortionEffect";
  v9[1] = @"CICategoryVideo";
  v9[2] = @"CICategoryStillImage";
  v9[3] = @"CICategoryBuiltIn";
  v11[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:4];
  v11[1] = @"9";
  v10[1] = @"CIAttributeFilterAvailable_iOS";
  v10[2] = @"CIAttributeFilterAvailable_Mac";
  v11[2] = @"10.4";
  v10[3] = @"inputRefraction";
  v7[0] = @"CIAttributeType";
  v7[1] = @"CIAttributeMin";
  v8[0] = @"CIAttributeTypeScalar";
  v8[1] = &unk_1EE4A9000;
  v7[2] = @"CIAttributeSliderMin";
  v7[3] = @"CIAttributeSliderMax";
  v8[2] = &unk_1EE4A9000;
  v8[3] = &unk_1EE4A9010;
  v7[4] = @"CIAttributeDefault";
  v7[5] = @"CIAttributeIdentity";
  v8[4] = &unk_1EE4A9030;
  v8[5] = &unk_1EE4A9020;
  v11[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:6];
  v10[4] = @"inputWidth";
  v5[0] = @"CIAttributeMin";
  v5[1] = @"CIAttributeSliderMin";
  v6[0] = &unk_1EE4A9000;
  v6[1] = &unk_1EE4A9000;
  v5[2] = @"CIAttributeSliderMax";
  v5[3] = @"CIAttributeDefault";
  v6[2] = &unk_1EE4A9060;
  v6[3] = &unk_1EE4A9070;
  v5[4] = @"CIAttributeIdentity";
  v5[5] = @"CIAttributeType";
  v6[4] = &unk_1EE4A9000;
  v6[5] = @"CIAttributeTypeDistance";
  v11[4] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:6];
  v10[5] = @"inputRadius";
  v3[0] = @"CIAttributeMin";
  v3[1] = @"CIAttributeSliderMin";
  v4[0] = &unk_1EE4A9000;
  v4[1] = &unk_1EE4A9000;
  v3[2] = @"CIAttributeSliderMax";
  v3[3] = @"CIAttributeDefault";
  v4[2] = &unk_1EE4A9080;
  v4[3] = &unk_1EE4A9090;
  v3[4] = @"CIAttributeIdentity";
  v3[5] = @"CIAttributeType";
  v4[4] = &unk_1EE4A9000;
  v4[5] = @"CIAttributeTypeDistance";
  v11[5] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:6];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:6];
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
}

@end