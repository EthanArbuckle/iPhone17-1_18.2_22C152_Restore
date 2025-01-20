@interface NFCReaderSession
+ (BOOL)featureAvailable:(unint64_t)a3;
+ (BOOL)readingAvailable;
- (BOOL)_connectTag:(id)a3 error:(id *)a4;
- (BOOL)checkPresenceWithError:(id *)a3;
- (BOOL)connectTag:(id)a3 error:(id *)a4;
- (BOOL)disconnectTagWithError:(id *)a3;
- (BOOL)isInvalidated;
- (BOOL)isReady;
- (BOOL)validateDelegate:(id)a3 expectedType:(int64_t)a4;
- (BOOL)writeNdefMessage:(id)a3 error:(id *)a4;
- (NFCHardwareManager)hardwareManager;
- (NFCReaderSession)initWithDelegate:(id)a3 queue:(id)a4 pollMethod:(unint64_t)a5;
- (NFCReaderSession)initWithDelegate:(id)a3 sessionDelegateType:(int64_t)a4 queue:(id)a5 pollMethod:(unint64_t)a6 sessionConfig:(unint64_t)a7;
- (NFReaderSessionInterface)readerProxy;
- (NFTag)currentTag;
- (NSNumber)sessionId;
- (NSString)alertMessage;
- (dispatch_queue_t)sessionQueue;
- (id)_convertMessageToInternal:(id)a3;
- (id)delegate;
- (id)ndefStatus:(int64_t *)a3 maxMessageLength:(unint64_t *)a4;
- (id)readNdefMessageWithError:(id *)a3;
- (id)transceive:(id)a3 tagUpdate:(id *)a4 error:(id *)a5;
- (id)writeLockNdef;
- (int64_t)delegateType;
- (unint64_t)pollMethod;
- (unint64_t)sessionConfig;
- (void)_callbackDidBecomeActive;
- (void)_callbackDidInvalidateWithError:(id)a3;
- (void)_invalidateSessionAndActivateCallbackWithCode:(int64_t)a3;
- (void)_invalidateSessionWithCode:(int64_t)a3;
- (void)_invalidateSessionWithCode:(int64_t)a3 message:(id)a4 finalUIState:(int64_t)a5 activateCallback:(BOOL)a6;
- (void)_restartPollingWithCompletionHandler:(id)a3;
- (void)_resumeDelegateQueue;
- (void)_startPollingWithMethod:(unint64_t)a3 sessionConfig:(unint64_t)a4 completionHandler:(id)a5;
- (void)_stopPollingWithCompletionHandler:(id)a3;
- (void)beginSession;
- (void)beginSessionWithConfig:(id)a3;
- (void)cleanupNFCHardwareManagerRegistration;
- (void)connectTag:(id)a3 completionHandler:(id)a4;
- (void)dealloc;
- (void)didDetectExternalReader;
- (void)didDetectTags:(id)a3 connectedTagIndex:(unint64_t)a4;
- (void)didInvalidate;
- (void)didStartSession:(id)a3;
- (void)didTerminate:(id)a3;
- (void)didUIControllerInvalidate:(id)a3;
- (void)handleSessionResumed;
- (void)handleSessionSuspended:(id)a3;
- (void)hwStateDidChange:(unsigned int)a3;
- (void)invalidateSession;
- (void)invalidateSessionWithErrorMessage:(id)a3;
- (void)restartPolling;
- (void)setAlertMessage:(id)a3;
- (void)setPollMethod:(unint64_t)a3;
- (void)setSessionConfig:(unint64_t)a3;
- (void)submitBlockOnDelegateQueue:(id)a3;
- (void)submitBlockOnSessionQueue:(id)a3;
- (void)submitBlockOnSessionQueueWithDelay:(unint64_t)a3 block:(id)a4;
@end

@implementation NFCReaderSession

- (void)dealloc
{
  if (self->_sessionId) {
    [(NFCReaderSession *)self cleanupNFCHardwareManagerRegistration];
  }
  v3.receiver = self;
  v3.super_class = (Class)NFCReaderSession;
  [(NFCReaderSession *)&v3 dealloc];
}

- (BOOL)isReady
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = (unint64_t)(v2->_sessionState - 2) < 3;
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)isInvalidated
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = (unint64_t)(v2->_sessionState - 5) < 3;
  objc_sync_exit(v2);

  return v3;
}

- (NSString)alertMessage
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = v2->_alertMessage;
  objc_sync_exit(v2);

  return v3;
}

- (void)setAlertMessage:(id)a3
{
  id v5 = a3;
  v6 = _os_activity_create(&dword_2214B8000, "NFCReaderSession setAlertMessage:", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  os_activity_scope_leave(&state);

  v7 = self;
  objc_sync_enter(v7);
  uint64_t v8 = [v5 copy];
  alertMessage = v7->_alertMessage;
  v7->_alertMessage = (NSString *)v8;

  proxy = v7->_proxy;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __36__NFCReaderSession_setAlertMessage___block_invoke;
  v14[3] = &unk_2645B4928;
  v14[4] = v7;
  v14[5] = a2;
  v11 = [(NFReaderSessionInterface *)proxy synchronousRemoteObjectProxyWithErrorHandler:v14];
  v12 = v7->_alertMessage;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __36__NFCReaderSession_setAlertMessage___block_invoke_12;
  v13[3] = &unk_2645B4928;
  v13[4] = v7;
  v13[5] = a2;
  [v11 updateSharingUIScanText:v12 completion:v13];

  objc_sync_exit(v7);
}

void __36__NFCReaderSession_setAlertMessage___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v5 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 40));
    uint64_t v8 = 45;
    if (isMetaClass) {
      uint64_t v8 = 43;
    }
    v5(4, "%c[%{public}s %{public}s]:%i XPC error: %@", v8, ClassName, Name, 99, v3);
  }
  v9 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    v10 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v10)) {
      int v11 = 43;
    }
    else {
      int v11 = 45;
    }
    v12 = object_getClassName(*(id *)(a1 + 32));
    v13 = sel_getName(*(SEL *)(a1 + 40));
    *(_DWORD *)buf = 67110146;
    int v17 = v11;
    __int16 v18 = 2082;
    v19 = v12;
    __int16 v20 = 2082;
    v21 = v13;
    __int16 v22 = 1024;
    int v23 = 99;
    __int16 v24 = 2112;
    id v25 = v3;
    _os_log_impl(&dword_2214B8000, v9, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i XPC error: %@", buf, 0x2Cu);
  }
}

void __36__NFCReaderSession_setAlertMessage___block_invoke_12(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v5 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 40));
    if (v3) {
      v10 = @"no error";
    }
    else {
      v10 = 0;
    }
    uint64_t v11 = 45;
    if (isMetaClass) {
      uint64_t v11 = 43;
    }
    v5(3, "%c[%{public}s %{public}s]:%i %@", v11, ClassName, Name, 101, v10);
  }
  v12 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    v13 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v13)) {
      int v14 = 43;
    }
    else {
      int v14 = 45;
    }
    v15 = object_getClassName(*(id *)(a1 + 32));
    v16 = sel_getName(*(SEL *)(a1 + 40));
    *(_DWORD *)buf = 67110146;
    if (v3) {
      int v17 = @"no error";
    }
    else {
      int v17 = 0;
    }
    int v19 = v14;
    __int16 v20 = 2082;
    v21 = v15;
    __int16 v22 = 2082;
    int v23 = v16;
    __int16 v24 = 1024;
    int v25 = 101;
    __int16 v26 = 2112;
    v27 = v17;
    _os_log_impl(&dword_2214B8000, v12, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %@", buf, 0x2Cu);
  }
}

- (void)invalidateSession
{
  id v3 = _os_activity_create(&dword_2214B8000, "NFCReaderSession invalidateSession", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  v4.opaque[0] = 0;
  v4.opaque[1] = 0;
  os_activity_scope_enter(v3, &v4);
  os_activity_scope_leave(&v4);

  [(NFCReaderSession *)self invalidateSessionWithReason:200];
}

- (void)invalidateSessionWithErrorMessage:(id)a3
{
  id v4 = a3;
  id v5 = _os_activity_create(&dword_2214B8000, "NFCReaderSession invalidateSessionWithErrorMessage:", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  v6.opaque[0] = 0;
  v6.opaque[1] = 0;
  os_activity_scope_enter(v5, &v6);
  os_activity_scope_leave(&v6);

  [(NFCReaderSession *)self _invalidateSessionWithCode:200 message:v4 finalUIState:2 activateCallback:0];
}

- (void)_callbackDidBecomeActive
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  if (self->_delegateType == 1
    && ([(NFCReaderSession *)self delegate],
        id v4 = objc_claimAutoreleasedReturnValue(),
        char v5 = objc_opt_respondsToSelector(),
        v4,
        (v5 & 1) != 0))
  {
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __44__NFCReaderSession__callbackDidBecomeActive__block_invoke;
    v17[3] = &unk_2645B45A8;
    v17[4] = self;
    [(NFCReaderSession *)self submitBlockOnDelegateQueue:v17];
  }
  else
  {
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      v7 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      int64_t v16 = [(NFCReaderSession *)self delegateType];
      uint64_t v12 = 45;
      if (isMetaClass) {
        uint64_t v12 = 43;
      }
      v7(4, "%c[%{public}s %{public}s]:%i Unknown delegate type: %ld", v12, ClassName, Name, 145, v16);
    }
    v13 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v14 = object_getClass(self);
      if (class_isMetaClass(v14)) {
        int v15 = 43;
      }
      else {
        int v15 = 45;
      }
      *(_DWORD *)buf = 67110146;
      int v19 = v15;
      __int16 v20 = 2082;
      v21 = object_getClassName(self);
      __int16 v22 = 2082;
      int v23 = sel_getName(a2);
      __int16 v24 = 1024;
      int v25 = 145;
      __int16 v26 = 2048;
      int64_t v27 = [(NFCReaderSession *)self delegateType];
      _os_log_impl(&dword_2214B8000, v13, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unknown delegate type: %ld", buf, 0x2Cu);
    }
  }
}

void __44__NFCReaderSession__callbackDidBecomeActive__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 readerSessionDidBecomeActive:*(void *)(a1 + 32)];
}

- (void)didStartSession:(id)a3
{
  id v4 = a3;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __36__NFCReaderSession_didStartSession___block_invoke;
  aBlock[3] = &unk_2645B4950;
  id v5 = v4;
  id v11 = v5;
  uint64_t v12 = self;
  os_activity_scope_state_s v6 = (void (**)(void *, id))_Block_copy(aBlock);
  v7 = self;
  objc_sync_enter(v7);
  if (v5)
  {
    v6[2](v6, v5);
  }
  else
  {
    v7->_sessionState = 2;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __36__NFCReaderSession_didStartSession___block_invoke_2;
    v8[3] = &unk_2645B4468;
    v8[4] = v7;
    v9 = v6;
    [(NFCReaderSession *)v7 submitBlockOnSessionQueue:v8];
  }
  objc_sync_exit(v7);
}

uint64_t __36__NFCReaderSession_didStartSession___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  unint64_t v4 = [v3 code];
  id v5 = [v3 domain];

  os_activity_scope_state_s v6 = [NSString stringWithUTF8String:"nfcd"];
  int v7 = [v5 isEqualToString:v6];

  if (v7)
  {
    if (v4 <= 0x20 && ((1 << v4) & 0x100000500) != 0)
    {
      unint64_t v4 = 2;
    }
    else if ([*(id *)(a1 + 32) code] == 2)
    {
      unint64_t v4 = 203;
    }
    else
    {
      unint64_t v4 = 202;
    }
  }
  uint64_t v8 = *(void **)(a1 + 40);

  return [v8 _invalidateSessionWithCode:v4 message:0 finalUIState:0 activateCallback:1];
}

void __36__NFCReaderSession_didStartSession___block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = v2[11];
  uint64_t v4 = v2[12];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __36__NFCReaderSession_didStartSession___block_invoke_3;
  v6[3] = &unk_2645B4978;
  id v5 = *(id *)(a1 + 40);
  v6[4] = *(void *)(a1 + 32);
  id v7 = v5;
  [v2 _startPollingWithMethod:v3 sessionConfig:v4 completionHandler:v6];
}

uint64_t __36__NFCReaderSession_didStartSession___block_invoke_3(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return v3();
  }
  else
  {
    id v5 = *(id *)(a1 + 32);
    objc_sync_enter(v5);
    uint64_t v6 = *(void *)(a1 + 32);
    if (*(void *)(v6 + 40) == 2) {
      *(void *)(v6 + 40) = 3;
    }
    objc_sync_exit(v5);

    id v7 = *(void **)(a1 + 32);
    return [v7 _callbackDidBecomeActive];
  }
}

- (void)handleSessionResumed
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v5 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v5(4, "%c[%{public}s %{public}s]:%i Not implemented", v9, ClassName, Name, 197);
  }
  v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    id v11 = object_getClass(self);
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    *(_DWORD *)buf = 67109890;
    int v15 = v12;
    __int16 v16 = 2082;
    int v17 = object_getClassName(self);
    __int16 v18 = 2082;
    int v19 = sel_getName(a2);
    __int16 v20 = 1024;
    int v21 = 197;
    _os_log_impl(&dword_2214B8000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Not implemented", buf, 0x22u);
  }
}

