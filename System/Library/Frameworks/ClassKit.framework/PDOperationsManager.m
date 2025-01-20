@interface PDOperationsManager
- (BOOL)isEDUMAID;
- (BOOL)isInvalidated;
- (PDOperationsManager)init;
- (PDRing)ring;
- (id)apsConnection;
- (id)apsEnvironmentString;
- (id)cloudContainer;
- (id)issueASMFetchMissingWithDependency:(id)a3;
- (id)issueASMSyncWithDependency:(id)a3;
- (id)issueCKBootstrapWithDependency:(id)a3;
- (id)issueFetchFromCKWithDependency:(id)a3;
- (id)issueFetchHandoutChangesWithDependency:(id)a3;
- (id)issueIngestWithDependency:(id)a3;
- (id)issuePushClassChangesWithDependency:(id)a3;
- (id)issuePushToCKWithDependency:(id)a3;
- (id)issueRegisterWithDependency:(id)a3;
- (id)issueUploadEventsWithDependency:(id)a3;
- (id)operationOnQueueWithName:(id)a3;
- (id)operationOnQueueWithName:(id)a3 finishedOK:(BOOL)a4;
- (void)_addOperation:(id)a3 onQueue:(id)a4;
- (void)_populateDependencySet:(id)a3 ofOperation:(id)a4;
- (void)addCompletion:(id)a3 toOperation:(id)a4;
- (void)addInteractiveOperation:(id)a3;
- (void)addOperation:(id)a3;
- (void)addPriorityOperation:(id)a3;
- (void)addReportErrorBlockToOperation:(id)a3;
- (void)afterBootstrapWithErrorCompletion:(id)a3 doBlock:(id)a4;
- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4;
- (void)connection:(id)a3 didReceivePublicToken:(id)a4;
- (void)connection:(id)a3 didReceiveToken:(id)a4 forTopic:(id)a5 identifier:(id)a6;
- (void)databaseDataChanged:(id)a3;
- (void)dealloc;
- (void)loadICloudUserIDIfNeeded;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)registerCloudContainer;
- (void)registerForLockStateChangedDarwinNotification;
- (void)registerPeriodicTasksOnQueue:(id)a3;
- (void)registerPushTopics;
- (void)setInvalidated:(BOOL)a3;
- (void)stopListeningToPushNotifications;
@end

@implementation PDOperationsManager

- (id)cloudContainer
{
  return self->_cloudContainer;
}

