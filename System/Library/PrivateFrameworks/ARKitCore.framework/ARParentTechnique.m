@interface ARParentTechnique
+ (id)parentTechniqueOfClass:(Class)a3 inArray:(id)a4;
+ (id)techinqueInArray:(id)a3 passingTest:(id)a4;
+ (id)techniquesByForceReplacingTechniques:(id)a3 withMatchingClassTechniques:(id)a4;
+ (id)techniquesByReplacingOriginalTechniques:(id)a3 withReplacementTechniques:(id)a4 passingTest:(id)a5;
- (ARParentTechnique)initWithParallelTechniques:(id)a3;
- (ARParentTechnique)initWithTechniques:(id)a3;
- (ARParentTechnique)initWithTechniques:(id)a3 delegate:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isParallel;
- (BOOL)reconfigurableFrom:(id)a3;
- (NSArray)_internalTechniques;
- (NSString)description;
- (double)requiredTimeInterval;
- (id)_fullDescription;
- (id)predictedResultDataAtTimestamp:(double)a3 context:(id)a4;
- (id)processData:(id)a3;
- (id)processData:(id)a3 onTechniques:(id)a4;
- (id)processResultData:(id)a3 timestamp:(double)a4 context:(id)a5;
- (id)resultDataClasses;
- (id)techniqueMatchingPredicate:(id)a3;
- (id)techniqueOfClass:(Class)a3;
- (unint64_t)optionalSensorDataTypes;
- (unint64_t)requiredSensorDataTypes;
- (void)_submitResultsForTimestamp:(double)a3 context:(id)a4;
- (void)dotGraphWithLines:(id)a3;
- (void)prepare:(BOOL)a3;
- (void)reconfigureFrom:(id)a3;
- (void)requestResultDataAtTimestamp:(double)a3 context:(id)a4;
- (void)requestResultDataAtTimestamp:(double)a3 context:(id)a4 onTechniques:(id)a5;
- (void)reuseTechniques:(id)a3;
- (void)setBonusLatency:(double)a3;
- (void)setPowerUsage:(unint64_t)a3;
- (void)setTechniques:(id)a3;
- (void)set_internalTechniques:(id)a3;
- (void)siblingTechniquesDidChange:(id)a3;
- (void)technique:(id)a3 didFailWithError:(id)a4;
- (void)technique:(id)a3 didOutputResultData:(id)a4 timestamp:(double)a5 context:(id)a6;
- (void)technique:(id)a3 didOutputResultData:(id)a4 timestamp:(double)a5 context:(id)a6 onTechniques:(id)a7;
@end

@implementation ARParentTechnique

- (void)dotGraphWithLines:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)ARParentTechnique;
  [(ARTechnique *)&v21 dotGraphWithLines:v4];
  v5 = objc_msgSend(NSString, "stringWithFormat:", @"subgraph \"cluster_%p\" {", self);
  [v4 addObject:v5];

  BOOL v6 = [(ARParentTechnique *)self isParallel];
  v7 = @"orange";
  if (v6) {
    v7 = @"blue";
  }
  v8 = v7;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v9 = [(ARParentTechnique *)self techniques];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        v15 = [NSString stringWithFormat:@"\"(%p)\" -> \"(%p)\"[style=bold color=%@]", self, v14, v8];
        [v4 addObject:v15];

        [v14 dotGraphWithLines:v4];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v11);
  }

  v16 = [NSString stringWithFormat:@"}"];
  [v4 addObject:v16];
}

+ (id)parentTechniqueOfClass:(Class)a3 inArray:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v5 = a4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v28;
    uint64_t v22 = *(void *)v28;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v28 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v11 = v10;
          long long v23 = 0u;
          long long v24 = 0u;
          long long v25 = 0u;
          long long v26 = 0u;
          uint64_t v12 = [v11 _internalTechniques];
          uint64_t v13 = [v12 countByEnumeratingWithState:&v23 objects:v31 count:16];
          if (v13)
          {
            uint64_t v14 = v13;
            uint64_t v15 = *(void *)v24;
LABEL_9:
            uint64_t v16 = 0;
            while (1)
            {
              if (*(void *)v24 != v15) {
                objc_enumerationMutation(v12);
              }
              if (objc_opt_isKindOfClass()) {
                goto LABEL_23;
              }
              if (v14 == ++v16)
              {
                uint64_t v14 = [v12 countByEnumeratingWithState:&v23 objects:v31 count:16];
                if (v14) {
                  goto LABEL_9;
                }
                break;
              }
            }
          }

          long long v17 = [v11 _internalTechniques];
          long long v18 = +[ARParentTechnique parentTechniqueOfClass:a3 inArray:v17];

          if (v18
            || ([v11 splitTechniques],
                long long v19 = objc_claimAutoreleasedReturnValue(),
                +[ARParentTechnique parentTechniqueOfClass:a3 inArray:v19], long long v18 = objc_claimAutoreleasedReturnValue(), v19, v18))
          {
            id v20 = v18;

            uint64_t v12 = v11;
            id v11 = v20;
LABEL_23:

            goto LABEL_24;
          }

          uint64_t v8 = v22;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v27 objects:v32 count:16];
      id v11 = 0;
      if (v7) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v11 = 0;
  }
