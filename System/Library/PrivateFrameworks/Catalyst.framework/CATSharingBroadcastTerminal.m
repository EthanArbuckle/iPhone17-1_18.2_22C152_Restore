@interface CATSharingBroadcastTerminal
- (BOOL)isBroadcasting;
- (CATOperationQueue)delegationQueue;
- (CATSharingBroadcastTerminal)initWithBroadcastPrimitives:(id)a3 delegate:(id)a4 delegationQueue:(id)a5;
- (void)_activate;
- (void)_invalidateWithError:(id)a3 removePrimitiveHandlers:(BOOL)a4 deactivatePrimitives:(BOOL)a5;
- (void)activate;
- (void)addPrimitiveHandlers;
- (void)invalidate;
- (void)removePrimitiveHandlers;
- (void)sessionHasPaired;
- (void)sessionNeedsToDisplayPin:(id)a3;
- (void)setBroadcasting:(BOOL)a3;
@end

@implementation CATSharingBroadcastTerminal

- (CATSharingBroadcastTerminal)initWithBroadcastPrimitives:(id)a3 delegate:(id)a4 delegationQueue:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CATSharingBroadcastTerminal;
  v12 = [(CATSharingBroadcastTerminal *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->mBroadcastPrimitive, a3);
    objc_storeWeak((id *)&v13->mDelegate, v10);
    objc_storeStrong((id *)&v13->mDelegationQueue, a5);
  }

  return v13;
}

- (void)activate
{
  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __39__CATSharingBroadcastTerminal_activate__block_invoke;
  v4[3] = &unk_2641DBCB0;
  objc_copyWeak(&v5, &location);
  v2 = v4;
  v3 = CATGetCatalystQueue();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_18;
  block[3] = &unk_2641DBD98;
  id v8 = v2;
  dispatch_async(v3, block);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __39__CATSharingBroadcastTerminal_activate__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _activate];
}

- (void)invalidate
{
  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __41__CATSharingBroadcastTerminal_invalidate__block_invoke;
  v4[3] = &unk_2641DBCB0;
  objc_copyWeak(&v5, &location);
  v2 = v4;
  v3 = CATGetCatalystQueue();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_18;
  block[3] = &unk_2641DBD98;
  id v8 = v2;
  dispatch_async(v3, block);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __41__CATSharingBroadcastTerminal_invalidate__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = CATErrorWithCodeAndUserInfo(701, 0);
  [WeakRetained _invalidateWithError:v1 removePrimitiveHandlers:1 deactivatePrimitives:1];
}

- (void)_activate
{
  v4 = CATGetCatalystQueue();
  CATAssertIsQueue(v4);

  if (self->mInvalidated)
  {
    v6 = [MEMORY[0x263F08690] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"CATSharingBroadcastTerminal.m" lineNumber:90 description:@"Terminal must not be invalidated"];
  }
  objc_initWeak(&location, self);
  mBroadcastPrimitive = self->mBroadcastPrimitive;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __40__CATSharingBroadcastTerminal__activate__block_invoke;
  v7[3] = &unk_2641DC028;
  objc_copyWeak(&v8, &location);
  [(CATSharingBroadcastPrimitives *)mBroadcastPrimitive activateWithCompletion:v7];
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __40__CATSharingBroadcastTerminal__activate__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __40__CATSharingBroadcastTerminal__activate__block_invoke_2;
  v7[3] = &unk_2641DC0C0;
  objc_copyWeak(&v9, (id *)(a1 + 32));
  id v4 = v3;
  id v8 = v4;
  id v5 = v7;
  v6 = CATGetCatalystQueue();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_18;
  block[3] = &unk_2641DBD98;
  id v11 = v5;
  dispatch_async(v6, block);

  objc_destroyWeak(&v9);
}

void __40__CATSharingBroadcastTerminal__activate__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = *(void **)(a1 + 32);
    if (!v4)
    {
      [WeakRetained setBroadcasting:1];
      [v3 addPrimitiveHandlers];
      id v4 = *(void **)(a1 + 32);
    }
    id v5 = (void *)v3[3];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __40__CATSharingBroadcastTerminal__activate__block_invoke_3;
    v6[3] = &unk_2641DC000;
    v6[4] = v3;
    id v7 = v4;
    [v5 addOperationWithBlock:v6];
  }
}

void __40__CATSharingBroadcastTerminal__activate__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  [WeakRetained broadcastTerminal:*(void *)(a1 + 32) didActivateWithError:*(void *)(a1 + 40)];
}

