@interface MFFetchProcessor
+ (id)intelligentSkeletonFetchProcessor;
+ (id)mailboxes:(id)a3 sortedByDate:(id)a4;
+ (id)mailboxesSortedByLastFetchDate:(id)a3;
+ (id)powernapProcessor;
+ (id)processorWithName:(id)a3 condition:(id)a4;
+ (id)sortedMailboxesInArrayWithMailboxes:(id)a3 ranking:(id)a4;
+ (void)initialize;
- (BOOL)_processEligibleMailboxesAndWait;
- (BOOL)_runSynchronously:(int64_t)a3;
- (BOOL)includeFavoritesMailboxes;
- (BOOL)includePushedMailboxes;
- (BOOL)loadMessageBodies;
- (BOOL)useMailboxFrecencyRanking;
- (FavoritesPersistence)favoritesPersistence;
- (MFActivityCondition)condition;
- (MFFetchProcessor)initWithName:(id)a3 condition:(id)a4;
- (NSArray)excludedMailboxTypes;
- (NSSet)accounts;
- (NSString)name;
- (OS_dispatch_semaphore)finishedProcessing;
- (OS_dispatch_semaphore)requestLimiter;
- (id)_mailboxesToFetch;
- (id)_observeChangesInConditions;
- (int64_t)accountMailboxesBatchSize;
- (int64_t)lastFetchDateCutoff;
- (unint64_t)loadNumOlderMessages;
- (unint64_t)maximumMailboxesToFetch;
- (unint64_t)numberOfMailboxesFetched;
- (void)_cancelCurrentInvocations;
- (void)_fetchCompleted:(id)a3;
- (void)_finishRequest;
- (void)_setRequestLimiterLimit:(unint64_t)a3;
- (void)dealloc;
- (void)runSynchronouslyWithDuration:(double)a3;
- (void)setAccountMailboxesBatchSize:(int64_t)a3;
- (void)setAccounts:(id)a3;
- (void)setCondition:(id)a3;
- (void)setExcludedMailboxTypes:(id)a3;
- (void)setFavoritesPersistence:(id)a3;
- (void)setFinishedProcessing:(id)a3;
- (void)setIncludeFavoritesMailboxes:(BOOL)a3;
- (void)setIncludePushedMailboxes:(BOOL)a3;
- (void)setLastFetchDateCutoff:(int64_t)a3;
- (void)setLoadMessageBodies:(BOOL)a3;
- (void)setLoadNumOlderMessages:(unint64_t)a3;
- (void)setMaximumMailboxesToFetch:(unint64_t)a3;
- (void)setRequestLimiter:(id)a3;
- (void)setUseMailboxFrecencyRanking:(BOOL)a3;
@end

@implementation MFFetchProcessor

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    id v2 = objc_alloc_init((Class)NSMutableSet);
    v3 = (void *)qword_10016BB08;
    qword_10016BB08 = (uint64_t)v2;

    v4 = +[NSProcessInfo processInfo];
    int v5 = [v4 processorCount];

    if (v5 <= 1) {
      uint64_t v6 = 1;
    }
    else {
      uint64_t v6 = v5;
    }
    qword_10016BB10 = v6;
  }
}

