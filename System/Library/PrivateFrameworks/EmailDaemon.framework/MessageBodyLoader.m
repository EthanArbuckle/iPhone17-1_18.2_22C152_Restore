@interface MessageBodyLoader
+ (OS_os_log)log;
+ (OS_os_log)signpostLog;
+ (id)attachmentManager;
+ (id)copySummaryForMessage:(id)a3 downloadIfNecessary:(BOOL)a4;
+ (id)loaderForAccount:(id)a3;
+ (void)_setSharedLoaderForTesting:(id)a3 account:(id)a4;
+ (void)accountsDidChange;
+ (void)applicationWillResume;
+ (void)applicationWillSuspend;
+ (void)initialize;
+ (void)pause;
+ (void)resume;
- (BOOL)_isRunning;
- (BOOL)_nts_isProcessingMessage:(id)a3;
- (BOOL)isPaused;
- (BOOL)isProcessingMessage:(id)a3;
- (BOOL)networkFetchingAllowed;
- (MailAccount)account;
- (MessageBodyLoader)init;
- (MessageBodyLoader)initWithLibrary:(id)a3;
- (id)copyDiagnosticInformation;
- (unint64_t)signpostID;
- (void)_applicationDidBecomeActive:(id)a3;
- (void)_applicationDidEnterBackground:(id)a3;
- (void)_cancelSleepIfNeeded;
- (void)_clearResumeTime;
- (void)_clientLoadFinished:(id)a3;
- (void)_finishedCullingMessageList:(id)a3;
- (void)_getNextClientOrMessage;
- (void)_getNextClientOrMessageFinished:(id)a3;
- (void)_logStats:(BOOL)a3;
- (void)_messageFlagsChanged:(id)a3;
- (void)_messageLoadFinished:(id)a3;
- (void)_messagesAdded:(id)a3;
- (void)_messagesWillBeCompacted:(id)a3;
- (void)_nts_insertClient:(id)a3;
- (void)_nts_removeClient:(id)a3;
- (void)_nts_sortClients;
- (void)_recordStats:(id)a3;
- (void)_releasePowerAssertion;
- (void)_removeNewMessages:(id)a3;
- (void)_removeNewMessages_nts:(id)a3;
- (void)_removeViewingMessages:(id)a3;
- (void)_retainPowerAssertion;
- (void)_setIsRunning:(BOOL)a3;
- (void)_start;
- (void)_tryProcessingQueues;
- (void)_waitUntilNotRunning;
- (void)addMessage:(id)a3;
- (void)addMessages:(id)a3;
- (void)addMessages_nts:(id)a3;
- (void)addSingleMessageClient:(id)a3;
- (void)applicationWillResume;
- (void)assertionDidExpire;
- (void)beginAddingNewMessagesForStore:(id)a3;
- (void)dealloc;
- (void)disableNetworkFetching;
- (void)enableNetworkFetching;
- (void)pause;
- (void)removeSingleMessageClient:(id)a3;
- (void)resume;
- (void)setAccount:(id)a3;
- (void)startup;
- (void)stopAddingNewMessagesForStore:(id)a3;
- (void)systemDidWake;
- (void)userStoppedViewingMessages;
- (void)userViewingMessages:(id)a3;
@end

@implementation MessageBodyLoader

+ (OS_os_log)signpostLog
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000423A4;
  block[3] = &unk_100139B30;
  block[4] = a1;
  if (qword_10016B968 != -1) {
    dispatch_once(&qword_10016B968, block);
  }
  v2 = (void *)qword_10016B960;

  return (OS_os_log *)v2;
}

- (unint64_t)signpostID
{
  v3 = [(id)objc_opt_class() signpostLog];
  os_signpost_id_t v4 = os_signpost_id_make_with_pointer(v3, self);

  return v4;
}

+ (OS_os_log)log
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004250C;
  block[3] = &unk_100139B30;
  block[4] = a1;
  if (qword_10016B978 != -1) {
    dispatch_once(&qword_10016B978, block);
  }
  v2 = (void *)qword_10016B970;

  return (OS_os_log *)v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    id v2 = objc_alloc_init((Class)NSMutableDictionary);
    v3 = (void *)qword_10016B980;
    qword_10016B980 = (uint64_t)v2;
  }
}

+ (void)_setSharedLoaderForTesting:(id)a3 account:(id)a4
{
  id v8 = a3;
  id v5 = a4;
  v6 = (void *)qword_10016B980;
  v7 = [v5 uniqueID];
  [v6 setObject:v8 forKeyedSubscript:v7];

  [v8 startup];
}

