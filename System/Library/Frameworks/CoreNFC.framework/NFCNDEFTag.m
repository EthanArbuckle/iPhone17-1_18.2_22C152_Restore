@interface NFCNDEFTag
+ (BOOL)supportsSecureCoding;
- (BOOL)_connectWithError:(id *)a3;
- (BOOL)_disconnectWithError:(id *)a3;
- (BOOL)isAvailable;
- (BOOL)isMatchingSession:(id)a3 outError:(id *)a4;
- (NFCHardwareManager)hardwareManager;
- (NFCNDEFTag)initWithCoder:(id)a3;
- (NFCNDEFTag)initWithSession:(id)a3 tag:(id)a4 startupConfig:(int64_t)a5;
- (id)_getInternalReaderSession;
- (id)_updateNdefStatusWithSession:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)_connectWithCompletionHandler:(id)a3;
- (void)_setDelegateQueue:(id)a3;
- (void)_setSession:(id)a3;
- (void)_setTag:(id)a3;
- (void)dispatchBlockOnDelegateQueueAsync:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)queryNDEFStatusWithCompletionHandler:(id)a3;
- (void)readNDEFWithCompletionHandler:(id)a3;
- (void)writeLockWithCompletionHandler:(id)a3;
- (void)writeNDEF:(id)a3 completionHandler:(id)a4;
@end

@implementation NFCNDEFTag

- (NFCNDEFTag)initWithSession:(id)a3 tag:(id)a4 startupConfig:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    v20 = [MEMORY[0x263F08690] currentHandler];
    [v20 handleFailureInMethod:a2 object:self file:@"NFCNDEFTag.m" lineNumber:28 description:@"Nil session"];
  }
  v10 = [v8 sessionQueue];

  if (!v10)
  {
    v21 = [MEMORY[0x263F08690] currentHandler];
    [v21 handleFailureInMethod:a2 object:self file:@"NFCNDEFTag.m" lineNumber:29 description:@"Nil session queue"];
  }
  v11 = [v8 hardwareManager];

  if (!v11)
  {
    v22 = [MEMORY[0x263F08690] currentHandler];
    [v22 handleFailureInMethod:a2 object:self file:@"NFCNDEFTag.m" lineNumber:30 description:@"Nil hardwareManager"];
  }
  v23.receiver = self;
  v23.super_class = (Class)NFCNDEFTag;
  v12 = [(NFCNDEFTag *)&v23 init];
  if (v12)
  {
    uint64_t v13 = [v8 sessionId];
    sessionKey = v12->_sessionKey;
    v12->_sessionKey = (NSNumber *)v13;

    objc_storeStrong((id *)&v12->_tag, a4);
    uint64_t v15 = [v8 sessionQueue];
    delegateQueue = v12->_delegateQueue;
    v12->_delegateQueue = (OS_dispatch_queue *)v15;

    uint64_t v17 = [v8 hardwareManager];
    hardwareManager = v12->_hardwareManager;
    v12->_hardwareManager = (NFCHardwareManager *)v17;
  }
  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NFCNDEFTag)initWithCoder:(id)a3
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v30.receiver = self;
  v30.super_class = (Class)NFCNDEFTag;
  v6 = [(NFCNDEFTag *)&v30 init];
  if (v6)
  {
    uint64_t v7 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"tag"];
    tag = v6->_tag;
    v6->_tag = (NFTag *)v7;

    uint64_t v9 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"sessionKey"];
    sessionKey = v6->_sessionKey;
    v6->_sessionKey = (NSNumber *)v9;

    if (!v6->_sessionKey)
    {
      v28 = [MEMORY[0x263F08690] currentHandler];
      [v28 handleFailureInMethod:a2 object:v6 file:@"NFCNDEFTag.m" lineNumber:64 description:@"Missing session key"];
    }
    uint64_t v11 = +[NFCHardwareManager sharedHardwareManager];
    hardwareManager = v6->_hardwareManager;
    v6->_hardwareManager = (NFCHardwareManager *)v11;

    uint64_t v13 = [(NFCHardwareManager *)v6->_hardwareManager getReaderSessionWithKey:v6->_sessionKey];
    v14 = v13;
    if (v13)
    {
      uint64_t v15 = [v13 sessionQueue];
      delegateQueue = v6->_delegateQueue;
      v6->_delegateQueue = (OS_dispatch_queue *)v15;
    }
    else
    {
      uint64_t Logger = NFLogGetLogger();
      if (Logger)
      {
        v18 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(v6);
        BOOL isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(v6);
        Name = sel_getName(a2);
        uint64_t v22 = 45;
        if (isMetaClass) {
          uint64_t v22 = 43;
        }
        v18(3, "%c[%{public}s %{public}s]:%i Session has been invalidated", v22, ClassName, Name, 69);
      }
      delegateQueue = NFSharedLogGetLogger();
      if (os_log_type_enabled(delegateQueue, OS_LOG_TYPE_ERROR))
      {
        objc_super v23 = object_getClass(v6);
        if (class_isMetaClass(v23)) {
          int v24 = 43;
        }
        else {
          int v24 = 45;
        }
        v25 = object_getClassName(v6);
        v26 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        int v32 = v24;
        __int16 v33 = 2082;
        v34 = v25;
        __int16 v35 = 2082;
        v36 = v26;
        __int16 v37 = 1024;
        int v38 = 69;
        _os_log_impl(&dword_2214B8000, delegateQueue, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session has been invalidated", buf, 0x22u);
      }
    }
  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  tag = self->_tag;
  id v5 = a3;
  [v5 encodeObject:tag forKey:@"tag"];
  [v5 encodeObject:self->_sessionKey forKey:@"sessionKey"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  if (!self->_delegateQueue)
  {
    id v8 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3);
    [v8 handleFailureInMethod:a2 object:self file:@"NFCNDEFTag.m" lineNumber:86 description:@"Nil delegateQueue"];
  }
  if (!self->_hardwareManager)
  {
    uint64_t v9 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3);
    [v9 handleFailureInMethod:a2 object:self file:@"NFCNDEFTag.m" lineNumber:87 description:@"Nil hardwareManager"];
  }
  id v5 = objc_alloc_init((Class)objc_opt_class());
  [v5 _setTag:self->_tag];
  v6 = [(NFCNDEFTag *)self _getInternalReaderSession];
  [v5 _setSession:v6];

  [v5 _setDelegateQueue:self->_delegateQueue];
  return v5;
}

