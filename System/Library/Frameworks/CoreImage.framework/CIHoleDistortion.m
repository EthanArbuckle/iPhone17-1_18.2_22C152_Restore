@interface CIHoleDistortion
+ (id)customAttributes;
- (BOOL)_isIdentity;
- (CGRect)computeDOD;
- (CIImage)inputImage;
- (CIVector)inputCenter;
- (NSNumber)inputRadius;
- (id)_colorKernel;
- (id)_geomKernel;
- (id)outputImage;
- (void)setInputCenter:(id)a3;
- (void)setInputImage:(id)a3;
- (void)setInputRadius:(id)a3;
@end

@implementation CIHoleDistortion

+ (id)customAttributes
{
  v9[5] = *MEMORY[0x1E4F143B8];
  v8[0] = @"CIAttributeFilterCategories";
  v7[0] = @"CICategoryDistortionEffect";
  v7[1] = @"CICategoryVideo";
  v7[2] = @"CICategoryStillImage";
  v7[3] = @"CICategoryBuiltIn";
  v9[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:4];
  v9[1] = @"6";
  v8[1] = @"CIAttributeFilterAvailable_iOS";
  v8[2] = @"CIAttributeFilterAvailable_Mac";
  v9[2] = @"10.4";
  v8[3] = @"inputRadius";
  v5[0] = @"CIAttributeMin";
  v5[1] = @"CIAttributeSliderMin";
  v6[0] = &unk_1EE4A8F20;
  v6[1] = &unk_1EE4A8F20;
  v5[2] = @"CIAttributeSliderMax";
  v5[3] = @"CIAttributeDefault";
  v6[2] = &unk_1EE4A8F30;
  v6[3] = &unk_1EE4A8F40;
  v5[4] = @"CIAttributeIdentity";
  v5[5] = @"CIAttributeType";
  v6[4] = &unk_1EE4A8F50;
  v6[5] = @"CIAttributeTypeDistance";
  v9[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:6];
  v8[4] = @"inputCenter";
  v3[0] = @"CIAttributeDefault";
  v3[1] = @"CIAttributeType";
  v4[0] = +[CIVector vectorWithX:150.0 Y:150.0];
  v4[1] = @"CIAttributeTypePosition";
  v9[4] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:2];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:5];
}

- (BOOL)_isIdentity
{
  [(NSNumber *)self->inputRadius doubleValue];
  return v2 <= 0.1;
}

- (id)_geomKernel
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_holeDistortion];
}

- (id)_colorKernel
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_holeAntialias];
}

