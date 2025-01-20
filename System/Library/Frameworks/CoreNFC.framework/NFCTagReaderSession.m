@interface NFCTagReaderSession
+ (BOOL)readingAvailable;
- (NFCTagReaderSession)initWithDelegate:(id)a3 sessionDelegateType:(int64_t)a4 queue:(id)a5 pollMethod:(unint64_t)a6 sessionConfig:(unint64_t)a7;
- (NFCTagReaderSession)initWithPollingOption:(NFCPollingOption)pollingOption delegate:(id)delegate queue:(dispatch_queue_t)queue;
- (NFCTagReaderSession)initWithPollingOption:(int64_t)a3 delegate:(id)a4 delegateType:(int64_t)a5 queue:(id)a6;
- (NFCTagReaderSession)initWithPollingOption:(int64_t)a3 swiftDelegate:(id)a4 queue:(id)a5;
- (id)connectedTag;
- (void)_callbackDidBecomeActive;
- (void)connectToTag:(id)tag completionHandler:(void *)completionHandler;
- (void)didDetectTags:(id)a3 connectedTagIndex:(unint64_t)a4;
- (void)restartPolling;
@end

@implementation NFCTagReaderSession

- (NFCTagReaderSession)initWithDelegate:(id)a3 sessionDelegateType:(int64_t)a4 queue:(id)a5 pollMethod:(unint64_t)a6 sessionConfig:(unint64_t)a7
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [MEMORY[0x263EFF940] exceptionWithName:@"Unavailable initializer" reason:@"Not available" userInfo:0];
  objc_exception_throw(v10);
}

- (NFCTagReaderSession)initWithPollingOption:(int64_t)a3 delegate:(id)a4 delegateType:(int64_t)a5 queue:(id)a6
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v11 = a4;
  id v12 = a6;
  if ((unint64_t)(a3 - 1) >= 0xF)
  {
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      v16 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v19 = 45;
      if (isMetaClass) {
        uint64_t v19 = 43;
      }
      v16(3, "%c[%{public}s %{public}s]:%i Invalid NFCPollingOption parameter: 0x%lx", v19, ClassName, Name, 46, a3);
    }
    v20 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = object_getClass(self);
      if (class_isMetaClass(v21)) {
        int v22 = 43;
      }
      else {
        int v22 = 45;
      }
      *(_DWORD *)buf = 67110146;
      int v39 = v22;
      __int16 v40 = 2082;
      v41 = object_getClassName(self);
      __int16 v42 = 2082;
      v43 = sel_getName(a2);
      __int16 v44 = 1024;
      int v45 = 46;
      __int16 v46 = 2048;
      int64_t v47 = a3;
      _os_log_impl(&dword_2214B8000, v20, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid NFCPollingOption parameter: 0x%lx", buf, 0x2Cu);
    }

    v23 = 0;
  }
  else
  {
    if ((a3 & 8) != 0)
    {
      uint64_t v24 = NFLogGetLogger();
      if (v24)
      {
        v25 = (void (*)(uint64_t, const char *, ...))v24;
        v26 = object_getClass(self);
        BOOL v27 = class_isMetaClass(v26);
        v28 = object_getClassName(self);
        v36 = sel_getName(a2);
        uint64_t v29 = 45;
        if (v27) {
          uint64_t v29 = 43;
        }
        v25(6, "%c[%{public}s %{public}s]:%i PACE-polling enabled", v29, v28, v36, 57);
      }
      v30 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        v31 = object_getClass(self);
        if (class_isMetaClass(v31)) {
          int v32 = 43;
        }
        else {
          int v32 = 45;
        }
        *(_DWORD *)buf = 67109890;
        int v39 = v32;
        __int16 v40 = 2082;
        v41 = object_getClassName(self);
        __int16 v42 = 2082;
        v43 = sel_getName(a2);
        __int16 v44 = 1024;
        int v45 = 57;
        _os_log_impl(&dword_2214B8000, v30, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i PACE-polling enabled", buf, 0x22u);
      }

      uint64_t v14 = 1030;
      unint64_t v13 = 8;
    }
    else
    {
      unint64_t v13 = (__rbit32(a3) >> 28) & 0xCLL | (16 * (((unint64_t)a3 >> 2) & 1));
      uint64_t v14 = 6;
    }
    v37.receiver = self;
    v37.super_class = (Class)NFCTagReaderSession;
    self = [(NFCReaderSession *)&v37 initWithDelegate:v11 sessionDelegateType:a5 queue:v12 pollMethod:v13 sessionConfig:v14];
    v23 = self;
  }

  return v23;
}

