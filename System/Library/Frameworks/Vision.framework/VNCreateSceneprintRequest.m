@interface VNCreateSceneprintRequest
+ (BOOL)recordSpecifierModelEquivalenciesInRegistrar:(id)a3 error:(id *)a4;
+ (BOOL)revision:(unint64_t)a3 mayAcceptResultsProducedByRevision:(unint64_t)a4;
+ (Class)configurationClass;
+ (const)revisionAvailability;
+ (id)descriptionForPrivateRevision:(unint64_t)a3;
+ (id)privateRevisionsSet;
- (BOOL)hasCancellationHook;
- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5;
- (BOOL)returnAllResults;
- (BOOL)useCenterTileOnly;
- (BOOL)willAcceptCachedResultsFromRequestWithConfiguration:(id)a3;
- (id)VNImageProcessingSessionPrintKeyPath;
- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4;
- (id)description;
- (id)newDefaultDetectorOptionsForRequestRevision:(unint64_t)a3 session:(id)a4;
- (id)supportedImageSizeSet;
- (unint64_t)imageCropAndScaleOption;
- (void)applyConfigurationOfRequest:(id)a3;
- (void)setImageCropAndScaleOption:(unint64_t)a3;
- (void)setReturnAllResults:(BOOL)a3;
- (void)setUseCenterTileOnly:(BOOL)a3;
@end

@implementation VNCreateSceneprintRequest

- (id)VNImageProcessingSessionPrintKeyPath
{
  return @"sceneprints.@firstObject";
}

+ (BOOL)revision:(unint64_t)a3 mayAcceptResultsProducedByRevision:(unint64_t)a4
{
  unint64_t v7 = +[VNImageAnalyzerMultiDetector modelForRequestClass:a1 revision:a3];
  if (v7 != +[VNImageAnalyzerMultiDetector modelForRequestClass:a1 revision:a4])return 0; {
  v9.receiver = a1;
  }
  v9.super_class = (Class)&OBJC_METACLASS___VNCreateSceneprintRequest;
  return objc_msgSendSuper2(&v9, sel_revision_mayAcceptResultsProducedByRevision_, a3, a4);
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (id)descriptionForPrivateRevision:(unint64_t)a3
{
  if (a3 - 3737841664u >= 9)
  {
    v5.receiver = a1;
    v5.super_class = (Class)&OBJC_METACLASS___VNCreateSceneprintRequest;
    objc_msgSendSuper2(&v5, sel_descriptionForPrivateRevision_);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E5B1EF40[a3 - 3737841664u];
  }

  return v3;
}

+ (id)privateRevisionsSet
{
  if (+[VNCreateSceneprintRequest privateRevisionsSet]::onceToken != -1) {
    dispatch_once(&+[VNCreateSceneprintRequest privateRevisionsSet]::onceToken, &__block_literal_global_30193);
  }
  v2 = (void *)+[VNCreateSceneprintRequest privateRevisionsSet]::ourPrivateRevisions;

  return v2;
}

uint64_t __48__VNCreateSceneprintRequest_privateRevisionsSet__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  +[VNCreateSceneprintRequest privateRevisionsSet]::ourPrivateRevisions = VNRequestPrivateRevisionsSet(0xDECAF002uLL, a2, a3, a4, a5, a6, a7, a8, 3737841671);

  return MEMORY[0x1F41817F8]();
}

+ (BOOL)recordSpecifierModelEquivalenciesInRegistrar:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([v6 registerRequestClass:a1 revision:3 equivalencyToRevision:3737841671 error:a4]) {
    char v7 = [v6 registerRequestClass:a1 revision:3737841671 equivalencyToRevision:3737841672 error:a4];
  }
  else {
    char v7 = 0;
  }

  return v7;
}

