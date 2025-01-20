@interface DMCActivationUtilities
+ (id)sharedInstance;
- (BOOL)isActivatedCache;
- (BOOL)isReady;
- (NSDictionary)activationRecordCache;
- (NSMutableDictionary)didBecomeReadyCallbacks;
- (NSNumber)hrnModeCache;
- (id)activationRecord;
- (id)initPrivate;
- (int)activationState;
- (int)hrnMode;
- (void)_clearCache;
- (void)addDidBecomeReadyKey:(id)a3 callback:(id)a4;
- (void)setActivationRecordCache:(id)a3;
- (void)setDidBecomeReadyCallbacks:(id)a3;
- (void)setHrnModeCache:(id)a3;
- (void)setIsActivatedCache:(BOOL)a3;
- (void)setIsReady:(BOOL)a3;
@end

@implementation DMCActivationUtilities

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__DMCActivationUtilities_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, block);
  }
  v2 = (void *)sharedInstance__sharedInstance;
  return v2;
}

uint64_t __40__DMCActivationUtilities_sharedInstance__block_invoke(uint64_t a1)
{
  sharedInstance__sharedInstance = [objc_alloc(*(Class *)(a1 + 32)) initPrivate];
  return MEMORY[0x1F41817F8]();
}

- (id)initPrivate
{
  v9.receiver = self;
  v9.super_class = (Class)DMCActivationUtilities;
  v2 = [(DMCActivationUtilities *)&v9 init];
  v3 = v2;
  if (v2)
  {
    hrnModeCache = v2->_hrnModeCache;
    v2->_hrnModeCache = 0;

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

- (int)activationState
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (!self->_isReady) {
    return 0;
  }
  v3 = self;
  objc_sync_enter(v3);
  if ([(DMCActivationUtilities *)v3 isActivatedCache])
  {
    int v4 = 2;
  }
  else
  {
    id v15 = 0;
    v5 = DMCMAEGetActivationStateWithError((uint64_t)&v15);
    id v6 = v15;
    if (v6)
    {
      uint64_t v7 = *DMCLogObjects();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v17 = v6;
        _os_log_impl(&dword_1A7863000, v7, OS_LOG_TYPE_ERROR, "MAEGetActivationStateWithError() error: %@", buf, 0xCu);
      }
      self->_BOOL isReady = 0;
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFStringRef v9 = (const __CFString *)DMCkNotificationActivationStateChanged();
      CFNotificationCenterAddObserver(DarwinNotifyCenter, v3, (CFNotificationCallback)DMCActivationUtilitiesWaitingForReady, v9, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      int v4 = 0;
    }
    else
    {
      v10 = DMCkMAActivationStateActivated();
      int v11 = [v5 isEqualToString:v10];

      if (v11)
      {
        [(DMCActivationUtilities *)v3 setIsActivatedCache:1];
        v12 = CFNotificationCenterGetDarwinNotifyCenter();
        CFStringRef v13 = (const __CFString *)DMCkNotificationActivationStateChanged();
        CFNotificationCenterAddObserver(v12, v3, (CFNotificationCallback)DMCActivationUtilitiesDeactivated, v13, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
        int v4 = 2;
      }
      else
      {
        int v4 = 1;
      }
    }
  }
  objc_sync_exit(v3);

  return v4;
}

- (id)activationRecord
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v3 = [(DMCActivationUtilities *)self activationRecordCache];
  if (!v3)
  {
    id v7 = 0;
    v3 = DMCMAECopyActivationRecordWithError((uint64_t)&v7);
    id v4 = v7;
    if (v4)
    {
      v5 = *DMCLogObjects();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v9 = v4;
        _os_log_impl(&dword_1A7863000, v5, OS_LOG_TYPE_ERROR, "MAECopyActivationRecordWithError error: %@", buf, 0xCu);
      }

      v3 = 0;
    }
    [(DMCActivationUtilities *)self setActivationRecordCache:v3];
  }
  return v3;
}

