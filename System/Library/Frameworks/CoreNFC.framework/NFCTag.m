@interface NFCTag
+ (BOOL)supportsSecureCoding;
+ (double)_MaxRetryInterval;
+ (unint64_t)_MaxRetry;
- (BOOL)_connectWithSession:(id)a3 outError:(id *)a4;
- (BOOL)_disconnectWithError:(id *)a3;
- (BOOL)_transceiveWithSession:(id)a3 sendData:(id)a4 receivedData:(id *)a5 error:(id *)a6;
- (BOOL)isAvailable;
- (BOOL)isEqualToNFTag:(id)a3;
- (BOOL)isMatchingSession:(id)a3 outError:(id *)a4;
- (BOOL)isNDEFFormatted;
- (BOOL)isReadOnly;
- (BOOL)proprietaryApplicationDataCoding;
- (NFCHardwareManager)hardwareManager;
- (NFCTag)initWithCoder:(id)a3;
- (NFCTag)initWithSession:(id)a3 tag:(id)a4 startupConfig:(int64_t)a5;
- (id)_getInternalReaderSession;
- (id)applicationData;
- (id)asNFCFeliCaTag;
- (id)asNFCISO15693Tag;
- (id)asNFCISO7816Tag;
- (id)asNFCMiFareTag;
- (id)copyWithZone:(_NSZone *)a3;
- (id)historicalBytes;
- (id)identifier;
- (id)selectedAID;
- (id)systemCode;
- (int64_t)configuration;
- (unint64_t)capacity;
- (unint64_t)type;
- (void)_connectWithCompletionHandler:(id)a3;
- (void)_sendAPDU:(id)a3 completionHandler:(id)a4;
- (void)_setDelegateQueue:(id)a3;
- (void)_setSession:(id)a3;
- (void)_setTag:(id)a3;
- (void)_transceiveWithData:(id)a3 completionHandler:(id)a4;
- (void)disconnect;
- (void)dispatchOnDelegateQueueAsync:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)queryNDEFStatusWithCompletionHandler:(id)a3;
- (void)readNDEFWithCompletionHandler:(id)a3;
- (void)writeLockWithCompletionHandler:(id)a3;
- (void)writeNDEF:(id)a3 completionHandler:(id)a4;
@end

@implementation NFCTag

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NFCTag)initWithCoder:(id)a3
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v30.receiver = self;
  v30.super_class = (Class)NFCTag;
  v6 = [(NFCTag *)&v30 init];
  if (v6)
  {
    uint64_t v7 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"tag"];
    tag = v6->_tag;
    v6->_tag = (NFTag *)v7;

    uint64_t v9 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"sessionKey"];
    sessionKey = v6->_sessionKey;
    v6->_sessionKey = (NSNumber *)v9;

    v6->_configuration = [v5 decodeIntegerForKey:@"configuration"];
    if (!v6->_sessionKey)
    {
      v28 = [MEMORY[0x263F08690] currentHandler];
      [v28 handleFailureInMethod:a2 object:v6 file:@"NFCTag.m" lineNumber:67 description:@"Missing session key"];
    }
    uint64_t v11 = +[NFCHardwareManager sharedHardwareManager];
    hardwareManager = v6->_hardwareManager;
    v6->_hardwareManager = (NFCHardwareManager *)v11;

    v13 = [(NFCHardwareManager *)v6->_hardwareManager getReaderSessionWithKey:v6->_sessionKey];
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
        v18(3, "%c[%{public}s %{public}s]:%i Session has been invalidated", v22, ClassName, Name, 72);
      }
      delegateQueue = NFSharedLogGetLogger();
      if (os_log_type_enabled(delegateQueue, OS_LOG_TYPE_ERROR))
      {
        v23 = object_getClass(v6);
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
        int v38 = 72;
        _os_log_impl(&dword_2214B8000, delegateQueue, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session has been invalidated", buf, 0x22u);
      }
    }

    v6->_lock._os_unfair_lock_opaque = 0;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  tag = self->_tag;
  id v5 = a3;
  [v5 encodeObject:tag forKey:@"tag"];
  [v5 encodeObject:self->_sessionKey forKey:@"sessionKey"];
  [v5 encodeInteger:self->_configuration forKey:@"configuration"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  if (!self->_hardwareManager)
  {
    uint64_t v9 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3);
    [v9 handleFailureInMethod:a2 object:self file:@"NFCTag.m" lineNumber:92 description:@"Nil hardwareManager"];
  }
  id v4 = objc_alloc((Class)objc_opt_class());
  id v5 = [(NFCTag *)self _getInternalReaderSession];
  v6 = (void *)[v4 initWithSession:v5 tag:self->_tag startupConfig:self->_configuration];

  return v6;
}

