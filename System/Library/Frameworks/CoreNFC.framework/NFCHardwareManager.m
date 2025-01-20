@interface NFCHardwareManager
+ (id)sharedHardwareManager;
- (BOOL)areFeaturesSupported:(unint64_t)a3 outError:(id *)a4;
- (NFCHardwareManager)init;
- (NSArray)getDelegates;
- (id)_queueSession:(id)a3;
- (id)getReaderSessionWithKey:(id)a3;
- (void)_cleanupPresentmentAssertion;
- (void)addNFCHardwareManagerCallbacksListener:(id)a3;
- (void)areFeaturesSupported:(unint64_t)a3 expiry:(double)a4 completion:(id)a5;
- (void)dequeueSession:(id)a3;
- (void)didExpire;
- (void)didFinishCooldown;
- (void)didInvalidate;
- (void)hwStateDidChange:(unsigned int)a3;
- (void)isCardSessionEligibleWithCompletionHandler:(id)a3;
- (void)queueCardFieldDetectSession:(id)a3 completionHandler:(id)a4;
- (void)queueCardSession:(id)a3 sessionConfig:(id)a4 completionHandler:(id)a5;
- (void)queueReaderSession:(id)a3 sessionConfig:(id)a4 completionHandler:(id)a5;
- (void)releasePresentmentSuppression:(id)a3 completion:(id)a4;
- (void)requestPresentmentSuppressionWithDelegate:(id)a3 completion:(id)a4;
@end

@implementation NFCHardwareManager

+ (id)sharedHardwareManager
{
  if (sharedHardwareManager_onceToken[0] != -1) {
    dispatch_once(sharedHardwareManager_onceToken, &__block_literal_global_2);
  }
  v2 = (void *)sharedHardwareManager__singleton;

  return v2;
}

uint64_t __43__NFCHardwareManager_sharedHardwareManager__block_invoke()
{
  sharedHardwareManager__singleton = objc_alloc_init(NFCHardwareManager);

  return MEMORY[0x270F9A758]();
}

- (NFCHardwareManager)init
{
  v13.receiver = self;
  v13.super_class = (Class)NFCHardwareManager;
  v2 = [(NFCHardwareManager *)&v13 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    delegates = v2->_delegates;
    v2->_delegates = (NSHashTable *)v3;

    v5 = [NFCSession alloc];
    v6 = +[NFCHardwareManagerInterface interface];
    v7 = +[NFCHardwareManagerCallbacks interface];
    uint64_t v8 = [(NFCSession *)v5 initWithMachServiceName:@"com.apple.nfcd.service.corenfc" remoteObjectInterface:v6 exportedObjectInterface:v7 exportedObject:v2 delegate:v2];
    xpcSession = v2->_xpcSession;
    v2->_xpcSession = (NFCSession *)v8;

    uint64_t v10 = objc_opt_new();
    queuedCoreNFCSessions = v2->_queuedCoreNFCSessions;
    v2->_queuedCoreNFCSessions = (NSMutableDictionary *)v10;

    *(void *)&v2->_readerSessionLock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

- (id)_queueSession:(id)a3
{
  id v4 = a3;
  v5 = [NSNumber numberWithInteger:arc4random()];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __36__NFCHardwareManager__queueSession___block_invoke;
  v12[3] = &unk_2645B4AE0;
  p_readerSessionLock = &self->_readerSessionLock;
  v12[4] = self;
  id v13 = v4;
  id v7 = v5;
  id v14 = v7;
  id v8 = v4;
  os_unfair_lock_lock(p_readerSessionLock);
  __36__NFCHardwareManager__queueSession___block_invoke(v12);
  os_unfair_lock_unlock(p_readerSessionLock);
  v9 = v14;
  id v10 = v7;

  return v10;
}

uint64_t __36__NFCHardwareManager__queueSession___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 24) setObject:a1[5] forKey:a1[6]];
}

- (void)queueReaderSession:(id)a3 sessionConfig:(id)a4 completionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  xpcSession = self->_xpcSession;
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __73__NFCHardwareManager_queueReaderSession_sessionConfig_completionHandler___block_invoke;
  v21[3] = &unk_2645B4B08;
  id v12 = v10;
  id v22 = v12;
  id v13 = a4;
  id v14 = [(NFCSession *)xpcSession synchronousRemoteObjectProxyWithErrorHandler:v21];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __73__NFCHardwareManager_queueReaderSession_sessionConfig_completionHandler___block_invoke_2;
  v17[3] = &unk_2645B4B30;
  v17[4] = self;
  id v18 = v9;
  id v19 = v12;
  SEL v20 = a2;
  id v15 = v12;
  id v16 = v9;
  [v14 queueReaderSession:v16 sessionConfig:v13 completion:v17];
}

void __73__NFCHardwareManager_queueReaderSession_sessionConfig_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = NSNumber;
  id v4 = a2;
  id v5 = [v3 numberWithInteger:0];
  (*(void (**)(uint64_t, void, void, id, id))(v2 + 16))(v2, 0, 0, v5, v4);
}

