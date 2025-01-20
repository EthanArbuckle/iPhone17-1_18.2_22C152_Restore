@interface BWInferenceScheduler
+ (void)initialize;
- (BWInferenceScheduler)init;
- (OS_dispatch_queue)metalCompletionQueue;
- (OS_dispatch_queue)metalSubmissionQueue;
- (int)performInferencesForConnection:(unint64_t)a3 usingInputSampleBuffer:(opaqueCMSampleBuffer *)a4 attachingResultsToSampleBuffer:(opaqueCMSampleBuffer *)a5 skippingInferencesWithTypes:(id)a6;
- (int)prepareForInferenceRequirements:(id)a3 dependencyProviderSource:(id)a4 formatProvider:(id)a5 pixelBufferPoolProvider:(id)a6 connection:(unint64_t)a7 backPressureDrivenPipelining:(BOOL)a8;
- (uint64_t)_processJobsFromFramebuffer:(uint64_t)a3 usingInputSampleBuffer:(uint64_t)a4 inferencePropagationHandler:(long long *)a5 atExecutionTime:(void *)a6 forConnection:;
- (uint64_t)_queueForJob:(void *)a3 fromConnection:;
- (unint64_t)registerInferenceConnection;
- (void)dealloc;
- (void)unregisterInferenceConnection:(unint64_t)a3;
@end

@implementation BWInferenceScheduler

