@interface VNCalculateImageAestheticsScoresRequest
+ (BOOL)revision:(unint64_t)a3 mayAcceptResultsProducedByRevision:(unint64_t)a4;
+ (Class)configurationClass;
+ (const)revisionAvailability;
- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5;
- (BOOL)warmUpSession:(id)a3 error:(id *)a4;
- (id)_configureDependentRequestForRevision:(unint64_t)a3 error:(id *)a4;
- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4;
- (id)supportedComputeStageDevicesAndReturnError:(id *)a3;
@end

@implementation VNCalculateImageAestheticsScoresRequest

- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5
{
  v58[2] = *MEMORY[0x1E4F143B8];
  id v48 = a4;
  v50 = objc_alloc_init(VNClassifyImageAestheticsRequest);
  [(VNImageBasedRequest *)v50 applyConfigurationOfRequest:self];
  v49 = objc_alloc_init(VNClassifyJunkImageRequest);
  [(VNClassifyJunkImageRequest *)v49 applyConfigurationOfRequest:self];
  if (a3 == 1)
  {
    if ([(VNRequest *)v50 setRevision:3737841667 error:a5]
      && [(VNRequest *)v49 setRevision:3737841669 error:a5])
    {
      v46 = [v48 requestPerformerAndReturnError:a5];
      if (!v46
        || (v45 = self,
            v58[0] = v50,
            v58[1] = v49,
            [MEMORY[0x1E4F1C978] arrayWithObjects:v58 count:2],
            v7 = objc_claimAutoreleasedReturnValue(),
            char v8 = [v46 performDependentRequests:v7 onBehalfOfRequest:self inContext:v48 error:a5],
            v7,
            (v8 & 1) == 0))
      {
        BOOL v27 = 0;
LABEL_52:

        goto LABEL_31;
      }
      v9 = [(VNRequest *)v50 results];
      v44 = [v9 objectAtIndexedSubscript:0];

      [v44 aestheticScore];
      float v43 = v10;
      [v44 failureScore];
      float v12 = v11;
      long long v54 = 0u;
      long long v55 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      v13 = [(VNRequest *)v49 results];
      float v14 = NAN;
      uint64_t v15 = [v13 countByEnumeratingWithState:&v52 objects:v57 count:16];
      if (v15)
      {
        uint64_t v16 = *(void *)v53;
        float v47 = NAN;
        float v17 = NAN;
        float v18 = NAN;
        float v19 = NAN;
        float v20 = NAN;
        float v21 = NAN;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v53 != v16) {
              objc_enumerationMutation(v13);
            }
            v23 = *(void **)(*((void *)&v52 + 1) + 8 * i);
            v24 = [v23 identifier];
            [v23 confidence];
            float v26 = v25;
            if ([v24 isEqualToString:@"negative"])
            {
              float v21 = v26;
            }
            else if ([v24 isEqualToString:@"tragic_failure"])
            {
              float v20 = v26;
            }
            else if ([v24 isEqualToString:@"hier_poor_quality"])
            {
              float v19 = v26;
            }
            else if ([v24 isEqualToString:@"hier_non_memorable"])
            {
              float v18 = v26;
            }
            else if ([v24 isEqualToString:@"screenshot"])
            {
              float v14 = v26;
            }
            else if ([v24 isEqualToString:@"receipt_or_document"])
            {
              float v47 = v26;
            }
            else if ([v24 isEqualToString:@"hier_text_document"])
            {
              float v17 = v26;
            }
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v52 objects:v57 count:16];
        }
        while (v15);
      }
      else
      {
        float v47 = NAN;
        float v17 = NAN;
        float v18 = NAN;
        float v19 = NAN;
        float v20 = NAN;
        float v21 = NAN;
      }

      float v29 = -v12;
      if (v12 < -0.025 || v20 > 0.15 || v19 > 0.62)
      {
        uint64_t v30 = 0;
        if (v20 >= v19) {
          float v31 = v20;
        }
        else {
          float v31 = v19;
        }
        if (v31 > v29) {
          float v12 = -v31;
        }
        goto LABEL_49;
      }
      if (v18 > 0.675)
      {
        uint64_t v30 = 1;
        if (v21 < 0.3 || v14 > 0.84 || v47 > 0.71) {
          goto LABEL_43;
        }
        float v12 = v43;
        if (v17 >= 0.58)
        {
LABEL_49:
          v32 = [(VNRequest *)v45 specifier];
          *(float *)&double v33 = v12;
          *(float *)&double v34 = v43;
          *(float *)&double v35 = v29;
          *(float *)&double v36 = v21;
          *(float *)&double v37 = v20;
          *(float *)&double v38 = v19;
          *(float *)&double v39 = v18;
          *(float *)&double v40 = v14;
          v41 = +[VNImageAestheticsScoresObservation observationForOriginatingRequestSpecifier:isUtility:overallScore:aestheticScore:failureScore:junkNegativeScore:junkTragicFailureScore:poorQualityScore:nonMemorableScore:screenShotScore:receiptOrDocumentScore:textDocumentScore:error:](VNImageAestheticsScoresObservation, "observationForOriginatingRequestSpecifier:isUtility:overallScore:aestheticScore:failureScore:junkNegativeScore:junkTragicFailureScore:poorQualityScore:nonMemorableScore:screenShotScore:receiptOrDocumentScore:textDocumentScore:error:", v32, v30, a5, v33, v34, v35, v36, v37, v38, v39, v40, __PAIR64__(LODWORD(v17), LODWORD(v47)));

          BOOL v27 = v41 != 0;
          if (v41)
          {
            v56 = v41;
            v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v56 count:1];
            [(VNRequest *)v45 setResults:v42];
          }
          goto LABEL_52;
        }
      }
      uint64_t v30 = 0;
