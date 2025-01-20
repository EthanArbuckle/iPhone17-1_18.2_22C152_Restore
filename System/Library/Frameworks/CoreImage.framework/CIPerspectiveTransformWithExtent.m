@interface CIPerspectiveTransformWithExtent
+ (id)customAttributes;
- (CIImage)inputImage;
- (CIVector)inputBottomLeft;
- (CIVector)inputBottomRight;
- (CIVector)inputExtent;
- (CIVector)inputTopLeft;
- (CIVector)inputTopRight;
- (id)_kernel;
- (id)outputImage;
- (void)setInputBottomLeft:(id)a3;
- (void)setInputBottomRight:(id)a3;
- (void)setInputExtent:(id)a3;
- (void)setInputImage:(id)a3;
- (void)setInputTopLeft:(id)a3;
- (void)setInputTopRight:(id)a3;
@end

@implementation CIPerspectiveTransformWithExtent

+ (id)customAttributes
{
  v15[8] = *MEMORY[0x1E4F143B8];
  v14[0] = @"CIAttributeFilterCategories";
  v13[0] = @"CICategoryGeometryAdjustment";
  v13[1] = @"CICategoryVideo";
  v13[2] = @"CICategoryStillImage";
  v13[3] = @"CICategoryBuiltIn";
  v15[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:4];
  v15[1] = @"6";
  v14[1] = @"CIAttributeFilterAvailable_iOS";
  v14[2] = @"CIAttributeFilterAvailable_Mac";
  v15[2] = @"10.4";
  v14[3] = @"inputExtent";
  v11[0] = @"CIAttributeType";
  v11[1] = @"CIAttributeDefault";
  v12[0] = @"CIAttributeTypeRectangle";
  v12[1] = +[CIVector vectorWithX:0.0 Y:0.0 Z:300.0 W:300.0];
  v15[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  v14[4] = @"inputBottomLeft";
  v9[0] = @"CIAttributeDefault";
  v9[1] = @"CIAttributeType";
  v10[0] = +[CIVector vectorWithX:155.0 Y:153.0];
  v10[1] = @"CIAttributeTypePosition";
  v15[4] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  v14[5] = @"inputBottomRight";
  v7[0] = @"CIAttributeDefault";
  v7[1] = @"CIAttributeType";
  v8[0] = +[CIVector vectorWithX:548.0 Y:140.0];
  v8[1] = @"CIAttributeTypePosition";
  v15[5] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];
  v14[6] = @"inputTopRight";
  v5[0] = @"CIAttributeDefault";
  v5[1] = @"CIAttributeType";
  v6[0] = +[CIVector vectorWithX:646.0 Y:507.0];
  v6[1] = @"CIAttributeTypePosition";
  v15[6] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:2];
  v14[7] = @"inputTopLeft";
  v3[0] = @"CIAttributeDefault";
  v3[1] = @"CIAttributeType";
  v4[0] = +[CIVector vectorWithX:118.0 Y:484.0];
  v4[1] = @"CIAttributeTypePosition";
  v15[7] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:2];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:8];
}

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_perspectiveTransform];
}

