@interface CISoftCubicUpsample
+ (id)customAttributes;
- (BOOL)_isIdentity;
- (CIImage)inputImage;
- (NSNumber)inputScale;
- (id)outputImage;
- (int32x2_t)_scale;
- (void)setInputImage:(id)a3;
- (void)setInputScale:(id)a3;
@end

@implementation CISoftCubicUpsample

+ (id)customAttributes
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v6[0] = @"CIAttributeFilterCategories";
  v5[0] = @"CICategoryGeometryAdjustment";
  v5[1] = @"CICategoryVideo";
  v5[2] = @"CICategoryStillImage";
  v5[3] = @"CICategoryBuiltIn";
  v5[4] = @"CICategoryApplePrivate";
  v7[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:5];
  v6[1] = @"inputScale";
  v3[0] = @"CIAttributeMin";
  v3[1] = @"CIAttributeSliderMin";
  v3[2] = @"CIAttributeSliderMax";
  v3[3] = @"CIAttributeDefault";
  v4[2] = &unk_1EE4A9C80;
  v4[3] = &unk_1EE4A9CD0;
  v3[4] = @"CIAttributeIdentity";
  v3[5] = @"CIAttributeType";
  v4[0] = &unk_1EE4A9C90;
  v4[1] = &unk_1EE4A9C90;
  v4[4] = &unk_1EE4A9C90;
  v4[5] = @"CIAttributeTypeDistance";
  v7[1] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:6];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];
}

- (int32x2_t)_scale
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [*(id *)(a1 + 88) doubleValue];
    double v3 = fmax(v2, 1.0);
    *(float *)&double v3 = v3;
    return vdup_lane_s32(*(int32x2_t *)&v3, 0);
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = *(void **)(a1 + 88);
      [v5 X];
      float64_t v14 = v6;
      [v5 Y];
      v7.f64[0] = v14;
      v7.f64[1] = v8;
      __asm { FMOV            V0.2D, #1.0 }
      return (int32x2_t)vcvt_f32_f64(vmaxnmq_f64(v7, _Q0));
    }
    else
    {
      __asm { FMOV            V0.2S, #1.0 }
    }
  }
  return result;
}

- (BOOL)_isIdentity
{
  [(CISoftCubicUpsample *)self _scale];
  return v3 <= 1.0 && v2 <= 1.0;
}

