@interface CILanczosScaleTransform
+ (id)customAttributes;
- (BOOL)_isIdentity;
- (CIImage)inputImage;
- (NSNumber)inputAspectRatio;
- (NSNumber)inputScale;
- (id)outputImage;
- (void)setInputAspectRatio:(id)a3;
- (void)setInputImage:(id)a3;
- (void)setInputScale:(id)a3;
@end

@implementation CILanczosScaleTransform

+ (id)customAttributes
{
  v9[5] = *MEMORY[0x1E4F143B8];
  v8[0] = @"CIAttributeFilterCategories";
  v7[0] = @"CICategoryGeometryAdjustment";
  v7[1] = @"CICategoryVideo";
  v7[2] = @"CICategoryStillImage";
  v7[3] = @"CICategoryBuiltIn";
  v9[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:4];
  v9[1] = @"6";
  v8[1] = @"CIAttributeFilterAvailable_iOS";
  v8[2] = @"CIAttributeFilterAvailable_Mac";
  v9[2] = @"10.4";
  v8[3] = @"inputScale";
  v5[0] = @"CIAttributeMin";
  v5[1] = @"CIAttributeSliderMin";
  v6[0] = &unk_1EE4A8FA0;
  v6[1] = &unk_1EE4A8FB0;
  v5[2] = @"CIAttributeSliderMax";
  v5[3] = @"CIAttributeDefault";
  v6[2] = &unk_1EE4A8FC0;
  v6[3] = &unk_1EE4A8FD0;
  v5[4] = @"CIAttributeIdentity";
  v5[5] = @"CIAttributeType";
  v6[4] = &unk_1EE4A8FD0;
  v6[5] = @"CIAttributeTypeScalar";
  v9[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:6];
  v8[4] = @"inputAspectRatio";
  v3[0] = @"CIAttributeMin";
  v3[1] = @"CIAttributeSliderMin";
  v4[0] = &unk_1EE4A8FA0;
  v4[1] = &unk_1EE4A8FE0;
  v3[2] = @"CIAttributeSliderMax";
  v3[3] = @"CIAttributeDefault";
  v4[2] = &unk_1EE4A8FF0;
  v4[3] = &unk_1EE4A8FD0;
  v3[4] = @"CIAttributeIdentity";
  v3[5] = @"CIAttributeType";
  v4[4] = &unk_1EE4A8FD0;
  v4[5] = @"CIAttributeTypeScalar";
  v9[4] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:6];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:5];
}

- (void)setInputScale:(id)a3
{
}

- (void)setInputAspectRatio:(id)a3
{
}

- (void)setInputImage:(id)a3
{
}

