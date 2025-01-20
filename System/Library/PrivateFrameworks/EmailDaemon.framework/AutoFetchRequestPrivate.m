@interface AutoFetchRequestPrivate
+ (NSSet)currentRequests;
- (BOOL)_fetchedSuccessfully;
- (BOOL)closeConnection;
- (BOOL)displayErrors;
- (BOOL)dontNotify;
- (BOOL)downloadAllMessages;
- (BOOL)isForegroundRequest;
- (BOOL)isPowernapFetch;
- (BOOL)isPush;
- (BOOL)isScheduled;
- (BOOL)isUserRequested;
- (BOOL)isVisibleFetch;
- (BOOL)retry;
- (BOOL)shouldCompact;
- (BOOL)shouldGrowFetchWindow;
- (BOOL)shouldLoadMessageBody;
- (BOOL)shouldLoadOlderMessages;
- (BOOL)shouldNotify;
- (MFActivityMonitor)monitor;
- (MFError)error;
- (MFMailboxUid)mailbox;
- (MailAccount)account;
- (NSString)key;
- (double)responsiveness;
- (id)initRequestForMailboxUid:(id)a3;
- (int64_t)result;
- (unint64_t)gotNewMessagesState;
- (unint64_t)loadNumOlderMessages;
- (void)_handleMonitorActivityMessage:(id)a3;
- (void)_healAccountWithCompletionHandler:(id)a3;
- (void)_markActivityDoneWithError:(id)a3;
- (void)_markAsPendingRetryWithPriority:(unint64_t)a3;
- (void)_markAsScheduled;
- (void)dealloc;
- (void)logSummary:(id)a3 error:(id)a4;
- (void)markAsDone;
- (void)run;
- (void)setCloseConnection:(BOOL)a3;
- (void)setDisplayErrors:(BOOL)a3;
- (void)setDontNotify:(BOOL)a3;
- (void)setDownloadAllMessages:(BOOL)a3;
- (void)setError:(id)a3;
- (void)setGotNewMessagesState:(unint64_t)a3;
- (void)setIsForegroundRequest:(BOOL)a3;
- (void)setIsPowernapFetch:(BOOL)a3;
- (void)setIsPush:(BOOL)a3;
- (void)setIsScheduled:(BOOL)a3;
- (void)setIsUserRequested:(BOOL)a3;
- (void)setIsVisibleFetch:(BOOL)a3;
- (void)setKey:(id)a3;
- (void)setLoadNumOlderMessages:(unint64_t)a3;
- (void)setResponsiveness:(double)a3;
- (void)setRetry:(BOOL)a3;
- (void)setShouldCompact:(BOOL)a3;
- (void)setShouldGrowFetchWindow:(BOOL)a3;
- (void)setShouldLoadMessageBody:(BOOL)a3;
- (void)setShouldLoadOlderMessages:(BOOL)a3;
@end

@implementation AutoFetchRequestPrivate

+ (NSSet)currentRequests
{
  if (qword_10016B710 != -1) {
    dispatch_once(&qword_10016B710, &stru_100139ED8);
  }
  id v2 = (id)qword_10016B708;
  objc_sync_enter(v2);
  id v3 = [(id)qword_10016B708 copy];
  objc_sync_exit(v2);

  return (NSSet *)v3;
}

- (id)initRequestForMailboxUid:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)AutoFetchRequestPrivate;
  v6 = [(AutoFetchRequestPrivate *)&v16 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_mailbox, a3);
    uint64_t v8 = [v5 store];
    store = v7->_store;
    v7->_store = (MFLibraryStore *)v8;

    v7->_compactMailbox = 0;
    v7->_shouldLoadMessageBody = 1;
    v7->_retry = 1;
    v10 = +[DaemonAppController sharedController];
    uint64_t v11 = [v10 activityPersistence];
    activityPersistence = v7->_activityPersistence;
    v7->_activityPersistence = (EDActivityPersistence *)v11;

    v13 = EFFetchSignpostLog();
    v7->_signpostID = os_signpost_id_make_with_pointer(v13, v7);

    +[AutoFetchRequestPrivate currentRequests];
    id v14 = (id)qword_10016B708;
    objc_sync_enter(v14);
    [(id)qword_10016B708 addObject:v7];
    objc_sync_exit(v14);
  }
  return v7;
}

