@interface ENUserAlert
- (BOOL)showOnLockScreen;
- (ENUserAlert)init;
- (NSObject)subTitleParameter;
- (NSString)alternativeButtonTitleKey;
- (NSString)defaultButtonTitleKey;
- (NSString)subTitleKey;
- (NSString)titleKey;
- (NSString)titleParameter;
- (OS_dispatch_queue)dispatchQueue;
- (double)timeoutSeconds;
- (id)actionHandler;
- (id)invalidationHandler;
- (void)_activateWithCompletionHandler:(id)a3;
- (void)_autoInvalidate;
- (void)_invalidated;
- (void)_responseCallback:(__CFUserNotification *)a3 responseFlags:(unint64_t)a4;
- (void)activateWithCompletionHandler:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)setActionHandler:(id)a3;
- (void)setAlternativeButtonTitleKey:(id)a3;
- (void)setDefaultButtonTitleKey:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setShowOnLockScreen:(BOOL)a3;
- (void)setSubTitleKey:(id)a3;
- (void)setSubTitleParameter:(id)a3;
- (void)setTimeoutSeconds:(double)a3;
- (void)setTitleKey:(id)a3;
- (void)setTitleParameter:(id)a3;
@end

@implementation ENUserAlert

- (ENUserAlert)init
{
  v6.receiver = self;
  v6.super_class = (Class)ENUserAlert;
  v2 = [(ENUserAlert *)&v6 init];
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x263EF83A0]);
    v4 = v3;
  }

  return v3;
}

- (void)dealloc
{
  if (self->_activateCalled && !self->_invalidateDone)
  {
    v2 = (ENUserAlert *)FatalErrorF();
    [(ENUserAlert *)v2 activateWithCompletionHandler:v4];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)ENUserAlert;
    [(ENUserAlert *)&v5 dealloc];
  }
}

- (void)activateWithCompletionHandler:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __45__ENUserAlert_activateWithCompletionHandler___block_invoke;
  v7[3] = &unk_264244688;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __45__ENUserAlert_activateWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 8))
  {
    ENErrorF(10);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    if (gLogCategory__ENUserAlert <= 90 && (gLogCategory__ENUserAlert != -1 || _LogCategory_Initialize()))
    {
      id v6 = CUPrintNSError();
      LogPrintF_safe();
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40));
    [*(id *)(a1 + 32) _autoInvalidate];
LABEL_16:

    return;
  }
  if (*(unsigned char *)(v2 + 9))
  {
    ENErrorF(10);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    if (gLogCategory__ENUserAlert <= 90 && (gLogCategory__ENUserAlert != -1 || _LogCategory_Initialize()))
    {
      v7 = CUPrintNSError();
      LogPrintF_safe();
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40));
    goto LABEL_16;
  }
  if (gLogCategory_ENUserAlert <= 30)
  {
    if (gLogCategory_ENUserAlert != -1 || (int v3 = _LogCategory_Initialize(), v2 = *(void *)(a1 + 32), v3))
    {
      LogPrintF_safe();
      uint64_t v2 = *(void *)(a1 + 32);
    }
  }
  *(unsigned char *)(v2 + 8) = 1;
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);

  [v4 _activateWithCompletionHandler:v5];
}