- (id)supportedImageSizeSet
{
  v8[1] = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(VNRequest *)self resolvedRevision];
  if (v3 == 3737841666 || v3 == 2)
  {
    v4 = [[VNSupportedImageSize alloc] initWithIdealFormat:1111970369 width:299 height:299 orientation:1 aspectRatioHandling:0 orientationAgnostic:0];
    v8[0] = v4;
    objc_super v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)VNCreateSceneprintRequest;
    objc_super v5 = [(VNImageBasedRequest *)&v7 supportedImageSizeSet];
  }

  return v5;
}

- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  objc_super v9 = v8;
  if (a3 == 2 || a3 == 3737841666)
  {
    v10 = [v8 imageBufferAndReturnError:a5];
    if (v10)
    {
      v11 = [v9 session];
      id v21 = 0;
      v12 = [(VNRequest *)self applicableDetectorAndOptions:&v21 forRevision:a3 loadedInSession:v11 error:a5];
      id v13 = v21;
      if (v12)
      {
        v22[0] = v10;
        v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
        [v13 setObject:v14 forKeyedSubscript:@"VNDetectorProcessOption_InputImageBuffers"];

        v15 = objc_msgSend(NSNumber, "numberWithBool:", -[VNCreateSceneprintRequest useCenterTileOnly](self, "useCenterTileOnly"));
        [v13 setObject:v15 forKeyedSubscript:@"VNEspressoModelClassifierProcessOption_CenterTileOnly"];

        v16 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[VNCreateSceneprintRequest imageCropAndScaleOption](self, "imageCropAndScaleOption"));
        [v13 setObject:v16 forKeyedSubscript:@"VNDetectorProcessOption_ImageCropAndScaleOption"];

        uint64_t v17 = [v9 qosClass];
        [(VNImageBasedRequest *)self regionOfInterest];
        v18 = objc_msgSend(v12, "processUsingQualityOfServiceClass:options:regionOfInterest:warningRecorder:error:progressHandler:", v17, v13, self, a5, 0);
        BOOL v19 = v18 != 0;
        if (v18) {
          [(VNRequest *)self setResults:v18];
        }
      }
      else
      {
        BOOL v19 = 0;
      }
    }
    else
    {
      BOOL v19 = 0;
    }
  }
  else if (a5)
  {
    +[VNError errorForUnsupportedRevision:a3 ofRequest:self];
    BOOL v19 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v19 = 0;
  }

  return v19;
}

- (id)newDefaultDetectorOptionsForRequestRevision:(unint64_t)a3 session:(id)a4
{
  v21[1] = *MEMORY[0x1E4F143B8];
  v19.receiver = self;
  v19.super_class = (Class)VNCreateSceneprintRequest;
  id v6 = [(VNRequest *)&v19 newDefaultDetectorOptionsForRequestRevision:a3 session:a4];
  objc_super v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[VNCreateSceneprintRequest imageCropAndScaleOption](self, "imageCropAndScaleOption"));
  [v6 setObject:v7 forKeyedSubscript:@"VNDetectorProcessOption_ImageCropAndScaleOption"];

  id v8 = [(VNRequest *)self frameworkClass];
  if (+[VNCoreSceneUnderstandingDetector handlesRequestClass:v8 revision:a3])
  {
    objc_super v9 = [(VNCoreSceneUnderstandingDetectorFeatureConfiguration *)[VNCoreSceneUnderstandingDetectorSceneprintConfiguration alloc] initWithObservationsRecipient:self];
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
      id v13 = [NSNumber numberWithUnsignedInteger:v12];
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

- (void)applyConfigurationOfRequest:(id)a3
{
  v4 = (VNCreateSceneprintRequest *)a3;
  if (self != v4)
  {
    v5.receiver = self;
    v5.super_class = (Class)VNCreateSceneprintRequest;
    [(VNImageBasedRequest *)&v5 applyConfigurationOfRequest:v4];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(VNCreateSceneprintRequest *)self setReturnAllResults:[(VNCreateSceneprintRequest *)v4 returnAllResults]];
      [(VNCreateSceneprintRequest *)self setUseCenterTileOnly:[(VNCreateSceneprintRequest *)v4 useCenterTileOnly]];
      [(VNCreateSceneprintRequest *)self setImageCropAndScaleOption:[(VNCreateSceneprintRequest *)v4 imageCropAndScaleOption]];
    }
  }
}