- (BWInferenceScheduler)init
{
  v9.receiver = self;
  v9.super_class = (Class)BWInferenceScheduler;
  v2 = [(BWInferenceScheduler *)&v9 init];
  v3 = v2;
  if (v2)
  {
    v2->_connectionsLock._os_unfair_lock_opaque = 0;
    v2->_connectionsByIdentifier = (NSMapTable *)[objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:1282 valueOptions:0 capacity:0];
    FigThreadGetMachThreadPriorityValue();
    inactive = dispatch_workloop_create_inactive("com.apple.coremedia.inference");
    v3->_inferenceWorkloop = (OS_dispatch_workloop *)inactive;
    dispatch_workloop_set_autorelease_frequency(inactive, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_workloop_set_scheduler_priority();
    dispatch_activate((dispatch_object_t)v3->_inferenceWorkloop);
    FigThreadGetMachThreadPriorityValue();
    v5 = dispatch_workloop_create_inactive("com.apple.coremedia.inference-scaling");
    v3->_scalingWorkloop = (OS_dispatch_workloop *)v5;
    dispatch_workloop_set_autorelease_frequency(v5, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_workloop_set_scheduler_priority();
    dispatch_activate((dispatch_object_t)v3->_scalingWorkloop);
    FigThreadGetMachThreadPriorityValue();
    v6 = dispatch_workloop_create_inactive("com.apple.coremedia.inference-submission");
    v3->_submissionWorkloop = (OS_dispatch_workloop *)v6;
    dispatch_workloop_set_autorelease_frequency(v6, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_workloop_set_scheduler_priority();
    dispatch_activate((dispatch_object_t)v3->_submissionWorkloop);
    FigThreadGetMachThreadPriorityValue();
    v7 = dispatch_workloop_create_inactive("com.apple.coremedia.inference-completion");
    v3->_completionWorkloop = (OS_dispatch_workloop *)v7;
    dispatch_workloop_set_autorelease_frequency(v7, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_workloop_set_scheduler_priority();
    dispatch_activate((dispatch_object_t)v3->_completionWorkloop);
    v3->_metalSubmissionQueue = (OS_dispatch_queue *)FigDispatchQueueCreateTargetingPThreadRootQueueWithPriority();
    v3->_metalCompletionQueue = (OS_dispatch_queue *)FigDispatchQueueCreateTargetingPThreadRootQueueWithPriority();
  }
  return v3;
}

- (unint64_t)registerInferenceConnection
{
  v3 = [[BWInferenceSchedulerConnection alloc] initWithInferenceTargetQueue:self->_inferenceWorkloop scalingTargetQueue:self->_scalingWorkloop submissionTargetQueue:self->_submissionWorkloop completionTargetQueue:self->_completionWorkloop];
  unint64_t v4 = [(BWInferenceSchedulerConnection *)v3 identifier];
  os_unfair_lock_lock(&self->_connectionsLock);
  [(NSMapTable *)self->_connectionsByIdentifier setObject:v3 forKey:v4];
  os_unfair_lock_unlock(&self->_connectionsLock);

  return v4;
}

- (OS_dispatch_queue)metalSubmissionQueue
{
  return self->_metalSubmissionQueue;
}

- (OS_dispatch_queue)metalCompletionQueue
{
  return self->_metalCompletionQueue;
}

- (uint64_t)_processJobsFromFramebuffer:(uint64_t)a3 usingInputSampleBuffer:(uint64_t)a4 inferencePropagationHandler:(long long *)a5 atExecutionTime:(void *)a6 forConnection:
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v20 = result;
  if (result)
  {
    if (!atomic_load(a2 + 3))
    {
      v19 = [a6 coordinationGroup];
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      v8 = (void *)[a2 jobs];
      result = [v8 countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (result)
      {
        uint64_t v9 = result;
        unsigned __int8 v10 = 0;
        uint64_t v11 = *(void *)v30;
        v18 = v26;
        do
        {
          uint64_t v12 = 0;
          do
          {
            if (*(void *)v30 != v11) {
              objc_enumerationMutation(v8);
            }
            uint64_t v13 = *(void *)(*((void *)&v29 + 1) + 8 * v12);
            int v14 = atomic_load((unsigned __int8 *)(v13 + 22));
            if (v14 == 1)
            {
              int v15 = *(unsigned __int8 *)(v13 + 20);
              if (v15 != v10)
              {
                v16 = -[BWInferenceScheduler _queueForJob:fromConnection:](v20, *(void *)(*((void *)&v29 + 1) + 8 * v12), a6);
                uint64_t v17 = objc_msgSend(a6, "completionQueue", v18);
                block[0] = MEMORY[0x1E4F143A8];
                block[1] = 3221225472;
                v26[0] = __133__BWInferenceScheduler__processJobsFromFramebuffer_usingInputSampleBuffer_inferencePropagationHandler_atExecutionTime_forConnection___block_invoke;
                v26[1] = &unk_1E5C2AD70;
                v26[2] = a2;
                v26[3] = v19;
                v26[8] = v13;
                v26[9] = a3;
                long long v27 = *a5;
                uint64_t v28 = *((void *)a5 + 2);
                v26[4] = v17;
                v26[5] = v20;
                v26[6] = a6;
                v26[7] = a4;
                dispatch_group_async(v19, v16, block);
                unsigned __int8 v10 = v15;
              }
            }
            ++v12;
          }
          while (v9 != v12);
          result = [v8 countByEnumeratingWithState:&v29 objects:v33 count:16];
          uint64_t v9 = result;
        }
        while (result);
      }
    }
  }
  return result;
}

- (int)performInferencesForConnection:(unint64_t)a3 usingInputSampleBuffer:(opaqueCMSampleBuffer *)a4 attachingResultsToSampleBuffer:(opaqueCMSampleBuffer *)a5 skippingInferencesWithTypes:(id)a6
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  p_connectionsLock = &self->_connectionsLock;
  os_unfair_lock_lock(&self->_connectionsLock);
  v45 = self;
  id v12 = [(NSMapTable *)self->_connectionsByIdentifier objectForKey:a3];
  id v13 = (id)[v12 framebuffer];
  group = (id)[v12 coordinationGroup];
  os_unfair_lock_unlock(p_connectionsLock);
  CFDictionaryRef v14 = (const __CFDictionary *)CMGetAttachment(a4, (CFStringRef)*MEMORY[0x1E4F530C0], 0);
  memset(&v71, 0, sizeof(v71));
  if (v14) {
    CMTimeMakeFromDictionary(&v71, v14);
  }
  else {
    CMSampleBufferGetPresentationTimeStamp(&v71, a4);
  }
  id v15 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F28E10]), "initWithKeyOptions:valueOptions:capacity:", 0, 0, objc_msgSend((id)objc_msgSend(v13, "jobs"), "count"));
  id v16 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v17 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v18 = (void *)[v13 graph];
  v69[0] = MEMORY[0x1E4F143A8];
  v69[1] = 3221225472;
  v69[2] = __137__BWInferenceScheduler_performInferencesForConnection_usingInputSampleBuffer_attachingResultsToSampleBuffer_skippingInferencesWithTypes___block_invoke;
  v69[3] = &unk_1E5C2ACD0;
  v69[4] = v15;
  v69[5] = a6;
  CMTime v70 = v71;
  v69[6] = v17;
  v69[7] = v16;
  v69[8] = v13;
  v69[9] = a4;
  [v18 visitProvidersWithBlock:v69];
  id v19 = (id)[v16 mutableCopy];
  [v19 minusSet:v17];
  v68[0] = MEMORY[0x1E4F143A8];
  v68[1] = 3221225472;
  v68[2] = __137__BWInferenceScheduler_performInferencesForConnection_usingInputSampleBuffer_attachingResultsToSampleBuffer_skippingInferencesWithTypes___block_invoke_3;
  v68[3] = &unk_1E5C2ACF8;
  v68[4] = v15;
  v68[5] = v19;
  [v13 resetJobStatesWithPreventionBlock:v68];
  id v20 = (id)objc_msgSend((id)CMGetAttachment(a5, @"Inferences", 0), "mutableCopy");
  if (!v20) {
    id v20 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  v58[0] = MEMORY[0x1E4F143A8];
  v58[1] = 3221225472;
  v59 = __137__BWInferenceScheduler_performInferencesForConnection_usingInputSampleBuffer_attachingResultsToSampleBuffer_skippingInferencesWithTypes___block_invoke_4;
  v60 = &unk_1E5C2AD20;
  id v61 = v13;
  id v62 = v15;
  v65 = a4;
  v66 = a5;
  v44 = a5;
  CMTime v67 = v71;
  id v63 = v19;
  id v64 = v20;
  v48 = v20;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  v47 = (unsigned int *)v13;
  v21 = (void *)[v13 jobs];
  uint64_t v22 = [v21 countByEnumeratingWithState:&v54 objects:v73 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v55;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v55 != v24) {
          objc_enumerationMutation(v21);
        }
        uint64_t v26 = *(void *)(*((void *)&v54 + 1) + 8 * i);
        long long v27 = *(void **)(v26 + 8);
        int v28 = atomic_load((unsigned __int8 *)(v26 + 22));
        if (v28 == 4)
        {
          atomic_compare_exchange_strong((atomic_uchar *volatile)(v26 + 22), (unsigned __int8 *)&v28, 2u);
          if (v28 != 4) {
            continue;
          }
          goto LABEL_18;
        }
        if (v28 == 1)
        {
          long long v29 = (void *)[*(id *)v26 extractable];
          if (v29)
          {
            int v30 = 1;
            atomic_compare_exchange_strong((atomic_uchar *volatile)(v26 + 22), (unsigned __int8 *)&v30, 2u);
            if (v30 == 1)
            {
              int v31 = [v29 extractFromSampleBuffer:a4 usingVideoRequirements:0 metadataRequirements:0 toStorage:v27];
              if (v31)
              {
                int v40 = v31;
                v42 = v47;
                v41 = v12;
                v43 = group;
                goto LABEL_33;
              }
LABEL_18:
              v59((uint64_t)v58, v26);
              [v27 clear];
              continue;
            }
          }
        }
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v54 objects:v73 count:16];
    }
    while (v23);
  }
  CMTime v53 = v71;
  v42 = v47;
  v41 = v12;
  -[BWInferenceScheduler _processJobsFromFramebuffer:usingInputSampleBuffer:inferencePropagationHandler:atExecutionTime:forConnection:]((uint64_t)v45, v47, (uint64_t)a4, (uint64_t)v58, (long long *)&v53.value, v12);
  v43 = group;
  dispatch_group_wait(group, 0xFFFFFFFFFFFFFFFFLL);
  int v40 = atomic_load(v47 + 3);
  if (v40)
  {
LABEL_33:
    v37 = v48;
  }
  else
  {
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v32 = (void *)[v47 jobs];
    uint64_t v33 = [v32 countByEnumeratingWithState:&v49 objects:v72 count:16];
    if (v33)
    {
      uint64_t v34 = v33;
      uint64_t v35 = *(void *)v50;
      do
      {
        for (uint64_t j = 0; j != v34; ++j)
        {
          if (*(void *)v50 != v35) {
            objc_enumerationMutation(v32);
          }
          [*(id *)(*(void *)(*((void *)&v49 + 1) + 8 * j) + 8) clear];
        }
        uint64_t v34 = [v32 countByEnumeratingWithState:&v49 objects:v72 count:16];
      }
      while (v34);
    }
    v37 = v48;
    if ([v48 count])
    {
      v38 = (void *)[v48 copy];
      CMSetAttachment(v44, @"Inferences", v38, 1u);

      v37 = v48;
    }
    int v40 = 0;
  }

  return v40;
}

