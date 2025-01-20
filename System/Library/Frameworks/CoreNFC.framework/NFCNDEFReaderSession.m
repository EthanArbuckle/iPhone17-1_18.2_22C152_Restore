@interface NFCNDEFReaderSession
+ (BOOL)readingAvailable;
- (NFCNDEFReaderSession)initWithDelegate:(id)a3 queue:(id)a4 pollMethod:(unint64_t)a5;
- (NFCNDEFReaderSession)initWithDelegate:(id)a3 sessionDelegateType:(int64_t)a4 queue:(id)a5 pollMethod:(unint64_t)a6 sessionConfig:(unint64_t)a7;
- (NFCNDEFReaderSession)initWithDelegate:(id)delegate queue:(dispatch_queue_t)queue invalidateAfterFirstRead:(BOOL)invalidateAfterFirstRead;
- (void)_callbackDidBecomeActive;
- (void)connectToTag:(id)tag completionHandler:(void *)completionHandler;
- (void)didDetectNDEFMessages:(id)a3 fromTags:(id)a4 connectedTagIndex:(unint64_t)a5 updateUICallback:(id)a6;
- (void)didTerminate:(id)a3;
- (void)restartPolling;
@end

@implementation NFCNDEFReaderSession

- (NFCNDEFReaderSession)initWithDelegate:(id)a3 sessionDelegateType:(int64_t)a4 queue:(id)a5 pollMethod:(unint64_t)a6 sessionConfig:(unint64_t)a7
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [MEMORY[0x263EFF940] exceptionWithName:@"Unavailable initializer" reason:@"Not available" userInfo:0];
  objc_exception_throw(v10);
}

- (void)didTerminate:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)NFCNDEFReaderSession;
  [(NFCReaderSession *)&v3 didTerminate:a3];
}