LABEL_24:

  return v11;
}

- (ARParentTechnique)initWithTechniques:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)ARParentTechnique;
  uint64_t v8 = [(ARTechnique *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(ARTechnique *)v8 setDelegate:v7];
    [(ARParentTechnique *)v9 setTechniques:v6];
  }

  return v9;
}

- (ARParentTechnique)initWithTechniques:(id)a3
{
  return [(ARParentTechnique *)self initWithTechniques:a3 delegate:0];
}

- (ARParentTechnique)initWithParallelTechniques:(id)a3
{
  v3 = [(ARParentTechnique *)self initWithTechniques:a3 delegate:0];
  id v4 = v3;
  if (v3)
  {
    v3->_parallelExecution = 1;
    uint64_t v5 = ARCreateFixedPriorityDispatchQueue("com.apple.arkit.technique");
    queue = v4->_queue;
    v4->_queue = (OS_dispatch_queue *)v5;

    v4->_previousContext_lock._os_unfair_lock_opaque = 0;
  }
  return v4;
}

- (void)reuseTechniques:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ARParentTechnique *)self techniques];
  id v7 = +[ARParentTechnique techniquesByReplacingOriginalTechniques:v5 withReplacementTechniques:v4 passingTest:&__block_literal_global_42];

  id v6 = v7;
  if (v7)
  {
    [(ARParentTechnique *)self setTechniques:v7];
    id v6 = v7;
  }
}

uint64_t __37__ARParentTechnique_reuseTechniques___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = [v5 reconfigurableFrom:v4];
  if (v6) {
    [v5 reconfigureFrom:v4];
  }

  return v6;
}

- (BOOL)isParallel
{
  return self->_parallelExecution;
}

- (id)processData:(id)a3
{
  id v4 = a3;
  id v5 = [(ARParentTechnique *)self techniques];
  uint64_t v6 = [(ARParentTechnique *)self processData:v4 onTechniques:v5];

  return v6;
}

- (id)processData:(id)a3 onTechniques:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  uint64_t v10 = v8;
  if (v9)
  {
    uint64_t v11 = v9;
    uint64_t v12 = *(void *)v19;
    uint64_t v10 = v8;
    do
    {
      uint64_t v13 = 0;
      uint64_t v14 = v10;
      do
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v7);
        }
        uint64_t v10 = [*(id *)(*((void *)&v18 + 1) + 8 * v13) processData:v14];

        ++v13;
        uint64_t v14 = v10;
      }
      while (v11 != v13);
      uint64_t v11 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
  }
  v17.receiver = self;
  v17.super_class = (Class)ARParentTechnique;
  uint64_t v15 = [(ARTechnique *)&v17 processData:v10];

  return v15;
}

- (void)requestResultDataAtTimestamp:(double)a3 context:(id)a4
{
  id v6 = a4;
  id v7 = [(ARParentTechnique *)self techniques];
  [(ARParentTechnique *)self requestResultDataAtTimestamp:v6 context:v7 onTechniques:a3];
}