+ (id)loaderForAccount:(id)a3
{
  id v3 = a3;
  os_signpost_id_t v4 = [v3 uniqueID];
  if (v4)
  {
    id v5 = (id)qword_10016B980;
    objc_sync_enter(v5);
    v6 = [(id)qword_10016B980 objectForKeyedSubscript:v4];
    if (!v6)
    {
      v6 = objc_alloc_init(MessageBodyLoader);
      [(MessageBodyLoader *)v6 setAccount:v3];
      [(MessageBodyLoader *)v6 startup];
      [(id)qword_10016B980 setObject:v6 forKeyedSubscript:v4];
    }
    objc_sync_exit(v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (void)pause
{
  id obj = (id)qword_10016B980;
  objc_sync_enter(obj);
  id v2 = [(id)qword_10016B980 allValues];
  [v2 makeObjectsPerformSelector:"pause"];

  objc_sync_exit(obj);
}

+ (void)resume
{
  id obj = (id)qword_10016B980;
  objc_sync_enter(obj);
  id v2 = [(id)qword_10016B980 allValues];
  [v2 makeObjectsPerformSelector:"resume"];

  objc_sync_exit(obj);
}

+ (id)attachmentManager
{
  id v2 = +[DaemonAppController sharedController];
  id v3 = [v2 defaultAttachmentManager];

  return v3;
}

+ (id)copySummaryForMessage:(id)a3 downloadIfNecessary:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [v6 summary];

  if (v7)
  {
    id v8 = +[MessageBodyLoader log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = [v6 summary];
      id v10 = [v9 length];
      v11 = NSStringFromBOOL();
      objc_msgSend(v6, "ef_publicDescription");
      v12 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      *(void *)&buf[4] = v10;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v11;
      *(_WORD *)&buf[22] = 2114;
      v43 = v12;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "copySummaryForMessage return existing %lu-length summary (downloadIfNecessary %@): %{public}@", buf, 0x20u);
    }
    id v13 = [v6 summary];
  }
  else
  {
    v14 = +[MessageBodyLoader log];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = NSStringFromBOOL();
      v16 = objc_msgSend(v6, "ef_publicDescription");
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v15;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v16;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "copySummaryForMessage start (downloadIfNecessary %@): %{public}@", buf, 0x16u);
    }
    id v17 = objc_alloc((Class)MFMessageLoadingContext);
    v18 = [a1 attachmentManager];
    id v19 = [v17 initWithMessage:v6 attachmentManager:v18];

    v20 = +[EFScheduler immediateScheduler];
    [v19 load:0 scheduler:v20 shouldDownload:v4];

    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v43 = sub_100042EA4;
    v44 = sub_100042EB4;
    id v45 = 0;
    +[MFActivityMonitor currentMonitor];
    v30 = _NSConcreteStackBlock;
    uint64_t v31 = 3221225472;
    v32 = sub_100042EBC;
    v33 = &unk_10013B110;
    id v21 = (id)objc_claimAutoreleasedReturnValue();
    id v34 = v21;
    v35 = buf;
    id v22 = [v19 addLoadObserver:&v30];
    if (*(void *)(*(void *)&buf[8] + 40))
    {
      v23 = +[MessageBodyLoader log];
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromBOOL();
        id v24 = (id)objc_claimAutoreleasedReturnValue();
        id v25 = [*(id *)(*(void *)&buf[8] + 40) length];
        v26 = objc_msgSend(v6, "ef_publicDescription");
        *(_DWORD *)v36 = 138412802;
        id v37 = v24;
        __int16 v38 = 2048;
        id v39 = v25;
        __int16 v40 = 2114;
        v41 = v26;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "copySummaryForMessage end (downloadIfNecessary %@), body summary length = %lu: %{public}@", v36, 0x20u);
      }
    }
    else
    {
      v23 = +[MessageBodyLoader log];
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        v27 = NSStringFromBOOL();
        v28 = objc_msgSend(v6, "ef_publicDescription");
        *(_DWORD *)v36 = 138412546;
        id v37 = v27;
        __int16 v38 = 2114;
        id v39 = v28;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "copySummaryForMessage end (downloadIfNecessary %@), no body summary loaded: %{public}@", v36, 0x16u);
      }
    }

    id v13 = *(id *)(*(void *)&buf[8] + 40);
    _Block_object_dispose(buf, 8);
  }
  return v13;
}

- (MessageBodyLoader)init
{
  id v3 = +[MFMailMessageLibrary defaultInstance];
  BOOL v4 = [(MessageBodyLoader *)self initWithLibrary:v3];

  return v4;
}

