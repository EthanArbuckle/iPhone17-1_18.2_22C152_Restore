@interface SYSession
+ (id)allocWithZone:(_NSZone *)a3;
+ (id)unarchiveMetadata:(id)a3;
- (BOOL)_beginTransaction;
- (BOOL)_endTransaction;
- (BOOL)_handleEndSessionResponse:(id)a3 error:(id *)a4;
- (BOOL)_handleRestartSessionResponse:(id)a3 error:(id *)a4;
- (BOOL)_handleStartSessionResponse:(id)a3 error:(id *)a4;
- (BOOL)_handleSyncBatchResponse:(id)a3 error:(id *)a4;
- (BOOL)_readyToProcessIncomingMessages;
- (BOOL)_willAcquiesceToNewSessionFromPeer:(id)a3;
- (BOOL)canRestart;
- (BOOL)canRollback;
- (BOOL)hasRejectedPeerSession;
- (BOOL)isResetSync;
- (BOOL)isSending;
- (BOOL)wasCancelled;
- (NSDictionary)options;
- (NSDictionary)sessionMetadata;
- (NSDictionary)userContext;
- (NSDictionary)wrappedUserContext;
- (NSError)error;
- (NSMutableDictionary)peerGenerationIDs;
- (NSString)identifier;
- (NSString)reason;
- (OS_dispatch_queue)queue;
- (OS_dispatch_queue)targetQueue;
- (PBCodable)stateForLogging;
- (SYChangeSerializer)serializer;
- (SYService)service;
- (SYSession)initWithService:(id)a3;
- (SYSessionDelegate)delegate;
- (double)birthDate;
- (double)fullSessionTimeout;
- (double)perMessageTimeout;
- (double)remainingSessionTime;
- (id)CPSafeDescription;
- (id)_cancelPendingMessagesReturningFailures;
- (id)changeFromData:(id)a3 ofType:(int64_t)a4;
- (id)combinedEngineOptions:(id)a3;
- (id)dataFromChange:(id)a3;
- (id)decodeChangeData:(id)a3 fromProtocolVersion:(int64_t)a4 ofType:(int64_t)a5;
- (id)encodeSYChangeForBackwardCompatibility:(id)a3 protocolVersion:(int64_t)a4;
- (id)stateResponders;
- (int64_t)maxConcurrentMessages;
- (int64_t)priority;
- (unint64_t)protocolVersion;
- (unint64_t)sentChangeByteCount;
- (unint64_t)sentChangeCount;
- (unint64_t)sessionSignpost;
- (unsigned)state;
- (void)_beginTransaction;
- (void)_clearOutgoingMessageUUID:(id)a3;
- (void)_continue;
- (void)_endTransaction;
- (void)_handleEndSession:(id)a3 response:(id)a4 completion:(id)a5;
- (void)_handleError:(id)a3;
- (void)_handleRestartSession:(id)a3 response:(id)a4 completion:(id)a5;
- (void)_handleSyncBatch:(id)a3 response:(id)a4 completion:(id)a5;
- (void)_onSessionStateChangedTo:(unsigned int)a3 do:(id)a4;
- (void)_pause;
- (void)_recordOutgoingMessageUUID:(id)a3;
- (void)_supercededWithSession:(id)a3;
- (void)cancel;
- (void)cancelWithError:(id)a3;
- (void)dealloc;
- (void)didStartSession;
- (void)setBirthDate:(double)a3;
- (void)setCanRestart:(BOOL)a3;
- (void)setCanRollback:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setError:(id)a3;
- (void)setFullSessionTimeout:(double)a3;
- (void)setHasRejectedPeerSession:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setMaxConcurrentMessages:(int64_t)a3;
- (void)setOptions:(id)a3;
- (void)setPeerGenerationIDs:(id)a3;
- (void)setPerMessageTimeout:(double)a3;
- (void)setPriority:(int64_t)a3;
- (void)setReason:(id)a3;
- (void)setSerializer:(id)a3;
- (void)setSessionMetadata:(id)a3;
- (void)setSessionSignpost:(unint64_t)a3;
- (void)setState:(unsigned int)a3;
- (void)setTargetQueue:(id)a3;
- (void)setUserContext:(id)a3;
- (void)start:(id)a3;
@end

@implementation SYSession

+ (id)allocWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class()) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498] format:@"SYSession is an abstract class. Please instantiate the correct subclass for your use case."];
  }
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___SYSession;
  return objc_msgSendSuper2(&v7, sel_allocWithZone_, a3);
}

