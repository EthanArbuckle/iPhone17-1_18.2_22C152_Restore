@interface VNFaceAnalyzerCompoundRequest
+ (Class)configurationClass;
+ (const)revisionAvailability;
+ (id)compoundRequestsForOriginalRequests:(id)a3 withPerformingContext:(id)a4 error:(id *)a5;
+ (unint64_t)applicableRevisionForDependentRequestOfClass:(Class)a3 beingPerformedByRevision:(unint64_t)a4;
- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5;
- (VNFaceAnalyzerCompoundRequest)initWithDetectorType:(id)a3 configuration:(id)a4;
- (int64_t)dependencyProcessingOrdinality;
- (unint64_t)detectionLevel;
- (void)assignOriginalRequestsResultsFromObservations:(id)a3 obtainedInPerformingContext:(id)a4;
@end

@implementation VNFaceAnalyzerCompoundRequest

- (int64_t)dependencyProcessingOrdinality
{
  return VNRequestDependencyProcessingOrdinalityAdjustedForConfiguredRequest(4000, self);
}

+ (const)revisionAvailability
{
  return (const $1305BF644A263E76A656B24897EDB60D *)&+[VNFaceAnalyzerCompoundRequest(Revisioning) revisionAvailability]::ourRevisionAvailability;
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (id)compoundRequestsForOriginalRequests:(id)a3 withPerformingContext:(id)a4 error:(id *)a5
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v27 = a3;
  v31 = objc_alloc_init(VNFaceAnalyzerCompoundRequestConfigurationGroups);
  v29 = objc_alloc_init(VNFaceAnalyzerFaceObservationGrouping);
  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  obuint64_t j = v27;
  uint64_t v6 = [obj countByEnumeratingWithState:&v62 objects:v67 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v63;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v63 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v62 + 1) + 8 * i);
        uint64_t v56 = 0;
        v57 = &v56;
        uint64_t v58 = 0x3032000000;
        v59 = __Block_byref_object_copy__4428;
        v60 = __Block_byref_object_dispose__4429;
        id v61 = 0;
        if ([v9 conformsToProtocol:&unk_1EF7AB7F8])
        {
          id v10 = v9;
          v11 = (id *)(v57 + 5);
          id v55 = (id)v57[5];
          char v12 = [v10 getOptionalValidatedInputFaceObservations:&v55 clippedToRegionOfInterest:1 error:a5];
          objc_storeStrong(v11, v55);

          if ((v12 & 1) == 0)
          {
LABEL_29:
            _Block_object_dispose(&v56, 8);

            id v20 = 0;
            id v21 = obj;
            goto LABEL_30;
          }
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v13 = v9;
          uint64_t v49 = 0;
          v50 = &v49;
          uint64_t v51 = 0x3032000000;
          v52 = __Block_byref_object_copy__4428;
          v53 = __Block_byref_object_dispose__4429;
          id v54 = 0;
          aBlock[0] = MEMORY[0x1E4F143A8];
          aBlock[1] = 3221225472;
          aBlock[2] = __97__VNFaceAnalyzerCompoundRequest_compoundRequestsForOriginalRequests_withPerformingContext_error___block_invoke;
          aBlock[3] = &unk_1E5B1C430;
          v47 = &v56;
          v45 = v29;
          v48 = &v49;
          v46 = v31;
          v14 = _Block_copy(aBlock);
          uint64_t v15 = [v13 resolvedRevision];
          if ((unint64_t)(v15 - 3737841665) >= 6)
          {

            _Block_object_dispose(&v49, 8);
          }
          else
          {
            char v16 = (*((uint64_t (**)(void *, void, id, id *))v14 + 2))(v14, *((void *)&unk_1A410D000 + v15 - 3737841665), v13, a5);

            _Block_object_dispose(&v49, 8);
            if ((v16 & 1) == 0) {
              goto LABEL_29;
            }
          }
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v49 = 0;
            v50 = &v49;
            uint64_t v51 = 0x3032000000;
            v52 = __Block_byref_object_copy__4428;
            v53 = __Block_byref_object_dispose__4429;
            id v54 = v9;
            v42[0] = 0;
            v42[1] = v42;
            v42[2] = 0x3032000000;
            v42[3] = __Block_byref_object_copy__4428;
            v42[4] = __Block_byref_object_dispose__4429;
            id v43 = 0;
            v36[0] = MEMORY[0x1E4F143A8];
            v36[1] = 3221225472;
            v36[2] = __97__VNFaceAnalyzerCompoundRequest_compoundRequestsForOriginalRequests_withPerformingContext_error___block_invoke_2;
            v36[3] = &unk_1E5B1C458;
            v39 = &v56;
            v37 = v29;
            v40 = &v49;
            v41 = v42;
            v38 = v31;
            v17 = (uint64_t (**)(void *, void, uint64_t, id *))_Block_copy(v36);
            uint64_t v18 = [(id)v50[5] resolvedRevision];
            if ((unint64_t)(v18 - 3737841664) >= 7) {
              goto LABEL_15;
            }
            if ((0x6Fu >> v18)) {
              char v19 = v17[2](v17, *((void *)&unk_1A410D030 + v18 - 3737841664), v50[5], a5);
            }
            else {
LABEL_15:
            }
              char v19 = 1;

            _Block_object_dispose(v42, 8);
            _Block_object_dispose(&v49, 8);

            if ((v19 & 1) == 0) {
              goto LABEL_29;
            }
          }
        }
        _Block_object_dispose(&v56, 8);
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v62 objects:v67 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  id v20 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [(VNFaceAnalyzerCompoundRequestConfigurationGroups *)v31 allConfigurations];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v21 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v22 = [v21 countByEnumeratingWithState:&v32 objects:v66 count:16];
  if (v22)
  {
    uint64_t v23 = *(void *)v33;
    do
    {
      for (uint64_t j = 0; j != v22; ++j)
      {
        if (*(void *)v33 != v23) {
          objc_enumerationMutation(v21);
        }
        v25 = (void *)[objc_alloc((Class)a1) initWithDetectorType:@"VNFaceAnalyzerMultiDetectorType" configuration:*(void *)(*((void *)&v32 + 1) + 8 * j)];
        [v20 addObject:v25];
      }
      uint64_t v22 = [v21 countByEnumeratingWithState:&v32 objects:v66 count:16];
    }
    while (v22);
  }

