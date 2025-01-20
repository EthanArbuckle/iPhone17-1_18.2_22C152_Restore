@interface CPLEngineLibrarySupervisor
- (BOOL)schedulerShouldStartSyncSessionMovingToForeground:(id)a3 currentSession:(id)a4;
- (CPLEngineLibrary)engineLibrary;
- (CPLEngineLibrarySupervisor)initWithEngineLibrary:(id)a3 queue:(id)a4;
- (CPLEngineStore)store;
- (NSString)status;
- (OS_dispatch_queue)queue;
- (int64_t)_supervisorExitStateForScopeChange:(id)a3;
- (void)_checkExitSupervisor;
- (void)_checkExitSupervisorInTransaction:(id)a3;
- (void)_launchForcedExitForSupervisor:(id)a3;
- (void)_scheduleOrLaunchIfNecessary;
- (void)_scheduleOrLaunchIfNecessaryInQueue;
- (void)_sendExitFeedbackForSupervisor:(id)a3 cloudKitScope:(id)a4 exitState:(int64_t)a5;
- (void)_storeSupervisorInfoInTransaction:(id)a3;
- (void)_unscheduleInQueue;
- (void)engineDidOpen:(id)a3;
- (void)engineWillClose:(id)a3;
- (void)pause;
- (void)ping;
- (void)resume;
- (void)scopeStorage:(id)a3 didDropSharingScopeIdentifier:(id)a4;
- (void)scopeStorage:(id)a3 didStoreSharingScopeIdentifier:(id)a4;
- (void)scopeStorage:(id)a3 didUpdateScopeChange:(id)a4 forScope:(id)a5;
- (void)scopeUpdateTaskDidFinishSuccessfully:(id)a3;
- (void)transportNotedServerHasChanges:(id)a3;
@end

@implementation CPLEngineLibrarySupervisor

- (CPLEngineLibrarySupervisor)initWithEngineLibrary:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CPLEngineLibrarySupervisor;
  v8 = [(CPLEngineLibrarySupervisor *)&v14 init];
  v9 = v8;
  if (v8)
  {
    id v10 = objc_storeWeak((id *)&v8->_engineLibrary, v6);
    uint64_t v11 = [v6 store];
    store = v9->_store;
    v9->_store = (CPLEngineStore *)v11;

    objc_storeStrong((id *)&v9->_queue, a4);
    v9->_lock._os_unfair_lock_opaque = 0;
  }

  return v9;
}

- (void)_unscheduleInQueue
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  retryTimer = self->_retryTimer;
  if (retryTimer)
  {
    dispatch_source_cancel(retryTimer);
    v4 = self->_retryTimer;
    self->_retryTimer = 0;

    nextRetryDate = self->_nextRetryDate;
    self->_nextRetryDate = 0;
  }
}

- (void)_scheduleOrLaunchIfNecessaryInQueue
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_closed)
  {
    if (self->_forceProcessingStagedScopesTask) {
      return;
    }
    uint64_t v21 = 0;
    v22 = &v21;
    uint64_t v23 = 0x3032000000;
    v24 = sub_100031BE0;
    v25 = sub_100031BF0;
    id v26 = 0;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v17 = sub_100031BF8;
    v18 = &unk_1002768A8;
    v19 = self;
    v20 = &v21;
    v3 = v16;
    os_unfair_lock_lock(&self->_lock);
    v17((uint64_t)v3);
    os_unfair_lock_unlock(&self->_lock);

    v4 = (void *)v22[5];
    if (v4)
    {
      nextRetryDate = self->_nextRetryDate;
      if (!nextRetryDate)
      {
LABEL_10:
        objc_storeStrong((id *)&self->_nextRetryDate, v4);
        [(id)v22[5] timeIntervalSinceNow];
        if (v6 >= 0.100000001) {
          double v7 = v6 * 1000000000.0;
        }
        else {
          double v7 = 100000001.0;
        }
        dispatch_source_t v8 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_queue);
        v13[0] = _NSConcreteStackBlock;
        v13[1] = 3221225472;
        v13[2] = sub_100031C9C;
        v13[3] = &unk_100276018;
        v9 = v8;
        objc_super v14 = v9;
        v15 = self;
        dispatch_source_set_event_handler(v9, v13);
        dispatch_time_t v10 = dispatch_walltime(0, (uint64_t)v7);
        dispatch_source_set_timer(v9, v10, 0xFFFFFFFFFFFFFFFFLL, 0x2540BE400uLL);
        retryTimer = self->_retryTimer;
        self->_retryTimer = (OS_dispatch_source *)v9;
        v12 = v9;

        dispatch_resume((dispatch_object_t)self->_retryTimer);
        goto LABEL_16;
      }
      if ((id)-[NSDate compare:](nextRetryDate, "compare:") == (id)1)
      {
        [(CPLEngineLibrarySupervisor *)self _unscheduleInQueue];
        v4 = (void *)v22[5];
        if (v4) {
          goto LABEL_10;
        }
      }
      else if (v22[5])
      {
LABEL_16:
        _Block_object_dispose(&v21, 8);

        return;
      }
    }
    [(CPLEngineLibrarySupervisor *)self _unscheduleInQueue];
    goto LABEL_16;
  }
  [(CPLEngineLibrarySupervisor *)self _unscheduleInQueue];
}