- (void)dealloc
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)AutoFetchRequestPrivate;
  [(AutoFetchRequestPrivate *)&v4 dealloc];
}

- (void)run
{
  if (pthread_main_np())
  {
    v89 = +[NSAssertionHandler currentHandler];
    [v89 handleFailureInMethod:a2 object:self file:@"AutoFetchRequestPrivate.m" lineNumber:119 description:@"Current thread is main"];
  }
  if (EFDeviceUnlockedSinceBoot())
  {
    if (!self->_isScheduled || PCSettingsGetClassPollInterval()) {
      goto LABEL_6;
    }
    v22 = +[MFNetworkController sharedInstance];
    unsigned __int8 v23 = [v22 isFatPipe];

    if (v23)
    {
      v24 = +[MFPowerController sharedInstance];
      unsigned __int8 v25 = [v24 isPluggedIn];

      if (v25)
      {
LABEL_6:
        objc_super v4 = +[MFNetworkController sharedInstance];
        unsigned int v5 = [v4 isFatPipe];

        v6 = +[MFActivityMonitor currentMonitor];
        monitor = self->_monitor;
        self->_monitor = v6;

        id location = (id)0xAAAAAAAAAAAAAAAALL;
        objc_initWeak(&location, self);
        v105[0] = _NSConcreteStackBlock;
        v105[1] = 3221225472;
        v105[2] = sub_10000BE80;
        v105[3] = &unk_100139F00;
        objc_copyWeak(v106, &location);
        v106[1] = (id)v5;
        [(MFActivityMonitor *)self->_monitor setStartedFetch:v105];
        double Current = CFAbsoluteTimeGetCurrent();
        v9 = +[NSNotificationCenter defaultCenter];
        [v9 addObserver:self selector:"_handleMonitorActivityMessage:" name:MonitoredActivityMessage object:self->_monitor];

        store = self->_store;
        if (store)
        {
          uint64_t v11 = store;
        }
        else
        {
          uint64_t v11 = [(MFMailboxUid *)self->_mailbox store];
        }
        v12 = v11;
        mailbox = self->_mailbox;
        if (mailbox)
        {
          id v14 = mailbox;
        }
        else
        {
          id v14 = [(MFLibraryStore *)v11 mailbox];
        }
        v15 = v14;
        objc_super v16 = [(AutoFetchRequestPrivate *)self account];
        v103 = [v16 loggingIdentifier];

        uint64_t v17 = (uint64_t)[(MFLibraryStore *)v12 fetchWindow];
        unsigned int v102 = [(AutoFetchRequestPrivate *)self shouldLoadOlderMessages];
        v104 = [(MFLibraryStore *)v12 account];
        if (self->_downloadAllMessages)
        {
          CFStringRef v18 = @"same";
          uint64_t v17 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else
        {
          if (self->_shouldGrowFetchWindow)
          {
            if ([(MFLibraryStore *)v12 shouldGrowFetchWindow])
            {
              v19 = MFAutoFetchLog();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
              {
                v20 = objc_msgSend(v104, "ef_publicDescription");
                v21 = [(MFMailboxUid *)v15 ef_publicDescription];
                *(_DWORD *)buf = 134218498;
                v111 = self;
                __int16 v112 = 2114;
                *(void *)v113 = v20;
                *(_WORD *)&v113[8] = 2114;
                *(void *)&v113[10] = v21;
                _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%p Will try to grow the fetch window for %{public}@, mailbox %{public}@", buf, 0x20u);
              }
              uint64_t v17 = (uint64_t)[(MFLibraryStore *)v12 growFetchWindow];
              unsigned int v102 = 0;
              CFStringRef v18 = @"grew";
              goto LABEL_29;
            }
            self->_shouldGrowFetchWindow = 0;
          }
          CFStringRef v18 = @"same";
        }
LABEL_29:
        v27 = MFAutoFetchLog();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          v100 = objc_msgSend(v104, "ef_publicDescription");
          uint64_t v28 = [(MFMailboxUid *)v15 ef_publicDescription];
          remoteID = self->_remoteID;
          v99 = v12;
          v97 = (void *)v28;
          v98 = v15;
          uint64_t v95 = v17;
          if (self->_shouldGrowFetchWindow) {
            +[NSString stringWithFormat:@"%lu (%@)", v17, v18];
          }
          else {
          v96 = +[NSNumber numberWithUnsignedInteger:v17];
          }
          unsigned int v94 = [(AutoFetchRequestPrivate *)self shouldCompact];
          unsigned int v93 = [(AutoFetchRequestPrivate *)self displayErrors];
          unsigned int v92 = [(AutoFetchRequestPrivate *)self isVisibleFetch];
          unsigned int v91 = [(AutoFetchRequestPrivate *)self isPowernapFetch];
          unsigned int v90 = [(AutoFetchRequestPrivate *)self isUserRequested];
          unsigned int v30 = [(AutoFetchRequestPrivate *)self isForegroundRequest];
          unsigned int v31 = [(AutoFetchRequestPrivate *)self shouldGrowFetchWindow];
          unsigned int v32 = [(AutoFetchRequestPrivate *)self downloadAllMessages];
          unsigned int v33 = [(AutoFetchRequestPrivate *)self shouldLoadMessageBody];
          unsigned int v34 = [(AutoFetchRequestPrivate *)self closeConnection];
          unsigned int v35 = [(AutoFetchRequestPrivate *)self dontNotify];
          unsigned int v36 = [(AutoFetchRequestPrivate *)self retry];
          *(_DWORD *)buf = 134222082;
          v111 = self;
          __int16 v112 = 2114;
          *(void *)v113 = v100;
          *(_WORD *)&v113[8] = 2114;
          *(void *)&v113[10] = v97;
          *(_WORD *)&v113[18] = 2112;
          *(void *)&v113[20] = remoteID;
          __int16 v114 = 2112;
          v115 = v96;
          __int16 v116 = 1024;
          unsigned int v117 = v94;
          __int16 v118 = 1024;
          unsigned int v119 = v93;
          __int16 v120 = 1024;
          unsigned int v121 = v92;
          __int16 v122 = 1024;
          unsigned int v123 = v91;
          __int16 v124 = 1024;
          unsigned int v125 = v90;
          __int16 v126 = 1024;
          unsigned int v127 = v30;
          __int16 v128 = 1024;
          unsigned int v129 = v31;
          __int16 v130 = 1024;
          unsigned int v131 = v32;
          __int16 v132 = 1024;
          unsigned int v133 = v33;
          __int16 v134 = 1024;
          unsigned int v135 = v34;
          __int16 v136 = 1024;
          unsigned int v137 = v35;
          __int16 v138 = 1024;
          unsigned int v139 = v36;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "%p Autofetching %{public}@, mailbox %{public}@, remoteID %@, fetchSize %@, shouldCompact: %{BOOL}d, displayErrors: %{BOOL}d, isVisibleFetch: %{BOOL}d, isPowernapFetch: %{BOOL}d, isUserRequested: %{BOOL}d, isForegroundRequest: %{BOOL}d, shouldGrowFetchWindow: %{BOOL}d, downloadAllMessages: %{BOOL}d, shouldLoadMessageBody: %{BOOL}d, closeConnection: %{BOOL}d, dontNotify: %{BOOL}d, retry: %{BOOL}d", buf, 0x7Cu);

          v12 = v99;
          v15 = v98;
          uint64_t v17 = v95;
        }
        v37 = MFPowerLog();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v104, "ef_publicDescription");
          v38 = (AutoFetchRequestPrivate *)objc_claimAutoreleasedReturnValue();
          v39 = self->_remoteID;
          *(_DWORD *)buf = 138543618;
          v111 = v38;
          __int16 v112 = 2112;
          *(void *)v113 = v39;
          _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "[Autofetch] account=%{public}@ remoteID=%@", buf, 0x16u);
        }
        if (self->_isVisibleFetch)
        {
          v40 = MFAutoFetchLog();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134217984;
            v111 = self;
            _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_INFO, "%p will perform visible store fetch", buf, 0xCu);
          }
        }
        if (self->_shouldLoadMessageBody)
        {
          v41 = [(AutoFetchRequestPrivate *)self account];
          v42 = +[MessageBodyLoader loaderForAccount:v41];
          [v42 beginAddingNewMessagesForStore:v12];
        }
        if (self->_isForegroundRequest) {
          uint64_t v43 = self->_isUserRequested | (2 * self->_compactMailbox) | 0x10;
        }
        else {
          uint64_t v43 = self->_isUserRequested | (2 * self->_compactMailbox);
        }
        error = self->_error;
        self->_error = 0;

        self->_int64_t result = (int64_t)[(MFLibraryStore *)v12 fetchMobileSynchronously:v17 preservingUID:self->_remoteID options:v43];
        unsigned int v45 = [(AutoFetchRequestPrivate *)self _fetchedSuccessfully];
        v46 = MFAutoFetchLog();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
        {
          int64_t result = self->_result;
          *(_DWORD *)buf = 134218496;
          v111 = self;
          __int16 v112 = 1024;
          *(_DWORD *)v113 = v45;
          *(_WORD *)&v113[4] = 2048;
          *(void *)&v113[6] = result;
          _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "%p Finished fetching successfully: %{BOOL}d results count: %ld", buf, 0x1Cu);
        }

        if (v45)
        {
          v48 = +[NSDate now];
          v49 = +[MailPersistentStorage sharedStorage];
          v50 = [(MFMailboxUid *)v15 URLString];
          [v49 setFetchDate:v48 forSource:v50];

          activityPersistence = self->_activityPersistence;
          v52 = [(EMActivity *)self->_activity objectID];
          [(EDActivityPersistence *)activityPersistence activityWithID:v52 setUserInfoObject:v48 forKey:EMActivityLastSuccessfulUpdateKey];
        }
        else
        {
          v53 = [(MFLibraryStore *)v12 account];
          v54 = [v53 connectionError];
          v55 = self->_error;
          self->_error = v54;

          if (!self->_error)
          {
            v56 = +[MFActivityMonitor currentMonitor];
            v57 = [v56 error];
            v58 = self->_error;
            self->_error = v57;

            if (!self->_error)
            {
              v59 = +[MFError errorWithDomain:MFMessageErrorDomain code:1030 localizedDescription:0];
              v60 = self->_error;
              self->_error = v59;
            }
          }
          v61 = MFAutoFetchLog();
          if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
          {
            [(MFError *)self->_error ef_publicDescription];
            objc_claimAutoreleasedReturnValue();
            sub_1000BFF70();
          }

          v62 = MFPowerLog();
          if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v104, "ef_publicDescription");
            objc_claimAutoreleasedReturnValue();
            [(MFError *)self->_error ef_publicDescription];
            objc_claimAutoreleasedReturnValue();
            sub_1000BFF24();
          }

          double Current = Current + -60000.0;
        }
        v63 = +[MFActivityMonitor currentMonitor];
        self->_gotNewMessagesState = (unint64_t)[v63 gotNewMessagesState];

        self->_responsiveness = CFAbsoluteTimeGetCurrent() - Current;
        [(AutoFetchRequestPrivate *)self logSummary:v103 error:self->_error];
        if ((v102 & 1) != 0
          || self->_loadNumOlderMessages
          && [(MFLibraryStore *)v12 serverMessageCount] != (id)0x7FFFFFFFFFFFFFFFLL)
        {
          v64 = [(MFLibraryStore *)v12 allNonDeletedCountIncludingServerSearch:0 andThreadSearch:1];
          v65 = [(MFLibraryStore *)v12 fetchWindowCap];
          int v66 = (int)v65;
          unsigned int v67 = v102;
          if (v65 > v64) {
            int v68 = 1;
          }
          else {
            int v68 = v102;
          }
          if (v68 == 1)
          {
            unint64_t loadNumOlderMessages = self->_loadNumOlderMessages;
            if (loadNumOlderMessages) {
              unsigned int v67 = 0;
            }
            if (v67 == 1)
            {
              v70 = MFAutoFetchLog();
              if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
              {
                v71 = objc_msgSend(v104, "ef_publicDescription");
                v72 = [(MFMailboxUid *)v15 ef_publicDescription];
                *(_DWORD *)buf = 134218754;
                v111 = self;
                __int16 v112 = 1024;
                *(_DWORD *)v113 = 3000;
                *(_WORD *)&v113[4] = 2114;
                *(void *)&v113[6] = v71;
                *(_WORD *)&v113[14] = 2114;
                *(void *)&v113[16] = v72;
                _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEFAULT, "%p Using server search to populate past the fetch window. Downloading %u messages for %{public}@, mailbox %{public}@", buf, 0x26u);
              }
              unint64_t v73 = 3000;
            }
            else if (loadNumOlderMessages >= v65 - v64)
            {
              unint64_t v73 = v65 - v64;
            }
            else
            {
              unint64_t v73 = self->_loadNumOlderMessages;
            }
            v76 = MFAutoFetchLog();
            if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
            {
              v77 = [(MFMailboxUid *)v15 ef_publicDescription];
              *(_DWORD *)buf = 134219010;
              v111 = self;
              __int16 v112 = 1024;
              *(_DWORD *)v113 = v73;
              *(_WORD *)&v113[4] = 2114;
              *(void *)&v113[6] = v77;
              *(_WORD *)&v113[14] = 1024;
              *(_DWORD *)&v113[16] = v64;
              *(_WORD *)&v113[20] = 1024;
              *(_DWORD *)&v113[22] = v66;
              _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_DEFAULT, "%p Fetching %u older messages for %{public}@ (local count: %u/%u)", buf, 0x28u);
            }
            [(MFLibraryStore *)v12 fetchNumMessages:v73 preservingUID:self->_remoteID options:12];
          }
          else
          {
            v74 = MFAutoFetchLog();
            if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
            {
              v75 = [(MFMailboxUid *)v15 ef_publicDescription];
              *(_DWORD *)buf = 138543874;
              v111 = v75;
              __int16 v112 = 1024;
              *(_DWORD *)v113 = v64;
              *(_WORD *)&v113[4] = 1024;
              *(_DWORD *)&v113[6] = v66;
              _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_DEFAULT, "NOT fetching older messages for %{public}@ (local count: %u/%u)", buf, 0x18u);
            }
          }
        }
        [(MFLibraryStore *)v12 updateServerUnreadCountClosingConnection:self->_closeConnection];
        v78 = +[DaemonAppController sharedController];
        v79 = [v78 trashCompactor];
        v80 = [(MFLibraryStore *)v12 account];
        [v79 emptyTrashForAccount:v80];

        id v81 = (id)qword_10016B708;
        objc_sync_enter(v81);
        [(id)qword_10016B708 removeObject:self];
        objc_sync_exit(v81);

        [(MFActivityMonitor *)self->_monitor setStartedFetch:0];
        v82 = self->_error;
        if (v82)
        {
          v83 = [(MFError *)v82 domain];
          v84 = +[NSError errorWithDomain:v83 code:[(MFError *)self->_error code] userInfo:0];

          NSErrorUserInfoKey v108 = NSUnderlyingErrorKey;
          v109 = v84;
          v85 = +[NSDictionary dictionaryWithObjects:&v109 forKeys:&v108 count:1];
          v86 = +[NSError em_internalErrorWithReason:@"Fetching failed with underlying error" userInfo:v85];
        }
        else
        {
          v86 = 0;
        }
        unsigned __int8 v87 = [(AutoFetchRequestPrivate *)self retry];
        if (v86) {
          unsigned __int8 v88 = v87;
        }
        else {
          unsigned __int8 v88 = 0;
        }
        if ((v88 & 1) == 0) {
          [(AutoFetchRequestPrivate *)self _markActivityDoneWithError:v86];
        }

        objc_destroyWeak(v106);
        objc_destroyWeak(&location);
        return;
      }
      v26 = MFAutoFetchLog();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "skipping scheduled fetch: conditions for 'automatic' no longer exist (charging)", buf, 2u);
      }
    }
    else
    {
      v26 = MFAutoFetchLog();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "skipping scheduled fetch: conditions for 'automatic' no longer exist (wi-fi)", buf, 2u);
      }
    }
  }
}

