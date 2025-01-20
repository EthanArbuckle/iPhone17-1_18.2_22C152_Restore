@interface CISwipeTransition
+ (id)customAttributes;
- (CIColor)inputColor;
- (CIImage)inputImage;
- (CIImage)inputTargetImage;
- (CIVector)inputExtent;
- (NSNumber)inputAngle;
- (NSNumber)inputOpacity;
- (NSNumber)inputTime;
- (NSNumber)inputWidth;
- (id)_kernel;
- (id)outputImage;
- (void)setInputAngle:(id)a3;
- (void)setInputColor:(id)a3;
- (void)setInputExtent:(id)a3;
- (void)setInputImage:(id)a3;
- (void)setInputOpacity:(id)a3;
- (void)setInputTargetImage:(id)a3;
- (void)setInputTime:(id)a3;
- (void)setInputWidth:(id)a3;
@end

@implementation CISwipeTransition

+ (id)customAttributes
{
  v15[8] = *MEMORY[0x1E4F143B8];
  v14[0] = @"CIAttributeFilterCategories";
  v13[0] = @"CICategoryTransition";
  v13[1] = @"CICategoryVideo";
  v13[2] = @"CICategoryStillImage";
  v13[3] = @"CICategoryBuiltIn";
  v15[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:4];
  v15[1] = @"6";
  v14[1] = @"CIAttributeFilterAvailable_iOS";
  v14[2] = @"CIAttributeFilterAvailable_Mac";
  v15[2] = @"10.4";
  v14[3] = @"inputWidth";
  v11[0] = @"CIAttributeMin";
  v11[1] = @"CIAttributeSliderMin";
  v12[0] = &unk_1EE4A9F40;
  v12[1] = &unk_1EE4A9F40;
  v11[2] = @"CIAttributeSliderMax";
  v11[3] = @"CIAttributeDefault";
  v12[2] = &unk_1EE4A9F50;
  v12[3] = &unk_1EE4A9F60;
  v11[4] = @"CIAttributeType";
  v12[4] = @"CIAttributeTypeDistance";
  v15[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:5];
  v14[4] = @"inputOpacity";
  v9[0] = @"CIAttributeMin";
  v9[1] = @"CIAttributeSliderMin";
  v10[0] = &unk_1EE4A9F70;
  v10[1] = &unk_1EE4A9F70;
  v9[2] = @"CIAttributeSliderMax";
  v9[3] = @"CIAttributeDefault";
  v10[2] = &unk_1EE4A9F80;
  v10[3] = &unk_1EE4A9F70;
  v9[4] = @"CIAttributeIdentity";
  v9[5] = @"CIAttributeType";
  v10[4] = &unk_1EE4A9F70;
  v10[5] = @"CIAttributeTypeScalar";
  v15[4] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:6];
  v14[5] = @"inputColor";
  v7[0] = @"CIAttributeDefault";
  v7[1] = @"CIAttributeType";
  v8[0] = +[CIColor colorWithRed:1.0 green:1.0 blue:1.0];
  v8[1] = @"CIAttributeTypeOpaqueColor";
  v15[5] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];
  v14[6] = @"inputExtent";
  v5[1] = @"CIAttributeDefault";
  v6[0] = @"CIAttributeTypeRectangle";
  v5[0] = @"CIAttributeType";
  v6[1] = +[CIVector vectorWithX:0.0 Y:0.0 Z:300.0 W:300.0];
  v15[6] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:2];
  v14[7] = @"inputAngle";
  v3[0] = @"CIAttributeSliderMin";
  v3[1] = @"CIAttributeSliderMax";
  v4[0] = &unk_1EE4A9F90;
  v4[1] = &unk_1EE4A9FA0;
  v3[2] = @"CIAttributeDefault";
  v3[3] = @"CIAttributeIdentity";
  v4[2] = &unk_1EE4A9F70;
  v4[3] = &unk_1EE4A9F70;
  v3[4] = @"CIAttributeType";
  v4[4] = @"CIAttributeTypeAngle";
  v15[7] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:5];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:8];
}

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_swipeTransition];
}

