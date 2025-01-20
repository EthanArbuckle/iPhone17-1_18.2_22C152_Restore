@interface CIPerspectiveCorrection
+ (id)customAttributes;
- (CIImage)inputImage;
- (CIVector)inputBottomLeft;
- (CIVector)inputBottomRight;
- (CIVector)inputTopLeft;
- (CIVector)inputTopRight;
- (NSNumber)inputCrop;
- (id)_kernel;
- (id)outputImage;
- (void)setInputBottomLeft:(id)a3;
- (void)setInputBottomRight:(id)a3;
- (void)setInputCrop:(id)a3;
- (void)setInputImage:(id)a3;
- (void)setInputTopLeft:(id)a3;
- (void)setInputTopRight:(id)a3;
@end

@implementation CIPerspectiveCorrection

+ (id)customAttributes
{
  v15[8] = *MEMORY[0x1E4F143B8];
  v14[0] = @"CIAttributeFilterCategories";
  v13[0] = @"CICategoryGeometryAdjustment";
  v13[1] = @"CICategoryStillImage";
  v13[2] = @"CICategoryVideo";
  v13[3] = @"CICategoryBuiltIn";
  v15[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:4];
  v15[1] = @"8";
  v14[1] = @"CIAttributeFilterAvailable_iOS";
  v14[2] = @"CIAttributeFilterAvailable_Mac";
  v15[2] = @"10.10";
  v14[3] = @"inputBottomLeft";
  v11[0] = @"CIAttributeDefault";
  v11[1] = @"CIAttributeType";
  v12[0] = +[CIVector vectorWithX:155.0 Y:153.0];
  v12[1] = @"CIAttributeTypePosition";
  v15[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  v14[4] = @"inputBottomRight";
  v9[0] = @"CIAttributeDefault";
  v9[1] = @"CIAttributeType";
  v10[0] = +[CIVector vectorWithX:548.0 Y:140.0];
  v10[1] = @"CIAttributeTypePosition";
  v15[4] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  v14[5] = @"inputTopRight";
  v7[0] = @"CIAttributeDefault";
  v7[1] = @"CIAttributeType";
  v8[0] = +[CIVector vectorWithX:646.0 Y:507.0];
  v8[1] = @"CIAttributeTypePosition";
  v15[5] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];
  v14[6] = @"inputTopLeft";
  v5[0] = @"CIAttributeDefault";
  v5[1] = @"CIAttributeType";
  v6[0] = +[CIVector vectorWithX:118.0 Y:484.0];
  v6[1] = @"CIAttributeTypePosition";
  v15[6] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:2];
  v14[7] = @"inputCrop";
  v3[0] = @"CIAttributeDefault";
  v3[1] = @"CIAttributeType";
  v4[0] = MEMORY[0x1E4F1CC38];
  v4[1] = @"CIAttributeTypeBoolean";
  v15[7] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:2];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:8];
}

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_perspectiveCorrection];
}

