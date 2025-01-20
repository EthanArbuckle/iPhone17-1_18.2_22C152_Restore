@interface MCActivationUtilities
+ (id)sharedInstance;
- (BOOL)isActivatedCache;
- (BOOL)isReady;
- (MCActivationUtilities)init;
- (NSDictionary)activationRecordCache;
- (NSMutableDictionary)didBecomeReadyCallbacks;
- (NSNumber)isHRNModeCache;
- (id)activationRecord;
- (id)initPrivate;
- (int)isActivated;
- (int)isHRNMode;
- (void)_clearCache;
- (void)addDidBecomeReadyKey:(id)a3 callback:(id)a4;
- (void)setActivationRecordCache:(id)a3;
- (void)setDidBecomeReadyCallbacks:(id)a3;
- (void)setIsActivatedCache:(BOOL)a3;
- (void)setIsHRNModeCache:(id)a3;
- (void)setIsReady:(BOOL)a3;
@end

@implementation MCActivationUtilities

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__MCActivationUtilities_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, block);
  }
  v2 = (void *)sharedInstance__sharedInstance;
  return v2;
}

uint64_t __39__MCActivationUtilities_sharedInstance__block_invoke(uint64_t a1)
{
  sharedInstance__sharedInstance = [objc_alloc(*(Class *)(a1 + 32)) initPrivate];
  return MEMORY[0x1F41817F8]();
}

- (MCActivationUtilities)init
{
  return 0;
}

- (id)initPrivate
{
  v9.receiver = self;
  v9.super_class = (Class)MCActivationUtilities;
  v2 = [(MCActivationUtilities *)&v9 init];
  v3 = v2;
  if (v2)
  {
    isHRNModeCache = v2->_isHRNModeCache;
    v2->_isHRNModeCache = 0;

    v3->_isActivatedCache = 0;
    activationRecordCache = v3->_activationRecordCache;
    v3->_activationRecordCache = 0;

    v3->_isReady = 1;
    uint64_t v6 = [MEMORY[0x1E4F1CA60] dictionary];
    didBecomeReadyCallbacks = v3->_didBecomeReadyCallbacks;
    v3->_didBecomeReadyCallbacks = (NSMutableDictionary *)v6;
  }
  return v3;
}

- (void)setIsReady:(BOOL)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  BOOL isReady = self->_isReady;
  self->_BOOL isReady = a3;
  if (!isReady && a3)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v6 = [(NSMutableDictionary *)self->_didBecomeReadyCallbacks allValues];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v13 + 1) + 8 * i) + 16))();
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }

    v11 = [MEMORY[0x1E4F1CA60] dictionary];
    didBecomeReadyCallbacks = self->_didBecomeReadyCallbacks;
    self->_didBecomeReadyCallbacks = v11;
  }
}

- (int)isActivated
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (!self->_isReady) {
    return 0;
  }
  v2 = self;
  objc_sync_enter(v2);
  if ([(MCActivationUtilities *)v2 isActivatedCache])
  {
    int v3 = 2;
  }
  else
  {
    id v12 = 0;
    v4 = MCMAEGetActivationStateWithError((uint64_t)&v12);
    id v5 = v12;
    if (v5)
    {
      uint64_t v6 = _MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v14 = v5;
        _os_log_impl(&dword_1A13F0000, v6, OS_LOG_TYPE_ERROR, "MAEGetActivationStateWithError() error: %@", buf, 0xCu);
      }
      int v3 = 0;
    }
    else
    {
      uint64_t v7 = MCkMAActivationStateActivated();
      int v8 = [v4 isEqualToString:v7];

      if (v8)
      {
        [(MCActivationUtilities *)v2 setIsActivatedCache:1];
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFStringRef v10 = (const __CFString *)MCkNotificationActivationStateChanged();
        CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)MCActivationUtilitiesDeactivated, v10, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
        int v3 = 2;
      }
      else
      {
        int v3 = 1;
      }
    }
  }
  objc_sync_exit(v2);

  return v3;
}

- (id)activationRecord
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int v3 = [(MCActivationUtilities *)self activationRecordCache];
  if (!v3)
  {
    id v7 = 0;
    int v3 = MCMAECopyActivationRecordWithError((uint64_t)&v7);
    id v4 = v7;
    if (v4)
    {
      id v5 = _MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v9 = v4;
        _os_log_impl(&dword_1A13F0000, v5, OS_LOG_TYPE_ERROR, "MAECopyActivationRecordWithError error: %@", buf, 0xCu);
      }

      int v3 = 0;
    }
    [(MCActivationUtilities *)self setActivationRecordCache:v3];
  }
  return v3;
}