- (void)markAsDone
{
}

- (void)_healAccountWithCompletionHandler:(id)a3
{
  id v4 = a3;
  [(AutoFetchRequestPrivate *)self setRetry:0];
  unsigned int v5 = MFAutoFetchLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Fetch failed initial attempt. Scheduling silent heal and retry...", buf, 2u);
  }

  v6 = [MFAccountHealer alloc];
  v7 = [(AutoFetchRequestPrivate *)self account];
  uint64_t v8 = +[MFNetworkController sharedInstance];
  v9 = [(AutoFetchRequestPrivate *)self error];
  v10 = [(MFAccountHealer *)v6 initWithAccount:v7 networkController:v8 error:v9];

  uint64_t v11 = EFFetchSignpostLog();
  os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v11, v10);

  v13 = EFFetchSignpostLog();
  id v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    activity = self->_activity;
    *(_DWORD *)buf = 134349056;
    unsigned __int8 v25 = activity;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "AutoFetchHeal", "activity=%{signpost.description:attribute,public}p", buf, 0xCu);
  }

  CFStringRef v18 = _NSConcreteStackBlock;
  uint64_t v19 = 3221225472;
  v20 = sub_10000C5D0;
  v21 = &unk_100139F28;
  os_signpost_id_t v23 = v12;
  id v16 = v4;
  id v22 = v16;
  uint64_t v17 = objc_retainBlock(&v18);
  -[MFAccountHealer healSilentlyWithCompletion:](v10, "healSilentlyWithCompletion:", v17, v18, v19, v20, v21);
}