- (SYSession)initWithService:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)SYSession;
  uint64_t v5 = [(SYSession *)&v24 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_service, v4);
    v6->_priority = [v4 priority];
    *(_OWORD *)&v6->_perMessageTimeout = xmmword_21C87B510;
    uint64_t v7 = [objc_alloc(MEMORY[0x263EFF9C0]) initWithCapacity:16];
    pendingMessageIDs = v6->_pendingMessageIDs;
    v6->_pendingMessageIDs = (NSMutableSet *)v7;

    uint64_t v9 = [objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:1];
    peerGenerationIDs = v6->_peerGenerationIDs;
    v6->_peerGenerationIDs = (NSMutableDictionary *)v9;

    v6->_setDelegateLock._os_unfair_lock_opaque = 0;
    v11 = [v4 name];
    id v12 = [v11 lastPathComponent];
    snprintf(__str, 0x80uLL, "%s Session Queue", (const char *)[v12 UTF8String]);

    v13 = [v4 queue];
    dispatch_qos_class_t qos_class = dispatch_queue_get_qos_class(v13, 0);

    v15 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v16 = v15;
    if (qos_class)
    {
      uint64_t v17 = dispatch_queue_attr_make_with_qos_class(v15, qos_class, 0);

      v16 = v17;
    }
    dispatch_queue_t v18 = dispatch_queue_create(__str, v16);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v18;

    +[SYQueueDumper registerQueue:v6->_queue];
    uint64_t v20 = MakeDefaultDelegateQueue(v4);
    delegateQueue = v6->_delegateQueue;
    v6->_delegateQueue = (OS_dispatch_queue *)v20;

    +[SYQueueDumper registerQueue:v6->_delegateQueue];
    v6->_birthDate = CFAbsoluteTimeGetCurrent();
    [(SYSession *)v6 _beginTransaction];
    v22 = v6;
  }
  return v6;
}

- (void)dealloc
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v1 = a1;
  v2 = (objc_class *)objc_opt_class();
  v3 = NSStringFromClass(v2);
  int v4 = 138543362;
  uint64_t v5 = v3;
  _os_log_error_impl(&dword_21C7C9000, v1, (os_log_type_t)0x90u, "-[%{public}@ dealloc]: XPC transaction wasn't ended prior to -dealloc", (uint8_t *)&v4, 0xCu);
}

- (BOOL)_beginTransaction
{
  char v2 = 0;
  atomic_compare_exchange_strong((atomic_uchar *volatile)&self->_inTransaction, (unsigned __int8 *)&v2, 1u);
  BOOL v3 = v2 == 0;
  if (!v2)
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    uint64_t v5 = qword_26AB04788;
    if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEBUG)) {
      [(SYSession *)(uint64_t)self _beginTransaction];
    }
    uint64_t v6 = (OS_os_transaction *)os_transaction_create();
    transaction = self->_transaction;
    self->_transaction = v6;
  }
  return v3;
}

- (BOOL)_endTransaction
{
  int v2 = 1;
  atomic_compare_exchange_strong((atomic_uchar *volatile)&self->_inTransaction, (unsigned __int8 *)&v2, 0);
  BOOL v3 = v2 == 1;
  if (v2 == 1)
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    uint64_t v5 = qword_26AB04788;
    if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEBUG)) {
      [(SYSession *)(uint64_t)self _endTransaction];
    }
    transaction = self->_transaction;
    self->_transaction = 0;
  }
  return v3;
}

- (void)_recordOutgoingMessageUUID:(id)a3
{
  id v4 = a3;
  if (![(SYSession *)self wasCancelled])
  {
    if (v4)
    {
      [(NSMutableSet *)self->_pendingMessageIDs addObject:v4];
    }
    else
    {
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      uint64_t v5 = qword_26AB04788;
      if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_ERROR)) {
        -[SYSession _recordOutgoingMessageUUID:](v5);
      }
    }
  }
}

- (void)_clearOutgoingMessageUUID:(id)a3
{
  id v4 = a3;
  if (![(SYSession *)self wasCancelled]) {
    [(NSMutableSet *)self->_pendingMessageIDs removeObject:v4];
  }
}

- (id)_cancelPendingMessagesReturningFailures
{
  BOOL v3 = [(SYSession *)self service];
  id v4 = [v3 syncEngine];
  uint64_t v5 = [v4 cancelMessagesReturningFailures:self->_pendingMessageIDs];

  return v5;
}

- (id)dataFromChange:(id)a3
{
  id v4 = a3;
  serializer = self->_serializer;
  if (serializer)
  {
    uint64_t v6 = [(SYChangeSerializer *)serializer dataFromChange:v4];
LABEL_5:
    uint64_t v7 = (void *)v6;
    goto LABEL_7;
  }
  if ([v4 conformsToProtocol:&unk_26CD34710])
  {
    uint64_t v6 = [MEMORY[0x263F08910] archivedDataWithRootObject:v4 requiringSecureCoding:1 error:0];
    goto LABEL_5;
  }
  [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498], @"SYSession cannot encode change objects of type '%@'", objc_opt_class() format];
  uint64_t v7 = 0;
