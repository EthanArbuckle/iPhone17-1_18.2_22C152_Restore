@interface WCSession
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
+ (BOOL)isSupported;
+ (WCSession)defaultSession;
- (BOOL)connectionWasInterrupted;
- (BOOL)delegateSupportsActiveDeviceSwitch;
- (BOOL)delegateSupportsAsyncActivate;
- (BOOL)didPairingIDChange:(id)a3;
- (BOOL)didWatchURLChange:(id)a3;
- (BOOL)hasCompletedInitialActivation;
- (BOOL)hasContentPending;
- (BOOL)iOSDeviceNeedsUnlockAfterRebootForReachability;
- (BOOL)isCompanionAppInstalled;
- (BOOL)isComplicationEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPaired;
- (BOOL)isReachable;
- (BOOL)isWatchAppInstalled;
- (BOOL)logAndTestIfUnactivatedOrMissingDelegate;
- (BOOL)updateApplicationContext:(NSDictionary *)applicationContext error:(NSError *)error;
- (BOOL)verifySessionFile:(id)a3;
- (NSArray)outstandingFileTransfers;
- (NSArray)outstandingUserInfoTransfers;
- (NSDictionary)applicationContext;
- (NSDictionary)receivedApplicationContext;
- (NSMutableArray)switchTasksQueue;
- (NSMutableDictionary)currentMessages;
- (NSMutableDictionary)internalOutstandingFileTransfers;
- (NSMutableDictionary)internalOutstandingUserInfoTransfers;
- (NSMutableSet)currentMessageIdentifiersAwaitingReply;
- (NSOperationQueue)backgroundWorkOperationQueue;
- (NSOperationQueue)delegateOperationQueue;
- (NSOperationQueue)workOperationQueue;
- (NSString)description;
- (NSString)pairingID;
- (NSUInteger)remainingComplicationUserInfoTransfers;
- (NSURL)watchDirectoryURL;
- (WCQueueManager)queueManager;
- (WCSession)init;
- (WCSessionActivationState)activationState;
- (WCSessionFileTransfer)transferFile:(NSURL *)file metadata:(NSDictionary *)metadata;
- (WCSessionUserInfoTransfer)currentComplicationUserInfoTransfer;
- (WCSessionUserInfoTransfer)transferCurrentComplicationUserInfo:(NSDictionary *)userInfo;
- (WCSessionUserInfoTransfer)transferUserInfo:(NSDictionary *)userInfo;
- (id)_init;
- (id)createAndStartTimerOnWorkQueueWithHandler:(id)a3;
- (id)delegate;
- (id)errorIfNotReachable;
- (id)errorIfPreconditionsNotSatisfied;
- (id)fileSizeFromURL:(id)a3;
- (id)onqueue_addOutstandingUserInfoTransfer:(id)a3;
- (unint64_t)hash;
- (unint64_t)roundValue:(unint64_t)a3 toSignificantFigures:(int)a4;
- (void)_onqueue_notifyOfMessageError:(id)a3 messageID:(id)a4 withErrorHandler:(id)a5;
- (void)_onqueue_sendResponseError:(id)a3 identifier:(id)a4 dictionaryMessage:(BOOL)a5;
- (void)activateSession;
- (void)cancelFileTransfer:(id)a3;
- (void)cancelUserInfo:(id)a3;
- (void)dealloc;
- (void)didSessionStateChange:(id)a3 withChangeHandler:(id)a4;
- (void)errorIfNotReachable;
- (void)errorIfPreconditionsNotSatisfied;
- (void)handleActiveDeviceSwitchStarted;
- (void)handleApplicationContextWithPairingID:(id)a3;
- (void)handleFileResultWithPairingID:(id)a3;
- (void)handleIncomingFileWithPairingID:(id)a3;
- (void)handleIncomingUserInfoWithPairingID:(id)a3;
- (void)handleMessageSendingAllowed;
- (void)handleRequest:(id)a3;
- (void)handleResponse:(id)a3;
- (void)handleSentMessageWithIdentifier:(id)a3 error:(id)a4;
- (void)handleSessionStateChanged:(id)a3;
- (void)handleUserInfoResultWithPairingID:(id)a3;
- (void)logAndTestIfUnactivatedOrMissingDelegate;
- (void)notifyOfFileError:(id)a3 withFileTransfer:(id)a4;
- (void)notifyOfUserInfoError:(id)a3 withUserInfoTransfer:(id)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)onDelegateQueueIfTriggeringKVO_updateSessionState:(id)a3 triggerKVO:(BOOL)a4;
- (void)onqueue_addOutstandingFileTransfer:(id)a3;
- (void)onqueue_cancelFileTransfer:(id)a3;
- (void)onqueue_cancelMessagesIfAppropriate;
- (void)onqueue_cancelUserInfo:(id)a3;
- (void)onqueue_completeSwitchTask:(id)a3 withSessionState:(id)a4;
- (void)onqueue_createProgressForFileTransfer:(id)a3;
- (void)onqueue_dequeueContent;
- (void)onqueue_handleDataMessageRequest:(id)a3 withPairingID:(id)a4;
- (void)onqueue_handleDictionaryMessageRequest:(id)a3 withPairingID:(id)a4;
- (void)onqueue_handleMessageCompletionWithError:(id)a3 withMessageID:(id)a4;
- (void)onqueue_handleProgressFinishedForFileTransfer:(id)a3;
- (void)onqueue_handleResponseData:(id)a3 record:(id)a4 withPairingID:(id)a5;
- (void)onqueue_handleResponseDictionary:(id)a3 record:(id)a4 withPairingID:(id)a5;
- (void)onqueue_handleUpdateSessionState:(id)a3;
- (void)onqueue_loadAppContexts;
- (void)onqueue_loadFileTransferProgress;
- (void)onqueue_loadOutstandingFileTransfers;
- (void)onqueue_loadOutstandingUserInfoTransfers;
- (void)onqueue_loadPersistedContent;
- (void)onqueue_notifyOfFileError:(id)a3 withFileTransfer:(id)a4;
- (void)onqueue_notifyOfUserInfoError:(id)a3 withUserInfoTransfer:(id)a4;
- (void)onqueue_removeOutstandingFileTransfer:(id)a3;
- (void)onqueue_removeOutstandingUserInfoTransfer:(id)a3;
- (void)onqueue_removeProgressForFileTransfer:(id)a3;
- (void)onqueue_sendMessageData:(id)a3 replyHandler:(id)a4 errorHandler:(id)a5 dictionaryMessage:(BOOL)a6;
- (void)onqueue_sendResponseData:(id)a3 identifier:(id)a4 dictionaryMessage:(BOOL)a5;
- (void)onqueue_sendResponseDictionary:(id)a3 identifier:(id)a4;
- (void)onqueue_setCurrentComplicationUserInfoTransfer:(id)a3;
- (void)onqueue_startNextDeviceSwitch;
- (void)onqueue_transferUserInfo:(id)a3 withUserInfo:(id)a4;
- (void)onqueue_updateClientProgressForFileTransfer:(id)a3;
- (void)onqueue_updateProgressForFileTransfer:(id)a3 progress:(id)a4;
- (void)reportFileTransfer:(id)a3;
- (void)sendMessage:(NSDictionary *)message replyHandler:(void *)replyHandler errorHandler:(void *)errorHandler;
- (void)sendMessageData:(NSData *)data replyHandler:(void *)replyHandler errorHandler:(void *)errorHandler;
- (void)setActivationState:(int64_t)a3;
- (void)setApplicationContext:(id)a3;
- (void)setCompanionAppInstalled:(BOOL)a3;
- (void)setComplicationEnabled:(BOOL)a3;
- (void)setConnectionWasInterrupted:(BOOL)a3;
- (void)setCurrentComplicationUserInfoTransfer:(id)a3;
- (void)setCurrentMessageIdentifiersAwaitingReply:(id)a3;
- (void)setDelegate:(id)delegate;
- (void)setDelegateSupportsActiveDeviceSwitch:(BOOL)a3;
- (void)setDelegateSupportsAsyncActivate:(BOOL)a3;
- (void)setHasCompletedInitialActivation:(BOOL)a3;
- (void)setHasContentPending:(BOOL)a3;
- (void)setIOSDeviceNeedsUnlockAfterRebootForReachability:(BOOL)a3;
- (void)setInternalOutstandingFileTransfers:(id)a3;
- (void)setInternalOutstandingUserInfoTransfers:(id)a3;
- (void)setPaired:(BOOL)a3;
- (void)setPairingID:(id)a3;
- (void)setQueueManager:(id)a3;
- (void)setReachable:(BOOL)a3;
- (void)setReceivedApplicationContext:(id)a3;
- (void)setRemainingComplicationUserInfoTransfers:(unint64_t)a3;
- (void)setSwitchTasksQueue:(id)a3;
- (void)setWatchAppInstalled:(BOOL)a3;
- (void)setWatchDirectoryURL:(id)a3;
- (void)storeAppContext:(id)a3 withAppContextData:(id)a4;
- (void)storeReceivedAppContext:(id)a3 withAppContextData:(id)a4;
- (void)updatePairingID:(id)a3;
- (void)xpcConnectionInterrupted;
- (void)xpcConnectionRestoredWithState:(id)a3;
@end

@implementation WCSession

uint64_t __57__WCSession_onqueue_completeSwitchTask_withSessionState___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "onqueue_startNextDeviceSwitch");
}

+ (WCSession)defaultSession
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __27__WCSession_defaultSession__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultSession_onceToken != -1) {
    dispatch_once(&defaultSession_onceToken, block);
  }
  v2 = (void *)defaultSession_session;

  return (WCSession *)v2;
}

uint64_t __27__WCSession_defaultSession__block_invoke(uint64_t a1)
{
  defaultSession_session = [objc_alloc(*(Class *)(a1 + 32)) _init];

  return MEMORY[0x270F9A758]();
}

- (id)_init
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  v25.receiver = self;
  v25.super_class = (Class)WCSession;
  v2 = [(WCSession *)&v25 init];
  v3 = v2;
  if (v2)
  {
    v2->_hasCompletedInitialActivation = 0;
    v2->_paired = 0;
    v2->_reachable = 0;
    pairingID = v2->_pairingID;
    v2->_pairingID = 0;

    v3->_activationState = 0;
    *(_WORD *)&v3->_watchAppInstalled = 0;
    v3->_companionAppInstalled = 0;
    *(_WORD *)&v3->_delegateSupportsAsyncActivate = 0;
    uint64_t v5 = objc_opt_new();
    queueManager = v3->_queueManager;
    v3->_queueManager = (WCQueueManager *)v5;

    currentComplicationUserInfoTransfer = v3->_currentComplicationUserInfoTransfer;
    v3->_currentComplicationUserInfoTransfer = 0;

    uint64_t v8 = objc_opt_new();
    switchTasksQueue = v3->_switchTasksQueue;
    v3->_switchTasksQueue = (NSMutableArray *)v8;

    v10 = v3->_switchTasksQueue;
    v11 = objc_opt_new();
    [(NSMutableArray *)v10 addObject:v11];

    uint64_t v12 = objc_opt_new();
    currentMessages = v3->_currentMessages;
    v3->_currentMessages = (NSMutableDictionary *)v12;

    uint64_t v14 = objc_opt_new();
    currentMessageIdentifiersAwaitingReply = v3->_currentMessageIdentifiersAwaitingReply;
    v3->_currentMessageIdentifiersAwaitingReply = (NSMutableSet *)v14;

    uint64_t v16 = objc_opt_new();
    workOperationQueue = v3->_workOperationQueue;
    v3->_workOperationQueue = (NSOperationQueue *)v16;

    [(NSOperationQueue *)v3->_workOperationQueue setMaxConcurrentOperationCount:1];
    [(NSOperationQueue *)v3->_workOperationQueue setQualityOfService:17];
    uint64_t v18 = objc_opt_new();
    delegateOperationQueue = v3->_delegateOperationQueue;
    v3->_delegateOperationQueue = (NSOperationQueue *)v18;

    [(NSOperationQueue *)v3->_delegateOperationQueue setMaxConcurrentOperationCount:1];
    [(NSOperationQueue *)v3->_delegateOperationQueue setQualityOfService:17];
    uint64_t v20 = objc_opt_new();
    backgroundWorkOperationQueue = v3->_backgroundWorkOperationQueue;
    v3->_backgroundWorkOperationQueue = (NSOperationQueue *)v20;

    [(NSOperationQueue *)v3->_backgroundWorkOperationQueue setMaxConcurrentOperationCount:1];
    [(NSOperationQueue *)v3->_backgroundWorkOperationQueue setQualityOfService:9];
    v22 = +[WCXPCManager sharedManager];
    [v22 setDelegate:v3];

    v23 = wc_log();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446210;
      v27 = "-[WCSession _init]";
      _os_log_impl(&dword_222A02000, v23, OS_LOG_TYPE_DEFAULT, "%{public}s WCSession initialized", buf, 0xCu);
    }
  }
  return v3;
}

- (void)handleSessionStateChanged:(id)a3
{
  id v4 = a3;
  workOperationQueue = self->_workOperationQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __39__WCSession_handleSessionStateChanged___block_invoke;
  v7[3] = &unk_26463C3B8;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  [(NSOperationQueue *)workOperationQueue addOperationWithBlock:v7];
}

- (id)errorIfPreconditionsNotSatisfied
{
  if ([(WCSession *)self activationState] == WCSessionActivationStateNotActivated)
  {
    id v4 = [MEMORY[0x263F087E8] wcErrorWithCode:7004];
    uint64_t v5 = wc_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[WCSession logAndTestIfUnactivatedOrMissingDelegate]();
    }
    goto LABEL_16;
  }
  v3 = [(WCSession *)self delegate];

  if (!v3)
  {
    id v4 = [MEMORY[0x263F087E8] wcErrorWithCode:7003];
    uint64_t v5 = wc_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[WCSession logAndTestIfUnactivatedOrMissingDelegate]();
    }
    goto LABEL_16;
  }
  if (![(WCSession *)self isPaired])
  {
    id v4 = [MEMORY[0x263F087E8] wcErrorWithCode:7005];
    uint64_t v5 = wc_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[WCSession errorIfPreconditionsNotSatisfied].cold.6();
    }
    goto LABEL_16;
  }
  if (![(WCSession *)self isWatchAppInstalled])
  {
    id v4 = [MEMORY[0x263F087E8] wcErrorWithCode:7006];
    uint64_t v5 = wc_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[WCSession errorIfPreconditionsNotSatisfied].cold.5();
    }
    goto LABEL_16;
  }
  if ([(WCSession *)self activationState] == WCSessionActivationStateInactive)
  {
    id v4 = [MEMORY[0x263F087E8] wcErrorWithCode:7016];
    uint64_t v5 = wc_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[WCSession errorIfPreconditionsNotSatisfied]();
    }
LABEL_16:

    goto LABEL_17;
  }
  v7 = [(WCSession *)self pairingID];

  if (!v7)
  {
    id v4 = [MEMORY[0x263F087E8] wcErrorWithCode:7001];
    uint64_t v5 = wc_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[WCSession errorIfPreconditionsNotSatisfied].cold.4();
    }
    goto LABEL_16;
  }
  id v4 = 0;
LABEL_17:

  return v4;
}

- (void)errorIfPreconditionsNotSatisfied
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_222A02000, v0, v1, "WCSession counterpart app not installed", v2, v3, v4, v5, v6);
}

void __28__WCSession_activateSession__block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  uint64_t v2 = wc_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v26 = "-[WCSession activateSession]_block_invoke";
    _os_log_impl(&dword_222A02000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s ", buf, 0xCu);
  }

  if ([(id)objc_opt_class() isSupported])
  {
    uint64_t v3 = [*(id *)(a1 + 32) delegate];

    if (v3)
    {
      uint64_t v4 = [*(id *)(a1 + 32) switchTasksQueue];
      uint64_t v5 = [v4 firstObject];

      if (([v5 clientReadyForSessionState] & 1) != 0
        || [*(id *)(a1 + 32) activationState])
      {
        uint8_t v6 = wc_log();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
          __28__WCSession_activateSession__block_invoke_cold_2();
        }
      }
      else
      {
        [v5 setTaskState:3];
        [v5 setClientReadyForSessionState:1];
        v7 = wc_log();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446210;
          v26 = "-[WCSession activateSession]_block_invoke";
          _os_log_impl(&dword_222A02000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s informing daemon ready for session state", buf, 0xCu);
        }

        id v8 = +[WCXPCManager sharedManager];
        uint64_t v9 = [*(id *)(a1 + 32) delegateSupportsActiveDeviceSwitch];
        v22[0] = MEMORY[0x263EF8330];
        v22[1] = 3221225472;
        v22[2] = __28__WCSession_activateSession__block_invoke_20;
        v22[3] = &unk_26463C140;
        v10 = v5;
        uint64_t v11 = *(void *)(a1 + 32);
        v23 = v10;
        uint64_t v24 = v11;
        [v8 sessionReadyForInitialStateForClientPairingID:0 supportsActiveDeviceSwitch:v9 withErrorHandler:v22];

        if (([*(id *)(a1 + 32) delegateSupportsAsyncActivate] & 1) == 0)
        {
          uint64_t v12 = [*(id *)(a1 + 32) delegateOperationQueue];
          [v12 setSuspended:1];

          dispatch_semaphore_t v13 = dispatch_semaphore_create(0);
          uint64_t v14 = objc_opt_new();
          v20[0] = MEMORY[0x263EF8330];
          v20[1] = 3221225472;
          v20[2] = __28__WCSession_activateSession__block_invoke_24;
          v20[3] = &unk_26463C168;
          v15 = v13;
          v21 = v15;
          [v14 addExecutionBlock:v20];
          uint64_t v16 = [*(id *)(a1 + 32) delegateOperationQueue];
          [v16 addOperation:v14];

          dispatch_time_t v17 = dispatch_time(0, 7000000000);
          if (dispatch_semaphore_wait(v15, v17))
          {
            uint64_t v18 = wc_log();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
              __28__WCSession_activateSession__block_invoke_cold_3();
            }

            v19 = [*(id *)(a1 + 32) delegateOperationQueue];
            [v19 setSuspended:0];
          }
        }
        uint8_t v6 = v23;
      }
    }
    else
    {
      uint64_t v5 = wc_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        __28__WCSession_activateSession__block_invoke_cold_1();
      }
    }
  }
  else
  {
    uint64_t v5 = wc_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __28__WCSession_activateSession__block_invoke_cold_4();
    }
  }
}

void __39__WCSession_handleSessionStateChanged___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v2 = wc_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v9 = 136446466;
    v10 = "-[WCSession handleSessionStateChanged:]_block_invoke";
    __int16 v11 = 2114;
    uint64_t v12 = v3;
    _os_log_impl(&dword_222A02000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s %{public}@", (uint8_t *)&v9, 0x16u);
  }

  uint64_t v4 = [*(id *)(a1 + 40) switchTasksQueue];
  uint64_t v5 = [v4 firstObject];

  if ([v5 taskState] == 999)
  {
    uint8_t v6 = wc_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136446210;
      v10 = "-[WCSession handleSessionStateChanged:]_block_invoke";
      _os_log_impl(&dword_222A02000, v6, OS_LOG_TYPE_DEFAULT, "%{public}s dropping session state as client does not support Quick Watch Switch", (uint8_t *)&v9, 0xCu);
    }
  }
  else
  {
    uint64_t v7 = [v5 taskState];
    id v8 = *(void **)(a1 + 40);
    if (v7 == 4)
    {
      objc_msgSend(v8, "onqueue_handleUpdateSessionState:", *(void *)(a1 + 32));
      if ([*(id *)(a1 + 40) connectionWasInterrupted])
      {
        [*(id *)(a1 + 40) setConnectionWasInterrupted:0];
        [*(id *)(a1 + 40) xpcConnectionRestoredWithState:*(void *)(a1 + 32)];
      }
    }
    else
    {
      objc_msgSend(v8, "onqueue_completeSwitchTask:withSessionState:", v5, *(void *)(a1 + 32));
    }
  }
}

- (BOOL)delegateSupportsActiveDeviceSwitch
{
  return self->_delegateSupportsActiveDeviceSwitch;
}

- (void)onqueue_startNextDeviceSwitch
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(WCSession *)self switchTasksQueue];
  uint64_t v4 = [v3 firstObject];

  if ([v4 taskState] != 4)
  {
    v10 = wc_log();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_15;
    }
    *(_DWORD *)buf = 136446466;
    v29 = "-[WCSession onqueue_startNextDeviceSwitch]";
    __int16 v30 = 2114;
    v31 = v4;
    uint64_t v16 = "%{public}s current task %{public}@ isn't completed";
LABEL_11:
    _os_log_impl(&dword_222A02000, v10, OS_LOG_TYPE_DEFAULT, v16, buf, 0x16u);
    goto LABEL_15;
  }
  uint64_t v5 = [(WCSession *)self switchTasksQueue];
  unint64_t v6 = [v5 count];

  if (v6 < 2)
  {
    v10 = wc_log();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_15;
    }
    *(_DWORD *)buf = 136446466;
    v29 = "-[WCSession onqueue_startNextDeviceSwitch]";
    __int16 v30 = 2114;
    v31 = v4;
    uint64_t v16 = "%{public}s no tasks queued after %{public}@";
    goto LABEL_11;
  }
  uint64_t v7 = [(WCSession *)self backgroundWorkOperationQueue];
  [v7 cancelAllOperations];

  id v8 = [(WCSession *)self switchTasksQueue];
  [v8 removeObject:v4];

  int v9 = [(WCSession *)self switchTasksQueue];
  v10 = [v9 firstObject];

  [v10 setTaskState:1];
  [(WCSession *)self setActivationState:1];
  __int16 v11 = wc_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v29 = "-[WCSession onqueue_startNextDeviceSwitch]";
    __int16 v30 = 2114;
    v31 = v10;
    _os_log_impl(&dword_222A02000, v11, OS_LOG_TYPE_DEFAULT, "%{public}s starting new switch task: %{public}@", buf, 0x16u);
  }

  if ([(WCSession *)self delegateSupportsActiveDeviceSwitch])
  {
    uint64_t v12 = objc_opt_new();
    objc_initWeak((id *)buf, v12);
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __42__WCSession_onqueue_startNextDeviceSwitch__block_invoke;
    v26[3] = &unk_26463C1E0;
    objc_copyWeak(&v27, (id *)buf);
    v26[4] = self;
    [v12 addExecutionBlock:v26];
    [v12 setQueuePriority:8];
    uint64_t v13 = [(WCSession *)self delegateOperationQueue];
    [v13 addOperation:v12];

    uint64_t v14 = objc_opt_new();
    objc_initWeak(&location, v14);
    uint64_t v18 = MEMORY[0x263EF8330];
    uint64_t v19 = 3221225472;
    uint64_t v20 = __42__WCSession_onqueue_startNextDeviceSwitch__block_invoke_145;
    v21 = &unk_26463C1B8;
    objc_copyWeak(&v24, &location);
    v22 = self;
    v10 = v10;
    v23 = v10;
    [v14 addExecutionBlock:&v18];
    v15 = [(WCSession *)self delegateOperationQueue];
    [v15 addOperation:v14];

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);

    objc_destroyWeak(&v27);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    dispatch_time_t v17 = wc_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446210;
      v29 = "-[WCSession onqueue_startNextDeviceSwitch]";
      _os_log_impl(&dword_222A02000, v17, OS_LOG_TYPE_DEFAULT, "%{public}s client delegate does not support Quick Watch Switch. Halting session until process exits.", buf, 0xCu);
    }

    [v10 setTaskState:999];
  }
LABEL_15:
}

- (NSMutableArray)switchTasksQueue
{
  return (NSMutableArray *)objc_getProperty(self, a2, 152, 1);
}

- (void)onqueue_completeSwitchTask:(id)a3 withSessionState:(id)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = wc_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v31 = "-[WCSession onqueue_completeSwitchTask:withSessionState:]";
    __int16 v32 = 2114;
    id v33 = v6;
    _os_log_impl(&dword_222A02000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s %{public}@", buf, 0x16u);
  }

  if ([v6 clientReadyForSessionState])
  {
    if ([v7 isStandaloneApp])
    {
      [v6 setTaskState:888];
      [(WCSession *)self setActivationState:1];
      int v9 = wc_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[WCSession onqueue_completeSwitchTask:withSessionState:](v9);
      }

      v10 = objc_opt_new();
      v29[0] = MEMORY[0x263EF8330];
      v29[1] = 3221225472;
      v29[2] = __57__WCSession_onqueue_completeSwitchTask_withSessionState___block_invoke;
      v29[3] = &unk_26463C168;
      v29[4] = self;
      [v10 addExecutionBlock:v29];
      __int16 v11 = [(WCSession *)self delegateOperationQueue];
      [v11 addOperation:v10];

      uint64_t v12 = +[WCXPCManager sharedManager];
      [v12 invalidateConnection];
    }
    else
    {
      [v6 setTaskState:4];
      [(WCSession *)self onDelegateQueueIfTriggeringKVO_updateSessionState:v7 triggerKVO:0];
      [(WCSession *)self setActivationState:2];
      uint64_t v13 = [(WCSession *)self delegateOperationQueue];
      [v13 setSuspended:0];

      [(WCSession *)self onqueue_cancelTransfersIfAppropriate];
      v10 = objc_opt_new();
      objc_initWeak((id *)buf, v10);
      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 3221225472;
      v27[2] = __57__WCSession_onqueue_completeSwitchTask_withSessionState___block_invoke_2;
      v27[3] = &unk_26463C570;
      v27[4] = self;
      objc_copyWeak(&v28, (id *)buf);
      [v10 addExecutionBlock:v27];
      v26[0] = MEMORY[0x263EF8330];
      v26[1] = 3221225472;
      v26[2] = __57__WCSession_onqueue_completeSwitchTask_withSessionState___block_invoke_136;
      v26[3] = &unk_26463C168;
      v26[4] = self;
      [v10 setCompletionBlock:v26];
      uint64_t v14 = [(WCSession *)self delegateOperationQueue];
      [v14 addOperation:v10];

      objc_destroyWeak(&v28);
      objc_destroyWeak((id *)buf);
    }

    if (![(WCSession *)self hasCompletedInitialActivation])
    {
      [(WCSession *)self setHasCompletedInitialActivation:1];
      v15 = [v7 pairingID];
      if (v15)
      {

LABEL_13:
        uint64_t v18 = objc_opt_new();
        objc_initWeak((id *)buf, v18);
        uint64_t v20 = MEMORY[0x263EF8330];
        uint64_t v21 = 3221225472;
        v22 = __57__WCSession_onqueue_completeSwitchTask_withSessionState___block_invoke_4;
        v23 = &unk_26463C1E0;
        objc_copyWeak(&v25, (id *)buf);
        id v24 = v7;
        [v18 addExecutionBlock:&v20];
        uint64_t v19 = [(WCSession *)self backgroundWorkOperationQueue];
        [v19 addOperation:v18];

        objc_destroyWeak(&v25);
        objc_destroyWeak((id *)buf);

        goto LABEL_14;
      }
      uint64_t v16 = [v7 pairedDevicesPairingIDs];
      BOOL v17 = v16 == 0;

      if (!v17) {
        goto LABEL_13;
      }
    }
  }
