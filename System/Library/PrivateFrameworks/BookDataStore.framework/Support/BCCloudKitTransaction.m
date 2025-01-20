@interface BCCloudKitTransaction
+ (id)transactionNameForEntityName:(id)a3;
- (BCCloudKitTransaction)initWithEntityName:(id)a3 delegate:(id)a4;
- (BCCloudKitTransactionDelegate)delegate;
- (BDSOSTransaction)osTransaction;
- (BUCoalescingCallBlock)coalescedNotification;
- (NSString)entityName;
- (OS_dispatch_queue)lifecycleAccessQueue;
- (OS_dispatch_source)transactionLifetime;
- (double)coalescingDelay;
- (double)transactionLifetimeTimout;
- (id)transactionName;
- (int64_t)clientCount;
- (void)clientConnected;
- (void)laq_scheduleTransactionLifetime;
- (void)performWorkWithCompletion:(id)a3;
- (void)setClientCount:(int64_t)a3;
- (void)setCoalescedNotification:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEntityName:(id)a3;
- (void)setLifecycleAccessQueue:(id)a3;
- (void)setOsTransaction:(id)a3;
- (void)setTransactionLifetime:(id)a3;
- (void)signal;
@end

@implementation BCCloudKitTransaction

- (BCCloudKitTransaction)initWithEntityName:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v32.receiver = self;
  v32.super_class = (Class)BCCloudKitTransaction;
  v8 = [(BCCloudKitTransaction *)&v32 init];
  if (v8)
  {
    v9 = (NSString *)[v6 copy];
    entityName = v8->_entityName;
    v8->_entityName = v9;

    objc_storeWeak((id *)&v8->_delegate, v7);
    v11 = [BDSOSTransaction alloc];
    id v12 = [(BCCloudKitTransaction *)v8 transactionName];
    v13 = -[BDSOSTransaction initWithTransactionName:](v11, "initWithTransactionName:", [v12 cStringUsingEncoding:4]);
    osTransaction = v8->_osTransaction;
    v8->_osTransaction = v13;

    v15 = [(BCCloudKitTransaction *)v8 transactionName];
    v16 = [@"com.apple.iBooks.CloudKitTransaction." stringByAppendingString:v15];

    id v17 = v16;
    v18 = (const char *)[v17 cStringUsingEncoding:4];
    v19 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v20 = dispatch_queue_create(v18, v19);
    lifecycleAccessQueue = v8->_lifecycleAccessQueue;
    v8->_lifecycleAccessQueue = (OS_dispatch_queue *)v20;

    objc_initWeak(&location, v8);
    id v22 = objc_alloc((Class)BUCoalescingCallBlock);
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_100037E28;
    v29[3] = &unk_10025FC90;
    objc_copyWeak(&v30, &location);
    v23 = (objc_class *)objc_opt_class();
    v24 = NSStringFromClass(v23);
    v25 = +[NSString stringWithFormat:@"_coalescedNotification in %@", v24];
    v26 = (BUCoalescingCallBlock *)[v22 initWithNotifyBlock:v29 notifyTimeout:10 blockDescription:v25 notifyTimeoutBlock:&stru_100260E28];
    coalescedNotification = v8->_coalescedNotification;
    v8->_coalescedNotification = v26;

    [(BCCloudKitTransaction *)v8 coalescingDelay];
    -[BUCoalescingCallBlock setCoalescingDelay:](v8->_coalescedNotification, "setCoalescingDelay:");
    objc_destroyWeak(&v30);
    objc_destroyWeak(&location);
  }
  return v8;
}

+ (id)transactionNameForEntityName:(id)a3
{
  return [@"BCCloudKitTransaction-" stringByAppendingString:a3];
}

- (id)transactionName
{
  v3 = objc_opt_class();
  v4 = [(BCCloudKitTransaction *)self entityName];
  v5 = [v3 transactionNameForEntityName:v4];

  return v5;
}