- (BOOL)isAvailable
{
  v3 = [(NFCNDEFTag *)self _getInternalReaderSession];
  v4 = [v3 currentTag];
  if ([v4 isEqualToNFTag:self->_tag]) {
    char v5 = [v3 checkPresenceWithError:0];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (void)queryNDEFStatusWithCompletionHandler:(id)a3
{
  id v4 = a3;
  char v5 = _os_activity_create(&dword_2214B8000, "NFCNDEFTag queryNDEFStatusWithCompletionHandler:", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  os_activity_scope_leave(&state);

  v6 = [(NFCNDEFTag *)self _getInternalReaderSession];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __51__NFCNDEFTag_queryNDEFStatusWithCompletionHandler___block_invoke;
  v9[3] = &unk_2645B45D0;
  uint64_t v11 = self;
  id v12 = v4;
  id v10 = v6;
  id v7 = v4;
  id v8 = v6;
  [(NFCNDEFTag *)self dispatchBlockOnDelegateQueueAsync:v9];
}

void __51__NFCNDEFTag_queryNDEFStatusWithCompletionHandler___block_invoke(void *a1)
{
  if (a1[4])
  {
    uint64_t v2 = a1[5];
    if (*(unsigned char *)(v2 + 24))
    {
      uint64_t v3 = 3;
    }
    else
    {
      unsigned int v5 = [*(id *)(v2 + 8) ndefAvailability] - 2;
      if (v5 > 2) {
        uint64_t v3 = 1;
      }
      else {
        uint64_t v3 = qword_221500E70[v5];
      }
    }
    uint64_t v6 = a1[6];
    uint64_t v7 = [*(id *)(a1[5] + 8) ndefContainerSize];
    id v8 = *(void (**)(uint64_t, uint64_t, uint64_t, void))(v6 + 16);
    v8(v6, v3, v7, 0);
  }
  else
  {
    uint64_t v4 = a1[6];
    id v9 = +[NFCError errorWithCode:103];
    (*(void (**)(uint64_t, uint64_t, void, id))(v4 + 16))(v4, 1, 0, v9);
  }
}

- (void)readNDEFWithCompletionHandler:(id)a3
{
  id v4 = a3;
  unsigned int v5 = _os_activity_create(&dword_2214B8000, "NFCNDEFTag readNDEFWithCompletionHandler:", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  os_activity_scope_leave(&state);

  uint64_t v6 = [(NFCNDEFTag *)self _getInternalReaderSession];
  uint64_t v7 = v6;
  if (v6)
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __44__NFCNDEFTag_readNDEFWithCompletionHandler___block_invoke_2;
    v12[3] = &unk_2645B4468;
    id v8 = &v13;
    id v9 = v6;
    id v13 = v9;
    id v14 = v4;
    id v10 = v4;
    [v9 submitBlockOnSessionQueue:v12];
  }
  else
  {
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __44__NFCNDEFTag_readNDEFWithCompletionHandler___block_invoke;
    v15[3] = &unk_2645B4308;
    id v8 = &v16;
    id v16 = v4;
    id v11 = v4;
    [(NFCNDEFTag *)self dispatchBlockOnDelegateQueueAsync:v15];
  }
}

void __44__NFCNDEFTag_readNDEFWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = +[NFCError errorWithCode:103];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

void __44__NFCNDEFTag_readNDEFWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v13 = 0;
  uint64_t v3 = [v2 readNdefMessageWithError:&v13];
  id v4 = v13;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __44__NFCNDEFTag_readNDEFWithCompletionHandler___block_invoke_3;
  v9[3] = &unk_2645B4330;
  unsigned int v5 = *(void **)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  id v11 = v4;
  id v12 = v6;
  id v10 = v3;
  id v7 = v4;
  id v8 = v3;
  [v5 submitBlockOnDelegateQueue:v9];
}

uint64_t __44__NFCNDEFTag_readNDEFWithCompletionHandler___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)writeLockWithCompletionHandler:(id)a3
{
  id v4 = a3;
  unsigned int v5 = _os_activity_create(&dword_2214B8000, "NFCNDEFTag writeLockWithCompletionHandler:", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  os_activity_scope_leave(&state);

  id v6 = [(NFCNDEFTag *)self _getInternalReaderSession];
  id v7 = v6;
  if (v6)
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __45__NFCNDEFTag_writeLockWithCompletionHandler___block_invoke_2;
    v12[3] = &unk_2645B4490;
    id v8 = (id *)v13;
    id v9 = v6;
    v13[0] = v9;
    v13[1] = self;
    id v14 = v4;
    id v10 = v4;
    [v9 submitBlockOnSessionQueue:v12];
  }
  else
  {
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __45__NFCNDEFTag_writeLockWithCompletionHandler___block_invoke;
    v15[3] = &unk_2645B4308;
    id v8 = &v16;
    id v16 = v4;
    id v11 = v4;
    [(NFCNDEFTag *)self dispatchBlockOnDelegateQueueAsync:v15];
  }
}

void __45__NFCNDEFTag_writeLockWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = +[NFCError errorWithCode:103];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __45__NFCNDEFTag_writeLockWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) writeLockNdef];
  if (!v2) {
    *(unsigned char *)(*(void *)(a1 + 40) + 24) = 1;
  }
  uint64_t v3 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __45__NFCNDEFTag_writeLockWithCompletionHandler___block_invoke_3;
  v6[3] = &unk_2645B43F0;
  id v4 = *(id *)(a1 + 48);
  id v7 = v2;
  id v8 = v4;
  id v5 = v2;
  [v3 submitBlockOnDelegateQueue:v6];
}

