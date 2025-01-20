@interface CIPhotoGrain
+ (id)customAttributes;
- (CIImage)inputImage;
- (NSNumber)inputAmount;
- (NSNumber)inputISO;
- (NSNumber)inputSeed;
- (id)_grainBlendAndMixKernel;
- (id)_interpolateGrainKernel;
- (id)_paddedTileKernel;
- (id)outputImage;
- (void)setInputAmount:(id)a3;
- (void)setInputISO:(id)a3;
- (void)setInputImage:(id)a3;
- (void)setInputSeed:(id)a3;
@end

@implementation CIPhotoGrain

- (id)_interpolateGrainKernel
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_blendGrains];
}

- (id)_grainBlendAndMixKernel
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_grainBlendAndMix];
}

- (id)_paddedTileKernel
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_paddedTile2];
}

+ (id)customAttributes
{
  v11[4] = *MEMORY[0x1E4F143B8];
  v10[0] = @"CIAttributeFilterCategories";
  v9[0] = @"CICategoryColorEffect";
  v9[1] = @"CICategoryVideo";
  v9[2] = @"CICategoryInterlaced";
  v9[3] = @"CICategoryNonSquarePixels";
  v9[4] = @"CICategoryStillImage";
  v9[5] = @"CICategoryBuiltIn";
  v9[6] = @"CICategoryApplePrivate";
  v11[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:7];
  v10[1] = @"inputISO";
  v7[0] = @"CIAttributeMin";
  v7[1] = @"CIAttributeSliderMin";
  v8[0] = &unk_1EE4A96E0;
  v8[1] = &unk_1EE4A96E0;
  v7[2] = @"CIAttributeSliderMax";
  v7[3] = @"CIAttributeDefault";
  v8[2] = &unk_1EE4A96F0;
  v8[3] = &unk_1EE4A96E0;
  v7[4] = @"CIAttributeIdentity";
  v7[5] = @"CIAttributeType";
  v8[4] = &unk_1EE4A9700;
  v8[5] = @"CIAttributeTypeScalar";
  v11[1] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:6];
  v10[2] = @"inputAmount";
  v5[0] = @"CIAttributeMin";
  v5[1] = @"CIAttributeSliderMin";
  v6[0] = &unk_1EE4A9700;
  v6[1] = &unk_1EE4A9700;
  v5[2] = @"CIAttributeSliderMax";
  v5[3] = @"CIAttributeDefault";
  v6[2] = &unk_1EE4A9710;
  v6[3] = &unk_1EE4A9710;
  v5[4] = @"CIAttributeIdentity";
  v5[5] = @"CIAttributeType";
  v6[4] = &unk_1EE4A9700;
  v6[5] = @"CIAttributeTypeScalar";
  v11[2] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:6];
  v10[3] = @"inputSeed";
  v3[0] = @"CIAttributeMin";
  v3[1] = @"CIAttributeSliderMin";
  v4[0] = &unk_1EE4A9700;
  v4[1] = &unk_1EE4A9700;
  v3[2] = @"CIAttributeSliderMax";
  v3[3] = @"CIAttributeDefault";
  v4[2] = &unk_1EE4A9710;
  v4[3] = &unk_1EE4A9700;
  v3[4] = @"CIAttributeType";
  v4[4] = @"CIAttributeTypeScalar";
  v11[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:5];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:4];
}