- (void)requestResultDataAtTimestamp:(double)a3 context:(id)a4 onTechniques:(id)a5
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  if ([v9 count])
  {
    if (self->_parallelExecution)
    {
      uint64_t v10 = [v9 indexesOfObjectsPassingTest:&__block_literal_global_8];
      uint64_t v11 = [v9 indexesOfObjectsPassingTest:&__block_literal_global_10_0];
      os_unfair_lock_lock(&self->_previousContext_lock);
      v40 = (void *)v10;
      v41 = self;
      v39 = (void *)v11;
      uint64_t v12 = [[ARTechniqueParallelGatherContext alloc] initWithParentContext:v8 previousContext:self->_previousContext requiredTechniqueIndices:v10 deterministicTechniqueIndices:v11 techniques:v9];
      objc_storeStrong((id *)&self->_previousContext, v12);
      os_unfair_lock_unlock(&self->_previousContext_lock);
      long long v50 = 0u;
      long long v51 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      id v42 = v9;
      id obj = v9;
      uint64_t v13 = [obj countByEnumeratingWithState:&v48 objects:v52 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v49;
        do
        {
          uint64_t v16 = 0;
          do
          {
            if (*(void *)v49 != v15) {
              objc_enumerationMutation(obj);
            }
            objc_super v17 = *(void **)(*((void *)&v48 + 1) + 8 * v16);
            long long v18 = [v17 traceKey];
            if (ARTechnique_Request_to_Result_onceToken != -1) {
              dispatch_once(&ARTechnique_Request_to_Result_onceToken, &__block_literal_global_179);
            }
            long long v19 = [(id)ARTechnique_Request_to_Result_keyToCode objectForKeyedSubscript:v18];
            [v19 intValue];

            kdebug_trace();
            long long v20 = [v17 traceKey];
            if (ARTechnique_Request_begin_onceToken != -1) {
              dispatch_once(&ARTechnique_Request_begin_onceToken, &__block_literal_global_329);
            }
            long long v21 = [(id)ARTechnique_Request_begin_keyToCode objectForKeyedSubscript:v20];
            [v21 intValue];

            kdebug_trace();
            [v17 requestResultDataAtTimestamp:v12 context:a3];
            ++v16;
          }
          while (v14 != v16);
          uint64_t v14 = [obj countByEnumeratingWithState:&v48 objects:v52 count:16];
        }
        while (v14);
      }

      [(ARParentTechnique *)v41 requiredTimeInterval];
      double v23 = v22;
      [(ARTechnique *)v41 bonusLatency];
      double v25 = v23 - v24;
      objc_initWeak(&location, v41);
      double v26 = 100000.0;
      if (v25 >= 0.0001) {
        double v26 = v25 * 1000000000.0;
      }
      dispatch_time_t v27 = dispatch_time(0, (uint64_t)v26);
      queue = v41->_queue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __71__ARParentTechnique_requestResultDataAtTimestamp_context_onTechniques___block_invoke_3;
      block[3] = &unk_1E6186C60;
      v45 = v12;
      long long v29 = v12;
      objc_copyWeak(v46, &location);
      v46[1] = *(id *)&a3;
      dispatch_after(v27, queue, block);
      objc_destroyWeak(v46);

      objc_destroyWeak(&location);
      id v9 = v42;
    }
    else
    {
      uint64_t v33 = [v9 firstObject];
      v34 = [[ARTechniqueSequentialGatherContext alloc] initWithParentContext:v8];
      v35 = [v33 traceKey];
      if (ARTechnique_Request_to_Result_onceToken != -1) {
        dispatch_once(&ARTechnique_Request_to_Result_onceToken, &__block_literal_global_179);
      }
      v36 = [(id)ARTechnique_Request_to_Result_keyToCode objectForKeyedSubscript:v35];
      [v36 intValue];

      kdebug_trace();
      v37 = [v33 traceKey];
      if (ARTechnique_Request_begin_onceToken != -1) {
        dispatch_once(&ARTechnique_Request_begin_onceToken, &__block_literal_global_329);
      }
      v38 = [(id)ARTechnique_Request_begin_keyToCode objectForKeyedSubscript:v37];
      [v38 intValue];

      kdebug_trace();
      [v33 requestResultDataAtTimestamp:v34 context:a3];
    }
  }
  else
  {
    long long v30 = [(ARTechnique *)self delegate];
    char v31 = objc_opt_respondsToSelector();

    if (v31)
    {
      v32 = [(ARTechnique *)self delegate];
      [v32 technique:self didOutputResultData:MEMORY[0x1E4F1CBF0] timestamp:v8 context:a3];
    }
  }
}

BOOL __71__ARParentTechnique_requestResultDataAtTimestamp_context_onTechniques___block_invoke(uint64_t a1, void *a2)
{
  return [a2 captureBehavior] == 1;
}

uint64_t __71__ARParentTechnique_requestResultDataAtTimestamp_context_onTechniques___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 deterministicMode];
}

void __71__ARParentTechnique_requestResultDataAtTimestamp_context_onTechniques___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) setRequiredTimeIntervalComplete:1];
  if ([*(id *)(a1 + 32) deterministicResultsCaptured])
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained _submitResultsForTimestamp:*(void *)(a1 + 32) context:*(double *)(a1 + 48)];
  }
}

- (id)predictedResultDataAtTimestamp:(double)a3 context:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = [(ARParentTechnique *)self techniques];
  if ([v7 count])
  {
    id v8 = [[ARTechniqueSequentialGatherContext alloc] initWithParentContext:v6];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "predictedResultDataAtTimestamp:context:", v8, a3, (void)v17);
          [(ARTechniqueSequentialGatherContext *)v8 addResultData:v14];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v11);
    }

    uint64_t v15 = [(ARTechniqueSequentialGatherContext *)v8 gatheredData];
  }
  else
  {
    uint64_t v15 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v15;
}

