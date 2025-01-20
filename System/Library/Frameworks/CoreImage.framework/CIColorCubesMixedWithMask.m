@interface CIColorCubesMixedWithMask
+ (id)customAttributes;
- (BOOL)_checkInputs;
- (CIImage)inputImage;
- (CIImage)inputMaskImage;
- (NSData)inputCube0Data;
- (NSData)inputCube1Data;
- (NSNumber)inputCubeDimension;
- (NSNumber)inputExtrapolate;
- (id)inputColorSpace;
- (id)outputImage;
- (void)setInputColorSpace:(id)a3;
- (void)setInputCube0Data:(id)a3;
- (void)setInputCube1Data:(id)a3;
- (void)setInputCubeDimension:(id)a3;
- (void)setInputExtrapolate:(id)a3;
- (void)setInputImage:(id)a3;
- (void)setInputMaskImage:(id)a3;
@end

@implementation CIColorCubesMixedWithMask

+ (id)customAttributes
{
  v14[8] = *MEMORY[0x1E4F143B8];
  v13[0] = @"CIAttributeFilterCategories";
  v12[0] = @"CICategoryColorEffect";
  v12[1] = @"CICategoryVideo";
  v12[2] = @"CICategoryInterlaced";
  v12[3] = @"CICategoryNonSquarePixels";
  v12[4] = @"CICategoryStillImage";
  v12[5] = @"CICategoryHighDynamicRange";
  v12[6] = @"CICategoryBuiltIn";
  v14[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:7];
  v14[1] = @"11";
  v13[1] = @"CIAttributeFilterAvailable_iOS";
  v13[2] = @"CIAttributeFilterAvailable_Mac";
  v14[2] = @"10.13";
  v13[3] = @"inputCubeDimension";
  v10[0] = @"CIAttributeMin";
  v10[1] = @"CIAttributeMax";
  v11[0] = &unk_1EE4AA508;
  v11[1] = &unk_1EE4AA520;
  v10[2] = @"CIAttributeDefault";
  v10[3] = @"CIAttributeIdentity";
  v11[2] = &unk_1EE4AA508;
  v11[3] = &unk_1EE4AA508;
  v10[4] = @"CIAttributeType";
  v11[4] = @"CIAttributeTypeCount";
  v14[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:5];
  v13[4] = @"inputCube0Data";
  v8[0] = @"CIAttributeDefault";
  if (defaultCube(void)::onceToken != -1) {
    dispatch_once(&defaultCube(void)::onceToken, &__block_literal_global_6);
  }
  v8[1] = @"CIAttributeIdentity";
  v9[0] = defaultCube(void)::data;
  v9[1] = defaultCube(void)::data;
  v14[4] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];
  v13[5] = @"inputCube1Data";
  v6[0] = @"CIAttributeDefault";
  if (defaultCube(void)::onceToken != -1) {
    dispatch_once(&defaultCube(void)::onceToken, &__block_literal_global_6);
  }
  v6[1] = @"CIAttributeIdentity";
  v7[0] = defaultCube(void)::data;
  v7[1] = defaultCube(void)::data;
  v14[5] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];
  v13[6] = @"inputExtrapolate";
  v4[0] = @"CIAttributeDefault";
  v4[1] = @"CIAttributeMin";
  v5[0] = MEMORY[0x1E4F1CC28];
  v5[1] = MEMORY[0x1E4F1CC28];
  v4[2] = @"CIAttributeMax";
  v4[3] = @"CIAttributeType";
  v5[2] = MEMORY[0x1E4F1CC38];
  v5[3] = @"CIAttributeTypeBoolean";
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:4];
  v13[7] = @"inputColorSpace";
  v14[6] = v2;
  v14[7] = MEMORY[0x1E4F1CC08];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:8];
}

- (BOOL)_checkInputs
{
  int v3 = [(NSNumber *)self->inputCubeDimension intValue];
  if ((v3 - 65) > 0xFFFFFFC0)
  {
    int v4 = v3;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v5 = (4 * v4 * v4 * v4);
        if ([(NSData *)self->inputCube0Data length] == 4 * v5
          || [(NSData *)self->inputCube0Data length] == v5)
        {
          if ([(NSData *)self->inputCube1Data length] == 4 * v5
            || [(NSData *)self->inputCube1Data length] == v5)
          {
            return 1;
          }
          NSLog(&cfstr_CicolorcubeInp_5.isa);
        }
        else
        {
          NSLog(&cfstr_CicolorcubeInp_4.isa);
        }
      }
      else
      {
        NSLog(&cfstr_CicolorcubeInp_3.isa);
      }
    }
    else
    {
      NSLog(&cfstr_CicolorcubeInp_2.isa);
    }
  }
  else
  {
    NSLog(&cfstr_CicolorcubeInp.isa, 64);
  }
  return 0;
}

- (id)outputImage
{
  v11[2] = *MEMORY[0x1E4F143B8];
  if (!self->inputImage || ![(CIColorCubesMixedWithMask *)self _checkInputs]) {
    return 0;
  }
  if (self->inputColorSpace) {
    int v3 = @"CIColorCubeWithColorSpace";
  }
  else {
    int v3 = @"CIColorCube";
  }
  int v4 = +[CIFilter filterWithName:v3];
  [(CIFilter *)v4 setValue:self->inputImage forKey:@"inputImage"];
  [(CIFilter *)v4 setValue:self->inputCubeDimension forKey:@"inputCubeDimension"];
  [(CIFilter *)v4 setValue:self->inputExtrapolate forKey:@"inputExtrapolate"];
  id inputColorSpace = self->inputColorSpace;
  if (inputColorSpace) {
    [(CIFilter *)v4 setValue:inputColorSpace forKey:@"inputColorSpace"];
  }
  [(CIFilter *)v4 setValue:self->inputCube0Data forKey:@"inputCubeData"];
  uint64_t v6 = [(CIFilter *)v4 outputImage];
  [(CIFilter *)v4 setValue:self->inputCube1Data forKey:@"inputCubeData"];
  v7 = [(CIFilter *)v4 outputImage];
  v10[0] = @"inputBackgroundImage";
  v10[1] = @"inputMaskImage";
  v11[0] = v6;
  inputMaskImage = self->inputMaskImage;
  if (!inputMaskImage) {
    inputMaskImage = +[CIImage emptyImage];
  }
  v11[1] = inputMaskImage;
  return -[CIImage imageByApplyingFilter:withInputParameters:](v7, "imageByApplyingFilter:withInputParameters:", @"CIBlendWithMask", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2]);
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
}

- (CIImage)inputMaskImage
{
  return self->inputMaskImage;
}

- (void)setInputMaskImage:(id)a3
{
}

- (NSNumber)inputCubeDimension
{
  return self->inputCubeDimension;
}

- (void)setInputCubeDimension:(id)a3
{
}

- (NSData)inputCube0Data
{
  return self->inputCube0Data;
}

- (void)setInputCube0Data:(id)a3
{
}

- (NSData)inputCube1Data
{
  return self->inputCube1Data;
}

- (void)setInputCube1Data:(id)a3
{
}

- (id)inputColorSpace
{
  return self->inputColorSpace;
}

- (void)setInputColorSpace:(id)a3
{
}

- (NSNumber)inputExtrapolate
{
  return self->inputExtrapolate;
}

- (void)setInputExtrapolate:(id)a3
{
}

@end