LABEL_14:
}

- (NSOperationQueue)delegateOperationQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 72, 1);
}

- (void)setHasCompletedInitialActivation:(BOOL)a3
{
  self->_hasCompletedInitialActivation = a3;
}

- (void)setActivationState:(int64_t)a3
{
  self->_activationState = a3;
}

- (void)onqueue_handleUpdateSessionState:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  objc_initWeak(&location, v5);
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  v10 = __46__WCSession_onqueue_handleUpdateSessionState___block_invoke;
  __int16 v11 = &unk_26463C1B8;
  objc_copyWeak(&v14, &location);
  id v6 = v4;
  id v12 = v6;
  uint64_t v13 = self;
  [v5 addExecutionBlock:&v8];
  id v7 = [(WCSession *)self delegateOperationQueue];
  [v7 addOperation:v5];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (BOOL)hasCompletedInitialActivation
{
  return self->_hasCompletedInitialActivation;
}

- (BOOL)connectionWasInterrupted
{
  return self->_connectionWasInterrupted;
}

+ (BOOL)isSupported
{
  return MEMORY[0x270F95FB8](@"watch-companion", a2);
}

void __57__WCSession_onqueue_completeSwitchTask_withSessionState___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) pairingID];
  [*(id *)(a1 + 32) setHasContentPending:v2 != 0];

  uint64_t v3 = wc_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = [*(id *)(a1 + 32) hasContentPending];
    uint64_t v5 = "NO";
    if (v4) {
      uint64_t v5 = "YES";
    }
    int v9 = 136446466;
    v10 = "-[WCSession onqueue_completeSwitchTask:withSessionState:]_block_invoke_2";
    __int16 v11 = 2080;
    id v12 = v5;
    _os_log_impl(&dword_222A02000, v3, OS_LOG_TYPE_DEFAULT, "%{public}s hasContentPending: %s", (uint8_t *)&v9, 0x16u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  char v7 = [WeakRetained isCancelled];

  if ((v7 & 1) == 0)
  {
    if ([*(id *)(a1 + 32) delegateSupportsAsyncActivate])
    {
      uint64_t v8 = [*(id *)(a1 + 32) delegate];
      objc_msgSend(v8, "session:activationDidCompleteWithState:error:", *(void *)(a1 + 32), objc_msgSend(*(id *)(a1 + 32), "activationState"), 0);
    }
  }
}

void __46__WCSession_onqueue_handleUpdateSessionState___block_invoke(void **a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  char v3 = [WeakRetained isCancelled];

  if ((v3 & 1) == 0)
  {
    int v4 = a1 + 4;
    uint64_t v5 = [a1[4] pairingID];
    char v7 = a1[5];
    id v6 = a1 + 5;
    uint64_t v8 = [v7 pairingID];
    char v9 = [v5 isEqual:v8];

    if ((v9 & 1) == 0)
    {
      v10 = wc_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        __46__WCSession_onqueue_handleUpdateSessionState___block_invoke_cold_1();
      }
    }
    __int16 v11 = *v6;
    id v12 = *v4;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __46__WCSession_onqueue_handleUpdateSessionState___block_invoke_138;
    v13[3] = &unk_26463C598;
    v13[4] = v11;
    id v14 = v12;
    [v11 didSessionStateChange:v14 withChangeHandler:v13];
  }
}

void __46__WCSession_onqueue_handleUpdateSessionState___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_16();
  uint64_t v2 = [(id)OUTLINED_FUNCTION_15(v1) pairingID];
  char v3 = [*v0 pairingID];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_222A02000, v4, v5, "%{public}s dropping as pairingIDs no longer match. pairingID %{public}@, client pairingID: %{public}@", v6, v7, v8, v9, 2u);
}

- (NSString)pairingID
{
  return self->_pairingID;
}

- (void)setHasContentPending:(BOOL)a3
{
  self->_hasContentPending = a3;
}

- (BOOL)hasContentPending
{
  return self->_hasContentPending;
}

- (void)didSessionStateChange:(id)a3 withChangeHandler:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, uint64_t, BOOL, BOOL, void))a4;
  int v8 = [v6 isReachable];
  uint64_t v9 = v8 ^ [(WCSession *)self isReachable];
  v10 = [v6 pairingID];
  BOOL v11 = [(WCSession *)self didPairingIDChange:v10];

  LODWORD(v10) = [v6 isPaired];
  if (v10 == [(WCSession *)self isPaired]
    && (int v12 = [v6 isAppInstalled], v12 == -[WCSession isWatchAppInstalled](self, "isWatchAppInstalled"))
    && (int v13 = [v6 isComplicationEnabled],
        v13 == [(WCSession *)self isComplicationEnabled]))
  {
    uint64_t v18 = [v6 watchDirectoryURL];
    BOOL v14 = [(WCSession *)self didWatchURLChange:v18];
  }
  else
  {
    BOOL v14 = 1;
  }
  NSUInteger v15 = [(WCSession *)self remainingComplicationUserInfoTransfers];
  uint64_t v16 = [v6 remainingComplicationUserInfoTransfers];
  if (v9 | v14 || v11 || v15 != v16)
  {
    v7[2](v7, v9, v14, v11, 0);
  }
  else
  {
    BOOL v17 = wc_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 136446210;
      uint64_t v20 = "-[WCSession didSessionStateChange:withChangeHandler:]";
      _os_log_impl(&dword_222A02000, v17, OS_LOG_TYPE_DEFAULT, "%{public}s no change", (uint8_t *)&v19, 0xCu);
    }
  }
}

- (BOOL)isPaired
{
  BOOL v3 = [(WCSession *)self logAndTestIfUnactivatedOrMissingDelegate];
  if (v3) {
    LOBYTE(v3) = self->_paired;
  }
  return v3;
}

- (void)setDelegate:(id)delegate
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = [WeakRetained isEqual:v4];

  if ((v6 & 1) == 0)
  {
    objc_storeWeak((id *)&self->_delegate, v4);
    uint64_t v7 = [(WCSession *)self delegate];
    [(WCSession *)self setDelegateSupportsAsyncActivate:objc_opt_respondsToSelector() & 1];

    if ([(WCSession *)self delegateSupportsAsyncActivate])
    {
      int v8 = [(WCSession *)self delegate];
      if (objc_opt_respondsToSelector())
      {
        uint64_t v9 = [(WCSession *)self delegate];
        [(WCSession *)self setDelegateSupportsActiveDeviceSwitch:objc_opt_respondsToSelector() & 1];
      }
      else
      {
        [(WCSession *)self setDelegateSupportsActiveDeviceSwitch:0];
      }
    }
    else
    {
      [(WCSession *)self setDelegateSupportsActiveDeviceSwitch:0];
    }
    v10 = wc_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      if ([(WCSession *)self delegateSupportsAsyncActivate]) {
        BOOL v11 = "YES";
      }
      else {
        BOOL v11 = "NO";
      }
      int v13 = 136446722;
      BOOL v14 = "-[WCSession setDelegate:]";
      if ([(WCSession *)self delegateSupportsActiveDeviceSwitch]) {
        int v12 = "YES";
      }
      else {
        int v12 = "NO";
      }
      __int16 v15 = 2080;
      uint64_t v16 = v11;
      __int16 v17 = 2080;
      uint64_t v18 = v12;
      _os_log_impl(&dword_222A02000, v10, OS_LOG_TYPE_DEFAULT, "%{public}s delegateSupportsAsyncActivate: %s, delegateSupportsActiveDeviceSwitch: %s", (uint8_t *)&v13, 0x20u);
    }
  }
}

- (BOOL)logAndTestIfUnactivatedOrMissingDelegate
{
  if ([(WCSession *)self activationState])
  {
    BOOL v3 = [(WCSession *)self delegate];

    if (v3) {
      return 1;
    }
    uint64_t v5 = wc_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[WCSession logAndTestIfUnactivatedOrMissingDelegate]();
    }
  }
  else
  {
    uint64_t v5 = wc_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[WCSession logAndTestIfUnactivatedOrMissingDelegate]();
    }
  }

  return 0;
}

- (WCSessionActivationState)activationState
{
  return self->_activationState;
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return WeakRetained;
}

- (BOOL)delegateSupportsAsyncActivate
{
  return self->_delegateSupportsAsyncActivate;
}

- (void)setDelegateSupportsAsyncActivate:(BOOL)a3
{
  self->_delegateSupportsAsyncActivate = a3;
}

- (void)setDelegateSupportsActiveDeviceSwitch:(BOOL)a3
{
  self->_delegateSupportsActiveDeviceSwitch = a3;
}

- (NSUInteger)remainingComplicationUserInfoTransfers
{
  return self->_remainingComplicationUserInfoTransfers;
}

- (BOOL)isWatchAppInstalled
{
  BOOL v3 = [(WCSession *)self logAndTestIfUnactivatedOrMissingDelegate];
  if (v3) {
    LOBYTE(v3) = self->_watchAppInstalled;
  }
  return v3;
}

- (BOOL)isReachable
{
  BOOL v3 = [(WCSession *)self logAndTestIfUnactivatedOrMissingDelegate];
  if (v3) {
    LOBYTE(v3) = [(WCSession *)self activationState] == WCSessionActivationStateActivated
  }
              && self->_reachable;
  return v3;
}

- (BOOL)isComplicationEnabled
{
  BOOL v3 = [(WCSession *)self logAndTestIfUnactivatedOrMissingDelegate];
  if (v3) {
    LOBYTE(v3) = self->_complicationEnabled;
  }
  return v3;
}

- (BOOL)didWatchURLChange:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    BOOL v3 = [(WCSession *)self watchDirectoryURL];
    if (!v3)
    {
      LOBYTE(v7) = 0;
LABEL_6:

      goto LABEL_7;
    }
  }
  char v6 = [(WCSession *)self watchDirectoryURL];
  int v7 = [v5 isEqual:v6] ^ 1;

  if (!v5) {
    goto LABEL_6;
  }
LABEL_7:

  return v7;
}

- (void)onDelegateQueueIfTriggeringKVO_updateSessionState:(id)a3 triggerKVO:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  int v7 = wc_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = "NO";
    *(void *)&v16[4] = "-[WCSession onDelegateQueueIfTriggeringKVO_updateSessionState:triggerKVO:]";
    *(_DWORD *)uint64_t v16 = 136446722;
    if (v4) {
      int v8 = "YES";
    }
    *(_WORD *)&v16[12] = 2114;
    *(void *)&v16[14] = v6;
    __int16 v17 = 2080;
    uint64_t v18 = v8;
    _os_log_impl(&dword_222A02000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s %{public}@, triggerKVO: %s", v16, 0x20u);
  }

  uint64_t v9 = [v6 isReachable];
  if (v4) {
    [(WCSession *)self setReachable:v9];
  }
  else {
    self->_reachable = v9;
  }
  v10 = +[WCFileStorage sharedInstance];
  BOOL v11 = [v6 watchDirectoryURL];
  [v10 createWatchDirectoryIfNeeded:v11];

  int v12 = [v6 watchDirectoryURL];
  int v13 = v12;
  if (v4)
  {
    [(WCSession *)self setWatchDirectoryURL:v12];

    -[WCSession setPaired:](self, "setPaired:", [v6 isPaired]);
    -[WCSession setWatchAppInstalled:](self, "setWatchAppInstalled:", [v6 isAppInstalled]);
    -[WCSession setComplicationEnabled:](self, "setComplicationEnabled:", [v6 isComplicationEnabled]);
    -[WCSession setRemainingComplicationUserInfoTransfers:](self, "setRemainingComplicationUserInfoTransfers:", [v6 remainingComplicationUserInfoTransfers]);
  }
  else
  {
    watchDirectoryURL = self->_watchDirectoryURL;
    self->_watchDirectoryURL = v12;

    self->_paired = [v6 isPaired];
    self->_watchAppInstalled = [v6 isAppInstalled];
    self->_complicationEnabled = [v6 isComplicationEnabled];
    self->_remainingComplicationUserInfoTransfers = [v6 remainingComplicationUserInfoTransfers];
  }
  __int16 v15 = [v6 pairingID];
  [(WCSession *)self updatePairingID:v15];
}

- (void)updatePairingID:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (([v4 isEqual:self->_pairingID] & 1) == 0)
  {
    id v5 = (NSString *)[v4 copy];
    pairingID = self->_pairingID;
    self->_pairingID = v5;

    if (self->_pairingID)
    {
      int v7 = wc_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v8 = self->_pairingID;
        *(_DWORD *)buf = 136446466;
        int v13 = "-[WCSession updatePairingID:]";
        __int16 v14 = 2114;
        __int16 v15 = v8;
        _os_log_impl(&dword_222A02000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s %{public}@", buf, 0x16u);
      }

      uint64_t v9 = +[WCFileStorage sharedInstance];
      [v9 setPairingID:self->_pairingID];

      workOperationQueue = self->_workOperationQueue;
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __29__WCSession_updatePairingID___block_invoke;
      v11[3] = &unk_26463C168;
      v11[4] = self;
      [(NSOperationQueue *)workOperationQueue addOperationWithBlock:v11];
    }
  }
}

- (BOOL)didPairingIDChange:(id)a3
{
  pairingID = self->_pairingID;
  if ((unint64_t)a3 | (unint64_t)pairingID) {
    return -[NSString isEqual:](pairingID, "isEqual:") ^ 1;
  }
  else {
    return 0;
  }
}

void __28__WCSession_activateSession__block_invoke_20(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = wc_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __28__WCSession_activateSession__block_invoke_20_cold_1();
    }

    [*(id *)(a1 + 32) setTaskState:888];
    id v5 = [*(id *)(a1 + 40) delegateOperationQueue];
    [v5 setSuspended:0];
  }
}

- (NSURL)watchDirectoryURL
{
  id v3 = [(WCSession *)self errorIfPreconditionsNotSatisfied];

  if (v3) {
    id v4 = 0;
  }
  else {
    id v4 = self->_watchDirectoryURL;
  }

  return v4;
}

- (void)activateSession
{
  id v3 = _os_activity_create(&dword_222A02000, "activateSession", MEMORY[0x263EF8428], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __28__WCSession_activateSession__block_invoke;
  block[3] = &unk_26463C168;
  block[4] = self;
  os_activity_apply(v3, block);
}

- (WCSession)init
{
  return 0;
}

- (void)dealloc
{
  id v3 = +[WCXPCManager sharedManager];
  [v3 setDelegate:0];

  v4.receiver = self;
  v4.super_class = (Class)WCSession;
  [(WCSession *)&v4 dealloc];
}

intptr_t __28__WCSession_activateSession__block_invoke_24(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)onqueue_loadPersistedContent
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v3 = wc_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136446210;
    id v5 = "-[WCSession onqueue_loadPersistedContent]";
    _os_log_impl(&dword_222A02000, v3, OS_LOG_TYPE_DEFAULT, "%{public}s loading persisted content", (uint8_t *)&v4, 0xCu);
  }

  [(WCSession *)self onqueue_loadOutstandingFileTransfers];
  [(WCSession *)self onqueue_loadOutstandingUserInfoTransfers];
  [(WCSession *)self onqueue_loadAppContexts];
}

- (NSString)description
{
  id v3 = NSString;
  int v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = [(WCSession *)self delegate];
  if (v6) {
    int v7 = "YES";
  }
  else {
    int v7 = "NO";
  }
  int v8 = [v3 stringWithFormat:@"<%@: %p, hasDelegate: %s, activationState: %d>", v5, self, v7, -[WCSession activationState](self, "activationState")];

  return (NSString *)v8;
}

- (BOOL)isEqual:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)WCSession;
  return [(WCSession *)&v4 isEqual:a3];
}

- (unint64_t)hash
{
  v3.receiver = self;
  v3.super_class = (Class)WCSession;
  return [(WCSession *)&v3 hash];
}

- (void)onqueue_cancelMessagesIfAppropriate
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if ([(WCSession *)self isReachable] && [(WCSession *)self isWatchAppInstalled]) {
    int v3 = ![(WCSession *)self isPaired];
  }
  else {
    int v3 = 1;
  }
  objc_super v4 = wc_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = "NO";
    if (v3) {
      id v5 = "YES";
    }
    int v7 = 136446466;
    int v8 = "-[WCSession onqueue_cancelMessagesIfAppropriate]";
    __int16 v9 = 2080;
    v10 = v5;
    _os_log_impl(&dword_222A02000, v4, OS_LOG_TYPE_DEFAULT, "%{public}s shouldCancel: %s", (uint8_t *)&v7, 0x16u);
  }

  if (v3)
  {
    uint64_t v6 = [(WCSession *)self queueManager];
    [v6 cancelQueuedMessages];
  }
}

- (BOOL)isCompanionAppInstalled
{
  BOOL v3 = [(WCSession *)self logAndTestIfUnactivatedOrMissingDelegate];
  if (v3) {
    LOBYTE(v3) = self->_companionAppInstalled;
  }
  return v3;
}

uint64_t __29__WCSession_updatePairingID___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "onqueue_loadPersistedContent");
}

- (NSArray)outstandingUserInfoTransfers
{
  v15[1] = *MEMORY[0x263EF8340];
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x3032000000;
  int v12 = __Block_byref_object_copy_;
  int v13 = __Block_byref_object_dispose_;
  id v14 = (id)MEMORY[0x263EFFA68];
  BOOL v3 = objc_opt_new();
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __41__WCSession_outstandingUserInfoTransfers__block_invoke;
  v8[3] = &unk_26463C190;
  v8[4] = self;
  v8[5] = &v9;
  [v3 addExecutionBlock:v8];
  workOperationQueue = self->_workOperationQueue;
  v15[0] = v3;
  id v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
  [(NSOperationQueue *)workOperationQueue addOperations:v5 waitUntilFinished:1];

  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return (NSArray *)v6;
}

uint64_t __41__WCSession_outstandingUserInfoTransfers__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 112) allValues];

  return MEMORY[0x270F9A758]();
}

- (void)onqueue_setCurrentComplicationUserInfoTransfer:(id)a3
{
  objc_super v4 = (WCSessionUserInfoTransfer *)a3;
  [(WCSessionUserInfoTransfer *)self->_currentComplicationUserInfoTransfer setCurrentComplicationInfo:0];
  currentComplicationUserInfoTransfer = self->_currentComplicationUserInfoTransfer;
  self->_currentComplicationUserInfoTransfer = v4;
}

- (void)onqueue_loadOutstandingUserInfoTransfers
{
  BOOL v3 = +[WCFileStorage sharedInstance];
  id v7 = 0;
  objc_super v4 = [v3 loadOutstandingUserInfoTransfersAndComplicationUserInfo:&v7];
  id v5 = (WCSessionUserInfoTransfer *)v7;
  [(WCSession *)self setInternalOutstandingUserInfoTransfers:v4];

  currentComplicationUserInfoTransfer = self->_currentComplicationUserInfoTransfer;
  self->_currentComplicationUserInfoTransfer = v5;
}

- (id)onqueue_addOutstandingUserInfoTransfer:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    [(WCSession *)self willChangeValueForKey:@"outstandingUserInfoTransfers"];
    internalOutstandingUserInfoTransfers = self->_internalOutstandingUserInfoTransfers;
    id v6 = [v4 transferIdentifier];
    [(NSMutableDictionary *)internalOutstandingUserInfoTransfers setObject:v4 forKeyedSubscript:v6];

    [(WCSession *)self didChangeValueForKey:@"outstandingUserInfoTransfers"];
    id v7 = +[WCFileStorage sharedInstance];
    int v8 = [v7 persistOutgoingUserInfoTransfer:v4];
  }
  else
  {
    int v8 = 0;
  }

  return v8;
}

- (void)onqueue_removeOutstandingUserInfoTransfer:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(WCSession *)self pairingID];

    if (v5)
    {
      id v6 = [(WCSession *)self internalOutstandingFileTransfers];
      id v7 = [v4 transferIdentifier];
      int v8 = [v6 objectForKeyedSubscript:v7];

      if (v8)
      {
        [(WCSession *)self willChangeValueForKey:@"outstandingUserInfoTransfers"];
        internalOutstandingUserInfoTransfers = self->_internalOutstandingUserInfoTransfers;
        v10 = [v4 transferIdentifier];
        [(NSMutableDictionary *)internalOutstandingUserInfoTransfers removeObjectForKey:v10];

        [(WCSession *)self didChangeValueForKey:@"outstandingUserInfoTransfers"];
      }
      else
      {
        int v12 = self->_internalOutstandingUserInfoTransfers;
        int v13 = [v4 transferIdentifier];
        [(NSMutableDictionary *)v12 removeObjectForKey:v13];
      }
      uint64_t v11 = +[WCFileStorage sharedInstance];
      [v11 deleteOutstandingUserInfoTransfer:v4];
    }
    else
    {
      uint64_t v11 = wc_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[WCSession onqueue_removeOutstandingUserInfoTransfer:]();
      }
    }
  }
}

- (NSArray)outstandingFileTransfers
{
  v15[1] = *MEMORY[0x263EF8340];
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x3032000000;
  int v12 = __Block_byref_object_copy_;
  int v13 = __Block_byref_object_dispose_;
  id v14 = (id)MEMORY[0x263EFFA68];
  BOOL v3 = objc_opt_new();
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __37__WCSession_outstandingFileTransfers__block_invoke;
  v8[3] = &unk_26463C190;
  v8[4] = self;
  v8[5] = &v9;
  [v3 addExecutionBlock:v8];
  workOperationQueue = self->_workOperationQueue;
  v15[0] = v3;
  id v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
  [(NSOperationQueue *)workOperationQueue addOperations:v5 waitUntilFinished:1];

  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return (NSArray *)v6;
}

uint64_t __37__WCSession_outstandingFileTransfers__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 120) allValues];

  return MEMORY[0x270F9A758]();
}

- (void)onqueue_loadOutstandingFileTransfers
{
  BOOL v3 = +[WCFileStorage sharedInstance];
  id v4 = [v3 loadOutstandingFileTransfers];
  [(WCSession *)self setInternalOutstandingFileTransfers:v4];

  [(WCSession *)self onqueue_loadFileTransferProgress];
}

- (void)onqueue_addOutstandingFileTransfer:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    [(WCSession *)self willChangeValueForKey:@"outstandingFileTransfers"];
    internalOutstandingFileTransfers = self->_internalOutstandingFileTransfers;
    id v6 = [v4 transferIdentifier];
    [(NSMutableDictionary *)internalOutstandingFileTransfers setObject:v4 forKeyedSubscript:v6];

    [(WCSession *)self didChangeValueForKey:@"outstandingFileTransfers"];
    id v7 = +[WCFileStorage sharedInstance];
    [v7 persistOutgoingFileTransfer:v4];
  }
}

- (void)onqueue_removeOutstandingFileTransfer:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(WCSession *)self pairingID];

    if (v5)
    {
      id v6 = [(WCSession *)self internalOutstandingFileTransfers];
      id v7 = [v4 transferIdentifier];
      int v8 = [v6 objectForKeyedSubscript:v7];

      if (v8)
      {
        [(WCSession *)self willChangeValueForKey:@"outstandingFileTransfers"];
        internalOutstandingFileTransfers = self->_internalOutstandingFileTransfers;
        v10 = [v4 transferIdentifier];
        [(NSMutableDictionary *)internalOutstandingFileTransfers removeObjectForKey:v10];

        [(WCSession *)self didChangeValueForKey:@"outstandingFileTransfers"];
      }
      else
      {
        int v12 = self->_internalOutstandingFileTransfers;
        int v13 = [v4 transferIdentifier];
        [(NSMutableDictionary *)v12 removeObjectForKey:v13];
      }
      uint64_t v11 = +[WCFileStorage sharedInstance];
      [v11 deleteOutstandingFileTransfer:v4];
    }
    else
    {
      uint64_t v11 = wc_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[WCSession onqueue_removeOutstandingUserInfoTransfer:]();
      }
    }
  }
}

- (void)onqueue_loadFileTransferProgress
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  BOOL v3 = wc_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(WCSession *)self internalOutstandingFileTransfers];
    *(_DWORD *)buf = 136446466;
    __int16 v17 = "-[WCSession onqueue_loadFileTransferProgress]";
    __int16 v18 = 2050;
    uint64_t v19 = [v4 count];
    _os_log_impl(&dword_222A02000, v3, OS_LOG_TYPE_DEFAULT, "%{public}s for number of file transfers %{public}ld", buf, 0x16u);
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = [(WCSession *)self internalOutstandingFileTransfers];
  id v6 = [v5 allValues];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [(WCSession *)self onqueue_createProgressForFileTransfer:*(void *)(*((void *)&v11 + 1) + 8 * v10++)];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)onqueue_createProgressForFileTransfer:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = (void *)MEMORY[0x263F08AB8];
  id v6 = [v4 file];
  uint64_t v7 = [v6 fileURL];
  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 3221225472;
  long long v13 = __51__WCSession_onqueue_createProgressForFileTransfer___block_invoke;
  long long v14 = &unk_26463C230;
  id v8 = v4;
  id v15 = v8;
  uint64_t v16 = self;
  objc_copyWeak(&v17, &location);
  uint64_t v9 = [v5 _addSubscriberForFileURL:v7 withPublishingHandler:&v11];

  objc_msgSend(v8, "setProgressToken:", v9, v11, v12, v13, v14);
  uint64_t v10 = wc_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    uint64_t v20 = "-[WCSession onqueue_createProgressForFileTransfer:]";
    __int16 v21 = 2114;
    id v22 = v8;
    _os_log_impl(&dword_222A02000, v10, OS_LOG_TYPE_DEFAULT, "%{public}s Created progress for %{public}@", buf, 0x16u);
  }

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

id __51__WCSession_onqueue_createProgressForFileTransfer___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:@"IDSSendResourceProgressIdentifier"];

  id v6 = [*(id *)(a1 + 32) transferIdentifier];
  int v7 = [v5 isEqualToString:v6];

  if (v7)
  {
    id v8 = *(void **)(*(void *)(a1 + 40) + 88);
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __51__WCSession_onqueue_createProgressForFileTransfer___block_invoke_2;
    v19[3] = &unk_26463C1B8;
    objc_copyWeak(&v22, (id *)(a1 + 48));
    id v20 = *(id *)(a1 + 32);
    id v21 = v3;
    [v8 addOperationWithBlock:v19];

    objc_destroyWeak(&v22);
  }
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __51__WCSession_onqueue_createProgressForFileTransfer___block_invoke_3;
  v13[3] = &unk_26463C208;
  char v18 = v7;
  uint64_t v9 = *(void *)(a1 + 40);
  id v14 = v5;
  uint64_t v15 = v9;
  id v10 = v5;
  objc_copyWeak(&v17, (id *)(a1 + 48));
  id v16 = *(id *)(a1 + 32);
  uint64_t v11 = (void *)MEMORY[0x223CA3B50](v13);

  objc_destroyWeak(&v17);

  return v11;
}

void __51__WCSession_onqueue_createProgressForFileTransfer___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "onqueue_updateProgressForFileTransfer:progress:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

