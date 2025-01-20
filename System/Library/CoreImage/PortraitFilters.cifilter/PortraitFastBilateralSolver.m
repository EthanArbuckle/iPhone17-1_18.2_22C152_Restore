@interface PortraitFastBilateralSolver
+ (id)customAttributes;
- (CIImage)inputConfidenceMapImage;
- (CIImage)inputDisparityImage;
- (CIImage)inputImage;
- (NSNumber)inputLambda;
- (NSNumber)inputMaxNumIterations;
- (NSNumber)inputMaxNumVertices;
- (NSNumber)inputSigmaRChroma;
- (NSNumber)inputSigmaRLuma;
- (NSNumber)inputSigmaS;
- (id)outputImage;
- (void)setInputConfidenceMapImage:(id)a3;
- (void)setInputDisparityImage:(id)a3;
- (void)setInputImage:(id)a3;
- (void)setInputLambda:(id)a3;
- (void)setInputMaxNumIterations:(id)a3;
- (void)setInputMaxNumVertices:(id)a3;
- (void)setInputSigmaRChroma:(id)a3;
- (void)setInputSigmaRLuma:(id)a3;
- (void)setInputSigmaS:(id)a3;
@end

@implementation PortraitFastBilateralSolver

+ (id)customAttributes
{
  v16[0] = kCIAttributeFilterCategories;
  v15[0] = kCICategoryColorAdjustment;
  v15[1] = kCICategoryStillImage;
  v15[2] = kCICategoryBuiltIn;
  v15[3] = kCICategoryApplePrivate;
  v17[0] = +[NSArray arrayWithObjects:v15 count:4];
  v17[1] = @"11";
  v16[1] = kCIAttributeFilterAvailable_iOS;
  v16[2] = kCIAttributeFilterAvailable_Mac;
  v17[2] = @"10.13";
  v16[3] = @"inputMaxNumVertices";
  v13[0] = kCIAttributeDefault;
  v13[1] = kCIAttributeType;
  v14[0] = &off_7A800;
  v14[1] = kCIAttributeTypeInteger;
  v17[3] = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];
  v16[4] = @"inputSigmaS";
  v11[0] = kCIAttributeDefault;
  v11[1] = kCIAttributeType;
  v12[0] = &off_7A818;
  v12[1] = kCIAttributeTypeInteger;
  v17[4] = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2];
  v16[5] = @"inputSigmaRLuma";
  v9[0] = kCIAttributeDefault;
  v9[1] = kCIAttributeType;
  v10[0] = &off_7A818;
  v10[1] = kCIAttributeTypeInteger;
  v17[5] = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];
  v16[6] = @"inputSigmaRChroma";
  v7[0] = kCIAttributeDefault;
  v7[1] = kCIAttributeType;
  v8[0] = &off_7A818;
  v8[1] = kCIAttributeTypeInteger;
  v17[6] = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];
  v16[7] = @"inputLambda";
  v5[0] = kCIAttributeDefault;
  v5[1] = kCIAttributeType;
  v6[0] = &off_7AA20;
  v6[1] = kCIAttributeTypeScalar;
  v17[7] = +[NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:2];
  v16[8] = @"inputMaxNumIterations";
  v3[0] = kCIAttributeDefault;
  v3[1] = kCIAttributeType;
  v4[0] = &off_7A830;
  v4[1] = kCIAttributeTypeInteger;
  v17[8] = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:2];
  return +[NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:9];
}