- (void)_activateWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__4;
  v46 = __Block_byref_object_dispose__4;
  id v47 = 0;
  v39[0] = MEMORY[0x263EF8330];
  v39[1] = 3221225472;
  v39[2] = __46__ENUserAlert__activateWithCompletionHandler___block_invoke;
  v39[3] = &unk_264244EE0;
  v41 = &v42;
  id v5 = v4;
  v39[4] = self;
  id v40 = v5;
  id v6 = (void (**)(void))MEMORY[0x2166BC8A0](v39);
  id v7 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v8 = self->_titleKey;
  v9 = v8;
  if (v8)
  {
    v10 = ENLocalizedString(v8);
    v11 = self->_titleParameter;
    if (v11)
    {
      uint64_t v12 = objc_msgSend([NSString alloc], "initWithFormat:", v10, v11);

      v10 = (void *)v12;
    }
    uint64_t v13 = *MEMORY[0x263EFFFC8];

    [v7 setObject:v10 forKeyedSubscript:v13];
  }

  v14 = self->_subTitleKey;
  v15 = v14;
  if (v14)
  {
    v16 = ENLocalizedString(v14);
    v17 = self->_subTitleParameter;
    if (v17)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v18 = objc_msgSend([NSString alloc], "initWithFormat:", v16, -[NSObject unsignedIntValue](v17, "unsignedIntValue"));
      }
      else {
        uint64_t v18 = objc_msgSend([NSString alloc], "initWithFormat:", v16, v17);
      }
      v19 = (void *)v18;

      v16 = v19;
    }
    uint64_t v20 = *MEMORY[0x263EFFFD8];

    [v7 setObject:v16 forKeyedSubscript:v20];
  }

  v21 = self->_defaultButtonTitleKey;
  v22 = v21;
  if (v21)
  {
    v23 = ENLocalizedString(v21);
    [v7 setObject:v23 forKeyedSubscript:*MEMORY[0x263F00000]];
  }
  v24 = self->_alternativeButtonTitleKey;
  v25 = v24;
  if (v24)
  {
    v26 = ENLocalizedString(v24);
    [v7 setObject:v26 forKeyedSubscript:*MEMORY[0x263EFFFE8]];
  }
  if (self->_showOnLockScreen)
  {
    [v7 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263EFFFE0]];
    [v7 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F79620]];
    [v7 setObject:MEMORY[0x263EFFA80] forKeyedSubscript:*MEMORY[0x263F79608]];
    [v7 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F795C8]];
  }
  SInt32 error = 0;
  v27 = CFUserNotificationCreate(0, self->_timeoutSeconds, 2uLL, &error, (CFDictionaryRef)v7);
  v28 = v27;
  if (!v27) {
    goto LABEL_24;
  }
  self->_userNotification = v27;
  pthread_mutex_lock(&gENUserAlertMutex);
  v29 = (void *)gENUserAlertMap;
  if (!gENUserAlertMap)
  {
    id v30 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    v31 = (void *)gENUserAlertMap;
    gENUserAlertMap = (uint64_t)v30;

    v29 = (void *)gENUserAlertMap;
  }
  v32 = [NSNumber numberWithLong:v28];
  [v29 setObject:self forKeyedSubscript:v32];

  pthread_mutex_unlock(&gENUserAlertMutex);
  RunLoopSource = CFUserNotificationCreateRunLoopSource(0, v28, (CFUserNotificationCallBack)_responseCallback, 0);
  v34 = RunLoopSource;
  if (RunLoopSource)
  {
    self->_userRLS = RunLoopSource;
    Main = CFRunLoopGetMain();
    CFRunLoopAddSource(Main, v34, (CFRunLoopMode)*MEMORY[0x263EFFE88]);
    (*((void (**)(id, void))v5 + 2))(v5, 0);
  }
  else
  {
LABEL_24:
    uint64_t v36 = ENErrorF(11);
    v37 = (void *)v43[5];
    v43[5] = v36;
  }
  v6[2](v6);

  _Block_object_dispose(&v42, 8);
}