void __51__WCSession_onqueue_createProgressForFileTransfer___block_invoke_3(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (*(unsigned char *)(a1 + 64))
  {
    uint64_t v2 = wc_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 136446466;
      uint64_t v9 = "-[WCSession onqueue_createProgressForFileTransfer:]_block_invoke_3";
      __int16 v10 = 2114;
      uint64_t v11 = v3;
      _os_log_impl(&dword_222A02000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s Progress unpublished for transfer %{public}@", buf, 0x16u);
    }

    id v4 = *(void **)(*(void *)(a1 + 40) + 88);
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __51__WCSession_onqueue_createProgressForFileTransfer___block_invoke_47;
    v5[3] = &unk_26463C1E0;
    objc_copyWeak(&v7, (id *)(a1 + 56));
    id v6 = *(id *)(a1 + 48);
    [v4 addOperationWithBlock:v5];

    objc_destroyWeak(&v7);
  }
}

void __51__WCSession_onqueue_createProgressForFileTransfer___block_invoke_47(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "onqueue_removeProgressForFileTransfer:", *(void *)(a1 + 32));
}

- (void)onqueue_updateProgressForFileTransfer:(id)a3 progress:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = wc_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [v6 transferIdentifier];
    int v13 = 136446466;
    id v14 = "-[WCSession onqueue_updateProgressForFileTransfer:progress:]";
    __int16 v15 = 2114;
    id v16 = v9;
    _os_log_impl(&dword_222A02000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s Updating progress for %{public}@", (uint8_t *)&v13, 0x16u);
  }
  if (v6)
  {
    [v6 setInternalProgress:v7];
    [v6 addObserver:self forKeyPath:@"internalProgress.userInfo.NSProgressByteCompletedCountKey" options:1 context:0];
    [v6 addObserver:self forKeyPath:@"internalProgress.finished" options:1 context:0];
    [v6 addObserver:self forKeyPath:@"internalProgress.cancelled" options:1 context:0];
    [(WCSession *)self onqueue_updateClientProgressForFileTransfer:v6];
    __int16 v10 = wc_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = [v6 internalProgress];
      int v13 = 136446466;
      id v14 = "-[WCSession onqueue_updateProgressForFileTransfer:progress:]";
      __int16 v15 = 2112;
      id v16 = v11;
      uint64_t v12 = "%{public}s Added observer for progress %@";
LABEL_8:
      _os_log_impl(&dword_222A02000, v10, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v13, 0x16u);
    }
  }
  else
  {
    __int16 v10 = wc_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = [0 transferIdentifier];
      int v13 = 136446466;
      id v14 = "-[WCSession onqueue_updateProgressForFileTransfer:progress:]";
      __int16 v15 = 2114;
      id v16 = v11;
      uint64_t v12 = "%{public}s Missing item for publish callback (identifier: %{public}@)";
      goto LABEL_8;
    }
  }
}

- (void)onqueue_removeProgressForFileTransfer:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 progress];
  int v6 = [v5 isFinished];

  if (v6)
  {
    id v7 = [v4 progressToken];

    id v8 = wc_log();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v9)
      {
        int v14 = 136446466;
        __int16 v15 = "-[WCSession onqueue_removeProgressForFileTransfer:]";
        __int16 v16 = 2114;
        id v17 = v4;
        _os_log_impl(&dword_222A02000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s Removing progress for transfer %{public}@", (uint8_t *)&v14, 0x16u);
      }

      __int16 v10 = [v4 internalProgress];

      if (v10)
      {
        uint64_t v11 = wc_log();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          int v14 = 136446210;
          __int16 v15 = "-[WCSession onqueue_removeProgressForFileTransfer:]";
          _os_log_impl(&dword_222A02000, v11, OS_LOG_TYPE_DEFAULT, "%{public}s Removing progress observers", (uint8_t *)&v14, 0xCu);
        }

        [v4 removeObserver:self forKeyPath:@"internalProgress.userInfo.NSProgressByteCompletedCountKey"];
        [v4 removeObserver:self forKeyPath:@"internalProgress.finished"];
        [v4 removeObserver:self forKeyPath:@"internalProgress.cancelled"];
      }
      uint64_t v12 = (void *)MEMORY[0x263F08AB8];
      int v13 = [v4 progressToken];
      [v12 _removeSubscriber:v13];

      [v4 setProgressToken:0];
    }
    else
    {
      if (v9)
      {
        int v14 = 136446466;
        __int16 v15 = "-[WCSession onqueue_removeProgressForFileTransfer:]";
        __int16 v16 = 2114;
        id v17 = v4;
        _os_log_impl(&dword_222A02000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s Missing item to remove (identifier: %{public}@)", (uint8_t *)&v14, 0x16u);
      }
    }
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v8 = a3;
  id v9 = a4;
  workOperationQueue = self->_workOperationQueue;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __60__WCSession_observeValueForKeyPath_ofObject_change_context___block_invoke;
  v13[3] = &unk_26463C258;
  id v14 = v9;
  id v15 = v8;
  __int16 v16 = self;
  id v11 = v8;
  id v12 = v9;
  [(NSOperationQueue *)workOperationQueue addOperationWithBlock:v13];
}

void __60__WCSession_observeValueForKeyPath_ofObject_change_context___block_invoke(id *a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (uint64_t v2 = a1[4]) != 0)
  {
    uint64_t v3 = v2;
    id v4 = [v2 internalProgress];
    id v5 = [v4 userInfo];
    int v6 = [v5 objectForKeyedSubscript:@"IDSSendResourceProgressIdentifier"];

    id v7 = [v3 transferIdentifier];
    LODWORD(v5) = [v6 isEqualToString:v7];

    if (v5)
    {
      if ([a1[5] isEqual:@"internalProgress.userInfo.NSProgressByteCompletedCountKey"])
      {
        objc_msgSend(a1[6], "onqueue_updateClientProgressForFileTransfer:", v3);
      }
      else if ([a1[5] isEqual:@"internalProgress.finished"])
      {
        objc_msgSend(a1[6], "onqueue_handleProgressFinishedForFileTransfer:", v3);
      }
      else if ([a1[5] isEqual:@"internalProgress.cancelled"])
      {
        id v8 = wc_log();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          int v9 = 136446466;
          __int16 v10 = "-[WCSession observeValueForKeyPath:ofObject:change:context:]_block_invoke";
          __int16 v11 = 2112;
          id v12 = v6;
          _os_log_impl(&dword_222A02000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s Progress cancelled for identifier %@", (uint8_t *)&v9, 0x16u);
        }
      }
    }
  }
  else
  {
    uint64_t v3 = wc_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __60__WCSession_observeValueForKeyPath_ofObject_change_context___block_invoke_cold_1(v3);
    }
  }
}

- (void)onqueue_updateClientProgressForFileTransfer:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(WCSession *)self internalOutstandingFileTransfers];
  int v6 = [v4 transferIdentifier];
  id v7 = [v5 objectForKeyedSubscript:v6];

  if (v7)
  {
    id v8 = [v4 internalProgress];
    int v9 = [v8 userInfo];
    __int16 v10 = [v9 objectForKeyedSubscript:*MEMORY[0x263F08460]];

    __int16 v11 = [v4 internalProgress];
    id v12 = [v11 byteCompletedCount];

    uint64_t v13 = wc_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = [v4 internalProgress];
      id v15 = [v14 userInfo];
      __int16 v16 = [v4 internalProgress];
      int v24 = 138413058;
      id v25 = (const char *)v10;
      __int16 v26 = 2112;
      id v27 = v12;
      __int16 v28 = 2112;
      v29 = v15;
      __int16 v30 = 2112;
      v31 = v16;
      _os_log_impl(&dword_222A02000, v13, OS_LOG_TYPE_DEFAULT, "Got totalBytes: %@, completedBytes: %@, userInfo: %@, progress: %@", (uint8_t *)&v24, 0x2Au);
    }
    id v17 = [v4 progress];
    [v12 doubleValue];
    double v19 = v18;
    [v10 doubleValue];
    uint64_t v21 = (uint64_t)(v19 / v20 * (double)[v17 totalUnitCount]);
    if ([v17 totalUnitCount] < v21) {
      uint64_t v21 = [v17 totalUnitCount];
    }
    [v17 setCompletedUnitCount:v21];
    id v22 = wc_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v23 = [v4 transferIdentifier];
      int v24 = 136446722;
      id v25 = "-[WCSession onqueue_updateClientProgressForFileTransfer:]";
      __int16 v26 = 2114;
      id v27 = v23;
      __int16 v28 = 2114;
      v29 = v17;
      _os_log_impl(&dword_222A02000, v22, OS_LOG_TYPE_DEFAULT, "%{public}s Updated progress for identifier: %{public}@, to %{public}@", (uint8_t *)&v24, 0x20u);
    }
    goto LABEL_11;
  }
  __int16 v10 = wc_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = [v4 transferIdentifier];
    int v24 = 136446466;
    id v25 = "-[WCSession onqueue_updateClientProgressForFileTransfer:]";
    __int16 v26 = 2114;
    id v27 = v12;
    _os_log_impl(&dword_222A02000, v10, OS_LOG_TYPE_DEFAULT, "%{public}s Received progress for identifier: %{public}@, without outstanding tranfer", (uint8_t *)&v24, 0x16u);
LABEL_11:
  }
}

- (void)onqueue_handleProgressFinishedForFileTransfer:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [v3 transferIdentifier];
  id v5 = wc_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136446466;
    int v9 = "-[WCSession onqueue_handleProgressFinishedForFileTransfer:]";
    __int16 v10 = 2114;
    __int16 v11 = v4;
    _os_log_impl(&dword_222A02000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s Progress finished for identifier %{public}@", (uint8_t *)&v8, 0x16u);
  }

  int v6 = [v3 progress];

  if (v6 && ([v6 isFinished] & 1) == 0 && (objc_msgSend(v6, "isCancelled") & 1) == 0)
  {
    id v7 = wc_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136446466;
      int v9 = "-[WCSession onqueue_handleProgressFinishedForFileTransfer:]";
      __int16 v10 = 2114;
      __int16 v11 = v4;
      _os_log_impl(&dword_222A02000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s Forcing progress to finished for %{public}@", (uint8_t *)&v8, 0x16u);
    }

    objc_msgSend(v6, "setCompletedUnitCount:", objc_msgSend(v6, "totalUnitCount"));
  }
}

- (void)sendMessage:(NSDictionary *)message replyHandler:(void *)replyHandler errorHandler:(void *)errorHandler
{
  int v8 = message;
  int v9 = replyHandler;
  __int16 v10 = errorHandler;
  if (!v8)
  {
    __int16 v11 = objc_msgSend(NSString, "stringWithFormat:", @"%s: %s cannot be nil.", "-[WCSession sendMessage:replyHandler:errorHandler:]", "message");
    uint64_t v12 = wc_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      -[WCSession sendMessage:replyHandler:errorHandler:](v11);
    }

    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"%@", v11 format];
  }
  uint64_t v13 = _os_activity_create(&dword_222A02000, "sendMessage:replyHandler:errorHandler:", MEMORY[0x263EF8428], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__WCSession_sendMessage_replyHandler_errorHandler___block_invoke;
  block[3] = &unk_26463C2A8;
  id v19 = v9;
  id v20 = v10;
  block[4] = self;
  double v18 = v8;
  id v14 = v8;
  id v15 = v10;
  id v16 = v9;
  os_activity_apply(v13, block);
}

void __51__WCSession_sendMessage_replyHandler_errorHandler___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v2 = wc_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = "YES";
    uint64_t v4 = *(void *)(a1 + 56);
    BOOL v5 = *(void *)(a1 + 48) == 0;
    id v14 = "-[WCSession sendMessage:replyHandler:errorHandler:]_block_invoke";
    if (v5) {
      int v6 = "NO";
    }
    else {
      int v6 = "YES";
    }
    *(_DWORD *)buf = 136446722;
    __int16 v15 = 2080;
    if (!v4) {
      id v3 = "NO";
    }
    id v16 = v6;
    __int16 v17 = 2080;
    double v18 = v3;
    _os_log_impl(&dword_222A02000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s hasReplyHandler: %s, hasErrorHandler: %s", buf, 0x20u);
  }

  uint64_t v7 = *(void *)(a1 + 32);
  int v8 = *(void **)(v7 + 88);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __51__WCSession_sendMessage_replyHandler_errorHandler___block_invoke_66;
  v9[3] = &unk_26463C280;
  v9[4] = v7;
  id v10 = *(id *)(a1 + 40);
  id v11 = *(id *)(a1 + 48);
  id v12 = *(id *)(a1 + 56);
  [v8 addOperationWithBlock:v9];
}

void __51__WCSession_sendMessage_replyHandler_errorHandler___block_invoke_66(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) errorIfPreconditionsNotSatisfied];
  if (v2
    || ([*(id *)(a1 + 32) errorIfNotReachable], (id v2 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_msgSend(*(id *)(a1 + 32), "_onqueue_notifyOfMessageError:messageID:withErrorHandler:", v2, 0, *(void *)(a1 + 56));
  }
  else
  {
    id v3 = *(void **)(a1 + 40);
    id v7 = 0;
    uint64_t v4 = WCSerializePayloadDictionary(v3, &v7);
    id v2 = v7;
    BOOL v5 = *(void **)(a1 + 32);
    if (v4)
    {
      objc_msgSend(*(id *)(a1 + 32), "onqueue_sendMessageData:replyHandler:errorHandler:dictionaryMessage:", v4, *(void *)(a1 + 48), *(void *)(a1 + 56), 1);
    }
    else
    {
      int v6 = [MEMORY[0x263F087E8] wcErrorWithCode:7010];
      objc_msgSend(v5, "_onqueue_notifyOfMessageError:messageID:withErrorHandler:", v6, 0, *(void *)(a1 + 56));
    }
  }
}

- (void)sendMessageData:(NSData *)data replyHandler:(void *)replyHandler errorHandler:(void *)errorHandler
{
  int v8 = data;
  int v9 = replyHandler;
  id v10 = errorHandler;
  if (!v8)
  {
    id v11 = objc_msgSend(NSString, "stringWithFormat:", @"%s: %s cannot be nil.", "-[WCSession sendMessageData:replyHandler:errorHandler:]", "data");
    id v12 = wc_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      -[WCSession sendMessage:replyHandler:errorHandler:](v11);
    }

    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"%@", v11 format];
  }
  uint64_t v13 = _os_activity_create(&dword_222A02000, "sendMessageData:replyHandler:errorHandler:", MEMORY[0x263EF8428], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__WCSession_sendMessageData_replyHandler_errorHandler___block_invoke;
  block[3] = &unk_26463C2A8;
  id v19 = v9;
  id v20 = v10;
  block[4] = self;
  double v18 = v8;
  id v14 = v8;
  id v15 = v10;
  id v16 = v9;
  os_activity_apply(v13, block);
}

void __55__WCSession_sendMessageData_replyHandler_errorHandler___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v2 = wc_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = "YES";
    uint64_t v4 = *(void *)(a1 + 56);
    BOOL v5 = *(void *)(a1 + 48) == 0;
    id v14 = "-[WCSession sendMessageData:replyHandler:errorHandler:]_block_invoke";
    if (v5) {
      int v6 = "NO";
    }
    else {
      int v6 = "YES";
    }
    *(_DWORD *)buf = 136446722;
    __int16 v15 = 2080;
    if (!v4) {
      id v3 = "NO";
    }
    id v16 = v6;
    __int16 v17 = 2080;
    double v18 = v3;
    _os_log_impl(&dword_222A02000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s hasReplyHandler: %s, hasErrorHandler: %s", buf, 0x20u);
  }

  uint64_t v7 = *(void *)(a1 + 32);
  int v8 = *(void **)(v7 + 88);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __55__WCSession_sendMessageData_replyHandler_errorHandler___block_invoke_69;
  v9[3] = &unk_26463C280;
  v9[4] = v7;
  id v10 = *(id *)(a1 + 40);
  id v11 = *(id *)(a1 + 48);
  id v12 = *(id *)(a1 + 56);
  [v8 addOperationWithBlock:v9];
}

void __55__WCSession_sendMessageData_replyHandler_errorHandler___block_invoke_69(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) errorIfPreconditionsNotSatisfied];
  if (v2 || ([*(id *)(a1 + 32) errorIfNotReachable], (uint64_t v2 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v7 = (id)v2;
    objc_msgSend(*(id *)(a1 + 32), "_onqueue_notifyOfMessageError:messageID:withErrorHandler:", v2, 0, *(void *)(a1 + 56));
  }
  else
  {
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    uint64_t v6 = *(void *)(a1 + 56);
    objc_msgSend(v3, "onqueue_sendMessageData:replyHandler:errorHandler:dictionaryMessage:", v4, v5, v6, 0);
  }
}

- (void)onqueue_sendMessageData:(id)a3 replyHandler:(id)a4 errorHandler:(id)a5 dictionaryMessage:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v10 = a3;
  unint64_t v11 = (unint64_t)a4;
  unint64_t v12 = (unint64_t)a5;
  if (WCIsDataAcceptableSizeForType(0, v10))
  {
    uint64_t v13 = objc_opt_new();
    id v14 = [v13 UUIDString];

    if (v11 | v12)
    {
      __int16 v15 = off_26463BFD0;
      if (!v6) {
        __int16 v15 = off_26463BFC8;
      }
      id v16 = (void *)[objc_alloc(*v15) initWithIdentifier:v14 responseHandler:v11 errorHandler:v12];
      [(NSMutableDictionary *)self->_currentMessages setObject:v16 forKeyedSubscript:v14];
      if (v11)
      {
        v30[0] = MEMORY[0x263EF8330];
        v30[1] = 3221225472;
        v30[2] = __81__WCSession_onqueue_sendMessageData_replyHandler_errorHandler_dictionaryMessage___block_invoke;
        v30[3] = &unk_26463C258;
        id v17 = v16;
        id v31 = v17;
        uint64_t v32 = self;
        id v33 = v14;
        double v18 = [(WCSession *)self createAndStartTimerOnWorkQueueWithHandler:v30];
        [v17 setTimeoutTimer:v18];
      }
    }
    uint64_t v19 = [WCMessageRequest alloc];
    id v20 = [(WCSession *)self pairingID];
    uint64_t v21 = [(WCMessageRequest *)v19 initWithPairingID:v20 identifier:v14 data:v10 dictionaryMessage:v6 expectsResponse:v11 != 0];

    id v22 = wc_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v23 = [v10 length];
      *(_DWORD *)buf = 136446722;
      v35 = "-[WCSession onqueue_sendMessageData:replyHandler:errorHandler:dictionaryMessage:]";
      __int16 v36 = 2048;
      uint64_t v37 = v23;
      __int16 v38 = 2114;
      v39 = v14;
      _os_log_impl(&dword_222A02000, v22, OS_LOG_TYPE_DEFAULT, "%{public}s size: %ld, messageID: %{public}@", buf, 0x20u);
    }

    objc_initWeak((id *)buf, self);
    int v24 = [(WCSession *)self queueManager];
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __81__WCSession_onqueue_sendMessageData_replyHandler_errorHandler_dictionaryMessage___block_invoke_74;
    v27[3] = &unk_26463C2D0;
    v27[4] = self;
    objc_copyWeak(&v29, (id *)buf);
    id v25 = v14;
    id v28 = v25;
    [v24 sendMessage:v21 completionHandler:v27];

    objc_destroyWeak(&v29);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    __int16 v26 = [MEMORY[0x263F087E8] wcErrorWithCode:7009];
    [(WCSession *)self _onqueue_notifyOfMessageError:v26 messageID:0 withErrorHandler:v12];
  }
}

void __81__WCSession_onqueue_sendMessageData_replyHandler_errorHandler_dictionaryMessage___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) timeoutTimer];
  dispatch_source_cancel(v2);

  id v3 = *(void **)(a1 + 40);
  uint64_t v4 = [MEMORY[0x263F087E8] wcErrorWithCode:7012];
  uint64_t v5 = *(void *)(a1 + 48);
  BOOL v6 = [*(id *)(a1 + 32) errorHandler];
  objc_msgSend(v3, "_onqueue_notifyOfMessageError:messageID:withErrorHandler:", v4, v5, v6);

  id v7 = [*(id *)(a1 + 32) identifier];

  if (v7)
  {
    id v9 = [*(id *)(a1 + 40) currentMessages];
    int v8 = [*(id *)(a1 + 32) identifier];
    [v9 removeObjectForKey:v8];
  }
}

void __81__WCSession_onqueue_sendMessageData_replyHandler_errorHandler_dictionaryMessage___block_invoke_74(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 88);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __81__WCSession_onqueue_sendMessageData_replyHandler_errorHandler_dictionaryMessage___block_invoke_2;
  v6[3] = &unk_26463C1B8;
  objc_copyWeak(&v9, (id *)(a1 + 48));
  id v5 = v3;
  id v7 = v5;
  id v8 = *(id *)(a1 + 40);
  [v4 addOperationWithBlock:v6];

  objc_destroyWeak(&v9);
}

void __81__WCSession_onqueue_sendMessageData_replyHandler_errorHandler_dictionaryMessage___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "onqueue_handleMessageCompletionWithError:withMessageID:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

- (BOOL)updateApplicationContext:(NSDictionary *)applicationContext error:(NSError *)error
{
  BOOL v6 = applicationContext;
  if (!v6)
  {
    id v7 = objc_msgSend(NSString, "stringWithFormat:", @"%s: %s cannot be nil.", "-[WCSession updateApplicationContext:error:]", "applicationContext");
    id v8 = wc_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      -[WCSession sendMessage:replyHandler:errorHandler:](v7);
    }

    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"%@", v7 format];
  }
  uint64_t v17 = 0;
  double v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  id v9 = _os_activity_create(&dword_222A02000, "updateApplicationContext:error:", MEMORY[0x263EF8428], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__WCSession_updateApplicationContext_error___block_invoke;
  block[3] = &unk_26463C318;
  block[4] = self;
  id v14 = v6;
  __int16 v15 = &v17;
  id v16 = error;
  id v10 = v6;
  os_activity_apply(v9, block);
  char v11 = *((unsigned char *)v18 + 24);

  _Block_object_dispose(&v17, 8);
  return v11;
}

void __44__WCSession_updateApplicationContext_error___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  uint64_t v2 = wc_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    uint64_t v23 = "-[WCSession updateApplicationContext:error:]_block_invoke";
    _os_log_impl(&dword_222A02000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s ", buf, 0xCu);
  }

  id v3 = [MEMORY[0x263F086E0] mainBundle];
  uint64_t v4 = [v3 bundleIdentifier];
  char v5 = [v4 isEqualToString:@"com.facebook.Messenger"];

  uint64_t v6 = [*(id *)(a1 + 32) errorIfPreconditionsNotSatisfied];
  id v7 = (void *)v6;
  if (!v6 && (v5 & 1) == 0)
  {
    id v8 = *(void **)(a1 + 40);
    id v9 = [*(id *)(a1 + 32) applicationContext];
    LOBYTE(v8) = [v8 isEqual:v9];

    if ((v8 & 1) == 0) {
      goto LABEL_6;
    }
LABEL_12:
    char v11 = wc_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_222A02000, v11, OS_LOG_TYPE_DEFAULT, "no change", buf, 2u);
    }
    goto LABEL_17;
  }
  if (v6) {
    goto LABEL_12;
  }
LABEL_6:
  id v10 = *(void **)(a1 + 40);
  id v21 = v7;
  char v11 = WCSerializePayloadDictionary(v10, &v21);
  id v12 = v21;

  if (!v11)
  {
    uint64_t v17 = (void *)MEMORY[0x263F087E8];
    uint64_t v18 = 7010;
LABEL_16:
    id v7 = [v17 wcErrorWithCode:v18];

LABEL_17:
    id v12 = v7;
    goto LABEL_18;
  }
  if (!WCIsDataAcceptableSizeForType(1, v11))
  {
    uint64_t v17 = (void *)MEMORY[0x263F087E8];
    uint64_t v18 = 7009;
    goto LABEL_16;
  }
  uint64_t v13 = wc_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = [v11 length];
    *(_DWORD *)buf = 136446466;
    uint64_t v23 = "-[WCSession updateApplicationContext:error:]_block_invoke";
    __int16 v24 = 2048;
    uint64_t v25 = v14;
    _os_log_impl(&dword_222A02000, v13, OS_LOG_TYPE_DEFAULT, "%{public}s size: %ld", buf, 0x16u);
  }

  __int16 v15 = +[WCXPCManager sharedManager];
  id v16 = [*(id *)(a1 + 32) pairingID];
  [v15 updateApplicationContext:v11 clientPairingID:v16 errorHandler:&__block_literal_global];

  [*(id *)(a1 + 32) storeAppContext:*(void *)(a1 + 40) withAppContextData:v11];
LABEL_18:

  if (v12)
  {
    uint64_t v19 = wc_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      __44__WCSession_updateApplicationContext_error___block_invoke_cold_1();
    }

    char v20 = 0;
  }
  else
  {
    char v20 = 1;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v20;
  if (*(void *)(a1 + 56)) {
    **(void **)(a1 + 56) = v12;
  }
}

void __44__WCSession_updateApplicationContext_error___block_invoke_80(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    id v3 = wc_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __44__WCSession_updateApplicationContext_error___block_invoke_80_cold_1();
    }
  }
}

- (WCSessionFileTransfer)transferFile:(NSURL *)file metadata:(NSDictionary *)metadata
{
  uint64_t v6 = file;
  id v7 = metadata;
  if (!v6)
  {
    id v8 = objc_msgSend(NSString, "stringWithFormat:", @"%s: %s cannot be nil.", "-[WCSession transferFile:metadata:]", "file");
    id v9 = wc_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      -[WCSession sendMessage:replyHandler:errorHandler:](v8);
    }

    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"%@", v8 format];
  }
  uint64_t v19 = 0;
  char v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = __Block_byref_object_copy_;
  uint64_t v23 = __Block_byref_object_dispose_;
  id v24 = 0;
  id v10 = _os_activity_create(&dword_222A02000, "transferFile:metadata:", MEMORY[0x263EF8428], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35__WCSession_transferFile_metadata___block_invoke;
  block[3] = &unk_26463C390;
  block[4] = self;
  id v16 = v6;
  uint64_t v17 = v7;
  uint64_t v18 = &v19;
  char v11 = v7;
  id v12 = v6;
  os_activity_apply(v10, block);
  id v13 = (id)v20[5];

  _Block_object_dispose(&v19, 8);

  return (WCSessionFileTransfer *)v13;
}