- (void)didDetectNDEFMessages:(id)a3 fromTags:(id)a4 connectedTagIndex:(unint64_t)a5 updateUICallback:(id)a6
{
  uint64_t v106 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  v13 = (void (**)(id, void))a6;
  id v74 = v13;
  v75 = v12;
  if ([(NFCReaderSession *)self delegateType] == 5)
  {
    v14 = v11;
    v13[2](v13, 0);
    [(NFCReaderSession *)self didDetectTags:v12 connectedTagIndex:a5];
    v15 = objc_opt_new();
    long long v92 = 0u;
    long long v93 = 0u;
    long long v94 = 0u;
    long long v95 = 0u;
    id v16 = v12;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v92 objects:v105 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v93;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v93 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = [[NFCNDEFTag alloc] initWithSession:self tag:*(void *)(*((void *)&v92 + 1) + 8 * i) startupConfig:0];
          [v15 addObject:v21];
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v92 objects:v105 count:16];
      }
      while (v18);
    }

    id v22 = v15;
    if ([v15 count])
    {
      v90[0] = MEMORY[0x263EF8330];
      v90[1] = 3221225472;
      v90[2] = __90__NFCNDEFReaderSession_didDetectNDEFMessages_fromTags_connectedTagIndex_updateUICallback___block_invoke;
      v90[3] = &unk_2645B4508;
      v90[4] = self;
      id v22 = v15;
      id v91 = v22;
      [(NFCReaderSession *)self submitBlockOnDelegateQueue:v90];
    }
    else
    {
      uint64_t Logger = NFLogGetLogger();
      if (Logger)
      {
        v60 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(self);
        BOOL isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        BOOL v64 = !isMetaClass;
        id v22 = v15;
        uint64_t v65 = 45;
        if (!v64) {
          uint64_t v65 = 43;
        }
        v60(4, "%c[%{public}s %{public}s]:%i No suitable NDEF tag found", v65, ClassName, Name, 75);
      }
      v66 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
      {
        v67 = object_getClass(self);
        if (class_isMetaClass(v67)) {
          int v68 = 43;
        }
        else {
          int v68 = 45;
        }
        v69 = object_getClassName(self);
        v70 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        int v98 = v68;
        __int16 v99 = 2082;
        v100 = v69;
        id v22 = v15;
        __int16 v101 = 2082;
        v102 = v70;
        __int16 v103 = 1024;
        int v104 = 75;
        _os_log_impl(&dword_2214B8000, v66, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i No suitable NDEF tag found", buf, 0x22u);
      }
    }
    v58 = v74;
    v57 = v75;
  }
  else
  {
    v72 = self;
    v77 = objc_opt_new();
    v13[2](v13, 1);
    long long v88 = 0u;
    long long v89 = 0u;
    long long v86 = 0u;
    long long v87 = 0u;
    id v73 = v11;
    id obj = v11;
    uint64_t v79 = [obj countByEnumeratingWithState:&v86 objects:v96 count:16];
    if (v79)
    {
      uint64_t v78 = *(void *)v87;
      do
      {
        uint64_t v23 = 0;
        do
        {
          if (*(void *)v87 != v78) {
            objc_enumerationMutation(obj);
          }
          uint64_t v80 = v23;
          v24 = *(void **)(*((void *)&v86 + 1) + 8 * v23);
          v81 = objc_opt_new();
          v25 = [v24 records];
          uint64_t v26 = [v25 count];

          if (v26)
          {
            unint64_t v27 = 0;
            int v28 = 0;
            do
            {
              v29 = [v24 records];
              v30 = [v29 objectAtIndexedSubscript:v27];

              uint64_t v31 = [v30 typeNameFormat];
              v32 = [v30 type];
              uint64_t v33 = [v30 identifier];
              id v34 = objc_alloc(MEMORY[0x263EFF990]);
              v35 = [v30 payload];
              v36 = (void *)[v34 initWithData:v35];

              v83 = (void *)v33;
              if ([v30 chunked] && objc_msgSend(v32, "length"))
              {
                int v37 = v28 + 1;
                [v24 records];
                v38 = v82 = v36;
                unint64_t v39 = [v38 count];

                v36 = v82;
                if (v39 > v28 + 1)
                {
                  unint64_t v40 = v37;
                  while (1)
                  {
                    v41 = [v24 records];
                    v42 = [v41 objectAtIndexedSubscript:v40];

                    v43 = [v42 identifier];
                    if ([v43 length]) {
                      goto LABEL_32;
                    }
                    v44 = v24;
                    v45 = [v42 type];
                    if ([v45 length])
                    {

                      v24 = v44;
LABEL_32:

                      goto LABEL_36;
                    }
                    uint64_t v46 = v31;
                    int v47 = [v42 typeNameFormat];

                    if (v47 != 6)
                    {
                      v24 = v44;
                      goto LABEL_35;
                    }
                    v48 = [v42 payload];
                    [v82 appendData:v48];

                    v24 = v44;
                    if (([v42 chunked] & 1) == 0) {
                      break;
                    }

                    ++v40;
                    v49 = [v44 records];
                    unint64_t v50 = [v49 count];

                    ++v28;
                    uint64_t v31 = v46;
                    if (v50 <= v40)
                    {
                      int v37 = v28 + 1;
                      goto LABEL_37;
                    }
                  }
                  ++v28;
LABEL_35:
                  uint64_t v31 = v46;
LABEL_36:

                  int v37 = v28;
LABEL_37:
                  v36 = v82;
                }
              }
              else
              {
                int v37 = v28;
              }
              v51 = [[NFCNDEFPayload alloc] initWithFormat:v31 type:v32 identifier:v83 payload:v36 chunkSize:0];
              [v81 addObject:v51];

              int v28 = v37 + 1;
              unint64_t v27 = v37 + 1;
              v52 = [v24 records];
              unint64_t v53 = [v52 count];
            }
            while (v53 > v27);
          }
          v54 = [[NFCNDEFMessage alloc] initWithNDEFRecords:v81];
          v55 = [(NFCNDEFMessage *)v54 records];
          uint64_t v56 = [v55 count];

          if (v56) {
            [v77 addObject:v54];
          }

          uint64_t v23 = v80 + 1;
        }
        while (v80 + 1 != v79);
        uint64_t v79 = [obj countByEnumeratingWithState:&v86 objects:v96 count:16];
      }
      while (v79);
    }

    id v22 = v77;
    v57 = v75;
    if ([v77 count])
    {
      v72->_tagsRead += [v75 count];
      if ([(NFCReaderSession *)v72 delegateType] == 4)
      {
        v84[0] = MEMORY[0x263EF8330];
        v84[1] = 3221225472;
        v84[2] = __90__NFCNDEFReaderSession_didDetectNDEFMessages_fromTags_connectedTagIndex_updateUICallback___block_invoke_24;
        v84[3] = &unk_2645B4508;
        v84[4] = v72;
        id v85 = v77;
        [(NFCReaderSession *)v72 submitBlockOnDelegateQueue:v84];
      }
    }
    v14 = v73;
    v58 = v74;
    if (v72->_invalidateAfterFirstRead) {
      [(NFCReaderSession *)v72 invalidateSessionWithReason:204];
    }
  }
}

