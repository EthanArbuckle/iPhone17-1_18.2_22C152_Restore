@interface MailboxAutoFetchController
+ (MailboxAutoFetchController)sharedController;
+ (OS_os_log)signpostLog;
+ (id)log;
- (BOOL)_shouldAutoFetchAccount:(id)a3 whenVisible:(BOOL)a4;
- (BOOL)_tryFetch:(int)a3 withAccounts:(id)a4;
- (BOOL)isIdle;
- (EFScheduler)fetchProcessorScheduler;
- (EFScheduler)fetchScheduler;
- (FavoritesPersistence)favoritesPersistence;
- (MailboxAutoFetchController)initWithFavoritesPersistence:(id)a3;
- (NSArray)pushedMailboxJobList;
- (NSSet)currentAlertSuppresionContexts;
- (id)_invocationWithTarget:(id)a3 priority:(unint64_t)a4;
- (id)_visibleMailboxes;
- (id)copyDiagnosticInformation;
- (id)diagnosticInformation;
- (id)freeSpaceMonitor;
- (int64_t)autoFetchState;
- (unint64_t)signpostID;
- (void)_beginSignpostForMailboxFetch:(id)a3;
- (void)_checkForReachability;
- (void)_checkForWiFi;
- (void)_cleanUpReachabilityTimer;
- (void)_createJobList;
- (void)_createJobListFinished:(id)a3;
- (void)_doFetchChangedMailboxes:(id)a3 forAccount:(id)a4 options:(int)a5;
- (void)_endSignpostForMailboxFetch:(id)a3;
- (void)_fetchChangedMailboxes:(id)a3 forAccount:(id)a4 options:(int)a5;
- (void)_fetchCompleted:(id)a3;
- (void)_finishAutoFetch;
- (void)_logSignpostForMailboxFetch:(id)a3 finished:(BOOL)a4;
- (void)_logSignpostForMailboxFetchRetry:(id)a3;
- (void)_newNotificationSoundSent:(id)a3;
- (void)_reportReachabilityChange:(id)a3;
- (void)_reportReachabilityTimeout;
- (void)_reportSynchronousFetchCompletion:(id)a3;
- (void)_scheduleAllJobs;
- (void)_scheduleRequest:(id)a3 priority:(unint64_t)a4 selector:(SEL)a5;
- (void)_scheduleRetryRequest:(id)a3 priority:(unint64_t)a4 selector:(SEL)a5;
- (void)_startAutoFetch:(int)a3 withAccounts:(id)a4;
- (void)dealloc;
- (void)fetchForPowernap;
- (void)fetchNow:(int)a3 withAccounts:(id)a4;
- (void)fetchNow:(int)a3 withMailboxes:(id)a4;
- (void)networkConfigurationChanged;
- (void)setAutoFetchState:(int64_t)a3;
- (void)setCurrentAlertSuppresionContexts:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setFavoritesPersistence:(id)a3;
- (void)setFetchProcessorScheduler:(id)a3;
- (void)setFetchScheduler:(id)a3;
- (void)setPushedMailboxJobList:(id)a3;
- (void)setSuppressedContexts:(id)a3;
@end

@implementation MailboxAutoFetchController

+ (id)log
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002AF54;
  block[3] = &unk_100139B30;
  block[4] = a1;
  if (qword_10016B830 != -1) {
    dispatch_once(&qword_10016B830, block);
  }
  v2 = (void *)qword_10016B828;

  return v2;
}

+ (OS_os_log)signpostLog
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002B078;
  block[3] = &unk_100139B30;
  block[4] = a1;
  if (qword_10016B840 != -1) {
    dispatch_once(&qword_10016B840, block);
  }
  v2 = (void *)qword_10016B838;

  return (OS_os_log *)v2;
}

- (unint64_t)signpostID
{
  v3 = [(id)objc_opt_class() signpostLog];
  os_signpost_id_t v4 = os_signpost_id_make_with_pointer(v3, self);

  return v4;
}

- (MailboxAutoFetchController)initWithFavoritesPersistence:(id)a3
{
  id v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)MailboxAutoFetchController;
  v6 = [(MailboxAutoFetchController *)&v18 init];
  if (v6)
  {
    v7 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    accountResponsiveness = v6->_accountResponsiveness;
    v6->_accountResponsiveness = v7;

    objc_storeStrong((id *)&v6->_favoritesPersistence, a3);
    v9 = +[MFDiagnostics sharedController];
    [v9 addDiagnosticsGenerator:v6];

    uint64_t v10 = +[EFScheduler serialDispatchQueueSchedulerWithName:@"com.apple.email.MailboxAutofetchController.fetch"];
    fetchScheduler = v6->_fetchScheduler;
    v6->_fetchScheduler = (EFScheduler *)v10;

    uint64_t v12 = +[EFScheduler serialDispatchQueueSchedulerWithName:@"com.apple.email.MailboxAutofetchController.fetchProcessor"];
    fetchProcessorScheduler = v6->_fetchProcessorScheduler;
    v6->_fetchProcessorScheduler = (EFScheduler *)v12;

    v14 = MFPowerLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "[App Startup]", v17, 2u);
    }

    v15 = +[NSNotificationCenter defaultCenter];
    [v15 addObserver:v6 selector:"_newNotificationSoundSent:" name:MSNewNotificationSound object:0];
  }
  return v6;
}

- (void)dealloc
{
  [(MailboxAutoFetchController *)self _cleanUpReachabilityTimer];
  v3 = +[CPNetworkObserver sharedNetworkObserver];
  [v3 removeObserver:self];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v5.receiver = self;
  v5.super_class = (Class)MailboxAutoFetchController;
  [(MailboxAutoFetchController *)&v5 dealloc];
}

- (id)freeSpaceMonitor
{
  return +[MFDiskFreeSpaceMonitor defaultMonitor];
}

- (void)setDataSource:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(MailboxAutoFetchController *)self fetchScheduler];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002B490;
  v7[3] = &unk_100139C20;
  v7[4] = self;
  id v6 = v4;
  id v8 = v6;
  [v5 performBlock:v7];
}

- (BOOL)isIdle
{
  return self->_autoFetchState == 0;
}

- (id)_visibleMailboxes
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  v3 = [WeakRetained visibleMailboxesToSyncByMailbox];

  id v4 = +[MailboxAutoFetchController log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "visible mailboxes: %@", (uint8_t *)&v6, 0xCu);
  }

  return v3;
}