- (BOOL)isReadOnly
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  p_lock = &self->_lock;
  v37[0] = MEMORY[0x263EF8330];
  v37[1] = 3221225472;
  v37[2] = __20__NFCTag_isReadOnly__block_invoke;
  v37[3] = &unk_2645B43C8;
  v37[4] = self;
  os_unfair_lock_lock(&self->_lock);
  id v5 = __20__NFCTag_isReadOnly__block_invoke((uint64_t)v37);
  os_unfair_lock_unlock(p_lock);
  v6 = [(NFCTag *)self _getInternalReaderSession];
  uint64_t v7 = [v6 currentTag];
  v8 = v7;
  if (v6 && ([v7 isEqualToNFTag:v5] & 1) != 0)
  {
    uint64_t v36 = 0;
    uint64_t v9 = [v6 ndefStatus:&v36 maxMessageLength:0];
    if (v9)
    {
      uint64_t Logger = NFLogGetLogger();
      if (Logger)
      {
        uint64_t v11 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(self);
        BOOL isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        uint64_t v14 = 45;
        if (isMetaClass) {
          uint64_t v14 = 43;
        }
        v11(4, "%c[%{public}s %{public}s]:%i Error=%@", v14, ClassName, Name, 122, v9);
      }
      uint64_t v15 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v16 = object_getClass(self);
        if (class_isMetaClass(v16)) {
          int v17 = 43;
        }
        else {
          int v17 = 45;
        }
        v18 = object_getClassName(self);
        v19 = sel_getName(a2);
        *(_DWORD *)buf = 67110146;
        int v39 = v17;
        __int16 v40 = 2082;
        v41 = v18;
        __int16 v42 = 2082;
        v43 = v19;
        __int16 v44 = 1024;
        int v45 = 122;
        __int16 v46 = 2112;
        v47 = v9;
        _os_log_impl(&dword_2214B8000, v15, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Error=%@", buf, 0x2Cu);
      }

      BOOL v20 = 0;
    }
    else
    {
      BOOL v20 = v36 == 3;
    }
  }
  else
  {
    uint64_t v21 = NFLogGetLogger();
    if (v21)
    {
      uint64_t v22 = (void (*)(uint64_t, const char *, ...))v21;
      v23 = object_getClass(self);
      BOOL v24 = class_isMetaClass(v23);
      v25 = object_getClassName(self);
      __int16 v35 = sel_getName(a2);
      uint64_t v26 = 45;
      if (v24) {
        uint64_t v26 = 43;
      }
      v22(4, "%c[%{public}s %{public}s]:%i Tag is not connected", v26, v25, v35, 115);
    }
    v27 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      v28 = object_getClass(self);
      if (class_isMetaClass(v28)) {
        int v29 = 43;
      }
      else {
        int v29 = 45;
      }
      objc_super v30 = object_getClassName(self);
      v31 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      int v39 = v29;
      __int16 v40 = 2082;
      v41 = v30;
      __int16 v42 = 2082;
      v43 = v31;
      __int16 v44 = 1024;
      int v45 = 115;
      _os_log_impl(&dword_2214B8000, v27, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Tag is not connected", buf, 0x22u);
    }

    BOOL v20 = 0;
  }

  return v20;
}

id __20__NFCTag_isReadOnly__block_invoke(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 8);
}

- (BOOL)isNDEFFormatted
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  p_lock = &self->_lock;
  v37[0] = MEMORY[0x263EF8330];
  v37[1] = 3221225472;
  v37[2] = __25__NFCTag_isNDEFFormatted__block_invoke;
  v37[3] = &unk_2645B43C8;
  v37[4] = self;
  os_unfair_lock_lock(&self->_lock);
  id v5 = __25__NFCTag_isNDEFFormatted__block_invoke((uint64_t)v37);
  os_unfair_lock_unlock(p_lock);
  v6 = [(NFCTag *)self _getInternalReaderSession];
  uint64_t v7 = [v6 currentTag];
  v8 = v7;
  if (v6 && ([v7 isEqualToNFTag:v5] & 1) != 0)
  {
    unint64_t v36 = 0;
    uint64_t v9 = [v6 ndefStatus:&v36 maxMessageLength:0];
    if (v9)
    {
      uint64_t Logger = NFLogGetLogger();
      if (Logger)
      {
        uint64_t v11 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(self);
        BOOL isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        uint64_t v14 = 45;
        if (isMetaClass) {
          uint64_t v14 = 43;
        }
        v11(4, "%c[%{public}s %{public}s]:%i Error=%@", v14, ClassName, Name, 146, v9);
      }
      uint64_t v15 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v16 = object_getClass(self);
        if (class_isMetaClass(v16)) {
          int v17 = 43;
        }
        else {
          int v17 = 45;
        }
        v18 = object_getClassName(self);
        v19 = sel_getName(a2);
        *(_DWORD *)buf = 67110146;
        int v39 = v17;
        __int16 v40 = 2082;
        v41 = v18;
        __int16 v42 = 2082;
        v43 = v19;
        __int16 v44 = 1024;
        int v45 = 146;
        __int16 v46 = 2112;
        v47 = v9;
        _os_log_impl(&dword_2214B8000, v15, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Error=%@", buf, 0x2Cu);
      }

      BOOL v20 = 0;
    }
    else
    {
      BOOL v20 = v36 > 1;
    }
  }
  else
  {
    uint64_t v21 = NFLogGetLogger();
    if (v21)
    {
      uint64_t v22 = (void (*)(uint64_t, const char *, ...))v21;
      v23 = object_getClass(self);
      BOOL v24 = class_isMetaClass(v23);
      v25 = object_getClassName(self);
      __int16 v35 = sel_getName(a2);
      uint64_t v26 = 45;
      if (v24) {
        uint64_t v26 = 43;
      }
      v22(4, "%c[%{public}s %{public}s]:%i Tag is not connected", v26, v25, v35, 139);
    }
    v27 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      v28 = object_getClass(self);
      if (class_isMetaClass(v28)) {
        int v29 = 43;
      }
      else {
        int v29 = 45;
      }
      objc_super v30 = object_getClassName(self);
      v31 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      int v39 = v29;
      __int16 v40 = 2082;
      v41 = v30;
      __int16 v42 = 2082;
      v43 = v31;
      __int16 v44 = 1024;
      int v45 = 139;
      _os_log_impl(&dword_2214B8000, v27, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Tag is not connected", buf, 0x22u);
    }

    BOOL v20 = 0;
  }

  return v20;
}

