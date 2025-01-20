@interface CINinePartTiled
+ (id)customAttributes;
- (CIImage)inputImage;
- (CIVector)inputBreakpoint0;
- (CIVector)inputBreakpoint1;
- (CIVector)inputGrowAmount;
- (NSNumber)inputFlipYTiles;
- (id)_kernelAlt;
- (id)outputImage;
- (void)setInputBreakpoint0:(id)a3;
- (void)setInputBreakpoint1:(id)a3;
- (void)setInputFlipYTiles:(id)a3;
- (void)setInputGrowAmount:(id)a3;
- (void)setInputImage:(id)a3;
@end

@implementation CINinePartTiled

- (id)_kernelAlt
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_ninePartTiledAlt];
}

- (id)outputImage
{
  v50[3] = *MEMORY[0x1E4F143B8];
  if (!self->inputImage) {
    return 0;
  }
  inputGrowAmount = self->inputGrowAmount;
  [(CIVector *)inputGrowAmount X];
  float64_t v45 = v4;
  [(CIVector *)inputGrowAmount Y];
  v5.f64[0] = v45;
  v5.f64[1] = v6;
  float32x2_t v7 = vmaxnm_f32(vcvt_f32_f64(v5), 0);
  double v8 = v7.f32[0];
  float v9 = v7.f32[1];
  double v10 = v7.f32[1];
  if (v7.f32[0] < 0.001 && v10 < 0.001) {
    return self->inputImage;
  }
  float32x2_t v41 = v7;
  BOOL v12 = [(NSNumber *)self->inputFlipYTiles BOOLValue];
  inputBreakpoint0 = self->inputBreakpoint0;
  [(CIVector *)inputBreakpoint0 X];
  float64_t v46 = v14;
  [(CIVector *)inputBreakpoint0 Y];
  v15.f64[0] = v46;
  v15.f64[1] = v16;
  float32x2_t v43 = vcvt_f32_f64(v15);
  inputBreakpoint1 = self->inputBreakpoint1;
  [(CIVector *)inputBreakpoint1 X];
  *(float *)&double v18 = v18;
  LODWORD(v46) = LODWORD(v18);
  [(CIVector *)inputBreakpoint1 Y];
  *(float *)&long long v19 = *(double *)&v19;
  long long v39 = v19;
  float32x2_t v20 = vminnm_f32(v43, (float32x2_t)__PAIR64__(v19, LODWORD(v46)));
  *(float32x2_t *)&long long v19 = vmaxnm_f32(v43, (float32x2_t)__PAIR64__(v19, LODWORD(v46)));
  *(float *)&unsigned int v21 = *(float *)&v19 + 0.001;
  int8x8_t v22 = vbsl_s8((int8x8_t)vcgtd_f64(0.001, vsub_f32(*(float32x2_t *)&v19, v20).f32[0]), (int8x8_t)__PAIR64__(DWORD1(v19), v21), *(int8x8_t *)&v19);
  float32x2_t v42 = v20;
  float v23 = v20.f32[1];
  if ((float)(*(float *)&v22.i32[1] - v20.f32[1]) < 0.001)
  {
    *(float *)&__int32 v24 = *(float *)&v22.i32[1] + 0.001;
    v22.i32[1] = v24;
  }
  int8x8_t v47 = v22;
  [(CIImage *)self->inputImage extent];
  double x = v51.origin.x;
  double y = v51.origin.y;
  double width = v51.size.width;
  double height = v51.size.height;
  BOOL IsInfinite = CGRectIsInfinite(v51);
  double v30 = -0.0;
  if (IsInfinite) {
    double v31 = -0.0;
  }
  else {
    double v31 = v10;
  }
  double v32 = height + v31;
  if (!IsInfinite) {
    double v30 = v8;
  }
  double v33 = width + v30;
  v34 = +[CIVector vectorWithX:v42.f32[0] Y:v23 Z:*(float *)v47.i32 W:*(float *)&v47.i32[1]];
  v35.i32[0] = v43.i32[0];
  if (v12) {
    unsigned int v36 = -1;
  }
  else {
    unsigned int v36 = 0;
  }
  *(float *)&v35.i32[1] = v9 + v40;
  int8x8_t v44 = vbsl_s8((int8x8_t)vdup_n_s32(v36), v35, (int8x8_t)v43);
  id v37 = [(CINinePartTiled *)self _kernelAlt];
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __30__CINinePartTiled_outputImage__block_invoke;
  v48[3] = &__block_descriptor_57_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
  v48[4] = v42;
  v48[5] = v47;
  v48[6] = v41;
  BOOL v49 = v12;
  inputImage = self->inputImage;
  v50[0] = v34;
  v50[1] = +[CIVector vectorWithX:v8 Y:v10];
  v50[2] = +[CIVector vectorWithX:*(float *)v44.i32 Y:*(float *)&v44.i32[1]];
  return (id)objc_msgSend(v37, "applyWithExtent:roiCallback:inputImage:arguments:", v48, inputImage, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v50, 3), x, y, v33, v32);
}

