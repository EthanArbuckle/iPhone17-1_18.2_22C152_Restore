@interface VNRequestPerformer
+ (id)_requestPerformingQueuePriorityGroup1;
+ (id)_requestPerformingQueuePriorityGroup2;
- (BOOL)_performOrderedRequests:(id)a3 inContext:(id)a4 error:(id *)a5;
- (BOOL)_performRequests:(id)a3 onBehalfOfRequest:(id)a4 inContext:(id)a5 error:(id *)a6;
- (BOOL)_validateAndPrepareRequests:(id)a3 error:(id *)a4;
- (BOOL)performDependentRequests:(id)a3 onBehalfOfRequest:(id)a4 inContext:(id)a5 error:(id *)a6;
- (BOOL)performRequests:(id)a3 inContext:(id)a4 error:(id *)a5;
- (VNRequestPerformer)init;
- (id)dependencyAnalyzedRequestsForRequests:(id)a3 withPerformingContext:(id)a4 error:(id *)a5;
- (id)getCurrentTrackersAndReset;
- (id)orderedRequestsForRequests:(id)a3;
- (id)previousSequencedObservationsForRequest:(id)a3;
- (void)_groupOrderedRequests:(id)a3 ordinality:(id)a4 ordinalityAndPriorityGroups:(id)a5;
- (void)_groupsRequestsWithTheSameOrdinality:(id)a3 priorityGroup1:(id)a4 priorityGroup2:(id)a5;
- (void)cancelAllRequests;
- (void)recordSequencedObservationsForRequest:(id)a3;
- (void)recordTracker:(id)a3;
@end

@implementation VNRequestPerformer

uint64_t __49__VNRequestPerformer_orderedRequestsForRequests___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = [v4 dependencyProcessingOrdinality];
  uint64_t v7 = [v5 dependencyProcessingOrdinality];
  if (v6 < v7) {
    uint64_t v8 = -1;
  }
  else {
    uint64_t v8 = v6 != v7;
  }

  return v8;
}

- (id)dependencyAnalyzedRequestsForRequests:(id)a3 withPerformingContext:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __88__VNRequestPerformer_dependencyAnalyzedRequestsForRequests_withPerformingContext_error___block_invoke;
  v29[3] = &unk_1E5B1F288;
  id v9 = v8;
  id v30 = v9;
  v10 = [v7 indexesOfObjectsPassingTest:v29];
  if ([v10 count])
  {
    v11 = [v7 objectsAtIndexes:v10];
    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v13 = objc_opt_class();
    id v14 = v12;
    v15 = [v13 compoundRequestsForOriginalRequests:v11 withPerformingContext:v9 error:a5];
    id v16 = v14;
    if (!v15) {
      goto LABEL_9;
    }
    [v14 addObjectsFromArray:v15];

    v17 = objc_opt_class();
    id v16 = v14;
    v18 = [v17 compoundRequestsForOriginalRequests:v11 withPerformingContext:v9 error:a5];
    if (!v18) {
      goto LABEL_9;
    }
    [v16 addObjectsFromArray:v18];

    v19 = objc_opt_class();
    id v16 = v16;
    v20 = [v19 compoundRequestsForOriginalRequests:v11 withPerformingContext:v9 error:a5];
    if (!v20) {
      goto LABEL_9;
    }
    [v16 addObjectsFromArray:v20];

    v21 = objc_opt_class();
    id v16 = v16;
    v22 = [v21 compoundRequestsForOriginalRequests:v11 withPerformingContext:v9 error:a5];
    if (!v22) {
      goto LABEL_9;
    }
    [v16 addObjectsFromArray:v22];

    v23 = objc_opt_class();
    id v16 = v16;
    v24 = [v23 compoundRequestsForOriginalRequests:v11 withPerformingContext:v9 error:a5];
    if (!v24) {
      goto LABEL_9;
    }
    [v16 addObjectsFromArray:v24];

    v25 = objc_opt_class();
    id v16 = v16;
    v26 = [v25 compoundRequestsForOriginalRequests:v11 withPerformingContext:v9 error:a5];
    if (v26)
    {
      [v16 addObjectsFromArray:v26];

      id v27 = [v7 arrayByAddingObjectsFromArray:v16];
    }
    else
    {
LABEL_9:

      id v27 = 0;
    }
  }
  else
  {
    id v27 = v7;
  }

  return v27;
}

