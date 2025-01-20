@interface CICopyMachineTransition
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

@implementation CICopyMachineTransition

+ (id)customAttributes
{
  v17[9] = *MEMORY[0x1E4F143B8];
  v16[0] = @"CIAttributeFilterCategories";
  v15[0] = @"CICategoryTransition";
  v15[1] = @"CICategoryVideo";
  v15[2] = @"CICategoryStillImage";
  v15[3] = @"CICategoryBuiltIn";
  v17[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:4];
  v17[1] = @"6";
  v16[1] = @"CIAttributeFilterAvailable_iOS";
  v16[2] = @"CIAttributeFilterAvailable_Mac";
  v17[2] = @"10.4";
  v16[3] = @"inputTime";
  v13[0] = @"CIAttributeMin";
  v13[1] = @"CIAttributeSliderMin";
  v14[0] = &unk_1EE4A82C0;
  v14[1] = &unk_1EE4A82C0;
  v13[2] = @"CIAttributeSliderMax";
  v13[3] = @"CIAttributeDefault";
  v14[2] = &unk_1EE4A82D0;
  v14[3] = &unk_1EE4A82C0;
  v13[4] = @"CIAttributeType";
  v14[4] = @"CIAttributeTypeTime";
  v17[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:5];
  v16[4] = @"inputAngle";
  v11[0] = @"CIAttributeMin";
  v11[1] = @"CIAttributeSliderMin";
  v12[0] = &unk_1EE4A82C0;
  v12[1] = &unk_1EE4A82C0;
  v11[2] = @"CIAttributeSliderMax";
  v11[3] = @"CIAttributeDefault";
  v12[2] = &unk_1EE4A82E0;
  v12[3] = &unk_1EE4A82C0;
  v11[4] = @"CIAttributeIdentity";
  v11[5] = @"CIAttributeType";
  v12[4] = &unk_1EE4A82C0;
  v12[5] = @"CIAttributeTypeAngle";
  v17[4] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:6];
  v16[5] = @"inputWidth";
  v9[0] = @"CIAttributeMin";
  v9[1] = @"CIAttributeSliderMin";
  v10[0] = &unk_1EE4A82F0;
  v10[1] = &unk_1EE4A82F0;
  v9[2] = @"CIAttributeSliderMax";
  v9[3] = @"CIAttributeDefault";
  v10[2] = &unk_1EE4A8300;
  v10[3] = &unk_1EE4A8310;
  v9[4] = @"CIAttributeIdentity";
  v9[5] = @"CIAttributeType";
  v10[4] = &unk_1EE4A8310;
  v10[5] = @"CIAttributeTypeDistance";
  v17[5] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:6];
  v16[6] = @"inputOpacity";
  v7[0] = @"CIAttributeMin";
  v7[1] = @"CIAttributeSliderMin";
  v8[0] = &unk_1EE4A82C0;
  v8[1] = &unk_1EE4A82C0;
  v7[2] = @"CIAttributeSliderMax";
  v7[3] = @"CIAttributeDefault";
  v8[2] = &unk_1EE4A8320;
  v8[3] = &unk_1EE4A8330;
  v7[4] = @"CIAttributeIdentity";
  v7[5] = @"CIAttributeType";
  v8[4] = &unk_1EE4A8330;
  v8[5] = @"CIAttributeTypeScalar";
  v17[6] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:6];
  v16[7] = @"inputExtent";
  v5[1] = @"CIAttributeDefault";
  v6[0] = @"CIAttributeTypeRectangle";
  v5[0] = @"CIAttributeType";
  v6[1] = +[CIVector vectorWithX:0.0 Y:0.0 Z:300.0 W:300.0];
  v17[7] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:2];
  v16[8] = @"inputColor";
  v3[0] = @"CIAttributeDefault";
  v3[1] = @"CIAttributeType";
  v4[0] = +[CIColor colorWithRed:0.6 green:1.0 blue:0.8];
  v4[1] = @"CIAttributeTypeOpaqueColor";
  v17[8] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:2];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:9];
}

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_copyMachineTransition];
}

