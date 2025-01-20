@interface CIBarsSwipeTransition
+ (id)customAttributes;
- (CIImage)inputImage;
- (CIImage)inputTargetImage;
- (NSNumber)inputAngle;
- (NSNumber)inputBarOffset;
- (NSNumber)inputTime;
- (NSNumber)inputWidth;
- (id)_kernel;
- (id)outputImage;
- (void)setInputAngle:(id)a3;
- (void)setInputBarOffset:(id)a3;
- (void)setInputImage:(id)a3;
- (void)setInputTargetImage:(id)a3;
- (void)setInputTime:(id)a3;
- (void)setInputWidth:(id)a3;
@end

@implementation CIBarsSwipeTransition

+ (id)customAttributes
{
  v13[7] = *MEMORY[0x1E4F143B8];
  v12[0] = @"CIAttributeFilterCategories";
  v11[0] = @"CICategoryTransition";
  v11[1] = @"CICategoryVideo";
  v11[2] = @"CICategoryStillImage";
  v11[3] = @"CICategoryBuiltIn";
  v13[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:4];
  v13[1] = @"6";
  v12[1] = @"CIAttributeFilterAvailable_iOS";
  v12[2] = @"CIAttributeFilterAvailable_Mac";
  v13[2] = @"10.5";
  v12[3] = @"inputAngle";
  v9[0] = @"CIAttributeSliderMin";
  v9[1] = @"CIAttributeSliderMax";
  v10[0] = &unk_1EE4A7BF0;
  v10[1] = &unk_1EE4A7C00;
  v9[2] = @"CIAttributeDefault";
  v9[3] = @"CIAttributeType";
  v10[2] = &unk_1EE4A7C10;
  v10[3] = @"CIAttributeTypeAngle";
  v13[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:4];
  v12[4] = @"inputWidth";
  v7[0] = @"CIAttributeMin";
  v7[1] = @"CIAttributeSliderMin";
  v8[0] = &unk_1EE4A7C20;
  v8[1] = &unk_1EE4A7C20;
  v7[2] = @"CIAttributeSliderMax";
  v7[3] = @"CIAttributeDefault";
  v8[2] = &unk_1EE4A7C30;
  v8[3] = &unk_1EE4A7C40;
  v7[4] = @"CIAttributeType";
  v8[4] = @"CIAttributeTypeDistance";
  v13[4] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:5];
  v12[5] = @"inputBarOffset";
  v5[0] = @"CIAttributeMin";
  v5[1] = @"CIAttributeSliderMin";
  v6[0] = &unk_1EE4A7C50;
  v6[1] = &unk_1EE4A7C50;
  v5[2] = @"CIAttributeSliderMax";
  v5[3] = @"CIAttributeDefault";
  v6[2] = &unk_1EE4A7C60;
  v6[3] = &unk_1EE4A7C70;
  v5[4] = @"CIAttributeType";
  v6[4] = @"CIAttributeTypeScalar";
  v13[5] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:5];
  v12[6] = @"inputTime";
  v3[0] = @"CIAttributeMin";
  v3[1] = @"CIAttributeSliderMin";
  v4[0] = &unk_1EE4A7BF0;
  v4[1] = &unk_1EE4A7BF0;
  v3[2] = @"CIAttributeSliderMax";
  v3[3] = @"CIAttributeMax";
  v4[2] = &unk_1EE4A7C50;
  v4[3] = &unk_1EE4A7C50;
  v3[4] = @"CIAttributeDefault";
  v3[5] = @"CIAttributeType";
  v4[4] = &unk_1EE4A7BF0;
  v4[5] = @"CIAttributeTypeTime";
  v13[6] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:6];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:7];
}

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_barsSwipe];
}

