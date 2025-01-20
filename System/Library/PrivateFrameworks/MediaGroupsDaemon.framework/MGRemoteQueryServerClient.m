@interface MGRemoteQueryServerClient
- (BOOL)_transactionExists:(id)a3;
- (BOOL)invalidated;
- (MGRemoteQueryServerClient)initWithPeer:(id)a3 delegate:(id)a4 dispatchQueue:(id)a5;
- (MGRemoteQueryServerClientDelegate)delegate;
- (NSArray)transactions;
- (NSString)description;
- (OS_dispatch_queue)dispatchQueue;
- (OS_dispatch_source)timeoutTimer;
- (OS_nw_endpoint)peer;
- (unint64_t)timeout;
- (unint64_t)transactionCount;
- (void)_delegateNotifyInvalidated;
- (void)_delegateNotifyLostTransaction;
- (void)_invalidate;
- (void)_timerCancel;
- (void)_timerFired;
- (void)_timerInit;
- (void)_timerReschedule;
- (void)_transactionAdd:(id)a3;
- (void)_transactionRemove:(id)a3;
- (void)_withTransactionsLock:(id)a3;
- (void)addNewConnection:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)setInvalidated:(BOOL)a3;
- (void)setTimeout:(unint64_t)a3;
- (void)setTransactions:(id)a3;
- (void)transaction:(id)a3 receivedTimeoutInterval:(unint64_t)a4;
- (void)transactionActivityOccurred:(id)a3;
- (void)transactionInvalidated:(id)a3;
@end

@implementation MGRemoteQueryServerClient

- (MGRemoteQueryServerClient)initWithPeer:(id)a3 delegate:(id)a4 dispatchQueue:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)MGRemoteQueryServerClient;
  v12 = [(MGRemoteQueryServerClient *)&v20 init];
  v13 = v12;
  if (v12)
  {
    v12->_transactionsLock._os_unfair_lock_opaque = 0;
    objc_storeWeak((id *)&v12->_delegate, v10);
    objc_storeStrong((id *)&v13->_dispatchQueue, a5);
    objc_storeStrong((id *)&v13->_peer, a3);
    v14 = (NSArray *)objc_alloc_init(MEMORY[0x263EFF8C0]);
    transactions = v13->_transactions;
    v13->_transactions = v14;

    v13->_invalidated = 0;
    v13->_timeout = 900;
    v16 = [(MGRemoteQueryServerClient *)v13 dispatchQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __65__MGRemoteQueryServerClient_initWithPeer_delegate_dispatchQueue___block_invoke;
    block[3] = &unk_26485E378;
    v19 = v13;
    dispatch_async(v16, block);
  }
  return v13;
}

uint64_t __65__MGRemoteQueryServerClient_initWithPeer_delegate_dispatchQueue___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _timerInit];
}

- (void)dealloc
{
  [(MGRemoteQueryServerClient *)self _invalidate];
  v3.receiver = self;
  v3.super_class = (Class)MGRemoteQueryServerClient;
  [(MGRemoteQueryServerClient *)&v3 dealloc];
}

- (NSString)description
{
  objc_super v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(MGRemoteQueryServerClient *)self peer];
  v7 = [v3 stringWithFormat:@"<%@: %p, _peer = %@, _transactions = %lu>", v5, self, v6, -[MGRemoteQueryServerClient transactionCount](self, "transactionCount")];

  return (NSString *)v7;
}

- (void)addNewConnection:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(MGRemoteQueryServerClient *)self dispatchQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__MGRemoteQueryServerClient_addNewConnection_completion___block_invoke;
  block[3] = &unk_26485E9A8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __57__MGRemoteQueryServerClient_addNewConnection_completion___block_invoke(uint64_t a1)
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  if ([*(id *)(a1 + 32) invalidated])
  {
    v7[3] = 3;
  }
  else
  {
    v2 = *(void **)(a1 + 32);
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __57__MGRemoteQueryServerClient_addNewConnection_completion___block_invoke_2;
    v3[3] = &unk_26485E490;
    v3[4] = v2;
    id v4 = *(id *)(a1 + 40);
    v5 = &v6;
    [v2 _withTransactionsLock:v3];
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  _Block_object_dispose(&v6, 8);
}