- (void)_invalidateWithError:(id)a3 removePrimitiveHandlers:(BOOL)a4 deactivatePrimitives:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v9 = a3;
  id v10 = CATGetCatalystQueue();
  CATAssertIsQueue(v10);

  if (self->mInvalidated)
  {
    objc_super v15 = [MEMORY[0x263F08690] currentHandler];
    [v15 handleFailureInMethod:a2 object:self file:@"CATSharingBroadcastTerminal.m" lineNumber:116 description:@"Terminal must not be invalidated"];
  }
  self->mInvalidated = 1;
  [(CATSharingBroadcastTerminal *)self setBroadcasting:0];
  if (v6) {
    [(CATSharingBroadcastTerminal *)self removePrimitiveHandlers];
  }
  if (v5) {
    [(CATSharingBroadcastPrimitives *)self->mBroadcastPrimitive deactivate];
  }
  mBroadcastPrimitive = self->mBroadcastPrimitive;
  self->mBroadcastPrimitive = 0;

  objc_initWeak(&location, self);
  if (self->mIsDisplayingPIN)
  {
    mDelegationQueue = self->mDelegationQueue;
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __97__CATSharingBroadcastTerminal__invalidateWithError_removePrimitiveHandlers_deactivatePrimitives___block_invoke;
    v19[3] = &unk_2641DBCB0;
    objc_copyWeak(&v20, &location);
    [(CATOperationQueue *)mDelegationQueue addOperationWithBlock:v19];
    objc_destroyWeak(&v20);
  }
  v13 = self->mDelegationQueue;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __97__CATSharingBroadcastTerminal__invalidateWithError_removePrimitiveHandlers_deactivatePrimitives___block_invoke_2;
  v16[3] = &unk_2641DC138;
  id v14 = v9;
  id v17 = v14;
  objc_copyWeak(&v18, &location);
  [(CATOperationQueue *)v13 addOperationWithBlock:v16];
  objc_destroyWeak(&v18);

  objc_destroyWeak(&location);
}

void __97__CATSharingBroadcastTerminal__invalidateWithError_removePrimitiveHandlers_deactivatePrimitives___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    id v2 = objc_loadWeakRetained(WeakRetained + 2);
    [v2 broadcastTerminalNeedsToDismissPin:v3];

    id WeakRetained = v3;
  }
}

void __97__CATSharingBroadcastTerminal__invalidateWithError_removePrimitiveHandlers_deactivatePrimitives___block_invoke_2(uint64_t a1)
{
  v9[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    uint64_t v8 = *MEMORY[0x263F08608];
    v9[0] = v2;
    id v3 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
    id v4 = CATErrorWithCodeAndUserInfo(700, v3);
  }
  else
  {
    id v4 = 0;
  }
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  BOOL v6 = WeakRetained;
  if (WeakRetained)
  {
    id v7 = objc_loadWeakRetained(WeakRetained + 2);
    [v7 broadcastTerminal:v6 stoppedWithError:v4];
  }
}

- (void)addPrimitiveHandlers
{
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  void v9[2] = __51__CATSharingBroadcastTerminal_addPrimitiveHandlers__block_invoke;
  v9[3] = &unk_2641DC028;
  objc_copyWeak(&v10, &location);
  [(CATSharingBroadcastPrimitives *)self->mBroadcastPrimitive setInvalidationHandler:v9];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __51__CATSharingBroadcastTerminal_addPrimitiveHandlers__block_invoke_3;
  v7[3] = &unk_2641DC750;
  objc_copyWeak(&v8, &location);
  [(CATSharingBroadcastPrimitives *)self->mBroadcastPrimitive setShowPinHandler:v7];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __51__CATSharingBroadcastTerminal_addPrimitiveHandlers__block_invoke_5;
  v5[3] = &unk_2641DBCB0;
  objc_copyWeak(&v6, &location);
  [(CATSharingBroadcastPrimitives *)self->mBroadcastPrimitive setDismissPinHandler:v5];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __51__CATSharingBroadcastTerminal_addPrimitiveHandlers__block_invoke_7;
  v3[3] = &unk_2641DBCB0;
  objc_copyWeak(&v4, &location);
  [(CATSharingBroadcastPrimitives *)self->mBroadcastPrimitive setSessionPairedHandler:v3];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __51__CATSharingBroadcastTerminal_addPrimitiveHandlers__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __51__CATSharingBroadcastTerminal_addPrimitiveHandlers__block_invoke_2;
  v7[3] = &unk_2641DC0C0;
  objc_copyWeak(&v9, (id *)(a1 + 32));
  id v4 = v3;
  id v8 = v4;
  BOOL v5 = v7;
  id v6 = CATGetCatalystQueue();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_18;
  block[3] = &unk_2641DBD98;
  id v11 = v5;
  dispatch_async(v6, block);

  objc_destroyWeak(&v9);
}

void __51__CATSharingBroadcastTerminal_addPrimitiveHandlers__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _invalidateWithError:*(void *)(a1 + 32) removePrimitiveHandlers:1 deactivatePrimitives:1];
}

void __51__CATSharingBroadcastTerminal_addPrimitiveHandlers__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __51__CATSharingBroadcastTerminal_addPrimitiveHandlers__block_invoke_4;
  v7[3] = &unk_2641DC0C0;
  objc_copyWeak(&v9, (id *)(a1 + 32));
  id v4 = v3;
  id v8 = v4;
  BOOL v5 = v7;
  id v6 = CATGetCatalystQueue();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_18;
  block[3] = &unk_2641DBD98;
  id v11 = v5;
  dispatch_async(v6, block);

  objc_destroyWeak(&v9);
}

void __51__CATSharingBroadcastTerminal_addPrimitiveHandlers__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained sessionNeedsToDisplayPin:*(void *)(a1 + 32)];
}

