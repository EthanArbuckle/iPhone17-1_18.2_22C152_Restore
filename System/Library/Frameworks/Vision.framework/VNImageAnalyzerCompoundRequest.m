@interface VNImageAnalyzerCompoundRequest
+ (Class)configurationClass;
+ (id)compoundRequestsForOriginalRequests:(id)a3 withPerformingContext:(id)a4 error:(id *)a5;
+ (id)publicRevisionsSet;
+ (void)_evaluateOriginalVN1JC7R3k4455fKQz0dY1VhQ:(id)a3 configurations:(id)a4;
+ (void)_evaluateOriginalVN5kJNH3eYuyaLxNpZr5Z7zi:(id)a3 configurations:(id)a4;
+ (void)_evaluateOriginalVN6Mb1ME89lyW3HpahkEygIG:(id)a3 configurations:(id)a4;
+ (void)_evaluateOriginalVNClassifyCityNatureImageRequest:(id)a3 configurations:(id)a4;
+ (void)_evaluateOriginalVNClassifyImageAestheticsRequest:(id)a3 configurations:(id)a4;
+ (void)_evaluateOriginalVNClassifyImageRequest:(id)a3 configurations:(id)a4;
+ (void)_evaluateOriginalVNClassifyJunkImageRequest:(id)a3 configurations:(id)a4;
+ (void)_evaluateOriginalVNClassifyPotentialLandmarkRequest:(id)a3 configurations:(id)a4;
+ (void)_evaluateOriginalVNCreateImageFingerprintsRequest:(id)a3 configurations:(id)a4;
+ (void)_evaluateOriginalVNCreateSceneprintRequest:(id)a3 configurations:(id)a4;
+ (void)_evaluateOriginalVNGenerateAttentionBasedSaliencyImageRequest:(id)a3 configurations:(id)a4;
+ (void)_evaluateOriginalVNGenerateImageFeaturePrintRequest:(id)a3 configurations:(id)a4;
+ (void)_evaluateOriginalVNGenerateObjectnessBasedSaliencyImageRequest:(id)a3 configurations:(id)a4;
+ (void)_evaluateOriginalVNRecognizeObjectsRequest:(id)a3 configurations:(id)a4;
+ (void)_evaluateOriginalVNSceneClassificationRequest:(id)a3 configurations:(id)a4;
+ (void)_evaluateOriginalVNVYvzEtX1JlUdu8xx5qhDI:(id)a3 configurations:(id)a4;
- (BOOL)allowsCachingOfResults;
- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5;
- (BOOL)willAcceptCachedResultsFromRequestWithConfiguration:(id)a3;
- (VNImageAnalyzerCompoundRequest)initWithDetectorType:(id)a3 groupingConfiguration:(id)a4;
- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4;
- (id)newDefaultDetectorOptionsForRequestRevision:(unint64_t)a3 session:(id)a4;
- (unint64_t)networkModel;
@end

@implementation VNImageAnalyzerCompoundRequest

