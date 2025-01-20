@interface CIBumpDistortionLinear
+ (id)customAttributes;
- (CIImage)inputImage;
- (CIVector)inputCenter;
- (NSNumber)inputAngle;
- (NSNumber)inputRadius;
- (NSNumber)inputScale;
- (id)_kernel;
- (id)outputImage;
- (void)setInputAngle:(id)a3;
- (void)setInputCenter:(id)a3;
- (void)setInputImage:(id)a3;
- (void)setInputRadius:(id)a3;
- (void)setInputScale:(id)a3;
@end

@implementation CIBumpDistortionLinear

+ (id)customAttributes
{
  v13[7] = *MEMORY[0x1E4F143B8];
  v12[0] = @"CIAttributeFilterCategories";
  v11[0] = @"CICategoryDistortionEffect";
  v11[1] = @"CICategoryVideo";
  v11[2] = @"CICategoryStillImage";
  v11[3] = @"CICategoryBuiltIn";
  v13[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:4];
  v13[1] = @"6";
  v12[1] = @"CIAttributeFilterAvailable_iOS";
  v12[2] = @"CIAttributeFilterAvailable_Mac";
  v13[2] = @"10.5";
  v12[3] = @"inputCenter";
  v10[0] = @"CIAttributeTypePosition";
  v9[0] = @"CIAttributeType";
  v9[1] = @"CIAttributeDefault";
  v10[1] = +[CIVector vectorWithX:150.0 Y:150.0];
  v13[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  v12[4] = @"inputRadius";
  v7[0] = @"CIAttributeMin";
  v7[1] = @"CIAttributeSliderMin";
  v8[0] = &unk_1EE4A7D80;
  v8[1] = &unk_1EE4A7D80;
  v7[2] = @"CIAttributeSliderMax";
  v7[3] = @"CIAttributeDefault";
  v8[2] = &unk_1EE4A7D90;
  v8[3] = &unk_1EE4A7DA0;
  v7[4] = @"CIAttributeIdentity";
  v7[5] = @"CIAttributeType";
  v8[4] = &unk_1EE4A7D80;
  v8[5] = @"CIAttributeTypeDistance";
  v13[4] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:6];
  v12[5] = @"inputScale";
  v5[0] = @"CIAttributeMin";
  v5[1] = @"CIAttributeSliderMin";
  v6[0] = &unk_1EE4A7DB0;
  v6[1] = &unk_1EE4A7D80;
  v5[2] = @"CIAttributeSliderMax";
  v5[3] = @"CIAttributeDefault";
  v6[2] = &unk_1EE4A7DC0;
  v6[3] = &unk_1EE4A7DD0;
  v5[4] = @"CIAttributeIdentity";
  v5[5] = @"CIAttributeType";
  v6[4] = &unk_1EE4A7DC0;
  v6[5] = @"CIAttributeTypeScalar";
  v13[5] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:6];
  v12[6] = @"inputAngle";
  v3[0] = @"CIAttributeSliderMin";
  v3[1] = @"CIAttributeSliderMax";
  v4[0] = &unk_1EE4A7D80;
  v4[1] = &unk_1EE4A7DE0;
  v3[2] = @"CIAttributeDefault";
  v3[3] = @"CIAttributeType";
  v4[2] = &unk_1EE4A7D80;
  v4[3] = @"CIAttributeTypeAngle";
  v13[6] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:4];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:7];
}

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_bumpDistortionLinear];
}