void __35__WCSession_transferFile_metadata___block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v2 = wc_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    id v29 = "-[WCSession transferFile:metadata:]_block_invoke";
    _os_log_impl(&dword_222A02000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s ", buf, 0xCu);
  }

  id v3 = [*(id *)(a1 + 32) errorIfPreconditionsNotSatisfied];
  uint64_t v4 = [[WCSessionFile alloc] initWithFileURL:*(void *)(a1 + 40)];
  char v5 = [[WCSessionFileTransfer alloc] initWithFile:v4];
  uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  if (v3
    || *(void *)(a1 + 48)
    && ([*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) file],
        id v10 = objc_claimAutoreleasedReturnValue(),
        uint64_t v11 = *(void *)(a1 + 48),
        id v27 = 0,
        [v10 updateUserInfo:v11 error:&v27],
        id v3 = v27,
        v10,
        v3))
  {
    id v8 = *(void **)(a1 + 32);
    uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  }
  else
  {
    if (WCIsFileDirectory(*(void **)(a1 + 40)))
    {
      id v12 = *(void **)(a1 + 32);
      id v13 = (void *)MEMORY[0x263F087E8];
      uint64_t v14 = 7008;
    }
    else
    {
      __int16 v15 = *(void **)(a1 + 40);
      pid_t v16 = getpid();
      uint64_t v17 = WCCheckFileAndCreateExtensionForProcess(v15, v16);
      if (v17)
      {
        uint64_t v18 = (void *)v17;
        [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setTransferring:1];
        uint64_t v19 = *(void *)(a1 + 32);
        char v20 = *(void **)(v19 + 88);
        v23[0] = MEMORY[0x263EF8330];
        v23[1] = 3221225472;
        v23[2] = __35__WCSession_transferFile_metadata___block_invoke_83;
        v23[3] = &unk_26463C390;
        v23[4] = v19;
        id v21 = *(id *)(a1 + 40);
        uint64_t v22 = *(void *)(a1 + 56);
        id v25 = v18;
        uint64_t v26 = v22;
        id v24 = v21;
        id v3 = v18;
        [v20 addOperationWithBlock:v23];

        goto LABEL_6;
      }
      id v12 = *(void **)(a1 + 32);
      id v13 = (void *)MEMORY[0x263F087E8];
      uint64_t v14 = 7013;
    }
    id v3 = [v13 wcErrorWithCode:v14];
    uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    id v8 = v12;
  }
  [v8 notifyOfFileError:v3 withFileTransfer:v9];
LABEL_6:
}

void __35__WCSession_transferFile_metadata___block_invoke_83(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) fileSizeFromURL:*(void *)(a1 + 40)];
  id v3 = wc_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    *(_DWORD *)buf = 136446722;
    id v21 = "-[WCSession transferFile:metadata:]_block_invoke";
    __int16 v22 = 2114;
    uint64_t v23 = v4;
    __int16 v24 = 2048;
    uint64_t v25 = [v2 integerValue];
    _os_log_impl(&dword_222A02000, v3, OS_LOG_TYPE_DEFAULT, "%{public}s fileTransfer: %{public}@ fileSize: %ld", buf, 0x20u);
  }

  char v5 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) file];
  [v5 setFileSize:v2];

  uint64_t v6 = objc_opt_new();
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setTransferDate:v6];

  id v7 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) file];
  id v8 = [v7 fileURL];

  uint64_t v9 = (void *)MEMORY[0x263F08840];
  id v10 = [v8 path];
  uint64_t v11 = [v9 fileHandleForReadingAtPath:v10];

  id v12 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) file];
  [v12 setFileDescriptor:v11];

  objc_msgSend(*(id *)(a1 + 32), "onqueue_addOutstandingFileTransfer:", *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40));
  objc_initWeak((id *)buf, *(id *)(a1 + 32));
  id v13 = +[WCXPCManager sharedManager];
  uint64_t v14 = *(void *)(a1 + 48);
  uint64_t v15 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  pid_t v16 = [*(id *)(a1 + 32) pairingID];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __35__WCSession_transferFile_metadata___block_invoke_86;
  v18[3] = &unk_26463C368;
  uint64_t v17 = *(void *)(a1 + 56);
  v18[4] = *(void *)(a1 + 32);
  v18[5] = v17;
  objc_copyWeak(&v19, (id *)buf);
  [v13 transferFile:v15 sandboxToken:v14 clientPairingID:v16 errorHandler:v18];

  objc_destroyWeak(&v19);
  objc_destroyWeak((id *)buf);
}

void __35__WCSession_transferFile_metadata___block_invoke_86(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  char v5 = *(void **)(v4 + 88);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __35__WCSession_transferFile_metadata___block_invoke_2;
  v8[3] = &unk_26463C340;
  uint64_t v6 = *(void *)(a1 + 40);
  v8[4] = v4;
  uint64_t v10 = v6;
  id v7 = v3;
  id v9 = v7;
  objc_copyWeak(&v11, (id *)(a1 + 48));
  [v5 addOperationWithBlock:v8];
  objc_destroyWeak(&v11);
}

void __35__WCSession_transferFile_metadata___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) internalOutstandingFileTransfers];
  id v3 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) transferIdentifier];
  id v7 = [v2 objectForKeyedSubscript:v3];

  if (v7)
  {
    uint64_t v4 = *(void *)(a1 + 40);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    uint64_t v6 = WeakRetained;
    if (v4) {
      objc_msgSend(WeakRetained, "onqueue_notifyOfFileError:withFileTransfer:", *(void *)(a1 + 40), v7);
    }
    else {
      objc_msgSend(WeakRetained, "onqueue_createProgressForFileTransfer:", v7);
    }
  }
}

- (void)cancelFileTransfer:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = wc_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    id v11 = "-[WCSession cancelFileTransfer:]";
    __int16 v12 = 2114;
    id v13 = v4;
    _os_log_impl(&dword_222A02000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s %{public}@", buf, 0x16u);
  }

  uint64_t v6 = [(WCSession *)self errorIfPreconditionsNotSatisfied];

  if (!v6)
  {
    workOperationQueue = self->_workOperationQueue;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __32__WCSession_cancelFileTransfer___block_invoke;
    v8[3] = &unk_26463C3B8;
    v8[4] = self;
    id v9 = v4;
    [(NSOperationQueue *)workOperationQueue addOperationWithBlock:v8];
  }
}

void __32__WCSession_cancelFileTransfer___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) internalOutstandingFileTransfers];
  id v3 = [v2 allValues];
  int v4 = [v3 containsObject:*(void *)(a1 + 40)];

  if (v4)
  {
    char v5 = *(void **)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    objc_msgSend(v5, "onqueue_cancelFileTransfer:", v6);
  }
}

- (void)onqueue_cancelFileTransfer:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [v4 setTransferring:0];
  [(WCSession *)self onqueue_removeOutstandingFileTransfer:v4];
  char v5 = wc_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [v4 transferIdentifier];
    int v9 = 136446466;
    uint64_t v10 = "-[WCSession onqueue_cancelFileTransfer:]";
    __int16 v11 = 2114;
    __int16 v12 = v6;
    _os_log_impl(&dword_222A02000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s transferIdentifier: %{public}@", (uint8_t *)&v9, 0x16u);
  }
  id v7 = +[WCXPCManager sharedManager];
  id v8 = [v4 transferIdentifier];
  [v7 cancelSendWithIdentifier:v8];
}

- (WCSessionUserInfoTransfer)transferUserInfo:(NSDictionary *)userInfo
{
  id v4 = userInfo;
  if (!v4)
  {
    char v5 = objc_msgSend(NSString, "stringWithFormat:", @"%s: %s cannot be nil.", "-[WCSession transferUserInfo:]", "userInfo");
    uint64_t v6 = wc_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[WCSession sendMessage:replyHandler:errorHandler:](v5);
    }

    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"%@", v5 format];
  }
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy_;
  uint64_t v18 = __Block_byref_object_dispose_;
  id v19 = 0;
  id v7 = _os_activity_create(&dword_222A02000, "transferUserInfo:", MEMORY[0x263EF8428], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __30__WCSession_transferUserInfo___block_invoke;
  block[3] = &unk_26463C408;
  __int16 v12 = v4;
  uint64_t v13 = &v14;
  block[4] = self;
  id v8 = v4;
  os_activity_apply(v7, block);
  id v9 = (id)v15[5];

  _Block_object_dispose(&v14, 8);

  return (WCSessionUserInfoTransfer *)v9;
}

void __30__WCSession_transferUserInfo___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v2 = wc_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    uint64_t v13 = "-[WCSession transferUserInfo:]_block_invoke";
    _os_log_impl(&dword_222A02000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s ", buf, 0xCu);
  }

  uint64_t v3 = objc_opt_new();
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  char v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(v6 + 88);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __30__WCSession_transferUserInfo___block_invoke_89;
  v10[3] = &unk_26463C3E0;
  v10[4] = v6;
  long long v9 = *(_OWORD *)(a1 + 40);
  id v8 = (id)v9;
  long long v11 = v9;
  [v7 addOperationWithBlock:v10];
}

uint64_t __30__WCSession_transferUserInfo___block_invoke_89(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "onqueue_transferUserInfo:withUserInfo:", *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), *(void *)(a1 + 40));
}

- (WCSessionUserInfoTransfer)transferCurrentComplicationUserInfo:(NSDictionary *)userInfo
{
  uint64_t v4 = userInfo;
  if (!v4)
  {
    char v5 = objc_msgSend(NSString, "stringWithFormat:", @"%s: %s cannot be nil.", "-[WCSession transferCurrentComplicationUserInfo:]", "userInfo");
    uint64_t v6 = wc_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[WCSession sendMessage:replyHandler:errorHandler:](v5);
    }

    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"%@", v5 format];
  }
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy_;
  uint64_t v18 = __Block_byref_object_dispose_;
  id v19 = 0;
  id v7 = _os_activity_create(&dword_222A02000, "sendMessage:replyHandler:errorHandler:", MEMORY[0x263EF8428], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__WCSession_transferCurrentComplicationUserInfo___block_invoke;
  block[3] = &unk_26463C408;
  __int16 v12 = v4;
  uint64_t v13 = &v14;
  block[4] = self;
  id v8 = v4;
  os_activity_apply(v7, block);
  id v9 = (id)v15[5];

  _Block_object_dispose(&v14, 8);

  return (WCSessionUserInfoTransfer *)v9;
}

void __49__WCSession_transferCurrentComplicationUserInfo___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v2 = wc_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    uint64_t v16 = "-[WCSession transferCurrentComplicationUserInfo:]_block_invoke";
    _os_log_impl(&dword_222A02000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s ", buf, 0xCu);
  }

  uint64_t v3 = [WCSessionUserInfoTransfer alloc];
  uint64_t v4 = objc_opt_new();
  char v5 = [v4 UUIDString];
  uint64_t v6 = [(WCSessionUserInfoTransfer *)v3 initWithComplicationTransferIdentifier:v5];
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(void **)(v9 + 88);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __49__WCSession_transferCurrentComplicationUserInfo___block_invoke_90;
  v13[3] = &unk_26463C3E0;
  void v13[4] = v9;
  long long v12 = *(_OWORD *)(a1 + 40);
  id v11 = (id)v12;
  long long v14 = v12;
  [v10 addOperationWithBlock:v13];
}

uint64_t __49__WCSession_transferCurrentComplicationUserInfo___block_invoke_90(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "onqueue_setCurrentComplicationUserInfoTransfer:", *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40));
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  uint64_t v4 = *(void **)(a1 + 32);

  return objc_msgSend(v4, "onqueue_transferUserInfo:withUserInfo:", v3, v2);
}

- (void)cancelUserInfo:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = wc_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    id v11 = "-[WCSession cancelUserInfo:]";
    __int16 v12 = 2114;
    id v13 = v4;
    _os_log_impl(&dword_222A02000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s %{public}@", buf, 0x16u);
  }

  uint64_t v6 = [(WCSession *)self errorIfPreconditionsNotSatisfied];

  if (!v6)
  {
    workOperationQueue = self->_workOperationQueue;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __28__WCSession_cancelUserInfo___block_invoke;
    v8[3] = &unk_26463C3B8;
    v8[4] = self;
    id v9 = v4;
    [(NSOperationQueue *)workOperationQueue addOperationWithBlock:v8];
  }
}

void __28__WCSession_cancelUserInfo___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) internalOutstandingUserInfoTransfers];
  uint64_t v3 = [v2 allValues];
  int v4 = [v3 containsObject:*(void *)(a1 + 40)];

  if (v4)
  {
    char v5 = *(void **)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    objc_msgSend(v5, "onqueue_cancelUserInfo:", v6);
  }
}

- (void)onqueue_cancelUserInfo:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(WCSession *)self onqueue_removeOutstandingUserInfoTransfer:v4];
  if ([v4 isCurrentComplicationInfo])
  {
    char v5 = wc_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = [v4 complicationTransferIdentifier];
      int v13 = 136446466;
      uint64_t v14 = "-[WCSession onqueue_cancelUserInfo:]";
      __int16 v15 = 2114;
      uint64_t v16 = v6;
      _os_log_impl(&dword_222A02000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s complicationTransferIdentifier: %{public}@", (uint8_t *)&v13, 0x16u);
    }
    uint64_t v7 = +[WCXPCManager sharedManager];
    id v8 = [v4 complicationTransferIdentifier];
    [v7 cancelSendWithIdentifier:v8];
  }
  id v9 = wc_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = [v4 transferIdentifier];
    int v13 = 136446466;
    uint64_t v14 = "-[WCSession onqueue_cancelUserInfo:]";
    __int16 v15 = 2114;
    uint64_t v16 = v10;
    _os_log_impl(&dword_222A02000, v9, OS_LOG_TYPE_DEFAULT, "%{public}s transferIdentifier: %{public}@", (uint8_t *)&v13, 0x16u);
  }
  id v11 = +[WCXPCManager sharedManager];
  __int16 v12 = [v4 transferIdentifier];
  [v11 cancelSendWithIdentifier:v12];
}

- (void)onqueue_transferUserInfo:(id)a3 withUserInfo:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = wc_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    __int16 v22 = "-[WCSession onqueue_transferUserInfo:withUserInfo:]";
    _os_log_impl(&dword_222A02000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s ", buf, 0xCu);
  }

  id v9 = [(WCSession *)self errorIfPreconditionsNotSatisfied];
  if (v9 || (id v20 = 0, v10 = [v6 updateUserInfo:v7 error:&v20], v9 = v20, !v10))
  {
    [(WCSession *)self onqueue_notifyOfUserInfoError:v9 withUserInfoTransfer:v6];
  }
  else
  {
    id v11 = [(WCSession *)self onqueue_addOutstandingUserInfoTransfer:v6];
    if (v11)
    {
      __int16 v12 = [(WCSession *)self fileSizeFromURL:v11];
      int v13 = wc_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = [v11 path];
        uint64_t v15 = [v12 integerValue];
        *(_DWORD *)buf = 136446978;
        __int16 v22 = "-[WCSession onqueue_transferUserInfo:withUserInfo:]";
        __int16 v23 = 2114;
        id v24 = v6;
        __int16 v25 = 2114;
        uint64_t v26 = v14;
        __int16 v27 = 2048;
        uint64_t v28 = v15;
        _os_log_impl(&dword_222A02000, v13, OS_LOG_TYPE_DEFAULT, "%{public}s transferUserInfo: %{public}@, withURL: %{public}@ fileSize: %ld", buf, 0x2Au);
      }
      uint64_t v16 = +[WCXPCManager sharedManager];
      uint64_t v17 = [(WCSession *)self pairingID];
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __51__WCSession_onqueue_transferUserInfo_withUserInfo___block_invoke;
      v18[3] = &unk_26463C140;
      v18[4] = self;
      id v19 = v6;
      [v16 transferUserInfo:v19 withURL:v11 clientPairingID:v17 errorHandler:v18];
    }
    else
    {
      __int16 v12 = [MEMORY[0x263F087E8] wcErrorWithCode:7001];
      [(WCSession *)self onqueue_notifyOfUserInfoError:v12 withUserInfoTransfer:v6];
    }
  }
}

void __51__WCSession_onqueue_transferUserInfo_withUserInfo___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    char v5 = *(void **)(v4 + 88);
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __51__WCSession_onqueue_transferUserInfo_withUserInfo___block_invoke_2;
    v6[3] = &unk_26463C258;
    void v6[4] = v4;
    id v7 = *(id *)(a1 + 40);
    id v8 = v3;
    [v5 addOperationWithBlock:v6];
  }
}

void __51__WCSession_onqueue_transferUserInfo_withUserInfo___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) internalOutstandingUserInfoTransfers];
  id v3 = [*(id *)(a1 + 40) transferIdentifier];
  id v5 = [v2 objectForKeyedSubscript:v3];

  uint64_t v4 = v5;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "onqueue_notifyOfUserInfoError:withUserInfoTransfer:", *(void *)(a1 + 48), v5);
    uint64_t v4 = v5;
  }
}

- (void)onqueue_sendResponseDictionary:(id)a3 identifier:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  id v8 = wc_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    int v13 = "-[WCSession onqueue_sendResponseDictionary:identifier:]";
    _os_log_impl(&dword_222A02000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s ", buf, 0xCu);
  }

  uint64_t v11 = 0;
  id v9 = WCSerializePayloadDictionary(v7, &v11);

  if (v9)
  {
    [(WCSession *)self onqueue_sendResponseData:v9 identifier:v6 dictionaryMessage:1];
  }
  else
  {
    int v10 = [MEMORY[0x263F087E8] wcErrorWithCode:7010];
    [(WCSession *)self _onqueue_sendResponseError:v10 identifier:v6 dictionaryMessage:1];
  }
}

- (void)onqueue_sendResponseData:(id)a3 identifier:(id)a4 dictionaryMessage:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  if (WCIsDataAcceptableSizeForType(0, v8))
  {
    int v10 = [WCMessageResponse alloc];
    uint64_t v11 = [(WCSession *)self pairingID];
    __int16 v12 = [(WCMessage *)v10 initWithPairingID:v11 identifier:v9 data:v8 dictionaryMessage:v5];

    int v13 = wc_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = [v8 length];
      uint64_t v15 = "NO";
      __int16 v22 = "-[WCSession onqueue_sendResponseData:identifier:dictionaryMessage:]";
      __int16 v23 = 2048;
      *(_DWORD *)buf = 136446978;
      uint64_t v24 = v14;
      if (v5) {
        uint64_t v15 = "YES";
      }
      __int16 v25 = 2114;
      id v26 = v9;
      __int16 v27 = 2080;
      uint64_t v28 = v15;
      _os_log_impl(&dword_222A02000, v13, OS_LOG_TYPE_DEFAULT, "%{public}s responseDataSize: %ld, identifier: %{public}@, isDictionaryMessage: %s", buf, 0x2Au);
    }

    uint64_t v16 = [(WCSession *)self queueManager];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __67__WCSession_onqueue_sendResponseData_identifier_dictionaryMessage___block_invoke;
    v19[3] = &unk_26463C430;
    id v20 = v12;
    uint64_t v17 = v12;
    [v16 sendMessage:v17 completionHandler:v19];
  }
  else
  {
    uint64_t v18 = [MEMORY[0x263F087E8] wcErrorWithCode:7009];
    [(WCSession *)self _onqueue_sendResponseError:v18 identifier:v9 dictionaryMessage:v5];
  }
}

void __67__WCSession_onqueue_sendResponseData_identifier_dictionaryMessage___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = wc_log();
  BOOL v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __67__WCSession_onqueue_sendResponseData_identifier_dictionaryMessage___block_invoke_cold_1();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 136446466;
    id v8 = "-[WCSession onqueue_sendResponseData:identifier:dictionaryMessage:]_block_invoke";
    __int16 v9 = 2114;
    uint64_t v10 = v6;
    _os_log_impl(&dword_222A02000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s succeeded for response %{public}@", (uint8_t *)&v7, 0x16u);
  }
}

- (void)_onqueue_sendResponseError:(id)a3 identifier:(id)a4 dictionaryMessage:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = wc_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    -[WCSession _onqueue_sendResponseError:identifier:dictionaryMessage:]();
  }

  uint64_t v11 = [WCMessageResponse alloc];
  __int16 v12 = [(WCSession *)self pairingID];
  int v13 = [(WCMessage *)v11 initWithPairingID:v12 identifier:v9 data:0 dictionaryMessage:v5];

  [(WCMessageResponse *)v13 setError:v8];
  uint64_t v14 = [(WCSession *)self queueManager];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __69__WCSession__onqueue_sendResponseError_identifier_dictionaryMessage___block_invoke;
  v16[3] = &unk_26463C430;
  id v17 = v9;
  id v15 = v9;
  [v14 sendMessage:v13 completionHandler:v16];
}

void __69__WCSession__onqueue_sendResponseError_identifier_dictionaryMessage___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = wc_log();
  BOOL v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __69__WCSession__onqueue_sendResponseError_identifier_dictionaryMessage___block_invoke_cold_1();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 136446466;
    id v8 = "-[WCSession _onqueue_sendResponseError:identifier:dictionaryMessage:]_block_invoke";
    __int16 v9 = 2114;
    uint64_t v10 = v6;
    _os_log_impl(&dword_222A02000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s %{public}@ suceeded", (uint8_t *)&v7, 0x16u);
  }
}

- (void)storeAppContext:(id)a3 withAppContextData:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = wc_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    uint64_t v16 = "-[WCSession storeAppContext:withAppContextData:]";
    _os_log_impl(&dword_222A02000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s ", buf, 0xCu);
  }

  workOperationQueue = self->_workOperationQueue;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __48__WCSession_storeAppContext_withAppContextData___block_invoke;
  v12[3] = &unk_26463C258;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  [(NSOperationQueue *)workOperationQueue addOperationWithBlock:v12];
}

void __48__WCSession_storeAppContext_withAppContextData___block_invoke(uint64_t a1)
{
  if (([*(id *)(*(void *)(a1 + 32) + 56) isEqual:*(void *)(a1 + 40)] & 1) == 0)
  {
    [*(id *)(a1 + 32) setApplicationContext:*(void *)(a1 + 40)];
    id v2 = +[WCFileStorage sharedInstance];
    [v2 persistAppContextData:*(void *)(a1 + 48) received:0];
  }
}

- (void)storeReceivedAppContext:(id)a3 withAppContextData:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = wc_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    uint64_t v16 = "-[WCSession storeReceivedAppContext:withAppContextData:]";
    _os_log_impl(&dword_222A02000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s ", buf, 0xCu);
  }

  workOperationQueue = self->_workOperationQueue;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __56__WCSession_storeReceivedAppContext_withAppContextData___block_invoke;
  v12[3] = &unk_26463C258;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  [(NSOperationQueue *)workOperationQueue addOperationWithBlock:v12];
}

void __56__WCSession_storeReceivedAppContext_withAppContextData___block_invoke(uint64_t a1)
{
  if (([*(id *)(*(void *)(a1 + 32) + 64) isEqual:*(void *)(a1 + 40)] & 1) == 0)
  {
    [*(id *)(a1 + 32) setReceivedApplicationContext:*(void *)(a1 + 40)];
    id v2 = +[WCFileStorage sharedInstance];
    [v2 persistAppContextData:*(void *)(a1 + 48) received:1];
  }
}

- (NSDictionary)applicationContext
{
  v15[1] = *MEMORY[0x263EF8340];
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  __int16 v12 = __Block_byref_object_copy_;
  id v13 = __Block_byref_object_dispose_;
  id v14 = (id)MEMORY[0x263EFFA78];
  id v3 = objc_opt_new();
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __31__WCSession_applicationContext__block_invoke;
  v8[3] = &unk_26463C190;
  v8[4] = self;
  void v8[5] = &v9;
  [v3 addExecutionBlock:v8];
  workOperationQueue = self->_workOperationQueue;
  v15[0] = v3;
  BOOL v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
  [(NSOperationQueue *)workOperationQueue addOperations:v5 waitUntilFinished:1];

  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return (NSDictionary *)v6;
}

void __31__WCSession_applicationContext__block_invoke(uint64_t a1)
{
}

- (NSDictionary)receivedApplicationContext
{
  v15[1] = *MEMORY[0x263EF8340];
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  __int16 v12 = __Block_byref_object_copy_;
  id v13 = __Block_byref_object_dispose_;
  id v14 = 0;
  id v3 = objc_opt_new();
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __39__WCSession_receivedApplicationContext__block_invoke;
  v8[3] = &unk_26463C190;
  v8[4] = self;
  void v8[5] = &v9;
  [v3 addExecutionBlock:v8];
  workOperationQueue = self->_workOperationQueue;
  v15[0] = v3;
  BOOL v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
  [(NSOperationQueue *)workOperationQueue addOperations:v5 waitUntilFinished:1];

  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return (NSDictionary *)v6;
}

void __39__WCSession_receivedApplicationContext__block_invoke(uint64_t a1)
{
}

- (void)onqueue_loadAppContexts
{
  id v3 = +[WCFileStorage sharedInstance];
  uint64_t v4 = [v3 loadAppContextReceived:0];
  [(WCSession *)self setApplicationContext:v4];

  id v6 = +[WCFileStorage sharedInstance];
  BOOL v5 = [v6 loadAppContextReceived:1];
  [(WCSession *)self setReceivedApplicationContext:v5];
}

- (void)xpcConnectionInterrupted
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = wc_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136446210;
    id v6 = "-[WCSession xpcConnectionInterrupted]";
    _os_log_impl(&dword_222A02000, v3, OS_LOG_TYPE_DEFAULT, "%{public}s ", (uint8_t *)&v5, 0xCu);
  }

  uint64_t v4 = [(WCSession *)self queueManager];
  [v4 allowMessageSending];

  [(WCSession *)self setConnectionWasInterrupted:1];
}

- (void)handleActiveDeviceSwitchStarted
{
  workOperationQueue = self->_workOperationQueue;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __44__WCSession_handleActiveDeviceSwitchStarted__block_invoke;
  v3[3] = &unk_26463C168;
  v3[4] = self;
  [(NSOperationQueue *)workOperationQueue addOperationWithBlock:v3];
}

void __44__WCSession_handleActiveDeviceSwitchStarted__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v2 = objc_opt_new();
  id v3 = wc_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136446466;
    id v6 = "-[WCSession handleActiveDeviceSwitchStarted]_block_invoke";
    __int16 v7 = 2114;
    id v8 = v2;
    _os_log_impl(&dword_222A02000, v3, OS_LOG_TYPE_DEFAULT, "%{public}s new switch task: %{public}@", (uint8_t *)&v5, 0x16u);
  }

  uint64_t v4 = [*(id *)(a1 + 32) switchTasksQueue];
  [v4 addObject:v2];

  objc_msgSend(*(id *)(a1 + 32), "onqueue_startNextDeviceSwitch");
}

- (void)xpcConnectionRestoredWithState:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = wc_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    id v15 = "-[WCSession xpcConnectionRestoredWithState:]";
    __int16 v16 = 2114;
    id v17 = v4;
    _os_log_impl(&dword_222A02000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s %{public}@", buf, 0x16u);
  }

  id v6 = objc_opt_new();
  objc_initWeak((id *)buf, v6);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __44__WCSession_xpcConnectionRestoredWithState___block_invoke;
  v10[3] = &unk_26463C1B8;
  objc_copyWeak(&v13, (id *)buf);
  id v7 = v4;
  id v11 = v7;
  __int16 v12 = self;
  [v6 addExecutionBlock:v10];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __44__WCSession_xpcConnectionRestoredWithState___block_invoke_92;
  v9[3] = &unk_26463C168;
  v9[4] = self;
  [v6 setCompletionBlock:v9];
  id v8 = [(WCSession *)self delegateOperationQueue];
  [v8 addOperation:v6];

  objc_destroyWeak(&v13);
  objc_destroyWeak((id *)buf);
}

