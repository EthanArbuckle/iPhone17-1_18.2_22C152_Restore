@interface CIMirror
+ (id)customAttributes;
- (CIImage)inputImage;
- (CIVector)inputPoint;
- (NSNumber)inputAngle;
- (double)computeDOD:(float32x2_t)a3@<D0> tst:(__n128)a4@<Q1> off:(int8x16_t)a5@<Q2> mtx:(int8x16_t)a6@<Q3>;
- (id)_kernel;
- (id)outputImage;
- (void)setInputAngle:(id)a3;
- (void)setInputImage:(id)a3;
- (void)setInputPoint:(id)a3;
@end

@implementation CIMirror

+ (id)customAttributes
{
  v9[3] = *MEMORY[0x1E4F143B8];
  v8[0] = @"CIAttributeFilterCategories";
  v7[0] = @"CICategoryTileEffect";
  v7[1] = @"CICategoryVideo";
  v7[2] = @"CICategoryStillImage";
  v7[3] = @"CICategoryBuiltIn";
  v7[4] = @"CICategoryApplePrivate";
  v9[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:5];
  v8[1] = @"inputPoint";
  v5[0] = @"CIAttributeDefault";
  v5[1] = @"CIAttributeType";
  v6[0] = +[CIVector vectorWithX:150.0 Y:150.0];
  v6[1] = @"CIAttributeTypePosition";
  v9[1] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:2];
  v8[2] = @"inputAngle";
  v3[0] = @"CIAttributeSliderMin";
  v3[1] = @"CIAttributeSliderMax";
  v4[0] = &unk_1EE4A9370;
  v4[1] = &unk_1EE4A9380;
  v3[2] = @"CIAttributeDefault";
  v3[3] = @"CIAttributeType";
  v4[2] = &unk_1EE4A9380;
  v4[3] = @"CIAttributeTypeAngle";
  v9[2] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:4];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:3];
}

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_mirror];
}

