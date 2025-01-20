@interface BioUserDefaults
+ (id)preferenceObjectForKey:(id)a3;
+ (id)sharedInstance;
- (BOOL)BOOLForKey:(id)a3;
- (BOOL)setBool:(BOOL)a3 forKey:(id)a4;
- (BOOL)setObject:(id)a3 forKey:(id)a4;
- (BOOL)synchronize;
- (id)numberForKey:(id)a3;
- (id)objectOfClass:(Class)a3 forKey:(id)a4;
- (id)stateDictionary;
- (id)stringForKey:(id)a3;
- (int)intForKey:(id)a3;
- (int64_t)integerForKey:(id)a3;
- (unint64_t)unsignedIntegerForKey:(id)a3;
- (unsigned)unsignedIntForKey:(id)a3;
- (void)registerDefaults:(id)a3;
- (void)registerUpdateNotification:(id)a3;
- (void)unregisterUpdateNotification:(id)a3;
- (void)updateNotification;
@end

@implementation BioUserDefaults

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__BioUserDefaults_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, block);
  }
  v2 = (void *)sharedInstance_instance;
  return v2;
}

uint64_t __33__BioUserDefaults_sharedInstance__block_invoke(uint64_t a1)
{
  sharedInstance_instance = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return MEMORY[0x1F41817F8]();
}

- (void)registerDefaults:(id)a3
{
  id v4 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__BioUserDefaults_registerDefaults___block_invoke;
  block[3] = &unk_1E6067CD8;
  block[4] = self;
  if (registerDefaults__onceToken != -1) {
    dispatch_once(&registerDefaults__onceToken, block);
  }
  v5 = self->_registeredDefaults;
  objc_sync_enter(v5);
  [(NSMutableDictionary *)self->_registeredDefaults addEntriesFromDictionary:v4];
  objc_sync_exit(v5);
}

uint64_t __36__BioUserDefaults_registerDefaults___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 8) = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  return MEMORY[0x1F41817F8]();
}

- (void)updateNotification
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v3 = self->_updateBlocks;
  objc_sync_enter(v3);
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = self->_updateBlocks;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v4);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v8 + 1) + 8 * v7) + 16))(*(void *)(*((void *)&v8 + 1) + 8 * v7));
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }

  objc_sync_exit(v3);
}

- (void)registerUpdateNotification:(id)a3
{
  id v10 = a3;
  id v4 = self->_updateBlocks;
  objc_sync_enter(v4);
  updateBlocks = self->_updateBlocks;
  if (!updateBlocks)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_updateBlocks;
    self->_updateBlocks = v6;

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)updateCallback, @"com.apple.ManagedConfiguration.profileListChanged", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)updateCallback, @"com.apple.biometrickitd.userDefaultsChanged", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    updateBlocks = self->_updateBlocks;
  }
  long long v9 = (void *)MEMORY[0x1B3EC0F90](v10);
  [(NSMutableArray *)updateBlocks addObject:v9];

  objc_sync_exit(v4);
}

- (void)unregisterUpdateNotification:(id)a3
{
  id v10 = a3;
  id v4 = self->_updateBlocks;
  objc_sync_enter(v4);
  updateBlocks = self->_updateBlocks;
  uint64_t v6 = (void *)MEMORY[0x1B3EC0F90](v10);
  [(NSMutableArray *)updateBlocks removeObject:v6];

  uint64_t v7 = self->_updateBlocks;
  if (v7 && ![(NSMutableArray *)v7 count])
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, 0, @"com.apple.ManagedConfiguration.profileListChanged", 0);
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, 0, @"com.apple.biometrickitd.userDefaultsChanged", 0);
    long long v9 = self->_updateBlocks;
    self->_updateBlocks = 0;
  }
  objc_sync_exit(v4);
}