+ (id)compoundRequestsForOriginalRequests:(id)a3 withPerformingContext:(id)a4 error:(id *)a5
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v37 = a3;
  id v35 = a4;
  v36 = [[VNImageAnalyzerCompoundRequestGroupingConfigurations alloc] initWithDetectorModel:1];
  v58 = v36;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  obuint64_t j = v37;
  uint64_t v7 = [obj countByEnumeratingWithState:&v45 objects:v57 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v46;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v46 != v8) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v45 + 1) + 8 * v9);
        unint64_t v11 = [v10 frameworkClass];
        unint64_t v12 = +[VNImageAnalyzerMultiDetector modelForRequestClass:revision:](VNImageAnalyzerMultiDetector, "modelForRequestClass:revision:", v11, [v10 resolvedRevision]);
        if (v12)
        {
          uint64_t v13 = *(void *)&v57[8 * v12 + 128];
          if (v13)
          {
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            block[2] = __98__VNImageAnalyzerCompoundRequest_compoundRequestsForOriginalRequests_withPerformingContext_error___block_invoke;
            block[3] = &__block_descriptor_40_e5_v8__0l;
            block[4] = a1;
            if (+[VNImageAnalyzerCompoundRequest compoundRequestsForOriginalRequests:withPerformingContext:error:]::originalRequestClassToSelectorMapOnceToken != -1) {
              dispatch_once(&+[VNImageAnalyzerCompoundRequest compoundRequestsForOriginalRequests:withPerformingContext:error:]::originalRequestClassToSelectorMapOnceToken, block);
            }
            v14 = std::__hash_table<std::__hash_value_type<objc_class * {__strong},objc_selector *>,std::__unordered_map_hasher<objc_class * {__strong},std::__hash_value_type<objc_class * {__strong},objc_selector *>,std::hash<objc_class * {__strong}>,std::equal_to<objc_class * {__strong}>,true>,std::__unordered_map_equal<objc_class * {__strong},std::__hash_value_type<objc_class * {__strong},objc_selector *>,std::equal_to<objc_class * {__strong}>,std::hash<objc_class * {__strong}>,true>,std::allocator<std::__hash_value_type<objc_class * {__strong},objc_selector *>>>::find<objc_class * {__strong}>((void *)+[VNImageAnalyzerCompoundRequest compoundRequestsForOriginalRequests:withPerformingContext:error:]::originalRequestClassToSelectorMap, v11);
            if (v14) {
              [a1 performSelector:v14[3] withObject:v10 withObject:v13];
            }
          }
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [obj countByEnumeratingWithState:&v45 objects:v57 count:16];
    }
    while (v7);
  }

  id v38 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v15 = v36;
  p_isa = (id *)&v15->super.isa;
  v39 = (id *)&v15->super.isa;
  if (v15)
  {
    uint64_t v17 = [(NSMutableDictionary *)v15->_groupingConfigurations count];
    p_isa = v39;
    if (v17)
    {
      v18 = [v39[1] allValues];
      v19 = (void *)[v18 copy];

      id v20 = v19;
      id v42 = v38;
      v41 = (objc_class *)self;
      long long v55 = 0u;
      long long v56 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      id v40 = v20;
      uint64_t v21 = [v40 countByEnumeratingWithState:&v53 objects:v60 count:16];
      if (v21)
      {
        uint64_t v22 = *(void *)v54;
        do
        {
          for (uint64_t i = 0; i != v21; ++i)
          {
            if (*(void *)v54 != v22) {
              objc_enumerationMutation(v40);
            }
            v24 = *(void **)(*((void *)&v53 + 1) + 8 * i);
            v25 = [NSNumber numberWithUnsignedInteger:1];
            [v24 setDetectorConfigurationOption:@"VNImageAnalyzerMultiDetectorInitializationOption_Model" value:v25];

            v26 = (void *)[[v41 alloc] initWithDetectorType:@"VNImageAnalyzerMultiDetectorType" groupingConfiguration:v24];
            v27 = [v24 computeStageDeviceAssignments];
            long long v51 = 0u;
            long long v52 = 0u;
            long long v49 = 0u;
            long long v50 = 0u;
            id v28 = v27;
            uint64_t v29 = [v28 countByEnumeratingWithState:&v49 objects:v59 count:16];
            if (v29)
            {
              uint64_t v30 = *(void *)v50;
              do
              {
                for (uint64_t j = 0; j != v29; ++j)
                {
                  if (*(void *)v50 != v30) {
                    objc_enumerationMutation(v28);
                  }
                  uint64_t v32 = *(void *)(*((void *)&v49 + 1) + 8 * j);
                  v33 = [v28 objectForKeyedSubscript:v32];
                  [v26 setComputeDevice:v33 forComputeStage:v32];
                }
                uint64_t v29 = [v28 countByEnumeratingWithState:&v49 objects:v59 count:16];
              }
              while (v29);
            }

            [v42 addObject:v26];
          }
          uint64_t v21 = [v40 countByEnumeratingWithState:&v53 objects:v60 count:16];
        }
        while (v21);
      }

      p_isa = v39;
    }
  }

  return v38;
}

- (void).cxx_destruct
{
}

- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5
{
  v65[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  uint64_t v9 = [v8 imageBufferAndReturnError:a5];
  if (v9)
  {
    v63 = [v8 session];
    id v64 = 0;
    v10 = -[VNRequest applicableDetectorAndOptions:forRevision:loadedInSession:error:](self, "applicableDetectorAndOptions:forRevision:loadedInSession:error:", &v64, a3);
    id v11 = v64;
    if (v10)
    {
      v65[0] = v9;
      unint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v65 count:1];
      [v11 setObject:v12 forKeyedSubscript:@"VNDetectorProcessOption_InputImageBuffers"];

      uint64_t v13 = [v8 qosClass];
      [(VNCompoundRequest *)self regionOfInterest];
      v14 = objc_msgSend(v10, "processUsingQualityOfServiceClass:options:regionOfInterest:warningRecorder:error:progressHandler:", v13, v11, self, a5, 0);
      BOOL v15 = v14 != 0;
      if (v14)
      {
        [(VNRequest *)self setResults:v14];
        [(VNCompoundRequest *)self recordWarningsInOriginalRequests];
        groupingConfiguration = self->_groupingConfiguration;
        id v62 = v8;
        if (groupingConfiguration)
        {
          uint64_t v17 = [(NSMutableDictionary *)groupingConfiguration->_detectorConfigurationOptions objectForKeyedSubscript:@"VNImageAnalyzerMultiDetectorOption_SceneConfigurations"];
          _recordResultsInObservationsRecipients(v17, v62);

          id v18 = [(NSMutableDictionary *)groupingConfiguration->_detectorConfigurationOptions objectForKeyedSubscript:@"VNImageAnalyzerMultiDetectorOption_EntityNetConfiguration"];
          id v19 = v62;
          if (v18)
          {
            id v20 = [v18 observationsRecipient];
            [v19 cacheObservationsOfRequest:v20];
          }
          uint64_t v21 = [(NSMutableDictionary *)groupingConfiguration->_detectorConfigurationOptions objectForKeyedSubscript:@"VNImageAnalyzerMultiDetectorOption_SceneprintConfigurations"];
          _recordResultsInObservationsRecipients(v21, v19);

          id v22 = [(NSMutableDictionary *)groupingConfiguration->_detectorConfigurationOptions objectForKeyedSubscript:@"VNImageAnalyzerMultiDetectorOption_CompressedSceneprintConfiguration"];
          id v23 = v19;
          if (v22)
          {
            v24 = [v22 observationsRecipient];
            [v23 cacheObservationsOfRequest:v24];
          }
          id v25 = [(NSMutableDictionary *)groupingConfiguration->_detectorConfigurationOptions objectForKeyedSubscript:@"VNImageAnalyzerMultiDetectorOption_AestheticsConfiguration"];
          id v26 = v23;
          if (v25)
          {
            v27 = [v25 observationsRecipient];
            [v26 cacheObservationsOfRequest:v27];
          }
          id v28 = [(NSMutableDictionary *)groupingConfiguration->_detectorConfigurationOptions objectForKeyedSubscript:@"VNImageAnalyzerMultiDetectorOption_SaliencyAConfiguration"];
          id v29 = v26;
          if (v28)
          {
            uint64_t v30 = [v28 observationsRecipient];
            [v29 cacheObservationsOfRequest:v30];
          }
          id v31 = [(NSMutableDictionary *)groupingConfiguration->_detectorConfigurationOptions objectForKeyedSubscript:@"VNImageAnalyzerMultiDetectorOption_SaliencyOConfiguration"];
          id v32 = v29;
          if (v31)
          {
            v33 = [v31 observationsRecipient];
            [v32 cacheObservationsOfRequest:v33];
          }
          id v34 = [(NSMutableDictionary *)groupingConfiguration->_detectorConfigurationOptions objectForKeyedSubscript:@"VNImageAnalyzerMultiDetectorOption_RecognizeObjectsConfiguration"];
          id v35 = v32;
          if (v34)
          {
            v36 = [v34 observationsRecipient];
            [v35 cacheObservationsOfRequest:v36];
          }
          id v37 = [(NSMutableDictionary *)groupingConfiguration->_detectorConfigurationOptions objectForKeyedSubscript:@"VNImageAnalyzerMultiDetectorOption_VN1JC7R3k4455fKQz0dY1VhQConfiguration"];
          id v38 = v35;
          if (v37)
          {
            v39 = [v37 observationsRecipient];
            [v38 cacheObservationsOfRequest:v39];
          }
          id v40 = [(NSMutableDictionary *)groupingConfiguration->_detectorConfigurationOptions objectForKeyedSubscript:@"VNImageAnalyzerMultiDetectorOption_ImageFingerprintsConfiguration"];
          id v41 = v38;
          if (v40)
          {
            id v42 = [v40 observationsRecipient];
            [v41 cacheObservationsOfRequest:v42];
          }
          id v43 = [(NSMutableDictionary *)groupingConfiguration->_detectorConfigurationOptions objectForKeyedSubscript:@"VNImageAnalyzerMultiDetectorOption_JunkConfiguration"];
          id v44 = v41;
          if (v43)
          {
            long long v45 = [v43 observationsRecipient];
            [v44 cacheObservationsOfRequest:v45];
          }
          id v46 = [(NSMutableDictionary *)groupingConfiguration->_detectorConfigurationOptions objectForKeyedSubscript:@"VNImageAnalyzerMultiDetectorOption_VNVYvzEtX1JlUdu8xx5qhDIConfiguration"];
          id v47 = v44;
          if (v46)
          {
            long long v48 = [v46 observationsRecipient];
            [v47 cacheObservationsOfRequest:v48];
          }
          id v49 = [(NSMutableDictionary *)groupingConfiguration->_detectorConfigurationOptions objectForKeyedSubscript:@"VNImageAnalyzerMultiDetectorOption_PotentialLandmarkConfiguration"];
          id v50 = v47;
          if (v49)
          {
            long long v51 = [v49 observationsRecipient];
            [v50 cacheObservationsOfRequest:v51];
          }
          id v52 = [(NSMutableDictionary *)groupingConfiguration->_detectorConfigurationOptions objectForKeyedSubscript:@"VNImageAnalyzerMultiDetectorOption_VN5kJNH3eYuyaLxNpZr5Z7ziConfiguration"];
          id v53 = v50;
          if (v52)
          {
            long long v54 = [v52 observationsRecipient];
            [v53 cacheObservationsOfRequest:v54];
          }
          id v55 = [(NSMutableDictionary *)groupingConfiguration->_detectorConfigurationOptions objectForKeyedSubscript:@"VNImageAnalyzerMultiDetectorOption_VN6Mb1ME89lyW3HpahkEygIGConfiguration"];
          id v56 = v53;
          if (v55)
          {
            v57 = [v55 observationsRecipient];
            [v56 cacheObservationsOfRequest:v57];
          }
          id v58 = [(NSMutableDictionary *)groupingConfiguration->_detectorConfigurationOptions objectForKeyedSubscript:@"VNImageAnalyzerMultiDetectorOption_CityNatureGatingConfiguration"];
          id v59 = v56;
          if (v58)
          {
            v60 = [v58 observationsRecipient];
            [v59 cacheObservationsOfRequest:v60];
          }
        }
      }
    }
    else
    {
      BOOL v15 = 0;
    }
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

- (BOOL)willAcceptCachedResultsFromRequestWithConfiguration:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  v34.receiver = self;
  v34.super_class = (Class)VNImageAnalyzerCompoundRequest;
  id v29 = a3;
  if (-[VNRequest willAcceptCachedResultsFromRequestWithConfiguration:](&v34, sel_willAcceptCachedResultsFromRequestWithConfiguration_))
  {
    v4 = [(VNRequest *)self configuration];
    v27 = v4;
    v5 = [v4 detectorType];
    v6 = [v29 detectorType];
    char v7 = [v5 isEqualToString:v6];

    if ((v7 & 1) != 0
      && ([v4 detectorConfigurationOptions],
          id v8 = objc_claimAutoreleasedReturnValue(),
          [v29 detectorConfigurationOptions],
          uint64_t v9 = objc_claimAutoreleasedReturnValue(),
          char v10 = [v8 isEqualToDictionary:v9],
          v9,
          v8,
          (v10 & 1) != 0))
    {
      id v11 = [v29 originalRequestConfigurations];
      id v28 = (void *)[v11 mutableCopy];

      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      obuint64_t j = [(VNCompoundRequest *)self originalRequests];
      uint64_t v12 = [obj countByEnumeratingWithState:&v30 objects:v39 count:16];
      if (v12)
      {
        uint64_t v13 = *(void *)v31;
        while (2)
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v31 != v13) {
              objc_enumerationMutation(obj);
            }
            id v15 = *(id *)(*((void *)&v30 + 1) + 8 * i);
            id v16 = v28;
            long long v35 = 0u;
            long long v36 = 0u;
            long long v37 = 0u;
            long long v38 = 0u;
            id v17 = v16;
            uint64_t v18 = [v17 countByEnumeratingWithState:&v35 objects:v40 count:16];
            if (v18)
            {
              uint64_t v19 = 0;
              uint64_t v20 = *(void *)v36;
              while (2)
              {
                uint64_t v21 = 0;
                uint64_t v22 = v18 + v19;
                do
                {
                  if (*(void *)v36 != v20) {
                    objc_enumerationMutation(v17);
                  }
                  if ([v15 willAcceptCachedResultsFromRequestWithConfiguration:*(void *)(*((void *)&v35 + 1) + 8 * v21)])
                  {
                    uint64_t v23 = v19 + v21;
                    goto LABEL_19;
                  }
                  ++v21;
                }
                while (v18 != v21);
                uint64_t v18 = [v17 countByEnumeratingWithState:&v35 objects:v40 count:16];
                uint64_t v19 = v22;
                if (v18) {
                  continue;
                }
                break;
              }
              uint64_t v23 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_19:
              v4 = v27;
            }
            else
            {
              uint64_t v23 = 0x7FFFFFFFFFFFFFFFLL;
            }

            if (v23 == 0x7FFFFFFFFFFFFFFFLL)
            {
              BOOL v24 = 0;
              goto LABEL_28;
            }
            [v17 removeObjectAtIndex:v23];
          }
          uint64_t v12 = [obj countByEnumeratingWithState:&v30 objects:v39 count:16];
          if (v12) {
            continue;
          }
          break;
        }
      }
      BOOL v24 = 1;
LABEL_28:
    }
    else
    {
      BOOL v24 = 0;
    }
  }
  else
  {
    BOOL v24 = 0;
  }

  return v24;
}

