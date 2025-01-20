@interface CRKSynchronizeIDSFirewallOperation
- (BOOL)isAsynchronous;
- (CATOperation)addAllowedAppleIDsOperation;
- (CATOperation)fetchAllowedAppleIDsOperation;
- (CATOperation)removeAllowedAppleIDsOperation;
- (CRKIDSLocalFirewallStorage)localStorage;
- (CRKIDSPrimitives)IDSPrimitives;
- (CRKSynchronizeIDSFirewallOperation)initWithIDSPrimitives:(id)a3 localStorage:(id)a4 trustedRosterAppleIDs:(id)a5;
- (NSSet)appleIDsToAdd;
- (NSSet)appleIDsToRemove;
- (NSSet)trustedRosterAppleIDs;
- (id)operationToAddAllowedAppleIDs:(id)a3;
- (id)operationToFetchAllowedAppleIDs;
- (id)operationToRemoveAllowedAppleIDs:(id)a3;
- (void)addAllowedAppleIDs;
- (void)cancel;
- (void)computeChanges;
- (void)fetchAllowedAppleIDs;
- (void)finishWithError:(id)a3;
- (void)main;
- (void)operationToAddAllowedAppleIDsDidFinish:(id)a3;
- (void)operationToFetchAppleIDsDidFinish:(id)a3;
- (void)operationToRemoveAllowedAppleIDsDidFinish:(id)a3;
- (void)removeAllowedAppleIDs;
- (void)run;
- (void)setAddAllowedAppleIDsOperation:(id)a3;
- (void)setAppleIDsToAdd:(id)a3;
- (void)setAppleIDsToRemove:(id)a3;
- (void)setFetchAllowedAppleIDsOperation:(id)a3;
- (void)setRemoveAllowedAppleIDsOperation:(id)a3;
@end

@implementation CRKSynchronizeIDSFirewallOperation

- (CRKSynchronizeIDSFirewallOperation)initWithIDSPrimitives:(id)a3 localStorage:(id)a4 trustedRosterAppleIDs:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)CRKSynchronizeIDSFirewallOperation;
  v12 = [(CRKSynchronizeIDSFirewallOperation *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_IDSPrimitives, a3);
    objc_storeStrong((id *)&v13->_localStorage, a4);
    uint64_t v14 = [v11 copy];
    trustedRosterAppleIDs = v13->_trustedRosterAppleIDs;
    v13->_trustedRosterAppleIDs = (NSSet *)v14;
  }
  return v13;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)main
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__CRKSynchronizeIDSFirewallOperation_main__block_invoke;
  block[3] = &unk_2646F35C0;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __42__CRKSynchronizeIDSFirewallOperation_main__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) run];
}

- (void)cancel
{
  v4.receiver = self;
  v4.super_class = (Class)CRKSynchronizeIDSFirewallOperation;
  [(CRKSynchronizeIDSFirewallOperation *)&v4 cancel];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__CRKSynchronizeIDSFirewallOperation_cancel__block_invoke;
  block[3] = &unk_2646F35C0;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __44__CRKSynchronizeIDSFirewallOperation_cancel__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isExecuting])
  {
    v2 = [*(id *)(a1 + 32) fetchAllowedAppleIDsOperation];
    [v2 cancel];

    v3 = [*(id *)(a1 + 32) addAllowedAppleIDsOperation];
    [v3 cancel];

    objc_super v4 = [*(id *)(a1 + 32) removeAllowedAppleIDsOperation];
    [v4 cancel];

    v5 = *(void **)(a1 + 32);
    CATErrorWithCodeAndUserInfo();
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    [v5 finishWithError:v6];
  }
}

- (void)run
{
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    id v6 = [MEMORY[0x263F08690] currentHandler];
    v7 = NSStringFromSelector(a2);
    [v6 handleFailureInMethod:a2, self, @"CRKSynchronizeIDSFirewallOperation.m", 81, @"%@ must be called from the main thread", v7 object file lineNumber description];
  }
  if ([(CRKSynchronizeIDSFirewallOperation *)self isExecuting])
  {
    objc_super v4 = [(CRKSynchronizeIDSFirewallOperation *)self localStorage];
    v5 = [v4 allowedAppleIDs];

    if (v5)
    {
      [(CRKSynchronizeIDSFirewallOperation *)self computeChanges];
    }
    else
    {
      [(CRKSynchronizeIDSFirewallOperation *)self fetchAllowedAppleIDs];
    }
  }
}

- (void)fetchAllowedAppleIDs
{
  id v4 = [(CRKSynchronizeIDSFirewallOperation *)self operationToFetchAllowedAppleIDs];
  [(CRKSynchronizeIDSFirewallOperation *)self setFetchAllowedAppleIDsOperation:v4];
  [v4 addTarget:self selector:sel_operationToFetchAppleIDsDidFinish_ forOperationEvents:6];
  v3 = objc_msgSend(MEMORY[0x263F39C90], "crk_backgroundQueue");
  [v3 addOperation:v4];
}