double __30__CINinePartTiled_outputImage__block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  double v7 = a3 + a5;
  double v14 = 0.0;
  double v15 = 0.0;
  double v12 = 0.0;
  double v13 = 0.0;
  LODWORD(v10) = HIDWORD(*(void *)(a1 + 40));
  LODWORD(v11) = HIDWORD(*(void *)(a1 + 32));
  LODWORD(v9) = HIDWORD(*(void *)(a1 + 48));
  minMax(a2, a2 + a4, COERCE_FLOAT(*(void *)(a1 + 32)), COERCE_FLOAT(*(void *)(a1 + 40)), COERCE_FLOAT(*(void *)(a1 + 48)), 0, &v15, &v14);
  minMax(a3, v7, v11, v10, v9, *(unsigned __int8 *)(a1 + 56), &v13, &v12);
  return v15;
}

+ (id)customAttributes
{
  v13[7] = *MEMORY[0x1E4F143B8];
  v12[0] = @"CIAttributeFilterCategories";
  v11[0] = @"CICategoryDistortionEffect";
  v11[1] = @"CICategoryVideo";
  v11[2] = @"CICategoryStillImage";
  v11[3] = @"CICategoryBuiltIn";
  v13[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:4];
  v13[1] = @"10";
  v12[1] = @"CIAttributeFilterAvailable_iOS";
  v12[2] = @"CIAttributeFilterAvailable_Mac";
  v13[2] = @"10.12";
  v12[3] = @"inputBreakpoint0";
  v9[0] = @"CIAttributeType";
  v9[1] = @"CIAttributeDefault";
  v10[0] = @"CIAttributeTypePosition";
  v10[1] = +[CIVector vectorWithX:50.0 Y:50.0];
  v13[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  v12[4] = @"inputBreakpoint1";
  v7[1] = @"CIAttributeDefault";
  v8[0] = @"CIAttributeTypePosition";
  v7[0] = @"CIAttributeType";
  v8[1] = +[CIVector vectorWithX:150.0 Y:150.0];
  v13[4] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];
  v12[5] = @"inputGrowAmount";
  v5[1] = @"CIAttributeDefault";
  v6[0] = @"CIAttributeTypeOffset";
  v5[0] = @"CIAttributeType";
  v6[1] = +[CIVector vectorWithX:100.0 Y:100.0];
  v13[5] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:2];
  v12[6] = @"inputFlipYTiles";
  v3[0] = @"CIAttributeDefault";
  v3[1] = @"CIAttributeMin";
  v4[0] = MEMORY[0x1E4F1CC38];
  v4[1] = MEMORY[0x1E4F1CC28];
  v3[2] = @"CIAttributeMax";
  v3[3] = @"CIAttributeType";
  v4[2] = MEMORY[0x1E4F1CC38];
  v4[3] = @"CIAttributeTypeBoolean";
  v13[6] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:4];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:7];
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
}

- (CIVector)inputBreakpoint0
{
  return self->inputBreakpoint0;
}

- (void)setInputBreakpoint0:(id)a3
{
}

- (CIVector)inputBreakpoint1
{
  return self->inputBreakpoint1;
}

- (void)setInputBreakpoint1:(id)a3
{
}

- (CIVector)inputGrowAmount
{
  return self->inputGrowAmount;
}

- (void)setInputGrowAmount:(id)a3
{
}

- (NSNumber)inputFlipYTiles
{
  return self->inputFlipYTiles;
}

- (void)setInputFlipYTiles:(id)a3
{
}

@end