void __73__NFCHardwareManager_queueReaderSession_sessionConfig_completionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a4;
  id v8 = [v7 domain];
  id v9 = [NSString stringWithUTF8String:"nfcd"];
  int v10 = [v8 isEqualToString:v9];

  if (v10)
  {
    if ([v7 code] == 36)
    {
      uint64_t v24 = [v7 localizedDescription];
      __CRASHING_DUE_TO_PRIVACY_VIOLATION__(v24);
    }
    if ([v7 code] == 14)
    {
      uint64_t v11 = 1;
    }
    else
    {
      if ([v7 code] != 58 && objc_msgSend(v7, "code") != 47)
      {
        if ([v7 code] == 10)
        {
          uint64_t v11 = 3;
          goto LABEL_8;
        }
        if ([v7 code] == 50)
        {
          uint64_t v11 = 6;
          goto LABEL_8;
        }
        if ([v7 code] != 2)
        {
          if ([v7 code] == 8)
          {
            uint64_t v11 = 2;
          }
          else if ([v7 code] == 32)
          {
            uint64_t v11 = 2;
          }
          else
          {
            uint64_t v11 = 202;
          }
          goto LABEL_8;
        }
      }
      uint64_t v11 = 203;
    }
LABEL_8:
    uint64_t v12 = +[NFCError errorWithCode:v11];

    id v7 = (id)v12;
  }
  if (v7)
  {
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      id v14 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 56));
      uint64_t v17 = 45;
      if (isMetaClass) {
        uint64_t v17 = 43;
      }
      v14(3, "%c[%{public}s %{public}s]:%i error=%{public}@", v17, ClassName, Name, 129, v7);
    }
    id v18 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      id v19 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v19)) {
        int v20 = 43;
      }
      else {
        int v20 = 45;
      }
      v21 = object_getClassName(*(id *)(a1 + 32));
      id v22 = sel_getName(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 67110146;
      int v28 = v20;
      __int16 v29 = 2082;
      v30 = v21;
      __int16 v31 = 2082;
      v32 = v22;
      __int16 v33 = 1024;
      int v34 = 129;
      __int16 v35 = 2114;
      id v36 = v7;
      _os_log_impl(&dword_2214B8000, v18, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i error=%{public}@", buf, 0x2Cu);
    }

    v23 = 0;
  }
  else
  {
    v23 = [*(id *)(a1 + 32) _queueSession:*(void *)(a1 + 40)];
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)queueCardSession:(id)a3 sessionConfig:(id)a4 completionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  xpcSession = self->_xpcSession;
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __71__NFCHardwareManager_queueCardSession_sessionConfig_completionHandler___block_invoke;
  v21[3] = &unk_2645B4B08;
  id v12 = v10;
  id v22 = v12;
  id v13 = a4;
  id v14 = [(NFCSession *)xpcSession synchronousRemoteObjectProxyWithErrorHandler:v21];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __71__NFCHardwareManager_queueCardSession_sessionConfig_completionHandler___block_invoke_2;
  v17[3] = &unk_2645B4B58;
  v17[4] = self;
  id v18 = v9;
  id v19 = v12;
  SEL v20 = a2;
  id v15 = v12;
  id v16 = v9;
  [v14 queueCardSession:v16 sessionConfig:v13 completion:v17];
}

void __71__NFCHardwareManager_queueCardSession_sessionConfig_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = NSNumber;
  id v4 = a2;
  id v5 = [v3 numberWithInteger:0];
  (*(void (**)(uint64_t, void, void, id, id))(v2 + 16))(v2, 0, 0, v5, v4);
}

void __71__NFCHardwareManager_queueCardSession_sessionConfig_completionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a4;
  id v8 = [v7 domain];
  id v9 = [NSString stringWithUTF8String:"nfcd"];
  int v10 = [v8 isEqualToString:v9];

  if (v10 && [v7 code] == 36)
  {
    uint64_t v22 = [v7 localizedDescription];
    __CRASHING_DUE_TO_PRIVACY_VIOLATION__(v22);
  }
  if (v7)
  {
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      id v12 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 56));
      uint64_t v15 = 45;
      if (isMetaClass) {
        uint64_t v15 = 43;
      }
      v12(3, "%c[%{public}s %{public}s]:%i error=%{public}@", v15, ClassName, Name, 161, v7);
    }
    id v16 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v17)) {
        int v18 = 43;
      }
      else {
        int v18 = 45;
      }
      id v19 = object_getClassName(*(id *)(a1 + 32));
      SEL v20 = sel_getName(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 67110146;
      int v26 = v18;
      __int16 v27 = 2082;
      int v28 = v19;
      __int16 v29 = 2082;
      v30 = v20;
      __int16 v31 = 1024;
      int v32 = 161;
      __int16 v33 = 2114;
      id v34 = v7;
      _os_log_impl(&dword_2214B8000, v16, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i error=%{public}@", buf, 0x2Cu);
    }

    v21 = 0;
  }
  else
  {
    v21 = [*(id *)(a1 + 32) _queueSession:*(void *)(a1 + 40)];
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)queueCardFieldDetectSession:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  xpcSession = self->_xpcSession;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __68__NFCHardwareManager_queueCardFieldDetectSession_completionHandler___block_invoke;
  v18[3] = &unk_2645B4B08;
  id v10 = v8;
  id v19 = v10;
  uint64_t v11 = [(NFCSession *)xpcSession synchronousRemoteObjectProxyWithErrorHandler:v18];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __68__NFCHardwareManager_queueCardFieldDetectSession_completionHandler___block_invoke_2;
  v14[3] = &unk_2645B4B80;
  v14[4] = self;
  id v15 = v7;
  id v16 = v10;
  SEL v17 = a2;
  id v12 = v10;
  id v13 = v7;
  [v11 queueCardFieldDetectSession:v13 completion:v14];
}