BOOL __88__VNRequestPerformer_dependencyAnalyzedRequestsForRequests_withPerformingContext_error___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = [*(id *)(a1 + 32) cachedObservationsAcceptedByRequest:a2];
  BOOL v3 = v2 == 0;

  return v3;
}

- (VNRequestPerformer)init
{
  v14.receiver = self;
  v14.super_class = (Class)VNRequestPerformer;
  v2 = [(VNRequestPerformer *)&v14 init];
  BOOL v3 = v2;
  if (v2)
  {
    v2->_requestLock._os_unfair_lock_opaque = 0;
    id v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    requestsPending = v3->_requestsPending;
    v3->_requestsPending = v4;

    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    requestsInFlight = v3->_requestsInFlight;
    v3->_requestsInFlight = v6;

    v3->_trackersInFlightLock._os_unfair_lock_opaque = 0;
    id v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    trackersInFlight = v3->_trackersInFlight;
    v3->_trackersInFlight = v8;

    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    sequencedRequestObservations = v3->_sequencedRequestObservations;
    v3->_sequencedRequestObservations = v10;

    id v12 = v3;
  }

  return v3;
}

- (id)orderedRequestsForRequests:(id)a3
{
  BOOL v3 = [a3 sortedArrayWithOptions:16 usingComparator:&__block_literal_global_80];

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sequencedRequestObservations, 0);
  objc_storeStrong((id *)&self->_trackersInFlight, 0);
  objc_storeStrong((id *)&self->_requestsPending, 0);

  objc_storeStrong((id *)&self->_requestsInFlight, 0);
}

- (void)cancelAllRequests
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  BOOL v3 = (void *)MEMORY[0x1A6257080](self, a2);
  p_requestLock = &self->_requestLock;
  os_unfair_lock_lock(&self->_requestLock);
  id v5 = (void *)[(NSMutableArray *)self->_requestsInFlight copy];
  os_unfair_lock_unlock(p_requestLock);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * v9);
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = __39__VNRequestPerformer_cancelAllRequests__block_invoke;
        v11[3] = &unk_1E5B1F2D0;
        v11[4] = v10;
        VNExecuteBlock(v11, 0);
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

uint64_t __39__VNRequestPerformer_cancelAllRequests__block_invoke(uint64_t a1)
{
  return 1;
}

- (id)getCurrentTrackersAndReset
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  os_unfair_lock_lock(&self->_trackersInFlightLock);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = self->_trackersInFlight;
  uint64_t v5 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "objectAndReturnError:", 0, (void)v10);
        if (v8) {
          [v3 addObject:v8];
        }
      }
      uint64_t v5 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  [(NSMutableSet *)self->_trackersInFlight removeAllObjects];
  os_unfair_lock_unlock(&self->_trackersInFlightLock);

  return v3;
}

- (void)recordTracker:(id)a3
{
  id v5 = a3;
  os_unfair_lock_lock(&self->_trackersInFlightLock);
  id v4 = [[VNWeakTypeWrapper alloc] initWithObject:v5];
  [(NSMutableSet *)self->_trackersInFlight addObject:v4];
  os_unfair_lock_unlock(&self->_trackersInFlightLock);
}

- (id)previousSequencedObservationsForRequest:(id)a3
{
  id v4 = [a3 sequencedRequestPreviousObservationsKey];
  id v5 = [(NSMutableDictionary *)self->_sequencedRequestObservations objectForKey:v4];

  return v5;
}

