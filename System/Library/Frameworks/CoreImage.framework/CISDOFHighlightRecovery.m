@interface CISDOFHighlightRecovery
+ (id)customAttributes;
- (CIImage)inputImage;
- (CIVector)inputBlurRadius;
- (CIVector)inputMaxIntensity;
- (CIVector)inputMinIntensity;
- (NSNumber)inputApertureScaling;
- (NSNumber)inputIterations;
- (NSNumber)inputMaxBlur;
- (NSNumber)inputScale;
- (id)outputImage;
- (void)setInputApertureScaling:(id)a3;
- (void)setInputBlurRadius:(id)a3;
- (void)setInputImage:(id)a3;
- (void)setInputIterations:(id)a3;
- (void)setInputMaxBlur:(id)a3;
- (void)setInputMaxIntensity:(id)a3;
- (void)setInputMinIntensity:(id)a3;
- (void)setInputScale:(id)a3;
@end

@implementation CISDOFHighlightRecovery

+ (id)customAttributes
{
  v19[10] = *MEMORY[0x1E4F143B8];
  v18[0] = @"CIAttributeFilterCategories";
  v17[0] = @"CICategoryColorAdjustment";
  v17[1] = @"CICategoryVideo";
  v17[2] = @"CICategoryStillImage";
  v17[3] = @"CICategoryBuiltIn";
  v17[4] = @"CICategoryApplePrivate";
  v19[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:5];
  v19[1] = @"12";
  v18[1] = @"CIAttributeFilterAvailable_iOS";
  v18[2] = @"CIAttributeFilterAvailable_Mac";
  v19[2] = @"10.14";
  v18[3] = @"inputScale";
  v15[0] = @"CIAttributeSliderMin";
  v15[1] = @"CIAttributeSliderMax";
  v16[0] = &unk_1EE4A9820;
  v16[1] = &unk_1EE4A9830;
  v15[2] = @"CIAttributeMin";
  v15[3] = @"CIAttributeMax";
  v16[2] = &unk_1EE4A9820;
  v16[3] = &unk_1EE4A9830;
  v15[4] = @"CIAttributeDefault";
  v15[5] = @"CIAttributeType";
  v16[4] = &unk_1EE4A9830;
  v16[5] = @"CIAttributeTypeScalar";
  v19[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:6];
  v18[4] = @"inputMaxBlur";
  v13[0] = @"CIAttributeSliderMin";
  v13[1] = @"CIAttributeSliderMax";
  v14[0] = &unk_1EE4A9820;
  v14[1] = &unk_1EE4A9840;
  v13[2] = @"CIAttributeMin";
  v13[3] = @"CIAttributeMax";
  v14[2] = &unk_1EE4A9820;
  v14[3] = &unk_1EE4A9840;
  v13[4] = @"CIAttributeDefault";
  v13[5] = @"CIAttributeType";
  v14[4] = &unk_1EE4A9850;
  v14[5] = @"CIAttributeTypeScalar";
  v19[4] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:6];
  v18[5] = @"inputApertureScale";
  v11[0] = @"CIAttributeSliderMin";
  v11[1] = @"CIAttributeSliderMax";
  v12[0] = &unk_1EE4A9860;
  v12[1] = &unk_1EE4A9830;
  v11[2] = @"CIAttributeMin";
  v11[3] = @"CIAttributeMax";
  v12[2] = &unk_1EE4A9860;
  v12[3] = &unk_1EE4A9830;
  v11[4] = @"CIAttributeDefault";
  v11[5] = @"CIAttributeType";
  v12[4] = &unk_1EE4A9830;
  v12[5] = @"CIAttributeTypeScalar";
  v19[5] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:6];
  v18[6] = @"inputBlurRadius";
  v9[0] = @"CIAttributeDefault";
  v9[1] = @"CIAttributeType";
  v10[0] = +[CIVector vectorWithX:0.0025 Y:0.0075];
  v10[1] = @"CIAttributeTypePosition";
  v19[6] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  v18[7] = @"inputMaxIntensity";
  v7[0] = @"CIAttributeDefault";
  v7[1] = @"CIAttributeType";
  v8[0] = +[CIVector vectorWithX:0.9 Y:1.0];
  v8[1] = @"CIAttributeTypePosition";
  v19[7] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];
  v18[8] = @"inputMinIntensity";
  v5[0] = @"CIAttributeDefault";
  v5[1] = @"CIAttributeType";
  v6[0] = +[CIVector vectorWithX:0.0 Y:0.2];
  v6[1] = @"CIAttributeTypePosition";
  v19[8] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:2];
  v18[9] = @"inputIterations";
  v3[0] = @"CIAttributeType";
  v3[1] = @"CIAttributeSliderMin";
  v4[0] = @"CIAttributeTypeInteger";
  v4[1] = &unk_1EE4AACB8;
  v3[2] = @"CIAttributeSliderMax";
  v3[3] = @"CIAttributeDefault";
  v4[2] = &unk_1EE4AACD0;
  v4[3] = &unk_1EE4AACE8;
  v19[9] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:4];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:10];
}