uint64_t __68__NFCHardwareManager_queueCardFieldDetectSession_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __68__NFCHardwareManager_queueCardFieldDetectSession_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (v5)
  {
    id v6 = a2;
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      id v8 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 56));
      uint64_t v11 = 45;
      if (isMetaClass) {
        uint64_t v11 = 43;
      }
      v8(3, "%c[%{public}s %{public}s]:%i error=%{public}@", v11, ClassName, Name, 184, v5);
    }
    id v12 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v13)) {
        int v14 = 43;
      }
      else {
        int v14 = 45;
      }
      id v15 = object_getClassName(*(id *)(a1 + 32));
      id v16 = sel_getName(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 67110146;
      int v23 = v14;
      __int16 v24 = 2082;
      v25 = v15;
      __int16 v26 = 2082;
      __int16 v27 = v16;
      __int16 v28 = 1024;
      int v29 = 184;
      __int16 v30 = 2114;
      id v31 = v5;
      _os_log_impl(&dword_2214B8000, v12, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i error=%{public}@", buf, 0x2Cu);
    }
  }
  else
  {
    SEL v17 = *(void **)(a1 + 32);
    uint64_t v18 = *(void *)(a1 + 40);
    id v19 = a2;
    id v12 = [v17 _queueSession:v18];
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)requestPresentmentSuppressionWithDelegate:(id)a3 completion:(id)a4
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = (void (**)(id, void, void *))a4;
  uint64_t v41 = 0;
  v42 = &v41;
  uint64_t v43 = 0x2020000000;
  char v44 = 0;
  v36[0] = MEMORY[0x263EF8330];
  v36[1] = 3221225472;
  uint64_t v37 = __75__NFCHardwareManager_requestPresentmentSuppressionWithDelegate_completion___block_invoke;
  v38 = &unk_2645B44B8;
  v39 = self;
  v40 = &v41;
  id v9 = v36;
  os_unfair_lock_lock(&self->_presentmentSuppressionLock);
  v37((uint64_t)v9);
  os_unfair_lock_unlock(&self->_presentmentSuppressionLock);

  if (*((unsigned char *)v42 + 24))
  {
    uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger)
    {
      Class = object_getClass(self);
      if (class_isMetaClass(Class)) {
        uint64_t v12 = 43;
      }
      else {
        uint64_t v12 = 45;
      }
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      Logger(3, "%c[%{public}s %{public}s]:%i Resource unavailable", v12, ClassName, Name, 205);
    }
    id v15 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      id v16 = object_getClass(self);
      if (class_isMetaClass(v16)) {
        int v17 = 43;
      }
      else {
        int v17 = 45;
      }
      uint64_t v18 = object_getClassName(self);
      id v19 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      int v48 = v17;
      __int16 v49 = 2082;
      v50 = v18;
      __int16 v51 = 2082;
      v52 = v19;
      __int16 v53 = 1024;
      int v54 = 205;
      _os_log_impl(&dword_2214B8000, v15, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Resource unavailable", buf, 0x22u);
    }

    id v20 = objc_alloc(MEMORY[0x263F087E8]);
    v21 = [NSString stringWithUTF8String:"nfcd"];
    v45[0] = *MEMORY[0x263F08320];
    uint64_t v22 = [NSString stringWithUTF8String:"No resources"];
    v46[0] = v22;
    v46[1] = &unk_26D398248;
    v45[1] = @"Line";
    v45[2] = @"Method";
    int v23 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s", sel_getName(a2));
    v46[2] = v23;
    v45[3] = *MEMORY[0x263F07F80];
    __int16 v24 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s:%d", sel_getName(a2), 206);
    v46[3] = v24;
    v25 = [NSDictionary dictionaryWithObjects:v46 forKeys:v45 count:4];
    __int16 v26 = (void *)[v20 initWithDomain:v21 code:34 userInfo:v25];
    v8[2](v8, 0, v26);
  }
  else
  {
    xpcSession = self->_xpcSession;
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = __75__NFCHardwareManager_requestPresentmentSuppressionWithDelegate_completion___block_invoke_44;
    v34[3] = &unk_2645B4B08;
    __int16 v28 = v8;
    id v35 = v28;
    int v29 = [(NFCSession *)xpcSession remoteObjectProxyWithErrorHandler:v34];
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __75__NFCHardwareManager_requestPresentmentSuppressionWithDelegate_completion___block_invoke_2;
    v30[3] = &unk_2645B4BA8;
    v30[4] = self;
    SEL v33 = a2;
    id v31 = v7;
    uint64_t v32 = v28;
    [v29 requestSuppressPresentmentWithCompletion:v30];

    v21 = v35;
  }

  _Block_object_dispose(&v41, 8);
}

uint64_t __75__NFCHardwareManager_requestPresentmentSuppressionWithDelegate_completion___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 48) != 0;
  return result;
}

uint64_t __75__NFCHardwareManager_requestPresentmentSuppressionWithDelegate_completion___block_invoke_44(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __75__NFCHardwareManager_requestPresentmentSuppressionWithDelegate_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (v5)
  {
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      id v7 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 56));
      uint64_t v10 = 45;
      if (isMetaClass) {
        uint64_t v10 = 43;
      }
      v7(3, "%c[%{public}s %{public}s]:%i error=%{public}@", v10, ClassName, Name, 217, v5);
    }
    uint64_t v11 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v12)) {
        int v13 = 43;
      }
      else {
        int v13 = 45;
      }
      int v14 = object_getClassName(*(id *)(a1 + 32));
      id v15 = sel_getName(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 67110146;
      int v28 = v13;
      __int16 v29 = 2082;
      __int16 v30 = v14;
      __int16 v31 = 2082;
      uint64_t v32 = v15;
      __int16 v33 = 1024;
      int v34 = 217;
      __int16 v35 = 2114;
      id v36 = v5;
      _os_log_impl(&dword_2214B8000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i error=%{public}@", buf, 0x2Cu);
    }

    id v16 = 0;
  }
  else
  {
    int v17 = +[NFCPresentmentSuppression assertionWithAssertion:a2 delegate:*(void *)(a1 + 32)];
    uint64_t v18 = *(os_unfair_lock_s **)(a1 + 32);
    id v19 = v18 + 11;
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __75__NFCHardwareManager_requestPresentmentSuppressionWithDelegate_completion___block_invoke_46;
    v24[3] = &unk_2645B4AE0;
    v24[4] = v18;
    id v16 = v17;
    id v25 = v16;
    id v26 = *(id *)(a1 + 40);
    os_unfair_lock_lock(v19);
    __75__NFCHardwareManager_requestPresentmentSuppressionWithDelegate_completion___block_invoke_46((uint64_t)v24);
    os_unfair_lock_unlock(v19);
  }
  uint64_t v20 = *(void *)(a1 + 48);
  v21 = [v16 externalHandle];
  (*(void (**)(uint64_t, void *, id))(v20 + 16))(v20, v21, v5);
}

uint64_t __75__NFCHardwareManager_requestPresentmentSuppressionWithDelegate_completion___block_invoke_46(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 48), *(id *)(a1 + 40));
  objc_storeWeak((id *)(*(void *)(a1 + 32) + 56), *(id *)(a1 + 48));
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 48);

  return [v2 startAssertion:15.0];
}

