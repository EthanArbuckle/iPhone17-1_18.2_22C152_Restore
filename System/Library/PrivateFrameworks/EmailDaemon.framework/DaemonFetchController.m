@interface DaemonFetchController
+ (OS_os_log)log;
- (DaemonFetchController)initWithAccountsProvider:(id)a3 favoritesPersistence:(id)a4 hookRegistry:(id)a5;
- (id)diagnosticInformation;
- (id)visibleMailboxes;
- (void)_autoFetchProcessFinished:(id)a3;
- (void)accountsAdded:(id)a3;
- (void)downloadMessageBodiesWithCompletion:(id)a3;
- (void)fetchSchedulerDidTrigger:(id)a3;
- (void)performFetchForOTC;
- (void)performFetchOfType:(int)a3;
- (void)performFetchOfType:(int)a3 accountIds:(id)a4;
- (void)performFetchOfType:(int)a3 mailboxObjectIds:(id)a4;
- (void)resetPushStateWithCompletion:(id)a3;
- (void)setSuppressedContexts:(id)a3;
@end

@implementation DaemonFetchController

+ (OS_os_log)log
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100011BE8;
  block[3] = &unk_100139B30;
  block[4] = a1;
  if (qword_10016B770 != -1) {
    dispatch_once(&qword_10016B770, block);
  }
  v2 = (void *)qword_10016B768;

  return (OS_os_log *)v2;
}

- (DaemonFetchController)initWithAccountsProvider:(id)a3 favoritesPersistence:(id)a4 hookRegistry:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v28.receiver = self;
  v28.super_class = (Class)DaemonFetchController;
  v11 = [(DaemonFetchController *)&v28 initWithAccountsProvider:v8];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_favoritesPersistence, a4);
    v13 = [[FetchXPCActivityScheduler alloc] initWithType:3 interval:v12 delegate:86400.0];
    compactScheduler = v12->_compactScheduler;
    v12->_compactScheduler = v13;

    v15 = [objc_alloc((Class)MFBackFillMessageBodyScheduler) initWithAccountsProvider:v8];
    backFillScheduler = v12->_backFillScheduler;
    v12->_backFillScheduler = v15;

    uint64_t v17 = +[EFScheduler serialDispatchQueueSchedulerWithName:@"com.apple.email.DaemonFetchController.pendingFetchOTCScheduler"];
    pendingFetchOTCScheduler = v12->_pendingFetchOTCScheduler;
    v12->_pendingFetchOTCScheduler = (EFScheduler *)v17;

    v19 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v20 = dispatch_queue_attr_make_with_qos_class(v19, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v21 = dispatch_queue_create("com.apple.email.DaemonFetchController", v20);
    queue = v12->_queue;
    v12->_queue = (OS_dispatch_queue *)v21;

    v23 = v12->_queue;
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100011E9C;
    v25[3] = &unk_100139C20;
    v26 = v12;
    id v27 = v10;
    dispatch_async(v23, v25);
  }
  return v12;
}

- (void)fetchSchedulerDidTrigger:(id)a3
{
  id v4 = a3;
  -[DaemonFetchController performFetchOfType:](self, "performFetchOfType:", sub_10001233C((uint64_t)self, (int)[v4 schedulerType]));
}

- (void)_autoFetchProcessFinished:(id)a3
{
  id v4 = +[DaemonFetchController log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_1000C03B4(v4);
  }

  if (self) {
    compactScheduler = self->_compactScheduler;
  }
  else {
    compactScheduler = 0;
  }
  v6 = +[NSMutableArray arrayWithObject:compactScheduler];
  os_unfair_lock_lock(&self->_fetchSchedulerLock);
  if (self && self->_powerNapScheduler) {
    [v6 addObject:self->_powerNapScheduler];
  }
  if (self && self->_periodicScheduler) {
    [v6 addObject:self->_periodicScheduler];
  }
  os_unfair_lock_unlock(&self->_fetchSchedulerLock);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v12;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "markAsDone", (void)v11);
      }
      id v8 = [v7 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)accountsAdded:(id)a3
{
  id v4 = a3;
  v5 = objc_msgSend(v4, "ef_filter:", &stru_10013A228);
  v6 = +[DaemonFetchController log];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v4 count]);
    *(_DWORD *)buf = 138412290;
    long long v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Scheduling fetch for %@ new accounts", buf, 0xCu);
  }
  dispatch_time_t v8 = dispatch_time(0, 1000000000);
  if (self) {
    self = (DaemonFetchController *)self->_queue;
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001326C;
  block[3] = &unk_100139C48;
  id v11 = v5;
  id v9 = v5;
  dispatch_after(v8, (dispatch_queue_t)self, block);
}

- (void)performFetchOfType:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = +[AutoFetchController sharedController];
  [v4 fetchNow:v3];
}

- (void)performFetchForOTC
{
  double v3 = sub_100013440((uint64_t)self);
  id v4 = +[DaemonFetchController log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 134217984;
    double v8 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Fetching for One Time Code has been delayed for %f seconds", (uint8_t *)&v7, 0xCu);
  }

  if (self) {
    pendingFetchOTCScheduler = self->_pendingFetchOTCScheduler;
  }
  else {
    pendingFetchOTCScheduler = 0;
  }
  id v6 = [(EFScheduler *)pendingFetchOTCScheduler afterDelay:&stru_10013A248 performBlock:v3];
}

- (void)performFetchOfType:(int)a3 accountIds:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  objc_msgSend(a4, "ef_map:", &stru_10013A288);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = +[AutoFetchController sharedController];
  [v5 fetchNow:v4 withAccounts:v6];
}

- (void)performFetchOfType:(int)a3 mailboxObjectIds:(id)a4
{
}

- (void)downloadMessageBodiesWithCompletion:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[MFMessageBodyProcessor powernapProcessor];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100013A6C;
  v6[3] = &unk_10013A318;
  id v5 = v3;
  id v7 = v5;
  [v4 runWithCompletion:v6];
}

- (void)resetPushStateWithCompletion:(id)a3
{
  id v4 = a3;
  id v3 = +[AutoFetchController sharedController];
  [v3 resetPushStateWithCompletion:v4];
}

- (void)setSuppressedContexts:(id)a3
{
  id v4 = a3;
  id v3 = +[AutoFetchController sharedController];
  [v3 setSuppressedContexts:v4];
}

- (id)diagnosticInformation
{
  v2 = +[AutoFetchController sharedController];
  id v3 = [v2 diagnosticInformation];

  return v3;
}

- (id)visibleMailboxes
{
  v2 = +[EDClientState sharedInstance];
  id v3 = [v2 visibleMailboxObjectIDs];

  id v4 = objc_msgSend(v3, "ef_compactMap:", &stru_10013A338);

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_pendingFetchOTCScheduler, 0);
  objc_storeStrong((id *)&self->_backFillScheduler, 0);
  objc_storeStrong((id *)&self->_compactScheduler, 0);
  objc_storeStrong((id *)&self->_periodicScheduler, 0);
  objc_storeStrong((id *)&self->_powerNapScheduler, 0);
  objc_storeStrong((id *)&self->_currentAlertSuppresionContexts, 0);
  objc_storeStrong((id *)&self->_currentAlertContexts, 0);
  objc_storeStrong((id *)&self->_favoritesPersistence, 0);

  objc_storeStrong((id *)&self->_throttleTimer, 0);
}

@end