- (NFCTagReaderSession)initWithPollingOption:(NFCPollingOption)pollingOption delegate:(id)delegate queue:(dispatch_queue_t)queue
{
  return [(NFCTagReaderSession *)self initWithPollingOption:pollingOption delegate:delegate delegateType:2 queue:queue];
}

- (NFCTagReaderSession)initWithPollingOption:(int64_t)a3 swiftDelegate:(id)a4 queue:(id)a5
{
  objc_storeStrong(&self->_swiftDelegateWrapper, a4);
  id v9 = a4;
  id v10 = a5;
  id v11 = [(NFCTagReaderSession *)self initWithPollingOption:a3 delegate:v9 delegateType:3 queue:v10];

  return v11;
}

- (void)restartPolling
{
  v3 = _os_activity_create(&dword_2214B8000, "NFCTagReaderSession restartPolling", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v3, &state);
  os_activity_scope_leave(&state);

  v4 = self;
  objc_sync_enter(v4);
  connectedTag = v4->_connectedTag;
  v4->_connectedTag = 0;

  objc_sync_exit(v4);
  v6.receiver = v4;
  v6.super_class = (Class)NFCTagReaderSession;
  [(NFCReaderSession *)&v6 restartPolling];
}

- (void)connectToTag:(id)tag completionHandler:(void *)completionHandler
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v8 = tag;
  id v9 = completionHandler;
  id v10 = _os_activity_create(&dword_2214B8000, "NFCTagReaderSession connectToTag:completionHandler:", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  *(void *)os_activity_scope_state_s state = 0;
  *(void *)&state[8] = 0;
  os_activity_scope_enter(v10, (os_activity_scope_state_t)state);
  os_activity_scope_leave((os_activity_scope_state_t)state);

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = v8;
    id v42 = 0;
    char v12 = [v11 isMatchingSession:self outError:&v42];
    id v13 = v42;
    if (v12)
    {
      uint64_t v14 = self;
      objc_sync_enter(v14);
      objc_storeStrong((id *)&v14->_connectedTag, tag);
      id v15 = v11;
      v36[0] = MEMORY[0x263EF8330];
      v36[1] = 3221225472;
      v36[2] = __54__NFCTagReaderSession_connectToTag_completionHandler___block_invoke_26;
      v36[3] = &unk_2645B4738;
      v36[4] = v14;
      id v38 = v9;
      id v37 = v13;
      [v15 _connectWithCompletionHandler:v36];

      objc_sync_exit(v14);
    }
    else
    {
      v39[0] = MEMORY[0x263EF8330];
      v39[1] = 3221225472;
      v39[2] = __54__NFCTagReaderSession_connectToTag_completionHandler___block_invoke_24;
      v39[3] = &unk_2645B43F0;
      v41 = v9;
      id v40 = v13;
      [(NFCReaderSession *)self submitBlockOnDelegateQueue:v39];
      uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (Logger)
      {
        Class = object_getClass(self);
        if (class_isMetaClass(Class)) {
          uint64_t v28 = 43;
        }
        else {
          uint64_t v28 = 45;
        }
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        Logger(3, "%c[%{public}s %{public}s]:%i Only tag from the current session is allowed", v28, ClassName, Name, 113);
      }
      v31 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        int v32 = object_getClass(self);
        if (class_isMetaClass(v32)) {
          int v33 = 43;
        }
        else {
          int v33 = 45;
        }
        v34 = object_getClassName(self);
        v35 = sel_getName(a2);
        *(_DWORD *)os_activity_scope_state_s state = 67109890;
        *(_DWORD *)&state[4] = v33;
        *(_WORD *)&state[8] = 2082;
        *(void *)&state[10] = v34;
        __int16 v46 = 2082;
        int64_t v47 = v35;
        __int16 v48 = 1024;
        int v49 = 113;
        _os_log_impl(&dword_2214B8000, v31, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Only tag from the current session is allowed", state, 0x22u);
      }

      uint64_t v14 = v41;
    }
  }
  else
  {
    v43[0] = MEMORY[0x263EF8330];
    v43[1] = 3221225472;
    v43[2] = __54__NFCTagReaderSession_connectToTag_completionHandler___block_invoke;
    v43[3] = &unk_2645B4308;
    id v44 = v9;
    [(NFCReaderSession *)self submitBlockOnDelegateQueue:v43];
    v16 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v16)
    {
      v17 = object_getClass(self);
      if (class_isMetaClass(v17)) {
        uint64_t v18 = 43;
      }
      else {
        uint64_t v18 = 45;
      }
      uint64_t v19 = object_getClassName(self);
      v20 = sel_getName(a2);
      v16(3, "%c[%{public}s %{public}s]:%i Invalid tag object", v18, v19, v20, 103);
    }
    v21 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      int v22 = object_getClass(self);
      if (class_isMetaClass(v22)) {
        int v23 = 43;
      }
      else {
        int v23 = 45;
      }
      uint64_t v24 = object_getClassName(self);
      v25 = sel_getName(a2);
      *(_DWORD *)os_activity_scope_state_s state = 67109890;
      *(_DWORD *)&state[4] = v23;
      *(_WORD *)&state[8] = 2082;
      *(void *)&state[10] = v24;
      __int16 v46 = 2082;
      int64_t v47 = v25;
      __int16 v48 = 1024;
      int v49 = 103;
      _os_log_impl(&dword_2214B8000, v21, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid tag object", state, 0x22u);
    }

    id v11 = v44;
  }
}

