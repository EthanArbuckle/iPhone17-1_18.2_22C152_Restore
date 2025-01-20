@interface VNCreateTorsoprintRequest
+ (BOOL)revision:(unint64_t)a3 mayAcceptResultsProducedByRevision:(unint64_t)a4;
+ (Class)configurationClass;
+ (const)dependentRequestCompatibility;
+ (const)revisionAvailability;
+ (id)descriptionForPrivateRevision:(unint64_t)a3;
+ (id)privateRevisionsSet;
- (BOOL)_processFaceBasedInputInContext:(id)a3 revision:(unint64_t)a4 torsosThatNeedNoProcessing:(id)a5 torsosThatNeedTorsoprints:(id)a6 error:(id *)a7;
- (BOOL)_processHumanBodyBasedInputInContext:(id)a3 revision:(unint64_t)a4 torsosThatNeedNoProcessing:(id)a5 torsosThatNeedTorsoprints:(id)a6 error:(id *)a7;
- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5;
- (BOOL)resultsAreAssignedWithOriginatingRequestSpecifier;
- (id)_processHumanBodyObservations:(id)a3 revision:(unint64_t)a4 regionOfInterest:(CGRect)a5 context:(id)a6 error:(id *)a7;
- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4;
- (id)detectHumanBodiesInContext:(id)a3 error:(id *)a4;
- (int64_t)dependencyProcessingOrdinality;
@end

@implementation VNCreateTorsoprintRequest

+ (BOOL)revision:(unint64_t)a3 mayAcceptResultsProducedByRevision:(unint64_t)a4
{
  if (a3 != a4) {
    return 0;
  }
  uint64_t v8 = v4;
  uint64_t v9 = v5;
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___VNCreateTorsoprintRequest;
  return objc_msgSendSuper2(&v7, sel_revision_mayAcceptResultsProducedByRevision_, a3, a3);
}