- (int)hrnMode
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (+[DMCMultiUserModeUtilities isSharediPad]) {
    return 1;
  }
  if (self->_isReady)
  {
    if (+[DMCFeatureFlags isHRNEnabled])
    {
      id v4 = *DMCLogObjects();
      int v3 = 2;
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v20) = 0;
        _os_log_impl(&dword_1A7863000, v4, OS_LOG_TYPE_DEBUG, "hrnMode returning yes because of feature flag", (uint8_t *)&v20, 2u);
      }
    }
    else
    {
      id v6 = self;
      objc_sync_enter(v6);
      id v7 = [(DMCActivationUtilities *)v6 hrnModeCache];
      uint64_t v8 = v7;
      if (v7)
      {
        int v9 = [v7 BOOLValue];
        uint64_t v10 = *DMCLogObjects();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          int v11 = "no";
          if (v9) {
            int v11 = "yes";
          }
          int v20 = 136446210;
          v21 = v11;
          _os_log_impl(&dword_1A7863000, v10, OS_LOG_TYPE_DEBUG, "hrnMode returning %{public}s from cache", (uint8_t *)&v20, 0xCu);
        }
        if (v9) {
          int v3 = 2;
        }
        else {
          int v3 = 1;
        }
      }
      else if ([(DMCActivationUtilities *)v6 activationState] == 2)
      {
        v12 = [(DMCActivationUtilities *)v6 activationRecord];
        CFStringRef v13 = [v12 objectForKeyedSubscript:@"DeviceConfigurationFlags"];
        uint64_t v14 = [v13 integerValue] & 0x21;
        id v15 = *DMCLogObjects();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          long long v16 = "no";
          if (v14 == 33) {
            long long v16 = "yes";
          }
          int v20 = 136446210;
          v21 = v16;
          _os_log_impl(&dword_1A7863000, v15, OS_LOG_TYPE_DEBUG, "hrnMode returning %{public}s from activation record", (uint8_t *)&v20, 0xCu);
        }
        id v17 = [NSNumber numberWithBool:v14 == 33];
        [(DMCActivationUtilities *)v6 setHrnModeCache:v17];

        if (v14 == 33) {
          int v3 = 2;
        }
        else {
          int v3 = 1;
        }
      }
      else
      {
        uint64_t v18 = *DMCLogObjects();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          LOWORD(v20) = 0;
          _os_log_impl(&dword_1A7863000, v18, OS_LOG_TYPE_DEBUG, "hrnMode returning unknown because the device isn't activated", (uint8_t *)&v20, 2u);
        }
        int v3 = 0;
      }

      objc_sync_exit(v6);
    }
  }
  else
  {
    v5 = *DMCLogObjects();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v20) = 0;
      _os_log_impl(&dword_1A7863000, v5, OS_LOG_TYPE_DEBUG, "hrnMode returning unknown because it's not ready", (uint8_t *)&v20, 2u);
    }
    return 0;
  }
  return v3;
}

- (void)addDidBecomeReadyKey:(id)a3 callback:(id)a4
{
  id v6 = a3;
  if (self->_isReady)
  {
    id v7 = *DMCLogObjects();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)int v9 = 0;
      _os_log_impl(&dword_1A7863000, v7, OS_LOG_TYPE_FAULT, "Ignoring an added callback when DMCActivationUtilities are already ready", v9, 2u);
    }
  }
  else
  {
    uint64_t v8 = (void *)MEMORY[0x1AD0D2220](a4);
    [(NSMutableDictionary *)self->_didBecomeReadyCallbacks setObject:v8 forKeyedSubscript:v6];
  }
}

- (void)_clearCache
{
  observer = self;
  objc_sync_enter(observer);
  [(DMCActivationUtilities *)observer setHrnModeCache:0];
  [(DMCActivationUtilities *)observer setIsActivatedCache:0];
  [(DMCActivationUtilities *)observer setActivationRecordCache:0];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFStringRef v3 = (const __CFString *)DMCkNotificationActivationStateChanged();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, observer, v3, 0);
  objc_sync_exit(observer);
}

- (BOOL)isReady
{
  return self->_isReady;
}

- (NSNumber)hrnModeCache
{
  return self->_hrnModeCache;
}

- (void)setHrnModeCache:(id)a3
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
  objc_storeStrong((id *)&self->_hrnModeCache, 0);
}

@end