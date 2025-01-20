@interface ARSplitTechniqueSynchronizerTechnique
- (ARSplitTechniqueSynchronizerTechnique)initWithSynchronizedResultDataClasses:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)reconfigurableFrom:(id)a3;
- (NSSet)synchronizedResultDataClasses;
- (void)_recursivelyGatherData:(id)a3 fromContext:(id)a4;
- (void)requestResultDataAtTimestamp:(double)a3 context:(id)a4;
- (void)technique:(id)a3 didFailWithError:(id)a4;
- (void)technique:(id)a3 didOutputResultData:(id)a4 timestamp:(double)a5 context:(id)a6;
@end

@implementation ARSplitTechniqueSynchronizerTechnique

- (ARSplitTechniqueSynchronizerTechnique)initWithSynchronizedResultDataClasses:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)ARSplitTechniqueSynchronizerTechnique;
  v5 = [(ARTechnique *)&v16 init];
  if (v5)
  {
    dispatch_semaphore_t v6 = dispatch_semaphore_create(1);
    lastReceivedResultsSemaphore = v5->_lastReceivedResultsSemaphore;
    v5->_lastReceivedResultsSemaphore = (OS_dispatch_semaphore *)v6;

    uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
    lastReceivedResults = v5->_lastReceivedResults;
    v5->_lastReceivedResults = (NSMutableArray *)v8;

    if (+[ARKitUserDefaults BOOLForKey:@"com.apple.arkit.session.qatracing.dumpSemanticSegmantationData"])
    {
      v10 = (void *)[v4 mutableCopy];
      [v10 addObject:objc_opt_class()];

      id v4 = v10;
    }
    objc_storeStrong((id *)&v5->_synchronizedResultDataClasses, v4);
    v11 = [[ARCircularArray alloc] initWithCapacity:2];
    contextsWaitingForSynchronizationData = v5->_contextsWaitingForSynchronizationData;
    v5->_contextsWaitingForSynchronizationData = v11;

    uint64_t v13 = [MEMORY[0x1E4F1CA60] dictionary];
    pendingResults = v5->_pendingResults;
    v5->_pendingResults = (NSMutableDictionary *)v13;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ARSplitTechniqueSynchronizerTechnique;
  if ([(ARTechnique *)&v8 isEqual:v4])
  {
    v5 = [v4 synchronizedResultDataClasses];
    char v6 = [v5 isEqualToSet:self->_synchronizedResultDataClasses];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (BOOL)reconfigurableFrom:(id)a3
{
  return 0;
}

- (void)requestResultDataAtTimestamp:(double)a3 context:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_lastReceivedResultsSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  if ([(NSMutableArray *)self->_lastReceivedResults count])
  {
    v19 = v6;
    v7 = [MEMORY[0x1E4F1CA48] array];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    objc_super v8 = self->_lastReceivedResults;
    uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v21;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v21 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v20 + 1) + 8 * v12);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v7 addObjectsFromArray:v13];
          }
          else {
            [v7 addObject:v13];
          }
          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v10);
    }

    [(NSMutableArray *)self->_lastReceivedResults removeAllObjects];
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_lastReceivedResultsSemaphore);
    v14 = [ARNonSynchronousData alloc];
    id v6 = v19;
    v15 = [v19 imageData];
    [v15 timestamp];
    objc_super v16 = -[ARNonSynchronousData initWithGatheredData:timestamp:](v14, "initWithGatheredData:timestamp:", v7);

    v17 = [(ARTechnique *)self delegate];
    v24 = v16;
    v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
    [v17 technique:self didOutputResultData:v18 timestamp:v19 context:a3];
  }
  else
  {
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_lastReceivedResultsSemaphore);
    v7 = [(ARTechnique *)self delegate];
    [v7 technique:self didOutputResultData:MEMORY[0x1E4F1CBF0] timestamp:v6 context:a3];
  }
}