- (void)handleSessionSuspended:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    uint64_t v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v10 = 45;
    if (isMetaClass) {
      uint64_t v10 = 43;
    }
    v6(4, "%c[%{public}s %{public}s]:%i Not implemented", v10, ClassName, Name, 203);
  }
  id v11 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    int v12 = object_getClass(self);
    if (class_isMetaClass(v12)) {
      int v13 = 43;
    }
    else {
      int v13 = 45;
    }
    *(_DWORD *)buf = 67109890;
    int v16 = v13;
    __int16 v17 = 2082;
    __int16 v18 = object_getClassName(self);
    __int16 v19 = 2082;
    __int16 v20 = sel_getName(a2);
    __int16 v21 = 1024;
    int v22 = 203;
    _os_log_impl(&dword_2214B8000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Not implemented", buf, 0x22u);
  }
}

- (void)didTerminate:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = self;
  objc_sync_enter(v6);
  uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (Logger)
  {
    Class = object_getClass(v6);
    if (class_isMetaClass(Class)) {
      uint64_t v9 = 43;
    }
    else {
      uint64_t v9 = 45;
    }
    ClassName = object_getClassName(v6);
    Name = sel_getName(a2);
    if (v6->_proxy) {
      int v12 = @"YES";
    }
    else {
      int v12 = @"NO";
    }
    Logger(5, "%c[%{public}s %{public}s]:%i sessionState=%ld, proxy=%@, error=%@", v9, ClassName, Name, 209, v6->_sessionState, v12, v5);
  }
  int v13 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = object_getClass(v6);
    if (class_isMetaClass(v14)) {
      int v15 = 43;
    }
    else {
      int v15 = 45;
    }
    int v16 = object_getClassName(v6);
    __int16 v17 = sel_getName(a2);
    int64_t sessionState = v6->_sessionState;
    if (v6->_proxy) {
      __int16 v19 = @"YES";
    }
    else {
      __int16 v19 = @"NO";
    }
    *(_DWORD *)buf = 67110658;
    int v23 = v15;
    __int16 v24 = 2082;
    int v25 = v16;
    __int16 v26 = 2082;
    int64_t v27 = v17;
    __int16 v28 = 1024;
    int v29 = 209;
    __int16 v30 = 2048;
    int64_t v31 = sessionState;
    __int16 v32 = 2112;
    v33 = v19;
    __int16 v34 = 2112;
    id v35 = v5;
    _os_log_impl(&dword_2214B8000, v13, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i sessionState=%ld, proxy=%@, error=%@", buf, 0x40u);
  }

  if ([v5 code] == 64)
  {
    uint64_t v20 = 203;
  }
  else if ([v5 code] == 5)
  {
    uint64_t v20 = 201;
  }
  else
  {
    uint64_t v20 = 202;
  }
  v6->_invalidationCode = v20;
  proxy = v6->_proxy;
  v6->_proxy = 0;
  v6->_int64_t sessionState = 7;

  [(NFCReaderSession *)v6 cleanupNFCHardwareManagerRegistration];
  objc_sync_exit(v6);
}

- (void)didUIControllerInvalidate:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = self;
  objc_sync_enter(v6);
  uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (Logger)
  {
    Class = object_getClass(v6);
    if (class_isMetaClass(Class)) {
      uint64_t v9 = 43;
    }
    else {
      uint64_t v9 = 45;
    }
    ClassName = object_getClassName(v6);
    Name = sel_getName(a2);
    if (v6->_proxy) {
      int v12 = @"YES";
    }
    else {
      int v12 = @"NO";
    }
    Logger(5, "%c[%{public}s %{public}s]:%i sessionState=%ld, proxy=%@", v9, ClassName, Name, 230, v6->_sessionState, v12);
  }
  int v13 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = object_getClass(v6);
    if (class_isMetaClass(v14)) {
      int v15 = 43;
    }
    else {
      int v15 = 45;
    }
    int v16 = object_getClassName(v6);
    __int16 v17 = sel_getName(a2);
    int64_t sessionState = v6->_sessionState;
    if (v6->_proxy) {
      __int16 v19 = @"YES";
    }
    else {
      __int16 v19 = @"NO";
    }
    *(_DWORD *)buf = 67110402;
    int v24 = v15;
    __int16 v25 = 2082;
    __int16 v26 = v16;
    __int16 v27 = 2082;
    __int16 v28 = v17;
    __int16 v29 = 1024;
    int v30 = 230;
    __int16 v31 = 2048;
    int64_t v32 = sessionState;
    __int16 v33 = 2112;
    __int16 v34 = v19;
    _os_log_impl(&dword_2214B8000, v13, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i sessionState=%ld, proxy=%@", buf, 0x36u);
  }

  if ((v6->_sessionState | 2) != 7)
  {
    uint64_t v20 = [v5 code];
    uint64_t v21 = 202;
    if (v20 == 48) {
      uint64_t v21 = 200;
    }
    v6->_invalidationCode = v21;
  }
  [(NFCReaderSession *)v6 _invalidateSessionAndActivateCallbackWithCode:v6->_invalidationCode];
  [(NFCReaderSession *)v6 cleanupNFCHardwareManagerRegistration];
  proxy = v6->_proxy;
  v6->_proxy = 0;

  objc_sync_exit(v6);
}

- (void)didDetectTags:(id)a3 connectedTagIndex:(unint64_t)a4
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v7 = a3;
  uint64_t v8 = self;
  objc_sync_enter(v8);
  uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (Logger)
  {
    Class = object_getClass(v8);
    uint64_t v11 = class_isMetaClass(Class) ? 43 : 45;
    ClassName = object_getClassName(v8);
    Name = sel_getName(a2);
    currentTag = v8->_currentTag;
    if (currentTag)
    {
      int v15 = [(NFTag *)v8->_currentTag description];
    }
    else
    {
      int v15 = @"None";
    }
    Logger(6, "%c[%{public}s %{public}s]:%i Current connectedTag: %@", v11, ClassName, Name, 251, v15);
    if (currentTag) {
  }
    }
  int v16 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v17 = object_getClass(v8);
    int v18 = class_isMetaClass(v17) ? 43 : 45;
    __int16 v19 = object_getClassName(v8);
    uint64_t v20 = sel_getName(a2);
    uint64_t v21 = v8->_currentTag;
    if (v21)
    {
      int v22 = [(NFTag *)v8->_currentTag description];
    }
    else
    {
      int v22 = @"None";
    }
    *(_DWORD *)buf = 67110146;
    int v50 = v18;
    __int16 v51 = 2082;
    v52 = v19;
    __int16 v53 = 2082;
    v54 = v20;
    __int16 v55 = 1024;
    int v56 = 251;
    __int16 v57 = 2112;
    unint64_t v58 = (unint64_t)v22;
    _os_log_impl(&dword_2214B8000, v16, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Current connectedTag: %@", buf, 0x2Cu);
    if (v21) {
  }
    }
  if (a4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if ([v7 count] <= a4)
    {
      v40 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v40)
      {
        v41 = object_getClass(v8);
        if (class_isMetaClass(v41)) {
          uint64_t v42 = 43;
        }
        else {
          uint64_t v42 = 45;
        }
        v43 = object_getClassName(v8);
        v44 = sel_getName(a2);
        v40(3, "%c[%{public}s %{public}s]:%i Invalid tag index: %ld", v42, v43, v44, 257, a4);
      }
      int v30 = NFSharedLogGetLogger();
      if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
        goto LABEL_42;
      }
      v45 = object_getClass(v8);
      if (class_isMetaClass(v45)) {
        int v46 = 43;
      }
      else {
        int v46 = 45;
      }
      v47 = object_getClassName(v8);
      v48 = sel_getName(a2);
      *(_DWORD *)buf = 67110146;
      int v50 = v46;
      __int16 v51 = 2082;
      v52 = v47;
      __int16 v53 = 2082;
      v54 = v48;
      __int16 v55 = 1024;
      int v56 = 257;
      __int16 v57 = 2048;
      unint64_t v58 = a4;
      uint64_t v36 = "%c[%{public}s %{public}s]:%i Invalid tag index: %ld";
      v37 = v30;
      os_log_type_t v38 = OS_LOG_TYPE_ERROR;
      uint32_t v39 = 44;
    }
    else
    {
      uint64_t v23 = [v7 objectAtIndex:a4];
      int v24 = v8->_currentTag;
      v8->_currentTag = (NFTag *)v23;

      __int16 v25 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v25)
      {
        __int16 v26 = object_getClass(v8);
        if (class_isMetaClass(v26)) {
          uint64_t v27 = 43;
        }
        else {
          uint64_t v27 = 45;
        }
        __int16 v28 = object_getClassName(v8);
        __int16 v29 = sel_getName(a2);
        v25(6, "%c[%{public}s %{public}s]:%i ConnectedTag[%ld]: %@", v27, v28, v29, 255, a4, v8->_currentTag);
      }
      int v30 = NFSharedLogGetLogger();
      if (!os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_42;
      }
      __int16 v31 = object_getClass(v8);
      if (class_isMetaClass(v31)) {
        int v32 = 43;
      }
      else {
        int v32 = 45;
      }
      __int16 v33 = object_getClassName(v8);
      __int16 v34 = sel_getName(a2);
      uint64_t v35 = v8->_currentTag;
      *(_DWORD *)buf = 67110402;
      int v50 = v32;
      __int16 v51 = 2082;
      v52 = v33;
      __int16 v53 = 2082;
      v54 = v34;
      __int16 v55 = 1024;
      int v56 = 255;
      __int16 v57 = 2048;
      unint64_t v58 = a4;
      __int16 v59 = 2112;
      v60 = v35;
      uint64_t v36 = "%c[%{public}s %{public}s]:%i ConnectedTag[%ld]: %@";
      v37 = v30;
      os_log_type_t v38 = OS_LOG_TYPE_DEFAULT;
      uint32_t v39 = 54;
    }
    _os_log_impl(&dword_2214B8000, v37, v38, v36, buf, v39);
LABEL_42:
  }
  v8->_int64_t sessionState = 4;
  objc_sync_exit(v8);
}

- (void)didDetectExternalReader
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v5 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v5(5, "%c[%{public}s %{public}s]:%i External reader detected", v9, ClassName, Name, 274);
  }
  uint64_t v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = object_getClass(self);
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    *(_DWORD *)buf = 67109890;
    int v15 = v12;
    __int16 v16 = 2082;
    __int16 v17 = object_getClassName(self);
    __int16 v18 = 2082;
    __int16 v19 = sel_getName(a2);
    __int16 v20 = 1024;
    int v21 = 274;
    _os_log_impl(&dword_2214B8000, v10, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i External reader detected", buf, 0x22u);
  }

  [(NFCReaderSession *)self _invalidateSessionWithCode:203];
}

- (void)hwStateDidChange:(unsigned int)a3
{
  obj = self;
  objc_sync_enter(obj);
  if (a3 == 4) {
    [(NFCReaderSession *)obj _invalidateSessionWithCode:1];
  }
  objc_sync_exit(obj);
}

- (void)didInvalidate
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  uint64_t v3 = self;
  objc_sync_enter(v3);
  if (v3->_sessionState == 6)
  {
    uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger)
    {
      Class = object_getClass(v3);
      if (class_isMetaClass(Class)) {
        uint64_t v6 = 43;
      }
      else {
        uint64_t v6 = 45;
      }
      ClassName = object_getClassName(v3);
      Name = sel_getName(a2);
      Logger(5, "%c[%{public}s %{public}s]:%i Drop XPC interrupt callback", v6, ClassName, Name, 303);
    }
    uint64_t v9 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = object_getClass(v3);
      if (class_isMetaClass(v10)) {
        int v11 = 43;
      }
      else {
        int v11 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v28 = v11;
      __int16 v29 = 2082;
      int v30 = object_getClassName(v3);
      __int16 v31 = 2082;
      int v32 = sel_getName(a2);
      __int16 v33 = 1024;
      int v34 = 303;
      _os_log_impl(&dword_2214B8000, v9, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Drop XPC interrupt callback", buf, 0x22u);
    }
  }
  else
  {
    int v12 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v12)
    {
      int v13 = object_getClass(v3);
      if (class_isMetaClass(v13)) {
        uint64_t v14 = 43;
      }
      else {
        uint64_t v14 = 45;
      }
      int v15 = object_getClassName(v3);
      __int16 v16 = sel_getName(a2);
      if (v3->_proxy) {
        __int16 v17 = @"YES";
      }
      else {
        __int16 v17 = @"NO";
      }
      v12(5, "%c[%{public}s %{public}s]:%i sessionState=%ld, proxy=%@", v14, v15, v16, 307, v3->_sessionState, v17);
    }
    __int16 v18 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v19 = object_getClass(v3);
      if (class_isMetaClass(v19)) {
        int v20 = 43;
      }
      else {
        int v20 = 45;
      }
      int v21 = object_getClassName(v3);
      uint64_t v22 = sel_getName(a2);
      int64_t sessionState = v3->_sessionState;
      if (v3->_proxy) {
        int v24 = @"YES";
      }
      else {
        int v24 = @"NO";
      }
      *(_DWORD *)buf = 67110402;
      int v28 = v20;
      __int16 v29 = 2082;
      int v30 = v21;
      __int16 v31 = 2082;
      int v32 = v22;
      __int16 v33 = 1024;
      int v34 = 307;
      __int16 v35 = 2048;
      int64_t v36 = sessionState;
      __int16 v37 = 2112;
      os_log_type_t v38 = v24;
      _os_log_impl(&dword_2214B8000, v18, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i sessionState=%ld, proxy=%@", buf, 0x36u);
    }

    proxy = v3->_proxy;
    v3->_proxy = 0;

    if (v3->_invalidationCode) {
      uint64_t invalidationCode = v3->_invalidationCode;
    }
    else {
      uint64_t invalidationCode = 202;
    }
    [(NFCReaderSession *)v3 _invalidateSessionAndActivateCallbackWithCode:invalidationCode];
    v3->_int64_t sessionState = 6;
    [(NFCReaderSession *)v3 cleanupNFCHardwareManagerRegistration];
  }
  objc_sync_exit(v3);
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);

  return WeakRetained;
}