+ (const)dependentRequestCompatibility
{
  {
    +[VNCreateTorsoprintRequest dependentRequestCompatibility]::ourDependentRequestCompatibilityTable = 1;
    qword_1E95F3928 = objc_opt_class();
    *(int64x2_t *)algn_1E95F3930 = vdupq_n_s64(1uLL);
    qword_1E95F3940 = objc_opt_class();
    unk_1E95F3948 = xmmword_1A410C100;
    qword_1E95F3958 = objc_opt_class();
    unk_1E95F3960 = xmmword_1A410C180;
    qword_1E95F3970 = objc_opt_class();
    *(void *)algn_1E95F3978 = 1;
    qword_1E95F3988 = 0;
    unk_1E95F3990 = 0;
    qword_1E95F3980 = 0;
  }
  return (const $BB6EA70A2DEABF36E8ECE2B2BD0E2E04 *)&+[VNCreateTorsoprintRequest dependentRequestCompatibility]::ourDependentRequestCompatibilityTable;
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5
{
  id v8 = a4;
  VNValidatedLog(1, @"Processing Create Torsoprint request\n", v9, v10, v11, v12, v13, v14, v20);
  id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (a3 - 3737841666u <= 6 && ((1 << (a3 - 2)) & 0x71) != 0)
  {
    BOOL v17 = [(VNCreateTorsoprintRequest *)self _processHumanBodyBasedInputInContext:v8 revision:a3 torsosThatNeedNoProcessing:v15 torsosThatNeedTorsoprints:v16 error:a5];
  }
  else
  {
    if (a3 != 1)
    {
      if (a5)
      {
        +[VNError errorForUnsupportedRevision:a3 ofRequestClass:objc_opt_class()];
        BOOL v18 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_11;
      }
LABEL_10:
      BOOL v18 = 0;
      goto LABEL_11;
    }
    BOOL v17 = [(VNCreateTorsoprintRequest *)self _processFaceBasedInputInContext:v8 revision:1 torsosThatNeedNoProcessing:v15 torsosThatNeedTorsoprints:v16 error:a5];
  }
  if (!v17) {
    goto LABEL_10;
  }
  BOOL v18 = 1;
LABEL_11:

  return v18;
}

- (id)detectHumanBodiesInContext:(id)a3 error:(id *)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  objc_super v7 = objc_alloc_init(VNDetectHumanRectanglesRequest);
  [(VNDetectHumanRectanglesRequest *)v7 applyConfigurationOfRequest:self];
  id v8 = [v6 requestPerformerAndReturnError:a4];
  if (v8
    && (v13[0] = v7,
        [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1],
        uint64_t v9 = objc_claimAutoreleasedReturnValue(),
        char v10 = [v8 performDependentRequests:v9 onBehalfOfRequest:self inContext:v6 error:a4],
        v9,
        (v10 & 1) != 0))
  {
    uint64_t v11 = [(VNRequest *)v7 results];
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (id)_processHumanBodyObservations:(id)a3 revision:(unint64_t)a4 regionOfInterest:(CGRect)a5 context:(id)a6 error:(id *)a7
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  v75[1] = *MEMORY[0x1E4F143B8];
  id v41 = a3;
  id v42 = a6;
  v40 = [v42 requestPerformerAndReturnError:a7];
  if (!v40)
  {
    id v35 = 0;
    goto LABEL_26;
  }
  v39 = [v42 imageBufferAndReturnError:a7];
  if (v39)
  {
    [v42 session];
    v38 = id v73 = 0;
    v48 = -[VNRequest applicableDetectorAndOptions:forRevision:loadedInSession:error:](self, "applicableDetectorAndOptions:forRevision:loadedInSession:error:", &v73, a4);
    id v49 = v73;
    if (!v48)
    {
      id v35 = 0;
LABEL_24:

      goto LABEL_25;
    }
    v75[0] = v39;
    uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v75 count:1];
    v37 = a7;
    [v49 setObject:v14 forKeyedSubscript:@"VNDetectorProcessOption_InputImageBuffers"];

    dispatch_qos_class_t v15 = [v42 qosClass];
    uint64_t v16 = [v41 count];
    v45 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v16];
    v47 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v16];
    v71[0] = 0;
    v71[1] = v71;
    v71[2] = 0x3812000000;
    v71[3] = __Block_byref_object_copy__4859;
    v71[4] = __Block_byref_object_dispose__4860;
    v71[5] = "";
    int v72 = 0;
    v46 = [(VNRequest *)self requestTasksQueue];
    dispatch_group_t v43 = dispatch_group_create();
    uint64_t v17 = objc_opt_class();
    unint64_t v18 = [v41 count];
    long long v69 = 0u;
    long long v70 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    id obj = v41;
    uint64_t v19 = [obj countByEnumeratingWithState:&v67 objects:v74 count:16];
    if (v19)
    {
      uint64_t v20 = *(void *)v68;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v68 != v20) {
            objc_enumerationMutation(obj);
          }
          uint64_t v22 = *(void *)(*((void *)&v67 + 1) + 8 * i);
          v23 = (void *)[v49 mutableCopy];
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __99__VNCreateTorsoprintRequest__processHumanBodyObservations_revision_regionOfInterest_context_error___block_invoke;
          block[3] = &unk_1E5B1C5D0;
          uint64_t v60 = v17;
          dispatch_qos_class_t v66 = v15;
          id v24 = v23;
          id v52 = v24;
          uint64_t v53 = v22;
          id v25 = v48;
          CGFloat v61 = x;
          CGFloat v62 = y;
          CGFloat v63 = width;
          CGFloat v64 = height;
          id v54 = v25;
          v55 = self;
          v59 = v71;
          id v56 = v45;
          id v57 = v47;
          unint64_t v65 = v18;
          id v26 = v46;
          id v58 = v26;
          dispatch_block_t v27 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v15, 0, block);
          v28 = v27;
          if (v18 < 2) {
            (*((void (**)(dispatch_block_t))v27 + 2))(v27);
          }
          else {
            [v26 dispatchGroupAsyncByPreservingQueueCapacity:v43 block:v27];
          }
        }
        uint64_t v19 = [obj countByEnumeratingWithState:&v67 objects:v74 count:16];
      }
      while (v19);
    }

    if (v18 < 2 || ([v46 dispatchGroupWait:v43 error:v37] & 1) != 0)
    {
      if (+[VNValidationUtilities validateAsyncStatusResults:v47 error:v37])
      {
        id v35 = v45;
LABEL_23:

        _Block_object_dispose(v71, 8);
        goto LABEL_24;
      }
    }
    else
    {
      VNValidatedLog(4, @"Timed out processing human observations: %@", v29, v30, v31, v32, v33, v34, (uint64_t)obj);
    }
    id v35 = 0;
    goto LABEL_23;
  }
  id v35 = 0;
LABEL_25:

LABEL_26:

  return v35;
}