- (void)technique:(id)a3 didOutputResultData:(id)a4 timestamp:(double)a5 context:(id)a6
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v8 = a6;
  uint64_t v9 = [MEMORY[0x1E4F1CA48] arrayWithArray:a4];
  [(ARSplitTechniqueSynchronizerTechnique *)self _recursivelyGatherData:v9 fromContext:v8];
  uint64_t v10 = [MEMORY[0x1E4F1CA48] array];
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  obuint64_t j = v9;
  uint64_t v11 = [obj countByEnumeratingWithState:&v52 objects:v58 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v53;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v53 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void *)(*((void *)&v52 + 1) + 8 * i);
        if ([(NSSet *)self->_synchronizedResultDataClasses containsObject:objc_opt_class()]) {
          [v10 addObject:v15];
        }
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v52 objects:v58 count:16];
    }
    while (v12);
  }

  if ([(NSSet *)self->_synchronizedResultDataClasses containsObject:objc_opt_class()])
  {
    objc_super v16 = [v8 imageData];
    [v10 addObject:v16];
  }
  v38 = v10;
  v40 = v8;
  if ([v10 count])
  {
    v17 = NSNumber;
    v18 = objc_msgSend(v8, "imageData", v10, v8);
    [v18 timestamp];
    v19 = objc_msgSend(v17, "numberWithDouble:");

    contextsWaitingForSynchronizationData = self->_contextsWaitingForSynchronizationData;
    long long v21 = NSNumber;
    long long v22 = [v8 imageData];
    [v22 timestamp];
    long long v23 = objc_msgSend(v21, "numberWithDouble:");
    v24 = [(ARCircularArray *)contextsWaitingForSynchronizationData addObject:v23];

    if (v24) {
      [(NSMutableDictionary *)self->_pendingResults removeObjectForKey:v24];
    }
    v25 = [(NSMutableDictionary *)self->_pendingResults objectForKeyedSubscript:v19];
    if (!v25)
    {
      v25 = [MEMORY[0x1E4F1CA48] array];
    }
    [v25 addObjectsFromArray:v10];
    [(NSMutableDictionary *)self->_pendingResults setObject:v25 forKeyedSubscript:v19];
  }
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v41 = [(NSMutableDictionary *)self->_pendingResults allKeys];
  uint64_t v26 = [v41 countByEnumeratingWithState:&v48 objects:v57 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v43 = *(void *)v49;
    do
    {
      for (uint64_t j = 0; j != v27; ++j)
      {
        if (*(void *)v49 != v43) {
          objc_enumerationMutation(v41);
        }
        uint64_t v29 = *(void *)(*((void *)&v48 + 1) + 8 * j);
        v30 = [MEMORY[0x1E4F1CA80] set];
        long long v44 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        v31 = [(NSMutableDictionary *)self->_pendingResults objectForKeyedSubscript:v29];
        uint64_t v32 = [v31 countByEnumeratingWithState:&v44 objects:v56 count:16];
        if (v32)
        {
          uint64_t v33 = v32;
          uint64_t v34 = *(void *)v45;
          do
          {
            for (uint64_t k = 0; k != v33; ++k)
            {
              if (*(void *)v45 != v34) {
                objc_enumerationMutation(v31);
              }
              [v30 addObject:objc_opt_class()];
            }
            uint64_t v33 = [v31 countByEnumeratingWithState:&v44 objects:v56 count:16];
          }
          while (v33);
        }

        if ([v30 isEqualToSet:self->_synchronizedResultDataClasses])
        {
          dispatch_semaphore_wait((dispatch_semaphore_t)self->_lastReceivedResultsSemaphore, 0xFFFFFFFFFFFFFFFFLL);
          lastReceivedResults = self->_lastReceivedResults;
          v37 = [(NSMutableDictionary *)self->_pendingResults objectForKeyedSubscript:v29];
          [(NSMutableArray *)lastReceivedResults addObject:v37];

          dispatch_semaphore_signal((dispatch_semaphore_t)self->_lastReceivedResultsSemaphore);
          [(NSMutableDictionary *)self->_pendingResults removeObjectForKey:v29];
        }
      }
      uint64_t v27 = [v41 countByEnumeratingWithState:&v48 objects:v57 count:16];
    }
    while (v27);
  }
}

- (void)_recursivelyGatherData:(id)a3 fromContext:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = v6;
      id v8 = [v7 gatheredData];
      [v10 addObjectsFromArray:v8];

      uint64_t v9 = [v7 parentContext];

      [(ARSplitTechniqueSynchronizerTechnique *)self _recursivelyGatherData:v10 fromContext:v9];
    }
  }
}

- (void)technique:(id)a3 didFailWithError:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (_ARLogTechnique_onceToken_2 != -1) {
    dispatch_once(&_ARLogTechnique_onceToken_2, &__block_literal_global_24);
  }
  id v8 = (void *)_ARLogTechnique_logObj_2;
  if (os_log_type_enabled((os_log_t)_ARLogTechnique_logObj_2, OS_LOG_TYPE_ERROR))
  {
    uint64_t v9 = v8;
    id v10 = (objc_class *)objc_opt_class();
    uint64_t v11 = NSStringFromClass(v10);
    uint64_t v12 = [v7 code];
    uint64_t v13 = [v7 localizedDescription];
    int v14 = 138544130;
    uint64_t v15 = v11;
    __int16 v16 = 2048;
    v17 = self;
    __int16 v18 = 2048;
    uint64_t v19 = v12;
    __int16 v20 = 2112;
    long long v21 = v13;
    _os_log_impl(&dword_1B88A2000, v9, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Split technique pipeline failed with error: %ld - %@", (uint8_t *)&v14, 0x2Au);
  }
}

- (NSSet)synchronizedResultDataClasses
{
  return self->_synchronizedResultDataClasses;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_synchronizedResultDataClasses, 0);
  objc_storeStrong((id *)&self->_pendingResults, 0);
  objc_storeStrong((id *)&self->_contextsWaitingForSynchronizationData, 0);
  objc_storeStrong((id *)&self->_lastReceivedResultsSemaphore, 0);
  objc_storeStrong((id *)&self->_lastReceivedResults, 0);
}

@end