- (id)outputImage
{
  v44[2] = *MEMORY[0x1E4F143B8];
  [(NSNumber *)self->inputAngle floatValue];
  float v4 = v3;
  [(NSNumber *)self->inputRadius floatValue];
  float v6 = fmaxf(v5, 0.0);
  [(NSNumber *)self->inputScale floatValue];
  float v8 = v7;
  if (fabsf(v6) >= 0.001 && fabsf(v7 + -1.0) >= 0.001)
  {
    [(CIVector *)self->inputCenter X];
    float v12 = v11;
    [(CIVector *)self->inputCenter Y];
    float v14 = v13;
    [(CIVector *)self->inputCenter X];
    double v16 = v15;
    __float2 v17 = __sincosf_stret(v4);
    *(float *)&double v16 = v16 + v17.__cosval * 10.0;
    [(CIVector *)self->inputCenter Y];
    *(float *)&double v18 = v18 + v17.__sinval * 10.0;
    double v19 = (float)(*(float *)&v16 - v12);
    double v20 = (float)(*(float *)&v18 - v14);
    double v21 = 1.0 / sqrt(v20 * v20 + v19 * v19);
    double v22 = 1.0 / v6;
    *(float *)&double v20 = v22 * -(v20 * v21);
    *(float *)&double v19 = v22 * (v21 * v19);
    unsigned int v36 = LODWORD(v19);
    unsigned int v38 = LODWORD(v20);
    float v23 = v22 * (v21 * (float)((float)(v12 * *(float *)&v18) - (float)(v14 * *(float *)&v16)));
    v24 = +[CIVector vectorWithX:*(float *)&v20 Y:*(float *)&v19 Z:v23 W:0.0];
    v25 = +[CIVector vectorWithX:(float)-(float)(v17.__sinval * v6) Y:(float)(v17.__cosval * v6) Z:v8 + -1.0 W:0.0];
    unint64_t v39 = __PAIR64__(v36, v38);
    [(CIVector *)v25 X];
    float64_t v37 = v26;
    [(CIVector *)v25 Y];
    v27.f64[0] = v37;
    v27.f64[1] = v28;
    float32x2_t v29 = vcvt_f32_f64(v27);
    id v30 = [(CIBumpDistortionLinear *)self _kernel];
    [(CIImage *)self->inputImage extent];
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __37__CIBumpDistortionLinear_outputImage__block_invoke;
    v40[3] = &__block_descriptor_60_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
    float v41 = v23;
    v40[4] = v39;
    float32x2_t v42 = v29;
    float v43 = v8;
    inputImage = self->inputImage;
    v44[0] = v24;
    v44[1] = v25;
    return (id)objc_msgSend(v30, "applyWithExtent:roiCallback:inputImage:arguments:", v40, inputImage, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v44, 2), v32, v33, v34, v35);
  }
  else
  {
    v9 = self->inputImage;
    return v9;
  }
}