void __44__WCSession_xpcConnectionRestoredWithState___block_invoke(id *a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  char v3 = [WeakRetained isCancelled];

  if ((v3 & 1) == 0)
  {
    id v4 = [a1[4] pairingID];
    id v6 = a1[5];
    int v5 = a1 + 5;
    id v7 = [v6 pairingID];
    char v8 = [v4 isEqual:v7];

    if ((v8 & 1) == 0)
    {
      uint64_t v9 = wc_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        __44__WCSession_xpcConnectionRestoredWithState___block_invoke_cold_1();
      }
    }
    id v10 = [*v5 pairingID];
    [*v5 setHasContentPending:v10 != 0];

    id v11 = wc_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = [*v5 hasContentPending];
      id v13 = "NO";
      if (v12) {
        id v13 = "YES";
      }
      int v14 = 136446466;
      id v15 = "-[WCSession xpcConnectionRestoredWithState:]_block_invoke";
      __int16 v16 = 2080;
      id v17 = v13;
      _os_log_impl(&dword_222A02000, v11, OS_LOG_TYPE_DEFAULT, "%{public}s hasContentPending: %s", (uint8_t *)&v14, 0x16u);
    }
  }
}

uint64_t __44__WCSession_xpcConnectionRestoredWithState___block_invoke_92(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(void **)(v1 + 88);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __44__WCSession_xpcConnectionRestoredWithState___block_invoke_2;
  v4[3] = &unk_26463C168;
  v4[4] = v1;
  return [v2 addOperationWithBlock:v4];
}

void __44__WCSession_xpcConnectionRestoredWithState___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) pairingID];

  if (v2)
  {
    char v3 = *(void **)(a1 + 32);
    objc_msgSend(v3, "onqueue_dequeueContent");
  }
}

- (void)handleMessageSendingAllowed
{
  id v2 = [(WCSession *)self queueManager];
  [v2 allowMessageSending];
}

- (void)handleRequest:(id)a3
{
  id v4 = a3;
  workOperationQueue = self->_workOperationQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __27__WCSession_handleRequest___block_invoke;
  v7[3] = &unk_26463C3B8;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  [(NSOperationQueue *)workOperationQueue addOperationWithBlock:v7];
}

void __27__WCSession_handleRequest___block_invoke(uint64_t a1)
{
  uint64_t v2 = a1 + 32;
  char v3 = [*(id *)(a1 + 32) pairingID];
  id v4 = [*(id *)(v2 + 8) pairingID];
  char v5 = [v3 isEqual:v4];

  if (v5)
  {
    int v6 = [*(id *)(a1 + 32) isDictionaryMessage];
    uint64_t v9 = a1 + 32;
    id v8 = *(void **)(a1 + 32);
    id v7 = *(void **)(v9 + 8);
    id v11 = [v8 pairingID];
    if (v6) {
      objc_msgSend(v7, "onqueue_handleDictionaryMessageRequest:withPairingID:", v8, v11);
    }
    else {
      objc_msgSend(v7, "onqueue_handleDataMessageRequest:withPairingID:", v8, v11);
    }
  }
  else
  {
    id v10 = wc_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      __27__WCSession_handleRequest___block_invoke_cold_1();
    }
  }
}

- (void)onqueue_handleDictionaryMessageRequest:(id)a3 withPairingID:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = wc_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    id v26 = "-[WCSession onqueue_handleDictionaryMessageRequest:withPairingID:]";
    __int16 v27 = 2114;
    id v28 = v6;
    _os_log_impl(&dword_222A02000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s %{public}@", buf, 0x16u);
  }

  if (!v7)
  {
    uint64_t v9 = objc_msgSend(NSString, "stringWithFormat:", @"%s: %s cannot be nil.", "-[WCSession onqueue_handleDictionaryMessageRequest:withPairingID:]", "pairingID");
    id v10 = wc_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      -[WCSession onqueue_handleDictionaryMessageRequest:withPairingID:](v9);
    }

    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"%@", v9 format];
  }
  id v11 = [v6 identifier];
  int v12 = [v6 data];
  id v24 = 0;
  id v13 = WCDeserializePayloadData(v12, &v24);
  id v14 = v24;

  if (v14)
  {
    id v15 = [v6 identifier];
    [(WCSession *)self _onqueue_sendResponseError:v14 identifier:v15 dictionaryMessage:1];
  }
  else
  {
    id v15 = objc_opt_new();
    objc_initWeak((id *)buf, v15);
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __66__WCSession_onqueue_handleDictionaryMessageRequest_withPairingID___block_invoke;
    v17[3] = &unk_26463C4A8;
    objc_copyWeak(&v23, (id *)buf);
    id v18 = v7;
    id v19 = self;
    id v20 = v6;
    id v21 = v11;
    id v22 = v13;
    [v15 addExecutionBlock:v17];
    __int16 v16 = [(WCSession *)self delegateOperationQueue];
    [v16 addOperation:v15];

    objc_destroyWeak(&v23);
    objc_destroyWeak((id *)buf);
  }
}

void __66__WCSession_onqueue_handleDictionaryMessageRequest_withPairingID___block_invoke(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 72);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  char v4 = [WeakRetained isCancelled];

  if ((v4 & 1) == 0)
  {
    char v5 = *(void **)(a1 + 32);
    id v6 = (id *)(a1 + 40);
    id v7 = [*(id *)(a1 + 40) pairingID];
    LOBYTE(v5) = [v5 isEqual:v7];

    if ((v5 & 1) == 0)
    {
      id v8 = wc_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        __66__WCSession_onqueue_handleDictionaryMessageRequest_withPairingID___block_invoke_cold_2(a1 + 32, a1 + 40);
      }
    }
    if ([*(id *)(a1 + 48) expectsResponse]
      && ([*v6 delegate],
          uint64_t v9 = objc_claimAutoreleasedReturnValue(),
          char v10 = objc_opt_respondsToSelector(),
          v9,
          (v10 & 1) != 0))
    {
      id v11 = [*(id *)(a1 + 40) currentMessageIdentifiersAwaitingReply];
      [v11 addObject:*(void *)(a1 + 56)];

      int v12 = [*(id *)(a1 + 40) delegate];
      uint64_t v13 = *(void *)(a1 + 40);
      uint64_t v14 = *(void *)(a1 + 64);
      v24[0] = MEMORY[0x263EF8330];
      v24[1] = 3221225472;
      v24[2] = __66__WCSession_onqueue_handleDictionaryMessageRequest_withPairingID___block_invoke_96;
      v24[3] = &unk_26463C480;
      objc_copyWeak(&v28, v2);
      id v15 = *(id *)(a1 + 32);
      uint64_t v16 = *(void *)(a1 + 40);
      id v25 = v15;
      uint64_t v26 = v16;
      id v27 = *(id *)(a1 + 56);
      [v12 session:v13 didReceiveMessage:v14 replyHandler:v24];

      objc_destroyWeak(&v28);
    }
    else if (([*(id *)(a1 + 48) expectsResponse] & 1) != 0 {
           || ([*v6 delegate],
    }
               id v17 = objc_claimAutoreleasedReturnValue(),
               char v18 = objc_opt_respondsToSelector(),
               v17,
               (v18 & 1) == 0))
    {
      id v20 = wc_log();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        __66__WCSession_onqueue_handleDictionaryMessageRequest_withPairingID___block_invoke_cold_1((id *)(a1 + 40));
      }

      id v21 = *(void **)(a1 + 40);
      id v22 = [MEMORY[0x263F087E8] wcErrorWithCode:7014];
      id v23 = [*(id *)(a1 + 48) identifier];
      objc_msgSend(v21, "_onqueue_sendResponseError:identifier:dictionaryMessage:", v22, v23, 1);
    }
    else
    {
      id v19 = [*(id *)(a1 + 40) delegate];
      [v19 session:*(void *)(a1 + 40) didReceiveMessage:*(void *)(a1 + 64)];
    }
  }
}

void __66__WCSession_onqueue_handleDictionaryMessageRequest_withPairingID___block_invoke_96(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!v3)
  {
    char v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s: %s cannot be nil.", "-[WCSession onqueue_handleDictionaryMessageRequest:withPairingID:]_block_invoke", "replyMessage");
    char v5 = wc_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[WCSession sendMessage:replyHandler:errorHandler:](v4);
    }

    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"%@", v4 format];
  }
  id v6 = (void *)MEMORY[0x263F086D0];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __66__WCSession_onqueue_handleDictionaryMessageRequest_withPairingID___block_invoke_98;
  v13[3] = &unk_26463C458;
  objc_copyWeak(&v18, (id *)(a1 + 56));
  id v7 = *(id *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  uint64_t v9 = *(void **)(a1 + 48);
  id v14 = v7;
  uint64_t v15 = v8;
  id v16 = v9;
  id v10 = v3;
  id v17 = v10;
  id v11 = [v6 blockOperationWithBlock:v13];
  int v12 = [*(id *)(a1 + 40) delegateOperationQueue];
  [v12 addOperation:v11];

  objc_destroyWeak(&v18);
}

void __66__WCSession_onqueue_handleDictionaryMessageRequest_withPairingID___block_invoke_98(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  char v3 = [WeakRetained isCancelled];

  if ((v3 & 1) == 0)
  {
    char v4 = *(void **)(a1 + 32);
    char v5 = [*(id *)(a1 + 40) pairingID];
    LOBYTE(v4) = [v4 isEqual:v5];

    if ((v4 & 1) == 0)
    {
      id v6 = wc_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        __66__WCSession_onqueue_handleDictionaryMessageRequest_withPairingID___block_invoke_98_cold_2(a1 + 32, a1 + 40);
      }
    }
    id v7 = [*(id *)(a1 + 40) currentMessageIdentifiersAwaitingReply];
    int v8 = [v7 containsObject:*(void *)(a1 + 48)];

    if (v8)
    {
      uint64_t v9 = [*(id *)(a1 + 40) currentMessageIdentifiersAwaitingReply];
      [v9 removeObject:*(void *)(a1 + 48)];

      uint64_t v10 = *(void *)(a1 + 40);
      id v11 = *(void **)(v10 + 88);
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __66__WCSession_onqueue_handleDictionaryMessageRequest_withPairingID___block_invoke_99;
      v13[3] = &unk_26463C258;
      void v13[4] = v10;
      id v14 = *(id *)(a1 + 56);
      id v15 = *(id *)(a1 + 48);
      [v11 addOperationWithBlock:v13];
    }
    else
    {
      int v12 = wc_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        __66__WCSession_onqueue_handleDictionaryMessageRequest_withPairingID___block_invoke_98_cold_1();
      }
    }
  }
}

uint64_t __66__WCSession_onqueue_handleDictionaryMessageRequest_withPairingID___block_invoke_99(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "onqueue_sendResponseDictionary:identifier:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (void)onqueue_handleDataMessageRequest:(id)a3 withPairingID:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  int v8 = wc_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    id v24 = "-[WCSession onqueue_handleDataMessageRequest:withPairingID:]";
    __int16 v25 = 2114;
    id v26 = v6;
    _os_log_impl(&dword_222A02000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s %{public}@", buf, 0x16u);
  }

  if (!v7)
  {
    uint64_t v9 = objc_msgSend(NSString, "stringWithFormat:", @"%s: %s cannot be nil.", "-[WCSession onqueue_handleDataMessageRequest:withPairingID:]", "pairingID");
    uint64_t v10 = wc_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      -[WCSession onqueue_handleDataMessageRequest:withPairingID:](v9);
    }

    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"%@", v9 format];
  }
  id v11 = [v6 identifier];
  int v12 = objc_opt_new();
  objc_initWeak((id *)buf, v12);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __60__WCSession_onqueue_handleDataMessageRequest_withPairingID___block_invoke;
  v17[3] = &unk_26463C458;
  objc_copyWeak(&v22, (id *)buf);
  id v13 = v7;
  id v18 = v13;
  id v19 = self;
  id v14 = v6;
  id v20 = v14;
  id v15 = v11;
  id v21 = v15;
  [v12 addExecutionBlock:v17];
  id v16 = [(WCSession *)self delegateOperationQueue];
  [v16 addOperation:v12];

  objc_destroyWeak(&v22);
  objc_destroyWeak((id *)buf);
}

void __60__WCSession_onqueue_handleDataMessageRequest_withPairingID___block_invoke(id *a1)
{
  uint64_t v2 = a1 + 8;
  id WeakRetained = objc_loadWeakRetained(a1 + 8);
  char v4 = [WeakRetained isCancelled];

  if ((v4 & 1) == 0)
  {
    id v5 = a1[4];
    id v6 = a1 + 5;
    id v7 = [a1[5] pairingID];
    LOBYTE(v5) = [v5 isEqual:v7];

    if ((v5 & 1) == 0)
    {
      int v8 = wc_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        __60__WCSession_onqueue_handleDataMessageRequest_withPairingID___block_invoke_cold_2((uint64_t)(a1 + 4), (uint64_t)(a1 + 5));
      }
    }
    if ([a1[6] expectsResponse]
      && ([*v6 delegate],
          uint64_t v9 = objc_claimAutoreleasedReturnValue(),
          char v10 = objc_opt_respondsToSelector(),
          v9,
          (v10 & 1) != 0))
    {
      id v11 = [a1[5] currentMessageIdentifiersAwaitingReply];
      [v11 addObject:a1[7]];

      int v12 = [a1[5] delegate];
      id v13 = a1[5];
      id v14 = [a1[6] data];
      v26[0] = MEMORY[0x263EF8330];
      v26[1] = 3221225472;
      v26[2] = __60__WCSession_onqueue_handleDataMessageRequest_withPairingID___block_invoke_105;
      v26[3] = &unk_26463C4D0;
      objc_copyWeak(&v31, v2);
      id v15 = a1[4];
      id v16 = a1[5];
      id v27 = v15;
      id v28 = v16;
      id v29 = a1[7];
      id v30 = a1[6];
      [v12 session:v13 didReceiveMessageData:v14 replyHandler:v26];

      objc_destroyWeak(&v31);
    }
    else if (([a1[6] expectsResponse] & 1) != 0 {
           || ([*v6 delegate],
    }
               id v17 = objc_claimAutoreleasedReturnValue(),
               char v18 = objc_opt_respondsToSelector(),
               v17,
               (v18 & 1) == 0))
    {
      id v22 = wc_log();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        __60__WCSession_onqueue_handleDataMessageRequest_withPairingID___block_invoke_cold_1(a1 + 5);
      }

      id v23 = a1[5];
      id v24 = [MEMORY[0x263F087E8] wcErrorWithCode:7014];
      __int16 v25 = [a1[6] identifier];
      objc_msgSend(v23, "_onqueue_sendResponseError:identifier:dictionaryMessage:", v24, v25, 0);
    }
    else
    {
      id v19 = [a1[5] delegate];
      id v20 = a1[5];
      id v21 = [a1[6] data];
      [v19 session:v20 didReceiveMessageData:v21];
    }
  }
}

void __60__WCSession_onqueue_handleDataMessageRequest_withPairingID___block_invoke_105(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!v3)
  {
    char v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s: %s cannot be nil.", "-[WCSession onqueue_handleDataMessageRequest:withPairingID:]_block_invoke", "replyMessageData");
    id v5 = wc_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[WCSession sendMessage:replyHandler:errorHandler:](v4);
    }

    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"%@", v4 format];
  }
  id v6 = (void *)MEMORY[0x263F086D0];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __60__WCSession_onqueue_handleDataMessageRequest_withPairingID___block_invoke_107;
  v13[3] = &unk_26463C4A8;
  objc_copyWeak(&v19, (id *)(a1 + 64));
  id v7 = *(id *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  uint64_t v9 = *(void **)(a1 + 48);
  id v14 = v7;
  uint64_t v15 = v8;
  id v16 = v9;
  id v10 = v3;
  id v17 = v10;
  id v18 = *(id *)(a1 + 56);
  id v11 = [v6 blockOperationWithBlock:v13];
  int v12 = [*(id *)(a1 + 40) delegateOperationQueue];
  [v12 addOperation:v11];

  objc_destroyWeak(&v19);
}

void __60__WCSession_onqueue_handleDataMessageRequest_withPairingID___block_invoke_107(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  char v3 = [WeakRetained isCancelled];

  if ((v3 & 1) == 0)
  {
    char v4 = *(void **)(a1 + 32);
    id v5 = [*(id *)(a1 + 40) pairingID];
    LOBYTE(v4) = [v4 isEqual:v5];

    if ((v4 & 1) == 0)
    {
      id v6 = wc_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        __60__WCSession_onqueue_handleDataMessageRequest_withPairingID___block_invoke_107_cold_2(a1 + 32, a1 + 40);
      }
    }
    id v7 = [*(id *)(a1 + 40) currentMessageIdentifiersAwaitingReply];
    int v8 = [v7 containsObject:*(void *)(a1 + 48)];

    if (v8)
    {
      uint64_t v9 = [*(id *)(a1 + 40) currentMessageIdentifiersAwaitingReply];
      [v9 removeObject:*(void *)(a1 + 48)];

      uint64_t v10 = *(void *)(a1 + 40);
      id v11 = *(void **)(v10 + 88);
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __60__WCSession_onqueue_handleDataMessageRequest_withPairingID___block_invoke_108;
      v13[3] = &unk_26463C258;
      void v13[4] = v10;
      id v14 = *(id *)(a1 + 56);
      id v15 = *(id *)(a1 + 64);
      [v11 addOperationWithBlock:v13];
    }
    else
    {
      int v12 = wc_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        __60__WCSession_onqueue_handleDataMessageRequest_withPairingID___block_invoke_107_cold_1();
      }
    }
  }
}

void __60__WCSession_onqueue_handleDataMessageRequest_withPairingID___block_invoke_108(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = [*(id *)(a1 + 48) identifier];
  objc_msgSend(v1, "onqueue_sendResponseData:identifier:dictionaryMessage:", v2, v3, 0);
}

- (void)handleResponse:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = wc_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    int v12 = "-[WCSession handleResponse:]";
    __int16 v13 = 2114;
    id v14 = v4;
    _os_log_impl(&dword_222A02000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s %{public}@", buf, 0x16u);
  }

  workOperationQueue = self->_workOperationQueue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __28__WCSession_handleResponse___block_invoke;
  v8[3] = &unk_26463C3B8;
  id v9 = v4;
  uint64_t v10 = self;
  id v7 = v4;
  [(NSOperationQueue *)workOperationQueue addOperationWithBlock:v8];
}

void __28__WCSession_handleResponse___block_invoke(uint64_t a1)
{
  uint64_t v2 = a1 + 32;
  id v3 = [*(id *)(a1 + 32) pairingID];
  id v4 = [*(id *)(v2 + 8) pairingID];
  char v5 = [v3 isEqual:v4];

  if (v5)
  {
    int v6 = [*(id *)(a1 + 32) isDictionaryMessage];
    int v8 = *(void **)(a1 + 32);
    id v7 = *(void **)(a1 + 40);
    id v9 = (void *)v7[12];
    uint64_t v10 = [v8 identifier];
    id v11 = [v9 objectForKeyedSubscript:v10];
    int v12 = [*(id *)(a1 + 32) pairingID];
    if (v6) {
      objc_msgSend(v7, "onqueue_handleResponseDictionary:record:withPairingID:", v8, v11, v12);
    }
    else {
      objc_msgSend(v7, "onqueue_handleResponseData:record:withPairingID:", v8, v11, v12);
    }

    id v14 = *(void **)(a1 + 32);
    uint64_t v15 = *(void **)(*(void *)(a1 + 40) + 96);
    id v16 = [v14 identifier];
    [v15 removeObjectForKey:v16];
  }
  else
  {
    __int16 v13 = wc_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      __28__WCSession_handleResponse___block_invoke_cold_1();
    }
  }
}

- (void)onqueue_handleResponseDictionary:(id)a3 record:(id)a4 withPairingID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v9 responseHandler];
  if (v11)
  {
    int v12 = (void *)v11;
    __int16 v13 = [v8 data];

    if (v13)
    {
      id v14 = [v9 timeoutTimer];
      dispatch_source_cancel(v14);

      uint64_t v15 = [v8 data];
      id v33 = 0;
      id v16 = WCDeserializePayloadData(v15, &v33);
      id v17 = v33;

      if (v16)
      {
        id v18 = objc_opt_new();
        objc_initWeak(&location, v18);
        v26[0] = MEMORY[0x263EF8330];
        v26[1] = 3221225472;
        v26[2] = __67__WCSession_onqueue_handleResponseDictionary_record_withPairingID___block_invoke;
        v26[3] = &unk_26463C458;
        objc_copyWeak(&v31, &location);
        id v27 = v10;
        id v28 = self;
        id v29 = v9;
        id v30 = v16;
        [v18 addExecutionBlock:v26];
        id v19 = [(WCSession *)self delegateOperationQueue];
        [v19 addOperation:v18];

        objc_destroyWeak(&v31);
        objc_destroyWeak(&location);
      }
      else
      {
        id v18 = [MEMORY[0x263F087E8] wcErrorWithCode:7010];
        id v20 = [v9 identifier];
        id v21 = [v9 errorHandler];
        [(WCSession *)self _onqueue_notifyOfMessageError:v18 messageID:v20 withErrorHandler:v21];
      }
    }
  }
  id v22 = [v8 error];

  if (v22)
  {
    id v23 = [v8 error];
    id v24 = [v8 identifier];
    __int16 v25 = [v9 errorHandler];
    [(WCSession *)self _onqueue_notifyOfMessageError:v23 messageID:v24 withErrorHandler:v25];
  }
}

void __67__WCSession_onqueue_handleResponseDictionary_record_withPairingID___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  char v3 = [WeakRetained isCancelled];

  if ((v3 & 1) == 0)
  {
    id v4 = *(void **)(a1 + 32);
    char v5 = [*(id *)(a1 + 40) pairingID];
    LOBYTE(v4) = [v4 isEqual:v5];

    if ((v4 & 1) == 0)
    {
      int v6 = wc_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        __67__WCSession_onqueue_handleResponseDictionary_record_withPairingID___block_invoke_cold_1(a1 + 32, a1 + 40);
      }
    }
    id v7 = [*(id *)(a1 + 48) responseHandler];
    v7[2](v7, *(void *)(a1 + 56));
  }
}

- (void)onqueue_handleResponseData:(id)a3 record:(id)a4 withPairingID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v9 responseHandler];
  if (v11)
  {
    int v12 = (void *)v11;
    __int16 v13 = [v8 data];

    if (v13)
    {
      id v14 = [v9 timeoutTimer];
      dispatch_source_cancel(v14);

      uint64_t v15 = objc_opt_new();
      objc_initWeak(&location, v15);
      uint64_t v21 = MEMORY[0x263EF8330];
      uint64_t v22 = 3221225472;
      id v23 = __61__WCSession_onqueue_handleResponseData_record_withPairingID___block_invoke;
      id v24 = &unk_26463C458;
      objc_copyWeak(&v29, &location);
      id v25 = v10;
      id v26 = self;
      id v27 = v9;
      id v28 = v8;
      [v15 addExecutionBlock:&v21];
      id v16 = [(WCSession *)self delegateOperationQueue];
      [v16 addOperation:v15];

      objc_destroyWeak(&v29);
      objc_destroyWeak(&location);
    }
  }
  id v17 = [v8 error];

  if (v17)
  {
    id v18 = [v8 error];
    id v19 = [v8 identifier];
    id v20 = [v9 errorHandler];
    [(WCSession *)self _onqueue_notifyOfMessageError:v18 messageID:v19 withErrorHandler:v20];
  }
}

void __61__WCSession_onqueue_handleResponseData_record_withPairingID___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  char v3 = [WeakRetained isCancelled];

  if ((v3 & 1) == 0)
  {
    id v4 = *(void **)(a1 + 32);
    char v5 = [*(id *)(a1 + 40) pairingID];
    LOBYTE(v4) = [v4 isEqual:v5];

    if ((v4 & 1) == 0)
    {
      int v6 = wc_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        __61__WCSession_onqueue_handleResponseData_record_withPairingID___block_invoke_cold_1(a1 + 32, a1 + 40);
      }
    }
    id v7 = [*(id *)(a1 + 48) responseHandler];
    id v8 = [*(id *)(a1 + 56) data];
    ((void (**)(void, void *))v7)[2](v7, v8);
  }
}

- (void)handleSentMessageWithIdentifier:(id)a3 error:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(WCSession *)self queueManager];
  [v8 handleSentMessageWithIdentifier:v7 error:v6];
}

- (void)handleApplicationContextWithPairingID:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = wc_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    id v14 = "-[WCSession handleApplicationContextWithPairingID:]";
    __int16 v15 = 2114;
    id v16 = v4;
    _os_log_impl(&dword_222A02000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s %{public}@", buf, 0x16u);
  }

  if (!v4)
  {
    id v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s: %s cannot be nil.", "-[WCSession handleApplicationContextWithPairingID:]", "pairingID");
    id v7 = wc_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      -[WCSession sendMessage:replyHandler:errorHandler:](v6);
    }

    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"%@", v6 format];
  }
  workOperationQueue = self->_workOperationQueue;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __51__WCSession_handleApplicationContextWithPairingID___block_invoke;
  v10[3] = &unk_26463C3B8;
  id v11 = v4;
  int v12 = self;
  id v9 = v4;
  [(NSOperationQueue *)workOperationQueue addOperationWithBlock:v10];
}

void __51__WCSession_handleApplicationContextWithPairingID___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v14 = [*(id *)(a1 + 40) pairingID];
  if (objc_msgSend(v2, "isEqual:"))
  {
    char v3 = *(void **)(a1 + 32);
    id v4 = +[WCFileStorage sharedInstance];
    char v5 = [v4 pairingID];
    LODWORD(v3) = [v3 isEqual:v5];

    if (v3)
    {
      id v6 = +[WCFileStorage sharedInstance];
      id v7 = [v6 loadAppContextDataFromInbox];

      if (v7)
      {
        id v22 = 0;
        id v8 = WCDeserializePayloadData(v7, &v22);
        id v9 = v22;
        if (v8)
        {
          id v10 = objc_opt_new();
          objc_initWeak(&location, v10);
          v15[0] = MEMORY[0x263EF8330];
          v15[1] = 3221225472;
          void v15[2] = __51__WCSession_handleApplicationContextWithPairingID___block_invoke_2;
          v15[3] = &unk_26463C458;
          objc_copyWeak(&v20, &location);
          id v11 = *(id *)(a1 + 32);
          uint64_t v12 = *(void *)(a1 + 40);
          id v16 = v11;
          uint64_t v17 = v12;
          id v18 = v8;
          id v19 = v7;
          [v10 addExecutionBlock:v15];
          __int16 v13 = [*(id *)(a1 + 40) delegateOperationQueue];
          [v13 addOperation:v10];

          objc_destroyWeak(&v20);
          objc_destroyWeak(&location);
        }
        else
        {
          id v10 = wc_log();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
            __51__WCSession_handleApplicationContextWithPairingID___block_invoke_cold_2();
          }
        }
      }
      else
      {
        id v9 = wc_log();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          __51__WCSession_handleApplicationContextWithPairingID___block_invoke_cold_1();
        }
      }
    }
  }
  else
  {
  }
}

