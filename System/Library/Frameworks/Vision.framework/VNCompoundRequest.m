@interface VNCompoundRequest
+ (BOOL)supportedRevisionsAreFilteredBasedOnAvailableComputeDevices;
+ (id)compoundRequestsForOriginalRequests:(id)a3 withPerformingContext:(id)a4 error:(id *)a5;
+ (id)computeStageDeviceAssignmentsForOriginalRequests:(id)a3;
+ (unint64_t)planPriorityForOriginalRequests:(id)a3;
- (BOOL)allowsCachingOfResults;
- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5;
- (BOOL)resultsAreAssignedWithOriginatingRequestSpecifier;
- (BOOL)usesCPUOnly;
- (CGRect)regionOfInterest;
- (NSArray)originalRequests;
- (VNCompoundRequest)initWithOriginalRequests:(id)a3;
- (id)compoundResults;
- (id)description;
- (id)sequencedRequestPreviousObservationsKey;
- (int64_t)dependencyProcessingOrdinality;
- (unint64_t)ioSurfaceMemoryPoolId;
- (void)recordWarningsInOriginalRequests;
@end

@implementation VNCompoundRequest

- (VNCompoundRequest)initWithOriginalRequests:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)VNCompoundRequest;
  v5 = [(VNRequest *)&v21 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    originalRequests = v5->_originalRequests;
    v5->_originalRequests = (NSArray *)v6;

    v8 = [(VNRequest *)v5 configuration];
    v9 = [(id)objc_opt_class() computeStageDeviceAssignmentsForOriginalRequests:v5->_originalRequests];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
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
          uint64_t v14 = *(void *)(*((void *)&v17 + 1) + 8 * i);
          v15 = [v9 objectForKeyedSubscript:v14];
          [v8 setComputeDevice:v15 forComputeStage:v14];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v22 count:16];
      }
      while (v11);
    }
    objc_msgSend(v8, "setModelExecutionPriority:", objc_msgSend((id)objc_opt_class(), "planPriorityForOriginalRequests:", v5->_originalRequests));
  }
  return v5;
}

+ (unint64_t)planPriorityForOriginalRequests:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    unint64_t v6 = 0;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) modelExecutionPriority];
        if (v9 - 1 < v6 - 1) {
          unint64_t v6 = v9;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

+ (id)computeStageDeviceAssignmentsForOriginalRequests:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  obuint64_t j = a3;
  uint64_t v3 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = 0;
    uint64_t v6 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v24 != v6) {
          objc_enumerationMutation(obj);
        }
        v8 = [*(id *)(*((void *)&v23 + 1) + 8 * i) resolvedComputeStageDeviceAssignments];
        uint64_t v9 = v8;
        if (v5)
        {
          long long v21 = 0u;
          long long v22 = 0u;
          long long v19 = 0u;
          long long v20 = 0u;
          uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v27 count:16];
          if (v10)
          {
            uint64_t v11 = v10;
            uint64_t v12 = *(void *)v20;
            do
            {
              for (uint64_t j = 0; j != v11; ++j)
              {
                if (*(void *)v20 != v12) {
                  objc_enumerationMutation(v9);
                }
                uint64_t v14 = *(void *)(*((void *)&v19 + 1) + 8 * j);
                v15 = [v5 objectForKeyedSubscript:v14];

                if (!v15)
                {
                  uint64_t v16 = [v9 objectForKeyedSubscript:v14];
                  [v5 setObject:v16 forKeyedSubscript:v14];
                }
              }
              uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v27 count:16];
            }
            while (v11);
          }
        }
        else
        {
          uint64_t v5 = (void *)[v8 mutableCopy];
        }
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v4);
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (unint64_t)ioSurfaceMemoryPoolId
{
  uint64_t v16 = 0;
  long long v17 = &v16;
  uint64_t v18 = 0x2020000000;
  uint64_t v19 = 0;
  uint64_t v12 = 0;
  long long v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  v2 = [(VNCompoundRequest *)self originalRequests];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __42__VNCompoundRequest_ioSurfaceMemoryPoolId__block_invoke;
  v11[3] = &unk_1E5B1FD90;
  v11[4] = &v16;
  v11[5] = &v12;
  [v2 enumerateObjectsUsingBlock:v11];

  if (*((unsigned char *)v13 + 24)) {
    VNValidatedLog(2, @"Mixed zero and non-zero pool ids in compound request. Returning pool id %llu\n", v3, v4, v5, v6, v7, v8, v17[3]);
  }
  unint64_t v9 = v17[3];
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v16, 8);
  return v9;
}

- (NSArray)originalRequests
{
  return self->_originalRequests;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedDependencyProcessingOrdinality, 0);

  objc_storeStrong((id *)&self->_originalRequests, 0);
}

void __42__VNCompoundRequest_ioSurfaceMemoryPoolId__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v18 = a2;
  uint64_t v7 = [v18 ioSurfaceMemoryPoolId];
  uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  BOOL v9 = v7 == v8;
  uint64_t v10 = v18;
  if (!v9)
  {
    if (v8)
    {
      if ([v18 ioSurfaceMemoryPoolId])
      {
        *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
        *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
        VNValidatedLog(4, @"Multiple non-zero pool ids in compound request. Returning pool id 0\n", v11, v12, v13, v14, v15, v16, v17);
        *a4 = 1;
      }
      else
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
      }
    }
    else
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3 != 0;
      *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v18 ioSurfaceMemoryPoolId];
    }
    uint64_t v10 = v18;
  }
}

