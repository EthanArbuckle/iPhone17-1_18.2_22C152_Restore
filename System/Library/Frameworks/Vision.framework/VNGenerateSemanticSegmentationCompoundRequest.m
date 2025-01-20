@interface VNGenerateSemanticSegmentationCompoundRequest
+ (BOOL)warmUpSession:(id)a3 error:(id *)a4;
+ (Class)detectorForPersonInstanceRequestAndReturnError:(id *)a3;
+ (Class)detectorForSemanticSegmentationRequestAndReturnError:(id *)a3;
+ (const)revisionAvailability;
+ (id)compoundRequestsForOriginalRequests:(id)a3 withPerformingContext:(id)a4 error:(id *)a5;
+ (id)detectorTypeForPersonInstanceRequest;
+ (id)detectorTypeForSemanticSegmentationRequest;
+ (int64_t)compoundRequestRevisionForRequest:(id)a3;
- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5;
- (VNGenerateSemanticSegmentationCompoundRequest)initWithOriginalRequests:(id)a3;
- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4;
- (id)newDefaultDetectorOptionsForRequestRevision:(unint64_t)a3 session:(id)a4;
@end

@implementation VNGenerateSemanticSegmentationCompoundRequest

+ (id)compoundRequestsForOriginalRequests:(id)a3 withPerformingContext:(id)a4 error:(id *)a5
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v34 = a3;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id obj = v34;
  uint64_t v7 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v40;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v40 != v8) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0) {
                  continue;
                }
              }
            }
          }
        }
        id v11 = v10;
        BOOL v12 = [v11 qualityLevel] == 1;

        if (v12)
        {
          uint64_t v13 = [a1 compoundRequestRevisionForRequest:v10];
          if (!v13)
          {
            if (a5)
            {
              v32 = (void *)[[NSString alloc] initWithFormat:@"VNGenerateSemanticSegmentationCompoundRequest unimplemented revision/options for %@", v10];
              *a5 = +[VNError errorForInternalErrorWithLocalizedDescription:v32];
            }
            id v30 = 0;
            v31 = obj;
            goto LABEL_33;
          }
          [v10 regionOfInterest];
          double v18 = v17;
          if (v17 == 0.0) {
            double v18 = 0.0;
          }
          double v19 = v14;
          if (v14 == 0.0) {
            double v19 = 0.0;
          }
          uint64_t v20 = *(void *)&v19 ^ __ROR8__(*(void *)&v18, 51);
          double v21 = v15;
          if (v15 == 0.0) {
            double v21 = 0.0;
          }
          uint64_t v22 = *(void *)&v21 ^ __ROR8__(v20, 51);
          double v23 = v16;
          if (v16 == 0.0) {
            double v23 = 0.0;
          }
          uint64_t v24 = *(void *)&v23 ^ __ROR8__(v22, 51) ^ __ROR8__(v13, 51);
          v25 = [NSNumber numberWithUnsignedInteger:v24];
          v26 = [v6 objectForKey:v25];

          if (!v26)
          {
            id v27 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            v28 = [NSNumber numberWithUnsignedInteger:v24];
            [v6 setObject:v27 forKeyedSubscript:v28];

            v26 = v27;
          }
          [v26 addObject:v10];
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  if ([v6 count])
  {
    id v29 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __113__VNGenerateSemanticSegmentationCompoundRequest_compoundRequestsForOriginalRequests_withPerformingContext_error___block_invoke;
    v37[3] = &unk_1E5B1FAB8;
    id v30 = v29;
    id v38 = v30;
    [v6 enumerateKeysAndObjectsUsingBlock:v37];
    v31 = v38;
LABEL_33:
  }
  else
  {
    id v30 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v30;
}

- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v23 = a4;
  uint64_t v24 = [v23 session];
  uint64_t v8 = [v23 imageBufferAndReturnError:a5];
  if (v8
    && [(VNRequest *)self validateImageBuffer:v8 ofNonZeroWidth:0 andHeight:0 error:a5])
  {
    uint64_t v33 = 0;
    id v34 = &v33;
    uint64_t v35 = 0x3032000000;
    v36 = __Block_byref_object_copy__34481;
    v37 = __Block_byref_object_dispose__34482;
    id v38 = 0;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __89__VNGenerateSemanticSegmentationCompoundRequest_internalPerformRevision_inContext_error___block_invoke;
    aBlock[3] = &unk_1E5B1FF30;
    aBlock[4] = self;
    unint64_t v32 = a3;
    id v28 = v24;
    uint64_t v20 = v8;
    id v29 = v8;
    v31 = &v33;
    id v9 = v23;
    id v30 = v9;
    double v21 = _Block_copy(aBlock);
    char v22 = VNExecuteBlock(v21, (uint64_t)a5);
    if (v22)
    {
      [(VNCompoundRequest *)self recordWarningsInOriginalRequests];
      id v10 = (id)v34[5];
      id v11 = v9;
      if (self)
      {
        long long v41 = 0u;
        long long v42 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        BOOL v12 = [(VNCompoundRequest *)self originalRequests];
        id obj = v12;
        uint64_t v13 = [v12 countByEnumeratingWithState:&v39 objects:v43 count:16];
        if (v13)
        {
          uint64_t v14 = *(void *)v40;
          uint64_t v25 = *MEMORY[0x1E4F1C3B8];
          do
          {
            for (uint64_t i = 0; i != v13; ++i)
            {
              if (*(void *)v40 != v14) {
                objc_enumerationMutation(obj);
              }
              double v16 = *(void **)(*((void *)&v39 + 1) + 8 * i);
              double v17 = +[VNE5RTSegmentationMultiGenerator requestInfoForRequest:v16];
              if (!v17) {
                [MEMORY[0x1E4F1CA00] raise:v25, @"The request class %@ shall have it's results populated in the results array", objc_opt_class() format];
              }
              double v18 = objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v17, "originalRequestResultsIndex"));
              [v16 setResults:v18];

              [v11 cacheObservationsOfRequest:v16];
            }
            BOOL v12 = obj;
            uint64_t v13 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
          }
          while (v13);
        }
      }
    }

    _Block_object_dispose(&v33, 8);
    uint64_t v8 = v20;
  }
  else
  {
    char v22 = 0;
  }

  return v22;
}