- (id)outputImage
{
  v82[3] = *MEMORY[0x1E4F143B8];
  inputImage = self->inputImage;
  if (!inputImage) {
    return self->inputTargetImage;
  }
  [(CIImage *)inputImage extent];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  [(CIImage *)self->inputTargetImage extent];
  CGFloat v65 = v12;
  CGFloat v59 = v13;
  CGFloat r2 = v14;
  CGFloat v16 = v15;
  [(NSNumber *)self->inputAngle floatValue];
  float v18 = v17;
  [(NSNumber *)self->inputTime floatValue];
  float v56 = fminf(fmaxf(v19, 0.0), 1.0);
  __float2 v20 = __sincosf_stret(v18);
  double v54 = fabs(v20.__cosval);
  double v55 = fabs(v20.__sinval);
  float v21 = v18 / 1.57079633;
  unsigned int v22 = vcvtms_s32_f32(v21);
  v83.origin.x = v5;
  double v63 = v9;
  double v64 = v7;
  v83.origin.y = v7;
  v83.size.width = v9;
  double v62 = v11;
  v83.size.height = v11;
  v85.origin.x = v65;
  v85.origin.y = v59;
  v85.size.width = r2;
  v85.size.height = v16;
  CGRect v84 = CGRectUnion(v83, v85);
  *(float *)&v84.origin.y = fmin(v84.size.width, 16384.0);
  float v66 = *(float *)&v84.origin.y;
  float v23 = fmin(v84.size.height, 16384.0);
  [(NSNumber *)self->inputWidth floatValue];
  float v25 = fmax(v24, 2.0);
  [(NSNumber *)self->inputBarOffset floatValue];
  float v27 = v26;
  v28 = +[CIVector vectorWithX:-(v20.__sinval * v26) Y:v20.__cosval * v26];
  [(CIVector *)v28 X];
  float64_t v60 = v29;
  [(CIVector *)v28 Y];
  v30.f64[0] = v60;
  v30.f64[1] = v31;
  float32x2_t v32 = vcvt_f32_f64(v30);
  if (v22 == 3)
  {
    v36 = +[CIVector vectorWithX:v54 / v25 Y:-v55 / v25 Z:v55 * v23 / v25];
    *(float *)&double v37 = v54;
    float cosval = v55;
    *(float *)&double v39 = v23;
    double v40 = v5;
    float v33 = v56;
    float v35 = v66;
  }
  else if (v22 == 2)
  {
    v36 = +[CIVector vectorWithX:-v54 / v25 Y:-v55 / v25 Z:v54 * v66 / v25 + v55 * v23 / v25];
    *(float *)&double v37 = v55;
    float cosval = v54;
    *(float *)&double v39 = v66;
    float v35 = v23;
    double v40 = v5;
    float v33 = v56;
  }
  else
  {
    float v33 = v56;
    if (v22 == 1)
    {
      v34 = +[CIVector vectorWithX:-v54 / v25 Y:v55 / v25 Z:v54 * v66 / v25];
      float v35 = v66;
      v36 = v34;
      *(float *)&double v37 = v54;
      float cosval = v55;
      *(float *)&double v39 = v23;
      double v40 = v5;
    }
    else
    {
      v36 = +[CIVector vectorWithX:v54 / v25 Y:v55 / v25 Z:0.0];
      *(float *)&double v39 = v66;
      *(float *)&double v37 = v20.__sinval;
      float v35 = v23;
      double v40 = v5;
      float cosval = v20.__cosval;
    }
  }
  *((float *)&v37 + 1) = cosval;
  *((float *)&v39 + 1) = v35;
  double v61 = v39;
  double v69 = v37;
  float v42 = maximum_time(v39, v37, v25, v27);
  [(CIVector *)v36 X];
  float64_t v67 = v43;
  [(CIVector *)v36 Y];
  v44.f64[0] = v67;
  v44.f64[1] = v45;
  float32x2_t r2a = vcvt_f32_f64(v44);
  [(CIVector *)v36 Z];
  float v47 = v46;
  *(float *)&unsigned int v48 = v33 * v42;
  id v49 = [(CIBarsSwipeTransition *)self _kernel];
  double v50 = *(double *)(MEMORY[0x1E4F1DB10] + 8);
  double v68 = *MEMORY[0x1E4F1DB10];
  double v52 = *(double *)(MEMORY[0x1E4F1DB10] + 16);
  double v51 = *(double *)(MEMORY[0x1E4F1DB10] + 24);
  v70[0] = MEMORY[0x1E4F143A8];
  v70[1] = 3221225472;
  v70[2] = __36__CIBarsSwipeTransition_outputImage__block_invoke;
  v70[3] = &__block_descriptor_116_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
  float v71 = v47;
  v70[4] = r2a;
  double v72 = v69;
  float32x2_t v73 = v32;
  float v79 = v25;
  unsigned int v80 = v48;
  double v74 = v61;
  double v75 = v40;
  double v76 = v64;
  double v77 = v63;
  double v78 = v62;
  unsigned int v81 = v22;
  v53 = self->inputImage;
  v82[0] = v36;
  v82[1] = v28;
  v82[2] = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(HIDWORD(v61), v48)));
  return (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v49, "applyWithExtent:roiCallback:inputImage:arguments:", v70, v53, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v82, 3), v68, v50, v52, v51), "imageByCompositingOverImage:", self->inputTargetImage), "imageByCroppingToRect:", v40, v64, v63, v62);
}

