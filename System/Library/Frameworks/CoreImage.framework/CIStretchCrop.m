@interface CIStretchCrop
+ (id)customAttributes;
- (CIImage)inputImage;
- (id)_kernel;
- (id)outputImage;
- (void)setInputImage:(id)a3;
@end

@implementation CIStretchCrop

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_stretchcrop];
}

- (id)outputImage
{
  v113[3] = *MEMORY[0x1E4F143B8];
  [(NSNumber *)self->inputCropAmount doubleValue];
  double v4 = v3;
  [(NSNumber *)self->inputCenterStretchAmount doubleValue];
  double v6 = v5;
  [(CIVector *)self->inputSize X];
  double v8 = v7;
  [(CIVector *)self->inputSize Y];
  inputImage = self->inputImage;
  if (!inputImage) {
    return 0;
  }
  double v11 = v9;
  [(CIImage *)inputImage extent];
  if (CGRectIsInfinite(v114)) {
    return 0;
  }
  v12 = self->inputImage;
  [(CIImage *)self->inputImage extent];
  double v16 = v15;
  double v18 = v17;
  if (fabs(v13) >= 1.0e-10 || fabs(v14) >= 1.0e-10)
  {
    CGAffineTransformMakeTranslation(&v110, -v13, -v14);
    v12 = [(CIImage *)v12 imageByApplyingTransform:&v110];
  }
  double v19 = fmax(v11, 0.0);
  double v101 = fmax(v8, 0.0);
  if (vabdd_f64(v16, v101) >= 1.0e-10 || vabdd_f64(v18, v19) >= 1.0e-10)
  {
    double v20 = fmin(fmax(v4, 0.0), 1.0);
    double v100 = v19;
    if (v20 <= 0.0)
    {
      double v21 = v101 / v19;
    }
    else
    {
      double v21 = v101 / v19;
      BOOL v22 = v16 / v18 <= v101 / v19;
      double v23 = v20 * (v19 * v16 / v101) + v18 * (1.0 - v20);
      double v24 = (v18 - v23) * 0.5;
      double v25 = v20 * (v101 * v18 / v19) + v16 * (1.0 - v20);
      double v26 = (v16 - v25) * 0.5;
      if (v16 / v18 <= v21) {
        double v18 = v23;
      }
      if (v22)
      {
        double v27 = v24;
      }
      else
      {
        double v16 = v25;
        double v27 = 0.0;
      }
      if (v22) {
        double v28 = 0.0;
      }
      else {
        double v28 = v26;
      }
      CGAffineTransformMakeTranslation(&v109, -v28, -v27);
      v12 = [(CIImage *)v12 imageByApplyingTransform:&v109];
    }
    if (v16 / v18 <= v21) {
      double v29 = v100 / v18;
    }
    else {
      double v29 = v101 / v16;
    }
    CGAffineTransformMakeScale(&v108, v29, v29);
    v30 = [(CIImage *)v12 imageByApplyingTransform:&v108];
    v31 = v30;
    double v32 = v16 * v29;
    double v33 = v18 * v29;
    if (vabdd_f64(v32, v101) < 1.0e-10 && vabdd_f64(v33, v100) < 1.0e-10) {
      return (id)objc_msgSend(v31, "imageByCroppingToRect:", 0.0, 0.0, v101, v100);
    }
    double v34 = fmin(fmax(v6, 0.0), 1.0);
    double v35 = v32 / v33;
    if (v34 == 1.0)
    {
      BOOL v22 = v35 <= v21;
      double v36 = v21 / v35;
      double v37 = v35 / v21;
      if (v22) {
        double v37 = 1.0;
      }
      else {
        double v36 = 1.0;
      }
      CGAffineTransformMakeScale(&v107, v36, v37);
      uint64_t v38 = [v31 imageByApplyingTransform:&v107];
      goto LABEL_63;
    }
    BOOL v39 = v35 <= v21;
    double v40 = 1.0 - v34 + v34 * (v21 / v35);
    double v41 = (v21 / v35 - v40 + v21 / v35 - v40) / (v21 / v35);
    float v42 = v40;
    float v43 = v41;
    double v44 = v35 / v21;
    double v45 = 1.0 - v34 + v34 * v44;
    double v46 = v44 - v45 + v44 - v45;
    float v47 = v45;
    float v48 = v46 / v44;
    if (v39) {
      float v49 = v42;
    }
    else {
      float v49 = 1.0;
    }
    if (v39) {
      float v47 = 1.0;
    }
    float v98 = v49;
    float v99 = v47;
    if (v39) {
      float v50 = v43;
    }
    else {
      float v50 = 0.0;
    }
    float v97 = v50;
    if (v39) {
      float v51 = 0.0;
    }
    else {
      float v51 = v48;
    }
    float v96 = v51;
    [(CIImage *)v30 extent];
    double x = v115.origin.x;
    double y = v115.origin.y;
    double width = v115.size.width;
    double height = v115.size.height;
    BOOL IsInfinite = CGRectIsInfinite(v115);
    v116.origin.double x = x;
    v116.origin.double y = y;
    v116.size.double width = width;
    v116.size.double height = height;
    BOOL v57 = CGRectIsInfinite(v116);
    v58.f32[0] = v32;
    float v59 = v33;
    float v89 = v58.f32[0];
    float v90 = v59;
    v58.f32[1] = v59;
    float32x2_t v95 = v58;
    v60.f32[0] = v101 * 0.5;
    float v61 = v100 * 0.5;
    float v91 = v61;
    float v92 = v60.f32[0];
    v60.f32[1] = v61;
    v62.i64[0] = __PAIR64__(LODWORD(v99), LODWORD(v98));
    v62.i64[1] = __PAIR64__(LODWORD(v96), LODWORD(v97));
    int8x16_t v93 = v62;
    float32x2_t v94 = v60;
    if (IsInfinite)
    {
      if (v57)
      {
        *(int64x2_t *)&v106.var0 = vdupq_n_s64(0xFFDFFFFFFFFFFFFFLL);
        *(int64x2_t *)&v106.var2 = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
        double y = -8.98846567e307;
        double height = 1.79769313e308;
        double width = 1.79769313e308;
LABEL_57:
        double x = -8.98846567e307;
        if (y == -8.98846567e307 && width == 1.79769313e308 && height == 1.79769313e308)
        {
          p_var3 = (double *)(MEMORY[0x1E4F1DB10] + 24);
          p_var1 = (double *)(MEMORY[0x1E4F1DB10] + 8);
          p_var2 = (double *)(MEMORY[0x1E4F1DB10] + 16);
          double x = *MEMORY[0x1E4F1DB10];
LABEL_62:
          double v83 = *p_var3;
          double v84 = *p_var1;
          double v85 = *p_var2;
          id v86 = [(CIStretchCrop *)self _kernel];
          v102[0] = MEMORY[0x1E4F143A8];
          v102[1] = 3221225472;
          v102[2] = __28__CIStretchCrop_outputImage__block_invoke;
          v102[3] = &__block_descriptor_64_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
          float32x2_t v104 = v95;
          float32x2_t v105 = v94;
          int8x16_t v103 = v93;
          v113[0] = +[CIVector vectorWithX:v89 Y:v90];
          v113[1] = +[CIVector vectorWithX:v92 Y:v91];
          v113[2] = +[CIVector vectorWithX:v98 Y:v99 Z:v97 W:v96];
          uint64_t v38 = objc_msgSend(v86, "applyWithExtent:roiCallback:inputImage:arguments:", v102, v31, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v113, 3), x, v84, v85, v83);
LABEL_63:
          v31 = (void *)v38;
          return (id)objc_msgSend(v31, "imageByCroppingToRect:", 0.0, 0.0, v101, v100);
        }
LABEL_61:
        p_var1 = &v106.var1;
        p_var2 = &v106.var2;
        p_var3 = &v106.var3;
        goto LABEL_62;
      }
      v117.origin.double x = x;
      v117.origin.double y = y;
      v117.size.double width = width;
      v117.size.double height = height;
      if (CGRectIsNull(v117))
      {
        *(int64x2_t *)&v106.var0 = vdupq_n_s64(0x7FF0000000000000uLL);
        v106.var2 = 0.0;
        v106.var3 = 0.0;
        double x = INFINITY;
        goto LABEL_61;
      }
      v106.var0 = x;
      v106.var1 = y;
      v106.var2 = width;
      v106.var3 = height;
    }
    else
    {
      if (v57)
      {
        double y = -8.98846567e307;
        double v63 = 1.79769313e308;
        double v64 = 1.79769313e308;
        double x = -8.98846567e307;
      }
      else
      {
        v118.origin.double x = x;
        v118.origin.double y = y;
        v118.size.double width = width;
        v118.size.double height = height;
        BOOL IsNull = CGRectIsNull(v118);
        double v64 = 0.0;
        if (IsNull) {
          double v63 = 0.0;
        }
        else {
          double v63 = width;
        }
        if (IsNull)
        {
          double y = INFINITY;
          double x = INFINITY;
        }
        else
        {
          double v64 = height;
        }
      }
      *(int64x2_t *)&v106.var0 = vdupq_n_s64(0x7FF0000000000000uLL);
      double v66 = v63 + x;
      v67.f32[0] = fmin(x, v63 + x);
      double v68 = v64 + y;
      float32_t v69 = fmin(y, v64 + y);
      v67.f32[1] = v69;
      v106.var2 = 0.0;
      v106.var3 = 0.0;
      float32x2_t v70 = vadd_f32(vdiv_f32(v67, v95), (float32x2_t)0xBF000000BF000000);
      int8x16_t v88 = vextq_s8(v93, v93, 8uLL);
      float32x2_t v71 = (float32x2_t)vdup_n_s32(0x3F7FF972u);
      __asm { FMOV            V15.2S, #1.0 }
      float32x2_t v111 = vadd_f32(v94, vmul_f32(v95, vdiv_f32(vmul_f32((float32x2_t)__PAIR64__(LODWORD(v99), LODWORD(v98)), v70), vsub_f32(_D15, vminnm_f32(vmul_f32(*(float32x2_t *)v88.i8, vabs_f32(v70)), v71)))));
      Rectangle::Union(&v106, (const vec2 *)&v111, (uint64_t)&v112);
      Rectangle v106 = v112;
      v77.f32[0] = fmax(x, v66);
      float32_t v78 = fmax(y, v68);
      v77.f32[1] = v78;
      float32x2_t v79 = vadd_f32(vdiv_f32(v77, v95), (float32x2_t)0xBF000000BF000000);
      float32x2_t v111 = vadd_f32(v94, vmul_f32(v95, vdiv_f32(vmul_f32((float32x2_t)__PAIR64__(LODWORD(v99), LODWORD(v98)), v79), vsub_f32(_D15, vminnm_f32(vmul_f32(*(float32x2_t *)v88.i8, vabs_f32(v79)), v71)))));
      Rectangle::Union(&v106, (const vec2 *)&v111, (uint64_t)&v112);
      double y = v112.var1;
      double x = v112.var0;
      Rectangle v106 = v112;
      double height = v112.var3;
      double width = v112.var2;
    }
    if (x != -8.98846567e307) {
      goto LABEL_61;
    }
    goto LABEL_57;
  }
  return v12;
}

