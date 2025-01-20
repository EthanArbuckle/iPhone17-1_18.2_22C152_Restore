@interface CIGlideReflectedTile
- (id)_kernel;
- (id)outputImage;
@end

@implementation CIGlideReflectedTile

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_glideReflectedTile];
}

- (id)outputImage
{
  v47[3] = *MEMORY[0x1E4F143B8];
  if (!self->super.inputImage || !self->super.inputCenter) {
    return 0;
  }
  [(NSNumber *)self->super.inputWidth doubleValue];
  double v40 = v3;
  [(NSNumber *)self->super.inputAngle doubleValue];
  double v5 = v4;
  [(CIVector *)self->super.inputCenter X];
  double v7 = v6;
  [(CIVector *)self->super.inputCenter Y];
  double v9 = v8;
  __double2 v11 = __sincos_stret(v5);
  v10.f64[0] = v11.__cosval;
  v10.f64[1] = v11.__sinval;
  float64x2_t v12 = vmulq_n_f64(v10, v40);
  double v13 = -(v11.__sinval * v40);
  float64x2_t v44 = v12;
  double v45 = v13;
  double v46 = v12.f64[0];
  if (fabs(vmlad_n_f64(-(v12.f64[1] * v13), v12.f64[0], v12.f64[0])) < 0.01) {
    return [(CITileFilter *)self _croppedCenterPixelImage];
  }
  *(float *)&double v15 = v7;
  float32_t v16 = v9;
  float v39 = *(float *)&v15;
  float v41 = v16;
  *((float32_t *)&v15 + 1) = v16;
  float64x2_t v17 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v12.f64[0], 0);
  v17.f64[0] = v13;
  *(float32x2_t *)&v17.f64[0] = vadd_f32(*(float32x2_t *)&v15, vcvt_f32_f64(vaddq_f64(v12, vmulq_f64(v17, (float64x2_t)0))));
  double v18 = v13 + v13;
  v19.f32[0] = v13 + v13 + v12.f64[0] * 0.0;
  float64_t v20 = v12.f64[0] + v12.f64[0];
  float32_t v21 = v12.f64[0] + v12.f64[0] + v12.f64[1] * 0.0;
  v19.f32[1] = v21;
  *(float *)v12.f64 = v12.f64[0] + v18;
  float v22 = v12.f64[1] + v20;
  *((float *)v12.f64 + 1) = v22;
  roiForPoints(v15, v17.f64[0], COERCE_DOUBLE(vadd_f32(*(float32x2_t *)&v15, v19)), COERCE_DOUBLE(vadd_f32(*(float32x2_t *)&v15, *(float32x2_t *)&v12.f64[0])));
  uint64_t v24 = v23;
  uint64_t v26 = v25;
  uint64_t v28 = v27;
  uint64_t v30 = v29;
  affine::inverse((affine *)&v44, v43);
  v31 = +[CIVector vectorWithX:v43[0] Y:v43[2] Z:v43[1] W:v43[3]];
  v32 = +[CIVector vectorWithX:v44.f64[0] Y:v45 Z:v44.f64[1] W:v46];
  id v33 = [(CIGlideReflectedTile *)self _kernel];
  double v34 = *MEMORY[0x1E4F1DB10];
  double v35 = *(double *)(MEMORY[0x1E4F1DB10] + 8);
  double v36 = *(double *)(MEMORY[0x1E4F1DB10] + 16);
  double v37 = *(double *)(MEMORY[0x1E4F1DB10] + 24);
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __35__CIGlideReflectedTile_outputImage__block_invoke;
  v42[3] = &__block_descriptor_64_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
  v42[4] = v24;
  v42[5] = v26;
  v42[6] = v28;
  v42[7] = v30;
  inputImage = self->super.inputImage;
  v47[0] = +[CIVector vectorWithX:v39 Y:v41];
  v47[1] = v31;
  v47[2] = v32;
  return (id)objc_msgSend(v33, "applyWithExtent:roiCallback:inputImage:arguments:", v42, inputImage, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v47, 3), v34, v35, v36, v37);
}

double __35__CIGlideReflectedTile_outputImage__block_invoke(uint64_t a1)
{
  return *(double *)(a1 + 32);
}

@end