- (void)_markActivityDoneWithError:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(EMActivity *)self->_activity finished];

  if (!v5)
  {
    activityPersistence = self->_activityPersistence;
    v7 = [(EMActivity *)self->_activity objectID];
    [(EDActivityPersistence *)activityPersistence activityWithID:v7 finishedWithError:v4];

    if (v4)
    {
      uint64_t v8 = EFFetchSignpostLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v4, "ef_publicDescription");
        objc_claimAutoreleasedReturnValue();
        sub_1000BFFB4();
      }

      v9 = EFFetchSignpostLog();
      v10 = v9;
      os_signpost_id_t signpostID = self->_signpostID;
      if (signpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
      {
        id v12 = [v4 code];
        activity = self->_activity;
        int v18 = 134349312;
        id v19 = v12;
        __int16 v20 = 2050;
        v21 = activity;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_EVENT, signpostID, "AutoFetchRequest", "error code=%{signpost.description:attribute,public}lld activity=%{signpost.description:attribute,public}p", (uint8_t *)&v18, 0x16u);
      }
    }
    else
    {
      v10 = EFFetchSignpostLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        id v14 = self->_activity;
        *(_DWORD *)buf = 134217984;
        os_signpost_id_t v23 = v14;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Activity %p did finish.", buf, 0xCu);
      }
    }

    v15 = EFFetchSignpostLog();
    id v16 = v15;
    os_signpost_id_t v17 = self->_signpostID;
    if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      LOWORD(v18) = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v16, OS_SIGNPOST_INTERVAL_END, v17, "AutoFetchRequest", (const char *)&unk_10012893E, (uint8_t *)&v18, 2u);
    }
  }
}

