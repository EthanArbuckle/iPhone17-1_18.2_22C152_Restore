@interface CIKMeans
+ (id)customAttributes;
- (CIImage)inputMeans;
- (NSNumber)inputCount;
- (NSNumber)inputPasses;
- (NSNumber)inputPerceptual;
- (id)_combine:(id)a3;
- (id)_kernelKmeans;
- (id)defuse:(id)a3 seed:(int)a4;
- (id)outputImage;
- (void)outputImage;
- (void)setInputCount:(id)a3;
- (void)setInputMeans:(id)a3;
- (void)setInputPasses:(id)a3;
- (void)setInputPerceptual:(id)a3;
@end

@implementation CIKMeans

+ (id)customAttributes
{
  v11[6] = *MEMORY[0x1E4F143B8];
  v10[0] = @"CIAttributeFilterCategories";
  v9[0] = @"CICategoryReduction";
  v9[1] = @"CICategoryVideo";
  v9[2] = @"CICategoryStillImage";
  v9[3] = @"CICategoryHighDynamicRange";
  v9[4] = @"CICategoryBuiltIn";
  v11[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:5];
  v11[1] = @"13";
  v10[1] = @"CIAttributeFilterAvailable_iOS";
  v10[2] = @"CIAttributeFilterAvailable_Mac";
  v11[2] = @"10.15";
  v10[3] = @"inputCount";
  v7[0] = @"CIAttributeMin";
  v7[1] = @"CIAttributeMax";
  v8[0] = &unk_1EE4AAE50;
  v8[1] = &unk_1EE4AAE68;
  v7[2] = @"CIAttributeDefault";
  v7[3] = @"CIAttributeIdentity";
  v8[2] = &unk_1EE4AAE80;
  v8[3] = &unk_1EE4AAE50;
  v7[4] = @"CIAttributeType";
  v8[4] = @"CIAttributeTypeCount";
  v11[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:5];
  v10[4] = @"inputPasses";
  v5[0] = @"CIAttributeMin";
  v5[1] = @"CIAttributeMax";
  v6[0] = &unk_1EE4AAE50;
  v6[1] = &unk_1EE4AAE98;
  v5[2] = @"CIAttributeDefault";
  v5[3] = @"CIAttributeIdentity";
  v6[2] = &unk_1EE4AAEB0;
  v6[3] = &unk_1EE4AAE50;
  v5[4] = @"CIAttributeType";
  v6[4] = @"CIAttributeTypeCount";
  v11[4] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:5];
  v10[5] = @"inputPerceptual";
  v3[0] = @"CIAttributeMin";
  v3[1] = @"CIAttributeMax";
  v4[0] = MEMORY[0x1E4F1CC28];
  v4[1] = MEMORY[0x1E4F1CC38];
  v3[2] = @"CIAttributeDefault";
  v3[3] = @"CIAttributeType";
  v4[2] = MEMORY[0x1E4F1CC28];
  v4[3] = @"CIAttributeTypeBoolean";
  v11[5] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:4];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:6];
}

- (id)_combine:(id)a3
{
  uint64_t v4 = [a3 count];
  uint64_t v5 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v4];
  if (v4)
  {
    v6 = (void *)v5;
    uint64_t v7 = 0;
    while (1)
    {
      [a3 objectAtIndexedSubscript:v7];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      v9 = (CIImage *)[a3 objectAtIndexedSubscript:v7];
      if (isKindOfClass) {
        goto LABEL_13;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      [a3 objectAtIndexedSubscript:v7];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v11 = (void *)[a3 objectAtIndexedSubscript:v7];
        if ([v11 count] == 3)
        {
          [v11 X];
          double v13 = v12;
          [v11 Y];
          double v15 = v14;
          [v11 Z];
          v17 = +[CIColor colorWithRed:v13 green:v15 blue:v16];
          goto LABEL_11;
        }
        if ([v11 count] == 4)
        {
          [v11 X];
          double v19 = v18;
          [v11 Y];
          double v21 = v20;
          [v11 Z];
          double v23 = v22;
          [v11 W];
          v17 = +[CIColor colorWithRed:v19 green:v21 blue:v23 alpha:v24];
LABEL_11:
          uint64_t v10 = (uint64_t)v17;
LABEL_12:
          v9 = +[CIImage imageWithColor:v10];
LABEL_13:
          if (v9) {
            [v6 setObject:v9 atIndexedSubscript:v7];
          }
        }
      }
      if (v4 == ++v7)
      {
        v25 = +[CIImage emptyImage];
        for (uint64_t i = 0; i != v4; ++i)
          v25 = (CIImage *)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v6, "objectAtIndexedSubscript:", i), "imageByClampingToExtent"), "imageByCroppingToRect:", (double)(int)i, 0.0, 1.0, 1.0), "imageByCompositingOverImage:", v25);
        return v25;
      }
    }
    uint64_t v10 = [a3 objectAtIndexedSubscript:v7];
    goto LABEL_12;
  }

  return +[CIImage emptyImage];
}