- (MFFetchProcessor)initWithName:(id)a3 condition:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v26.receiver = self;
  v26.super_class = (Class)MFFetchProcessor;
  v8 = [(MFFetchProcessor *)&v26 init];
  if (v8)
  {
    v9 = (NSString *)[v6 copy];
    name = v8->_name;
    v8->_name = v9;

    if (v7)
    {
      v11 = (MFActivityCondition *)v7;
    }
    else
    {
      v11 = +[MFActivityCondition alwaysSatisfiedCondition];
    }
    condition = v8->_condition;
    v8->_condition = v11;

    v13 = (MFInvocationQueue *)[objc_alloc((Class)MFInvocationQueue) initWithMaxThreadCount:1];
    workQueue = v8->_workQueue;
    v8->_workQueue = v13;

    dispatch_queue_t v15 = dispatch_queue_create("com.apple.mobilemail.fetchProcessor.state", 0);
    stateQueue = v8->_stateQueue;
    v8->_stateQueue = (OS_dispatch_queue *)v15;

    v17 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    failedMailboxes = v8->_failedMailboxes;
    v8->_failedMailboxes = v17;

    v19 = (NSCountedSet *)objc_alloc_init((Class)NSCountedSet);
    mailboxFetchCounts = v8->_mailboxFetchCounts;
    v8->_mailboxFetchCounts = v19;

    v21 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    currentInvocations = v8->_currentInvocations;
    v8->_currentInvocations = v21;

    unint64_t v23 = qword_10016BB10;
    v8->_accountMailboxesBatchSize = 2 * qword_10016BB10;
    v8->_lastFetchDateCutoff = 900;
    uint64_t v24 = 1;
    if (v23 > 2) {
      uint64_t v24 = 2;
    }
    v8->_requestLimiterLimit = v24;
  }

  return v8;
}

- (void)dealloc
{
  [(EFCancelationToken *)self->_cancelationToken cancel];
  v3.receiver = self;
  v3.super_class = (Class)MFFetchProcessor;
  [(MFFetchProcessor *)&v3 dealloc];
}

+ (id)processorWithName:(id)a3 condition:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [[MFFetchProcessor alloc] initWithName:v5 condition:v6];

  return v7;
}

+ (id)powernapProcessor
{
  id v2 = [objc_alloc((Class)MFActivityCondition) initWithBuilder:&stru_10013C250];
  objc_super v3 = +[MFFetchProcessor processorWithName:@"com.apple.mobilemail.fetch.powernap" condition:v2];
  [v3 setExcludedMailboxTypes:&off_100146550];
  [v3 setIncludePushedMailboxes:1];
  [v3 setIncludeFavoritesMailboxes:1];
  [v3 setLoadMessageBodies:1];
  [v3 setLoadNumOlderMessages:500];
  [v3 setMaximumMailboxesToFetch:50];

  return v3;
}

+ (id)intelligentSkeletonFetchProcessor
{
  id v2 = [objc_alloc((Class)MFActivityCondition) initWithBuilder:&stru_10013C270];
  objc_super v3 = +[MFFetchProcessor processorWithName:@"com.apple.mobilemail.fetch.intelligentBackgroundFetch" condition:v2];
  [v3 setExcludedMailboxTypes:&off_100146568];
  [v3 setIncludePushedMailboxes:0];
  [v3 setLoadMessageBodies:0];
  [v3 setUseMailboxFrecencyRanking:1];

  return v3;
}

- (void)_setRequestLimiterLimit:(unint64_t)a3
{
  self->_requestLimiterLimit = a3;
}

- (void)runSynchronouslyWithDuration:(double)a3
{
  self->_stopTime = CFAbsoluteTimeGetCurrent() + a3;

  [(MFFetchProcessor *)self _runSynchronously:0x7FFFFFFFFFFFFFFFLL];
}

