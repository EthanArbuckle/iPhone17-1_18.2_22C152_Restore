@interface CIZoomBlur
+ (id)customAttributes;
- (BOOL)_isIdentity;
- (CIImage)inputImage;
- (CIVector)inputCenter;
- (NSNumber)inputAmount;
- (id)_blur:(id)a3 pass:(int)a4 weightsFactor:(float)a5;
- (id)_kernel;
- (id)_kernelNew;
- (id)outputImage;
- (id)valueForUndefinedKey:(id)a3;
- (void)setInputAmount:(id)a3;
- (void)setInputCenter:(id)a3;
- (void)setInputImage:(id)a3;
- (void)setValue:(id)a3 forUndefinedKey:(id)a4;
@end

@implementation CIZoomBlur

+ (id)customAttributes
{
  v14[4] = *MEMORY[0x1E4F143B8];
  int v2 = dyld_program_sdk_at_least();
  v13[0] = @"CIAttributeFilterCategories";
  v12[0] = @"CICategoryBlur";
  v12[1] = @"CICategoryStillImage";
  v12[2] = @"CICategoryVideo";
  v12[3] = @"CICategoryBuiltIn";
  v14[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:4];
  v14[1] = @"8.3";
  v13[1] = @"CIAttributeFilterAvailable_iOS";
  v13[2] = @"CIAttributeFilterAvailable_Mac";
  v14[2] = @"10.4";
  v13[3] = @"inputAmount";
  if (v2)
  {
    v10[0] = @"CIAttributeSliderMin";
    v10[1] = @"CIAttributeSliderMax";
    v11[0] = &unk_1EE4A94D0;
    v11[1] = &unk_1EE4A94E0;
    v10[2] = @"CIAttributeDefault";
    v10[3] = @"CIAttributeIdentity";
    v11[2] = &unk_1EE4A94C0;
    v11[3] = &unk_1EE4A94A0;
    v10[4] = @"CIAttributeType";
    v11[4] = @"CIAttributeTypeDistance";
    v3 = (void *)MEMORY[0x1E4F1C9E8];
    v4 = v11;
    v5 = v10;
    uint64_t v6 = 5;
  }
  else
  {
    v8[0] = @"CIAttributeMin";
    v8[1] = @"CIAttributeSliderMin";
    v9[0] = &unk_1EE4A94A0;
    v9[1] = &unk_1EE4A94A0;
    v8[2] = @"CIAttributeSliderMax";
    v8[3] = @"CIAttributeDefault";
    v9[2] = &unk_1EE4A94E0;
    v9[3] = &unk_1EE4A94C0;
    v8[4] = @"CIAttributeIdentity";
    v8[5] = @"CIAttributeType";
    v9[4] = &unk_1EE4A94A0;
    v9[5] = @"CIAttributeTypeDistance";
    v3 = (void *)MEMORY[0x1E4F1C9E8];
    v4 = v9;
    v5 = v8;
    uint64_t v6 = 6;
  }
  v14[3] = [v3 dictionaryWithObjects:v4 forKeys:v5 count:v6];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:4];
}

- (void)setValue:(id)a3 forUndefinedKey:(id)a4
{
  if ([a4 isEqualToString:@"inputRadius"])
  {
    [(CIZoomBlur *)self setInputAmount:a3];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)CIZoomBlur;
    [(CIFilter *)&v7 setValue:a3 forUndefinedKey:a4];
  }
}

- (id)valueForUndefinedKey:(id)a3
{
  if ([a3 isEqualToString:@"inputRadius"])
  {
    return [(CIZoomBlur *)self inputAmount];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)CIZoomBlur;
    return [(CIFilter *)&v6 valueForUndefinedKey:a3];
  }
}

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_zoomBlur];
}

- (id)_kernelNew
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_zoom];
}