- (id)outputImage
{
  uint64_t v91 = *MEMORY[0x1E4F143B8];
  if (!self->inputImage) {
    return 0;
  }
  if ([(CILanczosScaleTransform *)self _isIdentity])
  {
    v3 = self->inputImage;
    return v3;
  }
  [(NSNumber *)self->inputScale doubleValue];
  double v6 = v5;
  [(NSNumber *)self->inputAspectRatio doubleValue];
  double v8 = v6 * v7;
  [(NSNumber *)self->inputScale doubleValue];
  double v10 = v9;
  inputImage = self->inputImage;
  if (v8 < 0.000000999999997 || v9 < 0.000000999999997)
  {
    CGAffineTransformMakeScale(&v83, v8, v9);
    return [(CIImage *)inputImage imageByApplyingTransform:&v83];
  }
  [(CIImage *)inputImage extent];
  double x = v93.origin.x;
  double y = v93.origin.y;
  double width = v93.size.width;
  double height = v93.size.height;
  if (CGRectIsInfinite(v93))
  {
    double y = -8.98846567e307;
    double width = 1.79769313e308;
    double height = 1.79769313e308;
  }
  else
  {
    v94.origin.double x = x;
    v94.origin.double y = y;
    v94.size.double width = width;
    v94.size.double height = height;
    if (!CGRectIsNull(v94)) {
      goto LABEL_15;
    }
    double width = 0.0;
    double y = INFINITY;
    double height = 0.0;
  }
  double x = y;
LABEL_15:
  if (fabs(x) == INFINITY || fabs(y) == INFINITY)
  {
    *(int64x2_t *)&v82.double var0 = vdupq_n_s64(0x7FF0000000000000uLL);
    v82.double var2 = 0.0;
    v82.double var3 = 0.0;
  }
  else if (x == -8.98846567e307 && y == -8.98846567e307 && width == 1.79769313e308 && height == 1.79769313e308)
  {
    *(int64x2_t *)&v82.double var0 = vdupq_n_s64(0xFFDFFFFFFFFFFFFFLL);
    *(int64x2_t *)&v82.double var2 = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
  }
  else
  {
    v82.double var0 = v8 * x;
    v82.double var1 = v10 * y;
    v82.double var2 = v8 * width;
    v82.double var3 = v10 * height;
  }
  Rectangle::integralize(&v82, 0.0001, (uint64_t)&v84);
  Rectangle v82 = v84;
  while (v8 < 0.50001 && v10 < 0.50001)
  {
    v16 = downBy2H(inputImage);
    inputImage = downBy2V(v16);
    double v8 = v8 + v8;
    double v10 = v10 + v10;
  }
  while (v8 < 0.50001)
  {
    inputImage = downBy2H(inputImage);
    double v8 = v8 + v8;
  }
  while (v10 < 0.50001)
  {
    inputImage = downBy2V(inputImage);
    double v10 = v10 + v10;
  }
  if (v8 < 0.99999)
  {
    v17 = +[CIVector vectorWithX:1.0 / v8 Y:1.0 Z:1.0 W:0.0];
    [(CIImage *)inputImage extent];
    double v18 = v95.origin.x;
    double v19 = v95.origin.y;
    double v20 = v95.size.width;
    double v21 = v95.size.height;
    if (CGRectIsInfinite(v95))
    {
      double v22 = 1.79769313e308;
      double v23 = -8.98846567e307;
      double v24 = 1.79769313e308;
      double v25 = -8.98846567e307;
    }
    else
    {
      v96.origin.double x = v18;
      v96.origin.double y = v19;
      v96.size.double width = v20;
      v96.size.double height = v21;
      BOOL IsNull = CGRectIsNull(v96);
      double v24 = 0.0;
      double v25 = INFINITY;
      if (IsNull) {
        double v23 = INFINITY;
      }
      else {
        double v23 = v19;
      }
      if (IsNull) {
        double v22 = 0.0;
      }
      else {
        double v22 = v20;
      }
      if (!IsNull)
      {
        double v24 = v21;
        double v25 = v18;
      }
    }
    if (fabs(v25) == INFINITY || fabs(v23) == INFINITY)
    {
      *(int64x2_t *)&v87.double var0 = vdupq_n_s64(0x7FF0000000000000uLL);
      v87.double var2 = 0.0;
      v87.double var3 = 0.0;
    }
    else if (v25 == -8.98846567e307 && v23 == -8.98846567e307 && v22 == 1.79769313e308 && v24 == 1.79769313e308)
    {
      *(int64x2_t *)&v87.double var0 = vdupq_n_s64(0xFFDFFFFFFFFFFFFFLL);
      *(int64x2_t *)&v87.double var2 = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
    }
    else
    {
      v87.double var0 = v8 * v25;
      v87.double var1 = v23;
      v87.double var2 = v8 * v22;
      v87.double var3 = v24;
    }
    Rectangle::inset(&v87, -3.0, -0.0, (uint64_t)&v90);
    *(void *)&double v27 = *(_OWORD *)&Rectangle::integralize(&v90, 0.0001, (uint64_t)&v84);
    double var0 = v84.var0;
    double var1 = v84.var1;
    double var2 = v84.var2;
    double var3 = v84.var3;
    v32 = +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_lanczosDownH, v27);
    if (var0 == -8.98846567e307 && var1 == -8.98846567e307 && var2 == 1.79769313e308 && var3 == 1.79769313e308)
    {
      double var0 = *MEMORY[0x1E4F1DB10];
      double var1 = *(double *)(MEMORY[0x1E4F1DB10] + 8);
      double var2 = *(double *)(MEMORY[0x1E4F1DB10] + 16);
      double var3 = *(double *)(MEMORY[0x1E4F1DB10] + 24);
    }
    *(void *)&v84.double var0 = MEMORY[0x1E4F143A8];
    *(void *)&v84.double var1 = 3221225472;
    *(void *)&v84.double var2 = ___ZL5downHP7CIImaged_block_invoke;
    *(void *)&v84.double var3 = &__block_descriptor_48_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
    uint64_t v85 = 0x4012C985F06F6944;
    double v86 = v8;
    *(void *)&v90.double var0 = inputImage;
    *(void *)&v90.double var1 = v17;
    inputImage = -[CIKernel applyWithExtent:roiCallback:arguments:](v32, "applyWithExtent:roiCallback:arguments:", &v84, [MEMORY[0x1E4F1C978] arrayWithObjects:&v90 count:2], var0, var1, var2, var3);
    double v8 = 1.0;
  }
  if (v10 < 0.99999)
  {
    v33 = +[CIVector vectorWithX:1.0 Y:1.0 / v10 Z:0.0 W:1.0];
    [(CIImage *)inputImage extent];
    double v34 = v97.origin.x;
    double v35 = v97.origin.y;
    double v36 = v97.size.width;
    double v37 = v97.size.height;
    if (CGRectIsInfinite(v97))
    {
      double v38 = 1.79769313e308;
      double v39 = -8.98846567e307;
      double v40 = 1.79769313e308;
      double v41 = -8.98846567e307;
    }
    else
    {
      v98.origin.double x = v34;
      v98.origin.double y = v35;
      v98.size.double width = v36;
      v98.size.double height = v37;
      BOOL v42 = CGRectIsNull(v98);
      double v40 = 0.0;
      double v41 = INFINITY;
      if (v42) {
        double v39 = INFINITY;
      }
      else {
        double v39 = v35;
      }
      if (v42) {
        double v38 = 0.0;
      }
      else {
        double v38 = v36;
      }
      if (!v42)
      {
        double v40 = v37;
        double v41 = v34;
      }
    }
    if (fabs(v41) == INFINITY || fabs(v39) == INFINITY)
    {
      *(int64x2_t *)&v87.double var0 = vdupq_n_s64(0x7FF0000000000000uLL);
      v87.double var2 = 0.0;
      v87.double var3 = 0.0;
    }
    else if (v41 == -8.98846567e307 && v39 == -8.98846567e307 && v38 == 1.79769313e308 && v40 == 1.79769313e308)
    {
      *(int64x2_t *)&v87.double var0 = vdupq_n_s64(0xFFDFFFFFFFFFFFFFLL);
      *(int64x2_t *)&v87.double var2 = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
    }
    else
    {
      v87.double var0 = v41;
      v87.double var1 = v10 * v39;
      v87.double var2 = v38;
      v87.double var3 = v10 * v40;
    }
    Rectangle::inset(&v87, -0.0, -3.0, (uint64_t)&v90);
    *(void *)&double v43 = *(_OWORD *)&Rectangle::integralize(&v90, 0.0001, (uint64_t)&v84);
    double v44 = v84.var0;
    double v45 = v84.var1;
    double v47 = v84.var2;
    double v46 = v84.var3;
    v48 = +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_lanczosDownV, v43);
    if (v44 == -8.98846567e307 && v45 == -8.98846567e307 && v47 == 1.79769313e308 && v46 == 1.79769313e308)
    {
      double v44 = *MEMORY[0x1E4F1DB10];
      double v45 = *(double *)(MEMORY[0x1E4F1DB10] + 8);
      double v47 = *(double *)(MEMORY[0x1E4F1DB10] + 16);
      double v46 = *(double *)(MEMORY[0x1E4F1DB10] + 24);
    }
    *(void *)&v84.double var0 = MEMORY[0x1E4F143A8];
    *(void *)&v84.double var1 = 3221225472;
    *(void *)&v84.double var2 = ___ZL5downVP7CIImaged_block_invoke;
    *(void *)&v84.double var3 = &__block_descriptor_48_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
    uint64_t v85 = 0x4012C985F06F6944;
    double v86 = v10;
    *(void *)&v90.double var0 = inputImage;
    *(void *)&v90.double var1 = v33;
    inputImage = -[CIKernel applyWithExtent:roiCallback:arguments:](v48, "applyWithExtent:roiCallback:arguments:", &v84, [MEMORY[0x1E4F1C978] arrayWithObjects:&v90 count:2], v44, v45, v47, v46);
    double v10 = 1.0;
  }
  if (v8 > 1.00001)
  {
    [(CIImage *)inputImage extent];
    CGFloat v49 = v99.origin.x;
    CGFloat v50 = v99.origin.y;
    CGFloat v51 = v99.size.width;
    CGFloat v52 = v99.size.height;
    if (CGRectIsInfinite(v99))
    {
      *(int64x2_t *)&v84.double var0 = vdupq_n_s64(0xFFDFFFFFFFFFFFFFLL);
      *(int64x2_t *)&v84.double var2 = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
    }
    else
    {
      v100.origin.double x = v49;
      v100.origin.double y = v50;
      v100.size.double width = v51;
      v100.size.double height = v52;
      if (CGRectIsNull(v100))
      {
        *(int64x2_t *)&v84.double var0 = vdupq_n_s64(0x7FF0000000000000uLL);
        v84.double var2 = 0.0;
        v84.double var3 = 0.0;
      }
      else
      {
        v84.double var0 = v49;
        v84.double var1 = v50;
        v84.double var2 = v51;
        v84.double var3 = v52;
      }
    }
    Rectangle::inset(&v84, -2.0, -0.0, (uint64_t)&v80);
    if (fabs(v80.f64[0]) == INFINITY || fabs(v80.f64[1]) == INFINITY)
    {
      *(int64x2_t *)&v87.double var0 = vdupq_n_s64(0x7FF0000000000000uLL);
      v87.double var2 = 0.0;
      v87.double var3 = 0.0;
    }
    else
    {
      float64x2_t v62 = (float64x2_t)vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
      float64x2_t v63 = (float64x2_t)vdupq_n_s64(0xFFDFFFFFFFFFFFFFLL);
      if (vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqq_f64(v80, v63), (int32x4_t)vceqq_f64(v81, v62))))))
      {
        v87.double var0 = v8 * v80.f64[0];
        v87.double var1 = v80.f64[1];
        v87.double var2 = v8 * v81.f64[0];
        v87.double var3 = v81.f64[1];
      }
      else
      {
        *(float64x2_t *)&v87.double var0 = v63;
        *(float64x2_t *)&v87.double var2 = v62;
      }
    }
    Rectangle::integralize(&v87, 0.0001, (uint64_t)&v90);
    Rectangle v84 = v90;
    v53 = +[CIKernel kernelWithInternalRepresentation:&CI::_lanczosUpH];
    double v55 = v84.var1;
    double v54 = v84.var0;
    double v56 = v84.var3;
    double v57 = v84.var2;
    if (v84.var0 == -8.98846567e307
      && v84.var1 == -8.98846567e307
      && v84.var2 == 1.79769313e308
      && v84.var3 == 1.79769313e308)
    {
      double v54 = *MEMORY[0x1E4F1DB10];
      double v55 = *(double *)(MEMORY[0x1E4F1DB10] + 8);
      double v57 = *(double *)(MEMORY[0x1E4F1DB10] + 16);
      double v56 = *(double *)(MEMORY[0x1E4F1DB10] + 24);
    }
    v79[0] = MEMORY[0x1E4F143A8];
    v79[1] = 3221225472;
    v79[2] = __38__CILanczosScaleTransform_outputImage__block_invoke;
    v79[3] = &__block_descriptor_40_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
    *(double *)&v79[4] = v8;
    v89[0] = inputImage;
    v89[1] = [NSNumber numberWithDouble:1.0 / v8];
    inputImage = -[CIKernel applyWithExtent:roiCallback:arguments:](v53, "applyWithExtent:roiCallback:arguments:", v79, [MEMORY[0x1E4F1C978] arrayWithObjects:v89 count:2], v54, v55, v57, v56);
  }
  if (v10 > 1.00001)
  {
    [(CIImage *)inputImage extent];
    CGFloat v58 = v101.origin.x;
    CGFloat v59 = v101.origin.y;
    CGFloat v60 = v101.size.width;
    CGFloat v61 = v101.size.height;
    if (CGRectIsInfinite(v101))
    {
      *(int64x2_t *)&v84.double var0 = vdupq_n_s64(0xFFDFFFFFFFFFFFFFLL);
      *(int64x2_t *)&v84.double var2 = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
    }
    else
    {
      v102.origin.double x = v58;
      v102.origin.double y = v59;
      v102.size.double width = v60;
      v102.size.double height = v61;
      if (CGRectIsNull(v102))
      {
        *(int64x2_t *)&v84.double var0 = vdupq_n_s64(0x7FF0000000000000uLL);
        v84.double var2 = 0.0;
        v84.double var3 = 0.0;
      }
      else
      {
        v84.double var0 = v58;
        v84.double var1 = v59;
        v84.double var2 = v60;
        v84.double var3 = v61;
      }
    }
    Rectangle::inset(&v84, -0.0, -2.0, (uint64_t)&v80);
    if (fabs(v80.f64[0]) == INFINITY || fabs(v80.f64[1]) == INFINITY)
    {
      *(int64x2_t *)&v87.double var0 = vdupq_n_s64(0x7FF0000000000000uLL);
      v87.double var2 = 0.0;
      v87.double var3 = 0.0;
    }
    else
    {
      float64x2_t v76 = (float64x2_t)vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
      float64x2_t v77 = (float64x2_t)vdupq_n_s64(0xFFDFFFFFFFFFFFFFLL);
      if (vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqq_f64(v80, v77), (int32x4_t)vceqq_f64(v81, v76))))))
      {
        v87.double var0 = v80.f64[0];
        v87.double var1 = v10 * v80.f64[1];
        v87.double var2 = v81.f64[0];
        v87.double var3 = vmuld_lane_f64(v10, v81, 1);
      }
      else
      {
        *(float64x2_t *)&v87.double var0 = v77;
        *(float64x2_t *)&v87.double var2 = v76;
      }
    }
    Rectangle::integralize(&v87, 0.0001, (uint64_t)&v90);
    Rectangle v84 = v90;
    v64 = +[CIKernel kernelWithInternalRepresentation:&CI::_lanczosUpV];
    double v66 = v84.var1;
    double v65 = v84.var0;
    double v67 = v84.var3;
    double v68 = v84.var2;
    if (v84.var0 == -8.98846567e307
      && v84.var1 == -8.98846567e307
      && v84.var2 == 1.79769313e308
      && v84.var3 == 1.79769313e308)
    {
      double v65 = *MEMORY[0x1E4F1DB10];
      double v66 = *(double *)(MEMORY[0x1E4F1DB10] + 8);
      double v68 = *(double *)(MEMORY[0x1E4F1DB10] + 16);
      double v67 = *(double *)(MEMORY[0x1E4F1DB10] + 24);
    }
    v88[0] = inputImage;
    v88[1] = objc_msgSend(NSNumber, "numberWithDouble:", 1.0 / v10, MEMORY[0x1E4F143A8], 3221225472, __38__CILanczosScaleTransform_outputImage__block_invoke_2, &__block_descriptor_40_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l, *(void *)&v10);
    inputImage = -[CIKernel applyWithExtent:roiCallback:arguments:](v64, "applyWithExtent:roiCallback:arguments:", &v78, [MEMORY[0x1E4F1C978] arrayWithObjects:v88 count:2], v65, v66, v68, v67);
  }
  double v69 = v82.var0;
  double v70 = v82.var1;
  double v71 = v82.var2;
  double v72 = v82.var3;
  if (v82.var0 == -8.98846567e307
    && v82.var1 == -8.98846567e307
    && v82.var2 == 1.79769313e308
    && v82.var3 == 1.79769313e308)
  {
    double v69 = *MEMORY[0x1E4F1DB10];
    double v70 = *(double *)(MEMORY[0x1E4F1DB10] + 8);
    double v71 = *(double *)(MEMORY[0x1E4F1DB10] + 16);
    double v72 = *(double *)(MEMORY[0x1E4F1DB10] + 24);
  }
  return -[CIImage imageByCroppingToRect:](inputImage, "imageByCroppingToRect:", v69, v70, v71, v72);
}

