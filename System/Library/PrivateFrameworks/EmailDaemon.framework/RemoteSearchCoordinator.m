@interface RemoteSearchCoordinator
- (RemoteSearchCoordinator)initWithAccount:(id)a3 searchContext:(id)a4 logIdentifier:(id)a5 progress:(id)a6;
- (id)createSearchOperationForMailbox:(id)a3 logPrefix:(id)a4;
- (id)foundMessages;
- (id)nextSearchableMailbox;
- (id)stopEarly;
- (void)_addAllSearchOperations;
- (void)cancel;
- (void)performSearch;
- (void)remoteSearchOperation:(id)a3 didFindResults:(BOOL)a4;
- (void)setFoundMessages:(id)a3;
- (void)setNextSearchableMailbox:(id)a3;
- (void)setStopEarly:(id)a3;
@end

@implementation RemoteSearchCoordinator

- (RemoteSearchCoordinator)initWithAccount:(id)a3 searchContext:(id)a4 logIdentifier:(id)a5 progress:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v34.receiver = self;
  v34.super_class = (Class)RemoteSearchCoordinator;
  v15 = [(RemoteSearchCoordinator *)&v34 init];
  v16 = v15;
  v17 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_account, a3);
    objc_storeStrong((id *)&v16->_searchContext, a4);
    [v11 uniqueID];
    id v31 = v14;
    id v32 = v13;
    v30 = id v33 = v11;
    id v18 = [v12 sessionID];
    unsigned int v19 = [v12 useLocalIndex];
    id v20 = v13;
    id v21 = v30;
    v22 = v21;
    if ((unint64_t)[v21 length] >= 9)
    {
      uint64_t v23 = [v21 substringToIndex:8];

      v22 = (void *)v23;
    }
    v24 = "R";
    if (v19) {
      v24 = "L";
    }
    if (v20) {
      +[NSString stringWithFormat:@"%@-%@-%s#%lu", v20, v22, v24, v18];
    }
    else {
    uint64_t v25 = +[NSString stringWithFormat:@"%@-%s#%lu", v22, v24, v18];
    }

    logPrefix = v17->_logPrefix;
    v17->_logPrefix = (NSString *)v25;

    objc_storeStrong((id *)&v16->_progress, a6);
    id v13 = v32;
    id v11 = v33;
    id v14 = v31;
    uint64_t v27 = objc_opt_new();
    workQueue = v17->_workQueue;
    v17->_workQueue = (NSOperationQueue *)v27;

    [(NSOperationQueue *)v17->_workQueue setName:@"com.apple.mobilemail.remotesearchcoordinator.workqueue"];
    [(NSOperationQueue *)v17->_workQueue setMaxConcurrentOperationCount:4];
    [(NSOperationQueue *)v17->_workQueue setQualityOfService:25];
  }

  return v17;
}

- (void)performSearch
{
  if (self) {
    progress = self->_progress;
  }
  else {
    progress = 0;
  }
  v4 = progress;
  v5 = MFLogGeneral();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    if (self) {
      logPrefix = self->_logPrefix;
    }
    else {
      logPrefix = 0;
    }
    v7 = logPrefix;
    unsigned int v8 = [(NSProgress *)v4 totalUnitCount];
    if (self) {
      searchContext = self->_searchContext;
    }
    else {
      searchContext = 0;
    }
    int v16 = 138543874;
    v17 = v7;
    __int16 v18 = 1024;
    unsigned int v19 = v8;
    __int16 v20 = 1024;
    unsigned int v21 = [(SourceSearchContext *)searchContext useLocalIndex];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#search-manager [%{public}@] Begin %u remote searches (useLocalIndex=%{BOOL}d)", (uint8_t *)&v16, 0x18u);
  }
  kdebug_trace();
  [(RemoteSearchCoordinator *)self _addAllSearchOperations];
  if (self) {
    workQueue = self->_workQueue;
  }
  else {
    workQueue = 0;
  }
  [(NSOperationQueue *)workQueue waitUntilAllOperationsAreFinished];
  kdebug_trace();
  id v11 = MFLogGeneral();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    if (self)
    {
      id v12 = self->_logPrefix;
      BOOL cancelled = self->_cancelled;
    }
    else
    {
      id v12 = 0;
      BOOL cancelled = 0;
    }
    unsigned int v14 = [(NSProgress *)v4 completedUnitCount];
    unsigned int v15 = [(NSProgress *)v4 totalUnitCount];
    int v16 = 138544130;
    v17 = v12;
    __int16 v18 = 1024;
    unsigned int v19 = cancelled;
    __int16 v20 = 1024;
    unsigned int v21 = v14;
    __int16 v22 = 1024;
    unsigned int v23 = v15;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#search-manager [%{public}@] cancelled: %{BOOL}d, %u/%u remote searches", (uint8_t *)&v16, 0x1Eu);
  }
}

