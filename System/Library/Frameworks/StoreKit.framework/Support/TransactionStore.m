@interface TransactionStore
+ (id)globalStore;
+ (void)holdKeepAliveTransaction:(id)a3 whilePerformingBlock:(id)a4;
+ (void)releaseKeepAliveTransaction:(id)a3;
+ (void)takeKeepAliveTransaction:(id)a3;
- (NSCountedSet)activeTransactions;
- (TransactionStore)init;
- (TransactionStore)initWithHoldTime:(double)a3;
- (unint64_t)transactionCount;
- (void)dealloc;
- (void)holdKeepAliveTransaction:(id)a3 whilePerformingBlock:(id)a4;
- (void)releaseKeepAliveTransaction:(id)a3;
- (void)takeKeepAliveTransaction:(id)a3;
@end

@implementation TransactionStore

+ (void)takeKeepAliveTransaction:(id)a3
{
  id v4 = a3;
  id v5 = [a1 globalStore];
  [v5 takeKeepAliveTransaction:v4];
}

+ (void)releaseKeepAliveTransaction:(id)a3
{
  id v4 = a3;
  id v5 = [a1 globalStore];
  [v5 releaseKeepAliveTransaction:v4];
}

- (void)takeKeepAliveTransaction:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100014B8C;
  v7[3] = &unk_1003580D0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(dispatchQueue, v7);
}

- (void)releaseKeepAliveTransaction:(id)a3
{
  id v4 = a3;
  dispatch_time_t v5 = dispatch_time(0, self->_holdTime);
  dispatchQueue = self->_dispatchQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000776A0;
  v8[3] = &unk_1003580D0;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_after(v5, dispatchQueue, v8);
}

+ (id)globalStore
{
  if (qword_1003A0058 != -1) {
    dispatch_once(&qword_1003A0058, &stru_100359B00);
  }
  v2 = (void *)qword_1003A0050;

  return v2;
}

- (TransactionStore)init
{
  return [(TransactionStore *)self initWithHoldTime:5.0];
}

- (TransactionStore)initWithHoldTime:(double)a3
{
  v14.receiver = self;
  v14.super_class = (Class)TransactionStore;
  id v4 = [(TransactionStore *)&v14 init];
  if (v4)
  {
    dispatch_time_t v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.AppStoreFoundation.TransactionStore", v5);
    dispatchQueue = v4->_dispatchQueue;
    v4->_dispatchQueue = (OS_dispatch_queue *)v6;

    v4->_holdTime = (uint64_t)(a3 * 1000000000.0);
    id v8 = (NSCountedSet *)objc_alloc_init((Class)NSCountedSet);
    transactionCount = v4->_transactionCount;
    v4->_transactionCount = v8;

    v10 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    transactionStore = v4->_transactionStore;
    v4->_transactionStore = v10;

    v13 = v4;
    v13->_handle = os_state_add_handler();
  }
  return v4;
}

- (void)dealloc
{
  os_state_remove_handler();
  v3.receiver = self;
  v3.super_class = (Class)TransactionStore;
  [(TransactionStore *)&v3 dealloc];
}

- (NSCountedSet)activeTransactions
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = sub_100077448;
  v10 = sub_100077458;
  id v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100077460;
  v5[3] = &unk_1003571D0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSCountedSet *)v3;
}

- (unint64_t)transactionCount
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100077558;
  v5[3] = &unk_1003571D0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

+ (void)holdKeepAliveTransaction:(id)a3 whilePerformingBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [a1 globalStore];
  [v8 holdKeepAliveTransaction:v7 whilePerformingBlock:v6];
}

- (void)holdKeepAliveTransaction:(id)a3 whilePerformingBlock:(id)a4
{
  id v8 = a3;
  id v6 = (void (**)(void))a4;
  [(TransactionStore *)self takeKeepAliveTransaction:v8];
  v6[2](v6);
  [(TransactionStore *)self releaseKeepAliveTransaction:v8];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionStore, 0);
  objc_storeStrong((id *)&self->_transactionCount, 0);

  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end