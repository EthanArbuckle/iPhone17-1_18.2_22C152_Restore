@interface CIBicubicScaleTransform
+ (id)customAttributes;
- (BOOL)_isIdentity;
- (CIImage)inputImage;
- (NSNumber)inputAspectRatio;
- (NSNumber)inputB;
- (NSNumber)inputC;
- (NSNumber)inputScale;
- (float32x2_t)_scale;
- (id)outputImage;
- (void)setInputAspectRatio:(id)a3;
- (void)setInputB:(id)a3;
- (void)setInputC:(id)a3;
- (void)setInputImage:(id)a3;
- (void)setInputScale:(id)a3;
@end

@implementation CIBicubicScaleTransform

+ (id)customAttributes
{
  v13[7] = *MEMORY[0x1E4F143B8];
  v12[0] = @"CIAttributeFilterCategories";
  v11[0] = @"CICategoryGeometryAdjustment";
  v11[1] = @"CICategoryVideo";
  v11[2] = @"CICategoryStillImage";
  v11[3] = @"CICategoryNonSquarePixels";
  v11[4] = @"CICategoryBuiltIn";
  v13[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:5];
  v13[1] = @"11";
  v12[1] = @"CIAttributeFilterAvailable_iOS";
  v12[2] = @"CIAttributeFilterAvailable_Mac";
  v13[2] = @"10.13";
  v12[3] = @"inputScale";
  v9[0] = @"CIAttributeMin";
  v9[1] = @"CIAttributeSliderMin";
  v10[0] = &unk_1EE4A9C60;
  v10[1] = &unk_1EE4A9C70;
  v9[2] = @"CIAttributeSliderMax";
  v9[3] = @"CIAttributeDefault";
  v10[2] = &unk_1EE4A9C80;
  v10[3] = &unk_1EE4A9C90;
  v9[4] = @"CIAttributeIdentity";
  v9[5] = @"CIAttributeType";
  v10[4] = &unk_1EE4A9C90;
  v10[5] = @"CIAttributeTypeScalar";
  v9[6] = @"CIAttributeClass";
  v10[6] = @"NSNumber";
  v13[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:7];
  v12[4] = @"inputAspectRatio";
  v8[0] = &unk_1EE4A9C60;
  v8[1] = &unk_1EE4A9CA0;
  v7[0] = @"CIAttributeMin";
  v7[1] = @"CIAttributeSliderMin";
  v7[2] = @"CIAttributeSliderMax";
  v7[3] = @"CIAttributeDefault";
  v8[2] = &unk_1EE4A9CB0;
  v8[3] = &unk_1EE4A9C90;
  v7[4] = @"CIAttributeIdentity";
  v7[5] = @"CIAttributeType";
  v8[4] = &unk_1EE4A9C90;
  v8[5] = @"CIAttributeTypeScalar";
  v7[6] = @"CIAttributeClass";
  v8[6] = @"NSNumber";
  v13[4] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:7];
  v12[5] = @"inputB";
  v5[0] = @"CIAttributeMin";
  v5[1] = @"CIAttributeSliderMin";
  v6[0] = &unk_1EE4A9C60;
  v6[1] = &unk_1EE4A9C60;
  v5[2] = @"CIAttributeSliderMax";
  v5[3] = @"CIAttributeMax";
  v6[2] = &unk_1EE4A9C90;
  v6[3] = &unk_1EE4A9C90;
  v5[4] = @"CIAttributeDefault";
  v5[5] = @"CIAttributeType";
  v6[4] = &unk_1EE4A9C60;
  v6[5] = @"CIAttributeTypeScalar";
  v5[6] = @"CIAttributeClass";
  v6[6] = @"NSNumber";
  v13[5] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:7];
  v12[6] = @"inputC";
  v3[0] = @"CIAttributeMin";
  v3[1] = @"CIAttributeSliderMin";
  v4[0] = &unk_1EE4A9C60;
  v4[1] = &unk_1EE4A9C60;
  v3[2] = @"CIAttributeSliderMax";
  v3[3] = @"CIAttributeMax";
  v4[2] = &unk_1EE4A9C90;
  v4[3] = &unk_1EE4A9C90;
  v3[4] = @"CIAttributeDefault";
  v3[5] = @"CIAttributeType";
  v4[4] = &unk_1EE4A9CC0;
  v4[5] = @"CIAttributeTypeScalar";
  v3[6] = @"CIAttributeClass";
  v4[6] = @"NSNumber";
  v13[6] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:7];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:7];
}

- (float32x2_t)_scale
{
  [*(id *)(a1 + 88) doubleValue];
  double v6 = fmax(v2, 0.0);
  [*(id *)(a1 + 96) doubleValue];
  v4.f64[0] = v6 * fmax(v3, 0.0);
  v4.f64[1] = v6;
  return vcvt_f32_f64(v4);
}