double __36__CIBarsSwipeTransition_outputImage__block_invoke(uint64_t a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  float32x2_t v9 = *(float32x2_t *)(a1 + 56);
  *(void *)v94 = *(void *)(a1 + 48);
  float v10 = *(float *)(a1 + 108);
  float v110 = *(float *)(a1 + 104);
  float32x2_t v111 = *(float32x2_t *)(a1 + 64);
  v11.f32[0] = a2;
  __int32 v104 = v11.i32[0];
  float32_t v12 = a3;
  __int32 v108 = LODWORD(v12);
  v11.f32[1] = v12;
  long long v98 = *(_OWORD *)(a1 + 32);
  float v13 = COERCE_FLOAT(*(void *)(a1 + 40));
  float v14 = fmax((float)(v10 - fabsf(floorf(*((float *)&v98 + 2) + vaddv_f32(vmul_f32(v11, *(float32x2_t *)&v98))))), 0.0);
  float32x2_t v15 = vadd_f32(v11, vmul_n_f32(v9, v14 * v14));
  v149.origin.float64_t x = v15.f32[0];
  v149.origin.CGFloat y = v15.f32[1];
  v149.size.CGFloat width = 0.0;
  v149.size.CGFloat height = 0.0;
  CGRect v119 = CGRectUnion(*MEMORY[0x1E4F1DB20], v149);
  *(float *)&unsigned int v16 = a3 + a5;
  unsigned int v106 = v16;
  float32x2_t v17 = (float32x2_t)__PAIR64__(v16, v104);
  float v18 = fmax((float)(v10- fabsf(floorf(v13 + vaddv_f32(vmul_f32((float32x2_t)__PAIR64__(v16, v104), *(float32x2_t *)&v98))))), 0.0);
  float32x2_t v19 = vadd_f32(v17, vmul_n_f32(v9, v18 * v18));
  v150.origin.float64_t x = v19.f32[0];
  v150.origin.CGFloat y = v19.f32[1];
  v150.size.CGFloat width = 0.0;
  v150.size.CGFloat height = 0.0;
  CGRect v120 = CGRectUnion(v119, v150);
  v20.f32[0] = a2 + a4;
  __int32 v105 = v20.i32[0];
  v20.i32[1] = v108;
  float v21 = fmax((float)(v10 - fabsf(floorf(v13 + vaddv_f32(vmul_f32(v20, *(float32x2_t *)&v98))))), 0.0);
  float32x2_t v22 = vadd_f32(v20, vmul_n_f32(v9, v21 * v21));
  v151.origin.float64_t x = v22.f32[0];
  v151.origin.CGFloat y = v22.f32[1];
  v151.size.CGFloat width = 0.0;
  v151.size.CGFloat height = 0.0;
  CGRect v121 = CGRectUnion(v120, v151);
  float v95 = v13;
  float v23 = fmax((float)(v10- fabsf(floorf(v13 + vaddv_f32(vmul_f32((float32x2_t)__PAIR64__(v106, v105), *(float32x2_t *)&v98))))), 0.0);
  float32x2_t v24 = vadd_f32((float32x2_t)__PAIR64__(v106, v105), vmul_n_f32(v9, v23 * v23));
  v152.origin.float64_t x = v24.f32[0];
  v152.origin.CGFloat y = v24.f32[1];
  v152.size.CGFloat width = 0.0;
  v152.size.CGFloat height = 0.0;
  CGRect v122 = CGRectUnion(v121, v152);
  float v25 = v110;
  CGFloat width = v122.size.width;
  float64_t x = v122.origin.x;
  float64_t r1 = v122.origin.y;
  CGFloat height = v122.size.height;
  float v27 = v94[1];
  int v28 = vcvtps_s32_f32(vmlas_n_f32(vmuls_lane_f32(v94[0], v111, 1), v94[1], v111.f32[0]) / v110);
  if (v28 >= 1024) {
    int v28 = 1024;
  }
  if ((v28 & 0x80000000) == 0)
  {
    int v29 = 0;
    float32x2_t v30 = vmul_f32(v9, v9);
    v30.i32[0] = vadd_f32(v30, (float32x2_t)vdup_lane_s32((int32x2_t)v30, 1)).u32[0];
    float32x2_t v31 = vrsqrte_f32((float32x2_t)v30.u32[0]);
    float32x2_t v32 = vmul_n_f32(vneg_f32(v9), vmul_f32(v31, vrsqrts_f32((float32x2_t)v30.u32[0], vmul_f32(v31, v31))).f32[0]);
    double v109 = fabsf(v32.f32[1]);
    double v97 = fabsf(v32.f32[0]);
    float v89 = v111.f32[1] / v94[1];
    double v107 = (float)(v32.f32[1] / v32.f32[0]);
    int v33 = v28 + 1;
    float32x2_t v96 = v9;
    do
    {
      float v34 = v25 * (float)v29;
      if (v109 >= 0.00001)
      {
        if (v97 >= 0.00001)
        {
          double v56 = (float)((float)-(float)(v34 * v27) / v94[0]);
          if ((float)-v94[1] * v56 >= (float)-v94[1] * (float)((float)((float)(v94[0] * v34) / v27) - v89)) {
            double v56 = (float)((float)((float)(v94[0] * v34) / v27) - v89);
          }
          float v57 = (float)((float)(v94[0] * v110) * (float)v29) - v56 * v94[1];
          v133.origin.float64_t x = a2;
          v133.origin.CGFloat y = a3;
          v133.size.CGFloat width = a4;
          v133.size.CGFloat height = a5;
          double v58 = v57;
          double MaxY = CGRectGetMaxY(v133);
          double v114 = (MaxY - v58) / v107;
          v134.origin.float64_t x = a2;
          v134.origin.CGFloat y = a3;
          v134.size.CGFloat width = a4;
          v134.size.CGFloat height = a5;
          if (v114 >= CGRectGetMinX(v134))
          {
            v135.origin.float64_t x = a2;
            v135.origin.CGFloat y = a3;
            v135.size.CGFloat width = a4;
            v135.size.CGFloat height = a5;
            if (v114 <= CGRectGetMaxX(v135))
            {
              v59.f64[0] = (MaxY - v58) / v107;
              v59.f64[1] = MaxY;
              float32x2_t v60 = vcvt_f32_f64(v59);
              *(float *)v59.f64 = fmax((float)(v10 - fabsf(floorf(v95 + vaddv_f32(vmul_f32(*(float32x2_t *)&v98, v60))))), 0.0);
              float32x2_t v61 = vadd_f32(vmul_n_f32(v96, *(float *)v59.f64 * *(float *)v59.f64), v60);
              v155.origin.float64_t x = v61.f32[0];
              v155.origin.CGFloat y = v61.f32[1];
              v155.size.CGFloat width = 0.0;
              v155.size.CGFloat height = 0.0;
              CGFloat v63 = width;
              float64_t v62 = x;
              v59.f64[0] = r1;
              CGFloat v64 = height;
              CGRect v136 = CGRectUnion(*(CGRect *)((char *)&v59 - 8), v155);
              CGFloat width = v136.size.width;
              float64_t x = v136.origin.x;
              float64_t r1 = v136.origin.y;
              CGFloat height = v136.size.height;
            }
          }
          v137.origin.float64_t x = a2;
          v137.origin.CGFloat y = a3;
          v137.size.CGFloat width = a4;
          v137.size.CGFloat height = a5;
          double MinY = CGRectGetMinY(v137);
          double v115 = (MinY - v58) / v107;
          v138.origin.float64_t x = a2;
          v138.origin.CGFloat y = a3;
          v138.size.CGFloat width = a4;
          v138.size.CGFloat height = a5;
          if (v115 >= CGRectGetMinX(v138))
          {
            v139.origin.float64_t x = a2;
            v139.origin.CGFloat y = a3;
            v139.size.CGFloat width = a4;
            v139.size.CGFloat height = a5;
            if (v115 <= CGRectGetMaxX(v139))
            {
              v65.f64[0] = (MinY - v58) / v107;
              v65.f64[1] = MinY;
              float32x2_t v66 = vcvt_f32_f64(v65);
              *(float *)v65.f64 = fmax((float)(v10 - fabsf(floorf(v95 + vaddv_f32(vmul_f32(*(float32x2_t *)&v98, v66))))), 0.0);
              float32x2_t v67 = vadd_f32(vmul_n_f32(v96, *(float *)v65.f64 * *(float *)v65.f64), v66);
              v156.origin.float64_t x = v67.f32[0];
              v156.origin.CGFloat y = v67.f32[1];
              v156.size.CGFloat width = 0.0;
              v156.size.CGFloat height = 0.0;
              CGFloat v69 = width;
              float64_t v68 = x;
              v65.f64[0] = r1;
              CGFloat v70 = height;
              CGRect v140 = CGRectUnion(*(CGRect *)((char *)&v65 - 8), v156);
              CGFloat width = v140.size.width;
              float64_t x = v140.origin.x;
              float64_t r1 = v140.origin.y;
              CGFloat height = v140.size.height;
            }
          }
          v141.origin.float64_t x = a2;
          v141.origin.CGFloat y = a3;
          v141.size.CGFloat width = a4;
          v141.size.CGFloat height = a5;
          double MinX = CGRectGetMinX(v141);
          double v116 = v58 + v107 * MinX;
          v142.origin.float64_t x = a2;
          v142.origin.CGFloat y = a3;
          v142.size.CGFloat width = a4;
          v142.size.CGFloat height = a5;
          if (v116 >= CGRectGetMinY(v142))
          {
            v143.origin.float64_t x = a2;
            v143.origin.CGFloat y = a3;
            v143.size.CGFloat width = a4;
            v143.size.CGFloat height = a5;
            if (v116 <= CGRectGetMaxY(v143))
            {
              v71.f64[0] = MinX;
              v71.f64[1] = v58 + v107 * MinX;
              *(float32x2_t *)&v71.f64[0] = vcvt_f32_f64(v71);
              float v72 = fmax((float)(v10- fabsf(floorf(v95 + vaddv_f32(vmul_f32(*(float32x2_t *)&v98, *(float32x2_t *)&v71.f64[0]))))), 0.0);
              *(float32x2_t *)&v71.f64[0] = vadd_f32(vmul_n_f32(v96, v72 * v72), *(float32x2_t *)&v71.f64[0]);
              v157.origin.float64_t x = *(float *)v71.f64;
              v157.origin.CGFloat y = *((float *)v71.f64 + 1);
              v157.size.CGFloat width = 0.0;
              v157.size.CGFloat height = 0.0;
              CGFloat v73 = width;
              v71.f64[0] = x;
              float64_t v74 = r1;
              CGFloat v75 = height;
              CGRect v144 = CGRectUnion(*(CGRect *)v71.f64, v157);
              CGFloat width = v144.size.width;
              float64_t x = v144.origin.x;
              float64_t r1 = v144.origin.y;
              CGFloat height = v144.size.height;
            }
          }
          v145.origin.float64_t x = a2;
          v145.origin.CGFloat y = a3;
          v145.size.CGFloat width = a4;
          v145.size.CGFloat height = a5;
          double MaxX = CGRectGetMaxX(v145);
          double v117 = v58 + v107 * MaxX;
          v146.origin.float64_t x = a2;
          v146.origin.CGFloat y = a3;
          v146.size.CGFloat width = a4;
          v146.size.CGFloat height = a5;
          if (v117 < CGRectGetMinY(v146)) {
            goto LABEL_29;
          }
          v147.origin.float64_t x = a2;
          v147.origin.CGFloat y = a3;
          v147.size.CGFloat width = a4;
          v147.size.CGFloat height = a5;
          if (v117 > CGRectGetMaxY(v147)) {
            goto LABEL_29;
          }
          v76.f64[0] = MaxX;
          v76.f64[1] = v58 + v107 * MaxX;
          *(float32x2_t *)&v76.f64[0] = vcvt_f32_f64(v76);
          float v77 = fmax((float)(v10- fabsf(floorf(v95 + vaddv_f32(vmul_f32(*(float32x2_t *)&v98, *(float32x2_t *)&v76.f64[0]))))), 0.0);
          *(float32x2_t *)&v76.f64[0] = vadd_f32(vmul_n_f32(v96, v77 * v77), *(float32x2_t *)&v76.f64[0]);
          double v50 = *(float *)v76.f64;
          double v51 = *((float *)v76.f64 + 1);
          uint64_t v52 = 0;
          uint64_t v53 = 0;
          float64_t v54 = x;
          float64_t v55 = r1;
          goto LABEL_28;
        }
        *(float *)&__int32 v113 = v25 * (float)v29;
        double v44 = v34;
        v128.origin.float64_t x = a2;
        v128.origin.CGFloat y = a3;
        v128.size.CGFloat width = a4;
        v128.size.CGFloat height = a5;
        if (CGRectGetMinY(v128) > v44) {
          goto LABEL_29;
        }
        v129.origin.float64_t x = a2;
        v129.origin.CGFloat y = a3;
        v129.size.CGFloat width = a4;
        v129.size.CGFloat height = a5;
        if (CGRectGetMaxY(v129) < v44) {
          goto LABEL_29;
        }
        v130.origin.float64_t x = a2;
        v130.origin.CGFloat y = a3;
        v130.size.CGFloat width = a4;
        v130.size.CGFloat height = a5;
        v45.f32[0] = CGRectGetMinX(v130);
        v45.i32[1] = v113;
        float v46 = fmax((float)(v10 - fabsf(floorf(v95 + vaddv_f32(vmul_f32(*(float32x2_t *)&v98, v45))))), 0.0);
        float32x2_t v47 = vadd_f32(v45, vmul_n_f32(v96, v46 * v46));
        v154.origin.float64_t x = v47.f32[0];
        v154.origin.CGFloat y = v47.f32[1];
        v154.size.CGFloat width = 0.0;
        v154.size.CGFloat height = 0.0;
        v131.size.CGFloat width = width;
        v131.origin.float64_t x = x;
        v131.origin.CGFloat y = r1;
        v131.size.CGFloat height = height;
        CGRect v132 = CGRectUnion(v131, v154);
        CGFloat r1a = v132.origin.x;
        CGFloat width = v132.size.width;
        CGFloat y = v132.origin.y;
        CGFloat height = v132.size.height;
        v132.origin.float64_t x = a2;
        v132.origin.CGFloat y = a3;
        v132.size.CGFloat width = a4;
        v132.size.CGFloat height = a5;
        v48.f32[0] = CGRectGetMaxX(v132);
        v48.i32[1] = v113;
        float v27 = v94[1];
        float v49 = fmax((float)(v10 - fabsf(floorf(v95 + vaddv_f32(vmul_f32(*(float32x2_t *)&v98, v48))))), 0.0);
        float32x2_t v43 = vadd_f32(v48, vmul_n_f32(v96, v49 * v49));
      }
      else
      {
        double v35 = v34;
        v123.origin.float64_t x = a2;
        v123.origin.CGFloat y = a3;
        v123.size.CGFloat width = a4;
        float v112 = v25 * (float)v29;
        v123.size.CGFloat height = a5;
        if (CGRectGetMinX(v123) > v35) {
          goto LABEL_29;
        }
        v124.origin.float64_t x = a2;
        v124.origin.CGFloat y = a3;
        v124.size.CGFloat width = a4;
        v124.size.CGFloat height = a5;
        if (CGRectGetMaxX(v124) < v35) {
          goto LABEL_29;
        }
        v125.origin.float64_t x = a2;
        v125.origin.CGFloat y = a3;
        v125.size.CGFloat width = a4;
        v125.size.CGFloat height = a5;
        *(float *)&unsigned int v36 = CGRectGetMaxY(v125);
        float32x2_t v37 = (float32x2_t)__PAIR64__(v36, LODWORD(v112));
        float v38 = fmax((float)(v10- fabsf(floorf(v95 + vaddv_f32(vmul_f32(*(float32x2_t *)&v98, (float32x2_t)__PAIR64__(v36, LODWORD(v112))))))), 0.0);
        float32x2_t v39 = vadd_f32(v37, vmul_n_f32(v96, v38 * v38));
        v153.origin.float64_t x = v39.f32[0];
        v153.origin.CGFloat y = v39.f32[1];
        v153.size.CGFloat width = 0.0;
        v153.size.CGFloat height = 0.0;
        v126.size.CGFloat width = width;
        v126.origin.float64_t x = x;
        v126.origin.CGFloat y = r1;
        v126.size.CGFloat height = height;
        CGRect v127 = CGRectUnion(v126, v153);
        CGFloat r1a = v127.origin.x;
        CGFloat width = v127.size.width;
        CGFloat y = v127.origin.y;
        CGFloat height = v127.size.height;
        v127.origin.float64_t x = a2;
        v127.origin.CGFloat y = a3;
        v127.size.CGFloat width = a4;
        v127.size.CGFloat height = a5;
        *(float *)&unsigned int v40 = CGRectGetMinY(v127);
        float32x2_t v41 = (float32x2_t)__PAIR64__(v40, LODWORD(v112));
        float v27 = v94[1];
        float v42 = fmax((float)(v10- fabsf(floorf(v95 + vaddv_f32(vmul_f32(*(float32x2_t *)&v98, (float32x2_t)__PAIR64__(v40, LODWORD(v112))))))), 0.0);
        float32x2_t v43 = vadd_f32(v41, vmul_n_f32(v96, v42 * v42));
      }
      double v50 = v43.f32[0];
      double v51 = v43.f32[1];
      uint64_t v52 = 0;
      uint64_t v53 = 0;
      float64_t v54 = r1a;
      float64_t v55 = y;
LABEL_28:
      CGFloat v78 = width;
      CGFloat v79 = height;
      CGRect v148 = CGRectUnion(*(CGRect *)&v54, *(CGRect *)&v50);
      CGFloat width = v148.size.width;
      float64_t x = v148.origin.x;
      float64_t r1 = v148.origin.y;
      CGFloat height = v148.size.height;
LABEL_29:
      float v25 = v110;
      ++v29;
    }
    while (v33 != v29);
  }
  CGFloat v81 = width;
  float64_t v80 = x;
  float64_t v82 = r1;
  CGFloat v83 = height;
  CGFloat v84 = a2;
  CGFloat v85 = a3;
  CGFloat v86 = a4;
  CGFloat v87 = a5;

  *(void *)&double result = (unint64_t)CGRectUnion(*(CGRect *)&v80, *(CGRect *)&v84);
  return result;
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
}

- (CIImage)inputTargetImage
{
  return self->inputTargetImage;
}

- (void)setInputTargetImage:(id)a3
{
}

- (NSNumber)inputAngle
{
  return self->inputAngle;
}

- (void)setInputAngle:(id)a3
{
}

- (NSNumber)inputWidth
{
  return self->inputWidth;
}

- (void)setInputWidth:(id)a3
{
}

- (NSNumber)inputBarOffset
{
  return self->inputBarOffset;
}

- (void)setInputBarOffset:(id)a3
{
}

- (NSNumber)inputTime
{
  return self->inputTime;
}

- (void)setInputTime:(id)a3
{
}

@end