id __25__NFCTag_isNDEFFormatted__block_invoke(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 8);
}

- (unint64_t)capacity
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  p_lock = &self->_lock;
  v37[0] = MEMORY[0x263EF8330];
  v37[1] = 3221225472;
  v37[2] = __18__NFCTag_capacity__block_invoke;
  v37[3] = &unk_2645B43C8;
  v37[4] = self;
  os_unfair_lock_lock(&self->_lock);
  id v5 = __18__NFCTag_capacity__block_invoke((uint64_t)v37);
  os_unfair_lock_unlock(p_lock);
  v6 = [(NFCTag *)self _getInternalReaderSession];
  uint64_t v7 = [v6 currentTag];
  v8 = v7;
  if (v6 && ([v7 isEqualToNFTag:v5] & 1) != 0)
  {
    unint64_t v36 = 0;
    uint64_t v9 = [v6 ndefStatus:0 maxMessageLength:&v36];
    if (v9)
    {
      uint64_t Logger = NFLogGetLogger();
      if (Logger)
      {
        uint64_t v11 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(self);
        BOOL isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        uint64_t v14 = 45;
        if (isMetaClass) {
          uint64_t v14 = 43;
        }
        v11(4, "%c[%{public}s %{public}s]:%i Error=%@", v14, ClassName, Name, 174, v9);
      }
      uint64_t v15 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v16 = object_getClass(self);
        if (class_isMetaClass(v16)) {
          int v17 = 43;
        }
        else {
          int v17 = 45;
        }
        v18 = object_getClassName(self);
        v19 = sel_getName(a2);
        *(_DWORD *)buf = 67110146;
        int v39 = v17;
        __int16 v40 = 2082;
        v41 = v18;
        __int16 v42 = 2082;
        v43 = v19;
        __int16 v44 = 1024;
        int v45 = 174;
        __int16 v46 = 2112;
        v47 = v9;
        _os_log_impl(&dword_2214B8000, v15, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Error=%@", buf, 0x2Cu);
      }

      unint64_t v20 = 0;
    }
    else
    {
      unint64_t v20 = v36;
    }
  }
  else
  {
    uint64_t v21 = NFLogGetLogger();
    if (v21)
    {
      uint64_t v22 = (void (*)(uint64_t, const char *, ...))v21;
      v23 = object_getClass(self);
      BOOL v24 = class_isMetaClass(v23);
      v25 = object_getClassName(self);
      __int16 v35 = sel_getName(a2);
      uint64_t v26 = 45;
      if (v24) {
        uint64_t v26 = 43;
      }
      v22(4, "%c[%{public}s %{public}s]:%i Tag is not connected", v26, v25, v35, 167);
    }
    v27 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      v28 = object_getClass(self);
      if (class_isMetaClass(v28)) {
        int v29 = 43;
      }
      else {
        int v29 = 45;
      }
      objc_super v30 = object_getClassName(self);
      v31 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      int v39 = v29;
      __int16 v40 = 2082;
      v41 = v30;
      __int16 v42 = 2082;
      v43 = v31;
      __int16 v44 = 1024;
      int v45 = 167;
      _os_log_impl(&dword_2214B8000, v27, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Tag is not connected", buf, 0x22u);
    }

    unint64_t v20 = 0;
  }

  return v20;
}

id __18__NFCTag_capacity__block_invoke(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 8);
}

- (void)queryNDEFStatusWithCompletionHandler:(id)a3
{
  id v5 = a3;
  v6 = _os_activity_create(&dword_2214B8000, "NFCNDEFTag queryNDEFStatusWithCompletionHandler:", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  os_activity_scope_leave(&state);

  uint64_t v7 = [(NFCTag *)self _getInternalReaderSession];
  v8 = v7;
  if (v7)
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __47__NFCTag_queryNDEFStatusWithCompletionHandler___block_invoke_2;
    v12[3] = &unk_2645B4440;
    v12[4] = self;
    id v14 = v5;
    SEL v15 = a2;
    id v13 = v7;
    id v9 = v5;
    [v13 submitBlockOnSessionQueue:v12];

    id v10 = v13;
  }
  else
  {
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __47__NFCTag_queryNDEFStatusWithCompletionHandler___block_invoke;
    v16[3] = &unk_2645B4308;
    id v17 = v5;
    id v11 = v5;
    [(NFCTag *)self dispatchOnDelegateQueueAsync:v16];
    id v10 = v17;
  }
}

void __47__NFCTag_queryNDEFStatusWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = +[NFCError errorWithCode:103];
  (*(void (**)(uint64_t, uint64_t, void, id))(v1 + 16))(v1, 1, 0, v2);
}