- (BOOL)_runSynchronously:(int64_t)a3
{
  id v5 = (id)qword_10016BB08;
  objc_sync_enter(v5);
  uint64_t v6 = qword_10016BB08;
  id v7 = [(MFFetchProcessor *)self name];
  LOBYTE(v6) = [(id)v6 containsObject:v7];

  if (v6)
  {
    objc_sync_exit(v5);

    v8 = MFAutoFetchLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = [(MFFetchProcessor *)self name];
      int v26 = 138412290;
      double v27 = *(double *)&v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Canceling fetch %@ because one with the same name is currently running", (uint8_t *)&v26, 0xCu);
    }
    return 0;
  }
  else
  {
    v11 = (void *)qword_10016BB08;
    v12 = [(MFFetchProcessor *)self name];
    [v11 addObject:v12];

    objc_sync_exit(v5);
    v13 = (EFCancelationToken *)objc_alloc_init((Class)EFCancelationToken);
    cancelationToken = self->_cancelationToken;
    self->_cancelationToken = v13;

    dispatch_queue_t v15 = self->_cancelationToken;
    v16 = [(MFFetchProcessor *)self _observeChangesInConditions];
    [(EFCancelationToken *)v15 addCancelable:v16];

    double Current = CFAbsoluteTimeGetCurrent();
    int64_t v18 = 0;
    while ([(MFFetchProcessor *)self _processEligibleMailboxesAndWait])
    {
      if (a3 == ++v18)
      {
        int64_t v18 = a3;
        break;
      }
    }
    double v19 = CFAbsoluteTimeGetCurrent();
    v20 = MFAutoFetchLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      id v21 = [(NSCountedSet *)self->_mailboxFetchCounts count];
      v22 = [(NSCountedSet *)self->_mailboxFetchCounts descriptionWithLocale:0];
      int v26 = 134218498;
      double v27 = v19 - Current;
      __int16 v28 = 2048;
      id v29 = v21;
      __int16 v30 = 2112;
      v31 = v22;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Finished powernap fetch. Duration: %.2fs Mailboxes fetched (%lu): %@", (uint8_t *)&v26, 0x20u);
    }
    id v23 = (id)qword_10016BB08;
    objc_sync_enter(v23);
    uint64_t v24 = (void *)qword_10016BB08;
    v25 = [(MFFetchProcessor *)self name];
    [v24 removeObject:v25];

    objc_sync_exit(v23);
    return v18 > 0;
  }
}

