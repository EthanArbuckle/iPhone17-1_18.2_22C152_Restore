@interface CNCancelationToken
+ (id)tokenWithCancelationBlock:(id)a3;
+ (id)tokenWrappingCancelable:(id)a3;
- (BOOL)isCanceled;
- (CNCancelationToken)init;
- (id)nts_cancel;
- (void)addCancelable:(id)a3;
- (void)addCancelationBlock:(id)a3;
- (void)callCancelationBlocks:(id)a3;
- (void)cancel;
- (void)performBlock:(id)a3;
@end

@implementation CNCancelationToken

- (void).cxx_destruct
{
}

- (void)addCancelable:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    if (CNGuardOSLog_cn_once_token_0_4 != -1) {
      dispatch_once(&CNGuardOSLog_cn_once_token_0_4, &__block_literal_global_71_0);
    }
    v5 = CNGuardOSLog_cn_once_object_0_4;
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_4, OS_LOG_TYPE_FAULT)) {
      -[CNCancelationToken addCancelable:](v5);
    }
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __36__CNCancelationToken_addCancelable___block_invoke;
  v7[3] = &unk_1E569F9D8;
  id v8 = v4;
  id v6 = v4;
  [(CNCancelationToken *)self addCancelationBlock:v7];
}

- (void)addCancelationBlock:(id)a3
{
  id v8 = (void (**)(void))a3;
  id v4 = self;
  objc_sync_enter(v4);
  if (v4->_isCanceled)
  {
    objc_sync_exit(v4);

    v8[2]();
  }
  else
  {
    cancelationBlocks = v4->_cancelationBlocks;
    id v6 = (void *)[v8 copy];
    v7 = _Block_copy(v6);
    [(NSMutableArray *)cancelationBlocks addObject:v7];

    objc_sync_exit(v4);
  }
}

+ (id)tokenWithCancelationBlock:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(CNWrappingCancelableToken);
  [(CNCancelationToken *)v4 addCancelationBlock:v3];

  return v4;
}

- (CNCancelationToken)init
{
  v7.receiver = self;
  v7.super_class = (Class)CNCancelationToken;
  v2 = [(CNCancelationToken *)&v7 init];
  if (v2)
  {
    id v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    cancelationBlocks = v2->_cancelationBlocks;
    v2->_cancelationBlocks = v3;

    v5 = v2;
  }

  return v2;
}

- (void)performBlock:(id)a3
{
  id v7 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  BOOL isCanceled = v4->_isCanceled;
  objc_sync_exit(v4);

  id v6 = v7;
  if (v7 && !isCanceled)
  {
    (*((void (**)(id))v7 + 2))(v7);
    id v6 = v7;
  }
}

- (BOOL)isCanceled
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL isCanceled = v2->_isCanceled;
  objc_sync_exit(v2);

  return isCanceled;
}

- (void)cancel
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = [(CNCancelationToken *)v2 nts_cancel];
  objc_sync_exit(v2);

  [(CNCancelationToken *)v2 callCancelationBlocks:v3];
}

- (id)nts_cancel
{
  if (self->_isCanceled)
  {
    v2 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    self->_BOOL isCanceled = 1;
    v2 = (void *)[(NSMutableArray *)self->_cancelationBlocks copy];
    cancelationBlocks = self->_cancelationBlocks;
    self->_cancelationBlocks = 0;
  }

  return v2;
}

- (void)callCancelationBlocks:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v8 + 1) + 8 * v7++) + 16))();
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

uint64_t __36__CNCancelationToken_addCancelable___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancel];
}

+ (id)tokenWrappingCancelable:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __46__CNCancelationToken_tokenWrappingCancelable___block_invoke;
  v8[3] = &unk_1E569F9D8;
  id v9 = v4;
  id v5 = v4;
  uint64_t v6 = [a1 tokenWithCancelationBlock:v8];

  return v6;
}

uint64_t __46__CNCancelationToken_tokenWrappingCancelable___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancel];
}

- (void)addCancelable:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_19091D000, log, OS_LOG_TYPE_FAULT, "parameter ‘cancelable’ must be nonnull", v1, 2u);
}

@end