- (MessageBodyLoader)initWithLibrary:(id)a3
{
  id v5 = a3;
  v35.receiver = self;
  v35.super_class = (Class)MessageBodyLoader;
  id v6 = [(MessageBodyLoader *)&v35 init];
  if (v6)
  {
    v7 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    clients = v6->_clients;
    v6->_clients = v7;

    v9 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    newMessages = v6->_newMessages;
    v6->_newMessages = v9;

    v11 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    newMessageSet = v6->_newMessageSet;
    v6->_newMessageSet = v11;

    id v13 = (NSCountedSet *)objc_alloc_init((Class)NSCountedSet);
    newMessageMailboxQuota = v6->_newMessageMailboxQuota;
    v6->_newMessageMailboxQuota = v13;

    v15 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v16 = dispatch_queue_create("MessageBodyLoaderQueue", v15);
    dispatchQueue = v6->_dispatchQueue;
    v6->_dispatchQueue = (OS_dispatch_queue *)v16;

    v18 = (MFInvocationQueue *)objc_alloc_init((Class)MFInvocationQueue);
    workQueue = v6->_workQueue;
    v6->_workQueue = v18;

    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v6);
    v20 = (EFCancelationToken *)objc_alloc_init((Class)EFCancelationToken);
    cancelationToken = v6->_cancelationToken;
    v6->_cancelationToken = v20;

    id v22 = v6->_cancelationToken;
    v23 = +[MFPowerController sharedInstance];
    id v24 = [v23 powerObservable];
    v29 = _NSConcreteStackBlock;
    uint64_t v30 = 3221225472;
    uint64_t v31 = sub_1000443FC;
    v32 = &unk_10013B138;
    objc_copyWeak(&v33, &location);
    id v25 = +[EFObserver observerWithResultBlock:&v29];
    v26 = objc_msgSend(v24, "subscribe:", v25, v29, v30, v31, v32);
    [(EFCancelationToken *)v22 addCancelable:v26];

    objc_storeStrong((id *)&v6->_library, a3);
    v27 = +[MFDiagnostics sharedController];
    [v27 addDiagnosticsGenerator:v6];

    objc_destroyWeak(&v33);
    objc_destroyWeak(&location);
  }

  return v6;
}

- (void)startup
{
  id v3 = +[MessageBodyLoader log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "startup: %@", (uint8_t *)&v5, 0xCu);
  }

  BOOL v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"_messageFlagsChanged:" name:MailMessageStoreMessageFlagsChanged object:self->_library];
  [v4 addObserver:self selector:"_messagesWillBeCompacted:" name:MailMessageStoreMessagesWillBeCompacted object:self->_library];
  MFRegisterPowerObserver();
}

- (void)dealloc
{
  MFUnregisterPowerObserver();
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  [(EFCancelationToken *)self->_cancelationToken cancel];
  [(MessageBodyLoader *)self _setIsRunning:0];
  v4.receiver = self;
  v4.super_class = (Class)MessageBodyLoader;
  [(MessageBodyLoader *)&v4 dealloc];
}

- (BOOL)networkFetchingAllowed
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100044708;
  v5[3] = &unk_10013B160;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)copyDiagnosticInformation
{
  id v3 = objc_alloc_init((Class)NSMutableString);
  [v3 appendString:@"\n"];
  [v3 appendString:@"==== Message Body Loader ====\n"];
  objc_super v4 = [(MessageBodyLoader *)self account];
  [v3 appendFormat:@"  Account         : %@\n", v4];

  objc_msgSend(v3, "appendFormat:", @"  Running         : %d\n", *((unsigned char *)self + 120) & 1);
  unsigned int v5 = [(MessageBodyLoader *)self isPaused];
  uint64_t v6 = "NO";
  if (v5) {
    uint64_t v6 = "YES";
  }
  objc_msgSend(v3, "appendFormat:", @"  Paused          : %s\n", v6);
  if (self->_resumeTime) {
    [v3 appendFormat:@"  Paused until    : %@\n", self->_resumeTime];
  }
  if (self->_noNetworkFetching) {
    CFStringRef v7 = @"NO";
  }
  else {
    CFStringRef v7 = @"YES";
  }
  [v3 appendFormat:@"  Network Fetching: %@\n", v7];
  objc_msgSend(v3, "appendFormat:", @"  Client Count    : %lu\n", -[NSMutableArray count](self->_clients, "count"));
  objc_msgSend(v3, "appendFormat:", @"  Messages Count  : %lu\n", -[NSMutableArray count](self->_newMessages, "count"));
  [v3 appendFormat:@"  Mailbox Quotas  : %@\n", self->_newMessageMailboxQuota];
  [v3 appendFormat:@"  Watched Uids    : %@\n", self->_watchedUids];
  objc_msgSend(v3, "appendFormat:", @"  Current Monitor : %p\n", self->_currentMonitor);
  objc_msgSend(v3, "appendFormat:", @"  Waiting for task: %d\n", (*((unsigned __int8 *)self + 120) >> 1) & 1);
  return v3;
}

