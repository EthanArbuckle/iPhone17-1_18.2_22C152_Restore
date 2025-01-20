@interface MFDeliveryQueue
+ (id)log;
+ (id)newDeliveryObjectFactoryForMessage:(id)a3;
+ (id)sharedDeliveryQueue;
+ (id)signpostLog;
- (BOOL)_shouldSend:(id)a3 options:(id)a4;
- (BOOL)cancelLastDelayedMessage;
- (BOOL)isBusy;
- (BOOL)isProcessing;
- (BOOL)isReady;
- (BOOL)isSuspended;
- (EDMessageDeliveryHookResponder)deliveryHookResponder;
- (EDMessagePersistence)messagePersistence;
- (EFScheduler)delayedMessageScheduler;
- (EFScheduler)observationScheduler;
- (MFDeliveryQueue)init;
- (NSHashTable)observers;
- (NSMutableArray)delayedMessages;
- (id)_append:(id)a3 flags:(id)a4;
- (id)_deliverSynchronously:(id)a3 outboxCopy:(id)a4;
- (id)_deliveryResultIfNotHasAdequateFreeSpace;
- (id)_messagesInProgress;
- (id)_outboxCopyFromMessageDelivery:(id)a3;
- (id)_outboxStore;
- (id)_sortedMessages;
- (id)append:(id)a3;
- (id)copyDiagnosticInformation;
- (id)deliverSynchronously:(id)a3;
- (id)freeSpaceMonitor;
- (id)lastErrorForMessage:(id)a3;
- (unint64_t)hasAdequateFreeSpace;
- (unint64_t)numberOfPendingMessages;
- (unint64_t)signpostID;
- (void)_flagsChanged:(id)a3;
- (void)_freeSpaceStatusDidChange:(id)a3;
- (void)_logDeliveryResult:(id)a3 forMessage:(id)a4 account:(id)a5;
- (void)_mailAccountsChanged:(id)a3;
- (void)_messagesAdded:(id)a3;
- (void)_messagesCompacted:(id)a3;
- (void)_processQueueWithOptions:(id)a3;
- (void)_queueProcessingDidFinish:(id)a3;
- (void)_reachabilityChanged:(id)a3;
- (void)_sendProcessingFinishedNotificationWithSentMessages:(id)a3 failedMessages:(id)a4 playSound:(BOOL)a5;
- (void)_sendProcessingStartedNotification:(id)a3;
- (void)_setDeliveryFlag:(id)a3 state:(BOOL)a4;
- (void)_setErrorForMessage:(id)a3 error:(id)a4;
- (void)_setErrorForMessageLibraryID:(id)a3 error:(id)a4;
- (void)_updateCounts;
- (void)_updateDeliveryInfoFromResult:(id)a3 forMessage:(id)a4;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)deliverAsynchronously:(id)a3 completion:(id)a4;
- (void)notifyObserversOfDelayedMessagesDidChange:(BOOL)a3;
- (void)notifyObserversOfUpdatedPendingMessageCount:(unint64_t)a3;
- (void)processQueue;
- (void)processQueueAndPlaySoundOnSuccess:(BOOL)a3 forceAll:(BOOL)a4;
- (void)processQueueAndPlaySoundOnSuccess:(BOOL)a3 forceAll:(BOOL)a4 isUserRequested:(BOOL)a5;
- (void)removeObserver:(id)a3;
- (void)resume;
- (void)setDelayedMessageScheduler:(id)a3;
- (void)setDelayedMessages:(id)a3;
- (void)setHasAdequateFreeSpace:(unint64_t)a3;
- (void)setObservationScheduler:(id)a3;
- (void)setPercentDone:(double)a3;
- (void)suspend;
- (void)test_waitForObservers;
@end

@implementation MFDeliveryQueue

+ (id)log
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005BCF8;
  block[3] = &unk_100139B30;
  block[4] = a1;
  if (qword_10016BA68 != -1) {
    dispatch_once(&qword_10016BA68, block);
  }
  v2 = (void *)qword_10016BA60;

  return v2;
}

+ (id)signpostLog
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005BE1C;
  block[3] = &unk_100139B30;
  block[4] = a1;
  if (qword_10016BA78 != -1) {
    dispatch_once(&qword_10016BA78, block);
  }
  v2 = (void *)qword_10016BA70;

  return v2;
}

- (unint64_t)signpostID
{
  v3 = [(id)objc_opt_class() signpostLog];
  os_signpost_id_t v4 = os_signpost_id_make_with_pointer(v3, self);

  return v4;
}

- (MFDeliveryQueue)init
{
  v39.receiver = self;
  v39.super_class = (Class)MFDeliveryQueue;
  v3 = [(MFDeliveryQueue *)&v39 init];
  if (v3)
  {
    if ((+[MFMailMessageLibrary canUsePersistence] & 1) == 0)
    {
      v36 = +[NSAssertionHandler currentHandler];
      [v36 handleFailureInMethod:a2, v3, @"MFDeliveryQueue.m", 149, @"App is in daemon mode, but accessing database" object file lineNumber description];
    }
    v3->_state = 2;
    [(MFDeliveryQueue *)v3 setHasAdequateFreeSpace:0];
    os_signpost_id_t v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.mobilemail.delivery", v4);
    stateQueue = v3->_stateQueue;
    v3->_stateQueue = (OS_dispatch_queue *)v5;

    v7 = (MFInvocationQueue *)objc_alloc_init((Class)MFInvocationQueue);
    jobQueue = v3->_jobQueue;
    v3->_jobQueue = v7;

    uint64_t v9 = +[NSHashTable weakObjectsHashTable];
    observers = v3->_observers;
    v3->_observers = (NSHashTable *)v9;

    uint64_t v11 = +[EFScheduler serialDispatchQueueSchedulerWithName:@"com.apple.email.MFDeliveryQueue.ObservationScheduler" qualityOfService:17];
    observationScheduler = v3->_observationScheduler;
    v3->_observationScheduler = (EFScheduler *)v11;

    v13 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    delayedMessages = v3->_delayedMessages;
    v3->_delayedMessages = v13;

    v3->_delayedMessagesLock._os_unfair_lock_opaque = 0;
    uint64_t v15 = +[EFScheduler serialDispatchQueueSchedulerWithName:@"com.apple.email.MFDeliveryQueue.delayedMessagesScheduler" qualityOfService:17];
    delayedMessageScheduler = v3->_delayedMessageScheduler;
    v3->_delayedMessageScheduler = (EFScheduler *)v15;

    v17 = [(MFDeliveryQueue *)v3 _outboxStore];
    v18 = [(MFDeliveryQueue *)v3 _messagesInProgress];
    if ([v18 count])
    {
      v19 = +[MFDeliveryQueue log];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v20 = [v18 count];
        *(_DWORD *)buf = 67109120;
        unsigned int v43 = v20;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Resetting delivery state for %d messages", buf, 8u);
      }

      v40[0] = MessageIsBeingDelivered;
      v40[1] = MessageQueuedForDelivery;
      v41[0] = &__kCFBooleanFalse;
      v41[1] = &__kCFBooleanTrue;
      v21 = +[NSDictionary dictionaryWithObjects:v41 forKeys:v40 count:2];
      id v22 = [v17 setFlagsFromDictionary:v21 forMessages:v18];
    }
    v23 = +[CPNetworkObserver sharedNetworkObserver];
    if ([v23 isNetworkReachable]) {
      char v24 = 4;
    }
    else {
      char v24 = 0;
    }
    *((unsigned char *)v3 + 56) = *((unsigned char *)v3 + 56) & 0xFB | v24;

    v25 = +[NSNotificationCenter defaultCenter];
    [v25 addObserver:v3 selector:"_mailAccountsChanged:" name:ECMailAccountsDidChangeNotification object:0];
    [v25 addObserver:v3 selector:"_queueProcessingDidFinish:" name:@"MFDeliveryQueueProcessingFinishedNotification" object:0];
    [v25 addObserver:v3 selector:"_messagesCompacted:" name:MailMessageStoreMessagesCompacted object:0];
    LocalCenter = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterAddObserver(LocalCenter, v3, (CFNotificationCallback)sub_10005C4F4, kCFLocaleCurrentLocaleDidChangeNotification, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v27 = +[CPNetworkObserver sharedNetworkObserver];
    [v27 addNetworkReachableObserver:v3 selector:"_reachabilityChanged:"];

    v28 = +[MFDiagnostics sharedController];
    [v28 addDiagnosticsGenerator:v3];

    v29 = +[UMUserManager sharedManager];
    v30 = [v29 currentUser];
    unsigned int v31 = [v30 uid];
    LOBYTE(v31) = v31 == getuid();

    if (v31)
    {
      v32 = [(MFDeliveryQueue *)v3 freeSpaceMonitor];
      [v25 addObserver:v3 selector:"_freeSpaceStatusDidChange:" name:@"MFDiskFreeSpaceMonitorDidChangeNotification" object:v32];

      v33 = +[MFDeliveryQueue log];
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Checking free space status", buf, 2u);
      }

      v34 = [(MFDeliveryQueue *)v3 freeSpaceMonitor];
      v37[0] = _NSConcreteStackBlock;
      v37[1] = 3221225472;
      v37[2] = sub_10005C588;
      v37[3] = &unk_10013BB98;
      v38 = v3;
      [v34 getFreeSpaceStatusWithCompletionHandler:v37];
    }
    else
    {
      v3->_state = 0;
      [(MFDeliveryQueue *)v3 setHasAdequateFreeSpace:2];
      [(MFDeliveryQueue *)v3 _updateCounts];
    }
  }
  return v3;
}

