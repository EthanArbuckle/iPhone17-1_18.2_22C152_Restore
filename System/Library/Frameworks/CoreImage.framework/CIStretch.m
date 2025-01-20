@interface CIStretch
+ (id)customAttributes;
- (CIImage)inputImage;
- (CIVector)inputPoint;
- (CIVector)inputSize;
- (double)computeDOD:(uint64_t)a1;
- (id)_kernel;
- (id)outputImage;
- (void)setDefaults;
- (void)setInputImage:(id)a3;
- (void)setInputPoint:(id)a3;
- (void)setInputSize:(id)a3;
@end

@implementation CIStretch

+ (id)customAttributes
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v6[0] = @"CIAttributeFilterCategories";
  v5 = @"CICategoryApplePrivate";
  v7[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:&v5 count:1];
  v6[1] = @"inputPoint";
  v3[1] = @"CIAttributeType";
  v4[0] = +[CIVector vectorWithX:150.0, 150.0, @"CIAttributeDefault" Y];
  v4[1] = @"CIAttributeTypePosition";
  v7[1] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:2];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];
}

- (void)setDefaults
{
  v3 = +[CIVector vectorWithX:150.0 Y:150.0];

  [(CIStretch *)self setInputPoint:v3];
}

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_stretch];
}

- (double)computeDOD:(uint64_t)a1
{
  objc_msgSend(*(id *)(a1 + 80), "extent", *(void *)&a2);

  *(void *)&double result = (unint64_t)CGRectInset(*(CGRect *)&v2, (float)-v7, (float)-v7);
  return result;
}

- (id)outputImage
{
  v48[2] = *MEMORY[0x1E4F143B8];
  id result = self->inputImage;
  if (result)
  {
    if (self->inputSize)
    {
      [(CIVector *)self->inputSize X];
      long double v5 = v4;
      [(CIVector *)self->inputSize Y];
      long double v7 = v6;
    }
    else
    {
      [result extent];
      long double v5 = v8;
      long double v7 = v9;
    }
    float v10 = hypot(v5, v7);
    double v11 = v10;
    float v12 = v11 * 0.84 * 0.5;
    float v13 = v11 * 0.18 * 0.5;
    float v14 = v11 * 0.234 * 0.5;
    [(CIVector *)self->inputPoint X];
    double v16 = v15;
    [(CIVector *)self->inputPoint Y];
    v18 = +[CIVector vectorWithX:v16 Y:v17];
    v19 = +[CIVector vectorWithX:1.0 / v12 Y:v13 Z:1.0 / v14];
    [(CIVector *)v18 X];
    float64_t v41 = v20;
    [(CIVector *)v18 Y];
    v21.f64[0] = v41;
    v21.f64[1] = v22;
    float32x2_t v23 = vcvt_f32_f64(v21);
    [(CIVector *)v19 X];
    float64_t v42 = v24;
    [(CIVector *)v19 Y];
    v25.f64[0] = v42;
    v25.f64[1] = v26;
    int32x2_t v43 = (int32x2_t)vcvt_f32_f64(v25);
    [(CIVector *)v19 Z];
    float64_t v40 = v27;
    [(CIVector *)v19 W];
    v28.f64[0] = v40;
    v28.f64[1] = v29;
    float32x4_t v44 = vcvt_hight_f32_f64(v43, v28);
    -[CIStretch computeDOD:](self, "computeDOD:");
    double v31 = v30;
    double v33 = v32;
    double v35 = v34;
    double v37 = v36;
    id v38 = [(CIStretch *)self _kernel];
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __24__CIStretch_outputImage__block_invoke;
    v45[3] = &__block_descriptor_56_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
    float32x2_t v47 = v23;
    float32x4_t v46 = v44;
    inputImage = self->inputImage;
    v48[0] = v18;
    v48[1] = v19;
    return (id)objc_msgSend(v38, "applyWithExtent:roiCallback:inputImage:arguments:", v45, inputImage, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v48, 2), v31, v33, v35, v37);
  }
  return result;
}