- (BOOL)_processEligibleMailboxesAndWait
{
  v52 = [(MFFetchProcessor *)self _mailboxesToFetch];
  if (![v52 count])
  {
    id v29 = MFAutoFetchLog();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "Ending powernap fetch because no eligible mailboxes were found", (uint8_t *)&buf, 2u);
    }

    BOOL v30 = 0;
    goto LABEL_43;
  }
  id v5 = [(MFFetchProcessor *)self requestLimiter];

  if (v5)
  {
    v42 = +[NSAssertionHandler currentHandler];
    [v42 handleFailureInMethod:a2 object:self file:@"MFFetchProcessor.m" lineNumber:184 description:@"_processEligibleMailboxesAndWait is being re-entered"];
  }
  dispatch_semaphore_t v6 = dispatch_semaphore_create(self->_requestLimiterLimit);
  [(MFFetchProcessor *)self setRequestLimiter:v6];

  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  [(MFFetchProcessor *)self setFinishedProcessing:v7];

  v8 = [v52 count];
  self->_numberOfRemainingRequestsToProcess = (unint64_t)v8;
  v9 = MFAutoFetchLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = [v52 count];
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "powernap: start processing %lu mailboxes", (uint8_t *)&buf, 0xCu);
  }
  v45 = v8;

  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id obj = v52;
  v10 = (char *)[obj countByEnumeratingWithState:&v57 objects:v65 count:16];
  if (!v10)
  {
    v46 = 0;
    goto LABEL_42;
  }
  uint64_t v51 = *(void *)v58;
  uint64_t v47 = MonitoredActivityEnded;
  v11 = &selRef_password;
  v12 = &selRef_setRemoteClientsProvider_;
  id v13 = 0;
  while (2)
  {
    unint64_t v14 = 0;
    v50 = v11[244];
    v49 = v12[412];
    v44 = (char *)v13;
    v46 = &v10[(void)v13];
    v43 = (unsigned char *)(v45 - v10);
    do
    {
      if (*(void *)v58 != v51) {
        objc_enumerationMutation(obj);
      }
      dispatch_queue_t v15 = *(void **)(*((void *)&v57 + 1) + 8 * v14);
      v16 = [(MFFetchProcessor *)self requestLimiter];
      dispatch_semaphore_wait(v16, 0xFFFFFFFFFFFFFFFFLL);

      v17 = [(MFFetchProcessor *)self condition];
      unsigned __int8 v18 = [v17 isSatisfied];

      if ((v18 & 1) == 0)
      {
        v31 = MFAutoFetchLog();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Stopping powernap fetch because requirements are no longer met", (uint8_t *)&buf, 2u);
        }

        stateQueue = self->_stateQueue;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10006D954;
        block[3] = &unk_100139BA8;
        block[4] = self;
        block[5] = &v45[~v14];
        dispatch_sync(stateQueue, block);
        [(MFFetchProcessor *)self _finishRequest];
        goto LABEL_41;
      }
      if (self->_stopTime != 0.0 && CFAbsoluteTimeGetCurrent() >= self->_stopTime)
      {
        v35 = MFAutoFetchLog();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Stopping fetch processor because time limit was exceeded", (uint8_t *)&buf, 2u);
        }

        v36 = self->_stateQueue;
        v55[0] = _NSConcreteStackBlock;
        v55[1] = 3221225472;
        v55[2] = sub_10006D968;
        v55[3] = &unk_100139BA8;
        v55[4] = self;
        v55[5] = &v45[~v14];
        dispatch_sync(v36, v55);
        [(MFFetchProcessor *)self _finishRequest];
        goto LABEL_41;
      }
      uint64_t v61 = 0;
      v62 = &v61;
      uint64_t v63 = 0x2020000000;
      char v64 = 1;
      dispatch_semaphore_t v19 = dispatch_semaphore_create(0);
      v20 = +[MFDiskFreeSpaceMonitor defaultMonitor];
      *(void *)&long long buf = _NSConcreteStackBlock;
      *((void *)&buf + 1) = 3221225472;
      v67 = sub_10006F2CC;
      v68 = &unk_10013C360;
      v70 = &v61;
      id v21 = v19;
      v69 = v21;
      [v20 getFreeSpaceStatusWithCompletionHandler:&buf];

      dispatch_semaphore_wait(v21, 0xFFFFFFFFFFFFFFFFLL);
      LODWORD(v19) = *((unsigned char *)v62 + 24) == 0;

      _Block_object_dispose(&v61, 8);
      if (v19)
      {
        v33 = MFAutoFetchLog();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Ending powernap fetch because disk is almost full", (uint8_t *)&buf, 2u);
        }

        v34 = self->_stateQueue;
        v54[0] = _NSConcreteStackBlock;
        v54[1] = 3221225472;
        v54[2] = sub_10006D97C;
        v54[3] = &unk_100139BA8;
        v54[4] = self;
        v54[5] = &v45[~v14];
        dispatch_sync(v34, v54);
        [(MFFetchProcessor *)self _finishRequest];
        goto LABEL_41;
      }
      if (self->_maximumMailboxesToFetch
        && (unint64_t)[(NSCountedSet *)self->_mailboxFetchCounts count] >= self->_maximumMailboxesToFetch)
      {
        v37 = MFAutoFetchLog();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Ending powernap fetch because we have hit the maximum number of mailboxes to fetch", (uint8_t *)&buf, 2u);
        }

        v38 = self->_stateQueue;
        v53[0] = _NSConcreteStackBlock;
        v53[1] = 3221225472;
        v53[2] = sub_10006D990;
        v53[3] = &unk_100139BA8;
        v53[4] = self;
        v53[5] = &v45[~v14];
        dispatch_sync(v38, v53);
        [(MFFetchProcessor *)self _finishRequest];