- (id)outputImage
{
  v64[2] = *MEMORY[0x1E4F143B8];
  if (!self->inputImage) {
    return 0;
  }
  [(NSNumber *)self->inputAmount floatValue];
  if (v3 < 0.001) {
    return self->inputImage;
  }
  [(NSNumber *)self->inputISO floatValue];
  float v6 = fminf(fmaxf(v5, 10.0), 3200.0);
  float v7 = log10f(v6);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __27__CIPhotoGrain_outputImage__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = self;
  if (-[CIPhotoGrain outputImage]::onceToken != -1) {
    dispatch_once(&-[CIPhotoGrain outputImage]::onceToken, block);
  }
  v8 = (void *)-[CIPhotoGrain outputImage]::inputGrain;
  if (!-[CIPhotoGrain outputImage]::inputGrain) {
    return 0;
  }
  float v54 = v6;
  CGAffineTransformMakeTranslation(&v60, -1.0, -1.0);
  v9 = (void *)[v8 imageByApplyingTransform:&v60];
  id v10 = [(CIPhotoGrain *)self _interpolateGrainKernel];
  [v9 extent];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  v64[0] = v9;
  float v55 = v7;
  *(float *)&double v11 = v7;
  v64[1] = [NSNumber numberWithFloat:v11];
  v19 = objc_msgSend(v10, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v64, 2), v12, v14, v16, v18);
  [v19 extent];
  double v21 = v20 + -2.0;
  [v19 extent];
  uint64_t v23 = v22;
  uint64_t v25 = v24;
  uint64_t v27 = v26;
  uint64_t v29 = v28;
  id v30 = [(CIPhotoGrain *)self _paddedTileKernel];
  double v31 = *(double *)(MEMORY[0x1E4F1DB10] + 16);
  double v52 = *(double *)(MEMORY[0x1E4F1DB10] + 8);
  double v53 = *MEMORY[0x1E4F1DB10];
  double v32 = *(double *)(MEMORY[0x1E4F1DB10] + 24);
  v59[0] = MEMORY[0x1E4F143A8];
  v59[1] = 3221225472;
  v59[2] = __27__CIPhotoGrain_outputImage__block_invoke_2;
  v59[3] = &__block_descriptor_64_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
  v59[4] = v23;
  v59[5] = v25;
  v59[6] = v27;
  v59[7] = v29;
  v63 = +[CIVector vectorWithX:v21 Y:v21 Z:1.0 / v21 W:1.0 / v21];
  v33 = objc_msgSend(v30, "applyWithExtent:roiCallback:inputImage:arguments:", v59, v19, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v63, 1), v53, v52, v31, v32);
  [(NSNumber *)self->inputSeed doubleValue];
  double __src = v34;
  if (v34 != 0.0)
  {
    XXH64_reset(v57, 0);
    XXH64_update((uint64_t)v57, (char *)&__src, 8uLL);
    unsigned int v35 = XXH64_digest((uint64_t)v57);
    CGAffineTransformMakeTranslation(&v56, (double)(v35 & 0x1FF), (double)((v35 >> 9) & 0x1FF));
    v33 = (void *)[v33 imageByApplyingTransform:&v56];
  }
  if (v54 < 400.0) {
    int v36 = 1;
  }
  else {
    int v36 = 2;
  }
  if (v54 >= 50.0) {
    unsigned int v37 = v36;
  }
  else {
    unsigned int v37 = 0;
  }
  float v38 = log10f(flt_1939550F0[v37]);
  float v39 = fmaxf(flt_193955100[v37]+ (float)((float)(flt_193955100[v37 + 1] - flt_193955100[v37])* (float)((float)(v55 - v38) / (float)(log10f(flt_1939550F0[v37 + 1]) - v38))), 0.2);
  v40 = [(CIImage *)self->inputImage imageByUnpremultiplyingAlpha];
  id v41 = [(CIPhotoGrain *)self _grainBlendAndMixKernel];
  [(CIImage *)v40 extent];
  double v43 = v42;
  double v45 = v44;
  double v47 = v46;
  double v49 = v48;
  v62[0] = v40;
  v62[1] = v33;
  *(float *)&double v42 = v39;
  uint64_t v50 = [NSNumber numberWithFloat:v42];
  inputAmount = self->inputAmount;
  v62[2] = v50;
  v62[3] = inputAmount;
  return (id)objc_msgSend((id)objc_msgSend(v41, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v62, 4), v43, v45, v47, v49), "imageByPremultiplyingAlpha");
}

id __27__CIPhotoGrain_outputImage__block_invoke()
{
  v3[1] = *MEMORY[0x1E4F143B8];
  id result = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B50], "bundleForClass:", objc_opt_class()), "pathForResource:ofType:", @"noiseImage", @"rgba");
  if (result)
  {
    uint64_t v1 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:result options:8 error:0];
    v2 = @"CIImageColorSpace";
    v3[0] = [MEMORY[0x1E4F1CA98] null];
    -[CIPhotoGrain outputImage]::inputGrain = +[CIImage imageWithBitmapData:bytesPerRow:size:format:options:](CIImage, "imageWithBitmapData:bytesPerRow:size:format:options:", v1, 2080, 264, [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:&v2 count:1], 514.0, 514.0);
    return (id)-[CIPhotoGrain outputImage]::inputGrain;
  }
  return result;
}

double __27__CIPhotoGrain_outputImage__block_invoke_2(uint64_t a1)
{
  return *(double *)(a1 + 32);
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
}

- (NSNumber)inputISO
{
  return self->inputISO;
}

- (void)setInputISO:(id)a3
{
}

- (NSNumber)inputAmount
{
  return self->inputAmount;
}

- (void)setInputAmount:(id)a3
{
}

- (NSNumber)inputSeed
{
  return self->inputSeed;
}

- (void)setInputSeed:(id)a3
{
}

@end