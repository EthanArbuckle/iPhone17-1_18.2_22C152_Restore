@interface ARTechniqueParallelGatherContext
- (ARTechniqueParallelGatherContext)initWithParentContext:(id)a3 previousContext:(id)a4 requiredTechniqueIndices:(id)a5 deterministicTechniqueIndices:(id)a6 techniques:(id)a7;
- (BOOL)deterministicResultsCaptured;
- (BOOL)requiredTimeIntervalComplete;
- (id)_allGatheredDataByTechniqueIndex;
- (id)addResultData:(id)a3 forTechniqueAtIndex:(unint64_t)a4;
- (id)captureGatheredData;
- (id)description;
- (id)gatheredData;
- (id)lateResultDataForTechniqueAtIndex:(unint64_t)a3;
- (unint64_t)indexForTechnique:(id)a3;
- (unint64_t)techniqueCount;
- (void)setRequiredTimeIntervalComplete:(BOOL)a3;
@end

@implementation ARTechniqueParallelGatherContext

- (ARTechniqueParallelGatherContext)initWithParentContext:(id)a3 previousContext:(id)a4 requiredTechniqueIndices:(id)a5 deterministicTechniqueIndices:(id)a6 techniques:(id)a7
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v30.receiver = self;
  v30.super_class = (Class)ARTechniqueParallelGatherContext;
  v17 = [(ARTechniqueGatherContext *)&v30 initWithParentContext:a3];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_previousContext, a4);
    uint64_t v19 = [v14 copy];
    requiredTechniqueIndices = v18->_requiredTechniqueIndices;
    v18->_requiredTechniqueIndices = (NSIndexSet *)v19;

    uint64_t v21 = [v15 copy];
    deterministicTechniqueIndices = v18->_deterministicTechniqueIndices;
    v18->_deterministicTechniqueIndices = (NSIndexSet *)v21;

    v18->_techniqueCount = [v16 count];
    uint64_t v23 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v18->_techniqueCount];
    gatheredDataByTechniqueIndex = v18->_gatheredDataByTechniqueIndex;
    v18->_gatheredDataByTechniqueIndex = (NSMutableDictionary *)v23;

    v18->_gatherLock._os_unfair_lock_opaque = 0;
    uint64_t v25 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
    techniquesByIndex = v18->_techniquesByIndex;
    v18->_techniquesByIndex = (NSMapTable *)v25;

    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __140__ARTechniqueParallelGatherContext_initWithParentContext_previousContext_requiredTechniqueIndices_deterministicTechniqueIndices_techniques___block_invoke;
    v28[3] = &unk_1E61876B8;
    v29 = v18;
    [v16 enumerateObjectsUsingBlock:v28];
  }
  return v18;
}

void __140__ARTechniqueParallelGatherContext_initWithParentContext_previousContext_requiredTechniqueIndices_deterministicTechniqueIndices_techniques___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v4 = *(void **)(*(void *)(a1 + 32) + 64);
  v5 = NSNumber;
  id v6 = a2;
  id v7 = [v5 numberWithUnsignedInteger:a3];
  [v4 setObject:v6 forKey:v7];
}

- (id)gatheredData
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = [(ARTechniqueParallelGatherContext *)self _allGatheredDataByTechniqueIndex];
  v3 = objc_opt_new();
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v4 = objc_msgSend(v2, "allValues", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        [v3 addObjectsFromArray:*(void *)(*((void *)&v10 + 1) + 8 * i)];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  return v3;
}

- (unint64_t)indexForTechnique:(id)a3
{
  id v4 = a3;
  if (self->_techniqueCount)
  {
    unint64_t v5 = 0;
    while (1)
    {
      techniquesByIndex = self->_techniquesByIndex;
      uint64_t v7 = [NSNumber numberWithUnsignedInteger:v5];
      id v8 = [(NSMapTable *)techniquesByIndex objectForKey:v7];

      if (v8 == v4) {
        break;
      }
      if (++v5 >= self->_techniqueCount) {
        goto LABEL_5;
      }
    }
  }
  else
  {
LABEL_5:
    unint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v5;
}

- (BOOL)deterministicResultsCaptured
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (![(NSIndexSet *)self->_deterministicTechniqueIndices count]) {
    return 1;
  }
  os_unfair_lock_lock(&self->_gatherLock);
  v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(NSMutableDictionary *)self->_gatheredDataByTechniqueIndex allKeys];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(v3, "addIndex:", objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "integerValue"));
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  os_unfair_lock_unlock(&self->_gatherLock);
  char v9 = [v3 containsIndexes:self->_deterministicTechniqueIndices];

  return v9;
}

