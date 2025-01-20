@interface CIGlassLozenge
+ (id)customAttributes;
- (CIImage)inputImage;
- (id)_CILozengeRefraction;
- (id)outputImage;
- (void)setInputImage:(id)a3;
@end

@implementation CIGlassLozenge

- (id)_CILozengeRefraction
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_lozengeRefraction];
}

- (id)outputImage
{
  v50[8] = *MEMORY[0x1E4F143B8];
  [(NSNumber *)self->inputRadius floatValue];
  float v4 = v3;
  [(NSNumber *)self->inputRefraction floatValue];
  if (fabsf(v4) >= 0.001
    && (v6 = self->inputPoint0) != 0
    && self->inputPoint1
    && (float v7 = fmaxf(v5, 0.0001), fabsf(v7 + -1.0) >= 0.001))
  {
    [(CIVector *)v6 X];
    *(float *)&double v10 = v10;
    float v46 = *(float *)&v10;
    [(CIVector *)self->inputPoint0 Y];
    *(float *)&unsigned int v12 = v11;
    float r2 = *(float *)&v12;
    unint64_t v45 = __PAIR64__(v12, LODWORD(v46));
    [(CIVector *)self->inputPoint1 X];
    *(float *)&double v13 = v13;
    float v42 = *(float *)&v13;
    [(CIVector *)self->inputPoint1 Y];
    float v15 = v14;
    unint64_t v44 = __PAIR64__(LODWORD(v15), LODWORD(v42));
    double v16 = v4;
    float v17 = v46 - v42;
    if (v46 >= v42)
    {
      float v18 = v42;
    }
    else
    {
      float v17 = v42 - v46;
      float v18 = v46;
    }
    double v47 = v17 + v16 * 2.0;
    double v43 = (float)(v18 - v4);
    float v19 = r2 - v15;
    if (r2 < v15)
    {
      float v19 = v15 - r2;
      float v15 = r2;
    }
    double v20 = (float)(v15 - v4);
    [(CIVector *)self->inputPoint0 X];
    double v22 = v21;
    [(CIVector *)self->inputPoint1 X];
    float v24 = v22 - v23;
    [(CIVector *)self->inputPoint0 Y];
    double v26 = v25;
    [(CIVector *)self->inputPoint1 Y];
    float v28 = v26 - v27;
    float v29 = sqrtf((float)(v28 * v28) + (float)(v24 * v24));
    if (v29 == 0.0) {
      float v30 = v29;
    }
    else {
      float v30 = 1.0 / v29;
    }
    v31 = +[CIVector vectorWithX:(float)(v30 * v24) Y:(float)(v30 * v28)];
    v32 = +[CIVector vectorWithX:(float)-(float)(v30 * v28) Y:(float)(v30 * v24)];
    id v33 = [(CIGlassLozenge *)self _CILozengeRefraction];
    [(CIImage *)self->inputImage extent];
    v54.origin.double x = v43;
    v54.origin.double y = v20;
    v54.size.double width = v47;
    v54.size.double height = r2a;
    CGRect v53 = CGRectUnion(v52, v54);
    double x = v53.origin.x;
    double y = v53.origin.y;
    double width = v53.size.width;
    double height = v53.size.height;
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __29__CIGlassLozenge_outputImage__block_invoke;
    v48[3] = &__block_descriptor_52_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
    v48[4] = v45;
    v48[5] = v44;
    float v49 = v4;
    inputPoint0 = self->inputPoint0;
    v50[0] = self->inputImage;
    v50[1] = inputPoint0;
    inputRadius = self->inputRadius;
    v50[2] = self->inputPoint1;
    v50[3] = inputRadius;
    v50[4] = v31;
    v50[5] = v32;
    v50[6] = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(HIDWORD(v44), LODWORD(v7))));
    v50[7] = [NSNumber numberWithDouble:v16 + v16];
    return (id)objc_msgSend(v33, "applyWithExtent:roiCallback:arguments:", v48, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v50, 8), x, y, width, height);
  }
  else
  {
    v8 = self->inputImage;
    return v8;
  }
}

