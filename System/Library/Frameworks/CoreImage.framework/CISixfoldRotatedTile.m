@interface CISixfoldRotatedTile
- (id)_kernel;
- (id)outputImage;
@end

@implementation CISixfoldRotatedTile

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_sixfoldRotatedTile];
}

- (id)outputImage
{
  v50[3] = *MEMORY[0x1E4F143B8];
  if (!self->super.inputImage || !self->super.inputCenter) {
    return 0;
  }
  [(NSNumber *)self->super.inputWidth doubleValue];
  double v4 = v3;
  [(NSNumber *)self->super.inputAngle doubleValue];
  double v6 = v5;
  [(CIVector *)self->super.inputCenter X];
  double v8 = v7;
  [(CIVector *)self->super.inputCenter Y];
  double v10 = v9;
  __double2 v11 = __sincos_stret(v6 + -0.523598776);
  __double2 v12 = __sincos_stret(v6 + 0.523598776);
  double v46 = v4 * v11.__cosval;
  double v47 = v4 * v11.__sinval;
  double v48 = v4 * v12.__cosval;
  double v49 = v4 * v12.__sinval;
  if (fabs(v4 * v11.__cosval * (v4 * v12.__sinval) - v4 * v11.__sinval * (v4 * v12.__cosval)) < 0.01) {
    return [(CITileFilter *)self _croppedCenterPixelImage];
  }
  *(float *)&double v14 = v8;
  float v15 = v10;
  float v40 = *(float *)&v14;
  float v41 = v15;
  *((float *)&v14 + 1) = v15;
  double v43 = v14;
  float v16 = v6 + -0.523598776;
  __float2 v17 = __sincosf_stret(v16);
  float v18 = v4;
  float v42 = v18;
  double v19 = COERCE_DOUBLE(vadd_f32(*(float32x2_t *)&v43, vmul_f32(vmul_n_f32((float32x2_t)__PAIR64__(LODWORD(v17.__sinval), LODWORD(v17.__cosval)), v18), (float32x2_t)0x3F0000003F000000)));
  float v20 = v6 + 0.523598776;
  __float2 v21 = __sincosf_stret(v20);
  float v22 = v6;
  __float2 v23 = __sincosf_stret(v22);
  roiForPoints(v43, v19, COERCE_DOUBLE(vadd_f32(*(float32x2_t *)&v43, vmul_f32(vmul_n_f32((float32x2_t)__PAIR64__(LODWORD(v21.__sinval), LODWORD(v21.__cosval)), v42), (float32x2_t)0x3F0000003F000000))), COERCE_DOUBLE(vadd_f32(vdiv_f32(vmul_n_f32((float32x2_t)__PAIR64__(LODWORD(v23.__sinval), LODWORD(v23.__cosval)), v42), (float32x2_t)vdup_n_s32(0x3FDDB3D7u)), *(float32x2_t *)&v43)));
  uint64_t v25 = v24;
  uint64_t v27 = v26;
  uint64_t v29 = v28;
  uint64_t v31 = v30;
  affine::inverse((affine *)&v46, v45);
  v32 = +[CIVector vectorWithX:v45[0] Y:v45[2] Z:v45[1] W:v45[3]];
  v33 = +[CIVector vectorWithX:v46 Y:v48 Z:v47 W:v49];
  id v34 = [(CISixfoldRotatedTile *)self _kernel];
  double v35 = *MEMORY[0x1E4F1DB10];
  double v36 = *(double *)(MEMORY[0x1E4F1DB10] + 8);
  double v37 = *(double *)(MEMORY[0x1E4F1DB10] + 16);
  double v38 = *(double *)(MEMORY[0x1E4F1DB10] + 24);
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __35__CISixfoldRotatedTile_outputImage__block_invoke;
  v44[3] = &__block_descriptor_64_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
  v44[4] = v25;
  v44[5] = v27;
  v44[6] = v29;
  v44[7] = v31;
  inputImage = self->super.inputImage;
  v50[0] = +[CIVector vectorWithX:v40 Y:v41];
  v50[1] = v32;
  v50[2] = v33;
  return (id)objc_msgSend(v34, "applyWithExtent:roiCallback:inputImage:arguments:", v44, inputImage, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v50, 3), v35, v36, v37, v38);
}

double __35__CISixfoldRotatedTile_outputImage__block_invoke(uint64_t a1)
{
  return *(double *)(a1 + 32);
}

@end