- (CGRect)computeDOD
{
  double v111 = *MEMORY[0x1E4F1DB20];
  CGFloat v108 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  CGFloat v3 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  CGFloat v106 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  [(CIImage *)self->inputImage extent];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  [(CIVector *)self->inputCenter X];
  double v13 = v12;
  [(CIVector *)self->inputCenter Y];
  double v15 = v14;
  [(NSNumber *)self->inputRadius floatValue];
  float v17 = v16;
  v113.origin.x = v5;
  v113.origin.y = v7;
  v113.size.width = v9;
  v113.size.height = v11;
  if (CGRectIsInfinite(v113))
  {
    double v18 = v5;
  }
  else
  {
    CGFloat v19 = v111;
    CGFloat v105 = v9;
    CGFloat v110 = v11;
    v21.f32[0] = v13;
    float v20 = v15;
    float v99 = v20;
    float v100 = v21.f32[0];
    v21.f32[1] = v20;
    v23.f32[0] = v5;
    float v22 = v7;
    __int32 v104 = v23.i32[0];
    float v102 = v22;
    v23.f32[1] = v22;
    float32x2_t v24 = vsub_f32(v23, v21);
    double v25 = vaddv_f32(vmul_f32(v24, v24));
    if (v25 >= 0.00001)
    {
      float v26 = sqrt((float)(v17 * v17) * 4.0 / v25 + 1.0) + 1.0;
      float32x2_t v23 = vadd_f32(v21, vmul_n_f32(vmul_f32(v24, (float32x2_t)0x3F0000003F000000), v26));
    }
    float32x2_t v112 = v21;
    double v28 = unionPointWithRect(*(double *)&v23, v19, v108, v106, v3);
    CGFloat v30 = v29;
    CGFloat v32 = v31;
    *(float *)&double v29 = v7 + v11;
    unint64_t v33 = __PAIR64__(LODWORD(v29), v104);
    unsigned int v101 = LODWORD(v29);
    float32x2_t v34 = vsub_f32((float32x2_t)__PAIR64__(LODWORD(v29), v104), v112);
    double v35 = vaddv_f32(vmul_f32(v34, v34));
    if (v35 >= 0.00001)
    {
      float v36 = sqrt((float)(v17 * v17) * 4.0 / v35 + 1.0) + 1.0;
      unint64_t v33 = (unint64_t)vadd_f32(v112, vmul_n_f32(vmul_f32(v34, (float32x2_t)0x3F0000003F000000), v36));
    }
    double v38 = unionPointWithRect(*(double *)&v33, v28, v30, v32, v27);
    CGFloat v40 = v39;
    CGFloat v42 = v41;
    v43.f32[0] = v5 + v9;
    __int32 v103 = v43.i32[0];
    v43.f32[1] = v102;
    float32x2_t v44 = vsub_f32(v43, v112);
    double v45 = vaddv_f32(vmul_f32(v44, v44));
    if (v45 >= 0.00001)
    {
      float v46 = sqrt((float)(v17 * v17) * 4.0 / v45 + 1.0) + 1.0;
      float32x2_t v43 = vadd_f32(v112, vmul_n_f32(vmul_f32(v44, (float32x2_t)0x3F0000003F000000), v46));
    }
    CGFloat v109 = v7;
    double v48 = unionPointWithRect(*(double *)&v43, v38, v40, v42, v37);
    CGFloat v50 = v49;
    CGFloat v52 = v51;
    unint64_t v53 = __PAIR64__(v101, v103);
    float32x2_t v54 = vsub_f32((float32x2_t)__PAIR64__(v101, v103), v112);
    double v55 = vaddv_f32(vmul_f32(v54, v54));
    if (v55 >= 0.00001)
    {
      float v56 = sqrt((float)(v17 * v17) * 4.0 / v55 + 1.0) + 1.0;
      unint64_t v53 = (unint64_t)vadd_f32(v112, vmul_n_f32(vmul_f32(v54, (float32x2_t)0x3F0000003F000000), v56));
    }
    float v98 = v17;
    double v107 = unionPointWithRect(*(double *)&v53, v48, v50, v52, v47);
    double v7 = v57;
    double v9 = v58;
    double v11 = v59;
    v114.origin.x = v5;
    v114.origin.y = v109;
    v114.size.width = v105;
    CGFloat v60 = v110;
    v114.size.height = v110;
    if (CGRectGetMinX(v114) < v100)
    {
      v115.origin.x = v5;
      v115.origin.y = v109;
      v115.size.width = v105;
      v115.size.height = v110;
      if (CGRectGetMaxX(v115) <= v100)
      {
        CGFloat v60 = v110;
      }
      else
      {
        unint64_t v61 = __PAIR64__(LODWORD(v102), v112.u32[0]);
        float32x2_t v62 = vsub_f32((float32x2_t)__PAIR64__(LODWORD(v102), v112.u32[0]), v112);
        double v63 = vaddv_f32(vmul_f32(v62, v62));
        if (v63 >= 0.00001)
        {
          float v64 = sqrt((float)(v98 * v98) * 4.0 / v63 + 1.0) + 1.0;
          unint64_t v61 = (unint64_t)vadd_f32(v112, vmul_n_f32(vmul_f32(v62, (float32x2_t)0x3F0000003F000000), v64));
        }
        double v66 = unionPointWithRect(*(double *)&v61, v107, v7, v9, v11);
        CGFloat v68 = v67;
        CGFloat v70 = v69;
        unint64_t v71 = __PAIR64__(v101, v112.u32[0]);
        float32x2_t v72 = vsub_f32((float32x2_t)__PAIR64__(v101, v112.u32[0]), v112);
        double v73 = vaddv_f32(vmul_f32(v72, v72));
        if (v73 >= 0.00001)
        {
          float v74 = sqrt((float)(v98 * v98) * 4.0 / v73 + 1.0) + 1.0;
          unint64_t v71 = (unint64_t)vadd_f32(v112, vmul_n_f32(vmul_f32(v72, (float32x2_t)0x3F0000003F000000), v74));
        }
        double v107 = unionPointWithRect(*(double *)&v71, v66, v68, v70, v65);
        double v7 = v75;
        double v9 = v76;
        double v11 = v77;
        CGFloat v60 = v110;
      }
    }
    v116.origin.x = v5;
    v116.origin.y = v109;
    v116.size.width = v105;
    v116.size.height = v60;
    if (CGRectGetMinY(v116) >= v99
      || (v117.origin.x = v5,
          v117.origin.y = v109,
          v117.size.width = v105,
          v117.size.height = v60,
          CGRectGetMaxY(v117) <= v99))
    {
      double v18 = v107;
    }
    else
    {
      unint64_t v78 = __PAIR64__(v112.u32[1], v104);
      float32x2_t v79 = vsub_f32((float32x2_t)__PAIR64__(v112.u32[1], v104), v112);
      double v80 = vaddv_f32(vmul_f32(v79, v79));
      if (v80 >= 0.00001)
      {
        float v81 = sqrt((float)(v98 * v98) * 4.0 / v80 + 1.0) + 1.0;
        unint64_t v78 = (unint64_t)vadd_f32(v112, vmul_n_f32(vmul_f32(v79, (float32x2_t)0x3F0000003F000000), v81));
      }
      double v83 = unionPointWithRect(*(double *)&v78, v107, v7, v9, v11);
      CGFloat v85 = v84;
      CGFloat v87 = v86;
      unint64_t v88 = __PAIR64__(v112.u32[1], v103);
      float32x2_t v89 = vsub_f32((float32x2_t)__PAIR64__(v112.u32[1], v103), v112);
      double v90 = vaddv_f32(vmul_f32(v89, v89));
      if (v90 >= 0.00001)
      {
        float v91 = sqrt((float)(v98 * v98) * 4.0 / v90 + 1.0) + 1.0;
        unint64_t v88 = (unint64_t)vadd_f32(v112, vmul_n_f32(vmul_f32(v89, (float32x2_t)0x3F0000003F000000), v91));
      }
      double v18 = unionPointWithRect(*(double *)&v88, v83, v85, v87, v82);
      double v7 = v92;
      double v9 = v93;
      double v11 = v94;
    }
  }
  double v95 = v7;
  double v96 = v9;
  double v97 = v11;
  result.size.height = v97;
  result.size.width = v96;
  result.origin.y = v95;
  result.origin.x = v18;
  return result;
}