- (BOOL)hasCancellationHook
{
  return 1;
}

- (BOOL)willAcceptCachedResultsFromRequestWithConfiguration:(id)a3
{
  id v4 = a3;
  if (([v4 resolvedRevision] != 2
     || (unint64_t v5 = -[VNRequest detectionLevel](self, "detectionLevel"), v5 == [v4 detectionLevel]))
    && (int v6 = [(VNCreateSceneprintRequest *)self returnAllResults],
        v6 == [v4 returnAllResults])
    && (int v7 = [(VNCreateSceneprintRequest *)self useCenterTileOnly],
        v7 == [v4 useCenterTileOnly])
    && (unint64_t v8 = [(VNCreateSceneprintRequest *)self imageCropAndScaleOption],
        v8 == [v4 imageCropAndScaleOption]))
  {
    v11.receiver = self;
    v11.super_class = (Class)VNCreateSceneprintRequest;
    BOOL v9 = [(VNImageBasedRequest *)&v11 willAcceptCachedResultsFromRequestWithConfiguration:v4];
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (void)setImageCropAndScaleOption:(unint64_t)a3
{
  id v4 = [(VNRequest *)self configuration];
  [v4 setImageCropAndScaleOption:a3];
}

- (unint64_t)imageCropAndScaleOption
{
  v2 = [(VNRequest *)self configuration];
  unint64_t v3 = [v2 imageCropAndScaleOption];

  return v3;
}

- (void)setUseCenterTileOnly:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(VNRequest *)self configuration];
  [v4 setUseCenterTileOnly:v3];
}

- (BOOL)useCenterTileOnly
{
  v2 = [(VNRequest *)self configuration];
  char v3 = [v2 useCenterTileOnly];

  return v3;
}

- (void)setReturnAllResults:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(VNRequest *)self configuration];
  [v4 setReturnAllResults:v3];
}

- (BOOL)returnAllResults
{
  v2 = [(VNRequest *)self configuration];
  char v3 = [v2 returnAllResults];

  return v3;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  v7.receiver = self;
  v7.super_class = (Class)VNCreateSceneprintRequest;
  id v4 = [(VNImageBasedRequest *)&v7 description];
  unint64_t v5 = VNImageCropAndScaleOptionToString([(VNCreateSceneprintRequest *)self imageCropAndScaleOption]);
  [v3 appendFormat:@"%@ %@", v4, v5];

  if ([(VNCreateSceneprintRequest *)self useCenterTileOnly]) {
    [v3 appendString:@" useCenterTileOnly"];
  }
  if ([(VNCreateSceneprintRequest *)self returnAllResults]) {
    [v3 appendString:@" returnAllResults"];
  }

  return v3;
}

- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4
{
  objc_super v7 = [(VNRequest *)self frameworkClass];
  if (+[VNCoreSceneUnderstandingDetector handlesRequestClass:v7 revision:a3])
  {
    unint64_t v8 = @"VNCoreSceneUnderstandingDetectorType";
LABEL_5:
    BOOL v9 = v8;
    goto LABEL_6;
  }
  if (+[VNImageAnalyzerMultiDetector modelForRequestClass:v7 revision:a3])
  {
    unint64_t v8 = @"VNImageAnalyzerMultiDetectorType";
    goto LABEL_5;
  }
  if (a4)
  {
    +[VNError errorForUnsupportedRevision:a3 ofRequest:self];
    unint64_t v8 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    unint64_t v8 = 0;
  }
LABEL_6:

  return v8;
}

+ (const)revisionAvailability
{
  return (const $1305BF644A263E76A656B24897EDB60D *)&+[VNCreateSceneprintRequest(Revisioning) revisionAvailability]::ourRevisionAvailability;
}

@end