@interface DAUserAlert
+ (id)accessoryRemovalAlert:(id)a3 appName:(id)a4;
- (BOOL)showOnLockScreen;
- (DAUserAlert)init;
- (NSObject)subTitleParameter;
- (NSString)alternativeButtonTitleKey;
- (NSString)defaultButtonTitleKey;
- (NSString)localizedMessage;
- (NSString)localizedTitle;
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
- (void)setLocalizedMessage:(id)a3;
- (void)setLocalizedTitle:(id)a3;
- (void)setShowOnLockScreen:(BOOL)a3;
- (void)setSubTitleKey:(id)a3;
- (void)setSubTitleParameter:(id)a3;
- (void)setTimeoutSeconds:(double)a3;
- (void)setTitleKey:(id)a3;
- (void)setTitleParameter:(id)a3;
@end

@implementation DAUserAlert

- (DAUserAlert)init
{
  v6.receiver = self;
  v6.super_class = (Class)DAUserAlert;
  v2 = [(DAUserAlert *)&v6 init];
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
    v2 = (DAUserAlert *)FatalErrorF();
    [(DAUserAlert *)v2 activateWithCompletionHandler:v4];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)DAUserAlert;
    [(DAUserAlert *)&v5 dealloc];
  }
}

- (void)activateWithCompletionHandler:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __45__DAUserAlert_activateWithCompletionHandler___block_invoke;
  v7[3] = &unk_264520508;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __45__DAUserAlert_activateWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v9 + 8))
  {
    DAErrorF(350002, (uint64_t)"activate already called", a3, a4, a5, a6, a7, a8, v13);
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    if (gLogCategory_DAUserAlert <= 90 && (gLogCategory_DAUserAlert != -1 || _LogCategory_Initialize()))
    {
      v14 = CUPrintNSError();
      LogPrintF();
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40));
    [*(id *)(a1 + 32) _autoInvalidate];
LABEL_16:

    return;
  }
  if (*(unsigned char *)(v9 + 9))
  {
    DAErrorF(350002, (uint64_t)"activate after invalidate", a3, a4, a5, a6, a7, a8, v13);
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    if (gLogCategory_DAUserAlert <= 90 && (gLogCategory_DAUserAlert != -1 || _LogCategory_Initialize()))
    {
      v15 = CUPrintNSError();
      LogPrintF();
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40));
    goto LABEL_16;
  }
  if (gLogCategory_DAUserAlert <= 30)
  {
    if (gLogCategory_DAUserAlert != -1 || (v10 = _LogCategory_Initialize(), uint64_t v9 = *(void *)(a1 + 32), v10))
    {
      LogPrintF();
      uint64_t v9 = *(void *)(a1 + 32);
    }
  }
  *(unsigned char *)(v9 + 8) = 1;
  v11 = *(void **)(a1 + 32);
  uint64_t v12 = *(void *)(a1 + 40);

  [v11 _activateWithCompletionHandler:v12];
}

