@interface RestoreService
- (RestoreService)init;
- (void)clearFollowupsForAccountID:(id)a3 replyHandler:(id)a4;
- (void)estimateTotalDownloadSizeWithReplyHandler:(id)a3;
- (void)prioritizeBundleIDs:(id)a3 userInitiated:(BOOL)a4 replyHandler:(id)a5;
@end

@implementation RestoreService

- (RestoreService)init
{
  v3 = sub_1003E0BA4();
  id v4 = v3;
  if (self)
  {
    v14.receiver = self;
    v14.super_class = (Class)RestoreService;
    v5 = [(RestoreService *)&v14 init];
    self = v5;
    if (v5)
    {
      objc_storeStrong((id *)&v5->_database, v3);
      v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v7 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.appstored.RestoreService", v6);
      queue = self->_queue;
      self->_queue = v7;

      v9 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
      queue_parkedDownloadSizeHandlers = self->_queue_parkedDownloadSizeHandlers;
      self->_queue_parkedDownloadSizeHandlers = v9;

      self->_queue_restoreState = 0;
      v11 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v13 = 0;
        _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "(RestoreService) Restore state -> UNKNOWN", v13, 2u);
      }
    }
  }

  return self;
}

- (void)clearFollowupsForAccountID:(id)a3 replyHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1002B21DC;
  v11[3] = &unk_100521698;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(queue, v11);
}

- (void)estimateTotalDownloadSizeWithReplyHandler:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1002B235C;
  v7[3] = &unk_100521698;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

- (void)prioritizeBundleIDs:(id)a3 userInitiated:(BOOL)a4 replyHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002B2610;
  block[3] = &unk_100525938;
  BOOL v16 = a4;
  id v14 = v8;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_sync(queue, block);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue_parkedDownloadSizeHandlers, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_database, 0);
}

@end