- (void)_tryProcessingQueues
{
  if ((*((unsigned char *)self + 120) & 2) != 0)
  {
    dispatch_queue_t v16 = +[NSAssertionHandler currentHandler];
    [v16 handleFailureInMethod:a2 object:self file:@"MessageBodyLoader.m" lineNumber:451 description:@"should not try to process queues while we're running a task."];
  }
  unsigned int v3 = [(MessageBodyLoader *)self isPaused];
  char v4 = *((unsigned char *)self + 120);
  if (v3)
  {
    v4 &= ~4u;
    *((unsigned char *)self + 120) = v4;
  }
  if ((v4 & 4) != 0)
  {
    *((unsigned char *)self + 120) = v4 & 0xFB;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    unsigned int v5 = self->_newMessageMailboxQuota;
    id v6 = [(NSCountedSet *)v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v6)
    {
      char v7 = 0;
      uint64_t v8 = *(void *)v18;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v18 != v8) {
            objc_enumerationMutation(v5);
          }
          v7 |= -[NSCountedSet countForObject:](self->_newMessageMailboxQuota, "countForObject:", *(void *)(*((void *)&v17 + 1) + 8 * i), (void)v17) > 0xF0;
        }
        id v6 = [(NSCountedSet *)v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v6);

      if (v7)
      {
        id v10 = [[_MBLCullOldMessagesJob alloc] initForMBLMailbox:self];
        [v10 setMessages:self->_newMessages];
        v11 = +[MFMonitoredInvocation mf_invocationWithSelector:"run" target:v10];
        v12 = +[NSNotificationCenter defaultCenter];
        id v13 = [v11 monitor];
        [v12 addObserver:self selector:"_finishedCullingMessageList:" name:MonitoredActivityEnded object:v13];

        [(MFInvocationQueue *)self->_workQueue addInvocation:v11];
        *((unsigned char *)self + 120) |= 2u;

        return;
      }
    }
    else
    {
    }
    if (*((unsigned char *)self + 120))
    {
      [(MessageBodyLoader *)self _getNextClientOrMessage];
    }
    else
    {
      v14 = +[MessageBodyLoader log];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_1000C0FF8();
      }
    }
  }
  else
  {
    [(MessageBodyLoader *)self _setIsRunning:0];
  }
}

- (void)_getNextClientOrMessage
{
  id v6 = [[_MBLGetNextClientOrMessageJob alloc] initForMBLMailbox:self];
  [v6 setClients:self->_clients];
  [v6 setMessages:self->_newMessages];
  [v6 setViewingMessages:self->_userViewingMessages];
  unsigned int v3 = +[MFMonitoredInvocation mf_invocationWithSelector:"run" target:v6];
  char v4 = +[NSNotificationCenter defaultCenter];
  unsigned int v5 = [v3 monitor];
  [v4 addObserver:self selector:"_getNextClientOrMessageFinished:" name:MonitoredActivityEnded object:v5];

  [(MFInvocationQueue *)self->_workQueue addInvocation:v3];
  *((unsigned char *)self + 120) |= 2u;
}

- (void)_finishedCullingMessageList:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100044E7C;
  v7[3] = &unk_100139C20;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)_clientLoadFinished:(id)a3
{
  id v5 = a3;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100045010;
  block[3] = &unk_10013A8A8;
  block[4] = self;
  id v9 = v5;
  SEL v10 = a2;
  id v7 = v5;
  dispatch_async(dispatchQueue, block);
}

- (void)_messageLoadFinished:(id)a3
{
  id v5 = a3;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100045344;
  block[3] = &unk_10013A8A8;
  block[4] = self;
  id v9 = v5;
  SEL v10 = a2;
  id v7 = v5;
  dispatch_async(dispatchQueue, block);
}

- (void)_getNextClientOrMessageFinished:(id)a3
{
  id v5 = a3;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000456C4;
  block[3] = &unk_10013A8A8;
  block[4] = self;
  id v9 = v5;
  SEL v10 = a2;
  id v7 = v5;
  dispatch_async(dispatchQueue, block);
}

- (void)_messagesAdded:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100045C88;
  v7[3] = &unk_100139C20;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)_removeNewMessages_nts:(id)a3
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = a3;
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v13;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        -[NSMutableSet removeObject:](self->_newMessageSet, "removeObject:", v8, (void)v12);
        newMessageMailboxQuota = self->_newMessageMailboxQuota;
        uint64_t v10 = [v8 mailbox];
        if (v10) {
          v11 = (__CFString *)v10;
        }
        else {
          v11 = @"No Mailbox";
        }
        [(NSCountedSet *)newMessageMailboxQuota removeObject:v11];
      }
      id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }

  [(NSMutableArray *)self->_newMessages removeObjectsInArray:v4];
}

