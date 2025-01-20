@interface CIPercentileRed
+ (id)customAttributes;
- (NSNumber)inputClip;
- (NSNumber)inputCount;
- (NSNumber)inputHard;
- (NSNumber)inputNormalize;
- (NSNumber)inputPercentile;
- (NSNumber)inputScale;
- (id)outputImage;
- (void)setInputClip:(id)a3;
- (void)setInputCount:(id)a3;
- (void)setInputHard:(id)a3;
- (void)setInputNormalize:(id)a3;
- (void)setInputPercentile:(id)a3;
- (void)setInputScale:(id)a3;
@end

@implementation CIPercentileRed

+ (id)customAttributes
{
  v19[9] = *MEMORY[0x1E4F143B8];
  v18[0] = @"CIAttributeFilterCategories";
  v17[0] = @"CICategoryReduction";
  v17[1] = @"CICategoryVideo";
  v17[2] = @"CICategoryStillImage";
  v17[3] = @"CICategoryBuiltIn";
  v17[4] = @"CICategoryApplePrivate";
  v19[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:5];
  v18[1] = @"inputPercentile";
  v15[0] = @"CIAttributeMin";
  v15[1] = @"CIAttributeMax";
  v16[0] = &unk_1EE4AA478;
  v16[1] = &unk_1EE4AA4C0;
  v15[2] = @"CIAttributeDefault";
  v15[3] = @"CIAttributeIdentity";
  v16[2] = &unk_1EE4A7BD0;
  v16[3] = &unk_1EE4AA478;
  v15[4] = @"CIAttributeType";
  v16[4] = @"CIAttributeTypeScalar";
  v19[1] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:5];
  v18[2] = @"inputScale";
  v13[0] = @"CIAttributeMin";
  v13[1] = @"CIAttributeSliderMin";
  v14[0] = &unk_1EE4A7BC0;
  v14[1] = &unk_1EE4A7BC0;
  v13[2] = @"CIAttributeSliderMax";
  v13[3] = @"CIAttributeDefault";
  v14[2] = &unk_1EE4A7B70;
  v14[3] = &unk_1EE4A7B70;
  v13[4] = @"CIAttributeType";
  v14[4] = @"CIAttributeTypeScalar";
  v19[2] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:5];
  v18[3] = @"inputCount";
  v11[0] = @"CIAttributeMin";
  v11[1] = @"CIAttributeMax";
  v12[0] = &unk_1EE4AA4C0;
  v12[1] = &unk_1EE4AA4D8;
  v11[2] = @"CIAttributeDefault";
  v11[3] = @"CIAttributeType";
  v12[2] = &unk_1EE4AA4F0;
  v12[3] = @"CIAttributeTypeScalar";
  v19[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:4];
  v18[4] = @"inputNormalize";
  uint64_t v2 = MEMORY[0x1E4F1CC28];
  v9[0] = @"CIAttributeMin";
  v9[1] = @"CIAttributeMax";
  uint64_t v3 = MEMORY[0x1E4F1CC38];
  v10[0] = MEMORY[0x1E4F1CC28];
  v10[1] = MEMORY[0x1E4F1CC38];
  v9[2] = @"CIAttributeDefault";
  v9[3] = @"CIAttributeType";
  v10[2] = MEMORY[0x1E4F1CC38];
  v10[3] = @"CIAttributeTypeBoolean";
  v19[4] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:4];
  v18[5] = @"inputClip";
  v7[0] = @"CIAttributeMin";
  v7[1] = @"CIAttributeMax";
  v8[0] = v2;
  v8[1] = v3;
  v7[2] = @"CIAttributeDefault";
  v7[3] = @"CIAttributeType";
  v8[2] = v2;
  v8[3] = @"CIAttributeTypeBoolean";
  v19[5] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:4];
  v18[6] = @"inputHard";
  v5[0] = @"CIAttributeMin";
  v5[1] = @"CIAttributeMax";
  v6[0] = v2;
  v6[1] = v3;
  v5[2] = @"CIAttributeDefault";
  v5[3] = @"CIAttributeType";
  v6[2] = v2;
  v6[3] = @"CIAttributeTypeBoolean";
  v19[6] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:4];
  v19[7] = @"12";
  v18[7] = @"CIAttributeFilterAvailable_iOS";
  v18[8] = @"CIAttributeFilterAvailable_Mac";
  v19[8] = @"10.14";
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:9];
}