void __57__MGRemoteQueryServerClient_addNewConnection_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) transactions];
  unint64_t v3 = [v2 count];

  if (v3 > 0xE)
  {
    v5 = MGLogForCategory(5);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      uint64_t v7 = *(void *)(a1 + 40);
      int v8 = 134218242;
      uint64_t v9 = v6;
      __int16 v10 = 2112;
      uint64_t v11 = v7;
      _os_log_error_impl(&dword_229257000, v5, OS_LOG_TYPE_ERROR, "%p server client concurrency rejecting %@", (uint8_t *)&v8, 0x16u);
    }

    uint64_t v4 = 2;
  }
  else
  {
    [*(id *)(a1 + 32) _transactionAdd:*(void *)(a1 + 40)];
    uint64_t v4 = 1;
  }
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v4;
}

- (unint64_t)transactionCount
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __45__MGRemoteQueryServerClient_transactionCount__block_invoke;
  v4[3] = &unk_26485E5A8;
  v4[4] = self;
  v4[5] = &v5;
  [(MGRemoteQueryServerClient *)self _withTransactionsLock:v4];
  unint64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __45__MGRemoteQueryServerClient_transactionCount__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) transactions];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 count];
}

- (void)_invalidate
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (![(MGRemoteQueryServerClient *)self invalidated])
  {
    unint64_t v3 = MGLogForCategory(5);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v6 = self;
      _os_log_impl(&dword_229257000, v3, OS_LOG_TYPE_DEFAULT, "%p server client invalidating", buf, 0xCu);
    }

    [(MGRemoteQueryServerClient *)self setInvalidated:1];
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __40__MGRemoteQueryServerClient__invalidate__block_invoke;
    v4[3] = &unk_26485E378;
    v4[4] = self;
    [(MGRemoteQueryServerClient *)self _withTransactionsLock:v4];
    [(MGRemoteQueryServerClient *)self _timerCancel];
    [(MGRemoteQueryServerClient *)self _invalidated];
  }
}

void __40__MGRemoteQueryServerClient__invalidate__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [MEMORY[0x263EFF8C0] array];
  [v1 setTransactions:v2];
}

- (void)_transactionAdd:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v4 = a3;
  uint64_t v5 = [(MGRemoteQueryServerClient *)self dispatchQueue];
  dispatch_assert_queue_V2(v5);

  os_unfair_lock_assert_owner(&self->_transactionsLock);
  if ([(MGRemoteQueryServerClient *)self invalidated])
  {
    uint64_t v6 = MGLogForCategory(5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v16 = 134218242;
      v17 = self;
      __int16 v18 = 2112;
      uint64_t v19 = (uint64_t)v4;
      uint64_t v7 = "%p server client invalidated, not adding %@";
LABEL_12:
      _os_log_error_impl(&dword_229257000, v6, OS_LOG_TYPE_ERROR, v7, (uint8_t *)&v16, 0x16u);
      goto LABEL_6;
    }
    goto LABEL_6;
  }
  uint64_t v8 = [(MGRemoteQueryServerClient *)self transactions];
  unint64_t v9 = [v8 count];

  if (v9 >= 0xF)
  {
    uint64_t v6 = MGLogForCategory(5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v16 = 134218242;
      v17 = self;
      __int16 v18 = 2112;
      uint64_t v19 = (uint64_t)v4;
      uint64_t v7 = "%p server client exceeded limit, not adding %@";
      goto LABEL_12;
    }
LABEL_6:

    nw_connection_cancel(v4);
    goto LABEL_10;
  }
  __int16 v10 = [MGRemoteQueryServerTransaction alloc];
  uint64_t v11 = [(MGRemoteQueryServerClient *)self dispatchQueue];
  uint64_t v12 = [(MGRemoteQueryServerTransaction *)v10 initWithConnection:v4 delegate:self dispatchQueue:v11];

  id v13 = [(MGRemoteQueryServerClient *)self transactions];
  v14 = [v13 arrayByAddingObject:v12];

  [(MGRemoteQueryServerClient *)self setTransactions:v14];
  v15 = MGLogForCategory(5);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    int v16 = 134218754;
    v17 = self;
    __int16 v18 = 2048;
    uint64_t v19 = [v14 count];
    __int16 v20 = 2048;
    v21 = v12;
    __int16 v22 = 2112;
    v23 = v4;
    _os_log_debug_impl(&dword_229257000, v15, OS_LOG_TYPE_DEBUG, "%p server client now %lu transactions after adding %p with connection %@", (uint8_t *)&v16, 0x2Au);
  }

LABEL_10:
}

