@interface HDSharedSummaryTransactionQueryServer
+ (Class)queryClass;
- (HDSharedSummaryTransactionQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6;
- (void)_queue_deliverAllTransactions;
- (void)_queue_didDeactivate;
- (void)_queue_start;
- (void)sharedSummaryManagerCommittedTransactionsDidChange:(id)a3;
@end

@implementation HDSharedSummaryTransactionQueryServer

+ (Class)queryClass
{
  return (Class)objc_opt_class();
}

- (HDSharedSummaryTransactionQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  id v10 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HDSharedSummaryTransactionQueryServer;
  v11 = [(HDQueryServer *)&v13 initWithUUID:a3 configuration:v10 client:a5 delegate:a6];
  if (v11) {
    v11->_committedTransactions = [v10 committedTransactions];
  }

  return v11;
}

- (void)_queue_start
{
  v5.receiver = self;
  v5.super_class = (Class)HDSharedSummaryTransactionQueryServer;
  [(HDQueryServer *)&v5 _queue_start];
  v3 = [(HDQueryServer *)self profile];
  v4 = [v3 sharedSummaryManager];
  [v4 registerObserver:self];

  -[HDSharedSummaryTransactionQueryServer _queue_deliverAllTransactions]((unsigned __int8 *)self);
}

- (void)_queue_deliverAllTransactions
{
  if (a1)
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    int v3 = a1[200];
    v4 = [a1 profile];
    objc_super v5 = [v4 sharedSummaryManager];
    if (v3)
    {
      id v19 = 0;
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __70__HDSharedSummaryTransactionQueryServer__queue_deliverAllTransactions__block_invoke;
      v17[3] = &unk_1E62F81B8;
      id v18 = v2;
      char v6 = [v5 enumerateCommittedTransactionsWithError:&v19 handler:v17];
      id v7 = v19;

      if (v6)
      {
LABEL_4:
        v8 = objc_msgSend(a1, "clientProxy", v11, v12, v13, v14);
        v9 = [a1 queryUUID];
        objc_msgSend(v8, "client_deliverTransactions:query:", v2, v9);
LABEL_7:

        objc_msgSend(a1, "setDataCount:", objc_msgSend(v2, "count"));
        return;
      }
    }
    else
    {
      id v16 = 0;
      uint64_t v11 = MEMORY[0x1E4F143A8];
      uint64_t v12 = 3221225472;
      objc_super v13 = __70__HDSharedSummaryTransactionQueryServer__queue_deliverAllTransactions__block_invoke_2;
      v14 = &unk_1E62F81B8;
      id v15 = v2;
      int v10 = [v5 enumerateNonCommittedTransactionsWithError:&v16 handler:&v11];
      id v7 = v16;

      if (v10) {
        goto LABEL_4;
      }
    }
    v8 = objc_msgSend(a1, "clientProxy", v11, v12, v13, v14);
    v9 = [a1 queryUUID];
    objc_msgSend(v8, "client_deliverError:forQuery:", v7, v9);
    goto LABEL_7;
  }
}

- (void)_queue_didDeactivate
{
  id v4 = [(HDQueryServer *)self profile];
  int v3 = [v4 sharedSummaryManager];
  [v3 unregisterObserver:self];
}

- (void)sharedSummaryManagerCommittedTransactionsDidChange:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __92__HDSharedSummaryTransactionQueryServer_sharedSummaryManagerCommittedTransactionsDidChange___block_invoke;
  v5[3] = &unk_1E62F6BD0;
  objc_copyWeak(&v6, &location);
  [(HDQueryServer *)self scheduleDatabaseAccessOnQueueWithBlock:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __92__HDSharedSummaryTransactionQueryServer_sharedSummaryManagerCommittedTransactionsDidChange___block_invoke(uint64_t a1)
{
  WeakRetained = (unsigned __int8 *)objc_loadWeakRetained((id *)(a1 + 32));
  -[HDSharedSummaryTransactionQueryServer _queue_deliverAllTransactions](WeakRetained);
}

uint64_t __70__HDSharedSummaryTransactionQueryServer__queue_deliverAllTransactions__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

uint64_t __70__HDSharedSummaryTransactionQueryServer__queue_deliverAllTransactions__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

@end