- (id)outputImage
{
  v23[2] = *MEMORY[0x1E4F143B8];
  [(NSNumber *)self->inputRadius doubleValue];
  double v4 = v3;
  if (v3 <= 0.1)
  {
    CGFloat v19 = self->inputImage;
    return v19;
  }
  else
  {
    [(CIVector *)self->inputCenter X];
    float64_t v20 = v5;
    [(CIVector *)self->inputCenter Y];
    v6.f64[0] = v20;
    v6.f64[1] = v7;
    float32x2_t v8 = vcvt_f32_f64(v6);
    inputCenter = self->inputCenter;
    if (!inputCenter) {
      inputCenter = +[CIVector vectorWithX:0.0 Y:0.0];
    }
    [(CIHoleDistortion *)self computeDOD];
    CGRect v26 = CGRectIntegral(v25);
    double x = v26.origin.x;
    double y = v26.origin.y;
    double width = v26.size.width;
    double height = v26.size.height;
    id v14 = [(CIHoleDistortion *)self _geomKernel];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __31__CIHoleDistortion_outputImage__block_invoke;
    v21[3] = &__block_descriptor_48_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
    v21[4] = v8;
    *(double *)&v21[5] = v4;
    inputImage = self->inputImage;
    v23[0] = inputCenter;
    v23[1] = [NSNumber numberWithDouble:v4 * v4];
    uint64_t v16 = objc_msgSend(v14, "applyWithExtent:roiCallback:inputImage:arguments:", v21, inputImage, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v23, 2), x, y, width, height);
    id v17 = [(CIHoleDistortion *)self _colorKernel];
    v22[0] = v16;
    v22[1] = inputCenter;
    v22[2] = [NSNumber numberWithDouble:v4];
    return (id)objc_msgSend(v17, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v22, 3), x, y, width, height);
  }
}