- (void)_removeNewMessages:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100045F30;
  v7[3] = &unk_100139C20;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)_removeViewingMessages:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100045FD4;
  v7[3] = &unk_100139C20;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)_messagesWillBeCompacted:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100046078;
  v7[3] = &unk_100139C20;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)_messageFlagsChanged:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000461B0;
  v7[3] = &unk_100139C20;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)addSingleMessageClient:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100046438;
  v7[3] = &unk_100139C20;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)removeSingleMessageClient:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100046520;
  v7[3] = &unk_100139C20;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(dispatchQueue, v7);
}

- (void)_nts_insertClient:(id)a3
{
  id v4 = a3;
  id v5 = objc_getAssociatedObject(v4, off_100169D10);
  if (!v5)
  {
    v21[0] = @"ordering";
    [v4 ordering];
    id v6 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v21[1] = @"priority";
    v22[0] = v6;
    id v7 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v4 priority]);
    v22[1] = v7;
    id v8 = +[NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:2];

    objc_setAssociatedObject(v4, off_100169D10, v8, (void *)0x301);
    id v5 = v8;
  }
  id v9 = [(NSMutableArray *)self->_clients ef_insertObject:v4 usingSortFunction:sub_1000467B4 context:0 allowDuplicates:0];
  uint64_t v10 = +[MessageBodyLoader log];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = (id)objc_opt_class();
    id v12 = [(NSMutableArray *)self->_clients count];
    int v13 = 138413058;
    id v14 = v11;
    __int16 v15 = 2048;
    id v16 = v4;
    __int16 v17 = 2048;
    id v18 = v9;
    __int16 v19 = 2048;
    id v20 = v12;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "client ADD: %@ %p idx: %lu count: %lu", (uint8_t *)&v13, 0x2Au);
  }
}

- (void)_nts_removeClient:(id)a3
{
  id v4 = a3;
  id v5 = [(NSMutableArray *)self->_clients ef_removeObject:v4 usingSortFunction:sub_1000467B4 context:0];
  objc_setAssociatedObject(v4, off_100169D10, 0, (void *)0x301);
  id v6 = +[MessageBodyLoader log];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = (id)objc_opt_class();
    id v8 = [(NSMutableArray *)self->_clients count];
    int v9 = 138413058;
    id v10 = v7;
    __int16 v11 = 2048;
    id v12 = v4;
    __int16 v13 = 2048;
    id v14 = v5;
    __int16 v15 = 2048;
    id v16 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "client DEL: %@ %p idx: %lu count: %lu", (uint8_t *)&v9, 0x2Au);
  }
}

- (void)_nts_sortClients
{
  if ([(NSMutableArray *)self->_clients count])
  {
    id v3 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_clients, "count"));
    clients = self->_clients;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100046C20;
    v8[3] = &unk_10013B188;
    id v5 = (NSMutableArray *)v3;
    int v9 = v5;
    [(NSMutableArray *)clients enumerateObjectsUsingBlock:v8];
    id v6 = self->_clients;
    self->_clients = v5;
    id v7 = v5;
  }
}

- (void)addMessage:(id)a3
{
  +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", a3, 0);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  -[MessageBodyLoader addMessages:](self, "addMessages:");
}

- (void)addMessages_nts:(id)a3
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = a3;
  id v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    char v6 = 0;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        int v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ((-[NSMutableSet containsObject:](self->_newMessageSet, "containsObject:", v9, (void)v13) & 1) == 0)
        {
          [(NSMutableArray *)self->_newMessages addObject:v9];
          [(NSMutableSet *)self->_newMessageSet addObject:v9];
          newMessageMailboxQuota = self->_newMessageMailboxQuota;
          uint64_t v11 = [v9 mailbox];
          if (v11) {
            id v12 = (__CFString *)v11;
          }
          else {
            id v12 = @"No Mailbox";
          }
          [(NSCountedSet *)newMessageMailboxQuota addObject:v12];

          char v6 = 1;
        }
      }
      id v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);

    if (v6)
    {
      *((unsigned char *)self + 120) |= 4u;
      [(MessageBodyLoader *)self _start];
    }
  }
  else
  {
  }
}

- (void)addMessages:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100047050;
  v7[3] = &unk_100139C20;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (BOOL)isProcessingMessage:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100047128;
  block[3] = &unk_10013AE88;
  id v9 = v4;
  id v10 = &v11;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(dispatchQueue, block);
  LOBYTE(dispatchQueue) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)dispatchQueue;
}