LABEL_7:

  return v7;
}

- (id)changeFromData:(id)a3 ofType:(int64_t)a4
{
  id v6 = a3;
  serializer = self->_serializer;
  if (!serializer)
  {
    id v10 = objc_alloc(MEMORY[0x263EFF940]);
    objc_exception_throw((id)[v10 initWithName:*MEMORY[0x263EFF498] reason:@"SYSession does not have a serializer. You must set a serializer before starting a session." userInfo:0]);
  }
  v8 = [(SYChangeSerializer *)serializer changeFromData:v6 ofType:a4];

  return v8;
}

- (id)encodeSYChangeForBackwardCompatibility:(id)a3 protocolVersion:(int64_t)a4
{
  id v6 = a3;
  if (self->_serializer && (objc_opt_respondsToSelector() & 1) != 0)
  {
    uint64_t v7 = [(SYChangeSerializer *)self->_serializer encodeSYChangeForBackwardCompatibility:v6 protocolVersion:a4];
LABEL_11:
    v8 = (void *)v7;
    goto LABEL_12;
  }
  if (a4 == 2)
  {
    uint64_t v7 = [(SYSession *)self dataFromChange:v6];
    goto LABEL_11;
  }
  if (self->_serializer && (objc_opt_respondsToSelector() & 1) != 0)
  {
    uint64_t v7 = [(SYChangeSerializer *)self->_serializer dataWithSYObject:v6];
    goto LABEL_11;
  }
  if ([v6 conformsToProtocol:&unk_26CD34710])
  {
    uint64_t v7 = [MEMORY[0x263F08910] archivedDataWithRootObject:v6 requiringSecureCoding:1 error:0];
    goto LABEL_11;
  }
  [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498], @"SYSession cannot encode change objects of type '%@' for protocol version %ld", objc_opt_class(), a4 format];
  v8 = 0;
LABEL_12:

  return v8;
}

- (id)decodeChangeData:(id)a3 fromProtocolVersion:(int64_t)a4 ofType:(int64_t)a5
{
  id v8 = a3;
  if (self->_serializer && (objc_opt_respondsToSelector() & 1) != 0)
  {
    uint64_t v9 = [(SYChangeSerializer *)self->_serializer decodeChangeData:v8 fromProtocolVersion:a4 ofType:a5];
  }
  else if (a4 == 2)
  {
    uint64_t v9 = [(SYSession *)self changeFromData:v8 ofType:a5];
  }
  else
  {
    if (!self->_serializer || (objc_opt_respondsToSelector() & 1) == 0)
    {
      id v12 = objc_alloc(MEMORY[0x263EFF940]);
      objc_exception_throw((id)[v12 initWithName:*MEMORY[0x263EFF498] reason:@"SYSession does not have a serializer. You must set a serializer before starting a session." userInfo:0]);
    }
    uint64_t v9 = [(SYChangeSerializer *)self->_serializer SYObjectWithData:v8];
  }
  id v10 = (void *)v9;

  return v10;
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  os_unfair_lock_lock(&self->_setDelegateLock);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    uint64_t v5 = obj;
    if (obj)
    {
      if ((objc_opt_respondsToSelector() & 1) == 0 && [(SYSession *)self isSending]) {
        [(SYSession *)self setCanRestart:0];
      }
      char v6 = objc_opt_respondsToSelector();
      uint64_t v5 = obj;
      if ((v6 & 1) == 0)
      {
        [(SYSession *)self setCanRollback:0];
        uint64_t v5 = obj;
      }
    }
    objc_storeWeak((id *)&self->_delegate, v5);
  }
  os_unfair_lock_unlock(&self->_setDelegateLock);
}

- (OS_dispatch_queue)targetQueue
{
  return self->_delegateQueue;
}

- (void)setTargetQueue:(id)a3
{
  id v4 = (OS_dispatch_queue *)a3;
  p_delegateQueue = &self->_delegateQueue;
  if (self->_delegateQueue != v4)
  {
    if (!v4)
    {
      char v6 = [(SYSession *)self service];
      MakeDefaultDelegateQueue(v6);
      id obj = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue();

      id v4 = obj;
    }
    obja = v4;
    objc_storeStrong((id *)p_delegateQueue, v4);
    id v4 = obja;
  }
}

- (unint64_t)protocolVersion
{
  return 2;
}

- (BOOL)wasCancelled
{
  return [(SYSession *)self state] == 3;
}