- (id)outputImage
{
  v78[9] = *(double *)MEMORY[0x1E4F143B8];
  if (!self->inputImage) {
    return 0;
  }
  id result = self->inputExtent;
  if (result)
  {
    [result CGRectValue];
    double v5 = v4;
    double v7 = v6;
    v8 = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:");
    [(CIVector *)v8 X];
    float64_t v57 = v9;
    [(CIVector *)v8 Y];
    float64_t v56 = v10;
    [(CIVector *)self->inputBottomLeft X];
    float64_t v58 = v11;
    [(CIVector *)self->inputBottomLeft Y];
    v12.f64[0] = v58;
    v12.f64[1] = v13;
    double v75 = COERCE_DOUBLE(vcvt_f32_f64(v12));
    [(CIVector *)self->inputBottomRight X];
    float64_t v59 = v14;
    [(CIVector *)self->inputBottomRight Y];
    v15.f64[0] = v59;
    v15.f64[1] = v16;
    float32x2_t v74 = vcvt_f32_f64(v15);
    [(CIVector *)self->inputTopLeft X];
    float64_t v60 = v17;
    [(CIVector *)self->inputTopLeft Y];
    v18.f64[0] = v60;
    v18.f64[1] = v19;
    float32x2_t v73 = vcvt_f32_f64(v18);
    [(CIVector *)self->inputTopRight X];
    float64_t v61 = v20;
    [(CIVector *)self->inputTopRight Y];
    v21.f64[0] = v61;
    v21.f64[1] = v22;
    float32x2_t v72 = vcvt_f32_f64(v21);
    computeHomogeneousPerspectiveTransformAndInverse(v77, (uint64_t)v78, v75, v74, v72, v73);
    v23 = +[CIVector vectorWithX:v5 * v77[0] Y:v5 * v77[3] Z:v5 * v77[6]];
    v24 = +[CIVector vectorWithX:v7 * v77[1] Y:v7 * v77[4] Z:v7 * v77[7]];
    v25 = +[CIVector vectorWithX:v77[2] Y:v77[5] Z:v77[8]];
    [(CIVector *)v23 X];
    float64_t v62 = v26;
    [(CIVector *)v23 Y];
    float64_t v54 = v27;
    [(CIVector *)v23 Z];
    double v29 = v28;
    [(CIVector *)v24 X];
    float64_t v55 = v30;
    [(CIVector *)v24 Y];
    float64_t v52 = v31;
    [(CIVector *)v24 Z];
    double v33 = v32;
    [(CIVector *)v25 X];
    float64_t v53 = v34;
    [(CIVector *)v25 Y];
    float64_t v51 = v35;
    [(CIVector *)v25 Z];
    double v37 = v36;
    [(CIImage *)self->inputImage extent];
    if (CGRectIsInfinite(v79)) {
      goto LABEL_8;
    }
    *(int64x2_t *)&v71.double var0 = vdupq_n_s64(0x7FF0000000000000uLL);
    v71.double var2 = 0.0;
    v71.double var3 = 0.0;
    Rectangle::Union(&v71, (const vec2 *)&v75, (uint64_t)&v70);
    Rectangle v71 = v70;
    Rectangle::Union(&v71, (const vec2 *)&v74, (uint64_t)&v70);
    Rectangle v71 = v70;
    Rectangle::Union(&v71, (const vec2 *)&v72, (uint64_t)&v70);
    Rectangle v71 = v70;
    Rectangle::Union(&v71, (const vec2 *)&v73, (uint64_t)&v70);
    Rectangle v71 = v70;
    Rectangle::integralize(&v71, 0.0001, (uint64_t)&v70);
    double var1 = v70.var1;
    double var0 = v70.var0;
    double var3 = v70.var3;
    double var2 = v70.var2;
    if (v70.var0 == -8.98846567e307
      && v70.var1 == -8.98846567e307
      && v70.var2 == 1.79769313e308
      && v70.var3 == 1.79769313e308)
    {
LABEL_8:
      double var0 = *MEMORY[0x1E4F1DB10];
      double var1 = *(double *)(MEMORY[0x1E4F1DB10] + 8);
      double var2 = *(double *)(MEMORY[0x1E4F1DB10] + 16);
      double var3 = *(double *)(MEMORY[0x1E4F1DB10] + 24);
    }
    id v42 = [(CIPerspectiveTransformWithExtent *)self _kernel];
    v43.f64[0] = v57;
    v43.f64[1] = v56;
    v44.f64[0] = v62;
    v44.f64[1] = v54;
    *(float32x2_t *)&v44.f64[0] = vcvt_f32_f64(v44);
    float v45 = v29;
    *(float *)&v44.f64[1] = v45;
    v46.f64[0] = v55;
    v46.f64[1] = v52;
    *(float32x2_t *)&v46.f64[0] = vcvt_f32_f64(v46);
    float v47 = v33;
    *(float *)&v46.f64[1] = v47;
    v48.f64[0] = v53;
    v48.f64[1] = v51;
    float v49 = v37;
    v63[0] = MEMORY[0x1E4F143A8];
    v63[1] = 3221225472;
    v63[2] = __47__CIPerspectiveTransformWithExtent_outputImage__block_invoke;
    v63[3] = &__block_descriptor_88_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
    int v64 = LODWORD(v44.f64[1]);
    int v66 = LODWORD(v46.f64[1]);
    v63[4] = *(void *)&v44.f64[0];
    float64_t v65 = v46.f64[0];
    float v68 = v49;
    float32x2_t v67 = vcvt_f32_f64(v48);
    float32x2_t v69 = vcvt_f32_f64(v43);
    inputImage = self->inputImage;
    v76[0] = v23;
    v76[1] = v24;
    v76[2] = v25;
    v76[3] = v8;
    return (id)objc_msgSend(v42, "applyWithExtent:roiCallback:inputImage:arguments:", v63, inputImage, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v76, 4), var0, var1, var2, var3);
  }
  return result;
}