- (BOOL)_tryFetch:(int)a3 withAccounts:(id)a4
{
  uint64_t v5 = *(void *)&a3;
  v7 = (NSArray *)a4;
  if ([(MailboxAutoFetchController *)self autoFetchState])
  {
    id v8 = MFAutoFetchLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Suppressing autofetch because there's already one inflight", buf, 2u);
    }

    if (v5)
    {
      *(void *)buf = 0;
      v29 = buf;
      uint64_t v30 = 0x2020000000;
      char v31 = 1;
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_10002B974;
      v26[3] = &unk_10013AB50;
      int v27 = v5;
      v26[4] = self;
      v26[5] = buf;
      v9 = objc_retainBlock(v26);
      ((void (*)(void *, uint64_t))v9[2])(v9, 16);
      ((void (*)(void *, uint64_t))v9[2])(v9, 8);
      ((void (*)(void *, uint64_t))v9[2])(v9, 4);
      ((void (*)(void *, uint64_t))v9[2])(v9, 0x8000);
      if ((v5 & 2) != 0 && self->_autoFetchState >= 4) {
        v29[24] = 0;
      }
      fetchAccounts = self->_fetchAccounts;
      if (fetchAccounts == v7)
      {
        v13 = v29;
      }
      else
      {
        if (fetchAccounts) {
          v11 = self->_fetchAccounts;
        }
        else {
          v11 = (NSArray *)&__NSArray0__struct;
        }
        unsigned __int8 v12 = [(NSArray *)v7 isEqualToArray:v11];
        v13 = v29;
        if ((v12 & 1) == 0) {
          v29[24] = 0;
        }
      }
      if (v13[24])
      {
        self->_fetchType |= v5;
      }
      else
      {
        self->_pendingFetchType |= v5 | 1;
        objc_storeStrong((id *)&self->_pendingFetchAccounts, a4);
      }

      _Block_object_dispose(buf, 8);
    }
LABEL_34:
    BOOL v24 = 0;
    goto LABEL_37;
  }
  if ((v5 & 1) == 0 && ((v5 & 2) == 0 || !self->_lastAutoFetchHadErrors) && self->_lastNonvisibleAutoFetchDate != 0.0)
  {
    double v14 = CFAbsoluteTimeGetCurrent() - self->_lastNonvisibleAutoFetchDate;
    double v15 = 30.0;
    if (!self->_lastAutoFetchHadSources) {
      double v15 = 3.0;
    }
    if (v14 < v15)
    {
      v16 = MFAutoFetchLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Suppressing background autofetch because it's too close to the last one", buf, 2u);
      }

      v17 = +[NSNotificationCenter defaultCenter];
      [v17 postNotificationName:@"MailboxAutoFetchProcessFinishedNotification" object:self];

      goto LABEL_34;
    }
  }
  objc_super v18 = +[DaemonAppController sharedController];
  unsigned __int8 v19 = [v18 launchedToTest];

  if ((v19 & 1) == 0)
  {
    v20 = [(MailboxAutoFetchController *)self freeSpaceMonitor];
    unsigned int v21 = [v20 isFreeSpaceCritical];

    if (v21)
    {
      v22 = MFAutoFetchLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Suppressing autofetch because free space is critical.", buf, 2u);
      }

      v23 = +[NSNotificationCenter defaultCenter];
      [v23 postNotificationName:@"MailboxAutoFetchProcessFinishedNotification" object:self];
    }
    else
    {
      [(MailboxAutoFetchController *)self _startAutoFetch:v5 withAccounts:v7];
    }
  }
  BOOL v24 = 1;
LABEL_37:

  return v24;
}

- (void)fetchNow:(int)a3 withAccounts:(id)a4
{
  id v6 = a4;
  v7 = [(MailboxAutoFetchController *)self fetchScheduler];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10002BA9C;
  v9[3] = &unk_10013A2F0;
  v9[4] = self;
  int v11 = a3;
  id v8 = v6;
  id v10 = v8;
  [v7 performBlock:v9];
}

- (void)fetchNow:(int)a3 withMailboxes:(id)a4
{
  id v6 = a4;
  v7 = [(MailboxAutoFetchController *)self fetchScheduler];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10002BB94;
  v9[3] = &unk_10013A2F0;
  id v8 = v6;
  id v10 = v8;
  int v11 = self;
  int v12 = a3;
  [v7 performBlock:v9];
}

- (void)fetchForPowernap
{
  v3 = [(MailboxAutoFetchController *)self fetchScheduler];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10002BD54;
  v4[3] = &unk_100139C48;
  v4[4] = self;
  [v3 performBlock:v4];
}

- (void)setSuppressedContexts:(id)a3
{
}

- (id)diagnosticInformation
{
  id v2 = [(MailboxAutoFetchController *)self copyDiagnosticInformation];

  return v2;
}

- (void)networkConfigurationChanged
{
  v3 = [(MailboxAutoFetchController *)self fetchScheduler];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10002C118;
  v4[3] = &unk_100139C48;
  v4[4] = self;
  [v3 performBlock:v4];
}

- (int64_t)autoFetchState
{
  return self->_autoFetchState;
}

- (void)setAutoFetchState:(int64_t)a3
{
  uint64_t v5 = MFAutoFetchLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = sub_10002C258(self->_autoFetchState);
    v7 = sub_10002C258(a3);
    int v8 = 138412546;
    v9 = v6;
    __int16 v10 = 2112;
    int v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "autofetch state changing: %@ => %@", (uint8_t *)&v8, 0x16u);
  }
  self->_autoFetchState = a3;
}

- (id)_invocationWithTarget:(id)a3 priority:(unint64_t)a4
{
  id v4 = +[MFMonitoredInvocation invocationWithSelector:"run" target:a3 taskName:0 priority:a4 canBeCancelled:0];

  return v4;
}

- (void)_scheduleRetryRequest:(id)a3 priority:(unint64_t)a4 selector:(SEL)a5
{
  id v8 = a3;
  [v8 _markAsPendingRetryWithPriority:a4];
  v9 = [(MailboxAutoFetchController *)self fetchScheduler];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10002C468;
  v12[3] = &unk_10013AB78;
  v12[4] = self;
  id v10 = v8;
  id v13 = v10;
  unint64_t v14 = a4;
  SEL v15 = a5;
  id v11 = [v9 afterDelay:v12 performBlock:5.0];
}

- (void)_scheduleRequest:(id)a3 priority:(unint64_t)a4 selector:(SEL)a5
{
  id v12 = a3;
  v7 = -[MailboxAutoFetchController _invocationWithTarget:priority:](self, "_invocationWithTarget:priority:");
  if ([v12 retry])
  {
    id v8 = [v12 mailbox];
    [(MailboxAutoFetchController *)self _beginSignpostForMailboxFetch:v8];
  }
  else
  {
    id v8 = [v12 mailbox];
    [(MailboxAutoFetchController *)self _logSignpostForMailboxFetchRetry:v8];
  }

  [v12 _markAsScheduled];
  v9 = +[NSNotificationCenter defaultCenter];
  id v10 = [v7 monitor];
  [v9 addObserver:self selector:a5 name:MonitoredActivityEnded object:v10];

  id v11 = +[MFInvocationQueue sharedInvocationQueue];
  [v11 addInvocation:v7];
}