- (void)releasePresentmentSuppression:(id)a3 completion:(id)a4
{
  v63[4] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = (void (**)(id, void *))a4;
  uint64_t v46 = 0;
  v47 = &v46;
  uint64_t v48 = 0x3032000000;
  __int16 v49 = __Block_byref_object_copy__1;
  v50 = __Block_byref_object_dispose__1;
  id v51 = 0;
  v39[0] = MEMORY[0x263EF8330];
  v39[1] = 3221225472;
  v40 = __63__NFCHardwareManager_releasePresentmentSuppression_completion___block_invoke;
  uint64_t v41 = &unk_2645B4BD0;
  v42 = self;
  id v9 = v7;
  char v44 = &v46;
  SEL v45 = a2;
  id v43 = v9;
  uint64_t v10 = v39;
  os_unfair_lock_lock(&self->_presentmentSuppressionLock);
  uint64_t v11 = v40((uint64_t)v10);
  os_unfair_lock_unlock(&self->_presentmentSuppressionLock);

  if (v11)
  {
    v8[2](v8, v11);
  }
  else
  {
    if (v47[5])
    {
      uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (Logger)
      {
        Class = object_getClass(self);
        if (class_isMetaClass(Class)) {
          uint64_t v14 = 43;
        }
        else {
          uint64_t v14 = 45;
        }
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        Logger(6, "%c[%{public}s %{public}s]:%i handle=%lu", v14, ClassName, Name, 257, [v9 unsignedIntegerValue]);
      }
      int v17 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v18 = object_getClass(self);
        if (class_isMetaClass(v18)) {
          int v19 = 43;
        }
        else {
          int v19 = 45;
        }
        uint64_t v20 = object_getClassName(self);
        v21 = sel_getName(a2);
        uint64_t v22 = [v9 unsignedIntegerValue];
        *(_DWORD *)buf = 67110146;
        int v53 = v19;
        __int16 v54 = 2082;
        uint64_t v55 = v20;
        __int16 v56 = 2082;
        v57 = v21;
        __int16 v58 = 1024;
        int v59 = 257;
        __int16 v60 = 2048;
        uint64_t v61 = v22;
        _os_log_impl(&dword_2214B8000, v17, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i handle=%lu", buf, 0x2Cu);
      }

      xpcSession = self->_xpcSession;
      v37[0] = MEMORY[0x263EF8330];
      v37[1] = 3221225472;
      v37[2] = __63__NFCHardwareManager_releasePresentmentSuppression_completion___block_invoke_55;
      v37[3] = &unk_2645B4B08;
      __int16 v24 = v8;
      v38 = v24;
      id v25 = [(NFCSession *)xpcSession remoteObjectProxyWithErrorHandler:v37];
      uint64_t v26 = v47[5];
      v34[0] = MEMORY[0x263EF8330];
      v34[1] = 3221225472;
      v34[2] = __63__NFCHardwareManager_releasePresentmentSuppression_completion___block_invoke_2;
      v34[3] = &unk_2645B4BF8;
      void v34[4] = self;
      SEL v36 = a2;
      __int16 v35 = v24;
      [v25 releaseSuppressPresentmentAssertion:v26 completion:v34];

      __int16 v27 = v38;
    }
    else
    {
      id v28 = objc_alloc(MEMORY[0x263F087E8]);
      __int16 v27 = [NSString stringWithUTF8String:"nfcd"];
      v62[0] = *MEMORY[0x263F08320];
      __int16 v29 = [NSString stringWithUTF8String:"Invalid Parameter"];
      v63[0] = v29;
      v63[1] = &unk_26D398278;
      v62[1] = @"Line";
      v62[2] = @"Method";
      __int16 v30 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s", sel_getName(a2));
      v63[2] = v30;
      v62[3] = *MEMORY[0x263F07F80];
      __int16 v31 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s:%d", sel_getName(a2), 253);
      v63[3] = v31;
      uint64_t v32 = [NSDictionary dictionaryWithObjects:v63 forKeys:v62 count:4];
      __int16 v33 = (void *)[v28 initWithDomain:v27 code:10 userInfo:v32];
      v8[2](v8, v33);
    }
  }

  _Block_object_dispose(&v46, 8);
}

id __63__NFCHardwareManager_releasePresentmentSuppression_completion___block_invoke(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 48) externalHandle];
  char v3 = [v2 isEqualToNumber:*(void *)(a1 + 40)];

  if (v3)
  {
    uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 48) assertion];
    uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;

    id v7 = 0;
  }
  else
  {
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      id v9 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 56));
      uint64_t v13 = 45;
      if (isMetaClass) {
        uint64_t v13 = 43;
      }
      v9(3, "%c[%{public}s %{public}s]:%i Invalid handle", v13, ClassName, Name, 242);
    }
    uint64_t v14 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      id v15 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v15)) {
        int v16 = 43;
      }
      else {
        int v16 = 45;
      }
      int v17 = object_getClassName(*(id *)(a1 + 32));
      uint64_t v18 = sel_getName(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 67109890;
      int v30 = v16;
      __int16 v31 = 2082;
      uint64_t v32 = v17;
      __int16 v33 = 2082;
      int v34 = v18;
      __int16 v35 = 1024;
      int v36 = 242;
      _os_log_impl(&dword_2214B8000, v14, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid handle", buf, 0x22u);
    }

    id v19 = objc_alloc(MEMORY[0x263F087E8]);
    uint64_t v20 = [NSString stringWithUTF8String:"nfcd"];
    v27[0] = *MEMORY[0x263F08320];
    v21 = [NSString stringWithUTF8String:"Invalid Parameter"];
    v28[0] = v21;
    v28[1] = &unk_26D398260;
    v27[1] = @"Line";
    v27[2] = @"Method";
    uint64_t v22 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s", sel_getName(*(SEL *)(a1 + 56)));
    v28[2] = v22;
    v27[3] = *MEMORY[0x263F07F80];
    int v23 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s:%d", sel_getName(*(SEL *)(a1 + 56)), 243);
    v28[3] = v23;
    __int16 v24 = [NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:4];
    id v7 = (void *)[v19 initWithDomain:v20 code:10 userInfo:v24];
  }

  return v7;
}