- (id)outputImage
{
  v51[9] = *MEMORY[0x1E4F143B8];
  if (self->inputImage)
  {
    if ([(NSNumber *)self->inputIterations integerValue])
    {
      inputMaxBlur = self->inputMaxBlur;
      inputApertureScaling = self->inputApertureScaling;
      v50[0] = @"maxBlur";
      v50[1] = @"apertureScaling";
      inputIterations = self->inputIterations;
      v51[0] = inputMaxBlur;
      v51[1] = inputApertureScaling;
      v51[2] = inputIterations;
      v50[2] = @"iterations";
      v50[3] = @"blurRadiusT0";
      v6 = NSNumber;
      [(CIVector *)self->inputBlurRadius X];
      v51[3] = objc_msgSend(v6, "numberWithDouble:");
      v50[4] = @"blurRadiusT1";
      v7 = NSNumber;
      [(CIVector *)self->inputBlurRadius Y];
      v51[4] = objc_msgSend(v7, "numberWithDouble:");
      v50[5] = @"maxIntensityT0";
      v8 = NSNumber;
      [(CIVector *)self->inputMaxIntensity X];
      v51[5] = objc_msgSend(v8, "numberWithDouble:");
      v50[6] = @"maxIntensityT1";
      v9 = NSNumber;
      [(CIVector *)self->inputMaxIntensity Y];
      v51[6] = objc_msgSend(v9, "numberWithDouble:");
      v50[7] = @"minIntensityT0";
      v10 = NSNumber;
      [(CIVector *)self->inputMinIntensity X];
      v51[7] = objc_msgSend(v10, "numberWithDouble:");
      v50[8] = @"minIntensityT1";
      v11 = NSNumber;
      [(CIVector *)self->inputMinIntensity Y];
      v51[8] = objc_msgSend(v11, "numberWithDouble:");
      v12 = (void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v51 forKeys:v50 count:9];
      inputImage = self->inputImage;
      CFTypeRef v14 = linearP3ColorSpace();
      v15 = [(CIImage *)inputImage imageByColorMatchingWorkingSpaceToColorSpace:v14];
      [(NSNumber *)self->inputScale floatValue];
      float v17 = v16;
      [(CIImage *)v15 extent];
      CGFloat v19 = v18;
      CGFloat v21 = v20;
      CGFloat v23 = v22;
      CGFloat v25 = v24;
      memset(&v48, 0, sizeof(v48));
      CGAffineTransformMakeScale(&v48, 1.0 / v17, 1.0 / v17);
      CGAffineTransform v47 = v48;
      v53.origin.x = v19;
      v53.origin.y = v21;
      v53.size.double width = v23;
      v53.size.double height = v25;
      CGRect v54 = CGRectApplyAffineTransform(v53, &v47);
      CGRect v55 = CGRectIntegral(v54);
      double width = v55.size.width;
      double height = v55.size.height;
      [(CIImage *)v15 extent];
      CGFloat v29 = width / v28;
      [(CIImage *)v15 extent];
      CGAffineTransformMakeScale(&v46, v29, height / v30);
      CGAffineTransform v48 = v46;
      if (v17 != 1.0)
      {
        v31 = [(CIImage *)v15 imageByClampingToExtent];
        CGAffineTransform v45 = v48;
        v15 = [(CIImage *)v31 imageByApplyingTransform:&v45 highQualityDownsample:1];
        v12 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v12];
        [v12 setObject:&unk_1EE4A9830 forKeyedSubscript:@"scale"];
        v32 = NSNumber;
        [(NSNumber *)self->inputIterations floatValue];
        *(float *)&double v34 = v33 / v17;
        objc_msgSend(v12, "setObject:forKeyedSubscript:", objc_msgSend(v32, "numberWithFloat:", v34), @"iterations");
      }
      CGAffineTransform v44 = v48;
      v56.origin.x = v19;
      v56.origin.y = v21;
      v56.size.double width = v23;
      v56.size.double height = v25;
      CGRect v57 = CGRectApplyAffineTransform(v56, &v44);
      if (((unint64_t)v57.size.width | (unint64_t)v57.size.height))
      {
        unint64_t v35 = (unint64_t)v57.size.width;
        unint64_t v36 = (unint64_t)v57.size.height;
        v15 = -[CIImage imageByCroppingToRect:]([(CIImage *)v15 imageByClampingToExtent], "imageByCroppingToRect:", v57.origin.x, v57.origin.y, (double)((v35 & 1) + v35), (double)((v36 & 1) + v36));
      }
      [(CIImage *)v15 extent];
      v49 = v15;
      v41 = +[CIImageProcessorKernel applyWithExtent:inputs:arguments:error:](CIHighlightRecoveryProcessor, "applyWithExtent:inputs:arguments:error:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v49 count:1], v12, 0, v37, v38, v39, v40);
      if (v17 != 1.0)
      {
        CGAffineTransformMakeScale(&v43, v17, v17);
        v41 = [(CIImage *)v41 imageByApplyingTransform:&v43 highQualityDownsample:1];
      }
      [(CIImage *)self->inputImage extent];
      return -[CIImage imageByColorMatchingColorSpaceToWorkingSpace:](-[CIImage imageByCroppingToRect:](v41, "imageByCroppingToRect:"), "imageByColorMatchingColorSpaceToWorkingSpace:", v14);
    }
    else
    {
      return self->inputImage;
    }
  }
  else
  {
    return +[CIImage emptyImage];
  }
}