- (void)setPowerUsage:(unint64_t)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)ARParentTechnique;
  -[ARTechnique setPowerUsage:](&v14, sel_setPowerUsage_);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = [(ARParentTechnique *)self techniques];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) setPowerUsage:a3];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)setTechniques:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        long long v10 = [v9 delegate];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          long long v12 = [v9 delegate];
          long long v13 = [(ARTechnique *)self delegate];
          [v12 setDelegate:v13];
        }
        objc_msgSend(v9, "setPowerUsage:", -[ARTechnique powerUsage](self, "powerUsage"));
        [v9 setDelegate:self];
        [v9 setBonusLatency:0.0];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v6);
  }
  if (!self->_parallelExecution)
  {
    [(ARTechnique *)self bonusLatency];
    double v15 = v14;
    uint64_t v16 = [v4 firstObject];
    [v16 setBonusLatency:v15];
  }
  long long v17 = (void *)[v4 copy];
  [(ARParentTechnique *)self set_internalTechniques:v17];
}

- (unint64_t)requiredSensorDataTypes
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(ARParentTechnique *)self techniques];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    unint64_t v5 = 0;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v2);
        }
        v5 |= [*(id *)(*((void *)&v9 + 1) + 8 * i) requiredSensorDataTypes];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (unint64_t)optionalSensorDataTypes
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(ARParentTechnique *)self techniques];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    unint64_t v5 = 0;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v2);
        }
        v5 |= [*(id *)(*((void *)&v9 + 1) + 8 * i) optionalSensorDataTypes];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (double)requiredTimeInterval
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v3 = [(ARParentTechnique *)self techniques];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
    double v7 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        BOOL parallelExecution = self->_parallelExecution;
        [*(id *)(*((void *)&v14 + 1) + 8 * i) requiredTimeInterval];
        if (v10 >= v7) {
          double v11 = v10;
        }
        else {
          double v11 = v7;
        }
        double v12 = v7 + v10;
        if (parallelExecution) {
          double v7 = v11;
        }
        else {
          double v7 = v12;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }
  else
  {
    double v7 = 0.0;
  }

  return v7;
}

- (id)resultDataClasses
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = [(ARParentTechnique *)self techniques];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v9 = [*(id *)(*((void *)&v12 + 1) + 8 * i) resultDataClasses];
        [v3 unionSet:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  double v10 = (void *)[v3 copy];
  return v10;
}

- (BOOL)reconfigurableFrom:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    id v5 = v4;
    uint64_t v6 = [(ARParentTechnique *)self techniques];
    uint64_t v7 = [v5 techniques];
    uint64_t v8 = [v6 count];
    if (v8 == [v7 count])
    {
      if ([v6 count])
      {
        unint64_t v9 = 0;
        uint64_t v10 = MEMORY[0x1E4F143A8];
        do
        {
          v15[0] = v10;
          v15[1] = 3221225472;
          v15[2] = __40__ARParentTechnique_reconfigurableFrom___block_invoke;
          v15[3] = &unk_1E6186C88;
          id v11 = v6;
          id v16 = v11;
          unint64_t v17 = v9;
          long long v12 = +[ARParentTechnique techinqueInArray:v7 passingTest:v15];
          BOOL v13 = v12 != 0;

          if (!v12) {
            break;
          }
          ++v9;
        }
        while (v9 < [v11 count]);
      }
      else
      {
        BOOL v13 = 1;
      }
    }
    else
    {
      BOOL v13 = 0;
    }
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

uint64_t __40__ARParentTechnique_reconfigurableFrom___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = a2;
  id v5 = [v2 objectAtIndexedSubscript:v3];
  uint64_t v6 = [v5 reconfigurableFrom:v4];

  return v6;
}

- (void)reconfigureFrom:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    id v15 = v4;
    id v5 = v4;
    uint64_t v6 = [(ARParentTechnique *)self techniques];
    uint64_t v7 = [v5 techniques];
    if ([v6 count])
    {
      unint64_t v8 = 0;
      uint64_t v9 = MEMORY[0x1E4F143A8];
      do
      {
        v16[0] = v9;
        v16[1] = 3221225472;
        v16[2] = __37__ARParentTechnique_reconfigureFrom___block_invoke;
        v16[3] = &unk_1E6186C88;
        id v10 = v6;
        id v17 = v10;
        unint64_t v18 = v8;
        id v11 = +[ARParentTechnique techinqueInArray:v7 passingTest:v16];
        long long v12 = [v10 objectAtIndexedSubscript:v8];
        [v12 reconfigureFrom:v11];

        ++v8;
      }
      while (v8 < [v10 count]);
    }
    BOOL v13 = [v5 splitTechniques];
    [(ARTechnique *)self setSplitTechniques:v13];

    long long v14 = [v5 splitTechniqueFowardingStrategy];
    [(ARTechnique *)self setSplitTechniqueFowardingStrategy:v14];

    id v4 = v15;
  }
}

uint64_t __37__ARParentTechnique_reconfigureFrom___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = a2;
  id v5 = [v2 objectAtIndexedSubscript:v3];
  uint64_t v6 = [v5 reconfigurableFrom:v4];

  return v6;
}