- (id)outputImage
{
  v52[2] = *MEMORY[0x1E4F143B8];
  if (!self->inputImage) {
    return 0;
  }
  if ([(CISoftCubicUpsample *)self _isIdentity])
  {
    float v3 = self->inputImage;
    return v3;
  }
  [(CISoftCubicUpsample *)self _scale];
  __asm { FMOV            V1.2S, #1.0 }
  float32x2_t v40 = v10;
  float32x2_t v39 = vdiv_f32(_D1, v10);
  [(CIImage *)self->inputImage extent];
  double x = v54.origin.x;
  double y = v54.origin.y;
  double width = v54.size.width;
  double height = v54.size.height;
  if (CGRectIsInfinite(v54))
  {
    *(int64x2_t *)&v49.double var0 = vdupq_n_s64(0xFFDFFFFFFFFFFFFFLL);
    *(int64x2_t *)&v49.double var2 = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
    float v16 = v40.f32[1];
    float v15 = v40.f32[0];
    BOOL v17 = v40.f32[1] == 1.0;
    if (v40.f32[1] == 1.0) {
      float v18 = 0.0;
    }
    else {
      float v18 = 2.0;
    }
    BOOL v19 = v40.f32[0] == 1.0;
    if (v40.f32[0] == 1.0) {
      float v20 = 0.0;
    }
    else {
      float v20 = 2.0;
    }
    double y = -8.98846567e307;
    double height = 1.79769313e308;
    double width = 1.79769313e308;
LABEL_30:
    double x = -8.98846567e307;
    if (y == -8.98846567e307 && width == 1.79769313e308 && height == 1.79769313e308)
    {
LABEL_34:
      *(int64x2_t *)&v49.double var0 = vdupq_n_s64(0xFFDFFFFFFFFFFFFFLL);
      *(int64x2_t *)&v49.double var2 = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
      if (v19) {
        goto LABEL_35;
      }
      goto LABEL_45;
    }
    goto LABEL_33;
  }
  v55.origin.double x = x;
  v55.origin.double y = y;
  v55.size.double width = width;
  v55.size.double height = height;
  if (CGRectIsNull(v55))
  {
    *(int64x2_t *)&v49.double var0 = vdupq_n_s64(0x7FF0000000000000uLL);
    v49.double var2 = 0.0;
    v49.double var3 = 0.0;
    float v16 = v40.f32[1];
    float v15 = v40.f32[0];
    BOOL v17 = v40.f32[1] == 1.0;
    if (v40.f32[1] == 1.0) {
      float v18 = 0.0;
    }
    else {
      float v18 = 2.0;
    }
    BOOL v19 = v40.f32[0] == 1.0;
    if (v40.f32[0] == 1.0) {
      float v20 = 0.0;
    }
    else {
      float v20 = 2.0;
    }
    double width = 0.0;
    double y = INFINITY;
    double height = 0.0;
    double x = INFINITY;
    goto LABEL_33;
  }
  v49.double var0 = x;
  v49.double var1 = y;
  v49.double var2 = width;
  v49.double var3 = height;
  float v16 = v40.f32[1];
  float v15 = v40.f32[0];
  BOOL v17 = v40.f32[1] == 1.0;
  if (v40.f32[1] == 1.0) {
    float v18 = 0.0;
  }
  else {
    float v18 = 2.0;
  }
  BOOL v19 = v40.f32[0] == 1.0;
  if (v40.f32[0] == 1.0) {
    float v20 = 0.0;
  }
  else {
    float v20 = 2.0;
  }
  if (x == -8.98846567e307) {
    goto LABEL_30;
  }
LABEL_33:
  float v41 = v15;
  v56.origin.double x = x;
  v56.origin.double y = y;
  v56.size.double width = width;
  v56.size.double height = height;
  if (CGRectIsInfinite(v56)) {
    goto LABEL_34;
  }
  Rectangle::inset(&v49, -v18, -v20, (uint64_t)&v45);
  if (fabs(v45.f64[0]) == INFINITY || fabs(v45.f64[1]) == INFINITY)
  {
    *(int64x2_t *)&v47.double var0 = vdupq_n_s64(0x7FF0000000000000uLL);
    v47.double var2 = 0.0;
    v47.double var3 = 0.0;
  }
  else
  {
    float64x2_t v37 = (float64x2_t)vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
    float64x2_t v38 = (float64x2_t)vdupq_n_s64(0xFFDFFFFFFFFFFFFFLL);
    if (vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqq_f64(v45, v38), (int32x4_t)vceqq_f64(v46, v37))))))
    {
      v47.double var0 = v45.f64[0] * v41;
      v47.double var1 = v45.f64[1] * v16;
      v47.double var2 = v41 * v46.f64[0];
      v47.double var3 = vmuld_lane_f64(v16, v46, 1);
    }
    else
    {
      *(float64x2_t *)&v47.double var0 = v38;
      *(float64x2_t *)&v47.double var2 = v37;
    }
  }
  Rectangle::integralize(&v47, 0.0001, (uint64_t)&v48);
  Rectangle v49 = v48;
  if (v19)
  {
LABEL_35:
    v21 = +[CIKernel kernelWithInternalRepresentation:&CI::_cubicUpsample10v];
    double var0 = v49.var0;
    double var1 = v49.var1;
    double var2 = v49.var2;
    double var3 = v49.var3;
    if (v49.var0 == -8.98846567e307
      && v49.var1 == -8.98846567e307
      && v49.var2 == 1.79769313e308
      && v49.var3 == 1.79769313e308)
    {
      double var0 = *MEMORY[0x1E4F1DB10];
      double var1 = *(double *)(MEMORY[0x1E4F1DB10] + 8);
      double var2 = *(double *)(MEMORY[0x1E4F1DB10] + 16);
      double var3 = *(double *)(MEMORY[0x1E4F1DB10] + 24);
    }
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __34__CISoftCubicUpsample_outputImage__block_invoke;
    v44[3] = &__block_descriptor_40_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
    HIDWORD(v26) = v39.i32[1];
    v44[4] = v39;
    v52[0] = self->inputImage;
    LODWORD(v26) = v39.i32[1];
    v52[1] = [NSNumber numberWithFloat:v26];
    return -[CIKernel applyWithExtent:roiCallback:arguments:](v21, "applyWithExtent:roiCallback:arguments:", v44, [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:2], var0, var1, var2, var3);
  }
