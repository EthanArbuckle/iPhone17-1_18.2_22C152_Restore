@interface VNCoreSceneUnderstandingCompoundRequest
+ (Class)configurationClass;
+ (id)compoundRequestsForOriginalRequests:(id)a3 withPerformingContext:(id)a4 error:(id *)a5;
+ (void)_evaluateOriginalVN5kJNH3eYuyaLxNpZr5Z7zi:(id)a3 configurations:(id)a4;
+ (void)_evaluateOriginalVN6Mb1ME89lyW3HpahkEygIG:(id)a3 configurations:(id)a4;
+ (void)_evaluateOriginalVNClassifyCityNatureImageRequest:(id)a3 configurations:(id)a4;
+ (void)_evaluateOriginalVNClassifyImageAestheticsRequest:(id)a3 configurations:(id)a4;
+ (void)_evaluateOriginalVNClassifyImageRequest:(id)a3 configurations:(id)a4;
+ (void)_evaluateOriginalVNClassifyJunkImageRequest:(id)a3 configurations:(id)a4;
+ (void)_evaluateOriginalVNCreateImageFingerprintsRequest:(id)a3 configurations:(id)a4;
+ (void)_evaluateOriginalVNCreateSceneprintRequest:(id)a3 configurations:(id)a4;
+ (void)_evaluateOriginalVNGenerateAttentionBasedSaliencyImageRequest:(id)a3 configurations:(id)a4;
+ (void)_evaluateOriginalVNGenerateImageFeaturePrintRequest:(id)a3 configurations:(id)a4;
+ (void)_evaluateOriginalVNGenerateObjectnessBasedSaliencyImageRequest:(id)a3 configurations:(id)a4;
+ (void)_evaluateOriginalVNRecognizeObjectsRequest:(id)a3 configurations:(id)a4;
+ (void)_evaluateOriginalVNSceneClassificationRequest:(id)a3 configurations:(id)a4;
- (BOOL)allowsCachingOfResults;
- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5;
- (VNCoreSceneUnderstandingCompoundRequest)initWithDetectorType:(id)a3 configuration:(id)a4;
- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4;
- (id)newDefaultDetectorOptionsForRequestRevision:(unint64_t)a3 session:(id)a4;
@end

@implementation VNCoreSceneUnderstandingCompoundRequest

+ (id)compoundRequestsForOriginalRequests:(id)a3 withPerformingContext:(id)a4 error:(id *)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v21 = a4;
  v22 = objc_alloc_init(VNCoreSceneUnderstandingCompoundRequestDetectorConfigurations);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = v7;
  uint64_t v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16, v7);
  if (v8)
  {
    uint64_t v9 = *(void *)v30;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v30 != v9) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v29 + 1) + 8 * v10);
        unint64_t v12 = [v11 frameworkClass];
        if (+[VNCoreSceneUnderstandingDetector handlesRequestClass:revision:](VNCoreSceneUnderstandingDetector, "handlesRequestClass:revision:", v12, [v11 resolvedRevision]))
        {
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __107__VNCoreSceneUnderstandingCompoundRequest_compoundRequestsForOriginalRequests_withPerformingContext_error___block_invoke;
          block[3] = &__block_descriptor_40_e5_v8__0l;
          block[4] = a1;
          if (+[VNCoreSceneUnderstandingCompoundRequest compoundRequestsForOriginalRequests:withPerformingContext:error:]::originalRequestClassToSelectorMapOnceToken != -1) {
            dispatch_once(&+[VNCoreSceneUnderstandingCompoundRequest compoundRequestsForOriginalRequests:withPerformingContext:error:]::originalRequestClassToSelectorMapOnceToken, block);
          }
          v13 = std::__hash_table<std::__hash_value_type<objc_class * {__strong},objc_selector *>,std::__unordered_map_hasher<objc_class * {__strong},std::__hash_value_type<objc_class * {__strong},objc_selector *>,std::hash<objc_class * {__strong}>,std::equal_to<objc_class * {__strong}>,true>,std::__unordered_map_equal<objc_class * {__strong},std::__hash_value_type<objc_class * {__strong},objc_selector *>,std::equal_to<objc_class * {__strong}>,std::hash<objc_class * {__strong}>,true>,std::allocator<std::__hash_value_type<objc_class * {__strong},objc_selector *>>>::find<objc_class * {__strong}>((void *)+[VNCoreSceneUnderstandingCompoundRequest compoundRequestsForOriginalRequests:withPerformingContext:error:]::originalRequestClassToSelectorMap, v12);
          if (v13) {
            [a1 performSelector:v13[3] withObject:v11 withObject:v22];
          }
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v8);
  }

  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v15 = [(VNCoreSceneUnderstandingCompoundRequestDetectorConfigurations *)v22 allConfigurations];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v24 objects:v33 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v25 != v17) {
          objc_enumerationMutation(v15);
        }
        v19 = (void *)[objc_alloc((Class)a1) initWithDetectorType:@"VNCoreSceneUnderstandingDetectorType" configuration:*(void *)(*((void *)&v24 + 1) + 8 * i)];
        [v14 addObject:v19];
      }
      uint64_t v16 = [v15 countByEnumeratingWithState:&v24 objects:v33 count:16];
    }
    while (v16);
  }

  return v14;
}