- (BOOL)allowsCachingOfResults
{
  return 1;
}

- (id)newDefaultDetectorOptionsForRequestRevision:(unint64_t)a3 session:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)VNImageAnalyzerCompoundRequest;
  id v5 = [(VNRequest *)&v9 newDefaultDetectorOptionsForRequestRevision:a3 session:a4];
  v6 = [(VNRequest *)self configuration];
  char v7 = [v6 detectorConfigurationOptions];
  [v5 addEntriesFromDictionary:v7];

  return v5;
}

- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4
{
  v4 = [(VNRequest *)self configuration];
  id v5 = [v4 detectorType];

  return v5;
}

- (unint64_t)networkModel
{
  groupingConfiguration = self->_groupingConfiguration;
  if (groupingConfiguration) {
    return groupingConfiguration->_detectorModel;
  }
  else {
    return 0;
  }
}

- (VNImageAnalyzerCompoundRequest)initWithDetectorType:(id)a3 groupingConfiguration:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v19 = a3;
  id v6 = a4;
  char v7 = [v6 originalRequests];
  v24.receiver = self;
  v24.super_class = (Class)VNImageAnalyzerCompoundRequest;
  id v8 = [(VNCompoundRequest *)&v24 initWithOriginalRequests:v7];
  objc_super v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_groupingConfiguration, a4);
    char v10 = [(VNRequest *)v9 configuration];
    [v10 setDetectorType:v19];
    id v11 = [v6 detectorConfigurationOptions];
    [v10 setDetectorConfigurationOptions:v11];

    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v13 = v7;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v21;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v21 != v15) {
            objc_enumerationMutation(v13);
          }
          id v17 = [*(id *)(*((void *)&v20 + 1) + 8 * v16) configuration];
          [v12 addObject:v17];

          ++v16;
        }
        while (v14 != v16);
        uint64_t v14 = [v13 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v14);
    }

    [v10 setOriginalRequestConfigurations:v12];
  }

  return v9;
}