- (id)outputImage
{
  v57[4] = *MEMORY[0x1E4F143B8];
  [(NSNumber *)self->inputAngle floatValue];
  float v4 = v3;
  [(NSNumber *)self->inputWidth floatValue];
  float v6 = v5;
  [(NSNumber *)self->inputOpacity floatValue];
  float v8 = v7;
  [(NSNumber *)self->inputTime floatValue];
  if (!self->inputImage || !self->inputTargetImage) {
    return 0;
  }
  float v10 = *(float *)v9.i32;
  *(float *)v9.i32 = fmaxf(v6, 0.1);
  int32x2_t v52 = v9;
  [(CIVector *)self->inputExtent X];
  *(float *)&double v11 = v11;
  float v55 = *(float *)&v11;
  [(CIVector *)self->inputExtent Y];
  *(float *)&unsigned int v13 = v12;
  float v49 = *(float *)&v13;
  float32x2_t v51 = (float32x2_t)__PAIR64__(v13, LODWORD(v55));
  [(CIVector *)self->inputExtent Z];
  v14.f32[0] = *(double *)&v14 + v55;
  __int32 v53 = v14.i32[0];
  v14.f32[1] = v49;
  float32x2_t v50 = v14;
  [(CIVector *)self->inputExtent W];
  *(float *)&double v15 = v15 + v49;
  float32x2_t v56 = (float32x2_t)__PAIR64__(LODWORD(v15), LODWORD(v55));
  float32x2_t v54 = (float32x2_t)__PAIR64__(LODWORD(v15), v53);
  __float2 v16 = __sincosf_stret(v4);
  float32x2_t v17 = vdiv_f32((float32x2_t)__PAIR64__(LODWORD(v16.__sinval), LODWORD(v16.__cosval)), (float32x2_t)vdup_lane_s32(v52, 0));
  float v18 = vaddv_f32(vmul_f32(v17, v51));
  float v19 = vaddv_f32(vmul_f32(v17, v50));
  float v20 = fminf(v18, v19);
  float v21 = fmaxf(v18, v19);
  float v22 = vaddv_f32(vmul_f32(v17, v56));
  float v23 = fminf(v20, v22);
  float v24 = fmaxf(v21, v22);
  float v25 = vaddv_f32(vmul_f32(v17, v54));
  float v26 = fminf(v23, v25);
  v27 = +[CIVector vectorWithX:v17.f32[0] Y:v17.f32[1] Z:(float)((float)(1.0 - v26) + (float)((float)((float)(v26 - fmaxf(v24, v25)) + -1.0) * v10)) W:fminf(fmaxf(v8, 0.0), 1.0)];
  inputColor = self->inputColor;
  if (!inputColor) {
    inputColor = +[CIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.0];
  }
  id v29 = [(CISwipeTransition *)self _kernel];
  double v30 = *MEMORY[0x1E4F1DB10];
  double v31 = *(double *)(MEMORY[0x1E4F1DB10] + 8);
  double v32 = *(double *)(MEMORY[0x1E4F1DB10] + 16);
  double v33 = *(double *)(MEMORY[0x1E4F1DB10] + 24);
  inputTargetImage = self->inputTargetImage;
  v57[0] = self->inputImage;
  v57[1] = inputTargetImage;
  v57[2] = inputColor;
  v57[3] = v27;
  v35 = objc_msgSend(v29, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v57, 4), v30, v31, v32, v33);
  [(CIImage *)self->inputImage extent];
  CGFloat v37 = v36;
  CGFloat v39 = v38;
  CGFloat v41 = v40;
  CGFloat v43 = v42;
  [(CIImage *)self->inputTargetImage extent];
  v60.origin.x = v44;
  v60.origin.y = v45;
  v60.size.width = v46;
  v60.size.height = v47;
  v58.origin.x = v37;
  v58.origin.y = v39;
  v58.size.width = v41;
  v58.size.height = v43;
  CGRect v59 = CGRectUnion(v58, v60);
  return (id)objc_msgSend(v35, "imageByCroppingToRect:", v59.origin.x, v59.origin.y, v59.size.width, v59.size.height);
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

- (NSNumber)inputAngle
{
  return self->inputAngle;
}

- (void)setInputAngle:(id)a3
{
}

- (NSNumber)inputWidth
{
  return self->inputWidth;
}

- (void)setInputWidth:(id)a3
{
}

- (NSNumber)inputOpacity
{
  return self->inputOpacity;
}

- (void)setInputOpacity:(id)a3
{
}

@end