- (void)dealloc
{
  v3 = +[CPNetworkObserver sharedNetworkObserver];
  [v3 removeNetworkReachableObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)MFDeliveryQueue;
  [(MFDeliveryQueue *)&v4 dealloc];
}

+ (id)sharedDeliveryQueue
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005C774;
  block[3] = &unk_100139B30;
  block[4] = a1;
  if (qword_10016BA80 != -1) {
    dispatch_once(&qword_10016BA80, block);
  }
  v2 = (void *)qword_10016BA88;

  return v2;
}

- (id)freeSpaceMonitor
{
  return +[MFDiskFreeSpaceMonitor defaultMonitor];
}

- (EDMessagePersistence)messagePersistence
{
  v2 = +[MFMailMessageLibrary defaultInstance];
  v3 = [v2 persistence];
  objc_super v4 = [v3 messagePersistence];

  return (EDMessagePersistence *)v4;
}

- (BOOL)isReady
{
  return self->_state == 0;
}

- (BOOL)isProcessing
{
  return self->_state == 1;
}

- (BOOL)isSuspended
{
  return self->_state == 2;
}

- (BOOL)isBusy
{
  return [(MFDeliveryQueue *)self isProcessing] || self->_numberOfCurrentSynchronousDeliveries > 0;
}

- (void)processQueue
{
}

- (void)processQueueAndPlaySoundOnSuccess:(BOOL)a3 forceAll:(BOOL)a4
{
}

- (void)processQueueAndPlaySoundOnSuccess:(BOOL)a3 forceAll:(BOOL)a4 isUserRequested:(BOOL)a5
{
  stateQueue = self->_stateQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10005C940;
  v6[3] = &unk_10013BBC0;
  v6[4] = self;
  BOOL v7 = a3;
  BOOL v8 = a4;
  BOOL v9 = a5;
  dispatch_async(stateQueue, v6);
}

- (void)suspend
{
  stateQueue = self->_stateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005CB90;
  block[3] = &unk_100139C48;
  block[4] = self;
  dispatch_async(stateQueue, block);
}

- (void)resume
{
  stateQueue = self->_stateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005CD50;
  block[3] = &unk_100139C48;
  block[4] = self;
  dispatch_async(stateQueue, block);
}

- (void)_freeSpaceStatusDidChange:(id)a3
{
  objc_super v4 = [(MFDeliveryQueue *)self freeSpaceMonitor];
  unsigned int v5 = [v4 isFreeSpaceCritical];

  v6 = +[MFDeliveryQueue log];
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "low disk mode turned ON, stopping delivery", buf, 2u);
    }

    [(MFDeliveryQueue *)self setHasAdequateFreeSpace:1];
    [(MFDeliveryQueue *)self suspend];
  }
  else
  {
    if (v7)
    {
      *(_WORD *)BOOL v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "low disk mode turned OFF, resuming delivery", v8, 2u);
    }

    [(MFDeliveryQueue *)self setHasAdequateFreeSpace:2];
    [(MFDeliveryQueue *)self resume];
  }
}

- (unint64_t)numberOfPendingMessages
{
  return self->_messagesFromActiveAccounts;
}

- (id)append:(id)a3
{
  id v4 = a3;
  uint64_t v8 = MessageQueuedForDelivery;
  BOOL v9 = &__kCFBooleanTrue;
  unsigned int v5 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  v6 = [(MFDeliveryQueue *)self _append:v4 flags:v5];

  return v6;
}

- (id)deliverSynchronously:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(MFDeliveryQueue *)self _deliveryResultIfNotHasAdequateFreeSpace];
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    uint64_t v8 = [(MFDeliveryQueue *)self _outboxCopyFromMessageDelivery:v4];
    id v7 = [(MFDeliveryQueue *)self _deliverSynchronously:v4 outboxCopy:v8];
  }

  return v7;
}

- (id)_deliveryResultIfNotHasAdequateFreeSpace
{
  if ((id)[(MFDeliveryQueue *)self hasAdequateFreeSpace] == (id)1)
  {
    v3 = +[MFDeliveryQueue log];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Aborting synchronus delivery to inadequate free space", v7, 2u);
    }

    id v4 = [objc_alloc((Class)NSError) initWithDomain:NSPOSIXErrorDomain code:28 userInfo:0];
    id v5 = [objc_alloc((Class)EMMessageDeliveryResult) initWithStatus:2 error:v4];
  }
  else
  {
    if (![(MFDeliveryQueue *)self hasAdequateFreeSpace]) {
      [(MFDeliveryQueue *)self suspend];
    }
    id v5 = 0;
  }

  return v5;
}