- (void)_markAsPendingRetryWithPriority:(unint64_t)a3
{
  unsigned __int8 v3 = a3;
  unsigned int v5 = EFFetchSignpostLog();
  v6 = v5;
  os_signpost_id_t signpostID = self->_signpostID;
  if (signpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    activity = self->_activity;
    int v9 = 134349312;
    v10 = activity;
    __int16 v11 = 1026;
    int v12 = v3;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_EVENT, signpostID, "AutoFetchRequestRetryPending", "retry={signpost.description:attribute,public}YES activity=%{signpost.description:attribute,public}p priority=%{signpost.description:attribute,public}hhu", (uint8_t *)&v9, 0x12u);
  }
}

- (void)_markAsScheduled
{
  unsigned __int8 v3 = EFFetchSignpostLog();
  id v4 = v3;
  os_signpost_id_t signpostID = self->_signpostID;
  if (signpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    unsigned int v6 = [(AutoFetchRequestPrivate *)self retry];
    activity = self->_activity;
    v8[0] = 67240448;
    v8[1] = v6;
    __int16 v9 = 2050;
    v10 = activity;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v4, OS_SIGNPOST_EVENT, signpostID, "AutoFetchRequestRetrying", "retry=%{signpost.description:attribute,public}hhu activity=%{signpost.description:attribute,public}p", (uint8_t *)v8, 0x12u);
  }
}