- (void)_doFetchChangedMailboxes:(id)a3 forAccount:(id)a4 options:(int)a5
{
  id v20 = a3;
  id v21 = a4;
  v25 = [(MailboxAutoFetchController *)self _visibleMailboxes];
  if ((a5 & 0x40) != 0)
  {
    unsigned int v24 = 1;
  }
  else
  {
    id v8 = +[DaemonAppController sharedController];
    unsigned int v24 = [v8 isFrontmost];
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = v20;
  id v9 = [obj countByEnumeratingWithState:&v26 objects:v36 count:16];
  if (v9)
  {
    uint64_t v23 = *(void *)v27;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v27 != v23) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        id v12 = objc_msgSend(v25, "containsObject:", v11, v20);
        id v13 = MFAutoFetchLog();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          unint64_t v14 = objc_msgSend(v21, "ef_publicDescription");
          SEL v15 = objc_msgSend(v11, "ef_publicDescription");
          *(_DWORD *)buf = 138543618;
          v33 = v14;
          __int16 v34 = 2114;
          v35 = v15;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Preparing to fetch changed %{public}@ mailbox %{public}@", buf, 0x16u);
        }
        v16 = +[MFPowerController sharedInstance];
        [v16 retainAssertionWithIdentifier:@"com.apple.mail.fetchchangeduids"];

        id v17 = [[AutoFetchRequestPrivate alloc] initRequestForMailboxUid:v11];
        [v17 setIsVisibleFetch:v12];
        [v17 setIsUserRequested:(a5 >> 5) & 1];
        [v17 setShouldGrowFetchWindow:(a5 >> 7) & 1];
        [v17 setShouldLoadOlderMessages:HIWORD(a5) & 1];
        [v17 setShouldCompact:(a5 >> 15) & 1];
        [v17 setDownloadAllMessages:(a5 >> 12) & 1];
        [v17 setIsForegroundRequest:v24];
        [v17 setIsScheduled:(a5 >> 9) & 1];
        [v17 setIsPush:(a5 >> 8) & 1];
        [v17 setShouldLoadMessageBody:(a5 & 0x400) == 0];
        [v17 setDontNotify:(a5 >> 11) & 1];
        if ((a5 & 0x800) != 0)
        {
          CFStringRef v30 = @"AutoFetchDontNotify";
          char v31 = &__kCFBooleanTrue;
          objc_super v18 = +[NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
        }
        else
        {
          objc_super v18 = 0;
        }
        unsigned __int8 v19 = +[NSNotificationCenter defaultCenter];
        [v19 postNotificationName:@"AutoFetchPushStartedNotification" object:self userInfo:v18];

        [(MailboxAutoFetchController *)self _scheduleRequest:v17 priority:8 selector:"_fetchCompleted:"];
      }
      id v9 = [obj countByEnumeratingWithState:&v26 objects:v36 count:16];
    }
    while (v9);
  }
}

- (void)_fetchChangedMailboxes:(id)a3 forAccount:(id)a4 options:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = [(MailboxAutoFetchController *)self freeSpaceMonitor];
  unsigned int v11 = [v10 hasAdequateFreeSpace];

  if (v11)
  {
    [(MailboxAutoFetchController *)self _doFetchChangedMailboxes:v8 forAccount:v9 options:v5];
  }
  else
  {
    id v12 = MFAutoFetchLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Suppressing fetched mailbox changes due to low disk space", v13, 2u);
    }
  }
}

- (void)_fetchCompleted:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 userInfo];
  id v6 = [v5 objectForKeyedSubscript:MonitoredActivityInvocation];

  v7 = [v6 target];
  id v8 = +[NSNotificationCenter defaultCenter];
  id v9 = [v4 object];
  [v8 removeObserver:self name:MonitoredActivityEnded object:v9];

  id v10 = [v7 account];
  unsigned int v11 = [v7 error];
  if (v11 && [v7 retry])
  {
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10002CDE0;
    v19[3] = &unk_100139C20;
    v19[4] = self;
    id v20 = v7;
    [v20 _healAccountWithCompletionHandler:v19];
    id v12 = v20;
  }
  else
  {
    id v13 = [(MailboxAutoFetchController *)self fetchScheduler];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10002CDF8;
    v14[3] = &unk_10013ABA0;
    id v15 = v7;
    id v16 = v10;
    id v17 = v11;
    objc_super v18 = self;
    [v13 performBlock:v14];

    id v12 = v15;
  }
}