void __51__WCSession_handleApplicationContextWithPairingID___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  char v3 = [WeakRetained isCancelled];

  if ((v3 & 1) == 0)
  {
    id v4 = *(void **)(a1 + 32);
    char v5 = [*(id *)(a1 + 40) pairingID];
    LOBYTE(v4) = [v4 isEqual:v5];

    if ((v4 & 1) == 0)
    {
      id v6 = wc_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        __51__WCSession_handleApplicationContextWithPairingID___block_invoke_2_cold_2(a1 + 32, a1 + 40);
      }
    }
    id v7 = *(void **)(a1 + 40);
    id v8 = (void *)[*(id *)(a1 + 48) copy];
    [v7 storeReceivedAppContext:v8 withAppContextData:*(void *)(a1 + 56)];

    id v9 = [*(id *)(a1 + 40) delegate];
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      id v11 = [*(id *)(a1 + 40) delegate];
      [v11 session:*(void *)(a1 + 40) didReceiveApplicationContext:*(void *)(a1 + 48)];

      uint64_t v12 = +[WCFileStorage sharedInstance];
      [v12 deleteAppContextDataFromInbox];
    }
    else
    {
      uint64_t v12 = wc_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        __51__WCSession_handleApplicationContextWithPairingID___block_invoke_2_cold_1();
      }
    }
  }
}

- (void)handleIncomingFileWithPairingID:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = wc_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    id v14 = "-[WCSession handleIncomingFileWithPairingID:]";
    __int16 v15 = 2114;
    id v16 = v4;
    _os_log_impl(&dword_222A02000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s %{public}@", buf, 0x16u);
  }

  if (!v4)
  {
    id v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s: %s cannot be nil.", "-[WCSession handleIncomingFileWithPairingID:]", "pairingID");
    id v7 = wc_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      -[WCSession sendMessage:replyHandler:errorHandler:](v6);
    }

    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"%@", v6 format];
  }
  workOperationQueue = self->_workOperationQueue;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __45__WCSession_handleIncomingFileWithPairingID___block_invoke;
  v10[3] = &unk_26463C3B8;
  id v11 = v4;
  uint64_t v12 = self;
  id v9 = v4;
  [(NSOperationQueue *)workOperationQueue addOperationWithBlock:v10];
}

void __45__WCSession_handleIncomingFileWithPairingID___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v10 = [*(id *)(a1 + 40) pairingID];
  if (objc_msgSend(v2, "isEqual:"))
  {
    char v3 = *(void **)(a1 + 32);
    id v4 = +[WCFileStorage sharedInstance];
    char v5 = [v4 pairingID];
    LODWORD(v3) = [v3 isEqual:v5];

    if (v3)
    {
      id v6 = objc_opt_new();
      objc_initWeak(&location, v6);
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __45__WCSession_handleIncomingFileWithPairingID___block_invoke_2;
      v11[3] = &unk_26463C1B8;
      objc_copyWeak(&v14, &location);
      id v7 = *(id *)(a1 + 32);
      uint64_t v8 = *(void *)(a1 + 40);
      id v12 = v7;
      uint64_t v13 = v8;
      [v6 addExecutionBlock:v11];
      id v9 = [*(id *)(a1 + 40) delegateOperationQueue];
      [v9 addOperation:v6];

      objc_destroyWeak(&v14);
      objc_destroyWeak(&location);
    }
  }
  else
  {
  }
}

void __45__WCSession_handleIncomingFileWithPairingID___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  char v4 = [WeakRetained isCancelled];

  if ((v4 & 1) == 0)
  {
    id v6 = *(void **)(a1 + 32);
    char v5 = (id *)(a1 + 32);
    id v7 = [v5[1] pairingID];
    char v8 = [v6 isEqual:v7];

    if ((v8 & 1) == 0)
    {
      id v9 = wc_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        __45__WCSession_handleIncomingFileWithPairingID___block_invoke_2_cold_1((uint64_t)v5, (uint64_t)(v5 + 1));
      }
    }
    id v10 = +[WCFileStorage sharedInstance];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __45__WCSession_handleIncomingFileWithPairingID___block_invoke_115;
    v13[3] = &unk_26463C4F8;
    objc_copyWeak(&v16, v2);
    id v11 = *v5;
    id v12 = v5[1];
    id v14 = v11;
    id v15 = v12;
    [v10 enumerateIncomingFilesWithBlock:v13];

    objc_destroyWeak(&v16);
  }
}

void __45__WCSession_handleIncomingFileWithPairingID___block_invoke_115(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  char v8 = [WeakRetained isCancelled];

  if ((v8 & 1) == 0)
  {
    id v10 = *(void **)(a1 + 32);
    uint64_t v9 = a1 + 32;
    id v11 = (id *)(v9 + 8);
    id v12 = [*(id *)(v9 + 8) pairingID];
    char v13 = [v10 isEqual:v12];

    if ((v13 & 1) == 0)
    {
      id v14 = wc_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        __45__WCSession_handleIncomingFileWithPairingID___block_invoke_115_cold_3(v9, v9 + 8);
      }
    }
    if (v5)
    {
      id v15 = wc_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        int v21 = 136446466;
        id v22 = "-[WCSession handleIncomingFileWithPairingID:]_block_invoke";
        __int16 v23 = 2114;
        id v24 = v5;
        _os_log_impl(&dword_222A02000, v15, OS_LOG_TYPE_DEFAULT, "%{public}s %{public}@", (uint8_t *)&v21, 0x16u);
      }

      if ([*v11 verifySessionFile:v5])
      {
        id v16 = [*v11 delegate];
        char v17 = objc_opt_respondsToSelector();

        if (v17)
        {
          id v18 = [*v11 delegate];
          [v18 session:*v11 didReceiveFile:v5];
        }
        else
        {
          id v18 = wc_log();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
            __45__WCSession_handleIncomingFileWithPairingID___block_invoke_115_cold_1();
          }
        }
      }
      else
      {
        id v18 = wc_log();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          __45__WCSession_handleIncomingFileWithPairingID___block_invoke_115_cold_2(v5);
        }
      }

      id v19 = +[WCFileStorage sharedInstance];
      [v19 cleanupSessionFileFromInbox:v5];
    }
    else
    {
      if (!v6)
      {
LABEL_21:
        id v20 = +[WCXPCManager sharedManager];
        [v20 acknowledgeFileIndexWithIdentifier:v6 clientPairingID:*(void *)v9];

        goto LABEL_22;
      }
      id v19 = wc_log();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        int v21 = 136446466;
        id v22 = "-[WCSession handleIncomingFileWithPairingID:]_block_invoke";
        __int16 v23 = 2114;
        id v24 = v6;
        _os_log_impl(&dword_222A02000, v19, OS_LOG_TYPE_DEFAULT, "%{public}s Error: failed to load session file with identifier %{public}@", (uint8_t *)&v21, 0x16u);
      }
    }

    goto LABEL_21;
  }
LABEL_22:
}

- (void)handleFileResultWithPairingID:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = wc_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    id v14 = "-[WCSession handleFileResultWithPairingID:]";
    __int16 v15 = 2114;
    id v16 = v4;
    _os_log_impl(&dword_222A02000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s %{public}@", buf, 0x16u);
  }

  if (!v4)
  {
    id v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s: %s cannot be nil.", "-[WCSession handleFileResultWithPairingID:]", "pairingID");
    id v7 = wc_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      -[WCSession sendMessage:replyHandler:errorHandler:](v6);
    }

    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"%@", v6 format];
  }
  workOperationQueue = self->_workOperationQueue;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __43__WCSession_handleFileResultWithPairingID___block_invoke;
  v10[3] = &unk_26463C3B8;
  id v11 = v4;
  id v12 = self;
  id v9 = v4;
  [(NSOperationQueue *)workOperationQueue addOperationWithBlock:v10];
}

void __43__WCSession_handleFileResultWithPairingID___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v10 = [*(id *)(a1 + 40) pairingID];
  if (objc_msgSend(v2, "isEqual:"))
  {
    char v3 = *(void **)(a1 + 32);
    id v4 = +[WCFileStorage sharedInstance];
    id v5 = [v4 pairingID];
    LODWORD(v3) = [v3 isEqual:v5];

    if (v3)
    {
      id v6 = objc_opt_new();
      objc_initWeak(&location, v6);
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __43__WCSession_handleFileResultWithPairingID___block_invoke_2;
      v11[3] = &unk_26463C1B8;
      objc_copyWeak(&v14, &location);
      id v7 = *(id *)(a1 + 32);
      uint64_t v8 = *(void *)(a1 + 40);
      id v12 = v7;
      uint64_t v13 = v8;
      [v6 addExecutionBlock:v11];
      id v9 = [*(id *)(a1 + 40) delegateOperationQueue];
      [v9 addOperation:v6];

      objc_destroyWeak(&v14);
      objc_destroyWeak(&location);
    }
  }
  else
  {
  }
}

void __43__WCSession_handleFileResultWithPairingID___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  char v4 = [WeakRetained isCancelled];

  if ((v4 & 1) == 0)
  {
    id v6 = *(void **)(a1 + 32);
    id v5 = (id *)(a1 + 32);
    id v7 = [v5[1] pairingID];
    char v8 = [v6 isEqual:v7];

    if ((v8 & 1) == 0)
    {
      id v9 = wc_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        __43__WCSession_handleFileResultWithPairingID___block_invoke_2_cold_1((uint64_t)v5, (uint64_t)(v5 + 1));
      }
    }
    id v10 = +[WCFileStorage sharedInstance];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __43__WCSession_handleFileResultWithPairingID___block_invoke_119;
    v13[3] = &unk_26463C520;
    objc_copyWeak(&v16, v2);
    id v11 = *v5;
    id v12 = v5[1];
    id v14 = v11;
    id v15 = v12;
    [v10 enumerateFileTransferResultsWithBlock:v13];

    objc_destroyWeak(&v16);
  }
}

void __43__WCSession_handleFileResultWithPairingID___block_invoke_119(uint64_t a1, void *a2, void *a3)
{
  uint64_t v77 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  char v9 = [WeakRetained isCancelled];

  if ((v9 & 1) == 0)
  {
    id v11 = *(void **)(a1 + 32);
    uint64_t v10 = a1 + 32;
    id v12 = (id *)(v10 + 8);
    uint64_t v13 = [*(id *)(v10 + 8) pairingID];
    char v14 = [v11 isEqual:v13];

    if ((v14 & 1) == 0)
    {
      id v15 = wc_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        __43__WCSession_handleFileResultWithPairingID___block_invoke_119_cold_3(v10, v10 + 8);
      }
    }
    id v16 = wc_log();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v17)
      {
        v52 = [v5 transferError];
        NSPrintF();
        id v18 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136446722;
        *(void *)&uint8_t buf[4] = "-[WCSession handleFileResultWithPairingID:]_block_invoke";
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v5;
        *(_WORD *)&buf[22] = 2114;
        v74 = v18;
        _os_log_impl(&dword_222A02000, v16, OS_LOG_TYPE_DEFAULT, "%{public}s %{public}@ with %{public}@", buf, 0x20u);
      }
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      v74 = __Block_byref_object_copy_;
      v75 = __Block_byref_object_dispose_;
      id v76 = 0;
      id v19 = objc_opt_new();
      v58[0] = MEMORY[0x263EF8330];
      v58[1] = 3221225472;
      v58[2] = __43__WCSession_handleFileResultWithPairingID___block_invoke_120;
      v58[3] = &unk_26463C408;
      id v20 = *v12;
      v60 = buf;
      v58[4] = v20;
      id v59 = v6;
      [v19 addExecutionBlock:v58];
      int v21 = (void *)*((void *)*v12 + 11);
      v72 = v19;
      id v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v72 count:1];
      [v21 addOperations:v22 waitUntilFinished:1];

      if (*(void *)(*(void *)&buf[8] + 40))
      {
        __int16 v23 = [v5 transferError];

        if (v23)
        {
          id v24 = [v5 transferError];
          [*(id *)(*(void *)&buf[8] + 40) setTransferError:v24];
        }
        uint64_t v25 = v5;
        id v5 = *(id *)(*(void *)&buf[8] + 40);
      }
      else
      {
        uint64_t v25 = wc_log();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
          __43__WCSession_handleFileResultWithPairingID___block_invoke_119_cold_2();
        }
      }

      id v26 = [v5 progress];
      id v27 = v26;
      if (v26 && ([v26 isFinished] & 1) == 0 && (objc_msgSend(v27, "isCancelled") & 1) == 0)
      {
        id v28 = wc_log();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          id v29 = [v5 transferIdentifier];
          *(_DWORD *)v68 = 136446466;
          v69 = "-[WCSession handleFileResultWithPairingID:]_block_invoke";
          __int16 v70 = 2114;
          v71 = v29;
          _os_log_impl(&dword_222A02000, v28, OS_LOG_TYPE_DEFAULT, "%{public}s Updating progress to finished for %{public}@", v68, 0x16u);
        }
        objc_msgSend(v27, "setCompletedUnitCount:", objc_msgSend(v27, "totalUnitCount"));
      }
      id v30 = objc_loadWeakRetained(v7);
      char v31 = [v30 isCancelled];

      if (v31)
      {

        _Block_object_dispose(buf, 8);
        goto LABEL_36;
      }
      uint64_t v32 = *(void **)v10;
      id v33 = [*v12 pairingID];
      LOBYTE(v32) = [v32 isEqual:v33];

      if ((v32 & 1) == 0)
      {
        uint64_t v34 = wc_log();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          uint64_t v35 = *(void *)v10;
          __int16 v36 = [*v12 pairingID];
          __43__WCSession_handleFileResultWithPairingID___block_invoke_119_cold_1(v35, v36, v68);
        }
      }
      uint64_t v37 = objc_msgSend(*v12, "delegate", v52);
      char v38 = objc_opt_respondsToSelector();

      if (v38)
      {
        [v5 setTransferring:0];
        v39 = [*v12 delegate];
        id v40 = *v12;
        v41 = [v5 transferError];
        [v39 session:v40 didFinishFileTransfer:v5 error:v41];
      }
      else
      {
        v39 = wc_log();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          v42 = [*v12 delegate];
          id v43 = [(id)objc_opt_class() description];
          v44 = NSStringFromSelector(sel_session_didFinishFileTransfer_error_);
          *(_DWORD *)v62 = 136446722;
          v63 = "-[WCSession handleFileResultWithPairingID:]_block_invoke";
          __int16 v64 = 2114;
          id v65 = v43;
          __int16 v66 = 2114;
          v67 = v44;
          _os_log_impl(&dword_222A02000, v39, OS_LOG_TYPE_DEFAULT, "%{public}s delegate %{public}@ does not implement %{public}@", v62, 0x20u);
        }
      }

      v45 = objc_opt_new();
      v55[0] = MEMORY[0x263EF8330];
      v55[1] = 3221225472;
      v55[2] = __43__WCSession_handleFileResultWithPairingID___block_invoke_123;
      v55[3] = &unk_26463C3B8;
      v46 = v5;
      id v47 = *v12;
      v56 = v46;
      id v57 = v47;
      [v45 addExecutionBlock:v55];
      v48 = (void *)*((void *)*v12 + 11);
      v61 = v45;
      v49 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v61 count:1];
      [v48 addOperations:v49 waitUntilFinished:1];

      v50 = objc_opt_new();
      v53[0] = MEMORY[0x263EF8330];
      v53[1] = 3221225472;
      v53[2] = __43__WCSession_handleFileResultWithPairingID___block_invoke_2_124;
      v53[3] = &unk_26463C3B8;
      v53[4] = *v12;
      id v5 = v46;
      v54 = v5;
      [v50 addExecutionBlock:v53];
      [*((id *)*v12 + 11) addOperation:v50];

      _Block_object_dispose(buf, 8);
    }
    else
    {
      if (v17)
      {
        *(_DWORD *)buf = 136446466;
        *(void *)&uint8_t buf[4] = "-[WCSession handleFileResultWithPairingID:]_block_invoke_3";
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v6;
        _os_log_impl(&dword_222A02000, v16, OS_LOG_TYPE_DEFAULT, "%{public}s ERROR: failed to load session file transfer with identifier %{public}@", buf, 0x16u);
      }

      id v5 = 0;
    }
    v51 = +[WCXPCManager sharedManager];
    [v51 acknowledgeFileResultIndexWithIdentifier:v6 clientPairingID:*(void *)v10];
  }
LABEL_36:
}

void __43__WCSession_handleFileResultWithPairingID___block_invoke_120(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) internalOutstandingFileTransfers];
  uint64_t v2 = [v5 objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  char v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

uint64_t __43__WCSession_handleFileResultWithPairingID___block_invoke_123(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) progressToken];

  if (v2) {
    objc_msgSend(*(id *)(a1 + 40), "onqueue_removeProgressForFileTransfer:", *(void *)(a1 + 32));
  }
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(a1 + 40);

  return objc_msgSend(v3, "onqueue_removeOutstandingFileTransfer:", v4);
}

uint64_t __43__WCSession_handleFileResultWithPairingID___block_invoke_2_124(uint64_t a1)
{
  return [*(id *)(a1 + 32) reportFileTransfer:*(void *)(a1 + 40)];
}

- (void)handleIncomingUserInfoWithPairingID:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = wc_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    char v14 = "-[WCSession handleIncomingUserInfoWithPairingID:]";
    __int16 v15 = 2114;
    id v16 = v4;
    _os_log_impl(&dword_222A02000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s %{public}@", buf, 0x16u);
  }

  if (!v4)
  {
    id v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s: %s cannot be nil.", "-[WCSession handleIncomingUserInfoWithPairingID:]", "pairingID");
    id v7 = wc_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      -[WCSession sendMessage:replyHandler:errorHandler:](v6);
    }

    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"%@", v6 format];
  }
  workOperationQueue = self->_workOperationQueue;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __49__WCSession_handleIncomingUserInfoWithPairingID___block_invoke;
  v10[3] = &unk_26463C3B8;
  id v11 = v4;
  id v12 = self;
  id v9 = v4;
  [(NSOperationQueue *)workOperationQueue addOperationWithBlock:v10];
}

void __49__WCSession_handleIncomingUserInfoWithPairingID___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v10 = [*(id *)(a1 + 40) pairingID];
  if (objc_msgSend(v2, "isEqual:"))
  {
    uint64_t v3 = *(void **)(a1 + 32);
    id v4 = +[WCFileStorage sharedInstance];
    id v5 = [v4 pairingID];
    LODWORD(v3) = [v3 isEqual:v5];

    if (v3)
    {
      id v6 = objc_opt_new();
      objc_initWeak(&location, v6);
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __49__WCSession_handleIncomingUserInfoWithPairingID___block_invoke_2;
      v11[3] = &unk_26463C1B8;
      objc_copyWeak(&v14, &location);
      id v7 = *(id *)(a1 + 32);
      uint64_t v8 = *(void *)(a1 + 40);
      id v12 = v7;
      uint64_t v13 = v8;
      [v6 addExecutionBlock:v11];
      id v9 = [*(id *)(a1 + 40) delegateOperationQueue];
      [v9 addOperation:v6];

      objc_destroyWeak(&v14);
      objc_destroyWeak(&location);
    }
  }
  else
  {
  }
}

void __49__WCSession_handleIncomingUserInfoWithPairingID___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  char v4 = [WeakRetained isCancelled];

  if ((v4 & 1) == 0)
  {
    id v6 = *(void **)(a1 + 32);
    id v5 = (id *)(a1 + 32);
    id v7 = [v5[1] pairingID];
    char v8 = [v6 isEqual:v7];

    if ((v8 & 1) == 0)
    {
      id v9 = wc_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        __49__WCSession_handleIncomingUserInfoWithPairingID___block_invoke_2_cold_1((uint64_t)v5, (uint64_t)(v5 + 1));
      }
    }
    id v10 = +[WCFileStorage sharedInstance];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __49__WCSession_handleIncomingUserInfoWithPairingID___block_invoke_127;
    v13[3] = &unk_26463C548;
    objc_copyWeak(&v16, v2);
    id v11 = *v5;
    id v12 = v5[1];
    id v14 = v11;
    id v15 = v12;
    [v10 enumerateIncomingUserInfosWithBlock:v13];

    objc_destroyWeak(&v16);
  }
}

void __49__WCSession_handleIncomingUserInfoWithPairingID___block_invoke_127(uint64_t a1, void *a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  char v8 = [WeakRetained isCancelled];

  if ((v8 & 1) == 0)
  {
    id v10 = *(void **)(a1 + 32);
    uint64_t v9 = a1 + 32;
    id v11 = (id *)(v9 + 8);
    id v12 = [*(id *)(v9 + 8) pairingID];
    char v13 = [v10 isEqual:v12];

    if ((v13 & 1) == 0)
    {
      id v14 = wc_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        __49__WCSession_handleIncomingUserInfoWithPairingID___block_invoke_127_cold_2(v9, v9 + 8);
      }
    }
    id v15 = wc_log();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v16)
      {
        uint64_t v17 = [v5 transferIdentifier];
        int v24 = 136446722;
        uint64_t v25 = "-[WCSession handleIncomingUserInfoWithPairingID:]_block_invoke";
        __int16 v26 = 2114;
        id v27 = v5;
        __int16 v28 = 2114;
        id v29 = v17;
        _os_log_impl(&dword_222A02000, v15, OS_LOG_TYPE_DEFAULT, "%{public}s %{public}@, identifier %{public}@", (uint8_t *)&v24, 0x20u);
      }
      if ([v5 verifyUserInfo])
      {
        id v18 = [*v11 delegate];
        char v19 = objc_opt_respondsToSelector();

        if (v19)
        {
          id v20 = [*v11 delegate];
          id v21 = *v11;
          id v22 = [v5 userInfo];
          [v20 session:v21 didReceiveUserInfo:v22];
        }
        else
        {
          id v20 = wc_log();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
            __49__WCSession_handleIncomingUserInfoWithPairingID___block_invoke_127_cold_1();
          }
        }
      }
      id v15 = +[WCFileStorage sharedInstance];
      [v15 deleteUserInfoTransferFromInbox:v5];
    }
    else if (v16)
    {
      int v24 = 136446466;
      uint64_t v25 = "-[WCSession handleIncomingUserInfoWithPairingID:]_block_invoke";
      __int16 v26 = 2114;
      id v27 = v6;
      _os_log_impl(&dword_222A02000, v15, OS_LOG_TYPE_DEFAULT, "%{public}s ERROR: failed to load user info transfer with identifier %{public}@", (uint8_t *)&v24, 0x16u);
    }

    __int16 v23 = +[WCXPCManager sharedManager];
    [v23 acknowledgeUserInfoIndexWithIdentifier:v6 clientPairingID:*(void *)v9];
  }
}

- (void)handleUserInfoResultWithPairingID:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = wc_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    id v14 = "-[WCSession handleUserInfoResultWithPairingID:]";
    __int16 v15 = 2114;
    id v16 = v4;
    _os_log_impl(&dword_222A02000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s %{public}@", buf, 0x16u);
  }

  if (!v4)
  {
    id v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s: %s cannot be nil.", "-[WCSession handleUserInfoResultWithPairingID:]", "pairingID");
    id v7 = wc_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      -[WCSession sendMessage:replyHandler:errorHandler:](v6);
    }

    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"%@", v6 format];
  }
  workOperationQueue = self->_workOperationQueue;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __47__WCSession_handleUserInfoResultWithPairingID___block_invoke;
  v10[3] = &unk_26463C3B8;
  id v11 = v4;
  id v12 = self;
  id v9 = v4;
  [(NSOperationQueue *)workOperationQueue addOperationWithBlock:v10];
}

void __47__WCSession_handleUserInfoResultWithPairingID___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v10 = [*(id *)(a1 + 40) pairingID];
  if (objc_msgSend(v2, "isEqual:"))
  {
    uint64_t v3 = *(void **)(a1 + 32);
    id v4 = +[WCFileStorage sharedInstance];
    id v5 = [v4 pairingID];
    LODWORD(v3) = [v3 isEqual:v5];

    if (v3)
    {
      id v6 = objc_opt_new();
      objc_initWeak(&location, v6);
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __47__WCSession_handleUserInfoResultWithPairingID___block_invoke_2;
      v11[3] = &unk_26463C1B8;
      objc_copyWeak(&v14, &location);
      id v7 = *(id *)(a1 + 32);
      uint64_t v8 = *(void *)(a1 + 40);
      id v12 = v7;
      uint64_t v13 = v8;
      [v6 addExecutionBlock:v11];
      id v9 = [*(id *)(a1 + 40) delegateOperationQueue];
      [v9 addOperation:v6];

      objc_destroyWeak(&v14);
      objc_destroyWeak(&location);
    }
  }
  else
  {
  }
}

void __47__WCSession_handleUserInfoResultWithPairingID___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  char v4 = [WeakRetained isCancelled];

  if ((v4 & 1) == 0)
  {
    id v6 = *(void **)(a1 + 32);
    id v5 = (id *)(a1 + 32);
    id v7 = [v5[1] pairingID];
    char v8 = [v6 isEqual:v7];

    if ((v8 & 1) == 0)
    {
      id v9 = wc_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        __47__WCSession_handleUserInfoResultWithPairingID___block_invoke_2_cold_1((uint64_t)v5, (uint64_t)(v5 + 1));
      }
    }
    id v10 = +[WCFileStorage sharedInstance];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __47__WCSession_handleUserInfoResultWithPairingID___block_invoke_131;
    v13[3] = &unk_26463C548;
    objc_copyWeak(&v16, v2);
    id v11 = *v5;
    id v12 = v5[1];
    id v14 = v11;
    id v15 = v12;
    [v10 enumerateUserInfoResultsWithBlock:v13];

    objc_destroyWeak(&v16);
  }
}