- (double)remainingSessionTime
{
  [(SYSession *)self fullSessionTimeout];
  if (v3 == 0.0) {
    return 1.79769313e308;
  }
  double v5 = v3 + self->_birthDate;
  return v5 - CFAbsoluteTimeGetCurrent();
}

- (NSDictionary)wrappedUserContext
{
  double v3 = [(SYSession *)self userContext];
  id v4 = (void *)[v3 mutableCopy];

  double v5 = [(SYSession *)self identifier];
  char v6 = v5;
  if (v4)
  {
    [v4 setObject:v5 forKeyedSubscript:@"AssociatedSessionIdentifier"];

    id v7 = v4;
  }
  else
  {
    UserInfoDictionaryWithAssociatedSessionID(v5);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  return (NSDictionary *)v7;
}

- (unint64_t)sentChangeByteCount
{
  return 0;
}

- (unint64_t)sentChangeCount
{
  return 0;
}

- (void)cancel
{
  id v3 = (id)[objc_alloc(MEMORY[0x263F087E8]) initWithSYError:-128 userInfo:0];
  [(SYSession *)self cancelWithError:v3];
}

- (void)_pause
{
  char v2 = 0;
  uint64_t v11 = *MEMORY[0x263EF8340];
  atomic_compare_exchange_strong((atomic_uchar *volatile)&self->_paused, (unsigned __int8 *)&v2, 1u);
  if (!v2)
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    id v4 = (void *)qword_26AB04788;
    if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEFAULT))
    {
      double v5 = v4;
      char v6 = _SYObfuscate(self);
      *(_DWORD *)buf = 138543362;
      id v10 = v6;
      _os_log_impl(&dword_21C7C9000, v5, OS_LOG_TYPE_DEFAULT, "Pausing %{public}@ ...", buf, 0xCu);
    }
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __19__SYSession__pause__block_invoke;
    block[3] = &unk_264422AB0;
    block[4] = self;
    dispatch_barrier_sync(queue, block);
  }
}

void __19__SYSession__pause__block_invoke(uint64_t a1)
{
}

- (void)_continue
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v2 = 1;
  atomic_compare_exchange_strong((atomic_uchar *volatile)&self->_paused, (unsigned __int8 *)&v2, 0);
  if (v2 == 1)
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    id v4 = (void *)qword_26AB04788;
    if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEFAULT))
    {
      double v5 = v4;
      char v6 = _SYObfuscate(self);
      int v7 = 138543362;
      id v8 = v6;
      _os_log_impl(&dword_21C7C9000, v5, OS_LOG_TYPE_DEFAULT, "... Resuming %{public}@", (uint8_t *)&v7, 0xCu);
    }
    dispatch_resume((dispatch_object_t)self->_queue);
  }
}

- (BOOL)_readyToProcessIncomingMessages
{
  unsigned int v3 = [(SYSession *)self state];
  BOOL result = 0;
  switch(v3)
  {
    case 1u:
    case 0xAu:
      BOOL result = ![(SYSession *)self isSending];
      break;
    case 6u:
    case 7u:
      BOOL result = [(SYSession *)self isSending];
      break;
    default:
      return result;
  }
  return result;
}