- (dispatch_queue_t)sessionQueue
{
  return (dispatch_queue_t)self->_delegateQueue;
}

- (void)submitBlockOnSessionQueue:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = a3;
  sessionQueue = self->_sessionQueue;
  if (sessionQueue
    || ([MEMORY[0x263F08690] currentHandler],
        id v7 = objc_claimAutoreleasedReturnValue(),
        [v7 handleFailureInMethod:a2 object:self file:@"NFCReaderSession.m" lineNumber:333 description:@"Session queue is nil"], v7, (sessionQueue = self->_sessionQueue) != 0))
  {
    dispatch_async(sessionQueue, v5);
  }
  else
  {
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      uint64_t v9 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v13 = 45;
      if (isMetaClass) {
        uint64_t v13 = 43;
      }
      v9(3, "%c[%{public}s %{public}s]:%i Session queue is nil", v13, ClassName, Name, 335);
    }
    uint64_t v14 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int v15 = object_getClass(self);
      if (class_isMetaClass(v15)) {
        int v16 = 43;
      }
      else {
        int v16 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v20 = v16;
      __int16 v21 = 2082;
      uint64_t v22 = object_getClassName(self);
      __int16 v23 = 2082;
      int v24 = sel_getName(a2);
      __int16 v25 = 1024;
      int v26 = 335;
      _os_log_impl(&dword_2214B8000, v14, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session queue is nil", buf, 0x22u);
    }

    __int16 v17 = [MEMORY[0x263F08690] currentHandler];
    [v17 handleFailureInMethod:a2 object:self file:@"NFCReaderSession.m" lineNumber:336 description:@"Session queue is nil"];
  }
}

- (void)submitBlockOnSessionQueueWithDelay:(unint64_t)a3 block:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v7 = a4;
  sessionQueue = self->_sessionQueue;
  if (sessionQueue
    || ([MEMORY[0x263F08690] currentHandler],
        uint64_t v9 = objc_claimAutoreleasedReturnValue(),
        [v9 handleFailureInMethod:a2 object:self file:@"NFCReaderSession.m" lineNumber:344 description:@"Session queue is nil"], v9, (sessionQueue = self->_sessionQueue) != 0))
  {
    dispatch_after(a3, sessionQueue, v7);
  }
  else
  {
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      int v11 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v15 = 45;
      if (isMetaClass) {
        uint64_t v15 = 43;
      }
      v11(3, "%c[%{public}s %{public}s]:%i Session queue is nil", v15, ClassName, Name, 346);
    }
    int v16 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      __int16 v17 = object_getClass(self);
      if (class_isMetaClass(v17)) {
        int v18 = 43;
      }
      else {
        int v18 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v22 = v18;
      __int16 v23 = 2082;
      int v24 = object_getClassName(self);
      __int16 v25 = 2082;
      int v26 = sel_getName(a2);
      __int16 v27 = 1024;
      int v28 = 346;
      _os_log_impl(&dword_2214B8000, v16, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session queue is nil", buf, 0x22u);
    }

    __int16 v19 = [MEMORY[0x263F08690] currentHandler];
    [v19 handleFailureInMethod:a2 object:self file:@"NFCReaderSession.m" lineNumber:347 description:@"Session queue is nil"];
  }
}

- (void)submitBlockOnDelegateQueue:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = a3;
  delegateQueue = self->_delegateQueue;
  if (delegateQueue
    || ([MEMORY[0x263F08690] currentHandler],
        id v7 = objc_claimAutoreleasedReturnValue(),
        [v7 handleFailureInMethod:a2 object:self file:@"NFCReaderSession.m" lineNumber:355 description:@"Delegate queue is nil"], v7, (delegateQueue = self->_delegateQueue) != 0))
  {
    dispatch_group_notify((dispatch_group_t)self->_sessionStartInProgress, delegateQueue, v5);
  }
  else
  {
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      uint64_t v9 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v13 = 45;
      if (isMetaClass) {
        uint64_t v13 = 43;
      }
      v9(3, "%c[%{public}s %{public}s]:%i Session queue is nil", v13, ClassName, Name, 357);
    }
    uint64_t v14 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = object_getClass(self);
      if (class_isMetaClass(v15)) {
        int v16 = 43;
      }
      else {
        int v16 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v20 = v16;
      __int16 v21 = 2082;
      int v22 = object_getClassName(self);
      __int16 v23 = 2082;
      int v24 = sel_getName(a2);
      __int16 v25 = 1024;
      int v26 = 357;
      _os_log_impl(&dword_2214B8000, v14, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session queue is nil", buf, 0x22u);
    }

    __int16 v17 = [MEMORY[0x263F08690] currentHandler];
    [v17 handleFailureInMethod:a2 object:self file:@"NFCReaderSession.m" lineNumber:358 description:@"Session queue is nil"];
  }
}

- (void)beginSession
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v5 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v5(6, "%c[%{public}s %{public}s]:%i ", v9, ClassName, Name, 367);
  }
  uint64_t v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = object_getClass(self);
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    *(_DWORD *)buf = 67109890;
    int v33 = v12;
    __int16 v34 = 2082;
    __int16 v35 = object_getClassName(self);
    __int16 v36 = 2082;
    __int16 v37 = sel_getName(a2);
    __int16 v38 = 1024;
    int v39 = 367;
    _os_log_impl(&dword_2214B8000, v10, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  uint64_t v13 = self;
  objc_sync_enter(v13);
  unint64_t v14 = v13->_delegateType - 1;
  if (v14 >= 6)
  {
    int v16 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v16)
    {
      __int16 v17 = object_getClass(v13);
      if (class_isMetaClass(v17)) {
        uint64_t v18 = 43;
      }
      else {
        uint64_t v18 = 45;
      }
      __int16 v19 = object_getClassName(v13);
      int v20 = sel_getName(a2);
      v16(4, "%c[%{public}s %{public}s]:%i Defaulting to CoreNFCSessionTypeUnknown", v18, v19, v20, 386);
    }
    __int16 v21 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      int v22 = object_getClass(v13);
      if (class_isMetaClass(v22)) {
        int v23 = 43;
      }
      else {
        int v23 = 45;
      }
      int v24 = object_getClassName(v13);
      __int16 v25 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      int v33 = v23;
      __int16 v34 = 2082;
      __int16 v35 = v24;
      __int16 v36 = 2082;
      __int16 v37 = v25;
      __int16 v38 = 1024;
      int v39 = 386;
      _os_log_impl(&dword_2214B8000, v21, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Defaulting to CoreNFCSessionTypeUnknown", buf, 0x22u);
    }

    uint64_t v15 = 4;
  }
  else
  {
    uint64_t v15 = qword_221500EA0[v14];
  }
  unint64_t pollMethod = v13->_pollMethod;
  if ((pollMethod & 2) != 0)
  {
    unint64_t sessionConfig = v13->_sessionConfig;
    uint64_t v29 = 1;
    if ((sessionConfig & 0x40) == 0) {
      uint64_t v29 = 2;
    }
    if ((sessionConfig & 0x10) != 0) {
      uint64_t v27 = 3;
    }
    else {
      uint64_t v27 = v29;
    }
  }
  else if ((pollMethod & 0x1C) != 0)
  {
    uint64_t v27 = 3;
  }
  else
  {
    uint64_t v27 = 0;
  }
  int v30 = [MEMORY[0x263F8C6A0] sessionConfigWithUIMode:v27 sessionType:v15 initialScanText:v13->_alertMessage vasPass:0];
  [(NFCReaderSession *)v13 beginSessionWithConfig:v30];

  objc_sync_exit(v13);
}

- (void)beginSessionWithConfig:(id)a3
{
  id v5 = a3;
  uint64_t v6 = _os_activity_create(&dword_2214B8000, "NFCReaderSession beginSessionWithConfig:", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  os_activity_scope_leave(&state);

  if ((unint64_t)(self->_sessionState - 5) > 1)
  {
    unint64_t pollMethod = self->_pollMethod;
    if ((pollMethod & 0xFFFFFFFFFFFFFFE1) != 0 || (pollMethod & 0x1C) != 0 && (pollMethod & 2) != 0)
    {
      [(NFCReaderSession *)self _resumeDelegateQueue];
      [(NFCReaderSession *)self _invalidateSessionAndActivateCallbackWithCode:1];
    }
    else if (!self->_proxy)
    {
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __43__NFCReaderSession_beginSessionWithConfig___block_invoke;
      v9[3] = &unk_2645B47D0;
      v9[4] = self;
      SEL v11 = a2;
      id v10 = v5;
      [(NFCReaderSession *)self submitBlockOnSessionQueue:v9];
    }
  }
  else
  {
    id v7 = +[NFCError errorWithCode:self->_invalidationCode];
    [(NFCReaderSession *)self _callbackDidInvalidateWithError:v7];
  }
}

void __43__NFCReaderSession_beginSessionWithConfig___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) hardwareManager];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __43__NFCReaderSession_beginSessionWithConfig___block_invoke_2;
  v5[3] = &unk_2645B49C8;
  v5[4] = *(void *)(a1 + 32);
  long long v4 = *(_OWORD *)(a1 + 40);
  id v3 = (id)v4;
  long long v6 = v4;
  [v2 areFeaturesSupported:1 expiry:v5 completion:30.0];
}

void __43__NFCReaderSession_beginSessionWithConfig___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = *(void **)(a1 + 32);
  if (v4)
  {
    void v5[5] = 1;
    [*(id *)(a1 + 32) _resumeDelegateQueue];
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      id v7 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 48));
      uint64_t v19 = [v4 code];
      uint64_t v12 = 45;
      if (isMetaClass) {
        uint64_t v12 = 43;
      }
      v7(3, "%c[%{public}s %{public}s]:%i error:%@, errorCode: 0x%lx", v12, ClassName, Name, 447, v4, v19);
    }
    uint64_t v13 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      unint64_t v14 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v14)) {
        int v15 = 43;
      }
      else {
        int v15 = 45;
      }
      int v16 = object_getClassName(*(id *)(a1 + 32));
      __int16 v17 = sel_getName(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 67110402;
      int v21 = v15;
      __int16 v22 = 2082;
      int v23 = v16;
      __int16 v24 = 2082;
      __int16 v25 = v17;
      __int16 v26 = 1024;
      int v27 = 447;
      __int16 v28 = 2112;
      id v29 = v4;
      __int16 v30 = 2048;
      uint64_t v31 = [v4 code];
      _os_log_impl(&dword_2214B8000, v13, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i error:%@, errorCode: 0x%lx", buf, 0x36u);
    }

    objc_msgSend(*(id *)(a1 + 32), "_invalidateSessionAndActivateCallbackWithCode:", objc_msgSend(v4, "code"));
  }
  else
  {
    uint64_t v18 = [v5 hardwareManager];
    objc_msgSend(v18, "queueReaderSession:sessionConfig:completionHandler:");
  }
}