- (void)operationToFetchAppleIDsDidFinish:(id)a3
{
  id v13 = a3;
  if ([(CRKSynchronizeIDSFirewallOperation *)self isExecuting])
  {
    id v4 = [v13 error];

    if (v4)
    {
      v5 = [v13 error];
      [(CRKSynchronizeIDSFirewallOperation *)self finishWithError:v5];
    }
    else
    {
      v5 = [v13 resultObject];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v7 = [MEMORY[0x263F08690] currentHandler];
        v8 = [NSString stringWithUTF8String:"-[CRKSynchronizeIDSFirewallOperation operationToFetchAppleIDsDidFinish:]"];
        id v9 = (objc_class *)objc_opt_class();
        id v10 = NSStringFromClass(v9);
        id v11 = (objc_class *)objc_opt_class();
        v12 = NSStringFromClass(v11);
        [v7 handleFailureInFunction:v8, @"CRKSynchronizeIDSFirewallOperation.m", 113, @"expected %@, got %@", v10, v12 file lineNumber description];
      }
      id v6 = [(CRKSynchronizeIDSFirewallOperation *)self localStorage];
      [v6 setAllowedAppleIDs:v5];

      [(CRKSynchronizeIDSFirewallOperation *)self computeChanges];
    }
  }

  MEMORY[0x270F9A758]();
}

- (void)computeChanges
{
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    id v13 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v14 = NSStringFromSelector(a2);
    [v13 handleFailureInMethod:a2, self, @"CRKSynchronizeIDSFirewallOperation.m", 120, @"%@ must be called from the main thread", v14 object file lineNumber description];
  }
  id v4 = [(CRKSynchronizeIDSFirewallOperation *)self localStorage];
  v5 = [v4 allowedAppleIDs];

  if (!v5)
  {
    v15 = [MEMORY[0x263F08690] currentHandler];
    [v15 handleFailureInMethod:a2 object:self file:@"CRKSynchronizeIDSFirewallOperation.m" lineNumber:121 description:@"Should have some locally stored AppleIDs"];
  }
  id v6 = [(CRKSynchronizeIDSFirewallOperation *)self trustedRosterAppleIDs];
  id v16 = (id)[v6 mutableCopy];

  v7 = [(CRKSynchronizeIDSFirewallOperation *)self localStorage];
  v8 = [v7 allowedAppleIDs];
  [v16 minusSet:v8];

  id v9 = [(CRKSynchronizeIDSFirewallOperation *)self localStorage];
  id v10 = [v9 allowedAppleIDs];
  id v11 = (void *)[v10 mutableCopy];

  v12 = [(CRKSynchronizeIDSFirewallOperation *)self trustedRosterAppleIDs];
  [v11 minusSet:v12];

  [(CRKSynchronizeIDSFirewallOperation *)self setAppleIDsToAdd:v16];
  [(CRKSynchronizeIDSFirewallOperation *)self setAppleIDsToRemove:v11];
  [(CRKSynchronizeIDSFirewallOperation *)self addAllowedAppleIDs];
}

- (void)addAllowedAppleIDs
{
  id v4 = [(CRKSynchronizeIDSFirewallOperation *)self appleIDsToAdd];

  if (!v4)
  {
    v7 = [MEMORY[0x263F08690] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"CRKSynchronizeIDSFirewallOperation.m" lineNumber:136 description:@"Should have computed a set of Apple Accounts to add"];
  }
  v5 = [(CRKSynchronizeIDSFirewallOperation *)self appleIDsToAdd];
  id v8 = [(CRKSynchronizeIDSFirewallOperation *)self operationToAddAllowedAppleIDs:v5];

  [(CRKSynchronizeIDSFirewallOperation *)self setAddAllowedAppleIDsOperation:v8];
  [v8 addTarget:self selector:sel_operationToAddAllowedAppleIDsDidFinish_ forOperationEvents:6];
  id v6 = objc_msgSend(MEMORY[0x263F39C90], "crk_backgroundQueue");
  [v6 addOperation:v8];
}

- (void)operationToAddAllowedAppleIDsDidFinish:(id)a3
{
  id v6 = a3;
  if ([(CRKSynchronizeIDSFirewallOperation *)self isExecuting])
  {
    id v4 = [v6 error];

    if (v4)
    {
      v5 = [v6 error];
      [(CRKSynchronizeIDSFirewallOperation *)self finishWithError:v5];
    }
    else
    {
      [(CRKSynchronizeIDSFirewallOperation *)self removeAllowedAppleIDs];
    }
  }
}