- (id)_outboxCopyFromMessageDelivery:(id)a3
{
  id v4 = [a3 message];
  uint64_t v8 = MessageIsBeingDelivered;
  BOOL v9 = &__kCFBooleanTrue;
  id v5 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  v6 = [(MFDeliveryQueue *)self _append:v4 flags:v5];

  return v6;
}

- (id)_deliverSynchronously:(id)a3 outboxCopy:(id)a4
{
  id v6 = a3;
  id v59 = a4;
  ++self->_numberOfCurrentSynchronousDeliveries;
  v55 = [(MFDeliveryQueue *)self _outboxStore];
  uint64_t v7 = [v6 message];
  v58 = (void *)v7;
  v57 = +[MailAccount accountThatMessageIsFrom:v7 includingInactive:1];
  uint64_t v8 = +[MFDeliveryQueue signpostLog];
  os_signpost_id_t v9 = [(MFDeliveryQueue *)self signpostID];
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v65 = v7;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_BEGIN, v9, "EMAIL DELIVERY", "Begin Delivery Message : %@", buf, 0xCu);
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v10 = v6;
  }
  else
  {
    id v10 = +[MFMailDropMailDeliveryUI newWithMessage:v59];

    [v10 setDelegate:self];
    [v10 setIsUserRequested:1];
    [v10 setArchiveAccount:v57];
  }
  v71[0] = @"MFDeliveryQueueMonitorKey";
  uint64_t v11 = +[MFActivityMonitor currentMonitor];
  v71[1] = @"MFDeliveryQueueMailboxKey";
  v72[0] = v11;
  v12 = [v55 mailbox];
  v72[1] = v12;
  v56 = +[NSDictionary dictionaryWithObjects:v72 forKeys:v71 count:2];

  v13 = +[NSNotificationCenter defaultCenter];
  [v13 postNotificationName:@"MFDeliveryQueueDeliverSynchronouslyStartNotification" object:v56];

  [v10 setIsUserRequested:1];
  if (!v59)
  {
    v14 = +[MFDeliveryQueue log];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Failed to append message to outbox, continuing with delivery", buf, 2u);
    }
  }
  if ((*((unsigned char *)self + 56) & 4) == 0)
  {
    uint64_t v15 = +[MFDeliveryQueue log];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Network may not be reachable, but attempting delivery anyway", buf, 2u);
    }
  }
  v61[0] = _NSConcreteStackBlock;
  v61[1] = 3221225472;
  v61[2] = sub_10005DF74;
  v61[3] = &unk_10013BBE8;
  id v16 = v59;
  id v62 = v16;
  id v54 = v55;
  id v63 = v54;
  v60 = [v10 deliverSynchronouslyWithCompletion:v61];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v17 = v10;
    if ([v60 status] == (id)8) {
      objc_msgSend(v17, "setMailDropState:", objc_msgSend(v60, "attributes"));
    }
    id v18 = [v17 mailDropState];
    v19 = [(MFDeliveryQueue *)self messagePersistence];
    [v19 setMailDropDeliveryState:v18 forMessage:v16];
  }
  [(MFDeliveryQueue *)self _logDeliveryResult:v60 forMessage:v58 account:v57];
  uint64_t v20 = (uint64_t)[v60 status];
  if (v59) {
    [(MFDeliveryQueue *)self _setDeliveryFlag:v16 state:0];
  }
  if ([v57 supportsThreadOperations] && objc_msgSend(v10, "conversationFlags"))
  {
    id v21 = [v10 originalConversationId];
    if (!v21)
    {
      id v22 = [v10 message];
      id v21 = [v22 messageIDHash];
    }
    v23 = +[MFMailMessageLibrary defaultInstance];
    char v24 = [v23 persistence];
    v25 = [v24 conversationPersistence];
    id v26 = [v10 conversationFlags];
    v27 = +[NSNumber numberWithLongLong:v21];
    v70 = v27;
    v28 = +[NSArray arrayWithObjects:&v70 count:1];
    [v25 setPersistenceConversationFlags:v26 forConversationIDs:v28 reason:4];
  }
  v29 = +[NSNotificationCenter defaultCenter];
  [v29 postNotificationName:@"MFDeliveryQueueDeliverSynchronouslyFinishNotification" object:v56];

  if (v20 == 9)
  {
    id v32 = [v10 retryCount];
    if ((uint64_t)v32 <= 0) {
      uint64_t v20 = 9;
    }
    else {
      uint64_t v20 = 2;
    }
    if (v59 && (uint64_t)v32 <= 0)
    {
      id v69 = v16;
      v33 = +[NSArray arrayWithObjects:&v69 count:1];
      [v54 deleteMessages:v33 moveToTrash:0];

      unsigned int v31 = 0;
      [v54 doCompact];
      uint64_t v20 = 9;
      goto LABEL_49;
    }
  }
  else if (!v20)
  {
    v30 = +[MFDeliveryQueue log];
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Message delivery succeeded", buf, 2u);
    }

    if (v59)
    {
      unsigned int v31 = 0;
      [v54 doCompact];
      uint64_t v20 = 0;
    }
    else
    {
      uint64_t v20 = 0;
      unsigned int v31 = 0;
    }
    goto LABEL_49;
  }
  unsigned int v31 = 0;
  if (v20 != 4 && v20 != 9)
  {
    v34 = +[MFDeliveryQueue log];
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Message delivery failed", buf, 2u);
    }

    v35 = +[MFActivityMonitor currentMonitor];
    unsigned int v31 = [v35 error];

    if (!v31)
    {
      v36 = MFLookupLocalizedString();
      v37 = [v10 account];
      v38 = [v37 hostname];
      objc_super v39 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v36, v38);

      v40 = MFLookupLocalizedString();
      unsigned int v31 = +[MFError errorWithDomain:MFMessageErrorDomain code:1030 localizedDescription:v39 title:v40 userInfo:&off_1001465D8];
    }
    if (v59)
    {
      id v68 = v16;
      v41 = +[NSArray arrayWithObjects:&v68 count:1];
      [v54 setFlag:MessageQueuedForDelivery state:1 forMessages:v41];

      v42 = [v10 account];
      [v31 setUserInfoObject:v42 forKey:@"account"];

      [(MFDeliveryQueue *)self _updateDeliveryInfoFromResult:v60 forMessage:v16];
      unsigned int v43 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v16 libraryID]);
      [(MFDeliveryQueue *)self _setErrorForMessageLibraryID:v43 error:v31];

      [(MFDeliveryQueue *)self _updateCounts];
      uint64_t v20 = 6;
    }
  }