- (void)cancel
{
  if (self)
  {
    self->_BOOL cancelled = 1;
    self = (RemoteSearchCoordinator *)self->_workQueue;
  }
  [(RemoteSearchCoordinator *)self cancelAllOperations];
}

- (void)remoteSearchOperation:(id)a3 didFindResults:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v4)
  {
    if (self) {
      self->_foundResults = 1;
    }
  }
  else
  {
    v7 = +[MFActivityMonitor currentMonitor];
    unsigned int v8 = [v7 error];
    if (v8)
    {
      v9 = MFLogGeneral();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        if (self) {
          logPrefix = self->_logPrefix;
        }
        else {
          logPrefix = 0;
        }
        id v11 = logPrefix;
        id v12 = sub_1000B7AE0((uint64_t)v6);
        id v13 = objc_msgSend(v12, "ef_publicDescription");
        int v14 = 138543874;
        unsigned int v15 = v11;
        __int16 v16 = 2114;
        v17 = v13;
        __int16 v18 = 2112;
        unsigned int v19 = v8;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#search-manager [%{public}@] mailbox %{public}@: Monitor error: %@", (uint8_t *)&v14, 0x20u);
      }
    }
  }
}

- (void)_addAllSearchOperations
{
  v3 = [(RemoteSearchCoordinator *)self nextSearchableMailbox];
  if (v3)
  {
    int v4 = -1;
    do
    {
      if (v4 == 199) {
        break;
      }
      if (self) {
        logPrefix = self->_logPrefix;
      }
      else {
        logPrefix = 0;
      }
      v7 = logPrefix;
      unsigned int v8 = +[NSString stringWithFormat:@"%@.%u", v7, (v4 + 2)];

      v9 = v3[2](v3);
      v10 = [(RemoteSearchCoordinator *)self createSearchOperationForMailbox:v9 logPrefix:v8];
      if (v10)
      {
        if (self) {
          workQueue = self->_workQueue;
        }
        else {
          workQueue = 0;
        }
        id v12 = workQueue;
        [(NSOperationQueue *)v12 addOperation:v10];
      }
      ++v4;
    }
    while (v10);
    id v13 = MFLogGeneral();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      if (self) {
        int v14 = self->_logPrefix;
      }
      else {
        int v14 = 0;
      }
      *(_DWORD *)buf = 138543618;
      __int16 v16 = v14;
      __int16 v17 = 1024;
      int v18 = v4;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "#search-manager [%{public}@]: Did create %u search operation(s).", buf, 0x12u);
    }
  }
}

- (id)createSearchOperationForMailbox:(id)a3 logPrefix:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    if (self) {
      progress = self->_progress;
    }
    else {
      progress = 0;
    }
    v9 = +[NSProgress progressWithTotalUnitCount:1 parent:progress pendingUnitCount:1];
    v10 = [RemoteSearchOperation alloc];
    if (self)
    {
      id v11 = self->_searchContext;
      searchContext = self->_searchContext;
    }
    else
    {
      id v11 = 0;
      searchContext = 0;
    }
    id v13 = searchContext;
    int v14 = sub_1000B7748((id *)&v10->super.super.isa, v6, v11, v7, v9, self, [(SourceSearchContext *)v13 useLocalIndex]);

    unsigned int v15 = [(RemoteSearchCoordinator *)self foundMessages];
    sub_1000B8C54(v14, v15);

    __int16 v16 = [(RemoteSearchCoordinator *)self stopEarly];
    sub_1000B8C6C(v14, v16);
  }
  else
  {
    int v14 = 0;
  }

  return v14;
}

- (id)nextSearchableMailbox
{
  return self->_nextSearchableMailbox;
}

- (void)setNextSearchableMailbox:(id)a3
{
}

- (id)foundMessages
{
  return self->_foundMessages;
}

- (void)setFoundMessages:(id)a3
{
}

- (id)stopEarly
{
  return self->_stopEarly;
}

- (void)setStopEarly:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_logPrefix, 0);
  objc_storeStrong((id *)&self->_searchContext, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong(&self->_stopEarly, 0);
  objc_storeStrong(&self->_foundMessages, 0);

  objc_storeStrong(&self->_nextSearchableMailbox, 0);
}

@end