- (PDOperationsManager)init
{
  uint64_t v3 = objc_opt_class();
  v4 = NSStringFromSelector(a2);
  v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"The method -[%@ %@] is not available.", v3, v4);
  id v6 = +[NSException exceptionWithName:NSInvalidArgumentException reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (void)registerCloudContainer
{
  id v13 = +[CKContainer containerIDForContainerIdentifier:@"com.apple.orion"];
  id v3 = objc_alloc_init((Class)CKContainerOptions);
  uint64_t v4 = sub_1000062FC();
  v5 = (void *)v4;
  if (v4) {
    id v6 = *(void **)(v4 + 24);
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  v8 = [v7 identifier];
  if (v8)
  {
    id v9 = [objc_alloc((Class)CKAccountOverrideInfo) initWithAccountID:v8];
    [v3 setAccountOverrideInfo:v9];
  }
  v10 = sub_10000C710();
  [v3 setApplicationBundleIdentifierOverrideForNetworkAttribution:v10];

  v11 = (CKContainer *)[objc_alloc((Class)CKContainer) initWithContainerID:v13 options:v3];
  cloudContainer = self->_cloudContainer;
  self->_cloudContainer = v11;
}

- (void)dealloc
{
  [(NSOperationQueue *)self->_operationQueue cancelAllOperations];
  [(NSOperationQueue *)self->_userInteractiveOperationQueue cancelAllOperations];
  [(NSOperationQueue *)self->_operationQueue removeObserver:self forKeyPath:@"operationCount" context:&off_10023CCD8];
  [(NSOperationQueue *)self->_userInteractiveOperationQueue removeObserver:self forKeyPath:@"operationCount" context:&off_10023CCE0];
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PDOperationsManager;
  [(PDOperationsManager *)&v4 dealloc];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  v11 = (NSOperationQueue *)a4;
  id v12 = a5;
  if (self->_operationQueue == v11)
  {
    unsigned int v14 = [v10 isEqualToString:@"operationCount"];
    if (a6 == &off_10023CCD8) {
      unsigned int v13 = v14;
    }
    else {
      unsigned int v13 = 0;
    }
  }
  else
  {
    unsigned int v13 = 0;
  }
  if (self->_userInteractiveOperationQueue == v11)
  {
    unsigned int v16 = [v10 isEqualToString:@"operationCount"];
    if (a6 == &off_10023CCE0) {
      unsigned int v15 = v16;
    }
    else {
      unsigned int v15 = 0;
    }
  }
  else
  {
    unsigned int v15 = 0;
  }
  if ([(NSOperationQueue *)self->_operationQueue operationCount])
  {
    if ((v13 | v15)) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  NSUInteger v17 = [(NSOperationQueue *)self->_userInteractiveOperationQueue operationCount];
  if (((v13 | v15) & 1) == 0)
  {
LABEL_18:
    v20.receiver = self;
    v20.super_class = (Class)PDOperationsManager;
    [(PDOperationsManager *)&v20 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
    goto LABEL_19;
  }
  if (!v17)
  {
    v18 = sub_1000A8424();
    sub_1000A9420(v18);

    CLSInitLog();
    v19 = CLSLogOperations;
    if (os_log_type_enabled(CLSLogOperations, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "_operationQueue and _userInteractiveOperationQueue are finished.", buf, 2u);
    }
  }
LABEL_19:
}

- (void)addCompletion:(id)a3 toOperation:(id)a4
{
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10010F404;
    v7[3] = &unk_1001F5130;
    id v8 = v5;
    [a4 addOnFinishBlock:v7];
  }
}

- (void)afterBootstrapWithErrorCompletion:(id)a3 doBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10010FE70;
  v10[3] = &unk_1001F51D0;
  id v8 = v6;
  id v11 = v8;
  objc_copyWeak(&v13, &location);
  id v9 = v7;
  id v12 = v9;
  sub_10010F4A4(self, v10);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (id)issueCKBootstrapWithDependency:(id)a3
{
  id v4 = a3;
  [(PDOperationsManager *)self loadICloudUserIDIfNeeded];
  id v5 = [PDCKBootstrap alloc];
  if (self) {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_database);
  }
  else {
    id WeakRetained = 0;
  }
  id v7 = [(PDOperationsManager *)self cloudContainer];
  id v8 = [(PDCKOperation *)v5 initWithDatabase:WeakRetained container:v7];

  [(PDCKBootstrap *)v8 setQualityOfService:25];
  if (v4) {
    [(PDCKBootstrap *)v8 addDependency:v4];
  }
  [(PDOperationsManager *)self addOperation:v8];

  return v8;
}

- (id)issuePushToCKWithDependency:(id)a3
{
  id v4 = a3;
  id v5 = [PDCKPushLocalChanges alloc];
  if (self) {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_database);
  }
  else {
    id WeakRetained = 0;
  }
  id v7 = [(PDOperationsManager *)self cloudContainer];
  id v8 = [(PDCKOperation *)v5 initWithDatabase:WeakRetained container:v7];

  if (v4) {
    [(PDCKPushLocalChanges *)v8 addDependency:v4];
  }
  [(PDOperationsManager *)self addOperation:v8];

  return v8;
}

- (id)issueIngestWithDependency:(id)a3
{
  id v4 = a3;
  id v5 = [PDIngestOperation alloc];
  if (self) {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_database);
  }
  else {
    id WeakRetained = 0;
  }
  id v7 = [(PDURLRequestOperation *)v5 initWithDatabase:WeakRetained];

  if (v4) {
    [(PDIngestOperation *)v7 addDependency:v4];
  }
  [(PDOperationsManager *)self addOperation:v7];

  return v7;
}