- (void)removeAllowedAppleIDs
{
  id v4 = [(CRKSynchronizeIDSFirewallOperation *)self appleIDsToRemove];

  if (!v4)
  {
    v7 = [MEMORY[0x263F08690] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"CRKSynchronizeIDSFirewallOperation.m" lineNumber:158 description:@"Should have computed a set of Apple Accounts to remove"];
  }
  v5 = [(CRKSynchronizeIDSFirewallOperation *)self appleIDsToRemove];
  id v8 = [(CRKSynchronizeIDSFirewallOperation *)self operationToRemoveAllowedAppleIDs:v5];

  [(CRKSynchronizeIDSFirewallOperation *)self setRemoveAllowedAppleIDsOperation:v8];
  [v8 addTarget:self selector:sel_operationToRemoveAllowedAppleIDsDidFinish_ forOperationEvents:6];
  id v6 = objc_msgSend(MEMORY[0x263F39C90], "crk_backgroundQueue");
  [v6 addOperation:v8];
}

- (void)operationToRemoveAllowedAppleIDsDidFinish:(id)a3
{
  id v5 = a3;
  if ([(CRKSynchronizeIDSFirewallOperation *)self isExecuting])
  {
    id v4 = [v5 error];
    [(CRKSynchronizeIDSFirewallOperation *)self finishWithError:v4];
  }
}

- (void)finishWithError:(id)a3
{
  id v10 = a3;
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    id v8 = [MEMORY[0x263F08690] currentHandler];
    id v9 = NSStringFromSelector(a2);
    [v8 handleFailureInMethod:a2, self, @"CRKSynchronizeIDSFirewallOperation.m", 175, @"%@ must be called from the main thread", v9 object file lineNumber description];
  }
  if (v10)
  {
    id v5 = [(CRKSynchronizeIDSFirewallOperation *)self localStorage];
    [v5 setAllowedAppleIDs:0];

    [(CRKSynchronizeIDSFirewallOperation *)self endOperationWithError:v10];
  }
  else
  {
    id v6 = [(CRKSynchronizeIDSFirewallOperation *)self trustedRosterAppleIDs];
    v7 = [(CRKSynchronizeIDSFirewallOperation *)self localStorage];
    [v7 setAllowedAppleIDs:v6];

    [(CRKSynchronizeIDSFirewallOperation *)self endOperationWithResultObject:0];
  }
}

- (id)operationToFetchAllowedAppleIDs
{
  v2 = [(CRKSynchronizeIDSFirewallOperation *)self IDSPrimitives];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __69__CRKSynchronizeIDSFirewallOperation_operationToFetchAllowedAppleIDs__block_invoke;
  v6[3] = &unk_2646F3610;
  id v7 = v2;
  id v3 = v2;
  id v4 = +[CRKBlockOperation blockOperationWithBlock:v6];

  return v4;
}

void __69__CRKSynchronizeIDSFirewallOperation_operationToFetchAllowedAppleIDs__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(void **)(a1 + 32);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __69__CRKSynchronizeIDSFirewallOperation_operationToFetchAllowedAppleIDs__block_invoke_2;
  v10[3] = &unk_2646F35E8;
  id v11 = v6;
  id v12 = v5;
  id v8 = v5;
  id v9 = v6;
  [v7 fetchFirewallAllowedAppleIDs:v10];
}

uint64_t __69__CRKSynchronizeIDSFirewallOperation_operationToFetchAllowedAppleIDs__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (id)operationToAddAllowedAppleIDs:(id)a3
{
  id v4 = a3;
  id v5 = [(CRKSynchronizeIDSFirewallOperation *)self IDSPrimitives];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __68__CRKSynchronizeIDSFirewallOperation_operationToAddAllowedAppleIDs___block_invoke;
  v10[3] = &unk_2646F3660;
  id v11 = v4;
  id v12 = v5;
  id v6 = v5;
  id v7 = v4;
  id v8 = +[CRKBlockOperation blockOperationWithBlock:v10];

  return v8;
}

void __68__CRKSynchronizeIDSFirewallOperation_operationToAddAllowedAppleIDs___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if ([*(id *)(a1 + 32) count])
  {
    id v7 = _CRKLogASM_1();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = objc_msgSend(*(id *)(a1 + 32), "crk_stableDescription");
      *(_DWORD *)buf = 138543362;
      id v16 = v8;
      _os_log_impl(&dword_224C00000, v7, OS_LOG_TYPE_DEFAULT, "Adding %{public}@ to IDS firewall.", buf, 0xCu);
    }
    uint64_t v11 = a1 + 32;
    uint64_t v9 = *(void *)(a1 + 32);
    id v10 = *(void **)(v11 + 8);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __68__CRKSynchronizeIDSFirewallOperation_operationToAddAllowedAppleIDs___block_invoke_32;
    v12[3] = &unk_2646F3638;
    id v13 = v6;
    id v14 = v5;
    [v10 addAllowedAppleIDsToFirewall:v9 completion:v12];
  }
  else
  {
    (*((void (**)(id, void))v5 + 2))(v5, 0);
  }
}