- (id)outputImage
{
  v84[6] = *MEMORY[0x1E4F143B8];
  if (!self->inputImage || !self->inputTargetImage) {
    return 0;
  }
  [(NSNumber *)self->inputAngle floatValue];
  float v4 = v3;
  [(NSNumber *)self->inputWidth floatValue];
  *(double *)&int32x2_t v6 = fmax(v5, 0.1);
  *(float *)v6.i32 = *(double *)v6.i32;
  int32x2_t v75 = v6;
  [(NSNumber *)self->inputOpacity floatValue];
  float v77 = v7;
  [(NSNumber *)self->inputTime floatValue];
  float v9 = v8;
  [(CIVector *)self->inputExtent X];
  *(float *)&double v10 = v10;
  float v81 = *(float *)&v10;
  [(CIVector *)self->inputExtent X];
  *(float *)&unsigned int v12 = v11;
  float v69 = *(float *)&v12;
  float32x2_t v73 = (float32x2_t)__PAIR64__(v12, LODWORD(v81));
  [(CIVector *)self->inputExtent Z];
  v13.f32[0] = *(double *)&v13 + v81;
  __int32 v78 = v13.i32[0];
  v13.f32[1] = v69;
  float32x2_t v71 = v13;
  [(CIVector *)self->inputExtent W];
  *(float *)&double v14 = v14 + v69;
  float32x2_t v82 = (float32x2_t)__PAIR64__(LODWORD(v14), LODWORD(v81));
  float32x2_t v79 = (float32x2_t)__PAIR64__(LODWORD(v14), v78);
  __float2 v15 = __sincosf_stret(v4);
  float32x2_t v16 = vdiv_f32((float32x2_t)__PAIR64__(LODWORD(v15.__sinval), LODWORD(v15.__cosval)), (float32x2_t)vdup_lane_s32(v75, 0));
  float v17 = vaddv_f32(vmul_f32(v16, v73));
  float v18 = vaddv_f32(vmul_f32(v16, v71));
  float v19 = fminf(v17, v18);
  float v20 = fmaxf(v17, v18);
  float v21 = vaddv_f32(vmul_f32(v16, v82));
  float v22 = fminf(v19, v21);
  float v23 = fmaxf(v20, v21);
  int32x2_t v76 = (int32x2_t)v16;
  float v24 = vaddv_f32(vmul_f32(v16, v79));
  float v74 = fminf(v22, v24);
  float v72 = (float)(v74 - fmaxf(v23, v24)) + -1.0;
  if (v9 >= 0.65)
  {
    float v80 = 1.0 - (float)((float)((float)(v9 + -0.65) / 0.35) * (float)((float)(v9 + -0.65) / 0.35));
    double v83 = 1.0;
    double v70 = -5.88235235;
    [(CIVector *)self->inputExtent X];
  }
  else
  {
    double v83 = 0.0;
    double v70 = -1.20481932;
    float v80 = v9 / 0.65;
    [(CIVector *)self->inputExtent X];
  }
  CGFloat v27 = v25;
  [(CIVector *)self->inputExtent Y];
  CGFloat v29 = v28;
  [(CIVector *)self->inputExtent Z];
  CGFloat v31 = v30;
  [(CIVector *)self->inputExtent W];
  CGFloat v33 = v32;
  [(CIImage *)self->inputImage extent];
  CGFloat v35 = v34;
  CGFloat v37 = v36;
  CGFloat v39 = v38;
  CGFloat v41 = v40;
  [(CIImage *)self->inputTargetImage extent];
  v88.origin.double x = v42;
  v88.origin.double y = v43;
  v88.size.double width = v44;
  v88.size.double height = v45;
  v85.origin.double x = v35;
  v85.origin.double y = v37;
  v85.size.double width = v39;
  v85.size.double height = v41;
  CGRect v86 = CGRectUnion(v85, v88);
  v89.origin.double x = v27;
  v89.origin.double y = v29;
  v89.size.double width = v31;
  v89.size.double height = v33;
  CGRect v87 = CGRectUnion(v86, v89);
  double x = v87.origin.x;
  double y = v87.origin.y;
  double width = v87.size.width;
  double height = v87.size.height;
  v50 = +[CIVector vectorWithX:v70 Y:v68 Z:v67];
  v51 = +[CIVector vectorWithX:(float)-*(float *)v76.i32 Y:(float)-*(float *)&v76.i32[1] Z:(float)-v72 W:(float)((float)(v74 + -1.0) + 1.0)];
  [(CIColor *)self->inputColor red];
  double v53 = v52;
  [(CIColor *)self->inputColor green];
  double v55 = v54;
  [(CIColor *)self->inputColor blue];
  double v57 = v56;
  [(CIColor *)self->inputColor alpha];
  v59 = +[CIVector vectorWithX:v53 Y:v55 Z:v57 W:v58];
  v60 = +[CIVector vectorWithX:v80 Y:v77 Z:v83];
  id v61 = [(CICopyMachineTransition *)self _kernel];
  double v62 = *MEMORY[0x1E4F1DB10];
  double v63 = *(double *)(MEMORY[0x1E4F1DB10] + 8);
  double v64 = *(double *)(MEMORY[0x1E4F1DB10] + 16);
  double v65 = *(double *)(MEMORY[0x1E4F1DB10] + 24);
  inputTargetImage = self->inputTargetImage;
  v84[0] = self->inputImage;
  v84[1] = inputTargetImage;
  v84[2] = v50;
  v84[3] = v51;
  v84[4] = v59;
  v84[5] = v60;
  return (id)objc_msgSend((id)objc_msgSend(v61, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v84, 6), v62, v63, v64, v65), "imageByCroppingToRect:", x, y, width, height);
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