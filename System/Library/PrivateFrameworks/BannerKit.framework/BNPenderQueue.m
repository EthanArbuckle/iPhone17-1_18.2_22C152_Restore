@interface BNPenderQueue
- (BOOL)isSuspended;
- (BOOL)setSuspended:(BOOL)a3 forReason:(id)a4;
- (BOOL)setSuspended:(BOOL)a3 forRequesterWithIdentifier:(id)a4 reason:(id)a5;
- (NSSet)activeSuspensionReasons;
- (NSString)penderIdentifier;
- (id)_penderForRequesterWithIdentifier:(id)a3 creatingIfNecessary:(BOOL)a4;
- (id)peekPresentable;
- (id)pullPresentablesWithIdentification:(id)a3;
- (void)enqueuePresentable:(id)a3 withOptions:(unint64_t)a4 userInfo:(id)a5;
- (void)presentableQueue:(id)a3 didDequeuePresentableWithPendingIdentifier:(id)a4;
- (void)setPenderIdentifier:(id)a3;
@end

@implementation BNPenderQueue

- (BOOL)setSuspended:(BOOL)a3 forRequesterWithIdentifier:(id)a4 reason:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [v8 length];
  LOBYTE(v11) = 0;
  if (v9 && v10)
  {
    v12 = [(BNPenderQueue *)self _penderForRequesterWithIdentifier:v8 creatingIfNecessary:1];
    int v11 = [v12 setSuspended:v6 forReason:v9];
    if (v11)
    {
      v13 = self;
      objc_sync_enter(v13);
      suspendedPenders = v13->_suspendedPenders;
      if (v6)
      {
        if (!suspendedPenders)
        {
          v15 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
          v16 = v13->_suspendedPenders;
          v13->_suspendedPenders = v15;

          suspendedPenders = v13->_suspendedPenders;
        }
        [(NSMutableSet *)suspendedPenders addObject:v12];
      }
      else
      {
        [(NSMutableSet *)suspendedPenders removeObject:v12];
      }
      objc_sync_exit(v13);
    }
  }

  return v11;
}

- (void)enqueuePresentable:(id)a3 withOptions:(unint64_t)a4 userInfo:(id)a5
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = v9;
  if (v8)
  {
    int v11 = [v8 requesterIdentifier];
    v12 = [(BNPenderQueue *)self _penderForRequesterWithIdentifier:v11 creatingIfNecessary:1];

    if (v12)
    {
      v13 = self;
      objc_sync_enter(v13);
      v14 = [[BNPenderQueueEntry alloc] initWithPender:v12];
      penderQueue = v13->_penderQueue;
      if (!penderQueue)
      {
        v16 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
        v17 = v13->_penderQueue;
        v13->_penderQueue = v16;

        penderQueue = v13->_penderQueue;
      }
      [(NSMutableArray *)penderQueue addObject:v14];
      if (v10)
      {
        v18 = (void *)[v10 mutableCopy];
        v19 = [(BNPenderQueueEntry *)v14 entryIdentifier];
        [v18 setObject:v19 forKey:@"BNPresentableQueueUserInfoUniquePendingIdentifierKey"];
      }
      else
      {
        v22 = @"BNPresentableQueueUserInfoUniquePendingIdentifierKey";
        v21 = [(BNPenderQueueEntry *)v14 entryIdentifier];
        v23[0] = v21;
        v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
      }
      [v12 enqueuePresentable:v8 withOptions:a4 userInfo:v18];

      objc_sync_exit(v13);
    }
    else
    {
      v20 = (void *)BNLogPending;
      if (os_log_type_enabled((os_log_t)BNLogPending, OS_LOG_TYPE_ERROR)) {
        -[BNPenderQueue enqueuePresentable:withOptions:userInfo:]((uint64_t)self, v20, v8);
      }
      v18 = v10;
    }
  }
  else
  {
    v18 = v9;
  }
}