- (BOOL)_isIdentity
{
  [(NSNumber *)self->inputScale doubleValue];
  if (v3 != 1.0) {
    return 0;
  }
  [(NSNumber *)self->inputAspectRatio doubleValue];
  return v4 == 1.0;
}

double __38__CILanczosScaleTransform_outputImage__block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  float v8 = 1.0 / *(double *)(a1 + 32);
  *(float *)&double v9 = a2;
  float v10 = a3;
  unsigned int v44 = LODWORD(v9);
  float v45 = v10;
  *((float *)&v9 + 1) = v10;
  double v11 = upsampleHRect(v9, v8);
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  *(float *)&double v12 = a3 + a5;
  unsigned int v47 = LODWORD(v12);
  v53.origin.CGFloat x = upsampleHRect(COERCE_DOUBLE(__PAIR64__(LODWORD(v12), v44)), v8);
  v53.origin.CGFloat y = v18;
  v53.size.CGFloat width = v19;
  v53.size.CGFloat height = v20;
  v49.origin.CGFloat x = v11;
  v49.origin.CGFloat y = v13;
  v49.size.CGFloat width = v15;
  v49.size.CGFloat height = v17;
  CGRect v50 = CGRectUnion(v49, v53);
  CGFloat x = v50.origin.x;
  CGFloat y = v50.origin.y;
  CGFloat width = v50.size.width;
  CGFloat height = v50.size.height;
  *(float *)&v50.origin.CGFloat x = a2 + a4;
  LODWORD(a4) = LODWORD(v50.origin.x);
  *((float *)&v50.origin.x + 1) = v45;
  v54.origin.CGFloat x = upsampleHRect(v50.origin.x, v8);
  v54.origin.CGFloat y = v25;
  v54.size.CGFloat width = v26;
  v54.size.CGFloat height = v27;
  v51.origin.CGFloat x = x;
  v51.origin.CGFloat y = y;
  v51.size.CGFloat width = width;
  v51.size.CGFloat height = height;
  CGRect v52 = CGRectUnion(v51, v54);
  CGFloat v28 = v52.origin.x;
  CGFloat v29 = v52.origin.y;
  CGFloat v30 = v52.size.width;
  CGFloat v31 = v52.size.height;
  double v32 = upsampleHRect(COERCE_DOUBLE(__PAIR64__(v47, LODWORD(a4))), v8);
  uint64_t v34 = v33;
  uint64_t v36 = v35;
  uint64_t v38 = v37;
  CGFloat v39 = v28;
  CGFloat v40 = v29;
  CGFloat v41 = v30;
  CGFloat v42 = v31;

  *(void *)&double result = (unint64_t)CGRectUnion(*(CGRect *)&v39, *(CGRect *)&v32);
  return result;
}