LABEL_45:
  if (v17)
  {
    v27 = +[CIKernel kernelWithInternalRepresentation:&CI::_cubicUpsample10h];
    double v28 = v49.var0;
    double v29 = v49.var1;
    double v31 = v49.var2;
    double v30 = v49.var3;
    if (v49.var0 == -8.98846567e307
      && v49.var1 == -8.98846567e307
      && v49.var2 == 1.79769313e308
      && v49.var3 == 1.79769313e308)
    {
      double v28 = *MEMORY[0x1E4F1DB10];
      double v29 = *(double *)(MEMORY[0x1E4F1DB10] + 8);
      double v31 = *(double *)(MEMORY[0x1E4F1DB10] + 16);
      double v30 = *(double *)(MEMORY[0x1E4F1DB10] + 24);
    }
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __34__CISoftCubicUpsample_outputImage__block_invoke_2;
    v43[3] = &__block_descriptor_40_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
    v43[4] = v39;
    v51[0] = self->inputImage;
    v51[1] = objc_msgSend(NSNumber, "numberWithFloat:");
    return -[CIKernel applyWithExtent:roiCallback:arguments:](v27, "applyWithExtent:roiCallback:arguments:", v43, [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:2], v28, v29, v31, v30);
  }
  else
  {
    v32 = +[CIKernel kernelWithInternalRepresentation:&CI::_cubicUpsample10];
    double v33 = v49.var0;
    double v34 = v49.var1;
    double v36 = v49.var2;
    double v35 = v49.var3;
    if (v49.var0 == -8.98846567e307
      && v49.var1 == -8.98846567e307
      && v49.var2 == 1.79769313e308
      && v49.var3 == 1.79769313e308)
    {
      double v33 = *MEMORY[0x1E4F1DB10];
      double v34 = *(double *)(MEMORY[0x1E4F1DB10] + 8);
      double v36 = *(double *)(MEMORY[0x1E4F1DB10] + 16);
      double v35 = *(double *)(MEMORY[0x1E4F1DB10] + 24);
    }
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __34__CISoftCubicUpsample_outputImage__block_invoke_3;
    v42[3] = &__block_descriptor_40_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
    v42[4] = v39;
    v50[0] = self->inputImage;
    v50[1] = +[CIVector vectorWithX:v39.f32[0] Y:v39.f32[1]];
    return -[CIKernel applyWithExtent:roiCallback:arguments:](v32, "applyWithExtent:roiCallback:arguments:", v42, [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:2], v33, v34, v36, v35);
  }
}

float64_t __34__CISoftCubicUpsample_outputImage__block_invoke(float32x2_t *a1, float64_t a2, float64_t a3, double a4, double a5)
{
  return a2;
}

void __34__CISoftCubicUpsample_outputImage__block_invoke_2(float32x2_t *a1, float64_t a2, float64_t a3, double a4, double a5)
{
}

double __34__CISoftCubicUpsample_outputImage__block_invoke_3(float32x2_t *a1, float64_t a2, float64_t a3, double a4, double a5)
{
  return upsampleRoi(a2, a3, a4, a5, a1[4]);
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
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