- (id)description
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(VNCompoundRequest *)self originalRequests];
  uint64_t v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E78]), "initWithCapacity:", objc_msgSend(v3, "count") << 6);
  v16.receiver = self;
  v16.super_class = (Class)VNCompoundRequest;
  uint64_t v5 = [(VNRequest *)&v16 description];
  [v4 appendString:v5];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        [v4 appendFormat:@"\n   +-- %@", *(void *)(*((void *)&v12 + 1) + 8 * i)];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v17 count:16];
    }
    while (v8);
  }

  return v4;
}

- (BOOL)usesCPUOnly
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(VNCompoundRequest *)self originalRequests];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        if (![*(id *)(*((void *)&v9 + 1) + 8 * i) usesCPUOnly])
        {
          BOOL v7 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  BOOL v7 = 1;
LABEL_11:

  return v7;
}

- (void)recordWarningsInOriginalRequests
{
  uint64_t v3 = [(VNCompoundRequest *)self originalRequests];
  uint64_t v4 = [(VNRequest *)self warnings];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53__VNCompoundRequest_recordWarningsInOriginalRequests__block_invoke;
  v6[3] = &unk_1E5B1FD68;
  id v7 = v3;
  id v5 = v3;
  [v4 enumerateKeysAndObjectsUsingBlock:v6];
}

void __53__VNCompoundRequest_recordWarningsInOriginalRequests__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = *(id *)(a1 + 32);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v11++), "recordWarning:value:", v5, v6, (void)v12);
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (CGRect)regionOfInterest
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  CGFloat x = *MEMORY[0x1E4F1DB20];
  CGFloat y = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  CGFloat width = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  CGFloat height = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = [(VNCompoundRequest *)self originalRequests];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v16 + 1) + 8 * v10);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v11 regionOfInterest];
          v26.origin.CGFloat x = v12;
          v26.origin.CGFloat y = v13;
          v26.size.CGFloat width = v14;
          v26.size.CGFloat height = v15;
          v22.origin.CGFloat x = x;
          v22.origin.CGFloat y = y;
          v22.size.CGFloat width = width;
          v22.size.CGFloat height = height;
          CGRect v23 = CGRectUnion(v22, v26);
          CGFloat x = v23.origin.x;
          CGFloat y = v23.origin.y;
          CGFloat width = v23.size.width;
          CGFloat height = v23.size.height;
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  v27.origin.CGFloat x = 0.0;
  v27.origin.CGFloat y = 0.0;
  v27.size.CGFloat width = 1.0;
  v27.size.CGFloat height = 1.0;
  v24.origin.CGFloat x = x;
  v24.origin.CGFloat y = y;
  v24.size.CGFloat width = width;
  v24.size.CGFloat height = height;
  return CGRectIntersection(v24, v27);
}

- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5
{
  id v7 = a4;
  uint64_t v8 = [v7 requestPerformerAndReturnError:a5];
  if (v8)
  {
    uint64_t v9 = [(VNCompoundRequest *)self originalRequests];
    char v10 = [v8 performDependentRequests:v9 onBehalfOfRequest:self inContext:v7 error:a5];
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (int64_t)dependencyProcessingOrdinality
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  cachedDependencyProcessingOrdinalitCGFloat y = self->_cachedDependencyProcessingOrdinality;
  if (!cachedDependencyProcessingOrdinality)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v4 = [(VNCompoundRequest *)self originalRequests];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v16;
      uint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v16 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v10 = [*(id *)(*((void *)&v15 + 1) + 8 * i) dependencyProcessingOrdinality];
          if (v10 < v8) {
            uint64_t v8 = v10;
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v6);

      if (v8 == 0x8000000000000000) {
        unint64_t v11 = 0x8000000000000000;
      }
      else {
        unint64_t v11 = v8 - 1;
      }
    }
    else
    {

      unint64_t v11 = 0x7FFFFFFFFFFFFFFELL;
    }
    CGFloat v12 = [NSNumber numberWithInteger:v11];
    CGFloat v13 = self->_cachedDependencyProcessingOrdinality;
    self->_cachedDependencyProcessingOrdinalitCGFloat y = v12;

    cachedDependencyProcessingOrdinalitCGFloat y = self->_cachedDependencyProcessingOrdinality;
  }
  return [(NSNumber *)cachedDependencyProcessingOrdinality integerValue];
}

- (id)sequencedRequestPreviousObservationsKey
{
  return 0;
}

- (BOOL)resultsAreAssignedWithOriginatingRequestSpecifier
{
  return 0;
}

- (BOOL)allowsCachingOfResults
{
  return 0;
}

- (id)compoundResults
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [(VNCompoundRequest *)self originalRequests];
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
        uint64_t v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) results];
        if (v9) {
          [v3 addObjectsFromArray:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

+ (BOOL)supportedRevisionsAreFilteredBasedOnAvailableComputeDevices
{
  return 0;
}

+ (id)compoundRequestsForOriginalRequests:(id)a3 withPerformingContext:(id)a4 error:(id *)a5
{
  if (a5)
  {
    uint64_t v7 = NSString;
    uint64_t v8 = (objc_class *)objc_opt_class();
    uint64_t v9 = NSStringFromClass(v8);
    uint64_t v10 = NSStringFromSelector(a2);
    long long v11 = [v7 stringWithFormat:@"%@ must implement %@", v9, v10];

    *a5 = +[VNError errorForUnimplementedFunctionWithLocalizedDescription:v11];
  }
  return 0;
}

@end