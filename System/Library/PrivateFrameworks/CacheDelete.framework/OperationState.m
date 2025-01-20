@interface OperationState
- (BOOL)begin;
- (BOOL)cancelled;
- (BOOL)operationCancelled;
- (OS_dispatch_queue)queue;
- (OperationState)init;
- (int)operationRefcount;
- (void)cancel;
- (void)end;
- (void)setOperationCancelled:(BOOL)a3;
- (void)setOperationRefcount:(int)a3;
- (void)setQueue:(id)a3;
@end

@implementation OperationState

- (OperationState)init
{
  v6.receiver = self;
  v6.super_class = (Class)OperationState;
  v2 = [(OperationState *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.cache_delete_services_operation_queue", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (BOOL)cancelled
{
  v2 = self;
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  dispatch_queue_t v3 = [(OperationState *)self queue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __27__OperationState_cancelled__block_invoke;
  v5[3] = &unk_1E5C51C90;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __27__OperationState_cancelled__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) operationCancelled];
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    dispatch_queue_t v3 = *(void **)(a1 + 32);
    return [v3 setOperationCancelled:0];
  }
  return result;
}

- (void)cancel
{
  dispatch_queue_t v3 = [(OperationState *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __24__OperationState_cancel__block_invoke;
  block[3] = &unk_1E5C51900;
  block[4] = self;
  dispatch_sync(v3, block);
}

uint64_t __24__OperationState_cancel__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setOperationCancelled:1];
}

- (BOOL)begin
{
  v2 = self;
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 1;
  dispatch_queue_t v3 = [(OperationState *)self queue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __23__OperationState_begin__block_invoke;
  v5[3] = &unk_1E5C51C90;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __23__OperationState_begin__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) operationCancelled])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    v2 = *(void **)(a1 + 32);
    return [v2 setOperationCancelled:0];
  }
  else
  {
    v4 = *(void **)(a1 + 32);
    uint64_t v5 = [v4 operationRefcount] + 1;
    return [v4 setOperationRefcount:v5];
  }
}

- (void)end
{
  dispatch_queue_t v3 = [(OperationState *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __21__OperationState_end__block_invoke;
  block[3] = &unk_1E5C51900;
  block[4] = self;
  dispatch_sync(v3, block);
}

uint64_t __21__OperationState_end__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setOperationRefcount:", objc_msgSend(*(id *)(a1 + 32), "operationRefcount") - 1);
  uint64_t result = [*(id *)(a1 + 32) operationRefcount];
  if ((result & 0x80000000) != 0)
  {
    dispatch_queue_t v3 = CDGetLogHandle((uint64_t)"client");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v4 = 0;
      _os_log_error_impl(&dword_1A63D1000, v3, OS_LOG_TYPE_ERROR, "UNBALANCED: operation refcount went below zero, resetting to zero", v4, 2u);
    }

    return [*(id *)(a1 + 32) setOperationRefcount:0];
  }
  return result;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (BOOL)operationCancelled
{
  return self->_operationCancelled;
}

- (void)setOperationCancelled:(BOOL)a3
{
  self->_operationCancelled = a3;
}

- (int)operationRefcount
{
  return self->_operationRefcount;
}

- (void)setOperationRefcount:(int)a3
{
  self->_operationRefcount = a3;
}

- (void).cxx_destruct
{
}

@end