LABEL_41:
        v46 = &v44[v14];
        goto LABEL_42;
      }
      id v22 = [[AutoFetchRequestPrivate alloc] initRequestForMailboxUid:v15];
      [v22 setIsPowernapFetch:1];
      [v22 setShouldCompact:1];
      [v22 setIsVisibleFetch:0];
      [v22 setIsUserRequested:0];
      [v22 setDownloadAllMessages:0];
      [v22 setIsForegroundRequest:0];
      unsigned int v23 = [(MFFetchProcessor *)self loadMessageBodies];
      if (v23)
      {
        id v2 = [v15 account];
        objc_opt_class();
        int v24 = objc_opt_isKindOfClass() ^ 1;
      }
      else
      {
        LOBYTE(v24) = 0;
      }
      [v22 setShouldLoadMessageBody:v24 & 1];
      if (v23) {

      }
      objc_msgSend(v22, "setLoadNumOlderMessages:", -[MFFetchProcessor loadNumOlderMessages](self, "loadNumOlderMessages"));
      [v22 setShouldGrowFetchWindow:1];
      [v22 setCloseConnection:1];
      [v22 setDontNotify:1];
      v25 = +[MFMonitoredInvocation invocationWithSelector:v50 target:v22 taskName:0 priority:8 canBeCancelled:1];
      int v26 = self->_currentInvocations;
      objc_sync_enter(v26);
      [(NSMutableSet *)self->_currentInvocations addObject:v25];
      double v27 = +[NSNotificationCenter defaultCenter];
      __int16 v28 = [v25 monitor];
      [v27 addObserver:self selector:v49 name:v47 object:v28];

      objc_sync_exit(v26);
      [(MFInvocationQueue *)self->_workQueue addInvocation:v25];
      [(NSCountedSet *)self->_mailboxFetchCounts addObject:v15];

      ++v14;
    }
    while (v10 != (char *)v14);
    v10 = (char *)[obj countByEnumeratingWithState:&v57 objects:v65 count:16];
    id v13 = v46;
    v45 = v43;
    v11 = &selRef_password;
    v12 = &selRef_setRemoteClientsProvider_;
    if (v10) {
      continue;
    }
    break;
  }
LABEL_42:

  v39 = [(MFFetchProcessor *)self finishedProcessing];
  dispatch_semaphore_wait(v39, 0xFFFFFFFFFFFFFFFFLL);

  [(MFFetchProcessor *)self setFinishedProcessing:0];
  [(MFFetchProcessor *)self setRequestLimiter:0];
  v40 = +[MailPersistentStorage sharedStorage];
  [v40 save];

  BOOL v30 = v46 == [obj count];
LABEL_43:

  return v30;
}

- (id)_observeChangesInConditions
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  objc_super v3 = [(MFFetchProcessor *)self condition];
  v4 = [v3 conditionsObservable];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10006DACC;
  v7[3] = &unk_10013C298;
  objc_copyWeak(&v8, &location);
  id v5 = [v4 subscribeWithResultBlock:v7];
  objc_destroyWeak(&v8);

  objc_destroyWeak(&location);

  return v5;
}

- (void)_cancelCurrentInvocations
{
  dispatch_queue_t v15 = self->_currentInvocations;
  objc_sync_enter(v15);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = self->_currentInvocations;
  id v3 = [(NSMutableSet *)obj countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v3)
  {
    uint64_t v17 = *(void *)v19;
    uint64_t v4 = MonitoredActivityEnded;
    do
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v19 != v17) {
          objc_enumerationMutation(obj);
        }
        dispatch_semaphore_t v6 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        dispatch_semaphore_t v7 = +[NSNotificationCenter defaultCenter];
        id v8 = [v6 monitor];
        [v7 removeObserver:self name:v4 object:v8];

        v9 = [v6 target];
        v10 = MFLogGeneral();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          v11 = [v9 mailbox];
          v12 = [v11 account];
          id v13 = objc_msgSend(v12, "ef_publicDescription");
          *(_DWORD *)long long buf = 138543362;
          unsigned int v23 = v13;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Canceling in-flight fetch for %{public}@", buf, 0xCu);
        }
        unint64_t v14 = [v6 monitor];
        [v14 cancel];

        [(MFFetchProcessor *)self _finishRequest];
      }
      id v3 = [(NSMutableSet *)obj countByEnumeratingWithState:&v18 objects:v24 count:16];
    }
    while (v3);
  }

  [(NSMutableSet *)self->_currentInvocations removeAllObjects];
  objc_sync_exit(v15);
}

- (void)_finishRequest
{
  id v3 = [(MFFetchProcessor *)self requestLimiter];
  uint64_t v4 = v3;
  if (v3) {
    dispatch_semaphore_signal(v3);
  }

  stateQueue = self->_stateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006DEB8;
  block[3] = &unk_100139C48;
  block[4] = self;
  dispatch_sync(stateQueue, block);
}