void __99__VNCreateTorsoprintRequest__processHumanBodyObservations_revision_regionOfInterest_context_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v46[1] = *MEMORY[0x1E4F143B8];
  VNValidatedLog(1, @"processOneHumanBodyBlock: start processing: %@", a3, a4, a5, a6, a7, a8, *(void *)(a1 + 96));
  uint64_t v40 = 0;
  id v41 = &v40;
  uint64_t v42 = 0x3032000000;
  dispatch_group_t v43 = __Block_byref_object_copy__39;
  v44 = __Block_byref_object_dispose__40;
  id v45 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __99__VNCreateTorsoprintRequest__processHumanBodyObservations_revision_regionOfInterest_context_error___block_invoke_41;
  aBlock[3] = &unk_1E5B1C5A8;
  uint64_t v36 = *(void *)(a1 + 96);
  int v39 = *(_DWORD *)(a1 + 144);
  id v9 = *(id *)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 40);
  id v31 = v9;
  uint64_t v32 = v10;
  id v35 = &v40;
  id v11 = *(id *)(a1 + 48);
  long long v12 = *(_OWORD *)(a1 + 120);
  long long v37 = *(_OWORD *)(a1 + 104);
  long long v38 = v12;
  uint64_t v13 = *(void *)(a1 + 56);
  id v33 = v11;
  uint64_t v34 = v13;
  uint64_t v14 = _Block_copy(aBlock);
  dispatch_qos_class_t v15 = [*(id *)(a1 + 40) torsoprint];
  BOOL v16 = v15 == 0;

  if (v16)
  {
    id v29 = 0;
    uint64_t v21 = VNExecuteBlock(v14, (uint64_t)&v29);
    id v20 = v29;
  }
  else
  {
    uint64_t v17 = objc_msgSend(*(id *)(a1 + 40), "vn_cloneObject");
    v46[0] = v17;
    uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:1];
    uint64_t v19 = (void *)v41[5];
    v41[5] = v18;

    id v20 = 0;
    uint64_t v21 = 1;
  }
  uint64_t v22 = [[VNAsyncStatus alloc] initWithStatus:v21 error:v20];
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 88) + 8) + 48));
  [*(id *)(a1 + 64) addObjectsFromArray:v41[5]];
  [*(id *)(a1 + 72) addObject:v22];
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 88) + 8) + 48));
  VNValidatedLog(1, @"processOneHumanBodyBlock: finish processing: %@", v23, v24, v25, v26, v27, v28, *(void *)(a1 + 96));
  if (*(void *)(a1 + 136) >= 2uLL) {
    [*(id *)(a1 + 80) dispatchReportBlockCompletion];
  }

  _Block_object_dispose(&v40, 8);
}

BOOL __99__VNCreateTorsoprintRequest__processHumanBodyObservations_revision_regionOfInterest_context_error___block_invoke_41(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v15[1] = *MEMORY[0x1E4F143B8];
  VNValidatedLog(1, @"processHumanBodyBlock: start processing: %@", a3, a4, a5, a6, a7, a8, *(void *)(a1 + 72));
  v15[0] = *(void *)(a1 + 40);
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  [*(id *)(a1 + 32) setObject:v10 forKeyedSubscript:@"VNTorsoprintGeneratorProcessOption_InputDetectedObjectObservation"];

  uint64_t v11 = objc_msgSend(*(id *)(a1 + 48), "processUsingQualityOfServiceClass:options:regionOfInterest:warningRecorder:error:progressHandler:", *(unsigned int *)(a1 + 112), *(void *)(a1 + 32), *(void *)(a1 + 56), a2, 0, *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104));
  uint64_t v12 = *(void *)(*(void *)(a1 + 64) + 8);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v11;

  return *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) != 0;
}