- (void)_scheduleOrLaunchIfNecessary
{
  queue = self->_queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100031DA4;
  v6[3] = &unk_100275EA0;
  v6[4] = self;
  v3 = v6;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003575C;
  block[3] = &unk_100275DF8;
  id v8 = v3;
  v4 = queue;
  dispatch_block_t v5 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v4, v5);
}

- (void)engineDidOpen:(id)a3
{
  store = self->_store;
  v5[4] = self;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100031E60;
  v6[3] = &unk_1002773D8;
  v6[4] = self;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100032120;
  v5[3] = &unk_1002773D8;
  id v4 = [(CPLEngineStore *)store performWriteTransactionWithBlock:v6 completionHandler:v5];
}

- (void)engineWillClose:(id)a3
{
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100032218;
  v7[3] = &unk_100275EA0;
  v7[4] = self;
  id v4 = v7;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003575C;
  block[3] = &unk_100275DF8;
  id v9 = v4;
  dispatch_block_t v5 = queue;
  dispatch_block_t v6 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v5, v6);
}

- (BOOL)schedulerShouldStartSyncSessionMovingToForeground:(id)a3 currentSession:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v7 && [v7 activityState] != (id)1)
  {
    BOOL v11 = 1;
  }
  else
  {
    uint64_t v18 = 0;
    v19 = &v18;
    uint64_t v20 = 0x2020000000;
    char v21 = 1;
    p_lock = &self->_lock;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    objc_super v14 = sub_100032384;
    v15 = &unk_1002768A8;
    v16 = self;
    v17 = &v18;
    dispatch_time_t v10 = v13;
    os_unfair_lock_lock(p_lock);
    v14((uint64_t)v10);
    os_unfair_lock_unlock(p_lock);

    BOOL v11 = *((unsigned char *)v19 + 24) != 0;
    _Block_object_dispose(&v18, 8);
  }

  return v11;
}

- (int64_t)_supervisorExitStateForScopeChange:(id)a3
{
  id v3 = a3;
  if (![v3 isActivated]) {
    goto LABEL_8;
  }
  id v4 = [v3 exitState];
  if (v4 == (id)2)
  {
    int64_t v5 = 4;
    goto LABEL_9;
  }
  if (v4 != (id)1)
  {
    if (!v4)
    {
      if ([v3 areSomeUsersExiting]) {
        int64_t v5 = 3;
      }
      else {
        int64_t v5 = 0;
      }
      goto LABEL_9;
    }
LABEL_8:
    int64_t v5 = 0;
    goto LABEL_9;
  }
  if ([v3 scopeType] == (id)4) {
    int64_t v5 = 2;
  }
  else {
    int64_t v5 = 1;
  }
LABEL_9:

  return v5;
}