- (BOOL)_isIdentity
{
  [(CIBicubicScaleTransform *)self _scale];
  uint64_t v19 = v3;
  [(NSNumber *)self->inputB floatValue];
  __int32 v18 = v4;
  [(NSNumber *)self->inputC floatValue];
  if (fabsf(*(float *)&v19 + -1.0) >= 0.00001) {
    return 0;
  }
  v6.i32[0] = v18;
  if (fabsf(*((float *)&v19 + 1) + -1.0) >= 0.00001) {
    return 0;
  }
  v6.i32[1] = v5;
  __asm { FMOV            V2.2S, #1.0 }
  float32x2_t v12 = vminnm_f32(vmaxnm_f32(v6, 0), _D2);
  _D2.i32[0] = v12.i32[1];
  double v13 = v12.f32[0];
  *(float32x2_t *)v14.f32 = vcvt_f32_f64(vmlaq_n_f64(vmlaq_n_f64((float64x2_t)xmmword_1939568A0, (float64x2_t)xmmword_193956890, v13), (float64x2_t)xmmword_1939568B0, _D2.f32[0]));
  v14.i32[2] = 0;
  *(float *)&double v13 = v13 * -2.0 + 6.0;
  v14.i32[3] = LODWORD(v13);
  __asm { FMOV            V0.4S, #6.0 }
  int8x16_t v16 = (int8x16_t)vdivq_f32(v14, _Q0);
  return fabsf(vaddv_f32(vadd_f32(*(float32x2_t *)v16.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v16, v16, 8uLL)))) < 0.00001;
}

- (id)outputImage
{
  v195[2] = *MEMORY[0x1E4F143B8];
  if (!self->inputImage) {
    return 0;
  }
  if ([(CIBicubicScaleTransform *)self _isIdentity])
  {
    uint64_t v3 = self->inputImage;
    return v3;
  }
  [(NSNumber *)self->inputB floatValue];
  unsigned int v172 = v6;
  [(NSNumber *)self->inputC floatValue];
  unsigned int v168 = v7;
  [(CIBicubicScaleTransform *)self _scale];
  long long v9 = v8;
  LODWORD(v10) = v8;
  if (fabsf(*(float *)&v8) >= 0.00001)
  {
    __asm { FMOV            V1.2S, #1.0 }
    float32x2_t v155 = _D1;
    float32x2_t v15 = vminnm_f32(vmaxnm_f32((float32x2_t)__PAIR64__(v168, v172), 0), _D1);
    float v157 = v15.f32[1];
    *(float32x2_t *)v16.f32 = vcvt_f32_f64(vmlaq_n_f64(vmlaq_n_f64((float64x2_t)xmmword_1939568A0, (float64x2_t)xmmword_193956890, v15.f32[0]), (float64x2_t)xmmword_1939568B0, v15.f32[1]));
    float32_t v17 = v15.f32[0] * -2.0 + 6.0;
    v16.i32[2] = 0;
    v16.f32[3] = v17;
    __asm { FMOV            V4.4S, #6.0 }
    float32x4_t v19 = vdivq_f32(v16, _Q4);
    double v156 = *(double *)&v15;
    v16.f32[0] = (float)-v15.f32[0] + v15.f32[1] * -6.0;
    float32_t v20 = v15.f32[1] * 30.0 + v15.f32[0] * 6.0;
    v16.f32[1] = v20;
    inputImage = self->inputImage;
    float32x4_t v21 = vdivq_f32(vcvt_hight_f32_f64(*(int32x2_t *)v16.f32, vmlaq_n_f64(vmulq_n_f64((float64x2_t)xmmword_1939568C0, v15.f32[1]), (float64x2_t)xmmword_1939568D0, v15.f32[0])), _Q4);
    int8x16_t v22 = (int8x16_t)vmulq_f32(v19, (float32x4_t)xmmword_1939568E0);
    *(float32x2_t *)v22.i8 = vadd_f32(*(float32x2_t *)v22.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v22, v22, 8uLL));
    float32x4_t v163 = v19;
    int8x16_t v23 = (int8x16_t)vmulq_f32(v19, (float32x4_t)xmmword_1939568F0);
    *(float32x2_t *)v23.i8 = vadd_f32(*(float32x2_t *)v23.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v23, v23, 8uLL));
    float64x2_t v24 = vcvtq_f64_f32(vadd_f32((float32x2_t)vzip1_s32(*(int32x2_t *)v22.i8, *(int32x2_t *)v23.i8), (float32x2_t)vzip2_s32(*(int32x2_t *)v22.i8, *(int32x2_t *)v23.i8)));
    __asm { FMOV            V1.2D, #0.5 }
    float64x2_t v26 = vmulq_f64(v24, _Q1);
    int8x16_t v27 = (int8x16_t)vmulq_f32(v21, (float32x4_t)xmmword_193956900);
    *(float32x2_t *)v27.i8 = vadd_f32(*(float32x2_t *)v27.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v27, v27, 8uLL));
    float32x4_t v162 = v21;
    int8x16_t v28 = (int8x16_t)vmulq_f32(v21, (float32x4_t)xmmword_193956910);
    *(float32x2_t *)v28.i8 = vadd_f32(*(float32x2_t *)v28.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v28, v28, 8uLL));
    float64x2_t v29 = vmulq_f64(vcvtq_f64_f32(vadd_f32((float32x2_t)vzip1_s32(*(int32x2_t *)v27.i8, *(int32x2_t *)v28.i8), (float32x2_t)vzip2_s32(*(int32x2_t *)v27.i8, *(int32x2_t *)v28.i8))), _Q1);
    double v30 = v29.f64[1];
    double v31 = 0.0;
    if (vmuld_lane_f64(v29.f64[0], v29, 1) >= 0.0)
    {
      double v31 = v29.f64[1];
      double v30 = -0.0;
    }
    v26.f64[0] = vaddvq_f64(v26);
    double v32 = v31 + v29.f64[0] + v30;
    float v33 = v26.f64[0];
    float v34 = v32;
    if (v26.f64[0] == 0.0) {
      double v35 = 0.5;
    }
    else {
      double v35 = v26.f64[1] / v26.f64[0] + 0.5;
    }
    float v36 = v35;
    double v37 = v31 / v32 + 2.5;
    if (v32 == 0.0) {
      double v37 = 2.5;
    }
    float v38 = v37;
    float v160 = v34;
    float v161 = v33;
    float v158 = v38;
    float v159 = v36;
    if (*(float *)&v10 > 0.5 || *((float *)&v9 + 1) > 0.5)
    {
      long long v169 = v10;
    }
    else
    {
      double v173 = v33;
      double v165 = v34;
      double v39 = v36;
      int64x2_t v164 = vdupq_n_s64(0x7FF0000000000000uLL);
      double v40 = v38;
      v41 = (double *)MEMORY[0x1E4F1DB10];
      long long v169 = v9;
      do
      {
        [(CIImage *)inputImage extent];
        double x = v197.origin.x;
        double y = v197.origin.y;
        double width = v197.size.width;
        double height = v197.size.height;
        if (CGRectIsInfinite(v197))
        {
          double v46 = 1.79769313e308;
          double v47 = -8.98846567e307;
          double v48 = 1.79769313e308;
          double v49 = -8.98846567e307;
        }
        else
        {
          v198.origin.double x = x;
          v198.origin.double y = y;
          v198.size.double width = width;
          v198.size.double height = height;
          BOOL IsNull = CGRectIsNull(v198);
          double v49 = INFINITY;
          if (IsNull) {
            double v47 = INFINITY;
          }
          else {
            double v47 = x;
          }
          double v48 = 0.0;
          if (IsNull) {
            double v46 = 0.0;
          }
          else {
            double v46 = height;
          }
          if (!IsNull)
          {
            double v48 = width;
            double v49 = y;
          }
        }
        double v51 = fabs(v49);
        if (fabs(v47) == INFINITY || v51 == INFINITY)
        {
          *(int64x2_t *)&v185.double var0 = v164;
          v185.double var2 = 0.0;
          v185.double var3 = 0.0;
        }
        else if (v47 == -8.98846567e307 && v49 == -8.98846567e307 && v48 == 1.79769313e308 && v46 == 1.79769313e308)
        {
          *(int64x2_t *)&v185.double var0 = vdupq_n_s64(0xFFDFFFFFFFFFFFFFLL);
          *(int64x2_t *)&v185.double var2 = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
        }
        else
        {
          v185.double var0 = v47 * 0.5;
          v185.double var1 = v49 * 0.5;
          v185.double var2 = v48 * 0.5;
          v185.double var3 = v46 * 0.5;
        }
        Rectangle::inset(&v185, -2.0, -2.0, (uint64_t)&v186);
        *(void *)&double v53 = *(_OWORD *)&Rectangle::integralize(&v186, 0.0001, (uint64_t)&v187);
        double var0 = v187.var0;
        double var1 = v187.var1;
        double var2 = v187.var2;
        double var3 = v187.var3;
        v58 = +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_cubicDownsample2, v53);
        if (var0 == -8.98846567e307 && var1 == -8.98846567e307 && var2 == 1.79769313e308 && var3 == 1.79769313e308)
        {
          double var0 = *v41;
          double var1 = v41[1];
          double var2 = v41[2];
          double var3 = v41[3];
        }
        v195[0] = inputImage;
        v195[1] = +[CIVector vectorWithX:v173 Y:v165 Z:v39 W:v40];
        inputImage = -[CIKernel applyWithExtent:roiCallback:arguments:](v58, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_64, [MEMORY[0x1E4F1C978] arrayWithObjects:v195 count:2], var0, var1, var2, var3);
        long long v9 = v169;
        *(float32x2_t *)&long long v9 = vadd_f32(*(float32x2_t *)&v9, *(float32x2_t *)&v9);
        long long v169 = v9;
      }
      while (*(float *)&v9 <= 0.5 && *((float *)&v9 + 1) <= 0.5);
    }
    long long v174 = v9;
    if (*(float *)&v169 <= 0.5)
    {
      int64x2_t v166 = vdupq_n_s64(0x7FF0000000000000uLL);
      v65 = (double *)MEMORY[0x1E4F1DB10];
      do
      {
        [(CIImage *)inputImage extent];
        double v66 = v200.origin.x;
        double v67 = v200.origin.y;
        double v68 = v200.size.width;
        double v69 = v200.size.height;
        if (CGRectIsInfinite(v200))
        {
          double v70 = 1.79769313e308;
          double v71 = -8.98846567e307;
          double v72 = 1.79769313e308;
          double v73 = -8.98846567e307;
        }
        else
        {
          v201.origin.double x = v66;
          v201.origin.double y = v67;
          v201.size.double width = v68;
          v201.size.double height = v69;
          BOOL v74 = CGRectIsNull(v201);
          double v73 = INFINITY;
          if (v74) {
            double v71 = INFINITY;
          }
          else {
            double v71 = v67;
          }
          double v72 = 0.0;
          if (v74) {
            double v70 = 0.0;
          }
          else {
            double v70 = v68;
          }
          if (!v74)
          {
            double v72 = v69;
            double v73 = v66;
          }
        }
        double v75 = fabs(v71);
        if (fabs(v73) == INFINITY || v75 == INFINITY)
        {
          *(int64x2_t *)&v185.double var0 = v166;
          v185.double var2 = 0.0;
          v185.double var3 = 0.0;
        }
        else if (v73 == -8.98846567e307 && v71 == -8.98846567e307 && v70 == 1.79769313e308 && v72 == 1.79769313e308)
        {
          *(int64x2_t *)&v185.double var0 = vdupq_n_s64(0xFFDFFFFFFFFFFFFFLL);
          *(int64x2_t *)&v185.double var2 = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
        }
        else
        {
          v185.double var0 = v73 * 0.5;
          v185.double var1 = v71;
          v185.double var2 = v70 * 0.5;
          v185.double var3 = v72;
        }
        Rectangle::inset(&v185, -2.0, -0.0, (uint64_t)&v186);
        *(void *)&double v77 = *(_OWORD *)&Rectangle::integralize(&v186, 0.0001, (uint64_t)&v187);
        double v78 = v187.var0;
        double v79 = v187.var1;
        double v81 = v187.var2;
        double v80 = v187.var3;
        v82 = +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_cubicDownsample2h, v77);
        if (v78 == -8.98846567e307 && v79 == -8.98846567e307 && v81 == 1.79769313e308 && v80 == 1.79769313e308)
        {
          double v78 = *v65;
          double v79 = v65[1];
          double v81 = v65[2];
          double v80 = v65[3];
        }
        v194[0] = inputImage;
        v194[1] = +[CIVector vectorWithX:v161 Y:v160 Z:v159 W:v158];
        inputImage = -[CIKernel applyWithExtent:roiCallback:arguments:](v82, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_36_0, [MEMORY[0x1E4F1C978] arrayWithObjects:v194 count:2], v78, v79, v81, v80);
        long long v84 = v169;
        long long v83 = v174;
        *(float *)&long long v84 = *(float *)&v84 + *(float *)&v84;
        LODWORD(v83) = v84;
        long long v169 = v84;
        long long v174 = v83;
      }
      while (*(float *)&v84 <= 0.5);
    }
    long long v59 = v174;
    LODWORD(v59) = DWORD1(v174);
    if (*((float *)&v174 + 1) <= 0.5)
    {
      long long v170 = v59;
      int64x2_t v167 = vdupq_n_s64(0x7FF0000000000000uLL);
      v85 = (double *)MEMORY[0x1E4F1DB10];
      do
      {
        [(CIImage *)inputImage extent];
        double v86 = v202.origin.x;
        double v87 = v202.origin.y;
        double v88 = v202.size.width;
        double v89 = v202.size.height;
        if (CGRectIsInfinite(v202))
        {
          double v90 = 1.79769313e308;
          double v91 = -8.98846567e307;
          double v92 = 1.79769313e308;
          double v93 = -8.98846567e307;
        }
        else
        {
          v203.origin.double x = v86;
          v203.origin.double y = v87;
          v203.size.double width = v88;
          v203.size.double height = v89;
          BOOL v94 = CGRectIsNull(v203);
          double v93 = INFINITY;
          if (v94) {
            double v91 = INFINITY;
          }
          else {
            double v91 = v87;
          }
          double v92 = 0.0;
          if (v94) {
            double v90 = 0.0;
          }
          else {
            double v90 = v88;
          }
          if (!v94)
          {
            double v92 = v89;
            double v93 = v86;
          }
        }
        double v95 = fabs(v91);
        if (fabs(v93) == INFINITY || v95 == INFINITY)
        {
          *(int64x2_t *)&v185.double var0 = v167;
          v185.double var2 = 0.0;
          v185.double var3 = 0.0;
        }
        else if (v93 == -8.98846567e307 && v91 == -8.98846567e307 && v90 == 1.79769313e308 && v92 == 1.79769313e308)
        {
          *(int64x2_t *)&v185.double var0 = vdupq_n_s64(0xFFDFFFFFFFFFFFFFLL);
          *(int64x2_t *)&v185.double var2 = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
        }
        else
        {
          v185.double var0 = v93;
          v185.double var1 = v91 * 0.5;
          v185.double var2 = v90;
          v185.double var3 = v92 * 0.5;
        }
        Rectangle::inset(&v185, -0.0, -2.0, (uint64_t)&v186);
        *(void *)&double v97 = *(_OWORD *)&Rectangle::integralize(&v186, 0.0001, (uint64_t)&v187);
        double v98 = v187.var0;
        double v99 = v187.var1;
        double v101 = v187.var2;
        double v100 = v187.var3;
        v102 = +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_cubicDownsample2v, v97);
        if (v98 == -8.98846567e307 && v99 == -8.98846567e307 && v101 == 1.79769313e308 && v100 == 1.79769313e308)
        {
          double v98 = *v85;
          double v99 = v85[1];
          double v101 = v85[2];
          double v100 = v85[3];
        }
        v193[0] = inputImage;
        v193[1] = +[CIVector vectorWithX:v161 Y:v160 Z:v159 W:v158];
        inputImage = -[CIKernel applyWithExtent:roiCallback:arguments:](v102, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_38, [MEMORY[0x1E4F1C978] arrayWithObjects:v193 count:2], v98, v99, v101, v100);
        long long v104 = v170;
        long long v103 = v174;
        *(float *)&long long v104 = *(float *)&v104 + *(float *)&v104;
        DWORD1(v103) = v104;
        long long v170 = v104;
        long long v174 = v103;
      }
      while (*(float *)&v104 <= 0.5);
    }
    HIDWORD(v60) = DWORD1(v174);
    if (*(float *)&v174 >= 1.0)
    {
      unint64_t v105 = v174;
      goto LABEL_131;
    }
    [(CIImage *)inputImage extent];
    double v61 = v199.origin.x;
    double v62 = v199.origin.y;
    double v63 = v199.size.width;
    double v64 = v199.size.height;
    if (CGRectIsInfinite(v199))
    {
      double v63 = 1.79769313e308;
      double v62 = -8.98846567e307;
      double v64 = 1.79769313e308;
    }
    else
    {
      v204.origin.double x = v61;
      v204.origin.double y = v62;
      v204.size.double width = v63;
      v204.size.double height = v64;
      if (!CGRectIsNull(v204)) {
        goto LABEL_122;
      }
      double v63 = 0.0;
      double v62 = INFINITY;
      double v64 = 0.0;
    }
    double v61 = v62;
