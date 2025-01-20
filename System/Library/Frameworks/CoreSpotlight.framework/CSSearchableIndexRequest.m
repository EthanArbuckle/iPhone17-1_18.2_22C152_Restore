@interface CSSearchableIndexRequest
+ (void)initialize;
- (BOOL)critical;
- (BOOL)finished;
- (BOOL)shouldThrottle;
- (BOOL)started;
- (BOOL)throttled;
- (CSDataWrapper)dataWrapper;
- (CSSearchableIndex)index;
- (CSSearchableIndexRequest)initWithSearchableIndex:(id)a3 label:(id)a4;
- (CSSearchableIndexRequest)initWithSearchableIndex:(id)a3 label:(id)a4 critical:(BOOL)a5;
- (NSData)data;
- (NSString)label;
- (OS_xpc_object)xpcValue;
- (id)completionBlock;
- (id)completionDataBlock;
- (id)completionXPCValueBlock;
- (id)description;
- (id)performBlock;
- (unint64_t)maxRetryCount;
- (unint64_t)retryCount;
- (unsigned)requestID;
- (void)_finishWithError:(id)a3;
- (void)_perform;
- (void)_throttleIfNecessary;
- (void)_unthrottleIfNecessary;
- (void)dealloc;
- (void)finishWithError:(id)a3;
- (void)retryIfNecessaryWithError:(id)a3;
- (void)retryIfNecessaryWithError:(id)a3 dataWrapper:(id)a4;
- (void)retryIfNecessaryWithError:(id)a3 dataWrapper:(id)a4 xpcValue:(id)a5;
- (void)setCompletionBlock:(id)a3;
- (void)setCompletionDataBlock:(id)a3;
- (void)setCompletionXPCValueBlock:(id)a3;
- (void)setCritical:(BOOL)a3;
- (void)setDataWrapper:(id)a3;
- (void)setFinished:(BOOL)a3;
- (void)setIndex:(id)a3;
- (void)setLabel:(id)a3;
- (void)setMaxRetryCount:(unint64_t)a3;
- (void)setPerformBlock:(id)a3;
- (void)setRequestID:(unsigned int)a3;
- (void)setRetryCount:(unint64_t)a3;
- (void)setShouldThrottle:(BOOL)a3;
- (void)setStarted:(BOOL)a3;
- (void)setThrottled:(BOOL)a3;
- (void)setXpcValue:(id)a3;
- (void)start;
@end

@implementation CSSearchableIndexRequest

- (void)setCompletionBlock:(id)a3
{
}

uint64_t __75__CSSearchableIndexRequest_retryIfNecessaryWithError_dataWrapper_xpcValue___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) _finishWithError:*(void *)(a1 + 40)];
}

- (void)retryIfNecessaryWithError:(id)a3
{
  id v4 = a3;
  v5 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[CSSearchableIndexRequest retryIfNecessaryWithError:]((uint64_t)v4, v5);
  }

  [(CSSearchableIndexRequest *)self retryIfNecessaryWithError:v4 dataWrapper:0 xpcValue:0];
}

void __45__CSSearchableIndexRequest__finishWithError___block_invoke_2(uint64_t a1)
{
  v2 = (void *)MEMORY[0x192F99810]();
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)retryIfNecessaryWithError:(id)a3 dataWrapper:(id)a4
{
}

- (void)setPerformBlock:(id)a3
{
}

- (CSSearchableIndexRequest)initWithSearchableIndex:(id)a3 label:(id)a4 critical:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  if (!v9) {
    -[CSSearchableIndexRequest initWithSearchableIndex:label:critical:]();
  }
  v11 = v10;
  if (!v10) {
    -[CSSearchableIndexRequest initWithSearchableIndex:label:critical:]();
  }
  v15.receiver = self;
  v15.super_class = (Class)CSSearchableIndexRequest;
  v12 = [(CSSearchableIndexRequest *)&v15 init];
  v13 = v12;
  if (v12)
  {
    atomic_store(atomic_fetch_add(sCSSearchableIndexRequestID, 1u), &v12->_requestID);
    objc_storeStrong((id *)&v12->_index, a3);
    objc_storeStrong((id *)&v13->_label, a4);
    v13->_retryCount = 0;
    v13->_maxRetryCount = 1;
    *(_DWORD *)&v13->_shouldThrottle = 1;
    v13->_critical = a5;
  }

  return v13;
}