void __51__CATSharingBroadcastTerminal_addPrimitiveHandlers__block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = (void *)*((void *)WeakRetained + 3);
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __51__CATSharingBroadcastTerminal_addPrimitiveHandlers__block_invoke_6;
    v4[3] = &unk_2641DBE60;
    void v4[4] = v2;
    [v3 addOperationWithBlock:v4];
  }
}

void __51__CATSharingBroadcastTerminal_addPrimitiveHandlers__block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  [WeakRetained broadcastTerminalNeedsToDismissPin:*(void *)(a1 + 32)];
}

void __51__CATSharingBroadcastTerminal_addPrimitiveHandlers__block_invoke_7(uint64_t a1)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __51__CATSharingBroadcastTerminal_addPrimitiveHandlers__block_invoke_8;
  v3[3] = &unk_2641DBCB0;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  v1 = v3;
  uint64_t v2 = CATGetCatalystQueue();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_18;
  block[3] = &unk_2641DBD98;
  id v6 = v1;
  dispatch_async(v2, block);

  objc_destroyWeak(&v4);
}

void __51__CATSharingBroadcastTerminal_addPrimitiveHandlers__block_invoke_8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained sessionHasPaired];
}

- (void)removePrimitiveHandlers
{
  [(CATSharingBroadcastPrimitives *)self->mBroadcastPrimitive setInvalidationHandler:0];
  [(CATSharingBroadcastPrimitives *)self->mBroadcastPrimitive setShowPinHandler:0];
  [(CATSharingBroadcastPrimitives *)self->mBroadcastPrimitive setDismissPinHandler:0];
  mBroadcastPrimitive = self->mBroadcastPrimitive;

  [(CATSharingBroadcastPrimitives *)mBroadcastPrimitive setSessionPairedHandler:0];
}

- (void)sessionNeedsToDisplayPin:(id)a3
{
  id v5 = a3;
  id v6 = CATGetCatalystQueue();
  CATAssertIsQueue(v6);

  if (self->mInvalidated)
  {
    id v9 = [MEMORY[0x263F08690] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"CATSharingBroadcastTerminal.m" lineNumber:207 description:@"Terminal must not be invalidated"];
  }
  self->mIsDisplayingPIN = 1;
  objc_initWeak(&location, self);
  mDelegationQueue = self->mDelegationQueue;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __56__CATSharingBroadcastTerminal_sessionNeedsToDisplayPin___block_invoke;
  v10[3] = &unk_2641DC0C0;
  objc_copyWeak(&v12, &location);
  id v8 = v5;
  id v11 = v8;
  [(CATOperationQueue *)mDelegationQueue addOperationWithBlock:v10];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __56__CATSharingBroadcastTerminal_sessionNeedsToDisplayPin___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    id v3 = objc_loadWeakRetained(WeakRetained + 2);
    [v3 broadcastTerminal:v4 needsToDisplayPin:*(void *)(a1 + 32)];

    id WeakRetained = v4;
  }
}

- (void)sessionHasPaired
{
  id v4 = CATGetCatalystQueue();
  CATAssertIsQueue(v4);

  if (self->mInvalidated)
  {
    id v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"CATSharingBroadcastTerminal.m" lineNumber:224 description:@"Terminal must not be invalidated"];
  }
  [(CATSharingBroadcastTerminal *)self removePrimitiveHandlers];
  id v5 = [CATSharingBroadcastConnection alloc];
  mBroadcastPrimitive = self->mBroadcastPrimitive;
  id v7 = objc_opt_new();
  id v8 = [(CATSharingBroadcastConnection *)v5 initWithBroadcastPrimitives:mBroadcastPrimitive timerSource:v7];

  objc_initWeak(&location, self);
  mDelegationQueue = self->mDelegationQueue;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __47__CATSharingBroadcastTerminal_sessionHasPaired__block_invoke;
  v13[3] = &unk_2641DC0C0;
  objc_copyWeak(&v15, &location);
  id v10 = v8;
  id v14 = v10;
  [(CATOperationQueue *)mDelegationQueue addOperationWithBlock:v13];
  id v11 = CATErrorWithCodeAndUserInfo(702, 0);
  [(CATSharingBroadcastTerminal *)self _invalidateWithError:v11 removePrimitiveHandlers:0 deactivatePrimitives:0];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __47__CATSharingBroadcastTerminal_sessionHasPaired__block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    id v3 = objc_loadWeakRetained(WeakRetained + 2);
    [v3 broadcastTerminal:v4 hasPairedDeviceConnection:*(void *)(a1 + 32)];

    id WeakRetained = v4;
  }
}

- (BOOL)isBroadcasting
{
  return self->_broadcasting;
}

- (void)setBroadcasting:(BOOL)a3
{
  self->_broadcasting = a3;
}

- (CATOperationQueue)delegationQueue
{
  return self->_delegationQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegationQueue, 0);
  objc_storeStrong((id *)&self->mDelegationQueue, 0);
  objc_destroyWeak((id *)&self->mDelegate);

  objc_storeStrong((id *)&self->mBroadcastPrimitive, 0);
}

@end