- (BOOL)_nts_isProcessingMessage:(id)a3
{
  id v4 = a3;
  if (([(MFMailMessage *)self->_currentMessage isEqual:v4] & 1) != 0
    || ([(NSMutableSet *)self->_newMessageSet containsObject:v4] & 1) != 0)
  {
    unsigned __int8 v5 = 1;
  }
  else
  {
    clients = self->_clients;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100047248;
    v8[3] = &unk_10013B1B0;
    id v9 = v4;
    unsigned __int8 v5 = [(NSMutableArray *)clients ef_any:v8];
  }
  return v5;
}

- (void)beginAddingNewMessagesForStore:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100047334;
  v7[3] = &unk_100139C20;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(dispatchQueue, v7);
}

- (void)stopAddingNewMessagesForStore:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000474D0;
  v7[3] = &unk_100139C20;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_sync(dispatchQueue, v7);
}

- (void)userViewingMessages:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100047628;
  v7[3] = &unk_100139C20;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)userStoppedViewingMessages
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100047714;
  block[3] = &unk_100139C48;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_waitUntilNotRunning
{
  [(MessageBodyLoader *)self _blockingMessage];
  [(MessageBodyLoader *)self mf_lock];
  if (*((unsigned char *)self + 120))
  {
    if (self->_waitReply) {
      sub_1000C10FC();
    }
    id v3 = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
    waitReply = self->_waitReply;
    self->_waitReply = v3;

    [(MessageBodyLoader *)self mf_unlock];
    dispatch_semaphore_wait((dispatch_semaphore_t)self->_waitReply, 0xFFFFFFFFFFFFFFFFLL);
    [(MessageBodyLoader *)self mf_lock];
    unsigned __int8 v5 = self->_waitReply;
    self->_waitReply = 0;
  }

  [(MessageBodyLoader *)self mf_unlock];
}

- (void)_setIsRunning:(BOOL)a3
{
  BOOL v3 = a3;
  [(MessageBodyLoader *)self mf_lock];
  char v5 = *((unsigned char *)self + 120);
  if (((((v5 & 1) == 0) ^ v3) & 1) == 0)
  {
    *((unsigned char *)self + 120) = v5 & 0xFE | v3;
    id v6 = +[MessageBodyLoader log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = NSStringFromBOOL();
      *(_DWORD *)buf = 138412290;
      id v18 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "_setIsRunning: %@", buf, 0xCu);
    }
    CFStringRef v15 = @"running";
    id v8 = NSStringFromBOOL();
    long long v16 = v8;
    id v9 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
    +[MFPowerController powerlog:@"MBL", v9, v15 eventData];

    if (v3)
    {
      [(MessageBodyLoader *)self _retainPowerAssertion];
      id v10 = +[MessageBodyLoader signpostLog];
      os_signpost_id_t v11 = [(MessageBodyLoader *)self signpostID];
      if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_BEGIN, v11, "MBL PROCESSING", (const char *)&unk_10012893E, buf, 2u);
      }
    }
    else
    {
      [(MessageBodyLoader *)self _releasePowerAssertion];
      id v12 = +[MessageBodyLoader signpostLog];
      os_signpost_id_t v13 = [(MessageBodyLoader *)self signpostID];
      if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_INTERVAL_END, v13, "MBL PROCESSING", (const char *)&unk_10012893E, buf, 2u);
      }

      [(MessageBodyLoader *)self _logStats:1];
      waitReply = self->_waitReply;
      if (waitReply) {
        dispatch_semaphore_signal(waitReply);
      }
    }
  }
  [(MessageBodyLoader *)self mf_unlock];
}

- (BOOL)_isRunning
{
  return *((unsigned char *)self + 120) & 1;
}

- (void)_start
{
  BOOL v3 = +[NSUserDefaults em_userDefaults];
  unsigned __int8 v4 = [v3 BOOLForKey:@"DisableBodyFetches"];

  if ((v4 & 1) == 0)
  {
    [(MessageBodyLoader *)self _cancelSleepIfNeeded];
    if ((*((unsigned char *)self + 120) & 2) == 0 && !self->_isPaused)
    {
      char v5 = +[MessageBodyLoader log];
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        id v6 = (id)objc_opt_new();
        uint64_t v7 = [(MessageBodyLoader *)self account];
        id v8 = [(NSMutableSet *)self->_newMessageSet count];
        newMessageSet = self->_newMessageSet;
        int v10 = 138413058;
        id v11 = v6;
        __int16 v12 = 2112;
        os_signpost_id_t v13 = v7;
        __int16 v14 = 2048;
        id v15 = v8;
        __int16 v16 = 2112;
        __int16 v17 = newMessageSet;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "start at %@\nAccount:%@ \nnewMessageSet [%ld]:%@", (uint8_t *)&v10, 0x2Au);
      }
      [(MessageBodyLoader *)self _setIsRunning:1];
      [(MessageBodyLoader *)self _tryProcessingQueues];
    }
  }
}

