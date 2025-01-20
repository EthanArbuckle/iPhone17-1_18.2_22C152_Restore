@interface CPLUploadComputeStatesAccumulator
- (BOOL)hasEnqueuedComputeStatesToUpload;
- (CPLUploadComputeStatesAccumulator)initWithCapacity:(unint64_t)a3 maximumPayloadRequestsBatchSize:(unint64_t)a4;
- (NSArray)cloudComputeStatesToUpload;
- (id)localComputeStatesToDropAfterClientProvidedPayloadForLocalComputeStates:(id)a3;
- (id)popNextBatchOfLocalComputeStatesNeedingPayload;
- (unint64_t)countOfCloudComputeStatesToUpload;
- (unint64_t)maximumPayloadRequestsBatchSize;
- (void)addLocalComputeStateToUpload:(id)a3 cloudComputeState:(id)a4;
- (void)enumerateUploadedComputeStateWithBlock:(id)a3;
- (void)requestPayloadForLocalComputeState:(id)a3 cloudComputeState:(id)a4;
@end

@implementation CPLUploadComputeStatesAccumulator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_batchEnumerator, 0);
  objc_storeStrong((id *)&self->_currentBatchOfComputeStatesNeedingPayload, 0);
  objc_storeStrong((id *)&self->_batchedLocalComputeStatesNeedingPayload, 0);
  objc_storeStrong((id *)&self->_cloudComputeStatesNeedingPayload, 0);
  objc_storeStrong((id *)&self->_cloudComputeStatesToUpload, 0);
  objc_storeStrong((id *)&self->_localComputeStatesToUpload, 0);
}

- (unint64_t)maximumPayloadRequestsBatchSize
{
  return self->_maximumPayloadRequestsBatchSize;
}

- (void)enumerateUploadedComputeStateWithBlock:(id)a3
{
  id v4 = a3;
  localComputeStatesToUpload = self->_localComputeStatesToUpload;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __76__CPLUploadComputeStatesAccumulator_enumerateUploadedComputeStateWithBlock___block_invoke;
  v7[3] = &unk_1E60A7130;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(NSMutableDictionary *)localComputeStatesToUpload enumerateKeysAndObjectsUsingBlock:v7];
}

void __76__CPLUploadComputeStatesAccumulator_enumerateUploadedComputeStateWithBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(a1 + 40);
  v7 = *(void **)(*(void *)(a1 + 32) + 24);
  id v8 = a3;
  id v9 = [v7 objectForKeyedSubscript:a2];
  (*(void (**)(uint64_t, id, id, uint64_t))(v6 + 16))(v6, v8, v9, a4);
}

- (NSArray)cloudComputeStatesToUpload
{
  return (NSArray *)[(NSMutableDictionary *)self->_cloudComputeStatesToUpload allValues];
}

- (unint64_t)countOfCloudComputeStatesToUpload
{
  return [(NSMutableDictionary *)self->_cloudComputeStatesToUpload count];
}