- (BOOL)_willAcquiesceToNewSessionFromPeer:(id)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v4 = a3;
  peerGenerationIDs = self->_peerGenerationIDs;
  char v6 = [v4 peerID];
  int v7 = [(NSMutableDictionary *)peerGenerationIDs objectForKeyedSubscript:v6];

  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  id v8 = (void *)qword_26AB04788;
  if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEBUG))
  {
    v22 = v8;
    v23 = [(SYSession *)self identifier];
    unsigned int v24 = [(SYSession *)self state];
    v25 = [v4 generationID];
    int v33 = 138544130;
    v34 = v23;
    __int16 v35 = 1024;
    *(_DWORD *)v36 = v24;
    *(_WORD *)&v36[4] = 2114;
    *(void *)&v36[6] = v7;
    *(_WORD *)&v36[14] = 2114;
    *(void *)&v36[16] = v25;
    _os_log_debug_impl(&dword_21C7C9000, v22, OS_LOG_TYPE_DEBUG, "Session acquiescense test: %{public}@, %{companionsync:SYSessionState}d, my generation %{public}@, new generation %{public}@", (uint8_t *)&v33, 0x26u);

    if (v7)
    {
LABEL_5:
      if (([v4 hasGenerationID] & 1) == 0)
      {
        if (_sync_log_facilities_pred != -1) {
          _os_once();
        }
        v16 = (void *)qword_26AB04788;
        if (!os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_INFO)) {
          goto LABEL_17;
        }
        uint64_t v17 = v16;
        dispatch_queue_t v18 = [(SYSession *)self identifier];
        int v33 = 138543362;
        v34 = v18;
        v19 = "Session %{public}@ rejecting new session; no peer generation ID";
        goto LABEL_16;
      }
      uint64_t v9 = [v4 generationID];
      char v10 = [v7 isEqualToString:v9];

      if ((v10 & 1) == 0)
      {
        if (_sync_log_facilities_pred != -1) {
          _os_once();
        }
        uint64_t v20 = (void *)qword_26AB04788;
        BOOL v12 = 1;
        if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_INFO))
        {
          v13 = v20;
          v14 = [(SYSession *)self identifier];
          v21 = [v4 generationID];
          int v33 = 138543874;
          v34 = v14;
          __int16 v35 = 2114;
          *(void *)v36 = v21;
          *(_WORD *)&v36[8] = 2114;
          *(void *)&v36[10] = v7;
          _os_log_impl(&dword_21C7C9000, v13, OS_LOG_TYPE_INFO, "Session %{public}@ acquiescing to new session; new generation ID %{public}@ does not match current %{public}@",
            (uint8_t *)&v33,
            0x20u);

LABEL_35:
          goto LABEL_36;
        }
        goto LABEL_36;
      }
      if (self->_rejectedNewSessionFromSamePeer)
      {
        if (_sync_log_facilities_pred != -1) {
          _os_once();
        }
        uint64_t v11 = (void *)qword_26AB04788;
        BOOL v12 = 1;
        if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_INFO))
        {
          v13 = v11;
          v14 = [(SYSession *)self identifier];
          int v33 = 138543362;
          v34 = v14;
          v15 = "Session %{public}@ acquiescing to new session; second strike";
LABEL_34:
          _os_log_impl(&dword_21C7C9000, v13, OS_LOG_TYPE_INFO, v15, (uint8_t *)&v33, 0xCu);
          goto LABEL_35;
        }
        goto LABEL_36;
      }
      self->_rejectedNewSessionFromSamePeer = 1;
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      v31 = (void *)qword_26AB04788;
      if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_INFO))
      {
        uint64_t v17 = v31;
        dispatch_queue_t v18 = [(SYSession *)self identifier];
        int v33 = 138543362;
        v34 = v18;
        v19 = "Session %{public}@ rejecting new session: first strike";
LABEL_16:
        _os_log_impl(&dword_21C7C9000, v17, OS_LOG_TYPE_INFO, v19, (uint8_t *)&v33, 0xCu);

        goto LABEL_17;
      }
      goto LABEL_17;
    }
  }
  else if (v7)
  {
    goto LABEL_5;
  }
  if ([(SYSession *)self isSending])
  {
    unsigned int v26 = [(SYSession *)self state];
    if (v26 == 6)
    {
      if (self->_rejectedNewSessionFromSamePeer)
      {
        if (_sync_log_facilities_pred != -1) {
          _os_once();
        }
        v30 = (void *)qword_26AB04788;
        BOOL v12 = 1;
        if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_INFO))
        {
          v13 = v30;
          v14 = [(SYSession *)self identifier];
          int v33 = 138543362;
          v34 = v14;
          v15 = "Session %{public}@ acquiescing to new session; sending, not started, already rejected";
          goto LABEL_34;
        }
        goto LABEL_36;
      }
      self->_rejectedNewSessionFromSamePeer = 1;
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      v32 = (void *)qword_26AB04788;
      if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_INFO))
      {
        uint64_t v17 = v32;
        dispatch_queue_t v18 = [(SYSession *)self identifier];
        int v33 = 138543362;
        v34 = v18;
        v19 = "Session %{public}@ rejecting new session; sending, not started, first strike";
        goto LABEL_16;
      }
LABEL_17:
      BOOL v12 = 0;
      goto LABEL_36;
    }
    if (!v26)
    {
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      v27 = (void *)qword_26AB04788;
      if (!os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_INFO)) {
        goto LABEL_17;
      }
      uint64_t v17 = v27;
      dispatch_queue_t v18 = [(SYSession *)self identifier];
      int v33 = 138543362;
      v34 = v18;
      v19 = "Session %{public}@ rejecting new session; not yet sent out my own start-session message";
      goto LABEL_16;
    }
  }
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  v28 = (void *)qword_26AB04788;
  BOOL v12 = 1;
  if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_INFO))
  {
    v13 = v28;
    v14 = [(SYSession *)self identifier];
    int v33 = 138543362;
    v34 = v14;
    v15 = "Session %{public}@ acquiescing to new session; nil current generation";
    goto LABEL_34;
  }
LABEL_36:

  return v12;
}

- (BOOL)hasRejectedPeerSession
{
  return self->_rejectedNewSessionFromSamePeer;
}