- (void)_fetchCompleted:(id)a3
{
  id v4 = a3;
  id v5 = [v4 userInfo];
  dispatch_semaphore_t v6 = [v5 objectForKey:MonitoredActivityInvocation];

  dispatch_semaphore_t v7 = self->_currentInvocations;
  objc_sync_enter(v7);
  if ([(NSMutableSet *)self->_currentInvocations containsObject:v6])
  {
    id v8 = +[NSNotificationCenter defaultCenter];
    v9 = [v6 monitor];
    [v8 removeObserver:self name:MonitoredActivityEnded object:v9];

    [(NSMutableSet *)self->_currentInvocations removeObject:v6];
    objc_sync_exit(v7);

    dispatch_semaphore_t v7 = [v6 target];
    v10 = [(NSMutableSet *)v7 mailbox];
    if ([(NSMutableSet *)v7 _fetchedSuccessfully])
    {
      MFAutoFetchLog();
      v11 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v11->super.super, OS_LOG_TYPE_INFO))
      {
        long long v21 = [v10 account];
        id v23 = [v21 loggingIdentifier];
        id v22 = [v10 name];
        v12 = +[MFMailMessageLibrary defaultInstance];
        id v13 = [v10 URLString];
        unsigned int v14 = [v12 totalCountForMailbox:v13];
        dispatch_queue_t v15 = [v10 store];
        *(_DWORD *)long long buf = 138413314;
        id v25 = v23;
        __int16 v26 = 2048;
        double v27 = v10;
        __int16 v28 = 2112;
        id v29 = v22;
        __int16 v30 = 1024;
        unsigned int v31 = v14;
        __int16 v32 = 2048;
        id v33 = [v15 serverMessageCount];
        _os_log_impl((void *)&_mh_execute_header, &v11->super.super, OS_LOG_TYPE_INFO, "powernap: %@ %p [%@ %d %lu]", buf, 0x30u);
      }
    }
    else
    {
      uint64_t v17 = MFAutoFetchLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        long long v18 = [v10 account];
        long long v19 = [v18 loggingIdentifier];
        long long v20 = [v10 name];
        *(_DWORD *)long long buf = 138412802;
        id v25 = v19;
        __int16 v26 = 2048;
        double v27 = v10;
        __int16 v28 = 2112;
        id v29 = v20;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "powernap: %@ %p [%@ FAIL]", buf, 0x20u);
      }
      v11 = self->_failedMailboxes;
      objc_sync_enter(v11);
      [(NSMutableSet *)self->_failedMailboxes addObject:v10];
      objc_sync_exit(v11);
    }

    [(MFFetchProcessor *)self _finishRequest];
  }
  else
  {
    v16 = MFAutoFetchLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "MFFetchProcessor: invocation canceled after notification fired", buf, 2u);
    }

    objc_sync_exit(v7);
  }
}