LABEL_49:
  --self->_numberOfCurrentSynchronousDeliveries;
  v44 = +[MFDeliveryQueue signpostLog];
  os_signpost_id_t v45 = [(MFDeliveryQueue *)self signpostID];
  if (v45 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v44))
  {
    [v60 status];
    v46 = MFMessageDeliveryStatusString();
    *(_DWORD *)buf = 138412546;
    uint64_t v65 = (uint64_t)v58;
    __int16 v66 = 2112;
    v67 = v46;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v44, OS_SIGNPOST_INTERVAL_END, v45, "EMAIL DELIVERY", "Delivered Message : %@ with result %@", buf, 0x16u);
  }
  if (v31)
  {
    v47 = [v31 domain];
    v48 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v47, [v31 code], 0);

    v49 = [v31 localizedDescription];
    id v50 = objc_alloc_init((Class)NSMutableDictionary);
    [v50 setObject:v48 forKeyedSubscript:NSUnderlyingErrorKey];
    if (v49) {
      [v50 setObject:v49 forKeyedSubscript:NSLocalizedDescriptionKey];
    }
    v51 = +[NSError em_internalErrorWithReason:@"Message delivery failed with underlying error" userInfo:v50];
  }
  else
  {
    v51 = 0;
  }
  id v52 = [objc_alloc((Class)EMMessageDeliveryResult) initWithStatus:v20 error:v51];

  return v52;
}

- (void)deliverAsynchronously:(id)a3 completion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void *))a4;
  uint64_t v8 = [(MFDeliveryQueue *)self _deliveryResultIfNotHasAdequateFreeSpace];
  if (v8)
  {
    v7[2](v7, v8);
  }
  else
  {
    os_signpost_id_t v9 = [(MFDeliveryQueue *)self _outboxCopyFromMessageDelivery:v6];
    if (v9)
    {
      id v10 = objc_alloc_init(DelayedMessage);
      [(DelayedMessage *)v10 setCompletion:v7];
      [(DelayedMessage *)v10 setOutboxCopy:v9];
      uint64_t v11 = +[MFPowerController sharedInstance];
      [v11 retainAssertionWithIdentifier:@"com.apple.message.delivery"];

      double v12 = sub_10005E4D8((uint64_t)self);
      v13 = +[MFDeliveryQueue log];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        *(double *)&uint8_t buf[4] = v12;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Deliver message asynchronously with delay: %f", buf, 0xCu);
      }

      *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
      objc_initWeak((id *)buf, self);
      v14 = [(MFDeliveryQueue *)self delayedMessageScheduler];
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_10005E57C;
      v25[3] = &unk_10013BC38;
      objc_copyWeak(&v30, (id *)buf);
      uint64_t v15 = v10;
      id v26 = v15;
      id v27 = v6;
      id v28 = v9;
      v29 = v7;
      id v16 = [v14 afterDelay:v25 performBlock:v12];
      [(DelayedMessage *)v15 setToken:v16];

      uint64_t v20 = _NSConcreteStackBlock;
      uint64_t v21 = 3221225472;
      id v22 = sub_10005EA10;
      v23 = &unk_10013BC60;
      id v17 = v15;
      char v24 = v17;
      sub_10005E95C((os_unfair_lock_s *)self, &v20);
      -[MFDeliveryQueue notifyObserversOfDelayedMessagesDidChange:](self, "notifyObserversOfDelayedMessagesDidChange:", 1, v20, v21, v22, v23);

      objc_destroyWeak(&v30);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      id v18 = [objc_alloc((Class)NSError) initWithDomain:NSPOSIXErrorDomain code:12 userInfo:0];
      id v19 = [objc_alloc((Class)EMMessageDeliveryResult) initWithStatus:2 error:v18];
      v7[2](v7, v19);
    }
  }
}

- (BOOL)cancelLastDelayedMessage
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 1;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = sub_10005E8BC;
  id v17 = sub_10005E8CC;
  id v18 = 0;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10005ECC0;
  v12[3] = &unk_10013BC10;
  v12[4] = &v13;
  v12[5] = &v19;
  sub_10005E95C((os_unfair_lock_s *)self, v12);
  v3 = (void *)v14[5];
  if (v3)
  {
    id v4 = [v3 token];
    [v4 cancel];

    id v5 = [(MFDeliveryQueue *)self _outboxStore];
    id v6 = [(id)v14[5] outboxCopy];
    v23 = v6;
    uint64_t v7 = +[NSArray arrayWithObjects:&v23 count:1];
    [v5 deleteMessages:v7 moveToTrash:0];

    id v8 = [objc_alloc((Class)EMMessageDeliveryResult) initWithStatus:4 error:0];
    os_signpost_id_t v9 = [(id)v14[5] completion];
    ((void (**)(void, id))v9)[2](v9, v8);

    [(MFDeliveryQueue *)self notifyObserversOfDelayedMessagesDidChange:*((unsigned char *)v20 + 24) == 0];
    BOOL v10 = v14[5] != 0;
  }
  else
  {
    BOOL v10 = 0;
  }
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);
  return v10;
}

- (id)lastErrorForMessage:(id)a3
{
  id v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (id v5 = [v4 libraryID],
        lastErrorForMessage = self->_lastErrorForMessage,
        +[NSNumber numberWithLongLong:v5],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        [(NSMutableDictionary *)lastErrorForMessage objectForKey:v7],
        id v8 = objc_claimAutoreleasedReturnValue(),
        v7,
        !v8))
  {
    os_signpost_id_t v9 = +[NSBundle bundleForClass:NSClassFromString(@"MailAppController")];
    BOOL v10 = [v9 localizedStringForKey:@"GENERIC_DELIVERY_ERROR_MESSAGE" value:&stru_10013ED08 table:@"Main"];
    uint64_t v11 = MFLookupLocalizedString();
    id v8 = +[MFError errorWithDomain:MFMessageErrorDomain code:1030 localizedDescription:v10 title:v11 userInfo:&off_100146600];
  }

  return v8;
}

- (id)_outboxStore
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_10016BA98);
  if (!qword_10016BA90) {
    goto LABEL_9;
  }
  v3 = [(id)qword_10016BA90 mailbox];
  id v4 = v3;
  if (!v3 || ([v3 isValid] & 1) == 0)
  {
    id v5 = +[MFDeliveryQueue log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "detected stale store", v13, 2u);
    }

    id v6 = +[NSNotificationCenter defaultCenter];
    [v6 removeObserver:self name:0 object:qword_10016BA90];

    uint64_t v7 = (void *)qword_10016BA90;
    qword_10016BA90 = 0;
  }
  if (qword_10016BA90)
  {
    os_unfair_lock_unlock((os_unfair_lock_t)&unk_10016BA98);
  }
  else
  {
LABEL_9:
    uint64_t v8 = +[MailAccount outboxMessageStore:1];
    os_signpost_id_t v9 = (void *)qword_10016BA90;
    qword_10016BA90 = v8;

    [(id)qword_10016BA90 openSynchronously];
    os_unfair_lock_unlock((os_unfair_lock_t)&unk_10016BA98);
    BOOL v10 = +[NSNotificationCenter defaultCenter];
    [v10 addObserver:self selector:"_flagsChanged:" name:MailMessageStoreMessageFlagsChanged object:qword_10016BA90];
    [v10 addObserver:self selector:"_messagesAdded:" name:MailMessageStoreMessagesAdded object:qword_10016BA90];
  }
  uint64_t v11 = (void *)qword_10016BA90;

  return v11;
}

- (id)_messagesInProgress
{
  v2 = [(MFDeliveryQueue *)self _outboxStore];
  id v3 = [v2 copyOfAllMessagesWithOptions:0];

  id v4 = objc_msgSend(v3, "ef_filter:", &stru_10013BC80);

  return v4;
}