LABEL_30:

  return v20;
}

uint64_t __97__VNFaceAnalyzerCompoundRequest_compoundRequestsForOriginalRequests_withPerformingContext_error___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v7 = a3;
  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  obuint64_t j = *(id *)(v8 + 40);
  uint64_t v9 = [v7 getOptionalValidatedInputFaceObservations:&obj clippedToRegionOfInterest:1 error:a4];
  objc_storeStrong((id *)(v8 + 40), obj);
  if (v9)
  {
    id v10 = [*(id *)(a1 + 32) addToGroupingsRequest:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) withFaceObservations:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
    uint64_t v11 = [*(id *)(a1 + 40) configurationForRequest:v7 withObservationGroup:v10 compoundRequestRevision:a2];
    uint64_t v12 = *(void *)(*(void *)(a1 + 64) + 8);
    id v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;

    [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) setDetectorConfigurationOption:@"VNFaceAnalyzerMultiDetectorObservationGroupsForRequests" value:v10];
    [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) setDetectorConfigurationOption:@"VNFaceAnalyzerMultiDetectorProcessingOptionCreateFaceAnalyzer" value:MEMORY[0x1E4F1CC38]];
    v14 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    uint64_t v15 = [v7 specifier];
    [v14 setDetectorConfigurationOption:@"VNFaceAnalyzerMultiDetectorProcessingOptionFaceAnalyzerOriginatingRequestSpecifier" value:v15];

    char v16 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    v17 = [v7 inputFaceObservations];
    [v16 setDetectorConfigurationOption:@"VNDetectorProcessOption_InputFaceObservations" value:v17];

    uint64_t v18 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    char v19 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "detectionLevel"));
    [v18 setDetectorConfigurationOption:@"VNDetectorOption_RequestDetectionLevel" value:v19];

    id v20 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    id v21 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), "modelExecutionPriority"));
    [v20 setDetectorConfigurationOption:@"VNDetectorOption_EspressoPlanPriority" value:v21];

    [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) setResolvedRevision:a2];
  }

  return v9;
}

- (VNFaceAnalyzerCompoundRequest)initWithDetectorType:(id)a3 configuration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 originalRequests];
  v15.receiver = self;
  v15.super_class = (Class)VNFaceAnalyzerCompoundRequest;
  uint64_t v9 = [(VNHomologousObservationClassCompoundRequest *)&v15 initWithSubrequests:v8];
  id v10 = v9;
  if (v9)
  {
    uint64_t v11 = [(VNRequest *)v9 configuration];
    [v11 setDetectorType:v6];
    uint64_t v12 = [v7 detectorConfigurationOptions];
    [v11 setDetectorConfigurationOptions:v12];

    id v13 = v10;
  }

  return v10;
}

