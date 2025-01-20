@interface CIDisparityRefinementV3
+ (id)customAttributes;
- (CIImage)inputImage;
- (CIImage)inputMainImage;
- (CIImage)inputMatteImage;
- (NSDictionary)inputTuningParameters;
- (NSNumber)inputDraftMode;
- (NSNumber)inputScale;
- (id)alphaImageForMainImage:(id)a3 disparity:(id)a4;
- (id)outputImage;
- (void)setInputDraftMode:(id)a3;
- (void)setInputImage:(id)a3;
- (void)setInputMainImage:(id)a3;
- (void)setInputMatteImage:(id)a3;
- (void)setInputScale:(id)a3;
- (void)setInputTuningParameters:(id)a3;
@end

@implementation CIDisparityRefinementV3

+ (id)customAttributes
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v7[0] = @"CIAttributeFilterCategories";
  v6[0] = @"CICategoryColorAdjustment";
  v6[1] = @"CICategoryVideo";
  v6[2] = @"CICategoryStillImage";
  v6[3] = @"CICategoryBuiltIn";
  v6[4] = @"CICategoryApplePrivate";
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:5];
  v7[1] = @"inputDraftMode";
  v8[0] = v2;
  v4[0] = @"CIAttributeType";
  v4[1] = @"CIAttributeSliderMin";
  v5[0] = @"CIAttributeTypeInteger";
  v5[1] = &unk_1EE4AAFD0;
  v4[2] = @"CIAttributeSliderMax";
  v4[3] = @"CIAttributeDefault";
  v5[2] = &unk_1EE4AAFE8;
  v5[3] = &unk_1EE4AAFD0;
  v8[1] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:4];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];
}

- (id)alphaImageForMainImage:(id)a3 disparity:(id)a4
{
  inputMatteImage = self->inputMatteImage;
  if (inputMatteImage)
  {
    [a4 extent];
    double v8 = v7;
    double v10 = v9;
    [a3 extent];
    double v12 = v11 * 0.5;
    if (v11 * 0.5 > v8)
    {
      objc_msgSend(a3, "extent", v12);
      double v8 = v13 * 0.5;
    }
    objc_msgSend(a3, "extent", v12);
    if (v14 * 0.5 > v10)
    {
      objc_msgSend(a3, "extent", v14 * 0.5);
      double v10 = v15 * 0.5;
    }
    [(CIImage *)self->inputMatteImage extent];
    double v17 = vabdd_f64(v8, v16);
    [(CIImage *)self->inputMatteImage extent];
    if (v17 > 0.1 || vabdd_f64(v10, v18) > 0.1)
    {
      [(CIImage *)self->inputMatteImage extent];
      CGFloat v20 = v8 / v19;
      [(CIImage *)self->inputMatteImage extent];
      v21 = self->inputMatteImage;
      CGAffineTransformMakeScale(&v24, v20, v10 / v22);
      return [(CIImage *)v21 imageByApplyingTransform:&v24];
    }
  }
  return inputMatteImage;
}

- (id)outputImage
{
  v27[1] = *MEMORY[0x1E4F143B8];
  if (self->inputImage && self->inputMainImage && self->inputTuningParameters)
  {
    int v3 = +[CIDepthBlurEffect getDraftMode:[(CIDisparityRefinementV3 *)self inputDraftMode]];
    double v4 = 0.5;
    if (v3 == 2)
    {
      [(NSNumber *)[(CIDisparityRefinementV3 *)self inputScale] floatValue];
      double v4 = 0.5 / v5;
    }
    memset(&v19, 0, sizeof(v19));
    CGAffineTransformMakeScale(&v19, v4, v4);
    inputMainImage = self->inputMainImage;
    CGAffineTransform v18 = v19;
    uint64_t v7 = [(CIImage *)inputMainImage imageByApplyingTransform:&v18];
    inputImage = self->inputImage;
    id v9 = [(CIDisparityRefinementV3 *)self alphaImageForMainImage:v7 disparity:inputImage];
    v26 = @"inputImage";
    v27[0] = v7;
    double v10 = +[CIFilter filterWithName:withInputParameters:](CIFilter, "filterWithName:withInputParameters:", @"CIDisparityPreprocV3", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:&v26 count:1]);
    double v11 = v10;
    if (v9) {
      [(CIFilter *)v10 setValue:v9 forKey:@"inputAlphaImage"];
    }
    uint64_t v12 = [(CIFilter *)v11 outputImage];
    inputTuningParameters = self->inputTuningParameters;
    v24[0] = @"inputTuningParameters";
    v24[1] = @"inputScale";
    v25[0] = inputTuningParameters;
    v25[1] = [(CIDisparityRefinementV3 *)self inputScale];
    double v14 = -[CIImage imageByApplyingFilter:withInputParameters:](inputImage, "imageByApplyingFilter:withInputParameters:", @"CIDisparityWeightsV3", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:2]);
    v22[0] = @"inputPreprocImage";
    v22[1] = @"inputTuningParameters";
    double v15 = self->inputTuningParameters;
    v23[0] = v12;
    v23[1] = v15;
    v22[2] = @"inputScale";
    v23[2] = [(CIDisparityRefinementV3 *)self inputScale];
    double v16 = -[CIImage imageByApplyingFilter:withInputParameters:](v14, "imageByApplyingFilter:withInputParameters:", @"CIDisparityRefinementSparseSamplerV3", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:3]);
    if (+[CIDepthBlurEffect getDraftMode:[(CIDisparityRefinementV3 *)self inputDraftMode]] != 1)
    {
      v20[0] = @"inputPreprocImage";
      v20[1] = @"inputDisparityWeightImage";
      v21[0] = v12;
      v21[1] = v14;
      v21[2] = self->inputTuningParameters;
      v20[2] = @"inputTuningParameters";
      v20[3] = @"inputScale";
      v21[3] = [(CIDisparityRefinementV3 *)self inputScale];
      return -[CIImage imageByApplyingFilter:withInputParameters:](v16, "imageByApplyingFilter:withInputParameters:", @"CIDisparityRefinementAntialiasV3", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:4]);
    }
    return v16;
  }
  else
  {
    return +[CIImage emptyImage];
  }
}

- (NSNumber)inputScale
{
  return (NSNumber *)objc_getProperty(self, a2, 80, 1);
}

- (void)setInputScale:(id)a3
{
}

- (CIImage)inputImage
{
  return (CIImage *)objc_getProperty(self, a2, 88, 1);
}

- (void)setInputImage:(id)a3
{
}

- (CIImage)inputMainImage
{
  return (CIImage *)objc_getProperty(self, a2, 96, 1);
}

- (void)setInputMainImage:(id)a3
{
}

- (CIImage)inputMatteImage
{
  return (CIImage *)objc_getProperty(self, a2, 104, 1);
}

- (void)setInputMatteImage:(id)a3
{
}

- (NSDictionary)inputTuningParameters
{
  return (NSDictionary *)objc_getProperty(self, a2, 112, 1);
}

- (void)setInputTuningParameters:(id)a3
{
}

- (NSNumber)inputDraftMode
{
  return self->inputDraftMode;
}

- (void)setInputDraftMode:(id)a3
{
}

@end