- (void)_setErrorForMessageLibraryID:(id)a3 error:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  lastErrorForMessage = self->_lastErrorForMessage;
  if (v6)
  {
    if (!lastErrorForMessage)
    {
      uint64_t v8 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      os_signpost_id_t v9 = self->_lastErrorForMessage;
      self->_lastErrorForMessage = v8;

      lastErrorForMessage = self->_lastErrorForMessage;
    }
    [(NSMutableDictionary *)lastErrorForMessage setObject:v6 forKey:v10];
  }
  else
  {
    [(NSMutableDictionary *)lastErrorForMessage removeObjectForKey:v10];
  }
}

- (void)_setErrorForMessage:(id)a3 error:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v7 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v8 libraryID]);
    [(MFDeliveryQueue *)self _setErrorForMessageLibraryID:v7 error:v6];
  }
}

- (void)_sendProcessingStartedNotification:(id)a3
{
  id v3 = a3;
  CFStringRef v6 = @"MFDeliveryQueueMonitorKey";
  id v7 = v3;
  id v4 = +[NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1];
  id v5 = +[NSNotificationCenter defaultCenter];
  [v5 postNotificationName:@"MFDeliveryQueueProcessingStartedNotification" object:v4];
}

- (void)_sendProcessingFinishedNotificationWithSentMessages:(id)a3 failedMessages:(id)a4 playSound:(BOOL)a5
{
  BOOL v5 = a5;
  id v11 = a3;
  id v7 = a4;
  id v8 = +[NSMutableDictionary dictionary];
  [v8 setValue:v11 forKey:@"sent"];
  [v8 setValue:v7 forKey:@"failed"];
  os_signpost_id_t v9 = +[NSNumber numberWithInt:v5];
  [v8 setValue:v9 forKey:@"playSound"];

  id v10 = +[NSNotificationCenter defaultCenter];
  [v10 postNotificationName:@"MFDeliveryQueueProcessingFinishedNotification" object:0 userInfo:v8];
}

- (void)_setDeliveryFlag:(id)a3 state:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(MFDeliveryQueue *)self _outboxStore];
  [(MFDeliveryQueue *)self mf_lock];
  id v9 = v6;
  id v8 = +[NSArray arrayWithObjects:&v9 count:1];
  [v7 setFlag:MessageIsBeingDelivered state:v4 forMessages:v8];

  [(MFDeliveryQueue *)self mf_unlock];
}

- (void)_updateCounts
{
  if (self->_hasAdequateFreeSpace)
  {
    uint64_t v20 = [(MFDeliveryQueue *)self _outboxStore];
    [(MFDeliveryQueue *)self mf_lock];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id obj = [v20 copyOfAllMessagesWithOptions:2048];
    id v2 = [obj countByEnumeratingWithState:&v23 objects:v31 count:16];
    if (v2)
    {
      unint64_t v3 = 0;
      BOOL v4 = 0;
      id v5 = 0;
      uint64_t v6 = *(void *)v24;
      do
      {
        for (i = 0; i != v2; i = (char *)i + 1)
        {
          if (*(void *)v24 != v6) {
            objc_enumerationMutation(obj);
          }
          id v8 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          if (((unint64_t)[v8 messageFlags] & 0x4000000000) != 0)
          {
            id v9 = +[MailAccount accountThatMessageIsFrom:v8 includingInactive:1];
            id v10 = v9;
            if (v9)
            {
              ++v4;
              v3 += [v9 isActive];
            }
            else
            {
              id v11 = +[MFDeliveryQueue log];
              if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                unint64_t v28 = (unint64_t)v8;
                _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "purging orphaned messsage: %@", buf, 0xCu);
              }

              if (!v5) {
                id v5 = objc_alloc_init((Class)NSMutableArray);
              }
              [v5 addObject:v8];
            }
          }
        }
        id v2 = [obj countByEnumeratingWithState:&v23 objects:v31 count:16];
      }
      while (v2);

      if (v5)
      {
        double v12 = +[MFDeliveryQueue log];
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          id v13 = [v5 count];
          *(_DWORD *)buf = 134217984;
          unint64_t v28 = (unint64_t)v13;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Delete messagesToPurge: %lu before continuing", buf, 0xCu);
        }

        [v20 deleteMessages:v5 moveToTrash:0];
        v14 = self;
        goto LABEL_26;
      }
    }
    else
    {

      id v5 = 0;
      BOOL v4 = 0;
      unint64_t v3 = 0;
    }
    v14 = self;
LABEL_26:
    if (v3 != v14->_messagesFromActiveAccounts)
    {
      v14->_unint64_t messagesFromActiveAccounts = v3;
      [(MFDeliveryQueue *)v14 notifyObserversOfUpdatedPendingMessageCount:v3];
    }
    [(MFDeliveryQueue *)v14 mf_unlock];
    id v18 = +[MFDeliveryQueue log];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t messagesFromActiveAccounts = self->_messagesFromActiveAccounts;
      *(_DWORD *)buf = 134218240;
      unint64_t v28 = (unint64_t)v4;
      __int16 v29 = 2048;
      unint64_t v30 = messagesFromActiveAccounts;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%lu message(s) total, %lu from active accounts", buf, 0x16u);
    }

    id v16 = v20;
    goto LABEL_31;
  }
  id v16 = +[MFDeliveryQueue log];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t hasAdequateFreeSpace = self->_hasAdequateFreeSpace;
    *(_DWORD *)buf = 134217984;
    unint64_t v28 = hasAdequateFreeSpace;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Not updating counts - hasAdequateDiskSpace:%lu", buf, 0xCu);
  }
LABEL_31:
}

- (id)_append:(id)a3 flags:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = [(MFDeliveryQueue *)self _outboxStore];
    id v9 = +[MFActivityMonitor currentMonitor];
    [v9 setCanBeCancelled:0];

    [(MFDeliveryQueue *)self mf_lock];
    id v10 = +[MFMailMessageLibrary defaultInstance];
    long long v25 = [v10 messageChangeManager];

    id v29 = v6;
    id v11 = +[NSArray arrayWithObjects:&v29 count:1];
    double v12 = [v8 mailbox];
    id v13 = [v12 URL];
    v14 = [v25 addNewMessages:v11 mailboxURL:v13 userInitiated:0];

    uint64_t v15 = +[MFDeliveryQueue log];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      id v28 = [v14 count];
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%lu messages added", buf, 0xCu);
    }

    id v16 = [v14 objectAtIndex:0];
    long long v26 = v16;
    id v17 = +[NSArray arrayWithObjects:&v26 count:1];
    id v18 = [v8 setFlagsFromDictionary:v7 forMessages:v17];

    uint64_t v19 = objc_alloc_init(MessageDeliveryInfo);
    -[MessageDeliveryInfo setMessageSize:](v19, "setMessageSize:", [v16 messageSize]);
    uint64_t v20 = [(MFDeliveryQueue *)self messagePersistence];
    [v20 setDeliveryInfo:v19 forMessage:v16];

    uint64_t v21 = +[MFDeliveryQueue log];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      id v22 = [v16 libraryID];
      *(_DWORD *)buf = 134217984;
      id v28 = v22;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Saved message to outbox (libraryId: %lld)", buf, 0xCu);
    }

    [(MFDeliveryQueue *)self mf_unlock];
    long long v23 = +[MFActivityMonitor currentMonitor];
    [v23 setCanBeCancelled:1];
  }
  else
  {
    id v16 = 0;
  }

  return v16;
}