+ (id)publicRevisionsSet
{
  if (+[VNImageAnalyzerCompoundRequest publicRevisionsSet]::onceToken != -1) {
    dispatch_once(&+[VNImageAnalyzerCompoundRequest publicRevisionsSet]::onceToken, &__block_literal_global_3447);
  }
  v2 = (void *)+[VNImageAnalyzerCompoundRequest publicRevisionsSet]::supportedRevisions;

  return v2;
}

uint64_t __52__VNImageAnalyzerCompoundRequest_publicRevisionsSet__block_invoke()
{
  +[VNImageAnalyzerCompoundRequest publicRevisionsSet]::supportedRevisions = objc_msgSend(objc_alloc(MEMORY[0x1E4F28D60]), "initWithIndexesInRange:", 1, 1);

  return MEMORY[0x1F41817F8]();
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

void __98__VNImageAnalyzerCompoundRequest_compoundRequestsForOriginalRequests_withPerformingContext_error___block_invoke()
{
}

+ (void)_evaluateOriginalVNCreateImageFingerprintsRequest:(id)a3 configurations:(id)a4
{
  id v8 = a3;
  id v5 = a4;
  id v6 = [(VNImageAnalyzerMultiDetectorAnalysisConfiguration *)[VNImageAnalyzerMultiDetectorImageFingerprintsConfiguration alloc] initWithObservationsRecipient:v8];
  char v7 = -[VNImageAnalyzerCompoundRequestGroupingConfigurations groupingConfigurationForRequest:kind:]((uint64_t)v5, v8, 16);
  [v7 setDetectorConfigurationOption:@"VNImageAnalyzerMultiDetectorOption_ImageFingerprintsConfiguration" value:v6];
}

+ (void)_evaluateOriginalVN1JC7R3k4455fKQz0dY1VhQ:(id)a3 configurations:(id)a4
{
  id v8 = a3;
  id v5 = a4;
  id v6 = [(VNImageAnalyzerMultiDetectorAnalysisConfiguration *)[VNImageAnalyzerMultiDetectorVN1JC7R3k4455fKQz0dY1VhQConfiguration alloc] initWithObservationsRecipient:v8];
  char v7 = -[VNImageAnalyzerCompoundRequestGroupingConfigurations groupingConfigurationForRequest:kind:]((uint64_t)v5, v8, 15);
  [v7 setDetectorConfigurationOption:@"VNImageAnalyzerMultiDetectorInitializationOption_RequireSliderNet" value:MEMORY[0x1E4F1CC38]];
  [v7 setDetectorConfigurationOption:@"VNImageAnalyzerMultiDetectorOption_VN1JC7R3k4455fKQz0dY1VhQConfiguration" value:v6];
}

+ (void)_evaluateOriginalVNClassifyCityNatureImageRequest:(id)a3 configurations:(id)a4
{
  id v9 = a3;
  id v5 = a4;
  id v6 = [(VNImageAnalyzerMultiDetectorAnalysisConfiguration *)[VNImageAnalyzerMultiDetectorCityNatureClassificationConfiguration alloc] initWithObservationsRecipient:v9];
  char v7 = -[VNImageAnalyzerCompoundRequestGroupingConfigurations groupingConfigurationForRequest:kind:]((uint64_t)v5, v9, 14);
  [v7 setDetectorConfigurationOption:@"VNImageAnalyzerMultiDetectorOption_CityNatureGatingConfiguration" value:v6];
  id v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v9, "imageCropAndScaleOption"));
  [v7 setDetectorConfigurationOption:@"VNDetectorProcessOption_ImageCropAndScaleOption" value:v8];
}