- (void)_activateWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v62 = 0;
  v63 = &v62;
  uint64_t v64 = 0x3032000000;
  v65 = __Block_byref_object_copy__2;
  v66 = __Block_byref_object_dispose__2;
  id v67 = 0;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __46__DAUserAlert__activateWithCompletionHandler___block_invoke;
  aBlock[3] = &unk_264520530;
  v61 = &v62;
  id v5 = v4;
  aBlock[4] = self;
  id v60 = v5;
  id v6 = (void (**)(void))_Block_copy(aBlock);
  id v7 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v8 = self->_titleKey;
  uint64_t v9 = (uint64_t *)MEMORY[0x263EFFFC8];
  if (v8)
  {
    int v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v11 = [v10 localizedStringForKey:v8 value:&stru_26D120818 table:0];

    uint64_t v12 = self->_titleParameter;
    if (v12)
    {
      uint64_t v57 = (uint64_t)v12;
      uint64_t v13 = [[NSString alloc] initWithFormat:v11];

      v11 = (void *)v13;
    }
    uint64_t v14 = *v9;

    [v7 setObject:v11 forKeyedSubscript:v14];
  }

  v15 = self->_localizedTitle;
  if (v15) {
    [v7 setObject:v15 forKeyedSubscript:*v9];
  }

  id v16 = self->_subTitleKey;
  v17 = (uint64_t *)MEMORY[0x263EFFFD8];
  if (v16)
  {
    v18 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v19 = [v18 localizedStringForKey:v16 value:&stru_26D120818 table:0];

    v20 = self->_subTitleParameter;
    if (v20)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v21 = [NSString alloc];
        uint64_t v57 = [v20 unsignedIntValue];
        uint64_t v22 = [v21 initWithFormat:v19];
      }
      else
      {
        uint64_t v57 = (uint64_t)v20;
        uint64_t v22 = [[NSString alloc] initWithFormat:v19];
      }
      v23 = (void *)v22;

      v19 = v23;
    }
    uint64_t v24 = *v17;

    [v7 setObject:v19 forKeyedSubscript:v24];
  }

  v25 = self->_localizedMessage;
  if (v25) {
    [v7 setObject:v25 forKeyedSubscript:*v17];
  }

  v26 = self->_defaultButtonTitleKey;
  if (v26)
  {
    v27 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v28 = CULocalizedStringEx();
    uint64_t v29 = *MEMORY[0x263F00000];

    [v7 setObject:v28 forKeyedSubscript:v29];
  }

  v30 = self->_alternativeButtonTitleKey;
  if (v30)
  {
    v31 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v32 = CULocalizedStringEx();
    uint64_t v33 = *MEMORY[0x263EFFFE8];

    [v7 setObject:v32 forKeyedSubscript:v33];
  }

  if (self->_showOnLockScreen)
  {
    [v7 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263EFFFE0]];
    [v7 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F79620]];
    [v7 setObject:MEMORY[0x263EFFA80] forKeyedSubscript:*MEMORY[0x263F79608]];
    [v7 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F795C8]];
  }
  SInt32 error = 0;
  v34 = CFUserNotificationCreate(0, self->_timeoutSeconds, 2uLL, &error, (CFDictionaryRef)v7);
  v41 = v34;
  if (!v34)
  {
    uint64_t v55 = DAErrorF(350004, (uint64_t)"Create alert failed (%d)", v35, v36, v37, v38, v39, v40, error);
LABEL_30:
    v56 = (void *)v63[5];
    v63[5] = v55;

    goto LABEL_27;
  }
  self->_userNotification = v34;
  pthread_mutex_lock(&gDAUserAlertMutex);
  v42 = (void *)gDAUserAlertMap;
  if (!gDAUserAlertMap)
  {
    id v43 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    v44 = (void *)gDAUserAlertMap;
    gDAUserAlertMap = (uint64_t)v43;

    v42 = (void *)gDAUserAlertMap;
  }
  v45 = [NSNumber numberWithLong:v41];
  [v42 setObject:self forKeyedSubscript:v45];

  pthread_mutex_unlock(&gDAUserAlertMutex);
  RunLoopSource = CFUserNotificationCreateRunLoopSource(0, v41, (CFUserNotificationCallBack)_responseCallback, 0);
  v53 = RunLoopSource;
  if (!RunLoopSource)
  {
    uint64_t v55 = DAErrorF(350004, (uint64_t)"Create alert RLS failed", v47, v48, v49, v50, v51, v52, v57);
    goto LABEL_30;
  }
  self->_userRLS = RunLoopSource;
  Main = CFRunLoopGetMain();
  CFRunLoopAddSource(Main, v53, (CFRunLoopMode)*MEMORY[0x263EFFE88]);
  (*((void (**)(id, void))v5 + 2))(v5, 0);
LABEL_27:

  v6[2](v6);
  _Block_object_dispose(&v62, 8);
}