- (BOOL)_shouldSend:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (([v6 messageFlags] & 2) != 0)
  {
    id v9 = +[MFDeliveryQueue log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v20) = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "skipping message because it is marked as deleted", (uint8_t *)&v20, 2u);
    }
    goto LABEL_7;
  }
  if (((unint64_t)[v6 messageFlags] & 0x2000000000) != 0)
  {
    id v9 = +[MFDeliveryQueue log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v20) = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "skipping message because delivery is in progress", (uint8_t *)&v20, 2u);
    }
LABEL_7:

LABEL_23:
    BOOL v8 = 0;
    goto LABEL_24;
  }
  if (([v7 forceAll] & 1) == 0)
  {
    id v10 = [(MFDeliveryQueue *)self messagePersistence];
    id v11 = [v10 deliveryInfoForMessage:v6];

    if (v11)
    {
      if ([v11 lastStatus] == (id)7)
      {
        double v12 = +[MFDeliveryQueue log];
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v20) = 0;
          id v13 = "skipping message because last failure was permanent";
LABEL_20:
          v14 = v12;
          uint32_t v15 = 2;
          goto LABEL_21;
        }
      }
      else
      {
        if ((uint64_t)[v11 numberOfFailures] < 10)
        {
          if ([v11 lastStatus] != (id)2
            || (unint64_t)[v11 messageSize] <= 0xA00000
            || ((+[MFNetworkController sharedInstance],
                 id v17 = objc_claimAutoreleasedReturnValue(),
                 unsigned __int8 v18 = [v17 isFatPipe],
                 v17,
                 (uint64_t)[v11 failedCellularAttempts] < 4)
              ? (char v19 = 1)
              : (char v19 = v18),
                (v19 & 1) != 0))
          {

            goto LABEL_4;
          }
          double v12 = +[MFDeliveryQueue log];
          if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_22;
          }
          int v20 = 67109376;
          LODWORD(v21[0]) = 10485760;
          WORD2(v21[0]) = 1024;
          *(_DWORD *)((char *)v21 + 6) = 3;
          id v13 = "skipping message because it is larger than %d bytes and had more than %d transient failures. It will onl"
                "y re-send once wifi becomes available";
          v14 = v12;
          uint32_t v15 = 14;
          goto LABEL_21;
        }
        double v12 = +[MFDeliveryQueue log];
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v20) = 0;
          id v13 = "skipping message because maximum number of retries exceeded";
          goto LABEL_20;
        }
      }
    }
    else
    {
      double v12 = +[MFDeliveryQueue log];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v20 = 134217984;
        v21[0] = [v6 libraryID];
        id v13 = "skipping message as no deliveryInfo metadata not found for libraryId: %lld";
        v14 = v12;
        uint32_t v15 = 12;
LABEL_21:
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v20, v15);
      }
    }
LABEL_22:

    goto LABEL_23;
  }
LABEL_4:
  BOOL v8 = 1;
LABEL_24:

  return v8;
}

- (id)_sortedMessages
{
  unint64_t v3 = [(MFDeliveryQueue *)self _outboxStore];
  [(MFDeliveryQueue *)self mf_lock];
  id v4 = [v3 copyOfAllMessagesWithOptions:2048];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000602F0;
  v10[3] = &unk_10013BCA8;
  v10[4] = self;
  id v5 = objc_msgSend(v4, "ef_map:", v10);
  [(MFDeliveryQueue *)self mf_unlock];
  id v6 = [v5 sortedArrayUsingComparator:&stru_10013BCE8];
  id v7 = objc_msgSend(v6, "ef_map:", &stru_10013BD28);
  id v8 = [v7 mutableCopy];

  return v8;
}

- (void)_updateDeliveryInfoFromResult:(id)a3 forMessage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MFDeliveryQueue *)self messagePersistence];
  id v9 = [v8 deliveryInfoForMessage:v7];

  id v10 = +[NSDate now];
  [v9 setLastAttempt:v10];

  objc_msgSend(v9, "setLastStatus:", objc_msgSend(v6, "status"));
  objc_msgSend(v9, "setNumberOfFailures:", (char *)objc_msgSend(v9, "numberOfFailures") + 1);
  if ([v9 lastStatus] == (id)2)
  {
    [v6 duration];
    if (v11 > 0.0 && ([v6 isWifi] & 1) == 0) {
      objc_msgSend(v9, "setFailedCellularAttempts:", (char *)objc_msgSend(v9, "failedCellularAttempts") + 1);
    }
  }
  double v12 = +[MFDeliveryQueue log];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412546;
    id v15 = v7;
    __int16 v16 = 2112;
    id v17 = v9;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "delivery info for %@: %@", (uint8_t *)&v14, 0x16u);
  }

  id v13 = [(MFDeliveryQueue *)self messagePersistence];
  [v13 setDeliveryInfo:v9 forMessage:v7];
}

- (void)_logDeliveryResult:(id)a3 forMessage:(id)a4 account:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = +[MFDeliveryQueue log];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v26 = v8;
    __int16 v27 = 2112;
    id v28 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "delivery result for %@: %@", buf, 0x16u);
  }

  uint64_t v11 = [v9 loggingIdentifier];
  double v12 = (void *)v11;
  CFStringRef v13 = @"nil";
  if (v11) {
    CFStringRef v13 = (const __CFString *)v11;
  }
  v24[0] = v13;
  v23[0] = @"account";
  v23[1] = @"status";
  [v7 status];
  int v14 = MFMessageDeliveryStatusString();
  v24[1] = v14;
  v23[2] = @"duration";
  [v7 duration];
  __int16 v16 = +[NSString stringWithFormat:@"%.2fs", v15];
  v24[2] = v16;
  v23[3] = @"tx";
  id v17 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v7 bytesSent]);
  v24[3] = v17;
  v23[4] = @"wifi";
  [v7 isWifi];
  unsigned __int8 v18 = NSStringFromBOOL();
  v24[4] = v18;
  char v19 = +[NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:5];
  int v20 = +[NSMutableDictionary dictionaryWithDictionary:v19];

  +[MFPowerController powerlog:@"DELIVER" eventData:v20];
  if (![v7 status])
  {
    uint64_t v21 = [(MFDeliveryQueue *)self deliveryHookResponder];
    [v21 deliveredMessage:v8 account:v9];
  }
}

- (EDMessageDeliveryHookResponder)deliveryHookResponder
{
  id v2 = +[MFMailMessageLibrary defaultInstance];
  unint64_t v3 = [v2 persistence];
  id v4 = [v3 hookRegistry];

  return (EDMessageDeliveryHookResponder *)v4;
}

