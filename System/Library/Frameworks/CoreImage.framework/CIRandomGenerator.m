@interface CIRandomGenerator
+ (id)customAttributes;
- (id)_kernel;
- (id)outputImage;
@end

@implementation CIRandomGenerator

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_paddedTile];
}

+ (id)customAttributes
{
  v5[3] = *MEMORY[0x1E4F143B8];
  v4[0] = @"CIAttributeFilterCategories";
  v3[0] = @"CICategoryGenerator";
  v3[1] = @"CICategoryVideo";
  v3[2] = @"CICategoryStillImage";
  v3[3] = @"CICategoryBuiltIn";
  v5[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:4];
  v5[1] = @"6";
  v4[1] = @"CIAttributeFilterAvailable_iOS";
  v4[2] = @"CIAttributeFilterAvailable_Mac";
  v5[2] = @"10.4";
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:3];
}

- (id)outputImage
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v3 = +[CIImage noiseImagePadded];
  [v3 extent];
  double v5 = v4 + -2.0;
  [v3 extent];
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  uint64_t v13 = v12;
  id v14 = [(CIRandomGenerator *)self _kernel];
  double v15 = *(double *)(MEMORY[0x1E4F1DB10] + 8);
  double v19 = *MEMORY[0x1E4F1DB10];
  double v17 = *(double *)(MEMORY[0x1E4F1DB10] + 16);
  double v16 = *(double *)(MEMORY[0x1E4F1DB10] + 24);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __32__CIRandomGenerator_outputImage__block_invoke;
  v20[3] = &__block_descriptor_64_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
  v20[4] = v7;
  v20[5] = v9;
  v20[6] = v11;
  v20[7] = v13;
  v21[0] = +[CIVector vectorWithX:v5 Y:v5 Z:1.0 / v5 W:1.0 / v5];
  return (id)objc_msgSend(v14, "applyWithExtent:roiCallback:inputImage:arguments:", v20, v3, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v21, 1), v19, v15, v17, v16);
}

double __32__CIRandomGenerator_outputImage__block_invoke(uint64_t a1)
{
  return *(double *)(a1 + 32);
}

@end