- (void)_startAutoFetch:(int)a3 withAccounts:(id)a4
{
  id v7 = a4;
  id v8 = MFAutoFetchLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67113216;
    int v19 = a3 & 1;
    __int16 v20 = 1024;
    unsigned int v21 = (a3 >> 1) & 1;
    __int16 v22 = 1024;
    unsigned int v23 = (a3 >> 2) & 1;
    __int16 v24 = 1024;
    unsigned int v25 = (a3 >> 3) & 1;
    __int16 v26 = 1024;
    unsigned int v27 = (a3 >> 4) & 1;
    __int16 v28 = 1024;
    unsigned int v29 = (a3 >> 5) & 1;
    __int16 v30 = 1024;
    unsigned int v31 = (a3 >> 6) & 1;
    __int16 v32 = 1024;
    unsigned int v33 = (a3 >> 7) & 1;
    __int16 v34 = 1024;
    unsigned int v35 = (a3 >> 8) & 1;
    __int16 v36 = 1024;
    unsigned int v37 = (a3 >> 9) & 1;
    __int16 v38 = 1024;
    unsigned int v39 = (a3 >> 10) & 1;
    __int16 v40 = 1024;
    unsigned int v41 = (a3 >> 11) & 1;
    __int16 v42 = 1024;
    unsigned int v43 = (a3 >> 12) & 1;
    __int16 v44 = 1024;
    unsigned int v45 = (a3 >> 13) & 1;
    __int16 v46 = 1024;
    unsigned int v47 = (a3 >> 14) & 1;
    __int16 v48 = 1024;
    unsigned int v49 = (a3 >> 15) & 1;
    __int16 v50 = 1024;
    unsigned int v51 = HIWORD(a3) & 1;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Starting auto fetch. Force: %{BOOL}d, DisplayErrors: %{BOOL}d, IncludePush: %{BOOL}d, IncludeManual: %{BOOL}d, IncludeNonvisible: %{BOOL}d, UserRequested: %{BOOL}d, ForegroundRequest: %{BOOL}d, ShouldGrowFetchWindow: %{BOOL}d, Pushed: %{BOOL}d, Scheduled: %{BOOL}d, FetchOnlyHeaders: %{BOOL}d, DontNotify: %{BOOL}d, DownloadAllMessages: %{BOOL}d, RequiresPower: %{BOOL}d, RequiresWifi: %{BOOL}d, Compact: %{BOOL}d, LoadOlderMessages: %{BOOL}d", buf, 0x68u);
  }

  if (self->_outstandingAutoFetchRequests)
  {
    id v16 = +[NSAssertionHandler currentHandler];
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MailboxAutoFetchController.m", 665, @"%s should not be called while there are outstanding autofetch requests.", "-[MailboxAutoFetchController _startAutoFetch:withAccounts:]");
  }
  id v9 = +[MailboxAutoFetchController signpostLog];
  os_signpost_id_t v10 = [(MailboxAutoFetchController *)self signpostID];
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_BEGIN, v10, "AUTOFETCH", (const char *)&unk_10012893E, buf, 2u);
  }

  if (self->_visibleMailboxes)
  {
    id v17 = +[NSAssertionHandler currentHandler];
    [v17 handleFailureInMethod:a2 object:self file:@"MailboxAutoFetchController.m" lineNumber:669 description:@"should not have existing visible stores for new auto fetch"];
  }
  if ((a3 & 0x8000) != 0)
  {
    unsigned int v11 = (NSArray *)&__NSArray0__struct;
  }
  else
  {
    unsigned int v11 = [(MailboxAutoFetchController *)self _visibleMailboxes];
  }
  visibleMailboxes = self->_visibleMailboxes;
  self->_visibleMailboxes = v11;

  id v13 = +[NSNotificationCenter defaultCenter];
  [v13 postNotificationName:@"MailboxAutoFetchProcessStartNotification" object:self];

  self->_lastAutoFetchHadErrors = 0;
  self->_lastAutoFetchHadSources = [(NSArray *)self->_visibleMailboxes count] != 0;
  self->_fetchType = a3;
  unint64_t v14 = (NSArray *)[v7 copy];
  fetchAccounts = self->_fetchAccounts;
  self->_fetchAccounts = v14;

  [(MailboxAutoFetchController *)self _checkForReachability];
}

- (void)_cleanUpReachabilityTimer
{
  [(EFCancelable *)self->_networkWakeupCancelationToken cancel];
  networkWakeupCancelationToken = self->_networkWakeupCancelationToken;
  self->_networkWakeupCancelationToken = 0;
}

- (void)_reportReachabilityChange:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MailboxAutoFetchController *)self fetchScheduler];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002D79C;
  v7[3] = &unk_100139C20;
  v7[4] = self;
  id v6 = v4;
  id v8 = v6;
  [v5 performBlock:v7];
}

- (void)_reportReachabilityTimeout
{
  if ((id)[(MailboxAutoFetchController *)self autoFetchState] != (id)2)
  {
    id v4 = +[NSAssertionHandler currentHandler];
    [v4 handleFailureInMethod:a2 object:self file:@"MailboxAutoFetchController.m" lineNumber:716 description:@"should only get reachability timeouts when we're waiting on reachability."];
  }
  self->_tryFetchWhenReachable = 1;
  [(MailboxAutoFetchController *)self _cleanUpReachabilityTimer];

  [(MailboxAutoFetchController *)self _finishAutoFetch];
}

- (void)_checkForReachability
{
  id v4 = MFAutoFetchLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    visibleMailboxes = self->_visibleMailboxes;
    *(_DWORD *)buf = 138412290;
    __int16 v22 = visibleMailboxes;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Autofetch beginning. Visible mailboxes are %@", buf, 0xCu);
  }

  if (self->_networkWakeupCancelationToken)
  {
    objc_super v18 = +[NSAssertionHandler currentHandler];
    [v18 handleFailureInMethod:a2 object:self file:@"MailboxAutoFetchController.m" lineNumber:725 description:@"should not be a reachability timeout cancelation token."];
  }
  if (!self->_monitoringReachability)
  {
    id v6 = +[CPNetworkObserver sharedNetworkObserver];
    [v6 addNetworkReachableObserver:self selector:"_reportReachabilityChange:"];

    id v7 = +[CPNetworkObserver sharedNetworkObserver];
    self->_isReachable = [v7 isNetworkReachable];

    self->_monitoringReachability = 1;
  }
  id v8 = +[MFNetworkController sharedInstance];
  id v9 = [v8 dataStatus];

  if (v9)
  {
    uint64_t v10 = MFErrorCodeWithDataStatus();
    unsigned int v11 = MFAutoFetchLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = +[NSNumber numberWithInteger:v9];
      *(_DWORD *)buf = 138412290;
      __int16 v22 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Cancelling autofetch, data status %@", buf, 0xCu);
    }
    if (v10 >= 1 && (self->_fetchType & 2) != 0)
    {
      id v13 = +[MFError errorWithDomain:MFMessageErrorDomain code:v10 userInfo:0];
      unint64_t v14 = +[DaemonAppController sharedController];
      [v14 displayError:v13 forAccount:0 mode:2];
    }
    [(MailboxAutoFetchController *)self _finishAutoFetch];
  }
  else if (self->_isReachable)
  {
    [(MailboxAutoFetchController *)self _checkForWiFi];
  }
  else
  {
    [(MailboxAutoFetchController *)self setAutoFetchState:2];
    id v15 = [(MailboxAutoFetchController *)self fetchScheduler];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10002DD10;
    v20[3] = &unk_100139C48;
    v20[4] = self;
    id v16 = [v15 afterDelay:v20 performBlock:40.0];
    networkWakeupCancelationToken = self->_networkWakeupCancelationToken;
    self->_networkWakeupCancelationToken = v16;

    if (!self->_networkWakeupCancelationToken)
    {
      int v19 = +[NSAssertionHandler currentHandler];
      [v19 handleFailureInMethod:a2 object:self file:@"MailboxAutoFetchController.m" lineNumber:759 description:@"should have made a network wakeup timeout cancelation token."];
    }
  }
}