- (void)_handleMonitorActivityMessage:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 userInfo];
  unsigned int v6 = [v5 objectForKey:MonitoredActivityMaxCount];
  v7 = [v5 objectForKey:MonitoredActivityCurrentCount];
  uint64_t v8 = [v5 objectForKeyedSubscript:MonitoredActivityReset];
  if (v8)
  {

    goto LABEL_6;
  }
  if (([(MFActivityMonitor *)self->_monitor isActive] & 1) == 0)
  {
LABEL_6:
    v10 = [(MFActivityMonitor *)self->_monitor error];

    if (v10)
    {
      __int16 v11 = [(MFActivityMonitor *)self->_monitor error];
      int v12 = [v11 domain];
      v13 = [(MFActivityMonitor *)self->_monitor error];
      id v14 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v12, [v13 code], 0);

      v15 = [(MFActivityMonitor *)self->_monitor error];
      id v16 = objc_msgSend(v15, "mf_shortDescription");

      id v17 = objc_alloc_init((Class)NSMutableDictionary);
      [v17 setObject:v14 forKeyedSubscript:NSUnderlyingErrorKey];
      if (v16) {
        [v17 setObject:v16 forKeyedSubscript:NSLocalizedDescriptionKey];
      }
    }
    goto LABEL_10;
  }
  __int16 v9 = [(EMActivity *)self->_activity finished];
  if (v9)
  {
  }
  else if ((uint64_t)[v6 longLongValue] >= 1)
  {
    activityPersistence = self->_activityPersistence;
    id v19 = [(EMActivity *)self->_activity objectID];
    -[EDActivityPersistence activityWithID:setCompletedCount:totalCount:](activityPersistence, "activityWithID:setCompletedCount:totalCount:", v19, [v7 longLongValue], objc_msgSend(v6, "longLongValue"));

    __int16 v20 = EFFetchSignpostLog();
    v21 = v20;
    os_signpost_id_t signpostID = self->_signpostID;
    if (signpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
    {
      v29[0] = 67240448;
      v29[1] = [v7 unsignedIntValue];
      __int16 v30 = 1026;
      unsigned int v31 = [v6 unsignedIntValue];
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v21, OS_SIGNPOST_EVENT, signpostID, "AutoFetchRequest", "current=%{signpost.description:attribute,public}u total=%{signpost.description:attribute,public}u", (uint8_t *)v29, 0xEu);
    }

    os_signpost_id_t v23 = [(EMActivity *)self->_activity userInfo];
    uint64_t v24 = EMActivityFetchStateKey;
    unsigned __int8 v25 = [v23 objectForKeyedSubscript:EMActivityFetchStateKey];
    BOOL v26 = [v25 integerValue] == (id)2;

    if (!v26)
    {
      v27 = self->_activityPersistence;
      uint64_t v28 = [(EMActivity *)self->_activity objectID];
      [(EDActivityPersistence *)v27 activityWithID:v28 setUserInfoObject:&off_100145FD8 forKey:v24];
    }
  }