void __47__NFCTag_queryNDEFStatusWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v2 = *(os_unfair_lock_s **)(a1 + 32);
  v3 = v2 + 8;
  v45[0] = MEMORY[0x263EF8330];
  v45[1] = 3221225472;
  v45[2] = __47__NFCTag_queryNDEFStatusWithCompletionHandler___block_invoke_3;
  v45[3] = &unk_2645B43C8;
  v45[4] = v2;
  os_unfair_lock_lock(v2 + 8);
  id v4 = __47__NFCTag_queryNDEFStatusWithCompletionHandler___block_invoke_3((uint64_t)v45);
  os_unfair_lock_unlock(v3);
  id v5 = [*(id *)(a1 + 40) currentTag];
  if ([v5 isEqualToNFTag:v4])
  {
    uint64_t v41 = 0;
    unint64_t v42 = 0;
    v6 = [*(id *)(a1 + 40) ndefStatus:&v42 maxMessageLength:&v41];
    if (v6)
    {
      uint64_t Logger = NFLogGetLogger();
      if (Logger)
      {
        v8 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(*(id *)(a1 + 32));
        BOOL isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(*(id *)(a1 + 32));
        Name = sel_getName(*(SEL *)(a1 + 56));
        uint64_t v11 = 45;
        if (isMetaClass) {
          uint64_t v11 = 43;
        }
        v8(4, "%c[%{public}s %{public}s]:%i Error=%@", v11, ClassName, Name, 214, v6);
      }
      v12 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        id v13 = object_getClass(*(id *)(a1 + 32));
        if (class_isMetaClass(v13)) {
          int v14 = 43;
        }
        else {
          int v14 = 45;
        }
        SEL v15 = object_getClassName(*(id *)(a1 + 32));
        v16 = sel_getName(*(SEL *)(a1 + 56));
        *(_DWORD *)buf = 67110146;
        int v47 = v14;
        __int16 v48 = 2082;
        v49 = v15;
        __int16 v50 = 2082;
        v51 = v16;
        __int16 v52 = 1024;
        int v53 = 214;
        __int16 v54 = 2112;
        v55 = v6;
        _os_log_impl(&dword_2214B8000, v12, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Error=%@", buf, 0x2Cu);
      }

      v38[0] = MEMORY[0x263EF8330];
      v38[1] = 3221225472;
      v38[2] = __47__NFCTag_queryNDEFStatusWithCompletionHandler___block_invoke_56;
      v38[3] = &unk_2645B43F0;
      id v17 = &v40;
      v18 = *(void **)(a1 + 40);
      id v40 = *(id *)(a1 + 48);
      id v39 = v6;
      [v18 submitBlockOnDelegateQueue:v38];
    }
    else
    {
      if (v42 > 4) {
        uint64_t v31 = 0;
      }
      else {
        uint64_t v31 = qword_221500DC0[v42];
      }
      v36[0] = MEMORY[0x263EF8330];
      v36[1] = 3221225472;
      v36[2] = __47__NFCTag_queryNDEFStatusWithCompletionHandler___block_invoke_2_57;
      v36[3] = &unk_2645B4418;
      id v17 = (id *)v37;
      int v32 = *(void **)(a1 + 40);
      v37[0] = *(id *)(a1 + 48);
      v37[1] = v31;
      v37[2] = v41;
      [v32 submitBlockOnDelegateQueue:v36];
    }
  }
  else
  {
    uint64_t v19 = NFLogGetLogger();
    if (v19)
    {
      unint64_t v20 = (void (*)(uint64_t, const char *, ...))v19;
      uint64_t v21 = object_getClass(*(id *)(a1 + 32));
      BOOL v22 = class_isMetaClass(v21);
      v23 = object_getClassName(*(id *)(a1 + 32));
      __int16 v35 = sel_getName(*(SEL *)(a1 + 56));
      uint64_t v24 = 45;
      if (v22) {
        uint64_t v24 = 43;
      }
      v20(4, "%c[%{public}s %{public}s]:%i Tag is not connected", v24, v23, v35, 202);
    }
    v25 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      uint64_t v26 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v26)) {
        int v27 = 43;
      }
      else {
        int v27 = 45;
      }
      v28 = object_getClassName(*(id *)(a1 + 32));
      int v29 = sel_getName(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 67109890;
      int v47 = v27;
      __int16 v48 = 2082;
      v49 = v28;
      __int16 v50 = 2082;
      v51 = v29;
      __int16 v52 = 1024;
      int v53 = 202;
      _os_log_impl(&dword_2214B8000, v25, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Tag is not connected", buf, 0x22u);
    }

    v43[0] = MEMORY[0x263EF8330];
    v43[1] = 3221225472;
    v43[2] = __47__NFCTag_queryNDEFStatusWithCompletionHandler___block_invoke_55;
    v43[3] = &unk_2645B4308;
    objc_super v30 = *(void **)(a1 + 40);
    id v44 = *(id *)(a1 + 48);
    [v30 submitBlockOnDelegateQueue:v43];
  }
}

id __47__NFCTag_queryNDEFStatusWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 8);
}

void __47__NFCTag_queryNDEFStatusWithCompletionHandler___block_invoke_55(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = +[NFCError errorWithCode:104];
  (*(void (**)(uint64_t, uint64_t, void, id))(v1 + 16))(v1, 1, 0, v2);
}

uint64_t __47__NFCTag_queryNDEFStatusWithCompletionHandler___block_invoke_56(uint64_t a1)
{
  return (*(uint64_t (**)(void, uint64_t, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 1, 0, *(void *)(a1 + 32));
}

uint64_t __47__NFCTag_queryNDEFStatusWithCompletionHandler___block_invoke_2_57(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[4] + 16))(a1[4], a1[5], a1[6], 0);
}

- (void)readNDEFWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = _os_activity_create(&dword_2214B8000, "NFCNDEFTag readNDEFWithCompletionHandler:", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  os_activity_scope_leave(&state);

  v6 = [(NFCTag *)self _getInternalReaderSession];
  uint64_t v7 = v6;
  if (v6)
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __40__NFCTag_readNDEFWithCompletionHandler___block_invoke_2;
    v12[3] = &unk_2645B4468;
    v8 = &v13;
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
    v15[2] = __40__NFCTag_readNDEFWithCompletionHandler___block_invoke;
    v15[3] = &unk_2645B4308;
    v8 = &v16;
    id v16 = v4;
    id v11 = v4;
    [(NFCTag *)self dispatchOnDelegateQueueAsync:v15];
  }
}

