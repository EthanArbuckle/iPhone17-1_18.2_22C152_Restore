@interface CIColorControls
+ (id)customAttributes;
- (CIImage)inputImage;
- (NSNumber)inputBrightness;
- (NSNumber)inputContrast;
- (NSNumber)inputSaturation;
- (id)outputImage;
- (void)setInputBrightness:(id)a3;
- (void)setInputContrast:(id)a3;
- (void)setInputImage:(id)a3;
- (void)setInputSaturation:(id)a3;
@end

@implementation CIColorControls

+ (id)customAttributes
{
  v11[6] = *MEMORY[0x1E4F143B8];
  v10[0] = @"CIAttributeFilterCategories";
  v9[0] = @"CICategoryColorAdjustment";
  v9[1] = @"CICategoryVideo";
  v9[2] = @"CICategoryStillImage";
  v9[3] = @"CICategoryInterlaced";
  v9[4] = @"CICategoryNonSquarePixels";
  v9[5] = @"CICategoryHighDynamicRange";
  v9[6] = @"CICategoryBuiltIn";
  v11[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:7];
  v11[1] = @"5";
  v10[1] = @"CIAttributeFilterAvailable_iOS";
  v10[2] = @"CIAttributeFilterAvailable_Mac";
  v11[2] = @"10.4";
  v10[3] = @"inputSaturation";
  v7[0] = @"CIAttributeMin";
  v7[1] = @"CIAttributeSliderMin";
  v8[0] = &unk_1EE4A8010;
  v8[1] = &unk_1EE4A8010;
  v7[2] = @"CIAttributeSliderMax";
  v7[3] = @"CIAttributeDefault";
  v8[2] = &unk_1EE4A8020;
  v8[3] = &unk_1EE4A8030;
  v7[4] = @"CIAttributeIdentity";
  v7[5] = @"CIAttributeType";
  v8[4] = &unk_1EE4A8030;
  v8[5] = @"CIAttributeTypeScalar";
  v11[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:6];
  v10[4] = @"inputBrightness";
  v5[0] = @"CIAttributeMin";
  v5[1] = @"CIAttributeSliderMin";
  v6[0] = &unk_1EE4A8040;
  v6[1] = &unk_1EE4A8040;
  v5[2] = @"CIAttributeSliderMax";
  v5[3] = @"CIAttributeDefault";
  v6[2] = &unk_1EE4A8030;
  v6[3] = &unk_1EE4A8010;
  v5[4] = @"CIAttributeIdentity";
  v5[5] = @"CIAttributeType";
  v6[4] = &unk_1EE4A8010;
  v6[5] = @"CIAttributeTypeScalar";
  v11[4] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:6];
  v10[5] = @"inputContrast";
  v3[0] = @"CIAttributeMin";
  v3[1] = @"CIAttributeSliderMin";
  v4[0] = &unk_1EE4A8010;
  v4[1] = &unk_1EE4A8050;
  v3[2] = @"CIAttributeSliderMax";
  v3[3] = @"CIAttributeDefault";
  v4[2] = &unk_1EE4A8060;
  v4[3] = &unk_1EE4A8030;
  v3[4] = @"CIAttributeIdentity";
  v3[5] = @"CIAttributeType";
  v4[4] = &unk_1EE4A8030;
  v4[5] = @"CIAttributeTypeScalar";
  v11[5] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:6];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:6];
}

- (id)outputImage
{
  if (!self->inputImage) {
    return 0;
  }
  [(NSNumber *)self->inputSaturation floatValue];
  float v4 = v3;
  [(NSNumber *)self->inputContrast floatValue];
  float v6 = v5;
  [(NSNumber *)self->inputBrightness floatValue];
  BOOL v10 = v4 == 1.0 && v6 == 1.0;
  if (v10 && v7 == 0.0)
  {
    v11 = self->inputImage;
    return v11;
  }
  else
  {
    *(float *)&double v8 = v6 - (float)(v4 * v6);
    *(float *)&double v9 = (float)(v7 + 0.5) + (float)(v6 * -0.5);
    return _imageByApplyingColorMatrix(self->inputImage, (float)(v4 * v6) + (float)(*(float *)&v8 * 0.2125), *(float *)&v8 * 0.7154, *(float *)&v8 * 0.0721, *(float *)&v8 * 0.2125, (float)(v4 * v6) + (float)(*(float *)&v8 * 0.7154), *(float *)&v8 * 0.0721, v8, v9, *(float *)&v8 * 0.2125, *(float *)&v8 * 0.7154, (float)(v4 * v6) + (float)(*(float *)&v8 * 0.0721), *(float *)&v9, *(float *)&v9, *(float *)&v9);
  }
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
}

- (NSNumber)inputSaturation
{
  return self->inputSaturation;
}

- (void)setInputSaturation:(id)a3
{
}

- (NSNumber)inputBrightness
{
  return self->inputBrightness;
}

- (void)setInputBrightness:(id)a3
{
}

- (NSNumber)inputContrast
{
  return self->inputContrast;
}

- (void)setInputContrast:(id)a3
{
}

@end