BOOL __89__VNGenerateSemanticSegmentationCompoundRequest_internalPerformRevision_inContext_error___block_invoke(uint64_t a1, uint64_t a2)
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
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    BOOL v11 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) != 0;
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4
{
  switch(a3)
  {
    case 3uLL:
      id v5 = @"VNE5RTSegmentationMultiGeneratorType";
      id v6 = @"VNE5RTSegmentationMultiGeneratorType";
      goto LABEL_11;
    case 2uLL:
      uint64_t v4 = +[VNGenerateSemanticSegmentationCompoundRequest detectorTypeForPersonInstanceRequest];
      goto LABEL_7;
    case 1uLL:
      uint64_t v4 = +[VNGenerateSemanticSegmentationCompoundRequest detectorTypeForSemanticSegmentationRequest];
LABEL_7:
      id v5 = (__CFString *)v4;
      goto LABEL_11;
  }
  if (a4)
  {
    +[VNError errorForUnsupportedRevision:ofRequest:](VNError, "errorForUnsupportedRevision:ofRequest:");
    id v5 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v5 = 0;
  }
LABEL_11:

  return v5;
}

- (id)newDefaultDetectorOptionsForRequestRevision:(unint64_t)a3 session:(id)a4
{
  uint64_t v112 = *MEMORY[0x1E4F143B8];
  v108.receiver = self;
  v108.super_class = (Class)VNGenerateSemanticSegmentationCompoundRequest;
  id v72 = [(VNRequest *)&v108 newDefaultDetectorOptionsForRequestRevision:a3 session:a4];
  unint64_t v6 = 0x1E4F1C000uLL;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v9 = objc_opt_class();
  v87 = __101__VNGenerateSemanticSegmentationCompoundRequest_newDefaultDetectorOptionsForRequestRevision_session___block_invoke(1, 1, v9);
  v85 = __101__VNGenerateSemanticSegmentationCompoundRequest_newDefaultDetectorOptionsForRequestRevision_session___block_invoke(2, 1, v9);
  v83 = __101__VNGenerateSemanticSegmentationCompoundRequest_newDefaultDetectorOptionsForRequestRevision_session___block_invoke(4, 1, v9);
  v79 = __101__VNGenerateSemanticSegmentationCompoundRequest_newDefaultDetectorOptionsForRequestRevision_session___block_invoke(8, 1, v9);
  v78 = __101__VNGenerateSemanticSegmentationCompoundRequest_newDefaultDetectorOptionsForRequestRevision_session___block_invoke(16, 1, v9);
  v77 = __101__VNGenerateSemanticSegmentationCompoundRequest_newDefaultDetectorOptionsForRequestRevision_session___block_invoke(32, 1, v9);
  v75 = __101__VNGenerateSemanticSegmentationCompoundRequest_newDefaultDetectorOptionsForRequestRevision_session___block_invoke(64, 1, v9);
  id v10 = objc_opt_class();
  v88 = __101__VNGenerateSemanticSegmentationCompoundRequest_newDefaultDetectorOptionsForRequestRevision_session___block_invoke(1, 2, v10);
  v86 = __101__VNGenerateSemanticSegmentationCompoundRequest_newDefaultDetectorOptionsForRequestRevision_session___block_invoke(2, 2, v10);
  v84 = __101__VNGenerateSemanticSegmentationCompoundRequest_newDefaultDetectorOptionsForRequestRevision_session___block_invoke(4, 2, v10);
  v82 = __101__VNGenerateSemanticSegmentationCompoundRequest_newDefaultDetectorOptionsForRequestRevision_session___block_invoke(8, 2, v10);
  v80 = __101__VNGenerateSemanticSegmentationCompoundRequest_newDefaultDetectorOptionsForRequestRevision_session___block_invoke(16, 2, v10);
  v81 = __101__VNGenerateSemanticSegmentationCompoundRequest_newDefaultDetectorOptionsForRequestRevision_session___block_invoke(32, 2, v10);
  v76 = __101__VNGenerateSemanticSegmentationCompoundRequest_newDefaultDetectorOptionsForRequestRevision_session___block_invoke(64, 2, v10);
  v73 = __101__VNGenerateSemanticSegmentationCompoundRequest_newDefaultDetectorOptionsForRequestRevision_session___block_invoke(128, 2, v10);
  v74 = __101__VNGenerateSemanticSegmentationCompoundRequest_newDefaultDetectorOptionsForRequestRevision_session___block_invoke(256, 2, v10);
  if (a3 == 1)
  {
    [v7 setObject:&unk_1EF7A7940 forKey:v87];
    [v7 setObject:&unk_1EF7A7940 forKey:v85];
    [v7 setObject:&unk_1EF7A7940 forKey:v83];
    [v7 setObject:&unk_1EF7A7940 forKey:v79];
    [v7 setObject:&unk_1EF7A7940 forKey:v78];
    [v7 setObject:&unk_1EF7A7940 forKey:v77];
    [v7 setObject:&unk_1EF7A7940 forKey:v75];
    [v8 setObject:MEMORY[0x1E4F1CC28] forKey:v87];
    [v8 setObject:MEMORY[0x1E4F1CC28] forKey:v85];
    [v8 setObject:MEMORY[0x1E4F1CC28] forKey:v83];
    [v8 setObject:MEMORY[0x1E4F1CC28] forKey:v79];
    [v8 setObject:MEMORY[0x1E4F1CC28] forKey:v78];
    [v8 setObject:MEMORY[0x1E4F1CC28] forKey:v77];
    BOOL v11 = v75;
LABEL_14:
    objc_msgSend(v8, "setObject:forKey:", MEMORY[0x1E4F1CC28], v11, v72);
    goto LABEL_15;
  }
  if (a3 != 2)
  {
    if (a3 != 3) {
      goto LABEL_15;
    }
    [v7 setObject:&unk_1EF7A7940 forKey:v88];
    [v7 setObject:&unk_1EF7A7940 forKey:v86];
    [v7 setObject:&unk_1EF7A7940 forKey:v84];
    [v7 setObject:&unk_1EF7A7940 forKey:v82];
    [v7 setObject:&unk_1EF7A7940 forKey:v80];
    [v7 setObject:&unk_1EF7A7940 forKey:v81];
    [v7 setObject:&unk_1EF7A7940 forKey:v76];
    [v7 setObject:&unk_1EF7A7940 forKey:v73];
    [v7 setObject:&unk_1EF7A7940 forKey:v74];
    [v8 setObject:MEMORY[0x1E4F1CC28] forKey:v88];
    [v8 setObject:MEMORY[0x1E4F1CC28] forKey:v86];
    [v8 setObject:MEMORY[0x1E4F1CC28] forKey:v84];
    [v8 setObject:MEMORY[0x1E4F1CC28] forKey:v82];
    [v8 setObject:MEMORY[0x1E4F1CC28] forKey:v80];
    [v8 setObject:MEMORY[0x1E4F1CC28] forKey:v81];
    [v8 setObject:MEMORY[0x1E4F1CC28] forKey:v76];
    [v8 setObject:MEMORY[0x1E4F1CC28] forKey:v73];
    BOOL v11 = v74;
    goto LABEL_14;
  }
  BOOL v12 = +[VNGenerateSemanticSegmentationCompoundRequest detectorForPersonInstanceRequestAndReturnError:0];
  +[VNError VNAssert:v12 != 0 log:@"Cannot determine segmentation detector type"];
  [(objc_class *)v12 outputMaskBlobNames];
  long long v106 = 0u;
  long long v107 = 0u;
  long long v104 = 0u;
  long long v105 = 0u;
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v14 = [v13 countByEnumeratingWithState:&v104 objects:v111 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v105;
    uint64_t v16 = MEMORY[0x1E4F1CC28];
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v105 != v15) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void *)(*((void *)&v104 + 1) + 8 * i);
        objc_msgSend(v7, "setObject:forKey:", &unk_1EF7A7940, v18, v72);
        [v8 setObject:v16 forKey:v18];
      }
      uint64_t v14 = [v13 countByEnumeratingWithState:&v104 objects:v111 count:16];
    }
    while (v14);
  }

  unint64_t v6 = 0x1E4F1C000;