- (id)peekPresentable
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = self;
  objc_sync_enter(v2);
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = v2->_penderQueue;
  v4 = (void *)[(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        v7 = objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "pender", (void)v9);
        if (([v7 isSuspended] & 1) == 0)
        {
          v4 = [v7 peekPresentable];

          goto LABEL_11;
        }
      }
      v4 = (void *)[(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  objc_sync_exit(v2);
  return v4;
}

- (id)pullPresentablesWithIdentification:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 requesterIdentifier];
  BOOL v6 = [(BNPenderQueue *)self _penderForRequesterWithIdentifier:v5 creatingIfNecessary:0];
  v7 = [v6 pullPresentablesWithIdentification:v4];

  return v7;
}

- (BOOL)isSuspended
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ([(BNSuspensionController *)self->_suspensionController isSuspended])
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    id v4 = self;
    objc_sync_enter(v4);
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v5 = v4->_penderQueue;
    uint64_t v3 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v3)
    {
      uint64_t v6 = *(void *)v12;
      while (2)
      {
        for (uint64_t i = 0; i != v3; ++i)
        {
          if (*(void *)v12 != v6) {
            objc_enumerationMutation(v5);
          }
          id v8 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "pender", (void)v11);
          char v9 = [v8 isSuspended];

          if ((v9 & 1) == 0)
          {
            LOBYTE(v3) = 0;
            goto LABEL_13;
          }
        }
        uint64_t v3 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v3) {
          continue;
        }
        break;
      }
      LOBYTE(v3) = 1;
    }
LABEL_13:

    objc_sync_exit(v4);
  }
  return v3;
}

- (NSSet)activeSuspensionReasons
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (![(BNPenderQueue *)self isSuspended]) {
    goto LABEL_15;
  }
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  if ([(BNSuspensionController *)self->_suspensionController isSuspended])
  {
    uint64_t v5 = [(BNSuspensionController *)self->_suspensionController activeSuspensionReasons];
    [v4 unionSet:v5];
  }
  else
  {
    uint64_t v6 = self;
    objc_sync_enter(v6);
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v7 = v6->_penderQueue;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v16;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v7);
          }
          long long v11 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v10), "pender", (void)v15);
          if (([v11 isSuspended] & 1) == 0)
          {
            long long v13 = [MEMORY[0x1E4F28B00] currentHandler];
            [v13 handleFailureInMethod:a2, v6, @"BNPenderQueue.m", 126, @"We claim to be suspended, but the suspension controller isn't suspended, and a queued pender isn't either" object file lineNumber description];
          }
          long long v12 = [v11 activeSuspensionReasons];
          [v4 unionSet:v12];

          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v8);
    }

    objc_sync_exit(v6);
  }
  if (!v4) {
LABEL_15:
  }
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CAD0]);
  return (NSSet *)v4;
}

- (BOOL)setSuspended:(BOOL)a3 forReason:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (v6 && v4 && !self->_suspensionController)
  {
    v7 = objc_alloc_init(BNSuspensionController);
    suspensionController = self->_suspensionController;
    self->_suspensionController = v7;

    [(BNSuspensionController *)self->_suspensionController setIdentifier:self->_penderIdentifier];
  }
  BOOL v9 = [(BNSuspensionController *)self->_suspensionController setSuspended:v4 forReason:v6];

  return v9;
}

- (void)presentableQueue:(id)a3 didDequeuePresentableWithPendingIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  BOOL v9 = self;
  objc_sync_enter(v9);
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = 0x7FFFFFFFFFFFFFFFLL;
  penderQueue = v9->_penderQueue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __77__BNPenderQueue_presentableQueue_didDequeuePresentableWithPendingIdentifier___block_invoke;
  v13[3] = &unk_1E63BA030;
  id v11 = v8;
  id v14 = v11;
  id v12 = v7;
  id v15 = v12;
  long long v16 = v9;
  long long v17 = &v19;
  SEL v18 = a2;
  [(NSMutableArray *)penderQueue enumerateObjectsUsingBlock:v13];
  [(NSMutableArray *)v9->_penderQueue removeObjectAtIndex:v20[3]];

  _Block_object_dispose(&v19, 8);
  objc_sync_exit(v9);
}