uint64_t __137__BWInferenceScheduler_performInferencesForConnection_usingInputSampleBuffer_attachingResultsToSampleBuffer_skippingInferencesWithTypes___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6 = [*(id *)(a1 + 32) objectForKey:a2];
  uint64_t result = [a2 conformsToProtocol:&unk_1EFB10F68];
  if (!result) {
    goto LABEL_14;
  }
  if (!v6)
  {
    if ([*(id *)(a1 + 40) count]
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && objc_msgSend(*(id *)(a1 + 40), "containsObject:", objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(a2, "inferenceType"))))
    {
      uint64_t v6 = 0x1EFA6A040;
    }
    else
    {
      uint64_t v8 = *(void *)(a1 + 72);
      long long v12 = *(_OWORD *)(a1 + 80);
      uint64_t v13 = *(void *)(a1 + 96);
      uint64_t v6 = [a2 preventionReasonWithSampleBuffer:v8 executionTime:&v12];
      if (!v6) {
        goto LABEL_9;
      }
    }
    [*(id *)(a1 + 32) setObject:v6 forKey:a2];
  }
LABEL_9:
  if ([*(id *)(a1 + 32) objectForKey:a2] || !objc_msgSend(a2, "mustExecuteWhenAllowed")) {
    uint64_t v9 = (id *)(a1 + 56);
  }
  else {
    uint64_t v9 = (id *)(a1 + 48);
  }
  uint64_t result = [*v9 unionSet:a3];