void __40__NFCTag_readNDEFWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = +[NFCError errorWithCode:103];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

void __40__NFCTag_readNDEFWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v14 = 0;
  v3 = [v2 readNdefMessageWithError:&v14];
  id v4 = v14;
  id v5 = +[NFCError errorWithNFCDError:v4 defaultNFCErrorCode:104];

  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __40__NFCTag_readNDEFWithCompletionHandler___block_invoke_3;
  v10[3] = &unk_2645B4330;
  v6 = *(void **)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  id v12 = v5;
  id v13 = v7;
  id v11 = v3;
  id v8 = v5;
  id v9 = v3;
  [v6 submitBlockOnDelegateQueue:v10];
}

uint64_t __40__NFCTag_readNDEFWithCompletionHandler___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)writeLockWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = _os_activity_create(&dword_2214B8000, "NFCNDEFTag writeLockWithCompletionHandler:", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  os_activity_scope_leave(&state);

  v6 = [(NFCTag *)self _getInternalReaderSession];
  id v7 = v6;
  if (v6)
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __41__NFCTag_writeLockWithCompletionHandler___block_invoke_2;
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
    v15[2] = __41__NFCTag_writeLockWithCompletionHandler___block_invoke;
    v15[3] = &unk_2645B4308;
    id v8 = &v16;
    id v16 = v4;
    id v11 = v4;
    [(NFCTag *)self dispatchOnDelegateQueueAsync:v15];
  }
}

void __41__NFCTag_writeLockWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = +[NFCError errorWithCode:103];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __41__NFCTag_writeLockWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) writeLockNdef];
  v3 = +[NFCError errorWithNFCDError:v2 defaultNFCErrorCode:104];

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __41__NFCTag_writeLockWithCompletionHandler___block_invoke_3;
  v7[3] = &unk_2645B43F0;
  id v4 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  [v4 submitBlockOnDelegateQueue:v7];
}

uint64_t __41__NFCTag_writeLockWithCompletionHandler___block_invoke_3(uint64_t a1)
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

  id v9 = [(NFCTag *)self _getInternalReaderSession];
  id v10 = v9;
  if (v9)
  {
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __38__NFCTag_writeNDEF_completionHandler___block_invoke_2;
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
    v19[2] = __38__NFCTag_writeNDEF_completionHandler___block_invoke;
    v19[3] = &unk_2645B4308;
    id v11 = &v20;
    id v20 = v7;
    id v14 = v7;
    [(NFCTag *)self dispatchOnDelegateQueueAsync:v19];
  }
}

void __38__NFCTag_writeNDEF_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = +[NFCError errorWithCode:103];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __38__NFCTag_writeNDEF_completionHandler___block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v12 = 0;
  [v2 writeNdefMessage:v3 error:&v12];
  id v4 = v12;
  id v5 = +[NFCError errorWithNFCDError:v4 defaultNFCErrorCode:104];

  id v6 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __38__NFCTag_writeNDEF_completionHandler___block_invoke_3;
  v9[3] = &unk_2645B43F0;
  id v7 = *(id *)(a1 + 48);
  id v10 = v5;
  id v11 = v7;
  id v8 = v5;
  [v6 submitBlockOnDelegateQueue:v9];
}

uint64_t __38__NFCTag_writeNDEF_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (unint64_t)type
{
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  p_lock = &self->_lock;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  id v8 = __14__NFCTag_type__block_invoke;
  id v9 = &unk_2645B44B8;
  id v10 = self;
  id v11 = &v12;
  uint64_t v3 = v7;
  os_unfair_lock_lock(p_lock);
  v8((uint64_t)v3);
  os_unfair_lock_unlock(p_lock);

  unint64_t v4 = v13[3];
  if (v4 >= 0x11) {
    unint64_t v5 = 1;
  }
  else {
    unint64_t v5 = qword_221500DE8[v4];
  }
  _Block_object_dispose(&v12, 8);
  return v5;
}

