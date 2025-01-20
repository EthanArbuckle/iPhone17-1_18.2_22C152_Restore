@interface CIAreaLogarithmicHistogram
+ (id)customAttributes;
- (NSNumber)inputMaximumStop;
- (NSNumber)inputMinimumStop;
- (id)outputImage;
- (void)outputImage;
- (void)setInputMaximumStop:(id)a3;
- (void)setInputMinimumStop:(id)a3;
@end

@implementation CIAreaLogarithmicHistogram

+ (id)customAttributes
{
  v13[7] = *MEMORY[0x1E4F143B8];
  v12[0] = @"CIAttributeFilterCategories";
  v11[0] = @"CICategoryReduction";
  v11[1] = @"CICategoryVideo";
  v11[2] = @"CICategoryStillImage";
  v11[3] = @"CICategoryHighDynamicRange";
  v11[4] = @"CICategoryBuiltIn";
  v13[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:5];
  v13[1] = @"16";
  v12[1] = @"CIAttributeFilterAvailable_iOS";
  v12[2] = @"CIAttributeFilterAvailable_Mac";
  v13[2] = @"13.0";
  v12[3] = @"inputCount";
  v9[0] = @"CIAttributeMin";
  v9[1] = @"CIAttributeSliderMin";
  v10[0] = &unk_1EE4A7B70;
  v10[1] = &unk_1EE4A7B80;
  v9[2] = @"CIAttributeSliderMax";
  v9[3] = @"CIAttributeMax";
  v10[2] = &unk_1EE4A7B90;
  v10[3] = &unk_1EE4A7BA0;
  v9[4] = @"CIAttributeDefault";
  v9[5] = @"CIAttributeType";
  v10[4] = &unk_1EE4A7BB0;
  v10[5] = @"CIAttributeTypeScalar";
  v13[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:6];
  v12[4] = @"inputScale";
  v7[0] = @"CIAttributeMin";
  v7[1] = @"CIAttributeSliderMin";
  v8[0] = &unk_1EE4A7BC0;
  v8[1] = &unk_1EE4A7BC0;
  v7[2] = @"CIAttributeSliderMax";
  v7[3] = @"CIAttributeDefault";
  v8[2] = &unk_1EE4A7B70;
  v8[3] = &unk_1EE4A7B70;
  v7[4] = @"CIAttributeType";
  v8[4] = @"CIAttributeTypeScalar";
  v13[4] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:5];
  v12[5] = @"inputMinimumStop";
  v6[0] = &unk_1EE4AA430;
  v6[1] = &unk_1EE4AA448;
  v5[0] = @"CIAttributeSliderMin";
  v5[1] = @"CIAttributeSliderMax";
  v5[2] = @"CIAttributeDefault";
  v5[3] = @"CIAttributeType";
  v6[2] = &unk_1EE4AA460;
  v6[3] = @"CIAttributeTypeScalar";
  v13[5] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:4];
  v12[6] = @"inputMaximumStop";
  v3[0] = @"CIAttributeSliderMin";
  v3[1] = @"CIAttributeSliderMax";
  v4[0] = &unk_1EE4AA478;
  v4[1] = &unk_1EE4AA490;
  v3[2] = @"CIAttributeDefault";
  v3[3] = @"CIAttributeType";
  v4[2] = &unk_1EE4AA4A8;
  v4[3] = @"CIAttributeTypeScalar";
  v13[6] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:4];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:7];
}

- (id)outputImage
{
  v20[3] = *MEMORY[0x1E4F143B8];
  v3 = +[CIKernel kernelWithInternalRepresentation:&CI::_logHistogram];
  inputImage = self->super.inputImage;
  [(NSNumber *)self->inputMinimumStop floatValue];
  float v6 = v5;
  [(NSNumber *)self->inputMaximumStop floatValue];
  if (v7 <= v6)
  {
    v17 = ci_logger_filter();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      [(CIAreaLogarithmicHistogram *)(uint64_t)self outputImage];
    }
    return 0;
  }
  else
  {
    [(CIImage *)inputImage extent];
    inputMinimumStop = self->inputMinimumStop;
    v20[0] = inputImage;
    v20[1] = inputMinimumStop;
    v20[2] = self->inputMaximumStop;
    v13 = -[CIColorKernel applyWithExtent:arguments:](v3, "applyWithExtent:arguments:", [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:3], v9, v10, v11, v12);
    inputExtent = self->super.inputExtent;
    v18[0] = @"inputExtent";
    v18[1] = @"inputScale";
    inputScale = self->super.inputScale;
    v19[0] = inputExtent;
    v19[1] = inputScale;
    v18[2] = @"inputCount";
    v19[2] = self->super.inputCount;
    return -[CIImage imageByApplyingFilter:withInputParameters:](v13, "imageByApplyingFilter:withInputParameters:", @"CIAreaHistogram", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:3]);
  }
}

- (NSNumber)inputMinimumStop
{
  return self->inputMinimumStop;
}

- (void)setInputMinimumStop:(id)a3
{
}

- (NSNumber)inputMaximumStop
{
  return self->inputMaximumStop;
}

- (void)setInputMaximumStop:(id)a3
{
}

- (void)outputImage
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v3 = 138543362;
  uint64_t v4 = [(id)objc_opt_class() description];
  _os_log_error_impl(&dword_193671000, a2, OS_LOG_TYPE_ERROR, "%{public}@: inputMinimumStop must be greater than inputMaximumStop.", (uint8_t *)&v3, 0xCu);
}

@end