LABEL_122:
    double v106 = *(float *)&v174;
    if (fabs(v61) == INFINITY || fabs(v62) == INFINITY)
    {
      *(int64x2_t *)&v185.double var0 = vdupq_n_s64(0x7FF0000000000000uLL);
      v185.double var2 = 0.0;
      v185.double var3 = 0.0;
    }
    else if (v61 == -8.98846567e307 && v62 == -8.98846567e307 && v63 == 1.79769313e308 && v64 == 1.79769313e308)
    {
      *(int64x2_t *)&v185.double var0 = vdupq_n_s64(0xFFDFFFFFFFFFFFFFLL);
      *(int64x2_t *)&v185.double var2 = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
    }
    else
    {
      v185.double var0 = v61 * v106;
      v185.double var1 = v62;
      v185.double var2 = v63 * v106;
      v185.double var3 = v64;
    }
    Rectangle::inset(&v185, -2.0, -0.0, (uint64_t)&v186);
    *(void *)&double v107 = *(_OWORD *)&Rectangle::integralize(&v186, 0.0001, (uint64_t)&v187);
    double v108 = v187.var0;
    double v109 = v187.var1;
    double v111 = v187.var2;
    double v110 = v187.var3;
    v112 = +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_cubicDownsampleH, v107);
    if (v108 == -8.98846567e307 && v109 == -8.98846567e307 && v111 == 1.79769313e308 && v110 == 1.79769313e308)
    {
      double v108 = *MEMORY[0x1E4F1DB10];
      double v109 = *(double *)(MEMORY[0x1E4F1DB10] + 8);
      double v111 = *(double *)(MEMORY[0x1E4F1DB10] + 16);
      double v110 = *(double *)(MEMORY[0x1E4F1DB10] + 24);
    }
    v184[0] = MEMORY[0x1E4F143A8];
    v184[1] = 3221225472;
    v184[2] = __38__CIBicubicScaleTransform_outputImage__block_invoke_6;
    v184[3] = &__block_descriptor_40_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
    v184[4] = v174;
    v192[0] = inputImage;
    v192[1] = +[CIVector vectorWithX:(float)(1.0 / *(float *)&v174) Y:1.0 Z:v106 W:1.0];
    v192[2] = +[CIVector vectorWithX:v163.f32[0] Y:v163.f32[1] Z:v163.f32[2] W:v163.f32[3]];
    v192[3] = +[CIVector vectorWithX:v162.f32[0] Y:v162.f32[1] Z:v162.f32[2] W:v162.f32[3]];
    inputImage = -[CIKernel applyWithExtent:roiCallback:arguments:](v112, "applyWithExtent:roiCallback:arguments:", v184, [MEMORY[0x1E4F1C978] arrayWithObjects:v192 count:4], v108, v109, v111, v110);
    unint64_t v105 = __PAIR64__(DWORD1(v174), 1.0);