- (void)recordSequencedObservationsForRequest:(id)a3
{
  id v7 = a3;
  if ([v7 wantsSequencedRequestObservationsRecording])
  {
    id v4 = [v7 sequencedRequestPreviousObservationsKey];
    if (v4)
    {
      sequencedRequestObservations = self->_sequencedRequestObservations;
      uint64_t v6 = [v7 results];
      [(NSMutableDictionary *)sequencedRequestObservations setObject:v6 forKey:v4];
    }
  }
}

- (BOOL)performDependentRequests:(id)a3 onBehalfOfRequest:(id)a4 inContext:(id)a5 error:(id *)a6
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  v19 = v10;
  BOOL v12 = [(VNRequestPerformer *)self _performRequests:v10 onBehalfOfRequest:v11 inContext:a5 error:a6];
  if (v12)
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v13 = v10;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v23 != v15) {
            objc_enumerationMutation(v13);
          }
          uint64_t v17 = [*(id *)(*((void *)&v22 + 1) + 8 * i) warnings];
          v20[0] = MEMORY[0x1E4F143A8];
          v20[1] = 3221225472;
          v20[2] = __81__VNRequestPerformer_performDependentRequests_onBehalfOfRequest_inContext_error___block_invoke;
          v20[3] = &unk_1E5B1FD68;
          id v21 = v11;
          [v17 enumerateKeysAndObjectsUsingBlock:v20];
        }
        uint64_t v14 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v14);
    }
  }
  return v12;
}

uint64_t __81__VNRequestPerformer_performDependentRequests_onBehalfOfRequest_inContext_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) recordWarning:a2 value:a3];
}

- (BOOL)performRequests:(id)a3 inContext:(id)a4 error:(id *)a5
{
  return [(VNRequestPerformer *)self _performRequests:a3 onBehalfOfRequest:0 inContext:a4 error:a5];
}

