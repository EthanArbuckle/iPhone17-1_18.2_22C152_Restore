@interface CISunbeamsGenerator
+ (id)customAttributes;
- (id)_CISunbeams;
- (id)outputImage;
@end

@implementation CISunbeamsGenerator

- (id)_CISunbeams
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_sunbeams];
}

- (id)outputImage
{
  v34[4] = *MEMORY[0x1E4F143B8];
  [(NSNumber *)self->inputSunRadius floatValue];
  float v4 = fmaxf(v3, 0.0);
  [(NSNumber *)self->inputMaxStriationRadius floatValue];
  float v6 = fmaxf(v5, 0.0);
  [(NSNumber *)self->inputStriationStrength floatValue];
  float v8 = fmaxf(v7, 0.0);
  [(NSNumber *)self->inputStriationContrast floatValue];
  float v10 = v9;
  [(NSNumber *)self->inputTime floatValue];
  float v12 = (v11 + v11) * 3.14159265;
  id v13 = +[CIImage noiseImage];
  __float2 v14 = __sincosf_stret(v12);
  v15 = +[CIVector vectorWithX:v14.__cosval * 30.0 + 128.0 Y:v14.__sinval * 30.0 + 128.0];
  float v16 = v8 * v10;
  float v17 = v8 * 0.5 * (1.0 - v10);
  float v18 = v4 * v6;
  [(CIVector *)self->inputCenter X];
  double v20 = v19;
  [(CIVector *)self->inputCenter Y];
  double v22 = v21;
  [(CIVector *)v15 X];
  double v24 = v23;
  [(CIVector *)v15 Y];
  v26 = +[CIVector vectorWithX:v20 Y:v22 Z:v24 W:v25];
  v27 = +[CIVector vectorWithX:(float)(v4 * v4) Y:1.0 / v18 Z:v16 W:v17];
  id v28 = [(CISunbeamsGenerator *)self _CISunbeams];
  [(CIVector *)self->inputCenter X];
  double v30 = v29 - v18;
  [(CIVector *)self->inputCenter Y];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __34__CISunbeamsGenerator_outputImage__block_invoke;
  v33[3] = &unk_1E57716D0;
  v33[4] = v15;
  v34[0] = v13;
  v34[1] = v26;
  v34[2] = v27;
  v34[3] = self->inputColor;
  return (id)objc_msgSend(v28, "applyWithExtent:roiCallback:arguments:", v33, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v34, 4, MEMORY[0x1E4F143A8], 3221225472, __34__CISunbeamsGenerator_outputImage__block_invoke, &unk_1E57716D0, v15), v30, v31 - v18, v18 + v18, v18 + v18);
}

double __34__CISunbeamsGenerator_outputImage__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  [v1 X];
  double v3 = v2 + -50.0;
  [v1 Y];
  double v5 = v4 + -50.0;
  uint64_t v6 = 0x4059000000000000;
  double v7 = v3;
  uint64_t v8 = 0x4059000000000000;

  *(void *)&double result = (unint64_t)CGRectInset(*(CGRect *)&v7, -1.0, -1.0);
  return result;
}

+ (id)customAttributes
{
  v17[9] = *MEMORY[0x1E4F143B8];
  v16[0] = @"CIAttributeFilterCategories";
  v15[0] = @"CICategoryGenerator";
  v15[1] = @"CICategoryVideo";
  v15[2] = @"CICategoryStillImage";
  v15[3] = @"CICategoryHighDynamicRange";
  v15[4] = @"CICategoryBuiltIn";
  v17[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:5];
  v17[1] = @"9";
  v16[1] = @"CIAttributeFilterAvailable_iOS";
  v16[2] = @"CIAttributeFilterAvailable_Mac";
  v17[2] = @"10.4";
  v16[3] = @"inputColor";
  id v13 = @"CIAttributeDefault";
  __float2 v14 = +[CIColor colorWithRed:1.0 green:0.5 blue:0.0];
  v17[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v14 forKeys:&v13 count:1];
  v16[4] = @"inputSunRadius";
  v11[0] = @"CIAttributeMin";
  v11[1] = @"CIAttributeSliderMin";
  v12[0] = &unk_1EE4A9EA0;
  v12[1] = &unk_1EE4A9EA0;
  v11[2] = @"CIAttributeSliderMax";
  v11[3] = @"CIAttributeDefault";
  v12[2] = &unk_1EE4A9EB0;
  v12[3] = &unk_1EE4A9EC0;
  v11[4] = @"CIAttributeIdentity";
  v11[5] = @"CIAttributeType";
  v12[4] = &unk_1EE4A9EC0;
  v12[5] = @"CIAttributeTypeDistance";
  v17[4] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:6];
  v16[5] = @"inputMaxStriationRadius";
  v9[0] = @"CIAttributeMin";
  v9[1] = @"CIAttributeSliderMin";
  v10[0] = &unk_1EE4A9EA0;
  v10[1] = &unk_1EE4A9EA0;
  v9[2] = @"CIAttributeSliderMax";
  v9[3] = @"CIAttributeDefault";
  v10[2] = &unk_1EE4A9ED0;
  v10[3] = &unk_1EE4A9EE0;
  v9[4] = @"CIAttributeIdentity";
  v9[5] = @"CIAttributeType";
  v10[4] = &unk_1EE4A9EE0;
  v10[5] = @"CIAttributeTypeScalar";
  v17[5] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:6];
  v16[6] = @"inputStriationStrength";
  v7[0] = @"CIAttributeMin";
  v7[1] = @"CIAttributeSliderMin";
  v8[0] = &unk_1EE4A9EA0;
  v8[1] = &unk_1EE4A9EA0;
  v7[2] = @"CIAttributeSliderMax";
  v7[3] = @"CIAttributeDefault";
  v8[2] = &unk_1EE4A9EF0;
  v8[3] = &unk_1EE4A9F00;
  v7[4] = @"CIAttributeIdentity";
  v7[5] = @"CIAttributeType";
  v8[4] = &unk_1EE4A9F00;
  v8[5] = @"CIAttributeTypeScalar";
  v17[6] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:6];
  v16[7] = @"inputStriationContrast";
  v5[0] = @"CIAttributeMin";
  v5[1] = @"CIAttributeSliderMin";
  v6[0] = &unk_1EE4A9EA0;
  v6[1] = &unk_1EE4A9EA0;
  v5[2] = @"CIAttributeSliderMax";
  v5[3] = @"CIAttributeDefault";
  v6[2] = &unk_1EE4A9F10;
  v6[3] = &unk_1EE4A9F20;
  v5[4] = @"CIAttributeIdentity";
  v5[5] = @"CIAttributeType";
  v6[4] = &unk_1EE4A9F20;
  v6[5] = @"CIAttributeTypeScalar";
  v17[7] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:6];
  v16[8] = @"inputTime";
  v3[0] = @"CIAttributeMin";
  v3[1] = @"CIAttributeSliderMin";
  v4[0] = &unk_1EE4A9EA0;
  v4[1] = &unk_1EE4A9EA0;
  v3[2] = @"CIAttributeSliderMax";
  v3[3] = @"CIAttributeDefault";
  v4[2] = &unk_1EE4A9F30;
  v4[3] = &unk_1EE4A9EA0;
  v3[4] = @"CIAttributeIdentity";
  v3[5] = @"CIAttributeType";
  v4[4] = &unk_1EE4A9EA0;
  v4[5] = @"CIAttributeTypeScalar";
  v17[8] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:6];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:9];
}

@end