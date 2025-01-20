@interface SBEscrowOperationLogger
- (SBEscrowOperationLogger)init;
- (SBEscrowOperationLogger)initWithStorageProvider:(id)a3;
- (SecureBackupLog)currentLog;
- (id)addObserver:(id)a3;
- (id)addObserverBlock:(id)a3;
- (id)addOneShotObserverBlock:(id)a3;
- (void)removeObserver:(id)a3;
- (void)updateExistingOperations;
- (void)updateExistingOperationsWithContext:(id)a3;
- (void)updateStoreWithEvent:(id)a3;
- (void)updateStoreWithEvent:(id)a3 context:(id)a4;
@end

@implementation SBEscrowOperationLogger

- (SBEscrowOperationLogger)init
{
  v3 = objc_alloc_init(ESADefaultStorageProvider);
  v4 = [(SBEscrowOperationLogger *)self initWithStorageProvider:v3];

  return v4;
}

- (SBEscrowOperationLogger)initWithStorageProvider:(id)a3
{
  id v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)SBEscrowOperationLogger;
  v6 = [(SBEscrowOperationLogger *)&v18 init];
  if (v6)
  {
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.sbd.transactionStore.updates", v7);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v8;

    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.sbd.transactionStore.callbacks", v10);
    callbackQueue = v6->_callbackQueue;
    v6->_callbackQueue = (OS_dispatch_queue *)v11;

    v6->_hasIncompleteActivities = 1;
    currentLog = v6->_currentLog;
    v6->_currentLog = 0;

    objc_storeStrong((id *)&v6->_storageProvider, a3);
    v14 = (NSMutableOrderedSet *)objc_alloc_init((Class)NSMutableOrderedSet);
    observers = v6->_observers;
    v6->_observers = v14;

    v16 = v6;
  }

  return v6;
}

- (id)addObserverBlock:(id)a3
{
  id v4 = a3;
  id v5 = [[ESACallbackContainer alloc] initWithCallback:v4];

  v6 = [(SBEscrowOperationLogger *)self addObserver:v5];

  return v6;
}

- (id)addOneShotObserverBlock:(id)a3
{
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  char v11 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100005CE4;
  v7[3] = &unk_100070F30;
  v9 = v10;
  id v4 = a3;
  id v8 = v4;
  id v5 = [(SBEscrowOperationLogger *)self addObserverBlock:v7];

  _Block_object_dispose(v10, 8);

  return v5;
}

- (id)addObserver:(id)a3
{
  id v4 = a3;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005DF8;
  block[3] = &unk_100070F58;
  objc_copyWeak(&v10, &location);
  id v6 = v4;
  id v9 = v6;
  dispatch_async(queue, block);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

  return v6;
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005F24;
  block[3] = &unk_100070F58;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)updateStoreWithEvent:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = sub_1000060DC;
  v18[4] = sub_1000060EC;
  id v19 = (id)0xAAAAAAAAAAAAAAAALL;
  id v19 = (id)os_transaction_create();
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000060F4;
  v11[3] = &unk_100070FD0;
  objc_copyWeak(&v16, &location);
  id v12 = v6;
  v13 = self;
  id v14 = v7;
  v15 = v18;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, v11);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
  _Block_object_dispose(v18, 8);
}

- (void)updateStoreWithEvent:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(ESADefaultOperationLoggingContext);
  [(SBEscrowOperationLogger *)self updateStoreWithEvent:v4 context:v5];
}

- (void)updateExistingOperationsWithContext:(id)a3
{
}

- (void)updateExistingOperations
{
  v3 = objc_alloc_init(ESADefaultOperationLoggingContext);
  [(SBEscrowOperationLogger *)self updateExistingOperationsWithContext:v3];
}

- (SecureBackupLog)currentLog
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = sub_1000060DC;
  id v10 = sub_1000060EC;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000065C4;
  v5[3] = &unk_100070FF8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (SecureBackupLog *)v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_storageProvider, 0);
  objc_storeStrong((id *)&self->_currentLog, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end