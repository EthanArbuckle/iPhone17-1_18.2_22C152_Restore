@interface AFFamilyCircleStatusManager
+ (BOOL)isChildAccount;
+ (id)sharedManager;
- (AFFamilyCircleStatusManager)init;
- (BOOL)childAccount;
- (void)_fetchChildAccountStatus;
- (void)_observeAccountChanges;
- (void)_observeFamilyChanges;
- (void)dealloc;
- (void)fetchChildAccountStatus;
- (void)setChildAccount:(BOOL)a3;
@end

@implementation AFFamilyCircleStatusManager

- (void)setChildAccount:(BOOL)a3
{
  self->_childAccount = a3;
}

- (BOOL)childAccount
{
  return self->_childAccount;
}

- (void)_fetchChildAccountStatus
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = AFSiriLogContextUtility;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[AFFamilyCircleStatusManager _fetchChildAccountStatus]";
    _os_log_debug_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_DEBUG, "%s #Montara #FamilyCircle", (uint8_t *)&buf, 0xCu);
  }
  FAFetchFamilyCircleRequestClass = (objc_class *)getFAFetchFamilyCircleRequestClass();
  if (FAFetchFamilyCircleRequestClass)
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v11 = 0x3032000000;
    v12 = __Block_byref_object_copy__16504;
    v13 = __Block_byref_object_dispose__16505;
    id v14 = objc_alloc_init(FAFetchFamilyCircleRequestClass);
    [*(id *)(*((void *)&buf + 1) + 40) setCachePolicy:1];
    [*(id *)(*((void *)&buf + 1) + 40) setPromptUserToResolveAuthenticatonFailure:0];
    [*(id *)(*((void *)&buf + 1) + 40) setQualityOfService:25];
    objc_initWeak(&location, self);
    v5 = *(void **)(*((void *)&buf + 1) + 40);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __55__AFFamilyCircleStatusManager__fetchChildAccountStatus__block_invoke;
    v7[3] = &unk_1E5927778;
    objc_copyWeak(&v8, &location);
    v7[4] = &buf;
    [v5 startRequestWithCompletionHandler:v7];
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
    _Block_object_dispose(&buf, 8);
  }
  else
  {
    v6 = AFSiriLogContextUtility;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "-[AFFamilyCircleStatusManager _fetchChildAccountStatus]";
      _os_log_error_impl(&dword_19CF1D000, v6, OS_LOG_TYPE_ERROR, "%s #Montara #FamilyCircle Unable to get FAFetchFamilyCircleRequest class", (uint8_t *)&buf, 0xCu);
    }
  }
}

void __55__AFFamilyCircleStatusManager__fetchChildAccountStatus__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = AFSiriLogContextUtility;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 136315138;
    v34 = "-[AFFamilyCircleStatusManager _fetchChildAccountStatus]_block_invoke";
    _os_log_debug_impl(&dword_19CF1D000, v7, OS_LOG_TYPE_DEBUG, "%s #Montara #FamilyCircle", buf, 0xCu);
    if (!v6) {
      goto LABEL_5;
    }
  }
  else if (!v6)
  {
    goto LABEL_5;
  }
  id v8 = (void *)AFSiriLogContextUtility;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
  {
    v9 = v8;
    v10 = [v6 description];
    *(_DWORD *)long long buf = 136315394;
    v34 = "-[AFFamilyCircleStatusManager _fetchChildAccountStatus]_block_invoke";
    __int16 v35 = 2112;
    v36 = v10;
    _os_log_impl(&dword_19CF1D000, v9, OS_LOG_TYPE_INFO, "%s #Montara #FamilyCircle there was an error determining child restriction status %@", buf, 0x16u);
  }