uint64_t __46__DAUserAlert__activateWithCompletionHandler___block_invoke(void *a1)
{
  uint64_t result = *(void *)(*(void *)(a1[6] + 8) + 40);
  if (result)
  {
    if (gLogCategory_DAUserAlert <= 90 && (gLogCategory_DAUserAlert != -1 || _LogCategory_Initialize()))
    {
      id v4 = CUPrintNSError();
      LogPrintF();
    }
    (*(void (**)(void))(a1[5] + 16))(a1[5]);
    SEL v3 = (void *)a1[4];
    return [v3 _autoInvalidate];
  }
  return result;
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __25__DAUserAlert_invalidate__block_invoke;
  block[3] = &unk_264520440;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __25__DAUserAlert_invalidate__block_invoke(uint64_t result)
{
  uint64_t v1 = result;
  if (gLogCategory_DAUserAlert <= 30)
  {
    if (gLogCategory_DAUserAlert != -1 || (uint64_t result = _LogCategory_Initialize(), result)) {
      uint64_t result = LogPrintF();
    }
  }
  uint64_t v2 = *(void *)(v1 + 32);
  if (!*(unsigned char *)(v2 + 9))
  {
    *(unsigned char *)(v2 + 9) = 1;
    SEL v3 = *(void **)(v1 + 32);
    return [v3 _autoInvalidate];
  }
  return result;
}

- (void)_autoInvalidate
{
  if (!self->_invalidateCalled
    && gLogCategory_DAUserAlert <= 30
    && (gLogCategory_DAUserAlert != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
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
    pthread_mutex_lock(&gDAUserAlertMutex);
    id v7 = (void *)gDAUserAlertMap;
    id v8 = [NSNumber numberWithLong:userNotification];
    [v7 setObject:0 forKeyedSubscript:v8];

    pthread_mutex_unlock(&gDAUserAlertMutex);
    if (!self->_dismissed) {
      CFUserNotificationCancel(userNotification);
    }
    CFRelease(userNotification);
    self->_userNotification = 0;
  }

  [(DAUserAlert *)self _invalidated];
}

- (void)_invalidated
{
  if (self->_invalidateCalled && !self->_invalidateDone && !self->_userNotification)
  {
    id v6 = (void (**)(id, uint64_t))_Block_copy(self->_actionHandler);
    id actionHandler = self->_actionHandler;
    self->_id actionHandler = 0;

    if (v6) {
      v6[2](v6, 15);
    }
    CFStringRef v4 = (void (**)(void))_Block_copy(self->_invalidationHandler);
    id invalidationHandler = self->_invalidationHandler;
    self->_id invalidationHandler = 0;

    if (v4) {
      v4[2](v4);
    }
    self->_invalidateDone = 1;
    if (gLogCategory_DAUserAlert <= 30 && (gLogCategory_DAUserAlert != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
}

- (void)_responseCallback:(__CFUserNotification *)a3 responseFlags:(unint64_t)a4
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__DAUserAlert__responseCallback_responseFlags___block_invoke;
  block[3] = &unk_264520558;
  block[4] = self;
  void block[5] = a3;
  block[6] = a4;
  dispatch_async(dispatchQueue, block);
}

void __47__DAUserAlert__responseCallback_responseFlags___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 40) == *(void *)(*(void *)(a1 + 32) + 16))
  {
    if (gLogCategory_DAUserAlert <= 30 && (gLogCategory_DAUserAlert != -1 || _LogCategory_Initialize()))
    {
      uint64_t v6 = *(void *)(a1 + 48);
      LogPrintF();
    }
    *(unsigned char *)(*(void *)(a1 + 32) + 11) = 1;
    uint64_t v2 = *(void *)(a1 + 48);
    id v7 = (void (**)(id, uint64_t))_Block_copy(*(const void **)(*(void *)(a1 + 32) + 112));
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

+ (id)accessoryRemovalAlert:(id)a3 appName:(id)a4
{
  uint64_t v5 = (void *)MEMORY[0x263F086E0];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 bundleForClass:objc_opt_class()];
  uint64_t v9 = CULocalizedStringEx();

  int v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v11 = CULocalizedStringEx();

  uint64_t v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v13 = CULocalizedStringEx();

  GestaltGetDeviceClass();
  uint64_t v14 = CUGestaltDeviceClassToString();
  v15 = (void *)v14;
  if (v14) {
    id v16 = (void *)v14;
  }
  else {
    id v16 = v13;
  }
  id v17 = v16;

  v18 = objc_alloc_init(DAUserAlert);
  v19 = objc_msgSend(NSString, "stringWithFormat:", v9, v7);
  [(DAUserAlert *)v18 setLocalizedTitle:v19];

  v20 = objc_msgSend(NSString, "stringWithFormat:", v11, v7, v6, v17);

  [(DAUserAlert *)v18 setLocalizedMessage:v20];
  [(DAUserAlert *)v18 setDefaultButtonTitleKey:@"DeviceRemoveAlertPrimaryKey"];
  [(DAUserAlert *)v18 setAlternativeButtonTitleKey:@"DeviceRemoveAlertSecondaryKey"];

  return v18;
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

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (void)setLocalizedTitle:(id)a3
{
}

- (NSString)localizedMessage
{
  return self->_localizedMessage;
}

- (void)setLocalizedMessage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedMessage, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
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