- (void).cxx_destruct
{
}

- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  uint64_t v9 = [v8 imageBufferAndReturnError:a5];
  if (v9)
  {
    uint64_t v10 = [v8 session];
    id v18 = 0;
    v11 = [(VNRequest *)self applicableDetectorAndOptions:&v18 forRevision:a3 loadedInSession:v10 error:a5];
    id v12 = v18;
    if (v11)
    {
      v19[0] = v9;
      v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
      [v12 setObject:v13 forKeyedSubscript:@"VNDetectorProcessOption_InputImageBuffers"];

      uint64_t v14 = [v8 qosClass];
      [(VNCompoundRequest *)self regionOfInterest];
      v15 = objc_msgSend(v11, "processUsingQualityOfServiceClass:options:regionOfInterest:warningRecorder:error:progressHandler:", v14, v12, self, a5, 0);
      BOOL v16 = v15 != 0;
      if (v15)
      {
        [(VNRequest *)self setResults:v15];
        [(VNCompoundRequest *)self recordWarningsInOriginalRequests];
        [(VNCoreSceneUnderstandingCompoundRequestDetectorConfiguration *)self->_detectorConfiguration cacheResultsInRequestPerformingContext:v8];
      }
    }
    else
    {
      BOOL v16 = 0;
    }
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

- (BOOL)allowsCachingOfResults
{
  return 0;
}

- (id)newDefaultDetectorOptionsForRequestRevision:(unint64_t)a3 session:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)VNCoreSceneUnderstandingCompoundRequest;
  id v5 = [(VNRequest *)&v9 newDefaultDetectorOptionsForRequestRevision:a3 session:a4];
  v6 = [(VNRequest *)self configuration];
  id v7 = [v6 detectorConfigurationOptions];
  [v5 addEntriesFromDictionary:v7];

  return v5;
}

- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4
{
  v4 = [(VNRequest *)self configuration];
  id v5 = [v4 detectorType];

  return v5;
}

