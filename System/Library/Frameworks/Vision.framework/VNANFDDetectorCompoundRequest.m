@interface VNANFDDetectorCompoundRequest
+ (Class)configurationClass;
+ (const)revisionAvailability;
+ (id)compoundRequestsForOriginalRequests:(id)a3 withPerformingContext:(id)a4 error:(id *)a5;
+ (int64_t)compoundRequestRevisionForRequest:(id)a3;
- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5;
- (VNANFDDetectorCompoundRequest)initWithDetectorType:(id)a3 configuration:(id)a4;
- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4;
- (id)newDefaultDetectorOptionsForRequestRevision:(unint64_t)a3 session:(id)a4;
- (int64_t)dependencyProcessingOrdinality;
- (void)assignOriginalRequestsResultsFromObservations:(id)a3 obtainedInPerformingContext:(id)a4;
@end

@implementation VNANFDDetectorCompoundRequest

- (int64_t)dependencyProcessingOrdinality
{
  return VNRequestDependencyProcessingOrdinalityAdjustedForConfiguredRequest(1000, self);
}

+ (const)revisionAvailability
{
  return (const $1305BF644A263E76A656B24897EDB60D *)&+[VNANFDDetectorCompoundRequest(Revisioning) revisionAvailability]::ourRevisionAvailability;
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

- (VNANFDDetectorCompoundRequest)initWithDetectorType:(id)a3 configuration:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v26 = a3;
  id v28 = a4;
  [v28 originalRequests];
  v33.receiver = self;
  v27 = v33.super_class = (Class)VNANFDDetectorCompoundRequest;
  v6 = -[VNCompoundRequest initWithOriginalRequests:](&v33, sel_initWithOriginalRequests_);
  if (v6)
  {
    v25 = v6;
    v7 = [(VNRequest *)v6 configuration];
    objc_msgSend(v7, "setResolvedRevision:", objc_msgSend(v28, "resolvedRevision"));
    v8 = (void *)[v26 copy];
    [v7 setDetectorType:v8];

    v9 = [v28 detectorConfigurationOptions];
    v10 = (void *)[v9 copy];
    [v7 setDetectorConfigurationOptions:v10];

    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v11 = v27;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (!v12) {
      goto LABEL_20;
    }
    uint64_t v13 = *(void *)v30;
    while (1)
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v30 != v13) {
          objc_enumerationMutation(v11);
        }
        v15 = *(void **)(*((void *)&v29 + 1) + 8 * v14);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v16 = [v15 precisionRecallThresholdOverride];
          [v7 setDetectorConfigurationOption:@"VNANFDMultiDetectorProcessingOption_HumanFacePrecisionRecallThresholdOverride" value:v16];
LABEL_11:

          goto LABEL_12;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v16 = [v15 precisionRecallThresholdOverride];
          [v7 setDetectorConfigurationOption:@"VNANFDMultiDetectorProcessingOption_HumanHeadPrecisionRecallThresholdOverride" value:v16];
          goto LABEL_11;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v16 = v15;
          int v17 = [v16 upperBodyOnly];
          char v18 = [v16 upperBodyOnly];
          if (v17)
          {
            v19 = [NSNumber numberWithBool:1];
            [v7 setDetectorConfigurationOption:@"VNANFDMultiDetectorProcessingOption_HumanDetectorUpperBody" value:v19];
          }
          if ((v18 & 1) == 0)
          {
            v20 = [NSNumber numberWithBool:1];
            [v7 setDetectorConfigurationOption:@"VNANFDMultiDetectorProcessingOption_HumanDetectorFullBody" value:v20];
          }
          goto LABEL_11;
        }
LABEL_12:
        ++v14;
      }
      while (v12 != v14);
      uint64_t v21 = [v11 countByEnumeratingWithState:&v29 objects:v34 count:16];
      uint64_t v12 = v21;
      if (!v21)
      {
LABEL_20:

        v22 = v25;
        v6 = v25;
        break;
      }
    }
  }
  v23 = v6;

  return v23;
}

