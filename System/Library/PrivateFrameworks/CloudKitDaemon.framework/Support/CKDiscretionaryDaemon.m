@interface CKDiscretionaryDaemon
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (CKDiscretionaryDaemon)initWithInSyncBubble:(BOOL)a3;
- (CKDiscretionaryDaemon)initWithSchedulerClass:(Class)a3;
- (Class)schedulerClass;
- (OS_dispatch_queue)serialQueue;
- (void)setSchedulerClass:(Class)a3;
- (void)setSerialQueue:(id)a3;
@end

@implementation CKDiscretionaryDaemon

- (CKDiscretionaryDaemon)initWithInSyncBubble:(BOOL)a3
{
  uint64_t v5 = objc_opt_class();
  if (!a3) {
    uint64_t v5 = objc_opt_class();
  }
  return [(CKDiscretionaryDaemon *)self initWithSchedulerClass:v5];
}

- (CKDiscretionaryDaemon)initWithSchedulerClass:(Class)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CKDiscretionaryDaemon;
  v4 = [(CKDiscretionaryDaemon *)&v9 init];
  if (v4)
  {
    uint64_t v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.ckdiscretionaryd.serial", v5);
    serialQueue = v4->_serialQueue;
    v4->_serialQueue = (OS_dispatch_queue *)v6;

    objc_storeStrong((id *)&v4->_schedulerClass, a3);
  }
  return v4;
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
}

- (Class)schedulerClass
{
  return self->_schedulerClass;
}

- (void)setSchedulerClass:(Class)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_schedulerClass, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = +[CKContainer _CKXPCClientToDiscretionaryDaemonInterface];
  [v7 setExportedInterface:v8];

  objc_super v9 = [[CKDiscretionaryClientConnection alloc] initWithDaemon:self connection:v7];
  [v7 setExportedObject:v9];

  objc_initWeak(&location, v7);
  v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472;
  v13 = sub_100006D74;
  v14 = &unk_100010598;
  objc_copyWeak(&v15, &location);
  [v7 setInvalidationHandler:&v11];
  objc_msgSend(v7, "resume", v11, v12, v13, v14);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  return 1;
}

@end