LABEL_14:
  if (v6)
  {
    unsigned __int8 v10 = (void *)[*(id *)(a1 + 64) graph];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __137__BWInferenceScheduler_performInferencesForConnection_usingInputSampleBuffer_attachingResultsToSampleBuffer_skippingInferencesWithTypes___block_invoke_2;
    v11[3] = &unk_1E5C2ACA8;
    v11[4] = *(void *)(a1 + 32);
    v11[5] = v6;
    return [v10 enumerateVideoDestinationsFromJob:a2 withBlock:v11];
  }
  return result;
}

uint64_t __137__BWInferenceScheduler_performInferencesForConnection_usingInputSampleBuffer_attachingResultsToSampleBuffer_skippingInferencesWithTypes___block_invoke_3(uint64_t a1, void *a2)
{
  v3 = (void *)*a2;
  uint64_t v4 = [*(id *)(a1 + 32) objectForKey:*a2];
  int v5 = [v3 conformsToProtocol:&unk_1EFB10F68];
  unsigned int v6 = [*(id *)(a1 + 40) containsObject:v3];
  if (v4) {
    int v7 = v5;
  }
  else {
    int v7 = 0;
  }
  return v7 | v6;
}

- (int)prepareForInferenceRequirements:(id)a3 dependencyProviderSource:(id)a4 formatProvider:(id)a5 pixelBufferPoolProvider:(id)a6 connection:(unint64_t)a7 backPressureDrivenPipelining:(BOOL)a8
{
  BOOL v8 = a8;
  uint64_t v98 = *MEMORY[0x1E4F143B8];
  long long v12 = [[BWInferenceSchedulerFramebufferBuilder alloc] initWithInferenceRequirements:a3 dependencyProvider:a4 formatProvider:a5];
  id v13 = [(BWInferenceSchedulerFramebufferBuilder *)v12 newFramebuffer];

  if (!v13)
  {
    LODWORD(v30) = -31760;

    goto LABEL_65;
  }
  BOOL v54 = v8;
  os_unfair_lock_lock(&self->_connectionsLock);
  id v14 = [(NSMapTable *)self->_connectionsByIdentifier objectForKey:a7];
  long long v55 = v13;
  [v14 setFramebuffer:v13];
  long long v57 = v14;
  id v15 = v14;
  os_unfair_lock_unlock(&self->_connectionsLock);
  id v16 = (void *)[a4 providedVideoRequirementsByAttachedMediaKey];
  id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v88 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  obuint64_t j = v16;
  uint64_t v18 = [v16 countByEnumeratingWithState:&v88 objects:v97 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v89;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v89 != v20) {
          objc_enumerationMutation(obj);
        }
        uint64_t v22 = [obj objectForKeyedSubscript:*(void *)(*((void *)&v88 + 1) + 8 * i)];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v17 addObject:v22];
        }
      }
      uint64_t v19 = [obj countByEnumeratingWithState:&v88 objects:v97 count:16];
    }
    while (v19);
  }
  uint64_t v23 = (void *)[MEMORY[0x1E4F1CA80] set];
  CMTime v67 = (void *)[v57 coordinator];
  long long v84 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  id v56 = (id)[v55 jobs];
  uint64_t v59 = [v56 countByEnumeratingWithState:&v84 objects:v96 count:16];
  if (v59)
  {
    uint64_t v58 = *(void *)v85;
LABEL_13:
    uint64_t v24 = 0;
LABEL_14:
    if (*(void *)v85 != v58) {
      objc_enumerationMutation(v56);
    }
    v25 = *(id **)(*((void *)&v84 + 1) + 8 * v24);
    id v26 = *v25;
    long long v27 = (void *)[*v25 submittable];
    int v28 = (void *)[v26 executable];
    if (v27)
    {
      int v29 = objc_msgSend(v27, "prepareForSubmissionWithWorkQueue:", objc_msgSend(v57, "completionQueue"));
    }
    else
    {
      if (!v28)
      {
LABEL_21:
        uint64_t v31 = [v26 newStorage];
        v25[1] = (id)v31;
        if (v31)
        {
          uint64_t v60 = v24;
          long long v82 = 0u;
          long long v83 = 0u;
          long long v80 = 0u;
          long long v81 = 0u;
          id v62 = v25;
          id v63 = (id)[v25[1] requirementsNeedingPixelBufferPools];
          uint64_t v32 = [v63 countByEnumeratingWithState:&v80 objects:v95 count:16];
          if (!v32) {
            goto LABEL_43;
          }
          uint64_t v33 = v32;
          uint64_t v64 = *(void *)v81;
          while (1)
          {
            for (uint64_t j = 0; j != v33; ++j)
            {
              if (*(void *)v81 != v64) {
                objc_enumerationMutation(v63);
              }
              uint64_t v35 = *(void **)(*((void *)&v80 + 1) + 8 * j);
              v36 = objc_msgSend(obj, "objectForKeyedSubscript:", objc_msgSend(v35, "attachedMediaKey"));
              v37 = v36;
              if ([v36 isEqual:v35])
              {
LABEL_38:
                uint64_t v43 = [v37 attachedMediaKey];
                if (v43)
                {
                  objc_msgSend(v62[1], "setPixelBufferPool:forRequirement:", objc_msgSend(a6, "preparedOutputPixelBufferPoolForAttachedMediaKey:format:", v43, objc_msgSend((id)objc_msgSend(v36, "videoFormat"), "underlyingVideoFormat")), v35);
                  continue;
                }
              }
              else
              {
                long long v78 = 0u;
                long long v79 = 0u;
                long long v76 = 0u;
                long long v77 = 0u;
                uint64_t v38 = [v17 countByEnumeratingWithState:&v76 objects:v94 count:16];
                if (v38)
                {
                  uint64_t v39 = v38;
                  uint64_t v40 = *(void *)v77;
                  while (2)
                  {
                    v41 = v23;
                    for (uint64_t k = 0; k != v39; ++k)
                    {
                      if (*(void *)v77 != v40) {
                        objc_enumerationMutation(v17);
                      }
                      v37 = *(void **)(*((void *)&v76 + 1) + 8 * k);
                      if (objc_msgSend((id)objc_msgSend(v37, "sourceVideoRequirement"), "isEqual:", v35))
                      {
                        uint64_t v23 = v41;
                        goto LABEL_38;
                      }
                    }
                    uint64_t v39 = [v17 countByEnumeratingWithState:&v76 objects:v94 count:16];
                    uint64_t v23 = v41;
                    if (v39) {
                      continue;
                    }
                    break;
                  }
                }
              }
              objc_msgSend(v67, "requestPixelBufferPoolForRequirement:size:", v35, objc_msgSend(v35, "count"));
              objc_msgSend(v23, "addObject:", objc_msgSend(v35, "attachedMediaKey"));
            }
            uint64_t v33 = [v63 countByEnumeratingWithState:&v80 objects:v95 count:16];
            if (!v33)
            {
LABEL_43:
              uint64_t v24 = v60 + 1;
              if (v60 + 1 == v59)
              {
                uint64_t v59 = [v56 countByEnumeratingWithState:&v84 objects:v96 count:16];
                if (!v59) {
                  goto LABEL_45;
                }
                goto LABEL_13;
              }
              goto LABEL_14;
            }
          }
        }
        LODWORD(v30) = -31702;
        goto LABEL_63;
      }
      int v29 = [v28 prepareForExecution];
    }
    LODWORD(v30) = v29;
    if (v29) {
      goto LABEL_63;
    }
    goto LABEL_21;
  }