void __54__NFCTagReaderSession_connectToTag_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = +[NFCError errorWithCode:3];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

uint64_t __54__NFCTagReaderSession_connectToTag_completionHandler___block_invoke_24(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __54__NFCTagReaderSession_connectToTag_completionHandler___block_invoke_26(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v3 = *(id *)(a1 + 32);
    objc_sync_enter(v3);
    uint64_t v4 = *(void *)(a1 + 32);
    v5 = *(void **)(v4 + 136);
    *(void *)(v4 + 136) = 0;

    objc_sync_exit(v3);
  }
  objc_super v6 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v6();
}

+ (BOOL)readingAvailable
{
  return +[NFCReaderSession featureAvailable:16];
}

- (void)_callbackDidBecomeActive
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  if ([(NFCReaderSession *)self delegateType] != 2
    && [(NFCReaderSession *)self delegateType] != 3)
  {
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      uint64_t v19 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      int64_t v28 = [(NFCReaderSession *)self delegateType];
      uint64_t v24 = 45;
      if (isMetaClass) {
        uint64_t v24 = 43;
      }
      v19(4, "%c[%{public}s %{public}s]:%i Unknown delegate type: %ld", v24, ClassName, Name, 148, v28);
    }
    char v12 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_24;
    }
    v25 = object_getClass(self);
    if (class_isMetaClass(v25)) {
      int v26 = 43;
    }
    else {
      int v26 = 45;
    }
    *(_DWORD *)buf = 67110146;
    int v31 = v26;
    __int16 v32 = 2082;
    int v33 = object_getClassName(self);
    __int16 v34 = 2082;
    v35 = sel_getName(a2);
    __int16 v36 = 1024;
    int v37 = 148;
    __int16 v38 = 2048;
    int64_t v39 = [(NFCReaderSession *)self delegateType];
    id v15 = "%c[%{public}s %{public}s]:%i Unknown delegate type: %ld";
    v16 = v12;
    uint32_t v17 = 44;
    goto LABEL_23;
  }
  uint64_t v4 = [(NFCReaderSession *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __47__NFCTagReaderSession__callbackDidBecomeActive__block_invoke;
    v29[3] = &unk_2645B45A8;
    v29[4] = self;
    [(NFCReaderSession *)self submitBlockOnDelegateQueue:v29];
    return;
  }
  uint64_t v6 = NFLogGetLogger();
  if (v6)
  {
    v7 = (void (*)(uint64_t, const char *, ...))v6;
    id v8 = object_getClass(self);
    BOOL v9 = class_isMetaClass(v8);
    id v10 = object_getClassName(self);
    BOOL v27 = sel_getName(a2);
    uint64_t v11 = 45;
    if (v9) {
      uint64_t v11 = 43;
    }
    v7(4, "%c[%{public}s %{public}s]:%i Delegate does not implement -tagReaderSessionDidBecomeActive: method", v11, v10, v27, 145);
  }
  char v12 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    id v13 = object_getClass(self);
    if (class_isMetaClass(v13)) {
      int v14 = 43;
    }
    else {
      int v14 = 45;
    }
    *(_DWORD *)buf = 67109890;
    int v31 = v14;
    __int16 v32 = 2082;
    int v33 = object_getClassName(self);
    __int16 v34 = 2082;
    v35 = sel_getName(a2);
    __int16 v36 = 1024;
    int v37 = 145;
    id v15 = "%c[%{public}s %{public}s]:%i Delegate does not implement -tagReaderSessionDidBecomeActive: method";
    v16 = v12;
    uint32_t v17 = 34;
LABEL_23:
    _os_log_impl(&dword_2214B8000, v16, OS_LOG_TYPE_ERROR, v15, buf, v17);
  }