void __43__NFCReaderSession_beginSessionWithConfig___block_invoke_55(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v9 = a2;
  id v10 = a4;
  id v11 = a5;
  *(void *)(*(void *)(a1 + 32) + 40) = 1;
  [*(id *)(a1 + 32) _resumeDelegateQueue];
  if (v11)
  {
    uint64_t v12 = [v11 domain];
    int v13 = [v12 isEqualToString:@"NFCError"];

    if (v13)
    {
      uint64_t v14 = [v11 code];
    }
    else
    {
      __int16 v17 = [v11 domain];
      int v18 = [v17 isEqualToString:*MEMORY[0x263F07F70]];

      if (v18)
      {
        uint64_t v14 = 202;
      }
      else
      {
        uint64_t Logger = NFLogGetLogger();
        if (Logger)
        {
          int v20 = (void (*)(uint64_t, const char *, ...))Logger;
          Class = object_getClass(*(id *)(a1 + 32));
          BOOL isMetaClass = class_isMetaClass(Class);
          ClassName = object_getClassName(*(id *)(a1 + 32));
          Name = sel_getName(*(SEL *)(a1 + 40));
          uint64_t v24 = 45;
          if (isMetaClass) {
            uint64_t v24 = 43;
          }
          v20(4, "%c[%{public}s %{public}s]:%i Unexpected error type", v24, ClassName, Name, 466);
        }
        __int16 v25 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          __int16 v26 = object_getClass(*(id *)(a1 + 32));
          if (class_isMetaClass(v26)) {
            int v27 = 43;
          }
          else {
            int v27 = 45;
          }
          __int16 v28 = object_getClassName(*(id *)(a1 + 32));
          id v29 = sel_getName(*(SEL *)(a1 + 40));
          *(_DWORD *)buf = 67109890;
          int v42 = v27;
          __int16 v43 = 2082;
          v44 = v28;
          __int16 v45 = 2082;
          int v46 = v29;
          __int16 v47 = 1024;
          int v48 = 466;
          _os_log_impl(&dword_2214B8000, v25, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unexpected error type", buf, 0x22u);
        }

        uint64_t v14 = 1;
      }
    }
    __int16 v30 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v30)
    {
      uint64_t v31 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v31)) {
        uint64_t v32 = 43;
      }
      else {
        uint64_t v32 = 45;
      }
      int v33 = object_getClassName(*(id *)(a1 + 32));
      __int16 v34 = sel_getName(*(SEL *)(a1 + 40));
      v30(3, "%c[%{public}s %{public}s]:%i error:%@, errorCode: 0x%lx", v32, v33, v34, 468, v11, v14);
    }
    __int16 v35 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      __int16 v36 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v36)) {
        int v37 = 43;
      }
      else {
        int v37 = 45;
      }
      __int16 v38 = object_getClassName(*(id *)(a1 + 32));
      int v39 = sel_getName(*(SEL *)(a1 + 40));
      *(_DWORD *)buf = 67110402;
      int v42 = v37;
      __int16 v43 = 2082;
      v44 = v38;
      __int16 v45 = 2082;
      int v46 = v39;
      __int16 v47 = 1024;
      int v48 = 468;
      __int16 v49 = 2112;
      id v50 = v11;
      __int16 v51 = 2048;
      uint64_t v52 = v14;
      _os_log_impl(&dword_2214B8000, v35, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i error:%@, errorCode: 0x%lx", buf, 0x36u);
    }

    [*(id *)(a1 + 32) _invalidateSessionAndActivateCallbackWithCode:v14];
  }
  else
  {
    id v15 = *(id *)(a1 + 32);
    objc_sync_enter(v15);
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 32), a2);
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 104), a4);
    int v16 = [*(id *)(a1 + 32) hardwareManager];
    [v16 addNFCHardwareManagerCallbacksListener:*(void *)(a1 + 32)];

    objc_sync_exit(v15);
  }
}

- (NFCReaderSession)initWithDelegate:(id)a3 queue:(id)a4 pollMethod:(unint64_t)a5
{
  return [(NFCReaderSession *)self initWithDelegate:a3 sessionDelegateType:0 queue:a4 pollMethod:a5 sessionConfig:0];
}

- (NFCReaderSession)initWithDelegate:(id)a3 sessionDelegateType:(int64_t)a4 queue:(id)a5 pollMethod:(unint64_t)a6 sessionConfig:(unint64_t)a7
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v13 = a3;
  id v14 = a5;
  v43.receiver = self;
  v43.super_class = (Class)NFCReaderSession;
  id v15 = [(NFCReaderSession *)&v43 init];
  int v16 = v15;
  if (!v15) {
    goto LABEL_10;
  }
  if (![(NFCReaderSession *)v15 validateDelegate:v13 expectedType:a4])
  {
LABEL_21:
    id v29 = 0;
    goto LABEL_22;
  }
  uint64_t v17 = +[NFCHardwareManager sharedHardwareManager];
  hardwareManager = v16->_hardwareManager;
  v16->_hardwareManager = (NFCHardwareManager *)v17;

  v16->_delegateType = a4;
  objc_storeWeak(&v16->_delegate, v13);
  uint64_t v19 = (const void **)MEMORY[0x263F8C6C0];
  if (v14)
  {
    objc_storeStrong((id *)&v16->_delegateQueue, a5);
  }
  else
  {
    int v20 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v21 = dispatch_queue_create("com.apple.corenfc.readersession.delegate", v20);
    delegateQueue = v16->_delegateQueue;
    v16->_delegateQueue = (OS_dispatch_queue *)v21;

    dispatch_queue_set_specific((dispatch_queue_t)v16->_delegateQueue, *v19, (void *)1, 0);
  }
  int v23 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v24 = dispatch_queue_create("com.apple.corenfc.readersession", v23);
  sessionQueue = v16->_sessionQueue;
  v16->_sessionQueue = (OS_dispatch_queue *)v24;

  dispatch_queue_set_specific((dispatch_queue_t)v16->_sessionQueue, *v19, (void *)1, 0);
  v16->_unint64_t pollMethod = a6;
  v16->_unint64_t sessionConfig = a7;
  dispatch_group_t v26 = dispatch_group_create();
  sessionStartInProgress = v16->_sessionStartInProgress;
  v16->_sessionStartInProgress = (OS_dispatch_group *)v26;

  if (!v16->_delegateQueue || !v16->_sessionQueue || (__int16 v28 = v16->_sessionStartInProgress) == 0)
  {
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      uint64_t v31 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(v16);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(v16);
      Name = sel_getName(a2);
      uint64_t v35 = 45;
      if (isMetaClass) {
        uint64_t v35 = 43;
      }
      v31(3, "%c[%{public}s %{public}s]:%i Dispatch resource init failed", v35, ClassName, Name, 535);
    }
    __int16 v36 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      int v37 = object_getClass(v16);
      if (class_isMetaClass(v37)) {
        int v38 = 43;
      }
      else {
        int v38 = 45;
      }
      int v39 = object_getClassName(v16);
      uint64_t v40 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      int v45 = v38;
      __int16 v46 = 2082;
      __int16 v47 = v39;
      __int16 v48 = 2082;
      __int16 v49 = v40;
      __int16 v50 = 1024;
      int v51 = 535;
      _os_log_impl(&dword_2214B8000, v36, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Dispatch resource init failed", buf, 0x22u);
    }

    goto LABEL_21;
  }
  dispatch_group_enter(v28);
  v16->_int64_t sessionState = 0;
LABEL_10:
  id v29 = v16;
LABEL_22:

  return v29;
}

- (void)_resumeDelegateQueue
{
  obj = self;
  objc_sync_enter(obj);
  if (!obj->_delegateQueueStarted)
  {
    dispatch_group_leave((dispatch_group_t)obj->_sessionStartInProgress);
    obj->_delegateQueueStarted = 1;
  }
  objc_sync_exit(obj);
}

- (void)cleanupNFCHardwareManagerRegistration
{
  id v3 = [(NFCReaderSession *)self hardwareManager];
  [v3 dequeueSession:self];
}

- (BOOL)validateDelegate:(id)a3 expectedType:(int64_t)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v7 = a3;
  uint64_t v8 = v7;
  if (a4 == 1)
  {
    id v9 = &unk_26D39F2B0;
  }
  else
  {
    if ((a4 & 0xFFFFFFFFFFFFFFFELL) != 2) {
      goto LABEL_7;
    }
    id v9 = &unk_26D39CEF0;
  }
  if ([v7 conformsToProtocol:v9])
  {
LABEL_6:
    BOOL v10 = 1;
    goto LABEL_27;
  }
LABEL_7:
  if ([v8 conformsToProtocol:&unk_26D39F1F0])
  {
    BOOL v10 = 1;
    switch(a4)
    {
      case 0:
        goto LABEL_13;
      case 1:
        goto LABEL_14;
      case 2:
      case 3:
        goto LABEL_10;
      case 4:
      case 5:
        break;
      case 6:
        goto LABEL_15;
      default:
        goto LABEL_11;
    }
  }
  else
  {
    switch(a4)
    {
      case 0:
LABEL_13:
        id v11 = @"UNKNOWN";
        break;
      case 1:
LABEL_14:
        id v11 = @"NFCReaderSessionDelegate";
        break;
      case 2:
      case 3:
LABEL_10:
        id v11 = @"NFCTagReaderSessionDelegate";
        break;
      case 4:
      case 5:
        id v11 = @"NFCNDEFReaderSessionDelegate";
        break;
      case 6:
LABEL_15:
        if ([v8 conformsToProtocol:&unk_26D39F310]) {
          goto LABEL_6;
        }
        id v11 = @"NFCVASReaderSessionDelegate";
        break;
      default:
LABEL_11:
        id v11 = 0;
        break;
    }
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      id v13 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v16 = 45;
      if (isMetaClass) {
        uint64_t v16 = 43;
      }
      v13(3, "%c[%{public}s %{public}s]:%i Delegate object does not conform to %@ protocol", v16, ClassName, Name, 604, v11);
    }
    uint64_t v17 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      int v18 = object_getClass(self);
      if (class_isMetaClass(v18)) {
        int v19 = 43;
      }
      else {
        int v19 = 45;
      }
      *(_DWORD *)buf = 67110146;
      int v24 = v19;
      __int16 v25 = 2082;
      dispatch_group_t v26 = object_getClassName(self);
      __int16 v27 = 2082;
      __int16 v28 = sel_getName(a2);
      __int16 v29 = 1024;
      int v30 = 604;
      __int16 v31 = 2112;
      uint64_t v32 = v11;
      _os_log_impl(&dword_2214B8000, v17, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Delegate object does not conform to %@ protocol", buf, 0x2Cu);
    }

    BOOL v10 = 0;
  }
LABEL_27:

  return v10;
}

- (void)_startPollingWithMethod:(unint64_t)a3 sessionConfig:(unint64_t)a4 completionHandler:(id)a5
{
  id v14 = (void (**)(id, NFCReaderSession *))a5;
  id v9 = self;
  objc_sync_enter(v9);
  proxy = v9->_proxy;
  if (!v14 || proxy)
  {
    uint64_t v12 = proxy;
    objc_sync_exit(v9);

    if ((a3 & 0x1C) != 0)
    {
      id v9 = [(NFReaderSessionInterface *)v12 synchronousRemoteObjectProxyWithErrorHandler:v14];
      [(NFCReaderSession *)v9 startPollingForTags:a3 sessionConfig:a4 completion:v14];
    }
    else if ((a3 & 2) != 0)
    {
      id v9 = [(NFReaderSessionInterface *)v12 synchronousRemoteObjectProxyWithErrorHandler:v14];
      [(NFCReaderSession *)v9 startPollingForNDEFMessagesWithSessionConfig:a4 completion:v14];
    }
    else
    {
      id v13 = [MEMORY[0x263F08690] currentHandler];
      [v13 handleFailureInMethod:a2 object:v9 file:@"NFCReaderSession.m" lineNumber:625 description:@"Unsupported poll mode"];

      id v9 = +[NFCError errorWithCode:1];
      v14[2](v14, v9);
    }
  }
  else
  {
    id v11 = +[NFCError errorWithCode:202];
    v14[2](v14, v11);

    objc_sync_exit(v9);
  }
}

- (void)_stopPollingWithCompletionHandler:(id)a3
{
  uint64_t v8 = (void (**)(id, void *))a3;
  id v4 = self;
  objc_sync_enter(v4);
  proxy = v4->_proxy;
  if (!v8 || proxy)
  {
    id v7 = proxy;
    objc_sync_exit(v4);

    id v4 = [(NFReaderSessionInterface *)v7 synchronousRemoteObjectProxyWithErrorHandler:v8];
    [(NFCReaderSession *)v4 stopPollingWithCompletion:v8];
  }
  else
  {
    long long v6 = +[NFCError errorWithCode:202];
    v8[2](v8, v6);

    objc_sync_exit(v4);
  }
}

- (void)_restartPollingWithCompletionHandler:(id)a3
{
  id v9 = (void (**)(id, void *))a3;
  id v4 = self;
  objc_sync_enter(v4);
  proxy = v4->_proxy;
  if (!v9 || proxy)
  {
    id v7 = proxy;
    currentTag = v4->_currentTag;
    v4->_currentTag = 0;

    v4->_int64_t sessionState = 3;
    objc_sync_exit(v4);

    id v4 = [(NFReaderSessionInterface *)v7 synchronousRemoteObjectProxyWithErrorHandler:v9];
    [(NFCReaderSession *)v4 restartPollingWithCompletion:v9];
  }
  else
  {
    long long v6 = +[NFCError errorWithCode:202];
    v9[2](v9, v6);

    objc_sync_exit(v4);
  }
}

- (NFTag)currentTag
{
  id v2 = self;
  objc_sync_enter(v2);
  id v3 = v2->_currentTag;
  objc_sync_exit(v2);

  return v3;
}