- (BOOL)_shouldAutoFetchAccount:(id)a3 whenVisible:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (([v6 canFetch] & 1) == 0)
  {
    id v13 = MFAutoFetchLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = objc_msgSend(v6, "ef_publicDescription");
      int v31 = 138543362;
      __int16 v32 = v15;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "should NOT fetch %{public}@: can’t fetch fetch", (uint8_t *)&v31, 0xCu);
    }
    goto LABEL_17;
  }
  fetchAccounts = self->_fetchAccounts;
  if (fetchAccounts && ![(NSArray *)fetchAccounts containsObject:v6])
  {
    id v13 = MFAutoFetchLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v18 = objc_msgSend(v6, "ef_publicDescription");
      int v31 = 138543362;
      __int16 v32 = v18;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "should NOT fetch %{public}@: is not in the set of accounts to fetch", (uint8_t *)&v31, 0xCu);
    }
    goto LABEL_17;
  }
  [v6 uniqueIdForPersistentConnection];
  int Style = PCSettingsGetStyle();
  unsigned int v9 = [v6 canReceiveNewMailNotifications];
  [v6 uniqueIdForPersistentConnection];
  int PollInterval = PCSettingsGetPollInterval();
  unsigned int v11 = +[DaemonAppController sharedController];
  unsigned int v12 = [v11 isFrontmost];

  if ((v4 & v12) == 1)
  {
    id v13 = MFAutoFetchLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v14 = objc_msgSend(v6, "ef_publicDescription");
      int v31 = 138543362;
      __int16 v32 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "should fetch %{public}@: isVisible and not suspended", (uint8_t *)&v31, 0xCu);
    }
LABEL_48:
    BOOL v19 = 1;
    goto LABEL_49;
  }
  if (Style == 1) {
    unsigned int v16 = v9;
  }
  else {
    unsigned int v16 = 0;
  }
  if (v16 == 1)
  {
    id v13 = MFAutoFetchLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = objc_msgSend(v6, "ef_publicDescription");
      int v31 = 138543362;
      __int16 v32 = v17;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "should fetch %{public}@: pushCapable and poll style", (uint8_t *)&v31, 0xCu);
    }
    goto LABEL_48;
  }
  if (Style) {
    unsigned int v20 = 0;
  }
  else {
    unsigned int v20 = v9;
  }
  if (v20 == 1)
  {
    if ((self->_fetchType & 4) != 0)
    {
      id v13 = MFAutoFetchLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v28 = objc_msgSend(v6, "ef_publicDescription");
        int v31 = 138543362;
        __int16 v32 = v28;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "should fetch %{public}@: pushCapable, push style, options include push.", (uint8_t *)&v31, 0xCu);
      }
      goto LABEL_48;
    }
    BOOL v21 = 0;
LABEL_31:
    if (PollInterval == -1) {
      char v24 = 1;
    }
    else {
      char v24 = v9;
    }
    if ((v24 & 1) == 0 && !v21)
    {
      id v13 = MFAutoFetchLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v25 = objc_msgSend(v6, "ef_publicDescription");
        int v31 = 138543362;
        __int16 v32 = v25;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "should fetch %{public}@: !pushCapable, !fetchOnManual, and !manual style", (uint8_t *)&v31, 0xCu);
      }
      goto LABEL_48;
    }
    goto LABEL_38;
  }
  BOOL v21 = Style == 2;
  if (Style == 2) {
    unsigned int v22 = v9;
  }
  else {
    unsigned int v22 = 0;
  }
  if (v22 != 1) {
    goto LABEL_31;
  }
  if ((self->_fetchType & 8) != 0)
  {
    id v13 = MFAutoFetchLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v23 = objc_msgSend(v6, "ef_publicDescription");
      int v31 = 138543362;
      __int16 v32 = v23;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "should fetch %{public}@: pushCapable, manual style, options include manual.", (uint8_t *)&v31, 0xCu);
    }
    goto LABEL_48;
  }
LABEL_38:
  if ((v9 & 1) == 0 && PollInterval == -1 && Style != 1 && (self->_fetchType & 8) != 0)
  {
    id v13 = MFAutoFetchLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v29 = objc_msgSend(v6, "ef_publicDescription");
      int v31 = 138543362;
      __int16 v32 = v29;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "should fetch %{public}@: fetchOnManual, not poll style, options include manual", (uint8_t *)&v31, 0xCu);
    }
    goto LABEL_48;
  }
  id v13 = MFAutoFetchLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v26 = objc_msgSend(v6, "ef_publicDescription");
    int fetchType = self->_fetchType;
    int v31 = 138544642;
    __int16 v32 = v26;
    __int16 v33 = 1024;
    BOOL v34 = v4;
    __int16 v35 = 1024;
    int v36 = Style;
    __int16 v37 = 1024;
    unsigned int v38 = v9;
    __int16 v39 = 1024;
    BOOL v40 = PollInterval == -1;
    __int16 v41 = 1024;
    int v42 = fetchType;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "should NOT fetch %{public}@. visible=%d style=%d pushCapable=%d fetchOnManual=%d fetchType=%d", (uint8_t *)&v31, 0x2Au);
  }
LABEL_17:
  BOOL v19 = 0;
LABEL_49:

  return v19;
}

- (void)_checkForWiFi
{
  v3 = MFAutoFetchLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    if (self->_isReachable) {
      BOOL v4 = "up";
    }
    else {
      BOOL v4 = "down";
    }
    *(_DWORD *)buf = 136315138;
    int v31 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Network stack is %s", buf, 0xCu);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v5 = self->_visibleMailboxes;
  id v6 = 0;
  id v7 = [(NSArray *)v5 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v26;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v26 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        unsigned int v11 = [v10 account];
        unsigned __int8 v12 = [(MailboxAutoFetchController *)self _shouldAutoFetchAccount:v11 whenVisible:1];

        if (v12)
        {
          if (!v6)
          {
            id v6 = +[NSMutableArray array];
          }
          id v13 = [[AutoFetchRequestPrivate alloc] initRequestForMailboxUid:v10];
          [v13 setIsVisibleFetch:1];
          [v13 setIsUserRequested:(self->_fetchType >> 5) & 1];
          [v13 setIsForegroundRequest:(self->_fetchType >> 6) & 1];
          [v13 setShouldGrowFetchWindow:(self->_fetchType >> 7) & 1];
          [v13 setShouldLoadOlderMessages:HIWORD(self->_fetchType) & 1];
          [v13 setIsScheduled:(self->_fetchType >> 9) & 1];
          [v6 addObject:v13];
        }
      }
      id v7 = [(NSArray *)v5 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v7);
  }

  unint64_t v14 = (NSArray *)[v6 copy];
  visibleSourceJobList = self->_visibleSourceJobList;
  self->_visibleSourceJobList = v14;

  if (!self->_isReachable) {
    goto LABEL_21;
  }
  unsigned int v16 = +[CPNetworkObserver sharedNetworkObserver];
  unsigned int v17 = [v16 isWiFiEnabled];

  if (!v17) {
    goto LABEL_21;
  }
  objc_super v18 = +[PCPersistentTimer lastSystemWakeDate];
  [v18 timeIntervalSinceNow];
  double v20 = v19;

  double v21 = v20 + 9.0;
  if (v21 > 0.0)
  {
    [(MailboxAutoFetchController *)self setAutoFetchState:1];
    unsigned int v22 = [(MailboxAutoFetchController *)self fetchScheduler];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_10002E674;
    v24[3] = &unk_100139C48;
    v24[4] = self;
    id v23 = [v22 afterDelay:v24 performBlock:v21];
  }
  else
  {
LABEL_21:
    [(MailboxAutoFetchController *)self _createJobList];
  }
}