- (id)issuePushClassChangesWithDependency:(id)a3
{
  id v4 = a3;
  id v5 = [PDPushLocalClassChanges alloc];
  if (self) {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_database);
  }
  else {
    id WeakRetained = 0;
  }
  id v7 = [(PDPushLocalClassChanges *)v5 initWithDatabase:WeakRetained];

  if (v4) {
    [(PDPushLocalClassChanges *)v7 addDependency:v4];
  }
  [(PDOperationsManager *)self addOperation:v7];

  return v7;
}

- (id)issueRegisterWithDependency:(id)a3
{
  id v4 = a3;
  id v5 = [PDDashboardAppRegisterOperation alloc];
  if (self) {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_database);
  }
  else {
    id WeakRetained = 0;
  }
  id v7 = [(PDURLRequestOperation *)v5 initWithDatabase:WeakRetained];

  if (v4) {
    [(PDDashboardAppRegisterOperation *)v7 addDependency:v4];
  }
  [(PDOperationsManager *)self addOperation:v7];

  return v7;
}

- (id)issueFetchFromCKWithDependency:(id)a3
{
  id v4 = [(PDOperationsManager *)self issueCKBootstrapWithDependency:a3];
  id v5 = [PDCKFetchRemoteChanges alloc];
  if (self) {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_database);
  }
  else {
    id WeakRetained = 0;
  }
  id v7 = [(PDOperationsManager *)self cloudContainer];
  id v8 = [(PDCKOperation *)v5 initWithDatabase:WeakRetained container:v7];

  [(PDCKFetchRemoteChanges *)v8 addDependency:v4];
  [(PDOperationsManager *)self addOperation:v8];

  return v8;
}

- (id)issueASMFetchMissingWithDependency:(id)a3
{
  id v4 = a3;
  id v5 = [PDASMFetchMissingEntitiesOperation alloc];
  if (self) {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_database);
  }
  else {
    id WeakRetained = 0;
  }
  id v7 = [(PDASMFetchMissingEntitiesOperation *)v5 initWithDatabase:WeakRetained];

  if (v4) {
    [(PDASMFetchMissingEntitiesOperation *)v7 addDependency:v4];
  }
  [(PDOperationsManager *)self addOperation:v7];

  return v7;
}

- (id)issueASMSyncWithDependency:(id)a3
{
  id v4 = a3;
  id v5 = [PDASMSyncOperation alloc];
  if (self) {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_database);
  }
  else {
    id WeakRetained = 0;
  }
  id v7 = [(PDASMSyncOperation *)v5 initWithDatabase:WeakRetained];

  if (v4) {
    [(PDASMSyncOperation *)v7 addDependency:v4];
  }
  [(PDOperationsManager *)self addOperation:v7];

  return v7;
}

- (id)issueFetchHandoutChangesWithDependency:(id)a3
{
  id v4 = a3;
  id v5 = [PDClassZoneGetChanges alloc];
  if (self) {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_database);
  }
  else {
    id WeakRetained = 0;
  }
  id v7 = [(PDClassZoneGetChanges *)v5 initWithDatabase:WeakRetained];

  if (v4) {
    [(PDClassZoneGetChanges *)v7 addDependency:v4];
  }
  [(PDOperationsManager *)self addOperation:v7];

  return v7;
}