+ (id)newDeliveryObjectFactoryForMessage:(id)a3
{
  id v3 = a3;
  id v4 = +[MFMailMessageLibrary defaultInstance];
  id v5 = [v4 persistence];
  id v6 = [v5 messagePersistence];

  if ([v6 mailDropDeliveryStateForMessage:v3]) {
    goto LABEL_4;
  }
  id v7 = [v3 mailDropDeliveryState];
  if (v7)
  {
    [v6 setMailDropDeliveryState:v7 forMessage:v3];
LABEL_4:
    id v8 = (id *)MFMailDropMailDeliveryUI_ptr;
    goto LABEL_5;
  }
  if (+[MFAttachmentPlaceholder hasPlaceholderRepresentation:v3])
  {
    uint64_t v11 = +[MFDeliveryQueue log];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Performing placeholder delivery for message", buf, 2u);
    }
    id v8 = (id *)MFPlaceholderMailDeliveryUI_ptr;
  }
  else
  {
    uint64_t v11 = +[MFDeliveryQueue log];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Performing standard delivery for message", v12, 2u);
    }
    id v8 = (id *)MFOutgoingMessageDelivery_ptr;
  }

LABEL_5:
  id v9 = [*v8 newWithMessage:v3];

  return v9;
}

- (void)_processQueueWithOptions:(id)a3
{
  id v55 = a3;
  id v50 = +[NSMutableArray array];
  v51 = +[NSMutableArray array];
  id v54 = [(MFDeliveryQueue *)self _outboxStore];
  v57 = +[MFActivityMonitor currentMonitor];
  -[MFDeliveryQueue _sendProcessingStartedNotification:](self, "_sendProcessingStartedNotification:");
  v56 = [(MFDeliveryQueue *)self _sortedMessages];
  id v4 = +[MFDeliveryQueue log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v5 = [v56 count];
    id v6 = [v56 count];
    CFStringRef v7 = @"messages";
    *(_DWORD *)buf = 67109890;
    *(_DWORD *)v64 = v5;
    *(_WORD *)&v64[4] = 2112;
    if (v6 == (id)1) {
      CFStringRef v7 = @"message";
    }
    *(void *)&v64[6] = v7;
    *(_WORD *)&v64[14] = 2112;
    *(void *)&v64[16] = v55;
    __int16 v65 = 2112;
    __int16 v66 = v56;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "processing %d outbox %@ (%@): %@", buf, 0x26u);
  }

  v49 = +[NSMutableDictionary dictionary];
  id v8 = +[MFPowerController sharedInstance];
  [v8 retainAssertionWithIdentifier:@"com.apple.message.delivery"];

  uint64_t v48 = MFMessageErrorDomain;
  uint64_t v9 = 1;
  while ((objc_msgSend(v56, "ef_isEmpty") & 1) == 0 && (*((unsigned char *)self + 56) & 3) == 0)
  {
    if ([v57 shouldCancel])
    {
      v41 = +[MFDeliveryQueue log];
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v40 = "activity was cancelled (possible due to timed out power assertion)";
        goto LABEL_42;
      }
LABEL_43:

      break;
    }
    id v10 = MFUserAgent();
    if ([v10 isMobileMail])
    {
      BOOL v11 = (*((unsigned char *)self + 56) & 4) == 0;

      if (v11)
      {
        v41 = +[MFDeliveryQueue log];
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v40 = "network is not reachable, aborting queue processing";
LABEL_42:
          _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, v40, buf, 2u);
        }
        goto LABEL_43;
      }
    }
    else
    {
    }
    if (v9 == 1)
    {
      double v12 = [v54 mailbox];
      [v57 setMailbox:v12];

      CFStringRef v13 = MFLookupLocalizedString();
      objc_msgSend(v57, "setDisplayName:maxCount:", v13, objc_msgSend(v56, "count"));
    }
    int v14 = objc_msgSend(v56, "ef_popElement");
    [v57 setCurrentCount:v9];
    if ([(MFDeliveryQueue *)self _shouldSend:v14 options:v55])
    {
      [(MFDeliveryQueue *)self _setDeliveryFlag:v14 state:1];
      uint64_t v15 = +[MailAccount accountThatMessageIsFrom:v14 includingInactive:1];
      if ([v15 isActive])
      {
        __int16 v16 = [v15 deliveryAccount];
        id v17 = [v16 identifier];
        unsigned __int8 v18 = [v49 objectForKey:v17];

        if (!v18) {
          unsigned __int8 v18 = v16;
        }
        id v52 = v18;
        id v19 = [(id)objc_opt_class() newDeliveryObjectFactoryForMessage:v14];
        [v19 setAccount:v18];
        [v19 setDelegate:self];
        [v19 setArchiveAccount:v15];
        objc_msgSend(v19, "setIsUserRequested:", objc_msgSend(v55, "isUserRequested"));
        int v20 = +[MFDeliveryQueue log];
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v21 = objc_opt_class();
          *(_DWORD *)buf = 138412546;
          *(void *)v64 = v14;
          *(_WORD *)&v64[8] = 2112;
          *(void *)&v64[10] = v21;
          id v22 = v21;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "sending %@ (account class: %@)", buf, 0x16u);
        }
        v58[0] = _NSConcreteStackBlock;
        v58[1] = 3221225472;
        v58[2] = sub_100061824;
        v58[3] = &unk_10013BBE8;
        id v59 = v54;
        id v23 = v14;
        id v60 = v23;
        long long v24 = [v19 deliverSynchronouslyWithCompletion:v58];
        [(MFDeliveryQueue *)self _logDeliveryResult:v24 forMessage:v23 account:v15];
        v53 = [v19 account];
        if ([v24 status])
        {
          [v51 addObject:v23];
          long long v25 = [v57 error];
          [(MFDeliveryQueue *)self _updateDeliveryInfoFromResult:v24 forMessage:v23];
          if (!v25)
          {
            id v26 = MFLookupLocalizedString();
            __int16 v27 = [v16 hostname];
            id v28 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v26, v27);

            id v29 = MFLookupLocalizedString();
            long long v25 = +[MFError errorWithDomain:v48 code:1030 localizedDescription:v28 title:v29 userInfo:0];
          }
          unint64_t v30 = +[MFDeliveryQueue log];
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            unsigned int v31 = objc_msgSend(v25, "ef_publicDescription");
            sub_1000C1568(v31, v61, &v62, v30);
          }
          goto LABEL_33;
        }
        [v50 addObject:v23];
        if (v53 == v52
          || ([v52 identifier],
              v35 = objc_claimAutoreleasedReturnValue(),
              BOOL v36 = v35 == 0,
              v35,
              v36))
        {
          v34 = 0;
        }
        else
        {
          v37 = +[MFDeliveryQueue log];
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            v38 = [v53 ef_publicDescription];
            objc_super v39 = [v52 ef_publicDescription];
            *(_DWORD *)buf = 138412546;
            *(void *)v64 = v38;
            *(_WORD *)&v64[8] = 2112;
            *(void *)&v64[10] = v39;
            _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "account %@{public} became an alternate for %@{public}", buf, 0x16u);
          }
          unint64_t v30 = [v52 identifier];
          [v49 setValue:v53 forKey:v30];
          long long v25 = 0;