LABEL_45:
  [v67 preparePixelBufferPoolsWithBackPressureDrivenPipelining:v54];
  long long v74 = 0u;
  long long v75 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  id v13 = v55;
  id obja = (id)[v55 jobs];
  uint64_t v30 = [obja countByEnumeratingWithState:&v72 objects:v93 count:16];
  if (v30)
  {
    uint64_t v44 = *(void *)v73;
    do
    {
      for (uint64_t m = 0; m != v30; ++m)
      {
        if (*(void *)v73 != v44) {
          objc_enumerationMutation(obja);
        }
        uint64_t v46 = *(void *)(*((void *)&v72 + 1) + 8 * m);
        long long v68 = 0u;
        long long v69 = 0u;
        long long v70 = 0u;
        long long v71 = 0u;
        v47 = (void *)[*(id *)(v46 + 8) requirementsNeedingPixelBufferPools];
        uint64_t v48 = [v47 countByEnumeratingWithState:&v68 objects:v92 count:16];
        if (v48)
        {
          uint64_t v49 = v48;
          uint64_t v50 = *(void *)v69;
          do
          {
            for (uint64_t n = 0; n != v49; ++n)
            {
              if (*(void *)v69 != v50) {
                objc_enumerationMutation(v47);
              }
              long long v52 = *(void **)(*((void *)&v68 + 1) + 8 * n);
              if (objc_msgSend(v23, "containsObject:", objc_msgSend(v52, "attachedMediaKey"))) {
                objc_msgSend(*(id *)(v46 + 8), "setPixelBufferPool:forRequirement:", objc_msgSend(v67, "pixelBufferPoolForFormat:", objc_msgSend(v52, "videoFormat")), v52);
              }
            }
            uint64_t v49 = [v47 countByEnumeratingWithState:&v68 objects:v92 count:16];
          }
          while (v49);
        }
      }
      uint64_t v30 = [obja countByEnumeratingWithState:&v72 objects:v93 count:16];
    }
    while (v30);
LABEL_63:
    id v13 = v55;
  }