LABEL_131:
    LODWORD(v60) = HIDWORD(v105);
    double v171 = v60;
    unint64_t v175 = v105;
    if (*((float *)&v105 + 1) >= 1.0)
    {
LABEL_147:
      LODWORD(v60) = 1.0;
      float32x2_t v176 = (float32x2_t)v105;
      if (*(float *)&v105 > 1.0 || (unint64_t v105 = *(void *)&v171, *(float *)&v171 > 1.0) || inputImage == self->inputImage)
      {
        [(CIImage *)inputImage extent];
        CGFloat v124 = v207.origin.x;
        CGFloat v125 = v207.origin.y;
        CGFloat v126 = v207.size.width;
        CGFloat v127 = v207.size.height;
        if (CGRectIsInfinite(v207))
        {
          *(int64x2_t *)&v187.double var0 = vdupq_n_s64(0xFFDFFFFFFFFFFFFFLL);
          *(int64x2_t *)&v187.double var2 = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
        }
        else
        {
          v208.origin.double x = v124;
          v208.origin.double y = v125;
          v208.size.double width = v126;
          v208.size.double height = v127;
          if (CGRectIsNull(v208))
          {
            *(int64x2_t *)&v187.double var0 = vdupq_n_s64(0x7FF0000000000000uLL);
            v187.double var2 = 0.0;
            v187.double var3 = 0.0;
          }
          else
          {
            v187.double var0 = v124;
            v187.double var1 = v125;
            v187.double var2 = v126;
            v187.double var3 = v127;
          }
        }
        Rectangle::inset(&v187, -2.0, -2.0, (uint64_t)&v181);
        if (fabs(v181.f64[0]) == INFINITY || fabs(v181.f64[1]) == INFINITY)
        {
          *(int64x2_t *)&v185.double var0 = vdupq_n_s64(0x7FF0000000000000uLL);
          v185.double var2 = 0.0;
          v185.double var3 = 0.0;
        }
        else
        {
          float64x2_t v144 = (float64x2_t)vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
          float64x2_t v145 = (float64x2_t)vdupq_n_s64(0xFFDFFFFFFFFFFFFFLL);
          if (vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqq_f64(v181, v145), (int32x4_t)vceqq_f64(v182, v144))))))
          {
            v185.double var0 = v181.f64[0] * v176.f32[0];
            v185.double var1 = v181.f64[1] * *(float *)&v171;
            v185.double var2 = v176.f32[0] * v182.f64[0];
            v185.double var3 = vmuld_lane_f64(*(float *)&v171, v182, 1);
          }
          else
          {
            *(float64x2_t *)&v185.double var0 = v145;
            *(float64x2_t *)&v185.double var2 = v144;
          }
        }
        Rectangle::integralize(&v185, 0.0001, (uint64_t)&v186);
        Rectangle v187 = v186;
        double v128 = COERCE_DOUBLE(vdiv_f32(v155, v176));
        double v177 = v128;
        *(float *)&double v128 = v157;
        if (*(float *)&v156 == 1.0 && v157 == 0.0)
        {
          v129 = +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_cubicUpsample10, v128, v156);
          double v130 = v187.var0;
          double v131 = v187.var1;
          double v133 = v187.var2;
          double v132 = v187.var3;
          if (v187.var0 == -8.98846567e307
            && v187.var1 == -8.98846567e307
            && v187.var2 == 1.79769313e308
            && v187.var3 == 1.79769313e308)
          {
            double v130 = *MEMORY[0x1E4F1DB10];
            double v131 = *(double *)(MEMORY[0x1E4F1DB10] + 8);
            double v133 = *(double *)(MEMORY[0x1E4F1DB10] + 16);
            double v132 = *(double *)(MEMORY[0x1E4F1DB10] + 24);
          }
          v180[0] = MEMORY[0x1E4F143A8];
          v180[1] = 3221225472;
          v180[2] = __38__CIBicubicScaleTransform_outputImage__block_invoke_8;
          v180[3] = &__block_descriptor_40_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
          *(double *)&v180[4] = v177;
          v190[0] = inputImage;
          v190[1] = +[CIVector vectorWithX:*(float *)&v177 Y:*((float *)&v177 + 1)];
          return -[CIKernel applyWithExtent:roiCallback:arguments:](v129, "applyWithExtent:roiCallback:arguments:", v180, [MEMORY[0x1E4F1C978] arrayWithObjects:v190 count:2], v130, v131, v133, v132);
        }
        else if (v157 == 0.0)
        {
          v135 = +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_cubicUpsampleX0, v128, v156);
          Rectangle::operator CGRect();
          double v137 = v136;
          double v139 = v138;
          double v141 = v140;
          double v143 = v142;
          v179[0] = MEMORY[0x1E4F143A8];
          v179[1] = 3221225472;
          v179[2] = __38__CIBicubicScaleTransform_outputImage__block_invoke_9;
          v179[3] = &__block_descriptor_40_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
          *(double *)&v179[4] = v177;
          v189[0] = inputImage;
          v189[1] = +[CIVector vectorWithX:*(float *)&v177 Y:*((float *)&v177 + 1)];
          v189[2] = +[CIVector vectorWithX:v163.f32[0] Y:v163.f32[1] Z:v163.f32[2] W:v163.f32[3]];
          v189[3] = +[CIVector vectorWithX:v162.f32[0] Y:v162.f32[1] Z:v162.f32[2] W:v162.f32[3]];
          return -[CIKernel applyWithExtent:roiCallback:arguments:](v135, "applyWithExtent:roiCallback:arguments:", v179, [MEMORY[0x1E4F1C978] arrayWithObjects:v189 count:4], v137, v139, v141, v143);
        }
        else
        {
          v146 = +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_cubicUpsample, v128, v156);
          Rectangle::operator CGRect();
          double v148 = v147;
          double v150 = v149;
          double v152 = v151;
          double v154 = v153;
          v178[0] = MEMORY[0x1E4F143A8];
          v178[1] = 3221225472;
          v178[2] = __38__CIBicubicScaleTransform_outputImage__block_invoke_10;
          v178[3] = &__block_descriptor_40_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
          *(double *)&v178[4] = v177;
          v188[0] = inputImage;
          v188[1] = +[CIVector vectorWithX:*(float *)&v177 Y:*((float *)&v177 + 1)];
          v188[2] = +[CIVector vectorWithX:v163.f32[0] Y:v163.f32[1] Z:v163.f32[2] W:v163.f32[3]];
          v188[3] = +[CIVector vectorWithX:v162.f32[0] Y:v162.f32[1] Z:v162.f32[2] W:v162.f32[3]];
          return -[CIKernel applyWithExtent:roiCallback:arguments:](v146, "applyWithExtent:roiCallback:arguments:", v178, [MEMORY[0x1E4F1C978] arrayWithObjects:v188 count:4], v148, v150, v152, v154);
        }
      }
      return inputImage;
    }
    [(CIImage *)inputImage extent];
    double v113 = v205.origin.x;
    double v114 = v205.origin.y;
    double v115 = v205.size.width;
    double v116 = v205.size.height;
    if (CGRectIsInfinite(v205))
    {
      double v115 = 1.79769313e308;
      double v114 = -8.98846567e307;
      double v116 = 1.79769313e308;
    }
    else
    {
      v206.origin.double x = v113;
      v206.origin.double y = v114;
      v206.size.double width = v115;
      v206.size.double height = v116;
      if (!CGRectIsNull(v206)) {
        goto LABEL_138;
      }
      double v115 = 0.0;
      double v114 = INFINITY;
      double v116 = 0.0;
    }
    double v113 = v114;
