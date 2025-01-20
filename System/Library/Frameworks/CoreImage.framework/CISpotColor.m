@interface CISpotColor
+ (id)customAttributes;
- (CIImage)inputImage;
- (id)_CISpotColor;
- (id)outputImage;
- (void)setInputImage:(id)a3;
@end

@implementation CISpotColor

- (id)_CISpotColor
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_spotColor];
}

+ (id)customAttributes
{
  v29[15] = *MEMORY[0x1E4F143B8];
  v28[0] = @"CIAttributeFilterCategories";
  v27[0] = @"CICategoryBuiltIn";
  v27[1] = @"CICategoryStillImage";
  v27[2] = @"CICategoryVideo";
  v27[3] = @"CICategoryHighDynamicRange";
  v27[4] = @"CICategoryStylize";
  v29[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:5];
  v29[1] = @"9";
  v28[1] = @"CIAttributeFilterAvailable_iOS";
  v28[2] = @"CIAttributeFilterAvailable_Mac";
  v29[2] = @"10.5";
  v28[3] = @"inputCloseness1";
  v25[0] = @"CIAttributeMin";
  v25[1] = @"CIAttributeSliderMin";
  v26[0] = &unk_1EE4A8170;
  v26[1] = &unk_1EE4A8170;
  v25[2] = @"CIAttributeSliderMax";
  v25[3] = @"CIAttributeDefault";
  v26[2] = &unk_1EE4A8200;
  v26[3] = &unk_1EE4A8210;
  v25[4] = @"CIAttributeClass";
  v25[5] = @"CIAttributeType";
  v26[4] = @"NSNumber";
  v26[5] = @"CIAttributeTypeScalar";
  v29[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:6];
  v28[4] = @"inputContrast1";
  v23[0] = @"CIAttributeMin";
  v23[1] = @"CIAttributeSliderMin";
  v24[0] = &unk_1EE4A8170;
  v24[1] = &unk_1EE4A8170;
  v23[2] = @"CIAttributeSliderMax";
  v23[3] = @"CIAttributeDefault";
  v24[2] = &unk_1EE4A81D0;
  v24[3] = &unk_1EE4A8220;
  v23[4] = @"CIAttributeClass";
  v23[5] = @"CIAttributeType";
  v24[4] = @"NSNumber";
  v24[5] = @"CIAttributeTypeScalar";
  v29[4] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:6];
  v28[5] = @"inputCenterColor1";
  v21 = @"CIAttributeDefault";
  v22 = +[CIColor colorWithRed:0.0784 green:0.0627 blue:0.0706];
  v29[5] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
  v28[6] = @"inputReplacementColor1";
  v19 = @"CIAttributeDefault";
  v20 = +[CIColor colorWithRed:0.4392 green:0.1922 blue:0.1961];
  v29[6] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v20 forKeys:&v19 count:1];
  v28[7] = @"inputCloseness2";
  v17[0] = @"CIAttributeMin";
  v17[1] = @"CIAttributeSliderMin";
  v18[0] = &unk_1EE4A8170;
  v18[1] = &unk_1EE4A8170;
  v17[2] = @"CIAttributeSliderMax";
  v17[3] = @"CIAttributeDefault";
  v18[2] = &unk_1EE4A8200;
  v18[3] = &unk_1EE4A8230;
  v17[4] = @"CIAttributeType";
  v18[4] = @"CIAttributeTypeScalar";
  v29[7] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:5];
  v28[8] = @"inputContrast2";
  v15[0] = @"CIAttributeMin";
  v15[1] = @"CIAttributeSliderMin";
  v16[0] = &unk_1EE4A8170;
  v16[1] = &unk_1EE4A8170;
  v15[2] = @"CIAttributeSliderMax";
  v15[3] = @"CIAttributeDefault";
  v16[2] = &unk_1EE4A81D0;
  v16[3] = &unk_1EE4A8220;
  v15[4] = @"CIAttributeType";
  v16[4] = @"CIAttributeTypeScalar";
  v29[8] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:5];
  v28[9] = @"inputCenterColor2";
  v13 = @"CIAttributeDefault";
  v14 = +[CIColor colorWithRed:0.5255 green:0.3059 blue:0.3451];
  v29[9] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v14 forKeys:&v13 count:1];
  v28[10] = @"inputReplacementColor2";
  v11 = @"CIAttributeDefault";
  v12 = +[CIColor colorWithRed:0.9137 green:0.5608 blue:0.5059];
  v29[10] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v12 forKeys:&v11 count:1];
  v28[11] = @"inputCloseness3";
  v9[0] = @"CIAttributeMin";
  v9[1] = @"CIAttributeSliderMin";
  v10[0] = &unk_1EE4A8170;
  v10[1] = &unk_1EE4A8170;
  v9[2] = @"CIAttributeSliderMax";
  v9[3] = @"CIAttributeDefault";
  v10[2] = &unk_1EE4A8200;
  v10[3] = &unk_1EE4A8200;
  v9[4] = @"CIAttributeType";
  v10[4] = @"CIAttributeTypeScalar";
  v29[11] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:5];
  v28[12] = @"inputContrast3";
  v7[0] = @"CIAttributeMin";
  v7[1] = @"CIAttributeSliderMin";
  v8[0] = &unk_1EE4A8170;
  v8[1] = &unk_1EE4A8170;
  v7[2] = @"CIAttributeSliderMax";
  v7[3] = @"CIAttributeDefault";
  v8[2] = &unk_1EE4A81D0;
  v8[3] = &unk_1EE4A8240;
  v7[4] = @"CIAttributeType";
  v8[4] = @"CIAttributeTypeScalar";
  v29[12] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:5];
  v28[13] = @"inputCenterColor3";
  v5 = @"CIAttributeDefault";
  v6 = +[CIColor colorWithRed:0.9216 green:0.4549 blue:0.3333];
  v29[13] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v6 forKeys:&v5 count:1];
  v28[14] = @"inputReplacementColor3";
  v3 = @"CIAttributeDefault";
  v4 = +[CIColor colorWithRed:0.9098 green:0.7529 blue:0.6078];
  v29[14] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v4 forKeys:&v3 count:1];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:15];
}