- (void)assignOriginalRequestsResultsFromObservations:(id)a3 obtainedInPerformingContext:(id)a4
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v31 = v5;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v9 = v5;
  uint64_t v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v41, v47, 16, v31);
  if (v10)
  {
    uint64_t v11 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v42 != v11) {
          objc_enumerationMutation(v9);
        }
        id v13 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        uint64_t v14 = objc_opt_class();
        if (v14 == objc_opt_class())
        {
          id v15 = v13;
          char v16 = [v15 faceprint];
          BOOL v17 = v16 == 0;

          if (!v17) {
            [v7 addObject:v15];
          }
          uint64_t v18 = [v15 faceAttributes];
          BOOL v19 = v18 == 0;

          if (!v19) {
            [v8 addObject:v15];
          }
        }
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v41 objects:v47 count:16];
    }
    while (v10);
  }

  [(VNHomologousObservationClassCompoundRequest *)self originalRequestsOfClass:objc_opt_class()];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v21 = [v20 countByEnumeratingWithState:&v37 objects:v46 count:16];
  if (v21)
  {
    uint64_t v22 = *(void *)v38;
    do
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        if (*(void *)v38 != v22) {
          objc_enumerationMutation(v20);
        }
        v24 = *(void **)(*((void *)&v37 + 1) + 8 * j);
        [v24 setResults:v7];
        [v6 cacheObservationsOfRequest:v24];
      }
      uint64_t v21 = [v20 countByEnumeratingWithState:&v37 objects:v46 count:16];
    }
    while (v21);
  }

  v25 = [(VNHomologousObservationClassCompoundRequest *)self originalRequestsOfClass:objc_opt_class()];

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v26 = v25;
  uint64_t v27 = [v26 countByEnumeratingWithState:&v33 objects:v45 count:16];
  if (v27)
  {
    uint64_t v28 = *(void *)v34;
    do
    {
      for (uint64_t k = 0; k != v27; ++k)
      {
        if (*(void *)v34 != v28) {
          objc_enumerationMutation(v26);
        }
        v30 = *(void **)(*((void *)&v33 + 1) + 8 * k);
        [v30 setResults:v8];
        [v6 cacheObservationsOfRequest:v30];
      }
      uint64_t v27 = [v26 countByEnumeratingWithState:&v33 objects:v45 count:16];
    }
    while (v27);
  }
}

- (unint64_t)detectionLevel
{
  v2 = [(VNCompoundRequest *)self originalRequests];
  v3 = [v2 firstObject];
  unint64_t v4 = [v3 detectionLevel];

  return v4;
}

- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = [(VNRequest *)self configuration];
  uint64_t v10 = [v8 session];
  id v11 = [(VNRequest *)self newDefaultDetectorOptionsForRequestRevision:a3 session:v10];
  uint64_t v12 = [v9 detectorConfigurationOptions];
  [v11 addEntriesFromDictionary:v12];

  id v32 = 0;
  LOBYTE(v12) = +[VNValidationUtilities getOptionalFaceObservations:&v32 inOptions:v11 error:a5];
  id v13 = v32;
  uint64_t v14 = v13;
  if ((v12 & 1) != 0
    && (v13
     || ([(VNRequest *)self detectFacesInContext:v8 error:a5],
         (uint64_t v14 = objc_claimAutoreleasedReturnValue()) != 0)))
  {
    v29 = v10;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __73__VNFaceAnalyzerCompoundRequest_internalPerformRevision_inContext_error___block_invoke_2;
    aBlock[3] = &unk_1E5B1C480;
    id v15 = v11;
    id v31 = v15;
    char v16 = _Block_copy(aBlock);
    [(VNCompoundRequest *)self regionOfInterest];
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;
    double v24 = v23;
    v25 = [v9 detectorType];
    id v26 = -[VNRequest processFaceObservations:revision:regionOfInterest:detectorType:detectorOptions:shouldAlignFaceBBox:shouldRunDetectorBlock:context:error:](self, "processFaceObservations:revision:regionOfInterest:detectorType:detectorOptions:shouldAlignFaceBBox:shouldRunDetectorBlock:context:error:", v14, a3, v25, v15, &__block_literal_global_4415, v16, v18, v20, v22, v24, v8, a5);

    BOOL v27 = v26 != 0;
    if (v26)
    {
      [(VNCompoundRequest *)self recordWarningsInOriginalRequests];
      [(VNFaceAnalyzerCompoundRequest *)self assignOriginalRequestsResultsFromObservations:v26 obtainedInPerformingContext:v8];
    }

    uint64_t v10 = v29;
  }
  else
  {
    BOOL v27 = 0;
  }

  return v27;
}

