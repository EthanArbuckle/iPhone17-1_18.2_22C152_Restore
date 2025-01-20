@interface CISpotLight
+ (id)customAttributes;
- (CIImage)inputImage;
- (id)_CISpotLight;
- (id)outputImage;
- (void)setInputImage:(id)a3;
@end

@implementation CISpotLight

- (id)_CISpotLight
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_spotLight];
}

- (id)outputImage
{
  v37[5] = *MEMORY[0x1E4F143B8];
  [(NSNumber *)self->inputBrightness floatValue];
  float v36 = v3;
  [(NSNumber *)self->inputConcentration floatValue];
  float v5 = v4;
  [(CIVector *)self->inputLightPosition X];
  double v7 = v6;
  [(CIVector *)self->inputLightPointsAt X];
  float v9 = v7 - v8;
  [(CIVector *)self->inputLightPosition Y];
  double v11 = v10;
  [(CIVector *)self->inputLightPointsAt Y];
  float v13 = v11 - v12;
  [(CIVector *)self->inputLightPosition Z];
  double v15 = v14;
  [(CIVector *)self->inputLightPointsAt Z];
  float v17 = v15 - v16;
  float v18 = sqrtf((float)((float)(v13 * v13) + (float)(v9 * v9)) + (float)(v17 * v17));
  if (v18 != 0.0)
  {
    float v9 = v9 / v18;
    float v13 = v13 / v18;
    float v17 = v17 / v18;
  }
  float v19 = 1.0 / v5;
  id v20 = [(CISpotLight *)self _CISpotLight];
  [(CIImage *)self->inputImage extent];
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;
  inputLightPosition = self->inputLightPosition;
  v37[0] = self->inputImage;
  v37[1] = inputLightPosition;
  v37[2] = +[CIVector vectorWithX:v9 Y:v13 Z:v17];
  [(CIColor *)self->inputColor red];
  double v31 = v30 * v36;
  [(CIColor *)self->inputColor green];
  double v33 = v32 * v36;
  [(CIColor *)self->inputColor blue];
  v37[3] = +[CIVector vectorWithX:v31 Y:v33 Z:v34 * v36 W:1.0];
  v37[4] = +[CIVector vectorWithX:v19 Y:0.0];
  return (id)objc_msgSend(v20, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v37, 5), v22, v24, v26, v28);
}

+ (id)customAttributes
{
  v15[8] = *MEMORY[0x1E4F143B8];
  v14[0] = @"CIAttributeFilterCategories";
  v13[0] = @"CICategoryStylize";
  v13[1] = @"CICategoryVideo";
  v13[2] = @"CICategoryStillImage";
  v13[3] = @"CICategoryHighDynamicRange";
  v13[4] = @"CICategoryBuiltIn";
  v15[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:5];
  v15[1] = @"9";
  v14[1] = @"CIAttributeFilterAvailable_iOS";
  v14[2] = @"CIAttributeFilterAvailable_Mac";
  v15[2] = @"10.4";
  v14[3] = @"inputBrightness";
  v11[0] = @"CIAttributeMin";
  v11[1] = @"CIAttributeSliderMin";
  v12[0] = &unk_1EE4A9CE0;
  v12[1] = &unk_1EE4A9CE0;
  v11[2] = @"CIAttributeSliderMax";
  v11[3] = @"CIAttributeDefault";
  v12[2] = &unk_1EE4A9CF0;
  v12[3] = &unk_1EE4A9D00;
  v11[4] = @"CIAttributeIdentity";
  v11[5] = @"CIAttributeType";
  v12[4] = &unk_1EE4A9D10;
  v12[5] = @"CIAttributeTypeDistance";
  v15[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:6];
  v14[4] = @"inputConcentration";
  v9[0] = @"CIAttributeMin";
  v9[1] = @"CIAttributeSliderMin";
  v10[0] = &unk_1EE4A9D20;
  v10[1] = &unk_1EE4A9D20;
  v9[2] = @"CIAttributeSliderMax";
  v9[3] = @"CIAttributeDefault";
  v10[2] = &unk_1EE4A9D30;
  v10[3] = &unk_1EE4A9D40;
  v9[4] = @"CIAttributeIdentity";
  v9[5] = @"CIAttributeType";
  v10[4] = &unk_1EE4A9D50;
  v10[5] = @"CIAttributeTypeScalar";
  v15[4] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:6];
  v14[5] = @"inputColor";
  v7[0] = @"CIAttributeDefault";
  v7[1] = @"CIAttributeType";
  v8[0] = +[CIColor colorWithRed:1.0 green:1.0 blue:1.0];
  v8[1] = @"CIAttributeTypeOpaqueColor";
  v15[5] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];
  v14[6] = @"inputLightPosition";
  v5[0] = @"CIAttributeDefault";
  v5[1] = @"CIAttributeType";
  v6[0] = +[CIVector vectorWithX:400.0 Y:600.0 Z:150.0];
  v6[1] = @"CIAttributeTypePosition3";
  v15[6] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:2];
  v14[7] = @"inputLightPointsAt";
  v3[1] = @"CIAttributeType";
  v4[0] = +[CIVector vectorWithX:200.0, 200.0, 0.0, @"CIAttributeDefault" Y Z];
  v4[1] = @"CIAttributeTypePosition3";
  v15[7] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:2];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:8];
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
}

@end