LABEL_138:
    double v117 = *(float *)&v171;
    if (fabs(v113) == INFINITY || fabs(v114) == INFINITY)
    {
      *(int64x2_t *)&v185.double var0 = vdupq_n_s64(0x7FF0000000000000uLL);
      v185.double var2 = 0.0;
      v185.double var3 = 0.0;
    }
    else if (v113 == -8.98846567e307 && v114 == -8.98846567e307 && v115 == 1.79769313e308 && v116 == 1.79769313e308)
    {
      *(int64x2_t *)&v185.double var0 = vdupq_n_s64(0xFFDFFFFFFFFFFFFFLL);
      *(int64x2_t *)&v185.double var2 = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
    }
    else
    {
      v185.double var0 = v113;
      v185.double var1 = v114 * v117;
      v185.double var2 = v115;
      v185.double var3 = v116 * v117;
    }
    Rectangle::inset(&v185, -0.0, -2.0, (uint64_t)&v186);
    *(void *)&double v118 = *(_OWORD *)&Rectangle::integralize(&v186, 0.0001, (uint64_t)&v187);
    double v119 = v187.var0;
    double v120 = v187.var1;
    double v122 = v187.var2;
    double v121 = v187.var3;
    v123 = +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_cubicDownsampleV, v118);
    if (v119 == -8.98846567e307 && v120 == -8.98846567e307 && v122 == 1.79769313e308 && v121 == 1.79769313e308)
    {
      double v119 = *MEMORY[0x1E4F1DB10];
      double v120 = *(double *)(MEMORY[0x1E4F1DB10] + 8);
      double v122 = *(double *)(MEMORY[0x1E4F1DB10] + 16);
      double v121 = *(double *)(MEMORY[0x1E4F1DB10] + 24);
    }
    v183[0] = MEMORY[0x1E4F143A8];
    v183[1] = 3221225472;
    v183[2] = __38__CIBicubicScaleTransform_outputImage__block_invoke_7;
    v183[3] = &__block_descriptor_40_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
    v183[4] = v175;
    v191[0] = inputImage;
    v191[1] = +[CIVector vectorWithX:1.0 Y:(float)(1.0 / *(float *)&v171) Z:1.0 W:v117];
    v191[2] = +[CIVector vectorWithX:v163.f32[0] Y:v163.f32[1] Z:v163.f32[2] W:v163.f32[3]];
    v191[3] = +[CIVector vectorWithX:v162.f32[0] Y:v162.f32[1] Z:v162.f32[2] W:v162.f32[3]];
    inputImage = -[CIKernel applyWithExtent:roiCallback:arguments:](v123, "applyWithExtent:roiCallback:arguments:", v183, [MEMORY[0x1E4F1C978] arrayWithObjects:v191 count:4], v119, v120, v122, v121);
    unint64_t v105 = __PAIR64__(1.0, v175);
    LODWORD(v60) = 1.0;
    double v171 = v60;
    goto LABEL_147;
  }

  return +[CIImage emptyImage];
}