+ (void)_evaluateOriginalVN6Mb1ME89lyW3HpahkEygIG:(id)a3 configurations:(id)a4
{
  id v9 = a3;
  id v5 = a4;
  id v6 = [(VNImageAnalyzerMultiDetectorAnalysisConfiguration *)[VNImageAnalyzerMultiDetectorVN6Mb1ME89lyW3HpahkEygIGConfiguration alloc] initWithObservationsRecipient:v9];
  char v7 = -[VNImageAnalyzerCompoundRequestGroupingConfigurations groupingConfigurationForRequest:kind:]((uint64_t)v5, v9, 13);
  [v7 setDetectorConfigurationOption:@"VNImageAnalyzerMultiDetectorOption_VN6Mb1ME89lyW3HpahkEygIGConfiguration" value:v6];
  id v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v9, "imageCropAndScaleOption"));
  [v7 setDetectorConfigurationOption:@"VNDetectorProcessOption_ImageCropAndScaleOption" value:v8];
}

+ (void)_evaluateOriginalVN5kJNH3eYuyaLxNpZr5Z7zi:(id)a3 configurations:(id)a4
{
  id v9 = a3;
  id v5 = a4;
  id v6 = [(VNImageAnalyzerMultiDetectorAnalysisConfiguration *)[VNImageAnalyzerMultiDetectorVN5kJNH3eYuyaLxNpZr5Z7ziConfiguration alloc] initWithObservationsRecipient:v9];
  char v7 = -[VNImageAnalyzerCompoundRequestGroupingConfigurations groupingConfigurationForRequest:kind:]((uint64_t)v5, v9, 12);
  [v7 setDetectorConfigurationOption:@"VNImageAnalyzerMultiDetectorOption_VN5kJNH3eYuyaLxNpZr5Z7ziConfiguration" value:v6];
  id v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v9, "imageCropAndScaleOption"));
  [v7 setDetectorConfigurationOption:@"VNDetectorProcessOption_ImageCropAndScaleOption" value:v8];
}

+ (void)_evaluateOriginalVNClassifyPotentialLandmarkRequest:(id)a3 configurations:(id)a4
{
  id v9 = a3;
  id v5 = a4;
  id v6 = [(VNImageAnalyzerMultiDetectorAnalysisConfiguration *)[VNImageAnalyzerMultiDetectorPotentialLandmarkClassificationConfiguration alloc] initWithObservationsRecipient:v9];
  char v7 = -[VNImageAnalyzerCompoundRequestGroupingConfigurations groupingConfigurationForRequest:kind:]((uint64_t)v5, v9, 11);
  [v7 setDetectorConfigurationOption:@"VNImageAnalyzerMultiDetectorOption_PotentialLandmarkConfiguration" value:v6];
  id v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v9, "imageCropAndScaleOption"));
  [v7 setDetectorConfigurationOption:@"VNDetectorProcessOption_ImageCropAndScaleOption" value:v8];
}

+ (void)_evaluateOriginalVNRecognizeObjectsRequest:(id)a3 configurations:(id)a4
{
  id v10 = a3;
  id v5 = a4;
  id v6 = [[VNImageAnalyzerMultiDetectorRecognizeObjectsConfiguration alloc] initWithObservationsRecipient:v10];
  [v10 modelMinimumDetectionConfidence];
  -[VNImageAnalyzerMultiDetectorRecognizeObjectsConfiguration setMinimumDetectionConfidence:](v6, "setMinimumDetectionConfidence:");
  [v10 modelNonMaximumSuppressionThreshold];
  -[VNImageAnalyzerMultiDetectorRecognizeObjectsConfiguration setNonMaximumSuppressionThreshold:](v6, "setNonMaximumSuppressionThreshold:");
  char v7 = -[VNImageAnalyzerCompoundRequestGroupingConfigurations groupingConfigurationForRequest:kind:]((uint64_t)v5, v10, 9);
  [v7 setDetectorConfigurationOption:@"VNImageAnalyzerMultiDetectorInitializationOption_RequireObjDetNet" value:MEMORY[0x1E4F1CC38]];
  [v7 setDetectorConfigurationOption:@"VNImageAnalyzerMultiDetectorOption_RecognizeObjectsConfiguration" value:v6];
  id v8 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v10, "useImageAnalyzerScaling"));
  [v7 setDetectorConfigurationOption:@"VNImageAnalyzerMultiDetectorProcessingOption_SkipInputImageScaling" value:v8];

  id v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v10, "imageCropAndScaleOption"));
  [v7 setDetectorConfigurationOption:@"VNDetectorProcessOption_ImageCropAndScaleOption" value:v9];
}

