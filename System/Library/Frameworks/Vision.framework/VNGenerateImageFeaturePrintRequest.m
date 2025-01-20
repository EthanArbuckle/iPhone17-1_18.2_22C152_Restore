@interface VNGenerateImageFeaturePrintRequest
+ (BOOL)recordSpecifierModelEquivalenciesInRegistrar:(id)a3 error:(id *)a4;
+ (BOOL)revision:(unint64_t)a3 mayAcceptResultsProducedByRevision:(unint64_t)a4;
+ (Class)configurationClass;
+ (const)revisionAvailability;
- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5;
- (BOOL)willAcceptCachedResultsFromRequestWithConfiguration:(id)a3;
- (VNImageCropAndScaleOption)imageCropAndScaleOption;
- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4;
- (id)description;
- (id)newDefaultDetectorOptionsForRequestRevision:(unint64_t)a3 session:(id)a4;
- (void)applyConfigurationOfRequest:(id)a3;
- (void)setImageCropAndScaleOption:(VNImageCropAndScaleOption)imageCropAndScaleOption;
@end

@implementation VNGenerateImageFeaturePrintRequest

- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5
{
  id v8 = a4;
  if (a3 - 1 > 1)
  {
    if (a5)
    {
      v9 = +[VNError errorForUnsupportedRevision:a3 ofRequest:self];
      goto LABEL_6;
    }
  }
  else if (a5)
  {
    v9 = +[VNError errorForUnsupportedConfigurationOfRequest:self];
LABEL_6:
    *a5 = v9;
  }

  return 0;
}

- (void)applyConfigurationOfRequest:(id)a3
{
  v4 = (VNGenerateImageFeaturePrintRequest *)a3;
  if (self != v4)
  {
    v5.receiver = self;
    v5.super_class = (Class)VNGenerateImageFeaturePrintRequest;
    [(VNImageBasedRequest *)&v5 applyConfigurationOfRequest:v4];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(VNGenerateImageFeaturePrintRequest *)self setImageCropAndScaleOption:[(VNGenerateImageFeaturePrintRequest *)v4 imageCropAndScaleOption]];
    }
  }
}

- (BOOL)willAcceptCachedResultsFromRequestWithConfiguration:(id)a3
{
  id v4 = a3;
  VNImageCropAndScaleOption v5 = [(VNGenerateImageFeaturePrintRequest *)self imageCropAndScaleOption];
  if (v5 == [v4 imageCropAndScaleOption])
  {
    v8.receiver = self;
    v8.super_class = (Class)VNGenerateImageFeaturePrintRequest;
    BOOL v6 = [(VNImageBasedRequest *)&v8 willAcceptCachedResultsFromRequestWithConfiguration:v4];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)newDefaultDetectorOptionsForRequestRevision:(unint64_t)a3 session:(id)a4
{
  v21[1] = *MEMORY[0x1E4F143B8];
  v19.receiver = self;
  v19.super_class = (Class)VNGenerateImageFeaturePrintRequest;
  id v6 = [(VNRequest *)&v19 newDefaultDetectorOptionsForRequestRevision:a3 session:a4];
  v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[VNGenerateImageFeaturePrintRequest imageCropAndScaleOption](self, "imageCropAndScaleOption"));
  [v6 setObject:v7 forKeyedSubscript:@"VNDetectorProcessOption_ImageCropAndScaleOption"];

  objc_super v8 = [(VNRequest *)self frameworkClass];
  if (+[VNCoreSceneUnderstandingDetector handlesRequestClass:v8 revision:a3])
  {
    v9 = [(VNCoreSceneUnderstandingDetectorFeatureConfiguration *)[VNCoreSceneUnderstandingDetectorSceneprintConfiguration alloc] initWithObservationsRecipient:self];
    v21[0] = v9;
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
    [v6 setObject:v10 forKeyedSubscript:@"VNCoreSceneUnderstandingDetectorProcessingOption_SceneprintConfigurations"];

    id v11 = v6;
  }
  else
  {
    unint64_t v12 = +[VNImageAnalyzerMultiDetector modelForRequestClass:v8 revision:a3];
    if (v12)
    {
      v13 = [NSNumber numberWithUnsignedInteger:v12];
      [v6 setObject:v13 forKeyedSubscript:@"VNImageAnalyzerMultiDetectorInitializationOption_Model"];

      v14 = [(VNImageAnalyzerMultiDetectorAnalysisConfiguration *)[VNImageAnalyzerMultiDetectorSceneprintConfiguration alloc] initWithObservationsRecipient:self];
      v20 = v14;
      v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1];
      [v6 setObject:v15 forKeyedSubscript:@"VNImageAnalyzerMultiDetectorOption_SceneprintConfigurations"];

      id v16 = v6;
    }
    else
    {
      id v17 = v6;
    }
  }

  return v6;
}

- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4
{
  v7 = [(VNRequest *)self frameworkClass];
  if (+[VNCoreSceneUnderstandingDetector handlesRequestClass:v7 revision:a3])
  {
    objc_super v8 = @"VNCoreSceneUnderstandingDetectorType";
LABEL_5:
    v9 = v8;
    goto LABEL_6;
  }
  if (+[VNImageAnalyzerMultiDetector modelForRequestClass:v7 revision:a3])
  {
    objc_super v8 = @"VNImageAnalyzerMultiDetectorType";
    goto LABEL_5;
  }
  if (a4)
  {
    +[VNError errorForUnsupportedRevision:a3 ofRequest:self];
    objc_super v8 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_super v8 = 0;
  }
LABEL_6:

  return v8;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)VNGenerateImageFeaturePrintRequest;
  id v4 = [(VNImageBasedRequest *)&v8 description];
  VNImageCropAndScaleOption v5 = VNImageCropAndScaleOptionToString([(VNGenerateImageFeaturePrintRequest *)self imageCropAndScaleOption]);
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (void)setImageCropAndScaleOption:(VNImageCropAndScaleOption)imageCropAndScaleOption
{
  id v4 = [(VNRequest *)self configuration];
  [v4 setImageCropAndScaleOption:imageCropAndScaleOption];
}

- (VNImageCropAndScaleOption)imageCropAndScaleOption
{
  v2 = [(VNRequest *)self configuration];
  VNImageCropAndScaleOption v3 = [v2 imageCropAndScaleOption];

  return v3;
}

+ (BOOL)revision:(unint64_t)a3 mayAcceptResultsProducedByRevision:(unint64_t)a4
{
  unint64_t v7 = +[VNImageAnalyzerMultiDetector modelForRequestClass:a1 revision:a3];
  if (v7 != +[VNImageAnalyzerMultiDetector modelForRequestClass:a1 revision:a4])return 0; {
  v9.receiver = a1;
  }
  v9.super_class = (Class)&OBJC_METACLASS___VNGenerateImageFeaturePrintRequest;
  return objc_msgSendSuper2(&v9, sel_revision_mayAcceptResultsProducedByRevision_, a3, a4);
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)recordSpecifierModelEquivalenciesInRegistrar:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if ([v5 registerRequestClassName:@"VNGenerateImageFeaturePrintRequest" revision:1 equivalencyToRequestClassName:@"VNCreateSceneprintRequest" revision:2 error:a4])char v6 = objc_msgSend(v5, "registerRequestClassName:revision:equivalencyToRequestClassName:revision:error:", @"VNGenerateImageFeaturePrintRequest", 2, @"VNCreateSceneprintRequest", 3, a4); {
  else
  }
    char v6 = 0;

  return v6;
}

+ (const)revisionAvailability
{
  return (const $1305BF644A263E76A656B24897EDB60D *)&+[VNGenerateImageFeaturePrintRequest revisionAvailability]::ourRevisionAvailability;
}

@end