- (id)_mailboxesToFetch
{
  double v27 = +[NSMutableArray array];
  __int16 v26 = +[NSDate dateWithTimeIntervalSinceNow:(double)-self->_lastFetchDateCutoff];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = [(MFFetchProcessor *)self accounts];
  id v3 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v3)
  {
    uint64_t v25 = *(void *)v31;
    do
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v31 != v25) {
          objc_enumerationMutation(obj);
        }
        id v5 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        dispatch_semaphore_t v7 = [v5 allMailboxUids];
        id v8 = +[NSMutableSet setWithArray:v7];

        [v8 minusSet:self->_failedMailboxes];
        if (![(MFFetchProcessor *)self includePushedMailboxes])
        {
          v9 = [v5 pushedMailboxUids];
          [v8 minusSet:v9];
        }
        if (![(MFFetchProcessor *)self includeFavoritesMailboxes])
        {
          favoritesPersistence = self->_favoritesPersistence;
          if (favoritesPersistence)
          {
            v11 = [(FavoritesPersistence *)favoritesPersistence favoriteMailboxesForAccount:v5];
            [v8 minusSet:v11];
          }
        }
        v28[0] = _NSConcreteStackBlock;
        v28[1] = 3221225472;
        v28[2] = sub_10006E84C;
        v28[3] = &unk_10013C2C0;
        v28[4] = self;
        v28[5] = v5;
        id v29 = v26;
        v12 = [v8 objectsPassingTest:v28];
        [v8 minusSet:v12];

        id v13 = [v8 allObjects];
        if ([(MFFetchProcessor *)self useMailboxFrecencyRanking])
        {
          unsigned int v14 = +[MFMailMessageLibrary defaultInstance];
          dispatch_queue_t v15 = [v14 mailboxFrecencyController];

          v16 = [v15 sortedArrayOfMailboxesForAccount:v5];
          uint64_t v17 = [(id)objc_opt_class() sortedMailboxesInArrayWithMailboxes:v13 ranking:v16];

          id v13 = (void *)v17;
        }
        int64_t accountMailboxesBatchSize = self->_accountMailboxesBatchSize;
        signed int v19 = [v8 count];
        if (accountMailboxesBatchSize >= v19) {
          int64_t v20 = v19;
        }
        else {
          int64_t v20 = accountMailboxesBatchSize;
        }
        long long v21 = objc_msgSend(v13, "subarrayWithRange:", 0, v20);
        [v27 addObjectsFromArray:v21];
      }
      id v3 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v3);
  }

  id v22 = [(id)objc_opt_class() mailboxesSortedByLastFetchDate:v27];

  return v22;
}

- (unint64_t)numberOfMailboxesFetched
{
  return (unint64_t)[(NSCountedSet *)self->_mailboxFetchCounts count];
}

+ (id)sortedMailboxesInArrayWithMailboxes:(id)a3 ranking:(id)a4
{
  id v5 = a3;
  id v19 = a4;
  dispatch_semaphore_t v6 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v5 count]);
  dispatch_semaphore_t v7 = +[NSMutableIndexSet indexSetWithIndexesInRange:](NSMutableIndexSet, "indexSetWithIndexesInRange:", 0, [v5 count]);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v8 = v19;
  id v9 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v24;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v24 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        id v13 = [v5 indexOfObject:v12];
        if (v13 != (id)0x7FFFFFFFFFFFFFFFLL)
        {
          [v6 addObject:v12];
          [v7 removeIndex:v13];
        }
      }
      id v9 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v9);
  }

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10006EC38;
  v20[3] = &unk_10013C2E8;
  id v14 = v6;
  id v21 = v14;
  id v15 = v5;
  id v22 = v15;
  [v7 enumerateIndexesUsingBlock:v20];
  v16 = v22;
  id v17 = v14;

  return v17;
}

+ (id)mailboxesSortedByLastFetchDate:(id)a3
{
  id v4 = a3;
  +[MailPersistentStorage sharedStorage];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10006ED9C;
  v8[3] = &unk_10013C310;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = v9;
  dispatch_semaphore_t v6 = [a1 mailboxes:v4 sortedByDate:v8];

  return v6;
}

+ (id)mailboxes:(id)a3 sortedByDate:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ((unint64_t)[v5 count] > 1)
  {
    id v9 = (char *)[v5 count];
    uint64_t v10 = malloc_type_calloc((size_t)v9, 0x10uLL, 0x1000040451B5BE8uLL);
    id v15 = _NSConcreteStackBlock;
    uint64_t v16 = 3221225472;
    id v17 = sub_10006EFF4;
    long long v18 = &unk_10013C338;
    id v19 = v6;
    int64_t v20 = v10;
    [v5 enumerateObjectsUsingBlock:&v15];
    qsort(v10, (size_t)v9, 0x10uLL, (int (__cdecl *)(const void *, const void *))sub_10006F0F4);
    +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v5, "count", v15, v16, v17, v18));
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v11 = (uint64_t *)v10;
      do
      {
        uint64_t v12 = *v11;
        v11 += 2;
        id v13 = [v5 objectAtIndexedSubscript:v12];
        [v8 addObject:v13];

        --v9;
      }
      while (v9);
    }
    free(v10);
  }
  else
  {
    dispatch_semaphore_t v7 = &__NSArray0__struct;
    if (v5) {
      dispatch_semaphore_t v7 = v5;
    }
    id v8 = v7;
  }

  return v8;
}