uint64_t __45__NFCNDEFTag_writeLockWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)writeNDEF:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _os_activity_create(&dword_2214B8000, "NFCNDEFTag writeNDEF:completionHandler:", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  os_activity_scope_leave(&state);

  id v9 = [(NFCNDEFTag *)self _getInternalReaderSession];
  id v10 = v9;
  if (v9)
  {
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __42__NFCNDEFTag_writeNDEF_completionHandler___block_invoke_2;
    v15[3] = &unk_2645B4490;
    id v11 = &v16;
    id v12 = v9;
    id v16 = v12;
    id v17 = v6;
    id v18 = v7;
    id v13 = v7;
    [v12 submitBlockOnSessionQueue:v15];
  }
  else
  {
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __42__NFCNDEFTag_writeNDEF_completionHandler___block_invoke;
    v19[3] = &unk_2645B4308;
    id v11 = &v20;
    id v20 = v7;
    id v14 = v7;
    [(NFCNDEFTag *)self dispatchBlockOnDelegateQueueAsync:v19];
  }
}

void __42__NFCNDEFTag_writeNDEF_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = +[NFCError errorWithCode:103];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __42__NFCNDEFTag_writeNDEF_completionHandler___block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v11 = 0;
  [v2 writeNdefMessage:v3 error:&v11];
  id v4 = v11;
  id v5 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __42__NFCNDEFTag_writeNDEF_completionHandler___block_invoke_3;
  v8[3] = &unk_2645B43F0;
  id v6 = *(id *)(a1 + 48);
  id v9 = v4;
  id v10 = v6;
  id v7 = v4;
  [v5 submitBlockOnDelegateQueue:v8];
}

uint64_t __42__NFCNDEFTag_writeNDEF_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)_setTag:(id)a3
{
}

- (void)_setSession:(id)a3
{
  self->_sessionKey = [a3 sessionId];

  MEMORY[0x270F9A758]();
}

- (void)_setDelegateQueue:(id)a3
{
}

