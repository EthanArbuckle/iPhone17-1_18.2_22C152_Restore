@interface AFSiriUserNotificationRequestCapabilityManager
+ (BOOL)supportedByApplicationWithBundleID:(id)a3;
+ (Class)_classForPlatform:(int64_t)a3;
+ (id)sharedManager;
- (BOOL)hasEligibleSetup;
- (BOOL)requestCanBeHandled;
- (id)_initWithPlatform:(int64_t)a3;
- (void)addObserver:(id)a3;
- (void)fetchEligibleSetupStateWithCompletion:(id)a3;
- (void)fetchRequestCanBeHandledStateWithCompletion:(id)a3;
- (void)notifyObserversOfCurrentEligibleSetupState:(BOOL)a3 onPlatform:(int64_t)a4;
- (void)notifyObserversOfCurrentRequestCanBeHandledState:(BOOL)a3 onPlatform:(int64_t)a4;
- (void)provider:(id)a3 availableAnnouncementRequestTypesChanged:(unint64_t)a4;
- (void)provider:(id)a3 eligibleAnnouncementRequestTypesChanged:(unint64_t)a4;
- (void)removeObserver:(id)a3;
@end

@implementation AFSiriUserNotificationRequestCapabilityManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_capabilityProvider, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

- (void)provider:(id)a3 availableAnnouncementRequestTypesChanged:(unint64_t)a4
{
  unint64_t v5 = a4 & 1;
  uint64_t v6 = [(id)objc_opt_class() platform];
  [(AFSiriUserNotificationRequestCapabilityManager *)self notifyObserversOfCurrentRequestCanBeHandledState:v5 onPlatform:v6];
}

- (void)provider:(id)a3 eligibleAnnouncementRequestTypesChanged:(unint64_t)a4
{
  unint64_t v5 = a4 & 1;
  uint64_t v6 = [(id)objc_opt_class() platform];
  [(AFSiriUserNotificationRequestCapabilityManager *)self notifyObserversOfCurrentEligibleSetupState:v5 onPlatform:v6];
}

- (void)notifyObserversOfCurrentRequestCanBeHandledState:(BOOL)a3 onPlatform:(int64_t)a4
{
  BOOL v5 = a3;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v7 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    observers = self->_observers;
    v15 = v7;
    *(_DWORD *)buf = 136315650;
    v22 = "-[AFSiriUserNotificationRequestCapabilityManager notifyObserversOfCurrentRequestCanBeHandledState:onPlatform:]";
    __int16 v23 = 2048;
    uint64_t v24 = [(NSHashTable *)observers count];
    __int16 v25 = 1024;
    BOOL v26 = v5;
    _os_log_debug_impl(&dword_19CF1D000, v15, OS_LOG_TYPE_DEBUG, "%s Notifying %lu observers, request can be handled? %d", buf, 0x1Cu);
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v8 = self->_observers;
  uint64_t v9 = [(NSHashTable *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v16 + 1) + 8 * v12);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v13, "requestCanBeHandledChanged:onPlatform:", v5, a4, (void)v16);
        }
        if (a4 == 1) {
          [v13 requestCanBeHandledChanged:v5];
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSHashTable *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }
}

