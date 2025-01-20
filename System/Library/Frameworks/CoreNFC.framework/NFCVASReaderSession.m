@interface NFCVASReaderSession
+ (BOOL)readingAvailable;
- (NFCVASReaderSession)initWithDelegate:(id)a3 sessionDelegateType:(int64_t)a4 queue:(id)a5 pollMethod:(unint64_t)a6 sessionConfig:(unint64_t)a7;
- (NFCVASReaderSession)initWithVASCommandConfigurations:(NSArray *)commandConfigurations delegate:(id)delegate queue:(dispatch_queue_t)queue;
- (id)_convertVASConfigToInternalRequest:(id)a3;
- (id)_convertVASResponseToExternal:(id)a3;
- (id)_sendVASRequests:(id)a3 error:(id *)a4;
- (void)_callbackDidBecomeActive;
- (void)beginSession;
- (void)dealloc;
- (void)didDetectTags:(id)a3 connectedTagIndex:(unint64_t)a4;
- (void)didTerminate:(id)a3;
@end

@implementation NFCVASReaderSession

- (NFCVASReaderSession)initWithDelegate:(id)a3 sessionDelegateType:(int64_t)a4 queue:(id)a5 pollMethod:(unint64_t)a6 sessionConfig:(unint64_t)a7
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [MEMORY[0x263EFF940] exceptionWithName:@"Unavailable initializer" reason:@"Not available" userInfo:0];
  objc_exception_throw(v10);
}

- (NFCVASReaderSession)initWithVASCommandConfigurations:(NSArray *)commandConfigurations delegate:(id)delegate queue:(dispatch_queue_t)queue
{
  id v8 = commandConfigurations;
  id v9 = delegate;
  id v10 = queue;
  v23.receiver = self;
  v23.super_class = (Class)NFCVASReaderSession;
  v11 = [(NFCReaderSession *)&v23 initWithDelegate:v9 sessionDelegateType:6 queue:v10 pollMethod:8 sessionConfig:8];
  if (v11)
  {
    objc_initWeak(&location, v11);
    v12 = [MEMORY[0x263F08A98] predicateWithBlock:&__block_literal_global_0];
    uint64_t v13 = [(NSArray *)v8 filteredArrayUsingPredicate:v12];
    vasConfig = v11->_vasConfig;
    v11->_vasConfig = (NSArray *)v13;

    id v15 = objc_alloc(MEMORY[0x263F8C6B0]);
    uint64_t v20 = MEMORY[0x263EF8330];
    objc_copyWeak(&v21, &location);
    v16 = [(NFCReaderSession *)v11 sessionQueue];
    uint64_t v17 = [v15 initWithCallback:&v20 queue:v16];
    presenceCheckTimer = v11->_presenceCheckTimer;
    v11->_presenceCheckTimer = (NFTimer *)v17;

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }

  return v11;
}

BOOL __71__NFCVASReaderSession_initWithVASCommandConfigurations_delegate_queue___block_invoke(uint64_t a1, void *a2)
{
  return [a2 mode] == 1;
}

void __71__NFCVASReaderSession_initWithVASCommandConfigurations_delegate_queue___block_invoke_2(uint64_t a1)
{
  v2 = _os_activity_create(&dword_2214B8000, "com.apple.nfcd.vas.presenceCheckTimer", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v2, &state);
  os_activity_scope_leave(&state);

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    id v7 = 0;
    int v5 = [WeakRetained checkPresenceWithError:&v7];
    id v6 = v7;
    if (v5)
    {
      [v4[16] startTimer:0.5];
    }
    else
    {
      [v4 disconnectTagWithError:0];
      [v4 restartPolling];
    }
  }
}

- (void)dealloc
{
  [(NFTimer *)self->_presenceCheckTimer stopTimer];
  v3.receiver = self;
  v3.super_class = (Class)NFCVASReaderSession;
  [(NFCReaderSession *)&v3 dealloc];
}