- (void)_transactionRemove:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(MGRemoteQueryServerClient *)self dispatchQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __48__MGRemoteQueryServerClient__transactionRemove___block_invoke;
  v9[3] = &unk_26485E490;
  v9[4] = self;
  id v6 = v4;
  id v10 = v6;
  uint64_t v11 = &v12;
  [(MGRemoteQueryServerClient *)self _withTransactionsLock:v9];
  uint64_t v7 = MGLogForCategory(5);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = v13[3];
    *(_DWORD *)buf = 134218496;
    v17 = self;
    __int16 v18 = 2048;
    uint64_t v19 = v8;
    __int16 v20 = 2048;
    id v21 = v6;
    _os_log_debug_impl(&dword_229257000, v7, OS_LOG_TYPE_DEBUG, "%p server client now %lu transactions after removing %p", buf, 0x20u);
  }

  [(MGRemoteQueryServerClient *)self _delegateNotifyLostTransaction];
  if (!v13[3]) {
    [(MGRemoteQueryServerClient *)self _invalidate];
  }

  _Block_object_dispose(&v12, 8);
}

void __48__MGRemoteQueryServerClient__transactionRemove___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) transactions];
  id v3 = (id)[v2 mutableCopy];

  [v3 removeObject:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setTransactions:v3];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v3 count];
}

- (BOOL)_transactionExists:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MGRemoteQueryServerClient *)self dispatchQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __48__MGRemoteQueryServerClient__transactionExists___block_invoke;
  v8[3] = &unk_26485E4E0;
  id v10 = &v11;
  v8[4] = self;
  id v6 = v4;
  id v9 = v6;
  [(MGRemoteQueryServerClient *)self _withTransactionsLock:v8];
  LOBYTE(self) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)self;
}

void __48__MGRemoteQueryServerClient__transactionExists___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) transactions];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v2 containsObject:*(void *)(a1 + 40)];
}

- (void)_timerInit
{
  id v3 = [(MGRemoteQueryServerClient *)self dispatchQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(MGRemoteQueryServerClient *)self dispatchQueue];
  dispatch_source_t v5 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, v4);

  objc_storeStrong((id *)&self->_timeoutTimer, v5);
  objc_initWeak(&location, self);
  uint64_t v6 = MEMORY[0x263EF8330];
  uint64_t v7 = 3221225472;
  uint64_t v8 = __39__MGRemoteQueryServerClient__timerInit__block_invoke;
  id v9 = &unk_26485E5D0;
  objc_copyWeak(&v10, &location);
  dispatch_source_set_event_handler(v5, &v6);
  [(MGRemoteQueryServerClient *)self _timerReschedule];
  dispatch_resume(v5);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __39__MGRemoteQueryServerClient__timerInit__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _timerFired];
    id WeakRetained = v2;
  }
}

- (void)_timerReschedule
{
  id v3 = [(MGRemoteQueryServerClient *)self dispatchQueue];
  dispatch_assert_queue_V2(v3);

  if (![(MGRemoteQueryServerClient *)self invalidated])
  {
    unint64_t v4 = [(MGRemoteQueryServerClient *)self timeout];
    source = [(MGRemoteQueryServerClient *)self timeoutTimer];
    dispatch_time_t v5 = dispatch_walltime(0, 1000000000 * v4 + 60000000000);
    dispatch_source_set_timer(source, v5, 0xFFFFFFFFFFFFFFFFLL, 0);
  }
}

- (void)_timerCancel
{
  id v2 = [(MGRemoteQueryServerClient *)self timeoutTimer];
  if (v2)
  {
    id v3 = v2;
    dispatch_source_cancel(v2);
    id v2 = v3;
  }
}

- (void)_timerFired
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = [(MGRemoteQueryServerClient *)self dispatchQueue];
  dispatch_assert_queue_V2(v3);

  if (![(MGRemoteQueryServerClient *)self invalidated])
  {
    unint64_t v4 = MGLogForCategory(5);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      dispatch_time_t v5 = [(MGRemoteQueryServerClient *)self peer];
      int v6 = 134218242;
      uint64_t v7 = self;
      __int16 v8 = 2112;
      id v9 = v5;
      _os_log_error_impl(&dword_229257000, v4, OS_LOG_TYPE_ERROR, "%p watchdog fired, terminating communication with peer %@", (uint8_t *)&v6, 0x16u);
    }
    [(MGRemoteQueryServerClient *)self _invalidate];
  }
}

- (void)_delegateNotifyLostTransaction
{
  id v3 = [(MGRemoteQueryServerClient *)self delegate];
  if (v3)
  {
    id v4 = v3;
    [v3 clientLostTransaction:self];
    id v3 = v4;
  }
}

