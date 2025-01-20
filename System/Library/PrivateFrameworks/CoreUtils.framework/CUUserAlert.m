@interface CUUserAlert
- (CUUserAlert)init;
- (NSBundle)localizationBundle;
- (NSString)alternativeButtonTitleKey;
- (NSString)defaultButtonTitleKey;
- (NSString)localizationTableName;
- (NSString)subtitleKey;
- (NSString)subtitleParameter;
- (NSString)titleKey;
- (NSString)titleParameter;
- (OS_dispatch_queue)dispatchQueue;
- (double)timeoutSeconds;
- (id)actionHandler;
- (id)invalidationHandler;
- (void)_activateWithCompletion:(id)a3;
- (void)_autoInvalidate;
- (void)_invalidated;
- (void)_responseCallback:(__CFUserNotification *)a3 responseFlags:(unint64_t)a4;
- (void)activateWithCompletion:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)setActionHandler:(id)a3;
- (void)setAlternativeButtonTitleKey:(id)a3;
- (void)setDefaultButtonTitleKey:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setLocalizationBundle:(id)a3;
- (void)setLocalizationTableName:(id)a3;
- (void)setSubtitleKey:(id)a3;
- (void)setSubtitleParameter:(id)a3;
- (void)setTimeoutSeconds:(double)a3;
- (void)setTitleKey:(id)a3;
- (void)setTitleParameter:(id)a3;
@end

@implementation CUUserAlert

- (void).cxx_destruct
{
  objc_storeStrong(&self->_actionHandler, 0);
  objc_storeStrong((id *)&self->_alternativeButtonTitleKey, 0);
  objc_storeStrong((id *)&self->_defaultButtonTitleKey, 0);
  objc_storeStrong((id *)&self->_subtitleParameter, 0);
  objc_storeStrong((id *)&self->_subtitleKey, 0);
  objc_storeStrong((id *)&self->_titleParameter, 0);
  objc_storeStrong((id *)&self->_titleKey, 0);
  objc_storeStrong((id *)&self->_localizationTableName, 0);
  objc_storeStrong((id *)&self->_localizationBundle, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

- (void)setActionHandler:(id)a3
{
}

- (id)actionHandler
{
  return self->_actionHandler;
}

- (void)setTimeoutSeconds:(double)a3
{
  self->_timeoutSeconds = a3;
}

- (double)timeoutSeconds
{
  return self->_timeoutSeconds;
}

- (void)setAlternativeButtonTitleKey:(id)a3
{
}

- (NSString)alternativeButtonTitleKey
{
  return self->_alternativeButtonTitleKey;
}

- (void)setDefaultButtonTitleKey:(id)a3
{
}

- (NSString)defaultButtonTitleKey
{
  return self->_defaultButtonTitleKey;
}

- (void)setSubtitleParameter:(id)a3
{
}

- (NSString)subtitleParameter
{
  return self->_subtitleParameter;
}

- (void)setSubtitleKey:(id)a3
{
}

- (NSString)subtitleKey
{
  return self->_subtitleKey;
}

- (void)setTitleParameter:(id)a3
{
}

- (NSString)titleParameter
{
  return self->_titleParameter;
}

- (void)setTitleKey:(id)a3
{
}

- (NSString)titleKey
{
  return self->_titleKey;
}

- (void)setLocalizationTableName:(id)a3
{
}

- (NSString)localizationTableName
{
  return self->_localizationTableName;
}

- (void)setLocalizationBundle:(id)a3
{
}

- (NSBundle)localizationBundle
{
  return self->_localizationBundle;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setDispatchQueue:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)_responseCallback:(__CFUserNotification *)a3 responseFlags:(unint64_t)a4
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__CUUserAlert__responseCallback_responseFlags___block_invoke;
  block[3] = &unk_1E55BEDB0;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_async(dispatchQueue, block);
}

void __47__CUUserAlert__responseCallback_responseFlags___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(void *)(a1 + 40) == *(void *)(*(void *)(a1 + 32) + 16))
  {
    if (gLogCategory_CUUserAlert <= 30
      && (gLogCategory_CUUserAlert != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUUserAlert, 0x1Eu)))
    {
      LogPrintF_safe((uint64_t)&gLogCategory_CUUserAlert, (uint64_t)"-[CUUserAlert _responseCallback:responseFlags:]_block_invoke", 0x1Eu, (uint64_t)"User alert response: Flags 0x%lX", a5, a6, a7, a8, *(void *)(a1 + 48));
    }
    *(unsigned char *)(*(void *)(a1 + 32) + 11) = 1;
    uint64_t v9 = *(void *)(a1 + 48);
    v13 = (void (**)(id, uint64_t))_Block_copy(*(const void **)(*(void *)(a1 + 32) + 120));
    uint64_t v10 = *(void *)(a1 + 32);
    v11 = *(void **)(v10 + 120);
    *(void *)(v10 + 120) = 0;

    if (v13)
    {
      if ((v9 & 3) == 3) {
        uint64_t v12 = 10;
      }
      else {
        uint64_t v12 = (v9 & 3) + 1;
      }
      v13[2](v13, v12);
    }
    [*(id *)(a1 + 32) _autoInvalidate];
  }
}

