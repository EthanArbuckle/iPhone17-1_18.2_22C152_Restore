@interface CIFlashTransition
+ (id)customAttributes;
- (CIColor)inputColor;
- (CIImage)inputImage;
- (CIImage)inputTargetImage;
- (CIVector)inputCenter;
- (CIVector)inputExtent;
- (NSNumber)inputFadeThreshold;
- (NSNumber)inputMaxStriationRadius;
- (NSNumber)inputStriationContrast;
- (NSNumber)inputStriationStrength;
- (NSNumber)inputTime;
- (id)_colorKernel;
- (id)_geomKernel;
- (id)outputImage;
- (void)setInputCenter:(id)a3;
- (void)setInputColor:(id)a3;
- (void)setInputExtent:(id)a3;
- (void)setInputFadeThreshold:(id)a3;
- (void)setInputImage:(id)a3;
- (void)setInputMaxStriationRadius:(id)a3;
- (void)setInputStriationContrast:(id)a3;
- (void)setInputStriationStrength:(id)a3;
- (void)setInputTargetImage:(id)a3;
- (void)setInputTime:(id)a3;
@end

@implementation CIFlashTransition

+ (id)customAttributes
{
  v21[11] = *MEMORY[0x1E4F143B8];
  v20[0] = @"CIAttributeFilterCategories";
  v19[0] = @"CICategoryTransition";
  v19[1] = @"CICategoryVideo";
  v19[2] = @"CICategoryStillImage";
  v19[3] = @"CICategoryBuiltIn";
  v21[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:4];
  v21[1] = @"6";
  v20[1] = @"CIAttributeFilterAvailable_iOS";
  v20[2] = @"CIAttributeFilterAvailable_Mac";
  v21[2] = @"10.4";
  v20[3] = @"inputCenter";
  v17[0] = @"CIAttributeDefault";
  v17[1] = @"CIAttributeType";
  v18[0] = +[CIVector vectorWithX:150.0 Y:150.0];
  v18[1] = @"CIAttributeTypePosition";
  v21[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];
  v20[4] = @"inputExtent";
  v15[1] = @"CIAttributeDefault";
  v16[0] = @"CIAttributeTypeRectangle";
  v15[0] = @"CIAttributeType";
  v16[1] = +[CIVector vectorWithX:0.0 Y:0.0 Z:300.0 W:300.0];
  v21[4] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
  v20[5] = @"inputColor";
  v13[0] = @"CIAttributeDefault";
  v13[1] = @"CIAttributeType";
  v14[0] = +[CIColor colorWithRed:1.0 green:0.8 blue:0.6];
  v14[1] = @"CIAttributeTypeColor";
  v21[5] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
  v20[6] = @"inputTime";
  v11[0] = @"CIAttributeMin";
  v11[1] = @"CIAttributeSliderMin";
  v12[0] = &unk_1EE4A8BB0;
  v12[1] = &unk_1EE4A8BB0;
  v11[2] = @"CIAttributeSliderMax";
  v11[3] = @"CIAttributeDefault";
  v12[2] = &unk_1EE4A8BC0;
  v12[3] = &unk_1EE4A8BB0;
  v11[4] = @"CIAttributeType";
  v12[4] = @"CIAttributeTypeTime";
  v21[6] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:5];
  v20[7] = @"inputMaxStriationRadius";
  v9[0] = @"CIAttributeMin";
  v9[1] = @"CIAttributeSliderMin";
  v10[0] = &unk_1EE4A8BB0;
  v10[1] = &unk_1EE4A8BB0;
  v9[2] = @"CIAttributeSliderMax";
  v9[3] = @"CIAttributeDefault";
  v10[2] = &unk_1EE4A8BD0;
  v10[3] = &unk_1EE4A8BE0;
  v9[4] = @"CIAttributeType";
  v10[4] = @"CIAttributeTypeScalar";
  v21[7] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:5];
  v20[8] = @"inputStriationStrength";
  v7[0] = @"CIAttributeMin";
  v7[1] = @"CIAttributeSliderMin";
  v8[0] = &unk_1EE4A8BB0;
  v8[1] = &unk_1EE4A8BB0;
  v7[2] = @"CIAttributeSliderMax";
  v7[3] = @"CIAttributeDefault";
  v8[2] = &unk_1EE4A8BF0;
  v8[3] = &unk_1EE4A8C00;
  v7[4] = @"CIAttributeType";
  v8[4] = @"CIAttributeTypeScalar";
  v21[8] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:5];
  v20[9] = @"inputStriationContrast";
  v5[0] = @"CIAttributeMin";
  v5[1] = @"CIAttributeSliderMin";
  v6[0] = &unk_1EE4A8BB0;
  v6[1] = &unk_1EE4A8BB0;
  v5[2] = @"CIAttributeSliderMax";
  v5[3] = @"CIAttributeDefault";
  v6[2] = &unk_1EE4A8C10;
  v6[3] = &unk_1EE4A8C20;
  v5[4] = @"CIAttributeType";
  v6[4] = @"CIAttributeTypeScalar";
  v21[9] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:5];
  v20[10] = @"inputFadeThreshold";
  v3[0] = @"CIAttributeMin";
  v3[1] = @"CIAttributeMax";
  v4[0] = &unk_1EE4A8BB0;
  v4[1] = &unk_1EE4A8BC0;
  v3[2] = @"CIAttributeSliderMin";
  v3[3] = @"CIAttributeSliderMax";
  v4[2] = &unk_1EE4A8BB0;
  v4[3] = &unk_1EE4A8BC0;
  v3[4] = @"CIAttributeDefault";
  v3[5] = @"CIAttributeType";
  v4[4] = &unk_1EE4A8C30;
  v4[5] = @"CIAttributeTypeScalar";
  v21[10] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:6];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:11];
}