- (void)setHasRejectedPeerSession:(BOOL)a3
{
  self->_rejectedNewSessionFromSamePeer = a3;
}

- (void)_onSessionStateChangedTo:(unsigned int)a3 do:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a4;
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  int v7 = _sync_log_facilities;
  if (os_log_type_enabled((os_log_t)_sync_log_facilities, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v14 = "-[SYSession _onSessionStateChangedTo:do:]";
    _os_log_impl(&dword_21C7C9000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__SYSession__onSessionStateChangedTo_do___block_invoke;
  block[3] = &unk_2644246D0;
  unsigned int v12 = a3;
  block[4] = self;
  id v11 = v6;
  id v9 = v6;
  dispatch_sync(queue, block);
}

void __41__SYSession__onSessionStateChangedTo_do___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) state];
  uint64_t v3 = *(unsigned int *)(a1 + 48);
  if (v2 == v3)
  {
    id v4 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v4();
  }
  else
  {
    double v5 = *(void **)(*(void *)(a1 + 32) + 56);
    if (!v5)
    {
      uint64_t v6 = objc_opt_new();
      uint64_t v7 = *(void *)(a1 + 32);
      id v8 = *(void **)(v7 + 56);
      *(void *)(v7 + 56) = v6;

      double v5 = *(void **)(*(void *)(a1 + 32) + 56);
      uint64_t v3 = *(unsigned int *)(a1 + 48);
    }
    id v9 = [NSNumber numberWithUnsignedInt:v3];
    id v14 = [v5 objectForKeyedSubscript:v9];

    if (v14)
    {
      char v10 = (void *)[*(id *)(a1 + 40) copy];
      [v14 addObject:v10];
    }
    else
    {
      id v11 = objc_alloc(MEMORY[0x263EFF980]);
      unsigned int v12 = (void *)[*(id *)(a1 + 40) copy];
      id v14 = (id)objc_msgSend(v11, "initWithObjects:", v12, 0);

      v13 = *(void **)(*(void *)(a1 + 32) + 56);
      char v10 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 48)];
      [v13 setObject:v14 forKeyedSubscript:v10];
    }
  }
}

- (id)stateResponders
{
  return self->_stateResponders;
}

- (void)_supercededWithSession:(id)a3
{
  id v4 = a3;
  double v5 = [(SYSession *)self identifier];
  [v4 setIdentifier:v5];

  uint64_t v6 = [(SYSession *)self delegate];
  [v4 setDelegate:v6];

  uint64_t v7 = [(SYSession *)self targetQueue];
  [v4 setTargetQueue:v7];

  id v8 = [(SYSession *)self serializer];
  [v4 setSerializer:v8];

  id v9 = [(SYSession *)self options];
  [v4 setOptions:v9];

  objc_msgSend(v4, "setMaxConcurrentMessages:", -[SYSession maxConcurrentMessages](self, "maxConcurrentMessages"));
  objc_msgSend(v4, "setCanRestart:", -[SYSession canRestart](self, "canRestart"));
  objc_msgSend(v4, "setCanRollback:", -[SYSession canRollback](self, "canRollback"));
  char v10 = [(SYSession *)self userContext];
  [v4 setUserContext:v10];

  id v11 = [(SYSession *)self sessionMetadata];
  [v4 setSessionMetadata:v11];

  unsigned int v12 = [(SYSession *)self peerGenerationIDs];
  [v4 setPeerGenerationIDs:v12];

  v13 = [(SYSession *)self reason];
  [v4 setReason:v13];

  [(SYSession *)self _setStateQuietly:0];
  [(SYSession *)self _endTransaction];
}

- (void)_handleError:(id)a3
{
  id v4 = a3;
  if ([(SYSession *)self state] != 5)
  {
    [(SYSession *)self setError:v4];
    [(SYSession *)self setState:5];
  }
}

- (id)CPSafeDescription
{
  id v3 = [NSString alloc];
  id v4 = (objc_class *)objc_opt_class();
  double v5 = NSStringFromClass(v4);
  uint64_t v6 = [(SYSession *)self identifier];
  uint64_t v7 = (void *)[v3 initWithFormat:@"<%@> %@", v5, v6];

  return v7;
}