- (id)_updateNdefStatusWithSession:(id)a3
{
  unint64_t v8 = 0;
  uint64_t v9 = 0;
  id v4 = [a3 ndefStatus:&v8 maxMessageLength:&v9];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    if (v8 <= 4) {
      -[NFTag _setNDEFAvailability:](self->_tag, "_setNDEFAvailability:");
    }
    [(NFTag *)self->_tag _setNDEFContainerSize:v9];
  }

  return v5;
}

- (id)_getInternalReaderSession
{
  uint64_t v3 = [(NFCNDEFTag *)self hardwareManager];
  id v4 = [v3 getReaderSessionWithKey:self->_sessionKey];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (BOOL)_connectWithError:(id *)a3
{
  id v5 = [(NFCNDEFTag *)self _getInternalReaderSession];
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 currentTag];
    char v8 = [v7 isEqualToNFTag:self->_tag];

    int v9 = [v6 connectTag:self->_tag error:a3];
    BOOL v10 = v9;
    if ((v8 & 1) == 0 && v9)
    {
      id v11 = [(NFCNDEFTag *)self _updateNdefStatusWithSession:v6];
      id v12 = v11;
      if (a3) {
        *a3 = v11;
      }
    }
  }
  else if (a3)
  {
    +[NFCError errorWithCode:103];
    BOOL v10 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (void)_connectWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(NFCNDEFTag *)self _getInternalReaderSession];
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 currentTag];
    char v8 = [v7 isEqualToNFTag:self->_tag] ^ 1;

    tag = self->_tag;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    void v13[2] = __44__NFCNDEFTag__connectWithCompletionHandler___block_invoke_2;
    v13[3] = &unk_2645B45F8;
    char v16 = v8;
    v13[4] = self;
    id v14 = v6;
    id v15 = v4;
    id v10 = v4;
    [v14 connectTag:tag completionHandler:v13];

    id v11 = v14;
  }
  else
  {
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __44__NFCNDEFTag__connectWithCompletionHandler___block_invoke;
    v17[3] = &unk_2645B4308;
    id v18 = v4;
    id v12 = v4;
    [(NFCNDEFTag *)self dispatchBlockOnDelegateQueueAsync:v17];
    id v11 = v18;
  }
}

void __44__NFCNDEFTag__connectWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = +[NFCError errorWithCode:103];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __44__NFCNDEFTag__connectWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!v3 && *(unsigned char *)(a1 + 56))
  {
    id v3 = [*(id *)(a1 + 32) _updateNdefStatusWithSession:*(void *)(a1 + 40)];
  }
  id v4 = v3;
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (BOOL)_disconnectWithError:(id *)a3
{
  id v4 = [(NFCNDEFTag *)self _getInternalReaderSession];
  id v5 = v4;
  if (v4)
  {
    char v6 = [v4 disconnectTagWithError:a3];
  }
  else if (a3)
  {
    +[NFCError errorWithCode:103];
    char v6 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (BOOL)isMatchingSession:(id)a3 outError:(id *)a4
{
  id v6 = a3;
  id v7 = [v6 sessionId];

  if (!v7)
  {
    if (!a4)
    {
      BOOL v10 = 0;
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  sessionKey = self->_sessionKey;
  int v9 = [v6 sessionId];
  BOOL v10 = [(NSNumber *)sessionKey isEqualToNumber:v9];

  if (a4 && !v10)
  {
LABEL_6:
    +[NFCError errorWithCode:103];
    BOOL v10 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_8:

  return v10;
}

- (void)dispatchBlockOnDelegateQueueAsync:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  delegateQueue = self->_delegateQueue;
  id v6 = a3;
  if (delegateQueue)
  {
    id v7 = delegateQueue;
  }
  else
  {
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      int v9 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v13 = 45;
      if (isMetaClass) {
        uint64_t v13 = 43;
      }
      v9(3, "%c[%{public}s %{public}s]:%i Session queue is not available; dispatching on main queue",
        v13,
        ClassName,
        Name,
        330);
    }
    id v14 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      id v15 = object_getClass(self);
      if (class_isMetaClass(v15)) {
        int v16 = 43;
      }
      else {
        int v16 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v19 = v16;
      __int16 v20 = 2082;
      v21 = object_getClassName(self);
      __int16 v22 = 2082;
      objc_super v23 = sel_getName(a2);
      __int16 v24 = 1024;
      int v25 = 330;
      _os_log_impl(&dword_2214B8000, v14, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session queue is not available; dispatching on main queue",
        buf,
        0x22u);
    }

    id v7 = MEMORY[0x263EF83A0];
  }
  dispatch_async(v7, v6);
}

- (NFCHardwareManager)hardwareManager
{
  return self->_hardwareManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hardwareManager, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_sessionKey, 0);

  objc_storeStrong((id *)&self->_tag, 0);
}

@end