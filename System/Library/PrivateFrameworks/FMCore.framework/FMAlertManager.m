@interface FMAlertManager
+ (id)sharedInstance;
- (FMAlertManager)init;
- (NSMutableDictionary)activeAlerts;
- (NSMutableDictionary)activeCFNotificationsByCategory;
- (id)_xpcTransactionNameFor:(id)a3;
- (id)initSingleton;
- (void)activateAlert:(id)a3;
- (void)init;
- (void)initSingleton;
- (void)setActiveAlerts:(id)a3;
- (void)setActiveCFNotificationsByCategory:(id)a3;
@end

@implementation FMAlertManager

+ (id)sharedInstance
{
  if (sharedInstance_dispatch_predicate_0 != -1) {
    dispatch_once(&sharedInstance_dispatch_predicate_0, &__block_literal_global_8);
  }
  v2 = (void *)sharedInstance__instance_0;
  return v2;
}

void __32__FMAlertManager_sharedInstance__block_invoke()
{
  v0 = LogCategory_Unspecified();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG)) {
    __32__FMAlertManager_sharedInstance__block_invoke_cold_1(v0);
  }

  id v1 = [[FMAlertManager alloc] initSingleton];
  v2 = (void *)sharedInstance__instance_0;
  sharedInstance__instance_0 = (uint64_t)v1;
}

- (FMAlertManager)init
{
  v3 = LogCategory_Unspecified();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    -[FMAlertManager init](v3);
  }

  return 0;
}

- (id)initSingleton
{
  v7.receiver = self;
  v7.super_class = (Class)FMAlertManager;
  v2 = [(FMAlertManager *)&v7 init];
  if (v2)
  {
    v3 = LogCategory_Unspecified();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      -[FMAlertManager initSingleton](v3);
    }

    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    [(FMAlertManager *)v2 setActiveAlerts:v4];

    v5 = [MEMORY[0x1E4F1CA60] dictionary];
    [(FMAlertManager *)v2 setActiveCFNotificationsByCategory:v5];
  }
  return v2;
}

- (void)activateAlert:(id)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = LogCategory_Unspecified();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = [v4 alertId];
    *(_DWORD *)buf = 138412546;
    v48 = v6;
    __int16 v49 = 2048;
    uint64_t v50 = [v4 category];
    _os_log_impl(&dword_1D0EC4000, v5, OS_LOG_TYPE_INFO, "Will display %@:%ld", buf, 0x16u);
  }
  objc_super v7 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v8 = [v4 category];
  if (v8 != *MEMORY[0x1E4F61538])
  {
    v9 = [(FMAlertManager *)self activeCFNotificationsByCategory];
    v10 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v4, "category"));
    v11 = [v9 objectForKeyedSubscript:v10];

    if (v11)
    {
      v12 = [(FMAlertManager *)self activeAlerts];
      v13 = [v12 objectForKeyedSubscript:v11];

      v14 = [(FMAlertManager *)self activeCFNotificationsByCategory];
      v15 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v13, "category"));
      [v14 removeObjectForKey:v15];

      v16 = [(FMAlertManager *)self activeAlerts];
      [v16 removeObjectForKey:v11];

      v17 = +[FMXPCTransactionManager sharedInstance];
      v18 = [(FMAlertManager *)self _xpcTransactionNameFor:v13];
      [v17 endTransaction:v18];

      v19 = (__CFUserNotification *)[v11 unsignedLongValue];
      CFUserNotificationCancel(v19);
      CFRelease(v19);
    }
  }
  uint64_t v20 = *MEMORY[0x1E4F1D9E0];
  v21 = [v4 defaultButtonTitle];
  objc_msgSend(v7, "fm_safelyMapKey:toObject:", v20, v21);

  uint64_t v22 = *MEMORY[0x1E4F1D9D0];
  v23 = [v4 alternateButtonTitle];
  objc_msgSend(v7, "fm_safelyMapKey:toObject:", v22, v23);

  uint64_t v24 = *MEMORY[0x1E4F1D9A8];
  v25 = [v4 msgText];
  objc_msgSend(v7, "fm_safelyMapKey:toObject:", v24, v25);

  uint64_t v26 = *MEMORY[0x1E4F1D990];
  v27 = [v4 msgTitle];
  objc_msgSend(v7, "fm_safelyMapKey:toObject:", v26, v27);

  v28 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", objc_msgSend(v4, "showMsgInLockScreen"));
  [v7 setObject:v28 forKeyedSubscript:*MEMORY[0x1E4F1D9B8]];

  v29 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", objc_msgSend(v4, "dismissMsgOnUnlock") ^ 1);
  [v7 setObject:v29 forKeyedSubscript:*MEMORY[0x1E4FA7340]];

  v30 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", objc_msgSend(v4, "dismissMsgOnLock"));
  [v7 setObject:v30 forKeyedSubscript:*MEMORY[0x1E4FA7328]];

  uint64_t v31 = MEMORY[0x1E4F1CC38];
  [v7 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4FA72A0]];
  [v7 setObject:v31 forKeyedSubscript:*MEMORY[0x1E4FA7280]];
  v32 = [v4 additionalSettings];

  if (v32)
  {
    v33 = [v4 additionalSettings];
    [v7 addEntriesFromDictionary:v33];
  }
  *(_DWORD *)buf = 0;
  CFAllocatorRef v34 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  [v4 timeout];
  CFUserNotificationRef v36 = CFUserNotificationCreate(v34, v35, 3uLL, (SInt32 *)buf, (CFDictionaryRef)v7);
  if (v36)
  {
    CFUserNotificationRef v37 = v36;
    v38 = [(FMAlertManager *)self activeAlerts];
    v39 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLong:v37];
    [v38 setObject:v4 forKeyedSubscript:v39];

    if ([v4 category])
    {
      v40 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLong:v37];
      v41 = [(FMAlertManager *)self activeCFNotificationsByCategory];
      v42 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v4, "category"));
      [v41 setObject:v40 forKeyedSubscript:v42];
    }
    v43 = +[FMXPCTransactionManager sharedInstance];
    v44 = [(FMAlertManager *)self _xpcTransactionNameFor:v4];
    [v43 beginTransaction:v44];

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __32__FMAlertManager_activateAlert___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = v37;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else
  {
    v45 = LogCategory_Unspecified();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
      [(FMAlertManager *)v4 activateAlert:v45];
    }
  }
}