- (PBCodable)stateForLogging
{
  id v3 = objc_opt_new();
  id v4 = [(SYSession *)self identifier];
  [v3 setIdentifier:v4];

  objc_msgSend(v3, "setState:", -[SYSession state](self, "state"));
  objc_msgSend(v3, "setIsSending:", -[SYSession isSending](self, "isSending"));
  objc_msgSend(v3, "setIsReset:", -[SYSession isResetSync](self, "isResetSync"));
  [(SYSession *)self perMessageTimeout];
  objc_msgSend(v3, "setPerMessageTimeout:");
  [(SYSession *)self fullSessionTimeout];
  objc_msgSend(v3, "setFullSessionTimeout:");
  objc_msgSend(v3, "setMaxConcurrentMessages:", -[SYSession maxConcurrentMessages](self, "maxConcurrentMessages"));
  double v5 = [SYLogErrorInfo alloc];
  uint64_t v6 = [(SYSession *)self error];
  uint64_t v7 = [(SYLogErrorInfo *)v5 initWithCocoaError:v6];
  [v3 setError:v7];

  objc_msgSend(v3, "setCanRollback:", -[SYSession canRollback](self, "canRollback"));
  objc_msgSend(v3, "setCanRestart:", -[SYSession canRestart](self, "canRestart"));
  objc_msgSend(v3, "setCanceled:", -[SYSession wasCancelled](self, "wasCancelled"));
  id v8 = [(SYSession *)self options];
  [v3 setCocoaTransportOptions:v8];

  id v9 = [(SYSession *)self reason];
  [v3 setReason:v9];

  peerGenerationIDs = self->_peerGenerationIDs;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __28__SYSession_stateForLogging__block_invoke;
  v13[3] = &unk_2644246F8;
  id v11 = v3;
  id v14 = v11;
  [(NSMutableDictionary *)peerGenerationIDs enumerateKeysAndObjectsUsingBlock:v13];

  return (PBCodable *)v11;
}

void __28__SYSession_stateForLogging__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = (id)objc_opt_new();
  [v7 setPeerID:v6];

  [v7 setGenerationID:v5];
  [*(id *)(a1 + 32) addPeer:v7];
}

+ (id)unarchiveMetadata:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x263F08928], "sy_unarchivedObjectFromData:", a3);
}

- (int64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(int64_t)a3
{
  self->_priority = a3;
}

- (SYSessionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SYSessionDelegate *)WeakRetained;
}

- (SYChangeSerializer)serializer
{
  return self->_serializer;
}

- (void)setSerializer:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (SYService)service
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_service);
  return (SYService *)WeakRetained;
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
}

- (double)perMessageTimeout
{
  return self->_perMessageTimeout;
}

- (void)setPerMessageTimeout:(double)a3
{
  self->_perMessageTimeout = a3;
}

- (double)fullSessionTimeout
{
  return self->_fullSessionTimeout;
}

- (void)setFullSessionTimeout:(double)a3
{
  self->_fullSessionTimeout = a3;
}

- (NSDictionary)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
}

- (int64_t)maxConcurrentMessages
{
  return self->_maxConcurrentMessages;
}

- (void)setMaxConcurrentMessages:(int64_t)a3
{
  self->_maxConcurrentMessages = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (BOOL)isSending
{
  return self->_isSending;
}

- (NSDictionary)userContext
{
  return self->_userContext;
}

- (void)setUserContext:(id)a3
{
}

- (NSDictionary)sessionMetadata
{
  return self->_sessionMetadata;
}

- (void)setSessionMetadata:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 176, 1);
}

- (double)birthDate
{
  return self->_birthDate;
}

- (void)setBirthDate:(double)a3
{
  self->_birthDate = a3;
}

- (unint64_t)sessionSignpost
{
  return self->_sessionSignpost;
}

- (void)setSessionSignpost:(unint64_t)a3
{
  self->_sessionSignpost = a3;
}

- (NSMutableDictionary)peerGenerationIDs
{
  return self->_peerGenerationIDs;
}

- (void)setPeerGenerationIDs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peerGenerationIDs, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_sessionMetadata, 0);
  objc_storeStrong((id *)&self->_userContext, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_destroyWeak((id *)&self->_service);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_serializer, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_stateResponders, 0);
  objc_storeStrong((id *)&self->_pendingMessageIDs, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
}

- (void)didStartSession
{
  self->_sessionStarted = 1;
}

- (id)combinedEngineOptions:(id)a3
{
  id v4 = a3;
  options = self->_options;
  if (v4)
  {
    if (options)
    {
      id v6 = (NSDictionary *)[(NSDictionary *)options mutableCopy];
      [(NSDictionary *)v6 addEntriesFromDictionary:v4];
      goto LABEL_7;
    }
    id v7 = (NSDictionary *)v4;
  }
  else
  {
    id v7 = options;
  }
  id v6 = v7;
LABEL_7:

  return v6;
}

- (unsigned)state
{
  OUTLINED_FUNCTION_1_4();
  uint64_t v2 = objc_opt_class();
  OUTLINED_FUNCTION_0_7(v2);
  return 0;
}