- (id)_blur:(id)a3 pass:(int)a4 weightsFactor:(float)a5
{
  v39[5] = *MEMORY[0x1E4F143B8];
  float v8 = pow(0.995, (float)(1 << a4));
  [(CIVector *)self->inputCenter X];
  float v10 = v9;
  [(CIVector *)self->inputCenter Y];
  float v12 = v11;
  double v13 = (float)((float)(v8 * v8) * (float)(v8 * v8));
  v14 = +[CIVector vectorWithX:v8 Y:(float)(v8 * v8) Z:(float)((float)(v8 * v8) * v8) W:v13];
  double v15 = v10;
  double v16 = v12;
  v17 = +[CIVector vectorWithX:v15 Y:v12 Z:v13];
  v18 = +[CIVector vectorWithX:a5 * 0.1 Y:a5 * 0.15 Z:a5 * 0.2 W:a5 * 0.25];
  uint64_t v19 = [NSNumber numberWithDouble:(float)(1.0 - a5) + a5 * 0.3];
  [a3 extent];
  double x = v40.origin.x;
  double y = v40.origin.y;
  double width = v40.size.width;
  double height = v40.size.height;
  if (CGRectIsInfinite(v40))
  {
    double v24 = *MEMORY[0x1E4F1DB10];
    double v25 = *(double *)(MEMORY[0x1E4F1DB10] + 8);
    double v26 = *(double *)(MEMORY[0x1E4F1DB10] + 16);
    double v27 = *(double *)(MEMORY[0x1E4F1DB10] + 24);
    goto LABEL_26;
  }
  double v28 = y + height;
  float v29 = (x - v15) / v13 + v15;
  float v30 = (y - v16) / v13 + v16;
  float v31 = (x + width - v15) / v13 + v15;
  if (v31 >= v29)
  {
    if (v31 <= v29) {
      float v34 = (x - v15) / v13 + v15;
    }
    else {
      float v34 = (x + width - v15) / v13 + v15;
    }
    float v32 = (v28 - v16) / v13 + v16;
    float v33 = (x - v15) / v13 + v15;
LABEL_10:
    if (v34 >= v29) {
      float v29 = v34;
    }
    goto LABEL_12;
  }
  float v32 = (v28 - v16) / v13 + v16;
  float v33 = (x + width - v15) / v13 + v15;
  float v34 = (x - v15) / v13 + v15;
  if (v31 <= v29) {
    goto LABEL_10;
  }
  float v33 = (x - v15) / v13 + v15;
LABEL_12:
  if (v32 >= v30)
  {
    if (v32 <= v30) {
      float v35 = (y - v16) / v13 + v16;
    }
    else {
      float v35 = v32;
    }
  }
  else
  {
    float v35 = (y - v16) / v13 + v16;
    float v30 = v32;
  }
  if (v33 <= v31)
  {
    if (v29 < v31) {
      float v29 = (x + width - v15) / v13 + v15;
    }
  }
  else
  {
    float v33 = (x + width - v15) / v13 + v15;
  }
  if (v30 <= v32)
  {
    if (v35 < v32) {
      float v35 = v32;
    }
  }
  else
  {
    float v30 = v32;
  }
  v44.origin.double x = v33;
  v44.origin.double y = v30;
  v44.size.double width = (float)(v29 - v33);
  v44.size.double height = (float)(v35 - v30);
  v41.origin.double x = x;
  v41.origin.double y = y;
  v41.size.double width = width;
  v41.size.double height = height;
  CGRect v42 = CGRectUnion(v41, v44);
  CGRect v43 = CGRectIntegral(v42);
  double v24 = v43.origin.x;
  double v25 = v43.origin.y;
  double v26 = v43.size.width;
  double v27 = v43.size.height;
LABEL_26:
  id v36 = [(CIZoomBlur *)self _kernel];
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __39__CIZoomBlur__blur_pass_weightsFactor___block_invoke;
  v38[3] = &unk_1E57716D0;
  v38[4] = v17;
  v39[0] = a3;
  v39[1] = self->inputCenter;
  v39[2] = v14;
  v39[3] = v18;
  v39[4] = v19;
  return (id)objc_msgSend(v36, "applyWithExtent:roiCallback:arguments:", v38, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v39, 5), v24, v25, v26, v27);
}

double __39__CIZoomBlur__blur_pass_weightsFactor___block_invoke(uint64_t a1, double a2)
{
  v3 = *(void **)(a1 + 32);
  [v3 X];
  double v5 = v4;
  [v3 Y];
  [v3 Z];
  *(float *)&double v6 = v6;
  float v7 = a2;
  double v8 = v5 + (v7 - v5) * *(float *)&v6;
  if (v8 <= v7) {
    return (float)v8;
  }
  else {
    return (float)a2;
  }
}