void __28__CIStretchCrop_outputImage__block_invoke(uint64_t a1, double a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  double v8 = a2;
  float32x2_t v9 = *(float32x2_t *)(a1 + 48);
  float32x2_t v10 = *(float32x2_t *)(a1 + 56);
  int8x16_t v24 = *(int8x16_t *)(a1 + 32);
  if (CGRectIsInfinite(*(CGRect *)&a2))
  {
    double v11 = -8.98846567e307;
    double v12 = 1.79769313e308;
    double v13 = 1.79769313e308;
    double v8 = -8.98846567e307;
  }
  else
  {
    v28.origin.double x = v8;
    v28.origin.double y = a3;
    v28.size.double width = a4;
    v28.size.double height = a5;
    BOOL IsNull = CGRectIsNull(v28);
    double v13 = 0.0;
    if (IsNull) {
      double v12 = 0.0;
    }
    else {
      double v12 = a4;
    }
    if (IsNull)
    {
      double v11 = INFINITY;
    }
    else
    {
      double v13 = a5;
      double v11 = a3;
    }
    if (IsNull) {
      double v8 = INFINITY;
    }
  }
  *(int64x2_t *)&v27.var0 = vdupq_n_s64(0x7FF0000000000000uLL);
  double v15 = v12 + v8;
  v16.f32[0] = fmin(v8, v12 + v8);
  double v17 = v13 + v11;
  float32_t v18 = fmin(v11, v13 + v11);
  v16.f32[1] = v18;
  v27.var2 = 0.0;
  v27.var3 = 0.0;
  float32x2_t v23 = (float32x2_t)vextq_s8(v24, v24, 8uLL).u64[0];
  float32x2_t v19 = vdiv_f32(vsub_f32(v16, v10), v9);
  float32x2_t v25 = vmul_f32(v9, vadd_f32(vdiv_f32(v19, vadd_f32(*(float32x2_t *)v24.i8, vmul_f32(v23, vabs_f32(v19)))), (float32x2_t)0x3F0000003F000000));
  Rectangle::Union(&v27, (const vec2 *)&v25, (uint64_t)&v26);
  Rectangle v27 = v26;
  v20.f32[0] = fmax(v8, v15);
  float32_t v21 = fmax(v11, v17);
  v20.f32[1] = v21;
  float32x2_t v22 = vdiv_f32(vsub_f32(v20, v10), v9);
  float32x2_t v25 = vmul_f32(v9, vadd_f32(vdiv_f32(v22, vadd_f32(*(float32x2_t *)v24.i8, vmul_f32(v23, vabs_f32(v22)))), (float32x2_t)0x3F0000003F000000));
  Rectangle::Union(&v27, (const vec2 *)&v25, (uint64_t)&v26);
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
  v11[2] = @"10.6";
  v10[3] = @"inputSize";
  v7[0] = @"CIAttributeType";
  v7[1] = @"CIAttributeDefault";
  v8[0] = @"CIAttributeTypePosition";
  v8[1] = +[CIVector vectorWithX:1280.0 Y:720.0];
  v11[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];
  v10[4] = @"inputCropAmount";
  v5[0] = @"CIAttributeType";
  v5[1] = @"CIAttributeMin";
  v6[0] = @"CIAttributeTypeScalar";
  v6[1] = &unk_1EE4A9E30;
  v5[2] = @"CIAttributeMax";
  v5[3] = @"CIAttributeSliderMin";
  v6[2] = &unk_1EE4A9E40;
  v6[3] = &unk_1EE4A9E30;
  v5[4] = @"CIAttributeSliderMax";
  v5[5] = @"CIAttributeDefault";
  v6[4] = &unk_1EE4A9E40;
  v6[5] = &unk_1EE4A9E50;
  v11[4] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:6];
  v10[5] = @"inputCenterStretchAmount";
  v3[0] = @"CIAttributeType";
  v3[1] = @"CIAttributeMin";
  v4[0] = @"CIAttributeTypeScalar";
  v4[1] = &unk_1EE4A9E30;
  v3[2] = @"CIAttributeMax";
  v3[3] = @"CIAttributeSliderMin";
  v4[2] = &unk_1EE4A9E40;
  v4[3] = &unk_1EE4A9E30;
  v3[4] = @"CIAttributeSliderMax";
  v3[5] = @"CIAttributeDefault";
  v4[4] = &unk_1EE4A9E40;
  v4[5] = &unk_1EE4A9E50;
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