LABEL_43:
      float v12 = v43;
      goto LABEL_49;
    }
    goto LABEL_30;
  }
  if (!a5)
  {
LABEL_30:
    BOOL v27 = 0;
    goto LABEL_31;
  }
  +[VNError errorForUnsupportedRevision:a3 ofRequest:self];
  BOOL v27 = 0;
  *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_31:

  return v27;
}

- (BOOL)warmUpSession:(id)a3 error:(id *)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v20.receiver = self;
  v20.super_class = (Class)VNCalculateImageAestheticsScoresRequest;
  if ([(VNRequest *)&v20 warmUpSession:v6 error:a4])
  {
    v7 = [(VNCalculateImageAestheticsScoresRequest *)self _configureDependentRequestForRevision:[(VNRequest *)self resolvedRevision] error:a4];
    char v8 = v7;
    if (v7)
    {
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      v9 = objc_msgSend(v7, "requests", 0);
      uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v21 count:16];
      if (v10)
      {
        uint64_t v11 = *(void *)v17;
        while (2)
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v17 != v11) {
              objc_enumerationMutation(v9);
            }
            v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
            [v13 applyConfigurationOfRequest:self];
            if (([v13 warmUpSession:v6 error:a4] & 1) == 0)
            {
              BOOL v14 = 0;
              goto LABEL_14;
            }
          }
          uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v21 count:16];
          if (v10) {
            continue;
          }
          break;
        }
      }
      BOOL v14 = 1;
LABEL_14:
    }
    else
    {
      BOOL v14 = 0;
    }
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4
{
  if (a3 == 1)
  {
    v4 = &stru_1EF75C0C0;
    v5 = &stru_1EF75C0C0;
  }
  else if (a4)
  {
    +[VNError errorForUnsupportedRevision:ofRequest:](VNError, "errorForUnsupportedRevision:ofRequest:");
    v4 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)supportedComputeStageDevicesAndReturnError:(id *)a3
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  BOOL v27 = [(VNCalculateImageAestheticsScoresRequest *)self _configureDependentRequestForRevision:[(VNRequest *)self resolvedRevision] error:a3];
  if (v27)
  {
    id v30 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    v4 = [v27 requests];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v36 objects:v52 count:16];
    if (!v5) {
      goto LABEL_10;
    }
    uint64_t v6 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v37 != v6) {
          objc_enumerationMutation(v4);
        }
        char v8 = [*(id *)(*((void *)&v36 + 1) + 8 * i) supportedComputeStageDevicesAndReturnError:a3];
        if (!v8)
        {

          v9 = 0;
          goto LABEL_47;
        }
        [v30 addObject:v8];
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v36 objects:v52 count:16];
    }
    while (v5);