- (id)objectOfClass:(Class)a3 forKey:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (__CFString *)a4;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:@"/Library/Managed Preferences/mobile/com.apple.biometrickitd.plist"];
  uint64_t v7 = v6;
  if (v6)
  {
    long long v8 = [v6 objectForKey:v5];
    if (objc_opt_isKindOfClass())
    {
      if (v8) {
        goto LABEL_26;
      }
    }
    else
    {
    }
  }
  CFPropertyListRef v9 = CFPreferencesCopyValue(v5, @"com.apple.biometrickitd", (CFStringRef)*MEMORY[0x1E4F1D3D0], (CFStringRef)*MEMORY[0x1E4F1D3E0]);
  if (v9)
  {
    long long v8 = (void *)v9;
    if (objc_opt_isKindOfClass()) {
      goto LABEL_26;
    }
    if (__osLog) {
      id v10 = __osLog;
    }
    else {
      id v10 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v16 = 136316162;
      v17 = "0";
      __int16 v18 = 2048;
      uint64_t v19 = 0;
      __int16 v20 = 2080;
      v21 = &unk_1B3B370EE;
      __int16 v22 = 2080;
      v23 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BioUserDefaults.m";
      __int16 v24 = 1024;
      int v25 = 166;
      _os_log_impl(&dword_1B3AF1000, v10, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v16, 0x30u);
    }
    CFRelease(v8);
  }
  long long v8 = (void *)CFPreferencesCopyValue(v5, @"com.apple.biometrickitd", @"mobile", (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  if (!v8)
  {
LABEL_22:
    v12 = self->_registeredDefaults;
    objc_sync_enter(v12);
    uint64_t v13 = [(NSMutableDictionary *)self->_registeredDefaults objectForKeyedSubscript:v5];
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      long long v8 = [(NSMutableDictionary *)self->_registeredDefaults objectForKeyedSubscript:v5];
    }
    else
    {
      long long v8 = 0;
    }
    objc_sync_exit(v12);

    goto LABEL_26;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (__osLog) {
      long long v11 = __osLog;
    }
    else {
      long long v11 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v16 = 136316162;
      v17 = "0";
      __int16 v18 = 2048;
      uint64_t v19 = 0;
      __int16 v20 = 2080;
      v21 = &unk_1B3B370EE;
      __int16 v22 = 2080;
      v23 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BioUserDefaults.m";
      __int16 v24 = 1024;
      int v25 = 184;
      _os_log_impl(&dword_1B3AF1000, v11, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v16, 0x30u);
    }
    CFRelease(v8);
    goto LABEL_22;
  }
LABEL_26:

  return v8;
}

- (BOOL)BOOLForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(BioUserDefaults *)self objectOfClass:objc_opt_class() forKey:v4];

  char v6 = [v5 BOOLValue];
  return v6;
}

- (int)intForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(BioUserDefaults *)self objectOfClass:objc_opt_class() forKey:v4];

  int v6 = [v5 intValue];
  return v6;
}

- (int64_t)integerForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(BioUserDefaults *)self objectOfClass:objc_opt_class() forKey:v4];

  int64_t v6 = [v5 integerValue];
  return v6;
}

- (unsigned)unsignedIntForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(BioUserDefaults *)self objectOfClass:objc_opt_class() forKey:v4];

  unsigned int v6 = [v5 unsignedIntValue];
  return v6;
}

- (unint64_t)unsignedIntegerForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(BioUserDefaults *)self objectOfClass:objc_opt_class() forKey:v4];

  unint64_t v6 = [v5 unsignedIntegerValue];
  return v6;
}

- (id)numberForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(BioUserDefaults *)self objectOfClass:objc_opt_class() forKey:v4];

  return v5;
}

- (id)stringForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(BioUserDefaults *)self objectOfClass:objc_opt_class() forKey:v4];

  return v5;
}

- (BOOL)setObject:(id)a3 forKey:(id)a4
{
  CFStringRef v4 = (const __CFString *)*MEMORY[0x1E4F1D3D0];
  CFStringRef v5 = (const __CFString *)*MEMORY[0x1E4F1D3E0];
  CFPreferencesSetValue((CFStringRef)a4, a3, @"com.apple.biometrickitd", (CFStringRef)*MEMORY[0x1E4F1D3D0], (CFStringRef)*MEMORY[0x1E4F1D3E0]);
  return CFPreferencesSynchronize(@"com.apple.biometrickitd", v4, v5) != 0;
}

- (BOOL)setBool:(BOOL)a3 forKey:(id)a4
{
  BOOL v4 = a3;
  unint64_t v6 = NSNumber;
  id v7 = a4;
  long long v8 = [v6 numberWithBool:v4];
  LOBYTE(self) = [(BioUserDefaults *)self setObject:v8 forKey:v7];

  return (char)self;
}