- (void)_delegateNotifyInvalidated
{
  id v3 = [(MGRemoteQueryServerClient *)self delegate];
  if (v3)
  {
    id v4 = v3;
    [v3 clientInvalidated:self];
    id v3 = v4;
  }
}

- (void)_withTransactionsLock:(id)a3
{
  p_transactionsLock = &self->_transactionsLock;
  id v4 = (void (**)(void))a3;
  os_unfair_lock_lock(p_transactionsLock);
  v4[2](v4);

  os_unfair_lock_unlock(p_transactionsLock);
}

- (void)transaction:(id)a3 receivedTimeoutInterval:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [(MGRemoteQueryServerClient *)self dispatchQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__MGRemoteQueryServerClient_transaction_receivedTimeoutInterval___block_invoke;
  block[3] = &unk_26485E9D0;
  id v10 = v6;
  unint64_t v11 = a4;
  void block[4] = self;
  id v8 = v6;
  dispatch_async(v7, block);
}

uint64_t __65__MGRemoteQueryServerClient_transaction_receivedTimeoutInterval___block_invoke(uint64_t result)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (*(void *)(result + 48))
  {
    uint64_t v1 = result;
    result = [*(id *)(result + 32) timeout];
    if (result != *(void *)(v1 + 48))
    {
      result = [*(id *)(v1 + 32) _transactionExists:*(void *)(v1 + 40)];
      if (result)
      {
        id v2 = MGLogForCategory(5);
        if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
        {
          id v3 = *(void **)(v1 + 32);
          uint64_t v4 = *(void *)(v1 + 48);
          uint64_t v5 = [v3 timeout];
          uint64_t v6 = *(void *)(v1 + 40);
          uint64_t v7 = [*(id *)(v1 + 32) peer];
          int v8 = 134219010;
          id v9 = v3;
          __int16 v10 = 2048;
          uint64_t v11 = v4;
          __int16 v12 = 2048;
          uint64_t v13 = v5;
          __int16 v14 = 2048;
          uint64_t v15 = v6;
          __int16 v16 = 2112;
          v17 = v7;
          _os_log_debug_impl(&dword_229257000, v2, OS_LOG_TYPE_DEBUG, "%p updating timeout interval to %lu from %lu via %p for %@", (uint8_t *)&v8, 0x34u);
        }
        [*(id *)(v1 + 32) setTimeout:*(void *)(v1 + 48)];
        return [*(id *)(v1 + 32) _timerReschedule];
      }
    }
  }
  return result;
}

- (void)transactionActivityOccurred:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MGRemoteQueryServerClient *)self dispatchQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __57__MGRemoteQueryServerClient_transactionActivityOccurred___block_invoke;
  v7[3] = &unk_26485E468;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __57__MGRemoteQueryServerClient_transactionActivityOccurred___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _transactionExists:*(void *)(a1 + 40)];
  if (result)
  {
    id v3 = *(void **)(a1 + 32);
    return [v3 _timerReschedule];
  }
  return result;
}

- (void)transactionInvalidated:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MGRemoteQueryServerClient *)self dispatchQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __52__MGRemoteQueryServerClient_transactionInvalidated___block_invoke;
  v7[3] = &unk_26485E468;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __52__MGRemoteQueryServerClient_transactionInvalidated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _transactionRemove:*(void *)(a1 + 40)];
}

- (NSArray)transactions
{
  os_unfair_lock_assert_owner(&self->_transactionsLock);
  transactions = self->_transactions;
  return transactions;
}

- (void)setTransactions:(id)a3
{
  uint64_t v7 = (NSArray *)a3;
  os_unfair_lock_assert_owner(&self->_transactionsLock);
  transactions = self->_transactions;
  p_transactions = &self->_transactions;
  if (transactions != v7 && (-[NSArray isEqual:](v7, "isEqual:") & 1) == 0) {
    objc_storeStrong((id *)p_transactions, a3);
  }
  MEMORY[0x270F9A758]();
}

- (MGRemoteQueryServerClientDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MGRemoteQueryServerClientDelegate *)WeakRetained;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (OS_nw_endpoint)peer
{
  return self->_peer;
}

- (BOOL)invalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (unint64_t)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(unint64_t)a3
{
  self->_timeout = a3;
}

- (OS_dispatch_source)timeoutTimer
{
  return self->_timeoutTimer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_storeStrong((id *)&self->_peer, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_transactions, 0);
}

@end