- (CSSearchableIndexRequest)initWithSearchableIndex:(id)a3 label:(id)a4
{
  return [(CSSearchableIndexRequest *)self initWithSearchableIndex:a3 label:a4 critical:0];
}

- (void)_finishWithError:(id)a3
{
  v52[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (!self->_finished)
  {
    if (v4)
    {
      v6 = [v4 domain];
      int v7 = [v6 isEqualToString:@"CSIndexErrorDomain"];

      if (v7)
      {
        id v8 = v5;
      }
      else
      {
        uint64_t v51 = *MEMORY[0x1E4F28A50];
        v52[0] = v5;
        id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v52 forKeys:&v51 count:1];
        id v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"CSIndexErrorDomain" code:-1003 userInfo:v10];
      }
      id v9 = logForCSLogCategoryIndex();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        -[CSSearchableIndexRequest _finishWithError:]();
      }
    }
    else
    {
      id v9 = logForCSLogCategoryIndex();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        -[CSSearchableIndexRequest _finishWithError:]((uint64_t)self, v9);
      }
      id v8 = 0;
    }

    id v11 = (id)sCSSearchableIndexRequests;
    objc_sync_enter(v11);
    [(id)sCSSearchableIndexRequests removeObject:self];
    objc_sync_exit(v11);

    [(CSSearchableIndexRequest *)self _unthrottleIfNecessary];
    id completionDataBlock = self->_completionDataBlock;
    if (completionDataBlock)
    {
      v13 = _Block_copy(completionDataBlock);
      id v14 = self->_completionDataBlock;
      self->_id completionDataBlock = 0;

      objc_super v15 = self->_dataWrapper;
      dataWrapper = self->_dataWrapper;
      self->_dataWrapper = 0;

      index = self->_index;
      if (self->_critical)
      {
        v18 = [(CSSearchableIndex *)index criticalQueue];
        v19 = (id *)v50;
        v50[0] = MEMORY[0x1E4F143A8];
        v50[1] = 3221225472;
        v50[2] = __45__CSSearchableIndexRequest__finishWithError___block_invoke;
        v50[3] = &unk_1E554CA98;
        v50[6] = v13;
        v50[4] = v8;
        v50[5] = v15;
        v20 = v15;
        id v21 = v13;
        [v18 async:v50 critical:1];
      }
      else
      {
        v18 = [(CSSearchableIndex *)index throttleQueue];
        v19 = (id *)v49;
        v49[0] = MEMORY[0x1E4F143A8];
        v49[1] = 3221225472;
        v49[2] = __45__CSSearchableIndexRequest__finishWithError___block_invoke_2;
        v49[3] = &unk_1E554CA98;
        v49[6] = v13;
        v49[4] = v8;
        v49[5] = v15;
        v22 = v15;
        id v23 = v13;
        [v18 async:v49];
      }
    }
    id completionXPCValueBlock = self->_completionXPCValueBlock;
    if (completionXPCValueBlock)
    {
      v25 = _Block_copy(completionXPCValueBlock);
      id v26 = self->_completionXPCValueBlock;
      self->_id completionXPCValueBlock = 0;

      v27 = self->_xpcValue;
      xpcValue = self->_xpcValue;
      self->_xpcValue = 0;

      v29 = self->_index;
      if (self->_critical)
      {
        v30 = [(CSSearchableIndex *)v29 criticalQueue];
        v31 = (id *)v48;
        v48[0] = MEMORY[0x1E4F143A8];
        v48[1] = 3221225472;
        v48[2] = __45__CSSearchableIndexRequest__finishWithError___block_invoke_3;
        v48[3] = &unk_1E554CA98;
        v48[6] = v25;
        v48[4] = v8;
        v48[5] = v27;
        v32 = v27;
        id v33 = v25;
        [v30 async:v48 critical:1];
      }
      else
      {
        v30 = [(CSSearchableIndex *)v29 throttleQueue];
        v31 = (id *)v47;
        v47[0] = MEMORY[0x1E4F143A8];
        v47[1] = 3221225472;
        v47[2] = __45__CSSearchableIndexRequest__finishWithError___block_invoke_4;
        v47[3] = &unk_1E554CA98;
        v47[6] = v25;
        v47[4] = v8;
        v47[5] = v27;
        v34 = v27;
        id v35 = v25;
        [v30 async:v47];
      }
    }
    id completionBlock = self->_completionBlock;
    if (completionBlock)
    {
      v37 = _Block_copy(completionBlock);
      id v38 = self->_completionBlock;
      self->_id completionBlock = 0;

      v39 = self->_index;
      if (self->_critical)
      {
        v40 = [(CSSearchableIndex *)v39 criticalQueue];
        v41 = v46;
        v46[0] = MEMORY[0x1E4F143A8];
        v46[1] = 3221225472;
        v46[2] = __45__CSSearchableIndexRequest__finishWithError___block_invoke_5;
        v46[3] = &unk_1E554CAC0;
        v46[5] = v37;
        v46[4] = v8;
        id v42 = v37;
        [v40 async:v46 critical:1];
      }
      else
      {
        v40 = [(CSSearchableIndex *)v39 throttleQueue];
        v41 = v45;
        v45[0] = MEMORY[0x1E4F143A8];
        v45[1] = 3221225472;
        v45[2] = __45__CSSearchableIndexRequest__finishWithError___block_invoke_6;
        v45[3] = &unk_1E554CAC0;
        v45[5] = v37;
        v45[4] = v8;
        id v43 = v37;
        [v40 async:v45];
      }
    }
    id performBlock = self->_performBlock;
    self->_id performBlock = 0;

    self->_finished = 1;
  }
}

