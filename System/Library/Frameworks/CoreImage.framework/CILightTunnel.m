@interface CILightTunnel
+ (id)customAttributes;
- (CIImage)inputImage;
- (CIVector)inputCenter;
- (NSNumber)inputRadius;
- (NSNumber)inputRotation;
- (id)_kernel;
- (id)outputImage;
- (void)setInputCenter:(id)a3;
- (void)setInputImage:(id)a3;
- (void)setInputRadius:(id)a3;
- (void)setInputRotation:(id)a3;
@end

@implementation CILightTunnel

+ (id)customAttributes
{
  v11[6] = *MEMORY[0x1E4F143B8];
  v10[0] = @"CIAttributeFilterCategories";
  v9[0] = @"CICategoryDistortionEffect";
  v9[1] = @"CICategoryVideo";
  v9[2] = @"CICategoryStillImage";
  v9[3] = @"CICategoryBuiltIn";
  v11[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:4];
  v11[1] = @"6";
  v10[1] = @"CIAttributeFilterAvailable_iOS";
  v10[2] = @"CIAttributeFilterAvailable_Mac";
  v11[2] = @"10.10";
  v10[3] = @"inputCenter";
  v7[0] = @"CIAttributeType";
  v7[1] = @"CIAttributeDefault";
  v8[0] = @"CIAttributeTypePosition";
  v8[1] = +[CIVector vectorWithX:150.0 Y:150.0];
  v11[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];
  v10[4] = @"inputRotation";
  v5[0] = @"CIAttributeSliderMin";
  v5[1] = @"CIAttributeSliderMax";
  v6[0] = &unk_1EE4A9140;
  v6[1] = &unk_1EE4A9150;
  v5[2] = @"CIAttributeDefault";
  v5[3] = @"CIAttributeIdentity";
  v6[2] = &unk_1EE4A9140;
  v6[3] = &unk_1EE4A9140;
  v5[4] = @"CIAttributeType";
  v6[4] = @"CIAttributeTypeAngle";
  v11[4] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:5];
  v10[5] = @"inputRadius";
  v3[0] = @"CIAttributeSliderMin";
  v3[1] = @"CIAttributeSliderMax";
  v4[0] = &unk_1EE4A9160;
  v4[1] = &unk_1EE4A9170;
  v3[2] = @"CIAttributeDefault";
  v3[3] = @"CIAttributeIdentity";
  v4[2] = &unk_1EE4A9180;
  v4[3] = &unk_1EE4A9140;
  v3[4] = @"CIAttributeType";
  v4[4] = @"CIAttributeTypeDistance";
  v11[5] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:5];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:6];
}

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_lighttunnel];
}

- (id)outputImage
{
  v39[1] = *MEMORY[0x1E4F143B8];
  if (!self->inputImage) {
    return 0;
  }
  id v3 = [(CILightTunnel *)self _kernel];
  [(NSNumber *)self->inputRotation floatValue];
  float v5 = v4 / 6.28318531;
  [(NSNumber *)self->inputRadius doubleValue];
  double v7 = v6;
  [(CIVector *)self->inputCenter X];
  double v9 = v8;
  [(CIVector *)self->inputCenter Y];
  v11 = +[CIVector vectorWithX:v9 Y:v10 Z:v7 W:v5];
  [(CIVector *)v11 X];
  float64_t v30 = v12;
  [(CIVector *)v11 Y];
  v13.f64[0] = v30;
  v13.f64[1] = v14;
  int32x2_t v31 = (int32x2_t)vcvt_f32_f64(v13);
  [(CIVector *)v11 Z];
  float64_t v29 = v15;
  [(CIVector *)v11 W];
  v16.f64[0] = v29;
  v16.f64[1] = v17;
  float32x4_t v32 = vcvt_hight_f32_f64(v31, v16);
  [(CIVector *)self->inputCenter X];
  double v19 = v18 - v7;
  [(CIVector *)self->inputCenter Y];
  double v21 = v20 - v7;
  double v22 = v7 + v7;
  double v23 = *MEMORY[0x1E4F1DB10];
  double v24 = *(double *)(MEMORY[0x1E4F1DB10] + 8);
  double v25 = *(double *)(MEMORY[0x1E4F1DB10] + 16);
  double v26 = *(double *)(MEMORY[0x1E4F1DB10] + 24);
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __28__CILightTunnel_outputImage__block_invoke;
  v33[3] = &__block_descriptor_80_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
  double v35 = v19;
  double v36 = v21;
  double v37 = v22;
  double v38 = v22;
  float32x4_t v34 = v32;
  inputImage = self->inputImage;
  v39[0] = v11;
  return (id)objc_msgSend(v3, "applyWithExtent:roiCallback:inputImage:arguments:", v33, inputImage, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v39, 1), v23, v24, v25, v26);
}

