@interface CISingleChannelColorMap
+ (id)customAttributes;
- (CIImage)inputImage;
- (NSNumber)inputChannelIndex;
- (NSNumber)inputColorMapIndex;
- (NSNumber)inputShouldNormalize;
- (id)outputImage;
- (void)setInputChannelIndex:(id)a3;
- (void)setInputColorMapIndex:(id)a3;
- (void)setInputImage:(id)a3;
- (void)setInputShouldNormalize:(id)a3;
@end

@implementation CISingleChannelColorMap

+ (id)customAttributes
{
  v11[6] = *MEMORY[0x1E4F143B8];
  v10[0] = @"CIAttributeFilterCategories";
  v9[0] = @"CICategoryColorEffect";
  v9[1] = @"CICategoryVideo";
  v9[2] = @"CICategoryInterlaced";
  v9[3] = @"CICategoryNonSquarePixels";
  v9[4] = @"CICategoryStillImage";
  v9[5] = @"CICategoryBuiltIn";
  v9[6] = @"CICategoryApplePrivate";
  v11[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:7];
  v10[1] = @"inputChannelIndex";
  v7[0] = @"CIAttributeType";
  v7[1] = @"CIAttributeDefault";
  v8[0] = @"CIAttributeTypeInteger";
  v8[1] = &unk_1EE4AA580;
  v7[2] = @"CIAttributeMin";
  v7[3] = @"CIAttributeMax";
  v8[2] = &unk_1EE4AA580;
  v8[3] = &unk_1EE4AA598;
  v11[1] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:4];
  v10[2] = @"inputShouldNormalize";
  v5[0] = @"CIAttributeType";
  v5[1] = @"CIAttributeDefault";
  v6[0] = @"CIAttributeTypeBoolean";
  v6[1] = MEMORY[0x1E4F1CC38];
  v11[2] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:2];
  v10[3] = @"inputColorMapIndex";
  v3[0] = @"CIAttributeType";
  v3[1] = @"CIAttributeDefault";
  v4[0] = @"CIAttributeTypeInteger";
  v4[1] = &unk_1EE4AA580;
  v3[2] = @"CIAttributeMin";
  v3[3] = @"CIAttributeMax";
  v4[2] = &unk_1EE4AA580;
  v4[3] = &unk_1EE4AA5B0;
  v11[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:4];
  v11[4] = @"14";
  v10[4] = @"CIAttributeFilterAvailable_iOS";
  v10[5] = @"CIAttributeFilterAvailable_Mac";
  v11[5] = @"11.0";
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:6];
}

- (id)outputImage
{
  v39[6] = *MEMORY[0x1E4F143B8];
  if (self->inputImage
    && ([(NSNumber *)self->inputColorMapIndex intValue] < 0
     || [(NSNumber *)self->inputColorMapIndex intValue] <= 1
      ? ([(NSNumber *)self->inputColorMapIndex intValue] < 0
       ? (uint64_t v3 = 0)
       : (uint64_t v3 = [(NSNumber *)self->inputColorMapIndex intValue]))
      : (uint64_t v3 = 1),
        [(NSNumber *)self->inputChannelIndex intValue] < 0
     || [(NSNumber *)self->inputChannelIndex intValue] <= 3
      ? ([(NSNumber *)self->inputChannelIndex intValue] < 0
       ? (uint64_t v4 = 0)
       : (uint64_t v4 = [(NSNumber *)self->inputChannelIndex intValue]))
      : (uint64_t v4 = 3),
        v5 = +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_ciSingleChannelColorMap), v6 = +[CIKernel kernelWithInternalRepresentation:&CI::_ciExtractChannel], v5))
  {
    v7 = v6;
    v39[0] = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:*(&colormaps + v3) length:2048 freeWhenDone:0];
    v38[0] = @"kCIImageProviderContentDigest";
    v38[1] = @"kCIImageProviderName";
    v39[1] = objc_msgSend(NSString, "stringWithFormat:", @"CISingleChannelColorMap_%d", v3);
    v39[2] = MEMORY[0x1E4F1CC28];
    v38[2] = @"CIImageFlipped";
    v38[3] = @"CIImageClampToEdge";
    v39[3] = MEMORY[0x1E4F1CC38];
    v39[4] = MEMORY[0x1E4F1CC38];
    v38[4] = @"kCIImageCacheHint";
    v38[5] = @"kCIImageAlphaOne";
    v39[5] = MEMORY[0x1E4F1CC38];
    uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:v38 count:6];
    v9 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DC88]);
    v10 = [CIImage alloc];
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __38__CISingleChannelColorMap_outputImage__block_invoke;
    v32[3] = &__block_descriptor_36_e24_v56__0_v8Q16Q24Q32Q40Q48l;
    int v33 = v3;
    v11 = [(CIImage *)v10 initWithImageProvider:v32 width:256 height:1 format:2056 colorSpace:v9 options:v8];
    CGColorSpaceRelease(v9);
    if (!v11) {
      return +[CIImage emptyImage];
    }
    inputImage = self->inputImage;
    [(CIImage *)inputImage extent];
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    v37[0] = inputImage;
    v37[1] = [NSNumber numberWithUnsignedInt:v4];
    v21 = -[CIColorKernel applyWithExtent:arguments:](v7, "applyWithExtent:arguments:", [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:2], v14, v16, v18, v20);
    if ([(NSNumber *)self->inputShouldNormalize BOOLValue])
    {
      v35 = @"inputExtent";
      [(CIImage *)v21 extent];
      v36 = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:");
      v21 = -[CIImage imageByApplyingFilter:withInputParameters:](v21, "imageByApplyingFilter:withInputParameters:", @"CIAreaMinMaxRedNormalize", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v36 forKeys:&v35 count:1]);
    }
    [(CIImage *)v21 extent];
    double v23 = v22;
    double v25 = v24;
    double v27 = v26;
    double v29 = v28;
    v34[0] = v21;
    v34[1] = [(CIImage *)v11 imageByClampingToExtent];
    v30 = -[CIKernel applyWithExtent:roiCallback:arguments:](v5, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_8, [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:2], v23, v25, v27, v29);

    return v30;
  }
  else
  {
    return +[CIImage emptyImage];
  }
}

void *__38__CISingleChannelColorMap_outputImage__block_invoke(uint64_t a1, void *__b, size_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  memset_pattern8(__b, &unk_193950998, a3);
  if (8 * a6 >= a3) {
    size_t v11 = a3;
  }
  else {
    size_t v11 = 8 * a6;
  }
  v12 = (char *)*(&colormaps + *(unsigned int *)(a1 + 32)) + 16 * a4;

  return memcpy(__b, v12, v11);
}

double __38__CISingleChannelColorMap_outputImage__block_invoke_2(uint64_t a1, int a2)
{
  if (a2 == 1) {
    return 0.0;
  }
  if (a2) {
    return *MEMORY[0x1E4F1DB28];
  }
  return result;
}

- (NSNumber)inputChannelIndex
{
  return self->inputChannelIndex;
}

- (void)setInputChannelIndex:(id)a3
{
}

- (NSNumber)inputShouldNormalize
{
  return self->inputShouldNormalize;
}

- (void)setInputShouldNormalize:(id)a3
{
}

- (NSNumber)inputColorMapIndex
{
  return self->inputColorMapIndex;
}

- (void)setInputColorMapIndex:(id)a3
{
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
}

@end