LABEL_65:
  return v30;
}

+ (void)initialize
{
}

- (void)dealloc
{
  p_connectionsLocuint64_t k = &self->_connectionsLock;
  os_unfair_lock_lock(&self->_connectionsLock);

  os_unfair_lock_unlock(p_connectionsLock);
  dispatch_release((dispatch_object_t)self->_inferenceWorkloop);
  dispatch_release((dispatch_object_t)self->_scalingWorkloop);
  dispatch_release((dispatch_object_t)self->_submissionWorkloop);
  dispatch_release((dispatch_object_t)self->_completionWorkloop);
  dispatch_release((dispatch_object_t)self->_metalSubmissionQueue);
  dispatch_release((dispatch_object_t)self->_metalCompletionQueue);
  v4.receiver = self;
  v4.super_class = (Class)BWInferenceScheduler;
  [(BWInferenceScheduler *)&v4 dealloc];
}

- (void)unregisterInferenceConnection:(unint64_t)a3
{
  p_connectionsLocuint64_t k = &self->_connectionsLock;
  os_unfair_lock_lock(&self->_connectionsLock);
  [(NSMapTable *)self->_connectionsByIdentifier removeObjectForKey:a3];
  os_unfair_lock_unlock(p_connectionsLock);
}

uint64_t __137__BWInferenceScheduler_performInferencesForConnection_usingInputSampleBuffer_attachingResultsToSampleBuffer_skippingInferencesWithTypes___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObject:*(void *)(a1 + 40) forKey:a3];
}