LABEL_5:
  if (v5)
  {
    uint64_t v11 = [v5 members];
    v12 = AFSiriLogContextUtility;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 136315650;
      v34 = "-[AFFamilyCircleStatusManager _fetchChildAccountStatus]_block_invoke";
      __int16 v35 = 2112;
      v36 = v11;
      __int16 v37 = 2112;
      id v38 = v5;
      _os_log_debug_impl(&dword_19CF1D000, v12, OS_LOG_TYPE_DEBUG, "%s #Montara #FamilyCircle Family members received: %@ in circle: %@", buf, 0x20u);
    }
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v13 = v11;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v29;
LABEL_10:
      uint64_t v17 = 0;
      while (1)
      {
        if (*(void *)v29 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = *(void **)(*((void *)&v28 + 1) + 8 * v17);
        if (objc_msgSend(v18, "isMe", (void)v28)) {
          break;
        }
        if (v15 == ++v17)
        {
          uint64_t v15 = [v13 countByEnumeratingWithState:&v28 objects:v32 count:16];
          if (v15) {
            goto LABEL_10;
          }
          goto LABEL_16;
        }
      }
      id v19 = v18;

      if (!v19) {
        goto LABEL_22;
      }
      if ([v19 memberType] == 2)
      {
        v20 = AFSiriLogContextUtility;
        if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)long long buf = 136315138;
          v34 = "-[AFFamilyCircleStatusManager _fetchChildAccountStatus]_block_invoke";
          _os_log_debug_impl(&dword_19CF1D000, v20, OS_LOG_TYPE_DEBUG, "%s #Montara #FamilyCircle user is a child", buf, 0xCu);
        }
        uint64_t v21 = 1;
        goto LABEL_26;
      }
    }
    else
    {
LABEL_16:

LABEL_22:
      v22 = AFSiriLogContextUtility;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 136315138;
        v34 = "-[AFFamilyCircleStatusManager _fetchChildAccountStatus]_block_invoke";
        _os_log_error_impl(&dword_19CF1D000, v22, OS_LOG_TYPE_ERROR, "%s #Montara #FamilyCircle failed to locate Me record", buf, 0xCu);
      }
      id v19 = 0;
    }
    uint64_t v21 = 0;
LABEL_26:
  }
  else
  {
    v23 = AFSiriLogContextUtility;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 136315138;
      v34 = "-[AFFamilyCircleStatusManager _fetchChildAccountStatus]_block_invoke";
      _os_log_debug_impl(&dword_19CF1D000, v23, OS_LOG_TYPE_DEBUG, "%s #Montara #FamilyCircle family circle is nil, skipping restriction check.", buf, 0xCu);
    }
    uint64_t v21 = 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setChildAccount:v21];

  uint64_t v25 = *(void *)(*(void *)(a1 + 32) + 8);
  v26 = *(void **)(v25 + 40);
  *(void *)(v25 + 40) = 0;

  v27 = AFSiriLogContextUtility;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 136315138;
    v34 = "-[AFFamilyCircleStatusManager _fetchChildAccountStatus]_block_invoke";
    _os_log_debug_impl(&dword_19CF1D000, v27, OS_LOG_TYPE_DEBUG, "%s #Montara #FamilyCircle completed", buf, 0xCu);
  }
}

- (void)fetchChildAccountStatus
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v3 = AFSiriLogContextUtility;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 136315138;
    v7 = "-[AFFamilyCircleStatusManager fetchChildAccountStatus]";
    _os_log_debug_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_DEBUG, "%s #Montara #FamilyCircle", buf, 0xCu);
  }
  v4 = dispatch_get_global_queue(25, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__AFFamilyCircleStatusManager_fetchChildAccountStatus__block_invoke;
  block[3] = &unk_1E592C678;
  block[4] = self;
  dispatch_async(v4, block);
}

uint64_t __54__AFFamilyCircleStatusManager_fetchChildAccountStatus__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchChildAccountStatus];
}

- (void)dealloc
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v3 = AFSiriLogContextUtility;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 136315138;
    v7 = "-[AFFamilyCircleStatusManager dealloc]";
    _os_log_debug_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_DEBUG, "%s #Montara #FamilyCircle", buf, 0xCu);
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v5.receiver = self;
  v5.super_class = (Class)AFFamilyCircleStatusManager;
  [(AFFamilyCircleStatusManager *)&v5 dealloc];
}