uint64_t __63__NFCHardwareManager_releasePresentmentSuppression_completion___block_invoke_55(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __63__NFCHardwareManager_releasePresentmentSuppression_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      uint64_t v5 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 48));
      uint64_t v8 = 45;
      if (isMetaClass) {
        uint64_t v8 = 43;
      }
      v5(3, "%c[%{public}s %{public}s]:%i error=%{public}@", v8, ClassName, Name, 262, v3);
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
      uint64_t v13 = sel_getName(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 67110146;
      int v20 = v11;
      __int16 v21 = 2082;
      uint64_t v22 = v12;
      __int16 v23 = 2082;
      __int16 v24 = v13;
      __int16 v25 = 1024;
      int v26 = 262;
      __int16 v27 = 2114;
      id v28 = v3;
      _os_log_impl(&dword_2214B8000, v9, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i error=%{public}@", buf, 0x2Cu);
    }
  }
  else
  {
    uint64_t v14 = *(os_unfair_lock_s **)(a1 + 32);
    id v15 = v14 + 11;
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __63__NFCHardwareManager_releasePresentmentSuppression_completion___block_invoke_56;
    v18[3] = &unk_2645B45A8;
    void v18[4] = v14;
    os_unfair_lock_lock(v14 + 11);
    __63__NFCHardwareManager_releasePresentmentSuppression_completion___block_invoke_56((uint64_t)v18);
    os_unfair_lock_unlock(v15);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __63__NFCHardwareManager_releasePresentmentSuppression_completion___block_invoke_56(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 48) startCooldown:15.0];
}

- (void)isCardSessionEligibleWithCompletionHandler:(id)a3
{
  id v4 = a3;
  xpcSession = self->_xpcSession;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __65__NFCHardwareManager_isCardSessionEligibleWithCompletionHandler___block_invoke;
  v11[3] = &unk_2645B4B08;
  id v6 = v4;
  id v12 = v6;
  id v7 = [(NFCSession *)xpcSession remoteObjectProxyWithErrorHandler:v11];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __65__NFCHardwareManager_isCardSessionEligibleWithCompletionHandler___block_invoke_2;
  v9[3] = &unk_2645B4C20;
  id v10 = v6;
  id v8 = v6;
  [v7 isCardSessionEligibleWithCompletion:v9];
}

uint64_t __65__NFCHardwareManager_isCardSessionEligibleWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __65__NFCHardwareManager_isCardSessionEligibleWithCompletionHandler___block_invoke_2(uint64_t a1, unint64_t a2, void *a3)
{
  if (a3)
  {
    uint64_t v5 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else if (a2 >= 3)
  {
    if (a2 != 3) {
      goto LABEL_8;
    }
    uint64_t v5 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    uint64_t v5 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v5();
LABEL_8:

  return MEMORY[0x270F9A790]();
}

- (void)dequeueSession:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __37__NFCHardwareManager_dequeueSession___block_invoke;
  v7[3] = &unk_2645B4508;
  p_readerSessionLock = &self->_readerSessionLock;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  os_unfair_lock_lock(p_readerSessionLock);
  __37__NFCHardwareManager_dequeueSession___block_invoke((uint64_t)v7);
  os_unfair_lock_unlock(p_readerSessionLock);
}

void __37__NFCHardwareManager_dequeueSession___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 24) allKeysForObject:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 32) + 24) removeObjectsForKeys:v2];
}

- (NSArray)getDelegates
{
  id v2 = self;
  objc_sync_enter(v2);
  id v3 = [(NSHashTable *)v2->_delegates allObjects];
  objc_sync_exit(v2);

  return (NSArray *)v3;
}

- (void)addNFCHardwareManagerCallbacksListener:(id)a3
{
  id v5 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  [(NSHashTable *)v4->_delegates addObject:v5];
  objc_sync_exit(v4);
}