- (void)_invalidated
{
  if (self->_invalidateCalled && !self->_invalidateDone && !self->_userNotification)
  {
    v11 = (void (**)(id, uint64_t))_Block_copy(self->_actionHandler);
    id actionHandler = self->_actionHandler;
    self->_id actionHandler = 0;

    if (v11) {
      v11[2](v11, -71148);
    }
    v4 = (void (**)(void))_Block_copy(self->_invalidationHandler);
    id invalidationHandler = self->_invalidationHandler;
    self->_id invalidationHandler = 0;

    if (v4) {
      v4[2](v4);
    }
    self->_invalidateDone = 1;
    if (gLogCategory_CUUserAlert <= 30
      && (gLogCategory_CUUserAlert != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUUserAlert, 0x1Eu)))
    {
      LogPrintF_safe((uint64_t)&gLogCategory_CUUserAlert, (uint64_t)"-[CUUserAlert _invalidated]", 0x1Eu, (uint64_t)"Invalidated", v6, v7, v8, v9, v10);
    }
  }
}

- (void)_autoInvalidate
{
  if (!self->_invalidateCalled
    && gLogCategory_CUUserAlert <= 30
    && (gLogCategory_CUUserAlert != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUUserAlert, 0x1Eu)))
  {
    LogPrintF_safe((uint64_t)&gLogCategory_CUUserAlert, (uint64_t)"-[CUUserAlert _autoInvalidate]", 0x1Eu, (uint64_t)"Auto-invalidate", v2, v3, v4, v5, v13);
  }
  self->_invalidateCalled = 1;
  userRLS = self->_userRLS;
  if (userRLS)
  {
    CFStringRef v8 = (const __CFString *)*MEMORY[0x1E4F1D418];
    Main = CFRunLoopGetMain();
    CFRunLoopRemoveSource(Main, userRLS, v8);
    CFRelease(userRLS);
    self->_userRLS = 0;
  }
  userNotification = self->_userNotification;
  if (userNotification)
  {
    pthread_mutex_lock(&gCUUserAlertMutex);
    v11 = (void *)gCUUserAlertMap;
    uint64_t v12 = [NSNumber numberWithLong:userNotification];
    [v11 setObject:0 forKeyedSubscript:v12];

    pthread_mutex_unlock(&gCUUserAlertMutex);
    if (!self->_dismissed) {
      CFUserNotificationCancel(userNotification);
    }
    CFRelease(userNotification);
    self->_userNotification = 0;
  }
  [(CUUserAlert *)self _invalidated];
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __25__CUUserAlert_invalidate__block_invoke;
  block[3] = &unk_1E55BFC18;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __25__CUUserAlert_invalidate__block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = result;
  if (gLogCategory_CUUserAlert <= 30)
  {
    if (gLogCategory_CUUserAlert != -1
      || (result = _LogCategory_Initialize((uint64_t)&gLogCategory_CUUserAlert, 0x1Eu), result))
    {
      result = LogPrintF_safe((uint64_t)&gLogCategory_CUUserAlert, (uint64_t)"-[CUUserAlert invalidate]_block_invoke", 0x1Eu, (uint64_t)"Invalidate", a5, a6, a7, a8, v11);
    }
  }
  uint64_t v9 = *(void *)(v8 + 32);
  if (!*(unsigned char *)(v9 + 9))
  {
    *(unsigned char *)(v9 + 9) = 1;
    uint64_t v10 = *(void **)(v8 + 32);
    return [v10 _autoInvalidate];
  }
  return result;
}