- (void)siblingTechniquesDidChange:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = [(ARParentTechnique *)self techniques];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) siblingTechniquesDidChange:v4];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (id)techniqueOfClass:(Class)a3
{
  v10.receiver = self;
  v10.super_class = (Class)ARParentTechnique;
  id v5 = -[ARTechnique techniqueOfClass:](&v10, sel_techniqueOfClass_);
  uint64_t v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    uint64_t v8 = [(ARParentTechnique *)self techniques];
    id v7 = +[ARTechnique techniqueOfClass:a3 inArray:v8];
  }
  return v7;
}

- (id)techniqueMatchingPredicate:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)ARParentTechnique;
  id v5 = [(ARTechnique *)&v19 techniqueMatchingPredicate:v4];
  uint64_t v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v8 = [(ARParentTechnique *)self techniques];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v16;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = [*(id *)(*((void *)&v15 + 1) + 8 * i) techniqueMatchingPredicate:v4];
          if (v13)
          {
            id v7 = (id)v13;

            goto LABEL_13;
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v20 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

    id v7 = 0;
  }
LABEL_13:

  return v7;
}

- (void)setBonusLatency:(double)a3
{
  v7.receiver = self;
  v7.super_class = (Class)ARParentTechnique;
  -[ARTechnique setBonusLatency:](&v7, sel_setBonusLatency_);
  if (!self->_parallelExecution)
  {
    id v5 = [(ARParentTechnique *)self techniques];
    uint64_t v6 = [v5 firstObject];
    [v6 setBonusLatency:a3];
  }
}

- (void)prepare:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v23.receiver = self;
  v23.super_class = (Class)ARParentTechnique;
  -[ARTechnique prepare:](&v23, sel_prepare_);
  if (v3) {
    self->_BOOL parallelExecution = 0;
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = [(ARParentTechnique *)self techniques];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v19 + 1) + 8 * i) prepare:v3];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v25 count:16];
    }
    while (v7);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v10 = [(ARTechnique *)self splitTechniques];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v24 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        [*(id *)(*((void *)&v15 + 1) + 8 * j) prepare:v3];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v24 count:16];
    }
    while (v12);
  }
}

- (id)processResultData:(id)a3 timestamp:(double)a4 context:(id)a5
{
  id v5 = a3;
  return v5;
}

- (NSString)description
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  BOOL v3 = objc_opt_new();
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v4 = [(ARParentTechnique *)self techniques];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(*((void *)&v18 + 1) + 8 * i) description];
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v6);
  }

  if ([v3 count])
  {
    uint64_t v10 = NSString;
    uint64_t v11 = (objc_class *)objc_opt_class();
    uint64_t v12 = NSStringFromClass(v11);
    if (self->_parallelExecution) {
      uint64_t v13 = @"parallel";
    }
    else {
      uint64_t v13 = @"serial";
    }
    long long v14 = [v3 componentsJoinedByString:@", "];
    long long v15 = [v10 stringWithFormat:@"<%@(%p) %@ techniques=[%@]>", v12, self, v13, v14];
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)ARParentTechnique;
    long long v15 = [(ARTechnique *)&v17 description];
  }

  return (NSString *)v15;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ARParentTechnique;
  if ([(ARTechnique *)&v14 isEqual:v4])
  {
    uint64_t v5 = v4;
    if (self->_parallelExecution)
    {
      if (v5[56])
      {
        uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
        uint64_t v7 = [(ARParentTechnique *)self techniques];
        uint64_t v8 = [v6 setWithArray:v7];
        uint64_t v9 = (void *)MEMORY[0x1E4F1CAD0];
        uint64_t v10 = [v5 techniques];
        uint64_t v11 = [v9 setWithArray:v10];
        char v12 = [v8 isEqualToSet:v11];

LABEL_9:
        goto LABEL_10;
      }
    }
    else if (!v5[56])
    {
      uint64_t v7 = [(ARParentTechnique *)self techniques];
      uint64_t v8 = [v5 techniques];
      char v12 = [v7 isEqualToArray:v8];
      goto LABEL_9;
    }
    char v12 = 0;
LABEL_10:

    goto LABEL_11;
  }
  char v12 = 0;
LABEL_11:

  return v12;
}

- (id)_fullDescription
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  BOOL v3 = (void *)MEMORY[0x1E4F28E78];
  v23.receiver = self;
  v23.super_class = (Class)ARParentTechnique;
  id v4 = [(ARTechnique *)&v23 _fullDescription];
  uint64_t v5 = [v3 stringWithFormat:@"%@\n", v4];

  uint64_t v6 = [(ARTechniqueParallelGatherContext *)self->_previousContext description];
  uint64_t v7 = [v6 description];
  uint64_t v8 = [v7 stringByReplacingOccurrencesOfString:@"\n" withString:@"\n\t\t"];
  [v5 appendFormat:@"\tPreviousContext: %@\n", v8];

  [v5 appendFormat:@"\tChild Techniques:\n"];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = [(ARParentTechnique *)self techniques];
  uint64_t v9 = [obj countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = [*(id *)(*((void *)&v19 + 1) + 8 * i) _fullDescription];
        objc_super v14 = [v13 description];
        long long v15 = [v14 stringByReplacingOccurrencesOfString:@"\n" withString:@"\n\t|\t"];
        [v5 appendFormat:@"\t| - %@\n", v15];
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v10);
  }

  long long v16 = (void *)[v5 copy];
  return v16;
}