- (id)_allGatheredDataByTechniqueIndex
{
  p_gatherLock = &self->_gatherLock;
  os_unfair_lock_lock(&self->_gatherLock);
  previousContext = self->_previousContext;
  if (previousContext)
  {
    uint64_t v5 = [(ARTechniqueParallelGatherContext *)previousContext _allGatheredDataByTechniqueIndex];
  }
  else
  {
    uint64_t v5 = objc_opt_new();
  }
  uint64_t v6 = v5;
  [v5 addEntriesFromDictionary:self->_gatheredDataByTechniqueIndex];
  os_unfair_lock_unlock(p_gatherLock);
  return v6;
}

- (id)captureGatheredData
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  id v4 = objc_opt_new();
  os_unfair_lock_lock(&self->_gatherLock);
  previousContext = self->_previousContext;
  if (previousContext)
  {
    uint64_t v6 = [(ARTechniqueParallelGatherContext *)previousContext _allGatheredDataByTechniqueIndex];
  }
  else
  {
    uint64_t v6 = objc_opt_new();
  }
  uint64_t v7 = v6;
  objc_msgSend(v6, "addEntriesFromDictionary:", self->_gatheredDataByTechniqueIndex, 16);
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v8 = v7;
  uint64_t v9 = [(NSMutableDictionary *)v8 countByEnumeratingWithState:&v37 objects:v51 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v38;
    v34 = v3;
    uint64_t v35 = *(void *)v38;
    v36 = v4;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v38 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = *(void **)(*((void *)&v37 + 1) + 8 * v12);
        long long v14 = [(NSMutableDictionary *)v8 objectForKeyedSubscript:v13];
        [v3 addObjectsFromArray:v14];

        if (-[NSIndexSet containsIndex:](self->_requiredTechniqueIndices, "containsIndex:", [v13 integerValue]))
        {
          uint64_t v15 = [(NSMutableDictionary *)self->_gatheredDataByTechniqueIndex objectForKeyedSubscript:v13];

          if (!v15)
          {
            if (_ARLogTechnique_onceToken_15 != -1) {
              dispatch_once(&_ARLogTechnique_onceToken_15, &__block_literal_global_194);
            }
            uint64_t v16 = (void *)_ARLogTechnique_logObj_15;
            if (os_log_type_enabled((os_log_t)_ARLogTechnique_logObj_15, OS_LOG_TYPE_INFO))
            {
              v17 = v16;
              v18 = (objc_class *)objc_opt_class();
              uint64_t v19 = NSStringFromClass(v18);
              uint64_t v20 = [v13 integerValue];
              uint64_t v21 = [(NSMapTable *)self->_techniquesByIndex objectForKey:v13];
              v22 = [(ARTechniqueGatherContext *)self imageData];
              [v22 timestamp];
              *(_DWORD *)buf = 138544386;
              v42 = v19;
              __int16 v43 = 2048;
              v44 = self;
              __int16 v45 = 2048;
              uint64_t v46 = v20;
              __int16 v47 = 2112;
              v48 = v21;
              __int16 v49 = 2048;
              uint64_t v50 = v23;
              _os_log_impl(&dword_1B88A2000, v17, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Technique %ld (%@) result data missed frame %f", buf, 0x34u);

              v3 = v34;
            }
            v24 = [(ARTechniqueGatherContext *)self imageData];
            [v24 timestamp];

            [v13 integerValue];
            kdebug_trace();
            uint64_t v25 = [(NSMapTable *)self->_techniquesByIndex objectForKey:v13];
            v26 = v25;
            if (v25)
            {
              v27 = [v25 traceKey];
              if (ARTechnique_Result_Drop_onceToken != -1) {
                dispatch_once(&ARTechnique_Result_Drop_onceToken, &__block_literal_global_197);
              }
              v28 = [(id)ARTechnique_Result_Drop_keyToCode objectForKeyedSubscript:v27];
              [v28 intValue];

              kdebug_trace();
            }

            id v4 = v36;
            uint64_t v11 = v35;
          }
        }
        else
        {
          [v4 addObject:v13];
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableDictionary *)v8 countByEnumeratingWithState:&v37 objects:v51 count:16];
    }
    while (v10);
  }

  [(NSMutableDictionary *)v8 removeObjectsForKeys:v4];
  gatheredDataByTechniqueIndex = self->_gatheredDataByTechniqueIndex;
  self->_gatheredDataByTechniqueIndex = v8;
  objc_super v30 = v8;

  self->_resultsCaptured = 1;
  v31 = *(Class *)((char *)&self->super.super.isa + v33);
  *(Class *)((char *)&self->super.super.isa + v33) = 0;

  os_unfair_lock_unlock(&self->_gatherLock);
  return v3;
}