+ (int64_t)compoundRequestRevisionForRequest:(id)a3
{
  id v3 = a3;
  if (+[VNANFDDetectorCompoundRequest compoundRequestRevisionForRequest:]::onceToken != -1) {
    dispatch_once(&+[VNANFDDetectorCompoundRequest compoundRequestRevisionForRequest:]::onceToken, &__block_literal_global_36810);
  }
  v4 = objc_msgSend((id)+[VNANFDDetectorCompoundRequest compoundRequestRevisionForRequest:]::requestClassToDictionaryRequestRevisionToCompoundRequestRevision, "objectForKey:", objc_msgSend(v3, "frameworkClass"));
  if (v4)
  {
    uint64_t v5 = [v3 resolvedRevision];
    v6 = [NSNumber numberWithUnsignedInteger:v5];
    v7 = [v4 objectForKey:v6];

    if (v7) {
      int64_t v8 = [v7 unsignedIntegerValue];
    }
    else {
      int64_t v8 = 0;
    }
  }
  else
  {
    int64_t v8 = 0;
  }

  return v8;
}

+ (id)compoundRequestsForOriginalRequests:(id)a3 withPerformingContext:(id)a4 error:(id *)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v23 = a3;
  v25 = objc_alloc_init(VNANFDDetectorCompoundRequestConfigurationGroups);
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  obuint64_t j = v23;
  uint64_t v6 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v31;
    uint64_t v8 = *MEMORY[0x1E4F1C3B8];
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v31 != v7) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        id v11 = +[VNANFDMultiDetector anfdMultiDetectorClassToProcessRequest:v10];
        if (v11)
        {
          uint64_t v12 = [(objc_class *)v11 requestInfoForRequest:v10];
          if (!v12) {
            [MEMORY[0x1E4F1CA00] raise:v8, @"The request info is not found for request class %@", objc_opt_class(), v23 format];
          }
          uint64_t v13 = [(VNANFDDetectorCompoundRequestConfigurationGroups *)v25 configurationForRequest:v10];
          uint64_t v14 = [v12 originatingRequestSpecifierKey];
          v15 = [v10 specifier];
          [v13 setDetectorConfigurationOption:v14 value:v15];
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v6);
  }

  id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [(VNANFDDetectorCompoundRequestConfigurationGroups *)v25 allConfigurations];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v18 = [v17 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v18)
  {
    uint64_t v19 = *(void *)v27;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v27 != v19) {
          objc_enumerationMutation(v17);
        }
        uint64_t v21 = (void *)[objc_alloc((Class)a1) initWithDetectorType:@"VNANFDMultiDetectorType" configuration:*(void *)(*((void *)&v26 + 1) + 8 * j)];
        [v16 addObject:v21];
      }
      uint64_t v18 = [v17 countByEnumeratingWithState:&v26 objects:v34 count:16];
    }
    while (v18);
  }

  return v16;
}

- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4
{
  uint64_t v6 = [(VNRequest *)self configuration];
  uint64_t v7 = [v6 detectorType];
  uint64_t v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else if (a4)
  {
    id v10 = [NSString alloc];
    id v11 = [(VNRequest *)self specifier];
    uint64_t v12 = (void *)[v10 initWithFormat:@"detector type has not been configured for %@", v11];

    *a4 = +[VNError errorForInternalErrorWithLocalizedDescription:v12];
  }

  return v8;
}

- (id)newDefaultDetectorOptionsForRequestRevision:(unint64_t)a3 session:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)VNANFDDetectorCompoundRequest;
  id v5 = [(VNRequest *)&v9 newDefaultDetectorOptionsForRequestRevision:a3 session:a4];
  uint64_t v6 = [(VNRequest *)self configuration];
  uint64_t v7 = [v6 detectorConfigurationOptions];
  [v5 addEntriesFromDictionary:v7];

  return v5;
}

- (void)assignOriginalRequestsResultsFromObservations:(id)a3 obtainedInPerformingContext:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  obuint64_t j = [(VNCompoundRequest *)self originalRequests];
  uint64_t v8 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v18;
    uint64_t v10 = *MEMORY[0x1E4F1C3B8];
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v13 = +[VNANFDMultiDetector anfdMultiDetectorClassToProcessRequest:v12];
        if (!v13) {
          [MEMORY[0x1E4F1CA00] raise:v10, @"Internal error processing request of class %@", objc_opt_class() format];
        }
        uint64_t v14 = [(objc_class *)v13 requestInfoForRequest:v12];
        if (!v14) {
          [MEMORY[0x1E4F1CA00] raise:v10, @"The request class %@ shall have it's results populated in the results array", objc_opt_class() format];
        }
        v15 = objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v14, "originalRequestResultsIndex"));
        [v12 setResults:v15];

        [v7 cacheObservationsOfRequest:v12];
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }
}

- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5
{
  id v8 = a4;
  uint64_t v9 = [v8 session];
  uint64_t v10 = [v8 imageBufferAndReturnError:a5];
  if (v10
    && [(VNRequest *)self validateImageBuffer:v10 ofNonZeroWidth:0 andHeight:0 error:a5])
  {
    uint64_t v25 = 0;
    long long v26 = &v25;
    uint64_t v27 = 0x3032000000;
    long long v28 = __Block_byref_object_copy__36784;
    long long v29 = __Block_byref_object_dispose__36785;
    id v30 = 0;
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    long long v17 = __73__VNANFDDetectorCompoundRequest_internalPerformRevision_inContext_error___block_invoke;
    long long v18 = &unk_1E5B1FF30;
    long long v19 = self;
    unint64_t v24 = a3;
    id v20 = v9;
    id v21 = v10;
    id v23 = &v25;
    id v11 = v8;
    id v22 = v11;
    uint64_t v12 = _Block_copy(&v15);
    char v13 = VNExecuteBlock(v12, (uint64_t)a5);
    if (v13)
    {
      [(VNCompoundRequest *)self recordWarningsInOriginalRequests];
      [(VNANFDDetectorCompoundRequest *)self assignOriginalRequestsResultsFromObservations:v26[5] obtainedInPerformingContext:v11];
    }

    _Block_object_dispose(&v25, 8);
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

BOOL __73__VNANFDDetectorCompoundRequest_internalPerformRevision_inContext_error___block_invoke(uint64_t a1, uint64_t a2)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v13 = 0;
  v4 = [*(id *)(a1 + 32) applicableDetectorAndOptions:&v13 forRevision:*(void *)(a1 + 72) loadedInSession:*(void *)(a1 + 40) error:a2];
  id v5 = v13;
  if (v4)
  {
    v14[0] = *(void *)(a1 + 48);
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
    [v5 setObject:v6 forKeyedSubscript:@"VNDetectorProcessOption_InputImageBuffers"];

    uint64_t v7 = [*(id *)(a1 + 56) qosClass];
    [*(id *)(a1 + 32) regionOfInterest];
    uint64_t v8 = objc_msgSend(v4, "processUsingQualityOfServiceClass:options:regionOfInterest:warningRecorder:error:progressHandler:", v7, v5, *(void *)(a1 + 32), a2, 0);
    uint64_t v9 = *(void *)(*(void *)(a1 + 64) + 8);
    uint64_t v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    BOOL v11 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) != 0;
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

void __67__VNANFDDetectorCompoundRequest_compoundRequestRevisionForRequest___block_invoke()
{
  v33[7] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  v1 = (void *)+[VNANFDDetectorCompoundRequest compoundRequestRevisionForRequest:]::requestClassToDictionaryRequestRevisionToCompoundRequestRevision;
  +[VNANFDDetectorCompoundRequest compoundRequestRevisionForRequest:]::requestClassToDictionaryRequestRevisionToCompoundRequestRevision = v0;

  v2 = (void *)+[VNANFDDetectorCompoundRequest compoundRequestRevisionForRequest:]::requestClassToDictionaryRequestRevisionToCompoundRequestRevision;
  v32[0] = &unk_1EF7A7A18;
  v32[1] = &unk_1EF7A7A48;
  v33[0] = &unk_1EF7A7A30;
  v33[1] = &unk_1EF7A7A60;
  v32[2] = &unk_1EF7A7A78;
  v32[3] = &unk_1EF7A7A90;
  v33[2] = &unk_1EF7A7A60;
  v33[3] = &unk_1EF7A7A90;
  v32[4] = &unk_1EF7A7AA8;
  v32[5] = &unk_1EF7A7AC0;
  v33[4] = &unk_1EF7A7A90;
  v33[5] = &unk_1EF7A7AD8;
  v32[6] = &unk_1EF7A7AF0;
  v33[6] = &unk_1EF7A7B08;
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:7];
  [v2 setObject:v3 forKey:objc_opt_class()];

  v4 = (void *)+[VNANFDDetectorCompoundRequest compoundRequestRevisionForRequest:]::requestClassToDictionaryRequestRevisionToCompoundRequestRevision;
  v30[0] = &unk_1EF7A7A30;
  v30[1] = &unk_1EF7A7A18;
  v31[0] = &unk_1EF7A7A30;
  v31[1] = &unk_1EF7A7A60;
  v30[2] = &unk_1EF7A7B20;
  v30[3] = &unk_1EF7A7A48;
  v31[2] = &unk_1EF7A7A90;
  v31[3] = &unk_1EF7A7AD8;
  v30[4] = &unk_1EF7A7AC0;
  v31[4] = &unk_1EF7A7B08;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:5];
  [v4 setObject:v5 forKey:objc_opt_class()];

  id v6 = (void *)+[VNANFDDetectorCompoundRequest compoundRequestRevisionForRequest:]::requestClassToDictionaryRequestRevisionToCompoundRequestRevision;
  v28[0] = &unk_1EF7A7A30;
  v28[1] = &unk_1EF7A7A18;
  v29[0] = &unk_1EF7A7A30;
  v29[1] = &unk_1EF7A7A60;
  v28[2] = &unk_1EF7A7A60;
  v28[3] = &unk_1EF7A7B20;
  v29[2] = &unk_1EF7A7A90;
  v29[3] = &unk_1EF7A7AD8;
  v28[4] = &unk_1EF7A7A48;
  v29[4] = &unk_1EF7A7B08;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:5];
  [v6 setObject:v7 forKey:objc_opt_class()];

  uint64_t v8 = (void *)+[VNANFDDetectorCompoundRequest compoundRequestRevisionForRequest:]::requestClassToDictionaryRequestRevisionToCompoundRequestRevision;
  v26[0] = &unk_1EF7A7A30;
  v26[1] = &unk_1EF7A7A18;
  v27[0] = &unk_1EF7A7A30;
  v27[1] = &unk_1EF7A7A60;
  v26[2] = &unk_1EF7A7A60;
  v26[3] = &unk_1EF7A7B20;
  v27[2] = &unk_1EF7A7A90;
  v27[3] = &unk_1EF7A7AD8;
  v26[4] = &unk_1EF7A7A48;
  v27[4] = &unk_1EF7A7B08;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:5];
  [v8 setObject:v9 forKey:objc_opt_class()];

  uint64_t v10 = (void *)+[VNANFDDetectorCompoundRequest compoundRequestRevisionForRequest:]::requestClassToDictionaryRequestRevisionToCompoundRequestRevision;
  v24[0] = &unk_1EF7A7A30;
  v24[1] = &unk_1EF7A7A18;
  v25[0] = &unk_1EF7A7A60;
  v25[1] = &unk_1EF7A7A90;
  v24[2] = &unk_1EF7A7B20;
  v24[3] = &unk_1EF7A7A48;
  v25[2] = &unk_1EF7A7AD8;
  v25[3] = &unk_1EF7A7B08;
  BOOL v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:4];
  [v10 setObject:v11 forKey:objc_opt_class()];

  uint64_t v12 = (void *)+[VNANFDDetectorCompoundRequest compoundRequestRevisionForRequest:]::requestClassToDictionaryRequestRevisionToCompoundRequestRevision;
  v22[0] = &unk_1EF7A7A30;
  v22[1] = &unk_1EF7A7A18;
  v23[0] = &unk_1EF7A7A90;
  v23[1] = &unk_1EF7A7AD8;
  v22[2] = &unk_1EF7A7B20;
  v23[2] = &unk_1EF7A7B08;
  id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:3];
  [v12 setObject:v13 forKey:objc_opt_class()];

  uint64_t v14 = (void *)+[VNANFDDetectorCompoundRequest compoundRequestRevisionForRequest:]::requestClassToDictionaryRequestRevisionToCompoundRequestRevision;
  v20[0] = &unk_1EF7A7A30;
  v20[1] = &unk_1EF7A7A18;
  v21[0] = &unk_1EF7A7A90;
  v21[1] = &unk_1EF7A7AD8;
  v20[2] = &unk_1EF7A7B20;
  v21[2] = &unk_1EF7A7B08;
  uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:3];
  [v14 setObject:v15 forKey:objc_opt_class()];

  uint64_t v16 = (void *)+[VNANFDDetectorCompoundRequest compoundRequestRevisionForRequest:]::requestClassToDictionaryRequestRevisionToCompoundRequestRevision;
  long long v18 = &unk_1EF7A7A30;
  long long v19 = &unk_1EF7A7B08;
  long long v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v19 forKeys:&v18 count:1];
  [v16 setObject:v17 forKey:objc_opt_class()];
}

@end