void __47__WCSession_handleUserInfoResultWithPairingID___block_invoke_131(uint64_t a1, void *a2, void *a3)
{
  uint64_t v66 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  char v9 = [WeakRetained isCancelled];

  if ((v9 & 1) == 0)
  {
    id v11 = *(void **)(a1 + 32);
    uint64_t v10 = a1 + 32;
    id v12 = (id *)(v10 + 8);
    uint64_t v13 = [*(id *)(v10 + 8) pairingID];
    char v14 = [v11 isEqual:v13];

    if ((v14 & 1) == 0)
    {
      id v15 = wc_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        __47__WCSession_handleUserInfoResultWithPairingID___block_invoke_131_cold_3(v10, v10 + 8);
      }
    }
    id v16 = wc_log();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v17)
      {
        *(_DWORD *)buf = 136446466;
        *(void *)&uint8_t buf[4] = "-[WCSession handleUserInfoResultWithPairingID:]_block_invoke";
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v5;
        _os_log_impl(&dword_222A02000, v16, OS_LOG_TYPE_DEFAULT, "%{public}s %{public}@", buf, 0x16u);
      }

      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      v63 = __Block_byref_object_copy_;
      __int16 v64 = __Block_byref_object_dispose_;
      id v65 = 0;
      id v18 = objc_opt_new();
      v50[0] = MEMORY[0x263EF8330];
      v50[1] = 3221225472;
      v50[2] = __47__WCSession_handleUserInfoResultWithPairingID___block_invoke_132;
      v50[3] = &unk_26463C408;
      id v19 = *v12;
      v52 = buf;
      v50[4] = v19;
      id v51 = v6;
      [v18 addExecutionBlock:v50];
      id v20 = (void *)*((void *)*v12 + 11);
      v61 = v18;
      id v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v61 count:1];
      [v20 addOperations:v21 waitUntilFinished:1];

      if (*(void *)(*(void *)&buf[8] + 40))
      {
        id v22 = [v5 transferError];

        if (v22)
        {
          __int16 v23 = [v5 transferError];
          [*(id *)(*(void *)&buf[8] + 40) setTransferError:v23];
        }
        int v24 = v5;
        id v5 = *(id *)(*(void *)&buf[8] + 40);
      }
      else
      {
        int v24 = wc_log();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
          __47__WCSession_handleUserInfoResultWithPairingID___block_invoke_131_cold_2();
        }
      }

      id v25 = objc_loadWeakRetained(v7);
      char v26 = [v25 isCancelled];

      if (v26)
      {

        _Block_object_dispose(buf, 8);
        goto LABEL_30;
      }
      id v27 = *(void **)v10;
      __int16 v28 = [*v12 pairingID];
      LOBYTE(v27) = [v27 isEqual:v28];

      if ((v27 & 1) == 0)
      {
        id v29 = wc_log();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          uint64_t v30 = *(void *)v10;
          char v31 = [*v12 pairingID];
          __47__WCSession_handleUserInfoResultWithPairingID___block_invoke_131_cold_1(v30, v31, v60);
        }
      }
      uint64_t v32 = [*v12 delegate];
      char v33 = objc_opt_respondsToSelector();

      if (v33)
      {
        [v5 setTransferring:0];
        uint64_t v34 = [*v12 delegate];
        id v35 = *v12;
        __int16 v36 = [v5 transferError];
        [v34 session:v35 didFinishUserInfoTransfer:v5 error:v36];
      }
      else
      {
        uint64_t v34 = wc_log();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v37 = [*v12 delegate];
          id v38 = [(id)objc_opt_class() description];
          v39 = NSStringFromSelector(sel_session_didFinishUserInfoTransfer_error_);
          *(_DWORD *)v54 = 136446722;
          v55 = "-[WCSession handleUserInfoResultWithPairingID:]_block_invoke";
          __int16 v56 = 2114;
          id v57 = v38;
          __int16 v58 = 2114;
          id v59 = v39;
          _os_log_impl(&dword_222A02000, v34, OS_LOG_TYPE_DEFAULT, "%{public}s delegate %{public}@ does not implement %{public}@", v54, 0x20u);
        }
      }

      id v40 = objc_opt_new();
      uint64_t v44 = MEMORY[0x263EF8330];
      uint64_t v45 = 3221225472;
      v46 = __47__WCSession_handleUserInfoResultWithPairingID___block_invoke_135;
      id v47 = &unk_26463C3B8;
      id v48 = *v12;
      id v5 = v5;
      v49 = v5;
      [v40 addExecutionBlock:&v44];
      v41 = (void *)*((void *)*v12 + 11);
      v53 = v40;
      v42 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", &v53, 1, v44, v45, v46, v47, v48);
      [v41 addOperations:v42 waitUntilFinished:1];

      _Block_object_dispose(buf, 8);
    }
    else
    {
      if (v17)
      {
        *(_DWORD *)buf = 136446466;
        *(void *)&uint8_t buf[4] = "-[WCSession handleUserInfoResultWithPairingID:]_block_invoke_2";
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v6;
        _os_log_impl(&dword_222A02000, v16, OS_LOG_TYPE_DEFAULT, "%{public}s ERROR: failed to load user info result with identifier %{public}@", buf, 0x16u);
      }

      id v5 = 0;
    }
    id v43 = +[WCXPCManager sharedManager];
    [v43 acknowledgeUserInfoResultIndexWithIdentifier:v6 clientPairingID:*(void *)v10];
  }
LABEL_30:
}

void __47__WCSession_handleUserInfoResultWithPairingID___block_invoke_132(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) internalOutstandingUserInfoTransfers];
  uint64_t v2 = [v5 objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  char v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

uint64_t __47__WCSession_handleUserInfoResultWithPairingID___block_invoke_135(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "onqueue_removeOutstandingUserInfoTransfer:", *(void *)(a1 + 40));
}

void __57__WCSession_onqueue_completeSwitchTask_withSessionState___block_invoke(uint64_t a1)
{
  id v3 = [MEMORY[0x263F087E8] wcErrorWithCode:7019];
  uint64_t v2 = [*(id *)(a1 + 32) delegate];
  objc_msgSend(v2, "session:activationDidCompleteWithState:error:", *(void *)(a1 + 32), objc_msgSend(*(id *)(a1 + 32), "activationState"), v3);
}

uint64_t __57__WCSession_onqueue_completeSwitchTask_withSessionState___block_invoke_136(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 88);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __57__WCSession_onqueue_completeSwitchTask_withSessionState___block_invoke_2_137;
  v4[3] = &unk_26463C168;
  v4[4] = v1;
  return [v2 addOperationWithBlock:v4];
}

uint64_t __57__WCSession_onqueue_completeSwitchTask_withSessionState___block_invoke_2_137(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) pairingID];

  if (v2) {
    objc_msgSend(*(id *)(a1 + 32), "onqueue_dequeueContent");
  }
  uint64_t v3 = *(void *)(a1 + 32);
  char v4 = *(void **)(v3 + 88);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __57__WCSession_onqueue_completeSwitchTask_withSessionState___block_invoke_3;
  v6[3] = &unk_26463C168;
  void v6[4] = v3;
  return [v4 addOperationWithBlock:v6];
}

void __57__WCSession_onqueue_completeSwitchTask_withSessionState___block_invoke_4(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  char v3 = [WeakRetained isCancelled];

  if ((v3 & 1) == 0)
  {
    char v4 = wc_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v11 = 136446466;
      id v12 = "-[WCSession onqueue_completeSwitchTask:withSessionState:]_block_invoke_4";
      __int16 v13 = 2114;
      uint64_t v14 = v5;
      _os_log_impl(&dword_222A02000, v4, OS_LOG_TYPE_DEFAULT, "%{public}s cleaning up directories for state: %{public}@", (uint8_t *)&v11, 0x16u);
    }

    id v6 = +[WCFileStorage sharedInstance];
    id v7 = [*(id *)(a1 + 32) appInstallationID];
    [v6 cleanUpWatchContentDirectoryWithCurrentAppInstallationID:v7];

    char v8 = [*(id *)(a1 + 32) pairedDevicesPairingIDs];

    if (v8)
    {
      char v9 = +[WCFileStorage sharedInstance];
      uint64_t v10 = [*(id *)(a1 + 32) pairedDevicesPairingIDs];
      [v9 cleanUpOldPairingIDFoldersWithPairedDevicesPairingIDs:v10];
    }
  }
}

void __46__WCSession_onqueue_handleUpdateSessionState___block_invoke_138(uint64_t a1, char a2, int a3)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  objc_msgSend(*(id *)(a1 + 32), "onDelegateQueueIfTriggeringKVO_updateSessionState:triggerKVO:", *(void *)(a1 + 40), 1);
  id v6 = *(unsigned char **)(a1 + 32);
  if ((a2 & 1) == 0)
  {
    if (!v6[8]) {
      goto LABEL_15;
    }
    goto LABEL_5;
  }
  if (v6[8])
  {
LABEL_5:
    v6[8] = 0;
    id v7 = wc_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446210;
      __int16 v28 = "-[WCSession onqueue_handleUpdateSessionState:]_block_invoke";
      _os_log_impl(&dword_222A02000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s resetting forced reachable", buf, 0xCu);
    }

    id v6 = *(unsigned char **)(a1 + 32);
  }
  char v8 = [v6 delegate];
  char v9 = objc_opt_respondsToSelector();

  uint64_t v10 = wc_log();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v11)
    {
      *(_DWORD *)buf = 136446210;
      __int16 v28 = "-[WCSession onqueue_handleUpdateSessionState:]_block_invoke";
      _os_log_impl(&dword_222A02000, v10, OS_LOG_TYPE_DEFAULT, "%{public}s notifying client session reachability changed", buf, 0xCu);
    }

    uint64_t v10 = [*(id *)(a1 + 32) delegate];
    [v10 sessionReachabilityDidChange:*(void *)(a1 + 32)];
  }
  else if (v11)
  {
    id v12 = [*(id *)(a1 + 32) delegate];
    __int16 v13 = [(id)objc_opt_class() description];
    uint64_t v14 = NSStringFromSelector(sel_sessionReachabilityDidChange_);
    *(_DWORD *)buf = 136446722;
    __int16 v28 = "-[WCSession onqueue_handleUpdateSessionState:]_block_invoke";
    __int16 v29 = 2114;
    uint64_t v30 = v13;
    __int16 v31 = 2114;
    uint64_t v32 = v14;
    _os_log_impl(&dword_222A02000, v10, OS_LOG_TYPE_DEFAULT, "%{public}s delegate %{public}@ does not implement %{public}@", buf, 0x20u);
  }
LABEL_15:
  uint64_t v15 = objc_opt_new();
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __46__WCSession_onqueue_handleUpdateSessionState___block_invoke_141;
  v25[3] = &unk_26463C168;
  v25[4] = *(void *)(a1 + 32);
  [v15 addExecutionBlock:v25];
  id v16 = *(void **)(*(void *)(a1 + 32) + 88);
  char v26 = v15;
  BOOL v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v26 count:1];
  [v16 addOperations:v17 waitUntilFinished:1];

  if (a3)
  {
    id v18 = [*(id *)(a1 + 32) delegate];
    char v19 = objc_opt_respondsToSelector();

    id v20 = wc_log();
    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
    if (v19)
    {
      if (v21)
      {
        *(_DWORD *)buf = 136446210;
        __int16 v28 = "-[WCSession onqueue_handleUpdateSessionState:]_block_invoke_2";
        _os_log_impl(&dword_222A02000, v20, OS_LOG_TYPE_DEFAULT, "%{public}s notifying client session state changed", buf, 0xCu);
      }

      id v20 = [*(id *)(a1 + 32) delegate];
      [v20 sessionWatchStateDidChange:*(void *)(a1 + 32)];
    }
    else if (v21)
    {
      id v22 = [*(id *)(a1 + 32) delegate];
      __int16 v23 = [(id)objc_opt_class() description];
      int v24 = NSStringFromSelector(sel_sessionWatchStateDidChange_);
      *(_DWORD *)buf = 136446722;
      __int16 v28 = "-[WCSession onqueue_handleUpdateSessionState:]_block_invoke";
      __int16 v29 = 2114;
      uint64_t v30 = v23;
      __int16 v31 = 2114;
      uint64_t v32 = v24;
      _os_log_impl(&dword_222A02000, v20, OS_LOG_TYPE_DEFAULT, "%{public}s delegate %{public}@ does not implement %{public}@", buf, 0x20u);
    }
  }
}

uint64_t __46__WCSession_onqueue_handleUpdateSessionState___block_invoke_141(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "onqueue_cancelMessagesIfAppropriate");
  uint64_t v2 = *(void **)(a1 + 32);

  return objc_msgSend(v2, "onqueue_cancelTransfersIfAppropriate");
}

void __42__WCSession_onqueue_startNextDeviceSwitch__block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  char v3 = [WeakRetained isCancelled];

  if ((v3 & 1) == 0)
  {
    char v4 = wc_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136446210;
      id v7 = "-[WCSession onqueue_startNextDeviceSwitch]_block_invoke";
      _os_log_impl(&dword_222A02000, v4, OS_LOG_TYPE_DEFAULT, "%{public}s notifying client session did become inactive", (uint8_t *)&v6, 0xCu);
    }

    uint64_t v5 = [*(id *)(a1 + 32) delegate];
    [v5 sessionDidBecomeInactive:*(void *)(a1 + 32)];
  }
}

void __42__WCSession_onqueue_startNextDeviceSwitch__block_invoke_145(id *a1)
{
  v16[1] = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  char v3 = [WeakRetained isCancelled];

  if ((v3 & 1) == 0)
  {
    char v4 = [a1[4] delegateOperationQueue];
    [v4 cancelAllOperations];

    uint64_t v5 = objc_opt_new();
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __42__WCSession_onqueue_startNextDeviceSwitch__block_invoke_2;
    v13[3] = &unk_26463C168;
    void v13[4] = a1[4];
    [v5 addExecutionBlock:v13];
    int v6 = (void *)*((void *)a1[4] + 11);
    v16[0] = v5;
    id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:1];
    [v6 addOperations:v7 waitUntilFinished:1];

    uint64_t v8 = wc_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446210;
      uint64_t v15 = "-[WCSession onqueue_startNextDeviceSwitch]_block_invoke";
      _os_log_impl(&dword_222A02000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s notifying client session did deactivate", buf, 0xCu);
    }

    char v9 = [a1[4] delegate];
    [v9 sessionDidDeactivate:a1[4]];

    uint64_t v10 = (void *)*((void *)a1[4] + 11);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __42__WCSession_onqueue_startNextDeviceSwitch__block_invoke_146;
    v11[3] = &unk_26463C168;
    id v12 = a1[5];
    [v10 addOperationWithBlock:v11];
  }
}

uint64_t __42__WCSession_onqueue_startNextDeviceSwitch__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setActivationState:0];
}

uint64_t __42__WCSession_onqueue_startNextDeviceSwitch__block_invoke_146(uint64_t a1)
{
  return [*(id *)(a1 + 32) setTaskState:2];
}

- (void)onqueue_dequeueContent
{
  char v3 = [(WCSession *)self pairingID];
  [(WCSession *)self handleApplicationContextWithPairingID:v3];

  char v4 = [(WCSession *)self pairingID];
  [(WCSession *)self handleFileResultWithPairingID:v4];

  uint64_t v5 = [(WCSession *)self pairingID];
  [(WCSession *)self handleIncomingFileWithPairingID:v5];

  int v6 = [(WCSession *)self pairingID];
  [(WCSession *)self handleUserInfoResultWithPairingID:v6];

  id v7 = [(WCSession *)self pairingID];
  [(WCSession *)self handleIncomingUserInfoWithPairingID:v7];

  workOperationQueue = self->_workOperationQueue;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __35__WCSession_onqueue_dequeueContent__block_invoke;
  v9[3] = &unk_26463C168;
  v9[4] = self;
  [(NSOperationQueue *)workOperationQueue addOperationWithBlock:v9];
}

void __35__WCSession_onqueue_dequeueContent__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) delegateOperationQueue];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __35__WCSession_onqueue_dequeueContent__block_invoke_2;
  v3[3] = &unk_26463C168;
  v3[4] = *(void *)(a1 + 32);
  [v2 addOperationWithBlock:v3];
}

void __35__WCSession_onqueue_dequeueContent__block_invoke_2(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) setHasContentPending:0];
  uint64_t v2 = wc_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = [*(id *)(a1 + 32) hasContentPending];
    char v4 = "NO";
    if (v3) {
      char v4 = "YES";
    }
    int v5 = 136446466;
    int v6 = "-[WCSession onqueue_dequeueContent]_block_invoke_2";
    __int16 v7 = 2080;
    uint64_t v8 = v4;
    _os_log_impl(&dword_222A02000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s hasContentPending: %s", (uint8_t *)&v5, 0x16u);
  }
}

- (void)onqueue_handleMessageCompletionWithError:(id)a3 withMessageID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(NSMutableDictionary *)self->_currentMessages objectForKeyedSubscript:v7];
  uint64_t v9 = [v8 timeoutTimer];
  if (v9)
  {
    uint64_t v10 = v9;
    if (v6)
    {
    }
    else
    {
      char v11 = [v8 expectsResponse];

      if (v11) {
        goto LABEL_10;
      }
    }
    id v12 = [v8 timeoutTimer];
    dispatch_source_cancel(v12);
  }
  if (v6)
  {
    __int16 v13 = wc_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[WCSession onqueue_handleMessageCompletionWithError:withMessageID:]();
    }

    uint64_t v14 = [v8 errorHandler];
    [(WCSession *)self _onqueue_notifyOfMessageError:v6 messageID:v7 withErrorHandler:v14];

    goto LABEL_11;
  }
LABEL_10:
  if (([v8 expectsResponse] & 1) == 0) {
LABEL_11:
  }
    [(NSMutableDictionary *)self->_currentMessages removeObjectForKey:v7];
}

- (void)_onqueue_notifyOfMessageError:(id)a3 messageID:(id)a4 withErrorHandler:(id)a5
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  char v11 = wc_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    if (v10) {
      id v16 = "YES";
    }
    else {
      id v16 = "NO";
    }
    BOOL v17 = NSPrintF();
    *(_DWORD *)id location = 136446978;
    *(void *)&location[4] = "-[WCSession _onqueue_notifyOfMessageError:messageID:withErrorHandler:]";
    __int16 v25 = 2114;
    id v26 = v9;
    __int16 v27 = 2080;
    __int16 v28 = v16;
    __int16 v29 = 2114;
    uint64_t v30 = v17;
    _os_log_error_impl(&dword_222A02000, v11, OS_LOG_TYPE_ERROR, "%{public}s %{public}@ errorHandler: %s with %{public}@", location, 0x2Au);
  }
  if (v10)
  {
    id v12 = [(WCSession *)self pairingID];
    __int16 v13 = objc_opt_new();
    objc_initWeak((id *)location, v13);
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __70__WCSession__onqueue_notifyOfMessageError_messageID_withErrorHandler___block_invoke;
    v18[3] = &unk_26463C5C0;
    objc_copyWeak(&v23, (id *)location);
    id v14 = v12;
    id v19 = v14;
    id v20 = self;
    id v22 = v10;
    id v21 = v8;
    [v13 addExecutionBlock:v18];
    uint64_t v15 = [(WCSession *)self delegateOperationQueue];
    [v15 addOperation:v13];

    objc_destroyWeak(&v23);
    objc_destroyWeak((id *)location);
  }
}

void __70__WCSession__onqueue_notifyOfMessageError_messageID_withErrorHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  char v3 = [WeakRetained isCancelled];

  if ((v3 & 1) == 0)
  {
    char v4 = *(void **)(a1 + 32);
    int v5 = [*(id *)(a1 + 40) pairingID];
    LOBYTE(v4) = [v4 isEqual:v5];

    if ((v4 & 1) == 0)
    {
      id v6 = wc_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        __70__WCSession__onqueue_notifyOfMessageError_messageID_withErrorHandler___block_invoke_cold_1(a1 + 32, a1 + 40);
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

- (void)notifyOfFileError:(id)a3 withFileTransfer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = wc_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    -[WCSession notifyOfFileError:withFileTransfer:]();
  }

  workOperationQueue = self->_workOperationQueue;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __48__WCSession_notifyOfFileError_withFileTransfer___block_invoke;
  v12[3] = &unk_26463C258;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  [(NSOperationQueue *)workOperationQueue addOperationWithBlock:v12];
}

uint64_t __48__WCSession_notifyOfFileError_withFileTransfer___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "onqueue_notifyOfFileError:withFileTransfer:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (void)onqueue_notifyOfFileError:(id)a3 withFileTransfer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(WCSession *)self pairingID];
  id v9 = objc_opt_new();
  objc_initWeak(&location, v9);
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  id v16 = __56__WCSession_onqueue_notifyOfFileError_withFileTransfer___block_invoke;
  BOOL v17 = &unk_26463C458;
  objc_copyWeak(&v22, &location);
  id v10 = v8;
  id v18 = v10;
  id v19 = self;
  id v11 = v7;
  id v20 = v11;
  id v12 = v6;
  id v21 = v12;
  [v9 addExecutionBlock:&v14];
  id v13 = [(WCSession *)self delegateOperationQueue];
  [v13 addOperation:v9];

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
}

void __56__WCSession_onqueue_notifyOfFileError_withFileTransfer___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  char v3 = [WeakRetained isCancelled];

  if ((v3 & 1) == 0)
  {
    char v4 = *(void **)(a1 + 32);
    int v5 = (id *)(a1 + 40);
    id v6 = [*(id *)(a1 + 40) pairingID];
    LOBYTE(v4) = [v4 isEqual:v6];

    if ((v4 & 1) == 0)
    {
      id v7 = wc_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        __56__WCSession_onqueue_notifyOfFileError_withFileTransfer___block_invoke_cold_1(a1 + 32, a1 + 40);
      }
    }
    id v8 = [*v5 delegate];
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      id v10 = [*(id *)(a1 + 40) delegate];
      [v10 session:*(void *)(a1 + 40) didFinishFileTransfer:*(void *)(a1 + 48) error:*(void *)(a1 + 56)];
    }
    else
    {
      id v10 = wc_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        id v11 = [*v5 delegate];
        id v12 = [(id)objc_opt_class() description];
        id v13 = NSStringFromSelector(sel_session_didFinishFileTransfer_error_);
        *(_DWORD *)buf = 136446722;
        id v19 = "-[WCSession onqueue_notifyOfFileError:withFileTransfer:]_block_invoke";
        __int16 v20 = 2114;
        id v21 = v12;
        __int16 v22 = 2114;
        id v23 = v13;
        _os_log_impl(&dword_222A02000, v10, OS_LOG_TYPE_DEFAULT, "%{public}s delegate %{public}@ does not implement %{public}@", buf, 0x20u);
      }
    }

    uint64_t v14 = *(void *)(a1 + 40);
    uint64_t v15 = *(void **)(v14 + 88);
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    void v16[2] = __56__WCSession_onqueue_notifyOfFileError_withFileTransfer___block_invoke_147;
    v16[3] = &unk_26463C3B8;
    void v16[4] = v14;
    id v17 = *(id *)(a1 + 48);
    [v15 addOperationWithBlock:v16];
  }
}

uint64_t __56__WCSession_onqueue_notifyOfFileError_withFileTransfer___block_invoke_147(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "onqueue_removeOutstandingFileTransfer:", *(void *)(a1 + 40));
}

- (void)notifyOfUserInfoError:(id)a3 withUserInfoTransfer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = wc_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    -[WCSession notifyOfUserInfoError:withUserInfoTransfer:]();
  }

  workOperationQueue = self->_workOperationQueue;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __56__WCSession_notifyOfUserInfoError_withUserInfoTransfer___block_invoke;
  v12[3] = &unk_26463C258;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  [(NSOperationQueue *)workOperationQueue addOperationWithBlock:v12];
}

uint64_t __56__WCSession_notifyOfUserInfoError_withUserInfoTransfer___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "onqueue_notifyOfUserInfoError:withUserInfoTransfer:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (void)onqueue_notifyOfUserInfoError:(id)a3 withUserInfoTransfer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(WCSession *)self pairingID];
  char v9 = objc_opt_new();
  objc_initWeak(&location, v9);
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  id v16 = __64__WCSession_onqueue_notifyOfUserInfoError_withUserInfoTransfer___block_invoke;
  id v17 = &unk_26463C458;
  objc_copyWeak(&v22, &location);
  id v10 = v8;
  id v18 = v10;
  id v19 = self;
  id v11 = v7;
  id v20 = v11;
  id v12 = v6;
  id v21 = v12;
  [v9 addExecutionBlock:&v14];
  id v13 = [(WCSession *)self delegateOperationQueue];
  [v13 addOperation:v9];

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
}

void __64__WCSession_onqueue_notifyOfUserInfoError_withUserInfoTransfer___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  char v3 = [WeakRetained isCancelled];

  if ((v3 & 1) == 0)
  {
    char v4 = *(void **)(a1 + 32);
    int v5 = (id *)(a1 + 40);
    id v6 = [*(id *)(a1 + 40) pairingID];
    LOBYTE(v4) = [v4 isEqual:v6];

    if ((v4 & 1) == 0)
    {
      id v7 = wc_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        __64__WCSession_onqueue_notifyOfUserInfoError_withUserInfoTransfer___block_invoke_cold_1(a1 + 32, a1 + 40);
      }
    }
    id v8 = [*v5 delegate];
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      id v10 = [*(id *)(a1 + 40) delegate];
      [v10 session:*(void *)(a1 + 40) didFinishUserInfoTransfer:*(void *)(a1 + 48) error:*(void *)(a1 + 56)];
    }
    else
    {
      id v10 = wc_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        id v11 = [*v5 delegate];
        id v12 = [(id)objc_opt_class() description];
        id v13 = NSStringFromSelector(sel_session_didFinishUserInfoTransfer_error_);
        *(_DWORD *)buf = 136446722;
        id v22 = "-[WCSession onqueue_notifyOfUserInfoError:withUserInfoTransfer:]_block_invoke";
        __int16 v23 = 2114;
        uint64_t v24 = v12;
        __int16 v25 = 2114;
        id v26 = v13;
        _os_log_impl(&dword_222A02000, v10, OS_LOG_TYPE_DEFAULT, "%{public}s delegate %{public}@ does not implement %{public}@", buf, 0x20u);
      }
    }

    uint64_t v14 = objc_opt_new();
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __64__WCSession_onqueue_notifyOfUserInfoError_withUserInfoTransfer___block_invoke_148;
    v18[3] = &unk_26463C3B8;
    uint64_t v15 = *(void **)(a1 + 48);
    void v18[4] = *(void *)(a1 + 40);
    id v19 = v15;
    [v14 addExecutionBlock:v18];
    id v16 = *(void **)(*(void *)(a1 + 40) + 88);
    id v20 = v14;
    id v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v20 count:1];
    [v16 addOperations:v17 waitUntilFinished:1];
  }
}

uint64_t __64__WCSession_onqueue_notifyOfUserInfoError_withUserInfoTransfer___block_invoke_148(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "onqueue_removeOutstandingUserInfoTransfer:", *(void *)(a1 + 40));
}

- (id)createAndStartTimerOnWorkQueueWithHandler:(id)a3
{
  workOperationQueue = self->_workOperationQueue;
  id v4 = a3;
  int v5 = [(NSOperationQueue *)workOperationQueue underlyingQueue];
  id v6 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, v5);

  dispatch_time_t v7 = dispatch_time(0, 300000000000);
  dispatch_source_set_timer(v6, v7, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  dispatch_source_set_event_handler(v6, v4);

  dispatch_resume(v6);

  return v6;
}

- (id)errorIfNotReachable
{
  if ([(WCSession *)self isReachable])
  {
    uint64_t v2 = 0;
  }
  else
  {
    uint64_t v2 = [MEMORY[0x263F087E8] wcErrorWithCode:7007];
    char v3 = wc_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      -[WCSession errorIfNotReachable]();
    }
  }

  return v2;
}

- (BOOL)verifySessionFile:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 fileURL];
  char v5 = [(id)v4 checkResourceIsReachableAndReturnError:0];

  LOBYTE(v4) = [v3 verifyMetadata];
  return v5 & v4;
}

- (id)fileSizeFromURL:(id)a3
{
  id v5 = 0;
  [a3 getResourceValue:&v5 forKey:*MEMORY[0x263EFF688] error:0];
  id v3 = v5;

  return v3;
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  id v4 = a3;
  if (([v4 isEqual:@"outstandingFileTransfers"] & 1) != 0
    || ([v4 isEqual:@"outstandingFileTransfers"] & 1) != 0)
  {
    unsigned __int8 v5 = 0;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___WCSession;
    unsigned __int8 v5 = objc_msgSendSuper2(&v7, sel_automaticallyNotifiesObserversForKey_, v4);
  }

  return v5;
}