- (void)technique:(id)a3 didOutputResultData:(id)a4 timestamp:(double)a5 context:(id)a6
{
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  id v13 = [(ARParentTechnique *)self techniques];
  [(ARParentTechnique *)self technique:v12 didOutputResultData:v11 timestamp:v10 context:v13 onTechniques:a5];
}

- (void)technique:(id)a3 didOutputResultData:(id)a4 timestamp:(double)a5 context:(id)a6 onTechniques:(id)a7
{
  uint64_t v95 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v75 = a6;
  id v14 = a7;
  uint64_t v15 = [v14 indexOfObject:v12];
  if (v15 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v16 = v15;
    objc_super v17 = [v12 traceKey];
    v71 = self;
    if (ARTechnique_Request_to_ResultEnd_onceToken != -1) {
      dispatch_once(&ARTechnique_Request_to_ResultEnd_onceToken, &__block_literal_global_405);
    }
    long long v18 = [(id)ARTechnique_Request_to_ResultEnd_keyToCode objectForKeyedSubscript:v17];
    [v18 intValue];

    kdebug_trace();
    long long v19 = [v12 traceKey];
    id v74 = v12;
    if (ARTechnique_Request_fulfilled_onceToken != -1) {
      dispatch_once(&ARTechnique_Request_fulfilled_onceToken, &__block_literal_global_481);
    }
    long long v20 = [(id)ARTechnique_Request_fulfilled_keyToCode objectForKeyedSubscript:v19];
    [v20 intValue];

    kdebug_trace();
    long long v21 = [(ARTechnique *)v71 delegate];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v22 = [(ARTechnique *)v71 delegate];
      objc_super v23 = [v22 delegate];
      objc_opt_class();
      objc_opt_isKindOfClass();
    }
    [v13 count];
    kdebug_trace();
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v70 = v75;
      objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v13, "count"));
      id obj = (id)objc_claimAutoreleasedReturnValue();
      long long v84 = 0u;
      long long v85 = 0u;
      long long v86 = 0u;
      long long v87 = 0u;
      id v24 = v13;
      uint64_t v25 = [v24 countByEnumeratingWithState:&v84 objects:v94 count:16];
      if (v25)
      {
        uint64_t v26 = v25;
        id v69 = v13;
        uint64_t v27 = *(void *)v85;
        unint64_t v28 = v16 + 1;
        do
        {
          for (uint64_t i = 0; i != v26; ++i)
          {
            if (*(void *)v85 != v27) {
              objc_enumerationMutation(v24);
            }
            id v30 = *(id *)(*((void *)&v84 + 1) + 8 * i);
            for (j = v28; j < [v14 count]; id v30 = v35)
            {
              v32 = [v14 objectAtIndexedSubscript:j];
              uint64_t v33 = [v32 processData:v30];

              if (v33) {
                v34 = v33;
              }
              else {
                v34 = v30;
              }
              id v35 = v34;

              ++j;
            }
            if (v30) {
              [obj addObject:v30];
            }
          }
          uint64_t v26 = [v24 countByEnumeratingWithState:&v84 objects:v94 count:16];
        }
        while (v26);
        id v12 = v74;
        id v13 = v69;
      }
      else
      {
        unint64_t v28 = v16 + 1;
      }

      v43 = v70;
      [v70 addResultData:obj];
      if (v28 >= [v14 count])
      {
        [(ARParentTechnique *)v71 _submitResultsForTimestamp:v70 context:a5];
      }
      else
      {
        v44 = [v14 objectAtIndexedSubscript:v28];
        v45 = [v44 traceKey];
        if (ARTechnique_Request_to_Result_onceToken != -1) {
          dispatch_once(&ARTechnique_Request_to_Result_onceToken, &__block_literal_global_179);
        }
        v46 = [(id)ARTechnique_Request_to_Result_keyToCode objectForKeyedSubscript:v45];
        [v46 intValue];

        kdebug_trace();
        v47 = [v44 traceKey];
        if (ARTechnique_Request_begin_onceToken != -1) {
          dispatch_once(&ARTechnique_Request_begin_onceToken, &__block_literal_global_329);
        }
        long long v48 = [(id)ARTechnique_Request_begin_keyToCode objectForKeyedSubscript:v47];
        [v48 intValue];

        kdebug_trace();
        v43 = v70;
        [v44 requestResultDataAtTimestamp:v70 context:a5];
      }
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v36 = v75;
        uint64_t v37 = [v14 count];
        if (v37 != [v36 techniqueCount])
        {
          uint64_t v16 = [v36 indexForTechnique:v12];
          if (v16 == 0x7FFFFFFFFFFFFFFFLL)
          {
            v38 = _ARLogTechnique_3();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
            {
              v39 = (objc_class *)objc_opt_class();
              v40 = NSStringFromClass(v39);
              v41 = [v36 imageData];
              [v41 timestamp];
              *(_DWORD *)buf = 138412546;
              v91 = v40;
              __int16 v92 = 2048;
              uint64_t v93 = v42;
              _os_log_impl(&dword_1B88A2000, v38, OS_LOG_TYPE_INFO, "Ignoring result from %@, because it isn't collected by gathering context at timestamp %f.", buf, 0x16u);
            }
            goto LABEL_64;
          }
        }
        long long v49 = [v36 addResultData:v13 forTechniqueAtIndex:v16];
        if (v49) {
          [v12 mergeResultData:v49 intoData:v13 context:v36];
        }
        if ([v12 deterministicMode]
          && [v36 requiredTimeIntervalComplete]
          && [v36 deterministicResultsCaptured])
        {
          [(ARParentTechnique *)v71 _submitResultsForTimestamp:v36 context:a5];
        }
      }
    }
    long long v82 = 0u;
    long long v83 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    id v36 = [v12 splitTechniques];
    uint64_t v50 = [v36 countByEnumeratingWithState:&v80 objects:v89 count:16];
    if (v50)
    {
      uint64_t v51 = v50;
      v52 = v13;
      uint64_t v53 = *(void *)v81;
      id obja = v36;
      do
      {
        for (uint64_t k = 0; k != v51; ++k)
        {
          if (*(void *)v81 != v53) {
            objc_enumerationMutation(obja);
          }
          v55 = *(void **)(*((void *)&v80 + 1) + 8 * k);
          v56 = [v12 splitTechniqueFowardingStrategy];

          if (!v56
            || ([v12 splitTechniqueFowardingStrategy],
                v57 = objc_claimAutoreleasedReturnValue(),
                int v58 = [v57 shouldRequestResultDataAtTimestamp:v75 context:a5],
                v57,
                v58))
          {
            v59 = [ARTechniqueSequentialGatherContext alloc];
            v60 = [v75 parentContext];
            v61 = [(ARTechniqueSequentialGatherContext *)v59 initWithParentContext:v60];

            v62 = [v75 gatheredData];
            [(ARTechniqueSequentialGatherContext *)v61 addResultData:v62];

            [v55 requestResultDataAtTimestamp:v61 context:a5];
          }
          long long v78 = 0u;
          long long v79 = 0u;
          long long v76 = 0u;
          long long v77 = 0u;
          id v63 = v52;
          uint64_t v64 = [v63 countByEnumeratingWithState:&v76 objects:v88 count:16];
          if (v64)
          {
            uint64_t v65 = v64;
            uint64_t v66 = *(void *)v77;
            do
            {
              for (uint64_t m = 0; m != v65; ++m)
              {
                if (*(void *)v77 != v66) {
                  objc_enumerationMutation(v63);
                }
                id v68 = (id)[v55 processData:*(void *)(*((void *)&v76 + 1) + 8 * m)];
              }
              uint64_t v65 = [v63 countByEnumeratingWithState:&v76 objects:v88 count:16];
            }
            while (v65);
          }

          id v12 = v74;
        }
        id v36 = obja;
        uint64_t v51 = [obja countByEnumeratingWithState:&v80 objects:v89 count:16];
      }
      while (v51);
      id v13 = v52;
    }