uint64_t __68__CRKSynchronizeIDSFirewallOperation_operationToAddAllowedAppleIDs___block_invoke_32(uint64_t a1, uint64_t a2)
{
  if (a2) {
    uint64_t v2 = *(void *)(a1 + 32);
  }
  else {
    uint64_t v2 = *(void *)(a1 + 40);
  }
  return (*(uint64_t (**)(void))(v2 + 16))();
}

- (id)operationToRemoveAllowedAppleIDs:(id)a3
{
  id v4 = a3;
  id v5 = [(CRKSynchronizeIDSFirewallOperation *)self IDSPrimitives];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __71__CRKSynchronizeIDSFirewallOperation_operationToRemoveAllowedAppleIDs___block_invoke;
  v10[3] = &unk_2646F3660;
  id v11 = v4;
  id v12 = v5;
  id v6 = v5;
  id v7 = v4;
  id v8 = +[CRKBlockOperation blockOperationWithBlock:v10];

  return v8;
}

void __71__CRKSynchronizeIDSFirewallOperation_operationToRemoveAllowedAppleIDs___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if ([*(id *)(a1 + 32) count])
  {
    id v7 = _CRKLogASM_1();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = objc_msgSend(*(id *)(a1 + 32), "crk_stableDescription");
      *(_DWORD *)buf = 138543362;
      id v16 = v8;
      _os_log_impl(&dword_224C00000, v7, OS_LOG_TYPE_DEFAULT, "Removing %{public}@ from IDS firewall.", buf, 0xCu);
    }
    uint64_t v11 = a1 + 32;
    uint64_t v9 = *(void *)(a1 + 32);
    id v10 = *(void **)(v11 + 8);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __71__CRKSynchronizeIDSFirewallOperation_operationToRemoveAllowedAppleIDs___block_invoke_34;
    v12[3] = &unk_2646F3638;
    id v13 = v6;
    id v14 = v5;
    [v10 removeAllowedAppleIDsFromFirewall:v9 completion:v12];
  }
  else
  {
    (*((void (**)(id, void))v5 + 2))(v5, 0);
  }
}

uint64_t __71__CRKSynchronizeIDSFirewallOperation_operationToRemoveAllowedAppleIDs___block_invoke_34(uint64_t a1, uint64_t a2)
{
  if (a2) {
    uint64_t v2 = *(void *)(a1 + 32);
  }
  else {
    uint64_t v2 = *(void *)(a1 + 40);
  }
  return (*(uint64_t (**)(void))(v2 + 16))();
}

- (CRKIDSLocalFirewallStorage)localStorage
{
  return self->_localStorage;
}

- (CRKIDSPrimitives)IDSPrimitives
{
  return self->_IDSPrimitives;
}

- (NSSet)trustedRosterAppleIDs
{
  return self->_trustedRosterAppleIDs;
}

- (NSSet)appleIDsToAdd
{
  return self->_appleIDsToAdd;
}

- (void)setAppleIDsToAdd:(id)a3
{
}

- (NSSet)appleIDsToRemove
{
  return self->_appleIDsToRemove;
}

- (void)setAppleIDsToRemove:(id)a3
{
}

- (CATOperation)fetchAllowedAppleIDsOperation
{
  return self->_fetchAllowedAppleIDsOperation;
}

- (void)setFetchAllowedAppleIDsOperation:(id)a3
{
}

- (CATOperation)addAllowedAppleIDsOperation
{
  return self->_addAllowedAppleIDsOperation;
}

- (void)setAddAllowedAppleIDsOperation:(id)a3
{
}

- (CATOperation)removeAllowedAppleIDsOperation
{
  return self->_removeAllowedAppleIDsOperation;
}

- (void)setRemoveAllowedAppleIDsOperation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_removeAllowedAppleIDsOperation, 0);
  objc_storeStrong((id *)&self->_addAllowedAppleIDsOperation, 0);
  objc_storeStrong((id *)&self->_fetchAllowedAppleIDsOperation, 0);
  objc_storeStrong((id *)&self->_appleIDsToRemove, 0);
  objc_storeStrong((id *)&self->_appleIDsToAdd, 0);
  objc_storeStrong((id *)&self->_trustedRosterAppleIDs, 0);
  objc_storeStrong((id *)&self->_IDSPrimitives, 0);

  objc_storeStrong((id *)&self->_localStorage, 0);
}

@end