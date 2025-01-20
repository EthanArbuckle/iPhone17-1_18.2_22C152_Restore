@interface AMSDTransactionStore
+ (NSCountedSet)transactionsCount;
+ (NSMutableDictionary)transactions;
+ (OS_dispatch_queue)transactionsAccessQueue;
+ (void)flushAllKeepAliveTransactions;
+ (void)releaseKeepAliveTransaction:(id)a3;
+ (void)resetReleaseKeepAliveTransactionTimeDelayValue;
+ (void)takeKeepAliveTransaction:(id)a3;
+ (void)takeKeepAliveTransaction:(id)a3 whilePerformingBlock:(id)a4;
+ (void)takeKeepAliveTransaction:(id)a3 withQueue:(id)a4 postActionQueue:(id)a5 whilePerformingBlockOnQueue:(id)a6 postAction:(id)a7;
+ (void)takeKeepAliveTransaction:(id)a3 withQueue:(id)a4 whilePerformingBlock:(id)a5;
+ (void)takeKeepAliveTransaction:(id)a3 withQueue:(id)a4 whilePerformingSyncBlock:(id)a5;
@end

@implementation AMSDTransactionStore

+ (void)takeKeepAliveTransaction:(id)a3 withQueue:(id)a4 postActionQueue:(id)a5 whilePerformingBlockOnQueue:(id)a6 postAction:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v16 = a4;
  [a1 takeKeepAliveTransaction:v12];
  AMSLogKey();
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10000C4EC;
  v22[3] = &unk_1001145C8;
  id v23 = (id)objc_claimAutoreleasedReturnValue();
  id v24 = v13;
  id v27 = v15;
  id v28 = a1;
  id v25 = v12;
  id v26 = v14;
  id v17 = v12;
  id v18 = v15;
  id v19 = v13;
  id v20 = v14;
  id v21 = v23;
  dispatch_async(v16, v22);
}

+ (NSMutableDictionary)transactions
{
  v2 = [a1 transactionsAccessQueue];
  dispatch_assert_queue_V2(v2);

  if (qword_100130500 != -1) {
    dispatch_once(&qword_100130500, &stru_1001144A8);
  }
  v3 = (void *)qword_100130508;
  return (NSMutableDictionary *)v3;
}

+ (void)takeKeepAliveTransaction:(id)a3 withQueue:(id)a4 whilePerformingSyncBlock:(id)a5
{
  id v8 = a5;
  v9 = a4;
  id v10 = a3;
  [a1 takeKeepAliveTransaction:v10];
  AMSLogKey();
  id v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472;
  id v15 = sub_100014CA8;
  v16 = &unk_100112600;
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  id v18 = v8;
  id v11 = v8;
  id v12 = v17;
  dispatch_sync(v9, &v13);

  objc_msgSend(a1, "releaseKeepAliveTransaction:", v10, v13, v14, v15, v16);
}

+ (void)takeKeepAliveTransaction:(id)a3
{
  id v4 = a3;
  v5 = [a1 transactionsAccessQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000125E4;
  v7[3] = &unk_100112368;
  id v8 = v4;
  id v9 = a1;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

+ (void)releaseKeepAliveTransaction:(id)a3
{
  id v4 = a3;
  v5 = AMSLogKey();
  id v6 = [a1 transactionsAccessQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001252C;
  block[3] = &unk_100112368;
  id v19 = a1;
  id v7 = v4;
  id v18 = v7;
  dispatch_sync(v6, block);

  objc_initWeak(&location, a1);
  dispatch_time_t v8 = dispatch_time(0, (uint64_t)(*(double *)&qword_10012DE28 * 1000000000.0));
  id v9 = [a1 transactionsAccessQueue];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10005F5DC;
  v12[3] = &unk_100114550;
  objc_copyWeak(&v15, &location);
  id v13 = v5;
  id v14 = v7;
  id v10 = v7;
  id v11 = v5;
  dispatch_after(v8, v9, v12);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

+ (NSCountedSet)transactionsCount
{
  v2 = [a1 transactionsAccessQueue];
  dispatch_assert_queue_V2(v2);

  if (qword_100130520 != -1) {
    dispatch_once(&qword_100130520, &stru_1001144E8);
  }
  v3 = (void *)qword_100130528;
  return (NSCountedSet *)v3;
}

+ (OS_dispatch_queue)transactionsAccessQueue
{
  if (qword_100130510 != -1) {
    dispatch_once(&qword_100130510, &stru_1001144C8);
  }
  v2 = (void *)qword_100130518;
  return (OS_dispatch_queue *)v2;
}

+ (void)flushAllKeepAliveTransactions
{
  v3 = [a1 transactionsAccessQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005F2A0;
  block[3] = &unk_1001127A8;
  void block[4] = a1;
  dispatch_sync(v3, block);
}

+ (void)resetReleaseKeepAliveTransactionTimeDelayValue
{
  v2 = [a1 transactionsAccessQueue];
  dispatch_sync(v2, &stru_100114528);
}

+ (void)takeKeepAliveTransaction:(id)a3 whilePerformingBlock:(id)a4
{
  id v8 = a3;
  id v6 = (void (**)(void))a4;
  [a1 takeKeepAliveTransaction:v8];
  v6[2](v6);
  [a1 releaseKeepAliveTransaction:v8];
}

+ (void)takeKeepAliveTransaction:(id)a3 withQueue:(id)a4 whilePerformingBlock:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  [a1 takeKeepAliveTransaction:v8];
  id v11 = AMSLogKey();
  objc_initWeak(&location, a1);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005F920;
  block[3] = &unk_100114578;
  objc_copyWeak(&v19, &location);
  id v17 = v8;
  id v18 = v9;
  id v16 = v11;
  id v12 = v8;
  id v13 = v9;
  id v14 = v11;
  dispatch_async(v10, block);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

@end