void __32__FMAlertManager_activateAlert___block_invoke(uint64_t a1)
{
  CFRunLoopSourceRef RunLoopSource = CFUserNotificationCreateRunLoopSource((CFAllocatorRef)*MEMORY[0x1E4F1CF80], *(CFUserNotificationRef *)(a1 + 32), (CFUserNotificationCallBack)_fmAlertCFCallback, 0);
  if (RunLoopSource)
  {
    v2 = RunLoopSource;
    Current = CFRunLoopGetCurrent();
    CFRunLoopAddSource(Current, v2, (CFRunLoopMode)*MEMORY[0x1E4F1D410]);
    CFRelease(v2);
  }
}

- (id)_xpcTransactionNameFor:(id)a3
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"Alert-%lX", a3);
}

- (NSMutableDictionary)activeAlerts
{
  return self->_activeAlerts;
}

- (void)setActiveAlerts:(id)a3
{
}

- (NSMutableDictionary)activeCFNotificationsByCategory
{
  return self->_activeCFNotificationsByCategory;
}

- (void)setActiveCFNotificationsByCategory:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeCFNotificationsByCategory, 0);
  objc_storeStrong((id *)&self->_activeAlerts, 0);
}

void __32__FMAlertManager_sharedInstance__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_debug_impl(&dword_1D0EC4000, log, OS_LOG_TYPE_DEBUG, "Creating shared instance of FMAlertManager", v1, 2u);
}

- (void)init
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_1D0EC4000, log, OS_LOG_TYPE_ERROR, "*** Trying to explicitly init FMAlertManager. Use 'sharedInstance'", v1, 2u);
}

- (void)initSingleton
{
  *(_WORD *)id v1 = 0;
  _os_log_debug_impl(&dword_1D0EC4000, log, OS_LOG_TYPE_DEBUG, "FMAlertManager: initialize", v1, 2u);
}

- (void)activateAlert:(NSObject *)a3 .cold.1(void *a1, int *a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v5 = objc_msgSend(a1, "fm_logID");
  uint64_t v6 = *a2;
  int v7 = 138412546;
  uint64_t v8 = v5;
  __int16 v9 = 2048;
  uint64_t v10 = v6;
  _os_log_error_impl(&dword_1D0EC4000, a3, OS_LOG_TYPE_ERROR, "Error while creating a CFUserNotification %@: %ld", (uint8_t *)&v7, 0x16u);
}

@end