- (id)_colorKernel
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_flashColor];
}

- (id)_geomKernel
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_flashGeom];
}

- (id)outputImage
{
  v101[1] = *MEMORY[0x1E4F143B8];
  if (!self->inputImage || !self->inputTargetImage) {
    return 0;
  }
  [(NSNumber *)self->inputMaxStriationRadius floatValue];
  float v88 = v3;
  [(NSNumber *)self->inputStriationStrength floatValue];
  float v5 = v4;
  [(NSNumber *)self->inputStriationContrast floatValue];
  float v7 = v6;
  [(NSNumber *)self->inputFadeThreshold floatValue];
  float v9 = v8;
  [(NSNumber *)self->inputTime floatValue];
  float v11 = v10;
  [(CIVector *)self->inputCenter X];
  *(float *)&double v12 = v12;
  float v99 = *(float *)&v12;
  [(CIVector *)self->inputCenter Y];
  *(float *)&double v13 = v13;
  float v90 = *(float *)&v13;
  float32x2_t v95 = (float32x2_t)__PAIR64__(LODWORD(v13), LODWORD(v99));
  [(CIVector *)self->inputExtent X];
  *(float *)&double v14 = v14;
  float rect1a = *(float *)&v14;
  [(CIVector *)self->inputExtent X];
  *(float *)&unsigned int v16 = v15;
  LODWORD(v86) = v16;
  float32x2_t v93 = (float32x2_t)__PAIR64__(v16, LODWORD(rect1a));
  [(CIVector *)self->inputExtent Z];
  *(float *)&double v17 = v17 + rect1a;
  unsigned int v87 = LODWORD(v17);
  float32x2_t v91 = (float32x2_t)__PAIR64__(LODWORD(v86), LODWORD(v17));
  [(CIVector *)self->inputExtent W];
  *(float *)&double v18 = v18 + v86;
  float32x2_t v19 = (float32x2_t)__PAIR64__(LODWORD(v18), LODWORD(rect1a));
  float32x2_t v20 = (float32x2_t)__PAIR64__(LODWORD(v18), v87);
  float32x2_t v21 = vsub_f32(v93, v95);
  float32x2_t v22 = vsub_f32(v91, v95);
  v21.f32[0] = fmaxf(sqrtf(vaddv_f32(vmul_f32(v21, v21))), sqrtf(vaddv_f32(vmul_f32(v22, v22))));
  float32x2_t v23 = vsub_f32(v19, v95);
  v21.f32[0] = fmaxf(v21.f32[0], sqrtf(vaddv_f32(vmul_f32(v23, v23))));
  float32x2_t v24 = vsub_f32(v20, v95);
  float v25 = fmaxf(v21.f32[0], sqrtf(vaddv_f32(vmul_f32(v24, v24))));
  float v26 = (float)(v11 - v9) / (1.0 - v9);
  double v27 = v26;
  if (v11 >= 1.0) {
    double v27 = 1.0;
  }
  if (v11 >= v9) {
    double v28 = v27;
  }
  else {
    double v28 = 0.0;
  }
  double v29 = log10f(v25) + 1.0;
  if (v9 == 0.0) {
    double v30 = v11 / 0.000001;
  }
  else {
    double v30 = (float)(v11 / v9);
  }
  float v32 = __exp10(v30 * v29 + -1.0);
  [(CIImage *)self->inputImage extent];
  CGFloat v34 = v33;
  CGFloat v36 = v35;
  CGFloat v38 = v37;
  CGFloat v40 = v39;
  [(CIImage *)self->inputTargetImage extent];
  v110.origin.CGFloat x = v41;
  v110.origin.CGFloat y = v42;
  v110.size.CGFloat width = v43;
  v110.size.CGFloat height = v44;
  v102.origin.CGFloat x = v34;
  v102.origin.CGFloat y = v36;
  v102.size.CGFloat width = v38;
  v102.size.CGFloat height = v40;
  CGRect v103 = CGRectUnion(v102, v110);
  CGFloat x = v103.origin.x;
  CGFloat y = v103.origin.y;
  CGFloat width = v103.size.width;
  CGFloat height = v103.size.height;
  [(CIVector *)self->inputExtent CGRectValue];
  v111.origin.CGFloat x = v49;
  v111.origin.CGFloat y = v50;
  v111.size.CGFloat width = v51;
  v111.size.CGFloat height = v52;
  v104.origin.CGFloat x = x;
  v104.origin.CGFloat y = y;
  v104.size.CGFloat width = width;
  v104.size.CGFloat height = height;
  CGRect v105 = CGRectUnion(v104, v111);
  double v92 = v105.origin.x;
  double v94 = v105.origin.y;
  double v96 = v105.size.width;
  double rect1 = v105.size.height;
  v53 = +[CIVector vectorWithX:100.0 Y:(float)(v32 * v32) Z:1.0 / (float)(v88 * v32) W:v28];
  v54 = +[CIVector vectorWithX:(float)(v5 * v7) Y:(1.0 - v7) * v5 * 0.5];
  id v55 = [(CIFlashTransition *)self _geomKernel];
  id v89 = [(CIFlashTransition *)self _colorKernel];
  id v56 = +[CIImage noiseImage];
  v57 = (double *)MEMORY[0x1E4F1DB10];
  double v58 = *MEMORY[0x1E4F1DB10];
  double v59 = *(double *)(MEMORY[0x1E4F1DB10] + 8);
  double v60 = *(double *)(MEMORY[0x1E4F1DB10] + 16);
  double v61 = *(double *)(MEMORY[0x1E4F1DB10] + 24);
  v101[0] = +[CIVector vectorWithX:v99 Y:v90];
  uint64_t v62 = objc_msgSend(v55, "applyWithExtent:roiCallback:inputImage:arguments:", &__block_literal_global_30, v56, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v101, 1), v58, v59, v60, v61);
  [(CIVector *)v53 Z];
  double v64 = 1.0 / v63;
  double v65 = v99 - v64;
  double v66 = v90 - v64;
  double v67 = v64 + v64;
  BOOL v69 = v64 + v64 == 1.79769313e308 && v65 == -8.98846567e307 && v66 == -8.98846567e307;
  double v70 = v64 + v64;
  if (v69)
  {
    double v67 = v57[2];
    double v70 = v57[3];
    double v65 = *v57;
    double v66 = v57[1];
  }
  [(CIImage *)self->inputImage extent];
  CGFloat v72 = v71;
  CGFloat v74 = v73;
  CGFloat v76 = v75;
  CGFloat v78 = v77;
  [(CIImage *)self->inputTargetImage extent];
  v112.origin.CGFloat x = v79;
  v112.origin.CGFloat y = v80;
  v112.size.CGFloat width = v81;
  v112.size.CGFloat height = v82;
  v106.origin.CGFloat x = v72;
  v106.origin.CGFloat y = v74;
  v106.size.CGFloat width = v76;
  v106.size.CGFloat height = v78;
  CGRect v107 = CGRectUnion(v106, v112);
  v113.origin.CGFloat x = v65;
  v113.origin.CGFloat y = v66;
  v113.size.CGFloat width = v67;
  v113.size.CGFloat height = v70;
  CGRect v108 = CGRectUnion(v107, v113);
  inputTargetImage = self->inputTargetImage;
  v100[0] = self->inputImage;
  v100[1] = inputTargetImage;
  inputColor = self->inputColor;
  v100[2] = self->inputCenter;
  v100[3] = inputColor;
  v100[4] = v62;
  v100[5] = v53;
  v100[6] = v54;
  v31 = objc_msgSend(v89, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v100, 7), v108.origin.x, v108.origin.y, v108.size.width, v108.size.height);
  v109.origin.CGFloat x = v92;
  v109.origin.CGFloat y = v94;
  v109.size.CGFloat width = v96;
  v109.size.CGFloat height = rect1;
  v114.origin.CGFloat x = v65;
  v114.origin.CGFloat y = v66;
  v114.size.CGFloat width = v67;
  v114.size.CGFloat height = v70;
  if (!CGRectContainsRect(v109, v114)) {
    return (id)objc_msgSend(v31, "imageByCroppingToRect:", v92, v94, v96, rect1);
  }
  return v31;
}