+ (void)_evaluateOriginalVNVYvzEtX1JlUdu8xx5qhDI:(id)a3 configurations:(id)a4
{
  id v9 = a3;
  id v5 = a4;
  id v6 = [(VNImageAnalyzerMultiDetectorAnalysisConfiguration *)[VNImageAnalyzerMultiDetectorVNVYvzEtX1JlUdu8xx5qhDIConfiguration alloc] initWithObservationsRecipient:v9];
  char v7 = -[VNImageAnalyzerCompoundRequestGroupingConfigurations groupingConfigurationForRequest:kind:]((uint64_t)v5, v9, 5);
  [v7 setDetectorConfigurationOption:@"VNImageAnalyzerMultiDetectorOption_VNVYvzEtX1JlUdu8xx5qhDIConfiguration" value:v6];
  id v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v9, "imageCropAndScaleOption"));
  [v7 setDetectorConfigurationOption:@"VNDetectorProcessOption_ImageCropAndScaleOption" value:v8];
}

+ (void)_evaluateOriginalVNClassifyJunkImageRequest:(id)a3 configurations:(id)a4
{
  id v9 = a3;
  id v5 = a4;
  id v6 = [(VNImageAnalyzerMultiDetectorAnalysisConfiguration *)[VNImageAnalyzerMultiDetectorJunkClassificationConfiguration alloc] initWithObservationsRecipient:v9];
  char v7 = -[VNImageAnalyzerCompoundRequestGroupingConfigurations groupingConfigurationForRequest:kind:]((uint64_t)v5, v9, 4);
  [v7 setDetectorConfigurationOption:@"VNImageAnalyzerMultiDetectorOption_JunkConfiguration" value:v6];
  id v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v9, "imageCropAndScaleOption"));
  [v7 setDetectorConfigurationOption:@"VNDetectorProcessOption_ImageCropAndScaleOption" value:v8];
}

+ (void)_evaluateOriginalVNGenerateObjectnessBasedSaliencyImageRequest:(id)a3 configurations:(id)a4
{
  id v8 = a3;
  id v5 = a4;
  id v6 = [(VNImageAnalyzerMultiDetectorAnalysisConfiguration *)[VNImageAnalyzerMultiDetectorSaliencyOConfiguration alloc] initWithObservationsRecipient:v8];
  char v7 = -[VNImageAnalyzerCompoundRequestGroupingConfigurations groupingConfigurationForRequest:kind:]((uint64_t)v5, v8, 8);
  [v7 setDetectorConfigurationOption:@"VNImageAnalyzerMultiDetectorOption_SaliencyOConfiguration" value:v6];
}

+ (void)_evaluateOriginalVNGenerateAttentionBasedSaliencyImageRequest:(id)a3 configurations:(id)a4
{
  id v8 = a3;
  id v5 = a4;
  id v6 = [(VNImageAnalyzerMultiDetectorAnalysisConfiguration *)[VNImageAnalyzerMultiDetectorSaliencyAConfiguration alloc] initWithObservationsRecipient:v8];
  char v7 = -[VNImageAnalyzerCompoundRequestGroupingConfigurations groupingConfigurationForRequest:kind:]((uint64_t)v5, v8, 7);
  [v7 setDetectorConfigurationOption:@"VNImageAnalyzerMultiDetectorOption_SaliencyAConfiguration" value:v6];
}

+ (void)_evaluateOriginalVNClassifyImageAestheticsRequest:(id)a3 configurations:(id)a4
{
  id v8 = a3;
  id v5 = a4;
  if ([v8 resolvedRevision] != 1
    || ![v8 detectionLevel]
    || [v5 detectorModel] != 1)
  {
    id v6 = [(VNImageAnalyzerMultiDetectorAnalysisConfiguration *)[VNImageAnalyzerMultiDetectorAestheticsConfiguration alloc] initWithObservationsRecipient:v8];
    char v7 = -[VNImageAnalyzerCompoundRequestGroupingConfigurations groupingConfigurationForRequest:kind:]((uint64_t)v5, v8, 6);
    [v7 setDetectorConfigurationOption:@"VNImageAnalyzerMultiDetectorOption_AestheticsConfiguration" value:v6];
  }
}

+ (void)_evaluateOriginalVNGenerateImageFeaturePrintRequest:(id)a3 configurations:(id)a4
{
  id v6 = a3;
  id v5 = -[VNImageAnalyzerCompoundRequestGroupingConfigurations groupingConfigurationForRequest:kind:]((uint64_t)a4, v6, 0);
  [v5 addSceneprintConfigurationForOriginalRequest:v6];
}

