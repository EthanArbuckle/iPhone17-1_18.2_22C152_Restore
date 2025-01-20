@interface CIRippleTransition
+ (id)customAttributes;
- (CIImage)inputImage;
- (CIImage)inputShadingImage;
- (CIImage)inputTargetImage;
- (id)_CIRippleTransition;
- (id)outputImage;
- (void)setInputImage:(id)a3;
- (void)setInputShadingImage:(id)a3;
- (void)setInputTargetImage:(id)a3;
@end

@implementation CIRippleTransition

- (id)_CIRippleTransition
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_rippleTransition];
}

- (id)outputImage
{
  v84[6] = *MEMORY[0x1E4F143B8];
  [(NSNumber *)self->inputWidth floatValue];
  float v4 = v3;
  [(NSNumber *)self->inputScale floatValue];
  float v6 = v5;
  [(NSNumber *)self->inputTime floatValue];
  if (!self->inputImage || !self->inputTargetImage || !self->inputShadingImage) {
    return 0;
  }
  float v8 = v7;
  float v82 = v6;
  float v9 = v4 * 0.25;
  float v80 = v4 * 0.25;
  [(CIVector *)self->inputCenter X];
  float v11 = v10;
  [(CIVector *)self->inputCenter Y];
  float v13 = v12;
  [(CIVector *)self->inputExtent X];
  float v15 = v14;
  [(CIVector *)self->inputExtent Y];
  float v17 = v16;
  [(CIVector *)self->inputExtent Z];
  float v19 = v18 + v15;
  [(CIVector *)self->inputExtent W];
  float v21 = v20 + v17;
  float v22 = v15 - v11;
  float v23 = (float)(v17 - v13) * (float)(v17 - v13);
  float v24 = sqrtf(v23 + (float)(v22 * v22));
  float v25 = v19 - v11;
  float v26 = sqrtf(v23 + (float)(v25 * v25));
  if (v26 <= v24) {
    float v26 = v24;
  }
  float v27 = (float)(v21 - v13) * (float)(v21 - v13);
  float v28 = sqrtf(v27 + (float)(v22 * v22));
  if (v28 <= v26) {
    float v28 = v26;
  }
  float v29 = sqrtf(v27 + (float)(v25 * v25));
  if (v29 <= v28) {
    float v29 = v28;
  }
  float v30 = v9 * -9.0 + v8 * (v29 + v9 * 9.0);
  float v79 = v30;
  [(CIImage *)self->inputShadingImage extent];
  double v32 = v31;
  double v81 = v33;
  [(CIImage *)self->inputImage extent];
  CGFloat v35 = v34;
  CGFloat v37 = v36;
  CGFloat v39 = v38;
  CGFloat v41 = v40;
  [(CIImage *)self->inputTargetImage extent];
  v89.origin.CGFloat x = v42;
  v89.origin.CGFloat y = v43;
  v89.size.CGFloat width = v44;
  v89.size.CGFloat height = v45;
  v85.origin.CGFloat x = v35;
  v85.origin.CGFloat y = v37;
  v85.size.CGFloat width = v39;
  v85.size.CGFloat height = v41;
  CGRect v86 = CGRectUnion(v85, v89);
  CGFloat x = v86.origin.x;
  CGFloat y = v86.origin.y;
  CGFloat width = v86.size.width;
  CGFloat height = v86.size.height;
  [(CIVector *)self->inputExtent X];
  CGFloat v51 = v50;
  [(CIVector *)self->inputExtent Y];
  CGFloat v53 = v52;
  [(CIVector *)self->inputExtent Z];
  CGFloat v55 = v54;
  [(CIVector *)self->inputExtent W];
  v90.size.CGFloat height = v56;
  v87.origin.CGFloat x = x;
  v87.origin.CGFloat y = y;
  v87.size.CGFloat width = width;
  v87.size.CGFloat height = height;
  v90.origin.CGFloat x = v51;
  v90.origin.CGFloat y = v53;
  v90.size.CGFloat width = v55;
  CGRect v88 = CGRectUnion(v87, v90);
  double v57 = v88.origin.x;
  double v58 = v88.origin.y;
  double v59 = v88.size.width;
  double v60 = v88.size.height;
  [(CIImage *)self->inputShadingImage extent];
  double v62 = v61;
  double v64 = v63;
  v65 = (void *)MEMORY[0x1E4F1C978];
  inputScale = self->inputScale;
  *(float *)&CGFloat v51 = v67;
  LODWORD(v67) = LODWORD(v51);
  uint64_t v68 = [NSNumber numberWithFloat:v67];
  LODWORD(v69) = LODWORD(v51);
  uint64_t v70 = [NSNumber numberWithFloat:v69];
  *(float *)&double v71 = v62;
  uint64_t v72 = [NSNumber numberWithFloat:v71];
  *(float *)&double v73 = v64;
  uint64_t v74 = objc_msgSend(v65, "arrayWithObjects:", inputScale, v68, v70, v72, objc_msgSend(NSNumber, "numberWithFloat:", v73), 0);
  id v75 = [(CIRippleTransition *)self _CIRippleTransition];
  v83[0] = MEMORY[0x1E4F143A8];
  v83[1] = 3221225472;
  v83[2] = __33__CIRippleTransition_outputImage__block_invoke;
  v83[3] = &unk_1E57716D0;
  inputImage = self->inputImage;
  v83[4] = v74;
  v84[0] = inputImage;
  inputShadingImage = self->inputShadingImage;
  v84[1] = self->inputTargetImage;
  v84[2] = inputShadingImage;
  v84[3] = self->inputCenter;
  v84[4] = +[CIVector vectorWithX:v79 Y:(float)(1.0 / v80) Z:0.333333343 W:v82];
  v84[5] = +[CIVector vectorWithX:v32 Y:v81];
  return (id)objc_msgSend(v75, "applyWithExtent:roiCallback:arguments:", v83, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v84, 6), v57, v58, v59, v60);
}