- (id)issueUploadEventsWithDependency:(id)a3
{
  id v4 = a3;
  id v5 = [PDUploadEventsOperation alloc];
  if (self) {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_database);
  }
  else {
    id WeakRetained = 0;
  }
  id v7 = [(PDURLRequestOperation *)v5 initWithDatabase:WeakRetained];

  if (v4) {
    [(PDUploadEventsOperation *)v7 addDependency:v4];
  }
  [(PDOperationsManager *)self addOperation:v7];

  return v7;
}

- (id)operationOnQueueWithName:(id)a3
{
  return [(PDOperationsManager *)self operationOnQueueWithName:a3 finishedOK:0];
}

- (id)operationOnQueueWithName:(id)a3 finishedOK:(BOOL)a4
{
  BOOL v4 = a4;
  unint64_t v6 = (unint64_t)a3;
  [(NSOperationQueue *)self->_operationQueue setSuspended:1];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v7 = [(NSOperationQueue *)self->_operationQueue operations];
  id v8 = [v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v8)
  {
    id v9 = v8;
    v23 = self;
    uint64_t v10 = *(void *)v26;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v26 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        if ((objc_msgSend(v12, "isCancelled", v23) & 1) == 0)
        {
          objc_opt_class();
          if (((objc_opt_isKindOfClass() & 1) == 0 || ([v12 isAborted] & 1) == 0)
            && (![v12 isFinished] || v4))
          {
            uint64_t v14 = [v12 name];
            if (!(v6 | v14)) {
              goto LABEL_22;
            }
            unsigned int v15 = (void *)v14;
            unsigned int v16 = [v12 name];
            NSUInteger v17 = v16;
            if (v6 && v16)
            {
              [v12 name];
              v18 = v7;
              objc_super v20 = v19 = v4;
              unsigned int v24 = [v20 isEqualToString:v6];

              BOOL v4 = v19;
              id v7 = v18;

              if (v24)
              {
LABEL_22:
                id v21 = v12;
                goto LABEL_23;
              }
            }
            else
            {
            }
          }
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v9) {
        continue;
      }
      break;
    }
    id v21 = 0;
LABEL_23:
    self = v23;
  }
  else
  {
    id v21 = 0;
  }

  [(NSOperationQueue *)self->_operationQueue setSuspended:0];

  return v21;
}

- (void)addReportErrorBlockToOperation:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100111658;
  v5[3] = &unk_1001F52C0;
  objc_copyWeak(&v6, &location);
  [v4 addOnFinishBlock:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)_populateDependencySet:(id)a3 ofOperation:(id)a4
{
  id v6 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = objc_msgSend(a4, "dependencies", 0);
  id v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        [v6 addObject:v12];
        [(PDOperationsManager *)self _populateDependencySet:v6 ofOperation:v12];
      }
      id v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

- (void)addPriorityOperation:(id)a3
{
  id v4 = a3;
  if (![(PDOperationsManager *)self isInvalidated])
  {
    [v4 setQualityOfService:25];
    [(NSOperationQueue *)self->_operationQueue setSuspended:1];
    [(PDOperationsManager *)self addOperation:v4];
    id v5 = objc_opt_new();
    [(PDOperationsManager *)self _populateDependencySet:v5 ofOperation:v4];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v6 = [(NSOperationQueue *)self->_operationQueue operations];
    id v7 = [v6 reverseObjectEnumerator];

    id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = *(id *)(*((void *)&v14 + 1) + 8 * i);
          if (([v12 isExecuting] & 1) == 0
            && ([v12 isCancelled] & 1) == 0)
          {
            unsigned __int8 v13 = [v12 isFinished];
            if (v12 != v4 && (v13 & 1) == 0 && ([v5 containsObject:v12] & 1) == 0) {
              [v12 addDependency:v4];
            }
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }

    [(NSOperationQueue *)self->_operationQueue setSuspended:0];
  }
}