- (int)isHRNMode
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (self->_isReady)
  {
    if (_os_feature_enabled_impl())
    {
      int v3 = _MCLogObjects;
      int v4 = 2;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v20) = 0;
        _os_log_impl(&dword_1A13F0000, v3, OS_LOG_TYPE_DEBUG, "isHRNMode returning yes because of feature flag", (uint8_t *)&v20, 2u);
      }
    }
    else
    {
      uint64_t v6 = self;
      objc_sync_enter(v6);
      id v7 = [(MCActivationUtilities *)v6 isHRNModeCache];
      int v8 = v7;
      if (v7)
      {
        int v9 = [v7 BOOLValue];
        uint64_t v10 = _MCLogObjects;
        if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEBUG))
        {
          v11 = "no";
          if (v9) {
            v11 = "yes";
          }
          int v20 = 136446210;
          v21 = v11;
          _os_log_impl(&dword_1A13F0000, v10, OS_LOG_TYPE_DEBUG, "isHRNMode returning %{public}s from cache", (uint8_t *)&v20, 0xCu);
        }
        if (v9) {
          int v4 = 2;
        }
        else {
          int v4 = 1;
        }
      }
      else if ([(MCActivationUtilities *)v6 isActivated] == 2)
      {
        id v12 = [(MCActivationUtilities *)v6 activationRecord];
        long long v13 = [v12 objectForKeyedSubscript:@"DeviceConfigurationFlags"];
        uint64_t v14 = [v13 integerValue] & 0x21;
        uint64_t v15 = _MCLogObjects;
        if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEBUG))
        {
          long long v16 = "no";
          if (v14 == 33) {
            long long v16 = "yes";
          }
          int v20 = 136446210;
          v21 = v16;
          _os_log_impl(&dword_1A13F0000, v15, OS_LOG_TYPE_DEBUG, "isHRNMode returning %{public}s from activation record", (uint8_t *)&v20, 0xCu);
        }
        v17 = [MEMORY[0x1E4F28ED0] numberWithBool:v14 == 33];
        [(MCActivationUtilities *)v6 setIsHRNModeCache:v17];

        if (v14 == 33) {
          int v4 = 2;
        }
        else {
          int v4 = 1;
        }
      }
      else
      {
        uint64_t v18 = _MCLogObjects;
        if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEBUG))
        {
          LOWORD(v20) = 0;
          _os_log_impl(&dword_1A13F0000, v18, OS_LOG_TYPE_DEBUG, "isHRNMode returning unknown because the device isn't activated", (uint8_t *)&v20, 2u);
        }
        int v4 = 0;
      }

      objc_sync_exit(v6);
    }
  }
  else
  {
    id v5 = _MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v20) = 0;
      _os_log_impl(&dword_1A13F0000, v5, OS_LOG_TYPE_DEBUG, "isHRNMode returning unknown because it's not ready", (uint8_t *)&v20, 2u);
    }
    return 0;
  }
  return v4;
}

- (void)addDidBecomeReadyKey:(id)a3 callback:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = v7;
  if (self->_isReady)
  {
    int v9 = _MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1A13F0000, v9, OS_LOG_TYPE_FAULT, "Ignoring an added callback when MCActivationUtilities are already ready", v11, 2u);
    }
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x1A6232FE0](v7);
    [(NSMutableDictionary *)self->_didBecomeReadyCallbacks setObject:v10 forKeyedSubscript:v6];
  }
}

- (void)_clearCache
{
  observer = self;
  objc_sync_enter(observer);
  [(MCActivationUtilities *)observer setIsHRNModeCache:0];
  [(MCActivationUtilities *)observer setIsActivatedCache:0];
  [(MCActivationUtilities *)observer setActivationRecordCache:0];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFStringRef v3 = (const __CFString *)MCkNotificationActivationStateChanged();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, observer, v3, 0);
  objc_sync_exit(observer);
}

- (BOOL)isReady
{
  return self->_isReady;
}

- (NSNumber)isHRNModeCache
{
  return self->_isHRNModeCache;
}

- (void)setIsHRNModeCache:(id)a3
{
}

- (BOOL)isActivatedCache
{
  return self->_isActivatedCache;
}

- (void)setIsActivatedCache:(BOOL)a3
{
  self->_isActivatedCache = a3;
}

- (NSDictionary)activationRecordCache
{
  return self->_activationRecordCache;
}

- (void)setActivationRecordCache:(id)a3
{
}

- (NSMutableDictionary)didBecomeReadyCallbacks
{
  return self->_didBecomeReadyCallbacks;
}

- (void)setDidBecomeReadyCallbacks:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_didBecomeReadyCallbacks, 0);
  objc_storeStrong((id *)&self->_activationRecordCache, 0);
  objc_storeStrong((id *)&self->_isHRNModeCache, 0);
}

@end