- (id)addResultData:(id)a3 forTechniqueAtIndex:(unint64_t)a4
{
  p_gatherLock = &self->_gatherLock;
  id v7 = a3;
  os_unfair_lock_lock(p_gatherLock);
  gatheredDataByTechniqueIndex = self->_gatheredDataByTechniqueIndex;
  uint64_t v9 = [NSNumber numberWithUnsignedInteger:a4];
  [(NSMutableDictionary *)gatheredDataByTechniqueIndex setObject:v7 forKeyedSubscript:v9];

  if (self->_resultsCaptured)
  {
    lateResultTechniqueIndices = self->_lateResultTechniqueIndices;
    if (!lateResultTechniqueIndices)
    {
      uint64_t v11 = (NSMutableIndexSet *)objc_opt_new();
      uint64_t v12 = self->_lateResultTechniqueIndices;
      self->_lateResultTechniqueIndices = v11;

      lateResultTechniqueIndices = self->_lateResultTechniqueIndices;
    }
    [(NSMutableIndexSet *)lateResultTechniqueIndices addIndex:a4];
  }
  long long v13 = [(ARTechniqueParallelGatherContext *)self->_previousContext lateResultDataForTechniqueAtIndex:a4];
  os_unfair_lock_unlock(p_gatherLock);
  return v13;
}

- (id)lateResultDataForTechniqueAtIndex:(unint64_t)a3
{
  p_gatherLock = &self->_gatherLock;
  os_unfair_lock_lock(&self->_gatherLock);
  if ([(NSMutableIndexSet *)self->_lateResultTechniqueIndices containsIndex:a3])
  {
    gatheredDataByTechniqueIndex = self->_gatheredDataByTechniqueIndex;
    id v7 = [NSNumber numberWithUnsignedInteger:a3];
    id v8 = [(NSMutableDictionary *)gatheredDataByTechniqueIndex objectForKeyedSubscript:v7];
  }
  else
  {
    id v8 = [(ARTechniqueParallelGatherContext *)self->_previousContext lateResultDataForTechniqueAtIndex:a3];
  }
  os_unfair_lock_unlock(p_gatherLock);
  return v8;
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  v11.receiver = self;
  v11.super_class = (Class)ARTechniqueParallelGatherContext;
  id v4 = [(ARTechniqueGatherContext *)&v11 description];
  uint64_t v5 = [v3 stringWithFormat:@"%@\r", v4];

  if ([(ARTechniqueParallelGatherContext *)self requiredTimeIntervalComplete]) {
    uint64_t v6 = @"YES";
  }
  else {
    uint64_t v6 = @"NO";
  }
  [v5 appendFormat:@"RequiredTimeIntervalComplete: %@\r", v6];
  if ([(ARTechniqueParallelGatherContext *)self deterministicResultsCaptured]) {
    id v7 = @"YES";
  }
  else {
    id v7 = @"NO";
  }
  [v5 appendFormat:@"DeterministicResultsCaptured: %@\r", v7];
  id v8 = [(ARTechniqueGatherContext *)self imageData];
  [v8 timestamp];
  objc_msgSend(v5, "appendFormat:", @"ImageData timestamp: %f\r", v9);

  os_unfair_lock_lock(&self->_gatherLock);
  [v5 appendFormat:@"Techniques ByIndex: %@\r", self->_techniquesByIndex];
  [v5 appendFormat:@"Late Results ByIndex: %@\r", self->_lateResultTechniqueIndices];
  [v5 appendFormat:@"GatheredData ByIndex: %@\r", self->_gatheredDataByTechniqueIndex];
  os_unfair_lock_unlock(&self->_gatherLock);
  return v5;
}

- (BOOL)requiredTimeIntervalComplete
{
  return self->_requiredTimeIntervalComplete;
}

- (void)setRequiredTimeIntervalComplete:(BOOL)a3
{
  self->_requiredTimeIntervalComplete = a3;
}

- (unint64_t)techniqueCount
{
  return self->_techniqueCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_techniquesByIndex, 0);
  objc_storeStrong((id *)&self->_lateResultTechniqueIndices, 0);
  objc_storeStrong((id *)&self->_gatheredDataByTechniqueIndex, 0);
  objc_storeStrong((id *)&self->_deterministicTechniqueIndices, 0);
  objc_storeStrong((id *)&self->_requiredTechniqueIndices, 0);
  objc_storeStrong((id *)&self->_previousContext, 0);
}

@end