- (void)_addOperation:(id)a3 onQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![(PDOperationsManager *)self isInvalidated])
  {
    if (sub_100003494((BOOL)self) || ![v6 requiresValidUser])
    {
      [(PDOperationsManager *)self addReportErrorBlockToOperation:v6];
      [v6 setManager:self];
      id v9 = +[PDUserDefaults sharedDefaults];
      unsigned int v10 = [v9 enableVerboseLogging];

      if (v10)
      {
        CLSInitLog();
        id v11 = (void *)CLSLogOperations;
        if (os_log_type_enabled(CLSLogOperations, OS_LOG_TYPE_DEBUG))
        {
          id v12 = v11;
          unsigned __int8 v13 = objc_opt_class();
          id v14 = v13;
          long long v15 = [v6 operationID];
          long long v16 = [v7 name];
          long long v17 = [v6 dependencies];
          int v18 = 138544130;
          BOOL v19 = v13;
          __int16 v20 = 2114;
          id v21 = v15;
          __int16 v22 = 2112;
          v23 = v16;
          __int16 v24 = 2112;
          long long v25 = v17;
          _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "OPS: queued %{public}@:%{public}@ on %@ dependencies: %@", (uint8_t *)&v18, 0x2Au);
        }
      }
      [v7 addOperation:v6];
    }
    else
    {
      id v8 = +[NSError cls_createErrorWithCode:1 description:@"Valid user required."];
      [v6 abortWithError:v8];
    }
  }
}

- (void)addOperation:(id)a3
{
}

- (void)addInteractiveOperation:(id)a3
{
}

- (void)databaseDataChanged:(id)a3
{
  CLSInitLog();
  id v4 = CLSLogSync;
  if (os_log_type_enabled(CLSLogSync, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v5 = 0;
    _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "database data changed;", v5, 2u);
  }
  sub_10010FF00(self, 0);
}

- (void)loadICloudUserIDIfNeeded
{
  if (self)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_database);
    if (WeakRetained && sub_100003494((BOOL)self))
    {
      id v4 = self;
      objc_sync_enter(v4);
      if (v4->_isLoadingICloudUserID)
      {
        objc_sync_exit(v4);
      }
      else
      {
        v4->_isLoadingICloudUserID = 1;
        objc_sync_exit(v4);

        id v5 = sub_100006D08(WeakRetained, @"PDCK_iCloudUserID");
        if ([v5 length])
        {
          id v6 = v4;
          objc_sync_enter(v6);
          v4->_isLoadingICloudUserID = 0;
          objc_sync_exit(v6);
        }
        else
        {
          objc_initWeak(&location, v4);
          id v7 = v4;
          objc_sync_enter(v7);
          if (!v7->_loadICloudUser)
          {
            id v8 = [PDRetry alloc];
            v14[0] = _NSConcreteStackBlock;
            v14[1] = 3221225472;
            v14[2] = sub_100111FA0;
            v14[3] = &unk_1001F5180;
            objc_copyWeak(&v15, &location);
            id v9 = (PDRetry *)sub_100049F38(v8, @"loadICloudUserIDIfNeeded", 6, v14);
            loadICloudUser = v7->_loadICloudUser;
            v7->_loadICloudUser = v9;

            objc_destroyWeak(&v15);
          }
          objc_sync_exit(v7);

          id v11 = v7->_loadICloudUser;
          v12[0] = _NSConcreteStackBlock;
          v12[1] = 3221225472;
          v12[2] = sub_1001122C8;
          v12[3] = &unk_1001F5310;
          objc_copyWeak(&v13, &location);
          sub_10004A09C(v11, v12);
          objc_destroyWeak(&v13);
          objc_destroyWeak(&location);
        }
      }
    }
  }
  else
  {
    id WeakRetained = 0;
  }
}