double __33__CIRippleTransition_outputImage__block_invoke(uint64_t a1, unsigned int a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  float v7 = *(void **)(a1 + 32);
  if (a2 >= 2)
  {
    if (a2 == 2)
    {
      objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", 1), "floatValue");
      double v6 = v14;
      objc_msgSend((id)objc_msgSend(v7, "objectAtIndex:", 2), "floatValue");
      objc_msgSend((id)objc_msgSend(v7, "objectAtIndex:", 3), "floatValue");
      objc_msgSend((id)objc_msgSend(v7, "objectAtIndex:", 4), "floatValue");
    }
  }
  else
  {
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", 0), "floatValue");
    if (v12 >= 0.0) {
      float v12 = -v12;
    }
    CGFloat v13 = v12;
    v16.origin.CGFloat x = a3;
    v16.origin.CGFloat y = a4;
    v16.size.CGFloat width = a5;
    v16.size.CGFloat height = a6;
    *(void *)&double v6 = (unint64_t)CGRectInset(v16, v13, v13);
  }
  return v6;
}

+ (id)customAttributes
{
  v13[7] = *MEMORY[0x1E4F143B8];
  v12[0] = @"CIAttributeFilterCategories";
  v11[0] = @"CICategoryTransition";
  v11[1] = @"CICategoryVideo";
  v11[2] = @"CICategoryStillImage";
  v11[3] = @"CICategoryBuiltIn";
  v13[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:4];
  v13[1] = @"9";
  v12[1] = @"CIAttributeFilterAvailable_iOS";
  v12[2] = @"CIAttributeFilterAvailable_Mac";
  v13[2] = @"10.4";
  v12[3] = @"inputTime";
  v9[0] = @"CIAttributeMin";
  v9[1] = @"CIAttributeSliderMin";
  v10[0] = &unk_1EE4A99F0;
  v10[1] = &unk_1EE4A99F0;
  v9[2] = @"CIAttributeSliderMax";
  v9[3] = @"CIAttributeDefault";
  v10[2] = &unk_1EE4A9A00;
  v10[3] = &unk_1EE4A99F0;
  v9[4] = @"CIAttributeType";
  v10[4] = @"CIAttributeTypeTime";
  v13[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:5];
  v12[4] = @"inputWidth";
  v7[0] = @"CIAttributeMin";
  v7[1] = @"CIAttributeSliderMin";
  v8[0] = &unk_1EE4A9A00;
  v8[1] = &unk_1EE4A9A10;
  v7[2] = @"CIAttributeSliderMax";
  v7[3] = @"CIAttributeDefault";
  v8[2] = &unk_1EE4A9A20;
  v8[3] = &unk_1EE4A9A30;
  v7[4] = @"CIAttributeType";
  v8[4] = @"CIAttributeTypeDistance";
  v13[4] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:5];
  v12[5] = @"inputScale";
  v5[0] = @"CIAttributeMin";
  v5[1] = @"CIAttributeSliderMin";
  v6[0] = &unk_1EE4A9A40;
  v6[1] = &unk_1EE4A9A40;
  v5[2] = @"CIAttributeSliderMax";
  v5[3] = @"CIAttributeDefault";
  v6[2] = &unk_1EE4A9A50;
  v6[3] = &unk_1EE4A9A50;
  v5[4] = @"CIAttributeIdentity";
  v5[5] = @"CIAttributeType";
  v6[4] = &unk_1EE4A99F0;
  v6[5] = @"CIAttributeTypeScalar";
  v13[5] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:6];
  v12[6] = @"inputExtent";
  v3[1] = @"CIAttributeDefault";
  v4[0] = @"CIAttributeTypeRectangle";
  v3[0] = @"CIAttributeType";
  v4[1] = +[CIVector vectorWithX:0.0 Y:0.0 Z:300.0 W:300.0];
  v13[6] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:2];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:7];
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

- (CIImage)inputShadingImage
{
  return self->inputShadingImage;
}

- (void)setInputShadingImage:(id)a3
{
}

@end