- (void)connectTag:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(NFCReaderSession *)self isInvalidated])
  {
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __49__NFCReaderSession_connectTag_completionHandler___block_invoke;
    v14[3] = &unk_2645B4308;
    id v15 = v7;
    id v8 = v7;
    [(NFCReaderSession *)self submitBlockOnDelegateQueue:v14];
    id v9 = v15;
  }
  else
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __49__NFCReaderSession_connectTag_completionHandler___block_invoke_2;
    v11[3] = &unk_2645B4490;
    v11[4] = self;
    id v12 = v6;
    id v13 = v7;
    id v10 = v7;
    [(NFCReaderSession *)self submitBlockOnSessionQueue:v11];

    id v9 = v12;
  }
}

void __49__NFCReaderSession_connectTag_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = +[NFCError errorWithCode:103];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __49__NFCReaderSession_connectTag_completionHandler___block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v11 = 0;
  [v2 connectTag:v3 error:&v11];
  id v4 = v11;
  id v5 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __49__NFCReaderSession_connectTag_completionHandler___block_invoke_3;
  v8[3] = &unk_2645B43F0;
  id v6 = *(id *)(a1 + 48);
  id v9 = v4;
  id v10 = v6;
  id v7 = v4;
  [v5 submitBlockOnDelegateQueue:v8];
}

uint64_t __49__NFCReaderSession_connectTag_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (BOOL)connectTag:(id)a3 error:(id *)a4
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = self;
  objc_sync_enter(v8);
  int64_t sessionState = v8->_sessionState;
  if (sessionState != 4)
  {
    uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger)
    {
      Class = object_getClass(v8);
      if (class_isMetaClass(Class)) {
        uint64_t v13 = 43;
      }
      else {
        uint64_t v13 = 45;
      }
      ClassName = object_getClassName(v8);
      Name = sel_getName(a2);
      Logger(3, "%c[%{public}s %{public}s]:%i Invalid state, %ld", v13, ClassName, Name, 690, v8->_sessionState);
    }
    uint64_t v16 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = object_getClass(v8);
      if (class_isMetaClass(v17)) {
        int v18 = 43;
      }
      else {
        int v18 = 45;
      }
      int v19 = object_getClassName(v8);
      int v20 = sel_getName(a2);
      int64_t v21 = v8->_sessionState;
      *(_DWORD *)buf = 67110146;
      int v35 = v18;
      __int16 v36 = 2082;
      int v37 = v19;
      __int16 v38 = 2082;
      int v39 = v20;
      __int16 v40 = 1024;
      int v41 = 690;
      __int16 v42 = 2048;
      int64_t v43 = v21;
      _os_log_impl(&dword_2214B8000, v16, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid state, %ld", buf, 0x2Cu);
    }

    if (!a4)
    {
      id v10 = 0;
      goto LABEL_33;
    }
    id v22 = +[NFCError errorWithCode:100];
    id v10 = 0;
LABEL_31:
    *a4 = v22;
    goto LABEL_33;
  }
  if ([v7 isEqualToNFTag:v8->_currentTag])
  {
    id v10 = 0;
    if (!a4) {
      goto LABEL_33;
    }
    goto LABEL_30;
  }
  if (v8->_currentTag)
  {
    int v23 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v23)
    {
      int v24 = object_getClass(v8);
      if (class_isMetaClass(v24)) {
        uint64_t v25 = 43;
      }
      else {
        uint64_t v25 = 45;
      }
      dispatch_group_t v26 = object_getClassName(v8);
      __int16 v27 = sel_getName(a2);
      v23(6, "%c[%{public}s %{public}s]:%i Disconnecting previous tag", v25, v26, v27, 697);
    }
    __int16 v28 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v29 = object_getClass(v8);
      if (class_isMetaClass(v29)) {
        int v30 = 43;
      }
      else {
        int v30 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v35 = v30;
      __int16 v36 = 2082;
      int v37 = object_getClassName(v8);
      __int16 v38 = 2082;
      int v39 = sel_getName(a2);
      __int16 v40 = 1024;
      int v41 = 697;
      _os_log_impl(&dword_2214B8000, v28, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Disconnecting previous tag", buf, 0x22u);
    }

    [(NFCReaderSession *)v8 disconnectTagWithError:0];
  }
  id v33 = 0;
  [(NFCReaderSession *)v8 _connectTag:v7 error:&v33];
  id v10 = v33;
  if (a4)
  {
LABEL_30:
    id v22 = v10;
    id v10 = v22;
    goto LABEL_31;
  }
LABEL_33:
  objc_sync_exit(v8);

  if (v10) {
    BOOL v31 = 0;
  }
  else {
    BOOL v31 = sessionState == 4;
  }

  return v31;
}

- (BOOL)_connectTag:(id)a3 error:(id *)a4
{
  v56[2] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = self;
  objc_sync_enter(v8);
  proxy = v8->_proxy;
  if (proxy)
  {
    id v10 = proxy;
    objc_sync_exit(v8);

    uint64_t v39 = 0;
    __int16 v40 = &v39;
    uint64_t v41 = 0x3032000000;
    __int16 v42 = __Block_byref_object_copy__0;
    int64_t v43 = __Block_byref_object_dispose__0;
    id v44 = 0;
    uint64_t v33 = 0;
    __int16 v34 = &v33;
    uint64_t v35 = 0x3032000000;
    __int16 v36 = __Block_byref_object_copy__0;
    int v37 = __Block_byref_object_dispose__0;
    id v38 = 0;
    if (a4) {
      *a4 = 0;
    }
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __38__NFCReaderSession__connectTag_error___block_invoke;
    v32[3] = &unk_2645B4780;
    v32[4] = &v39;
    id v11 = [(NFReaderSessionInterface *)v10 synchronousRemoteObjectProxyWithErrorHandler:v32];
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __38__NFCReaderSession__connectTag_error___block_invoke_2;
    v31[3] = &unk_2645B49F0;
    v31[4] = &v39;
    v31[5] = &v33;
    [v11 connect:v7 completion:v31];

    id v12 = (void *)v40[5];
    BOOL v13 = v12 == 0;
    if (v12)
    {
      id v14 = [v12 domain];
      id v15 = [NSString stringWithUTF8String:"nfcd"];
      int v16 = [v14 isEqualToString:v15];

      if (v16)
      {
        uint64_t v17 = +[NFCError errorWithNFCDError:v40[5] defaultNFCErrorCode:100];
        if ([v17 code] == 203) {
          -[NFCReaderSession _invalidateSessionWithCode:](v8, "_invalidateSessionWithCode:", [v17 code]);
        }
      }
      else
      {
        [(NFCReaderSession *)v8 _invalidateSessionWithCode:202];
        v55[0] = *MEMORY[0x263F08320];
        int v18 = [NSString stringWithUTF8String:"XPC Error"];
        v55[1] = *MEMORY[0x263F08608];
        v56[0] = v18;
        v56[1] = v40[5];
        int v19 = [NSDictionary dictionaryWithObjects:v56 forKeys:v55 count:2];
        uint64_t v17 = +[NFCError errorWithCode:202 userInfo:v19];
      }
      uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (Logger)
      {
        Class = object_getClass(v8);
        if (class_isMetaClass(Class)) {
          uint64_t v22 = 43;
        }
        else {
          uint64_t v22 = 45;
        }
        ClassName = object_getClassName(v8);
        Name = sel_getName(a2);
        Logger(4, "%c[%{public}s %{public}s]:%i %@", v22, ClassName, Name, 748, v17);
      }
      uint64_t v25 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        dispatch_group_t v26 = object_getClass(v8);
        if (class_isMetaClass(v26)) {
          int v27 = 43;
        }
        else {
          int v27 = 45;
        }
        __int16 v28 = object_getClassName(v8);
        __int16 v29 = sel_getName(a2);
        *(_DWORD *)buf = 67110146;
        int v46 = v27;
        __int16 v47 = 2082;
        __int16 v48 = v28;
        __int16 v49 = 2082;
        __int16 v50 = v29;
        __int16 v51 = 1024;
        int v52 = 748;
        __int16 v53 = 2112;
        v54 = v17;
        _os_log_impl(&dword_2214B8000, v25, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %@", buf, 0x2Cu);
      }

      if (a4)
      {
        uint64_t v17 = v17;
        *a4 = v17;
      }
    }
    else
    {
      uint64_t v17 = v8;
      objc_sync_enter(v17);
      objc_storeStrong(v17 + 8, (id)v34[5]);
      objc_sync_exit(v17);
    }

    _Block_object_dispose(&v33, 8);
    _Block_object_dispose(&v39, 8);
  }
  else
  {
    if (a4)
    {
      *a4 = +[NFCError errorWithCode:103];
    }
    objc_sync_exit(v8);

    BOOL v13 = 0;
  }

  return v13;
}

void __38__NFCReaderSession__connectTag_error___block_invoke(uint64_t a1, void *a2)
{
}

void __38__NFCReaderSession__connectTag_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (BOOL)disconnectTagWithError:(id *)a3
{
  v52[2] = *MEMORY[0x263EF8340];
  id v5 = self;
  objc_sync_enter(v5);
  proxy = v5->_proxy;
  if (proxy)
  {
    id v7 = proxy;
    objc_sync_exit(v5);

    uint64_t v33 = 0;
    __int16 v34 = &v33;
    uint64_t v35 = 0x3032000000;
    __int16 v36 = __Block_byref_object_copy__0;
    int v37 = __Block_byref_object_dispose__0;
    id v38 = 0;
    if (a3) {
      *a3 = 0;
    }
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __43__NFCReaderSession_disconnectTagWithError___block_invoke;
    v32[3] = &unk_2645B4780;
    v32[4] = &v33;
    id v8 = [(NFReaderSessionInterface *)v7 synchronousRemoteObjectProxyWithErrorHandler:v32];
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __43__NFCReaderSession_disconnectTagWithError___block_invoke_2;
    v31[3] = &unk_2645B4780;
    v31[4] = &v33;
    [v8 disconnectWithCardRemoval:0 completion:v31];

    id v9 = (void *)v34[5];
    BOOL v10 = v9 == 0;
    if (v9)
    {
      id v11 = [v9 domain];
      id v12 = [NSString stringWithUTF8String:"nfcd"];
      int v13 = [v11 isEqualToString:v12];

      if (v13)
      {
        v51[0] = *MEMORY[0x263F08320];
        id v14 = [NSString stringWithUTF8String:"Stack Error"];
        v51[1] = *MEMORY[0x263F08608];
        v52[0] = v14;
        v52[1] = v34[5];
        id v15 = [NSDictionary dictionaryWithObjects:v52 forKeys:v51 count:2];
        +[NFCError errorWithCode:100 userInfo:v15];
      }
      else
      {
        [(NFCReaderSession *)v5 _invalidateSessionWithCode:202];
        v49[0] = *MEMORY[0x263F08320];
        id v14 = [NSString stringWithUTF8String:"XPC Error"];
        v49[1] = *MEMORY[0x263F08608];
        v50[0] = v14;
        v50[1] = v34[5];
        id v15 = [NSDictionary dictionaryWithObjects:v50 forKeys:v49 count:2];
        +[NFCError errorWithCode:202 userInfo:v15];
      uint64_t v17 = };

      uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (Logger)
      {
        Class = object_getClass(v5);
        if (class_isMetaClass(Class)) {
          uint64_t v20 = 43;
        }
        else {
          uint64_t v20 = 45;
        }
        ClassName = object_getClassName(v5);
        Name = sel_getName(a2);
        Logger(4, "%c[%{public}s %{public}s]:%i %@", v20, ClassName, Name, 796, v17);
      }
      int v23 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        int v24 = object_getClass(v5);
        if (class_isMetaClass(v24)) {
          int v25 = 43;
        }
        else {
          int v25 = 45;
        }
        dispatch_group_t v26 = object_getClassName(v5);
        int v27 = sel_getName(a2);
        *(_DWORD *)buf = 67110146;
        int v40 = v25;
        __int16 v41 = 2082;
        __int16 v42 = v26;
        __int16 v43 = 2082;
        id v44 = v27;
        __int16 v45 = 1024;
        int v46 = 796;
        __int16 v47 = 2112;
        __int16 v48 = v17;
        _os_log_impl(&dword_2214B8000, v23, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %@", buf, 0x2Cu);
      }

      if (a3) {
        *a3 = v17;
      }
    }
    __int16 v28 = v5;
    objc_sync_enter(v28);
    currentTag = v28->_currentTag;
    v28->_currentTag = 0;

    objc_sync_exit(v28);
    _Block_object_dispose(&v33, 8);
  }
  else
  {
    if (a3)
    {
      *a3 = +[NFCError errorWithCode:103];
    }
    int v16 = v5->_currentTag;
    v5->_currentTag = 0;

    objc_sync_exit(v5);
    BOOL v10 = 0;
  }

  return v10;
}

void __43__NFCReaderSession_disconnectTagWithError___block_invoke(uint64_t a1, void *a2)
{
}