- (id)localComputeStatesToDropAfterClientProvidedPayloadForLocalComputeStates:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!self->_batchEnumerator)
  {
    if (!_CPLSilentLogging)
    {
      v29 = __CPLGenericOSLogDomain();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B4CAC000, v29, OS_LOG_TYPE_ERROR, "Trying to update payload of compute states without having started enumerating the batches", buf, 2u);
      }
    }
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    v22 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Upload Compute State Phase/CPLUploadComputeStatesAccumulator.m"];
    v23 = @"Trying to update payload of compute states without having started enumerating the batches";
    v24 = v21;
    SEL v25 = a2;
    v26 = self;
    v27 = v22;
    uint64_t v28 = 84;
    goto LABEL_31;
  }
  if (!self->_currentBatchOfComputeStatesNeedingPayload)
  {
    if (!_CPLSilentLogging)
    {
      v30 = __CPLGenericOSLogDomain();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B4CAC000, v30, OS_LOG_TYPE_ERROR, "Trying to update payload without a batch", buf, 2u);
      }
    }
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    v22 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Upload Compute State Phase/CPLUploadComputeStatesAccumulator.m"];
    v23 = @"Trying to update payload without a batch";
    v24 = v21;
    SEL v25 = a2;
    v26 = self;
    v27 = v22;
    uint64_t v28 = 85;
    goto LABEL_31;
  }
  SEL v32 = a2;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v33 objects:v39 count:16];
  if (!v7) {
    goto LABEL_23;
  }
  uint64_t v8 = v7;
  uint64_t v9 = *(void *)v34;
  do
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v34 != v9) {
        objc_enumerationMutation(v6);
      }
      v11 = *(void **)(*((void *)&v33 + 1) + 8 * i);
      v12 = [v11 fileURL];
      if (v12)
      {
        v13 = [v11 itemScopedIdentifier];
        v14 = [(NSMutableDictionary *)self->_currentBatchOfComputeStatesNeedingPayload objectForKeyedSubscript:v13];
        v15 = v14;
        if (!v14)
        {
          if (!_CPLSilentLogging)
          {
            v17 = __CPLBatchOSLogDomain();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v38 = v11;
              _os_log_impl(&dword_1B4CAC000, v17, OS_LOG_TYPE_ERROR, "Client provided a file URL for an unknown %@", buf, 0xCu);
            }
LABEL_18:
          }
          goto LABEL_20;
        }
        [v14 setFileURL:v12];
        v16 = [(NSMutableDictionary *)self->_cloudComputeStatesNeedingPayload objectForKeyedSubscript:v13];
        if (v16)
        {
          v17 = v16;
          [v16 setFileURL:v12];
          [(CPLUploadComputeStatesAccumulator *)self addLocalComputeStateToUpload:v15 cloudComputeState:v17];
          [(NSMutableDictionary *)self->_currentBatchOfComputeStatesNeedingPayload removeObjectForKey:v13];
          goto LABEL_18;
        }
        if (!_CPLSilentLogging)
        {
          v20 = __CPLGenericOSLogDomain();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v38 = v15;
            _os_log_impl(&dword_1B4CAC000, v20, OS_LOG_TYPE_ERROR, "Missing cloud compute state for %@", buf, 0xCu);
          }
        }
        v21 = [MEMORY[0x1E4F28B00] currentHandler];
        v22 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Upload Compute State Phase/CPLUploadComputeStatesAccumulator.m"];
        v31 = v15;
        v23 = @"Missing cloud compute state for %@";
        v24 = v21;
        SEL v25 = v32;
        v26 = self;
        v27 = v22;
        uint64_t v28 = 100;
LABEL_31:
        objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", v25, v26, v27, v28, v23, v31);

        abort();
      }
      if (_CPLSilentLogging) {
        goto LABEL_21;
      }
      v13 = __CPLBatchOSLogDomain();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v38 = v11;
        _os_log_impl(&dword_1B4CAC000, v13, OS_LOG_TYPE_ERROR, "Client provided no file URL for %@", buf, 0xCu);
      }
LABEL_20:

LABEL_21:
    }
    uint64_t v8 = [v6 countByEnumeratingWithState:&v33 objects:v39 count:16];
  }
  while (v8);
LABEL_23:

  v18 = [(NSMutableDictionary *)self->_currentBatchOfComputeStatesNeedingPayload allValues];

  return v18;
}

- (id)popNextBatchOfLocalComputeStatesNeedingPayload
{
  batchEnumerator = self->_batchEnumerator;
  if (!batchEnumerator)
  {
    id v4 = [(NSMutableArray *)self->_batchedLocalComputeStatesNeedingPayload objectEnumerator];
    id v5 = self->_batchEnumerator;
    self->_batchEnumerator = v4;

    batchEnumerator = self->_batchEnumerator;
  }
  id v6 = [(NSEnumerator *)batchEnumerator nextObject];
  currentBatchOfComputeStatesNeedingPayload = self->_currentBatchOfComputeStatesNeedingPayload;
  self->_currentBatchOfComputeStatesNeedingPayload = v6;

  uint64_t v8 = self->_currentBatchOfComputeStatesNeedingPayload;
  return (id)[(NSMutableDictionary *)v8 allValues];
}

- (BOOL)hasEnqueuedComputeStatesToUpload
{
  return [(NSMutableDictionary *)self->_cloudComputeStatesToUpload count]
      || [(NSMutableDictionary *)self->_cloudComputeStatesNeedingPayload count] != 0;
}

