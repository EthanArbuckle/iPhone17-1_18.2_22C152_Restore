@interface VNRequestForensics
- (BOOL)resultsObtainedFromObservationsCacheForRequest:(id)a3;
- (NSArray)orderedRequests;
- (NSArray)originalRequests;
- (NSArray)performedRequests;
- (VNRequestForensics)initWithOriginalRequests:(id)a3;
- (id)_childRequestsImplicitlyPerformedOnBehalfOfParentRequest:(id)a3;
- (id)_humanReadableLabelForRequest:(id)a3;
- (id)description;
- (id)keyUsedToCacheResultsOfRequest:(id)a3;
- (id)requestThatProvidedObservationsForRequest:(id)a3;
- (id)requestsImplicitlyPerformedOnBehalfOfRequest:(id)a3;
- (id)requestsThatLookedUpCachedResultsKey:(id)a3;
- (void)cachedObservationsWithKey:(id)a3 wereCheckedOnBehalfOfRequest:(id)a4;
- (void)cachedObservationsWithKey:(id)a3 wereLocatedOnBehalfOfRequest:(id)a4;
- (void)performedRequest:(id)a3 withError:(id)a4;
- (void)performingOrderedDependentRequests:(id)a3 onBehalfOfRequest:(id)a4;
- (void)performingRequest:(id)a3;
- (void)request:(id)a3 cachedResultsWithObservationsCacheKey:(id)a4;
- (void)setOrderedRequests:(id)a3;
@end

@implementation VNRequestForensics

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestToHumanReadableLabelMap, 0);
  objc_storeStrong((id *)&self->_ledger, 0);
  objc_storeStrong((id *)&self->_locatedCachedResultsOnBehalfOfRequest, 0);
  objc_storeStrong((id *)&self->_checkedCachedResultsOnBehalfOfRequest, 0);
  objc_storeStrong((id *)&self->_cachedRequestResults, 0);
  objc_storeStrong((id *)&self->_performedRequests, 0);
  objc_storeStrong((id *)&self->_implicitRequests, 0);
  objc_storeStrong((id *)&self->_orderedRequests, 0);

  objc_storeStrong((id *)&self->_originalRequests, 0);
}

- (id)description
{
  return &stru_1EF75C0C0;
}

- (BOOL)resultsObtainedFromObservationsCacheForRequest:(id)a3
{
  return 0;
}

- (id)requestThatProvidedObservationsForRequest:(id)a3
{
  return 0;
}

- (id)requestsImplicitlyPerformedOnBehalfOfRequest:(id)a3
{
  return 0;
}

- (id)_childRequestsImplicitlyPerformedOnBehalfOfParentRequest:(id)a3
{
  return 0;
}

- (id)requestsThatLookedUpCachedResultsKey:(id)a3
{
  return 0;
}

- (id)keyUsedToCacheResultsOfRequest:(id)a3
{
  return 0;
}

- (NSArray)performedRequests
{
  return 0;
}

- (NSArray)orderedRequests
{
  return 0;
}

- (NSArray)originalRequests
{
  return 0;
}

- (void)cachedObservationsWithKey:(id)a3 wereLocatedOnBehalfOfRequest:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  v7 = [[_VNRequestForensicsRequestAndObservationsCacheKeyTuple alloc] initWithRequest:v6 observationsCacheKey:v14];
  v8 = self;
  objc_sync_enter(v8);
  id v9 = [NSString alloc];
  v10 = [(_VNRequestForensicsRequestAndObservationsCacheKeyTuple *)v7 request];
  v11 = [(VNRequestForensics *)v8 _humanReadableLabelForRequest:v10];
  v12 = [(_VNRequestForensicsRequestAndObservationsCacheKeyTuple *)v7 observationsCacheKey];
  v13 = (void *)[v9 initWithFormat:@"%@ hit %@", v11, v12];

  [(NSMutableArray *)v8->_locatedCachedResultsOnBehalfOfRequest addObject:v7];
  [(NSMutableArray *)v8->_ledger addObject:v13];

  objc_sync_exit(v8);
}

- (void)cachedObservationsWithKey:(id)a3 wereCheckedOnBehalfOfRequest:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  v7 = [[_VNRequestForensicsRequestAndObservationsCacheKeyTuple alloc] initWithRequest:v6 observationsCacheKey:v14];
  v8 = self;
  objc_sync_enter(v8);
  id v9 = [NSString alloc];
  v10 = [(_VNRequestForensicsRequestAndObservationsCacheKeyTuple *)v7 request];
  v11 = [(VNRequestForensics *)v8 _humanReadableLabelForRequest:v10];
  v12 = [(_VNRequestForensicsRequestAndObservationsCacheKeyTuple *)v7 observationsCacheKey];
  v13 = (void *)[v9 initWithFormat:@"%@ looked up %@", v11, v12];

  [(NSMutableArray *)v8->_checkedCachedResultsOnBehalfOfRequest addObject:v7];
  [(NSMutableArray *)v8->_ledger addObject:v13];

  objc_sync_exit(v8);
}

- (void)request:(id)a3 cachedResultsWithObservationsCacheKey:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  v7 = [[_VNRequestForensicsRequestAndObservationsCacheKeyTuple alloc] initWithRequest:v15 observationsCacheKey:v6];
  v8 = self;
  objc_sync_enter(v8);
  id v9 = [NSString alloc];
  v10 = [(_VNRequestForensicsRequestAndObservationsCacheKeyTuple *)v7 request];
  v11 = [(VNRequestForensics *)v8 _humanReadableLabelForRequest:v10];
  v12 = [(_VNRequestForensicsRequestAndObservationsCacheKeyTuple *)v7 observationsCacheKey];
  v13 = (void *)[v9 initWithFormat:@"%@ cached %@", v11, v12];

  id v14 = (void *)[[NSString alloc] initWithFormat:@"%@ was already recorded as a cached result", v7];
  +[VNError VNAssert:[(NSMutableArray *)v8->_cachedRequestResults containsObject:v7] ^ 1 log:v14];
  [(NSMutableArray *)v8->_cachedRequestResults addObject:v7];
  [(NSMutableArray *)v8->_ledger addObject:v13];

  objc_sync_exit(v8);
}