- (id)outputImage
{
  v131[9] = *(double *)MEMORY[0x1E4F143B8];
  if (!self->inputImage) {
    return 0;
  }
  [(CIVector *)self->inputBottomLeft X];
  float64_t v114 = v3;
  [(CIVector *)self->inputBottomLeft Y];
  v4.f64[0] = v114;
  v4.f64[1] = v5;
  float32x2_t v6 = vcvt_f32_f64(v4);
  [(CIVector *)self->inputBottomRight X];
  float64_t v115 = v7;
  [(CIVector *)self->inputBottomRight Y];
  v8.f64[0] = v115;
  v8.f64[1] = v9;
  float32x2_t v10 = vcvt_f32_f64(v8);
  [(CIVector *)self->inputTopLeft X];
  float64_t v116 = v11;
  [(CIVector *)self->inputTopLeft Y];
  v12.f64[0] = v116;
  v12.f64[1] = v13;
  float32x2_t v14 = vcvt_f32_f64(v12);
  [(CIVector *)self->inputTopRight X];
  float64_t v117 = v15;
  [(CIVector *)self->inputTopRight Y];
  _Q1.f64[0] = v117;
  _Q1.f64[1] = v17;
  float32x2_t v18 = vcvt_f32_f64(_Q1);
  float32x2_t v19 = vsub_f32(v6, v10);
  int32x2_t v20 = (int32x2_t)vmul_f32(v19, v19);
  *(float32x2_t *)&_Q1.f64[0] = vsub_f32(v18, v14);
  *(float32x2_t *)&_Q1.f64[0] = vmul_f32(*(float32x2_t *)&_Q1.f64[0], *(float32x2_t *)&_Q1.f64[0]);
  float32x2_t v21 = vsub_f32(v6, v14);
  int32x2_t v22 = (int32x2_t)vmul_f32(v21, v21);
  float32x2_t v23 = vsub_f32(v18, v10);
  int32x2_t v24 = (int32x2_t)vmul_f32(v23, v23);
  float32x2_t v25 = vsqrt_f32(vadd_f32((float32x2_t)vzip1_s32(v22, v20), (float32x2_t)vzip2_s32(v22, v20)));
  *(float32x2_t *)&_Q1.f64[0] = vsqrt_f32(vadd_f32((float32x2_t)vzip1_s32(v24, *(int32x2_t *)&_Q1.f64[0]), (float32x2_t)vzip2_s32(v24, *(int32x2_t *)&_Q1.f64[0])));
  float32x2_t v26 = (float32x2_t)vrev64_s32((int32x2_t)vmaxnm_f32(v25, *(float32x2_t *)&_Q1.f64[0]));
  float32x2_t v27 = vdiv_f32(v25, *(float32x2_t *)&_Q1.f64[0]);
  __asm { FMOV            V1.2S, #1.0 }
  float32x2_t v32 = (float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v27, *(float32x2_t *)&_Q1.f64[0]), (int8x8_t)v27, (int8x8_t)vdiv_f32(*(float32x2_t *)&_Q1.f64[0], v27));
  float v33 = v32.f32[1];
  if (v32.f32[0] > v32.f32[1]) {
    float v33 = v32.f32[0];
  }
  if (v33 <= 2.0) {
    float32x2_t v118 = v32;
  }
  else {
    float32x2_t v118 = vcvt_f32_f64(vmulq_n_f64(vcvtq_f64_f32(v32), 2.0 / v33));
  }
  computeHomogeneousPerspectiveTransformAndInverse(v130, (uint64_t)v131, *(double *)&v6, v10, v18, v14);
  double v35 = v131[0];
  double v36 = v131[1];
  double v37 = v131[3];
  double v38 = v131[6];
  double v98 = v131[7];
  double v99 = v131[4];
  v39.f64[0] = v131[2];
  v39.f64[1] = v131[5];
  float64x2_t v101 = v39;
  double v97 = v131[8];
  v40.f64[0] = v130[0];
  v40.f64[1] = v130[3];
  float64x2_t v111 = v40;
  float64x2_t v119 = vcvtq_f64_f32(vmul_f32(v26, v118));
  v40.f64[0] = v130[1];
  v40.f64[1] = v130[4];
  float64x2_t v105 = v40;
  double v42 = v130[6];
  double v41 = v130[7];
  v40.f64[0] = v130[2];
  v40.f64[1] = v130[5];
  float64x2_t v108 = v40;
  double v43 = v130[8];
  [(CIImage *)self->inputImage extent];
  double v100 = v36;
  if (CGRectIsInfinite(v132)) {
    goto LABEL_21;
  }
  *(float32x2_t *)v44.f32 = vcvt_f32_f64(vmulq_n_f64(v111, v119.f64[0]));
  float32_t v45 = v42 * v119.f64[0];
  v44.f32[2] = v45;
  float32x4_t v112 = v44;
  *(float32x2_t *)v44.f32 = vcvt_f32_f64(vmulq_laneq_f64(v105, v119, 1));
  float32_t v46 = vmuld_lane_f64(v41, v119, 1);
  v44.f32[2] = v46;
  float32x4_t v106 = v44;
  *(float32x2_t *)v44.f32 = vcvt_f32_f64(v108);
  float32_t v47 = v43;
  v44.f32[2] = v47;
  float32x4_t v109 = v44;
  [(CIImage *)self->inputImage extent];
  double x = v133.origin.x;
  double y = v133.origin.y;
  double width = v133.size.width;
  double height = v133.size.height;
  if (CGRectIsInfinite(v133))
  {
    double v52 = -8.98846567e307;
    double width = 1.79769313e308;
    double height = 1.79769313e308;
    double v53 = -8.98846567e307;
  }
  else
  {
    v134.origin.double x = x;
    v134.origin.double y = y;
    v134.size.double width = width;
    v134.size.double height = height;
    BOOL IsNull = CGRectIsNull(v134);
    if (IsNull)
    {
      double width = 0.0;
      double height = 0.0;
      double v52 = INFINITY;
    }
    else
    {
      double v52 = y;
    }
    double v53 = IsNull ? INFINITY : x;
  }
  *(int64x2_t *)&v128.double var0 = vdupq_n_s64(0x7FF0000000000000uLL);
  float32_t v55 = v53;
  float v56 = v52;
  __asm { FMOV            V1.4S, #1.0 }
  float32x4_t v102 = _Q1;
  _Q1.f32[0] = v55;
  float32x4_t v94 = _Q1;
  float v95 = v56;
  float32x4_t v58 = _Q1;
  v58.f32[1] = v56;
  int32x4_t v59 = (int32x4_t)vmulq_f32(v112, v58);
  int32x4_t v60 = (int32x4_t)vmulq_f32(v106, v58);
  v128.double var2 = 0.0;
  v128.double var3 = 0.0;
  float32x4_t v61 = vmulq_f32(v109, v58);
  *(double *)v61.i64 = fmax(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v61, 2), vaddq_f32(v61, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v61.f32, 1))).f32[0], 0.000001);
  v61.f32[0] = *(double *)v61.i64;
  float32x2_t v127 = vdiv_f32((float32x2_t)vzip1_s32((int32x2_t)vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v59, 2), vadd_f32(*(float32x2_t *)v59.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v59.i8, 1))), (int32x2_t)vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v60, 2), vadd_f32(*(float32x2_t *)v60.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v60.i8, 1)))), (float32x2_t)vdup_lane_s32(*(int32x2_t *)v61.f32, 0));
  Rectangle::Union(&v128, (const vec2 *)&v127, (uint64_t)&v126);
  Rectangle v128 = v126;
  float32_t v62 = width + v53;
  float32x4_t v63 = v102;
  v63.f32[0] = v62;
  float32x4_t v103 = v63;
  float32x4_t v64 = v63;
  v64.f32[1] = v95;
  int32x4_t v65 = (int32x4_t)vmulq_f32(v112, v64);
  int32x4_t v66 = (int32x4_t)vmulq_f32(v106, v64);
  float32x4_t v67 = vmulq_f32(v109, v64);
  *(double *)v67.i64 = fmax(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v67, 2), vaddq_f32(v67, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v67.f32, 1))).f32[0], 0.000001);
  v67.f32[0] = *(double *)v67.i64;
  float32x2_t v127 = vdiv_f32((float32x2_t)vzip1_s32((int32x2_t)vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v65, 2), vadd_f32(*(float32x2_t *)v65.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v65.i8, 1))), (int32x2_t)vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v66, 2), vadd_f32(*(float32x2_t *)v66.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v66.i8, 1)))), (float32x2_t)vdup_lane_s32(*(int32x2_t *)v67.f32, 0));
  Rectangle::Union(&v128, (const vec2 *)&v127, (uint64_t)&v126);
  Rectangle v128 = v126;
  float v68 = height + v52;
  float32x4_t v69 = v94;
  float v96 = v68;
  v69.f32[1] = v68;
  int32x4_t v70 = (int32x4_t)vmulq_f32(v112, v69);
  int32x4_t v71 = (int32x4_t)vmulq_f32(v106, v69);
  float32x4_t v72 = vmulq_f32(v109, v69);
  double v73 = fmax(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v72, 2), vaddq_f32(v72, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v72.f32, 1))).f32[0], 0.000001);
  *(float *)&double v73 = v73;
  float32x2_t v127 = vdiv_f32((float32x2_t)vzip1_s32((int32x2_t)vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v70, 2), vadd_f32(*(float32x2_t *)v70.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v70.i8, 1))), (int32x2_t)vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v71, 2), vadd_f32(*(float32x2_t *)v71.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v71.i8, 1)))), (float32x2_t)vdup_lane_s32(*(int32x2_t *)&v73, 0));
  Rectangle::Union(&v128, (const vec2 *)&v127, (uint64_t)&v126);
  Rectangle v128 = v126;
  float32x4_t v74 = v103;
  v74.f32[1] = v96;
  int32x4_t v75 = (int32x4_t)vmulq_f32(v112, v74);
  int32x4_t v76 = (int32x4_t)vmulq_f32(v106, v74);
  float32x4_t v77 = vmulq_f32(v109, v74);
  double v78 = fmax(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v77, 2), vaddq_f32(v77, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v77.f32, 1))).f32[0], 0.000001);
  *(float *)&double v78 = v78;
  float32x2_t v127 = vdiv_f32((float32x2_t)vzip1_s32((int32x2_t)vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v75, 2), vadd_f32(*(float32x2_t *)v75.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v75.i8, 1))), (int32x2_t)vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v76, 2), vadd_f32(*(float32x2_t *)v76.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v76.i8, 1)))), (float32x2_t)vdup_lane_s32(*(int32x2_t *)&v78, 0));
  Rectangle::Union(&v128, (const vec2 *)&v127, (uint64_t)&v126);
  double var1 = v126.var1;
  double var0 = v126.var0;
  double var3 = v126.var3;
  double var2 = v126.var2;
  if (v126.var0 == -8.98846567e307
    && v126.var1 == -8.98846567e307
    && v126.var2 == 1.79769313e308
    && v126.var3 == 1.79769313e308)
  {
LABEL_21:
    double var0 = *MEMORY[0x1E4F1DB10];
    double var1 = *(double *)(MEMORY[0x1E4F1DB10] + 8);
    double var2 = *(double *)(MEMORY[0x1E4F1DB10] + 16);
    double var3 = *(double *)(MEMORY[0x1E4F1DB10] + 24);
  }
  id v83 = [(CIPerspectiveCorrection *)self _kernel];
  float v84 = v38;
  *(float *)&uint64_t v85 = v35 / v119.f64[0];
  float v86 = v37 / v119.f64[1];
  *((float *)&v85 + 1) = v86;
  float v87 = v98;
  *(float *)&unsigned int v88 = v100 / v119.f64[0];
  *(float *)&unsigned int v89 = v99 / v119.f64[1];
  float v107 = *(float *)&v89;
  float v110 = *(float *)&v88;
  float v113 = v87;
  float v90 = v87;
  float v91 = v97;
  float v104 = v91;
  v120[0] = MEMORY[0x1E4F143A8];
  v120[1] = 3221225472;
  v120[2] = __38__CIPerspectiveCorrection_outputImage__block_invoke;
  v120[3] = &__block_descriptor_80_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
  float v121 = v84;
  float v123 = v90;
  v120[4] = v85;
  unint64_t v122 = __PAIR64__(v89, v88);
  float v125 = v91;
  float32x2_t v124 = vcvt_f32_f64(vdivq_f64(v101, v119));
  inputImage = self->inputImage;
  v129[0] = +[CIVector vectorWithX:*(float *)&v85 Y:v86 Z:v84];
  v129[1] = +[CIVector vectorWithX:v110 Y:v107 Z:v113];
  v129[2] = +[CIVector vectorWithX:v124.f32[0] Y:v124.f32[1] Z:v104];
  v34 = objc_msgSend(v83, "applyWithExtent:roiCallback:inputImage:arguments:", v120, inputImage, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v129, 3), var0, var1, var2, var3);
  if ([(NSNumber *)self->inputCrop BOOLValue]) {
    return (id)objc_msgSend(v34, "imageByCroppingToRect:", 0.0, 0.0, *(_OWORD *)&v119);
  }
  return v34;
}