- (void)start
{
}

- (void)dealloc
{
}

- (void)retryIfNecessaryWithError:(id)a3 dataWrapper:(id)a4 xpcValue:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)MEMORY[0x192F99810]();
  if (v8) {
    v12 = 0;
  }
  else {
    v12 = v9;
  }
  if (v8) {
    v13 = 0;
  }
  else {
    v13 = v10;
  }
  objc_storeStrong((id *)&self->_dataWrapper, v12);
  objc_storeStrong((id *)&self->_xpcValue, v13);
  if (v8)
  {
    id v14 = [v8 domain];
    if ([v14 isEqualToString:*MEMORY[0x1E4F281F8]]
      && ([v8 code] == 4097 || objc_msgSend(v8, "code") == 4099))
    {
      unint64_t retryCount = self->_retryCount;
      unint64_t maxRetryCount = self->_maxRetryCount;

      if (retryCount < maxRetryCount && self->_performBlock)
      {
        ++self->_retryCount;
        v17 = [(CSSearchableIndex *)self->_index requestQueue];
        [v17 suspend];
        v18 = [(CSSearchableIndex *)self->_index throttleQueue];
        [v18 suspend];
        if (self->_critical)
        {
          v19 = [(CSSearchableIndex *)self->_index criticalQueue];
          [v19 suspend];
        }
        else
        {
          v19 = 0;
        }
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __75__CSSearchableIndexRequest_retryIfNecessaryWithError_dataWrapper_xpcValue___block_invoke;
        aBlock[3] = &unk_1E554CA70;
        aBlock[4] = self;
        id v24 = v17;
        id v33 = v24;
        id v34 = v18;
        id v25 = v19;
        id v35 = v25;
        id v26 = v18;
        v27 = _Block_copy(aBlock);
        if (self->_critical) {
          [v25 async:v27 critical:1];
        }
        else {
          [v24 async:v27];
        }

        goto LABEL_20;
      }
    }
    else
    {
    }
  }
  index = self->_index;
  if (self->_critical)
  {
    id v21 = [(CSSearchableIndex *)index criticalQueue];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __75__CSSearchableIndexRequest_retryIfNecessaryWithError_dataWrapper_xpcValue___block_invoke_5;
    v30[3] = &unk_1E5548FE0;
    v30[4] = self;
    id v31 = v8;
    [v21 async:v30 critical:1];

    v22 = v31;
  }
  else
  {
    id v23 = [(CSSearchableIndex *)index requestQueue];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __75__CSSearchableIndexRequest_retryIfNecessaryWithError_dataWrapper_xpcValue___block_invoke_6;
    v28[3] = &unk_1E5548FE0;
    v28[4] = self;
    id v29 = v8;
    [v23 async:v28];

    v22 = v29;
  }