- (BOOL)_processHumanBodyBasedInputInContext:(id)a3 revision:(unint64_t)a4 torsosThatNeedNoProcessing:(id)a5 torsosThatNeedTorsoprints:(id)a6 error:(id *)a7
{
  id v10 = a3;
  id v17 = 0;
  BOOL v11 = [(VNImageBasedRequest *)self getOptionalValidatedInputDetectedObjectObservations:&v17 forObservationClass:objc_opt_class() relationWithRegionOfInterest:1 error:a7];
  id v12 = v17;
  uint64_t v13 = v12;
  if (v11
    && (v12
     || ([(VNCreateTorsoprintRequest *)self detectHumanBodiesInContext:v10 error:a7], (uint64_t v13 = objc_claimAutoreleasedReturnValue()) != 0)))
  {
    [(VNImageBasedRequest *)self regionOfInterest];
    uint64_t v14 = -[VNCreateTorsoprintRequest _processHumanBodyObservations:revision:regionOfInterest:context:error:](self, "_processHumanBodyObservations:revision:regionOfInterest:context:error:", v13, a4, v10, a7);
    BOOL v15 = v14 != 0;
    if (v14) {
      [(VNRequest *)self setResults:v14];
    }
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

- (BOOL)_processFaceBasedInputInContext:(id)a3 revision:(unint64_t)a4 torsosThatNeedNoProcessing:(id)a5 torsosThatNeedTorsoprints:(id)a6 error:(id *)a7
{
  id v10 = a3;
  id v17 = 0;
  BOOL v11 = [(VNImageBasedRequest *)self getOptionalValidatedInputFaceObservations:&v17 clippedToRegionOfInterest:1 error:a7];
  id v12 = v17;
  uint64_t v13 = v12;
  if (v11
    && (v12
     || ([(VNRequest *)self detectFacesInContext:v10 error:a7],
         (uint64_t v13 = objc_claimAutoreleasedReturnValue()) != 0)))
  {
    [(VNImageBasedRequest *)self regionOfInterest];
    uint64_t v14 = -[VNRequest processFaceObservations:revision:regionOfInterest:detectorType:detectorOptions:shouldAlignFaceBBox:shouldRunDetectorBlock:context:error:](self, "processFaceObservations:revision:regionOfInterest:detectorType:detectorOptions:shouldAlignFaceBBox:shouldRunDetectorBlock:context:error:", v13, a4, @"VNTorsoprintGeneratorDetectorType", 0, &__block_literal_global_4882, &__block_literal_global_30, v10, a7);
    BOOL v15 = v14 != 0;
    if (v14) {
      [(VNRequest *)self setResults:v14];
    }
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

BOOL __129__VNCreateTorsoprintRequest__processFaceBasedInputInContext_revision_torsosThatNeedNoProcessing_torsosThatNeedTorsoprints_error___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 faceTorsoprint];
  v3 = [v2 torsoprint];
  BOOL v4 = v3 == 0;

  return v4;
}

uint64_t __129__VNCreateTorsoprintRequest__processFaceBasedInputInContext_revision_torsosThatNeedNoProcessing_torsosThatNeedTorsoprints_error___block_invoke()
{
  return 0;
}

- (int64_t)dependencyProcessingOrdinality
{
  return VNRequestDependencyProcessingOrdinalityAdjustedForConfiguredRequest(4000, self);
}

- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4
{
  BOOL v4 = @"VNTorsoprintGeneratorDetectorType";
  return @"VNTorsoprintGeneratorDetectorType";
}

- (BOOL)resultsAreAssignedWithOriginatingRequestSpecifier
{
  return 0;
}

+ (id)descriptionForPrivateRevision:(unint64_t)a3
{
  unint64_t v3 = a3 - 3737841666u;
  if (a3 - 3737841666u < 7 && ((0x71u >> v3) & 1) != 0)
  {
    BOOL v4 = off_1E5B1C5F0[v3];
  }
  else
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___VNCreateTorsoprintRequest;
    objc_msgSendSuper2(&v6, sel_descriptionForPrivateRevision_);
    BOOL v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

+ (id)privateRevisionsSet
{
  if (+[VNCreateTorsoprintRequest(Revisioning) privateRevisionsSet]::onceToken != -1) {
    dispatch_once(&+[VNCreateTorsoprintRequest(Revisioning) privateRevisionsSet]::onceToken, &__block_literal_global_139);
  }
  v2 = (void *)+[VNCreateTorsoprintRequest(Revisioning) privateRevisionsSet]::ourPrivateRevisions;

  return v2;
}

uint64_t __61__VNCreateTorsoprintRequest_Revisioning__privateRevisionsSet__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  +[VNCreateTorsoprintRequest(Revisioning) privateRevisionsSet]::ourPrivateRevisions = VNRequestPrivateRevisionsSet(0xDECAF006uLL, a2, a3, a4, a5, a6, a7, a8, 3737841666);

  return MEMORY[0x1F41817F8]();
}

+ (const)revisionAvailability
{
  return (const $1305BF644A263E76A656B24897EDB60D *)&+[VNCreateTorsoprintRequest(Revisioning) revisionAvailability]::ourRevisionAvailability;
}

@end