- (BOOL)areFeaturesSupported:(unint64_t)a3 outError:(id *)a4
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  uint64_t v49 = 0;
  v50 = &v49;
  uint64_t v51 = 0x2020000000;
  char v52 = 0;
  uint64_t v43 = 0;
  char v44 = &v43;
  uint64_t v45 = 0x3032000000;
  uint64_t v46 = __Block_byref_object_copy__1;
  v47 = __Block_byref_object_dispose__1;
  id v48 = 0;
  if (a4) {
    *a4 = 0;
  }
  xpcSession = self->_xpcSession;
  v42[0] = MEMORY[0x263EF8330];
  v42[1] = 3221225472;
  v42[2] = __52__NFCHardwareManager_areFeaturesSupported_outError___block_invoke;
  v42[3] = &unk_2645B4780;
  v42[4] = &v43;
  id v9 = [(NFCSession *)xpcSession synchronousRemoteObjectProxyWithErrorHandler:v42];
  v41[0] = MEMORY[0x263EF8330];
  v41[1] = 3221225472;
  v41[2] = __52__NFCHardwareManager_areFeaturesSupported_outError___block_invoke_2;
  v41[3] = &unk_2645B4C48;
  v41[4] = &v43;
  v41[5] = &v49;
  [v9 areFeaturesSupported:a3 completion:v41];

  id v10 = (void *)v44[5];
  if (v10)
  {
    int v11 = [v10 domain];
    id v12 = [NSString stringWithUTF8String:"nfcd"];
    int v13 = [v11 isEqualToString:v12];

    if (v13)
    {
      uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (Logger)
      {
        Class = object_getClass(self);
        if (class_isMetaClass(Class)) {
          uint64_t v16 = 43;
        }
        else {
          uint64_t v16 = 45;
        }
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        Logger(4, "%c[%{public}s %{public}s]:%i Stack error: %@", v16, ClassName, Name, 345, v44[5]);
      }
      id v19 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        int v20 = object_getClass(self);
        if (class_isMetaClass(v20)) {
          int v21 = 43;
        }
        else {
          int v21 = 45;
        }
        uint64_t v22 = object_getClassName(self);
        __int16 v23 = sel_getName(a2);
        uint64_t v24 = v44[5];
        *(_DWORD *)buf = 67110146;
        int v56 = v21;
        __int16 v57 = 2082;
        __int16 v58 = v22;
        __int16 v59 = 2082;
        __int16 v60 = v23;
        __int16 v61 = 1024;
        int v62 = 345;
        __int16 v63 = 2112;
        uint64_t v64 = v24;
        _os_log_impl(&dword_2214B8000, v19, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Stack error: %@", buf, 0x2Cu);
      }

      if (a4)
      {
        if ([(id)v44[5] code] == 57)
        {
          id v25 = +[NFCError errorWithCode:1];
        }
        else
        {
          if ([(id)v44[5] code] != 58)
          {
            v53[0] = *MEMORY[0x263F08320];
            v39 = [NSString stringWithUTF8String:"Stack Error"];
            v53[1] = *MEMORY[0x263F08608];
            v54[0] = v39;
            v54[1] = v44[5];
            v40 = [NSDictionary dictionaryWithObjects:v54 forKeys:v53 count:2];
            *a4 = +[NFCError errorWithCode:202 userInfo:v40];

            goto LABEL_31;
          }
          id v25 = +[NFCError errorWithCode:203];
        }
        goto LABEL_30;
      }
    }
    else
    {
      int v26 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v26)
      {
        __int16 v27 = object_getClass(self);
        if (class_isMetaClass(v27)) {
          uint64_t v28 = 43;
        }
        else {
          uint64_t v28 = 45;
        }
        uint64_t v29 = object_getClassName(self);
        int v30 = sel_getName(a2);
        v26(4, "%c[%{public}s %{public}s]:%i XPC Error: %@", v28, v29, v30, 358, v44[5]);
      }
      __int16 v31 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        uint64_t v32 = object_getClass(self);
        if (class_isMetaClass(v32)) {
          int v33 = 43;
        }
        else {
          int v33 = 45;
        }
        int v34 = object_getClassName(self);
        __int16 v35 = sel_getName(a2);
        uint64_t v36 = v44[5];
        *(_DWORD *)buf = 67110146;
        int v56 = v33;
        __int16 v57 = 2082;
        __int16 v58 = v34;
        __int16 v59 = 2082;
        __int16 v60 = v35;
        __int16 v61 = 1024;
        int v62 = 358;
        __int16 v63 = 2112;
        uint64_t v64 = v36;
        _os_log_impl(&dword_2214B8000, v31, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i XPC Error: %@", buf, 0x2Cu);
      }

      if (a4)
      {
        id v25 = (id) v44[5];
LABEL_30:
        *a4 = v25;
      }
    }
  }
LABEL_31:
  BOOL v37 = *((unsigned char *)v50 + 24) != 0;
  _Block_object_dispose(&v43, 8);

  _Block_object_dispose(&v49, 8);
  return v37;
}

void __52__NFCHardwareManager_areFeaturesSupported_outError___block_invoke(uint64_t a1, void *a2)
{
}

void __52__NFCHardwareManager_areFeaturesSupported_outError___block_invoke_2(uint64_t a1, char a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), obj);
  id v6 = obj;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
}

- (void)areFeaturesSupported:(unint64_t)a3 expiry:(double)a4 completion:(id)a5
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v9 = (void (**)(id, void, void *))a5;
  id v45 = 0;
  BOOL v10 = [(NFCHardwareManager *)self areFeaturesSupported:a3 outError:&v45];
  id v11 = v45;
  if (v11)
  {
    id v12 = v11;
    if ([v11 code] == 1 || objc_msgSend(v12, "code") == 202)
    {
      v9[2](v9, 0, v12);
    }
    else
    {
      int v13 = self;
      objc_sync_enter(v13);
      if (v13->_hwSupportStateUpdate)
      {
        uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (Logger)
        {
          Class = object_getClass(v13);
          if (class_isMetaClass(Class)) {
            uint64_t v16 = 43;
          }
          else {
            uint64_t v16 = 45;
          }
          ClassName = object_getClassName(v13);
          Name = sel_getName(a2);
          Logger(4, "%c[%{public}s %{public}s]:%i Previous operation in progress", v16, ClassName, Name, 383);
        }
        id v19 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          int v20 = object_getClass(v13);
          if (class_isMetaClass(v20)) {
            int v21 = 43;
          }
          else {
            int v21 = 45;
          }
          uint64_t v22 = object_getClassName(v13);
          __int16 v23 = sel_getName(a2);
          *(_DWORD *)buf = 67109890;
          int v47 = v21;
          __int16 v48 = 2082;
          uint64_t v49 = v22;
          __int16 v50 = 2082;
          uint64_t v51 = v23;
          __int16 v52 = 1024;
          int v53 = 383;
          _os_log_impl(&dword_2214B8000, v19, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Previous operation in progress", buf, 0x22u);
        }

        uint64_t v24 = +[NFCError errorWithCode:203];
        v9[2](v9, 0, v24);

        objc_sync_exit(v13);
      }
      else
      {
        dispatch_semaphore_t v25 = dispatch_semaphore_create(0);
        p_hwSupportStateUpdate = (void **)&v13->_hwSupportStateUpdate;
        hwSupportStateUpdate = v13->_hwSupportStateUpdate;
        v13->_hwSupportStateUpdate = (OS_dispatch_semaphore *)v25;

        objc_sync_exit(v13);
        dispatch_time_t v28 = dispatch_time(0, (uint64_t)(a4 * 1000000.0 * 1000.0));
        intptr_t v29 = dispatch_semaphore_wait((dispatch_semaphore_t)v13->_hwSupportStateUpdate, v28);
        int v30 = v13;
        objc_sync_enter(v30);
        __int16 v31 = *p_hwSupportStateUpdate;
        *p_hwSupportStateUpdate = 0;

        objc_sync_exit(v30);
        if (v29)
        {
          uint64_t v32 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
          if (v32)
          {
            int v33 = object_getClass(v30);
            if (class_isMetaClass(v33)) {
              uint64_t v34 = 43;
            }
            else {
              uint64_t v34 = 45;
            }
            __int16 v35 = object_getClassName(v30);
            uint64_t v36 = sel_getName(a2);
            v32(4, "%c[%{public}s %{public}s]:%i HW state query timeout", v34, v35, v36, 398);
          }
          BOOL v37 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          {
            v38 = object_getClass(v30);
            if (class_isMetaClass(v38)) {
              int v39 = 43;
            }
            else {
              int v39 = 45;
            }
            v40 = object_getClassName(v30);
            uint64_t v41 = sel_getName(a2);
            *(_DWORD *)buf = 67109890;
            int v47 = v39;
            __int16 v48 = 2082;
            uint64_t v49 = v40;
            __int16 v50 = 2082;
            uint64_t v51 = v41;
            __int16 v52 = 1024;
            int v53 = 398;
            _os_log_impl(&dword_2214B8000, v37, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i HW state query timeout", buf, 0x22u);
          }
        }
        id v44 = v12;
        uint64_t v42 = [(NFCHardwareManager *)v30 areFeaturesSupported:a3 outError:&v44];
        id v43 = v44;

        v9[2](v9, v42, v43);
      }
    }
  }
  else
  {
    v9[2](v9, v10, 0);
  }
}