- (VNCoreSceneUnderstandingCompoundRequest)initWithDetectorType:(id)a3 configuration:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v20 = a3;
  id v6 = a4;
  id v7 = [v6 originalRequests];
  v25.receiver = self;
  v25.super_class = (Class)VNCoreSceneUnderstandingCompoundRequest;
  id v8 = [(VNCompoundRequest *)&v25 initWithOriginalRequests:v7];
  objc_super v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_detectorConfiguration, a4);
    uint64_t v10 = [v6 mainStageComputeDevice];
    [(VNRequest *)v9 setComputeDevice:v10 forComputeStage:@"VNComputeStageMain"];

    v11 = [(VNRequest *)v9 configuration];
    [v11 setDetectorType:v20];
    id v12 = [v6 detectorConfigurationOptions];
    [v11 setDetectorConfigurationOptions:v12];

    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v14 = v7;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v22;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v22 != v16) {
            objc_enumerationMutation(v14);
          }
          id v18 = [*(id *)(*((void *)&v21 + 1) + 8 * v17) configuration];
          [v13 addObject:v18];

          ++v17;
        }
        while (v15 != v17);
        uint64_t v15 = [v14 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v15);
    }

    [v11 setOriginalRequestConfigurations:v13];
  }

  return v9;
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

void __107__VNCoreSceneUnderstandingCompoundRequest_compoundRequestsForOriginalRequests_withPerformingContext_error___block_invoke()
{
}

+ (void)_evaluateOriginalVNClassifyCityNatureImageRequest:(id)a3 configurations:(id)a4
{
  id v8 = a3;
  id v5 = a4;
  if ([v8 resolvedRevision] == 2)
  {
    id v6 = [v5 configurationForRequest:v8];
    id v7 = (id)[v6 addCityNatureConfigurationForOriginalRequest:v8];
  }
}

+ (void)_evaluateOriginalVN6Mb1ME89lyW3HpahkEygIG:(id)a3 configurations:(id)a4
{
  id v8 = a3;
  id v5 = a4;
  if ([v8 resolvedRevision] == 2)
  {
    id v6 = [v5 configurationForRequest:v8];
    id v7 = (id)[v6 addSignificantEventConfigurationForOriginalRequest:v8];
  }
}

+ (void)_evaluateOriginalVN5kJNH3eYuyaLxNpZr5Z7zi:(id)a3 configurations:(id)a4
{
  id v8 = a3;
  id v5 = a4;
  if ((unint64_t)([v8 resolvedRevision] - 3737841667) < 2)
  {
    id v6 = [v5 configurationForRequest:v8];
    id v7 = (id)[v6 addVN5kJNH3eYuyaLxNpZr5Z7ziConfigurationForOriginalRequest:v8];
  }
}

+ (void)_evaluateOriginalVNClassifyJunkImageRequest:(id)a3 configurations:(id)a4
{
  id v8 = a3;
  id v5 = a4;
  if ((unint64_t)([v8 resolvedRevision] - 3737841669) < 2)
  {
    id v6 = [v5 configurationForRequest:v8];
    id v7 = (id)[v6 addJunkConfigurationForOriginalRequest:v8];
  }
}

+ (void)_evaluateOriginalVNCreateImageFingerprintsRequest:(id)a3 configurations:(id)a4
{
  id v8 = a3;
  id v5 = a4;
  if ([v8 resolvedRevision] == 1)
  {
    id v6 = [v5 configurationForRequest:v8];
    id v7 = (id)[v6 addImageFingerprintsConfigurationForOriginalRequest:v8];
  }
}

+ (void)_evaluateOriginalVNRecognizeObjectsRequest:(id)a3 configurations:(id)a4
{
  id v9 = a3;
  id v5 = a4;
  if ([v9 resolvedRevision] == 3737841667)
  {
    id v6 = [v5 configurationForRequest:v9];
    id v7 = [v6 addRecognizeObjectsConfigurationForOriginalRequest:v9];
    [v9 modelMinimumDetectionConfidence];
    objc_msgSend(v7, "setMinimumDetectionConfidence:");
    [v9 modelNonMaximumSuppressionThreshold];
    objc_msgSend(v7, "setNonMaximumSuppressionThreshold:");
    id v8 = [v9 targetedIdentifiers];
    [v7 setTargetedIdentifiers:v8];
  }
}

