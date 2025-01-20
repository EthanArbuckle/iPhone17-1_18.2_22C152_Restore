@interface CIMaskedVariableBlur
+ (id)customAttributes;
- (BOOL)_isIdentity;
- (CIImage)inputImage;
- (CIImage)inputMask;
- (NSNumber)inputRadius;
- (id)_kernelCombine;
- (id)_kernelD2;
- (id)downTwo:(id)a3;
- (id)outputImage;
- (id)upCubic:(id)a3 scale:(float)a4;
- (void)setInputImage:(id)a3;
- (void)setInputMask:(id)a3;
- (void)setInputRadius:(id)a3;
@end

@implementation CIMaskedVariableBlur

+ (id)customAttributes
{
  v7[4] = *MEMORY[0x1E4F143B8];
  v6[0] = @"CIAttributeFilterCategories";
  v5[0] = @"CICategoryBlur";
  v5[1] = @"CICategoryStillImage";
  v5[2] = @"CICategoryVideo";
  v5[3] = @"CICategoryBuiltIn";
  v7[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:4];
  v7[1] = @"8";
  v6[1] = @"CIAttributeFilterAvailable_iOS";
  v6[2] = @"CIAttributeFilterAvailable_Mac";
  v7[2] = @"10.10";
  v6[3] = @"inputRadius";
  v3[0] = @"CIAttributeMin";
  v3[1] = @"CIAttributeSliderMin";
  v3[2] = @"CIAttributeSliderMax";
  v3[3] = @"CIAttributeDefault";
  v4[2] = &unk_1EE4A92B0;
  v4[3] = &unk_1EE4A92C0;
  v3[4] = @"CIAttributeIdentity";
  v3[5] = @"CIAttributeType";
  v4[0] = &unk_1EE4A92A0;
  v4[1] = &unk_1EE4A92A0;
  v4[4] = &unk_1EE4A92A0;
  v4[5] = @"CIAttributeTypeScalar";
  v7[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:6];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:4];
}

- (BOOL)_isIdentity
{
  [(NSNumber *)self->inputRadius floatValue];
  return v2 < 0.16;
}

- (id)_kernelD2
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_betterDown2];
}

- (id)_kernelCombine
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_maskedVariableBlur];
}

- (id)downTwo:(id)a3
{
  v29[1] = *MEMORY[0x1E4F143B8];
  [a3 extent];
  CGFloat x = v30.origin.x;
  CGFloat y = v30.origin.y;
  CGFloat width = v30.size.width;
  CGFloat height = v30.size.height;
  if (CGRectIsInfinite(v30))
  {
    *(int64x2_t *)&v28.double var0 = vdupq_n_s64(0xFFDFFFFFFFFFFFFFLL);
    *(int64x2_t *)&v28.double var2 = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
  }
  else
  {
    v31.origin.CGFloat x = x;
    v31.origin.CGFloat y = y;
    v31.size.CGFloat width = width;
    v31.size.CGFloat height = height;
    if (CGRectIsNull(v31))
    {
      *(int64x2_t *)&v28.double var0 = vdupq_n_s64(0x7FF0000000000000uLL);
      v28.double var2 = 0.0;
      v28.double var3 = 0.0;
    }
    else
    {
      v28.double var0 = x;
      v28.double var1 = y;
      v28.double var2 = width;
      v28.double var3 = height;
    }
  }
  Rectangle::inset(&v28, -1.0, -1.0, (uint64_t)&v23);
  if (fabs(v23) == INFINITY || fabs(v24) == INFINITY)
  {
    *(int64x2_t *)&v26.double var0 = vdupq_n_s64(0x7FF0000000000000uLL);
    v26.double var2 = 0.0;
    v26.double var3 = 0.0;
  }
  else
  {
    v15.f64[0] = v24;
    v15.f64[1] = v23;
    float64x2_t v16 = (float64x2_t)vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
    float64x2_t v17 = (float64x2_t)vdupq_n_s64(0xFFDFFFFFFFFFFFFFLL);
    if (vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqq_f64(v15, v17), (int32x4_t)vceqq_f64(v25, v16))))))
    {
      __asm { FMOV            V3.2D, #0.5 }
      v26.double var0 = v23 * 0.5;
      v26.double var1 = v24 * 0.5;
      *(float64x2_t *)&v26.double var2 = vmulq_f64(v25, _Q3);
    }
    else
    {
      *(float64x2_t *)&v26.double var0 = v17;
      *(float64x2_t *)&v26.double var2 = v16;
    }
  }
  Rectangle::integralize(&v26, 0.0001, (uint64_t)&v27);
  Rectangle v28 = v27;
  id v9 = [(CIMaskedVariableBlur *)self _kernelD2];
  double var1 = v28.var1;
  double var0 = v28.var0;
  double var3 = v28.var3;
  double var2 = v28.var2;
  if (v28.var0 == -8.98846567e307
    && v28.var1 == -8.98846567e307
    && v28.var2 == 1.79769313e308
    && v28.var3 == 1.79769313e308)
  {
    double var0 = *MEMORY[0x1E4F1DB10];
    double var1 = *(double *)(MEMORY[0x1E4F1DB10] + 8);
    double var2 = *(double *)(MEMORY[0x1E4F1DB10] + 16);
    double var3 = *(double *)(MEMORY[0x1E4F1DB10] + 24);
  }
  v29[0] = a3;
  return (id)objc_msgSend(v9, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_45, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v29, 1), var0, var1, var2, var3);
}