void __47__CIPerspectiveTransformWithExtent_outputImage__block_invoke(uint64_t a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  if (CGRectIsInfinite(*(CGRect *)&a2))
  {
    double v10 = -8.98846567e307;
    double v11 = 1.79769313e308;
    double v12 = 1.79769313e308;
    double v13 = -8.98846567e307;
  }
  else
  {
    v60.origin.x = a2;
    v60.origin.y = a3;
    v60.size.width = a4;
    v60.size.height = a5;
    BOOL IsNull = CGRectIsNull(v60);
    double v12 = 0.0;
    if (IsNull) {
      double v11 = 0.0;
    }
    else {
      double v11 = a4;
    }
    if (IsNull)
    {
      double v10 = INFINITY;
    }
    else
    {
      double v12 = a5;
      double v10 = a3;
    }
    if (IsNull) {
      double v13 = INFINITY;
    }
    else {
      double v13 = a2;
    }
  }
  float32x4_t v54 = *(float32x4_t *)(a1 + 32);
  float32x4_t v55 = *(float32x4_t *)(a1 + 48);
  float32x4_t v56 = *(float32x4_t *)(a1 + 64);
  float32x2_t v15 = *(float32x2_t *)(a1 + 80);
  *(int64x2_t *)&v59.double var0 = vdupq_n_s64(0x7FF0000000000000uLL);
  double v16 = v11 + v13;
  float32_t v17 = fmin(v13, v11 + v13);
  double v18 = v12 + v10;
  float v19 = fmin(v10, v12 + v10);
  __asm { FMOV            V2.4S, #1.0 }
  float v51 = v19;
  float32x4_t v52 = _Q2;
  _Q2.f32[0] = v17;
  float32x4_t v49 = _Q2;
  float32x4_t v25 = _Q2;
  v25.f32[1] = v19;
  int32x4_t v26 = (int32x4_t)vmulq_f32(v54, v25);
  v59.double var2 = 0.0;
  v59.double var3 = 0.0;
  int32x4_t v27 = (int32x4_t)vmulq_f32(v55, v25);
  float32x4_t v28 = vmulq_f32(v56, v25);
  v28.f32[0] = 1.0
             / fmax(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v28, 2), vaddq_f32(v28, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v28.f32, 1))).f32[0], 0.000001);
  float32x2_t v57 = vadd_f32(v15, vmul_n_f32((float32x2_t)vzip1_s32((int32x2_t)vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v26, 2), vadd_f32(*(float32x2_t *)v26.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v26.i8, 1))), (int32x2_t)vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v27, 2), vadd_f32(*(float32x2_t *)v27.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v27.i8, 1)))), v28.f32[0]));
  Rectangle::Union(&v59, (const vec2 *)&v57, (uint64_t)&v58);
  float v29 = fmax(v10, v18);
  float v50 = v29;
  float32x4_t v30 = v49;
  v30.f32[1] = v29;
  int32x4_t v31 = (int32x4_t)vmulq_f32(v54, v30);
  int32x4_t v32 = (int32x4_t)vmulq_f32(v55, v30);
  Rectangle v59 = v58;
  int32x2_t v33 = (int32x2_t)vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v31, 2), vadd_f32(*(float32x2_t *)v31.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v31.i8, 1)));
  float32x4_t v34 = vmulq_f32(v56, v30);
  float32x2_t v35 = (float32x2_t)vzip1_s32(v33, (int32x2_t)vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v32, 2), vadd_f32(*(float32x2_t *)v32.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v32.i8, 1))));
  *(float *)v33.i32 = 1.0
                    / fmax(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v34, 2), vaddq_f32(v34, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v34.f32, 1))).f32[0], 0.000001);
  float32x2_t v57 = vadd_f32(v15, vmul_n_f32(v35, *(float *)v33.i32));
  Rectangle::Union(&v59, (const vec2 *)&v57, (uint64_t)&v58);
  float32_t v36 = fmax(v13, v16);
  float32x4_t v37 = v52;
  v37.f32[0] = v36;
  float32x4_t v53 = v37;
  float32x4_t v38 = v37;
  v38.f32[1] = v51;
  int32x4_t v39 = (int32x4_t)vmulq_f32(v54, v38);
  int32x4_t v40 = (int32x4_t)vmulq_f32(v55, v38);
  Rectangle v59 = v58;
  float32x4_t v41 = vmulq_f32(v56, v38);
  float v42 = 1.0
      / fmax(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v41, 2), vaddq_f32(v41, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v41.f32, 1))).f32[0], 0.000001);
  float32x2_t v57 = vadd_f32(v15, vmul_n_f32((float32x2_t)vzip1_s32((int32x2_t)vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v39, 2), vadd_f32(*(float32x2_t *)v39.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v39.i8, 1))), (int32x2_t)vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v40, 2), vadd_f32(*(float32x2_t *)v40.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v40.i8, 1)))), v42));
  Rectangle::Union(&v59, (const vec2 *)&v57, (uint64_t)&v58);
  float32x4_t v43 = v53;
  v43.f32[1] = v50;
  int32x4_t v44 = (int32x4_t)vmulq_f32(v54, v43);
  int32x4_t v45 = (int32x4_t)vmulq_f32(v55, v43);
  Rectangle v59 = v58;
  int32x2_t v46 = (int32x2_t)vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v44, 2), vadd_f32(*(float32x2_t *)v44.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v44.i8, 1)));
  float32x4_t v47 = vmulq_f32(v56, v43);
  float32x2_t v48 = (float32x2_t)vzip1_s32(v46, (int32x2_t)vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v45, 2), vadd_f32(*(float32x2_t *)v45.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v45.i8, 1))));
  *(float *)v46.i32 = 1.0
                    / fmax(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v47, 2), vaddq_f32(v47, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v47.f32, 1))).f32[0], 0.000001);
  float32x2_t v57 = vadd_f32(v15, vmul_n_f32(v48, *(float *)v46.i32));
  Rectangle::Union(&v59, (const vec2 *)&v57, (uint64_t)&v58);
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
}

- (CIVector)inputExtent
{
  return self->inputExtent;
}

- (void)setInputExtent:(id)a3
{
}

- (CIVector)inputTopLeft
{
  return self->inputTopLeft;
}

- (void)setInputTopLeft:(id)a3
{
}

- (CIVector)inputTopRight
{
  return self->inputTopRight;
}

- (void)setInputTopRight:(id)a3
{
}

- (CIVector)inputBottomRight
{
  return self->inputBottomRight;
}

- (void)setInputBottomRight:(id)a3
{
}

- (CIVector)inputBottomLeft
{
  return self->inputBottomLeft;
}

- (void)setInputBottomLeft:(id)a3
{
}

@end