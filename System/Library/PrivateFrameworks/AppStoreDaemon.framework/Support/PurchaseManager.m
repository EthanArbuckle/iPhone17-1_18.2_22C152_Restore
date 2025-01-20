@interface PurchaseManager
- (PurchaseManager)init;
- (void)checkStoreQueue:(int64_t)a3;
- (void)processPurchases:(id)a3 failBatchOnError:(BOOL)a4 requestToken:(id)a5 withReplyHandler:(id)a6;
- (void)pushService:(id)a3 didReceiveMessage:(id)a4 completionHandler:(id)a5;
- (void)pushService:(id)a3 recoverFromDroppedMessagesOfActionType:(unint64_t)a4 completionHandler:(id)a5;
@end

@implementation PurchaseManager

- (PurchaseManager)init
{
  v15.receiver = self;
  v15.super_class = (Class)PurchaseManager;
  v2 = [(PurchaseManager *)&v15 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.appstored.PurchaseManager.dispatch", v3);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v4;

    v6 = objc_alloc_init(TaskQueue);
    taskQueue = v2->_taskQueue;
    v2->_taskQueue = v6;

    v8 = v2->_taskQueue;
    if (v8) {
      [(NSOperationQueue *)v8->_operationQueue setName:@"com.apple.appstored.PurchaseManager.taskQueue"];
    }
    uint64_t v9 = +[NSHashTable weakObjectsHashTable];
    activeBatches = v2->_activeBatches;
    v2->_activeBatches = (NSHashTable *)v9;

    v11 = sub_1003DA6D4();
    unsigned __int8 v12 = [v11 isHRNMode];

    if ((v12 & 1) == 0)
    {
      v13 = sub_10035E2CC();
      sub_10035E550((uint64_t)v13, v2, 2);
      sub_10035E550((uint64_t)v13, v2, 11);
    }
  }
  return v2;
}

- (void)checkStoreQueue:(int64_t)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100213688;
  v4[3] = &unk_100521B80;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

- (void)processPurchases:(id)a3 failBatchOnError:(BOOL)a4 requestToken:(id)a5 withReplyHandler:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  dispatchQueue = self->_dispatchQueue;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100214138;
  v16[3] = &unk_100522420;
  id v17 = v9;
  v18 = self;
  id v19 = v10;
  id v20 = v11;
  id v13 = v11;
  id v14 = v10;
  id v15 = v9;
  dispatch_async(dispatchQueue, v16);
}

- (void)pushService:(id)a3 didReceiveMessage:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  v7 = sub_100316998((void **)a4);
  sub_1002148C4((uint64_t)self, (uint64_t)v7, v8);
}

- (void)pushService:(id)a3 recoverFromDroppedMessagesOfActionType:(unint64_t)a4 completionHandler:(id)a5
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_purchaseQueue, 0);
  objc_storeStrong((id *)&self->_taskQueue, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_activeBatches, 0);
}

@end