void __43__NFCReaderSession_disconnectTagWithError___block_invoke_2(uint64_t a1, void *a2)
{
}

- (BOOL)checkPresenceWithError:(id *)a3
{
  void v51[2] = *MEMORY[0x263EF8340];
  id v5 = self;
  objc_sync_enter(v5);
  proxy = v5->_proxy;
  if (proxy)
  {
    id v7 = proxy;
    objc_sync_exit(v5);

    uint64_t v34 = 0;
    uint64_t v35 = &v34;
    uint64_t v36 = 0x3032000000;
    int v37 = __Block_byref_object_copy__0;
    id v38 = __Block_byref_object_dispose__0;
    id v39 = 0;
    uint64_t v30 = 0;
    BOOL v31 = &v30;
    uint64_t v32 = 0x2020000000;
    char v33 = 0;
    if (a3) {
      *a3 = 0;
    }
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __43__NFCReaderSession_checkPresenceWithError___block_invoke;
    v29[3] = &unk_2645B4780;
    v29[4] = &v34;
    id v8 = [(NFReaderSessionInterface *)v7 synchronousRemoteObjectProxyWithErrorHandler:v29];
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __43__NFCReaderSession_checkPresenceWithError___block_invoke_2;
    v28[3] = &unk_2645B4A18;
    v28[4] = &v30;
    v28[5] = &v34;
    [v8 checkPresenceWithCompletion:v28];

    id v9 = (void *)v35[5];
    if (v9)
    {
      BOOL v10 = [v9 domain];
      id v11 = [NSString stringWithUTF8String:"nfcd"];
      int v12 = [v10 isEqualToString:v11];

      if (v12)
      {
        int v13 = +[NFCError errorWithNFCDError:v35[5] defaultNFCErrorCode:100];
        if ([v13 code] == 203) {
          -[NFCReaderSession _invalidateSessionWithCode:](v5, "_invalidateSessionWithCode:", [v13 code]);
        }
      }
      else
      {
        [(NFCReaderSession *)v5 _invalidateSessionWithCode:202];
        v50[0] = *MEMORY[0x263F08320];
        id v15 = [NSString stringWithUTF8String:"XPC Error"];
        v50[1] = *MEMORY[0x263F08608];
        v51[0] = v15;
        v51[1] = v35[5];
        int v16 = [NSDictionary dictionaryWithObjects:v51 forKeys:v50 count:2];
        int v13 = +[NFCError errorWithCode:202 userInfo:v16];
      }
      uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (Logger)
      {
        Class = object_getClass(v5);
        if (class_isMetaClass(Class)) {
          uint64_t v19 = 43;
        }
        else {
          uint64_t v19 = 45;
        }
        ClassName = object_getClassName(v5);
        Name = sel_getName(a2);
        Logger(4, "%c[%{public}s %{public}s]:%i %@", v19, ClassName, Name, 845, v13);
      }
      uint64_t v22 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        int v23 = object_getClass(v5);
        if (class_isMetaClass(v23)) {
          int v24 = 43;
        }
        else {
          int v24 = 45;
        }
        int v25 = object_getClassName(v5);
        dispatch_group_t v26 = sel_getName(a2);
        *(_DWORD *)buf = 67110146;
        int v41 = v24;
        __int16 v42 = 2082;
        __int16 v43 = v25;
        __int16 v44 = 2082;
        __int16 v45 = v26;
        __int16 v46 = 1024;
        int v47 = 845;
        __int16 v48 = 2112;
        __int16 v49 = v13;
        _os_log_impl(&dword_2214B8000, v22, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %@", buf, 0x2Cu);
      }

      if (a3) {
        *a3 = v13;
      }
    }
    BOOL v14 = *((unsigned char *)v31 + 24) != 0;
    _Block_object_dispose(&v30, 8);
    _Block_object_dispose(&v34, 8);
  }
  else
  {
    if (a3)
    {
      *a3 = +[NFCError errorWithCode:103];
    }
    objc_sync_exit(v5);

    BOOL v14 = 0;
  }

  return v14;
}

void __43__NFCReaderSession_checkPresenceWithError___block_invoke(uint64_t a1, void *a2)
{
}

void __43__NFCReaderSession_checkPresenceWithError___block_invoke_2(uint64_t a1, void *a2, char a3)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
}

- (id)transceive:(id)a3 tagUpdate:(id *)a4 error:(id *)a5
{
  v69[2] = *MEMORY[0x263EF8340];
  id v9 = a3;
  BOOL v10 = self;
  objc_sync_enter(v10);
  proxy = v10->_proxy;
  if (proxy)
  {
    int v12 = proxy;
    objc_sync_exit(v10);

    uint64_t v50 = 0;
    __int16 v51 = &v50;
    uint64_t v52 = 0x3032000000;
    __int16 v53 = __Block_byref_object_copy__0;
    v54 = __Block_byref_object_dispose__0;
    id v55 = 0;
    uint64_t v44 = 0;
    __int16 v45 = &v44;
    uint64_t v46 = 0x3032000000;
    int v47 = __Block_byref_object_copy__0;
    __int16 v48 = __Block_byref_object_dispose__0;
    id v49 = 0;
    uint64_t v38 = 0;
    id v39 = &v38;
    uint64_t v40 = 0x3032000000;
    int v41 = __Block_byref_object_copy__0;
    __int16 v42 = __Block_byref_object_dispose__0;
    id v43 = 0;
    if (a5) {
      *a5 = 0;
    }
    v37[0] = MEMORY[0x263EF8330];
    v37[1] = 3221225472;
    v37[2] = __47__NFCReaderSession_transceive_tagUpdate_error___block_invoke;
    v37[3] = &unk_2645B4780;
    v37[4] = &v50;
    int v13 = [(NFReaderSessionInterface *)v12 synchronousRemoteObjectProxyWithErrorHandler:v37];
    v36[0] = MEMORY[0x263EF8330];
    v36[1] = 3221225472;
    v36[2] = __47__NFCReaderSession_transceive_tagUpdate_error___block_invoke_2;
    v36[3] = &unk_2645B4A40;
    v36[4] = &v44;
    v36[5] = &v50;
    v36[6] = &v38;
    [v13 transceive:v9 completion:v36];

    BOOL v14 = (void *)v51[5];
    if (v14)
    {
      id v15 = [v14 domain];
      int v16 = [NSString stringWithUTF8String:"nfcd"];
      int v17 = [v15 isEqualToString:v16];

      if (v17)
      {
        if ([(id)v51[5] code] == 10)
        {
          v68[0] = *MEMORY[0x263F08320];
          int v18 = [NSString stringWithUTF8String:"Stack Error"];
          v68[1] = *MEMORY[0x263F08608];
          v69[0] = v18;
          v69[1] = v51[5];
          uint64_t v19 = [NSDictionary dictionaryWithObjects:v69 forKeys:v68 count:2];
          uint64_t v20 = +[NFCError errorWithCode:102 userInfo:v19];
        }
        else
        {
          uint64_t v20 = +[NFCError errorWithNFCDError:v51[5] defaultNFCErrorCode:100];
        }
        if ([v20 code] == 203) {
          -[NFCReaderSession _invalidateSessionWithCode:](v10, "_invalidateSessionWithCode:", [v20 code]);
        }
      }
      else
      {
        [(NFCReaderSession *)v10 _invalidateSessionWithCode:202];
        v66[0] = *MEMORY[0x263F08320];
        uint64_t v22 = [NSString stringWithUTF8String:"XPC Error"];
        v66[1] = *MEMORY[0x263F08608];
        v67[0] = v22;
        v67[1] = v51[5];
        int v23 = [NSDictionary dictionaryWithObjects:v67 forKeys:v66 count:2];
        uint64_t v20 = +[NFCError errorWithCode:202 userInfo:v23];
      }
      uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (Logger)
      {
        Class = object_getClass(v10);
        if (class_isMetaClass(Class)) {
          uint64_t v26 = 43;
        }
        else {
          uint64_t v26 = 45;
        }
        ClassName = object_getClassName(v10);
        Name = sel_getName(a2);
        Logger(4, "%c[%{public}s %{public}s]:%i %@", v26, ClassName, Name, 897, v20);
      }
      __int16 v29 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        uint64_t v30 = object_getClass(v10);
        if (class_isMetaClass(v30)) {
          int v31 = 43;
        }
        else {
          int v31 = 45;
        }
        uint64_t v32 = object_getClassName(v10);
        char v33 = sel_getName(a2);
        *(_DWORD *)buf = 67110146;
        int v57 = v31;
        __int16 v58 = 2082;
        __int16 v59 = v32;
        __int16 v60 = 2082;
        uint64_t v61 = v33;
        __int16 v62 = 1024;
        int v63 = 897;
        __int16 v64 = 2112;
        v65 = v20;
        _os_log_impl(&dword_2214B8000, v29, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %@", buf, 0x2Cu);
      }

      if (a5) {
        *a5 = v20;
      }
    }
    uint64_t v34 = v10;
    objc_sync_enter(v34);
    objc_storeStrong(v34 + 8, (id)v39[5]);
    objc_sync_exit(v34);

    if (a4) {
      *a4 = (id) v39[5];
    }
    id v21 = (id)v45[5];
    _Block_object_dispose(&v38, 8);

    _Block_object_dispose(&v44, 8);
    _Block_object_dispose(&v50, 8);
  }
  else
  {
    if (a5)
    {
      *a5 = +[NFCError errorWithCode:103];
    }
    objc_sync_exit(v10);

    id v21 = 0;
  }

  return v21;
}

void __47__NFCReaderSession_transceive_tagUpdate_error___block_invoke(uint64_t a1, void *a2)
{
}

void __47__NFCReaderSession_transceive_tagUpdate_error___block_invoke_2(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = *(void *)(a1[4] + 8);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v8;
  id v17 = v8;

  uint64_t v12 = *(void *)(a1[5] + 8);
  int v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v9;
  id v14 = v9;

  uint64_t v15 = *(void *)(a1[6] + 8);
  int v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v7;
}

- (void)restartPolling
{
  if (![(NFCReaderSession *)self isInvalidated])
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __34__NFCReaderSession_restartPolling__block_invoke;
    v3[3] = &unk_2645B45A8;
    v3[4] = self;
    [(NFCReaderSession *)self submitBlockOnSessionQueue:v3];
  }
}

uint64_t __34__NFCReaderSession_restartPolling__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __34__NFCReaderSession_restartPolling__block_invoke_2;
  v3[3] = &unk_2645B4A68;
  v3[4] = v1;
  return [v1 _restartPollingWithCompletionHandler:v3];
}

uint64_t __34__NFCReaderSession_restartPolling__block_invoke_2(uint64_t result, uint64_t a2)
{
  if (a2) {
    return [*(id *)(result + 32) _invalidateSessionWithCode:202];
  }
  return result;
}