uint64_t __14__NFCTag_type__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 8) type];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)isAvailable
{
  p_lock = &self->_lock;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __21__NFCTag_isAvailable__block_invoke;
  v9[3] = &unk_2645B43C8;
  void v9[4] = self;
  os_unfair_lock_lock(&self->_lock);
  unint64_t v4 = __21__NFCTag_isAvailable__block_invoke((uint64_t)v9);
  os_unfair_lock_unlock(p_lock);
  unint64_t v5 = [(NFCTag *)self _getInternalReaderSession];
  id v6 = [v5 currentTag];
  if ([v6 isEqualToNFTag:v4])
  {
LABEL_5:
    char v7 = [v5 checkPresenceWithError:0];
    goto LABEL_6;
  }
  char v7 = 0;
  if (!v6 && (self->_configuration & 1) != 0)
  {
    if (![(NFCTag *)self _connectWithSession:v5 outError:0])
    {
      char v7 = 0;
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_6:

  return v7;
}

id __21__NFCTag_isAvailable__block_invoke(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 8);
}

- (id)asNFCISO15693Tag
{
  if ([(NFCTag *)self type] == 1) {
    uint64_t v3 = self;
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

- (id)asNFCISO7816Tag
{
  if ([(NFCTag *)self type] == 3) {
    uint64_t v3 = self;
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

- (id)asNFCMiFareTag
{
  if ([(NFCTag *)self type] == 4) {
    uint64_t v3 = self;
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

- (id)asNFCFeliCaTag
{
  if ([(NFCTag *)self type] == 2) {
    uint64_t v3 = self;
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

- (NFCTag)initWithSession:(id)a3 tag:(id)a4 startupConfig:(int64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  if (!v9)
  {
    uint64_t v21 = [MEMORY[0x263F08690] currentHandler];
    [v21 handleFailureInMethod:a2 object:self file:@"NFCTag.m" lineNumber:418 description:@"Nil session"];
  }
  id v11 = [v9 sessionQueue];

  if (!v11)
  {
    BOOL v22 = [MEMORY[0x263F08690] currentHandler];
    [v22 handleFailureInMethod:a2 object:self file:@"NFCTag.m" lineNumber:419 description:@"Nil session queue"];
  }
  uint64_t v12 = [v9 hardwareManager];

  if (!v12)
  {
    v23 = [MEMORY[0x263F08690] currentHandler];
    [v23 handleFailureInMethod:a2 object:self file:@"NFCTag.m" lineNumber:420 description:@"Nil hardwareManager"];
  }
  v24.receiver = self;
  v24.super_class = (Class)NFCTag;
  id v13 = [(NFCTag *)&v24 init];
  if (v13)
  {
    uint64_t v14 = [v9 sessionId];
    sessionKey = v13->_sessionKey;
    v13->_sessionKey = (NSNumber *)v14;

    objc_storeStrong((id *)&v13->_tag, a4);
    v13->_configuration = a5;
    uint64_t v16 = [v9 sessionQueue];
    delegateQueue = v13->_delegateQueue;
    v13->_delegateQueue = (OS_dispatch_queue *)v16;

    uint64_t v18 = [v9 hardwareManager];
    hardwareManager = v13->_hardwareManager;
    v13->_hardwareManager = (NFCHardwareManager *)v18;

    v13->_lock._os_unfair_lock_opaque = 0;
  }

  return v13;
}

- (id)identifier
{
  p_lock = &self->_lock;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __20__NFCTag_identifier__block_invoke;
  v5[3] = &unk_2645B44E0;
  v5[4] = self;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v3 = __20__NFCTag_identifier__block_invoke((uint64_t)v5);
  os_unfair_lock_unlock(p_lock);

  return v3;
}

id __20__NFCTag_identifier__block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(*(void *)(a1 + 32) + 8) technology];
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 8);
  if (v2 == 2)
  {
    unint64_t v4 = [v3 tagB];
    unint64_t v5 = [v4 pupi];
  }
  else
  {
    unint64_t v5 = [v3 tagID];
  }

  return v5;
}

- (id)selectedAID
{
  p_lock = &self->_lock;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __21__NFCTag_selectedAID__block_invoke;
  v5[3] = &unk_2645B44E0;
  v5[4] = self;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v3 = __21__NFCTag_selectedAID__block_invoke((uint64_t)v5);
  os_unfair_lock_unlock(p_lock);

  return v3;
}

id __21__NFCTag_selectedAID__block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(*(void *)(a1 + 32) + 8) technology];
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 8);
  if (v2 == 1) {
    [v3 tagA];
  }
  else {
  unint64_t v4 = [v3 tagB];
  }
  unint64_t v5 = [v4 selectedAID];

  return v5;
}

- (id)systemCode
{
  p_lock = &self->_lock;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __20__NFCTag_systemCode__block_invoke;
  v5[3] = &unk_2645B44E0;
  v5[4] = self;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v3 = __20__NFCTag_systemCode__block_invoke((uint64_t)v5);
  os_unfair_lock_unlock(p_lock);

  return v3;
}

id __20__NFCTag_systemCode__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(*(void *)(a1 + 32) + 8) tagF];
  int v2 = [v1 SystemCode];

  return v2;
}

- (id)historicalBytes
{
  p_lock = &self->_lock;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __25__NFCTag_historicalBytes__block_invoke;
  v5[3] = &unk_2645B44E0;
  v5[4] = self;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v3 = __25__NFCTag_historicalBytes__block_invoke((uint64_t)v5);
  os_unfair_lock_unlock(p_lock);

  return v3;
}

id __25__NFCTag_historicalBytes__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(*(void *)(a1 + 32) + 8) tagA];
  int v2 = [v1 historicalBytes];

  return v2;
}

- (id)applicationData
{
  p_lock = &self->_lock;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __25__NFCTag_applicationData__block_invoke;
  v5[3] = &unk_2645B44E0;
  v5[4] = self;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v3 = __25__NFCTag_applicationData__block_invoke((uint64_t)v5);
  os_unfair_lock_unlock(p_lock);

  return v3;
}

id __25__NFCTag_applicationData__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(*(void *)(a1 + 32) + 8) tagB];
  int v2 = [v1 applicationData];

  return v2;
}

- (BOOL)proprietaryApplicationDataCoding
{
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  p_lock = &self->_lock;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  id v6 = __42__NFCTag_proprietaryApplicationDataCoding__block_invoke;
  char v7 = &unk_2645B44B8;
  id v8 = self;
  id v9 = &v10;
  uint64_t v3 = v5;
  os_unfair_lock_lock(p_lock);
  v6((uint64_t)v3);
  os_unfair_lock_unlock(p_lock);

  LOBYTE(p_lock) = *((unsigned char *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return (char)p_lock;
}

void __42__NFCTag_proprietaryApplicationDataCoding__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 8) tagB];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 applicationDataCoding];
}

- (void)disconnect
{
}

- (int64_t)configuration
{
  return self->_configuration;
}

- (void)_setTag:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  void v7[2] = __18__NFCTag__setTag___block_invoke;
  v7[3] = &unk_2645B4508;
  p_lock = &self->_lock;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  os_unfair_lock_lock(p_lock);
  __18__NFCTag__setTag___block_invoke((uint64_t)v7);
  os_unfair_lock_unlock(p_lock);
}