- (CIImage)inputImage
{
  return (CIImage *)objc_getProperty(self, a2, 80, 1);
}

- (void)setInputImage:(id)a3
{
}

- (NSNumber)inputScale
{
  return (NSNumber *)objc_getProperty(self, a2, 88, 1);
}

- (void)setInputScale:(id)a3
{
}

- (NSNumber)inputApertureScaling
{
  return (NSNumber *)objc_getProperty(self, a2, 96, 1);
}

- (void)setInputApertureScaling:(id)a3
{
}

- (NSNumber)inputIterations
{
  return (NSNumber *)objc_getProperty(self, a2, 104, 1);
}

- (void)setInputIterations:(id)a3
{
}

- (NSNumber)inputMaxBlur
{
  return (NSNumber *)objc_getProperty(self, a2, 112, 1);
}

- (void)setInputMaxBlur:(id)a3
{
}

- (CIVector)inputBlurRadius
{
  return (CIVector *)objc_getProperty(self, a2, 120, 1);
}

- (void)setInputBlurRadius:(id)a3
{
}

- (CIVector)inputMaxIntensity
{
  return (CIVector *)objc_getProperty(self, a2, 128, 1);
}

- (void)setInputMaxIntensity:(id)a3
{
}

- (CIVector)inputMinIntensity
{
  return (CIVector *)objc_getProperty(self, a2, 136, 1);
}

- (void)setInputMinIntensity:(id)a3
{
}

@end