+ (void)_evaluateOriginalVNCreateSceneprintRequest:(id)a3 configurations:(id)a4
{
  id v12 = a3;
  id v5 = a4;
  uint64_t v6 = [v12 returnAllResults];
  uint64_t v7 = [v12 resolvedRevision];
  if (v7 == 3737841666)
  {
    id v8 = [(VNImageAnalyzerMultiDetectorAnalysisConfiguration *)[VNImageAnalyzerMultiDetectorCompressedSceneprintConfiguration alloc] initWithObservationsRecipient:v12];
    id v9 = -[VNImageAnalyzerCompoundRequestGroupingConfigurations groupingConfigurationForRequest:kind:]((uint64_t)v5, v12, 1);
    [v9 setDetectorConfigurationOption:@"VNImageAnalyzerMultiDetectorOption_CompressedSceneprintConfiguration" value:v8];
    id v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v12, "imageCropAndScaleOption"));
    [v9 setDetectorConfigurationOption:@"VNDetectorProcessOption_ImageCropAndScaleOption" value:v10];
  }
  else
  {
    -[VNImageAnalyzerCompoundRequestGroupingConfigurations groupingConfigurationForRequest:kind:]((uint64_t)v5, v12, 0);
    id v8 = (VNImageAnalyzerMultiDetectorCompressedSceneprintConfiguration *)objc_claimAutoreleasedReturnValue();
    id v11 = [(VNImageAnalyzerMultiDetectorCompressedSceneprintConfiguration *)v8 addSceneprintConfigurationForOriginalRequest:v12];
    id v9 = v11;
    if ((unint64_t)(v7 - 2) < 2 || v7 == 3737841671) {
      [v11 setIncludeLabelsAndConfidences:v6];
    }
  }
}

+ (void)_evaluateOriginalVNSceneClassificationRequest:(id)a3 configurations:(id)a4
{
  id v10 = a3;
  id v5 = a4;
  uint64_t v6 = [v10 sceneObservation];

  if (!v6)
  {
    uint64_t v7 = -[VNImageAnalyzerCompoundRequestGroupingConfigurations groupingConfigurationForRequest:kind:]((uint64_t)v5, v10, 2);
    [v7 addTilingWarningRecorder:v10];
    id v8 = [v7 addSceneConfigurationForOriginalRequest:v10];
    objc_msgSend(v8, "setMaximumLeafLabels:", objc_msgSend(v10, "maximumLeafObservations"));
    objc_msgSend(v8, "setMaximumHierarchicalLabels:", objc_msgSend(v10, "maximumHierarchicalObservations"));
    id v9 = [v10 customHierarchy];
    [v8 setCustomHierarchy:v9];
  }
}

+ (void)_evaluateOriginalVNClassifyImageRequest:(id)a3 configurations:(id)a4
{
  id v12 = a3;
  id v5 = a4;
  uint64_t v6 = [v12 resolvedRevision];
  +[VNImageAnalyzerMultiDetector modelForRequestClass:revision:](VNImageAnalyzerMultiDetector, "modelForRequestClass:revision:", [v12 frameworkClass], v6);
  if (v6 == 3737841667)
  {
    uint64_t v7 = -[VNImageAnalyzerCompoundRequestGroupingConfigurations groupingConfigurationForRequest:kind:]((uint64_t)v5, v12, 3);
    id v8 = [[VNImageAnalyzerMultiDetectorEntityNetClassificationConfiguration alloc] initWithObservationsRecipient:v12];
    -[VNImageAnalyzerMultiDetectorEntityNetClassificationConfiguration setMaximumLabels:](v8, "setMaximumLabels:", [v12 maximumLeafObservations]);
    [v7 setDetectorConfigurationOption:@"VNImageAnalyzerMultiDetectorOption_EntityNetConfiguration" value:v8];
  }
  else
  {
    uint64_t v7 = -[VNImageAnalyzerCompoundRequestGroupingConfigurations groupingConfigurationForRequest:kind:]((uint64_t)v5, v12, 2);
    id v8 = [v7 addSceneConfigurationForOriginalRequest:v12];
    -[VNImageAnalyzerMultiDetectorEntityNetClassificationConfiguration setMaximumLeafLabels:](v8, "setMaximumLeafLabels:", [v12 maximumLeafObservations]);
    -[VNImageAnalyzerMultiDetectorEntityNetClassificationConfiguration setMaximumHierarchicalLabels:](v8, "setMaximumHierarchicalLabels:", [v12 maximumHierarchicalObservations]);
    id v9 = [v12 customHierarchy];
    [(VNImageAnalyzerMultiDetectorEntityNetClassificationConfiguration *)v8 setCustomHierarchy:v9];

    [v7 addTilingWarningRecorder:v12];
  }
  id v10 = v7;

  id v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v12, "imageCropAndScaleOption"));
  [v10 setDetectorConfigurationOption:@"VNDetectorProcessOption_ImageCropAndScaleOption" value:v11];
}

@end