- (void)_reportSynchronousFetchCompletion:(id)a3
{
  id v5 = a3;
  id v6 = [v5 userInfo];
  id v7 = [v6 objectForKeyedSubscript:MonitoredActivityInvocation];

  uint64_t v8 = [v7 target];
  unsigned int v9 = +[NSNotificationCenter defaultCenter];
  uint64_t v10 = [v5 object];
  [v9 removeObserver:self name:MonitoredActivityEnded object:v10];

  if ((id)[(MailboxAutoFetchController *)self autoFetchState] != (id)4)
  {
    id v15 = +[NSAssertionHandler currentHandler];
    [v15 handleFailureInMethod:a2 object:self file:@"MailboxAutoFetchController.m" lineNumber:868 description:@"we should not get any fetches back while we're not waiting for them."];
  }
  unsigned int v11 = [v8 account];
  unsigned __int8 v12 = [v8 error];
  if (v12 && [v8 retry])
  {
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10002E96C;
    v20[3] = &unk_100139C20;
    v21[0] = v8;
    v21[1] = self;
    [v21[0] _healAccountWithCompletionHandler:v20];
    id v13 = v21;
  }
  else
  {
    unint64_t v14 = [(MailboxAutoFetchController *)self fetchScheduler];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10002E9EC;
    v16[3] = &unk_10013ABA0;
    v17[0] = v8;
    v17[1] = self;
    id v18 = v11;
    id v19 = v12;
    [v14 performBlock:v16];
    id v13 = (id *)v17;
  }
}

- (void)_createJobList
{
  v3 = MFAutoFetchLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v4 = +[MFNetworkController sharedInstance];
    unsigned int v5 = [v4 isFatPipe];
    CFStringRef v6 = @"NO";
    if (v5) {
      CFStringRef v6 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    CFStringRef v28 = v6;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "WiFi up: %@", buf, 0xCu);
  }
  id v7 = objc_alloc_init((Class)NSMutableArray);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  unsigned int v9 = WeakRetained;
  int fetchType = self->_fetchType;
  if ((fetchType & 0x8000) != 0)
  {
    self->_tryFetchWhenReachable = 0;
    unsigned int v11 = [WeakRetained activeAccountsToSyncByMailbox];
    [v7 addObjectsFromArray:v11];
  }
  else
  {
    if ((fetchType & 0x10) == 0 || !self->_isReachable) {
      goto LABEL_20;
    }
    self->_tryFetchWhenReachable = 0;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    unsigned int v11 = objc_msgSend(WeakRetained, "activeAccountsToSyncByMailbox", 0);
    id v12 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v23;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v23 != v13) {
            objc_enumerationMutation(v11);
          }
          uint64_t v15 = *(void *)(*((void *)&v22 + 1) + 8 * i);
          if ([(MailboxAutoFetchController *)self _shouldAutoFetchAccount:v15 whenVisible:0])
          {
            [v7 addObject:v15];
          }
        }
        id v12 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v12);
    }
  }

LABEL_20:
  id v16 = [[AutoFetchCreateJobListPrivate alloc] initForAccounts:v7 accountResponsiveness:self->_accountResponsiveness fetchType:self->_fetchType];
  if (v16)
  {
    unsigned int v17 = +[MFPowerController sharedInstance];
    [v17 retainAssertionWithIdentifier:@"com.apple.mobilemail.autofetch"];

    id v18 = [(MailboxAutoFetchController *)self _invocationWithTarget:v16 priority:8];
    id v19 = +[NSNotificationCenter defaultCenter];
    double v20 = [v18 monitor];
    [v19 addObserver:self selector:"_createJobListFinished:" name:MonitoredActivityEnded object:v20];

    double v21 = +[MFInvocationQueue sharedInvocationQueue];
    [v21 addInvocation:v18];

    [(MailboxAutoFetchController *)self setAutoFetchState:3];
  }
  else
  {
    id v16 = 0;
    if (self->_visibleSourceJobList) {
      [(MailboxAutoFetchController *)self _scheduleAllJobs];
    }
    else {
      [(MailboxAutoFetchController *)self _finishAutoFetch];
    }
  }
}

- (void)_scheduleAllJobs
{
  v3 = [(MailboxAutoFetchController *)self pushedMailboxJobList];
  if ([v3 count])
  {
  }
  else
  {
    NSUInteger v4 = [(NSArray *)self->_visibleSourceJobList count];

    if (!v4)
    {
      [(MailboxAutoFetchController *)self _finishAutoFetch];
      goto LABEL_25;
    }
  }
  [(MailboxAutoFetchController *)self setAutoFetchState:4];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = [(MailboxAutoFetchController *)self pushedMailboxJobList];
  id v5 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v26;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v26 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        unsigned int v9 = [v8 mailbox];
        if ([v9 type] == (id)7) {
          uint64_t v10 = 8;
        }
        else {
          uint64_t v10 = 6;
        }

        [(MailboxAutoFetchController *)self _scheduleRequest:v8 priority:v10 selector:"_reportSynchronousFetchCompletion:"];
        ++self->_outstandingAutoFetchRequests;
      }
      id v5 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v5);
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  obja = self->_visibleSourceJobList;
  id v11 = [(NSArray *)obja countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v22;
    do
    {
      for (j = 0; j != v11; j = (char *)j + 1)
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(obja);
        }
        unint64_t v14 = *(void **)(*((void *)&v21 + 1) + 8 * (void)j);
        uint64_t v15 = [v14 mailbox];
        if ([v15 type] == (id)7) {
          uint64_t v16 = 8;
        }
        else {
          uint64_t v16 = 6;
        }

        [(MailboxAutoFetchController *)self _scheduleRequest:v14 priority:v16 selector:"_reportSynchronousFetchCompletion:"];
        ++self->_outstandingAutoFetchRequests;
      }
      id v11 = [(NSArray *)obja countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v11);
  }

  visibleSourceJobList = self->_visibleSourceJobList;
  self->_visibleSourceJobList = 0;

  [(MailboxAutoFetchController *)self setPushedMailboxJobList:0];