- (void)performWorkWithCompletion:(id)a3
{
  v3 = (void (**)(void))objc_retainBlock(a3);
  if (v3)
  {
    v4 = v3;
    v3[2]();
    v3 = v4;
  }
}

- (double)coalescingDelay
{
  return 1.0;
}

- (double)transactionLifetimeTimout
{
  return 5.0;
}

- (void)clientConnected
{
  v3 = [(BCCloudKitTransaction *)self lifecycleAccessQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000380B4;
  block[3] = &unk_10025F700;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)signal
{
  v3 = +[BULogUtilities shared];
  unsigned int v4 = [v3 verboseLoggingEnabled];

  if (v4)
  {
    v5 = sub_10000CD80();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [(BCCloudKitTransaction *)self transactionName];
      *(_DWORD *)buf = 138412290;
      v11 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "\"\\\"Transaction signaling for %@\\\"\"", buf, 0xCu);
    }
  }
  objc_initWeak((id *)buf, self);
  id v7 = [(BCCloudKitTransaction *)self coalescedNotification];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000382E8;
  v8[3] = &unk_100260E50;
  v8[4] = self;
  objc_copyWeak(&v9, (id *)buf);
  [v7 signalWithCompletion:v8];

  objc_destroyWeak(&v9);
  objc_destroyWeak((id *)buf);
}

- (void)laq_scheduleTransactionLifetime
{
  v3 = [(BCCloudKitTransaction *)self transactionLifetime];

  if (!v3)
  {
    unsigned int v4 = +[BULogUtilities shared];
    unsigned int v5 = [v4 verboseLoggingEnabled];

    if (v5)
    {
      id v6 = sub_10000CD80();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        id v7 = [(BCCloudKitTransaction *)self transactionName];
        *(_DWORD *)buf = 138412290;
        v15 = v7;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "\"\\\"Transaction scheduletransactionLifetime for %@\\\"\"", buf, 0xCu);
      }
    }
    v8 = [(BCCloudKitTransaction *)self lifecycleAccessQueue];
    id v9 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v8);

    dispatch_time_t v10 = dispatch_time(0, 5000000000);
    dispatch_source_set_timer(v9, v10, 0xFFFFFFFFFFFFFFFFLL, 0xBEBC200uLL);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100038764;
    handler[3] = &unk_10025F700;
    handler[4] = self;
    dispatch_source_set_event_handler(v9, handler);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10003887C;
    v12[3] = &unk_10025F700;
    v12[4] = self;
    dispatch_source_set_cancel_handler(v9, v12);
    [(BCCloudKitTransaction *)self setTransactionLifetime:v9];
    v11 = [(BCCloudKitTransaction *)self transactionLifetime];
    dispatch_resume(v11);
  }
}

- (NSString)entityName
{
  return self->_entityName;
}

- (void)setEntityName:(id)a3
{
}

- (BUCoalescingCallBlock)coalescedNotification
{
  return self->_coalescedNotification;
}

- (void)setCoalescedNotification:(id)a3
{
}

- (BDSOSTransaction)osTransaction
{
  return self->_osTransaction;
}

- (void)setOsTransaction:(id)a3
{
}

- (OS_dispatch_queue)lifecycleAccessQueue
{
  return self->_lifecycleAccessQueue;
}

- (void)setLifecycleAccessQueue:(id)a3
{
}

- (OS_dispatch_source)transactionLifetime
{
  return self->_transactionLifetime;
}

- (void)setTransactionLifetime:(id)a3
{
}

- (BCCloudKitTransactionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (BCCloudKitTransactionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)clientCount
{
  return self->_clientCount;
}

- (void)setClientCount:(int64_t)a3
{
  self->_clientCount = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_transactionLifetime, 0);
  objc_storeStrong((id *)&self->_lifecycleAccessQueue, 0);
  objc_storeStrong((id *)&self->_osTransaction, 0);
  objc_storeStrong((id *)&self->_coalescedNotification, 0);
  objc_storeStrong((id *)&self->_entityName, 0);
}

@end