LABEL_15:
  id v91 = objc_alloc_init(*(Class *)(v6 + 2656));
  long long v102 = 0u;
  long long v103 = 0u;
  long long v100 = 0u;
  long long v101 = 0u;
  id obj = [(VNCompoundRequest *)self originalRequests];
  uint64_t v92 = [obj countByEnumeratingWithState:&v100 objects:v110 count:16];
  if (v92)
  {
    uint64_t v93 = 0;
    uint64_t v90 = *(void *)v101;
    int v19 = 0;
    while (1)
    {
      for (uint64_t j = 0; j != v92; ++j)
      {
        if (*(void *)v101 != v90) {
          objc_enumerationMutation(obj);
        }
        v95 = *(void **)(*((void *)&v100 + 1) + 8 * j);
        uint64_t v20 = objc_msgSend(v95, "resolvedRevision", v72);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v21 = v95;
          char v22 = @"VNSegmentationGeneratorProcessOption_PersonSegmentationDetectorOriginatingRequestSpecifier";
          switch(v20)
          {
            case 1:
              id v34 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v21, "outputPixelFormat"));
              [v7 setObject:v34 forKeyedSubscript:v87];

              uint64_t v35 = [NSNumber numberWithBool:-[VNGeneratePersonSegmentationRequest keepRawOutputMask](v21)];
              [v8 setObject:v35 forKeyedSubscript:v87];

LABEL_34:
              uint64_t v36 = v93 | 1;
              break;
            case 3737841664:
              v37 = +[VNGenerateSemanticSegmentationCompoundRequest detectorForPersonInstanceRequestAndReturnError:0];
              +[VNError VNAssert:v37 != 0 log:@"Cannot determine segmentation detector type"];
              id v38 = [(objc_class *)v37 outputMaskBlobNames];
              long long v98 = 0u;
              long long v99 = 0u;
              long long v96 = 0u;
              long long v97 = 0u;
              id v39 = v38;
              uint64_t v40 = [v39 countByEnumeratingWithState:&v96 objects:v109 count:16];
              if (v40)
              {
                uint64_t v41 = *(void *)v97;
                do
                {
                  for (uint64_t k = 0; k != v40; ++k)
                  {
                    if (*(void *)v97 != v41) {
                      objc_enumerationMutation(v39);
                    }
                    uint64_t v43 = *(void *)(*((void *)&v96 + 1) + 8 * k);
                    uint64_t v44 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v21, "outputPixelFormat"));
                    [v7 setObject:v44 forKey:v43];

                    v45 = [NSNumber numberWithBool:-[VNGeneratePersonSegmentationRequest keepRawOutputMask](v21)];
                    [v8 setObject:v45 forKey:v43];
                  }
                  uint64_t v40 = [v39 countByEnumeratingWithState:&v96 objects:v109 count:16];
                }
                while (v40);
              }

              [v21 minimumConfidence];
              int v19 = v46;

              uint64_t v36 = v93 | 0xF;
              break;
            case 3737841665:
              id v23 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v21, "outputPixelFormat"));
              [v7 setObject:v23 forKeyedSubscript:v88];

              uint64_t v24 = [NSNumber numberWithBool:-[VNGeneratePersonSegmentationRequest keepRawOutputMask](v21)];
              [v8 setObject:v24 forKeyedSubscript:v88];

              goto LABEL_34;
            default:
