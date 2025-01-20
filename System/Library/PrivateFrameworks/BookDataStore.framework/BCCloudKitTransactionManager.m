@interface BCCloudKitTransactionManager
- (BCCloudKitController)cloudKitController;
- (BCCloudKitTransactionManager)initWithCloudKitController:(id)a3;
- (BDSServiceProxy)serviceProxy;
- (NSMutableDictionary)transactionCompletionCallbacks;
- (NSMutableDictionary)transactions;
- (OS_dispatch_queue)transactionAccessQueue;
- (void)setCloudKitController:(id)a3;
- (void)setServiceProxy:(id)a3;
- (void)setTransactionAccessQueue:(id)a3;
- (void)setTransactionCompletionCallbacks:(id)a3;
- (void)setTransactions:(id)a3;
- (void)signalDataChangeTransactionForEntityName:(id)a3 notificationName:(id)a4;
- (void)signalFetchChangesTransaction:(id)a3;
- (void)signalFetchChangesTransactionInService:(id)a3;
- (void)signalSyncToCKTransactionForEntityName:(id)a3 syncManager:(id)a4;
- (void)signalSyncToCKTransactionForEntityName:(id)a3 syncManager:(id)a4 completion:(id)a5;
- (void)transactionCompleted:(id)a3;
@end

@implementation BCCloudKitTransactionManager

- (BCCloudKitTransactionManager)initWithCloudKitController:(id)a3
{
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)BCCloudKitTransactionManager;
  v5 = [(BCCloudKitTransactionManager *)&v30 init];
  if (v5)
  {
    v6 = objc_alloc_init(BDSServiceProxy);
    serviceProxy = v5->_serviceProxy;
    v5->_serviceProxy = v6;

    objc_storeWeak((id *)&v5->_cloudKitController, v4);
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.iBooks.CloudKitTransactionManager", v8);
    transactionAccessQueue = v5->_transactionAccessQueue;
    v5->_transactionAccessQueue = (OS_dispatch_queue *)v9;

    uint64_t v18 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], v11, v12, v13, v14, v15, v16, v17);
    transactions = v5->_transactions;
    v5->_transactions = (NSMutableDictionary *)v18;

    uint64_t v27 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], v20, v21, v22, v23, v24, v25, v26);
    transactionCompletionCallbacks = v5->_transactionCompletionCallbacks;
    v5->_transactionCompletionCallbacks = (NSMutableDictionary *)v27;
  }
  return v5;
}

- (void)signalDataChangeTransactionForEntityName:(id)a3 notificationName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v15 = objc_msgSend_transactionAccessQueue(self, v8, v9, v10, v11, v12, v13, v14);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_2360E0C9C;
  block[3] = &unk_264CA1400;
  block[4] = self;
  id v19 = v6;
  id v20 = v7;
  id v16 = v7;
  id v17 = v6;
  dispatch_async(v15, block);
}

- (void)signalSyncToCKTransactionForEntityName:(id)a3 syncManager:(id)a4
{
}

- (void)signalSyncToCKTransactionForEntityName:(id)a3 syncManager:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v18 = objc_msgSend_transactionAccessQueue(self, v11, v12, v13, v14, v15, v16, v17);
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = sub_2360E0E94;
  v22[3] = &unk_264CA1100;
  v22[4] = self;
  id v23 = v8;
  id v24 = v9;
  id v25 = v10;
  id v19 = v10;
  id v20 = v9;
  id v21 = v8;
  dispatch_async(v18, v22);
}

- (void)signalFetchChangesTransaction:(id)a3
{
  p_cloudKitController = &self->_cloudKitController;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_cloudKitController);
  uint64_t v14 = objc_msgSend_privateCloudDatabaseController(WeakRetained, v7, v8, v9, v10, v11, v12, v13);
  uint64_t v22 = objc_msgSend_subscriptionID(v14, v15, v16, v17, v18, v19, v20, v21);
  int isEqualToString = objc_msgSend_isEqualToString_(v22, v23, (uint64_t)v5, v24, v25, v26, v27, v28);

  if (isEqualToString)
  {
    v37 = objc_msgSend_transactionAccessQueue(self, v30, v31, v32, v33, v34, v35, v36);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_2360E1150;
    block[3] = &unk_264CA1428;
    block[4] = self;
    dispatch_async(v37, block);
  }
}

- (void)signalFetchChangesTransactionInService:(id)a3
{
  id v4 = a3;
  objc_msgSend_serviceProxy(self, v5, v6, v7, v8, v9, v10, v11);
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_signalFetchChangesTransaction_(v18, v12, (uint64_t)v4, v13, v14, v15, v16, v17);
}

- (void)transactionCompleted:(id)a3
{
  id v4 = a3;
  uint64_t v12 = objc_msgSend_transactionAccessQueue(self, v5, v6, v7, v8, v9, v10, v11);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = sub_2360E1378;
  v14[3] = &unk_264CA1450;
  id v15 = v4;
  uint64_t v16 = self;
  id v13 = v4;
  dispatch_async(v12, v14);
}

- (BCCloudKitController)cloudKitController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cloudKitController);
  return (BCCloudKitController *)WeakRetained;
}

- (void)setCloudKitController:(id)a3
{
}

- (OS_dispatch_queue)transactionAccessQueue
{
  return self->_transactionAccessQueue;
}

- (void)setTransactionAccessQueue:(id)a3
{
}

- (NSMutableDictionary)transactions
{
  return self->_transactions;
}

- (void)setTransactions:(id)a3
{
}

- (NSMutableDictionary)transactionCompletionCallbacks
{
  return self->_transactionCompletionCallbacks;
}

- (void)setTransactionCompletionCallbacks:(id)a3
{
}

- (BDSServiceProxy)serviceProxy
{
  return self->_serviceProxy;
}

- (void)setServiceProxy:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceProxy, 0);
  objc_storeStrong((id *)&self->_transactionCompletionCallbacks, 0);
  objc_storeStrong((id *)&self->_transactions, 0);
  objc_storeStrong((id *)&self->_transactionAccessQueue, 0);
  objc_destroyWeak((id *)&self->_cloudKitController);
}

@end