void __90__NFCNDEFReaderSession_didDetectNDEFMessages_fromTags_connectedTagIndex_updateUICallback___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) delegate];
  uint64_t v2 = *(void *)(a1 + 32);
  objc_super v3 = (void *)[objc_alloc(MEMORY[0x263EFF8C0]) initWithArray:*(void *)(a1 + 40)];
  [v4 readerSession:v2 didDetectTags:v3];
}

void __90__NFCNDEFReaderSession_didDetectNDEFMessages_fromTags_connectedTagIndex_updateUICallback___block_invoke_24(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) delegate];
  uint64_t v2 = *(void *)(a1 + 32);
  objc_super v3 = (void *)[*(id *)(a1 + 40) copy];
  [v4 readerSession:v2 didDetectNDEFs:v3];
}

- (NFCNDEFReaderSession)initWithDelegate:(id)a3 queue:(id)a4 pollMethod:(unint64_t)a5
{
  return [(NFCNDEFReaderSession *)self initWithDelegate:a3 queue:a4 invalidateAfterFirstRead:0];
}

- (NFCNDEFReaderSession)initWithDelegate:(id)delegate queue:(dispatch_queue_t)queue invalidateAfterFirstRead:(BOOL)invalidateAfterFirstRead
{
  BOOL v5 = invalidateAfterFirstRead;
  id v8 = delegate;
  id v9 = queue;
  if [v8 conformsToProtocol:&unk_26D39F1F0] && (objc_opt_respondsToSelector())
  {
    LOBYTE(v5) = 0;
    uint64_t v10 = 528;
    uint64_t v11 = 5;
  }
  else
  {
    if (v5) {
      uint64_t v10 = 64;
    }
    else {
      uint64_t v10 = 0;
    }
    uint64_t v11 = 4;
  }
  v15.receiver = self;
  v15.super_class = (Class)NFCNDEFReaderSession;
  id v12 = [(NFCReaderSession *)&v15 initWithDelegate:v8 sessionDelegateType:v11 queue:v9 pollMethod:2 sessionConfig:v10];
  v13 = v12;
  if (v12) {
    v12->_invalidateAfterFirstRead = v5;
  }

  return v13;
}

+ (BOOL)readingAvailable
{
  return +[NFCReaderSession featureAvailable:6];
}