void __38__CIBicubicScaleTransform_outputImage__block_invoke(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  if (CGRectIsInfinite(*(CGRect *)&a1))
  {
    *(int64x2_t *)&v11.double var0 = vdupq_n_s64(0xFFDFFFFFFFFFFFFFLL);
    *(int64x2_t *)&v11.double var2 = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
  }
  else
  {
    v17.origin.double x = a1;
    v17.origin.double y = a2;
    v17.size.double width = a3;
    v17.size.double height = a4;
    if (CGRectIsNull(v17))
    {
      *(int64x2_t *)&v11.double var0 = vdupq_n_s64(0x7FF0000000000000uLL);
      *(_OWORD *)&v11.double var2 = 0uLL;
    }
    else
    {
      v11.double var0 = a1;
      v11.double var1 = a2;
      v11.double var2 = a3;
      v11.double var3 = a4;
    }
  }
  Rectangle::inset(&v11, -2.0, -2.0, (uint64_t)&v12);
  if (fabs(v12) == INFINITY || fabs(v13) == INFINITY)
  {
    *(int64x2_t *)&v15.double var0 = vdupq_n_s64(0x7FF0000000000000uLL);
    v15.double var2 = 0.0;
    v15.double var3 = 0.0;
  }
  else
  {
    v8.f64[0] = v13;
    v8.f64[1] = v12;
    float64x2_t v9 = (float64x2_t)vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
    float64x2_t v10 = (float64x2_t)vdupq_n_s64(0xFFDFFFFFFFFFFFFFLL);
    if (vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqq_f64(v8, v10), (int32x4_t)vceqq_f64(v14, v9))))))
    {
      v15.double var0 = v12 + v12;
      v15.double var1 = v13 + v13;
      *(float64x2_t *)&v15.double var2 = vaddq_f64(v14, v14);
    }
    else
    {
      *(float64x2_t *)&v15.double var0 = v10;
      *(float64x2_t *)&v15.double var2 = v9;
    }
  }
  Rectangle::integralize(&v15, 0.0001, (uint64_t)&v16);
}