LABEL_20:
}

- (void)setCompletionDataBlock:(id)a3
{
}

- (void)_throttleIfNecessary
{
  if (!self->_critical && !self->_throttled)
  {
    [(CSSearchableIndex *)self->_index throttle];
    self->_throttled = 1;
  }
}

- (void)_unthrottleIfNecessary
{
  if (!self->_critical && self->_throttled)
  {
    [(CSSearchableIndex *)self->_index unthrottle];
    self->_throttled = 0;
  }
}

- (void)_perform
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcValue, 0);
  objc_storeStrong((id *)&self->_dataWrapper, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_index, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong(&self->_completionXPCValueBlock, 0);
  objc_storeStrong(&self->_completionDataBlock, 0);
  objc_storeStrong(&self->_performBlock, 0);

  objc_storeStrong((id *)&self->_data, 0);
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    sCSSearchableIndexRequests = (uint64_t)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    MEMORY[0x1F41817F8]();
  }
}

void __45__CSSearchableIndexRequest__finishWithError___block_invoke_6(uint64_t a1)
{
  v2 = (void *)MEMORY[0x192F99810]();
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)description
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:6];
  id v4 = [NSString alloc];
  uint64_t v5 = atomic_load(&self->_requestID);
  v6 = objc_msgSend(v4, "initWithFormat:", @"id=%ld", v5);
  [v3 addObject:v6];

  int v7 = (void *)[[NSString alloc] initWithFormat:@"label=\"%@\"", self->_label];
  [v3 addObject:v7];

  id v8 = [NSString alloc];
  id v9 = [(CSSearchableIndex *)self->_index name];
  id v10 = (void *)[v8 initWithFormat:@"index=\"%@\"/%p", v9, self->_index];
  [v3 addObject:v10];

  if (self->_retryCount)
  {
    id v11 = objc_msgSend([NSString alloc], "initWithFormat:", @"retry=%ld/%ld", self->_retryCount, self->_maxRetryCount);
    [v3 addObject:v11];
  }
  v12 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
  if ([(CSSearchableIndexRequest *)self finished]) {
    [v12 addObject:@"finished"];
  }
  if ([(CSSearchableIndexRequest *)self critical]) {
    [v12 addObject:@"critical"];
  }
  if ([v12 count])
  {
    id v13 = [NSString alloc];
    id v14 = [v12 componentsJoinedByString:@"|"];
    objc_super v15 = (void *)[v13 initWithFormat:@"flags=%@", v14];
    [v3 addObject:v15];
  }
  if (self->_dataWrapper)
  {
    v16 = objc_msgSend([NSString alloc], "initWithFormat:", @"data=%p", self->_dataWrapper);
    [v3 addObject:v16];
  }
  id v17 = [NSString alloc];
  uint64_t v18 = objc_opt_class();
  v19 = [v3 componentsJoinedByString:@", "];
  v20 = (void *)[v17 initWithFormat:@"<%@:%p; %@>", v18, self, v19];

  return v20;
}