LABEL_25:
  id v18 = +[MFPowerController sharedInstance];
  [v18 releaseAssertionWithIdentifier:@"com.apple.mobilemail.autofetch"];
}

- (void)_createJobListFinished:(id)a3
{
  id v4 = a3;
  id v5 = [(MailboxAutoFetchController *)self fetchScheduler];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002F6DC;
  v7[3] = &unk_100139C20;
  id v6 = v4;
  id v8 = v6;
  unsigned int v9 = self;
  [v5 performBlock:v7];
}

- (void)_finishAutoFetch
{
  [(MailboxAutoFetchController *)self setAutoFetchState:0];
  id v4 = +[MFDeliveryQueue sharedDeliveryQueue];
  [v4 processQueue];

  id v5 = +[NSNotificationCenter defaultCenter];
  [v5 postNotificationName:@"MailboxAutoFetchProcessFinishedNotification" object:self];

  if (self->_visibleSourceJobList)
  {
    long long v28 = +[NSAssertionHandler currentHandler];
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MailboxAutoFetchController.m", 1048, @"%s should not be called while there are visible store requests to enqueue.", "-[MailboxAutoFetchController _finishAutoFetch]");
  }
  visibleMailboxes = self->_visibleMailboxes;
  self->_visibleMailboxes = 0;

  fetchAccounts = self->_fetchAccounts;
  self->_fetchAccounts = 0;

  self->_lastNonvisibleAutoFetchDate = CFAbsoluteTimeGetCurrent();
  id v8 = +[MailboxAutoFetchController signpostLog];
  os_signpost_id_t v9 = [(MailboxAutoFetchController *)self signpostID];
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_END, v9, "AUTOFETCH", (const char *)&unk_10012893E, buf, 2u);
  }

  if ((self->_fetchType & 0xFFFFFFFE) == EMFetchTypeResume)
  {
    uint64_t v10 = +[MFNetworkController sharedInstance];
    unsigned int v11 = [v10 isFatPipe];

    if (v11)
    {
      uint64_t v12 = +[MailPersistentStorage sharedStorage];
      uint64_t v13 = [v12 lastAdditionalMailboxesFetchDate];
      if (!v13
        || (+[NSDate date],
            unint64_t v14 = objc_claimAutoreleasedReturnValue(),
            [v14 timeIntervalSinceDate:v13],
            BOOL v16 = v15 > 7200.0,
            v14,
            v16))
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
        id v18 = [WeakRetained displayedAccountsToSyncByMailbox];
        id v19 = sub_10002BEF0((uint64_t)v18);

        if ([v19 count])
        {
          double v20 = MFAutoFetchLog();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Scheduling fetch of additional mailboxes", buf, 2u);
          }

          long long v21 = [(MailboxAutoFetchController *)self fetchProcessorScheduler];
          v29[0] = _NSConcreteStackBlock;
          v29[1] = 3221225472;
          v29[2] = sub_10002FD44;
          v29[3] = &unk_10013ABC8;
          id v30 = v12;
          int v31 = self;
          id v32 = v19;
          [v21 performBlock:v29];
        }
      }
    }
  }
  uint64_t pendingFetchType = self->_pendingFetchType;
  if (pendingFetchType)
  {
    long long v23 = self->_pendingFetchAccounts;
    self->_uint64_t pendingFetchType = 0;
    pendingFetchAccounts = self->_pendingFetchAccounts;
    self->_pendingFetchAccounts = 0;

    long long v25 = MFAutoFetchLog();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v34 = pendingFetchType;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Finished background fetch, starting pending fetch with options %#x", buf, 8u);
    }

    [(MailboxAutoFetchController *)self _tryFetch:pendingFetchType withAccounts:v23];
  }
  else
  {
    long long v26 = MFAutoFetchLog();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Finished background fetch call-back", buf, 2u);
    }

    long long v27 = MFPowerLog();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "[Fetch Complete]", buf, 2u);
    }

    long long v23 = +[NSNotificationCenter defaultCenter];
    [(NSArray *)v23 postNotificationName:@"MailboxAutoFetchDoneNotification" object:self];
  }
}

- (void)_newNotificationSoundSent:(id)a3
{
  id v4 = a3;
  id v5 = [(MailboxAutoFetchController *)self fetchScheduler];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002FEF4;
  v7[3] = &unk_100139C20;
  id v6 = v4;
  id v8 = v6;
  os_signpost_id_t v9 = self;
  [v5 performBlock:v7];
}