- (id)outputImage
{
  id result = self->inputImage;
  if (result)
  {
    if (self->inputDisparityImage && self->inputConfidenceMapImage)
    {
      [result extent];
      double v5 = v4;
      double v7 = v6;
      double v9 = v8;
      double v11 = v10;
      [(CIImage *)self->inputDisparityImage extent];
      v41.origin.x = v12;
      v41.origin.y = v13;
      v41.size.width = v14;
      v41.size.height = v15;
      v39.origin.x = v5;
      v39.origin.y = v7;
      v39.size.width = v9;
      v39.size.height = v11;
      if (!CGRectEqualToRect(v39, v41)) {
        goto LABEL_10;
      }
      [(CIImage *)self->inputConfidenceMapImage extent];
      v42.origin.x = v16;
      v42.origin.y = v17;
      v42.size.width = v18;
      v42.size.height = v19;
      v40.origin.x = v5;
      v40.origin.y = v7;
      v40.size.width = v9;
      v40.size.height = v11;
      if (CGRectEqualToRect(v40, v42))
      {
        inputMaxNumVertices = self->inputMaxNumVertices;
        v36[0] = @"inputMaxNumVertices";
        v36[1] = @"inputSigmaS";
        inputSigmaS = self->inputSigmaS;
        inputSigmaRLuma = self->inputSigmaRLuma;
        v37[0] = inputMaxNumVertices;
        v37[1] = inputSigmaS;
        inputSigmaRChroma = self->inputSigmaRChroma;
        v36[2] = @"inputSigmaRLuma";
        v36[3] = @"inputSigmaRChroma";
        v37[2] = inputSigmaRLuma;
        v37[3] = inputSigmaRChroma;
        inputLambda = self->inputLambda;
        v36[4] = @"inputLambda";
        v36[5] = @"inputMaxNumIterations";
        inputMaxNumIterations = self->inputMaxNumIterations;
        v37[4] = inputLambda;
        v37[5] = inputMaxNumIterations;
        v36[6] = @"fullROI";
        v37[6] = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:", v5, v7, v9, v11);
        v26 = +[NSDictionary dictionaryWithObjects:v37 forKeys:v36 count:7];
        id v27 = +[CIImage imageYCC444:self->inputImage matrix:709 fullRange:1 colorSpace:0];
        inputConfidenceMapImage = self->inputConfidenceMapImage;
        inputDisparityImage = self->inputDisparityImage;
        v35[0] = v27;
        v35[1] = inputConfidenceMapImage;
        v35[2] = inputDisparityImage;
        v30 = +[NSArray arrayWithObjects:v35 count:3];
        uint64_t v33 = 0;
        id v31 = +[PFPFFBSProcessorCPU applyWithExtent:inputs:arguments:error:](PFPFFBSProcessorCPU, "applyWithExtent:inputs:arguments:error:", v30, v26, &v33, v5, v7, v9, v11);
        id v32 = +[PFPFFBSProcessorGPU applyWithExtent:inputs:arguments:error:](PFPFFBSProcessorGPU, "applyWithExtent:inputs:arguments:error:", v30, v26, &v33, v5, v7, v9, v11);
        v34[0] = v31;
        v34[1] = v32;
        return +[CIImage imageWithArrayOfImages:selector:](CIImage, "imageWithArrayOfImages:selector:", +[NSArray arrayWithObjects:v34 count:2], &stru_74CE8);
      }
      else
      {
LABEL_10:
        NSLog(@"Cannot use PortraitFastBilateralSolver unless all input images are of the same size.");
        return self->inputDisparityImage;
      }
    }
  }
  else
  {
    return +[CIImage emptyImage];
  }
  return result;
}

- (CIImage)inputImage
{
  return (CIImage *)objc_getProperty(self, a2, 72, 1);
}

- (void)setInputImage:(id)a3
{
}

- (CIImage)inputDisparityImage
{
  return (CIImage *)objc_getProperty(self, a2, 80, 1);
}

- (void)setInputDisparityImage:(id)a3
{
}

- (CIImage)inputConfidenceMapImage
{
  return (CIImage *)objc_getProperty(self, a2, 88, 1);
}

- (void)setInputConfidenceMapImage:(id)a3
{
}

- (NSNumber)inputMaxNumVertices
{
  return self->inputMaxNumVertices;
}

- (void)setInputMaxNumVertices:(id)a3
{
}

- (NSNumber)inputSigmaS
{
  return self->inputSigmaS;
}

- (void)setInputSigmaS:(id)a3
{
}

- (NSNumber)inputSigmaRLuma
{
  return self->inputSigmaRLuma;
}

- (void)setInputSigmaRLuma:(id)a3
{
}

- (NSNumber)inputSigmaRChroma
{
  return self->inputSigmaRChroma;
}

- (void)setInputSigmaRChroma:(id)a3
{
}

- (NSNumber)inputLambda
{
  return self->inputLambda;
}

- (void)setInputLambda:(id)a3
{
}

- (NSNumber)inputMaxNumIterations
{
  return self->inputMaxNumIterations;
}

- (void)setInputMaxNumIterations:(id)a3
{
}

@end