- (BOOL)_isIdentity
{
  int v3 = dyld_program_sdk_at_least();
  [(NSNumber *)self->inputAmount floatValue];
  float v5 = fabsf(v4);
  if (v3) {
    float v4 = v5;
  }
  return v4 < 0.001;
}

- (id)outputImage
{
  v49[3] = *MEMORY[0x1E4F143B8];
  if (!self->inputImage) {
    return 0;
  }
  if ([(CIZoomBlur *)self _isIdentity])
  {
    int v3 = self->inputImage;
    return v3;
  }
  int v5 = dyld_program_sdk_at_least();
  [(NSNumber *)self->inputAmount floatValue];
  if (v5)
  {
    float v7 = 1000.0;
    if (*(float *)&v6 <= 1000.0) {
      float v7 = *(float *)&v6;
    }
    if (*(float *)&v6 >= -1000.0) {
      float v8 = v7;
    }
    else {
      float v8 = -1000.0;
    }
    inputCenter = self->inputCenter;
    [(CIVector *)inputCenter X];
    *(float *)&double v10 = v10;
    float v44 = *(float *)&v10;
    [(CIVector *)inputCenter Y];
    *(float *)&uint64_t v12 = v11;
    uint64_t v42 = v12;
    float32x2_t v43 = (float32x2_t)__PAIR64__(v12, LODWORD(v44));
    double v13 = pow(0.98, v8);
    [(CIImage *)self->inputImage extent];
    double x = v51.origin.x;
    double y = v51.origin.y;
    double width = v51.size.width;
    double height = v51.size.height;
    if (CGRectIsInfinite(v51))
    {
      int64x2_t v18 = vdupq_n_s64(0xFFDFFFFFFFFFFFFFLL);
      *(int64x2_t *)&v48.double var0 = v18;
      *(int64x2_t *)&v48.double var2 = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
      double y = -8.98846567e307;
      double height = 1.79769313e308;
      double width = 1.79769313e308;
    }
    else
    {
      v52.origin.double x = x;
      v52.origin.double y = y;
      v52.size.double width = width;
      v52.size.double height = height;
      if (!CGRectIsNull(v52))
      {
        v48.double var0 = x;
        v48.double var1 = y;
        v48.double var2 = width;
        v48.double var3 = height;
        goto LABEL_29;
      }
      int64x2_t v18 = vdupq_n_s64(0x7FF0000000000000uLL);
      *(int64x2_t *)&v48.double var0 = v18;
      v48.double var2 = 0.0;
      v48.double var3 = 0.0;
      double height = 0.0;
      double y = INFINITY;
      double width = 0.0;
    }
    double x = y;
LABEL_29:
    v18.i64[0] = 0;
    double v27 = INFINITY;
    double v28 = 0.0;
    double v29 = 0.0;
    double v30 = INFINITY;
    if (fabs(x) != INFINITY)
    {
      double v27 = INFINITY;
      double v30 = INFINITY;
      if (fabs(y) != INFINITY)
      {
        double v27 = -8.98846567e307;
        if (x == -8.98846567e307 && y == -8.98846567e307 && width == 1.79769313e308 && height == 1.79769313e308)
        {
          double v28 = 1.79769313e308;
          double v29 = 1.79769313e308;
          double v30 = -8.98846567e307;
        }
        else
        {
          float32x2_t v31 = vneg_f32(v43);
          double v30 = x + v31.f32[0];
          double v27 = y + v31.f32[1];
          double v28 = width;
          double v29 = height;
        }
      }
    }
    double v32 = INFINITY;
    if (fabs(v30) == INFINITY)
    {
      double v33 = 0.0;
    }
    else
    {
      double v32 = INFINITY;
      double v33 = 0.0;
      double v34 = INFINITY;
      if (fabs(v27) == INFINITY) {
        goto LABEL_46;
      }
      double v32 = -8.98846567e307;
      if (v30 != -8.98846567e307 || v27 != -8.98846567e307 || v28 != 1.79769313e308 || v29 != 1.79769313e308)
      {
        double v34 = 1.0 / v13 * v30;
        double v32 = 1.0 / v13 * v27;
        *(double *)v18.i64 = 1.0 / v13 * v28;
        double v33 = 1.0 / v13 * v29;
LABEL_46:
        double v35 = v44;
        double v36 = *(float *)&v42;
        if (fabs(v34) == INFINITY || fabs(v32) == INFINITY)
        {
          int64x2_t v18 = vdupq_n_s64(0x7FF0000000000000uLL);
          *(int64x2_t *)&v47.double var0 = v18;
          v47.double var2 = 0.0;
          v47.double var3 = 0.0;
        }
        else if (v34 == -8.98846567e307 {
               && v32 == -8.98846567e307
        }
               && *(double *)v18.i64 == 1.79769313e308
               && v33 == 1.79769313e308)
        {
          int64x2_t v18 = vdupq_n_s64(0xFFDFFFFFFFFFFFFFLL);
          *(int64x2_t *)&v47.double var0 = v18;
          *(int64x2_t *)&v47.double var2 = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
        }
        else
        {
          v47.double var0 = v34 + v35;
          v47.double var1 = v32 + v36;
          *(void *)&v47.double var2 = v18.i64[0];
          v47.double var3 = v33;
        }
        Rectangle::Union(&v47, &v48, (uint64_t)&v46, v18);
        Rectangle v47 = v46;
        id v37 = [(CIZoomBlur *)self _kernelNew];
        double var1 = v47.var1;
        double var0 = v47.var0;
        double var3 = v47.var3;
        double var2 = v47.var2;
        if (v47.var0 == -8.98846567e307
          && v47.var1 == -8.98846567e307
          && v47.var2 == 1.79769313e308
          && v47.var3 == 1.79769313e308)
        {
          double var0 = *MEMORY[0x1E4F1DB10];
          double var1 = *(double *)(MEMORY[0x1E4F1DB10] + 8);
          double var2 = *(double *)(MEMORY[0x1E4F1DB10] + 16);
          double var3 = *(double *)(MEMORY[0x1E4F1DB10] + 24);
        }
        v45[0] = MEMORY[0x1E4F143A8];
        v45[1] = 3221225472;
        v45[2] = __25__CIZoomBlur_outputImage__block_invoke;
        v45[3] = &__block_descriptor_48_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
        v45[4] = v43;
        *(double *)&v45[5] = v13;
        v49[0] = self->inputImage;
        v49[1] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", v35, v36, v42);
        v49[2] = [NSNumber numberWithDouble:v13];
        return (id)objc_msgSend(v37, "applyWithExtent:roiCallback:arguments:", v45, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v49, 3), var0, var1, var2, var3);
      }
      v18.i64[0] = 0x7FEFFFFFFFFFFFFFLL;
      double v33 = 1.79769313e308;
    }
    double v34 = v32;
    goto LABEL_46;
  }
  float v19 = *(float *)&v6 * *(float *)&v6;
  float v20 = 1.0833;
  uint64_t v21 = 0;
  if (v19 <= 1.0833)
  {
    inputImage = self->inputImage;
    float v26 = v19 / 1.0833;
  }
  else
  {
    float v22 = 1.0;
    do
    {
      float v23 = v20;
      uint64_t v21 = (v21 + 1);
      float v22 = v22 * 4.0;
      float v20 = v20 + v22;
    }
    while (v19 > v20);
    uint64_t v24 = 0;
    inputImage = self->inputImage;
    float v26 = (float)(v19 - v23) / (float)(v20 - v23);
    do
    {
      LODWORD(v6) = 1.0;
      inputImage = [(CIZoomBlur *)self _blur:inputImage pass:v24 weightsFactor:v6];
      uint64_t v24 = (v24 + 1);
    }
    while (v21 != v24);
  }
  *(float *)&double v6 = v26;

  return [(CIZoomBlur *)self _blur:inputImage pass:v21 weightsFactor:v6];
}