- (void)restartPolling
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = _os_activity_create(&dword_2214B8000, "NFCNDEFReaderSession restartPolling", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  *(void *)state = 0;
  *(void *)&state[8] = 0;
  os_activity_scope_enter(v4, (os_activity_scope_state_t)state);
  os_activity_scope_leave((os_activity_scope_state_t)state);

  if ([(NFCReaderSession *)self delegateType] == 5)
  {
    v17.receiver = self;
    v17.super_class = (Class)NFCNDEFReaderSession;
    [(NFCReaderSession *)&v17 restartPolling];
  }
  else
  {
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      v6 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v10 = 45;
      if (isMetaClass) {
        uint64_t v10 = 43;
      }
      v6(5, "%c[%{public}s %{public}s]:%i Delegate conforms to [NFCNDEFReaderSessionDelegate readerSession:didDetectTags]; po"
        "lling is auto restarted.",
        v10,
        ClassName,
        Name,
        182);
    }
    uint64_t v11 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = object_getClass(self);
      if (class_isMetaClass(v12)) {
        int v13 = 43;
      }
      else {
        int v13 = 45;
      }
      v14 = object_getClassName(self);
      objc_super v15 = sel_getName(a2);
      *(_DWORD *)state = 67109890;
      *(_DWORD *)&state[4] = v13;
      *(_WORD *)&state[8] = 2082;
      *(void *)&state[10] = v14;
      __int16 v19 = 2082;
      v20 = v15;
      __int16 v21 = 1024;
      int v22 = 182;
      _os_log_impl(&dword_2214B8000, v11, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Delegate conforms to [NFCNDEFReaderSessionDelegate readerSession:didDetectTags]; po"
        "lling is auto restarted.",
        state,
        0x22u);
    }
  }
}

- (void)connectToTag:(id)tag completionHandler:(void *)completionHandler
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v7 = tag;
  id v8 = completionHandler;
  id v9 = _os_activity_create(&dword_2214B8000, "NFCNDEFReaderSession connectToTag:completionHandler", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  *(void *)state = 0;
  *(void *)&state[8] = 0;
  os_activity_scope_enter(v9, (os_activity_scope_state_t)state);
  os_activity_scope_leave((os_activity_scope_state_t)state);

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = v7;
    id v43 = 0;
    char v11 = [v10 isMatchingSession:self outError:&v43];
    id v12 = v43;
    if (v11)
    {
      [v10 _connectWithCompletionHandler:v8];
    }
    else
    {
      uint64_t v37 = MEMORY[0x263EF8330];
      uint64_t v38 = 3221225472;
      unint64_t v39 = __55__NFCNDEFReaderSession_connectToTag_completionHandler___block_invoke_84;
      unint64_t v40 = &unk_2645B43F0;
      id v42 = v8;
      id v41 = v12;
      [(NFCReaderSession *)self submitBlockOnDelegateQueue:&v37];
      uint64_t Logger = NFLogGetLogger();
      if (Logger)
      {
        v25 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(self);
        BOOL isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        uint64_t v29 = 45;
        if (isMetaClass) {
          uint64_t v29 = 43;
        }
        v25(3, "%c[%{public}s %{public}s]:%i Only tag from the current session is allowed", v29, ClassName, Name, 204, v37, v38, v39, v40);
      }
      v30 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        uint64_t v31 = object_getClass(self);
        if (class_isMetaClass(v31)) {
          int v32 = 43;
        }
        else {
          int v32 = 45;
        }
        uint64_t v33 = object_getClassName(self);
        id v34 = sel_getName(a2);
        *(_DWORD *)state = 67109890;
        *(_DWORD *)&state[4] = v32;
        *(_WORD *)&state[8] = 2082;
        *(void *)&state[10] = v33;
        __int16 v47 = 2082;
        v48 = v34;
        __int16 v49 = 1024;
        int v50 = 204;
        _os_log_impl(&dword_2214B8000, v30, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Only tag from the current session is allowed", state, 0x22u);
      }
    }
  }
  else
  {
    v44[0] = MEMORY[0x263EF8330];
    v44[1] = 3221225472;
    v44[2] = __55__NFCNDEFReaderSession_connectToTag_completionHandler___block_invoke;
    v44[3] = &unk_2645B4308;
    id v45 = v8;
    [(NFCReaderSession *)self submitBlockOnDelegateQueue:v44];
    uint64_t v13 = NFLogGetLogger();
    if (v13)
    {
      v14 = (void (*)(uint64_t, const char *, ...))v13;
      objc_super v15 = object_getClass(self);
      BOOL v16 = class_isMetaClass(v15);
      objc_super v17 = object_getClassName(self);
      v35 = sel_getName(a2);
      uint64_t v18 = 45;
      if (v16) {
        uint64_t v18 = 43;
      }
      v14(3, "%c[%{public}s %{public}s]:%i Invalid tag object", v18, v17, v35, 194);
    }
    __int16 v19 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = object_getClass(self);
      if (class_isMetaClass(v20)) {
        int v21 = 43;
      }
      else {
        int v21 = 45;
      }
      int v22 = object_getClassName(self);
      uint64_t v23 = sel_getName(a2);
      *(_DWORD *)state = 67109890;
      *(_DWORD *)&state[4] = v21;
      *(_WORD *)&state[8] = 2082;
      *(void *)&state[10] = v22;
      __int16 v47 = 2082;
      v48 = v23;
      __int16 v49 = 1024;
      int v50 = 194;
      _os_log_impl(&dword_2214B8000, v19, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid tag object", state, 0x22u);
    }

    id v10 = v45;
  }
}