void __75__CSSearchableIndexRequest_retryIfNecessaryWithError_dataWrapper_xpcValue___block_invoke(id *a1)
{
  v2 = (void *)MEMORY[0x192F99810]();
  v3 = [a1[4] completionDataBlock];
  id v4 = [a1[4] completionXPCValueBlock];
  uint64_t v5 = v4;
  if (v3)
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __75__CSSearchableIndexRequest_retryIfNecessaryWithError_dataWrapper_xpcValue___block_invoke_2;
    v19[3] = &unk_1E554C9F8;
    id v23 = v3;
    id v20 = a1[5];
    id v21 = a1[6];
    id v22 = a1[7];
    [a1[4] setCompletionDataBlock:v19];

    id v6 = v23;
  }
  else if (v4)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __75__CSSearchableIndexRequest_retryIfNecessaryWithError_dataWrapper_xpcValue___block_invoke_3;
    v14[3] = &unk_1E554CA20;
    id v18 = v4;
    id v15 = a1[5];
    id v16 = a1[6];
    id v17 = a1[7];
    [a1[4] setCompletionXPCValueBlock:v14];

    id v6 = v18;
  }
  else
  {
    int v7 = [a1[4] completionBlock];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __75__CSSearchableIndexRequest_retryIfNecessaryWithError_dataWrapper_xpcValue___block_invoke_4;
    v9[3] = &unk_1E554CA48;
    id v13 = v7;
    id v10 = a1[5];
    id v11 = a1[6];
    id v12 = a1[7];
    id v8 = a1[4];
    id v6 = v7;
    [v8 setCompletionBlock:v9];
  }
  [a1[4] _perform];
}

void *__75__CSSearchableIndexRequest_retryIfNecessaryWithError_dataWrapper_xpcValue___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  [*(id *)(a1 + 32) resume];
  [*(id *)(a1 + 40) resume];
  result = *(void **)(a1 + 48);
  if (result)
  {
    return (void *)[result resume];
  }
  return result;
}

void *__75__CSSearchableIndexRequest_retryIfNecessaryWithError_dataWrapper_xpcValue___block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  [*(id *)(a1 + 32) resume];
  [*(id *)(a1 + 40) resume];
  result = *(void **)(a1 + 48);
  if (result)
  {
    return (void *)[result resume];
  }
  return result;
}

void __75__CSSearchableIndexRequest_retryIfNecessaryWithError_dataWrapper_xpcValue___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 56);
  id v6 = v3;
  if (v4) {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
  }
  [*(id *)(a1 + 32) resume];
  [*(id *)(a1 + 40) resume];
  uint64_t v5 = *(void **)(a1 + 48);
  if (v5) {
    [v5 resume];
  }
}

uint64_t __75__CSSearchableIndexRequest_retryIfNecessaryWithError_dataWrapper_xpcValue___block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) _finishWithError:*(void *)(a1 + 40)];
}

void __45__CSSearchableIndexRequest__finishWithError___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x192F99810]();
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __45__CSSearchableIndexRequest__finishWithError___block_invoke_3(uint64_t a1)
{
  v2 = (void *)MEMORY[0x192F99810]();
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __45__CSSearchableIndexRequest__finishWithError___block_invoke_4(uint64_t a1)
{
  v2 = (void *)MEMORY[0x192F99810]();
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __45__CSSearchableIndexRequest__finishWithError___block_invoke_5(uint64_t a1)
{
  v2 = (void *)MEMORY[0x192F99810]();
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)finishWithError:(id)a3
{
  id v4 = a3;
  index = self->_index;
  if (self->_critical)
  {
    id v6 = [(CSSearchableIndex *)index criticalQueue];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __44__CSSearchableIndexRequest_finishWithError___block_invoke;
    v17[3] = &unk_1E5548FE0;
    int v7 = &v18;
    v17[4] = self;
    id v18 = v4;
    id v8 = v4;
    id v9 = v17;
  }
  else
  {
    id v6 = [(CSSearchableIndex *)index requestQueue];
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    id v13 = __44__CSSearchableIndexRequest_finishWithError___block_invoke_2;
    id v14 = &unk_1E5548FE0;
    int v7 = &v16;
    id v15 = self;
    id v16 = v4;
    id v10 = v4;
    id v9 = &v11;
  }
  objc_msgSend(v6, "async:", v9, v11, v12, v13, v14, v15);
}

void __44__CSSearchableIndexRequest_finishWithError___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x192F99810]();
  [*(id *)(a1 + 32) _finishWithError:*(void *)(a1 + 40)];
}

