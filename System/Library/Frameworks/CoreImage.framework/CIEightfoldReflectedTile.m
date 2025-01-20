@interface CIEightfoldReflectedTile
- (id)_kernel;
- (id)outputImage;
@end

@implementation CIEightfoldReflectedTile

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_eightfoldReflectedTile];
}

- (id)outputImage
{
  v47[3] = *MEMORY[0x1E4F143B8];
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
  __double2 v11 = __sincos_stret(v6);
  double v43 = v4 * v11.__cosval;
  double v44 = v4 * v11.__sinval;
  double v45 = -(v11.__sinval * v4);
  double v46 = v4 * v11.__cosval;
  if (fabs(v43 * v43 - v4 * v11.__sinval * v45) < 0.01) {
    return [(CITileFilter *)self _croppedCenterPixelImage];
  }
  *(float *)&double v13 = v8;
  float v14 = v10;
  float v37 = *(float *)&v13;
  float v38 = v14;
  *((float *)&v13 + 1) = v14;
  double v40 = v13;
  float v15 = v6;
  __float2 v16 = __sincosf_stret(v15);
  float v17 = v4;
  float v39 = v17;
  double v18 = COERCE_DOUBLE(vadd_f32(vmul_f32(vmul_n_f32((float32x2_t)__PAIR64__(LODWORD(v16.__sinval), LODWORD(v16.__cosval)), v17), (float32x2_t)0x3F0000003F000000), *(float32x2_t *)&v40));
  float v19 = v6 + 0.785398163;
  __float2 v20 = __sincosf_stret(v19);
  roiForPoints(v40, v18, COERCE_DOUBLE(vadd_f32(*(float32x2_t *)&v40, vdiv_f32(vmul_n_f32((float32x2_t)__PAIR64__(LODWORD(v20.__sinval), LODWORD(v20.__cosval)), v39), (float32x2_t)vdup_n_s32(0x3FB504F3u)))));
  uint64_t v22 = v21;
  uint64_t v24 = v23;
  uint64_t v26 = v25;
  uint64_t v28 = v27;
  affine::inverse((affine *)&v43, v42);
  v29 = +[CIVector vectorWithX:v42[0] Y:v42[2] Z:v42[1] W:v42[3]];
  v30 = +[CIVector vectorWithX:v43 Y:v45 Z:v44 W:v46];
  id v31 = [(CIEightfoldReflectedTile *)self _kernel];
  double v32 = *MEMORY[0x1E4F1DB10];
  double v33 = *(double *)(MEMORY[0x1E4F1DB10] + 8);
  double v34 = *(double *)(MEMORY[0x1E4F1DB10] + 16);
  double v35 = *(double *)(MEMORY[0x1E4F1DB10] + 24);
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __39__CIEightfoldReflectedTile_outputImage__block_invoke;
  v41[3] = &__block_descriptor_64_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
  v41[4] = v22;
  v41[5] = v24;
  v41[6] = v26;
  v41[7] = v28;
  inputImage = self->super.inputImage;
  v47[0] = +[CIVector vectorWithX:v37 Y:v38];
  v47[1] = v29;
  v47[2] = v30;
  return (id)objc_msgSend(v31, "applyWithExtent:roiCallback:inputImage:arguments:", v41, inputImage, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v47, 3), v32, v33, v34, v35);
}

double __39__CIEightfoldReflectedTile_outputImage__block_invoke(uint64_t a1)
{
  return *(double *)(a1 + 32);
}

@end