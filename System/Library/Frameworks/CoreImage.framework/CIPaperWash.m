@interface CIPaperWash
+ (id)customAttributes;
- (NSNumber)inputGreyscale;
- (NSNumber)inputSaturation;
- (id)outputImage;
- (void)setInputGreyscale:(id)a3;
- (void)setInputSaturation:(id)a3;
@end

@implementation CIPaperWash

+ (id)customAttributes
{
  v9[3] = *MEMORY[0x1E4F143B8];
  v8[0] = @"CIAttributeFilterCategories";
  v7[0] = @"CICategoryColorEffect";
  v7[1] = @"CICategoryNonSquarePixels";
  v7[2] = @"CICategoryStillImage";
  v7[3] = @"CICategoryBuiltIn";
  v7[4] = @"CICategoryApplePrivate";
  v9[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:5];
  v8[1] = @"inputGreyscale";
  v5[0] = @"CIAttributeMin";
  v5[1] = @"CIAttributeMax";
  v6[0] = MEMORY[0x1E4F1CC28];
  v6[1] = MEMORY[0x1E4F1CC38];
  v5[2] = @"CIAttributeDefault";
  v5[3] = @"CIAttributeType";
  v6[2] = MEMORY[0x1E4F1CC28];
  v6[3] = @"CIAttributeTypeBoolean";
  v9[1] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:4];
  v8[2] = @"inputSaturation";
  v3[0] = @"CIAttributeMin";
  v3[1] = @"CIAttributeSliderMin";
  v4[0] = &unk_1EE4A85D0;
  v4[1] = &unk_1EE4A85D0;
  v3[2] = @"CIAttributeSliderMax";
  v3[3] = @"CIAttributeMax";
  v4[2] = &unk_1EE4A8600;
  v4[3] = &unk_1EE4A8600;
  v3[4] = @"CIAttributeDefault";
  v3[5] = @"CIAttributeType";
  v4[4] = &unk_1EE4A8600;
  v4[5] = @"CIAttributeTypeScalar";
  v9[2] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:6];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:3];
}

- (id)outputImage
{
  v13[1] = *MEMORY[0x1E4F143B8];
  inputImage = self->inputImage;
  v12 = @"inputAmount";
  v13[0] = &unk_1EE4AB570;
  v4 = -[CIImage imageByApplyingFilter:withInputParameters:](inputImage, "imageByApplyingFilter:withInputParameters:", @"CIDocumentEnhancer", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1]);
  [(NSNumber *)self->inputSaturation floatValue];
  float v6 = fminf(fmaxf(*(float *)&v5, 0.0), 1.0);
  if (v6 < 1.0)
  {
    v10[0] = @"inputSaturation";
    *(float *)&double v5 = v6;
    v11[0] = [NSNumber numberWithFloat:v5];
    v11[1] = &unk_1EE4A8610;
    v10[1] = @"inputBrightness";
    v10[2] = @"inputContrast";
    v11[2] = [NSNumber numberWithDouble:(float)(1.0 - v6) * 0.35 + 1.0];
    v4 = -[CIImage imageByApplyingFilter:withInputParameters:](v4, "imageByApplyingFilter:withInputParameters:", @"CIColorControls", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:3]);
  }
  if ([(NSNumber *)self->inputGreyscale BOOLValue])
  {
    v8[0] = @"inputSaturation";
    v8[1] = @"inputBrightness";
    v9[0] = &unk_1EE4A85D0;
    v9[1] = &unk_1EE4AB5E0;
    v8[2] = @"inputContrast";
    v9[2] = &unk_1EE4AB5F0;
    return -[CIImage imageByApplyingFilter:withInputParameters:](v4, "imageByApplyingFilter:withInputParameters:", @"CIColorControls", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:3]);
  }
  return v4;
}

- (NSNumber)inputSaturation
{
  return self->inputSaturation;
}

- (void)setInputSaturation:(id)a3
{
}

- (NSNumber)inputGreyscale
{
  return self->inputGreyscale;
}

- (void)setInputGreyscale:(id)a3
{
}

@end