- (BOOL)_performOrderedRequests:(id)a3 inContext:(id)a4 error:(id *)a5
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v43 = a3;
  id v44 = a4;
  [v44 qosClass];
  p_requestLock = &self->_requestLock;
  os_unfair_lock_lock(&self->_requestLock);
  [(NSMutableArray *)self->_requestsPending addObjectsFromArray:v43];
  v60 = self;
  os_unfair_lock_unlock(&self->_requestLock);
  uint64_t v9 = [v44 requestForensics];
  if ([v43 count] == 1)
  {
    id v10 = [v43 firstObject];
    os_unfair_lock_lock(&self->_requestLock);
    [(NSMutableArray *)self->_requestsPending removeObjectIdenticalTo:v10];
    [(NSMutableArray *)self->_requestsInFlight addObject:v10];
    os_unfair_lock_unlock(&self->_requestLock);
    if (v9) {
      [v9 performingRequest:v10];
    }
    LOBYTE(v11) = [v10 performInContext:v44 error:a5];
    if (v11)
    {
      os_unfair_lock_lock(p_requestLock);
      [(NSMutableArray *)v60->_requestsInFlight removeObjectIdenticalTo:v10];
      os_unfair_lock_unlock(p_requestLock);
      if (v9) {
        [v9 performedRequest:v10 withError:*a5];
      }
    }

    goto LABEL_44;
  }
  id v49 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v48 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  -[VNRequestPerformer _groupOrderedRequests:ordinality:ordinalityAndPriorityGroups:](self, "_groupOrderedRequests:ordinality:ordinalityAndPriorityGroups:", v43, v49);
  BOOL v12 = [v49 allKeys];
  id v13 = [v12 sortedArrayUsingComparator:&__block_literal_global_50];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __62__VNRequestPerformer__performOrderedRequests_inContext_error___block_invoke_2;
  aBlock[3] = &unk_1E5B1F260;
  id v51 = v44;
  id v71 = v51;
  v72 = v60;
  v52 = (void (**)(void *, void *, id))_Block_copy(aBlock);
  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  id obj = v13;
  uint64_t v14 = [obj countByEnumeratingWithState:&v66 objects:v74 count:16];
  if (!v14)
  {
    LOBYTE(v11) = 1;
    goto LABEL_43;
  }
  int v11 = 1;
  uint64_t v47 = *(void *)v67;
  while (2)
  {
    uint64_t v15 = 0;
    uint64_t v46 = v14;
    do
    {
      if (*(void *)v67 != v47) {
        objc_enumerationMutation(obj);
      }
      uint64_t v53 = v15;
      uint64_t v16 = *(void *)(*((void *)&v66 + 1) + 8 * v15);
      v55 = [v49 objectForKey:v16];
      v56 = [v48 objectForKey:v16];
      v58 = [v56 objectForKeyedSubscript:@"VNRequestPerformer_SameOrdinalityRequestsPriorityGroup1Key"];
      +[VNError VNAssert:v58 != 0 log:@"Unexpected internal error"];
      dispatch_group_t v17 = dispatch_group_create();
      v57 = [(id)objc_opt_class() _requestPerformingQueuePriorityGroup1];
      v52[2](v52, v58, v51);
      LOBYTE(v16) = [v57 dispatchGroupWait:v17 error:a5];

      if ((v16 & 1) == 0)
      {
        VNValidatedLog(4, @"[VNRequestPerformer _performOrderedRequests:] timed out processing group 1 requests: %@", v18, v19, v20, v21, v22, v23, (uint64_t)v58);
LABEL_36:
        int v41 = 0;
        goto LABEL_37;
      }
      VNValidatedLog(1, @"[VNRequestPerformer _performOrderedRequests:] finished processing group 1 requests: %@", v18, v19, v20, v21, v22, v23, (uint64_t)v58);
      v54 = [v56 objectForKeyedSubscript:@"VNRequestPerformer_SameOrdinalityRequestsPriorityGroup2Key"];
      +[VNError VNAssert:v54 != 0 log:@"Unexpected internal error"];
      dispatch_group_t v24 = dispatch_group_create();
      v50 = [(id)objc_opt_class() _requestPerformingQueuePriorityGroup2];
      v52[2](v52, v54, v51);
      char v25 = [v50 dispatchGroupWait:v24 error:a5];

      if ((v25 & 1) == 0)
      {
        VNValidatedLog(4, @"[VNRequestPerformer _performOrderedRequests:] timed out processing group 2 requests: %@", v26, v27, v28, v29, v30, v31, (uint64_t)v54);

        goto LABEL_36;
      }
      VNValidatedLog(1, @"[VNRequestPerformer _performOrderedRequests:] finished processing group 2 requests: %@", v26, v27, v28, v29, v30, v31, (uint64_t)v54);
      long long v64 = 0u;
      long long v65 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      id v59 = v55;
      uint64_t v32 = [v59 countByEnumeratingWithState:&v62 objects:v73 count:16];
      if (v32)
      {
        uint64_t v33 = *(void *)v63;
        do
        {
          for (uint64_t i = 0; i != v32; ++i)
          {
            if (*(void *)v63 != v33) {
              objc_enumerationMutation(v59);
            }
            v35 = *(void **)(*((void *)&v62 + 1) + 8 * i);
            if (v9) {
              [v9 performingRequest:*(void *)(*((void *)&v62 + 1) + 8 * i)];
            }
            os_unfair_lock_lock(p_requestLock);
            [(NSMutableArray *)v60->_requestsInFlight removeObjectIdenticalTo:v35];
            os_unfair_lock_unlock(p_requestLock);
            v36 = [v35 asyncStatus];
            v37 = v36;
            if (v9)
            {
              char v38 = [v36 completed];
              if (v38)
              {
                v39 = 0;
              }
              else
              {
                id v5 = [v37 error];
                v39 = v5;
              }
              [v9 performedRequest:v35 withError:v39];
              if ((v38 & 1) == 0) {
            }
              }
            int v40 = [v37 completed] | v11 ^ 1;
            v11 &= v40;
            if ((v40 & 1) == 0 && a5)
            {
              [v37 error];
              int v11 = 0;
              *a5 = (id)objc_claimAutoreleasedReturnValue();
            }
            [v35 resetAsyncStatus];
          }
          uint64_t v32 = [v59 countByEnumeratingWithState:&v62 objects:v73 count:16];
        }
        while (v32);
      }

      int v41 = 1;
LABEL_37:

      if (!v41)
      {
        LOBYTE(v11) = 0;
        goto LABEL_43;
      }
      uint64_t v15 = v53 + 1;
    }
    while (v53 + 1 != v46);
    uint64_t v14 = [obj countByEnumeratingWithState:&v66 objects:v74 count:16];
    if (v14) {
      continue;
    }
    break;
  }