void __18__NFCTag__setTag___block_invoke(uint64_t a1)
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

- (BOOL)isEqualToNFTag:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  p_lock = &self->_lock;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  uint64_t v10 = __25__NFCTag_isEqualToNFTag___block_invoke;
  id v11 = &unk_2645B4530;
  uint64_t v14 = &v15;
  uint64_t v12 = self;
  id v6 = v4;
  id v13 = v6;
  char v7 = v9;
  os_unfair_lock_lock(p_lock);
  v10(v7);
  os_unfair_lock_unlock(p_lock);

  LOBYTE(p_lock) = *((unsigned char *)v16 + 24);
  _Block_object_dispose(&v15, 8);

  return (char)p_lock;
}

uint64_t __25__NFCTag_isEqualToNFTag___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 8) isEqualToNFTag:a1[5]];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = result;
  return result;
}

- (id)_getInternalReaderSession
{
  uint64_t v3 = [(NFCTag *)self hardwareManager];
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

- (void)dispatchOnDelegateQueueAsync:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  delegateQueue = self->_delegateQueue;
  id v6 = a3;
  if (delegateQueue)
  {
    char v7 = delegateQueue;
  }
  else
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
      v9(3, "%c[%{public}s %{public}s]:%i Session queue is not available; dispatching on main queue",
        v13,
        ClassName,
        Name,
        543);
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
      int v19 = v16;
      __int16 v20 = 2082;
      uint64_t v21 = object_getClassName(self);
      __int16 v22 = 2082;
      v23 = sel_getName(a2);
      __int16 v24 = 1024;
      int v25 = 543;
      _os_log_impl(&dword_2214B8000, v14, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session queue is not available; dispatching on main queue",
        buf,
        0x22u);
    }

    char v7 = MEMORY[0x263EF83A0];
  }
  dispatch_async(v7, v6);
}

- (BOOL)_connectWithSession:(id)a3 outError:(id *)a4
{
  id v6 = a3;
  char v7 = v6;
  if (v6)
  {
    char v8 = [v6 connectTag:self->_tag error:a4];
  }
  else if (a4)
  {
    +[NFCError errorWithCode:103];
    char v8 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (void)_connectWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(NFCTag *)self _getInternalReaderSession];
  if (v5)
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __40__NFCTag__connectWithCompletionHandler___block_invoke_2;
    v12[3] = &unk_2645B43C8;
    void v12[4] = self;
    os_unfair_lock_lock(&self->_lock);
    id v6 = __40__NFCTag__connectWithCompletionHandler___block_invoke_2((uint64_t)v12);
    os_unfair_lock_unlock(&self->_lock);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    void v9[2] = __40__NFCTag__connectWithCompletionHandler___block_invoke_3;
    v9[3] = &unk_2645B4558;
    void v9[4] = self;
    id v10 = v5;
    id v11 = v4;
    id v7 = v4;
    [v10 connectTag:v6 completionHandler:v9];
  }
  else
  {
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __40__NFCTag__connectWithCompletionHandler___block_invoke;
    v13[3] = &unk_2645B4308;
    id v14 = v4;
    id v8 = v4;
    [(NFCTag *)self dispatchOnDelegateQueueAsync:v13];
  }
}

void __40__NFCTag__connectWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = +[NFCError errorWithCode:103];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

id __40__NFCTag__connectWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 8);
}

void __40__NFCTag__connectWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!v3)
  {
    id v4 = *(os_unfair_lock_s **)(a1 + 32);
    id v5 = v4 + 8;
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __40__NFCTag__connectWithCompletionHandler___block_invoke_4;
    v6[3] = &unk_2645B4508;
    v6[4] = v4;
    id v7 = *(id *)(a1 + 40);
    os_unfair_lock_lock(v5);
    __40__NFCTag__connectWithCompletionHandler___block_invoke_4((uint64_t)v6);
    os_unfair_lock_unlock(v5);
  }
  (*(void (**)(void, id))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v3);
}

uint64_t __40__NFCTag__connectWithCompletionHandler___block_invoke_4(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 8) = [*(id *)(a1 + 40) currentTag];

  return MEMORY[0x270F9A758]();
}

- (BOOL)_disconnectWithError:(id *)a3
{
  id v4 = [(NFCTag *)self _getInternalReaderSession];
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

- (void)_transceiveWithData:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(NFCTag *)self _getInternalReaderSession];
  if (v8)
  {
    if (-[NFCTag type](self, "type") != 1 || (unint64_t)[v6 length] < 0x101) {
      goto LABEL_8;
    }
    uint64_t v9 = 105;
  }
  else
  {
    uint64_t v9 = 103;
  }
  id v10 = +[NFCError errorWithCode:v9];
  if (!v10)
  {
LABEL_8:
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __48__NFCTag__transceiveWithData_completionHandler___block_invoke_2;
    v14[3] = &unk_2645B4580;
    v14[4] = self;
    id v15 = v8;
    id v16 = v6;
    id v17 = v7;
    id v13 = v7;
    [v15 submitBlockOnSessionQueue:v14];

    goto LABEL_9;
  }
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __48__NFCTag__transceiveWithData_completionHandler___block_invoke;
  v18[3] = &unk_2645B43F0;
  id v19 = v10;
  id v20 = v7;
  id v11 = v10;
  id v12 = v7;
  [(NFCTag *)self dispatchOnDelegateQueueAsync:v18];

LABEL_9:
}