LABEL_64:
  }
}

- (void)technique:(id)a3 didFailWithError:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  uint64_t v7 = [(ARTechnique *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    uint64_t v9 = [(ARTechnique *)self delegate];
    [v9 technique:v10 didFailWithError:v6];
  }
}

- (void)_submitResultsForTimestamp:(double)a3 context:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  kdebug_trace();
  uint64_t v7 = [v6 captureGatheredData];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  char v8 = [(ARParentTechnique *)self techniques];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      uint64_t v12 = 0;
      id v13 = v7;
      do
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v7 = [*(id *)(*((void *)&v18 + 1) + 8 * v12) processResultData:v13 timestamp:v6 context:a3];

        ++v12;
        id v13 = v7;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }

  id v14 = [(ARTechnique *)self delegate];
  char v15 = objc_opt_respondsToSelector();

  if (v15)
  {
    uint64_t v16 = [(ARTechnique *)self delegate];
    objc_super v17 = [v6 parentContext];
    [v16 technique:self didOutputResultData:v7 timestamp:v17 context:a3];
  }
  kdebug_trace();
}

+ (id)techinqueInArray:(id)a3 passingTest:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (unsigned int (**)(id, void *))a4;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if (v7[2](v7, v13))
        {
          id v15 = v13;
          goto LABEL_13;
        }
        id v14 = objc_msgSend(v13, "techniques", (void)v17);
        id v15 = [a1 techinqueInArray:v14 passingTest:v7];

        if (v15) {
          goto LABEL_13;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      id v15 = 0;
      if (v10) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v15 = 0;
  }