- (id)apsEnvironmentString
{
  id v3 = (void *)xpc_copy_entitlement_for_self();
  id v4 = v3;
  if (v3)
  {
    id v5 = +[NSString stringWithUTF8String:xpc_string_get_string_ptr(v3)];
  }
  else
  {
    id v5 = 0;
  }
  uint64_t v18 = 0;
  BOOL v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = sub_10000B794;
  __int16 v22 = sub_10000B5E4;
  id v23 = APSEnvironmentProduction;
  if (v5 && ![v5 compare:CKPushEnvironmentServerPreferred options:1])
  {
    dispatch_block_t v6 = dispatch_block_create((dispatch_block_flags_t)0, &stru_1001F5330);
    objc_initWeak(location, self);
    id v7 = [PDRetry alloc];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1001126F4;
    v16[3] = &unk_1001F53A8;
    objc_copyWeak(&v17, location);
    v16[4] = &v18;
    id v8 = sub_100049F38(v7, @"apsEnvLookup", 16, v16);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100112AB0;
    v14[3] = &unk_1001F51A8;
    id v9 = v6;
    id v15 = v9;
    sub_10004A09C(v8, v14);
    dispatch_block_wait(v9, 0xFFFFFFFFFFFFFFFFLL);

    objc_destroyWeak(&v17);
    objc_destroyWeak(location);
  }
  CLSInitLog();
  unsigned int v10 = CLSLogPush;
  if (os_log_type_enabled(CLSLogPush, OS_LOG_TYPE_DEBUG))
  {
    id v13 = (void *)v19[5];
    LODWORD(location[0]) = 138543362;
    *(id *)((char *)location + 4) = v13;
    _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Using APS push environment: %{public}@", (uint8_t *)location, 0xCu);
  }
  id v11 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  return v11;
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  CLSInitLog();
  id v7 = CLSLogPush;
  if (os_log_type_enabled(CLSLogPush, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 138412546;
    id v9 = v6;
    __int16 v10 = 2048;
    id v11 = v5;
    _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Received public token \"%@\" on connection %p", (uint8_t *)&v8, 0x16u);
  }
}

- (void)connection:(id)a3 didReceiveToken:(id)a4 forTopic:(id)a5 identifier:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  CLSInitLog();
  id v13 = CLSLogPush;
  if (os_log_type_enabled(CLSLogPush, OS_LOG_TYPE_DEBUG))
  {
    int v14 = 138413058;
    id v15 = v10;
    __int16 v16 = 2114;
    id v17 = v11;
    __int16 v18 = 2112;
    id v19 = v12;
    __int16 v20 = 2048;
    id v21 = v9;
    _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "Received per-topic push token \"%@\" for topic \"%{public}@\" identifier \"%@\" on connection %p", (uint8_t *)&v14, 0x2Au);
  }
}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  id v5 = a4;
  id v6 = [v5 userInfo];
  id v7 = +[CKNotification notificationFromRemoteNotificationDictionary:v6];
  int v8 = +[PDUserDefaults sharedDefaults];
  unsigned int v9 = [v8 enableVerboseLogging];

  CLSInitLog();
  id v10 = (void *)CLSLogPush;
  BOOL v11 = os_log_type_enabled(CLSLogPush, OS_LOG_TYPE_DEBUG);
  if (v9)
  {
    if (!v11) {
      goto LABEL_5;
    }
    id v12 = v10;
    id v13 = [v5 topic];
    int v34 = 138543618;
    id v35 = v13;
    __int16 v36 = 2114;
    v37 = v7;
    int v14 = "APS push received: %{public}@ %{public}@";
    id v15 = v12;
    uint32_t v16 = 22;
  }
  else
  {
    if (!v11) {
      goto LABEL_5;
    }
    id v12 = v10;
    id v13 = [v5 topic];
    int v34 = 138543362;
    id v35 = v13;
    int v14 = "APS push received: %{public}@";
    id v15 = v12;
    uint32_t v16 = 12;
  }
  _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, v14, (uint8_t *)&v34, v16);

LABEL_5:
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v17 = [v7 recordZoneID];
    if (!v17) {
      goto LABEL_16;
    }