void __55__NFCNDEFReaderSession_connectToTag_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = +[NFCError errorWithCode:3];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

uint64_t __55__NFCNDEFReaderSession_connectToTag_completionHandler___block_invoke_84(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)_callbackDidBecomeActive
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  if ([(NFCReaderSession *)self delegateType] != 4
    && [(NFCReaderSession *)self delegateType] != 5)
  {
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      __int16 v19 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      int64_t v28 = [(NFCReaderSession *)self delegateType];
      uint64_t v24 = 45;
      if (isMetaClass) {
        uint64_t v24 = 43;
      }
      v19(4, "%c[%{public}s %{public}s]:%i Unknown delegate type: %ld", v24, ClassName, Name, 223, v28);
    }
    id v12 = NFSharedLogGetLogger();
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
    uint64_t v33 = object_getClassName(self);
    __int16 v34 = 2082;
    v35 = sel_getName(a2);
    __int16 v36 = 1024;
    int v37 = 223;
    __int16 v38 = 2048;
    int64_t v39 = [(NFCReaderSession *)self delegateType];
    objc_super v15 = "%c[%{public}s %{public}s]:%i Unknown delegate type: %ld";
    BOOL v16 = v12;
    uint32_t v17 = 44;
    goto LABEL_23;
  }
  id v4 = [(NFCReaderSession *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __48__NFCNDEFReaderSession__callbackDidBecomeActive__block_invoke;
    v29[3] = &unk_2645B45A8;
    v29[4] = self;
    [(NFCReaderSession *)self submitBlockOnDelegateQueue:v29];
    return;
  }
  uint64_t v6 = NFLogGetLogger();
  if (v6)
  {
    id v7 = (void (*)(uint64_t, const char *, ...))v6;
    id v8 = object_getClass(self);
    BOOL v9 = class_isMetaClass(v8);
    id v10 = object_getClassName(self);
    unint64_t v27 = sel_getName(a2);
    uint64_t v11 = 45;
    if (v9) {
      uint64_t v11 = 43;
    }
    v7(4, "%c[%{public}s %{public}s]:%i Delegate does not implement -readerSessionDidBecomeActive: method", v11, v10, v27, 220);
  }
  id v12 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    uint64_t v13 = object_getClass(self);
    if (class_isMetaClass(v13)) {
      int v14 = 43;
    }
    else {
      int v14 = 45;
    }
    *(_DWORD *)buf = 67109890;
    int v31 = v14;
    __int16 v32 = 2082;
    uint64_t v33 = object_getClassName(self);
    __int16 v34 = 2082;
    v35 = sel_getName(a2);
    __int16 v36 = 1024;
    int v37 = 220;
    objc_super v15 = "%c[%{public}s %{public}s]:%i Delegate does not implement -readerSessionDidBecomeActive: method";
    BOOL v16 = v12;
    uint32_t v17 = 34;
LABEL_23:
    _os_log_impl(&dword_2214B8000, v16, OS_LOG_TYPE_ERROR, v15, buf, v17);
  }
LABEL_24:
}

void __48__NFCNDEFReaderSession__callbackDidBecomeActive__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 readerSessionDidBecomeActive:*(void *)(a1 + 32)];
}

@end