uint64_t __48__NFCTag__transceiveWithData_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __48__NFCTag__transceiveWithData_completionHandler___block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v17 = 0;
  id v18 = 0;
  char v5 = [v2 _transceiveWithSession:v3 sendData:v4 receivedData:&v18 error:&v17];
  id v6 = v18;
  id v7 = v17;
  if ((v5 & 1) == 0)
  {
    uint64_t v8 = objc_opt_new();

    id v6 = (id)v8;
  }
  uint64_t v9 = *(void **)(a1 + 40);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __48__NFCTag__transceiveWithData_completionHandler___block_invoke_3;
  v13[3] = &unk_2645B4330;
  id v10 = *(id *)(a1 + 56);
  id v15 = v7;
  id v16 = v10;
  id v14 = v6;
  id v11 = v7;
  id v12 = v6;
  [v9 submitBlockOnDelegateQueue:v13];
}

uint64_t __48__NFCTag__transceiveWithData_completionHandler___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (BOOL)_transceiveWithSession:(id)a3 sendData:(id)a4 receivedData:(id *)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  if (a5) {
    *a5 = 0;
  }
  if ((self->_configuration & 1) == 0)
  {
    id v12 = [v10 currentTag];
    if ([v12 isEqualToNFTag:self->_tag])
    {
      id v28 = 0;
      id v29 = 0;
      id v13 = [v10 transceive:v11 tagUpdate:&v29 error:&v28];
      id v14 = v29;
      id v15 = v28;
      if (v14)
      {
        p_lock = &self->_lock;
        v26[1] = 3221225472;
        v26[0] = MEMORY[0x263EF8330];
        v26[2] = __61__NFCTag__transceiveWithSession_sendData_receivedData_error___block_invoke_2;
        v26[3] = &unk_2645B4508;
        v26[4] = self;
        id v17 = v14;
        id v27 = v17;
        os_unfair_lock_lock(p_lock);
        __61__NFCTag__transceiveWithSession_sendData_receivedData_error___block_invoke_2((uint64_t)v26);
        os_unfair_lock_unlock(p_lock);

        goto LABEL_13;
      }
    }
    else
    {
      id v15 = +[NFCError errorWithCode:104];
      id v13 = 0;
    }
    id v17 = 0;
LABEL_13:

    if (!a5) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  id v34 = 0;
  BOOL v18 = [(NFCTag *)self _connectWithSession:v10 outError:&v34];
  id v19 = v34;
  id v20 = v19;
  if (v18)
  {
    id v32 = v19;
    id v33 = 0;
    id v13 = [v10 transceive:v11 tagUpdate:&v33 error:&v32];
    id v21 = v33;
    id v15 = v32;

    if (v21)
    {
      __int16 v22 = &self->_lock;
      v30[0] = MEMORY[0x263EF8330];
      v30[1] = 3221225472;
      v30[2] = __61__NFCTag__transceiveWithSession_sendData_receivedData_error___block_invoke;
      v30[3] = &unk_2645B4508;
      v30[4] = self;
      id v17 = v21;
      id v31 = v17;
      os_unfair_lock_lock(v22);
      __61__NFCTag__transceiveWithSession_sendData_receivedData_error___block_invoke((uint64_t)v30);
      os_unfair_lock_unlock(v22);

      if (!a5) {
        goto LABEL_15;
      }
LABEL_14:
      *a5 = v13;
      goto LABEL_15;
    }
  }
  else
  {
    id v13 = 0;
    id v15 = v19;
  }
  id v17 = 0;
  if (a5) {
    goto LABEL_14;
  }
LABEL_15:
  if (a6) {
    *a6 = v15;
  }
  if (v15) {
    BOOL v23 = 1;
  }
  else {
    BOOL v23 = v13 == 0;
  }
  BOOL v24 = !v23;

  return v24;
}

void __61__NFCTag__transceiveWithSession_sendData_receivedData_error___block_invoke(uint64_t a1)
{
}

void __61__NFCTag__transceiveWithSession_sendData_receivedData_error___block_invoke_2(uint64_t a1)
{
}

- (void)_sendAPDU:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __38__NFCTag__sendAPDU_completionHandler___block_invoke;
  v8[3] = &unk_2645B42E0;
  id v9 = v6;
  id v7 = v6;
  [(NFCTag *)self _transceiveWithData:a3 completionHandler:v8];
}

void __38__NFCTag__sendAPDU_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = objc_opt_new();
    (*(void (**)(uint64_t, void *, void, void, id))(v6 + 16))(v6, v7, 0, 0, v5);
  }
  else if ((unint64_t)[v14 length] > 1)
  {
    uint64_t v10 = [v14 length];
    id v11 = v14;
    id v12 = (unsigned __int8 *)[v11 bytes];
    uint64_t v13 = *(void *)(a1 + 32);
    if (v10 == 2)
    {
      id v7 = objc_opt_new();
      (*(void (**)(uint64_t, void *, void, void, void))(v13 + 16))(v13, v7, *v12, v12[1], 0);
    }
    else
    {
      id v7 = objc_msgSend(v11, "subdataWithRange:", 0, objc_msgSend(v11, "length") - 2);
      (*(void (**)(uint64_t, void *, void, void, void))(v13 + 16))(v13, v7, v12[[v11 length] - 2], v12[objc_msgSend(v11, "length") - 1], 0);
    }
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 32);
    id v7 = objc_opt_new();
    id v9 = +[NFCError errorWithCode:102];
    (*(void (**)(uint64_t, void *, void, void, void *))(v8 + 16))(v8, v7, 0, 0, v9);
  }
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
  id v9 = [v6 sessionId];
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

+ (unint64_t)_MaxRetry
{
  return 256;
}

+ (double)_MaxRetryInterval
{
  return 3.0;
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