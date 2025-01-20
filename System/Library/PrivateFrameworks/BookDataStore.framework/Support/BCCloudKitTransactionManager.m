@interface BCCloudKitTransactionManager
- (BCCloudKitController)cloudKitController;
- (BCCloudKitTransactionManager)initWithCloudKitController:(id)a3;
- (NSMutableDictionary)transactionCompletionCallbacks;
- (NSMutableDictionary)transactions;
- (OS_dispatch_queue)transactionAccessQueue;
- (void)setCloudKitController:(id)a3;
- (void)setTransactionAccessQueue:(id)a3;
- (void)setTransactionCompletionCallbacks:(id)a3;
- (void)setTransactions:(id)a3;
- (void)signalDataChangeTransactionForEntityName:(id)a3 notificationName:(id)a4;
- (void)signalFetchChangesTransaction:(id)a3;
- (void)signalSyncToCKTransactionForEntityName:(id)a3 syncManager:(id)a4;
- (void)signalSyncToCKTransactionForEntityName:(id)a3 syncManager:(id)a4 completion:(id)a5;
- (void)transactionCompleted:(id)a3;
@end

@implementation BCCloudKitTransactionManager

- (BCCloudKitTransactionManager)initWithCloudKitController:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)BCCloudKitTransactionManager;
  v5 = [(BCCloudKitTransactionManager *)&v15 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_cloudKitController, v4);
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.iBooks.CloudKitTransactionManager", v7);
    transactionAccessQueue = v6->_transactionAccessQueue;
    v6->_transactionAccessQueue = (OS_dispatch_queue *)v8;

    uint64_t v10 = +[NSMutableDictionary dictionary];
    transactions = v6->_transactions;
    v6->_transactions = (NSMutableDictionary *)v10;

    uint64_t v12 = +[NSMutableDictionary dictionary];
    transactionCompletionCallbacks = v6->_transactionCompletionCallbacks;
    v6->_transactionCompletionCallbacks = (NSMutableDictionary *)v12;
  }
  return v6;
}

- (void)signalDataChangeTransactionForEntityName:(id)a3 notificationName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_queue_t v8 = [(BCCloudKitTransactionManager *)self transactionAccessQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003E8E4;
  block[3] = &unk_10025F770;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)signalSyncToCKTransactionForEntityName:(id)a3 syncManager:(id)a4
{
}

- (void)signalSyncToCKTransactionForEntityName:(id)a3 syncManager:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(BCCloudKitTransactionManager *)self transactionAccessQueue];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10003EADC;
  v15[3] = &unk_1002604D8;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

- (void)signalFetchChangesTransaction:(id)a3
{
  p_cloudKitController = &self->_cloudKitController;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_cloudKitController);
  id v7 = [WeakRetained privateCloudDatabaseController];
  id v8 = [v7 subscriptionID];
  unsigned int v9 = [v8 isEqualToString:v5];

  if (v9)
  {
    id v10 = [(BCCloudKitTransactionManager *)self transactionAccessQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10003ED98;
    block[3] = &unk_10025F700;
    block[4] = self;
    dispatch_async(v10, block);
  }
}

- (void)transactionCompleted:(id)a3
{
  id v4 = a3;
  id v5 = [(BCCloudKitTransactionManager *)self transactionAccessQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10003EF60;
  v7[3] = &unk_10025F988;
  id v8 = v4;
  unsigned int v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionCompletionCallbacks, 0);
  objc_storeStrong((id *)&self->_transactions, 0);
  objc_storeStrong((id *)&self->_transactionAccessQueue, 0);
  objc_destroyWeak((id *)&self->_cloudKitController);
}

@end