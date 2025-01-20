@interface CITwelvefoldReflectedTile
- (id)_kernel;
- (id)outputImage;
@end

@implementation CITwelvefoldReflectedTile

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_twelvefoldReflectedTile];
}

- (id)outputImage
{
  v48[3] = *MEMORY[0x1E4F143B8];
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
  double v44 = v4 * v11.__cosval;
  double v45 = v4 * v11.__sinval;
  double v46 = v4 * v12.__cosval;
  double v47 = v4 * v12.__sinval;
  if (fabs(v4 * v11.__cosval * (v4 * v12.__sinval) - v4 * v11.__sinval * (v4 * v12.__cosval)) < 0.01) {
    return [(CITileFilter *)self _croppedCenterPixelImage];
  }
  *(float *)&double v14 = v8;
  float v15 = v10;
  float v38 = *(float *)&v14;
  float v39 = v15;
  *((float *)&v14 + 1) = v15;
  double v41 = v14;
  float v16 = v6 + 0.523598776;
  __float2 v17 = __sincosf_stret(v16);
  float v18 = v4;
  float v40 = v18;
  double v19 = COERCE_DOUBLE(vadd_f32(*(float32x2_t *)&v41, vmul_f32(vmul_n_f32((float32x2_t)__PAIR64__(LODWORD(v17.__sinval), LODWORD(v17.__cosval)), v18), (float32x2_t)0x3F0000003F000000)));
  float v20 = v6;
  __float2 v21 = __sincosf_stret(v20);
  roiForPoints(v41, v19, COERCE_DOUBLE(vadd_f32(vdiv_f32(vmul_n_f32((float32x2_t)__PAIR64__(LODWORD(v21.__sinval), LODWORD(v21.__cosval)), v40), (float32x2_t)vdup_n_s32(0x3FDDB3D7u)), *(float32x2_t *)&v41)));
  uint64_t v23 = v22;
  uint64_t v25 = v24;
  uint64_t v27 = v26;
  uint64_t v29 = v28;
  affine::inverse((affine *)&v44, v43);
  v30 = +[CIVector vectorWithX:v43[0] Y:v43[2] Z:v43[1] W:v43[3]];
  v31 = +[CIVector vectorWithX:v44 Y:v46 Z:v45 W:v47];
  id v32 = [(CITwelvefoldReflectedTile *)self _kernel];
  double v33 = *MEMORY[0x1E4F1DB10];
  double v34 = *(double *)(MEMORY[0x1E4F1DB10] + 8);
  double v35 = *(double *)(MEMORY[0x1E4F1DB10] + 16);
  double v36 = *(double *)(MEMORY[0x1E4F1DB10] + 24);
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __40__CITwelvefoldReflectedTile_outputImage__block_invoke;
  v42[3] = &__block_descriptor_64_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
  v42[4] = v23;
  v42[5] = v25;
  v42[6] = v27;
  v42[7] = v29;
  inputImage = self->super.inputImage;
  v48[0] = +[CIVector vectorWithX:v38 Y:v39];
  v48[1] = v30;
  v48[2] = v31;
  return (id)objc_msgSend(v32, "applyWithExtent:roiCallback:inputImage:arguments:", v42, inputImage, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v48, 3), v33, v34, v35, v36);
}

double __40__CITwelvefoldReflectedTile_outputImage__block_invoke(uint64_t a1)
{
  return *(double *)(a1 + 32);
}

@end