+ (id)preferenceObjectForKey:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v3 = (__CFString *)a3;
  CFStringRef v4 = (const __CFString *)*MEMORY[0x1E4F1D3D0];
  CFStringRef v5 = (const __CFString *)*MEMORY[0x1E4F1D3E0];
  CFPreferencesSynchronize(@"com.apple.biometrickitd", (CFStringRef)*MEMORY[0x1E4F1D3D0], (CFStringRef)*MEMORY[0x1E4F1D3E0]);
  CFPropertyListRef v6 = CFPreferencesCopyValue(v3, @"com.apple.biometrickitd", v4, v5);
  if (v6)
  {
    id v7 = (void *)v6;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_17;
    }
    if (__osLog) {
      long long v8 = __osLog;
    }
    else {
      long long v8 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136316162;
      uint64_t v13 = "0";
      __int16 v14 = 2048;
      uint64_t v15 = 0;
      __int16 v16 = 2080;
      v17 = &unk_1B3B370EE;
      __int16 v18 = 2080;
      uint64_t v19 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BioUserDefaults.m";
      __int16 v20 = 1024;
      int v21 = 310;
      _os_log_impl(&dword_1B3AF1000, v8, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v12, 0x30u);
    }
    CFRelease(v7);
  }
  CFStringRef v9 = (const __CFString *)*MEMORY[0x1E4F1D3C8];
  CFPreferencesSynchronize(@"com.apple.biometrickitd", @"mobile", (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  id v7 = (void *)CFPreferencesCopyValue(v3, @"com.apple.biometrickitd", @"mobile", v9);
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (__osLog) {
        id v10 = __osLog;
      }
      else {
        id v10 = MEMORY[0x1E4F14500];
      }
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        int v12 = 136316162;
        uint64_t v13 = "0";
        __int16 v14 = 2048;
        uint64_t v15 = 0;
        __int16 v16 = 2080;
        v17 = &unk_1B3B370EE;
        __int16 v18 = 2080;
        uint64_t v19 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BioUserDefaults.m";
        __int16 v20 = 1024;
        int v21 = 326;
        _os_log_impl(&dword_1B3AF1000, v10, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v12, 0x30u);
      }
      CFRelease(v7);
      id v7 = 0;
    }
  }
LABEL_17:

  return v7;
}

- (id)stateDictionary
{
  v20[4] = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F1C9E8];
  CFStringRef v4 = [MEMORY[0x1E4F1CB10] fileURLWithPath:@"/Library/Managed Preferences/mobile/com.apple.biometrickitd.plist"];
  CFStringRef v5 = [v3 dictionaryWithContentsOfURL:v4 error:0];

  CFStringRef v6 = (const __CFString *)*MEMORY[0x1E4F1D3D0];
  CFStringRef v7 = (const __CFString *)*MEMORY[0x1E4F1D3E0];
  CFPreferencesSynchronize(@"com.apple.biometrickitd", (CFStringRef)*MEMORY[0x1E4F1D3D0], (CFStringRef)*MEMORY[0x1E4F1D3E0]);
  CFArrayRef v8 = CFPreferencesCopyKeyList(@"com.apple.biometrickitd", v6, v7);
  CFDictionaryRef v9 = CFPreferencesCopyMultiple(v8, @"com.apple.biometrickitd", v6, v7);
  if (v8) {
    CFRelease(v8);
  }
  CFStringRef v10 = (const __CFString *)*MEMORY[0x1E4F1D3C8];
  CFArrayRef v11 = CFPreferencesCopyKeyList(@"com.apple.biometrickitd", @"mobile", (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  CFDictionaryRef v12 = CFPreferencesCopyMultiple(v11, @"com.apple.biometrickitd", @"mobile", v10);
  if (v11) {
    CFRelease(v11);
  }
  registeredDefaults = (NSMutableDictionary *)@"<none>";
  if (v5) {
    __int16 v14 = v5;
  }
  else {
    __int16 v14 = @"<none>";
  }
  v19[0] = @"profilePlist";
  v19[1] = @"defaults";
  if (v9) {
    uint64_t v15 = (__CFString *)v9;
  }
  else {
    uint64_t v15 = @"<none>";
  }
  v20[0] = v14;
  v20[1] = v15;
  v19[2] = @"mobileDefaults";
  v19[3] = @"registeredDefaults";
  if (v12) {
    __int16 v16 = (__CFString *)v12;
  }
  else {
    __int16 v16 = @"<none>";
  }
  if (self->_registeredDefaults) {
    registeredDefaults = self->_registeredDefaults;
  }
  v20[2] = v16;
  v20[3] = registeredDefaults;
  v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:4];

  return v17;
}

- (BOOL)synchronize
{
  int v2 = CFPreferencesSynchronize(@"com.apple.biometrickitd", (CFStringRef)*MEMORY[0x1E4F1D3D0], (CFStringRef)*MEMORY[0x1E4F1D3E0]);
  if (CFPreferencesSynchronize(@"com.apple.biometrickitd", @"mobile", (CFStringRef)*MEMORY[0x1E4F1D3C8])) {
    BOOL v3 = v2 == 0;
  }
  else {
    BOOL v3 = 1;
  }
  return !v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateBlocks, 0);
  objc_storeStrong((id *)&self->_registeredDefaults, 0);
}

@end