double __28__CILightTunnel_outputImage__block_invoke(uint64_t a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  double v7 = *(double *)(a1 + 48);
  int32x4_t v8 = *(int32x4_t *)(a1 + 32);
  float v9 = COERCE_FLOAT(*(void *)(a1 + 40));
  float v10 = a2;
  float v11 = a3;
  float32x2_t v12 = vsub_f32((float32x2_t)__PAIR64__(LODWORD(v11), LODWORD(v10)), *(float32x2_t *)v8.i8);
  int32x2_t v13 = (int32x2_t)vmul_f32(v12, v12);
  float v14 = a3 + a5;
  float32x2_t v15 = vsub_f32((float32x2_t)__PAIR64__(LODWORD(v14), LODWORD(v10)), *(float32x2_t *)v8.i8);
  int32x2_t v16 = (int32x2_t)vmul_f32(v15, v15);
  int8x8_t v17 = vmvn_s8((int8x8_t)vcgt_f32(vsqrt_f32(vadd_f32((float32x2_t)vzip1_s32(v16, v13), (float32x2_t)vzip2_s32(v16, v13))), (float32x2_t)vdup_laneq_s32(v8, 2)));
  char v18 = v17.i8[0] & v17.i8[4];
  float v19 = a2 + a4;
  float32x2_t v20 = vsub_f32((float32x2_t)__PAIR64__(LODWORD(v11), LODWORD(v19)), *(float32x2_t *)v8.i8);
  if (sqrtf(vaddv_f32(vmul_f32(v20, v20))) > v9) {
    char v18 = 0;
  }
  float32x2_t v21 = vsub_f32((float32x2_t)__PAIR64__(LODWORD(v14), LODWORD(v19)), *(float32x2_t *)v8.i8);
  if (sqrtf(vaddv_f32(vmul_f32(v21, v21))) <= v9 && (v18 & 1) != 0) {
    return a2;
  }
  LODWORD(v22) = HIDWORD(*(_OWORD *)(a1 + 32));
  if (fabsf(*(float *)&v8.i32[3]) < 0.0001)
  {
    float v121 = a3;
    float v122 = a3 + a5;
    float v123 = v10;
    float v124 = a2 + a4;
    LODWORD(v138) = HIDWORD(*(void *)(a1 + 32));
    CGFloat v23 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    CGFloat r1 = *MEMORY[0x1E4F1DB20];
    float32x2_t v24 = vsub_f32((float32x2_t)__PAIR64__(LODWORD(v11), LODWORD(v10)), *(float32x2_t *)v8.i8);
    int32x2_t v25 = (int32x2_t)vmul_f32(v24, v24);
    v25.i32[0] = vadd_f32((float32x2_t)v25, (float32x2_t)vdup_lane_s32(v25, 1)).u32[0];
    CGFloat v27 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    CGFloat v26 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
    float32x2_t v28 = vrsqrte_f32((float32x2_t)v25.u32[0]);
    float v126 = v9 * vmul_f32(v28, vrsqrts_f32((float32x2_t)v25.u32[0], vmul_f32(v28, v28))).f32[0];
    float32x2_t v153 = *(float32x2_t *)(a1 + 32);
    float32x2_t v146 = (float32x2_t)__PAIR64__(LODWORD(v11), LODWORD(v19));
    float32x2_t v150 = (float32x2_t)__PAIR64__(LODWORD(v14), LODWORD(v19));
    float32x2_t v141 = (float32x2_t)__PAIR64__(LODWORD(v14), LODWORD(v10));
    float32x2_t v128 = (float32x2_t)__PAIR64__(LODWORD(v11), LODWORD(v10));
    float v29 = logf(v126);
    __float2 v30 = __sincosf_stret(v22 * v29);
    v31.f32[0] = -v30.__sinval;
    v31.i32[1] = LODWORD(v30.__cosval);
    int32x2_t v32 = (int32x2_t)vmul_f32(v24, (float32x2_t)__PAIR64__(LODWORD(v30.__sinval), LODWORD(v30.__cosval)));
    int32x2_t v33 = (int32x2_t)vmul_f32(v24, v31);
    float32x2_t v34 = vadd_f32(v153, vmul_n_f32(vadd_f32((float32x2_t)vzip1_s32(v32, v33), (float32x2_t)vzip2_s32(v32, v33)), v126));
    float v35 = 0.0;
    if (v126 <= 1.0) {
      float v35 = 1.0;
    }
    float32x2_t v36 = vmla_n_f32(vmul_n_f32(v128, 1.0 - v35), v34, v35);
    v172.origin.CGFloat x = v36.f32[0];
    v172.origin.CGFloat y = v36.f32[1];
    v172.size.CGFloat width = 0.0;
    v172.size.CGFloat height = 0.0;
    v154.origin.CGFloat x = r1;
    v154.origin.CGFloat y = v23;
    v154.size.CGFloat width = v27;
    v154.size.CGFloat height = v26;
    CGRect v155 = CGRectUnion(v154, v172);
    CGFloat r1a = v155.origin.x;
    CGFloat y = v155.origin.y;
    CGFloat width = v155.size.width;
    CGFloat height = v155.size.height;
    float32x2_t v39 = vsub_f32(v141, v153);
    *(float32x2_t *)&v155.origin.CGFloat x = vmul_f32(v39, v39);
    LODWORD(v155.origin.x) = vadd_f32(*(float32x2_t *)&v155.origin.x, (float32x2_t)vdup_lane_s32(*(int32x2_t *)&v155.origin.x, 1)).u32[0];
    *(float32x2_t *)&v155.origin.CGFloat y = vrsqrte_f32((float32x2_t)LODWORD(v155.origin.x));
    float v127 = v9
         * vmul_f32(*(float32x2_t *)&v155.origin.y, vrsqrts_f32((float32x2_t)LODWORD(v155.origin.x), vmul_f32(*(float32x2_t *)&v155.origin.y, *(float32x2_t *)&v155.origin.y))).f32[0];
    float v40 = logf(v127);
    __float2 v41 = __sincosf_stret(v22 * v40);
    v42.f32[0] = -v41.__sinval;
    v42.i32[1] = LODWORD(v41.__cosval);
    int32x2_t v43 = (int32x2_t)vmul_f32(v39, (float32x2_t)__PAIR64__(LODWORD(v41.__sinval), LODWORD(v41.__cosval)));
    int32x2_t v44 = (int32x2_t)vmul_f32(v39, v42);
    float32x2_t v45 = vadd_f32(v153, vmul_n_f32(vadd_f32((float32x2_t)vzip1_s32(v43, v44), (float32x2_t)vzip2_s32(v43, v44)), v127));
    float v46 = 0.0;
    if (v127 <= 1.0) {
      float v46 = 1.0;
    }
    float32x2_t v47 = vmla_n_f32(vmul_n_f32(v141, 1.0 - v46), v45, v46);
    v173.origin.CGFloat x = v47.f32[0];
    v173.origin.CGFloat y = v47.f32[1];
    v173.size.CGFloat width = 0.0;
    v173.size.CGFloat height = 0.0;
    v156.origin.CGFloat x = r1a;
    v156.origin.CGFloat y = y;
    v156.size.CGFloat width = width;
    v156.size.CGFloat height = height;
    CGRect v157 = CGRectUnion(v156, v173);
    CGFloat x = v157.origin.x;
    CGFloat r1b = v157.origin.y;
    CGFloat v48 = v157.size.width;
    CGFloat v49 = v157.size.height;
    float32x2_t v50 = vsub_f32(v146, v153);
    *(float32x2_t *)&v157.origin.CGFloat x = vmul_f32(v50, v50);
    LODWORD(v157.origin.x) = vadd_f32(*(float32x2_t *)&v157.origin.x, (float32x2_t)vdup_lane_s32(*(int32x2_t *)&v157.origin.x, 1)).u32[0];
    *(float32x2_t *)&v157.origin.CGFloat y = vrsqrte_f32((float32x2_t)LODWORD(v157.origin.x));
    float v130 = v9
         * vmul_f32(*(float32x2_t *)&v157.origin.y, vrsqrts_f32((float32x2_t)LODWORD(v157.origin.x), vmul_f32(*(float32x2_t *)&v157.origin.y, *(float32x2_t *)&v157.origin.y))).f32[0];
    float v51 = logf(v130);
    __float2 v52 = __sincosf_stret(v22 * v51);
    v53.f32[0] = -v52.__sinval;
    v53.i32[1] = LODWORD(v52.__cosval);
    int32x2_t v54 = (int32x2_t)vmul_f32(v50, (float32x2_t)__PAIR64__(LODWORD(v52.__sinval), LODWORD(v52.__cosval)));
    int32x2_t v55 = (int32x2_t)vmul_f32(v50, v53);
    float32x2_t v56 = vadd_f32(v153, vmul_n_f32(vadd_f32((float32x2_t)vzip1_s32(v54, v55), (float32x2_t)vzip2_s32(v54, v55)), v130));
    float v57 = 0.0;
    if (v130 <= 1.0) {
      float v57 = 1.0;
    }
    float32x2_t v58 = vmla_n_f32(vmul_n_f32(v146, 1.0 - v57), v56, v57);
    v174.origin.CGFloat x = v58.f32[0];
    v174.origin.CGFloat y = v58.f32[1];
    v174.size.CGFloat width = 0.0;
    v174.size.CGFloat height = 0.0;
    v158.origin.CGFloat x = x;
    v158.origin.CGFloat y = r1b;
    v158.size.CGFloat width = v48;
    v158.size.CGFloat height = v49;
    CGRect v159 = CGRectUnion(v158, v174);
    CGFloat v147 = v159.origin.x;
    CGFloat v143 = v159.origin.y;
    CGFloat v59 = v159.size.width;
    CGFloat v60 = v159.size.height;
    float32x2_t v61 = vsub_f32(v150, v153);
    *(float32x2_t *)&v159.origin.CGFloat x = vmul_f32(v61, v61);
    LODWORD(v159.origin.x) = vadd_f32(*(float32x2_t *)&v159.origin.x, (float32x2_t)vdup_lane_s32(*(int32x2_t *)&v159.origin.x, 1)).u32[0];
    *(float32x2_t *)&v159.origin.CGFloat y = vrsqrte_f32((float32x2_t)LODWORD(v159.origin.x));
    float r1c = v9
        * vmul_f32(*(float32x2_t *)&v159.origin.y, vrsqrts_f32((float32x2_t)LODWORD(v159.origin.x), vmul_f32(*(float32x2_t *)&v159.origin.y, *(float32x2_t *)&v159.origin.y))).f32[0];
    float v62 = logf(r1c);
    __float2 v63 = __sincosf_stret(v22 * v62);
    v64.f32[0] = -v63.__sinval;
    v64.i32[1] = LODWORD(v63.__cosval);
    int32x2_t v65 = (int32x2_t)vmul_f32(v61, (float32x2_t)__PAIR64__(LODWORD(v63.__sinval), LODWORD(v63.__cosval)));
    int32x2_t v66 = (int32x2_t)vmul_f32(v61, v64);
    float32x2_t v67 = vadd_f32(v153, vmul_n_f32(vadd_f32((float32x2_t)vzip1_s32(v65, v66), (float32x2_t)vzip2_s32(v65, v66)), r1c));
    float v68 = 0.0;
    if (r1c <= 1.0) {
      float v68 = 1.0;
    }
    float32x2_t v69 = vmla_n_f32(vmul_n_f32(v150, 1.0 - v68), v67, v68);
    v175.origin.CGFloat x = v69.f32[0];
    v175.origin.CGFloat y = v69.f32[1];
    v175.size.CGFloat width = 0.0;
    v175.size.CGFloat height = 0.0;
    v160.origin.CGFloat x = v147;
    v160.origin.CGFloat y = v143;
    v160.size.CGFloat width = v59;
    v160.size.CGFloat height = v60;
    CGRect v161 = CGRectUnion(v160, v175);
    CGFloat v70 = v161.origin.x;
    CGFloat v151 = v161.origin.y;
    CGFloat v148 = v161.size.width;
    CGFloat v71 = v161.size.height;
    v161.origin.CGFloat x = a2;
    v161.origin.CGFloat y = a3;
    v161.size.CGFloat width = a4;
    v161.size.CGFloat height = a5;
    float v125 = v9;
    CGFloat v140 = a2;
    if (CGRectGetMinX(v161) >= v153.f32[0])
    {
      CGFloat v145 = v70;
      CGFloat v72 = a3;
    }
    else
    {
      v162.origin.CGFloat x = a2;
      CGFloat v72 = a3;
      v162.origin.CGFloat y = a3;
      v162.size.CGFloat width = a4;
      v162.size.CGFloat height = a5;
      if (CGRectGetMaxX(v162) <= v153.f32[0])
      {
        CGFloat v145 = v70;
      }
      else
      {
        float32x2_t v73 = vsub_f32((float32x2_t)__PAIR64__(LODWORD(v121), v153.u32[0]), v153);
        int32x2_t v74 = (int32x2_t)vmul_f32(v73, v73);
        v74.i32[0] = vadd_f32((float32x2_t)v74, (float32x2_t)vdup_lane_s32(v74, 1)).u32[0];
        float32x2_t v75 = vrsqrte_f32((float32x2_t)v74.u32[0]);
        float r1d = v9 * vmul_f32(v75, vrsqrts_f32((float32x2_t)v74.u32[0], vmul_f32(v75, v75))).f32[0];
        float v76 = logf(r1d);
        __float2 v77 = __sincosf_stret(v22 * v76);
        v78.f32[0] = -v77.__sinval;
        v78.i32[1] = LODWORD(v77.__cosval);
        int32x2_t v79 = (int32x2_t)vmul_f32(v73, (float32x2_t)__PAIR64__(LODWORD(v77.__sinval), LODWORD(v77.__cosval)));
        int32x2_t v80 = (int32x2_t)vmul_f32(v73, v78);
        float32x2_t v81 = vadd_f32(v153, vmul_n_f32(vadd_f32((float32x2_t)vzip1_s32(v79, v80), (float32x2_t)vzip2_s32(v79, v80)), r1d));
        float v82 = 0.0;
        if (r1d <= 1.0) {
          float v82 = 1.0;
        }
        float32x2_t v83 = vmla_n_f32(vmul_n_f32((float32x2_t)__PAIR64__(LODWORD(v121), v153.u32[0]), 1.0 - v82), v81, v82);
        v176.origin.CGFloat x = v83.f32[0];
        v176.origin.CGFloat y = v83.f32[1];
        v176.size.CGFloat width = 0.0;
        v176.size.CGFloat height = 0.0;
        v163.origin.CGFloat x = v70;
        v163.origin.CGFloat y = v151;
        v163.size.CGFloat width = v148;
        v163.size.CGFloat height = v71;
        CGRect v164 = CGRectUnion(v163, v176);
        CGFloat v152 = v164.origin.x;
        CGFloat v84 = v164.origin.y;
        CGFloat v85 = v164.size.width;
        CGFloat v86 = v164.size.height;
        float32x2_t v87 = vsub_f32((float32x2_t)__PAIR64__(LODWORD(v122), v153.u32[0]), v153);
        *(float32x2_t *)&v164.origin.CGFloat x = vmul_f32(v87, v87);
        LODWORD(v164.origin.x) = vadd_f32(*(float32x2_t *)&v164.origin.x, (float32x2_t)vdup_lane_s32(*(int32x2_t *)&v164.origin.x, 1)).u32[0];
        *(float32x2_t *)&v164.origin.CGFloat y = vrsqrte_f32((float32x2_t)LODWORD(v164.origin.x));
        float v144 = v125
             * vmul_f32(*(float32x2_t *)&v164.origin.y, vrsqrts_f32((float32x2_t)LODWORD(v164.origin.x), vmul_f32(*(float32x2_t *)&v164.origin.y, *(float32x2_t *)&v164.origin.y))).f32[0];
        float v88 = logf(v144);
        __float2 v89 = __sincosf_stret(v22 * v88);
        v90.f32[0] = -v89.__sinval;
        v90.i32[1] = LODWORD(v89.__cosval);
        int32x2_t v91 = (int32x2_t)vmul_f32(v87, (float32x2_t)__PAIR64__(LODWORD(v89.__sinval), LODWORD(v89.__cosval)));
        int32x2_t v92 = (int32x2_t)vmul_f32(v87, v90);
        float32x2_t v93 = vadd_f32(v153, vmul_n_f32(vadd_f32((float32x2_t)vzip1_s32(v91, v92), (float32x2_t)vzip2_s32(v91, v92)), v144));
        float v94 = 0.0;
        if (v144 <= 1.0) {
          float v94 = 1.0;
        }
        float32x2_t v95 = vmla_n_f32(vmul_n_f32((float32x2_t)__PAIR64__(LODWORD(v122), v153.u32[0]), 1.0 - v94), v93, v94);
        v177.origin.CGFloat x = v95.f32[0];
        v177.origin.CGFloat y = v95.f32[1];
        v177.size.CGFloat width = 0.0;
        v177.size.CGFloat height = 0.0;
        v165.origin.CGFloat x = v152;
        v165.origin.CGFloat y = v84;
        v165.size.CGFloat width = v85;
        v165.size.CGFloat height = v86;
        CGRect v166 = CGRectUnion(v165, v177);
        CGFloat v145 = v166.origin.x;
        CGFloat v151 = v166.origin.y;
        CGFloat v148 = v166.size.width;
        CGFloat v71 = v166.size.height;
      }
    }
    v167.origin.CGFloat x = v140;
    v167.origin.CGFloat y = v72;
    v167.size.CGFloat width = a4;
    v167.size.CGFloat height = a5;
    if (CGRectGetMinY(v167) >= v138)
    {
      return v145;
    }
    else
    {
      v168.origin.CGFloat x = v140;
      v168.origin.CGFloat y = v72;
      v168.size.CGFloat width = a4;
      v168.size.CGFloat height = a5;
      double v7 = v145;
      if (CGRectGetMaxY(v168) > v138)
      {
        float32x2_t v96 = vsub_f32((float32x2_t)__PAIR64__(v153.u32[1], LODWORD(v123)), v153);
        int32x2_t v97 = (int32x2_t)vmul_f32(v96, v96);
        v97.i32[0] = vadd_f32((float32x2_t)v97, (float32x2_t)vdup_lane_s32(v97, 1)).u32[0];
        float32x2_t v98 = vrsqrte_f32((float32x2_t)v97.u32[0]);
        float v139 = v125 * vmul_f32(v98, vrsqrts_f32((float32x2_t)v97.u32[0], vmul_f32(v98, v98))).f32[0];
        float v99 = logf(v139);
        __float2 v100 = __sincosf_stret(v22 * v99);
        v101.f32[0] = -v100.__sinval;
        v101.i32[1] = LODWORD(v100.__cosval);
        int32x2_t v102 = (int32x2_t)vmul_f32(v96, (float32x2_t)__PAIR64__(LODWORD(v100.__sinval), LODWORD(v100.__cosval)));
        int32x2_t v103 = (int32x2_t)vmul_f32(v96, v101);
        float32x2_t v104 = vadd_f32(v153, vmul_n_f32(vadd_f32((float32x2_t)vzip1_s32(v102, v103), (float32x2_t)vzip2_s32(v102, v103)), v139));
        float v105 = 0.0;
        if (v139 <= 1.0) {
          float v105 = 1.0;
        }
        float32x2_t v106 = vmla_n_f32(vmul_n_f32((float32x2_t)__PAIR64__(v153.u32[1], LODWORD(v123)), 1.0 - v105), v104, v105);
        v178.origin.CGFloat x = v106.f32[0];
        v178.origin.CGFloat y = v106.f32[1];
        v178.size.CGFloat width = 0.0;
        v178.size.CGFloat height = 0.0;
        v169.origin.CGFloat x = v145;
        v169.origin.CGFloat y = v151;
        v169.size.CGFloat width = v148;
        v169.size.CGFloat height = v71;
        CGRect v170 = CGRectUnion(v169, v178);
        CGFloat v107 = v170.origin.x;
        CGFloat v108 = v170.origin.y;
        CGFloat v109 = v170.size.width;
        CGFloat v110 = v170.size.height;
        float32x2_t v111 = vsub_f32((float32x2_t)__PAIR64__(v153.u32[1], LODWORD(v124)), v153);
        *(float32x2_t *)&v170.origin.CGFloat x = vmul_f32(v111, v111);
        LODWORD(v170.origin.x) = vadd_f32(*(float32x2_t *)&v170.origin.x, (float32x2_t)vdup_lane_s32(*(int32x2_t *)&v170.origin.x, 1)).u32[0];
        *(float32x2_t *)&v170.origin.CGFloat y = vrsqrte_f32((float32x2_t)LODWORD(v170.origin.x));
        float v149 = v125
             * vmul_f32(*(float32x2_t *)&v170.origin.y, vrsqrts_f32((float32x2_t)LODWORD(v170.origin.x), vmul_f32(*(float32x2_t *)&v170.origin.y, *(float32x2_t *)&v170.origin.y))).f32[0];
        float v112 = logf(v149);
        __float2 v113 = __sincosf_stret(v22 * v112);
        v114.f32[0] = -v113.__sinval;
        v114.i32[1] = LODWORD(v113.__cosval);
        int32x2_t v115 = (int32x2_t)vmul_f32(v111, (float32x2_t)__PAIR64__(LODWORD(v113.__sinval), LODWORD(v113.__cosval)));
        int32x2_t v116 = (int32x2_t)vmul_f32(v111, v114);
        float32x2_t v117 = vadd_f32(v153, vmul_n_f32(vadd_f32((float32x2_t)vzip1_s32(v115, v116), (float32x2_t)vzip2_s32(v115, v116)), v149));
        float v118 = 0.0;
        if (v149 <= 1.0) {
          float v118 = 1.0;
        }
        float32x2_t v119 = vmla_n_f32(vmul_n_f32((float32x2_t)__PAIR64__(v153.u32[1], LODWORD(v124)), 1.0 - v118), v117, v118);
        v179.origin.CGFloat x = v119.f32[0];
        v179.origin.CGFloat y = v119.f32[1];
        v179.size.CGFloat width = 0.0;
        v179.size.CGFloat height = 0.0;
        v171.origin.CGFloat x = v107;
        v171.origin.CGFloat y = v108;
        v171.size.CGFloat width = v109;
        v171.size.CGFloat height = v110;
        *(void *)&double v7 = (unint64_t)CGRectUnion(v171, v179);
      }
    }
  }
  return v7;
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

- (NSNumber)inputRotation
{
  return self->inputRotation;
}

- (void)setInputRotation:(id)a3
{
}

- (NSNumber)inputRadius
{
  return self->inputRadius;
}

- (void)setInputRadius:(id)a3
{
}

@end