- (void)setInternalOutstandingFileTransfers:(id)a3
{
  id v7 = a3;
  unsigned __int8 v5 = [(WCSession *)self internalOutstandingFileTransfers];
  char v6 = [v5 isEqual:v7];

  if ((v6 & 1) == 0)
  {
    [(WCSession *)self willChangeValueForKey:@"outstandingFileTransfers"];
    objc_storeStrong((id *)&self->_internalOutstandingFileTransfers, a3);
    [(WCSession *)self didChangeValueForKey:@"outstandingFileTransfers"];
  }
}

- (void)setInternalOutstandingUserInfoTransfers:(id)a3
{
  id v7 = a3;
  unsigned __int8 v5 = [(WCSession *)self internalOutstandingUserInfoTransfers];
  char v6 = [v5 isEqual:v7];

  if ((v6 & 1) == 0)
  {
    [(WCSession *)self willChangeValueForKey:@"outstandingUserInfoTransfers"];
    objc_storeStrong((id *)&self->_internalOutstandingUserInfoTransfers, a3);
    [(WCSession *)self didChangeValueForKey:@"outstandingUserInfoTransfers"];
  }
}

- (void)reportFileTransfer:(id)a3
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 transferDate];
  if (v5)
  {
    char v6 = (void *)v5;
    id v7 = [MEMORY[0x263EFF910] date];
    id v8 = [v4 transferDate];
    [v7 timeIntervalSinceDate:v8];
    uint64_t v10 = (uint64_t)v9;

    if (v10 >= 31) {
      unint64_t v11 = 30 * (v10 / 0x1EuLL);
    }
    else {
      unint64_t v11 = v10;
    }
  }
  else
  {
    unint64_t v11 = -1;
  }
  id v12 = [v4 file];
  id v13 = [v12 fileSize];
  if (v13)
  {
    uint64_t v14 = [v4 file];
    uint64_t v15 = [v14 fileSize];
    unint64_t v16 = -[WCSession roundValue:toSignificantFigures:](self, "roundValue:toSignificantFigures:", [v15 integerValue], 2);
  }
  else
  {
    unint64_t v16 = -1;
  }

  id v17 = [v4 file];
  id v18 = [v17 userInfoData];
  if ([v18 length])
  {
    id v19 = [v4 file];
    id v20 = [v19 userInfoData];
    unint64_t v21 = -[WCSession roundValue:toSignificantFigures:](self, "roundValue:toSignificantFigures:", [v20 length], 2);
  }
  else
  {
    unint64_t v21 = -1;
  }

  id v22 = objc_opt_new();
  __int16 v23 = [NSNumber numberWithInteger:v11];
  [v22 setObject:v23 forKeyedSubscript:@"durationSec"];

  uint64_t v24 = [v4 transferError];
  if ([v24 code])
  {
    __int16 v25 = NSNumber;
    id v26 = [v4 transferError];
    uint64_t v27 = objc_msgSend(v25, "numberWithInteger:", objc_msgSend(v26, "code"));
    [v22 setObject:v27 forKeyedSubscript:@"errorCode"];
  }
  else
  {
    [v22 setObject:&unk_26D52A3E8 forKeyedSubscript:@"errorCode"];
  }

  __int16 v28 = [v4 transferError];
  uint64_t v29 = [v28 domain];
  uint64_t v30 = (void *)v29;
  if (v29) {
    uint64_t v31 = (__CFString *)v29;
  }
  else {
    uint64_t v31 = &stru_26D525540;
  }
  [v22 setObject:v31 forKeyedSubscript:@"errorDomain"];

  uint64_t v32 = [NSNumber numberWithInteger:v16];
  [v22 setObject:v32 forKeyedSubscript:@"fileSizeBytes"];

  uint64_t v33 = [v4 file];
  uint64_t v34 = [v33 userInfoData];
  uint64_t v35 = MEMORY[0x263EFFA88];
  uint64_t v36 = MEMORY[0x263EFFA80];
  if (v34) {
    uint64_t v37 = MEMORY[0x263EFFA88];
  }
  else {
    uint64_t v37 = MEMORY[0x263EFFA80];
  }
  [v22 setObject:v37 forKeyedSubscript:@"hasMetadata"];

  id v38 = [NSNumber numberWithInteger:v21];
  [v22 setObject:v38 forKeyedSubscript:@"metadataSizeBytes"];

  v39 = [v4 transferError];
  if (v39) {
    uint64_t v40 = v36;
  }
  else {
    uint64_t v40 = v35;
  }
  [v22 setObject:v40 forKeyedSubscript:@"success"];

  double v41 = (double)arc4random() / 4294967300.0;
  if (v41 < 0.1) {
    CUMetricsLog();
  }
  v42 = wc_log();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
  {
    id v43 = "no";
    int v44 = 136446722;
    uint64_t v45 = "-[WCSession reportFileTransfer:]";
    if (v41 < 0.1) {
      id v43 = "yes";
    }
    __int16 v46 = 2112;
    id v47 = v22;
    __int16 v48 = 2080;
    v49 = v43;
    _os_log_impl(&dword_222A02000, v42, OS_LOG_TYPE_INFO, "%{public}s %@ submited %s", (uint8_t *)&v44, 0x20u);
  }
}

- (unint64_t)roundValue:(unint64_t)a3 toSignificantFigures:(int)a4
{
  if (!a3) {
    return 0;
  }
  double v5 = (double)a3;
  double v6 = log10((double)a3);
  double v7 = __exp10((double)(int)(a4 - vcvtpd_s64_f64(v6)));
  unint64_t result = (unint64_t)(round(v7 * v5) / v7);
  int v9 = result % 0xA;
  if (v9 == 9)
  {
    ++result;
  }
  else if (v9 == 1)
  {
    --result;
  }
  return result;
}

- (void)setPaired:(BOOL)a3
{
  self->_paired = a3;
}

- (void)setWatchAppInstalled:(BOOL)a3
{
  self->_watchAppInstalled = a3;
}

- (void)setComplicationEnabled:(BOOL)a3
{
  self->_complicationEnabled = a3;
}

- (void)setRemainingComplicationUserInfoTransfers:(unint64_t)a3
{
  self->_remainingComplicationUserInfoTransfers = a3;
}

- (void)setWatchDirectoryURL:(id)a3
{
}

- (void)setCompanionAppInstalled:(BOOL)a3
{
  self->_companionAppInstalled = a3;
}

- (void)setReachable:(BOOL)a3
{
  self->_reachable = a3;
}

- (BOOL)iOSDeviceNeedsUnlockAfterRebootForReachability
{
  return self->_iOSDeviceNeedsUnlockAfterRebootForReachability;
}

- (void)setIOSDeviceNeedsUnlockAfterRebootForReachability:(BOOL)a3
{
  self->_iOSDeviceNeedsUnlockAfterRebootForReachability = a3;
}

- (void)setApplicationContext:(id)a3
{
}

- (void)setReceivedApplicationContext:(id)a3
{
}

- (NSOperationQueue)backgroundWorkOperationQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 80, 1);
}

- (NSOperationQueue)workOperationQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 88, 1);
}

- (NSMutableDictionary)currentMessages
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 96, 1);
}

- (NSMutableSet)currentMessageIdentifiersAwaitingReply
{
  return (NSMutableSet *)objc_getProperty(self, a2, 104, 1);
}

- (void)setCurrentMessageIdentifiersAwaitingReply:(id)a3
{
}

- (NSMutableDictionary)internalOutstandingUserInfoTransfers
{
  return self->_internalOutstandingUserInfoTransfers;
}

- (NSMutableDictionary)internalOutstandingFileTransfers
{
  return self->_internalOutstandingFileTransfers;
}

- (WCSessionUserInfoTransfer)currentComplicationUserInfoTransfer
{
  return (WCSessionUserInfoTransfer *)objc_getProperty(self, a2, 128, 1);
}

- (void)setCurrentComplicationUserInfoTransfer:(id)a3
{
}

- (WCQueueManager)queueManager
{
  return (WCQueueManager *)objc_getProperty(self, a2, 136, 1);
}

- (void)setQueueManager:(id)a3
{
}

- (void)setPairingID:(id)a3
{
}

- (void)setConnectionWasInterrupted:(BOOL)a3
{
  self->_connectionWasInterrupted = a3;
}

- (void)setSwitchTasksQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_switchTasksQueue, 0);
  objc_storeStrong((id *)&self->_pairingID, 0);
  objc_storeStrong((id *)&self->_queueManager, 0);
  objc_storeStrong((id *)&self->_currentComplicationUserInfoTransfer, 0);
  objc_storeStrong((id *)&self->_internalOutstandingFileTransfers, 0);
  objc_storeStrong((id *)&self->_internalOutstandingUserInfoTransfers, 0);
  objc_storeStrong((id *)&self->_currentMessageIdentifiersAwaitingReply, 0);
  objc_storeStrong((id *)&self->_currentMessages, 0);
  objc_storeStrong((id *)&self->_workOperationQueue, 0);
  objc_storeStrong((id *)&self->_backgroundWorkOperationQueue, 0);
  objc_storeStrong((id *)&self->_delegateOperationQueue, 0);
  objc_storeStrong((id *)&self->_receivedApplicationContext, 0);
  objc_storeStrong((id *)&self->_applicationContext, 0);
  objc_storeStrong((id *)&self->_watchDirectoryURL, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

void __28__WCSession_activateSession__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_222A02000, v0, v1, "denying activation due to missing delegate", v2, v3, v4, v5, v6);
}

void __28__WCSession_activateSession__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_222A02000, v0, v1, "already in progress or activated", v2, v3, v4, v5, v6);
}

void __28__WCSession_activateSession__block_invoke_cold_3()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_222A02000, v0, v1, "activate session semaphore timed out", v2, v3, v4, v5, v6);
}

void __28__WCSession_activateSession__block_invoke_cold_4()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_222A02000, v0, v1, "denying activation as it is not supported on this device type", v2, v3, v4, v5, v6);
}

void __28__WCSession_activateSession__block_invoke_20_cold_1()
{
  OUTLINED_FUNCTION_14(*MEMORY[0x263EF8340]);
  v0 = NSPrintF();
  v3[0] = 136446466;
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7(&dword_222A02000, v1, v2, "%{public}s sessionReadyForInitialStateWithCompletionHandler failed due to %{public}@", (uint8_t *)v3);
}

- (void)onqueue_removeOutstandingUserInfoTransfer:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_222A02000, v0, v1, "no pairingID", v2, v3, v4, v5, v6);
}

void __60__WCSession_observeValueForKeyPath_ofObject_change_context___block_invoke_cold_1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136446210;
  uint64_t v2 = "-[WCSession observeValueForKeyPath:ofObject:change:context:]_block_invoke";
  _os_log_error_impl(&dword_222A02000, log, OS_LOG_TYPE_ERROR, "%{public}s Observered item isn't of class WCSessionFileTransfer", (uint8_t *)&v1, 0xCu);
}

- (void)sendMessage:(void *)a1 replyHandler:errorHandler:.cold.1(void *a1)
{
  [a1 UTF8String];
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3(&dword_222A02000, v1, v2, "EXCEPTION: %s", v3, v4, v5, v6, v7);
}

void __44__WCSession_updateApplicationContext_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_14(*MEMORY[0x263EF8340]);
  v0 = NSPrintF();
  v3[0] = 136446466;
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7(&dword_222A02000, v1, v2, "%{public}s failed due to %{public}@", (uint8_t *)v3);
}

void __44__WCSession_updateApplicationContext_error___block_invoke_80_cold_1()
{
  OUTLINED_FUNCTION_14(*MEMORY[0x263EF8340]);
  v0 = NSPrintF();
  v3[0] = 136446466;
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7(&dword_222A02000, v1, v2, "%{public}s xpc failed due to %{public}@", (uint8_t *)v3);
}

void __67__WCSession_onqueue_sendResponseData_identifier_dictionaryMessage___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_14(*MEMORY[0x263EF8340]);
  v0 = NSPrintF();
  v3[0] = 136446466;
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7(&dword_222A02000, v1, v2, "%{public}s failed due to %{public}@", (uint8_t *)v3);
}

- (void)_onqueue_sendResponseError:identifier:dictionaryMessage:.cold.1()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v0 = NSPrintF();
  v3[0] = 136446722;
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_2(&dword_222A02000, v1, v2, "%{public}s identifier: %{public}@ with %{public}@", (uint8_t *)v3);
}

void __69__WCSession__onqueue_sendResponseError_identifier_dictionaryMessage___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_14(*MEMORY[0x263EF8340]);
  v0 = NSPrintF();
  v3[0] = 136446466;
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7(&dword_222A02000, v1, v2, "%{public}s failed due to %{public}@", (uint8_t *)v3);
}

void __44__WCSession_xpcConnectionRestoredWithState___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_16();
  uint64_t v2 = [(id)OUTLINED_FUNCTION_15(v1) pairingID];
  uint64_t v3 = [*v0 pairingID];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_222A02000, v4, v5, "%{public}s dropping as pairingIDs no longer match. pairingID %{public}@, client pairingID: %{public}@", v6, v7, v8, v9, 2u);
}

void __27__WCSession_handleRequest___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_18(*MEMORY[0x263EF8340]);
  int v2 = 138543362;
  uint64_t v3 = v0;
  _os_log_fault_impl(&dword_222A02000, v1, OS_LOG_TYPE_FAULT, "dropping incoming request %{public}@ as it was not intended for the currently active session.", (uint8_t *)&v2, 0xCu);
}

- (void)onqueue_handleDictionaryMessageRequest:(void *)a1 withPairingID:.cold.1(void *a1)
{
  [a1 UTF8String];
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3(&dword_222A02000, v1, v2, "EXCEPTION: %s", v3, v4, v5, v6, v7);
}

void __66__WCSession_onqueue_handleDictionaryMessageRequest_withPairingID___block_invoke_cold_1(id *a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v1 = [*a1 delegate];
  uint64_t v2 = [(id)objc_opt_class() description];
  v5[0] = 136446466;
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_7(&dword_222A02000, v3, v4, "%{public}s delegate %{public}@ does not implement delegate method", (uint8_t *)v5);
}

void __66__WCSession_onqueue_handleDictionaryMessageRequest_withPairingID___block_invoke_cold_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_5(a1, a2), "pairingID");
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_222A02000, v3, v4, "%{public}s dropping as pairingIDs no longer match. pairingID %{public}@, client pairingID: %{public}@", v5, v6, v7, v8, 2u);
}

void __66__WCSession_onqueue_handleDictionaryMessageRequest_withPairingID___block_invoke_98_cold_1()
{
  OUTLINED_FUNCTION_18(*MEMORY[0x263EF8340]);
  v1[0] = 136446466;
  OUTLINED_FUNCTION_17();
  _os_log_error_impl(&dword_222A02000, v0, OS_LOG_TYPE_ERROR, "%{public}s attempting to respond to requestIdentifier %{public}@ multiple times", (uint8_t *)v1, 0x16u);
}

void __66__WCSession_onqueue_handleDictionaryMessageRequest_withPairingID___block_invoke_98_cold_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_5(a1, a2), "pairingID");
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_222A02000, v3, v4, "%{public}s dropping as pairingIDs no longer match. pairingID %{public}@, client pairingID: %{public}@", v5, v6, v7, v8, 2u);
}

- (void)onqueue_handleDataMessageRequest:(void *)a1 withPairingID:.cold.1(void *a1)
{
  [a1 UTF8String];
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3(&dword_222A02000, v1, v2, "EXCEPTION: %s", v3, v4, v5, v6, v7);
}

void __60__WCSession_onqueue_handleDataMessageRequest_withPairingID___block_invoke_cold_1(id *a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v1 = [*a1 delegate];
  uint64_t v2 = [(id)objc_opt_class() description];
  v5[0] = 136446466;
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_7(&dword_222A02000, v3, v4, "%{public}s delegate %{public}@ does not implement delegate method", (uint8_t *)v5);
}

void __60__WCSession_onqueue_handleDataMessageRequest_withPairingID___block_invoke_cold_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_5(a1, a2), "pairingID");
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_222A02000, v3, v4, "%{public}s dropping as pairingIDs no longer match. pairingID %{public}@, client pairingID: %{public}@", v5, v6, v7, v8, 2u);
}

void __60__WCSession_onqueue_handleDataMessageRequest_withPairingID___block_invoke_107_cold_1()
{
  OUTLINED_FUNCTION_18(*MEMORY[0x263EF8340]);
  v1[0] = 136446466;
  OUTLINED_FUNCTION_17();
  _os_log_error_impl(&dword_222A02000, v0, OS_LOG_TYPE_ERROR, "%{public}s attempting to respond to requestIdentifier %{public}@ multiple times", (uint8_t *)v1, 0x16u);
}

void __60__WCSession_onqueue_handleDataMessageRequest_withPairingID___block_invoke_107_cold_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_5(a1, a2), "pairingID");
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_222A02000, v3, v4, "%{public}s dropping as pairingIDs no longer match. pairingID %{public}@, client pairingID: %{public}@", v5, v6, v7, v8, 2u);
}

void __28__WCSession_handleResponse___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_18(*MEMORY[0x263EF8340]);
  int v2 = 138543362;
  uint64_t v3 = v0;
  _os_log_fault_impl(&dword_222A02000, v1, OS_LOG_TYPE_FAULT, "dropping incoming response %{public}@ as it was not intended for the currently active session.", (uint8_t *)&v2, 0xCu);
}

void __67__WCSession_onqueue_handleResponseDictionary_record_withPairingID___block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  int v2 = objc_msgSend((id)OUTLINED_FUNCTION_5(a1, a2), "pairingID");
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_222A02000, v3, v4, "%{public}s dropping as pairingIDs no longer match. pairingID %{public}@, client pairingID: %{public}@", v5, v6, v7, v8, 2u);
}

void __61__WCSession_onqueue_handleResponseData_record_withPairingID___block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  int v2 = objc_msgSend((id)OUTLINED_FUNCTION_5(a1, a2), "pairingID");
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_222A02000, v3, v4, "%{public}s dropping as pairingIDs no longer match. pairingID %{public}@, client pairingID: %{public}@", v5, v6, v7, v8, 2u);
}

void __51__WCSession_handleApplicationContextWithPairingID___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_222A02000, v0, v1, "Application context data is nil", v2, v3, v4, v5, v6);
}

void __51__WCSession_handleApplicationContextWithPairingID___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_222A02000, v0, v1, "failed to deserialize payload", v2, v3, v4, v5, v6);
}

void __51__WCSession_handleApplicationContextWithPairingID___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_16();
  uint64_t v2 = [(id)OUTLINED_FUNCTION_15(v1) delegate];
  uint64_t v3 = [(id)objc_opt_class() description];
  uint64_t v4 = NSStringFromSelector(v0);
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_1(&dword_222A02000, v5, v6, "%{public}s delegate %{public}@ does not implement %{public}@", v7, v8, v9, v10, 2u);
}

void __51__WCSession_handleApplicationContextWithPairingID___block_invoke_2_cold_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_5(a1, a2), "pairingID");
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_222A02000, v3, v4, "%{public}s dropping as pairingIDs no longer match. pairingID %{public}@, client pairingID: %{public}@", v5, v6, v7, v8, 2u);
}

void __45__WCSession_handleIncomingFileWithPairingID___block_invoke_2_cold_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_5(a1, a2), "pairingID");
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_222A02000, v3, v4, "%{public}s dropping as pairingIDs no longer match. pairingID %{public}@, client pairingID: %{public}@", v5, v6, v7, v8, 2u);
}

void __45__WCSession_handleIncomingFileWithPairingID___block_invoke_115_cold_1()
{
  OUTLINED_FUNCTION_16();
  uint64_t v2 = [(id)OUTLINED_FUNCTION_15(v1) delegate];
  uint64_t v3 = [(id)objc_opt_class() description];
  uint64_t v4 = NSStringFromSelector(v0);
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_1(&dword_222A02000, v5, v6, "%{public}s delegate %{public}@ does not implement %{public}@, discarding incoming content", v7, v8, v9, v10, 2u);
}

void __45__WCSession_handleIncomingFileWithPairingID___block_invoke_115_cold_2(void *a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v1 = [a1 fileURL];
  uint64_t v2 = [v1 path];
  v5[0] = 136446466;
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_7(&dword_222A02000, v3, v4, "%{public}s file doesn't exist for record %{public}@", (uint8_t *)v5);
}

void __45__WCSession_handleIncomingFileWithPairingID___block_invoke_115_cold_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_5(a1, a2), "pairingID");
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_222A02000, v3, v4, "%{public}s dropping as pairingIDs no longer match. pairingID %{public}@, client pairingID: %{public}@", v5, v6, v7, v8, 2u);
}

void __43__WCSession_handleFileResultWithPairingID___block_invoke_2_cold_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_5(a1, a2), "pairingID");
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_222A02000, v3, v4, "%{public}s dropping as pairingIDs no longer match. pairingID %{public}@, client pairingID: %{public}@", v5, v6, v7, v8, 2u);
}

void __43__WCSession_handleFileResultWithPairingID___block_invoke_119_cold_1(uint64_t a1, void *a2, _DWORD *a3)
{
  *a3 = 136446722;
  OUTLINED_FUNCTION_13(a1, (uint64_t)a2, (uint64_t)a3);
  _os_log_error_impl(&dword_222A02000, v5, OS_LOG_TYPE_ERROR, "%{public}s dropping as pairingIDs no longer match. pairingID %{public}@, client pairingID: %{public}@", v4, 0x20u);
}

void __43__WCSession_handleFileResultWithPairingID___block_invoke_119_cold_2()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_222A02000, v0, v1, "could not find session file transfer in internal outstanding list. Proceeding with one returned from the index", v2, v3, v4, v5, v6);
}

void __43__WCSession_handleFileResultWithPairingID___block_invoke_119_cold_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_5(a1, a2), "pairingID");
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_222A02000, v3, v4, "%{public}s dropping as pairingIDs no longer match. pairingID %{public}@, client pairingID: %{public}@", v5, v6, v7, v8, 2u);
}

void __49__WCSession_handleIncomingUserInfoWithPairingID___block_invoke_2_cold_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_5(a1, a2), "pairingID");
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_222A02000, v3, v4, "%{public}s dropping as pairingIDs no longer match. pairingID %{public}@, client pairingID: %{public}@", v5, v6, v7, v8, 2u);
}

void __49__WCSession_handleIncomingUserInfoWithPairingID___block_invoke_127_cold_1()
{
  OUTLINED_FUNCTION_16();
  uint64_t v2 = [(id)OUTLINED_FUNCTION_15(v1) delegate];
  uint64_t v3 = [(id)objc_opt_class() description];
  uint64_t v4 = NSStringFromSelector(v0);
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_1(&dword_222A02000, v5, v6, "%{public}s delegate %{public}@ does not implement %{public}@, discarding incoming content", v7, v8, v9, v10, 2u);
}

void __49__WCSession_handleIncomingUserInfoWithPairingID___block_invoke_127_cold_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_5(a1, a2), "pairingID");
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_222A02000, v3, v4, "%{public}s dropping as pairingIDs no longer match. pairingID %{public}@, client pairingID: %{public}@", v5, v6, v7, v8, 2u);
}

void __47__WCSession_handleUserInfoResultWithPairingID___block_invoke_2_cold_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_5(a1, a2), "pairingID");
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_222A02000, v3, v4, "%{public}s dropping as pairingIDs no longer match. pairingID %{public}@, client pairingID: %{public}@", v5, v6, v7, v8, 2u);
}

void __47__WCSession_handleUserInfoResultWithPairingID___block_invoke_131_cold_1(uint64_t a1, void *a2, _DWORD *a3)
{
  *a3 = 136446722;
  OUTLINED_FUNCTION_13(a1, (uint64_t)a2, (uint64_t)a3);
  _os_log_error_impl(&dword_222A02000, v5, OS_LOG_TYPE_ERROR, "%{public}s dropping as pairingIDs no longer match. pairingID %{public}@, client pairingID: %{public}@", v4, 0x20u);
}

void __47__WCSession_handleUserInfoResultWithPairingID___block_invoke_131_cold_2()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_222A02000, v0, v1, "could not find user info result in internal outstanding list. Proceeding with one returned from the index", v2, v3, v4, v5, v6);
}

void __47__WCSession_handleUserInfoResultWithPairingID___block_invoke_131_cold_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_5(a1, a2), "pairingID");
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_222A02000, v3, v4, "%{public}s dropping as pairingIDs no longer match. pairingID %{public}@, client pairingID: %{public}@", v5, v6, v7, v8, 2u);
}

- (void)onqueue_completeSwitchTask:(os_log_t)log withSessionState:.cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136446210;
  uint64_t v2 = "-[WCSession onqueue_completeSwitchTask:withSessionState:]";
  _os_log_error_impl(&dword_222A02000, log, OS_LOG_TYPE_ERROR, "%{public}s activateSession failed, companion iphone app not installed ", (uint8_t *)&v1, 0xCu);
}

- (void)onqueue_handleMessageCompletionWithError:withMessageID:.cold.1()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  uint64_t v0 = NSPrintF();
  v3[0] = 136446722;
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_2(&dword_222A02000, v1, v2, "%{public}s %{public}@ due to %{public}@", (uint8_t *)v3);
}

void __70__WCSession__onqueue_notifyOfMessageError_messageID_withErrorHandler___block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_5(a1, a2), "pairingID");
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_222A02000, v3, v4, "%{public}s dropping as pairingIDs no longer match. pairingID %{public}@, client pairingID: %{public}@", v5, v6, v7, v8, 2u);
}

- (void)notifyOfFileError:withFileTransfer:.cold.1()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  uint64_t v0 = NSPrintF();
  v3[0] = 136446722;
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_2(&dword_222A02000, v1, v2, "%{public}s %{public}@ with %{public}@", (uint8_t *)v3);
}

void __56__WCSession_onqueue_notifyOfFileError_withFileTransfer___block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_5(a1, a2), "pairingID");
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_222A02000, v3, v4, "%{public}s dropping as pairingIDs no longer match. pairingID %{public}@, client pairingID: %{public}@", v5, v6, v7, v8, 2u);
}

- (void)notifyOfUserInfoError:withUserInfoTransfer:.cold.1()
{
  OUTLINED_FUNCTION_14(*MEMORY[0x263EF8340]);
  uint64_t v0 = NSPrintF();
  v3[0] = 136446466;
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7(&dword_222A02000, v1, v2, "%{public}s error: %{public}@", (uint8_t *)v3);
}

void __64__WCSession_onqueue_notifyOfUserInfoError_withUserInfoTransfer___block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_5(a1, a2), "pairingID");
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_222A02000, v3, v4, "%{public}s dropping as pairingIDs no longer match. pairingID %{public}@, client pairingID: %{public}@", v5, v6, v7, v8, 2u);
}

- (void)logAndTestIfUnactivatedOrMissingDelegate
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_222A02000, v0, v1, "WCSession is missing its delegate", v2, v3, v4, v5, v6);
}

- (void)errorIfNotReachable
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_222A02000, v0, v1, "WCSession is not reachable", v2, v3, v4, v5, v6);
}

@end