- (double)computeDOD:(float32x2_t)a3@<D0> tst:(__n128)a4@<Q1> off:(int8x16_t)a5@<Q2> mtx:(int8x16_t)a6@<Q3>
{
  [a1[10] extent];
  double x = v88.origin.x;
  double y = v88.origin.y;
  double width = v88.size.width;
  double height = v88.size.height;
  if (CGRectIsInfinite(v88))
  {
    double height = 1.79769313e308;
    double x = -8.98846567e307;
    double y = -8.98846567e307;
    double width = 1.79769313e308;
  }
  else
  {
    v89.origin.double x = x;
    v89.origin.double y = y;
    v89.size.double width = width;
    v89.size.double height = height;
    if (CGRectIsNull(v89))
    {
      double height = 0.0;
      double x = INFINITY;
      double y = INFINITY;
      double width = 0.0;
    }
  }
  *a2 = vdupq_n_s64(0x7FF0000000000000uLL);
  a2[1].i64[0] = 0;
  a2[1].i64[1] = 0;
  [a1[11] X];
  double v13 = v12;
  [a1[11] Y];
  float v14 = v13;
  float v69 = v14;
  float v16 = v15;
  [a1[12] doubleValue];
  long double v18 = v17;
  double v67 = cos(v17);
  double v19 = y + height;
  double v72 = v16;
  if (fabs(v67) > 0.001)
  {
    double v63 = fmin(y, v19);
    double v20 = tan(v18);
    double v21 = v69;
    v22.f64[0] = v69 + (v63 - v72) * v20;
    double v23 = fmin(x, x + width);
    double v24 = fmax(x, x + width);
    if (v22.f64[0] >= v23 && v22.f64[0] <= v24)
    {
      v22.f64[1] = v63;
      double v64 = v20;
      int64x2_t v26 = a2[1];
      v85[0] = *a2;
      v85[1] = v26;
      extendDOD((uint64_t)v85, &v86, vcvt_f32_f64(v22), a3, a4, a5, a6);
      double v21 = v69;
      double v20 = v64;
      int64x2_t v27 = v87;
      *a2 = v86;
      a2[1] = v27;
    }
    double v28 = fmax(y, v19);
    v29.f64[0] = v21 + (v28 - v72) * v20;
    if (v29.f64[0] >= v23 && v29.f64[0] <= v24)
    {
      v29.f64[1] = v28;
      int64x2_t v31 = a2[1];
      v84[0] = *a2;
      v84[1] = v31;
      extendDOD((uint64_t)v84, &v86, vcvt_f32_f64(v29), a3, a4, a5, a6);
      int64x2_t v32 = v87;
      *a2 = v86;
      a2[1] = v32;
    }
  }
  double v33 = sin(v18);
  double v34 = x + width;
  double v35 = fmin(x, x + width);
  if (fabs(v33) <= 0.001)
  {
    double v38 = fmin(y, v19);
    double v39 = fmax(y, v19);
    double v70 = fmax(x, v34);
  }
  else
  {
    double v36 = v69;
    double v37 = (v35 - v69) * v67 / v33 + v72;
    double v38 = fmin(y, v19);
    double v39 = fmax(y, v19);
    BOOL v40 = v37 < v38 || v37 > v39;
    double v65 = v35;
    if (!v40)
    {
      v41.f64[0] = v35;
      v41.f64[1] = (v35 - v69) * v67 / v33 + v72;
      int64x2_t v42 = a2[1];
      v83[0] = *a2;
      v83[1] = v42;
      extendDOD((uint64_t)v83, &v86, vcvt_f32_f64(v41), a3, a4, a5, a6);
      double v35 = v65;
      int64x2_t v43 = v87;
      *a2 = v86;
      a2[1] = v43;
    }
    double v44 = fmax(x, v34);
    double v45 = (v44 - v36) * v67 / v33 + v72;
    BOOL v46 = v45 < v38 || v45 > v39;
    double v70 = v44;
    if (!v46)
    {
      v47.f64[0] = v44;
      v47.f64[1] = (v44 - v36) * v67 / v33 + v72;
      int64x2_t v48 = a2[1];
      v82[0] = *a2;
      v82[1] = v48;
      extendDOD((uint64_t)v82, &v86, vcvt_f32_f64(v47), a3, a4, a5, a6);
      double v35 = v65;
      int64x2_t v49 = v87;
      *a2 = v86;
      a2[1] = v49;
    }
  }
  v50.f32[0] = v35;
  __int32 v66 = v50.i32[0];
  float32_t v51 = v38;
  __int32 v73 = LODWORD(v51);
  v50.f32[1] = v51;
  int64x2_t v52 = a2[1];
  v81[0] = *a2;
  v81[1] = v52;
  extendDOD((uint64_t)v81, &v86, v50, a3, a4, a5, a6);
  int64x2_t v53 = v87;
  *a2 = v86;
  a2[1] = v53;
  *(float *)v53.i32 = v39;
  __int32 v68 = v53.i32[0];
  float32x2_t v54 = (float32x2_t)__PAIR64__(v53.u32[0], v66);
  int64x2_t v55 = a2[1];
  v80[0] = *a2;
  v80[1] = v55;
  extendDOD((uint64_t)v80, &v86, v54, a3, a4, a5, a6);
  int64x2_t v56 = v87;
  *a2 = v86;
  a2[1] = v56;
  v57.f32[0] = v70;
  __int32 v71 = v57.i32[0];
  v57.i32[1] = v73;
  int64x2_t v58 = a2[1];
  v79[0] = *a2;
  v79[1] = v58;
  extendDOD((uint64_t)v79, &v86, v57, a3, a4, a5, a6);
  int64x2_t v59 = v87;
  *a2 = v86;
  a2[1] = v59;
  int64x2_t v60 = a2[1];
  v78[0] = *a2;
  v78[1] = v60;
  extendDOD((uint64_t)v78, &v86, (float32x2_t)__PAIR64__(v68, v71), a3, a4, a5, a6);
  double result = *(double *)v86.i64;
  int64x2_t v62 = v87;
  *a2 = v86;
  a2[1] = v62;
  return result;
}