- (void)beginSession
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  objc_super v3 = _os_activity_create(&dword_2214B8000, "NFCVASReaderSession beginSessionWithConfig:", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v3, &state);
  os_activity_scope_leave(&state);

  v4 = self;
  objc_sync_enter(v4);
  int v5 = objc_opt_new();
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = v4->_vasConfig;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        v11 = (void *)MEMORY[0x263F8C6B8];
        uint64_t v12 = [v10 mode];
        uint64_t v13 = [v10 passTypeIdentifier];
        v14 = [v11 passConfigWithMode:v12 passIdentifier:v13];
        [v5 addObject:v14];
      }
      uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  id v15 = (void *)MEMORY[0x263F8C6A0];
  v16 = [(NFCReaderSession *)v4 alertMessage];
  uint64_t v17 = [v15 sessionConfigWithUIMode:3 sessionType:3 initialScanText:v16 vasPass:v5];

  v18.receiver = v4;
  v18.super_class = (Class)NFCVASReaderSession;
  [(NFCReaderSession *)&v18 beginSessionWithConfig:v17];

  objc_sync_exit(v4);
}

+ (BOOL)readingAvailable
{
  return +[NFCReaderSession featureAvailable:32];
}

- (void)_callbackDidBecomeActive
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  if ([(NFCReaderSession *)self delegateType] != 6)
  {
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      uint64_t v7 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      int64_t v28 = [(NFCReaderSession *)self delegateType];
      uint64_t v12 = 45;
      if (isMetaClass) {
        uint64_t v12 = 43;
      }
      v7(4, "%c[%{public}s %{public}s]:%i Unknown delegate type: %ld", v12, ClassName, Name, 181, v28);
    }
    uint64_t v13 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      goto LABEL_23;
    }
    v14 = object_getClass(self);
    if (class_isMetaClass(v14)) {
      int v15 = 43;
    }
    else {
      int v15 = 45;
    }
    *(_DWORD *)buf = 67110146;
    int v31 = v15;
    __int16 v32 = 2082;
    v33 = object_getClassName(self);
    __int16 v34 = 2082;
    v35 = sel_getName(a2);
    __int16 v36 = 1024;
    int v37 = 181;
    __int16 v38 = 2048;
    int64_t v39 = [(NFCReaderSession *)self delegateType];
    v16 = "%c[%{public}s %{public}s]:%i Unknown delegate type: %ld";
    uint64_t v17 = v13;
    uint32_t v18 = 44;
    goto LABEL_22;
  }
  v4 = [(NFCReaderSession *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __47__NFCVASReaderSession__callbackDidBecomeActive__block_invoke;
    v29[3] = &unk_2645B45A8;
    v29[4] = self;
    [(NFCReaderSession *)self submitBlockOnDelegateQueue:v29];
    return;
  }
  uint64_t v19 = NFLogGetLogger();
  if (v19)
  {
    long long v20 = (void (*)(uint64_t, const char *, ...))v19;
    long long v21 = object_getClass(self);
    BOOL v22 = class_isMetaClass(v21);
    objc_super v23 = object_getClassName(self);
    v27 = sel_getName(a2);
    uint64_t v24 = 45;
    if (v22) {
      uint64_t v24 = 43;
    }
    v20(4, "%c[%{public}s %{public}s]:%i Delegate does not implement -readerSessionDidBecomeActive: method", v24, v23, v27, 178);
  }
  uint64_t v13 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    uint64_t v25 = object_getClass(self);
    if (class_isMetaClass(v25)) {
      int v26 = 43;
    }
    else {
      int v26 = 45;
    }
    *(_DWORD *)buf = 67109890;
    int v31 = v26;
    __int16 v32 = 2082;
    v33 = object_getClassName(self);
    __int16 v34 = 2082;
    v35 = sel_getName(a2);
    __int16 v36 = 1024;
    int v37 = 178;
    v16 = "%c[%{public}s %{public}s]:%i Delegate does not implement -readerSessionDidBecomeActive: method";
    uint64_t v17 = v13;
    uint32_t v18 = 34;
LABEL_22:
    _os_log_impl(&dword_2214B8000, v17, OS_LOG_TYPE_ERROR, v16, buf, v18);
  }
LABEL_23:
}