- (BOOL)isPaused
{
  return self->_isPaused != 0;
}

- (void)pause
{
  int v2 = 0;
  atomic_compare_exchange_strong_explicit(&self->_isPaused, (unsigned int *)&v2, 1u, memory_order_relaxed, memory_order_relaxed);
}

- (void)resume
{
  int v2 = 1;
  atomic_compare_exchange_strong_explicit(&self->_isPaused, (unsigned int *)&v2, 0, memory_order_relaxed, memory_order_relaxed);
  if (v2 == 1)
  {
    dispatchQueue = self->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100047CD4;
    block[3] = &unk_100139C48;
    block[4] = self;
    dispatch_async(dispatchQueue, block);
  }
}

- (void)enableNetworkFetching
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100047D60;
  block[3] = &unk_100139C48;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)disableNetworkFetching
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100047E70;
  block[3] = &unk_100139C48;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

+ (void)applicationWillSuspend
{
  id obj = (id)qword_10016B980;
  objc_sync_enter(obj);
  int v2 = [(id)qword_10016B980 allValues];
  [v2 makeObjectsPerformSelector:"applicationWillSuspend"];

  objc_sync_exit(obj);
}

- (void)applicationWillResume
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100047FF4;
  block[3] = &unk_100139C48;
  block[4] = self;
  dispatch_sync(dispatchQueue, block);
}

+ (void)applicationWillResume
{
  id obj = (id)qword_10016B980;
  objc_sync_enter(obj);
  int v2 = [(id)qword_10016B980 allValues];
  [v2 makeObjectsPerformSelector:"applicationWillResume"];

  objc_sync_exit(obj);
}

- (void)_applicationDidBecomeActive:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100048150;
  block[3] = &unk_100139C48;
  block[4] = self;
  dispatch_sync(dispatchQueue, block);
}

- (void)_applicationDidEnterBackground:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000481CC;
  block[3] = &unk_100139C48;
  block[4] = self;
  dispatch_sync(dispatchQueue, block);
}

+ (void)accountsDidChange
{
  id v2 = (id)qword_10016B980;
  objc_sync_enter(v2);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  BOOL v3 = objc_msgSend((id)qword_10016B980, "allKeys", 0);
  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v11;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void *)(*((void *)&v10 + 1) + 8 * i);
        id v8 = +[MailAccount accountWithUniqueId:v7];
        id v9 = v8;
        if (!v8 || ([v8 isActive] & 1) == 0) {
          [(id)qword_10016B980 removeObjectForKey:v7];
        }
      }
      id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }

  objc_sync_exit(v2);
}

- (void)_recordStats:(id)a3
{
  id v4 = a3;
  int v5 = [(MFActivityMonitor *)self->_currentMonitor bytesRead];
  signed int v6 = [(MFActivityMonitor *)self->_currentMonitor bytesWritten];
  signed int v7 = v6;
  if (v5 > 0 || v6 >= 1)
  {
    if (objc_opt_respondsToSelector()) {
      id v9 = [v4 libraryID];
    }
    else {
      id v9 = 0;
    }
    v29 = [v4 account];
    long long v10 = [v29 loggingIdentifier];
    double Current = CFAbsoluteTimeGetCurrent();
    [(MFActivityMonitor *)self->_currentMonitor startTime];
    double v13 = v12;
    __int16 v14 = +[MFNetworkController sharedInstance];
    [v14 isFatPipe];

    id v15 = +[MessageBodyLoader log];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v16 = [v29 loggingIdentifier];
      __int16 v17 = NSStringFromBOOL();
      *(_DWORD *)buf = 138413570;
      uint64_t v31 = v16;
      __int16 v32 = 2048;
      id v33 = v9;
      __int16 v34 = 2048;
      double v35 = Current - v13;
      __int16 v36 = 1024;
      signed int v37 = v7;
      __int16 v38 = 1024;
      int v39 = v5;
      __int16 v40 = 2112;
      v41 = v17;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "account=%@; lid=%lld; duration=%.2fs; tx=%d; rx=%d; wifi=%@",
        buf,
        0x36u);
    }
    id v18 = [(MFActivityMonitor *)self->_currentMonitor error];
    if (v18)
    {
      __int16 v19 = +[MessageBodyLoader log];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        id v20 = objc_msgSend(v18, "ef_publicDescription");
        *(_DWORD *)buf = 138543362;
        uint64_t v31 = v20;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "an error occurred while loading message: %{public}@", buf, 0xCu);
      }
    }
    bytesPerAccount = self->_bytesPerAccount;
    if (!bytesPerAccount)
    {
      id v22 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      v23 = self->_bytesPerAccount;
      self->_bytesPerAccount = v22;

      bytesPerAccount = self->_bytesPerAccount;
    }
    id v24 = [(NSMutableDictionary *)bytesPerAccount objectForKey:v10];
    id v25 = v24;
    uint64_t v26 = v7 + v5;
    if (v24) {
      v26 += (uint64_t)[v24 unsignedIntegerValue];
    }
    v27 = self->_bytesPerAccount;
    v28 = +[NSNumber numberWithUnsignedInteger:v26];
    [(NSMutableDictionary *)v27 setObject:v28 forKey:v10];
  }
}