- (void)_checkExitSupervisorInTransaction:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(CPLEngineStore *)self->_store scopes];
  id v6 = [(CPLEngineStore *)self->_store sharingScopeIdentifier];
  v15 = v5;
  if (v6)
  {
    id v7 = [v5 scopeWithIdentifier:v6];
    if (v7)
    {
      id v8 = [v5 scopeChangeForScope:v7];
      if (v8) {
        int64_t v9 = [(CPLEngineLibrarySupervisor *)self _supervisorExitStateForScopeChange:v8];
      }
      else {
        int64_t v9 = 0;
      }
      dispatch_time_t v10 = v4;
    }
    else
    {
      dispatch_time_t v10 = v4;
      int64_t v9 = 0;
    }
  }
  else
  {
    dispatch_time_t v10 = v4;
    int64_t v9 = 0;
    id v7 = 0;
  }
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x2020000000;
  char v34 = 0;
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x3032000000;
  v29[3] = sub_100031BE0;
  v29[4] = sub_100031BF0;
  id v30 = 0;
  p_lock = &self->_lock;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  char v21 = sub_1000327F8;
  v22 = &unk_100277400;
  uint64_t v23 = self;
  id v12 = v6;
  int64_t v28 = v9;
  id v24 = v12;
  id v26 = &v31;
  id v13 = v7;
  id v25 = v13;
  v27 = v29;
  objc_super v14 = v20;
  os_unfair_lock_lock(p_lock);
  v21((uint64_t)v14);
  os_unfair_lock_unlock(p_lock);

  if (*((unsigned char *)v32 + 24))
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    void v16[2] = sub_100032AA0;
    v16[3] = &unk_100277428;
    id v17 = v15;
    v19 = v29;
    id v18 = v13;
    [v10 do:v16];
  }
  _Block_object_dispose(v29, 8);

  _Block_object_dispose(&v31, 8);
}

- (void)_checkExitSupervisor
{
  store = self->_store;
  v4[4] = self;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100032B70;
  v5[3] = &unk_1002773D8;
  v5[4] = self;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100032B7C;
  v4[3] = &unk_1002773D8;
  id v3 = [(CPLEngineStore *)store performWriteTransactionWithBlock:v5 completionHandler:v4];
}

- (void)_storeSupervisorInfoInTransaction:(id)a3
{
  id v4 = a3;
  uint64_t v20 = 0;
  char v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = sub_100031BE0;
  id v24 = sub_100031BF0;
  id v25 = 0;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = sub_100031BE0;
  v18[4] = sub_100031BF0;
  id v19 = 0;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  id v13 = sub_100032DD8;
  objc_super v14 = &unk_100277450;
  v15 = self;
  v16 = &v20;
  id v17 = v18;
  int64_t v5 = v12;
  os_unfair_lock_lock(&self->_lock);
  v13(v5);
  os_unfair_lock_unlock(&self->_lock);

  if (v21[5])
  {
    id v6 = [(CPLEngineStore *)self->_store scopes];
    id v7 = [v6 scopeWithIdentifier:v21[5]];
    if (v7)
    {
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_100032E4C;
      v8[3] = &unk_100277428;
      id v9 = v6;
      BOOL v11 = v18;
      id v10 = v7;
      [v4 do:v8];
    }
  }
  _Block_object_dispose(v18, 8);

  _Block_object_dispose(&v20, 8);
}

- (void)scopeStorage:(id)a3 didUpdateScopeChange:(id)a4 forScope:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v10 scopeIdentifier];
  id v12 = [(CPLEngineStore *)self->_store sharingScopeIdentifier];
  unint64_t v13 = (unint64_t)v12;
  if (v11 && v12)
  {
    unsigned __int8 v14 = [(id)v11 isEqual:v12];

    if ((v14 & 1) == 0) {
      goto LABEL_9;
    }
  }
  else
  {

    if (v11 | v13) {
      goto LABEL_9;
    }
  }
  uint64_t v27 = 0;
  int64_t v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 0;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  char v21 = sub_1000330C8;
  uint64_t v22 = &unk_100277478;
  uint64_t v23 = self;
  id v25 = &v27;
  int64_t v26 = [(CPLEngineLibrarySupervisor *)self _supervisorExitStateForScopeChange:v9];
  id v24 = v9;
  v15 = v20;
  os_unfair_lock_lock(&self->_lock);
  v21((uint64_t)v15);
  os_unfair_lock_unlock(&self->_lock);

  if (*((unsigned char *)v28 + 24))
  {
    store = self->_store;
    v18[4] = self;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100033150;
    v19[3] = &unk_1002773D8;
    v19[4] = self;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1000331B0;
    v18[3] = &unk_1002773D8;
    id v17 = [(CPLEngineStore *)store performWriteTransactionWithBlock:v19 completionHandler:v18];
  }

  _Block_object_dispose(&v27, 8);
