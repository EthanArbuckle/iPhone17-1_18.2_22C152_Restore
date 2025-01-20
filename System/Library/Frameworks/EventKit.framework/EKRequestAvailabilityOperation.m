@interface EKRequestAvailabilityOperation
- (BOOL)isConcurrent;
- (BOOL)isExecuting;
- (BOOL)isFinished;
- (EKRequestAvailabilityOperation)init;
- (EKRequestAvailabilityOperation)initWithSource:(id)a3 startDate:(id)a4 endDate:(id)a5 ignoredEvent:(id)a6 addresses:(id)a7 resultsBlock:(id)a8;
- (EKRequestAvailabilityOperation)initWithSource:(id)a3 startDate:(id)a4 endDate:(id)a5 ignoredEventID:(id)a6 addresses:(id)a7 resultsBlock:(id)a8;
- (NSError)error;
- (id)description;
- (void)_finishWithError:(id)a3;
- (void)cancel;
- (void)main;
- (void)setError:(id)a3;
- (void)start;
@end

@implementation EKRequestAvailabilityOperation

- (EKRequestAvailabilityOperation)init
{
  id v2 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"Please use the appropriate designated initializer for this class." userInfo:0];
  objc_exception_throw(v2);
}

- (EKRequestAvailabilityOperation)initWithSource:(id)a3 startDate:(id)a4 endDate:(id)a5 ignoredEvent:(id)a6 addresses:(id)a7 resultsBlock:(id)a8
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  if ([v16 isDetached])
  {
    uint64_t v20 = [v16 originalItem];

    id v16 = (id)v20;
  }
  v21 = [v16 uniqueID];

  v22 = [(EKRequestAvailabilityOperation *)self initWithSource:v19 startDate:v18 endDate:v17 ignoredEventID:v21 addresses:v15 resultsBlock:v14];
  return v22;
}

- (EKRequestAvailabilityOperation)initWithSource:(id)a3 startDate:(id)a4 endDate:(id)a5 ignoredEventID:(id)a6 addresses:(id)a7 resultsBlock:(id)a8
{
  id v14 = a3;
  id v29 = a4;
  id v28 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v30.receiver = self;
  v30.super_class = (Class)EKRequestAvailabilityOperation;
  id v18 = [(EKRequestAvailabilityOperation *)&v30 init];
  if (v18)
  {
    uint64_t v19 = objc_msgSend(v14, "availabilityCache", v28, v29);
    availabilityCache = v18->_availabilityCache;
    v18->_availabilityCache = (EKAvailabilityCache *)v19;

    objc_storeStrong((id *)&v18->_startDate, a4);
    objc_storeStrong((id *)&v18->_endDate, a5);
    objc_storeStrong((id *)&v18->_ignoredEventID, a6);
    objc_storeStrong((id *)&v18->_addresses, a7);
    uint64_t v21 = [v17 copy];
    id resultsBlock = v18->_resultsBlock;
    v18->_id resultsBlock = (id)v21;

    objc_opt_class();
    CalGenerateQualifiedIdentifierWithClassAndSubdomain();
    id v23 = objc_claimAutoreleasedReturnValue();
    v24 = (const char *)[v23 UTF8String];

    dispatch_queue_t v25 = dispatch_queue_create(v24, 0);
    queue = v18->_queue;
    v18->_queue = (OS_dispatch_queue *)v25;
  }
  return v18;
}

- (id)description
{
  id v3 = objc_alloc(MEMORY[0x1E4F576E8]);
  v9.receiver = self;
  v9.super_class = (Class)EKRequestAvailabilityOperation;
  v4 = [(EKRequestAvailabilityOperation *)&v9 description];
  v5 = (void *)[v3 initWithSuperclassDescription:v4];

  [v5 setKey:@"_isFinished" withBoolean:self->_isFinished];
  [v5 setKey:@"_isExecuting" withBoolean:self->_isExecuting];
  [v5 setKey:@"_availabilityCache" withObject:self->_availabilityCache];
  [v5 setKey:@"_startDate" withDate:self->_startDate];
  [v5 setKey:@"_endDate" withDate:self->_endDate];
  [v5 setKey:@"_ignoredEventID" withString:self->_ignoredEventID];
  [v5 setKey:@"_addresses" withArray:self->_addresses];
  [v5 setKey:@"_resultsBlock" withPointerAddress:self->_resultsBlock];
  [v5 setKey:@"_requestID" withObject:self->_requestID];
  [v5 setKey:@"_queue" withPointerAddress:self->_queue];
  v6 = [(EKRequestAvailabilityOperation *)self error];
  [v5 setKey:@"error" withObject:v6];

  v7 = [v5 build];

  return v7;
}

- (void)start
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__EKRequestAvailabilityOperation_start__block_invoke;
  block[3] = &unk_1E5B96E08;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __39__EKRequestAvailabilityOperation_start__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isCancelled];
  if ((result & 1) == 0)
  {
    uint64_t result = [*(id *)(a1 + 32) isExecuting];
    if ((result & 1) == 0)
    {
      uint64_t result = [*(id *)(a1 + 32) isFinished];
      if ((result & 1) == 0)
      {
        id v3 = *(void **)(a1 + 32);
        return [v3 main];
      }
    }
  }
  return result;
}