- (id)outputImage
{
  v70[4] = *MEMORY[0x1E4F143B8];
  if (!self->inputImage) {
    return 0;
  }
  [(NSNumber *)self->inputAngle doubleValue];
  double v4 = v3;
  [(CIImage *)self->inputImage extent];
  double x = v71.origin.x;
  double y = v71.origin.y;
  double width = v71.size.width;
  double height = v71.size.height;
  if (CGRectIsInfinite(v71))
  {
    double height = 1.79769313e308;
    double x = -8.98846567e307;
    double y = -8.98846567e307;
    double width = 1.79769313e308;
  }
  else
  {
    v72.origin.double x = x;
    v72.origin.double y = y;
    v72.size.double width = width;
    v72.size.double height = height;
    if (CGRectIsNull(v72))
    {
      double height = 0.0;
      double x = INFINITY;
      double y = INFINITY;
      double width = 0.0;
    }
  }
  [(CIVector *)self->inputPoint X];
  double v11 = v10;
  [(CIVector *)self->inputPoint Y];
  *(float *)&unsigned int v12 = v11;
  *(float *)&unsigned int v14 = v13;
  float v54 = *(float *)&v12;
  float v56 = *(float *)&v14;
  *(double *)&unint64_t v58 = COERCE_DOUBLE(__PAIR64__(v14, v12));
  __double2 v16 = __sincos_stret(v4);
  v17.f64[0] = v16.__sinval * v16.__sinval - v16.__cosval * v16.__cosval;
  v17.f64[1] = v16.__cosval * (v16.__sinval + v16.__sinval);
  *(float32x2_t *)&long long v18 = vcvt_f32_f64(v17);
  long long v19 = v18;
  DWORD2(v19) = DWORD1(v18);
  float v20 = v16.__cosval * v16.__cosval - v16.__sinval * v16.__sinval;
  float v59 = v20;
  long long v60 = v19;
  long long v44 = v18;
  if (x != -8.98846567e307
    || y != -8.98846567e307
    || width != 1.79769313e308
    || (double v21 = *(double *)&v58, height != 1.79769313e308))
  {
    *(float *)&double v21 = x + width * 0.5;
    float v22 = y + height * 0.5;
    *((float *)&v21 + 1) = v22;
  }
  float v23 = *((float *)&v21 + 1);
  double v24 = -v16.__sinval * (float)(v56 - *((float *)&v21 + 1)) + (float)(v54 - *(float *)&v21) * v16.__cosval;
  *(float *)&v15.__float sinval = v16.__cosval;
  float sinval = v16.__sinval;
  float v26 = -sinval;
  float v27 = v16.__sinval * v56 + (float)-v54 * v16.__cosval;
  float v51 = v26;
  float v52 = *(float *)&v15.__sinval;
  __double2 v28 = v15;
  *((float *)&v28.__sinval + 1) = v26;
  float v50 = v27;
  *(float *)&v28.__cosval = v27;
  if (v24 <= 0.0)
  {
    float v29 = v16.__cosval * (v24 * -2.0);
    float v30 = v29;
  }
  else
  {
    float v30 = 0.0;
  }
  double v31 = v16.__sinval * (v24 + v24);
  if (v24 > 0.0) {
    double v31 = 0.0;
  }
  *(float *)&unsigned int v32 = v31;
  double v33 = v24 + fabs(v24);
  *(float *)&unsigned int v34 = v16.__cosval * v33;
  *(float *)&unsigned int v35 = -(v33 * v16.__sinval);
  float v48 = *(float *)&v32;
  float v49 = v30;
  *(void *)&long long v36 = __PAIR64__(v32, LODWORD(v30));
  float v46 = *(float *)&v35;
  float v47 = *(float *)&v34;
  *((void *)&v36 + 1) = __PAIR64__(v35, v34);
  __double2 v55 = v28;
  double v57 = v21;
  long long v53 = v36;
  -[CIMirror computeDOD:tst:off:mtx:](self, "computeDOD:tst:off:mtx:", v21, v28.__sinval, v44);
  Rectangle::integralize(&v69, 0.0001, (uint64_t)&v68);
  Rectangle v69 = v68;
  id v37 = [(CIMirror *)self _kernel];
  long long v38 = v60;
  *((float *)&v38 + 3) = v59;
  double var1 = v69.var1;
  double var0 = v69.var0;
  double var3 = v69.var3;
  double var2 = v69.var2;
  if (v69.var0 == -8.98846567e307
    && v69.var1 == -8.98846567e307
    && v69.var2 == 1.79769313e308
    && v69.var3 == 1.79769313e308)
  {
    double var0 = *MEMORY[0x1E4F1DB10];
    double var1 = *(double *)(MEMORY[0x1E4F1DB10] + 8);
    double var2 = *(double *)(MEMORY[0x1E4F1DB10] + 16);
    double var3 = *(double *)(MEMORY[0x1E4F1DB10] + 24);
  }
  v61[0] = MEMORY[0x1E4F143A8];
  v61[1] = 3221225472;
  v61[2] = __23__CIMirror_outputImage__block_invoke;
  v61[3] = &__block_descriptor_104_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
  double v65 = v57;
  unint64_t v66 = v58;
  __double2 v62 = v55;
  long long v63 = v53;
  long long v64 = v38;
  double v67 = v4;
  inputImage = self->inputImage;
  v70[0] = +[CIVector vectorWithX:*(float *)&v57 Y:v23];
  v70[1] = +[CIVector vectorWithX:v52 Y:v51 Z:v50];
  v70[2] = +[CIVector vectorWithX:v49 Y:v48 Z:v47 W:v46];
  v70[3] = +[CIVector vectorWithX:*(float *)&v45 Y:*((float *)&v45 + 1) Z:*((float *)&v45 + 1) W:v59];
  return (id)objc_msgSend(v37, "applyWithExtent:roiCallback:inputImage:arguments:", v61, inputImage, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v70, 4), var0, var1, var2, var3);
}