+ (void)_evaluateOriginalVNGenerateObjectnessBasedSaliencyImageRequest:(id)a3 configurations:(id)a4
{
  id v9 = a3;
  id v5 = a4;
  uint64_t v6 = [v9 resolvedRevision];
  if (v6 == 2 || v6 == 3737841666)
  {
    id v7 = [v5 configurationForRequest:v9];
    id v8 = (id)[v7 addImageSaliencyOConfigurationForOriginalRequest:v9];
  }
}

+ (void)_evaluateOriginalVNGenerateAttentionBasedSaliencyImageRequest:(id)a3 configurations:(id)a4
{
  id v10 = a3;
  id v5 = a4;
  uint64_t v6 = [v10 resolvedRevision];
  if ((unint64_t)(v6 - 3737841667) < 2 || v6 == 2)
  {
    id v8 = [v5 configurationForRequest:v10];
    id v9 = (id)[v8 addImageSaliencyAConfigurationForOriginalRequest:v10];
  }
}

+ (void)_evaluateOriginalVNClassifyImageAestheticsRequest:(id)a3 configurations:(id)a4
{
  id v8 = a3;
  id v5 = a4;
  if ((unint64_t)([v8 resolvedRevision] - 3737841667) < 2)
  {
    uint64_t v6 = [v5 configurationForRequest:v8];
    id v7 = (id)[v6 addImageAestheticsConfigurationForOriginalRequest:v8];
  }
}

+ (void)_evaluateOriginalVNGenerateImageFeaturePrintRequest:(id)a3 configurations:(id)a4
{
  id v8 = a3;
  id v5 = a4;
  if ([v8 resolvedRevision] == 2)
  {
    uint64_t v6 = [v5 configurationForRequest:v8];
    id v7 = (id)[v6 addSceneprintConfigurationForOriginalRequest:v8];
  }
}

+ (void)_evaluateOriginalVNCreateSceneprintRequest:(id)a3 configurations:(id)a4
{
  id v10 = a3;
  id v5 = a4;
  uint64_t v6 = [v10 resolvedRevision];
  if ((unint64_t)(v6 - 3737841671) < 2 || v6 == 3)
  {
    id v8 = [v5 configurationForRequest:v10];
    id v9 = (id)[v8 addSceneprintConfigurationForOriginalRequest:v10];
  }
}

+ (void)_evaluateOriginalVNSceneClassificationRequest:(id)a3 configurations:(id)a4
{
  id v9 = a3;
  id v5 = a4;
  uint64_t v6 = [v9 sceneObservation];

  if (!v6 && [v9 resolvedRevision] == 3737841665)
  {
    id v7 = [v5 configurationForRequest:v9];
    id v8 = [v7 addImageClassificationConfigurationForOriginalRequest:v9];
    objc_msgSend(v8, "setMaximumLeafClassifications:", objc_msgSend(v9, "maximumLeafObservations"));
    objc_msgSend(v8, "setMaximumHierarchicalClassifications:", objc_msgSend(v9, "maximumHierarchicalObservations"));
  }
}

+ (void)_evaluateOriginalVNClassifyImageRequest:(id)a3 configurations:(id)a4
{
  id v9 = a3;
  id v5 = a4;
  uint64_t v6 = [v9 resolvedRevision];
  if (v6 == 2 || v6 == 3737841666)
  {
    id v7 = [v5 configurationForRequest:v9];
    id v8 = [v7 addImageClassificationConfigurationForOriginalRequest:v9];
    objc_msgSend(v8, "setMaximumLeafClassifications:", objc_msgSend(v9, "maximumLeafObservations"));
    objc_msgSend(v8, "setMaximumHierarchicalClassifications:", objc_msgSend(v9, "maximumHierarchicalObservations"));
  }
  else
  {
    if (v6 != 3737841667) {
      goto LABEL_7;
    }
    id v7 = [v5 configurationForRequest:v9];
    id v8 = [v7 addEntityNetClassificationConfigurationForOriginalRequest:v9];
    objc_msgSend(v8, "setMaximumClassifications:", objc_msgSend(v9, "maximumLeafObservations"));
  }

LABEL_7:
}

@end