uint64_t __37__CIBumpDistortionLinear_outputImage__block_invoke(uint64_t result, double a2, double a3, double a4, double a5)
{
  float32x4_t v5 = *(float32x4_t *)(result + 32);
  double v6 = COERCE_FLOAT(HIDWORD(*(void *)(result + 32)));
  double v7 = COERCE_FLOAT(*(void *)(result + 40));
  float v8 = a3 * v6 + v5.f32[0] * a2 + v7;
  float v9 = a3 * v6 + v5.f32[0] * (a2 + a4) + v7;
  double v10 = (a3 + a5) * v6;
  float v11 = v10 + v5.f32[0] * a2 + v7;
  float v12 = v10 + v5.f32[0] * (a2 + a4) + v7;
  if (v8 > -1.0 || v9 > -1.0 || v11 > -1.0 || v12 > -1.0)
  {
    _NF = v8 < 1.0 || v9 < 1.0;
    BOOL v17 = _NF || v11 < 1.0;
    if (v17 || v12 < 1.0)
    {
      float32x2_t v19 = *(float32x2_t *)(result + 48);
      float v20 = *(float *)(result + 56) + -1.0;
      if (v8 <= 1.0) {
        float v21 = v8;
      }
      else {
        float v21 = 1.0;
      }
      if (v8 >= -1.0) {
        float v22 = v21;
      }
      else {
        float v22 = -1.0;
      }
      if (v9 <= 1.0) {
        float v23 = v9;
      }
      else {
        float v23 = 1.0;
      }
      if (v9 >= -1.0) {
        float v24 = v23;
      }
      else {
        float v24 = -1.0;
      }
      if (v11 <= 1.0) {
        float v25 = v11;
      }
      else {
        float v25 = 1.0;
      }
      if (v11 >= -1.0) {
        float v26 = v25;
      }
      else {
        float v26 = -1.0;
      }
      if (v12 <= 1.0) {
        float v27 = v12;
      }
      else {
        float v27 = 1.0;
      }
      if (v12 >= -1.0) {
        float v28 = v27;
      }
      else {
        float v28 = -1.0;
      }
      v29.f32[0] = a2;
      float v30 = a3;
      __asm { FMOV            V7.4S, #1.0 }
      v35.i64[1] = _Q7.i64[1];
      v35.i64[0] = __PAIR64__(LODWORD(v30), v29.u32[0]);
      float32x4_t v36 = vmulq_f32(v35, v5);
      LODWORD(v37) = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v36, 2), vaddq_f32(v36, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v36.f32, 1))).u32[0];
      float v38 = 1.0 - fabsf(v37);
      if (v38 <= 1.0) {
        float v39 = v38;
      }
      else {
        float v39 = 1.0;
      }
      float v40 = 0.0;
      if (v38 >= 0.0) {
        float v41 = v39;
      }
      else {
        float v41 = 0.0;
      }
      double v42 = (v41 * -2.0 + 3.0) * v41 * v41;
      double v43 = v20;
      *(float *)&double v42 = v42 * v20 + 1.0;
      *(float *)&double v42 = (*(float *)&v42 + -1.0) * v37;
      float32x2_t v44 = vadd_f32((float32x2_t)__PAIR64__(LODWORD(v30), v29.u32[0]), vmul_n_f32(v19, *(float *)&v42));
      if ((float)(v22 * v26) == 1.0)
      {
        float32x2_t v48 = v44;
      }
      else
      {
        int v45 = 9;
        float v46 = 0.1;
        float32x4_t v47 = _Q7;
        float32x2_t v48 = v44;
        do
        {
          double v49 = v46;
          float32_t v50 = a3 + a5 * v49;
          v47.f32[0] = a2;
          float32x4_t v51 = v47;
          v51.f32[1] = v50;
          float32x4_t v52 = vmulq_f32(v5, v51);
          LODWORD(v53) = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v52, 2), vaddq_f32(v52, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v52.f32, 1))).u32[0];
          float v54 = 1.0 - fabsf(v53);
          if (v54 <= 1.0) {
            float v55 = v54;
          }
          else {
            float v55 = 1.0;
          }
          if (v54 >= 0.0) {
            float v56 = v55;
          }
          else {
            float v56 = 0.0;
          }
          v57.f32[0] = a2;
          float v58 = (v56 * -2.0 + 3.0) * v56 * v56 * v43 + 1.0;
          v57.f32[1] = a3 + a5 * v49;
          float v59 = (v58 + -1.0) * v53;
          float32x2_t v60 = vadd_f32(v57, vmul_n_f32(v19, v59));
          float32x2_t v44 = vminnm_f32(v44, v60);
          float32x2_t v48 = vmaxnm_f32(v48, v60);
          float v46 = v49 + 0.1;
          --v45;
        }
        while (v45);
      }
      v61.i64[1] = _Q7.i64[1];
      v61.f32[0] = a2;
      float32_t v62 = a3 + a5;
      v29.f32[1] = v62;
      v61.f32[1] = v62;
      float32x4_t v63 = vmulq_f32(v61, v5);
      LODWORD(v64) = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v63, 2), vaddq_f32(v63, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v63.f32, 1))).u32[0];
      float v65 = 1.0 - fabsf(v64);
      if (v65 <= 1.0) {
        float v66 = v65;
      }
      else {
        float v66 = 1.0;
      }
      if (v65 >= 0.0) {
        float v40 = v66;
      }
      float v67 = (v40 * -2.0 + 3.0) * v40 * v40 * v43 + 1.0;
      float v68 = (v67 + -1.0) * v64;
      float32x2_t v69 = vadd_f32(v29, vmul_n_f32(v19, v68));
      float32x2_t v70 = vminnm_f32(v44, v69);
      float32x2_t v71 = vmaxnm_f32(v48, v69);
      if ((float)(v26 * v28) != 1.0)
      {
        int v72 = 9;
        float v73 = 0.1;
        do
        {
          double v74 = v73;
          v75.f32[0] = a2 + a4 * v74;
          v76.i64[1] = _Q7.i64[1];
          v76.i32[0] = v75.i32[0];
          v76.f32[1] = a3 + a5;
          float32x4_t v77 = vmulq_f32(v5, v76);
          LODWORD(v78) = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v77, 2), vaddq_f32(v77, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v77.f32, 1))).u32[0];
          float v79 = 1.0 - fabsf(v78);
          if (v79 <= 1.0) {
            float v80 = v79;
          }
          else {
            float v80 = 1.0;
          }
          if (v79 >= 0.0) {
            float v81 = v80;
          }
          else {
            float v81 = 0.0;
          }
          float v82 = (v81 * -2.0 + 3.0) * v81 * v81 * v43 + 1.0;
          v75.f32[1] = a3 + a5;
          float v83 = (v82 + -1.0) * v78;
          float32x2_t v84 = vadd_f32(v75, vmul_n_f32(v19, v83));
          float32x2_t v70 = vminnm_f32(v70, v84);
          float32x2_t v71 = vmaxnm_f32(v71, v84);
          float v73 = v74 + 0.1;
          --v72;
        }
        while (v72);
      }
      v85.f32[0] = a2 + a4;
      v86.i32[0] = v85.i32[0];
      v87.i64[1] = _Q7.i64[1];
      v87.i32[0] = v85.i32[0];
      v87.f32[1] = a3 + a5;
      float32x4_t v88 = vmulq_f32(v87, v5);
      LODWORD(v89) = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v88, 2), vaddq_f32(v88, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v88.f32, 1))).u32[0];
      float v90 = 1.0 - fabsf(v89);
      if (v90 <= 1.0) {
        float v91 = v90;
      }
      else {
        float v91 = 1.0;
      }
      if (v90 < 0.0) {
        float v91 = 0.0;
      }
      float v92 = (v91 * -2.0 + 3.0) * v91 * v91 * v43 + 1.0;
      float v93 = (v92 + -1.0) * v89;
      v86.f32[1] = a3 + a5;
      float32x2_t v94 = vadd_f32(v86, vmul_n_f32(v19, v93));
      float32x2_t v95 = vminnm_f32(v70, v94);
      float32x2_t v96 = vmaxnm_f32(v71, v94);
      if ((float)(v28 * v24) != 1.0)
      {
        int v97 = 9;
        float v98 = 0.1;
        float32x4_t v99 = _Q7;
        do
        {
          double v100 = v98;
          float32_t v101 = a3 + a5 * v100;
          v99.f32[0] = a2 + a4;
          float32x4_t v102 = v99;
          v102.f32[1] = v101;
          float32x4_t v103 = vmulq_f32(v5, v102);
          LODWORD(v104) = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v103, 2), vaddq_f32(v103, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v103.f32, 1))).u32[0];
          float v105 = 1.0 - fabsf(v104);
          if (v105 <= 1.0) {
            float v106 = v105;
          }
          else {
            float v106 = 1.0;
          }
          if (v105 >= 0.0) {
            float v107 = v106;
          }
          else {
            float v107 = 0.0;
          }
          v108.f32[0] = a2 + a4;
          float v109 = (v107 * -2.0 + 3.0) * v107 * v107 * v43 + 1.0;
          v108.f32[1] = a3 + a5 * v100;
          float v110 = (v109 + -1.0) * v104;
          float32x2_t v111 = vadd_f32(v108, vmul_n_f32(v19, v110));
          float32x2_t v95 = vminnm_f32(v95, v111);
          float32x2_t v96 = vmaxnm_f32(v96, v111);
          float v98 = v100 + 0.1;
          --v97;
        }
        while (v97);
      }
      v112.i64[1] = _Q7.i64[1];
      v112.f32[0] = a2 + a4;
      v85.f32[1] = v30;
      v112.f32[1] = v30;
      float32x4_t v113 = vmulq_f32(v112, v5);
      LODWORD(v114) = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v113, 2), vaddq_f32(v113, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v113.f32, 1))).u32[0];
      float v115 = 1.0 - fabsf(v114);
      if (v115 <= 1.0) {
        float v116 = v115;
      }
      else {
        float v116 = 1.0;
      }
      if (v115 >= 0.0) {
        float v117 = v116;
      }
      else {
        float v117 = 0.0;
      }
      float v118 = (v117 * -2.0 + 3.0) * v117 * v117 * v43 + 1.0;
      float v119 = (v118 + -1.0) * v114;
      float32x2_t v120 = vadd_f32(v85, vmul_n_f32(v19, v119));
      float32x2_t v121 = vminnm_f32(v95, v120);
      float32x2_t v122 = vmaxnm_f32(v96, v120);
      if ((float)(v24 * v22) != 1.0)
      {
        int v123 = 9;
        float v124 = 0.1;
        do
        {
          double v125 = v124;
          v126.f32[0] = a2 + a4 * v125;
          v127.i64[1] = _Q7.i64[1];
          v127.i64[0] = __PAIR64__(LODWORD(v30), v126.u32[0]);
          float32x4_t v128 = vmulq_f32(v5, v127);
          LODWORD(v129) = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v128, 2), vaddq_f32(v128, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v128.f32, 1))).u32[0];
          float v130 = 1.0 - fabsf(v129);
          if (v130 <= 1.0) {
            float v131 = v130;
          }
          else {
            float v131 = 1.0;
          }
          if (v130 >= 0.0) {
            float v132 = v131;
          }
          else {
            float v132 = 0.0;
          }
          float v133 = (v132 * -2.0 + 3.0) * v132 * v132 * v43 + 1.0;
          v126.f32[1] = v30;
          float v134 = (v133 + -1.0) * v129;
          float32x2_t v135 = vadd_f32(v126, vmul_n_f32(v19, v134));
          float32x2_t v121 = vminnm_f32(v121, v135);
          float32x2_t v122 = vmaxnm_f32(v122, v135);
          float v124 = v125 + 0.1;
          --v123;
        }
        while (v123);
      }
    }
  }
  return result;
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
}

- (CIVector)inputCenter
{
  return self->inputCenter;
}

- (void)setInputCenter:(id)a3
{
}

- (NSNumber)inputRadius
{
  return self->inputRadius;
}

- (void)setInputRadius:(id)a3
{
}

- (NSNumber)inputScale
{
  return self->inputScale;
}

- (void)setInputScale:(id)a3
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