CGFloat __29__CIGlassLozenge_outputImage__block_invoke(uint64_t a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  int32x2_t v9 = *(int32x2_t *)(a1 + 32);
  int32x2_t v10 = *(int32x2_t *)(a1 + 40);
  if (vcgt_f32((float32x2_t)v10, (float32x2_t)v9).u8[0]) {
    LODWORD(v11) = *(void *)(a1 + 32);
  }
  else {
    LODWORD(v11) = *(void *)(a1 + 40);
  }
  double v12 = v11;
  if (vcgt_f32((float32x2_t)v9, (float32x2_t)v10).u8[0]) {
    LODWORD(v13) = *(void *)(a1 + 32);
  }
  else {
    LODWORD(v13) = *(void *)(a1 + 40);
  }
  double v14 = v13 - v12;
  float64x2_t v15 = vcvtq_f64_f32((float32x2_t)vbsl_s8((int8x8_t)vcgt_f32((float32x2_t)vzip2_s32(v9, v10), (float32x2_t)vzip2_s32(v10, v9)), (int8x8_t)vdup_lane_s32(v9, 1), (int8x8_t)vdup_lane_s32(v10, 1)));
  float64_t v16 = v15.f64[1];
  v15.f64[0] = v15.f64[0] - v15.f64[1];
  double v17 = (float)-*(float *)(a1 + 48);
  CGRect v28 = CGRectInset(*(CGRect *)&v12, v17, v17);
  v24.origin.CGFloat x = a2;
  v24.origin.CGFloat y = a3;
  v24.size.CGFloat width = a4;
  CGFloat r1 = a5;
  v24.size.CGFloat height = a5;
  CGRect v25 = CGRectIntersection(v24, v28);
  CGFloat x = v25.origin.x;
  CGFloat y = v25.origin.y;
  CGFloat width = v25.size.width;
  CGFloat height = v25.size.height;
  if (!CGRectIsEmpty(v25))
  {
    v26.origin.CGFloat x = x;
    v26.origin.CGFloat y = y;
    v26.size.CGFloat width = width;
    v26.size.CGFloat height = height;
    CGRect v29 = CGRectInset(v26, v17 + v17, v17 + v17);
    v27.origin.CGFloat x = a2;
    v27.origin.CGFloat y = a3;
    v27.size.CGFloat width = a4;
    v27.size.CGFloat height = r1;
    *(void *)&a2 = (unint64_t)CGRectUnion(v27, v29);
  }
  return a2;
}

+ (id)customAttributes
{
  v13[7] = *MEMORY[0x1E4F143B8];
  v12[0] = @"CIAttributeFilterCategories";
  v11[0] = @"CICategoryDistortionEffect";
  v11[1] = @"CICategoryVideo";
  v11[2] = @"CICategoryStillImage";
  v11[3] = @"CICategoryBuiltIn";
  v13[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:4];
  v13[1] = @"9";
  v12[1] = @"CIAttributeFilterAvailable_iOS";
  v12[2] = @"CIAttributeFilterAvailable_Mac";
  v13[2] = @"10.4";
  v12[3] = @"inputPoint0";
  v9[0] = @"CIAttributeType";
  v9[1] = @"CIAttributeDefault";
  v10[0] = @"CIAttributeTypePosition";
  v10[1] = +[CIVector vectorWithX:150.0 Y:150.0];
  v13[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  v12[4] = @"inputPoint1";
  v7[1] = @"CIAttributeDefault";
  v8[0] = @"CIAttributeTypePosition";
  v7[0] = @"CIAttributeType";
  v8[1] = +[CIVector vectorWithX:350.0 Y:150.0];
  v13[4] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];
  v12[5] = @"inputRefraction";
  v5[0] = @"CIAttributeType";
  v5[1] = @"CIAttributeMin";
  v6[0] = @"CIAttributeTypeScalar";
  v6[1] = &unk_1EE4AAAD8;
  v5[2] = @"CIAttributeSliderMin";
  v5[3] = @"CIAttributeSliderMax";
  v6[2] = &unk_1EE4A9000;
  v6[3] = &unk_1EE4A9010;
  v5[4] = @"CIAttributeIdentity";
  v5[5] = @"CIAttributeDefault";
  v6[4] = &unk_1EE4A9020;
  v6[5] = &unk_1EE4A9030;
  v13[5] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:6];
  v12[6] = @"inputRadius";
  v3[0] = @"CIAttributeType";
  v3[1] = @"CIAttributeMin";
  v4[0] = @"CIAttributeTypeDistance";
  v4[1] = &unk_1EE4A9000;
  v3[2] = @"CIAttributeSliderMin";
  v3[3] = @"CIAttributeSliderMax";
  v4[2] = &unk_1EE4A9000;
  v4[3] = &unk_1EE4A9040;
  v3[4] = @"CIAttributeDefault";
  v3[5] = @"CIAttributeIdentity";
  v4[4] = &unk_1EE4A9050;
  v4[5] = &unk_1EE4A9050;
  v13[6] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:6];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:7];
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
}

@end