- (id)_kernelKmeans
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_KM_select];
}

- (id)defuse:(id)a3 seed:(int)a4
{
  v15[4] = *MEMORY[0x1E4F143B8];
  [a3 extent];
  unint64_t v7 = (unint64_t)v6;
  double v8 = (double)(unint64_t)v6;
  v9 = [+[CIFilter filterWithName:@"CIRandomGenerator"] outputImage];
  CGAffineTransformMakeTranslation(&v14, (double)a4, 0.0);
  uint64_t v10 = -[CIImage imageBySettingAlphaOneInExtent:]([(CIImage *)v9 imageByApplyingTransform:&v14], "imageBySettingAlphaOneInExtent:", 0.0, 0.0, v8, 1.0);
  v11 = +[CIKernel kernelWithInternalRepresentation:&CI::_KM_defuse];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __24__CIKMeans_defuse_seed___block_invoke;
  v13[3] = &__block_descriptor_64_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
  v13[4] = 0;
  v13[5] = 0;
  *(double *)&v13[6] = v8;
  v13[7] = 0x3FF0000000000000;
  v15[0] = a3;
  v15[1] = v10;
  v15[2] = [NSNumber numberWithUnsignedLong:v7];
  v15[3] = &unk_1EE4AB710;
  return -[CIKernel applyWithExtent:roiCallback:arguments:](v11, "applyWithExtent:roiCallback:arguments:", v13, [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:4], 0.0, 0.0, v8, 1.0);
}

double __24__CIKMeans_defuse_seed___block_invoke(uint64_t a1)
{
  return *(double *)(a1 + 32);
}

- (id)outputImage
{
  v2 = self;
  v51[4] = *MEMORY[0x1E4F143B8];
  inputMeans = self->inputMeans;
  if (inputMeans)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    uint64_t v5 = v2->inputMeans;
    if (isKindOfClass)
    {
      inputMeans = [(CIKMeans *)v2 _combine:v2->inputMeans];
      uint64_t v6 = [(CIImage *)v5 count];
      goto LABEL_10;
    }
    if (v5)
    {
      [(CIImage *)v2->inputMeans extent];
      float v9 = v8;
      unint64_t v10 = vcvtas_u32_f32(v9);
      [(CIImage *)v2->inputMeans extent];
      goto LABEL_11;
    }
  }
  else if (!self->inputCount)
  {
    unint64_t v7 = ci_logger_api();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[CIKMeans outputImage](v7);
    }
    return +[CIImage emptyImage];
  }
  uint64_t v6 = [(NSNumber *)v2->inputCount unsignedIntegerValue];
LABEL_10:
  unint64_t v10 = v6;
  if (!inputMeans)
  {
    int v13 = 1;
    goto LABEL_21;
  }
LABEL_11:
  [(CIImage *)inputMeans extent];
  if (CGRectIsInfinite(v53) || ([(CIImage *)inputMeans extent], v11 > 1.0))
  {
    [(CIImage *)inputMeans extent];
    if (CGRectIsInfinite(v54))
    {
      double v12 = @"infinite";
    }
    else
    {
      CGAffineTransform v14 = NSString;
      [(CIImage *)inputMeans extent];
      uint64_t v16 = v15;
      [(CIImage *)inputMeans extent];
      double v12 = (__CFString *)objc_msgSend(v14, "stringWithFormat:", @"%.1f x %.1f", v16, v17);
    }
    double v18 = ci_logger_filter();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      [(CIKMeans *)(uint64_t)v2 outputImage];
    }
    return +[CIImage emptyImage];
  }
  int v13 = 0;