- (void)_callbackDidInvalidateWithError:(id)a3
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = v5;
  if (!self->_sessionState)
  {
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      id v9 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v13 = 45;
      if (isMetaClass) {
        uint64_t v13 = 43;
      }
      v9(5, "%c[%{public}s %{public}s]:%i Session has not begun", v13, ClassName, Name, 927);
    }
    id v14 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    uint64_t v15 = object_getClass(self);
    if (class_isMetaClass(v15)) {
      int v16 = 43;
    }
    else {
      int v16 = 45;
    }
    *(_DWORD *)buf = 67109890;
    int v43 = v16;
    __int16 v44 = 2082;
    __int16 v45 = object_getClassName(self);
    __int16 v46 = 2082;
    int v47 = sel_getName(a2);
    __int16 v48 = 1024;
    int v49 = 927;
    id v17 = "%c[%{public}s %{public}s]:%i Session has not begun";
    int v18 = v14;
    os_log_type_t v19 = OS_LOG_TYPE_DEFAULT;
    uint32_t v20 = 34;
    goto LABEL_13;
  }
  if (self->_delegateType == 1)
  {
    v40[0] = MEMORY[0x263EF8330];
    v40[1] = 3221225472;
    v40[2] = __52__NFCReaderSession__callbackDidInvalidateWithError___block_invoke;
    v40[3] = &unk_2645B4508;
    v40[4] = self;
    id v41 = v5;
    [(NFCReaderSession *)self submitBlockOnDelegateQueue:v40];
    id v7 = v41;
LABEL_18:

    goto LABEL_19;
  }
  if ([(NFCReaderSession *)self delegateType] == 2
    || [(NFCReaderSession *)self delegateType] == 3)
  {
    v38[0] = MEMORY[0x263EF8330];
    v38[1] = 3221225472;
    v38[2] = __52__NFCReaderSession__callbackDidInvalidateWithError___block_invoke_2;
    v38[3] = &unk_2645B4508;
    v38[4] = self;
    id v39 = v6;
    [(NFCReaderSession *)self submitBlockOnDelegateQueue:v38];
    id v7 = v39;
    goto LABEL_18;
  }
  if ([(NFCReaderSession *)self delegateType] == 4
    || [(NFCReaderSession *)self delegateType] == 5)
  {
    v36[0] = MEMORY[0x263EF8330];
    v36[1] = 3221225472;
    v36[2] = __52__NFCReaderSession__callbackDidInvalidateWithError___block_invoke_3;
    v36[3] = &unk_2645B4508;
    v36[4] = self;
    id v37 = v6;
    [(NFCReaderSession *)self submitBlockOnDelegateQueue:v36];
    id v7 = v37;
    goto LABEL_18;
  }
  if ([(NFCReaderSession *)self delegateType] == 6)
  {
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = __52__NFCReaderSession__callbackDidInvalidateWithError___block_invoke_4;
    v34[3] = &unk_2645B4508;
    v34[4] = self;
    id v35 = v6;
    [(NFCReaderSession *)self submitBlockOnDelegateQueue:v34];
    id v7 = v35;
    goto LABEL_18;
  }
  uint64_t v21 = NFLogGetLogger();
  if (v21)
  {
    uint64_t v22 = (void (*)(uint64_t, const char *, ...))v21;
    int v23 = object_getClass(self);
    BOOL v24 = class_isMetaClass(v23);
    int v25 = object_getClassName(self);
    uint64_t v26 = sel_getName(a2);
    uint64_t v27 = 45;
    if (v24) {
      uint64_t v27 = 43;
    }
    v22(4, "%c[%{public}s %{public}s]:%i Unknown delegate type: %ld", v27, v25, v26, 948, self->_delegateType);
  }
  id v14 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    __int16 v28 = object_getClass(self);
    if (class_isMetaClass(v28)) {
      int v29 = 43;
    }
    else {
      int v29 = 45;
    }
    uint64_t v30 = object_getClassName(self);
    int v31 = sel_getName(a2);
    int64_t delegateType = self->_delegateType;
    *(_DWORD *)buf = 67110146;
    int v43 = v29;
    __int16 v44 = 2082;
    __int16 v45 = v30;
    __int16 v46 = 2082;
    int v47 = v31;
    __int16 v48 = 1024;
    int v49 = 948;
    __int16 v50 = 2048;
    int64_t v51 = delegateType;
    id v17 = "%c[%{public}s %{public}s]:%i Unknown delegate type: %ld";
    int v18 = v14;
    os_log_type_t v19 = OS_LOG_TYPE_ERROR;
    uint32_t v20 = 44;
LABEL_13:
    _os_log_impl(&dword_2214B8000, v18, v19, v17, buf, v20);
  }
LABEL_14:

LABEL_19:
}

void __52__NFCReaderSession__callbackDidInvalidateWithError___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 readerSession:*(void *)(a1 + 32) didInvalidateWithError:*(void *)(a1 + 40)];
}

void __52__NFCReaderSession__callbackDidInvalidateWithError___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 tagReaderSession:*(void *)(a1 + 32) didInvalidateWithError:*(void *)(a1 + 40)];
}

void __52__NFCReaderSession__callbackDidInvalidateWithError___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 readerSession:*(void *)(a1 + 32) didInvalidateWithError:*(void *)(a1 + 40)];
}

void __52__NFCReaderSession__callbackDidInvalidateWithError___block_invoke_4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 readerSession:*(void *)(a1 + 32) didInvalidateWithError:*(void *)(a1 + 40)];
}

- (void)_invalidateSessionWithCode:(int64_t)a3
{
}

- (void)_invalidateSessionAndActivateCallbackWithCode:(int64_t)a3
{
}

- (void)_invalidateSessionWithCode:(int64_t)a3 message:(id)a4 finalUIState:(int64_t)a5 activateCallback:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v11 = a4;
  uint64_t v12 = self;
  objc_sync_enter(v12);
  if ((unint64_t)(v12->_sessionState - 5) >= 2)
  {
    uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger)
    {
      Class = object_getClass(v12);
      if (class_isMetaClass(Class)) {
        uint64_t v15 = 43;
      }
      else {
        uint64_t v15 = 45;
      }
      ClassName = object_getClassName(v12);
      Name = sel_getName(a2);
      Logger(6, "%c[%{public}s %{public}s]:%i code=%ld, finalUIState=%ld, activateCallback=%ld", v15, ClassName, Name, 975, a3, a5, v6);
    }
    int v18 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      os_log_type_t v19 = object_getClass(v12);
      if (class_isMetaClass(v19)) {
        int v20 = 43;
      }
      else {
        int v20 = 45;
      }
      *(_DWORD *)buf = 67110658;
      int v45 = v20;
      __int16 v46 = 2082;
      int v47 = object_getClassName(v12);
      __int16 v48 = 2082;
      int v49 = sel_getName(a2);
      __int16 v50 = 1024;
      int v51 = 975;
      __int16 v52 = 2048;
      int64_t v53 = a3;
      __int16 v54 = 2048;
      int64_t v55 = a5;
      __int16 v56 = 2048;
      BOOL v57 = v6;
      _os_log_impl(&dword_2214B8000, v18, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i code=%ld, finalUIState=%ld, activateCallback=%ld", buf, 0x40u);
    }

    if (v12->_sessionState > 2uLL)
    {
      if (v11)
      {
        proxy = v12->_proxy;
        v43[0] = MEMORY[0x263EF8330];
        v43[1] = 3221225472;
        v43[2] = __85__NFCReaderSession__invalidateSessionWithCode_message_finalUIState_activateCallback___block_invoke;
        v43[3] = &unk_2645B4928;
        v43[4] = v12;
        v43[5] = a2;
        uint64_t v22 = [(NFReaderSessionInterface *)proxy synchronousRemoteObjectProxyWithErrorHandler:v43];
        v42[0] = MEMORY[0x263EF8330];
        v42[1] = 3221225472;
        v42[2] = __85__NFCReaderSession__invalidateSessionWithCode_message_finalUIState_activateCallback___block_invoke_157;
        v42[3] = &unk_2645B4928;
        v42[4] = v12;
        v42[5] = a2;
        [v22 updateSharingUIScanText:v11 completion:v42];
      }
      if (a5 == 2)
      {
        unint64_t delegateType = v12->_delegateType;
        if (delegateType <= 6)
        {
          if (((1 << delegateType) & 0x6C) != 0)
          {
            BOOL v24 = v12->_proxy;
            v41[0] = MEMORY[0x263EF8330];
            v41[1] = 3221225472;
            v41[2] = __85__NFCReaderSession__invalidateSessionWithCode_message_finalUIState_activateCallback___block_invoke_158;
            v41[3] = &unk_2645B4928;
            v41[4] = v12;
            v41[5] = a2;
            int v25 = [(NFReaderSessionInterface *)v24 synchronousRemoteObjectProxyWithErrorHandler:v41];
            v40[0] = MEMORY[0x263EF8330];
            v40[1] = 3221225472;
            v40[2] = __85__NFCReaderSession__invalidateSessionWithCode_message_finalUIState_activateCallback___block_invoke_159;
            v40[3] = &unk_2645B4928;
            v40[4] = v12;
            void v40[5] = a2;
            [v25 updateSharingUIStateOnInvalidation:2 completion:v40];
          }
          else
          {
            uint64_t v26 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
            if (v26)
            {
              uint64_t v27 = object_getClass(v12);
              if (class_isMetaClass(v27)) {
                uint64_t v28 = 43;
              }
              else {
                uint64_t v28 = 45;
              }
              int v29 = object_getClassName(v12);
              uint64_t v30 = sel_getName(a2);
              v26(4, "%c[%{public}s %{public}s]:%i Session does not support invalidation with error", v28, v29, v30, 1002);
            }
            int v31 = NFSharedLogGetLogger();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
            {
              uint64_t v32 = object_getClass(v12);
              if (class_isMetaClass(v32)) {
                int v33 = 43;
              }
              else {
                int v33 = 45;
              }
              uint64_t v34 = object_getClassName(v12);
              id v35 = sel_getName(a2);
              *(_DWORD *)buf = 67109890;
              int v45 = v33;
              __int16 v46 = 2082;
              int v47 = v34;
              __int16 v48 = 2082;
              int v49 = v35;
              __int16 v50 = 1024;
              int v51 = 1002;
              _os_log_impl(&dword_2214B8000, v31, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session does not support invalidation with error", buf, 0x22u);
            }
          }
        }
      }
    }
    else
    {
      [(NFCReaderSession *)v12 cleanupNFCHardwareManagerRegistration];
    }
    uint64_t v36 = [(NFReaderSessionInterface *)v12->_proxy remoteObjectProxy];
    [v36 endSession:&__block_literal_global_1];

    sessionId = v12->_sessionId;
    v12->_sessionId = 0;

    currentTag = v12->_currentTag;
    v12->_currentTag = 0;

    v12->_int64_t sessionState = 5;
    v12->_uint64_t invalidationCode = a3;
  }
  if (v6)
  {
    id v39 = +[NFCError errorWithCode:v12->_invalidationCode];
    [(NFCReaderSession *)v12 _callbackDidInvalidateWithError:v39];
  }
  objc_sync_exit(v12);
}

void __85__NFCReaderSession__invalidateSessionWithCode_message_finalUIState_activateCallback___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v5 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 40));
    uint64_t v8 = 45;
    if (isMetaClass) {
      uint64_t v8 = 43;
    }
    v5(4, "%c[%{public}s %{public}s]:%i XPC error: %@", v8, ClassName, Name, 981, v3);
  }
  id v9 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    uint64_t v10 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v10)) {
      int v11 = 43;
    }
    else {
      int v11 = 45;
    }
    uint64_t v12 = object_getClassName(*(id *)(a1 + 32));
    uint64_t v13 = sel_getName(*(SEL *)(a1 + 40));
    *(_DWORD *)buf = 67110146;
    int v17 = v11;
    __int16 v18 = 2082;
    os_log_type_t v19 = v12;
    __int16 v20 = 2082;
    uint64_t v21 = v13;
    __int16 v22 = 1024;
    int v23 = 981;
    __int16 v24 = 2112;
    id v25 = v3;
    _os_log_impl(&dword_2214B8000, v9, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i XPC error: %@", buf, 0x2Cu);
  }
}

void __85__NFCReaderSession__invalidateSessionWithCode_message_finalUIState_activateCallback___block_invoke_157(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      id v5 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 40));
      uint64_t v8 = 45;
      if (isMetaClass) {
        uint64_t v8 = 43;
      }
      v5(3, "%c[%{public}s %{public}s]:%i %@", v8, ClassName, Name, 983, v3);
    }
    id v9 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v10)) {
        int v11 = 43;
      }
      else {
        int v11 = 45;
      }
      uint64_t v12 = object_getClassName(*(id *)(a1 + 32));
      uint64_t v13 = sel_getName(*(SEL *)(a1 + 40));
      *(_DWORD *)buf = 67110146;
      int v17 = v11;
      __int16 v18 = 2082;
      os_log_type_t v19 = v12;
      __int16 v20 = 2082;
      uint64_t v21 = v13;
      __int16 v22 = 1024;
      int v23 = 983;
      __int16 v24 = 2112;
      id v25 = v3;
      _os_log_impl(&dword_2214B8000, v9, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %@", buf, 0x2Cu);
    }
  }
}

void __85__NFCReaderSession__invalidateSessionWithCode_message_finalUIState_activateCallback___block_invoke_158(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v5 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 40));
    uint64_t v8 = 45;
    if (isMetaClass) {
      uint64_t v8 = 43;
    }
    v5(4, "%c[%{public}s %{public}s]:%i XPC error: %@", v8, ClassName, Name, 994, v3);
  }
  id v9 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    uint64_t v10 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v10)) {
      int v11 = 43;
    }
    else {
      int v11 = 45;
    }
    uint64_t v12 = object_getClassName(*(id *)(a1 + 32));
    uint64_t v13 = sel_getName(*(SEL *)(a1 + 40));
    *(_DWORD *)buf = 67110146;
    int v17 = v11;
    __int16 v18 = 2082;
    os_log_type_t v19 = v12;
    __int16 v20 = 2082;
    uint64_t v21 = v13;
    __int16 v22 = 1024;
    int v23 = 994;
    __int16 v24 = 2112;
    id v25 = v3;
    _os_log_impl(&dword_2214B8000, v9, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i XPC error: %@", buf, 0x2Cu);
  }
}

void __85__NFCReaderSession__invalidateSessionWithCode_message_finalUIState_activateCallback___block_invoke_159(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      id v5 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 40));
      uint64_t v8 = 45;
      if (isMetaClass) {
        uint64_t v8 = 43;
      }
      v5(3, "%c[%{public}s %{public}s]:%i %@", v8, ClassName, Name, 996, v3);
    }
    id v9 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v10)) {
        int v11 = 43;
      }
      else {
        int v11 = 45;
      }
      uint64_t v12 = object_getClassName(*(id *)(a1 + 32));
      uint64_t v13 = sel_getName(*(SEL *)(a1 + 40));
      *(_DWORD *)buf = 67110146;
      int v17 = v11;
      __int16 v18 = 2082;
      os_log_type_t v19 = v12;
      __int16 v20 = 2082;
      uint64_t v21 = v13;
      __int16 v22 = 1024;
      int v23 = 996;
      __int16 v24 = 2112;
      id v25 = v3;
      _os_log_impl(&dword_2214B8000, v9, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %@", buf, 0x2Cu);
    }
  }
}