- (id)copyDiagnosticInformation
{
  id v3 = objc_alloc_init((Class)NSMutableString);
  [v3 appendString:@"\n"];
  [v3 appendString:@"==== Autofetcher State ====\n"];
  id v4 = sub_10002C258(self->_autoFetchState);
  [v3 appendFormat:@"  current state                   : %@\n", v4];

  double lastNonvisibleAutoFetchDate = self->_lastNonvisibleAutoFetchDate;
  if (lastNonvisibleAutoFetchDate == 0.0)
  {
    id v6 = &stru_10013ED08;
  }
  else
  {
    id v6 = +[NSDate dateWithTimeIntervalSinceReferenceDate:self->_lastNonvisibleAutoFetchDate];
  }
  [v3 appendFormat:@"  last fetch date (non-visible)   : %@\n", v6];
  if (lastNonvisibleAutoFetchDate != 0.0) {

  }
  if (self->_lastAutoFetchHadErrors) {
    CFStringRef v7 = @"YES";
  }
  else {
    CFStringRef v7 = @"NO";
  }
  [v3 appendFormat:@"  last fetch had errors           : %@\n", v7];
  if (self->_lastAutoFetchHadSources) {
    CFStringRef v8 = @"YES";
  }
  else {
    CFStringRef v8 = @"NO";
  }
  [v3 appendFormat:@"  last fetch had sources          : %@\n", v8];
  objc_msgSend(v3, "appendFormat:", @"  last fetch type                 : %d\n", self->_fetchType);
  fetchAccounts = self->_fetchAccounts;
  if (!fetchAccounts) {
    fetchAccounts = (NSArray *)&stru_10013ED08;
  }
  [v3 appendFormat:@"  fetch accounts:                 : %@\n", fetchAccounts];
  objc_msgSend(v3, "appendFormat:", @"  pending fetch type              : %d\n\n", self->_pendingFetchType);
  pendingFetchAccounts = self->_pendingFetchAccounts;
  if (!pendingFetchAccounts) {
    pendingFetchAccounts = (NSArray *)&stru_10013ED08;
  }
  [v3 appendFormat:@"  pending fetch accounts:         : %@\n", pendingFetchAccounts];
  if (self->_isReachable) {
    CFStringRef v11 = @"YES";
  }
  else {
    CFStringRef v11 = @"NO";
  }
  [v3 appendFormat:@"  reachable                       : %@\n", v11];
  if (self->_monitoringReachability) {
    CFStringRef v12 = @"YES";
  }
  else {
    CFStringRef v12 = @"NO";
  }
  [v3 appendFormat:@"  monitoring reachability         : %@\n", v12];
  if (self->_tryFetchWhenReachable) {
    CFStringRef v13 = @"YES";
  }
  else {
    CFStringRef v13 = @"NO";
  }
  [v3 appendFormat:@"  fetch when reachable            : %@\n", v13];
  id v14 = [(NSMutableDictionary *)self->_accountResponsiveness count];
  if (v14)
  {
    double v15 = [(NSMutableDictionary *)self->_accountResponsiveness description];
  }
  else
  {
    double v15 = @"-";
  }
  [v3 appendFormat:@"  account responsiveness          : %@\n", v15];
  if (v14) {

  }
  [v3 appendString:@"\n==== Autofetcher Joblist ====\n"];
  id v16 = +[AutoFetchRequestPrivate currentRequests];
  objc_sync_enter(v16);
  CFArrayRef v17 = [v16 allObjects];
  v23.length = (CFIndex)[v16 count];
  v23.location = 0;
  CFArrayApplyFunction(v17, v23, (CFArrayApplierFunction)sub_1000304D0, v3);

  objc_sync_exit(v16);
  [v3 appendString:@"\n==== Fetch History ====\n"];
  id v18 = (id)qword_10016B818;
  objc_sync_enter(v18);
  CFArrayRef v19 = [(id)qword_10016B818 allValues];
  v24.length = (CFIndex)[(id)qword_10016B818 count];
  v24.location = 0;
  CFArrayApplyFunction(v19, v24, (CFArrayApplierFunction)sub_100030644, v3);

  objc_sync_exit(v18);
  [v3 appendString:@"\n==== Fetch History (Push) ====\n"];
  id v20 = (id)qword_10016B820;
  objc_sync_enter(v20);
  CFArrayRef v21 = [(id)qword_10016B820 allValues];
  v25.length = (CFIndex)[(id)qword_10016B820 count];
  v25.location = 0;
  CFArrayApplyFunction(v21, v25, (CFArrayApplierFunction)sub_100030644, v3);

  objc_sync_exit(v20);
  return v3;
}

+ (MailboxAutoFetchController)sharedController
{
  if (qword_10016B850 != -1) {
    dispatch_once(&qword_10016B850, &stru_10013ABE8);
  }
  id v2 = (void *)qword_10016B848;

  return (MailboxAutoFetchController *)v2;
}

- (void)_beginSignpostForMailboxFetch:(id)a3
{
}

- (void)_endSignpostForMailboxFetch:(id)a3
{
}

- (void)_logSignpostForMailboxFetchRetry:(id)a3
{
  id v4 = a3;
  id v5 = [v4 account];
  id v6 = objc_alloc((Class)NSString);
  CFStringRef v7 = objc_msgSend(v5, "ef_publicDescription");
  CFStringRef v8 = objc_msgSend(v4, "ef_publicDescription");
  id v9 = [v6 initWithFormat:@"[%@ - %@]", v7, v8];

  uint64_t v10 = +[MailboxAutoFetchController signpostLog];
  os_signpost_id_t v11 = [(MailboxAutoFetchController *)self signpostID];
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_DWORD *)buf = 138543362;
    id v13 = v9;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_EVENT, v11, "AUTOFETCH MAILBOX", "Retry of Mailbox=%{signpost.description:attribute,public}@", buf, 0xCu);
  }
}

- (void)_logSignpostForMailboxFetch:(id)a3 finished:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  CFStringRef v7 = [v6 account];
  id v8 = objc_alloc((Class)NSString);
  id v9 = objc_msgSend(v7, "ef_publicDescription");
  uint64_t v10 = objc_msgSend(v6, "ef_publicDescription");
  id v11 = [v8 initWithFormat:@"[%@ - %@]", v9, v10];

  if (v4)
  {
    CFStringRef v12 = +[MailboxAutoFetchController signpostLog];
    os_signpost_id_t v13 = [(MailboxAutoFetchController *)self signpostID];
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      *(_DWORD *)buf = 138543362;
      id v17 = v11;
      id v14 = v12;
      os_signpost_type_t v15 = OS_SIGNPOST_INTERVAL_END;
LABEL_8:
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, v15, v13, "AUTOFETCH MAILBOX", "Mailbox=%{signpost.description:attribute,public}@", buf, 0xCu);
    }
  }
  else
  {
    CFStringRef v12 = +[MailboxAutoFetchController signpostLog];
    os_signpost_id_t v13 = [(MailboxAutoFetchController *)self signpostID];
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      *(_DWORD *)buf = 138543362;
      id v17 = v11;
      id v14 = v12;
      os_signpost_type_t v15 = OS_SIGNPOST_INTERVAL_BEGIN;
      goto LABEL_8;
    }
  }
}

- (FavoritesPersistence)favoritesPersistence
{
  return self->_favoritesPersistence;
}

- (void)setFavoritesPersistence:(id)a3
{
}

- (NSArray)pushedMailboxJobList
{
  return self->_pushedMailboxJobList;
}

- (void)setPushedMailboxJobList:(id)a3
{
}

- (NSSet)currentAlertSuppresionContexts
{
  return self->_currentAlertSuppresionContexts;
}

- (void)setCurrentAlertSuppresionContexts:(id)a3
{
}

- (EFScheduler)fetchScheduler
{
  return self->_fetchScheduler;
}

- (void)setFetchScheduler:(id)a3
{
}

- (EFScheduler)fetchProcessorScheduler
{
  return self->_fetchProcessorScheduler;
}

- (void)setFetchProcessorScheduler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchProcessorScheduler, 0);
  objc_storeStrong((id *)&self->_fetchScheduler, 0);
  objc_storeStrong((id *)&self->_currentAlertSuppresionContexts, 0);
  objc_storeStrong((id *)&self->_pushedMailboxJobList, 0);
  objc_storeStrong((id *)&self->_favoritesPersistence, 0);
  objc_storeStrong((id *)&self->_networkWakeupCancelationToken, 0);
  objc_storeStrong((id *)&self->_visibleSourceJobList, 0);
  objc_storeStrong((id *)&self->_visibleMailboxes, 0);
  objc_storeStrong((id *)&self->_pendingFetchAccounts, 0);
  objc_storeStrong((id *)&self->_fetchAccounts, 0);
  objc_storeStrong((id *)&self->_accountResponsiveness, 0);

  objc_destroyWeak((id *)&self->_dataSource);
}

@end