void __47__NFCVASReaderSession__callbackDidBecomeActive__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 readerSessionDidBecomeActive:*(void *)(a1 + 32)];
}

- (id)_sendVASRequests:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v19 = 0;
  long long v20 = &v19;
  uint64_t v21 = 0x3032000000;
  BOOL v22 = __Block_byref_object_copy_;
  objc_super v23 = __Block_byref_object_dispose_;
  id v24 = 0;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy_;
  uint64_t v17 = __Block_byref_object_dispose_;
  id v18 = 0;
  uint64_t v7 = [(NFCReaderSession *)self readerProxy];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __46__NFCVASReaderSession__sendVASRequests_error___block_invoke;
  v12[3] = &unk_2645B4780;
  v12[4] = &v19;
  uint64_t v8 = [v7 synchronousRemoteObjectProxyWithErrorHandler:v12];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __46__NFCVASReaderSession__sendVASRequests_error___block_invoke_2;
  v11[3] = &unk_2645B47A8;
  v11[4] = &v19;
  v11[5] = &v13;
  [v8 performVAS:v6 completion:v11];

  if (a4) {
    *a4 = (id) v20[5];
  }
  id v9 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);

  return v9;
}

void __46__NFCVASReaderSession__sendVASRequests_error___block_invoke(uint64_t a1, void *a2)
{
}

void __46__NFCVASReaderSession__sendVASRequests_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)_convertVASConfigToInternalRequest:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  id v5 = [v3 passTypeIdentifier];
  [v4 setObject:v5 forKeyedSubscript:@"MerchantId"];

  id v6 = [v3 url];
  [v4 setObject:v6 forKeyedSubscript:@"SignupUrl"];

  uint64_t v7 = [NSNumber numberWithInt:2];
  [v4 setObject:v7 forKeyedSubscript:@"TerminalCap"];

  uint64_t v8 = [v3 mode];
  uint64_t v9 = [NSNumber numberWithInt:v8 != 0];
  [v4 setObject:v9 forKeyedSubscript:@"TerminalProtocol"];

  return v4;
}

- (id)_convertVASResponseToExternal:(id)a3
{
  id v3 = a3;
  v4 = [v3 objectForKeyedSubscript:@"PassData"];
  id v5 = [v3 objectForKeyedSubscript:@"Token"];
  id v6 = [v3 objectForKeyedSubscript:@"StatusCode"];

  uint64_t v7 = -[NFCVASResponse initWithStatus:data:mobileToken:]([NFCVASResponse alloc], "initWithStatus:data:mobileToken:", [v6 unsignedShortValue], v4, v5);

  return v7;
}

- (void)didTerminate:(id)a3
{
  presenceCheckTimer = self->_presenceCheckTimer;
  id v5 = a3;
  [(NFTimer *)presenceCheckTimer stopTimer];
  v6.receiver = self;
  v6.super_class = (Class)NFCVASReaderSession;
  [(NFCReaderSession *)&v6 didTerminate:v5];
}

- (void)didDetectTags:(id)a3 connectedTagIndex:(unint64_t)a4
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v7 = a3;
  v32.receiver = self;
  v32.super_class = (Class)NFCVASReaderSession;
  [(NFCReaderSession *)&v32 didDetectTags:v7 connectedTagIndex:a4];
  id v8 = [(NFCReaderSession *)self currentTag];
  if ([v8 type] != 3)
  {

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v9 = v7;
    id v8 = (id)[v9 countByEnumeratingWithState:&v28 objects:v41 count:16];
    if (v8)
    {
      uint64_t v10 = *(void *)v29;
      while (2)
      {
        for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v29 != v10) {
            objc_enumerationMutation(v9);
          }
          uint64_t v12 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          if ([v12 type] == 3)
          {
            id v8 = v12;
            goto LABEL_12;
          }
        }
        id v8 = (id)[v9 countByEnumeratingWithState:&v28 objects:v41 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  if (v8)
  {
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __55__NFCVASReaderSession_didDetectTags_connectedTagIndex___block_invoke;
    v25[3] = &unk_2645B47D0;
    v25[4] = self;
    id v26 = v8;
    SEL v27 = a2;
    [(NFCReaderSession *)self submitBlockOnSessionQueue:v25];
  }
  else
  {
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      v14 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v18 = 45;
      if (isMetaClass) {
        uint64_t v18 = 43;
      }
      v14(4, "%c[%{public}s %{public}s]:%i Restart polling", v18, ClassName, Name, 295);
    }
    uint64_t v19 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      long long v20 = object_getClass(self);
      if (class_isMetaClass(v20)) {
        int v21 = 43;
      }
      else {
        int v21 = 45;
      }
      BOOL v22 = object_getClassName(self);
      objc_super v23 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      int v34 = v21;
      __int16 v35 = 2082;
      __int16 v36 = v22;
      __int16 v37 = 2082;
      __int16 v38 = v23;
      __int16 v39 = 1024;
      int v40 = 295;
      _os_log_impl(&dword_2214B8000, v19, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Restart polling", buf, 0x22u);
    }

    [(NFCReaderSession *)self restartPolling];
  }
}