- (void)notifyObserversOfCurrentEligibleSetupState:(BOOL)a3 onPlatform:(int64_t)a4
{
  BOOL v5 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = self->_observers;
  uint64_t v7 = [(NSHashTable *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v12 + 1) + 8 * v10);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v11, "hasEligibleSetupChanged:onPlatform:", v5, a4, (void)v12);
        }
        if (a4 == 1) {
          [v11 hasEligibleSetupChanged:v5];
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSHashTable *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (void)removeObserver:(id)a3
{
}

- (void)addObserver:(id)a3
{
}

- (BOOL)requestCanBeHandled
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (AFIsInternalInstall_onceToken != -1) {
    dispatch_once(&AFIsInternalInstall_onceToken, &__block_literal_global_158);
  }
  if (AFIsInternalInstall_isInternal && _AFPreferencesSpokenNotificationIsAlwaysOpportune())
  {
    v3 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(v25) = 136315138;
      *(void *)((char *)&v25 + 4) = "-[AFSiriUserNotificationRequestCapabilityManager requestCanBeHandled]";
      _os_log_debug_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_DEBUG, "%s Always Opportune, requests can be handled. This should only be used for testing.", (uint8_t *)&v25, 0xCu);
    }
    return 1;
  }
  else
  {
    BOOL v5 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(v25) = 136315138;
      *(void *)((char *)&v25 + 4) = "-[AFSiriUserNotificationRequestCapabilityManager requestCanBeHandled]";
      _os_log_debug_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_DEBUG, "%s ", (uint8_t *)&v25, 0xCu);
    }
    uint64_t v6 = dispatch_group_create();
    dispatch_group_enter(v6);
    uint64_t v7 = [AFSafetyBlock alloc];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __69__AFSiriUserNotificationRequestCapabilityManager_requestCanBeHandled__block_invoke;
    v19[3] = &unk_1E5928308;
    uint64_t v8 = v6;
    v20 = v8;
    uint64_t v9 = [(AFSafetyBlock *)v7 initWithBlock:v19];
    *(void *)&long long v25 = 0;
    *((void *)&v25 + 1) = &v25;
    uint64_t v26 = 0x2020000000;
    char v27 = 0;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __69__AFSiriUserNotificationRequestCapabilityManager_requestCanBeHandled__block_invoke_2;
    v16[3] = &unk_1E5928670;
    long long v18 = &v25;
    uint64_t v10 = v9;
    uint64_t v17 = v10;
    [(AFSiriUserNotificationRequestCapabilityManager *)self fetchRequestCanBeHandledStateWithCompletion:v16];
    dispatch_time_t v11 = dispatch_time(0, 2000000000);
    intptr_t v12 = dispatch_group_wait(v8, v11);
    [(AFSafetyBlock *)v10 invoke];
    long long v13 = AFSiriLogContextConnection;
    if (v12)
    {
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v22 = "-[AFSiriUserNotificationRequestCapabilityManager requestCanBeHandled]";
        _os_log_error_impl(&dword_19CF1D000, v13, OS_LOG_TYPE_ERROR, "%s Timed out fetching request can be handled", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      int v15 = *(unsigned __int8 *)(*((void *)&v25 + 1) + 24);
      *(_DWORD *)buf = 136315394;
      v22 = "-[AFSiriUserNotificationRequestCapabilityManager requestCanBeHandled]";
      __int16 v23 = 1024;
      int v24 = v15;
      _os_log_debug_impl(&dword_19CF1D000, v13, OS_LOG_TYPE_DEBUG, "%s Request can be handled: %d", buf, 0x12u);
    }
    BOOL v4 = *(unsigned char *)(*((void *)&v25 + 1) + 24) != 0;

    _Block_object_dispose(&v25, 8);
  }
  return v4;
}

void __69__AFSiriUserNotificationRequestCapabilityManager_requestCanBeHandled__block_invoke(uint64_t a1)
{
}

uint64_t __69__AFSiriUserNotificationRequestCapabilityManager_requestCanBeHandled__block_invoke_2(uint64_t a1, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  return [*(id *)(a1 + 32) invoke];
}

- (void)fetchRequestCanBeHandledStateWithCompletion:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __94__AFSiriUserNotificationRequestCapabilityManager_fetchRequestCanBeHandledStateWithCompletion___block_invoke;
    v7[3] = &unk_1E592C6E8;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

void __94__AFSiriUserNotificationRequestCapabilityManager_fetchRequestCanBeHandledStateWithCompletion___block_invoke(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 24);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __94__AFSiriUserNotificationRequestCapabilityManager_fetchRequestCanBeHandledStateWithCompletion___block_invoke_2;
  v2[3] = &unk_1E59282E0;
  id v3 = *(id *)(a1 + 40);
  [v1 fetchAvailableAnnouncementRequestTypesWithCompletion:v2];
}