LABEL_10:
}

- (BOOL)_fetchedSuccessfully
{
  return self->_result >= 0;
}

- (void)logSummary:(id)a3 error:(id)a4
{
  unsigned int v6 = (__CFString *)a3;
  id v7 = a4;
  if (self->_isPush)
  {
    CFStringRef v8 = @"push";
  }
  else if (self->_isScheduled)
  {
    CFStringRef v8 = @"poll";
  }
  else if (self->_isPowernapFetch)
  {
    CFStringRef v8 = @"powernap";
  }
  else if (self->_isUserRequested)
  {
    CFStringRef v8 = @"user";
  }
  else
  {
    CFStringRef v8 = @"other";
  }
  v20[0] = @"account";
  v20[1] = @"cause";
  CFStringRef v9 = @"nil";
  if (v6) {
    CFStringRef v9 = v6;
  }
  v21[0] = v9;
  v21[1] = v8;
  v20[2] = @"duration";
  v10 = +[NSString stringWithFormat:@"%.2fs", *(void *)&self->_responsiveness];
  v21[2] = v10;
  v20[3] = @"tx";
  __int16 v11 = +[NSNumber numberWithUnsignedInteger:[(MFActivityMonitor *)self->_monitor bytesWritten]];
  v21[3] = v11;
  v20[4] = @"rx";
  int v12 = +[NSNumber numberWithUnsignedInteger:[(MFActivityMonitor *)self->_monitor bytesRead]];
  v21[4] = v12;
  v20[5] = @"wifi";
  v13 = +[MFNetworkController sharedInstance];
  [v13 isFatPipe];
  id v14 = NSStringFromBOOL();
  v21[5] = v14;
  v15 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:6];
  id v16 = +[NSMutableDictionary dictionaryWithDictionary:v15];

  if (v7)
  {
    id v17 = [v7 domain];
    int v18 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@/%ld", v17, [v7 code]);
    [v16 setObject:v18 forKey:@"error"];
  }
  if ([(AutoFetchRequestPrivate *)self _fetchedSuccessfully])
  {
    id v19 = +[NSNumber numberWithInteger:self->_result];
    [v16 setObject:v19 forKey:@"numFetched"];
  }
  +[MFPowerController powerlog:@"AFC" eventData:v16];
}