double __24__CIStretch_outputImage__block_invoke(float32x4_t *a1, simd_float4 a2, double a3, __n128 a4, double a5)
{
  double v52 = *(double *)a2.i64;
  double v53 = a4.n128_f64[0];
  a4.n128_u64[0] = a1[3].u64[0];
  __n128 v57 = a4;
  CGFloat v6 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  CGFloat r1 = *MEMORY[0x1E4F1DB20];
  CGFloat v7 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  CGFloat v8 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  v9.f32[0] = *(double *)a2.i64;
  __int32 v54 = v9.i32[0];
  a2.f32[0] = a3;
  unsigned __int32 r1_24 = a2.i32[0];
  v9.i32[1] = a2.i32[0];
  float32x4_t v58 = a1[2];
  __asm { FMOV            V12.2S, #1.0 }
  *(float32x2_t *)a2.f32 = vsub_f32(_D12, vminnm_f32(vmaxnm_f32(vmul_n_f32(vabd_f32(v9, (float32x2_t)a4.n128_u64[0]), v58.f32[0]), 0), _D12));
  __asm { FMOV            V13.2S, #3.0 }
  float32x2_t v16 = vmul_f32(*(float32x2_t *)a2.f32, vmul_f32(*(float32x2_t *)a2.f32, vsub_f32(_D13, vadd_f32(*(float32x2_t *)a2.f32, *(float32x2_t *)a2.f32))));
  float32x2_t v17 = (float32x2_t)vdup_lane_s32((int32x2_t)a4.n128_u64[0], 1);
  *(float32x2_t *)a2.f32 = vmul_laneq_f32(vsub_f32(v9, v17), v58, 2);
  float32x2_t v18 = vsub_f32(v9, vmul_f32(vmul_lane_f32((float32x2_t)*(_OWORD *)&_simd_sin_f4(a2), *(float32x2_t *)v58.f32, 1), v16));
  v66.origin.CGFloat x = v18.f32[0];
  v66.origin.CGFloat y = v18.f32[1];
  v66.size.CGFloat width = 0.0;
  v66.size.CGFloat height = 0.0;
  v60.origin.CGFloat x = r1;
  v60.origin.CGFloat y = v6;
  v60.size.CGFloat width = v7;
  v60.size.CGFloat height = v8;
  CGRect v61 = CGRectUnion(v60, v66);
  CGFloat x = v61.origin.x;
  CGFloat y = v61.origin.y;
  CGFloat width = v61.size.width;
  CGFloat height = v61.size.height;
  *(float *)&v61.origin.CGFloat x = a3 + a5;
  LODWORD(a5) = LODWORD(v61.origin.x);
  unint64_t v23 = v57.n128_u64[1];
  float32x2_t v55 = (float32x2_t)__PAIR64__(LODWORD(v61.origin.x), v54);
  *(float32x2_t *)&v61.origin.CGFloat x = vsub_f32(_D12, vminnm_f32(vmaxnm_f32(vmul_n_f32(vabd_f32(v55, (float32x2_t)v57.n128_u64[0]), v58.f32[0]), 0), _D12));
  float32x2_t v24 = vmul_f32(*(float32x2_t *)&v61.origin.x, vmul_f32(*(float32x2_t *)&v61.origin.x, vsub_f32(_D13, vadd_f32(*(float32x2_t *)&v61.origin.x, *(float32x2_t *)&v61.origin.x))));
  *(float32x2_t *)&v61.origin.CGFloat x = vmul_laneq_f32(vsub_f32(v55, v17), v58, 2);
  float32x2_t v25 = vsub_f32(v55, vmul_f32(vmul_lane_f32((float32x2_t)*(_OWORD *)&_simd_sin_f4((simd_float4)v61.origin), *(float32x2_t *)v58.f32, 1), v24));
  v67.origin.CGFloat x = v25.f32[0];
  v67.origin.CGFloat y = v25.f32[1];
  v67.size.CGFloat width = 0.0;
  v67.size.CGFloat height = 0.0;
  v62.origin.CGFloat x = x;
  v62.origin.CGFloat y = y;
  v62.size.CGFloat width = width;
  v62.size.CGFloat height = height;
  CGRect v63 = CGRectUnion(v62, v67);
  CGFloat v26 = v63.origin.x;
  CGFloat v27 = v63.origin.y;
  CGFloat v28 = v63.size.width;
  CGFloat v29 = v63.size.height;
  *(float *)&v63.origin.CGFloat x = v52 + v53;
  v55.i32[0] = LODWORD(v63.origin.x);
  *(void *)&v63.origin.CGFloat y = __PAIR64__(r1_24, LODWORD(v63.origin.x));
  unint64_t v30 = v57.n128_u64[1];
  *(float32x2_t *)&v63.origin.CGFloat x = vsub_f32(_D12, vminnm_f32(vmaxnm_f32(vmul_n_f32(vabd_f32((float32x2_t)__PAIR64__(r1_24, LODWORD(v63.origin.x)), (float32x2_t)v57.n128_u64[0]), v58.f32[0]), 0), _D12));
  float32x2_t v31 = vmul_f32(*(float32x2_t *)&v63.origin.x, vmul_f32(*(float32x2_t *)&v63.origin.x, vsub_f32(_D13, vadd_f32(*(float32x2_t *)&v63.origin.x, *(float32x2_t *)&v63.origin.x))));
  *(float32x2_t *)&v63.origin.CGFloat x = vmul_laneq_f32(vsub_f32(*(float32x2_t *)&v63.origin.y, v17), v58, 2);
  float32x2_t v32 = vsub_f32(*(float32x2_t *)&v63.origin.y, vmul_f32(vmul_lane_f32((float32x2_t)*(_OWORD *)&_simd_sin_f4((simd_float4)v63.origin), *(float32x2_t *)v58.f32, 1), v31));
  v68.origin.CGFloat x = v32.f32[0];
  v68.origin.CGFloat y = v32.f32[1];
  v68.size.CGFloat width = 0.0;
  v68.size.CGFloat height = 0.0;
  v64.origin.CGFloat x = v26;
  v64.origin.CGFloat y = v27;
  v64.size.CGFloat width = v28;
  v64.size.CGFloat height = v29;
  CGRect v65 = CGRectUnion(v64, v68);
  CGFloat v33 = v65.origin.x;
  CGFloat v34 = v65.origin.y;
  CGFloat v35 = v65.size.width;
  CGFloat v36 = v65.size.height;
  unint64_t v37 = v57.n128_u64[1];
  float32x2_t v56 = (float32x2_t)__PAIR64__(LODWORD(a5), v55.u32[0]);
  *(float32x2_t *)&v65.origin.CGFloat x = vsub_f32(_D12, vminnm_f32(vmaxnm_f32(vmul_n_f32(vabd_f32(v56, (float32x2_t)v57.n128_u64[0]), v58.f32[0]), 0), _D12));
  float32x2_t v38 = vmul_f32(*(float32x2_t *)&v65.origin.x, vmul_f32(*(float32x2_t *)&v65.origin.x, vsub_f32(_D13, vadd_f32(*(float32x2_t *)&v65.origin.x, *(float32x2_t *)&v65.origin.x))));
  *(float32x2_t *)&v65.origin.CGFloat x = vmul_laneq_f32(vsub_f32(v56, v17), v58, 2);
  float32x2_t v39 = vsub_f32(v56, vmul_f32(vmul_lane_f32((float32x2_t)*(_OWORD *)&_simd_sin_f4((simd_float4)v65.origin), *(float32x2_t *)v58.f32, 1), v38));
  double v40 = v39.f32[0];
  double v41 = v39.f32[1];
  uint64_t v42 = 0;
  uint64_t v43 = 0;
  CGFloat v44 = v33;
  CGFloat v45 = v34;
  CGFloat v46 = v35;
  CGFloat v47 = v36;

  *(void *)&double result = (unint64_t)CGRectUnion(*(CGRect *)&v44, *(CGRect *)&v40);
  return result;
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

- (CIVector)inputSize
{
  return self->inputSize;
}

- (void)setInputSize:(id)a3
{
}

@end