void __32__CIMaskedVariableBlur_downTwo___block_invoke(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  if (CGRectIsInfinite(*(CGRect *)&a1))
  {
    double v8 = -8.98846567e307;
    double v9 = 1.79769313e308;
    double v10 = 1.79769313e308;
    double v11 = -8.98846567e307;
  }
  else
  {
    v21.origin.CGFloat x = a1;
    v21.origin.CGFloat y = a2;
    v21.size.CGFloat width = a3;
    v21.size.CGFloat height = a4;
    BOOL IsNull = CGRectIsNull(v21);
    double v11 = INFINITY;
    if (IsNull) {
      double v9 = 0.0;
    }
    else {
      double v9 = a3;
    }
    if (IsNull) {
      double v10 = 0.0;
    }
    else {
      double v10 = a4;
    }
    if (IsNull) {
      double v8 = INFINITY;
    }
    else {
      double v8 = a2;
    }
    if (!IsNull) {
      double v11 = a1;
    }
  }
  double v13 = fabs(v8);
  if (fabs(v11) == INFINITY || v13 == INFINITY)
  {
    *(int64x2_t *)&v18.double var0 = vdupq_n_s64(0x7FF0000000000000uLL);
    *(_OWORD *)&v18.double var2 = 0uLL;
  }
  else if (v11 == -8.98846567e307 && v8 == -8.98846567e307 && v9 == 1.79769313e308 && v10 == 1.79769313e308)
  {
    *(int64x2_t *)&v18.double var0 = vdupq_n_s64(0xFFDFFFFFFFFFFFFFLL);
    *(int64x2_t *)&v18.double var2 = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
  }
  else
  {
    v18.double var0 = v11 + v11;
    v18.double var1 = v8 + v8;
    v18.double var2 = v9 + v9;
    v18.double var3 = v10 + v10;
  }
  Rectangle::inset(&v18, -1.0, -1.0, (uint64_t)&v19);
  Rectangle::integralize(&v19, 0.0001, (uint64_t)&v20);
}

- (id)upCubic:(id)a3 scale:(float)a4
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v6 = @"inputScale";
  v7[0] = objc_msgSend(NSNumber, "numberWithFloat:");
  return (id)objc_msgSend(a3, "imageByApplyingFilter:withInputParameters:", @"CISoftCubicUpsample", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1));
}

