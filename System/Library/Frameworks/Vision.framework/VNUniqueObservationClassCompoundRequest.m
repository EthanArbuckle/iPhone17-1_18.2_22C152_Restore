@interface VNUniqueObservationClassCompoundRequest
- (VNUniqueObservationClassCompoundRequest)initWithOriginalRequests:(id)a3 requestToObservationClassMap:(id)a4;
- (VNUniqueObservationClassCompoundRequest)initWithSubrequests:(id)a3 uniqueObservationClasses:(id)a4;
- (void)assignOriginalRequestsResultsFromObservations:(id)a3 obtainedInPerformingContext:(id)a4;
@end

@implementation VNUniqueObservationClassCompoundRequest

- (void).cxx_destruct
{
}

- (void)assignOriginalRequestsResultsFromObservations:(id)a3 obtainedInPerformingContext:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = v5;
  v8 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v34 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v33 + 1) + 8 * i);
        uint64_t v15 = objc_opt_class();
        v16 = [v8 objectForKey:v15];
        if (v16)
        {
          v17 = v16;
          [v16 addObject:v14];
        }
        else
        {
          v17 = [MEMORY[0x1E4F1CA48] arrayWithObject:v14];
          [v8 setObject:v17 forKey:v15];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v11);
  }

  v27 = v9;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  v18 = [(VNCompoundRequest *)self originalRequests];
  uint64_t v19 = [v18 countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v30;
    v22 = (void *)MEMORY[0x1E4F1CBF0];
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v30 != v21) {
          objc_enumerationMutation(v18);
        }
        v24 = *(void **)(*((void *)&v29 + 1) + 8 * j);
        uint64_t v25 = objc_msgSend(v8, "objectForKey:", -[NSMapTable objectForKey:](self->_requestToObservationClassMap, "objectForKey:", v24, v27));
        if (v25) {
          v26 = (void *)v25;
        }
        else {
          v26 = v22;
        }
        [v24 setResults:v26];
        [v6 cacheObservationsOfRequest:v24];
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v29 objects:v37 count:16];
    }
    while (v20);
  }
}

- (VNUniqueObservationClassCompoundRequest)initWithOriginalRequests:(id)a3 requestToObservationClassMap:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)VNUniqueObservationClassCompoundRequest;
  v8 = [(VNCompoundRequest *)&v11 initWithOriginalRequests:a3];
  id v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_requestToObservationClassMap, a4);
  }

  return v9;
}

- (VNUniqueObservationClassCompoundRequest)initWithSubrequests:(id)a3 uniqueObservationClasses:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 count];
  +[VNError VNAssert:log:](VNError, "VNAssert:log:", v8 == [v7 count], @"Unexpected number of unique observation classes");
  id v9 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  if (v8)
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      uint64_t v11 = [v7 objectAtIndex:i];
      uint64_t v12 = [v6 objectAtIndex:i];
      [v9 setObject:v11 forKey:v12];
    }
  }
  v13 = [(VNUniqueObservationClassCompoundRequest *)self initWithOriginalRequests:v6 requestToObservationClassMap:v9];

  return v13;
}

@end