- (void)performedRequest:(id)a3 withError:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  v7 = [[_VNRequestForensicsRequestAndErrorTuple alloc] initWithRequest:v14 error:v6];
  id v8 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  id v9 = self;
  objc_sync_enter(v9);
  v10 = [(_VNRequestForensicsRequestAndErrorTuple *)v7 request];
  v11 = [(VNRequestForensics *)v9 _humanReadableLabelForRequest:v10];
  [v8 appendFormat:@"performed %@", v11];

  uint64_t v12 = [(_VNRequestForensicsRequestAndErrorTuple *)v7 error];
  v13 = (void *)v12;
  if (v12) {
    [v8 appendFormat:@", failed with %@", v12];
  }
  [(NSMutableArray *)v9->_performedRequests addObject:v7];
  [(NSMutableArray *)v9->_ledger addObject:v8];

  objc_sync_exit(v9);
}

- (void)performingRequest:(id)a3
{
  id v8 = a3;
  v4 = self;
  objc_sync_enter(v4);
  id v5 = [NSString alloc];
  id v6 = [(VNRequestForensics *)v4 _humanReadableLabelForRequest:v8];
  v7 = (void *)[v5 initWithFormat:@"performing %@", v6];

  [(NSMutableArray *)v4->_ledger addObject:v7];
  objc_sync_exit(v4);
}

- (void)performingOrderedDependentRequests:(id)a3 onBehalfOfRequest:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [[_VNRequestForensicsParentChildRequests alloc] initWithParentRequest:v7 orderedChildRequests:v6];
  id v9 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  v10 = self;
  objc_sync_enter(v10);
  v11 = [(VNRequestForensics *)v10 _humanReadableLabelForRequest:v7];
  [v9 appendFormat:@"%@ created", v11];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v12 = v6;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v18;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v12);
        }
        v16 = [(VNRequestForensics *)v10 _humanReadableLabelForRequest:*(void *)(*((void *)&v17 + 1) + 8 * v15)];
        [v9 appendFormat:@" %@", v16];

        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v13);
  }

  [(NSMutableArray *)v10->_implicitRequests addObject:v8];
  [(NSMutableArray *)v10->_ledger addObject:v9];
  objc_sync_exit(v10);
}

- (void)setOrderedRequests:(id)a3
{
  id v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  +[VNError VNAssert:v4->_orderedRequests == 0 log:@"attempting to re-assign ordered requests"];
  uint64_t v5 = [v7 copy];
  orderedRequests = v4->_orderedRequests;
  v4->_orderedRequests = (NSArray *)v5;

  objc_sync_exit(v4);
}

- (VNRequestForensics)initWithOriginalRequests:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)VNRequestForensics;
  uint64_t v5 = [(VNRequestForensics *)&v34 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    originalRequests = v5->_originalRequests;
    v5->_originalRequests = (NSArray *)v6;

    id v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    implicitRequests = v5->_implicitRequests;
    v5->_implicitRequests = v8;

    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    performedRequests = v5->_performedRequests;
    v5->_performedRequests = v10;

    id v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    cachedRequestResults = v5->_cachedRequestResults;
    v5->_cachedRequestResults = v12;

    uint64_t v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    checkedCachedResultsOnBehalfOfRequest = v5->_checkedCachedResultsOnBehalfOfRequest;
    v5->_checkedCachedResultsOnBehalfOfRequest = v14;

    v16 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    locatedCachedResultsOnBehalfOfRequest = v5->_locatedCachedResultsOnBehalfOfRequest;
    v5->_locatedCachedResultsOnBehalfOfRequest = v16;

    long long v18 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    ledger = v5->_ledger;
    v5->_ledger = v18;

    uint64_t v20 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    requestToHumanReadableLabelMap = v5->_requestToHumanReadableLabelMap;
    v5->_requestToHumanReadableLabelMap = (NSMapTable *)v20;

    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v22 = v4;
    uint64_t v23 = [v22 countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v31;
      do
      {
        uint64_t v26 = 0;
        do
        {
          if (*(void *)v31 != v25) {
            objc_enumerationMutation(v22);
          }
          id v27 = -[VNRequestForensics _humanReadableLabelForRequest:](v5, "_humanReadableLabelForRequest:", *(void *)(*((void *)&v30 + 1) + 8 * v26++), (void)v30);
        }
        while (v24 != v26);
        uint64_t v24 = [v22 countByEnumeratingWithState:&v30 objects:v35 count:16];
      }
      while (v24);
    }

    v28 = v5;
  }

  return v5;
}

- (id)_humanReadableLabelForRequest:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [(NSMapTable *)self->_requestToHumanReadableLabelMap objectForKey:v4];
    if (!v5)
    {
      NSUInteger v6 = [(NSMapTable *)self->_requestToHumanReadableLabelMap count] + 1;
      id v7 = NSString;
      id v8 = (objc_class *)objc_opt_class();
      id v9 = VNRequestRevisionString(v8, [v4 resolvedRevision]);
      uint64_t v5 = [v7 stringWithFormat:@"%@ #%lu (%p)", v9, v6, v4];

      [(NSMapTable *)self->_requestToHumanReadableLabelMap setObject:v5 forKey:v4];
    }
    id v10 = v5;
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

@end