void __38__CIPerspectiveCorrection_outputImage__block_invoke(float32x4_t *a1, double a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  double v8 = a2;
  if (CGRectIsInfinite(*(CGRect *)&a2))
  {
    a3 = -8.98846567e307;
    double v10 = 1.79769313e308;
    double v11 = 1.79769313e308;
    double v8 = -8.98846567e307;
  }
  else
  {
    v57.origin.double x = v8;
    v57.origin.double y = a3;
    v57.size.double width = a4;
    v57.size.double height = a5;
    BOOL IsNull = CGRectIsNull(v57);
    if (IsNull) {
      double v10 = 0.0;
    }
    else {
      double v10 = a4;
    }
    if (IsNull) {
      double v11 = 0.0;
    }
    else {
      double v11 = a5;
    }
    if (IsNull)
    {
      a3 = INFINITY;
      double v8 = INFINITY;
    }
  }
  float32x4_t v51 = a1[2];
  float32x4_t v52 = a1[3];
  float32x4_t v53 = a1[4];
  *(int64x2_t *)&v56.double var0 = vdupq_n_s64(0x7FF0000000000000uLL);
  float32_t v13 = v8;
  float v14 = a3;
  __asm { FMOV            V2.4S, #1.0 }
  float32x4_t v49 = _Q2;
  _Q2.f32[0] = v13;
  float v46 = v14;
  float32x4_t v48 = _Q2;
  float32x4_t v20 = _Q2;
  v20.f32[1] = v14;
  int32x4_t v21 = (int32x4_t)vmulq_f32(v51, v20);
  int32x4_t v22 = (int32x4_t)vmulq_f32(v52, v20);
  v56.double var2 = 0.0;
  v56.double var3 = 0.0;
  float32x4_t v23 = vmulq_f32(v53, v20);
  *(double *)v23.i64 = fmax(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v23, 2), vaddq_f32(v23, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v23.f32, 1))).f32[0], 0.000001);
  v23.f32[0] = *(double *)v23.i64;
  float32x2_t v55 = vdiv_f32((float32x2_t)vzip1_s32((int32x2_t)vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v21, 2), vadd_f32(*(float32x2_t *)v21.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v21.i8, 1))), (int32x2_t)vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v22, 2), vadd_f32(*(float32x2_t *)v22.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v22.i8, 1)))), (float32x2_t)vdup_lane_s32(*(int32x2_t *)v23.f32, 0));
  Rectangle::Union(&v56, (const vec2 *)&v55, (uint64_t)&v54);
  float32_t v24 = v10 + v8;
  float32x4_t v25 = v49;
  v25.f32[0] = v24;
  float32x4_t v50 = v25;
  float32x4_t v26 = v25;
  v26.f32[1] = v46;
  int32x4_t v27 = (int32x4_t)vmulq_f32(v51, v26);
  int32x4_t v28 = (int32x4_t)vmulq_f32(v52, v26);
  Rectangle v56 = v54;
  float32x4_t v29 = vmulq_f32(v53, v26);
  double v30 = fmax(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v29, 2), vaddq_f32(v29, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v29.f32, 1))).f32[0], 0.000001);
  *(float *)&double v30 = v30;
  float32x2_t v55 = vdiv_f32((float32x2_t)vzip1_s32((int32x2_t)vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v27, 2), vadd_f32(*(float32x2_t *)v27.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v27.i8, 1))), (int32x2_t)vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v28, 2), vadd_f32(*(float32x2_t *)v28.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v28.i8, 1)))), (float32x2_t)vdup_lane_s32(*(int32x2_t *)&v30, 0));
  Rectangle::Union(&v56, (const vec2 *)&v55, (uint64_t)&v54);
  float v31 = v11 + a3;
  float v47 = v31;
  float32x4_t v32 = v48;
  v32.f32[1] = v31;
  int32x4_t v33 = (int32x4_t)vmulq_f32(v51, v32);
  int32x4_t v34 = (int32x4_t)vmulq_f32(v52, v32);
  Rectangle v56 = v54;
  int32x2_t v35 = (int32x2_t)vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v33, 2), vadd_f32(*(float32x2_t *)v33.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v33.i8, 1)));
  float32x4_t v36 = vmulq_f32(v53, v32);
  float32x2_t v37 = (float32x2_t)vzip1_s32(v35, (int32x2_t)vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v34, 2), vadd_f32(*(float32x2_t *)v34.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v34.i8, 1))));
  double v38 = fmax(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v36, 2), vaddq_f32(v36, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v36.f32, 1))).f32[0], 0.000001);
  *(float *)&double v38 = v38;
  float32x2_t v55 = vdiv_f32(v37, (float32x2_t)vdup_lane_s32(*(int32x2_t *)&v38, 0));
  Rectangle::Union(&v56, (const vec2 *)&v55, (uint64_t)&v54);
  float32x4_t v39 = v50;
  v39.f32[1] = v47;
  int32x4_t v40 = (int32x4_t)vmulq_f32(v51, v39);
  int32x4_t v41 = (int32x4_t)vmulq_f32(v52, v39);
  Rectangle v56 = v54;
  int32x2_t v42 = (int32x2_t)vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v40, 2), vadd_f32(*(float32x2_t *)v40.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v40.i8, 1)));
  float32x4_t v43 = vmulq_f32(v53, v39);
  float32x2_t v44 = (float32x2_t)vzip1_s32(v42, (int32x2_t)vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v41, 2), vadd_f32(*(float32x2_t *)v41.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v41.i8, 1))));
  double v45 = fmax(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v43, 2), vaddq_f32(v43, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v43.f32, 1))).f32[0], 0.000001);
  *(float *)&double v45 = v45;
  float32x2_t v55 = vdiv_f32(v44, (float32x2_t)vdup_lane_s32(*(int32x2_t *)&v45, 0));
  Rectangle::Union(&v56, (const vec2 *)&v55, (uint64_t)&v54);
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
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

- (NSNumber)inputCrop
{
  return self->inputCrop;
}

- (void)setInputCrop:(id)a3
{
}

@end