- (NSString)name
{
  return self->_name;
}

- (NSSet)accounts
{
  return self->_accounts;
}

- (void)setAccounts:(id)a3
{
}

- (int64_t)accountMailboxesBatchSize
{
  return self->_accountMailboxesBatchSize;
}

- (void)setAccountMailboxesBatchSize:(int64_t)a3
{
  self->_int64_t accountMailboxesBatchSize = a3;
}

- (int64_t)lastFetchDateCutoff
{
  return self->_lastFetchDateCutoff;
}

- (void)setLastFetchDateCutoff:(int64_t)a3
{
  self->_lastFetchDateCutoff = a3;
}

- (unint64_t)loadNumOlderMessages
{
  return self->_loadNumOlderMessages;
}

- (void)setLoadNumOlderMessages:(unint64_t)a3
{
  self->_loadNumOlderMessages = a3;
}

- (BOOL)loadMessageBodies
{
  return self->_loadMessageBodies;
}

- (void)setLoadMessageBodies:(BOOL)a3
{
  self->_loadMessageBodies = a3;
}

- (BOOL)includePushedMailboxes
{
  return self->_includePushedMailboxes;
}

- (void)setIncludePushedMailboxes:(BOOL)a3
{
  self->_includePushedMailboxes = a3;
}

- (BOOL)includeFavoritesMailboxes
{
  return self->_includeFavoritesMailboxes;
}

- (void)setIncludeFavoritesMailboxes:(BOOL)a3
{
  self->_includeFavoritesMailboxes = a3;
}

- (FavoritesPersistence)favoritesPersistence
{
  return self->_favoritesPersistence;
}

- (void)setFavoritesPersistence:(id)a3
{
}

- (BOOL)useMailboxFrecencyRanking
{
  return self->_useMailboxFrecencyRanking;
}

- (void)setUseMailboxFrecencyRanking:(BOOL)a3
{
  self->_useMailboxFrecencyRanking = a3;
}

- (unint64_t)maximumMailboxesToFetch
{
  return self->_maximumMailboxesToFetch;
}

- (void)setMaximumMailboxesToFetch:(unint64_t)a3
{
  self->_maximumMailboxesToFetch = a3;
}

- (NSArray)excludedMailboxTypes
{
  return self->_excludedMailboxTypes;
}

- (void)setExcludedMailboxTypes:(id)a3
{
}

- (MFActivityCondition)condition
{
  return self->_condition;
}

- (void)setCondition:(id)a3
{
}

- (OS_dispatch_semaphore)finishedProcessing
{
  return (OS_dispatch_semaphore *)objc_getProperty(self, a2, 32, 1);
}

- (void)setFinishedProcessing:(id)a3
{
}

- (OS_dispatch_semaphore)requestLimiter
{
  return (OS_dispatch_semaphore *)objc_getProperty(self, a2, 40, 1);
}

- (void)setRequestLimiter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_condition, 0);
  objc_storeStrong((id *)&self->_excludedMailboxTypes, 0);
  objc_storeStrong((id *)&self->_favoritesPersistence, 0);
  objc_storeStrong((id *)&self->_accounts, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_cancelationToken, 0);
  objc_storeStrong((id *)&self->_failedMailboxes, 0);
  objc_storeStrong((id *)&self->_currentInvocations, 0);
  objc_storeStrong((id *)&self->_requestLimiter, 0);
  objc_storeStrong((id *)&self->_finishedProcessing, 0);
  objc_storeStrong((id *)&self->_stateQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);

  objc_storeStrong((id *)&self->_mailboxFetchCounts, 0);
}

@end