BOOL __73__VNFaceAnalyzerCompoundRequest_internalPerformRevision_inContext_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  unint64_t v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"VNFaceAnalyzerMultiDetectorProcessingOptionCreateFaceprint"];
  int v5 = [v4 BOOLValue];

  id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"VNFaceAnalyzerMultiDetectorProcessingOptionCreateFaceAnalyzer"];
  int v7 = [v6 BOOLValue];

  id v8 = v3;
  id v9 = v8;
  if (v5)
  {
    unint64_t v4 = [v8 faceprint];
    BOOL v10 = v4 == 0;
    if (!v4 || ((v7 ^ 1) & 1) != 0) {
      goto LABEL_7;
    }
  }
  else if (!v7)
  {
    BOOL v10 = 0;
    goto LABEL_9;
  }
  id v11 = [v9 faceAttributes];
  BOOL v10 = v11 == 0;

  if (v5) {
LABEL_7:
  }

LABEL_9:
  return v10;
}

uint64_t __73__VNFaceAnalyzerCompoundRequest_internalPerformRevision_inContext_error___block_invoke()
{
  return 0;
}

+ (unint64_t)applicableRevisionForDependentRequestOfClass:(Class)a3 beingPerformedByRevision:(unint64_t)a4
{
  if ([(objc_class *)a3 isSubclassOfClass:objc_opt_class()])
  {
    uint64_t v7 = 3737841665;
    switch(a4)
    {
      case 4uLL:
        goto LABEL_11;
      case 5uLL:
        uint64_t v7 = 3737841664;
        goto LABEL_11;
      case 6uLL:
        uint64_t v7 = 3737841666;
        goto LABEL_11;
      case 7uLL:
        uint64_t v7 = 3737841669;
        goto LABEL_11;
      default:
        if (a4 == 100)
        {
          uint64_t v7 = 3737841667;
        }
        else
        {
          if (a4 != 101) {
            goto LABEL_7;
          }
          uint64_t v7 = 3737841670;
        }
LABEL_11:
        unint64_t result = +[VNRequest applicableRevisionForDependentRequestOfClass:a3 beingPerformedByRevision:v7];
        break;
    }
  }
  else
  {
LABEL_7:
    v9.receiver = a1;
    v9.super_class = (Class)&OBJC_METACLASS___VNFaceAnalyzerCompoundRequest;
    return (unint64_t)objc_msgSendSuper2(&v9, sel_applicableRevisionForDependentRequestOfClass_beingPerformedByRevision_, a3, a4);
  }
  return result;
}

uint64_t __97__VNFaceAnalyzerCompoundRequest_compoundRequestsForOriginalRequests_withPerformingContext_error___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v7 = a3;
  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  obuint64_t j = *(id *)(v8 + 40);
  uint64_t v9 = [v7 getOptionalValidatedInputFaceObservations:&obj clippedToRegionOfInterest:1 error:a4];
  objc_storeStrong((id *)(v8 + 40), obj);
  if (v9)
  {
    BOOL v10 = [*(id *)(a1 + 32) addToGroupingsRequest:v7 withFaceObservations:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
    uint64_t v11 = [*(id *)(a1 + 40) configurationForRequest:v7 withObservationGroup:v10 compoundRequestRevision:a2];
    uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8);
    id v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;

    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setDetectorConfigurationOption:@"VNFaceAnalyzerMultiDetectorObservationGroupsForRequests" value:v10];
    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setDetectorConfigurationOption:@"VNFaceAnalyzerMultiDetectorProcessingOptionCreateFaceprint" value:MEMORY[0x1E4F1CC38]];
    uint64_t v14 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    id v15 = [v7 specifier];
    [v14 setDetectorConfigurationOption:@"VNFaceAnalyzerMultiDetectorProcessingOptionFaceprintOriginatingRequestSpecifier" value:v15];

    char v16 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    double v17 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v7, "forceFaceprintCreation"));
    [v16 setDetectorConfigurationOption:@"VNFaceAnalyzerMultiDetectorProcessingOptionFaceprintForceFaceprintCreation" value:v17];

    double v18 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    double v19 = [v7 inputFaceObservations];
    [v18 setDetectorConfigurationOption:@"VNDetectorProcessOption_InputFaceObservations" value:v19];

    double v20 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    double v21 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "detectionLevel"));
    [v20 setDetectorConfigurationOption:@"VNDetectorOption_RequestDetectionLevel" value:v21];

    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setResolvedRevision:a2];
  }

  return v9;
}

@end