LABEL_9:
}

- (void)scopeStorage:(id)a3 didDropSharingScopeIdentifier:(id)a4
{
}

- (void)scopeStorage:(id)a3 didStoreSharingScopeIdentifier:(id)a4
{
}

- (void)scopeUpdateTaskDidFinishSuccessfully:(id)a3
{
}

- (void)transportNotedServerHasChanges:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  uint64_t v11 = sub_10003337C;
  id v12 = &unk_1002768A8;
  unint64_t v13 = self;
  unsigned __int8 v14 = &v15;
  int64_t v5 = v10;
  os_unfair_lock_lock(&self->_lock);
  v11((uint64_t)v5);
  os_unfair_lock_unlock(&self->_lock);

  if (*((unsigned char *)v16 + 24))
  {
    store = self->_store;
    void v8[4] = self;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10003358C;
    v9[3] = &unk_1002773D8;
    v9[4] = self;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000335EC;
    v8[3] = &unk_1002773D8;
    id v7 = [(CPLEngineStore *)store performWriteTransactionWithBlock:v9 completionHandler:v8];
  }
  _Block_object_dispose(&v15, 8);
}

- (void)_sendExitFeedbackForSupervisor:(id)a3 cloudKitScope:(id)a4 exitState:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  queue = self->_queue;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  void v16[2] = sub_10003373C;
  v16[3] = &unk_100275CC8;
  void v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  int64_t v19 = a5;
  uint64_t v11 = v16;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003575C;
  block[3] = &unk_100275DF8;
  id v21 = v11;
  id v12 = queue;
  id v13 = v9;
  id v14 = v8;
  dispatch_block_t v15 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v12, v15);
}

- (void)_launchForcedExitForSupervisor:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  void v10[2] = sub_100033F30;
  v10[3] = &unk_100276018;
  v10[4] = self;
  id v11 = v4;
  id v6 = v10;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003575C;
  block[3] = &unk_100275DF8;
  id v13 = v6;
  id v7 = queue;
  id v8 = v4;
  dispatch_block_t v9 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v7, v9);
}

- (void)pause
{
  queue = self->_queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100034964;
  v6[3] = &unk_100275EA0;
  v6[4] = self;
  id v3 = v6;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003575C;
  block[3] = &unk_100275DF8;
  id v8 = v3;
  id v4 = queue;
  dispatch_block_t v5 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v4, v5);
}

- (void)resume
{
  queue = self->_queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100034ABC;
  v6[3] = &unk_100275EA0;
  v6[4] = self;
  id v3 = v6;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003575C;
  block[3] = &unk_100275DF8;
  id v8 = v3;
  id v4 = queue;
  dispatch_block_t v5 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v4, v5);
}

- (void)ping
{
  p_lock = &self->_lock;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  id v6 = sub_100034BB8;
  id v7 = &unk_100275EA0;
  id v8 = self;
  id v4 = v5;
  os_unfair_lock_lock(p_lock);
  v6((uint64_t)v4);
  os_unfair_lock_unlock(p_lock);

  [(CPLEngineLibrarySupervisor *)self _scheduleOrLaunchIfNecessary];
}

- (NSString)status
{
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = sub_100031BE0;
  dispatch_block_t v15 = sub_100031BF0;
  id v16 = 0;
  p_lock = &self->_lock;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  id v7 = sub_100034D0C;
  id v8 = &unk_100275F88;
  dispatch_block_t v9 = self;
  id v10 = &v11;
  id v3 = v6;
  os_unfair_lock_lock(p_lock);
  v7((uint64_t)v3);
  os_unfair_lock_unlock(p_lock);

  id v4 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return (NSString *)v4;
}

- (CPLEngineLibrary)engineLibrary
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_engineLibrary);
  return (CPLEngineLibrary *)WeakRetained;
}

- (CPLEngineStore)store
{
  return self->_store;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_destroyWeak((id *)&self->_engineLibrary);
  objc_storeStrong((id *)&self->_nextRetryDate, 0);
  objc_storeStrong((id *)&self->_retryTimer, 0);
  objc_storeStrong((id *)&self->_sendExitStatusFeedback, 0);
  objc_storeStrong((id *)&self->_forceProcessingStagedScopesTask, 0);
  objc_storeStrong((id *)&self->_exitSupervisor, 0);
}

@end