- (void)setState:(unsigned int)a3
{
  OUTLINED_FUNCTION_1_4();
  objc_opt_class();
  uint64_t v3 = OUTLINED_FUNCTION_0();
  MEMORY[0x270EF2BB8](v3, v4, v5);
}

- (BOOL)canRestart
{
  OUTLINED_FUNCTION_1_4();
  uint64_t v2 = objc_opt_class();
  OUTLINED_FUNCTION_0_7(v2);
  return 0;
}

- (void)setCanRestart:(BOOL)a3
{
  OUTLINED_FUNCTION_1_4();
  objc_opt_class();
  uint64_t v3 = OUTLINED_FUNCTION_0();
  MEMORY[0x270EF2BB8](v3, v4, v5);
}

- (BOOL)canRollback
{
  OUTLINED_FUNCTION_1_4();
  uint64_t v2 = objc_opt_class();
  OUTLINED_FUNCTION_0_7(v2);
  return 0;
}

- (void)setCanRollback:(BOOL)a3
{
  OUTLINED_FUNCTION_1_4();
  objc_opt_class();
  uint64_t v3 = OUTLINED_FUNCTION_0();
  MEMORY[0x270EF2BB8](v3, v4, v5);
}

- (BOOL)isResetSync
{
  OUTLINED_FUNCTION_1_4();
  uint64_t v2 = objc_opt_class();
  OUTLINED_FUNCTION_0_7(v2);
  return 0;
}

- (void)start:(id)a3
{
  OUTLINED_FUNCTION_1_4();
  uint64_t v4 = (void (**)(id, void, id))v3;
  uint64_t v5 = objc_opt_class();
  OUTLINED_FUNCTION_0_7(v5);
  id v6 = (id)[objc_alloc(MEMORY[0x263F087E8]) initWithSYError:2008 userInfo:0];
  v4[2](v4, 0, v6);
}

- (void)cancelWithError:(id)a3
{
  OUTLINED_FUNCTION_1_4();
  objc_opt_class();
  uint64_t v3 = OUTLINED_FUNCTION_0();
  MEMORY[0x270EF2BB8](v3, v4, v5);
}

- (void)_handleSyncBatch:(id)a3 response:(id)a4 completion:(id)a5
{
  OUTLINED_FUNCTION_1_4();
  objc_opt_class();
  uint64_t v5 = OUTLINED_FUNCTION_0();
  MEMORY[0x270EF2BB8](v5, v6, v7);
}

- (void)_handleRestartSession:(id)a3 response:(id)a4 completion:(id)a5
{
  OUTLINED_FUNCTION_1_4();
  objc_opt_class();
  uint64_t v5 = OUTLINED_FUNCTION_0();
  MEMORY[0x270EF2BB8](v5, v6, v7);
}

- (void)_handleEndSession:(id)a3 response:(id)a4 completion:(id)a5
{
  OUTLINED_FUNCTION_1_4();
  objc_opt_class();
  uint64_t v5 = OUTLINED_FUNCTION_0();
  MEMORY[0x270EF2BB8](v5, v6, v7);
}

- (BOOL)_handleStartSessionResponse:(id)a3 error:(id *)a4
{
  OUTLINED_FUNCTION_1_4();
  uint64_t v4 = objc_opt_class();
  OUTLINED_FUNCTION_0_7(v4);
  return 0;
}

- (BOOL)_handleSyncBatchResponse:(id)a3 error:(id *)a4
{
  OUTLINED_FUNCTION_1_4();
  uint64_t v4 = objc_opt_class();
  OUTLINED_FUNCTION_0_7(v4);
  return 0;
}

- (BOOL)_handleRestartSessionResponse:(id)a3 error:(id *)a4
{
  OUTLINED_FUNCTION_1_4();
  uint64_t v4 = objc_opt_class();
  OUTLINED_FUNCTION_0_7(v4);
  return 0;
}

- (BOOL)_handleEndSessionResponse:(id)a3 error:(id *)a4
{
  OUTLINED_FUNCTION_1_4();
  uint64_t v4 = objc_opt_class();
  OUTLINED_FUNCTION_0_7(v4);
  return 0;
}

- (void)_beginTransaction
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_21C7C9000, a2, OS_LOG_TYPE_DEBUG, "%{public}@: beginning XPC transaction, to stop us being Jetsammed until it's done.", (uint8_t *)&v2, 0xCu);
}

- (void)_endTransaction
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_21C7C9000, a2, OS_LOG_TYPE_DEBUG, "%{public}@: ending XPC transaction. We can now be jetsammed safely.", (uint8_t *)&v2, 0xCu);
}

- (void)_recordOutgoingMessageUUID:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21C7C9000, log, OS_LOG_TYPE_ERROR, "Asked to record a nil IDS message identifier!", v1, 2u);
}

@end