- (void)main
{
  [(EKRequestAvailabilityOperation *)self willChangeValueForKey:@"isExecuting"];
  self->_isExecuting = 1;
  [(EKRequestAvailabilityOperation *)self didChangeValueForKey:@"isExecuting"];
  availabilityCache = self->_availabilityCache;
  startDate = self->_startDate;
  endDate = self->_endDate;
  ignoredEventID = self->_ignoredEventID;
  addresses = self->_addresses;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __38__EKRequestAvailabilityOperation_main__block_invoke;
  v11[3] = &unk_1E5B97BF0;
  v11[4] = self;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __38__EKRequestAvailabilityOperation_main__block_invoke_46;
  v10[3] = &unk_1E5B96FC8;
  v10[4] = self;
  v8 = [(EKAvailabilityCache *)availabilityCache requestAvailabilityBetweenStartDate:startDate endDate:endDate ignoredEventID:ignoredEventID addresses:addresses resultsBlock:v11 completionBlock:v10];
  id requestID = self->_requestID;
  self->_id requestID = v8;
}

void __38__EKRequestAvailabilityOperation_main__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5 = *(void **)(a1 + 32);
  v4 = (uint64_t *)(a1 + 32);
  if ([v5 isCancelled])
  {
    v6 = EKAvailabilityHandle;
    if (os_log_type_enabled((os_log_t)EKAvailabilityHandle, OS_LOG_TYPE_DEBUG)) {
      __38__EKRequestAvailabilityOperation_main__block_invoke_cold_1(v4, v6);
    }
  }
  else
  {
    uint64_t v7 = *v4;
    v8 = *(NSObject **)(*v4 + 312);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __38__EKRequestAvailabilityOperation_main__block_invoke_44;
    v9[3] = &unk_1E5B97140;
    v9[4] = v7;
    id v10 = v3;
    dispatch_async(v8, v9);
  }
}

void __38__EKRequestAvailabilityOperation_main__block_invoke_44(uint64_t a1)
{
  id v2 = (void *)(a1 + 32);
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 296);
  if (v3)
  {
    v4 = *(void (**)(void))(v3 + 16);
    v4();
  }
  else
  {
    v5 = EKAvailabilityHandle;
    if (os_log_type_enabled((os_log_t)EKAvailabilityHandle, OS_LOG_TYPE_DEBUG)) {
      __38__EKRequestAvailabilityOperation_main__block_invoke_44_cold_1(a1, v2, v5);
    }
  }
}

void __38__EKRequestAvailabilityOperation_main__block_invoke_46(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 312);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__EKRequestAvailabilityOperation_main__block_invoke_2;
  v7[3] = &unk_1E5B97140;
  v7[4] = v4;
  id v8 = v3;
  id v6 = v3;
  dispatch_async(v5, v7);
}

uint64_t __38__EKRequestAvailabilityOperation_main__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _finishWithError:*(void *)(a1 + 40)];
}

- (BOOL)isConcurrent
{
  return 1;
}

- (void)cancel
{
  v5.receiver = self;
  v5.super_class = (Class)EKRequestAvailabilityOperation;
  [(EKRequestAvailabilityOperation *)&v5 cancel];
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__EKRequestAvailabilityOperation_cancel__block_invoke;
  block[3] = &unk_1E5B96E08;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __40__EKRequestAvailabilityOperation_cancel__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 256) cancelAvailabilityRequestWithID:*(void *)(*(void *)(a1 + 32) + 304)];
  id v2 = *(void **)(a1 + 32);

  return [v2 _finishWithError:0];
}

- (BOOL)isExecuting
{
  return self->_isExecuting;
}

- (BOOL)isFinished
{
  return self->_isFinished;
}

- (void)_finishWithError:(id)a3
{
  id v4 = a3;
  objc_super v5 = EKAvailabilityHandle;
  if (os_log_type_enabled((os_log_t)EKAvailabilityHandle, OS_LOG_TYPE_DEBUG)) {
    [(EKRequestAvailabilityOperation *)(uint64_t)v4 _finishWithError:v5];
  }
  if (!self->_isFinished)
  {
    if (([(EKRequestAvailabilityOperation *)self isCancelled] & 1) == 0) {
      [(EKRequestAvailabilityOperation *)self setError:v4];
    }
    id resultsBlock = self->_resultsBlock;
    self->_id resultsBlock = 0;

    if (self->_isExecuting)
    {
      [(EKRequestAvailabilityOperation *)self willChangeValueForKey:@"isExecuting"];
      self->_isExecuting = 0;
      [(EKRequestAvailabilityOperation *)self didChangeValueForKey:@"isExecuting"];
    }
    [(EKRequestAvailabilityOperation *)self willChangeValueForKey:@"isFinished"];
    self->_isFinished = 1;
    [(EKRequestAvailabilityOperation *)self didChangeValueForKey:@"isFinished"];
  }
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_requestID, 0);
  objc_storeStrong(&self->_resultsBlock, 0);
  objc_storeStrong((id *)&self->_addresses, 0);
  objc_storeStrong((id *)&self->_ignoredEventID, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);

  objc_storeStrong((id *)&self->_availabilityCache, 0);
}

void __38__EKRequestAvailabilityOperation_main__block_invoke_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_1A4E47000, a2, OS_LOG_TYPE_DEBUG, "Operation was cancelled.  Will not return results.  Operation: [%@]", (uint8_t *)&v3, 0xCu);
}

void __38__EKRequestAvailabilityOperation_main__block_invoke_44_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  *(_DWORD *)int v3 = 138412546;
  *(void *)&v3[4] = *(void *)(a1 + 40);
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = *a2;
  OUTLINED_FUNCTION_1_0(&dword_1A4E47000, (uint64_t)a2, a3, "No results block.  Will not pass along results [%@] for operation: [%@]", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

- (void)_finishWithError:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)int v3 = 138412546;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_1_0(&dword_1A4E47000, a2, a3, "Finishing operation with error: [%@].  Operation: [%@]", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

@end