- (void)_observeAccountChanges
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = [getACXPCEventSubscriberClass() sharedSubscriber];
  if (AFProcessIsAssistantDaemon_onceToken != -1) {
    dispatch_once(&AFProcessIsAssistantDaemon_onceToken, &__block_literal_global_735);
  }
  if (AFProcessIsAssistantDaemon_isAssistantDaemon) {
    BOOL v4 = v3 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    getACDAccountStoreDidChangeNotification();
    objc_super v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_HandleACDAccountStoreDidChange, v5, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      v7 = AFSiriLogContextUtility;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 136315138;
        uint64_t v16 = "-[AFFamilyCircleStatusManager _observeAccountChanges]";
        _os_log_debug_impl(&dword_19CF1D000, v7, OS_LOG_TYPE_DEBUG, "%s #Montara #FamilyCircle setup ACDAccountStoreDidChangeNotification observer completed", buf, 0xCu);
      }
    }
    else
    {
      uint64_t v11 = AFSiriLogContextUtility;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 136315138;
        uint64_t v16 = "-[AFFamilyCircleStatusManager _observeAccountChanges]";
        _os_log_error_impl(&dword_19CF1D000, v11, OS_LOG_TYPE_ERROR, "%s #Montara #FamilyCircle setup ACDAccountStoreDidChangeNotification observer failed", buf, 0xCu);
      }
    }
  }
  else
  {
    uint64_t v8 = AFSiriLogContextUtility;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 136315138;
      uint64_t v16 = "-[AFFamilyCircleStatusManager _observeAccountChanges]";
      _os_log_debug_impl(&dword_19CF1D000, v8, OS_LOG_TYPE_DEBUG, "%s #Montara #FamilyCircle setup ACXPCEventSubscriber", buf, 0xCu);
    }
    objc_initWeak(&location, self);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __53__AFFamilyCircleStatusManager__observeAccountChanges__block_invoke;
    v12[3] = &unk_1E5927750;
    objc_copyWeak(&v13, &location);
    [v3 registerAccountChangeEventHandler:v12];
    v10 = AFSiriLogContextUtility;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 136315138;
      uint64_t v16 = "-[AFFamilyCircleStatusManager _observeAccountChanges]";
      _os_log_debug_impl(&dword_19CF1D000, v10, OS_LOG_TYPE_DEBUG, "%s #Montara #FamilyCircle setup ACXPCEventSubscriber completed", buf, 0xCu);
    }
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

void __53__AFFamilyCircleStatusManager__observeAccountChanges__block_invoke(uint64_t a1, void *a2, int a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = AFSiriLogContextUtility;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 136315650;
    v9 = "-[AFFamilyCircleStatusManager _observeAccountChanges]_block_invoke";
    __int16 v10 = 2112;
    id v11 = v5;
    __int16 v12 = 1024;
    int v13 = a3;
    _os_log_debug_impl(&dword_19CF1D000, v6, OS_LOG_TYPE_DEBUG, "%s #Montara #FamilyCircle received account change event account=%@ type=%d", (uint8_t *)&v8, 0x1Cu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained fetchChildAccountStatus];
}

- (void)_observeFamilyChanges
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  getFAFamilyUpdateNotification();
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_HandleFAFamilyUpdate, v3, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    id v5 = AFSiriLogContextUtility;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_DEBUG))
    {
      int v7 = 136315138;
      int v8 = "-[AFFamilyCircleStatusManager _observeFamilyChanges]";
      _os_log_debug_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_DEBUG, "%s #Montara #FamilyCircle setup FAFamilyUpdateNotification observer completed", (uint8_t *)&v7, 0xCu);
    }
  }
  else
  {
    id v6 = AFSiriLogContextUtility;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136315138;
      int v8 = "-[AFFamilyCircleStatusManager _observeFamilyChanges]";
      _os_log_error_impl(&dword_19CF1D000, v6, OS_LOG_TYPE_ERROR, "%s #Montara #FamilyCircle setup FAFamilyUpdateNotification observer failed", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (AFFamilyCircleStatusManager)init
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v3 = AFSiriLogContextUtility;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 136315138;
    uint64_t v9 = "-[AFFamilyCircleStatusManager init]";
    _os_log_debug_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_DEBUG, "%s #Montara #FamilyCircle", buf, 0xCu);
  }
  v7.receiver = self;
  v7.super_class = (Class)AFFamilyCircleStatusManager;
  BOOL v4 = [(AFFamilyCircleStatusManager *)&v7 init];
  id v5 = v4;
  if (v4)
  {
    [(AFFamilyCircleStatusManager *)v4 fetchChildAccountStatus];
    if (getFAFetchFamilyCircleRequestClass())
    {
      [(AFFamilyCircleStatusManager *)v5 _observeFamilyChanges];
      [(AFFamilyCircleStatusManager *)v5 _observeAccountChanges];
    }
  }
  return v5;
}

+ (BOOL)isChildAccount
{
  v2 = +[AFFamilyCircleStatusManager sharedManager];
  char v3 = [v2 childAccount];

  return v3;
}

+ (id)sharedManager
{
  if (sharedManager_onceToken_16545 != -1) {
    dispatch_once(&sharedManager_onceToken_16545, &__block_literal_global_16546);
  }
  v2 = (void *)sharedManager_result;
  return v2;
}

void __44__AFFamilyCircleStatusManager_sharedManager__block_invoke()
{
  v0 = objc_alloc_init(AFFamilyCircleStatusManager);
  v1 = (void *)sharedManager_result;
  sharedManager_result = (uint64_t)v0;
}

@end