double __38__CILanczosScaleTransform_outputImage__block_invoke_2(uint64_t a1, double a2, double a3, double a4, double a5)
{
  float v8 = 1.0 / *(double *)(a1 + 32);
  v9.f32[0] = a2;
  float32_t v10 = a3;
  __int32 v44 = v9.i32[0];
  float32_t v45 = v10;
  v9.f32[1] = v10;
  double v11 = upsampleVRect(v9, v8);
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  *(float *)&double v12 = a3 + a5;
  unsigned int v47 = LODWORD(v12);
  v53.origin.CGFloat x = upsampleVRect((float32x2_t)__PAIR64__(LODWORD(v12), v44), v8);
  v53.origin.CGFloat y = v18;
  v53.size.CGFloat width = v19;
  v53.size.CGFloat height = v20;
  v49.origin.CGFloat x = v11;
  v49.origin.CGFloat y = v13;
  v49.size.CGFloat width = v15;
  v49.size.CGFloat height = v17;
  CGRect v50 = CGRectUnion(v49, v53);
  CGFloat x = v50.origin.x;
  CGFloat y = v50.origin.y;
  CGFloat width = v50.size.width;
  CGFloat height = v50.size.height;
  *(float *)&v50.origin.CGFloat x = a2 + a4;
  LODWORD(a4) = LODWORD(v50.origin.x);
  *((float32_t *)&v50.origin.x + 1) = v45;
  v54.origin.CGFloat x = upsampleVRect(*(float32x2_t *)&v50.origin.x, v8);
  v54.origin.CGFloat y = v25;
  v54.size.CGFloat width = v26;
  v54.size.CGFloat height = v27;
  v51.origin.CGFloat x = x;
  v51.origin.CGFloat y = y;
  v51.size.CGFloat width = width;
  v51.size.CGFloat height = height;
  CGRect v52 = CGRectUnion(v51, v54);
  CGFloat v28 = v52.origin.x;
  CGFloat v29 = v52.origin.y;
  CGFloat v30 = v52.size.width;
  CGFloat v31 = v52.size.height;
  double v32 = upsampleVRect((float32x2_t)__PAIR64__(v47, LODWORD(a4)), v8);
  uint64_t v34 = v33;
  uint64_t v36 = v35;
  uint64_t v38 = v37;
  CGFloat v39 = v28;
  CGFloat v40 = v29;
  CGFloat v41 = v30;
  CGFloat v42 = v31;

  *(void *)&double result = (unint64_t)CGRectUnion(*(CGRect *)&v39, *(CGRect *)&v32);
  return result;
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (NSNumber)inputScale
{
  return self->inputScale;
}

- (NSNumber)inputAspectRatio
{
  return self->inputAspectRatio;
}

@end