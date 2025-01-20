@interface _CATArbitratorWaitToken
- (BOOL)whenStateIs:(int)a3 atomicallySwapWith:(int)a4;
- (_CATArbitratorWaitToken)initWithDelegateQueue:(id)a3 completionBlock:(id)a4;
- (void)cancel;
- (void)performCompletionBlock;
- (void)resume;
- (void)waitForRegistrationEntry:(id)a3 forKey:(id)a4 exclusive:(BOOL)a5;
@end

@implementation _CATArbitratorWaitToken

- (_CATArbitratorWaitToken)initWithDelegateQueue:(id)a3 completionBlock:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    v19 = [MEMORY[0x263F08690] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"CATArbitrator.m", 591, @"Invalid parameter not satisfying: %@", @"delegateQueue" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  v20 = [MEMORY[0x263F08690] currentHandler];
  [v20 handleFailureInMethod:a2, self, @"CATArbitrator.m", 592, @"Invalid parameter not satisfying: %@", @"completionBlock" object file lineNumber description];

LABEL_3:
  v21.receiver = self;
  v21.super_class = (Class)_CATArbitratorWaitToken;
  v11 = [(_CATArbitratorWaitToken *)&v21 init];
  if (v11)
  {
    uint64_t v12 = objc_opt_new();
    mTokenByKey = v11->mTokenByKey;
    v11->mTokenByKey = (NSMutableDictionary *)v12;

    objc_storeStrong((id *)&v11->mDelegateQueue, a3);
    uint64_t v14 = MEMORY[0x216693330](v10);
    id mCompletionBlock = v11->mCompletionBlock;
    v11->id mCompletionBlock = (id)v14;

    dispatch_group_t v16 = dispatch_group_create();
    mGroup = v11->mGroup;
    v11->mGroup = (OS_dispatch_group *)v16;
  }
  return v11;
}

- (void)waitForRegistrationEntry:(id)a3 forKey:(id)a4 exclusive:(BOOL)a5
{
  BOOL v5 = a5;
  id v13 = a3;
  id v9 = a4;
  v10 = v13;
  if (!v13)
  {
    uint64_t v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"CATArbitrator.m", 608, @"Invalid parameter not satisfying: %@", @"entry" object file lineNumber description];

    v10 = 0;
  }
  v11 = [v10 waitForResourceWithExclusive:v5 group:self->mGroup];
  [(NSMutableDictionary *)self->mTokenByKey setObject:v11 forKeyedSubscript:v9];
}

- (void)resume
{
  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x3032000000;
  v5[3] = __Block_byref_object_copy_;
  v5[4] = __Block_byref_object_dispose_;
  v6 = self;
  mDelegateQueue = v6->mDelegateQueue;
  mGroup = v6->mGroup;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __33___CATArbitratorWaitToken_resume__block_invoke;
  block[3] = &unk_2641DBCD8;
  block[4] = v5;
  dispatch_group_notify(mGroup, mDelegateQueue, block);
  _Block_object_dispose(v5, 8);
}

- (void)performCompletionBlock
{
  if ([(_CATArbitratorWaitToken *)self whenStateIs:0 atomicallySwapWith:2])
  {
    v3 = objc_opt_new();
    mTokenByKey = self->mTokenByKey;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __49___CATArbitratorWaitToken_performCompletionBlock__block_invoke;
    v12[3] = &unk_2641DBD00;
    id v13 = v3;
    id v5 = v3;
    [(NSMutableDictionary *)mTokenByKey enumerateKeysAndObjectsUsingBlock:v12];
    v6 = (void *)[v5 copy];
  }
  else
  {
    if ([(_CATArbitratorWaitToken *)self whenStateIs:1 atomicallySwapWith:2])
    {
      v7 = [(NSMutableDictionary *)self->mTokenByKey allValues];
      [v7 makeObjectsPerformSelector:sel_invalidate];
    }
    v6 = 0;
  }
  (*((void (**)(void))self->mCompletionBlock + 2))();
  id mCompletionBlock = self->mCompletionBlock;
  self->id mCompletionBlock = 0;

  [(NSMutableDictionary *)self->mTokenByKey removeAllObjects];
  id v9 = self->mTokenByKey;
  self->mTokenByKey = 0;

  mDelegateQueue = self->mDelegateQueue;
  self->mDelegateQueue = 0;

  mGroup = self->mGroup;
  self->mGroup = 0;
}

- (void)cancel
{
  if ([(_CATArbitratorWaitToken *)self whenStateIs:0 atomicallySwapWith:1])
  {
    id v3 = [(NSMutableDictionary *)self->mTokenByKey allValues];
    [v3 makeObjectsPerformSelector:sel_cancel];
  }
}

- (BOOL)whenStateIs:(int)a3 atomicallySwapWith:(int)a4
{
  int v4 = a3;
  atomic_compare_exchange_strong(&self->mState, (unsigned int *)&v4, a4);
  return v4 == a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->mCompletionBlock, 0);
  objc_storeStrong((id *)&self->mGroup, 0);
  objc_storeStrong((id *)&self->mDelegateQueue, 0);

  objc_storeStrong((id *)&self->mTokenByKey, 0);
}

@end