LABEL_44:

              v47 = @"VNSegmentationGeneratorProcessOption_PersonSegmentationDetectorOriginatingRequestSpecifier";
              goto LABEL_62;
          }
          uint64_t v93 = v36;
          goto LABEL_44;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v25 = @"VNSegmentationGeneratorProcessOption_SkySegmentationDetectorOriginatingRequestSpecifier";
          if (v20 == 3737841664)
          {
            id v51 = v95;
            v52 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v51, "outputPixelFormat"));
            [v7 setObject:v52 forKeyedSubscript:v86];

            [v8 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:v86];
LABEL_50:
          }
          else if (v20 == 1)
          {
            id v26 = v95;
            id v27 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v26, "outputPixelFormat"));
            [v7 setObject:v27 forKeyedSubscript:v85];

            [v8 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:v85];
            goto LABEL_50;
          }
          v93 |= 2uLL;
          v47 = @"VNSegmentationGeneratorProcessOption_SkySegmentationDetectorOriginatingRequestSpecifier";
          goto LABEL_62;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v28 = @"VNSegmentationGeneratorProcessOption_HumanAttributesSegmentationDetectorOriginatingRequestSpecifier";
          if (v20 == 3737841664)
          {
            id v57 = v95;
            v58 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v57, "outputPixelFormat"));
            [v7 setObject:v58 forKeyedSubscript:v84];

            [v8 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:v84];
            v59 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v57, "outputPixelFormat"));
            [v7 setObject:v59 forKeyedSubscript:v82];

            [v8 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:v82];
            v60 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v57, "outputPixelFormat"));
            [v7 setObject:v60 forKeyedSubscript:v80];

            [v8 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:v80];
            v61 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v57, "outputPixelFormat"));
            [v7 setObject:v61 forKeyedSubscript:v81];

            [v8 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:v81];