LABEL_43:

LABEL_44:
  return v11 & 1;
}

void __62__VNRequestPerformer__performOrderedRequests_inContext_error___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4, void *a5, char a6)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  [*(id *)(a1 + 32) qosClass];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = v11;
  uint64_t v21 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v21)
  {
    uint64_t v22 = *(void *)v27;
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v27 != v22) {
          objc_enumerationMutation(obj);
        }
        dispatch_group_t v24 = *(void **)(*((void *)&v26 + 1) + 8 * v23);
        if ((a6 & 1) == 0) {
          [*(id *)(*((void *)&v26 + 1) + 8 * v23) cancel];
        }
        VNValidatedLog(1, @"[VNRequestPerformer -performRequestsAsync]: scheduling processing of request: %@", v15, v16, v17, v18, v19, v20, (uint64_t)v24);
        os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 40) + 8));
        [*(id *)(*(void *)(a1 + 40) + 24) removeObjectIdenticalTo:v24];
        [*(id *)(*(void *)(a1 + 40) + 16) addObject:v24];
        os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 40) + 8));
        [v24 performInContextAsync:v12 asyncDispatchQueue:v13 asyncDispatchGroup:v14];
        ++v23;
      }
      while (v21 != v23);
      uint64_t v21 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v21);
  }
}

uint64_t __62__VNRequestPerformer__performOrderedRequests_inContext_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = [v4 integerValue];
  if (v6 >= [v5 integerValue])
  {
    uint64_t v8 = [v5 integerValue];
    uint64_t v7 = v8 < [v4 integerValue];
  }
  else
  {
    uint64_t v7 = -1;
  }

  return v7;
}

- (void)_groupsRequestsWithTheSameOrdinality:(id)a3 priorityGroup1:(id)a4 priorityGroup2:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v20 = a4;
  id v8 = a5;
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v10 = v7;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v26;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v26 != v12) {
          objc_enumerationMutation(v10);
        }
        uint64_t v14 = *(void *)(*((void *)&v25 + 1) + 8 * v13);
        uint64_t v15 = (objc_class *)objc_opt_class();
        uint64_t v16 = NSStringFromClass(v15);
        id v17 = [v9 objectForKey:v16];
        if (!v17) {
          id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        }
        [v17 addObject:v14];
        [v9 setObject:v17 forKey:v16];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v10 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v11);
  }

  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __89__VNRequestPerformer__groupsRequestsWithTheSameOrdinality_priorityGroup1_priorityGroup2___block_invoke_3;
  v21[3] = &unk_1E5B1F218;
  id v24 = &__block_literal_global_30873;
  id v18 = v20;
  id v22 = v18;
  id v19 = v8;
  id v23 = v19;
  [v9 enumerateKeysAndObjectsUsingBlock:v21];
}

void __89__VNRequestPerformer__groupsRequestsWithTheSameOrdinality_priorityGroup1_priorityGroup2___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v15 = a2;
  id v5 = a3;
  while ([v5 count])
  {
    uint64_t v6 = (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
    id v7 = [v5 objectAtIndexedSubscript:v6];
    [*(id *)(a1 + 32) addObject:v7];
    [v5 removeObjectAtIndex:v6];
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v9 = [v7 configuration];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v10 = v5;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v10);
          }
          uint64_t v14 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          if ([v14 willAcceptCachedResultsFromRequestWithConfiguration:v9]) {
            [v8 addObject:v14];
          }
        }
        uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v11);
    }

    [*(id *)(a1 + 40) addObjectsFromArray:v8];
    [v10 removeObjectsInArray:v8];
  }
}

