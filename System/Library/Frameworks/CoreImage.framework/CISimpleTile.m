@interface CISimpleTile
+ (id)customAttributes;
- (CIImage)inputImage;
- (id)_kernel;
- (id)outputImage;
- (void)setInputImage:(id)a3;
@end

@implementation CISimpleTile

+ (id)customAttributes
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v4 = @"CIAttributeFilterCategories";
  v3[0] = @"CICategoryTileEffect";
  v3[1] = @"CICategoryVideo";
  v3[2] = @"CICategoryStillImage";
  v3[3] = @"CICategoryBuiltIn";
  v3[4] = @"CICategoryApplePrivate";
  v5[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:5];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
}

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_tile];
}

- (id)outputImage
{
  v38[2] = *MEMORY[0x1E4F143B8];
  id result = self->inputImage;
  if (result)
  {
    [result extent];
    double width = v40.size.width;
    double height = v40.size.height;
    double x = v40.origin.x;
    double y = v40.origin.y;
    BOOL IsInfinite = CGRectIsInfinite(v40);
    inputImage = self->inputImage;
    if (IsInfinite)
    {
      v8 = inputImage;
      return v8;
    }
    else
    {
      uint64_t v9 = [(CIImage *)inputImage imageByClampingToExtent];
      v10 = +[CIVector vectorWithCGPoint:](CIVector, "vectorWithCGPoint:", x, y);
      v11 = +[CIVector vectorWithX:width Y:height Z:1.0 / width W:1.0 / height];
      v12.f64[0] = x;
      v12.f64[1] = y;
      float32x2_t v13 = vcvt_f32_f64(v12);
      [(CIVector *)v11 X];
      float64_t v26 = v14;
      [(CIVector *)v11 Y];
      v15.f64[0] = v26;
      v15.f64[1] = v16;
      int32x2_t v27 = (int32x2_t)vcvt_f32_f64(v15);
      [(CIVector *)v11 Z];
      float64_t v25 = v17;
      [(CIVector *)v11 W];
      v18.f64[0] = v25;
      v18.f64[1] = v19;
      float32x4_t v28 = vcvt_hight_f32_f64(v27, v18);
      id v20 = [(CISimpleTile *)self _kernel];
      double v21 = *MEMORY[0x1E4F1DB10];
      double v22 = *(double *)(MEMORY[0x1E4F1DB10] + 8);
      double v23 = *(double *)(MEMORY[0x1E4F1DB10] + 16);
      double v24 = *(double *)(MEMORY[0x1E4F1DB10] + 24);
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __27__CISimpleTile_outputImage__block_invoke;
      v31[3] = &__block_descriptor_88_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
      double v33 = x;
      double v34 = y;
      double v35 = width;
      double v36 = height;
      float32x2_t v37 = v13;
      float32x4_t v32 = v28;
      v38[0] = v10;
      v38[1] = v11;
      return (id)objc_msgSend(v20, "applyWithExtent:roiCallback:inputImage:arguments:", v31, v9, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v38, 2), v21, v22, v23, v24);
    }
  }
  return result;
}

double __27__CISimpleTile_outputImage__block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  double v5 = *(double *)(a1 + 48);
  double v6 = *(double *)(a1 + 56);
  float32x2_t v7 = *(float32x2_t *)(a1 + 80);
  int8x16_t v16 = *(int8x16_t *)(a1 + 32);
  CGRect v17 = CGRectStandardize(*(CGRect *)&a2);
  v17.size.double width = v17.origin.x + v17.size.width;
  CGFloat y = v17.origin.y;
  *(float32x2_t *)&v17.origin.double x = vcvt_f32_f64((float64x2_t)v17.origin);
  v9.f32[0] = v5;
  float32_t v10 = v6;
  v9.f32[1] = v10;
  float32x2_t v11 = (float32x2_t)vextq_s8(v16, v16, 8uLL).u64[0];
  float32x2_t v12 = vrndm_f32(vmul_f32(v11, vsub_f32(*(float32x2_t *)&v17.origin.x, v9)));
  *(float *)&v17.size.double width = v17.size.width;
  *(float *)&v17.origin.CGFloat y = v17.origin.y + v17.size.height;
  HIDWORD(v17.size.width) = LODWORD(v17.origin.y);
  *(float32x2_t *)&v17.size.double height = vrndm_f32(vmul_f32(v11, vsub_f32(*(float32x2_t *)&v17.size.width, v9)));
  *(float32x2_t *)&v17.origin.double x = vmul_f32(v11, vsub_f32(*(float32x2_t *)&v17.origin.x, v7));
  *(int32x2_t *)&v17.origin.CGFloat y = vdup_n_s32(0x3F7FFFFFu);
  LODWORD(v13) = vadd_f32(vadd_f32(v7, vmul_f32(*(float32x2_t *)v16.i8, vminnm_f32(vsub_f32(*(float32x2_t *)&v17.origin.x, vrndm_f32(*(float32x2_t *)&v17.origin.x)), *(float32x2_t *)&v17.origin.y))), (float32x2_t)0x3F0000003F000000).u32[0];
  *(float32x2_t *)&v17.size.double width = vmul_f32(v11, vsub_f32(*(float32x2_t *)&v17.size.width, v7));
  LODWORD(v14) = vadd_f32(vadd_f32(v7, vmul_f32(*(float32x2_t *)v16.i8, vminnm_f32(vsub_f32(*(float32x2_t *)&v17.size.width, vrndm_f32(*(float32x2_t *)&v17.size.width)), *(float32x2_t *)&v17.origin.y))), (float32x2_t)0x3F0000003F000000).u32[0];
  if (vceq_f32(v12, *(float32x2_t *)&v17.size.height).u8[0]) {
    return fminf(v13, v14);
  }
  return v5;
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
}

@end