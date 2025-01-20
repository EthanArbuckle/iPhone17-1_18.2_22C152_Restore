@interface CIPersonSegmentation
+ (id)customAttributes;
- (CIImage)inputImage;
- (NSNumber)inputQualityLevel;
- (id)outputImage;
- (void)outputImage;
- (void)setInputImage:(id)a3;
- (void)setInputQualityLevel:(id)a3;
@end

@implementation CIPersonSegmentation

+ (id)customAttributes
{
  v7[4] = *MEMORY[0x1E4F143B8];
  v6[0] = @"CIAttributeFilterCategories";
  v5[0] = @"CICategoryVideo";
  v5[1] = @"CICategoryStillImage";
  v5[2] = @"CICategoryBuiltIn";
  v5[3] = @"CICategoryStylize";
  v7[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:4];
  v7[1] = @"15";
  v6[1] = @"CIAttributeFilterAvailable_iOS";
  v6[2] = @"CIAttributeFilterAvailable_Mac";
  v7[2] = @"12.0";
  v6[3] = @"inputQualityLevel";
  v3[0] = @"CIAttributeMin";
  v3[1] = @"CIAttributeMax";
  v4[0] = &unk_1EE4AABC8;
  v4[1] = &unk_1EE4AABE0;
  v3[2] = @"CIAttributeSliderMin";
  v3[3] = @"CIAttributeSliderMax";
  v4[2] = &unk_1EE4AABC8;
  v4[3] = &unk_1EE4AABE0;
  v3[4] = @"CIAttributeDefault";
  v3[5] = @"CIAttributeType";
  v4[4] = &unk_1EE4AABC8;
  v4[5] = @"CIAttributeTypeInteger";
  v7[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:6];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:4];
}

- (id)outputImage
{
  v40[1] = *MEMORY[0x1E4F143B8];
  inputImage = self->inputImage;
  if (!inputImage || ([(CIImage *)inputImage extent], CGRectIsInfinite(v41)))
  {
    v4 = ci_logger_filter();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      [(CIPersonSegmentation *)(uint64_t)self outputImage];
    }
    return +[CIImage emptyImage];
  }
  uint64_t v37 = 0;
  [(CIImage *)self->inputImage extent];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  v13 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DC98]);
  unsigned int v14 = [(NSNumber *)self->inputQualityLevel unsignedIntValue];
  if (v14 >= 3 || self->inputQualityLevel == 0) {
    uint64_t v16 = 0;
  }
  else {
    uint64_t v16 = v14;
  }
  if (v16 == 1)
  {
    double v17 = 384.0;
    *(double *)&uint64_t v18 = 512.0;
    goto LABEL_15;
  }
  if (v16 == 2)
  {
    double v17 = 256.0;
    *(double *)&uint64_t v18 = 192.0;
LABEL_15:
    double v19 = *(double *)&v18;
    goto LABEL_17;
  }
  double v17 = 1512.0;
  double v19 = 2016.0;
LABEL_17:
  v20 = [(CIImage *)self->inputImage imageByClampingToExtent];
  CGAffineTransformMakeTranslation(&v36, -v6, -v8);
  v21 = [(CIImage *)v20 imageByApplyingTransform:&v36];
  CGAffineTransformMakeScale(&v35, v19 / v10, v17 / v12);
  v22 = -[CIImage imageByColorMatchingWorkingSpaceToColorSpace:](-[CIImage imageByCroppingToRect:]([(CIImage *)v21 imageByApplyingTransform:&v35], "imageByCroppingToRect:", 0.0, 0.0, v19, v17), "imageByColorMatchingWorkingSpaceToColorSpace:", v13);
  [(CIImage *)v22 extent];
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;
  double v30 = v29;
  v40[0] = v22;
  uint64_t v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:1];
  v38[0] = @"rect";
  [(CIImage *)v22 extent];
  v32 = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:");
  v38[1] = @"q";
  v39[0] = v32;
  v39[1] = [NSNumber numberWithUnsignedInteger:v16];
  v33 = -[CIImage imageByColorMatchingColorSpaceToWorkingSpace:](+[CIImageProcessorKernel applyWithExtent:inputs:arguments:error:](CIPersonSegmentationKernel, "applyWithExtent:inputs:arguments:error:", v31, [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:v38 count:2], &v37, v24, v26, v28, v30), "imageByColorMatchingColorSpaceToWorkingSpace:", v13);
  CGColorSpaceRelease(v13);
  if (v37) {
    return +[CIImage emptyImage];
  }
  return v33;
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
}

- (NSNumber)inputQualityLevel
{
  return self->inputQualityLevel;
}

- (void)setInputQualityLevel:(id)a3
{
}

- (void)outputImage
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v3 = 138543362;
  uint64_t v4 = [(id)objc_opt_class() description];
  _os_log_error_impl(&dword_193671000, a2, OS_LOG_TYPE_ERROR, "%{public}@: requires an inputImage with a finite extent.", (uint8_t *)&v3, 0xCu);
}

@end