LABEL_10:
    id v19 = v17;
    if (self)
    {
      if (sub_1000F0240((uint64_t)PDClassZoneGetChanges, v19))
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_database);
        id v21 = [v19 zoneName];
        if (([WeakRetained entityExistsByClass:objc_opt_class() identity:v21] & 1) == 0)
        {
          __int16 v22 = objc_opt_new();
          sub_100075F50((uint64_t)v22, v21);
          if ([WeakRetained insertObject:v22]) {
            goto LABEL_24;
          }
          CLSInitLog();
          id v23 = CLSLogPush;
          if (!os_log_type_enabled(CLSLogPush, OS_LOG_TYPE_ERROR)) {
            goto LABEL_24;
          }
          int v34 = 138412290;
          id v35 = v19;
          __int16 v24 = "Failed to mark down zone with zoneID %@";
LABEL_31:
          _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, v24, (uint8_t *)&v34, 0xCu);
LABEL_24:

          goto LABEL_25;
        }
        goto LABEL_25;
      }
      long long v28 = [v19 zoneName];
      unsigned int v29 = [v28 hasPrefix:@"Class-Roster-"];

      if (v29)
      {
        v30 = [v19 zoneName];
        id WeakRetained = [v30 substringFromIndex:objc_msgSend(@"Class-Roster-", "length")];

        id v21 = objc_loadWeakRetained((id *)&self->_database);
        if (([v21 entityExistsByClass:objc_opt_class() identity:WeakRetained] & 1) == 0)
        {
          CLSInitLog();
          v31 = CLSLogPush;
          if (os_log_type_enabled(CLSLogPush, OS_LOG_TYPE_DEFAULT))
          {
            int v34 = 138477827;
            id v35 = WeakRetained;
            _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Push references missing ClassID: %{private}@", (uint8_t *)&v34, 0xCu);
          }
          v32 = [PDMissingEntityReference alloc];
          v33 = (objc_class *)objc_opt_class();
          __int16 v22 = sub_100170BF0((id *)&v32->super.isa, WeakRetained, v33, 0, 0);
          if ([v21 insertOrUpdateObject:v22]) {
            goto LABEL_24;
          }
          CLSInitLog();
          id v23 = CLSLogPush;
          if (!os_log_type_enabled(CLSLogPush, OS_LOG_TYPE_ERROR)) {
            goto LABEL_24;
          }
          int v34 = 138477827;
          id v35 = WeakRetained;
          __int16 v24 = "Failed to save reference to missing ClassID = %{private}@ ";
          goto LABEL_31;
        }
LABEL_25:
      }
    }

    sub_100003784(self, 0);
    goto LABEL_27;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    __int16 v18 = [v7 recordID];
    id v17 = [v18 zoneID];

    if (v17) {
      goto LABEL_10;
    }
  }
LABEL_16:
  CLSInitLog();
  long long v25 = (void *)CLSLogPush;
  if (os_log_type_enabled(CLSLogPush, OS_LOG_TYPE_DEBUG))
  {
    long long v26 = v25;
    long long v27 = [v5 topic];
    int v34 = 138543618;
    id v35 = v27;
    __int16 v36 = 2114;
    v37 = v7;
    _os_log_debug_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "APS push NO zoneID received: %{public}@ %{public}@", (uint8_t *)&v34, 0x16u);
  }
LABEL_27:
}