- (id)getReaderSessionWithKey:(id)a3
{
  id v4 = a3;
  uint64_t v16 = 0;
  int v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = __Block_byref_object_copy__1;
  int v20 = __Block_byref_object_dispose__1;
  id v21 = 0;
  p_readerSessionLock = &self->_readerSessionLock;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  id v11 = __46__NFCHardwareManager_getReaderSessionWithKey___block_invoke;
  id v12 = &unk_2645B4530;
  id v15 = &v16;
  int v13 = self;
  id v6 = v4;
  id v14 = v6;
  id v7 = v10;
  os_unfair_lock_lock(p_readerSessionLock);
  v11(v7);
  os_unfair_lock_unlock(p_readerSessionLock);

  id v8 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  return v8;
}

uint64_t __46__NFCHardwareManager_getReaderSessionWithKey___block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[6] + 8) + 40) = [*(id *)(a1[4] + 24) objectForKey:a1[5]];

  return MEMORY[0x270F9A758]();
}

- (void)hwStateDidChange:(unsigned int)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v7 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v10 = 45;
    if (isMetaClass) {
      uint64_t v10 = 43;
    }
    v7(6, "%c[%{public}s %{public}s]:%i HW support state update: %lu", v10, ClassName, Name, 436, a3);
  }
  id v11 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = object_getClass(self);
    if (class_isMetaClass(v12)) {
      int v13 = 43;
    }
    else {
      int v13 = 45;
    }
    *(_DWORD *)buf = 67110146;
    int v22 = v13;
    __int16 v23 = 2082;
    uint64_t v24 = object_getClassName(self);
    __int16 v25 = 2082;
    int v26 = sel_getName(a2);
    __int16 v27 = 1024;
    int v28 = 436;
    __int16 v29 = 2048;
    uint64_t v30 = a3;
    _os_log_impl(&dword_2214B8000, v11, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i HW support state update: %lu", buf, 0x2Cu);
  }

  id v14 = self;
  objc_sync_enter(v14);
  id v15 = [(NSHashTable *)v14->_delegates allObjects];
  hwSupportStateUpdate = v14->_hwSupportStateUpdate;
  if (hwSupportStateUpdate) {
    dispatch_semaphore_signal(hwSupportStateUpdate);
  }
  objc_sync_exit(v14);

  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __39__NFCHardwareManager_hwStateDidChange___block_invoke;
  v19[3] = &__block_descriptor_36_e46_v32__0___NFCHardwareManagerCallbacks__8Q16_B24l;
  unsigned int v20 = a3;
  [v15 enumerateObjectsUsingBlock:v19];
}

uint64_t __39__NFCHardwareManager_hwStateDidChange___block_invoke(uint64_t a1, void *a2)
{
  return [a2 hwStateDidChange:*(unsigned int *)(a1 + 32)];
}

- (void)_cleanupPresentmentAssertion
{
  uint64_t v12 = 0;
  int v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__1;
  uint64_t v16 = __Block_byref_object_dispose__1;
  id v17 = 0;
  p_presentmentSuppressionLock = &self->_presentmentSuppressionLock;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  id v8 = __50__NFCHardwareManager__cleanupPresentmentAssertion__block_invoke;
  id v9 = &unk_2645B4C90;
  uint64_t v10 = self;
  id v11 = &v12;
  id v4 = v7;
  os_unfair_lock_lock(p_presentmentSuppressionLock);
  v8((uint64_t)v4);
  os_unfair_lock_unlock(p_presentmentSuppressionLock);

  uint64_t v5 = v13[5];
  if (v5)
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __50__NFCHardwareManager__cleanupPresentmentAssertion__block_invoke_2;
    v6[3] = &unk_2645B4A68;
    v6[4] = self;
    [(NFCHardwareManager *)self releasePresentmentSuppression:v5 completion:v6];
  }
  _Block_object_dispose(&v12, 8);
}

uint64_t __50__NFCHardwareManager__cleanupPresentmentAssertion__block_invoke(uint64_t a1)
{
  objc_storeWeak((id *)(*(void *)(a1 + 32) + 56), 0);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 48) externalHandle];

  return MEMORY[0x270F9A758]();
}

void __50__NFCHardwareManager__cleanupPresentmentAssertion__block_invoke_2(uint64_t a1)
{
  v1 = *(os_unfair_lock_s **)(a1 + 32);
  id v2 = v1 + 11;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __50__NFCHardwareManager__cleanupPresentmentAssertion__block_invoke_3;
  v3[3] = &unk_2645B45A8;
  v3[4] = v1;
  os_unfair_lock_lock(v1 + 11);
  __50__NFCHardwareManager__cleanupPresentmentAssertion__block_invoke_3((uint64_t)v3);
  os_unfair_lock_unlock(v2);
}

void __50__NFCHardwareManager__cleanupPresentmentAssertion__block_invoke_3(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 48) invalidate];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 48);
  *(void *)(v2 + 48) = 0;
}