uint64_t __94__AFSiriUserNotificationRequestCapabilityManager_fetchRequestCanBeHandledStateWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)hasEligibleSetup
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (AFIsInternalInstall_onceToken != -1) {
    dispatch_once(&AFIsInternalInstall_onceToken, &__block_literal_global_158);
  }
  if (AFIsInternalInstall_isInternal && _AFPreferencesSpokenNotificationIsAlwaysOpportune())
  {
    id v3 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(v26) = 136315138;
      *(void *)((char *)&v26 + 4) = "-[AFSiriUserNotificationRequestCapabilityManager hasEligibleSetup]";
      _os_log_debug_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_DEBUG, "%s Always Opportune so marking as eligible setup. This should only be used for testing.", (uint8_t *)&v26, 0xCu);
    }
    LOBYTE(v4) = 1;
  }
  else
  {
    BOOL v5 = dispatch_group_create();
    dispatch_group_enter(v5);
    uint64_t v6 = [AFSafetyBlock alloc];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __66__AFSiriUserNotificationRequestCapabilityManager_hasEligibleSetup__block_invoke;
    v20[3] = &unk_1E5928308;
    uint64_t v7 = v5;
    v21 = v7;
    id v8 = [(AFSafetyBlock *)v6 initWithBlock:v20];
    BOOL v4 = [(AFAnnouncementRequestCapabilityProviding *)self->_capabilityProvider lastKnownEligibleAnnouncementRequestTypes] & 1;
    *(void *)&long long v26 = 0;
    *((void *)&v26 + 1) = &v26;
    uint64_t v27 = 0x2020000000;
    char v28 = 0;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __66__AFSiriUserNotificationRequestCapabilityManager_hasEligibleSetup__block_invoke_2;
    v15[3] = &unk_1E5928330;
    long long v18 = &v26;
    uint64_t v9 = v8;
    BOOL v19 = v4;
    long long v16 = v9;
    uint64_t v17 = self;
    [(AFSiriUserNotificationRequestCapabilityManager *)self fetchEligibleSetupStateWithCompletion:v15];
    dispatch_time_t v10 = dispatch_time(0, 2000000000);
    intptr_t v11 = dispatch_group_wait(v7, v10);
    [(AFSafetyBlock *)v9 invoke];
    intptr_t v12 = AFSiriLogContextConnection;
    if (v11)
    {
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        __int16 v23 = "-[AFSiriUserNotificationRequestCapabilityManager hasEligibleSetup]";
        _os_log_error_impl(&dword_19CF1D000, v12, OS_LOG_TYPE_ERROR, "%s Timed out fetching eligible setup", buf, 0xCu);
      }
    }
    else
    {
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v14 = *(unsigned __int8 *)(*((void *)&v26 + 1) + 24);
        *(_DWORD *)buf = 136315394;
        __int16 v23 = "-[AFSiriUserNotificationRequestCapabilityManager hasEligibleSetup]";
        __int16 v24 = 2048;
        uint64_t v25 = v14;
        _os_log_debug_impl(&dword_19CF1D000, v12, OS_LOG_TYPE_DEBUG, "%s Eligble Setup: %lu", buf, 0x16u);
      }
      LOBYTE(v4) = *(unsigned char *)(*((void *)&v26 + 1) + 24) != 0;
    }

    _Block_object_dispose(&v26, 8);
  }
  return v4;
}

void __66__AFSiriUserNotificationRequestCapabilityManager_hasEligibleSetup__block_invoke(uint64_t a1)
{
}

uint64_t __66__AFSiriUserNotificationRequestCapabilityManager_hasEligibleSetup__block_invoke_2(uint64_t a1, char a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a2;
  uint64_t result = [*(id *)(a1 + 32) invoke];
  int v4 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  if (v4 != *(unsigned __int8 *)(a1 + 56))
  {
    BOOL v5 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      int v6 = 136315138;
      uint64_t v7 = "-[AFSiriUserNotificationRequestCapabilityManager hasEligibleSetup]_block_invoke_2";
      _os_log_debug_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_DEBUG, "%s Eligible capabilities changed, notifying observers", (uint8_t *)&v6, 0xCu);
      int v4 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    }
    return objc_msgSend(*(id *)(a1 + 40), "notifyObserversOfCurrentEligibleSetupState:onPlatform:", v4 != 0, objc_msgSend((id)objc_opt_class(), "platform"));
  }
  return result;
}

- (void)fetchEligibleSetupStateWithCompletion:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __88__AFSiriUserNotificationRequestCapabilityManager_fetchEligibleSetupStateWithCompletion___block_invoke;
    v7[3] = &unk_1E592C6E8;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