LABEL_24:
}

void __47__NFCTagReaderSession__callbackDidBecomeActive__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 tagReaderSessionDidBecomeActive:*(void *)(a1 + 32)];
}

- (void)didDetectTags:(id)a3 connectedTagIndex:(unint64_t)a4
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v53.receiver = self;
  v53.super_class = (Class)NFCTagReaderSession;
  [(NFCReaderSession *)&v53 didDetectTags:v6 connectedTagIndex:a4];
  v7 = [(NFCReaderSession *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    int v52 = 0;
    BOOL v9 = objc_opt_new();
    if ([v6 count])
    {
      unint64_t v10 = 0;
      do
      {
        uint64_t v11 = [v6 objectAtIndexedSubscript:v10];
        int v12 = [v11 type];
        id v13 = off_2645B4138;
        if (v12 == 8) {
          goto LABEL_49;
        }
        int v14 = [v11 type];
        id v13 = off_2645B4130;
        if (v14 == 7) {
          goto LABEL_49;
        }
        int v15 = [v11 type];
        id v13 = off_2645B4148;
        if (v15 == 9) {
          goto LABEL_49;
        }
        int v16 = [v11 type];
        id v13 = off_2645B4148;
        if (v16 == 14) {
          goto LABEL_49;
        }
        int v17 = [v11 type];
        id v13 = off_2645B4148;
        if (v17 == 15) {
          goto LABEL_49;
        }
        int v18 = [v11 type];
        id v13 = off_2645B4148;
        if (v18 == 16) {
          goto LABEL_49;
        }
        int v19 = [v11 type];
        id v13 = off_2645B4140;
        if (v19 == 3) {
          goto LABEL_49;
        }
        int v20 = [v11 type];
        id v13 = off_2645B4140;
        if (v20 == 6) {
          goto LABEL_49;
        }
        if ([v11 type] == 5)
        {
          __int16 v48 = [v11 tagB];
          int64_t v47 = [v48 pupi];
          int v22 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytes:&v52 length:4];
          int v46 = [v47 isEqualToData:v22];

          id v13 = off_2645B4140;
          if (v46)
          {
LABEL_49:
            v21 = (void *)[objc_alloc(*v13) initWithSession:self tag:v11 startupConfig:0];
            if (v21)
            {
              [v9 addObject:v21];
            }
          }
        }

        ++v10;
      }
      while (v10 < [v6 count]);
    }
    if ([v9 count])
    {
      if (a4 != 0x7FFFFFFFFFFFFFFFLL)
      {
        int v33 = self;
        objc_sync_enter(v33);
        uint64_t v34 = [v9 objectAtIndex:a4];
        connectedTag = v33->_connectedTag;
        v33->_connectedTag = (NFCTag *)v34;

        objc_sync_exit(v33);
      }
      v50[0] = MEMORY[0x263EF8330];
      v50[1] = 3221225472;
      v50[2] = __55__NFCTagReaderSession_didDetectTags_connectedTagIndex___block_invoke;
      v50[3] = &unk_2645B4508;
      v50[4] = self;
      id v51 = v9;
      [(NFCReaderSession *)self submitBlockOnDelegateQueue:v50];
    }
    else
    {
      uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (Logger)
      {
        Class = object_getClass(self);
        if (class_isMetaClass(Class)) {
          uint64_t v38 = 43;
        }
        else {
          uint64_t v38 = 45;
        }
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        Logger(4, "%c[%{public}s %{public}s]:%i No suitable tag found", v38, ClassName, Name, 193);
      }
      v41 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        id v42 = object_getClass(self);
        if (class_isMetaClass(v42)) {
          int v43 = 43;
        }
        else {
          int v43 = 45;
        }
        id v44 = object_getClassName(self);
        int v45 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        int v55 = v43;
        __int16 v56 = 2082;
        v57 = v44;
        __int16 v58 = 2082;
        v59 = v45;
        __int16 v60 = 1024;
        int v61 = 193;
        _os_log_impl(&dword_2214B8000, v41, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i No suitable tag found", buf, 0x22u);
      }
    }
  }
  else
  {
    int v23 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v23)
    {
      uint64_t v24 = object_getClass(self);
      if (class_isMetaClass(v24)) {
        uint64_t v25 = 43;
      }
      else {
        uint64_t v25 = 45;
      }
      int v26 = object_getClassName(self);
      BOOL v27 = sel_getName(a2);
      v23(4, "%c[%{public}s %{public}s]:%i Delegate does not implement -tagReaderSession:didDetectTags: method", v25, v26, v27, 159);
    }
    int64_t v28 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      uint64_t v29 = object_getClass(self);
      if (class_isMetaClass(v29)) {
        int v30 = 43;
      }
      else {
        int v30 = 45;
      }
      int v31 = object_getClassName(self);
      __int16 v32 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      int v55 = v30;
      __int16 v56 = 2082;
      v57 = v31;
      __int16 v58 = 2082;
      v59 = v32;
      __int16 v60 = 1024;
      int v61 = 159;
      _os_log_impl(&dword_2214B8000, v28, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Delegate does not implement -tagReaderSession:didDetectTags: method", buf, 0x22u);
    }
  }
}

void __55__NFCTagReaderSession_didDetectTags_connectedTagIndex___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) delegate];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = (void *)[objc_alloc(MEMORY[0x263EFF8C0]) initWithArray:*(void *)(a1 + 40)];
  [v4 tagReaderSession:v2 didDetectTags:v3];
}

- (id)connectedTag
{
  return self->_connectedTag;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectedTag, 0);

  objc_storeStrong(&self->_swiftDelegateWrapper, 0);
}

@end