uint64_t __46__ENUserAlert__activateWithCompletionHandler___block_invoke(void *a1)
{
  uint64_t result = *(void *)(*(void *)(a1[6] + 8) + 40);
  if (result)
  {
    if (gLogCategory__ENUserAlert <= 90 && (gLogCategory__ENUserAlert != -1 || _LogCategory_Initialize()))
    {
      id v4 = CUPrintNSError();
      LogPrintF_safe();
    }
    (*(void (**)(void))(a1[5] + 16))(a1[5]);
    int v3 = (void *)a1[4];
    return [v3 _autoInvalidate];
  }
  return result;
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __25__ENUserAlert_invalidate__block_invoke;
  block[3] = &unk_2642446B0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __25__ENUserAlert_invalidate__block_invoke(uint64_t result)
{
  uint64_t v1 = result;
  if (gLogCategory_ENUserAlert <= 30)
  {
    if (gLogCategory_ENUserAlert != -1 || (uint64_t result = _LogCategory_Initialize(), result)) {
      uint64_t result = LogPrintF_safe();
    }
  }
  uint64_t v2 = *(void *)(v1 + 32);
  if (!*(unsigned char *)(v2 + 9))
  {
    *(unsigned char *)(v2 + 9) = 1;
    int v3 = *(void **)(v1 + 32);
    return [v3 _autoInvalidate];
  }
  return result;
}

- (void)_autoInvalidate
{
  if (!self->_invalidateCalled
    && gLogCategory_ENUserAlert <= 30
    && (gLogCategory_ENUserAlert != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
  self->_invalidateCalled = 1;
  userRLS = self->_userRLS;
  if (userRLS)
  {
    CFStringRef v4 = (const __CFString *)*MEMORY[0x263EFFE88];
    Main = CFRunLoopGetMain();
    CFRunLoopRemoveSource(Main, userRLS, v4);
    CFRelease(userRLS);
    self->_userRLS = 0;
  }
  userNotification = self->_userNotification;
  if (userNotification)
  {
    pthread_mutex_lock(&gENUserAlertMutex);
    id v7 = (void *)gENUserAlertMap;
    id v8 = [NSNumber numberWithLong:userNotification];
    [v7 setObject:0 forKeyedSubscript:v8];

    pthread_mutex_unlock(&gENUserAlertMutex);
    if (!self->_dismissed) {
      CFUserNotificationCancel(userNotification);
    }
    CFRelease(userNotification);
    self->_userNotification = 0;
  }

  [(ENUserAlert *)self _invalidated];
}

- (void)_invalidated
{
  if (self->_invalidateCalled && !self->_invalidateDone && !self->_userNotification)
  {
    id v6 = (void (**)(id, uint64_t))MEMORY[0x2166BC8A0](self->_actionHandler, a2);
    id actionHandler = self->_actionHandler;
    self->_id actionHandler = 0;

    if (v6) {
      v6[2](v6, 11);
    }
    CFStringRef v4 = (void (**)(void))MEMORY[0x2166BC8A0](self->_invalidationHandler);
    id invalidationHandler = self->_invalidationHandler;
    self->_id invalidationHandler = 0;

    if (v4) {
      v4[2](v4);
    }
    self->_invalidateDone = 1;
    if (gLogCategory_ENUserAlert <= 30 && (gLogCategory_ENUserAlert != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
  }
}

- (void)_responseCallback:(__CFUserNotification *)a3 responseFlags:(unint64_t)a4
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__ENUserAlert__responseCallback_responseFlags___block_invoke;
  block[3] = &unk_264245300;
  block[4] = self;
  void block[5] = a3;
  block[6] = a4;
  dispatch_async(dispatchQueue, block);
}

void __47__ENUserAlert__responseCallback_responseFlags___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 40) == *(void *)(*(void *)(a1 + 32) + 16))
  {
    if (gLogCategory_ENUserAlert <= 30 && (gLogCategory_ENUserAlert != -1 || _LogCategory_Initialize()))
    {
      uint64_t v6 = *(void *)(a1 + 48);
      LogPrintF_safe();
    }
    *(unsigned char *)(*(void *)(a1 + 32) + 11) = 1;
    uint64_t v2 = *(void *)(a1 + 48);
    id v7 = (void (**)(id, uint64_t))MEMORY[0x2166BC8A0](*(void *)(*(void *)(a1 + 32) + 112));
    uint64_t v3 = *(void *)(a1 + 32);
    CFStringRef v4 = *(void **)(v3 + 112);
    *(void *)(v3 + 112) = 0;

    if (v7)
    {
      if ((v2 & 3) == 3) {
        uint64_t v5 = 10;
      }
      else {
        uint64_t v5 = (v2 & 3) + 1;
      }
      v7[2](v7, v5);
    }
    objc_msgSend(*(id *)(a1 + 32), "_autoInvalidate", v6);
  }
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (NSString)titleKey
{
  return self->_titleKey;
}

- (void)setTitleKey:(id)a3
{
}

- (NSString)titleParameter
{
  return self->_titleParameter;
}

- (void)setTitleParameter:(id)a3
{
}

- (NSString)subTitleKey
{
  return self->_subTitleKey;
}

- (void)setSubTitleKey:(id)a3
{
}

- (NSObject)subTitleParameter
{
  return self->_subTitleParameter;
}

- (void)setSubTitleParameter:(id)a3
{
}

- (NSString)defaultButtonTitleKey
{
  return self->_defaultButtonTitleKey;
}

- (void)setDefaultButtonTitleKey:(id)a3
{
}

- (NSString)alternativeButtonTitleKey
{
  return self->_alternativeButtonTitleKey;
}

- (void)setAlternativeButtonTitleKey:(id)a3
{
}

- (BOOL)showOnLockScreen
{
  return self->_showOnLockScreen;
}

- (void)setShowOnLockScreen:(BOOL)a3
{
  self->_showOnLockScreen = a3;
}

- (double)timeoutSeconds
{
  return self->_timeoutSeconds;
}

- (void)setTimeoutSeconds:(double)a3
{
  self->_timeoutSeconds = a3;
}

- (id)actionHandler
{
  return self->_actionHandler;
}

- (void)setActionHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_actionHandler, 0);
  objc_storeStrong((id *)&self->_alternativeButtonTitleKey, 0);
  objc_storeStrong((id *)&self->_defaultButtonTitleKey, 0);
  objc_storeStrong((id *)&self->_subTitleParameter, 0);
  objc_storeStrong((id *)&self->_subTitleKey, 0);
  objc_storeStrong((id *)&self->_titleParameter, 0);
  objc_storeStrong((id *)&self->_titleKey, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);

  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end