void __137__BWInferenceScheduler_performInferencesForConnection_usingInputSampleBuffer_attachingResultsToSampleBuffer_skippingInferencesWithTypes___block_invoke_4(uint64_t a1, uint64_t a2)
{
  int v2 = 2;
  atomic_compare_exchange_strong((atomic_uchar *volatile)(a2 + 22), (unsigned __int8 *)&v2, 3u);
  if (v2 == 2)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
    id v5 = *(id *)a2;
    unsigned int v6 = *(void **)(a2 + 8);
    int v7 = (void *)[*(id *)a2 propagatable];
    BOOL v8 = (void *)[*(id *)(a1 + 32) graph];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __137__BWInferenceScheduler_performInferencesForConnection_usingInputSampleBuffer_attachingResultsToSampleBuffer_skippingInferencesWithTypes___block_invoke_5;
    v19[3] = &unk_1E5C2ACA8;
    v19[4] = *(void *)(a1 + 32);
    v19[5] = v6;
    [v8 enumerateVideoDestinationsFromJob:v5 withBlock:v19];
    if (v7)
    {
      uint64_t v9 = (void *)[*(id *)(a1 + 40) objectForKey:v5];
      if (([v9 isEqualToString:@"Scheduling"] & 1) == 0)
      {
        uint64_t v10 = [v5 type];
        uint64_t v11 = [v6 inferenceStorage];
        if (v9 || (uint64_t v12 = v11, ([*(id *)(a1 + 48) containsObject:v5] & 1) != 0))
        {
          id v13 = [BWInferenceResult alloc];
          long long v17 = *(_OWORD *)(a1 + 80);
          uint64_t v18 = *(void *)(a1 + 96);
          id v14 = [(BWInferenceResult *)v13 initWithInferenceType:v10 preventionReason:v9 atTimestamp:&v17];
        }
        else
        {
          id v15 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
          [v7 propagateInferenceResultsToInferenceDictionary:v15 usingStorage:v12 inputSampleBuffer:*(void *)(a1 + 64) propagationSampleBuffer:*(void *)(a1 + 72)];
          id v16 = [BWInferenceResult alloc];
          long long v17 = *(_OWORD *)(a1 + 80);
          uint64_t v18 = *(void *)(a1 + 96);
          id v14 = [(BWInferenceResult *)v16 initWithInferenceType:v10 inferences:v15 atTimestamp:&v17];
        }
        objc_msgSend(*(id *)(a1 + 56), "setObject:forKey:", v14, objc_msgSend(NSNumber, "numberWithInt:", v10));
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  }
}

uint64_t __137__BWInferenceScheduler_performInferencesForConnection_usingInputSampleBuffer_attachingResultsToSampleBuffer_skippingInferencesWithTypes___block_invoke_5(uint64_t a1, void *a2, uint64_t a3, unsigned int a4, void *a5)
{
  uint64_t result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "jobs"), "jobAtIndex:", a4);
  if (!atomic_load((unsigned __int8 *)(result + 22)))
  {
    uint64_t v10 = result;
    uint64_t v11 = *(void **)(result + 8);
    uint64_t v12 = [*(id *)(a1 + 40) pixelBufferForRequirement:a2];
    if (v12
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && (uint64_t v12 = objc_msgSend(*(id *)(a1 + 40), "pixelBufferForRequirement:", objc_msgSend(a2, "uncompressedRequirement"))) != 0|| (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)&& (uint64_t v12 = objc_msgSend(*(id *)(a1 + 40), "pixelBufferForRequirement:", objc_msgSend(a2, "sourceVideoRequirement"))) != 0)
    {
      [v11 setPixelBuffer:v12 forRequirement:a5];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(v11, "setPixelBuffer:forRequirement:", v12, objc_msgSend(a5, "uncompressedRequirement"));
      }
      char v13 = 0;
      unsigned int v14 = 0;
    }
    else
    {
      unsigned int v14 = -31717;
      char v13 = 1;
    }
    uint64_t result = objc_msgSend(v11, "setInputSampleBufferAttachments:", objc_msgSend(*(id *)(a1 + 40), "inputSampleBufferAttachments"));
    if (v13)
    {
      atomic_store(v14, (unsigned int *)(*(void *)(a1 + 32) + 12));
    }
    else if (atomic_fetch_add((atomic_uchar *volatile)(v10 + 23), 0xFFu) == 1)
    {
      char v15 = 0;
      atomic_compare_exchange_strong((atomic_uchar *volatile)(v10 + 22), (unsigned __int8 *)&v15, 1u);
    }
  }
  return result;
}

- (uint64_t)_queueForJob:(void *)a3 fromConnection:
{
  if (a1)
  {
    switch(*(unsigned char *)(a2 + 20))
    {
      case 0:
        id v5 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v6 = *MEMORY[0x1E4F1C3A8];
        int v7 = @"Attemped to get a target queue for a job with BWInferenceSchedulerJobTypeInvalid";
        goto LABEL_16;
      case 1:
        id v5 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v6 = *MEMORY[0x1E4F1C3A8];
        int v7 = @"Attempted to get a target queue for a job with BWInferenceSchedulerJobTypeExtractor. Extractors are expected to run synchronously on the calling thread";
LABEL_16:
        objc_exception_throw((id)[v5 exceptionWithName:v6 reason:v7 userInfo:0]);
      case 2:
        if ([*(id *)a2 submittable])
        {
          return [a3 submissionQueue];
        }
        else
        {
          return [a3 inferenceQueue];
        }
      case 3:
        return [a3 scalingQueue];
      default:
        return 0;
    }
  }
  return 0;
}