void __23__CIMirror_outputImage__block_invoke(uint64_t a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  if (CGRectIsInfinite(*(CGRect *)&a2))
  {
    double v10 = -8.98846567e307;
    a4 = 1.79769313e308;
    a5 = 1.79769313e308;
    double v64 = -8.98846567e307;
  }
  else
  {
    v82.origin.double x = a2;
    v82.origin.double y = a3;
    v82.size.double width = a4;
    v82.size.double height = a5;
    BOOL IsNull = CGRectIsNull(v82);
    if (IsNull)
    {
      a4 = 0.0;
      a5 = 0.0;
      double v10 = INFINITY;
    }
    else
    {
      double v10 = a3;
    }
    if (IsNull) {
      double v12 = INFINITY;
    }
    else {
      double v12 = a2;
    }
    double v64 = v12;
  }
  float32x2_t v13 = *(float32x2_t *)(a1 + 80);
  uint64_t v62 = *(void *)(a1 + 88);
  int8x16_t v68 = *(int8x16_t *)(a1 + 48);
  __n128 v69 = *(__n128 *)(a1 + 32);
  int8x16_t v67 = *(int8x16_t *)(a1 + 64);
  long double v14 = *(double *)(a1 + 96);
  double v60 = cos(v14);
  double v15 = a5 + v10;
  double v57 = a4;
  double v56 = a5 + v10;
  if (fabs(v60) <= 0.001)
  {
    uint64_t v29 = 0;
    uint64_t v22 = 0x7FF0000000000000;
    uint64_t v28 = 0;
    uint64_t v23 = 0x7FF0000000000000;
  }
  else
  {
    double v54 = fmin(v10, v15);
    double v16 = tan(v14);
    double v17 = *(float *)&v62;
    v18.f64[0] = *(float *)&v62 + (v54 - *((float *)&v62 + 1)) * v16;
    double v19 = fmin(v64, a4 + v64);
    double v20 = fmax(v64, a4 + v64);
    if (v18.f64[0] < v19 || v18.f64[0] > v20)
    {
      uint64_t v29 = 0;
      uint64_t v26 = 0x7FF0000000000000;
      uint64_t v28 = 0;
      uint64_t v27 = 0x7FF0000000000000;
    }
    else
    {
      v18.f64[1] = v54;
      int64x2_t v77 = vdupq_n_s64(0x7FF0000000000000uLL);
      uint64_t v78 = 0;
      uint64_t v79 = 0;
      double v24 = v16;
      double v25 = v19;
      extendROI((uint64_t)&v77, &v80, vcvt_f32_f64(v18), v13, v69, v68, v67);
      double v19 = v25;
      double v17 = *(float *)&v62;
      double v16 = v24;
      uint64_t v27 = *((void *)&v80 + 1);
      uint64_t v26 = v80;
      uint64_t v29 = *((void *)&v81 + 1);
      uint64_t v28 = v81;
    }
    double v30 = fmax(v10, v15);
    v31.f64[0] = v17 + (v30 - *((float *)&v62 + 1)) * v16;
    if (v31.f64[0] < v19 || v31.f64[0] > v20)
    {
      uint64_t v22 = v27;
      uint64_t v23 = v26;
    }
    else
    {
      v31.f64[1] = v30;
      v76[0] = v26;
      v76[1] = v27;
      v76[2] = v28;
      v76[3] = v29;
      extendROI((uint64_t)v76, &v80, vcvt_f32_f64(v31), v13, v69, v68, v67);
      uint64_t v22 = *((void *)&v80 + 1);
      uint64_t v23 = v80;
      uint64_t v29 = *((void *)&v81 + 1);
      uint64_t v28 = v81;
    }
  }
  double v33 = sin(v14);
  double v34 = v64;
  double v35 = v57 + v64;
  double v36 = fmin(v64, v57 + v64);
  if (fabs(v33) <= 0.001)
  {
    double v40 = fmin(v10, v56);
    double v41 = fmax(v10, v56);
    double v65 = fmax(v64, v35);
  }
  else
  {
    float32x2_t v58 = v13;
    double v37 = *(float *)&v62;
    double v38 = *((float *)&v62 + 1);
    double v39 = (v36 - *(float *)&v62) * v60 / v33 + *((float *)&v62 + 1);
    double v40 = fmin(v10, v56);
    double v41 = fmax(v10, v56);
    BOOL v42 = v39 < v40 || v39 > v41;
    double v55 = v36;
    if (!v42)
    {
      v43.f64[0] = v36;
      v43.f64[1] = (v36 - *(float *)&v62) * v60 / v33 + *((float *)&v62 + 1);
      v75[0] = v23;
      v75[1] = v22;
      v75[2] = v28;
      v75[3] = v29;
      double v44 = v40;
      extendROI((uint64_t)v75, &v80, vcvt_f32_f64(v43), v58, v69, v68, v67);
      double v37 = *(float *)&v62;
      double v40 = v44;
      double v34 = v64;
      uint64_t v22 = *((void *)&v80 + 1);
      uint64_t v23 = v80;
      uint64_t v29 = *((void *)&v81 + 1);
      uint64_t v28 = v81;
    }
    double v45 = fmax(v34, v35);
    double v46 = (v45 - v37) * v60 / v33 + v38;
    BOOL v47 = v46 < v40 || v46 > v41;
    double v65 = v45;
    if (v47)
    {
      float32x2_t v13 = v58;
    }
    else
    {
      v48.f64[0] = v45;
      v48.f64[1] = (v45 - v37) * v60 / v33 + v38;
      v74[0] = v23;
      v74[1] = v22;
      v74[2] = v28;
      v74[3] = v29;
      float32x2_t v13 = v58;
      double v49 = v40;
      extendROI((uint64_t)v74, &v80, vcvt_f32_f64(v48), v58, v69, v68, v67);
      double v40 = v49;
      uint64_t v22 = *((void *)&v80 + 1);
      uint64_t v23 = v80;
      uint64_t v29 = *((void *)&v81 + 1);
      uint64_t v28 = v81;
    }
    double v36 = v55;
  }
  v50.f32[0] = v36;
  __int32 v59 = v50.i32[0];
  float32_t v51 = v40;
  __int32 v63 = LODWORD(v51);
  v50.f32[1] = v51;
  v73[0] = v23;
  v73[1] = v22;
  v73[2] = v28;
  v73[3] = v29;
  extendROI((uint64_t)v73, &v80, v50, v13, v69, v68, v67);
  *(float *)&unsigned int v52 = v41;
  unsigned int v61 = v52;
  v72[0] = v80;
  v72[1] = v81;
  extendROI((uint64_t)v72, &v80, (float32x2_t)__PAIR64__(v52, v59), v13, v69, v68, v67);
  v53.f32[0] = v65;
  __int32 v66 = v53.i32[0];
  v53.i32[1] = v63;
  v71[0] = v80;
  v71[1] = v81;
  extendROI((uint64_t)v71, &v80, v53, v13, v69, v68, v67);
  v70[0] = v80;
  v70[1] = v81;
  extendROI((uint64_t)v70, &v80, (float32x2_t)__PAIR64__(v61, v66), v13, v69, v68, v67);
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
}

- (CIVector)inputPoint
{
  return self->inputPoint;
}

- (void)setInputPoint:(id)a3
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