LABEL_21:
  if (v10 - 129 <= 0xFFFFFFFFFFFFFF7FLL)
  {
    return +[CIImage emptyImage];
  }
  inputImage = v2->super.inputImage;
  inputExtent = v2->super.inputExtent;
  if (inputExtent) {
    [(CIVector *)inputExtent CGRectValue];
  }
  else {
    [(CIImage *)v2->super.inputImage extent];
  }
  double v26 = v22;
  double v27 = v23;
  double v28 = v24;
  double v29 = v25;
  inputPerceptual = v2->inputPerceptual;
  if (inputPerceptual) {
    BOOL v31 = [(NSNumber *)inputPerceptual BOOLValue];
  }
  else {
    BOOL v31 = 0;
  }
  inputPasses = v2->inputPasses;
  if (inputPasses) {
    uint64_t v42 = [(NSNumber *)inputPasses intValue];
  }
  else {
    uint64_t v42 = 0;
  }
  id v33 = [(CIKMeans *)v2 _kernelKmeans];
  if (v13)
  {
    v50[0] = @"inputPoint0";
    v51[0] = +[CIVector vectorWithX:0.0 Y:0.0];
    v50[1] = @"inputPoint1";
    v51[1] = +[CIVector vectorWithX:(double)(v10 - 1) Y:0.0];
    v50[2] = @"inputColor0";
    v51[2] = +[CIColor magentaColor];
    v50[3] = @"inputColor1";
    v51[3] = +[CIColor greenColor];
    inputMeans = -[CIImage imageByCroppingToRect:](-[CIFilter outputImage](+[CIFilter filterWithName:withInputParameters:](CIFilter, "filterWithName:withInputParameters:", @"CILinearGradient", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v51 forKeys:v50 count:4]), "outputImage"), "imageByCroppingToRect:", 0.0, 0.0, (double)v10, 1.0);
  }
  if (v42) {
    BOOL v34 = v31;
  }
  else {
    BOOL v34 = 0;
  }
  if (v34)
  {
    inputImage = [(CIImage *)inputImage imageByApplyingFilter:@"CILinearToSRGBToneCurve"];
    inputMeans = [(CIImage *)inputMeans imageByApplyingFilter:@"CILinearToSRGBToneCurve"];
  }
  uint64_t v35 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v10];
  if (v42)
  {
    v36 = (void *)v35;
    uint64_t v37 = 0;
    v41 = v2;
    do
    {
      uint64_t v43 = v37;
      uint64_t v38 = -[CIKMeans defuse:seed:](v2, "defuse:seed:", inputMeans);
      uint64_t v39 = 0;
      uint64_t v44 = MEMORY[0x1E4F143A8];
      uint64_t v45 = v38;
      do
      {
        v46[0] = v44;
        v46[1] = 3221225472;
        v46[2] = __23__CIKMeans_outputImage__block_invoke;
        v46[3] = &__block_descriptor_64_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
        v46[4] = 0;
        v46[5] = 0;
        *(double *)&v46[6] = (double)v10;
        v46[7] = 0x3FF0000000000000;
        v49[0] = inputImage;
        v49[1] = v45;
        v49[2] = [NSNumber numberWithUnsignedLong:v10];
        v49[3] = [NSNumber numberWithInt:v39];
        v40 = objc_msgSend(v33, "applyWithExtent:roiCallback:arguments:", v46, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v49, 4), v26, v27, v28, v29);
        v47 = @"inputExtent";
        v48 = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:", v26, v27, v28, v29);
        objc_msgSend(v36, "setObject:atIndexedSubscript:", objc_msgSend((id)objc_msgSend(v40, "imageByApplyingFilter:withInputParameters:", @"CIAreaAverage", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v48, &v47, 1)), "imageByUnpremultiplyingAlpha"), v39++);
      }
      while (v10 != v39);
      v2 = v41;
      inputMeans = [(CIKMeans *)v41 _combine:v36];
      uint64_t v37 = v43 + 1;
    }
    while (v43 + 1 != v42);
  }
  return [(CIImage *)inputMeans imageBySettingProperties:MEMORY[0x1E4F1CC08]];
}

double __23__CIKMeans_outputImage__block_invoke(uint64_t a1, int a2)
{
  if (a2) {
    return *(double *)(a1 + 32);
  }
  return result;
}

- (NSNumber)inputCount
{
  return self->inputCount;
}

- (void)setInputCount:(id)a3
{
}

- (NSNumber)inputPasses
{
  return self->inputPasses;
}

- (void)setInputPasses:(id)a3
{
}

- (CIImage)inputMeans
{
  return self->inputMeans;
}

- (void)setInputMeans:(id)a3
{
}

- (NSNumber)inputPerceptual
{
  return self->inputPerceptual;
}

- (void)setInputPerceptual:(id)a3
{
}

- (void)outputImage
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v5 = 138543618;
  uint64_t v6 = [(id)objc_opt_class() description];
  __int16 v7 = 2114;
  uint64_t v8 = a2;
  _os_log_error_impl(&dword_193671000, a3, OS_LOG_TYPE_ERROR, "%{public}@: Mean seeds should be passed as a K x 1 image but received %{public}@]", (uint8_t *)&v5, 0x16u);
}

@end