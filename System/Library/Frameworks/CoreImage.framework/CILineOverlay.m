@interface CILineOverlay
+ (id)customAttributes;
- (CIImage)inputImage;
- (id)_CIColorControls;
- (id)_CIComicNoiseReduction;
- (id)_CISobelEdges;
- (id)outputImage;
- (void)setInputImage:(id)a3;
@end

@implementation CILineOverlay

- (id)_CISobelEdges
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_sobelEdges];
}

- (id)_CIComicNoiseReduction
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_noiseComicReduction];
}

- (id)_CIColorControls
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_colorControls];
}

+ (id)customAttributes
{
  v15[8] = *MEMORY[0x1E4F143B8];
  v14[0] = @"CIAttributeFilterCategories";
  v13[0] = @"CICategoryBuiltIn";
  v13[1] = @"CICategoryStillImage";
  v13[2] = @"CICategoryVideo";
  v13[3] = @"CICategoryStylize";
  v15[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:4];
  v15[1] = @"9";
  v14[1] = @"CIAttributeFilterAvailable_iOS";
  v14[2] = @"CIAttributeFilterAvailable_Mac";
  v15[2] = @"10.5";
  v14[3] = @"inputNRSharpness";
  v11[0] = @"CIAttributeMin";
  v11[1] = @"CIAttributeSliderMin";
  v12[0] = &unk_1EE4A8170;
  v12[1] = &unk_1EE4A8170;
  v11[2] = @"CIAttributeSliderMax";
  v11[3] = @"CIAttributeDefault";
  v12[2] = &unk_1EE4A8180;
  v12[3] = &unk_1EE4A8190;
  v11[4] = @"CIAttributeIdentity";
  v11[5] = @"CIAttributeClass";
  v12[4] = &unk_1EE4A8170;
  v12[5] = @"NSNumber";
  v11[6] = @"CIAttributeType";
  v12[6] = @"CIAttributeTypeScalar";
  v15[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:7];
  v14[4] = @"inputNRNoiseLevel";
  v9[0] = @"CIAttributeMin";
  v9[1] = @"CIAttributeSliderMin";
  v10[0] = &unk_1EE4A8170;
  v10[1] = &unk_1EE4A8170;
  v9[2] = @"CIAttributeSliderMax";
  v9[3] = @"CIAttributeDefault";
  v10[2] = &unk_1EE4A81A0;
  v10[3] = &unk_1EE4A81B0;
  v9[4] = @"CIAttributeIdentity";
  v9[5] = @"CIAttributeClass";
  v10[4] = &unk_1EE4A8170;
  v10[5] = @"NSNumber";
  v9[6] = @"CIAttributeType";
  v10[6] = @"CIAttributeTypeScalar";
  v15[4] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:7];
  v14[5] = @"inputEdgeIntensity";
  v7[0] = @"CIAttributeMin";
  v7[1] = @"CIAttributeSliderMin";
  v8[0] = &unk_1EE4A8170;
  v8[1] = &unk_1EE4A8170;
  v7[2] = @"CIAttributeSliderMax";
  v7[3] = @"CIAttributeDefault";
  v8[2] = &unk_1EE4A81C0;
  v8[3] = &unk_1EE4A81D0;
  v7[4] = @"CIAttributeIdentity";
  v7[5] = @"CIAttributeClass";
  v8[4] = &unk_1EE4A8170;
  v8[5] = @"NSNumber";
  v7[6] = @"CIAttributeType";
  v8[6] = @"CIAttributeTypeScalar";
  v15[5] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:7];
  v14[6] = @"inputThreshold";
  v5[0] = @"CIAttributeMin";
  v5[1] = @"CIAttributeSliderMin";
  v6[0] = &unk_1EE4A8170;
  v6[1] = &unk_1EE4A8170;
  v5[2] = @"CIAttributeSliderMax";
  v5[3] = @"CIAttributeDefault";
  v6[2] = &unk_1EE4A81D0;
  v6[3] = &unk_1EE4A81A0;
  v5[4] = @"CIAttributeIdentity";
  v5[5] = @"CIAttributeClass";
  v6[4] = &unk_1EE4A8170;
  v6[5] = @"NSNumber";
  v5[6] = @"CIAttributeType";
  v6[6] = @"CIAttributeTypeScalar";
  v15[6] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:7];
  v14[7] = @"inputContrast";
  v3[0] = @"CIAttributeMin";
  v3[1] = @"CIAttributeSliderMin";
  v4[0] = &unk_1EE4A81E0;
  v4[1] = &unk_1EE4A81E0;
  v3[2] = @"CIAttributeSliderMax";
  v3[3] = @"CIAttributeDefault";
  v4[2] = &unk_1EE4A81C0;
  v4[3] = &unk_1EE4A81F0;
  v3[4] = @"CIAttributeIdentity";
  v3[5] = @"CIAttributeClass";
  v4[4] = &unk_1EE4A81D0;
  v4[5] = @"NSNumber";
  v3[6] = @"CIAttributeType";
  v4[6] = @"CIAttributeTypeScalar";
  v15[7] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:7];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:8];
}

- (id)outputImage
{
  v30[4] = *MEMORY[0x1E4F143B8];
  [(NSNumber *)self->inputNRSharpness floatValue];
  float v4 = v3;
  [(NSNumber *)self->inputNRNoiseLevel floatValue];
  if (v5 <= 0.0)
  {
    double v7 = (float)-v4;
    double v8 = 0.0;
  }
  else
  {
    float v6 = (v4 + 1.0) / -0.0199999996;
    double v7 = (float)-(float)(v4 + (float)(v6 * v5));
    double v8 = v6 / 3.0;
  }
  v9 = +[CIVector vectorWithX:v7 Y:v8 Z:(float)-v4];
  v10 = +[CIVector vectorWithX:1.2912 Y:1.2921];
  v11 = +[CIVector vectorWithX:0.109088909 Y:0.114934928 Z:0.103904704];
  id v12 = [(CILineOverlay *)self _CIComicNoiseReduction];
  [(CIImage *)self->inputImage extent];
  v30[0] = self->inputImage;
  v30[1] = v10;
  v30[2] = v11;
  v30[3] = v9;
  v17 = objc_msgSend(v12, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_10, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v30, 4), v13, v14, v15, v16);
  id v18 = [(CILineOverlay *)self _CISobelEdges];
  [v17 extent];
  CGRect v32 = CGRectInset(v31, -1.0, -1.0);
  inputEdgeIntensity = self->inputEdgeIntensity;
  v29[0] = v17;
  v29[1] = inputEdgeIntensity;
  v20 = objc_msgSend(v18, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_58, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v29, 2), v32.origin.x, v32.origin.y, v32.size.width, v32.size.height);
  id v21 = [(CILineOverlay *)self _CIColorControls];
  [v20 extent];
  inputThreshold = self->inputThreshold;
  v28[0] = v20;
  v28[1] = inputThreshold;
  v28[2] = self->inputContrast;
  return (id)objc_msgSend(v21, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v28, 3), v23, v24, v25, v26);
}

double __28__CILineOverlay_outputImage__block_invoke(double a1, double a2, double a3, double a4)
{
  *(void *)&double result = (unint64_t)CGRectInset(*(CGRect *)&a1, -2.0, -2.0);
  return result;
}

double __28__CILineOverlay_outputImage__block_invoke_2(double a1, double a2, double a3, double a4)
{
  *(void *)&double result = (unint64_t)CGRectInset(*(CGRect *)&a1, -1.0, -1.0);
  return result;
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
}

@end