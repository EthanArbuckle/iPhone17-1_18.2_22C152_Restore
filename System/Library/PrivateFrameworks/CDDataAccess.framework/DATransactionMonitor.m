@interface DATransactionMonitor
+ (id)sharedTransactionMonitor;
- (DATransactionMonitor)init;
- (DATransactionMonitorDelegate)transactionMonitorDelegate;
- (NSMutableArray)transactions;
- (int)transactionCount;
- (void)decrementTransactionCountForTransaction:(id)a3;
- (void)incrementTransactionCountForTransaction:(id)a3;
- (void)setTransactionCount:(int)a3;
- (void)setTransactionMonitorDelegate:(id)a3;
- (void)setTransactions:(id)a3;
@end

@implementation DATransactionMonitor

+ (id)sharedTransactionMonitor
{
  if (sharedTransactionMonitor_creationToken != -1) {
    dispatch_once(&sharedTransactionMonitor_creationToken, &__block_literal_global_0);
  }
  v2 = (void *)sharedTransactionMonitor_gDATransactionMonitor;
  return v2;
}

uint64_t __48__DATransactionMonitor_sharedTransactionMonitor__block_invoke()
{
  sharedTransactionMonitor_gDATransactionMonitor = objc_opt_new();
  return MEMORY[0x1F41817F8]();
}

- (DATransactionMonitor)init
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)DATransactionMonitor;
  v2 = [(DATransactionMonitor *)&v8 init];
  v3 = v2;
  if (v2)
  {
    v2->_int transactionCount = 0;
    v4 = DALoggingwithCategory();
    os_log_type_t v5 = *(unsigned char *)(MEMORY[0x1E4F50E48] + 6);
    if (os_log_type_enabled(v4, v5))
    {
      int transactionCount = v3->_transactionCount;
      *(_DWORD *)buf = 67109120;
      int v10 = transactionCount;
      _os_log_impl(&dword_1C86FF000, v4, v5, "Transaction count is initialized to %d", buf, 8u);
    }
  }
  return v3;
}

- (void)incrementTransactionCountForTransaction:(id)a3
{
  id v4 = a3;
  if (incrementTransactionCountForTransaction__onceToken != -1) {
    dispatch_once(&incrementTransactionCountForTransaction__onceToken, &__block_literal_global_2);
  }
  os_log_type_t v5 = transactionMonitorQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__DATransactionMonitor_incrementTransactionCountForTransaction___block_invoke_2;
  v7[3] = &unk_1E65710B0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

void __64__DATransactionMonitor_incrementTransactionCountForTransaction___block_invoke()
{
  v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.dataaccess.DATransactionMonitorQueue", v2);
  v1 = (void *)transactionMonitorQueue;
  transactionMonitorQueue = (uint64_t)v0;
}

void __64__DATransactionMonitor_incrementTransactionCountForTransaction___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  int v2 = [*(id *)(a1 + 32) transactionCount];
  uint64_t v3 = MEMORY[0x1E4F50E48];
  if (!v2)
  {
    MEMORY[0x1C87CCF70]();
    id v4 = DALoggingwithCategory();
    os_log_type_t v5 = *(unsigned char *)(v3 + 5);
    if (os_log_type_enabled(v4, v5))
    {
      LOWORD(v12[0]) = 0;
      _os_log_impl(&dword_1C86FF000, v4, v5, "DATransactionMonitor: xpc_transaction_begin INIT {name: com.apple.remindd.dataaccess.transactions}", (uint8_t *)v12, 2u);
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "setTransactionCount:", objc_msgSend(*(id *)(a1 + 32), "transactionCount") + 1);
  id v6 = [*(id *)(a1 + 32) transactions];

  if (!v6)
  {
    v7 = objc_opt_new();
    [*(id *)(a1 + 32) setTransactions:v7];
  }
  id v8 = [*(id *)(a1 + 32) transactions];
  [v8 addObject:*(void *)(a1 + 40)];

  v9 = DALoggingwithCategory();
  os_log_type_t v10 = *(unsigned char *)(v3 + 5);
  if (os_log_type_enabled(v9, v10))
  {
    int v11 = [*(id *)(a1 + 32) transactionCount];
    v12[0] = 67109120;
    v12[1] = v11;
    _os_log_impl(&dword_1C86FF000, v9, v10, "Transaction count is incremented to %d", (uint8_t *)v12, 8u);
  }
}

- (void)decrementTransactionCountForTransaction:(id)a3
{
  id v5 = a3;
  id v6 = transactionMonitorQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__DATransactionMonitor_decrementTransactionCountForTransaction___block_invoke;
  block[3] = &unk_1E65710D8;
  block[4] = self;
  id v9 = v5;
  SEL v10 = a2;
  id v7 = v5;
  dispatch_sync(v6, block);
}

void __64__DATransactionMonitor_decrementTransactionCountForTransaction___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  int v2 = [*(id *)(a1 + 32) transactionCount];
  uint64_t v3 = MEMORY[0x1E4F50E48];
  if (v2 == 1)
  {
    MEMORY[0x1C87CCF80]();
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
    [WeakRetained didFinishAllXPCTransactions];

    id v5 = DALoggingwithCategory();
    os_log_type_t v6 = *(unsigned char *)(v3 + 5);
    if (os_log_type_enabled(v5, v6))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C86FF000, v5, v6, "DATransactionMonitor: xpc_transaction_end RELEASE {name: com.apple.remindd.dataaccess.transactions}", buf, 2u);
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "setTransactionCount:", objc_msgSend(*(id *)(a1 + 32), "transactionCount") - 1);
  id v7 = [*(id *)(a1 + 32) transactions];
  [v7 removeObject:*(void *)(a1 + 40)];

  if (([*(id *)(a1 + 32) transactionCount] & 0x80000000) != 0)
  {
    uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:*(void *)(a1 + 48), *(void *)(a1 + 32), @"DATransactionMonitor.m", 111, @"Transaction count becomes negative, %d", objc_msgSend(*(id *)(a1 + 32), "transactionCount") object file lineNumber description];
  }
  id v8 = DALoggingwithCategory();
  os_log_type_t v9 = *(unsigned char *)(v3 + 5);
  if (os_log_type_enabled(v8, v9))
  {
    int v10 = [*(id *)(a1 + 32) transactionCount];
    *(_DWORD *)buf = 67109120;
    LODWORD(v15) = v10;
    _os_log_impl(&dword_1C86FF000, v8, v9, "Transaction count is decremented to %d", buf, 8u);
  }

  int v11 = DALoggingwithCategory();
  if (os_log_type_enabled(v11, v9))
  {
    v12 = [*(id *)(a1 + 32) transactions];
    *(_DWORD *)buf = 138412290;
    v15 = v12;
    _os_log_impl(&dword_1C86FF000, v11, v9, "Remaining transactions: %@", buf, 0xCu);
  }
}

- (int)transactionCount
{
  return self->_transactionCount;
}

- (void)setTransactionCount:(int)a3
{
  self->_int transactionCount = a3;
}

- (NSMutableArray)transactions
{
  return self->_transactions;
}

- (void)setTransactions:(id)a3
{
}

- (DATransactionMonitorDelegate)transactionMonitorDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_transactionMonitorDelegate);
  return (DATransactionMonitorDelegate *)WeakRetained;
}

- (void)setTransactionMonitorDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_transactionMonitorDelegate);
  objc_storeStrong((id *)&self->_transactions, 0);
}

@end