LABEL_33:

          v34 = v25;
        }
        [v34 setUserInfoObject:v53 forKey:@"account"];
      }
      else
      {
        id v32 = MFLookupLocalizedString();
        v33 = MFLookupLocalizedString();
        v34 = +[MFError errorWithDomain:v48 code:1051 localizedDescription:v32 title:v33 userInfo:0];

        [v34 setUserInfoObject:v15 forKey:@"account"];
        __int16 v16 = +[MFDeliveryQueue log];
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "skipping message from  inactive account", buf, 2u);
        }
      }

      usleep(0x7A120u);
      [(MFDeliveryQueue *)self _setDeliveryFlag:v14 state:0];
      [(MFDeliveryQueue *)self _setErrorForMessage:v14 error:v34];
      [v57 setError:0];
    }
    ++v9;
  }
  unsigned int v43 = +[MFPowerController sharedInstance];
  [v43 releaseAssertionWithIdentifier:@"com.apple.message.delivery"];

  v44 = +[MFDeliveryQueue log];
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
  {
    id v45 = [v50 count];
    id v46 = [v51 count];
    *(_DWORD *)buf = 134218240;
    *(void *)v64 = v45;
    *(_WORD *)&v64[8] = 2048;
    *(void *)&v64[10] = v46;
    _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "done processing queue: %lu messages sent, %lu failures", buf, 0x16u);
  }

  [v57 reset];
  [v54 doCompact];
  if ([v55 playSound]) {
    BOOL v47 = [v50 count] != 0;
  }
  else {
    BOOL v47 = 0;
  }
  [(MFDeliveryQueue *)self _sendProcessingFinishedNotificationWithSentMessages:v50 failedMessages:v51 playSound:v47];
}

- (void)setPercentDone:(double)a3
{
  id v4 = +[MFActivityMonitor currentMonitor];
  [v4 setPercentDoneOfCurrentItem:a3];
}

- (void)_queueProcessingDidFinish:(id)a3
{
  stateQueue = self->_stateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000619B0;
  block[3] = &unk_100139C48;
  block[4] = self;
  dispatch_async(stateQueue, block);
}

- (void)_mailAccountsChanged:(id)a3
{
  id v4 = a3;
  stateQueue = self->_stateQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100061B0C;
  v7[3] = &unk_100139C20;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(stateQueue, v7);
}

- (void)_flagsChanged:(id)a3
{
  id v4 = a3;
  stateQueue = self->_stateQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100061C64;
  v7[3] = &unk_100139C20;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(stateQueue, v7);
}

- (void)_messagesAdded:(id)a3
{
  stateQueue = self->_stateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100061DEC;
  block[3] = &unk_100139C48;
  block[4] = self;
  dispatch_async(stateQueue, block);
}

- (void)_reachabilityChanged:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 name];
  unsigned int v6 = [v5 isEqualToString:CPNetworkObserverNetworkReachableNotification];

  if (v6)
  {
    stateQueue = self->_stateQueue;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100061F50;
    v8[3] = &unk_100139C20;
    v8[4] = self;
    id v9 = v4;
    dispatch_async(stateQueue, v8);
  }
}

- (void)_messagesCompacted:(id)a3
{
  id v4 = [a3 userInfo];
  unsigned int v5 = [v4 objectForKey:MailMessageStoreMessageKey];
  if (objc_msgSend(v5, "ef_any:", &stru_10013BD48))
  {
    stateQueue = self->_stateQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000621B8;
    block[3] = &unk_100139C48;
    block[4] = self;
    dispatch_async(stateQueue, block);
  }
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(MFDeliveryQueue *)self observationScheduler];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10006229C;
  v7[3] = &unk_100139C20;
  void v7[4] = self;
  id v6 = v4;
  id v8 = v6;
  [v5 performBlock:v7];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(MFDeliveryQueue *)self observationScheduler];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000623DC;
  v7[3] = &unk_100139C20;
  void v7[4] = self;
  id v6 = v4;
  id v8 = v6;
  [v5 performBlock:v7];
}

- (void)notifyObserversOfUpdatedPendingMessageCount:(unint64_t)a3
{
  unsigned int v5 = [(MFDeliveryQueue *)self observationScheduler];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000624E8;
  v6[3] = &unk_100139BA8;
  v6[4] = self;
  void v6[5] = a3;
  [v5 performBlock:v6];
}

- (void)notifyObserversOfDelayedMessagesDidChange:(BOOL)a3
{
  unsigned int v5 = [(MFDeliveryQueue *)self observationScheduler];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000626A8;
  v6[3] = &unk_10013A958;
  v6[4] = self;
  BOOL v7 = a3;
  [v5 performBlock:v6];
}

- (void)test_waitForObservers
{
  if ((EFIsRunningUnitTests() & 1) == 0)
  {
    id v5 = +[NSAssertionHandler currentHandler];
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MFDeliveryQueue.m", 1231, @"%s can only be called from unit tests", "-[MFDeliveryQueue test_waitForObservers]");
  }
  id v4 = [(MFDeliveryQueue *)self observationScheduler];
  [v4 performSyncBlock:&stru_10013BD68];
}

- (id)copyDiagnosticInformation
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  id v4 = +[NSString stringWithFormat:@"<%@: %p>", objc_opt_class(), self];
  [v3 addObject:v4];

  [v3 addObject:@"==== Outbox ===="];
  int64_t state = self->_state;
  CFStringRef v6 = @"MFDeliveryQueueStateReady";
  if (state == 1) {
    CFStringRef v6 = @"MFDeliveryQueueStateProcessing";
  }
  if (state == 2) {
    CFStringRef v7 = @"MFDeliveryQueueStateSuspended";
  }
  else {
    CFStringRef v7 = v6;
  }
  id v8 = +[NSString stringWithFormat:@"  state: %@", v7];
  [v3 addObject:v8];

  [v3 addObject:@"==== Pending Messages (Sorted by Size) ===="];
  id v9 = [(MFDeliveryQueue *)self _sortedMessages];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100062A58;
  v13[3] = &unk_10013BD90;
  v13[4] = self;
  id v10 = objc_msgSend(v9, "ef_map:", v13);
  [v3 addObjectsFromArray:v10];

  BOOL v11 = [v3 componentsJoinedByString:@"\n"];

  return v11;
}

- (EFScheduler)observationScheduler
{
  return self->_observationScheduler;
}

- (void)setObservationScheduler:(id)a3
{
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (EFScheduler)delayedMessageScheduler
{
  return self->_delayedMessageScheduler;
}

- (void)setDelayedMessageScheduler:(id)a3
{
}

- (NSMutableArray)delayedMessages
{
  return self->_delayedMessages;
}

- (void)setDelayedMessages:(id)a3
{
}

- (unint64_t)hasAdequateFreeSpace
{
  return self->_hasAdequateFreeSpace;
}

- (void)setHasAdequateFreeSpace:(unint64_t)a3
{
  self->_unint64_t hasAdequateFreeSpace = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delayedMessages, 0);
  objc_storeStrong((id *)&self->_delayedMessageScheduler, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_observationScheduler, 0);
  objc_storeStrong((id *)&self->_lastErrorForMessage, 0);
  objc_storeStrong((id *)&self->_jobQueue, 0);

  objc_storeStrong((id *)&self->_stateQueue, 0);
}

@end