- (id)outputImage
{
  v27[9] = *MEMORY[0x1E4F143B8];
  if (!self->inputImage) {
    return 0;
  }
  [(CIImage *)self->inputMask extent];
  if (CGRectIsEmpty(v29)
    || [(CIMaskedVariableBlur *)self _isIdentity]
    || ([(CIImage *)self->inputMask extent], CGRectIsEmpty(v30)))
  {
    v3 = self->inputImage;
    return v3;
  }
  else
  {
    [(NSNumber *)self->inputRadius doubleValue];
    *(float *)&double v5 = v5;
    float v6 = floorf(fmaxf(log2f((float)(*(float *)&v5 * 4.0) / 3.0), 0.0));
    if (v6 <= 0.5) {
      int v7 = 1;
    }
    else {
      int v7 = 2;
    }
    if (v6 > 1.5) {
      int v7 = 3;
    }
    if (v6 > 2.5) {
      int v7 = 4;
    }
    if (v6 > 3.5) {
      int v7 = 5;
    }
    if (v6 <= 4.5) {
      unsigned int v8 = v7;
    }
    else {
      unsigned int v8 = 6;
    }
    id v9 = [(CIMaskedVariableBlur *)self downTwo:self->inputImage];
    id v10 = [(CIMaskedVariableBlur *)self downTwo:v9];
    id v11 = [(CIMaskedVariableBlur *)self downTwo:v10];
    id v12 = [(CIMaskedVariableBlur *)self downTwo:v11];
    id v13 = [(CIMaskedVariableBlur *)self downTwo:v12];
    id v14 = [(CIMaskedVariableBlur *)self downTwo:v13];
    LODWORD(v15) = 1115684864;
    objc_msgSend(-[CIMaskedVariableBlur upCubic:scale:](self, "upCubic:scale:", v14, v15), "extent");
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;
    if (v8 < 2) {
      id v10 = v9;
    }
    if (v8 < 3) {
      id v11 = v10;
    }
    if (v8 < 4) {
      id v12 = v11;
    }
    if (v8 < 5) {
      id v13 = v12;
    }
    if (v8 >= 6) {
      id v24 = v14;
    }
    else {
      id v24 = v13;
    }
    id v25 = [(CIMaskedVariableBlur *)self _kernelCombine];
    inputImage = self->inputImage;
    v27[0] = self->inputMask;
    v27[1] = inputImage;
    v27[2] = v9;
    v27[3] = v10;
    v27[4] = v11;
    v27[5] = v12;
    v27[6] = v13;
    v27[7] = v24;
    v27[8] = self->inputRadius;
    return (id)objc_msgSend(v25, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_29_1, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v27, 9), v17, v19, v21, v23);
  }
}

double __35__CIMaskedVariableBlur_outputImage__block_invoke(double a1, CGFloat a2, CGFloat a3, CGFloat a4, uint64_t a5, unsigned int a6)
{
  double v9 = a1;
  if (a6 > 1)
  {
    float v19 = flt_1939547FC[a6];
    if (CGRectIsInfinite(*(CGRect *)&a1))
    {
      *(int64x2_t *)&v21.double var0 = vdupq_n_s64(0xFFDFFFFFFFFFFFFFLL);
      *(int64x2_t *)&v21.double var2 = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
    }
    else
    {
      v23.origin.CGFloat x = v9;
      v23.origin.CGFloat y = a2;
      v23.size.CGFloat width = a3;
      v23.size.CGFloat height = a4;
      if (CGRectIsNull(v23))
      {
        *(int64x2_t *)&v21.double var0 = vdupq_n_s64(0x7FF0000000000000uLL);
        v21.double var2 = 0.0;
        v21.double var3 = 0.0;
      }
      else
      {
        v21.double var0 = v9;
        v21.double var1 = a2;
        v21.double var2 = a3;
        v21.double var3 = a4;
      }
    }
    Rectangle::inset(&v21, 0.5, 0.5, (uint64_t)v22);
    _Q1 = vaddq_f64(v22[0], v22[1]);
    __asm { FMOV            V5.2S, #-1.0 }
    float32x2_t v16 = vadd_f32(vadd_f32(vrndm_f32(vadd_f32(vmul_n_f32(vcvt_f32_f64(vminnmq_f64(v22[0], _Q1)), v19), (float32x2_t)0xBF000000BF000000)), (float32x2_t)0x3F0000003F000000), _D5);
    float32x2_t v17 = vadd_f32(vrndm_f32(vadd_f32(vmul_n_f32(vcvt_f32_f64(vmaxnmq_f64(v22[0], _Q1)), v19), (float32x2_t)0xBF000000BF000000)), (float32x2_t)0x3F0000003F000000);
    __asm { FMOV            V1.2S, #1.0 }
    *(float64x2_t *)&v21.double var0 = vcvtq_f64_f32(v16);
    *(float64x2_t *)&v21.double var2 = vcvtq_f64_f32(vsub_f32(vadd_f32(v17, *(float32x2_t *)&_Q1.f64[0]), v16));
    Rectangle::integralize(&v21, 0.0001, (uint64_t)v20);
    double v9 = v20[0];
    if (v20[0] == -8.98846567e307 && v20[1] == -8.98846567e307 && v20[2] == 1.79769313e308 && v20[3] == 1.79769313e308) {
      return *MEMORY[0x1E4F1DB10];
    }
  }
  return v9;
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
}

- (CIImage)inputMask
{
  return self->inputMask;
}

- (void)setInputMask:(id)a3
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