uint64_t __89__VNRequestPerformer__groupsRequestsWithTheSameOrdinality_priorityGroup1_priorityGroup2___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v17 = 0;
  long long v18 = &v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = 0x7FFFFFFFFFFFFFFFLL;
  id v3 = [v2 firstObject];
  uint64_t v4 = [(id)objc_opt_class() defaultRevision];

  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __89__VNRequestPerformer__groupsRequestsWithTheSameOrdinality_priorityGroup1_priorityGroup2___block_invoke_2;
  v8[3] = &unk_1E5B1F1F0;
  v8[4] = &v17;
  v8[5] = &v13;
  v8[6] = &v9;
  v8[7] = v4;
  [v2 enumerateObjectsUsingBlock:v8];
  uint64_t v5 = v18[3];
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v5 = v14[3];
    if (v5 == 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v5 = v10[3];
    }
    v18[3] = v5;
  }
  +[VNError VNAssert:v5 != 0x7FFFFFFFFFFFFFFFLL log:@"Internal error while sorting requests"];
  uint64_t v6 = v18[3];
  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);

  return v6;
}

void __89__VNRequestPerformer__groupsRequestsWithTheSameOrdinality_priorityGroup1_priorityGroup2___block_invoke_2(void *a1, void *a2, unint64_t a3, unsigned char *a4)
{
  id v12 = a2;
  unint64_t v7 = [v12 resolvedRevision];
  if (v7 == a1[7])
  {
    *(void *)(*(void *)(a1[4] + 8) + 24) = a3;
    *a4 = 1;
  }
  else
  {
    if (v7 <= 0xDECAEFFF) {
      uint64_t v8 = a1[5];
    }
    else {
      uint64_t v8 = a1[6];
    }
    uint64_t v9 = *(void *)(v8 + 8);
    unint64_t v10 = *(void *)(v9 + 24);
    if (v10 < a3 || v10 == 0x7FFFFFFFFFFFFFFFLL) {
      unint64_t v10 = a3;
    }
    *(void *)(v9 + 24) = v10;
  }
}

- (void)_groupOrderedRequests:(id)a3 ordinality:(id)a4 ordinalityAndPriorityGroups:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v22 = a4;
  id v23 = a5;
  uint64_t v9 = [v8 firstObject];
  uint64_t v10 = [v9 dependencyProcessingOrdinality];

  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v25 = [v8 count];
  id v12 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v25];
  uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v25];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __83__VNRequestPerformer__groupOrderedRequests_ordinality_ordinalityAndPriorityGroups___block_invoke;
  aBlock[3] = &unk_1E5B1F1A8;
  void aBlock[4] = self;
  uint64_t v21 = (void (**)(void *, id, id, id, void *, void *, uint64_t))_Block_copy(aBlock);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = v8;
  uint64_t v14 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v27 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        if ([v17 dependencyProcessingOrdinality] == v10)
        {
          [v11 addObject:v17];
        }
        else
        {
          v21[2](v21, v11, v22, v23, v12, v13, v10);
          uint64_t v10 = [v17 dependencyProcessingOrdinality];
          uint64_t v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v17, 0);

          uint64_t v19 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v25];
          uint64_t v20 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v25];

          id v11 = (id)v18;
          id v12 = (void *)v19;
          uint64_t v13 = (void *)v20;
        }
      }
      uint64_t v14 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v14);
  }

  v21[2](v21, v11, v22, v23, v12, v13, v10);
}

void __83__VNRequestPerformer__groupOrderedRequests_ordinality_ordinalityAndPriorityGroups___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  v22[2] = *MEMORY[0x1E4F143B8];
  id v13 = a2;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  [*(id *)(a1 + 32) _groupsRequestsWithTheSameOrdinality:v13 priorityGroup1:v16 priorityGroup2:v17];
  uint64_t v18 = [NSNumber numberWithInteger:a7];
  [v14 setObject:v13 forKey:v18];

  v21[0] = @"VNRequestPerformer_SameOrdinalityRequestsPriorityGroup1Key";
  v21[1] = @"VNRequestPerformer_SameOrdinalityRequestsPriorityGroup2Key";
  v22[0] = v16;
  v22[1] = v17;
  uint64_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];
  uint64_t v20 = [NSNumber numberWithInteger:a7];
  [v15 setObject:v19 forKey:v20];
}