- (id)outputImage
{
  v60[2] = *MEMORY[0x1E4F143B8];
  inputImage = self->inputImage;
  [(CIImage *)inputImage extent];
  double x = v61.origin.x;
  double y = v61.origin.y;
  double width = v61.size.width;
  double height = v61.size.height;
  if (CGRectIsInfinite(v61)) {
    return 0;
  }
  double v9 = (double)[(NSNumber *)self->inputCount intValue];
  BOOL v10 = [(NSNumber *)self->inputNormalize BOOLValue];
  BOOL v50 = [(NSNumber *)self->inputClip BOOLValue];
  if (v10)
  {
    v58 = @"inputExtent";
    [(CIImage *)inputImage extent];
    v59 = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:");
    uint64_t v11 = -[CIImage imageByClampingToExtent](-[CIImage imageByApplyingFilter:withInputParameters:](inputImage, "imageByApplyingFilter:withInputParameters:", @"CIAreaMinMaxRed", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v59 forKeys:&v58 count:1]), "imageByClampingToExtent");
    v12 = +[CIKernel kernelWithInternalRepresentation:&CI::_perc_norm_red];
    [(CIImage *)inputImage extent];
    double v49 = v9;
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    v57[0] = inputImage;
    v57[1] = v11;
    uint64_t v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v57 count:2];
    double v22 = v14;
    double v9 = v49;
    inputImage = -[CIColorKernel applyWithExtent:arguments:](v12, "applyWithExtent:arguments:", v21, v22, v16, v18, v20);
  }
  else
  {
    uint64_t v11 = 0;
  }
  v55[0] = @"inputExtent";
  v23 = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:", x, y, width, height);
  inputScale = self->inputScale;
  v56[0] = v23;
  v56[1] = inputScale;
  v55[1] = @"inputScale";
  v55[2] = @"inputCount";
  v56[2] = self->inputCount;
  uint64_t v25 = -[CIImage imageByApplyingFilter:withInputParameters:](inputImage, "imageByApplyingFilter:withInputParameters:", @"CIAreaHistogram", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v56 forKeys:v55 count:3]);
  v26 = +[CIKernel kernelWithInternalRepresentation:&CI::_perc_accum_red];
  v51[0] = MEMORY[0x1E4F143A8];
  v51[1] = 3221225472;
  v51[2] = __30__CIPercentileRed_outputImage__block_invoke;
  v51[3] = &__block_descriptor_96_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
  v51[4] = 0;
  v51[5] = 0;
  *(double *)&v51[6] = v9;
  v51[8] = 0;
  v51[9] = 0;
  v51[7] = 0x3FF0000000000000;
  __asm { FMOV            V0.2D, #1.0 }
  long long v52 = _Q0;
  inputPercentile = self->inputPercentile;
  v54[0] = v25;
  v54[1] = inputPercentile;
  v54[2] = self->inputCount;
  v8 = -[CIImage imageByClampingToExtent](-[CIKernel applyWithExtent:roiCallback:arguments:](v26, "applyWithExtent:roiCallback:arguments:", v51, [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:3], 0.0, 0.0, 1.0, 1.0), "imageByClampingToExtent");
  if (v10)
  {
    v33 = +[CIKernel kernelWithInternalRepresentation:&CI::_perc_denorm_red];
    [(CIImage *)inputImage extent];
    v53[0] = v8;
    v53[1] = v11;
    v8 = -[CIColorKernel applyWithExtent:arguments:](v33, "applyWithExtent:arguments:", [MEMORY[0x1E4F1C978] arrayWithObjects:v53 count:2], v34, v35, v36, v37);
  }
  if (v50)
  {
    v38 = self->inputImage;
    BOOL v39 = [(NSNumber *)self->inputHard BOOLValue];
    v40 = +[CIKernel kernelWithInternalRepresentation:&CI::_perc_clip_hard];
    v41 = +[CIKernel kernelWithInternalRepresentation:&CI::_perc_clip_soft];
    if (v39) {
      v42 = v40;
    }
    else {
      v42 = v41;
    }
    uint64_t v43 = [(CIImage *)v8 imageByClampingToExtent];
    [(CIImage *)v38 extent];
    v60[0] = v38;
    v60[1] = v43;
    return -[CIColorKernel applyWithExtent:arguments:](v42, "applyWithExtent:arguments:", [MEMORY[0x1E4F1C978] arrayWithObjects:v60 count:2], v44, v45, v46, v47);
  }
  return v8;
}

double __30__CIPercentileRed_outputImage__block_invoke(uint64_t a1, int a2)
{
  uint64_t v2 = 64;
  if (!a2) {
    uint64_t v2 = 32;
  }
  return *(double *)(a1 + v2);
}

- (NSNumber)inputPercentile
{
  return self->inputPercentile;
}

- (void)setInputPercentile:(id)a3
{
}

- (NSNumber)inputCount
{
  return self->inputCount;
}

- (void)setInputCount:(id)a3
{
}

- (NSNumber)inputScale
{
  return self->inputScale;
}

- (void)setInputScale:(id)a3
{
}

- (NSNumber)inputNormalize
{
  return self->inputNormalize;
}

- (void)setInputNormalize:(id)a3
{
}

- (NSNumber)inputClip
{
  return self->inputClip;
}

- (void)setInputClip:(id)a3
{
}

- (NSNumber)inputHard
{
  return self->inputHard;
}

- (void)setInputHard:(id)a3
{
}

@end