void __77__BNPenderQueue_presentableQueue_didDequeuePresentableWithPendingIdentifier___block_invoke(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v18 = a2;
  id v7 = [v18 entryIdentifier];
  int v8 = [v7 isEqual:a1[4]];

  BOOL v9 = v18;
  if (v8)
  {
    uint64_t v10 = [v18 pender];
    id v11 = (void *)a1[5];

    if (v10 != v11)
    {
      id v12 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v13 = a1[8];
      uint64_t v15 = a1[5];
      uint64_t v14 = a1[6];
      uint64_t v16 = a1[4];
      long long v17 = [v18 pender];
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", v13, v14, @"BNPenderQueue.m", 152, @"PendingID matches, but pender does not: pendingID: %@; expected pender: %@; found pender: %@",
        v16,
        v15,
        v17);
    }
    *(void *)(*(void *)(a1[7] + 8) + 24) = a3;
    *a4 = 1;
    BOOL v9 = v18;
  }
}

- (id)_penderForRequesterWithIdentifier:(id)a3 creatingIfNecessary:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([v6 length])
  {
    id v7 = self;
    objc_sync_enter(v7);
    penderQueue = v7->_penderQueue;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __71__BNPenderQueue__penderForRequesterWithIdentifier_creatingIfNecessary___block_invoke;
    v21[3] = &unk_1E63BA058;
    id v9 = v6;
    id v22 = v9;
    uint64_t v10 = [(NSMutableArray *)penderQueue bs_firstObjectPassingTest:v21];
    id v11 = [v10 pender];

    if (!v11)
    {
      id v12 = [(NSMutableSet *)v7->_suspendedPenders allObjects];
      uint64_t v16 = MEMORY[0x1E4F143A8];
      uint64_t v17 = 3221225472;
      id v18 = __71__BNPenderQueue__penderForRequesterWithIdentifier_creatingIfNecessary___block_invoke_2;
      uint64_t v19 = &unk_1E63BA080;
      id v13 = v9;
      id v20 = v13;
      objc_msgSend(v12, "bs_firstObjectPassingTest:", &v16);
      id v11 = (BNPresentableQueue *)objc_claimAutoreleasedReturnValue();

      if (!v11 && v4)
      {
        id v11 = objc_alloc_init(BNPresentableQueue);
        -[BNPresentableQueue setPenderIdentifier:](v11, "setPenderIdentifier:", v13, v16, v17, v18, v19);
        [(BNPresentableQueue *)v11 setDelegate:v7];
      }
    }

    objc_sync_exit(v7);
  }
  else
  {
    uint64_t v14 = BNLogPending;
    if (os_log_type_enabled((os_log_t)BNLogPending, OS_LOG_TYPE_ERROR)) {
      -[BNPenderQueue _penderForRequesterWithIdentifier:creatingIfNecessary:]((uint64_t)self, v14);
    }
    id v11 = 0;
  }

  return v11;
}

uint64_t __71__BNPenderQueue__penderForRequesterWithIdentifier_creatingIfNecessary___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 pender];
  BOOL v4 = [v3 penderIdentifier];
  uint64_t v5 = [v4 isEqualToString:*(void *)(a1 + 32)];

  return v5;
}

uint64_t __71__BNPenderQueue__penderForRequesterWithIdentifier_creatingIfNecessary___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 penderIdentifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (NSString)penderIdentifier
{
  return self->_penderIdentifier;
}

- (void)setPenderIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_penderIdentifier, 0);
  objc_storeStrong((id *)&self->_suspensionController, 0);
  objc_storeStrong((id *)&self->_suspendedPenders, 0);
  objc_storeStrong((id *)&self->_penderQueue, 0);
}

- (void)enqueuePresentable:(uint64_t)a1 withOptions:(void *)a2 userInfo:(void *)a3 .cold.1(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = a2;
  id v6 = BNEffectivePresentableDescription(a3);
  int v7 = 138543618;
  uint64_t v8 = v4;
  __int16 v9 = 2114;
  uint64_t v10 = v6;
  _os_log_error_impl(&dword_1BEC04000, v5, OS_LOG_TYPE_ERROR, "(%{public}@) Failed to obtain pender for presentable: %{public}@", (uint8_t *)&v7, 0x16u);
}

- (void)_penderForRequesterWithIdentifier:(uint64_t)a1 creatingIfNecessary:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1BEC04000, a2, OS_LOG_TYPE_ERROR, "(%{public}@) Pender request missing requesterID", (uint8_t *)&v3, 0xCu);
}

@end