void __55__NFCVASReaderSession_didDetectTags_connectedTagIndex___block_invoke(uint64_t a1)
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) connectTag:*(void *)(a1 + 40) error:0])
  {
    id v2 = objc_opt_new();
    if ([*(id *)(*(void *)(a1 + 32) + 136) count])
    {
      unint64_t v3 = 0;
      do
      {
        v4 = [*(id *)(*(void *)(a1 + 32) + 136) objectAtIndex:v3];
        id v5 = [*(id *)(a1 + 32) _convertVASConfigToInternalRequest:v4];
        [v2 addObject:v5];

        ++v3;
      }
      while ([*(id *)(*(void *)(a1 + 32) + 136) count] > v3);
    }
    objc_super v6 = objc_opt_new();
    id v7 = *(void **)(a1 + 32);
    id v35 = 0;
    id v8 = [v7 _sendVASRequests:v2 error:&v35];
    id v9 = v35;
    if (v8)
    {
      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      id v10 = v8;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v31 objects:v44 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v32;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v32 != v13) {
              objc_enumerationMutation(v10);
            }
            uint64_t v15 = [*(id *)(a1 + 32) _convertVASResponseToExternal:*(void *)(*((void *)&v31 + 1) + 8 * i)];
            [v6 addObject:v15];
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v31 objects:v44 count:16];
        }
        while (v12);
      }
    }
    if ([v6 count])
    {
      v16 = *(void **)(a1 + 32);
      v29[0] = MEMORY[0x263EF8330];
      v29[1] = 3221225472;
      v29[2] = __55__NFCVASReaderSession_didDetectTags_connectedTagIndex___block_invoke_2;
      v29[3] = &unk_2645B4508;
      v29[4] = v16;
      id v30 = v6;
      [v16 submitBlockOnDelegateQueue:v29];
    }
    [*(id *)(*(void *)(a1 + 32) + 128) startTimer:0.5];
  }
  else
  {
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      uint64_t v18 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 48));
      uint64_t v22 = 45;
      if (isMetaClass) {
        uint64_t v22 = 43;
      }
      v18(4, "%c[%{public}s %{public}s]:%i Restart polling", v22, ClassName, Name, 290);
    }
    objc_super v23 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      id v24 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v24)) {
        int v25 = 43;
      }
      else {
        int v25 = 45;
      }
      id v26 = object_getClassName(*(id *)(a1 + 32));
      SEL v27 = sel_getName(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 67109890;
      int v37 = v25;
      __int16 v38 = 2082;
      __int16 v39 = v26;
      __int16 v40 = 2082;
      v41 = v27;
      __int16 v42 = 1024;
      int v43 = 290;
      _os_log_impl(&dword_2214B8000, v23, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Restart polling", buf, 0x22u);
    }

    [*(id *)(a1 + 32) restartPolling];
  }
}

void __55__NFCVASReaderSession_didDetectTags_connectedTagIndex___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 readerSession:*(void *)(a1 + 32) didReceiveVASResponses:*(void *)(a1 + 40)];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vasConfig, 0);

  objc_storeStrong((id *)&self->_presenceCheckTimer, 0);
}

@end