- (MailAccount)account
{
  mailbox = self->_mailbox;
  if (!mailbox) {
    mailbox = self->_store;
  }
  id v4 = [(MFMailboxUid *)mailbox account];

  return (MailAccount *)v4;
}

- (BOOL)shouldNotify
{
  return 1;
}

- (BOOL)displayErrors
{
  return self->_displayErrors;
}

- (void)setDisplayErrors:(BOOL)a3
{
  self->_displayErrors = a3;
}

- (BOOL)shouldCompact
{
  return self->_compactMailbox;
}

- (void)setShouldCompact:(BOOL)a3
{
  self->_compactMailbox = a3;
}

- (BOOL)isVisibleFetch
{
  return self->_isVisibleFetch;
}

- (void)setIsVisibleFetch:(BOOL)a3
{
  self->_isVisibleFetch = a3;
}

- (BOOL)isPowernapFetch
{
  return self->_isPowernapFetch;
}

- (void)setIsPowernapFetch:(BOOL)a3
{
  self->_isPowernapFetch = a3;
}

- (unint64_t)gotNewMessagesState
{
  return self->_gotNewMessagesState;
}

- (void)setGotNewMessagesState:(unint64_t)a3
{
  self->_gotNewMessagesState = a3;
}

- (double)responsiveness
{
  return self->_responsiveness;
}

- (void)setResponsiveness:(double)a3
{
  self->_responsiveness = a3;
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
}

- (int64_t)result
{
  return self->_result;
}

- (MFMailboxUid)mailbox
{
  return self->_mailbox;
}

- (MFError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (BOOL)shouldLoadMessageBody
{
  return self->_shouldLoadMessageBody;
}

- (void)setShouldLoadMessageBody:(BOOL)a3
{
  self->_shouldLoadMessageBody = a3;
}

- (unint64_t)loadNumOlderMessages
{
  return self->_loadNumOlderMessages;
}

- (void)setLoadNumOlderMessages:(unint64_t)a3
{
  self->_unint64_t loadNumOlderMessages = a3;
}

- (BOOL)dontNotify
{
  return self->_dontNotify;
}

- (void)setDontNotify:(BOOL)a3
{
  self->_dontNotify = a3;
}

- (BOOL)retry
{
  return self->_retry;
}

- (void)setRetry:(BOOL)a3
{
  self->_retry = a3;
}

- (BOOL)closeConnection
{
  return self->_closeConnection;
}

- (void)setCloseConnection:(BOOL)a3
{
  self->_closeConnection = a3;
}

- (BOOL)isUserRequested
{
  return self->_isUserRequested;
}

- (void)setIsUserRequested:(BOOL)a3
{
  self->_isUserRequested = a3;
}

- (BOOL)isForegroundRequest
{
  return self->_isForegroundRequest;
}

- (void)setIsForegroundRequest:(BOOL)a3
{
  self->_isForegroundRequest = a3;
}

- (BOOL)shouldGrowFetchWindow
{
  return self->_shouldGrowFetchWindow;
}

- (void)setShouldGrowFetchWindow:(BOOL)a3
{
  self->_shouldGrowFetchWindow = a3;
}

- (BOOL)shouldLoadOlderMessages
{
  return self->_shouldLoadOlderMessages;
}

- (void)setShouldLoadOlderMessages:(BOOL)a3
{
  self->_shouldLoadOlderMessages = a3;
}

- (BOOL)downloadAllMessages
{
  return self->_downloadAllMessages;
}

- (void)setDownloadAllMessages:(BOOL)a3
{
  self->_downloadAllMessages = a3;
}

- (BOOL)isPush
{
  return self->_isPush;
}

- (void)setIsPush:(BOOL)a3
{
  self->_isPush = a3;
}

- (BOOL)isScheduled
{
  return self->_isScheduled;
}

- (void)setIsScheduled:(BOOL)a3
{
  self->_isScheduled = a3;
}

- (MFActivityMonitor)monitor
{
  return self->_monitor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monitor, 0);
  objc_storeStrong((id *)&self->_activityPersistence, 0);
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_mailbox, 0);

  objc_storeStrong((id *)&self->_remoteID, 0);
}

@end