LABEL_13:

  return v15;
}

+ (id)techniquesByReplacingOriginalTechniques:(id)a3 withReplacementTechniques:(id)a4 passingTest:(id)a5
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v38 = a4;
  id v7 = a5;
  id v8 = (void *)[a3 mutableCopy];
  uint64_t v9 = [v8 count];
  uint64_t v37 = v7;
  if (!v9) {
    goto LABEL_21;
  }
  uint64_t v10 = v9;
  char v11 = 0;
  uint64_t v12 = 0;
  id v13 = off_1E6184000;
  do
  {
    id v14 = [v8 objectAtIndexedSubscript:v12];
    id v15 = v13[58];
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __99__ARParentTechnique_techniquesByReplacingOriginalTechniques_withReplacementTechniques_passingTest___block_invoke;
    v43[3] = &unk_1E6186CB0;
    id v16 = v7;
    id v45 = v16;
    id v17 = v14;
    id v44 = v17;
    long long v18 = [(__objc2_class *)v15 techinqueInArray:v38 passingTest:v43];
    if (v18)
    {
      long long v19 = _ARLogTechnique_3();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        long long v20 = (objc_class *)objc_opt_class();
        long long v21 = NSStringFromClass(v20);
        uint64_t v22 = (objc_class *)objc_opt_class();
        uint64_t v23 = NSStringFromClass(v22);
        *(_DWORD *)buf = 138413058;
        long long v48 = v21;
        __int16 v49 = 2048;
        id v50 = v17;
        __int16 v51 = 2112;
        v52 = v23;
        __int16 v53 = 2048;
        v54 = v18;
        _os_log_impl(&dword_1B88A2000, v19, OS_LOG_TYPE_INFO, "Replacing %@(%p) with %@(%p)", buf, 0x2Au);

        id v7 = v37;
      }

      [v8 setObject:v18 atIndexedSubscript:v12];
      char v11 = 1;
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v24 = v17;
        uint64_t v25 = [v24 techniques];
        uint64_t v26 = [a1 techniquesByReplacingOriginalTechniques:v25 withReplacementTechniques:v38 passingTest:v16];

        if (v26)
        {
          [v24 setTechniques:v26];
          char v11 = 1;
        }

        id v7 = v37;
      }
    }

    ++v12;
    id v13 = off_1E6184000;
  }
  while (v10 != v12);
  if (v11)
  {
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v27 = v8;
    uint64_t v28 = [v27 countByEnumeratingWithState:&v39 objects:v46 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v29; ++i)
        {
          if (*(void *)v40 != v30) {
            objc_enumerationMutation(v27);
          }
          v32 = *(void **)(*((void *)&v39 + 1) + 8 * i);
          uint64_t v33 = (void *)[v27 mutableCopy];
          [v33 removeObject:v32];
          [v32 siblingTechniquesDidChange:v33];
        }
        uint64_t v29 = [v27 countByEnumeratingWithState:&v39 objects:v46 count:16];
      }
      while (v29);
    }

    id v34 = v27;
  }
  else
  {
LABEL_21:
    id v34 = 0;
  }

  return v34;
}

uint64_t __99__ARParentTechnique_techniquesByReplacingOriginalTechniques_withReplacementTechniques_passingTest___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), a2);
}

+ (id)techniquesByForceReplacingTechniques:(id)a3 withMatchingClassTechniques:(id)a4
{
  id v6 = a3;
  id v7 = [a1 techniquesByReplacingOriginalTechniques:v6 withReplacementTechniques:a4 passingTest:&__block_literal_global_71_0];
  id v8 = v7;
  if (!v7) {
    id v7 = v6;
  }
  id v9 = v7;

  return v9;
}

BOOL __86__ARParentTechnique_techniquesByForceReplacingTechniques_withMatchingClassTechniques___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  if ([v5 isMemberOfClass:objc_opt_class()])
  {
    BOOL v6 = 0;
  }
  else
  {
    uint64_t v7 = objc_opt_class();
    BOOL v6 = v7 == objc_opt_class();
  }

  return v6;
}

- (NSArray)_internalTechniques
{
  return (NSArray *)objc_getProperty(self, a2, 88, 1);
}

- (void)set_internalTechniques:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__internalTechniques, 0);
  objc_storeStrong((id *)&self->_previousContext, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end