- (id)apsConnection
{
  if (!self->_apsConnection)
  {
    id v3 = objc_alloc((Class)APSConnection);
    id v4 = [(PDOperationsManager *)self apsEnvironmentString];
    id v5 = sub_10010EF08();
    id v6 = (APSConnection *)[v3 initWithEnvironmentName:v4 namedDelegatePort:@"com.apple.progressd.aps" queue:v5];
    apsConnection = self->_apsConnection;
    self->_apsConnection = v6;

    [(APSConnection *)self->_apsConnection setDelegate:self];
    int v8 = self->_apsConnection;
    CLSInitLog();
    unsigned int v9 = CLSLogPush;
    if (v8)
    {
      if (os_log_type_enabled(CLSLogPush, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)id v12 = 0;
        _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Created push connection.", v12, 2u);
      }
    }
    else if (os_log_type_enabled(CLSLogPush, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Could not create a push connection.", buf, 2u);
    }
  }
  id v10 = self->_apsConnection;

  return v10;
}

- (void)registerPushTopics
{
  objc_initWeak(&location, self);
  v2 = sub_1001133E8();
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10011343C;
  v3[3] = &unk_1001F2D28;
  objc_copyWeak(&v4, &location);
  dispatch_async(v2, v3);

  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)registerForLockStateChangedDarwinNotification
{
  objc_initWeak(&location, self);
  id v3 = +[CLSDarwinNotificationCenter defaultCenter];
  self;
  id v4 = +[NSString stringWithUTF8String:kMobileKeyBagLockStatusNotifyToken];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100113770;
  v5[3] = &unk_1001F53D0;
  objc_copyWeak(&v6, &location);
  [v3 addObserver:self notificationName:v4 block:v5];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)stopListeningToPushNotifications
{
  id v3 = +[CLSDarwinNotificationCenter defaultCenter];
  self;
  id v4 = +[NSString stringWithUTF8String:kMobileKeyBagLockStatusNotifyToken];
  [v3 removeObserver:self notificationName:v4];

  id v5 = sub_1001133E8();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001138E8;
  block[3] = &unk_1001F2A68;
  block[4] = self;
  dispatch_async(v5, block);
}

- (BOOL)isEDUMAID
{
  if (self) {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_database);
  }
  else {
    id WeakRetained = 0;
  }
  sub_100003A74(WeakRetained);
  id v3 = (unsigned char *)objc_claimAutoreleasedReturnValue();
  if (v3) {
    BOOL v4 = v3[9] != 0;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (void)registerPeriodicTasksOnQueue:(id)a3
{
  p_taskQueue = &self->_taskQueue;
  objc_storeStrong((id *)&self->_taskQueue, a3);
  if (sub_100003494((BOOL)self))
  {
    sub_10011496C((uint64_t)self);
    if (self->_taskQueue)
    {
      objc_initWeak(&location, self);
      unsigned int v9 = _NSConcreteStackBlock;
      uint64_t v10 = 3221225472;
      BOOL v11 = sub_100114C54;
      id v12 = &unk_1001F2D28;
      objc_copyWeak(&v13, &location);
      id v5 = objc_retainBlock(&v9);
      id v6 = [PDTaskSchedulerBlockTask alloc];
      id v7 = [(PDTaskSchedulerBlockTask *)v6 initWithIdentifier:@"com.apple.progressd.pruneIDs", *p_taskQueue, v5, v9, v10, v11, v12 queue block];
      [(PDTaskSchedulerBlockTask *)v7 setDelay:604800];
      int v8 = sub_1000637B8();
      sub_100063F70(v8, v7);

      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
    }
  }
}

- (PDRing)ring
{
  return self->_ring;
}

- (BOOL)isInvalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ring, 0);
  objc_destroyWeak((id *)&self->_database);
  objc_storeStrong((id *)&self->_loadICloudUser, 0);
  objc_storeStrong((id *)&self->_fetch, 0);
  objc_storeStrong((id *)&self->_push, 0);
  objc_storeStrong((id *)&self->_bootstrap, 0);
  objc_storeStrong((id *)&self->_apsConnection, 0);
  objc_storeStrong((id *)&self->_cloudContainer, 0);
  objc_storeStrong((id *)&self->_taskQueue, 0);
  objc_storeStrong((id *)&self->_userInteractiveOperationQueue, 0);

  objc_storeStrong((id *)&self->_operationQueue, 0);
}

@end