- (void)_logStats:(BOOL)a3
{
  BOOL v14 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id obj = [(NSMutableDictionary *)self->_bytesPerAccount allKeys];
  id v4 = [obj countByEnumeratingWithState:&v16 objects:v26 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v17;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v17 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        id v8 = [(NSMutableDictionary *)self->_bytesPerAccount objectForKey:v7];
        id v9 = +[MessageBodyLoader log];
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          if (v8) {
            long long v10 = v8;
          }
          else {
            long long v10 = &off_100146188;
          }
          uint64_t v23 = v7;
          __int16 v24 = 2112;
          id v25 = v10;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "account=%@; tx+rx=%@", buf, 0x16u);
        }

        v20[0] = @"account";
        v20[1] = @"tx+rx";
        if (v8) {
          long long v11 = v8;
        }
        else {
          long long v11 = &off_100146188;
        }
        v21[0] = v7;
        v21[1] = v11;
        double v12 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:2];
        +[MFPowerController powerlog:@"MBL" eventData:v12];
      }
      id v4 = [obj countByEnumeratingWithState:&v16 objects:v26 count:16];
    }
    while (v4);
  }

  if (v14)
  {
    bytesPerAccount = self->_bytesPerAccount;
    self->_bytesPerAccount = 0;
  }
}

- (void)assertionDidExpire
{
  BOOL v3 = +[MessageBodyLoader log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    sub_1000C115C();
  }

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100048A00;
  block[3] = &unk_100139C48;
  block[4] = self;
  dispatch_sync(dispatchQueue, block);
}

- (void)systemDidWake
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100048CC8;
  block[3] = &unk_100139C48;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_cancelSleepIfNeeded
{
  resumeTime = self->_resumeTime;
  if (resumeTime)
  {
    id v4 = +[NSDate date];
    uint64_t v5 = [v4 earlierDate:self->_resumeTime];

    if (resumeTime == v5)
    {
      [(MessageBodyLoader *)self _clearResumeTime];
      self->_isPaused = 0;
    }
  }
}

- (void)_clearResumeTime
{
  resumeTime = self->_resumeTime;
  if (resumeTime)
  {
    v6[0] = @"cancelledExpiration";
    v6[1] = @"resumeTimeWas";
    v7[0] = &off_1001461A0;
    v7[1] = resumeTime;
    id v4 = +[NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:2];
    +[MFPowerController powerlog:@"MBL" eventData:v4];

    uint64_t v5 = self->_resumeTime;
    self->_resumeTime = 0;
  }
}

- (void)_retainPowerAssertion
{
  if ((*((unsigned char *)self + 120) & 8) == 0)
  {
    BOOL v3 = +[MFPowerController sharedInstance];
    [v3 retainAssertionWithIdentifier:@"com.apple.mobilemail.messagebodyloader"];

    *((unsigned char *)self + 120) |= 8u;
  }
}

- (void)_releasePowerAssertion
{
  if ((*((unsigned char *)self + 120) & 8) != 0)
  {
    BOOL v3 = +[MFPowerController sharedInstance];
    [v3 releaseAssertionWithIdentifier:@"com.apple.mobilemail.messagebodyloader"];

    *((unsigned char *)self + 120) &= ~8u;
  }
}

- (MailAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_currentMessage, 0);
  objc_storeStrong((id *)&self->_bytesPerAccount, 0);
  objc_storeStrong((id *)&self->_resumeTime, 0);
  objc_storeStrong((id *)&self->_waitReply, 0);
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_cancelationToken, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_watchedUids, 0);
  objc_storeStrong((id *)&self->_currentMonitor, 0);
  objc_storeStrong((id *)&self->_userViewingMessages, 0);
  objc_storeStrong((id *)&self->_newMessageMailboxQuota, 0);
  objc_storeStrong((id *)&self->_newMessageSet, 0);
  objc_storeStrong((id *)&self->_newMessages, 0);

  objc_storeStrong((id *)&self->_clients, 0);
}

@end