uint64_t __133__BWInferenceScheduler__processJobsFromFramebuffer_usingInputSampleBuffer_inferencePropagationHandler_atExecutionTime_forConnection___block_invoke(uint64_t result)
{
  if (!atomic_load((unsigned int *)(*(void *)(result + 32) + 12)))
  {
    uint64_t v2 = result;
    int v3 = 1;
    atomic_compare_exchange_strong((atomic_uchar *volatile)(*(void *)(result + 80) + 22), (unsigned __int8 *)&v3, 2u);
    if (v3 == 1)
    {
      dispatch_group_enter(*(dispatch_group_t *)(result + 40));
      uint64_t v5 = *(void *)(v2 + 80);
      uint64_t v4 = *(void *)(v2 + 88);
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __133__BWInferenceScheduler__processJobsFromFramebuffer_usingInputSampleBuffer_inferencePropagationHandler_atExecutionTime_forConnection___block_invoke_2;
      v14[3] = &unk_1E5C2AD48;
      uint64_t v6 = *(void *)(v2 + 48);
      uint64_t v7 = *(void *)(v2 + 32);
      uint64_t v8 = *(void *)(v2 + 40);
      v14[4] = *(void *)(v2 + 56);
      v14[5] = v7;
      uint64_t v16 = *(void *)(v2 + 112);
      uint64_t v9 = *(void *)(v2 + 64);
      v14[8] = *(void *)(v2 + 72);
      v14[9] = v4;
      long long v15 = *(_OWORD *)(v2 + 96);
      v14[10] = v5;
      v14[6] = v9;
      v14[7] = v8;
      long long v12 = *(_OWORD *)(v2 + 96);
      uint64_t v13 = *(void *)(v2 + 112);
      uint64_t v10 = *(void *)(v5 + 8);
      uint64_t v11 = (void *)[*(id *)v5 submittable];
      uint64_t result = [*(id *)v5 executable];
      if (v11)
      {
        uint64_t v19 = MEMORY[0x1E4F143A8];
        uint64_t v20 = 3221225472;
        v21 = __scheduler_job_invoke_block_invoke;
        uint64_t v22 = &unk_1E5C2AD98;
        uint64_t v23 = v14;
        uint64_t v24 = v5;
        long long v17 = v12;
        uint64_t v18 = v13;
        return [v11 submitForSampleBuffer:v4 usingStorage:v10 withSubmissionTime:&v17 workQueue:v6 completionHandler:&v19];
      }
      else if (result)
      {
        uint64_t v19 = MEMORY[0x1E4F143A8];
        uint64_t v20 = 3221225472;
        v21 = __scheduler_job_invoke_block_invoke_2;
        uint64_t v22 = &unk_1E5C2AD98;
        uint64_t v23 = v14;
        uint64_t v24 = v5;
        long long v17 = v12;
        uint64_t v18 = v13;
        return [(id)result executeOnSampleBuffer:v4 usingStorage:v10 withExecutionTime:&v17 completionHandler:&v19];
      }
    }
  }
  return result;
}

void __133__BWInferenceScheduler__processJobsFromFramebuffer_usingInputSampleBuffer_inferencePropagationHandler_atExecutionTime_forConnection___block_invoke_2(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    atomic_store(a2, (unsigned int *)(*(void *)(a1 + 40) + 12));
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 64);
    uint64_t v5 = *(void *)(a1 + 72);
    uint64_t v7 = *(void *)(a1 + 48);
    long long v9 = *(_OWORD *)(a1 + 88);
    uint64_t v10 = *(void *)(a1 + 104);
    -[BWInferenceScheduler _processJobsFromFramebuffer:usingInputSampleBuffer:inferencePropagationHandler:atExecutionTime:forConnection:](v3, v4, v5, v6, &v9, v7);
  }
  [*(id *)(*(void *)(a1 + 80) + 8) clear];
  uint64_t v8 = *(NSObject **)(a1 + 56);
  dispatch_group_leave(v8);
}

@end