- (NFReaderSessionInterface)readerProxy
{
  id v2 = self;
  objc_sync_enter(v2);
  id v3 = v2->_proxy;
  objc_sync_exit(v2);

  return v3;
}

+ (BOOL)readingAvailable
{
  return +[NFCReaderSession featureAvailable:1];
}

+ (BOOL)featureAvailable:(unint64_t)a3
{
  id v4 = 0;
  int v5 = 5;
  useconds_t v6 = 100000;
  while (1)
  {
    id v7 = v4;
    uint64_t v8 = +[NFCHardwareManager sharedHardwareManager];
    id v11 = v4;
    char v9 = [v8 areFeaturesSupported:a3 outError:&v11];
    id v4 = v11;

    if (!v4 || [v4 code] == 1) {
      break;
    }
    usleep(v6);
    v6 += 100000;
    if (!--v5)
    {
      char v9 = 0;
      break;
    }
  }

  return v9;
}

- (id)ndefStatus:(int64_t *)a3 maxMessageLength:(unint64_t *)a4
{
  useconds_t v6 = self;
  objc_sync_enter(v6);
  proxy = v6->_proxy;
  if (proxy)
  {
    uint64_t v8 = proxy;
    objc_sync_exit(v6);

    uint64_t v25 = 0;
    uint64_t v26 = &v25;
    uint64_t v27 = 0x2020000000;
    uint64_t v28 = 0;
    uint64_t v19 = 0;
    __int16 v20 = &v19;
    uint64_t v21 = 0x3032000000;
    __int16 v22 = __Block_byref_object_copy__0;
    int v23 = __Block_byref_object_dispose__0;
    id v24 = 0;
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __48__NFCReaderSession_ndefStatus_maxMessageLength___block_invoke;
    v18[3] = &unk_2645B4780;
    v18[4] = &v19;
    char v9 = [(NFReaderSessionInterface *)v8 synchronousRemoteObjectProxyWithErrorHandler:v18];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __48__NFCReaderSession_ndefStatus_maxMessageLength___block_invoke_2;
    v17[3] = &unk_2645B4A90;
    v17[4] = &v19;
    void v17[5] = &v25;
    v17[6] = a4;
    [v9 checkNdefSupportWithCompletion:v17];

    if (a3) {
      *a3 = v26[3];
    }
    uint64_t v10 = +[NFCError errorWithNFCDError:v20[5] defaultNFCErrorCode:104];
    id v11 = (void *)v20[5];
    v20[5] = v10;

    uint64_t v12 = v20;
    uint64_t v13 = (void *)v20[5];
    if (v13)
    {
      uint64_t v14 = [v13 code];
      uint64_t v12 = v20;
      if (v14 == 203)
      {
        -[NFCReaderSession _invalidateSessionWithCode:](v6, "_invalidateSessionWithCode:", [(id)v20[5] code]);
        uint64_t v12 = v20;
      }
    }
    id v15 = (id)v12[5];
    _Block_object_dispose(&v19, 8);

    _Block_object_dispose(&v25, 8);
  }
  else
  {
    if (a3) {
      *a3 = 0;
    }
    id v15 = +[NFCError errorWithCode:103];
    objc_sync_exit(v6);
  }

  return v15;
}

void __48__NFCReaderSession_ndefStatus_maxMessageLength___block_invoke(uint64_t a1, void *a2)
{
}

void __48__NFCReaderSession_ndefStatus_maxMessageLength___block_invoke_2(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v9 = a4;
  objc_storeStrong((id *)(*(void *)(a1[4] + 8) + 40), a4);
  if (!v9)
  {
    if ((unint64_t)(a2 - 1) <= 3) {
      *(void *)(*(void *)(a1[5] + 8) + 24) = a2;
    }
    uint64_t v8 = (void *)a1[6];
    if (v8) {
      *uint64_t v8 = a3;
    }
  }
}

- (id)readNdefMessageWithError:(id *)a3
{
  id v4 = self;
  objc_sync_enter(v4);
  if (!v4->_currentTag)
  {
    if (a3)
    {
      uint64_t v10 = 104;
LABEL_13:
      *a3 = +[NFCError errorWithCode:v10];
    }
LABEL_14:
    objc_sync_exit(v4);

    id v9 = 0;
    goto LABEL_15;
  }
  proxy = v4->_proxy;
  if (!proxy)
  {
    if (a3)
    {
      uint64_t v10 = 103;
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  useconds_t v6 = proxy;
  objc_sync_exit(v4);

  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  int v23 = __Block_byref_object_copy__0;
  id v24 = __Block_byref_object_dispose__0;
  id v25 = 0;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  int v17 = __Block_byref_object_copy__0;
  __int16 v18 = __Block_byref_object_dispose__0;
  id v19 = 0;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __45__NFCReaderSession_readNdefMessageWithError___block_invoke;
  v13[3] = &unk_2645B4780;
  v13[4] = &v14;
  id v7 = [(NFReaderSessionInterface *)v6 synchronousRemoteObjectProxyWithErrorHandler:v13];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __45__NFCReaderSession_readNdefMessageWithError___block_invoke_2;
  v12[3] = &unk_2645B4AB8;
  v12[4] = &v14;
  v12[5] = &v20;
  [v7 ndefReadWithCompletion:v12];

  if (a3) {
    *a3 = (id) v15[5];
  }
  uint64_t v8 = (void *)v15[5];
  if (v8 && [v8 code] == 203) {
    -[NFCReaderSession _invalidateSessionWithCode:](v4, "_invalidateSessionWithCode:", [(id)v15[5] code]);
  }
  id v9 = (id)v21[5];
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
LABEL_15:

  return v9;
}

void __45__NFCReaderSession_readNdefMessageWithError___block_invoke(uint64_t a1, void *a2)
{
}

void __45__NFCReaderSession_readNdefMessageWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  useconds_t v6 = v5;
  if (v11)
  {
    id v7 = +[NFCError errorWithNFCDError:v11 defaultNFCErrorCode:104];
LABEL_3:
    uint64_t v8 = *(void *)(a1 + 32);
    goto LABEL_6;
  }
  if (!v5)
  {
    id v7 = +[NFCError errorWithCode:403];
    goto LABEL_3;
  }
  id v7 = [[NFCNDEFMessage alloc] initWithNFNdefMessage:v5];
  uint64_t v8 = *(void *)(a1 + 40);
LABEL_6:
  uint64_t v9 = *(void *)(v8 + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v7;
}

- (id)_convertMessageToInternal:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v15 = a3;
  id v16 = objc_alloc_init(MEMORY[0x263F8C690]);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = [v15 records];
  uint64_t v3 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v20 != v5) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        int v18 = 0;
        uint64_t v8 = (void *)MEMORY[0x263F8C698];
        uint64_t v9 = [v7 typeNameFormat];
        uint64_t v10 = [v7 type];
        id v11 = [v7 identifier];
        uint64_t v12 = [v7 payload];
        uint64_t v13 = objc_msgSend(v8, "recordsWithTNF:type:identifier:payload:chunkSize:outError:", v9, v10, v11, v12, objc_msgSend(v7, "chunkSize"), &v18);

        if (!v18) {
          [v16 addRecordArray:v13];
        }
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v4);
  }

  return v16;
}

- (BOOL)writeNdefMessage:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (!v6)
  {
    if (a4)
    {
      +[NFCError errorWithCode:403];
      BOOL v12 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_19;
    }
LABEL_18:
    BOOL v12 = 0;
    goto LABEL_19;
  }
  id v7 = self;
  objc_sync_enter(v7);
  if (!v7->_currentTag)
  {
    if (a4)
    {
      uint64_t v14 = 104;
LABEL_16:
      *a4 = +[NFCError errorWithCode:v14];
    }
LABEL_17:
    objc_sync_exit(v7);

    goto LABEL_18;
  }
  proxy = v7->_proxy;
  if (!proxy)
  {
    if (a4)
    {
      uint64_t v14 = 103;
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  uint64_t v9 = proxy;
  objc_sync_exit(v7);

  uint64_t v18 = 0;
  long long v19 = &v18;
  uint64_t v20 = 0x3032000000;
  long long v21 = __Block_byref_object_copy__0;
  long long v22 = __Block_byref_object_dispose__0;
  id v23 = 0;
  uint64_t v10 = [(NFCReaderSession *)v7 _convertMessageToInternal:v6];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __43__NFCReaderSession_writeNdefMessage_error___block_invoke;
  v17[3] = &unk_2645B4780;
  v17[4] = &v18;
  id v11 = [(NFReaderSessionInterface *)v9 synchronousRemoteObjectProxyWithErrorHandler:v17];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __43__NFCReaderSession_writeNdefMessage_error___block_invoke_2;
  v16[3] = &unk_2645B4780;
  v16[4] = &v18;
  [v11 ndefWrite:v10 completion:v16];

  BOOL v12 = a4 == 0;
  if (a4) {
    *a4 = (id) v19[5];
  }
  uint64_t v13 = (void *)v19[5];
  if (v13 && [v13 code] == 203) {
    -[NFCReaderSession _invalidateSessionWithCode:](v7, "_invalidateSessionWithCode:", [(id)v19[5] code]);
  }

  _Block_object_dispose(&v18, 8);
LABEL_19:

  return v12;
}

void __43__NFCReaderSession_writeNdefMessage_error___block_invoke(uint64_t a1, void *a2)
{
}

uint64_t __43__NFCReaderSession_writeNdefMessage_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = +[NFCError errorWithNFCDError:a2 defaultNFCErrorCode:401];

  return MEMORY[0x270F9A758]();
}

- (id)writeLockNdef
{
  id v2 = self;
  objc_sync_enter(v2);
  if (!v2->_currentTag)
  {
    uint64_t v12 = 104;
LABEL_9:
    id v11 = +[NFCError errorWithCode:v12];
    objc_sync_exit(v2);

    goto LABEL_10;
  }
  proxy = v2->_proxy;
  if (!proxy)
  {
    uint64_t v12 = 103;
    goto LABEL_9;
  }
  uint64_t v4 = proxy;
  objc_sync_exit(v2);

  uint64_t v16 = 0;
  int v17 = &v16;
  uint64_t v18 = 0x3032000000;
  long long v19 = __Block_byref_object_copy__0;
  uint64_t v20 = __Block_byref_object_dispose__0;
  id v21 = 0;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __33__NFCReaderSession_writeLockNdef__block_invoke;
  v15[3] = &unk_2645B4780;
  v15[4] = &v16;
  uint64_t v5 = [(NFReaderSessionInterface *)v4 synchronousRemoteObjectProxyWithErrorHandler:v15];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __33__NFCReaderSession_writeLockNdef__block_invoke_2;
  v14[3] = &unk_2645B4780;
  void v14[4] = &v16;
  [v5 writeProtectNDEFTagWithCompletion:v14];

  uint64_t v6 = +[NFCError errorWithNFCDError:v17[5] defaultNFCErrorCode:401];
  id v7 = (void *)v17[5];
  void v17[5] = v6;

  uint64_t v8 = v17;
  uint64_t v9 = (void *)v17[5];
  if (v9)
  {
    uint64_t v10 = [v9 code];
    uint64_t v8 = v17;
    if (v10 == 203)
    {
      -[NFCReaderSession _invalidateSessionWithCode:](v2, "_invalidateSessionWithCode:", [(id)v17[5] code]);
      uint64_t v8 = v17;
    }
  }
  id v11 = (id)v8[5];
  _Block_object_dispose(&v16, 8);

LABEL_10:

  return v11;
}

void __33__NFCReaderSession_writeLockNdef__block_invoke(uint64_t a1, void *a2)
{
}

void __33__NFCReaderSession_writeLockNdef__block_invoke_2(uint64_t a1, void *a2)
{
}

- (unint64_t)pollMethod
{
  return self->_pollMethod;
}

- (void)setPollMethod:(unint64_t)a3
{
  self->_unint64_t pollMethod = a3;
}

- (unint64_t)sessionConfig
{
  return self->_sessionConfig;
}

- (void)setSessionConfig:(unint64_t)a3
{
  self->_unint64_t sessionConfig = a3;
}

- (NSNumber)sessionId
{
  return self->_sessionId;
}

- (int64_t)delegateType
{
  return self->_delegateType;
}

- (NFCHardwareManager)hardwareManager
{
  return self->_hardwareManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hardwareManager, 0);
  objc_storeStrong((id *)&self->_sessionId, 0);
  objc_storeStrong((id *)&self->_alertMessage, 0);
  objc_storeStrong((id *)&self->_sessionStartInProgress, 0);
  objc_storeStrong((id *)&self->_currentTag, 0);
  objc_storeStrong((id *)&self->_proxy, 0);
  objc_storeStrong((id *)&self->_sessionQueue, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);

  objc_destroyWeak(&self->_delegate);
}

@end