void __88__AFSiriUserNotificationRequestCapabilityManager_fetchEligibleSetupStateWithCompletion___block_invoke(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 24);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __88__AFSiriUserNotificationRequestCapabilityManager_fetchEligibleSetupStateWithCompletion___block_invoke_2;
  v2[3] = &unk_1E59282E0;
  id v3 = *(id *)(a1 + 40);
  [v1 fetchEligibleAnnouncementRequestTypesWithCompletion:v2];
}

uint64_t __88__AFSiriUserNotificationRequestCapabilityManager_fetchEligibleSetupStateWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_initWithPlatform:(int64_t)a3
{
  v14.receiver = self;
  v14.super_class = (Class)AFSiriUserNotificationRequestCapabilityManager;
  id v4 = [(AFSiriUserNotificationRequestCapabilityManager *)&v14 init];
  if (v4)
  {
    BOOL v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("AFSiriUserNotificationRequestCapabilityManager", v5);

    queue = v4->_queue;
    v4->_queue = (OS_dispatch_queue *)v6;

    uint64_t v8 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    observers = v4->_observers;
    v4->_observers = (NSHashTable *)v8;

    dispatch_time_t v10 = (void *)[(id)objc_opt_class() _classForPlatform:a3];
    v4->_platform = [v10 platform];
    uint64_t v11 = [v10 provider];
    capabilityProvider = v4->_capabilityProvider;
    v4->_capabilityProvider = (AFAnnouncementRequestCapabilityProviding *)v11;

    [(AFAnnouncementRequestCapabilityProviding *)v4->_capabilityProvider addDelegate:v4];
  }
  return v4;
}

+ (BOOL)supportedByApplicationWithBundleID:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (AFIsInternalInstall_onceToken != -1) {
    dispatch_once(&AFIsInternalInstall_onceToken, &__block_literal_global_158);
  }
  if (AFIsInternalInstall_isInternal && _AFPreferencesSpokenNotificationShouldAnnounceAllNotifications())
  {
    id v4 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      int v8 = 136315138;
      uint64_t v9 = "+[AFSiriUserNotificationRequestCapabilityManager supportedByApplicationWithBundleID:]";
      _os_log_debug_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_DEBUG, "%s Allow all notifications to be announced. This should only be used for testing.", (uint8_t *)&v8, 0xCu);
    }
    char v5 = 1;
  }
  else
  {
    char v5 = 1;
    dispatch_queue_t v6 = +[AFSiriAnnouncementRequestCapabilityManager supportedAnnouncementTypesForBundleId:v3 onPlatform:1];
    if (([v6 containsObject:&unk_1EEE97268] & 1) == 0) {
      char v5 = [v6 containsObject:&unk_1EEE97280];
    }
  }
  return v5;
}

+ (Class)_classForPlatform:(int64_t)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if ((unint64_t)a3 >= 5)
  {
    id v4 = AFSiriLogContextConnection;
    if (!os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
      goto LABEL_6;
    }
    goto LABEL_9;
  }
  if (((1 << a3) & 0x1A) == 0)
  {
    id v4 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
LABEL_9:
      int v7 = 136315394;
      int v8 = "+[AFSiriUserNotificationRequestCapabilityManager _classForPlatform:]";
      __int16 v9 = 2048;
      int64_t v10 = a3;
      _os_log_error_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_ERROR, "%s platform %li is not valid, using headphones provider.", (uint8_t *)&v7, 0x16u);
    }
  }
LABEL_6:
  char v5 = objc_opt_class();
  return (Class)v5;
}

+ (id)sharedManager
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__AFSiriUserNotificationRequestCapabilityManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_onceToken_21904 != -1) {
    dispatch_once(&sharedManager_onceToken_21904, block);
  }
  v2 = (void *)sharedManager_sManager;
  return v2;
}

void __63__AFSiriUserNotificationRequestCapabilityManager_sharedManager__block_invoke()
{
  uint64_t v0 = [objc_alloc((Class)objc_opt_class()) _initWithPlatform:1];
  v1 = (void *)sharedManager_sManager;
  sharedManager_sManager = v0;
}

@end