LABEL_56:
          }
          else if (v20 == 1)
          {
            id v29 = v95;
            id v30 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v29, "outputPixelFormat"));
            [v7 setObject:v30 forKeyedSubscript:v83];

            [v8 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:v83];
            v31 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v29, "outputPixelFormat"));
            [v7 setObject:v31 forKeyedSubscript:v79];

            [v8 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:v79];
            unint64_t v32 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v29, "outputPixelFormat"));
            [v7 setObject:v32 forKeyedSubscript:v78];

            [v8 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:v78];
            uint64_t v33 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v29, "outputPixelFormat"));
            [v7 setObject:v33 forKeyedSubscript:v77];

            [v8 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:v77];
            goto LABEL_56;
          }
          v93 |= 0x3CuLL;
          v47 = @"VNSegmentationGeneratorProcessOption_HumanAttributesSegmentationDetectorOriginatingRequestSpecifier";
          goto LABEL_62;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v48 = @"VNSegmentationGeneratorProcessOption_GlassesSegmentationDetectorOriginatingRequestSpecifier";
          if (v20 == 3737841664)
          {
            id v62 = v95;
            v63 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v62, "outputPixelFormat"));
            [v7 setObject:v63 forKeyedSubscript:v76];

            [v8 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:v76];
LABEL_60:
          }
          else if (v20 == 1)
          {
            id v49 = v95;
            v50 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v49, "outputPixelFormat"));
            [v7 setObject:v50 forKeyedSubscript:v75];

            [v8 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:v75];
            goto LABEL_60;
          }
          v93 |= 0x40uLL;
          v47 = @"VNSegmentationGeneratorProcessOption_GlassesSegmentationDetectorOriginatingRequestSpecifier";
          goto LABEL_62;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v47 = @"VNSegmentationGeneratorProcessOption_AnimalSegmentationDetectorOriginatingRequestSpecifier";
          v53 = @"VNSegmentationGeneratorProcessOption_AnimalSegmentationDetectorOriginatingRequestSpecifier";
          if (v20 == 1)
          {
            id v54 = v95;
            v55 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v54, "outputPixelFormat"));
            [v7 setObject:v55 forKeyedSubscript:v73];

            [v8 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:v73];
            v56 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v54, "outputPixelFormat"));
            [v7 setObject:v56 forKeyedSubscript:v74];

            [v8 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:v74];
            v93 |= 0x180uLL;
            v47 = @"VNSegmentationGeneratorProcessOption_AnimalSegmentationDetectorOriginatingRequestSpecifier";
          }
        }
        else
        {
          v47 = 0;
        }