- (id)outputImage
{
  v27[9] = *MEMORY[0x1E4F143B8];
  [(NSNumber *)self->inputCloseness1 floatValue];
  double v4 = v3;
  [(NSNumber *)self->inputCloseness2 floatValue];
  double v6 = v5;
  [(NSNumber *)self->inputCloseness3 floatValue];
  v8 = +[CIVector vectorWithX:v4 Y:v6 Z:v7 W:0.0];
  [(NSNumber *)self->inputContrast1 floatValue];
  double v10 = (float)(1.0 / (float)(1.0 - v9));
  [(NSNumber *)self->inputContrast2 floatValue];
  double v12 = (float)(1.0 / (float)(1.0 - v11));
  [(NSNumber *)self->inputContrast3 floatValue];
  v14 = +[CIVector vectorWithX:v10 Y:v12 Z:(float)(1.0 / (float)(1.0 - v13)) W:0.0];
  id v15 = [(CISpotColor *)self _CISpotColor];
  [(CIImage *)self->inputImage extent];
  inputCenterColor1 = self->inputCenterColor1;
  inputReplacementColor1 = self->inputReplacementColor1;
  inputCenterColor2 = self->inputCenterColor2;
  inputReplacementColor2 = self->inputReplacementColor2;
  v27[0] = self->inputImage;
  v27[1] = inputCenterColor1;
  inputCenterColor3 = self->inputCenterColor3;
  v27[2] = inputReplacementColor1;
  v27[3] = inputCenterColor2;
  inputReplacementColor3 = self->inputReplacementColor3;
  v27[4] = inputReplacementColor2;
  void v27[5] = inputCenterColor3;
  v27[6] = inputReplacementColor3;
  v27[7] = v8;
  v27[8] = v14;
  return (id)objc_msgSend(v15, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v27, 9), v22, v23, v24, v25);
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
}

@end