void __38__CIBicubicScaleTransform_outputImage__block_invoke_2(double a1, double a2, double a3, double a4)
{
}

void __38__CIBicubicScaleTransform_outputImage__block_invoke_3(double a1, double a2, double a3, double a4)
{
}

void __38__CIBicubicScaleTransform_outputImage__block_invoke_6(uint64_t a1, double a2, double a3, double a4, double a5)
{
}

void __38__CIBicubicScaleTransform_outputImage__block_invoke_7(uint64_t a1, double a2, double a3, double a4, double a5)
{
}

double __38__CIBicubicScaleTransform_outputImage__block_invoke_8(float32x2_t *a1, float64_t a2, float64_t a3, double a4, double a5)
{
  return upsampleRoi(a2, a3, a4, a5, a1[4]);
}

double __38__CIBicubicScaleTransform_outputImage__block_invoke_9(float32x2_t *a1, float64_t a2, float64_t a3, double a4, double a5)
{
  return upsampleRoi(a2, a3, a4, a5, a1[4]);
}

double __38__CIBicubicScaleTransform_outputImage__block_invoke_10(float32x2_t *a1, float64_t a2, float64_t a3, double a4, double a5)
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

- (NSNumber)inputAspectRatio
{
  return self->inputAspectRatio;
}

- (void)setInputAspectRatio:(id)a3
{
}

- (NSNumber)inputB
{
  return self->inputB;
}

- (void)setInputB:(id)a3
{
}

- (NSNumber)inputC
{
  return self->inputC;
}

- (void)setInputC:(id)a3
{
}

@end