void __44__CSSearchableIndexRequest_finishWithError___block_invoke_2(uint64_t a1)
{
  v2 = (void *)MEMORY[0x192F99810]();
  [*(id *)(a1 + 32) _finishWithError:*(void *)(a1 + 40)];
}

- (unint64_t)maxRetryCount
{
  return self->_maxRetryCount;
}

- (void)setMaxRetryCount:(unint64_t)a3
{
  self->_unint64_t maxRetryCount = a3;
}

- (BOOL)shouldThrottle
{
  return self->_shouldThrottle;
}

- (void)setShouldThrottle:(BOOL)a3
{
  self->_shouldThrottle = a3;
}

- (NSData)data
{
  return self->_data;
}

- (id)performBlock
{
  return self->_performBlock;
}

- (id)completionDataBlock
{
  return self->_completionDataBlock;
}

- (id)completionXPCValueBlock
{
  return self->_completionXPCValueBlock;
}

- (void)setCompletionXPCValueBlock:(id)a3
{
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (CSSearchableIndex)index
{
  return self->_index;
}

- (void)setIndex:(id)a3
{
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (CSDataWrapper)dataWrapper
{
  return self->_dataWrapper;
}

- (void)setDataWrapper:(id)a3
{
}

- (OS_xpc_object)xpcValue
{
  return self->_xpcValue;
}

- (void)setXpcValue:(id)a3
{
}

- (unint64_t)retryCount
{
  return self->_retryCount;
}

- (void)setRetryCount:(unint64_t)a3
{
  self->_unint64_t retryCount = a3;
}

- (unsigned)requestID
{
  return atomic_load(&self->_requestID);
}

- (void)setRequestID:(unsigned int)a3
{
}

- (BOOL)started
{
  return self->_started;
}

- (void)setStarted:(BOOL)a3
{
  self->_started = a3;
}

- (BOOL)finished
{
  return self->_finished;
}

- (void)setFinished:(BOOL)a3
{
  self->_finished = a3;
}

- (BOOL)throttled
{
  return self->_throttled;
}

- (void)setThrottled:(BOOL)a3
{
  self->_throttled = a3;
}

- (BOOL)critical
{
  return self->_critical;
}

- (void)setCritical:(BOOL)a3
{
  self->_critical = a3;
}

- (void)initWithSearchableIndex:label:critical:.cold.1()
{
}

- (void)initWithSearchableIndex:label:critical:.cold.2()
{
}

- (void)retryIfNecessaryWithError:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_18D0E3000, a2, OS_LOG_TYPE_DEBUG, "~~~ retryIfNecessaryWithError: %@", (uint8_t *)&v2, 0xCu);
}

- (void)_finishWithError:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_18D0E3000, a2, OS_LOG_TYPE_DEBUG, "Finished request:%@", (uint8_t *)&v2, 0xCu);
}

- (void)_finishWithError:.cold.2()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0_8();
  uint64_t v3 = v0;
  _os_log_debug_impl(&dword_18D0E3000, v1, OS_LOG_TYPE_DEBUG, "Finished request:%@, error:%@", v2, 0x16u);
}

@end