LABEL_62:
        v64 = [v95 originatingRequestSpecifier];
        [v91 setObject:v64 forKey:v47];
      }
      uint64_t v92 = [obj countByEnumeratingWithState:&v100 objects:v110 count:16];
      if (!v92) {
        goto LABEL_66;
      }
    }
  }
  uint64_t v93 = 0;
  int v19 = 0;
LABEL_66:

  v65 = (void *)[v7 copy];
  [v72 setObject:v65 forKeyedSubscript:@"VNSegmentationGeneratorProcessOption_OutputPixelFormat"];

  v66 = (void *)[v8 copy];
  [v72 setObject:v66 forKeyedSubscript:@"VNSegmentationGeneratorProcessOption_KeepRawOutputMask"];

  LODWORD(v67) = v19;
  v68 = [NSNumber numberWithFloat:v67];
  [v72 setObject:v68 forKeyedSubscript:@"VNSegmentationGeneratorProcessOption_MinimumConfidence"];

  v69 = [NSNumber numberWithUnsignedInteger:v93];
  [v72 setObject:v69 forKeyedSubscript:@"VNSegmentationGeneratorProcessOption_ObjectClassIDs"];

  v70 = (void *)[v91 copy];
  [v72 setObject:v70 forKeyedSubscript:@"VNSegmentationGeneratorProcessOption_OriginalRequestSpecifiers"];

  return v72;
}

id __101__VNGenerateSemanticSegmentationCompoundRequest_newDefaultDetectorOptionsForRequestRevision_session___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = [a3 objectClassOutputNamesForObjectClassIDs:a1 modelVersion:a2 error:0];
  id v5 = objc_msgSend([NSString alloc], "initWithFormat:", @"Cannot find output name for %lu", a1);
  +[VNError VNAssert:v4 != 0 log:v5];
  unint64_t v6 = [v4 firstObject];

  return v6;
}