- (void)_activateWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v58 = 0;
  v59 = &v58;
  uint64_t v60 = 0x3032000000;
  v61 = __Block_byref_object_copy__8988;
  v62 = __Block_byref_object_dispose__8989;
  id v63 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __39__CUUserAlert__activateWithCompletion___block_invoke;
  aBlock[3] = &unk_1E55BED88;
  v57 = &v58;
  id v5 = v4;
  aBlock[4] = self;
  id v56 = v5;
  uint64_t v6 = (void (**)(void))_Block_copy(aBlock);
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v8 = self->_titleKey;
  if (v8)
  {
    localizationBundle = self->_localizationBundle;
    uint64_t v10 = localizationBundle;
    if (!localizationBundle)
    {
      uint64_t v10 = [MEMORY[0x1E4F28B50] mainBundle];
    }
    uint64_t v11 = CULocalizedStringEx(v10, self->_localizationTableName, v8);
    if (!localizationBundle) {

    }
    uint64_t v12 = self->_titleParameter;
    if (v12)
    {
      uint64_t v53 = (uint64_t)v12;
      uint64_t v13 = [[NSString alloc] initWithFormat:v11];

      uint64_t v11 = (void *)v13;
    }
    uint64_t v14 = *MEMORY[0x1E4F1D990];

    [v7 setObject:v11 forKeyedSubscript:v14];
  }

  v15 = self->_subtitleKey;
  if (v15)
  {
    v16 = self->_localizationBundle;
    v17 = v16;
    if (!v16)
    {
      v17 = [MEMORY[0x1E4F28B50] mainBundle];
    }
    v18 = CULocalizedStringEx(v17, self->_localizationTableName, v15);
    if (!v16) {

    }
    v19 = self->_subtitleParameter;
    if (v19)
    {
      uint64_t v53 = (uint64_t)v19;
      uint64_t v20 = [[NSString alloc] initWithFormat:v18];

      v18 = (void *)v20;
    }
    uint64_t v21 = *MEMORY[0x1E4F1D9A8];

    [v7 setObject:v18 forKeyedSubscript:v21];
  }

  v22 = self->_defaultButtonTitleKey;
  if (v22)
  {
    v23 = self->_localizationBundle;
    v24 = v23;
    if (!v23)
    {
      v24 = [MEMORY[0x1E4F28B50] mainBundle];
    }
    v25 = CULocalizedStringEx(v24, self->_localizationTableName, v22);
    uint64_t v26 = *MEMORY[0x1E4F1D9E0];
    if (!v23) {

    }
    [v7 setObject:v25 forKeyedSubscript:v26];
  }

  v27 = self->_alternativeButtonTitleKey;
  if (v27)
  {
    v28 = self->_localizationBundle;
    v29 = v28;
    if (!v28)
    {
      v29 = [MEMORY[0x1E4F28B50] mainBundle];
    }
    v30 = CULocalizedStringEx(v29, self->_localizationTableName, v27);
    uint64_t v31 = *MEMORY[0x1E4F1D9D0];
    if (!v28) {

    }
    [v7 setObject:v30 forKeyedSubscript:v31];
  }

  SInt32 error = 0;
  v32 = CFUserNotificationCreate(0, self->_timeoutSeconds, 2uLL, &error, (CFDictionaryRef)v7);
  v38 = v32;
  if (!v32)
  {
    uint64_t v51 = NSErrorF_safe((void *)*MEMORY[0x1E4F28760], 4294960596, (uint64_t)"Create alert failed (%d)", v33, v34, v35, v36, v37, error);
LABEL_37:
    v52 = (void *)v59[5];
    v59[5] = v51;

    goto LABEL_34;
  }
  self->_userNotification = v32;
  pthread_mutex_lock(&gCUUserAlertMutex);
  v39 = (void *)gCUUserAlertMap;
  if (!gCUUserAlertMap)
  {
    id v40 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v41 = (void *)gCUUserAlertMap;
    gCUUserAlertMap = (uint64_t)v40;

    v39 = (void *)gCUUserAlertMap;
  }
  v42 = [NSNumber numberWithLong:v38];
  [v39 setObject:self forKeyedSubscript:v42];

  pthread_mutex_unlock(&gCUUserAlertMutex);
  RunLoopSource = CFUserNotificationCreateRunLoopSource(0, v38, (CFUserNotificationCallBack)_responseCallback, 0);
  v49 = RunLoopSource;
  if (!RunLoopSource)
  {
    uint64_t v51 = NSErrorF_safe((void *)*MEMORY[0x1E4F28760], 4294960596, (uint64_t)"Create alert RLS failed", v44, v45, v46, v47, v48, v53);
    goto LABEL_37;
  }
  self->_userRLS = RunLoopSource;
  Main = CFRunLoopGetMain();
  CFRunLoopAddSource(Main, v49, (CFRunLoopMode)*MEMORY[0x1E4F1D418]);
  (*((void (**)(id, void))v5 + 2))(v5, 0);
LABEL_34:

  v6[2](v6);
  _Block_object_dispose(&v58, 8);
}