void __25__CIZoomBlur_outputImage__block_invoke(uint64_t a1, double a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  double v8 = a2;
  if (CGRectIsInfinite(*(CGRect *)&a2))
  {
    int64x2_t v10 = vdupq_n_s64(0xFFDFFFFFFFFFFFFFLL);
    *(int64x2_t *)&v27.double var0 = v10;
    *(int64x2_t *)&v27.double var2 = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
    a3 = -8.98846567e307;
    a5 = 1.79769313e308;
    a4 = 1.79769313e308;
  }
  else
  {
    v28.origin.double x = v8;
    v28.origin.double y = a3;
    v28.size.double width = a4;
    v28.size.double height = a5;
    if (!CGRectIsNull(v28))
    {
      v27.double var0 = v8;
      v27.double var1 = a3;
      v27.double var2 = a4;
      v27.double var3 = a5;
      goto LABEL_7;
    }
    int64x2_t v10 = vdupq_n_s64(0x7FF0000000000000uLL);
    *(int64x2_t *)&v27.double var0 = v10;
    v27.double var2 = 0.0;
    v27.double var3 = 0.0;
    a5 = 0.0;
    a3 = INFINITY;
    a4 = 0.0;
  }
  double v8 = a3;
LABEL_7:
  float32x2_t v11 = *(float32x2_t *)(a1 + 32);
  double v12 = 0.0;
  double v13 = INFINITY;
  double v14 = 0.0;
  double v15 = 0.0;
  double v16 = INFINITY;
  if (fabs(v8) != INFINITY)
  {
    double v13 = INFINITY;
    double v16 = INFINITY;
    if (fabs(a3) != INFINITY)
    {
      double v13 = -8.98846567e307;
      if (v8 == -8.98846567e307 && a3 == -8.98846567e307 && a4 == 1.79769313e308 && a5 == 1.79769313e308)
      {
        double v14 = 1.79769313e308;
        double v15 = 1.79769313e308;
        double v16 = -8.98846567e307;
      }
      else
      {
        float32x2_t v17 = vneg_f32(v11);
        double v16 = v8 + v17.f32[0];
        double v13 = a3 + v17.f32[1];
        double v14 = a4;
        double v15 = a5;
      }
    }
  }
  double v18 = INFINITY;
  if (fabs(v16) == INFINITY)
  {
    double v19 = 0.0;
LABEL_23:
    double v20 = v18;
    goto LABEL_24;
  }
  double v18 = INFINITY;
  double v19 = 0.0;
  double v20 = INFINITY;
  if (fabs(v13) == INFINITY) {
    goto LABEL_24;
  }
  double v21 = *(double *)(a1 + 40);
  double v18 = -8.98846567e307;
  if (v16 == -8.98846567e307 && v13 == -8.98846567e307 && v14 == 1.79769313e308 && v15 == 1.79769313e308)
  {
    double v12 = 1.79769313e308;
    double v19 = 1.79769313e308;
    goto LABEL_23;
  }
  double v20 = v16 * v21;
  double v18 = v13 * v21;
  double v12 = v14 * v21;
  double v19 = v15 * v21;
LABEL_24:
  double v22 = fabs(v18);
  if (fabs(v20) == INFINITY || v22 == INFINITY)
  {
    int64x2_t v10 = vdupq_n_s64(0x7FF0000000000000uLL);
    *(int64x2_t *)&v26.double var0 = v10;
    v26.double var2 = 0.0;
    v26.double var3 = 0.0;
  }
  else if (v20 == -8.98846567e307 && v18 == -8.98846567e307 && v12 == 1.79769313e308 && v19 == 1.79769313e308)
  {
    int64x2_t v10 = vdupq_n_s64(0xFFDFFFFFFFFFFFFFLL);
    *(int64x2_t *)&v26.double var0 = v10;
    *(int64x2_t *)&v26.double var2 = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
  }
  else
  {
    double v24 = v20 + v11.f32[0];
    *(double *)v10.i64 = v18 + v11.f32[1];
    v26.double var0 = v24;
    *(void *)&v26.double var1 = v10.i64[0];
    v26.double var2 = v12;
    v26.double var3 = v19;
  }
  Rectangle::Union(&v26, &v27, (uint64_t)&v25, v10);
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

- (NSNumber)inputAmount
{
  return self->inputAmount;
}

- (void)setInputAmount:(id)a3
{
}

@end