- (void)requestPayloadForLocalComputeState:(id)a3 cloudComputeState:(id)a4
{
  id v26 = a3;
  id v7 = a4;
  if (self->_batchEnumerator)
  {
    if (!_CPLSilentLogging)
    {
      v23 = __CPLGenericOSLogDomain();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B4CAC000, v23, OS_LOG_TYPE_ERROR, "Trying to enqueue compute states while we are already enumerating batches", buf, 2u);
      }
    }
    v24 = [MEMORY[0x1E4F28B00] currentHandler];
    SEL v25 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Upload Compute State Phase/CPLUploadComputeStatesAccumulator.m"];
    [v24 handleFailureInMethod:a2 object:self file:v25 lineNumber:52 description:@"Trying to enqueue compute states while we are already enumerating batches"];

    abort();
  }
  uint64_t v8 = v7;
  currentBatchOfComputeStatesNeedingPayload = self->_currentBatchOfComputeStatesNeedingPayload;
  if (currentBatchOfComputeStatesNeedingPayload)
  {
    if ([(NSMutableDictionary *)currentBatchOfComputeStatesNeedingPayload count] >= self->_maximumPayloadRequestsBatchSize)
    {
      v10 = (NSMutableDictionary *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:self->_maximumPayloadRequestsBatchSize];
      v11 = self->_currentBatchOfComputeStatesNeedingPayload;
      self->_currentBatchOfComputeStatesNeedingPayload = v10;

      [(NSMutableArray *)self->_batchedLocalComputeStatesNeedingPayload addObject:self->_currentBatchOfComputeStatesNeedingPayload];
    }
  }
  else
  {
    v12 = (NSMutableDictionary *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:self->_maximumPayloadRequestsBatchSize];
    v13 = self->_currentBatchOfComputeStatesNeedingPayload;
    self->_currentBatchOfComputeStatesNeedingPayload = v12;

    id v14 = objc_alloc(MEMORY[0x1E4F1CA48]);
    unint64_t capacity = self->_capacity;
    unint64_t maximumPayloadRequestsBatchSize = self->_maximumPayloadRequestsBatchSize;
    if (maximumPayloadRequestsBatchSize > capacity) {
      uint64_t v17 = 1;
    }
    else {
      uint64_t v17 = capacity / maximumPayloadRequestsBatchSize;
    }
    v18 = (NSMutableArray *)[v14 initWithCapacity:v17];
    batchedLocalComputeStatesNeedingPayload = self->_batchedLocalComputeStatesNeedingPayload;
    self->_batchedLocalComputeStatesNeedingPayload = v18;

    [(NSMutableArray *)self->_batchedLocalComputeStatesNeedingPayload addObject:self->_currentBatchOfComputeStatesNeedingPayload];
    v20 = (NSMutableDictionary *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:self->_maximumPayloadRequestsBatchSize];
    cloudComputeStatesNeedingPayload = self->_cloudComputeStatesNeedingPayload;
    self->_cloudComputeStatesNeedingPayload = v20;
  }
  v22 = [v26 itemScopedIdentifier];
  [(NSMutableDictionary *)self->_currentBatchOfComputeStatesNeedingPayload setObject:v26 forKeyedSubscript:v22];
  [(NSMutableDictionary *)self->_cloudComputeStatesNeedingPayload setObject:v8 forKeyedSubscript:v22];
}

- (void)addLocalComputeStateToUpload:(id)a3 cloudComputeState:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 itemScopedIdentifier];
  [(NSMutableDictionary *)self->_localComputeStatesToUpload setObject:v7 forKeyedSubscript:v8];

  [(NSMutableDictionary *)self->_cloudComputeStatesToUpload setObject:v6 forKeyedSubscript:v8];
}

- (CPLUploadComputeStatesAccumulator)initWithCapacity:(unint64_t)a3 maximumPayloadRequestsBatchSize:(unint64_t)a4
{
  v13.receiver = self;
  v13.super_class = (Class)CPLUploadComputeStatesAccumulator;
  id v6 = [(CPLUploadComputeStatesAccumulator *)&v13 init];
  id v7 = v6;
  if (v6)
  {
    v6->_unint64_t capacity = a3;
    uint64_t v8 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v6->_capacity];
    localComputeStatesToUpload = v7->_localComputeStatesToUpload;
    v7->_localComputeStatesToUpload = (NSMutableDictionary *)v8;

    uint64_t v10 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v7->_capacity];
    cloudComputeStatesToUpload = v7->_cloudComputeStatesToUpload;
    v7->_cloudComputeStatesToUpload = (NSMutableDictionary *)v10;

    v7->_unint64_t maximumPayloadRequestsBatchSize = a4;
  }
  return v7;
}

@end