uint64_t __39__CUUserAlert__activateWithCompletion___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *(void *)(*(void *)(*(void *)(result + 48) + 8) + 40);
  if (!v8) {
    return result;
  }
  uint64_t v9 = (void *)result;
  if (gLogCategory_CUUserAlert <= 90)
  {
    if (gLogCategory_CUUserAlert == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)&gLogCategory_CUUserAlert, 0x5Au)) {
        goto LABEL_7;
      }
      uint64_t v8 = *(void *)(*(void *)(v9[6] + 8) + 40);
    }
    uint64_t v10 = NSPrintF((uint64_t)"%{error}", a2, a3, a4, a5, a6, a7, a8, v8);
    LogPrintF_safe((uint64_t)&gLogCategory_CUUserAlert, (uint64_t)"-[CUUserAlert _activateWithCompletion:]_block_invoke", 0x5Au, (uint64_t)"### Activate failed: %@", v11, v12, v13, v14, (uint64_t)v10);
  }
LABEL_7:
  (*(void (**)(void))(v9[5] + 16))();
  v15 = (void *)v9[4];
  return [v15 _autoInvalidate];
}

- (void)activateWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__CUUserAlert_activateWithCompletion___block_invoke;
  v7[3] = &unk_1E55BF148;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __38__CUUserAlert_activateWithCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v9 + 8))
  {
    uint64_t v10 = NSErrorF_safe((void *)*MEMORY[0x1E4F28760], 4294960575, (uint64_t)"activate already called", a4, a5, a6, a7, a8, v39);
    id v40 = (id)v10;
    if (gLogCategory_CUUserAlert <= 90)
    {
      if (gLogCategory_CUUserAlert != -1
        || (v34 = _LogCategory_Initialize((uint64_t)&gLogCategory_CUUserAlert, 0x5Au), uint64_t v10 = (uint64_t)v40, v34))
      {
        v17 = NSPrintF((uint64_t)"%{error}", v10, v11, v12, v13, v14, v15, v16, v10);
        LogPrintF_safe((uint64_t)&gLogCategory_CUUserAlert, (uint64_t)"-[CUUserAlert activateWithCompletion:]_block_invoke", 0x5Au, (uint64_t)"### Activate failed: %@", v18, v19, v20, v21, (uint64_t)v17);
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    [*(id *)(a1 + 32) _autoInvalidate];
LABEL_16:

    return;
  }
  if (*(unsigned char *)(v9 + 9))
  {
    uint64_t v22 = NSErrorF_safe((void *)*MEMORY[0x1E4F28760], 4294896148, (uint64_t)"activate after invalidate", a4, a5, a6, a7, a8, v39);
    id v40 = (id)v22;
    if (gLogCategory_CUUserAlert <= 90)
    {
      if (gLogCategory_CUUserAlert != -1
        || (BOOL v35 = _LogCategory_Initialize((uint64_t)&gLogCategory_CUUserAlert, 0x5Au), v22 = (uint64_t)v40, v35))
      {
        v29 = NSPrintF((uint64_t)"%{error}", v22, v23, v24, v25, v26, v27, v28, v22);
        LogPrintF_safe((uint64_t)&gLogCategory_CUUserAlert, (uint64_t)"-[CUUserAlert activateWithCompletion:]_block_invoke", 0x5Au, (uint64_t)"### Activate failed: %@", v30, v31, v32, v33, (uint64_t)v29);
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    goto LABEL_16;
  }
  if (gLogCategory_CUUserAlert <= 30)
  {
    if (gLogCategory_CUUserAlert != -1
      || (v36 = _LogCategory_Initialize((uint64_t)&gLogCategory_CUUserAlert, 0x1Eu), uint64_t v9 = *(void *)(a1 + 32), v36))
    {
      LogPrintF_safe((uint64_t)&gLogCategory_CUUserAlert, (uint64_t)"-[CUUserAlert activateWithCompletion:]_block_invoke", 0x1Eu, (uint64_t)"Activate: Timeout %.3f", a5, a6, a7, a8, *(void *)(v9 + 112));
      uint64_t v9 = *(void *)(a1 + 32);
    }
  }
  *(unsigned char *)(v9 + 8) = 1;
  uint64_t v37 = *(void **)(a1 + 32);
  uint64_t v38 = *(void *)(a1 + 40);
  [v37 _activateWithCompletion:v38];
}

- (void)dealloc
{
  if (self->_activateCalled && !self->_invalidateDone) {
    FatalErrorF((uint64_t)"Activate without invalidate", (uint64_t)a2, v2, v3, v4, v5, v6, v7, (uint64_t)v8.receiver);
  }
  v8.receiver = self;
  v8.super_class = (Class)CUUserAlert;
  [(CUUserAlert *)&v8 dealloc];
}

- (CUUserAlert)init
{
  v6.receiver = self;
  v6.super_class = (Class)CUUserAlert;
  uint64_t v2 = [(CUUserAlert *)&v6 init];
  uint64_t v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1E4F14428]);
    uint64_t v4 = v3;
  }

  return v3;
}

@end