- (void)didInvalidate
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  id v3 = [(NSHashTable *)v2->_delegates allObjects];
  objc_sync_exit(v2);

  [v3 enumerateObjectsUsingBlock:&__block_literal_global_67];
  [(NFCHardwareManager *)v2 _cleanupPresentmentAssertion];
}

uint64_t __35__NFCHardwareManager_didInvalidate__block_invoke(uint64_t a1, void *a2)
{
  return [a2 didInvalidate];
}

- (void)didExpire
{
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000;
  int v26 = __Block_byref_object_copy__1;
  __int16 v27 = __Block_byref_object_dispose__1;
  id v28 = 0;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  unsigned int v20 = __Block_byref_object_copy__1;
  id v21 = __Block_byref_object_dispose__1;
  id v22 = 0;
  p_presentmentSuppressionLock = &self->_presentmentSuppressionLock;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  uint64_t v12 = __31__NFCHardwareManager_didExpire__block_invoke;
  int v13 = &unk_2645B4CD8;
  uint64_t v14 = self;
  id v15 = &v23;
  uint64_t v16 = &v17;
  uint64_t v5 = v11;
  os_unfair_lock_lock(p_presentmentSuppressionLock);
  v12(v5);
  os_unfair_lock_unlock(p_presentmentSuppressionLock);

  if (v18[5])
  {
    xpcSession = self->_xpcSession;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    void v10[2] = __31__NFCHardwareManager_didExpire__block_invoke_2;
    v10[3] = &unk_2645B4928;
    v10[4] = self;
    v10[5] = a2;
    id v7 = [(NFCSession *)xpcSession remoteObjectProxyWithErrorHandler:v10];
    uint64_t v8 = v18[5];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __31__NFCHardwareManager_didExpire__block_invoke_69;
    v9[3] = &unk_2645B4928;
    void v9[4] = self;
    v9[5] = a2;
    [v7 releaseSuppressPresentmentAssertion:v8 completion:v9];
  }
  [(id)v24[5] didExpire];
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
}

uint64_t __31__NFCHardwareManager_didExpire__block_invoke(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 56));
  uint64_t v3 = *(void *)(a1[5] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = WeakRetained;

  [*(id *)(a1[4] + 48) startCooldown:15.0];
  *(void *)(*(void *)(a1[6] + 8) + 40) = [*(id *)(a1[4] + 48) assertion];

  return MEMORY[0x270F9A758]();
}

void __31__NFCHardwareManager_didExpire__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    uint64_t v5 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 40));
    uint64_t v8 = 45;
    if (isMetaClass) {
      uint64_t v8 = 43;
    }
    v5(3, "%c[%{public}s %{public}s]:%i XPC error=%@", v8, ClassName, Name, 508, v3);
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
    int v13 = sel_getName(*(SEL *)(a1 + 40));
    *(_DWORD *)buf = 67110146;
    int v17 = v11;
    __int16 v18 = 2082;
    uint64_t v19 = v12;
    __int16 v20 = 2082;
    id v21 = v13;
    __int16 v22 = 1024;
    int v23 = 508;
    __int16 v24 = 2112;
    id v25 = v3;
    _os_log_impl(&dword_2214B8000, v9, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i XPC error=%@", buf, 0x2Cu);
  }
}

void __31__NFCHardwareManager_didExpire__block_invoke_69(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      uint64_t v5 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 40));
      uint64_t v8 = 45;
      if (isMetaClass) {
        uint64_t v8 = 43;
      }
      v5(3, "%c[%{public}s %{public}s]:%i De-assert error=%@", v8, ClassName, Name, 511, v3);
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
      int v13 = sel_getName(*(SEL *)(a1 + 40));
      *(_DWORD *)buf = 67110146;
      int v17 = v11;
      __int16 v18 = 2082;
      uint64_t v19 = v12;
      __int16 v20 = 2082;
      id v21 = v13;
      __int16 v22 = 1024;
      int v23 = 511;
      __int16 v24 = 2112;
      id v25 = v3;
      _os_log_impl(&dword_2214B8000, v9, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i De-assert error=%@", buf, 0x2Cu);
    }
  }
}

- (void)didFinishCooldown
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    uint64_t v5 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v5(6, "%c[%{public}s %{public}s]:%i ", v9, ClassName, Name, 522);
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
    *(_DWORD *)&uint8_t buf[4] = v12;
    *(_WORD *)id v21 = 2082;
    *(void *)&v21[2] = object_getClassName(self);
    *(_WORD *)&v21[10] = 2082;
    *(void *)&v21[12] = sel_getName(a2);
    *(_WORD *)&v21[20] = 1024;
    *(_DWORD *)&v21[22] = 522;
    _os_log_impl(&dword_2214B8000, v10, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  *(void *)buf = 0;
  *(void *)id v21 = buf;
  *(void *)&v21[8] = 0x3032000000;
  *(void *)&v21[16] = __Block_byref_object_copy__1;
  *(void *)&v21[24] = __Block_byref_object_dispose__1;
  id v22 = 0;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  uint64_t v16 = __39__NFCHardwareManager_didFinishCooldown__block_invoke;
  int v17 = &unk_2645B44B8;
  __int16 v18 = self;
  uint64_t v19 = buf;
  int v13 = v15;
  os_unfair_lock_lock(&self->_presentmentSuppressionLock);
  v16((uint64_t)v13);
  os_unfair_lock_unlock(&self->_presentmentSuppressionLock);

  [(NFCHardwareManager *)self _cleanupPresentmentAssertion];
  [*(id *)(*(void *)v21 + 40) didFinishCooldown];
  _Block_object_dispose(buf, 8);
}

uint64_t __39__NFCHardwareManager_didFinishCooldown__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 56));

  return MEMORY[0x270F9A758]();
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presentmentSuppressionDelegate);
  objc_storeStrong((id *)&self->_presentmentSuppression, 0);
  objc_storeStrong((id *)&self->_hwSupportStateUpdate, 0);
  objc_storeStrong((id *)&self->_queuedCoreNFCSessions, 0);
  objc_storeStrong((id *)&self->_xpcSession, 0);

  objc_storeStrong((id *)&self->_delegates, 0);
}

@end