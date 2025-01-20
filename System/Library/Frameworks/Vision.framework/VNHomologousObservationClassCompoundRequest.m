@interface VNHomologousObservationClassCompoundRequest
- (VNHomologousObservationClassCompoundRequest)initWithSubrequests:(id)a3;
- (id)originalRequestsOfClass:(Class)a3;
- (void)assignOriginalRequestsResultsFromObservations:(id)a3 obtainedInPerformingContext:(id)a4;
@end

@implementation VNHomologousObservationClassCompoundRequest

- (VNHomologousObservationClassCompoundRequest)initWithSubrequests:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)VNHomologousObservationClassCompoundRequest;
  v5 = [(VNCompoundRequest *)&v38 initWithOriginalRequests:v4];
  if (v5)
  {
    v6 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v28 = v4;
    id v7 = v4;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v34 objects:v40 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v35 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          uint64_t v13 = objc_msgSend(v12, "frameworkClass", v28);
          id v14 = [v6 objectForKey:v13];
          if (!v14)
          {
            id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            [v6 setObject:v14 forKey:v13];
          }
          [v14 addObject:v12];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v34 objects:v40 count:16];
      }
      while (v9);
    }

    uint64_t v15 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    requestsClassMapping = v5->_requestsClassMapping;
    v17 = v5;
    v5->_requestsClassMapping = (NSMapTable *)v15;

    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    obuint64_t j = [v6 keyEnumerator];
    uint64_t v18 = [obj countByEnumeratingWithState:&v30 objects:v39 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v31;
      do
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v31 != v20) {
            objc_enumerationMutation(obj);
          }
          uint64_t v22 = *(void *)(*((void *)&v30 + 1) + 8 * j);
          v23 = objc_msgSend(v6, "objectForKey:", v22, v28);
          v24 = v17->_requestsClassMapping;
          v25 = (void *)[v23 copy];
          [(NSMapTable *)v24 setObject:v25 forKey:v22];
        }
        uint64_t v19 = [obj countByEnumeratingWithState:&v30 objects:v39 count:16];
      }
      while (v19);
    }

    v5 = v17;
    v26 = v17;

    id v4 = v28;
  }

  return v5;
}

- (void).cxx_destruct
{
}

- (id)originalRequestsOfClass:(Class)a3
{
  return [(NSMapTable *)self->_requestsClassMapping objectForKey:a3];
}

- (void)assignOriginalRequestsResultsFromObservations:(id)a3 obtainedInPerformingContext:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3A8];
  id v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = NSStringFromSelector(a2);
  [v5 raise:v6, @"%@ does not override %@", v9, v8 format];
}

@end