- (BOOL)_performRequests:(id)a3 onBehalfOfRequest:(id)a4 inContext:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  [v12 qosClass];
  if ([v10 count])
  {
    [v12 serialNumber];
    if (v11) {
      [(id)objc_opt_class() VNClassCode];
    }
    kdebug_trace();
    id v14 = [(VNRequestPerformer *)self dependencyAnalyzedRequestsForRequests:v10 withPerformingContext:v12 error:a6];
    if (v14
      && [(VNRequestPerformer *)self _validateAndPrepareRequests:v14 error:a6])
    {
      uint64_t v19 = [(VNRequestPerformer *)self orderedRequestsForRequests:v14];
      id v15 = [v12 requestForensics];
      id v16 = v15;
      id v17 = (void *)v19;
      if (v15)
      {
        id v17 = (void *)v19;
        if (v11) {
          [v15 performingOrderedDependentRequests:v19 onBehalfOfRequest:v11];
        }
        else {
          [v15 setOrderedRequests:v19];
        }
      }
      BOOL v13 = [(VNRequestPerformer *)self _performOrderedRequests:v17 inContext:v12 error:a6];
    }
    else
    {
      BOOL v13 = 0;
    }

    kdebug_trace();
  }
  else
  {
    BOOL v13 = 1;
  }

  return v13;
}

- (BOOL)_validateAndPrepareRequests:(id)a3 error:(id *)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = a3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        objc_msgSend(v9, "setResults:", 0, (void)v12);
        if (([v9 validateConfigurationAndReturnError:a4] & 1) == 0)
        {
          BOOL v10 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v10 = 1;
LABEL_11:

  return v10;
}

+ (id)_requestPerformingQueuePriorityGroup2
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__VNRequestPerformer__requestPerformingQueuePriorityGroup2__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[VNRequestPerformer _requestPerformingQueuePriorityGroup2]::onceToken != -1) {
    dispatch_once(&+[VNRequestPerformer _requestPerformingQueuePriorityGroup2]::onceToken, block);
  }
  id v2 = +[VNRequestPerformingPriorityGroup2AsyncTasksQueueCache sharedCache];
  id v3 = [v2 queueWithUniqueAppendix:+[VNRequestPerformer _requestPerformingQueuePriorityGroup2]::className];

  return v3;
}

uint64_t __59__VNRequestPerformer__requestPerformingQueuePriorityGroup2__block_invoke(uint64_t a1)
{
  +[VNRequestPerformer _requestPerformingQueuePriorityGroup2]::className = NSStringFromClass(*(Class *)(a1 + 32));

  return MEMORY[0x1F41817F8]();
}

+ (id)_requestPerformingQueuePriorityGroup1
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__VNRequestPerformer__requestPerformingQueuePriorityGroup1__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[VNRequestPerformer _requestPerformingQueuePriorityGroup1]::onceToken != -1) {
    dispatch_once(&+[VNRequestPerformer _requestPerformingQueuePriorityGroup1]::onceToken, block);
  }
  id v2 = +[VNRequestPerformingPriorityGroup1AsyncTasksQueueCache sharedCache];
  id v3 = [v2 queueWithUniqueAppendix:+[VNRequestPerformer _requestPerformingQueuePriorityGroup1]::className];

  return v3;
}

uint64_t __59__VNRequestPerformer__requestPerformingQueuePriorityGroup1__block_invoke(uint64_t a1)
{
  +[VNRequestPerformer _requestPerformingQueuePriorityGroup1]::className = NSStringFromClass(*(Class *)(a1 + 32));

  return MEMORY[0x1F41817F8]();
}

@end