double __31__CIHoleDistortion_outputImage__block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  float32x2_t v6 = *(float32x2_t *)(a1 + 32);
  v8.f32[0] = a2;
  double v9 = a3 + a5;
  *(float *)&unsigned int v10 = a3 + a5;
  double v11 = a2 + a4;
  v12.f32[0] = a2 + a4;
  unsigned int v105 = v10;
  __int32 v106 = v12.i32[0];
  __int32 v107 = v8.i32[0];
  float32x2_t v108 = (float32x2_t)__PAIR64__(v10, v12.u32[0]);
  float v13 = a3;
  v8.f32[1] = v13;
  float v104 = v13;
  v12.f32[1] = v13;
  float32x2_t v110 = v8;
  float32x2_t v113 = v12;
  float32x2_t v14 = vsub_f32((float32x2_t)__PAIR64__(v10, v8.u32[0]), v6);
  float v15 = sqrtf(vaddv_f32(vmul_f32(v14, v14)));
  float v16 = 1.0 / v15;
  if (v15 == 0.0) {
    float v16 = 0.0;
  }
  float32x2_t v17 = vmul_n_f32(v14, v16);
  float v7 = *(double *)(a1 + 40);
  float v116 = -(float)(v7 * v7);
  float32x2_t v118 = *(float32x2_t *)(a1 + 32);
  float v18 = v15 + (float)(v116 * v16);
  if (v18 <= 0.0) {
    float v18 = 0.0;
  }
  double v20 = unionPointWithRect(COERCE_DOUBLE(vadd_f32(v6, vmul_n_f32(v17, v18))), *MEMORY[0x1E4F1DB20], *(CGFloat *)(MEMORY[0x1E4F1DB20] + 8), *(CGFloat *)(MEMORY[0x1E4F1DB20] + 16), *(CGFloat *)(MEMORY[0x1E4F1DB20] + 24));
  CGFloat v22 = v21;
  CGFloat v24 = v23;
  float32x2_t v25 = vsub_f32(v108, v118);
  float v26 = sqrtf(vaddv_f32(vmul_f32(v25, v25)));
  float v27 = 1.0 / v26;
  if (v26 == 0.0) {
    float v27 = 0.0;
  }
  float32x2_t v28 = vmul_n_f32(v25, v27);
  float v29 = v26 + (float)(v116 * v27);
  if (v29 <= 0.0) {
    float v29 = 0.0;
  }
  double v31 = unionPointWithRect(COERCE_DOUBLE(vadd_f32(v118, vmul_n_f32(v28, v29))), v20, v22, v24, v19);
  CGFloat v33 = v32;
  CGFloat v35 = v34;
  float32x2_t v36 = vsub_f32(v110, v118);
  float v37 = sqrtf(vaddv_f32(vmul_f32(v36, v36)));
  float v38 = 1.0 / v37;
  if (v37 == 0.0) {
    float v38 = 0.0;
  }
  float32x2_t v39 = vmul_n_f32(v36, v38);
  float v40 = v37 + (float)(v116 * v38);
  if (v40 <= 0.0) {
    float v40 = 0.0;
  }
  double v42 = unionPointWithRect(COERCE_DOUBLE(vadd_f32(v118, vmul_n_f32(v39, v40))), v31, v33, v35, v30);
  CGFloat v44 = v43;
  CGFloat v46 = v45;
  float32x2_t v47 = vsub_f32(v113, v118);
  float v48 = sqrtf(vaddv_f32(vmul_f32(v47, v47)));
  float v49 = 1.0 / v48;
  if (v48 == 0.0) {
    float v49 = 0.0;
  }
  float32x2_t v50 = vmul_n_f32(v47, v49);
  float v51 = v48 + (float)(v116 * v49);
  if (v51 <= 0.0) {
    float v51 = 0.0;
  }
  double v52 = unionPointWithRect(COERCE_DOUBLE(vadd_f32(v118, vmul_n_f32(v50, v51))), v42, v44, v46, v41);
  CGFloat v54 = v53;
  CGFloat v56 = v55;
  float32x2_t v57 = v118;
  CGFloat v59 = v58;
  __asm { FMOV            V9.2S, #1.0 }
  if (_NF && v11 > v118.f32[0])
  {
    float32x2_t v65 = vsub_f32((float32x2_t)__PAIR64__(v105, v118.u32[0]), v118);
    int32x2_t v66 = (int32x2_t)vmul_f32(v65, v65);
    float32x2_t v67 = vsub_f32((float32x2_t)__PAIR64__(LODWORD(v104), v118.u32[0]), v118);
    int32x2_t v68 = (int32x2_t)vmul_f32(v67, v67);
    float32x2_t v69 = vsqrt_f32(vadd_f32((float32x2_t)vzip1_s32(v68, v66), (float32x2_t)vzip2_s32(v68, v66)));
    float32x2_t v70 = (float32x2_t)vbic_s8((int8x8_t)vdiv_f32(_D9, v69), (int8x8_t)vceqz_f32(v69));
    float v114 = v70.f32[0];
    float32x2_t v71 = vmul_lane_f32(v65, v70, 1);
    float32x2_t v72 = vmla_n_f32(v69, v70, v116);
    int32x2_t v73 = vclez_f32(v72);
    __int8 v109 = v73.i8[0];
    float v74 = v72.f32[1];
    float32_t v111 = v72.f32[0];
    if (v73.i8[4]) {
      float v74 = 0.0;
    }
    double v77 = unionPointWithRect(COERCE_DOUBLE(vadd_f32(v118, vmul_n_f32(v71, v74))), v52, v54, v56, v59);
    CGFloat v79 = v78;
    float32x2_t v80 = vmul_n_f32(v67, v114);
    float v81 = v111;
    if (v109) {
      float v81 = 0.0;
    }
    double v52 = unionPointWithRect(COERCE_DOUBLE(vadd_f32(v118, vmul_n_f32(v80, v81))), v77, v79, v75, v76);
    CGFloat v54 = v82;
    CGFloat v56 = v83;
    float32x2_t v57 = v118;
    CGFloat v59 = v84;
  }
  if (a3 < v57.f32[1] && v9 > v57.f32[1])
  {
    float32x2_t v85 = vsub_f32((float32x2_t)__PAIR64__(v57.u32[1], v106), v57);
    int32x2_t v86 = (int32x2_t)vmul_f32(v85, v85);
    float32x2_t v87 = v57;
    v57.i32[0] = v107;
    float32x2_t v88 = vsub_f32(v57, v87);
    int32x2_t v89 = (int32x2_t)vmul_f32(v88, v88);
    float32x2_t v90 = vsqrt_f32(vadd_f32((float32x2_t)vzip1_s32(v89, v86), (float32x2_t)vzip2_s32(v89, v86)));
    float32x2_t v91 = (float32x2_t)vbic_s8((int8x8_t)vdiv_f32(_D9, v90), (int8x8_t)vceqz_f32(v90));
    float v115 = v91.f32[0];
    float32x2_t v92 = vmul_lane_f32(v85, v91, 1);
    float32x2_t v93 = vmla_n_f32(v90, v91, v116);
    float32_t v117 = v93.f32[0];
    int32x2_t v94 = vclez_f32(v93);
    __int8 v112 = v94.i8[0];
    float v95 = v93.f32[1];
    if (v94.i8[4]) {
      float v95 = 0.0;
    }
    double v98 = unionPointWithRect(COERCE_DOUBLE(vadd_f32(v87, vmul_n_f32(v92, v95))), v52, v54, v56, v59);
    CGFloat v100 = v99;
    float32x2_t v101 = vmul_n_f32(v88, v115);
    float v102 = v117;
    if (v112) {
      float v102 = 0.0;
    }
    return unionPointWithRect(COERCE_DOUBLE(vadd_f32(v118, vmul_n_f32(v101, v102))), v98, v100, v96, v97);
  }
  return v52;
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

@end