LABEL_10:

    id v26 = v30;
    context = (void *)MEMORY[0x1A6257080]();
    float v25 = [v26 firstObject];
    if (v25)
    {
      if ([v26 count] == 1)
      {
        v9 = (void *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithDictionary:v25 copyItems:1];
        goto LABEL_46;
      }
      id v35 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      long long v50 = 0u;
      long long v51 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      obuint64_t j = v26;
      uint64_t v10 = [obj countByEnumeratingWithState:&v48 objects:v55 count:16];
      if (v10)
      {
        uint64_t v11 = *(void *)v49;
        do
        {
          for (uint64_t j = 0; j != v10; ++j)
          {
            if (*(void *)v49 != v11) {
              objc_enumerationMutation(obj);
            }
            v13 = [*(id *)(*((void *)&v48 + 1) + 8 * j) allKeys];
            [v35 addObjectsFromArray:v13];
          }
          uint64_t v10 = [obj countByEnumeratingWithState:&v48 objects:v55 count:16];
        }
        while (v10);
      }

      id v28 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      long long v46 = 0u;
      long long v47 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      id v29 = v35;
      uint64_t v32 = [v29 countByEnumeratingWithState:&v44 objects:v54 count:16];
      if (v32)
      {
        uint64_t v31 = *(void *)v45;
        do
        {
          for (uint64_t k = 0; k != v32; ++k)
          {
            if (*(void *)v45 != v31) {
              objc_enumerationMutation(v29);
            }
            uint64_t v14 = *(void *)(*((void *)&v44 + 1) + 8 * k);
            long long v40 = 0u;
            long long v41 = 0u;
            long long v42 = 0u;
            long long v43 = 0u;
            id v15 = obj;
            uint64_t v16 = [v15 countByEnumeratingWithState:&v40 objects:v53 count:16];
            if (!v16)
            {
              long long v17 = v15;
              goto LABEL_42;
            }
            long long v17 = 0;
            uint64_t v18 = *(void *)v41;
            do
            {
              for (uint64_t m = 0; m != v16; ++m)
              {
                if (*(void *)v41 != v18) {
                  objc_enumerationMutation(v15);
                }
                objc_super v20 = [*(id *)(*((void *)&v40 + 1) + 8 * m) objectForKey:v14];
                if (v20)
                {
                  if (v17)
                  {
                    float v21 = [MEMORY[0x1E4F1CAD0] setWithArray:v20];
                    [v17 intersectSet:v21];
                  }
                  else
                  {
                    long long v17 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithArray:v20];
                  }
                }
              }
              uint64_t v16 = [v15 countByEnumeratingWithState:&v40 objects:v53 count:16];
            }
            while (v16);

            if (v17)
            {
              uint64_t v22 = [v17 allObjects];
              [v28 setObject:v22 forKeyedSubscript:v14];

LABEL_42:
              continue;
            }
          }
          uint64_t v32 = [v29 countByEnumeratingWithState:&v44 objects:v54 count:16];
        }
        while (v32);
      }

      v9 = (void *)[v28 copy];
    }
    else
    {
      v9 = (void *)MEMORY[0x1E4F1CC08];
    }
LABEL_46:

LABEL_47:
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_configureDependentRequestForRevision:(unint64_t)a3 error:(id *)a4
{
  v7 = [[_VNCalculateImageAestheticsScoresDependentRequests alloc] initWithRevision:a3 error:a4];
  char v8 = v7;
  if (a4 && !v7)
  {
    v9 = [(VNRequest *)self applicableDetectorClassAndOptions:0 forRevision:a3 error:0];
    id v10 = [NSString alloc];
    uint64_t v11 = (objc_class *)objc_opt_class();
    float v12 = VNRequestRevisionString(v11, a3);
    v13 = NSStringFromClass(v9);
    uint64_t v14 = (void *)[v10 initWithFormat:@"%@ is handled by %@", v12, v13];

    *a4 = +[VNError errorForInternalErrorWithLocalizedDescription:v14];
  }

  return v8;
}

+ (BOOL)revision:(unint64_t)a3 mayAcceptResultsProducedByRevision:(unint64_t)a4
{
  if (a3 != a4) {
    return 0;
  }
  uint64_t v8 = v4;
  uint64_t v9 = v5;
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___VNCalculateImageAestheticsScoresRequest;
  return objc_msgSendSuper2(&v7, sel_revision_mayAcceptResultsProducedByRevision_, a3, a3);
}

+ (const)revisionAvailability
{
  return (const $1305BF644A263E76A656B24897EDB60D *)&+[VNCalculateImageAestheticsScoresRequest revisionAvailability]::ourRevisionAvailability;
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

@end