@interface CIFourfoldReflectedTile
- (id)_kernel;
- (id)outputImage;
@end

@implementation CIFourfoldReflectedTile

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_fourfoldReflectedTile];
}

- (id)outputImage
{
  v52[3] = *MEMORY[0x1E4F143B8];
  if (!self->super.super.inputImage || !self->super.super.inputCenter) {
    return 0;
  }
  [(NSNumber *)self->super.super.inputWidth doubleValue];
  double v4 = v3;
  [(NSNumber *)self->super.super.inputAngle doubleValue];
  double v6 = v5;
  [(NSNumber *)self->super.inputAcuteAngle doubleValue];
  double v8 = v7;
  [(CIVector *)self->super.super.inputCenter X];
  double v10 = v9;
  [(CIVector *)self->super.super.inputCenter Y];
  double v12 = v11;
  __double2 v13 = __sincos_stret(v6);
  __double2 v14 = __sincos_stret(v6 + v8);
  double v15 = v4 * v13.__cosval;
  double v16 = v4 * v13.__sinval;
  double v17 = v4 * v14.__cosval;
  double v18 = v4 * v14.__sinval;
  double v48 = v4 * v13.__cosval;
  double v49 = v4 * v13.__sinval;
  double v50 = v4 * v14.__cosval;
  double v51 = v4 * v14.__sinval;
  if (fabs(v4 * v13.__cosval * (v4 * v14.__sinval) - v4 * v13.__sinval * (v4 * v14.__cosval)) < 0.01) {
    return [(CITileFilter *)self _croppedCenterPixelImage];
  }
  *(float *)&double v20 = v10;
  float v21 = v12;
  float v44 = *(float *)&v20;
  float v45 = v21;
  *((float *)&v20 + 1) = v21;
  v22.f32[0] = v15 + v17 * 0.0;
  float32_t v23 = v16 + v18 * 0.0;
  v22.f32[1] = v23;
  v24.f32[0] = v17 + v15 * 0.0;
  float32_t v25 = v18 + v16 * 0.0;
  v24.f32[1] = v25;
  v26.f32[0] = v15 + v17;
  float32_t v27 = v16 + v18;
  v26.f32[1] = v27;
  roiForPoints(v20, COERCE_DOUBLE(vadd_f32(*(float32x2_t *)&v20, v22)), COERCE_DOUBLE(vadd_f32(*(float32x2_t *)&v20, v24)), COERCE_DOUBLE(vadd_f32(*(float32x2_t *)&v20, v26)));
  uint64_t v29 = v28;
  uint64_t v31 = v30;
  uint64_t v33 = v32;
  uint64_t v35 = v34;
  affine::inverse((affine *)&v48, v47);
  v36 = +[CIVector vectorWithX:v47[0] * 0.5 Y:v47[2] * 0.5 Z:v47[1] * 0.5 W:v47[3] * 0.5];
  v37 = +[CIVector vectorWithX:v48 Y:v50 Z:v49 W:v51];
  id v38 = [(CIFourfoldReflectedTile *)self _kernel];
  double v39 = *MEMORY[0x1E4F1DB10];
  double v40 = *(double *)(MEMORY[0x1E4F1DB10] + 8);
  double v41 = *(double *)(MEMORY[0x1E4F1DB10] + 16);
  double v42 = *(double *)(MEMORY[0x1E4F1DB10] + 24);
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __38__CIFourfoldReflectedTile_outputImage__block_invoke;
  v46[3] = &__block_descriptor_64_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
  v46[4] = v29;
  v46[5] = v31;
  v46[6] = v33;
  v46[7] = v35;
  inputImage = self->super.super.inputImage;
  v52[0] = +[CIVector vectorWithX:v44 Y:v45];
  v52[1] = v36;
  v52[2] = v37;
  return (id)objc_msgSend(v38, "applyWithExtent:roiCallback:inputImage:arguments:", v46, inputImage, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v52, 3), v39, v40, v41, v42);
}

double __38__CIFourfoldReflectedTile_outputImage__block_invoke(uint64_t a1)
{
  return *(double *)(a1 + 32);
}

@end