@interface CIFourfoldRotatedTile
- (id)_kernel;
- (id)outputImage;
@end

@implementation CIFourfoldRotatedTile

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_fourfoldRotatedTile];
}

- (id)outputImage
{
  v46[3] = *MEMORY[0x1E4F143B8];
  if (!self->super.inputImage || !self->super.inputCenter) {
    return 0;
  }
  [(NSNumber *)self->super.inputWidth doubleValue];
  double v39 = v3;
  [(NSNumber *)self->super.inputAngle doubleValue];
  double v5 = v4;
  [(CIVector *)self->super.inputCenter X];
  double v7 = v6;
  [(CIVector *)self->super.inputCenter Y];
  double v9 = v8;
  __double2 v11 = __sincos_stret(v5);
  v10.f64[0] = v11.__cosval;
  v10.f64[1] = v11.__sinval;
  float64x2_t v12 = vmulq_n_f64(v10, v39);
  double v13 = -(v11.__sinval * v39);
  float64x2_t v43 = v12;
  double v44 = v13;
  double v45 = v12.f64[0];
  if (fabs(vmlad_n_f64(-(v12.f64[1] * v13), v12.f64[0], v12.f64[0])) < 0.01) {
    return [(CITileFilter *)self _croppedCenterPixelImage];
  }
  *(float *)&double v15 = v7;
  float32_t v16 = v9;
  float v38 = *(float *)&v15;
  float v40 = v16;
  *((float32_t *)&v15 + 1) = v16;
  float64x2_t v17 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v12.f64[0], 0);
  v17.f64[0] = v13;
  *(float32x2_t *)&v17.f64[0] = vadd_f32(*(float32x2_t *)&v15, vcvt_f32_f64(vaddq_f64(v12, vmulq_f64(v17, (float64x2_t)0))));
  v18.f32[0] = v13 + v12.f64[0] * 0.0;
  float32_t v19 = v12.f64[0] + v12.f64[1] * 0.0;
  v18.f32[1] = v19;
  v20.f32[0] = v12.f64[0] + v13;
  float32_t v21 = v12.f64[1] + v12.f64[0];
  v20.f32[1] = v21;
  roiForPoints(v15, v17.f64[0], COERCE_DOUBLE(vadd_f32(v18, *(float32x2_t *)&v15)), COERCE_DOUBLE(vadd_f32(v20, *(float32x2_t *)&v15)));
  uint64_t v23 = v22;
  uint64_t v25 = v24;
  uint64_t v27 = v26;
  uint64_t v29 = v28;
  affine::inverse((affine *)&v43, v42);
  v30 = +[CIVector vectorWithX:v42[0] Y:v42[2] Z:v42[1] W:v42[3]];
  v31 = +[CIVector vectorWithX:v43.f64[0] Y:v44 Z:v43.f64[1] W:v45];
  id v32 = [(CIFourfoldRotatedTile *)self _kernel];
  double v33 = *MEMORY[0x1E4F1DB10];
  double v34 = *(double *)(MEMORY[0x1E4F1DB10] + 8);
  double v35 = *(double *)(MEMORY[0x1E4F1DB10] + 16);
  double v36 = *(double *)(MEMORY[0x1E4F1DB10] + 24);
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __36__CIFourfoldRotatedTile_outputImage__block_invoke;
  v41[3] = &__block_descriptor_64_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
  v41[4] = v23;
  v41[5] = v25;
  v41[6] = v27;
  v41[7] = v29;
  inputImage = self->super.inputImage;
  v46[0] = +[CIVector vectorWithX:v38 Y:v40];
  v46[1] = v30;
  v46[2] = v31;
  return (id)objc_msgSend(v32, "applyWithExtent:roiCallback:inputImage:arguments:", v41, inputImage, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v46, 3), v33, v34, v35, v36);
}

double __36__CIFourfoldRotatedTile_outputImage__block_invoke(uint64_t a1)
{
  return *(double *)(a1 + 32);
}

@end