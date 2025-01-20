@interface CIColorCubeWithColorSpace
+ (id)customAttributes;
- (id)inputColorSpace;
- (id)outputImage;
- (void)setInputColorSpace:(id)a3;
@end

@implementation CIColorCubeWithColorSpace

+ (id)customAttributes
{
  v10[6] = *MEMORY[0x1E4F143B8];
  v9[0] = @"CIAttributeFilterCategories";
  v8[0] = @"CICategoryColorEffect";
  v8[1] = @"CICategoryVideo";
  v8[2] = @"CICategoryInterlaced";
  v8[3] = @"CICategoryNonSquarePixels";
  v8[4] = @"CICategoryStillImage";
  v8[5] = @"CICategoryHighDynamicRange";
  v8[6] = @"CICategoryBuiltIn";
  v10[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:7];
  v10[1] = @"7";
  v9[1] = @"CIAttributeFilterAvailable_iOS";
  v9[2] = @"CIAttributeFilterAvailable_Mac";
  v10[2] = @"10.9";
  v9[3] = @"inputCubeDimension";
  v6[0] = @"CIAttributeMin";
  v6[1] = @"CIAttributeMax";
  v7[0] = &unk_1EE4AA508;
  v7[1] = &unk_1EE4AA520;
  v6[2] = @"CIAttributeDefault";
  v6[3] = @"CIAttributeIdentity";
  v7[2] = &unk_1EE4AA508;
  v7[3] = &unk_1EE4AA508;
  v6[4] = @"CIAttributeType";
  v7[4] = @"CIAttributeTypeCount";
  v10[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:5];
  v9[4] = @"inputCubeData";
  v4[0] = @"CIAttributeDefault";
  if (defaultCube(void)::onceToken != -1) {
    dispatch_once(&defaultCube(void)::onceToken, &__block_literal_global_6);
  }
  v4[1] = @"CIAttributeIdentity";
  v5[0] = defaultCube(void)::data;
  v5[1] = defaultCube(void)::data;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:2];
  v9[5] = @"inputColorSpace";
  v10[4] = v2;
  v10[5] = MEMORY[0x1E4F1CC08];
  return (id)objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v10, v9, 6, v4[0]);
}

- (id)outputImage
{
  v19[3] = *MEMORY[0x1E4F143B8];
  if (!self->super.inputImage || ![(CIColorCube *)self _checkInputs]) {
    return 0;
  }
  id inputColorSpace = self->inputColorSpace;
  if (inputColorSpace == (id)[MEMORY[0x1E4F1CA98] null] || (id v4 = self->inputColorSpace) == 0)
  {
    id v4 = 0;
    inputImage = self->super.inputImage;
    char v7 = 1;
    goto LABEL_9;
  }
  CFTypeID v5 = CFGetTypeID(v4);
  if (v5 != CGColorSpaceGetTypeID() || CGColorSpaceGetModel((CGColorSpaceRef)v4) != kCGColorSpaceModelRGB)
  {
    NSLog(&cfstr_Cicolorcubewit.isa);
    return 0;
  }
  inputImage = [(CIImage *)self->super.inputImage imageByColorMatchingWorkingSpaceToColorSpace:v4];
  char v7 = 0;
LABEL_9:
  v8 = [(CIImage *)inputImage imageByUnpremultiplyingAlpha];
  int v9 = [(NSNumber *)self->super.inputCubeDimension intValue];
  v10 = +[CIVector vectorWithX:(double)v9 + -1.0 Y:1.0 / ((double)v9 + -1.0) Z:1.0 / (double)v9 W:1.0 / (double)(v9 * v9)];
  id v11 = [(CIColorCube *)self cubeImage];
  if ([v11 isOpaque]) {
    id v12 = [(CIColorCube *)self _kernelOpaque];
  }
  else {
    id v12 = [(CIColorCube *)self _kernel];
  }
  id v13 = v12;
  if ([(NSNumber *)self->super.inputExtrapolate BOOLValue])
  {
    if ([v11 isOpaque]) {
      id v13 = [(CIColorCube *)self _kernelOpaqueExtend];
    }
    else {
      id v13 = 0;
    }
  }
  [(CIImage *)v8 extent];
  v19[0] = v8;
  v19[1] = v11;
  v19[2] = v10;
  id result = (id)objc_msgSend((id)objc_msgSend(v13, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v19, 3), v15, v16, v17, v18), "imageByPremultiplyingAlpha");
  if ((v7 & 1) == 0) {
    return (id)[result imageByColorMatchingColorSpaceToWorkingSpace:v4];
  }
  return result;
}

- (id)inputColorSpace
{
  return self->inputColorSpace;
}

- (void)setInputColorSpace:(id)a3
{
}

@end