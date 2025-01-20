@interface CPLBaseScheduler
- (BOOL)shouldCoalesceServerChangesNotification;
- (BOOL)shouldStartSyncSessionFromState:(unint64_t)a3;
- (CPLBaseScheduler)initWithAbstractObject:(id)a3;
- (id)componentName;
- (id)scheduleNextSyncSessionAtDate:(id)a3;
- (unint64_t)_nextSequenceNumber;
- (void)closeAndDeactivate:(BOOL)a3 completionHandler:(id)a4;
- (void)noteSyncSession:(id)a3 failedWithError:(id)a4;
- (void)noteSyncSessionSucceeded:(id)a3;
- (void)openWithCompletionHandler:(id)a3;
- (void)schedulePersistedSyncSessionIfAvailableWithCompletionHandler:(id)a3;
- (void)unschedulePersistedSyncSession;
- (void)unscheduleSyncSession:(id)a3;
@end

@implementation CPLBaseScheduler

- (CPLBaseScheduler)initWithAbstractObject:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)CPLBaseScheduler;
  v3 = [(CPLBaseScheduler *)&v12 initWithAbstractObject:a3];
  if (v3)
  {
    if (!_CPLSilentLogging)
    {
      v4 = sub_1001C34A0();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v14 = v3;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Initializing %@", buf, 0xCu);
      }
    }
    v5 = CPLCopyDefaultSerialQueueAttributes();
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.cpl.scheduler", v5);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v6;

    v8 = CPLCopyDefaultSerialQueueAttributes();
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.cpl.scheduler.sequenceNumber", v8);
    sequenceNumberQueue = v3->_sequenceNumberQueue;
    v3->_sequenceNumberQueue = (OS_dispatch_queue *)v9;
  }
  return v3;
}

- (unint64_t)_nextSequenceNumber
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  sequenceNumberQueue = self->_sequenceNumberQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1001C35A8;
  v5[3] = &unk_1002768A8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)sequenceNumberQueue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)shouldStartSyncSessionFromState:(unint64_t)a3
{
  return 1;
}

- (BOOL)shouldCoalesceServerChangesNotification
{
  return 1;
}

- (void)noteSyncSessionSucceeded:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1001C3710;
  v10[3] = &unk_100276018;
  v10[4] = self;
  id v11 = v4;
  uint64_t v6 = v10;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001C4E38;
  block[3] = &unk_100275DF8;
  id v13 = v6;
  v7 = queue;
  id v8 = v4;
  dispatch_block_t v9 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v7, v9);
}

- (void)noteSyncSession:(id)a3 failedWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1001C38A8;
  v14[3] = &unk_1002760B0;
  v14[4] = self;
  id v15 = v6;
  id v16 = v7;
  dispatch_block_t v9 = v14;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001C4E38;
  block[3] = &unk_100275DF8;
  id v18 = v9;
  v10 = queue;
  id v11 = v7;
  id v12 = v6;
  dispatch_block_t v13 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v10, v13);
}

- (void)openWithCompletionHandler:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1001C3C90;
  v10[3] = &unk_100276288;
  v10[4] = self;
  id v11 = v4;
  id v6 = v10;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001C4E38;
  block[3] = &unk_100275DF8;
  id v13 = v6;
  id v7 = queue;
  id v8 = v4;
  dispatch_block_t v9 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v7, v9);
}

- (void)schedulePersistedSyncSessionIfAvailableWithCompletionHandler:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1001C3F08;
  v10[3] = &unk_100276288;
  v10[4] = self;
  id v11 = v4;
  id v6 = v10;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001C4E38;
  block[3] = &unk_100275DF8;
  id v13 = v6;
  id v7 = queue;
  id v8 = v4;
  dispatch_block_t v9 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v7, v9);
}

- (void)unschedulePersistedSyncSession
{
  queue = self->_queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1001C44C0;
  v6[3] = &unk_100275EA0;
  v6[4] = self;
  unint64_t v3 = v6;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001C4E38;
  block[3] = &unk_100275DF8;
  id v8 = v3;
  id v4 = queue;
  dispatch_block_t v5 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v4, v5);
}

- (void)closeAndDeactivate:(BOOL)a3 completionHandler:(id)a4
{
  id v6 = a4;
  queue = self->_queue;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1001C46A4;
  v12[3] = &unk_100279870;
  BOOL v14 = a3;
  v12[4] = self;
  id v13 = v6;
  id v8 = v12;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001C4E38;
  block[3] = &unk_100275DF8;
  id v16 = v8;
  dispatch_block_t v9 = queue;
  id v10 = v6;
  dispatch_block_t v11 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v9, v11);
}

- (id)scheduleNextSyncSessionAtDate:(id)a3
{
  id v4 = a3;
  dispatch_block_t v5 = [(CPLBaseScheduler *)self abstractObject];
  id v6 = objc_alloc((Class)CPLSyncSession);
  unint64_t v7 = [(CPLBaseScheduler *)self _nextSequenceNumber];
  id v8 = [v5 configuration];
  id v9 = [v6 initWithSequenceNumber:v7 expectedDate:v4 scheduler:v5 configuration:v8 scopeFilter:0];

  queue = self->_queue;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1001C4910;
  v19[3] = &unk_1002760B0;
  v19[4] = self;
  id v20 = v4;
  id v11 = v9;
  id v21 = v11;
  id v12 = v19;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001C4E38;
  block[3] = &unk_100275DF8;
  id v23 = v12;
  id v13 = queue;
  id v14 = v4;
  dispatch_block_t v15 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v13, v15);

  id v16 = v21;
  id v17 = v11;

  return v17;
}

- (void)unscheduleSyncSession:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1001C4CC4;
  v10[3] = &unk_100276018;
  v10[4] = self;
  id v11 = v4;
  id v6 = v10;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001C4E38;
  block[3] = &unk_100275DF8;
  id v13 = v6;
  unint64_t v7 = queue;
  id v8 = v4;
  dispatch_block_t v9 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v7, v9);
}

- (id)componentName
{
  return @"scheduler";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scheduledSession, 0);
  objc_storeStrong((id *)&self->_currentSession, 0);
  objc_storeStrong((id *)&self->_sequenceNumberQueue, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end