- (VNGenerateSemanticSegmentationCompoundRequest)initWithOriginalRequests:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)VNGenerateSemanticSegmentationCompoundRequest;
  id v5 = [(VNCompoundRequest *)&v14 initWithOriginalRequests:v4];
  if (v5)
  {
    unint64_t v6 = [v4 objectAtIndexedSubscript:0];
    int64_t v7 = +[VNGenerateSemanticSegmentationCompoundRequest compoundRequestRevisionForRequest:v6];

    id v13 = 0;
    BOOL v8 = [(VNRequest *)v5 setRevision:v7 error:&v13];
    id v9 = v13;
    if (v8)
    {
      id v10 = [(VNRequest *)v5 configuration];
      [v10 setResolvedRevision:v7];
      BOOL v11 = v5;
    }
    else
    {
      BOOL v11 = 0;
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

+ (Class)detectorForSemanticSegmentationRequestAndReturnError:(id *)a3
{
  id v4 = [a1 detectorTypeForSemanticSegmentationRequest];
  if (([v4 isEqualToString:@"VNE5RTSegmentationMultiGeneratorType"] & 1) != 0
    || [v4 isEqualToString:@"VNPersonSegmentationGeneratorSemanticsType"])
  {
    objc_opt_class();
    a3 = (id *)objc_claimAutoreleasedReturnValue();
  }
  else if (a3)
  {
    unint64_t v6 = (void *)[[NSString alloc] initWithFormat:@"Cannot find detector class for detector type: %@", v4];
    *a3 = +[VNError errorForInternalErrorWithLocalizedDescription:v6];

    a3 = 0;
  }

  return (Class)a3;
}

+ (id)detectorTypeForSemanticSegmentationRequest
{
  if (+[VNGenerateSemanticSegmentationCompoundRequest detectorTypeForSemanticSegmentationRequest]::onceToken != -1) {
    dispatch_once(&+[VNGenerateSemanticSegmentationCompoundRequest detectorTypeForSemanticSegmentationRequest]::onceToken, &__block_literal_global_84_34532);
  }
  v2 = (void *)+[VNGenerateSemanticSegmentationCompoundRequest detectorTypeForSemanticSegmentationRequest]::semanticSegmentationDetectorType;

  return v2;
}

void __91__VNGenerateSemanticSegmentationCompoundRequest_detectorTypeForSemanticSegmentationRequest__block_invoke()
{
  if (VisionCoreHasANE()) {
    v0 = @"VNE5RTSegmentationMultiGeneratorType";
  }
  else {
    v0 = @"VNPersonSegmentationGeneratorSemanticsType";
  }

  objc_storeStrong((id *)&+[VNGenerateSemanticSegmentationCompoundRequest detectorTypeForSemanticSegmentationRequest]::semanticSegmentationDetectorType, v0);
}

+ (Class)detectorForPersonInstanceRequestAndReturnError:(id *)a3
{
  id v4 = [a1 detectorTypeForPersonInstanceRequest];
  if (([v4 isEqualToString:@"VNE5RTSegmentationMultiGeneratorType"] & 1) != 0
    || [v4 isEqualToString:@"VNPersonSegmentationGeneratorInstanceBased4PeopleType"])
  {
    objc_opt_class();
    a3 = (id *)objc_claimAutoreleasedReturnValue();
  }
  else if (a3)
  {
    unint64_t v6 = (void *)[[NSString alloc] initWithFormat:@"Cannot find detector class for detector type: %@", v4];
    *a3 = +[VNError errorForInternalErrorWithLocalizedDescription:v6];

    a3 = 0;
  }

  return (Class)a3;
}

+ (id)detectorTypeForPersonInstanceRequest
{
  if (+[VNGenerateSemanticSegmentationCompoundRequest detectorTypeForPersonInstanceRequest]::onceToken != -1) {
    dispatch_once(&+[VNGenerateSemanticSegmentationCompoundRequest detectorTypeForPersonInstanceRequest]::onceToken, &__block_literal_global_77);
  }
  v2 = (void *)+[VNGenerateSemanticSegmentationCompoundRequest detectorTypeForPersonInstanceRequest]::personInstanceDetectorType;

  return v2;
}

void __85__VNGenerateSemanticSegmentationCompoundRequest_detectorTypeForPersonInstanceRequest__block_invoke()
{
  if (VisionCoreCurrentANEGeneration() <= 12) {
    v0 = @"VNPersonSegmentationGeneratorInstanceBased4PeopleType";
  }
  else {
    v0 = @"VNE5RTSegmentationMultiGeneratorType";
  }

  objc_storeStrong((id *)&+[VNGenerateSemanticSegmentationCompoundRequest detectorTypeForPersonInstanceRequest]::personInstanceDetectorType, v0);
}

+ (BOOL)warmUpSession:(id)a3 error:(id *)a4
{
  v31[5] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  unint64_t v6 = objc_alloc_init(VNGeneratePersonSegmentationRequest);
  int64_t v7 = objc_alloc_init(VNGenerateSkySegmentationRequest);
  BOOL v8 = objc_alloc_init(VNGenerateHumanAttributesSegmentationRequest);
  id v9 = objc_alloc_init(VNGenerateGlassesSegmentationRequest);
  v31[0] = v6;
  v31[1] = v8;
  v31[2] = v7;
  v31[3] = v9;
  uint64_t v25 = objc_alloc_init(VNGenerateAnimalSegmentationRequest);
  v31[4] = v25;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:5];
  BOOL v11 = objc_alloc_init(VNRequestPerformer);
  BOOL v12 = [[VNRequestPerformingContext alloc] initWithSession:v5 requestPerformer:v11 imageBuffer:0 forensics:0 observationsCache:0];
  [(VNRequestPerformingContext *)v12 qosClass];
  id v13 = +[VNGenerateSemanticSegmentationCompoundRequest compoundRequestsForOriginalRequests:v10 withPerformingContext:v12 error:a4];
  objc_super v14 = v13;
  if (v13)
  {
    id v23 = v9;
    uint64_t v24 = v8;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v15 = v13;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v16)
    {
      id v21 = v7;
      char v22 = v6;
      uint64_t v17 = *(void *)v27;
      while (2)
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v27 != v17) {
            objc_enumerationMutation(v15);
          }
          if (([*(id *)(*((void *)&v26 + 1) + 8 * i) warmUpSession:v5 error:a4] & 1) == 0)
          {
            BOOL v19 = 0;
            goto LABEL_12;
          }
        }
        uint64_t v16 = [v15 countByEnumeratingWithState:&v26 objects:v30 count:16];
        if (v16) {
          continue;
        }
        break;
      }
      BOOL v19 = 1;
LABEL_12:
      int64_t v7 = v21;
      unint64_t v6 = v22;
    }
    else
    {
      BOOL v19 = 1;
    }

    id v9 = v23;
    BOOL v8 = v24;
  }
  else
  {
    BOOL v19 = 0;
  }

  return v19;
}