double __32__CIFlashTransition_outputImage__block_invoke()
{
  return 26.0;
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
}

- (CIImage)inputTargetImage
{
  return self->inputTargetImage;
}

- (void)setInputTargetImage:(id)a3
{
}

- (CIVector)inputCenter
{
  return self->inputCenter;
}

- (void)setInputCenter:(id)a3
{
}

- (CIVector)inputExtent
{
  return self->inputExtent;
}

- (void)setInputExtent:(id)a3
{
}

- (CIColor)inputColor
{
  return self->inputColor;
}

- (void)setInputColor:(id)a3
{
}

- (NSNumber)inputTime
{
  return self->inputTime;
}

- (void)setInputTime:(id)a3
{
}

- (NSNumber)inputMaxStriationRadius
{
  return self->inputMaxStriationRadius;
}

- (void)setInputMaxStriationRadius:(id)a3
{
}

- (NSNumber)inputStriationStrength
{
  return self->inputStriationStrength;
}

- (void)setInputStriationStrength:(id)a3
{
}

- (NSNumber)inputStriationContrast
{
  return self->inputStriationContrast;
}

- (void)setInputStriationContrast:(id)a3
{
}

- (NSNumber)inputFadeThreshold
{
  return self->inputFadeThreshold;
}

- (void)setInputFadeThreshold:(id)a3
{
}

@end