void __113__VNGenerateSemanticSegmentationCompoundRequest_compoundRequestsForOriginalRequests_withPerformingContext_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v4 = [[VNGenerateSemanticSegmentationCompoundRequest alloc] initWithOriginalRequests:v5];
  [*(id *)(a1 + 32) addObject:v4];
}

+ (int64_t)compoundRequestRevisionForRequest:(id)a3
{
  id v3 = a3;
  if (+[VNGenerateSemanticSegmentationCompoundRequest compoundRequestRevisionForRequest:]::onceToken != -1) {
    dispatch_once(&+[VNGenerateSemanticSegmentationCompoundRequest compoundRequestRevisionForRequest:]::onceToken, &__block_literal_global_34544);
  }
  id v4 = objc_msgSend((id)+[VNGenerateSemanticSegmentationCompoundRequest compoundRequestRevisionForRequest:]::requestClassToDictionaryRequestRevisionToCompoundRequestRevision, "objectForKey:", objc_msgSend(v3, "frameworkClass"));
  if (v4)
  {
    uint64_t v5 = [v3 resolvedRevision];
    unint64_t v6 = [NSNumber numberWithUnsignedInteger:v5];
    int64_t v7 = [v4 objectForKey:v6];

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

void __83__VNGenerateSemanticSegmentationCompoundRequest_compoundRequestRevisionForRequest___block_invoke()
{
  v21[3] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  v1 = (void *)+[VNGenerateSemanticSegmentationCompoundRequest compoundRequestRevisionForRequest:]::requestClassToDictionaryRequestRevisionToCompoundRequestRevision;
  +[VNGenerateSemanticSegmentationCompoundRequest compoundRequestRevisionForRequest:]::requestClassToDictionaryRequestRevisionToCompoundRequestRevision = v0;

  v2 = (void *)+[VNGenerateSemanticSegmentationCompoundRequest compoundRequestRevisionForRequest:]::requestClassToDictionaryRequestRevisionToCompoundRequestRevision;
  v20[0] = &unk_1EF7A78C8;
  v20[1] = &unk_1EF7A78E0;
  v21[0] = &unk_1EF7A78C8;
  v21[1] = &unk_1EF7A78F8;
  v20[2] = &unk_1EF7A7910;
  v21[2] = &unk_1EF7A7928;
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:3];
  [v2 setObject:v3 forKey:objc_opt_class()];

  id v4 = (void *)+[VNGenerateSemanticSegmentationCompoundRequest compoundRequestRevisionForRequest:]::requestClassToDictionaryRequestRevisionToCompoundRequestRevision;
  v18[0] = &unk_1EF7A78C8;
  v18[1] = &unk_1EF7A78E0;
  v19[0] = &unk_1EF7A78C8;
  v19[1] = &unk_1EF7A7928;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];
  [v4 setObject:v5 forKey:objc_opt_class()];

  unint64_t v6 = (void *)+[VNGenerateSemanticSegmentationCompoundRequest compoundRequestRevisionForRequest:]::requestClassToDictionaryRequestRevisionToCompoundRequestRevision;
  v16[0] = &unk_1EF7A78C8;
  v16[1] = &unk_1EF7A78E0;
  v17[0] = &unk_1EF7A78C8;
  v17[1] = &unk_1EF7A7928;
  int64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];
  [v6 setObject:v7 forKey:objc_opt_class()];

  int64_t v8 = (void *)+[VNGenerateSemanticSegmentationCompoundRequest compoundRequestRevisionForRequest:]::requestClassToDictionaryRequestRevisionToCompoundRequestRevision;
  v14[0] = &unk_1EF7A78C8;
  v14[1] = &unk_1EF7A78E0;
  v15[0] = &unk_1EF7A78C8;
  v15[1] = &unk_1EF7A7928;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];
  [v8 setObject:v9 forKey:objc_opt_class()];

  id v10 = (void *)+[VNGenerateSemanticSegmentationCompoundRequest compoundRequestRevisionForRequest:]::requestClassToDictionaryRequestRevisionToCompoundRequestRevision;
  BOOL v12 = &unk_1EF7A78C8;
  id v13 = &unk_1EF7A7928;
  BOOL v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  [v10 setObject:v11 forKey:objc_opt_class()];
}

+ (const)revisionAvailability
{
  return (const $1305BF644A263E76A656B24897EDB60D *)&+[VNGenerateSemanticSegmentationCompoundRequest(Revisioning) revisionAvailability]::ourRevisionAvailability;
}

@end