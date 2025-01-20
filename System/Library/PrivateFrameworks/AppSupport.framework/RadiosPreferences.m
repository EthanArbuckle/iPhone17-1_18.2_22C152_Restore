@interface RadiosPreferences
+ (BOOL)shouldMirrorAirplaneMode;
- (BOOL)airplaneMode;
- (BOOL)notifyForExternalChangeOnly;
- (BOOL)telephonyStateWithBundleIdentifierOut:(id *)a3;
- (RadiosPreferences)init;
- (RadiosPreferences)initWithQueue:(id)a3;
- (RadiosPreferencesDelegate)delegate;
- (__SCPreferences)copySCPrefs:(BOOL)a3;
- (void)copyValueForKey:(id)a3;
- (void)copyValueWithLockForKey:(id)a3;
- (void)dealloc;
- (void)initializeSCPrefs;
- (void)notifyTarget:(unsigned int)a3;
- (void)refresh;
- (void)release;
- (void)setAirplaneMode:(BOOL)a3;
- (void)setAirplaneModeInNSS:(BOOL)a3;
- (void)setAirplaneModeWithoutMirroring:(BOOL)a3;
- (void)setCallback:(void *)a3 withContext:(id *)a4;
- (void)setDelegate:(id)a3;
- (void)setNotifyForExternalChangeOnly:(BOOL)a3;
- (void)setTelephonyState:(BOOL)a3 fromBundleID:(id)a4;
- (void)setValue:(void *)a3 forKey:(id)a4;
@end

@implementation RadiosPreferences

- (RadiosPreferences)initWithQueue:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)RadiosPreferences;
  v4 = [(RadiosPreferences *)&v7 init];
  if (v4)
  {
    pthread_mutex_lock(&__sValidObjectsLock);
    Mutable = (__CFSet *)__sValidObjects;
    if (!__sValidObjects)
    {
      Mutable = CFSetCreateMutable(0, 0, 0);
      __sValidObjects = (uint64_t)Mutable;
    }
    CFSetAddValue(Mutable, v4);
    pthread_mutex_unlock(&__sValidObjectsLock);
    v4->_dispatchQueue = (OS_dispatch_queue *)a3;
    v4->radios_prefs_log = (OS_os_log *)os_log_create("com.apple.AppSupport", "RadiosPreferences");
    [(RadiosPreferences *)v4 initializeSCPrefs];
    v4->_isCachedAirplaneModeValid = 0;
  }
  return v4;
}

- (RadiosPreferences)init
{
  return [(RadiosPreferences *)self initWithQueue:MEMORY[0x1E4F14428]];
}

- (void)release
{
  pthread_mutex_lock(&__sValidObjectsLock);
  if ([(RadiosPreferences *)self retainCount] == 1 && __sValidObjects) {
    CFSetRemoveValue((CFMutableSetRef)__sValidObjects, self);
  }
  pthread_mutex_unlock(&__sValidObjectsLock);
  v3.receiver = self;
  v3.super_class = (Class)RadiosPreferences;
  [(RadiosPreferences *)&v3 release];
}

- (void)dealloc
{
  prefs = self->_prefs;
  if (prefs)
  {
    SCPreferencesSetDispatchQueue(prefs, 0);
    CFRelease(self->_prefs);
  }

  v4.receiver = self;
  v4.super_class = (Class)RadiosPreferences;
  [(RadiosPreferences *)&v4 dealloc];
}

- (BOOL)airplaneMode
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (!self->_isCachedAirplaneModeValid)
  {
    CFBooleanRef v3 = [(RadiosPreferences *)self copyValueForKey:@"AirplaneMode"];
    CFTypeID TypeID = CFBooleanGetTypeID();
    if (v3)
    {
      if (CFGetTypeID(v3) == TypeID) {
        self->_cachedAirplaneMode = CFBooleanGetValue(v3) != 0;
      }
      self->_isCachedAirplaneModeValid = 1;
      CFRelease(v3);
    }
    else
    {
      self->_isCachedAirplaneModeValid = 1;
    }
  }
  radios_prefs_log = self->radios_prefs_log;
  if (os_log_type_enabled(radios_prefs_log, OS_LOG_TYPE_DEFAULT))
  {
    if (self->_cachedAirplaneMode) {
      v6 = "On";
    }
    else {
      v6 = "Off";
    }
    int v8 = 136315138;
    v9 = v6;
    _os_log_impl(&dword_18FB7F000, radios_prefs_log, OS_LOG_TYPE_DEFAULT, "Airplane Mode is: %s", (uint8_t *)&v8, 0xCu);
  }
  return self->_cachedAirplaneMode;
}

+ (BOOL)shouldMirrorAirplaneMode
{
  char v7 = 0;
  if (NanoPreferencesSyncLibraryCore())
  {
    uint64_t v9 = 0;
    uint64_t v10 = &v9;
    uint64_t v11 = 0x3052000000;
    v12 = __Block_byref_object_copy__0;
    v13 = __Block_byref_object_dispose__0;
    v2 = (objc_class *)getNPSDomainAccessorClass_softClass;
    uint64_t v14 = getNPSDomainAccessorClass_softClass;
    if (!getNPSDomainAccessorClass_softClass)
    {
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __getNPSDomainAccessorClass_block_invoke;
      v8[3] = &unk_1E5669188;
      v8[4] = &v9;
      __getNPSDomainAccessorClass_block_invoke((uint64_t)v8);
      v2 = (objc_class *)v10[5];
    }
    _Block_object_dispose(&v9, 8);
    CFBooleanRef v3 = (void *)[[v2 alloc] initWithDomain:@"com.apple.nano"];
    if (v3)
    {
      objc_super v4 = v3;
      char v5 = [v3 BOOLForKey:@"mirror-airplane" keyExistsAndHasValidFormat:&v7];

      if (v7) {
        LOBYTE(v3) = v5;
      }
      else {
        LOBYTE(v3) = 0;
      }
    }
  }
  else
  {
    NSLog((NSString *)@"Class NPSDomainAccessor could not be loaded.");
    LOBYTE(v3) = 0;
  }
  return (char)v3;
}

- (void)setAirplaneMode:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    char v5 = (void *)[MEMORY[0x1E4F29060] callStackSymbols];
    radios_prefs_log = self->radios_prefs_log;
    if (os_log_type_enabled(radios_prefs_log, OS_LOG_TYPE_DEFAULT))
    {
      v7[0] = 67109378;
      v7[1] = 1;
      __int16 v8 = 2114;
      uint64_t v9 = [v5 componentsJoinedByString:@"\n"];
      _os_log_impl(&dword_18FB7F000, radios_prefs_log, OS_LOG_TYPE_DEFAULT, "Setting airplane mode enabled: %i, backtrace:\n%{public}@", (uint8_t *)v7, 0x12u);
    }
  }
  if ([(id)objc_opt_class() shouldMirrorAirplaneMode]) {
    [(RadiosPreferences *)self setAirplaneModeInNSS:v3];
  }
  else {
    [(RadiosPreferences *)self setAirplaneModeWithoutMirroring:v3];
  }
}

- (void)setAirplaneModeInNSS:(BOOL)a3
{
  BOOL v3 = a3;
  if (NanoSystemSettingsLibraryCore())
  {
    uint64_t v13 = 0;
    uint64_t v14 = &v13;
    uint64_t v15 = 0x3052000000;
    v16 = __Block_byref_object_copy__0;
    v17 = __Block_byref_object_dispose__0;
    uint64_t v18 = 0;
    char v5 = dispatch_semaphore_create(0);
    v6 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.AppSupport.AirplaneMode.NSSManager", v6);
    uint64_t v20 = 0;
    v21 = &v20;
    uint64_t v22 = 0x3052000000;
    v23 = __Block_byref_object_copy__0;
    v24 = __Block_byref_object_dispose__0;
    __int16 v8 = (objc_class *)getNSSManagerClass_softClass;
    uint64_t v25 = getNSSManagerClass_softClass;
    if (!getNSSManagerClass_softClass)
    {
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __getNSSManagerClass_block_invoke;
      v19[3] = &unk_1E5669188;
      v19[4] = &v20;
      __getNSSManagerClass_block_invoke((uint64_t)v19);
      __int16 v8 = (objc_class *)v21[5];
    }
    _Block_object_dispose(&v20, 8);
    uint64_t v9 = (void *)[[v8 alloc] initWithQueue:v7];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __42__RadiosPreferences_setAirplaneModeInNSS___block_invoke;
    v12[3] = &unk_1E5669250;
    v12[4] = v5;
    v12[5] = &v13;
    [v9 enableAirplaneMode:v3 completionHandler:v12];
    dispatch_time_t v10 = dispatch_time(0, 5000000000);
    if (dispatch_semaphore_wait(v5, v10) >= 1)
    {
      radios_prefs_log = self->radios_prefs_log;
      if (os_log_type_enabled(radios_prefs_log, OS_LOG_TYPE_FAULT)) {
        -[RadiosPreferences setAirplaneModeInNSS:](v3, radios_prefs_log);
      }
    }

    if (v14[5]) {
      [(RadiosPreferences *)self setAirplaneModeWithoutMirroring:v3];
    }
    _Block_object_dispose(&v13, 8);
  }
  else
  {
    NSLog((NSString *)@"Class NSSManager could not be loaded.");
    [(RadiosPreferences *)self setAirplaneModeWithoutMirroring:v3];
  }
}

intptr_t __42__RadiosPreferences_setAirplaneModeInNSS___block_invoke(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)setAirplaneModeWithoutMirroring:(BOOL)a3
{
  char v5 = (void *)MEMORY[0x1E4F1CFD0];
  if (!a3) {
    char v5 = (void *)MEMORY[0x1E4F1CFC8];
  }
  [(RadiosPreferences *)self setValue:*v5 forKey:@"AirplaneMode"];
  self->_cachedAirplaneMode = a3;
  self->_isCachedAirplaneModeValid = 1;
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"RadiosPreferencesAirplaneModeDidChangeNotification", 0, 0, 1u);
}

- (BOOL)telephonyStateWithBundleIdentifierOut:(id *)a3
{
  objc_super v4 = [(RadiosPreferences *)self copyValueWithLockForKey:@"TelephonyState"];
  CFTypeID TypeID = CFDictionaryGetTypeID();
  if (v4)
  {
    if (CFGetTypeID(v4) == TypeID)
    {
      char v6 = objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", @"TelephonyEnabled"), "BOOLValue");
      dispatch_queue_t v7 = (void *)[v4 objectForKeyedSubscript:@"bundle_identifier"];
    }
    else
    {
      dispatch_queue_t v7 = 0;
      char v6 = 1;
    }
    *a3 = v7;
    CFRelease(v4);
  }
  else
  {
    *a3 = 0;
    return 1;
  }
  return v6;
}

- (void)setTelephonyState:(BOOL)a3 fromBundleID:(id)a4
{
  BOOL v5 = a3;
  v17[2] = *MEMORY[0x1E4F143B8];
  v16[0] = @"TelephonyEnabled";
  v16[1] = @"bundle_identifier";
  v17[0] = objc_msgSend(NSNumber, "numberWithBool:");
  v17[1] = a4;
  -[RadiosPreferences setValue:forKey:](self, "setValue:forKey:", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2], @"TelephonyState");
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"RadiosPreferencesAirplaneModeDidChangeNotification", 0, 0, 1u);
  [a4 UTF8String];
  ct_green_tea_logger_create();
  CTGreenTeaOsLogHandle = getCTGreenTeaOsLogHandle();
  if (CTGreenTeaOsLogHandle)
  {
    uint64_t v9 = CTGreenTeaOsLogHandle;
    if (os_log_type_enabled(CTGreenTeaOsLogHandle, OS_LOG_TYPE_INFO))
    {
      dispatch_time_t v10 = @"On";
      if (v5) {
        uint64_t v11 = @"Off";
      }
      else {
        uint64_t v11 = @"On";
      }
      if (!v5) {
        dispatch_time_t v10 = @"Off";
      }
      int v12 = 138412546;
      uint64_t v13 = v11;
      __int16 v14 = 2112;
      uint64_t v15 = v10;
      _os_log_impl(&dword_18FB7F000, v9, OS_LOG_TYPE_INFO, "Cellular Enabled: %@ ==>> %@", (uint8_t *)&v12, 0x16u);
    }
  }
  ct_green_tea_logger_destroy();
}

- (void)refresh
{
  self->_isCachedAirplaneModeValid = 0;
}

- (__SCPreferences)copySCPrefs:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  CFStringRef v5 = (const __CFString *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B50], "mainBundle"), "bundleIdentifier");
  if (!v5) {
    CFStringRef v5 = (const __CFString *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28F80], "processInfo"), "processName");
  }
  CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  if (v3) {
    SCPreferencesRef v7 = SCPreferencesCreateWithAuthorization(v6, v5, @"com.apple.radios.plist", 0);
  }
  else {
    SCPreferencesRef v7 = SCPreferencesCreate(v6, v5, @"com.apple.radios.plist");
  }
  __int16 v8 = v7;
  radios_prefs_log = self->radios_prefs_log;
  BOOL v10 = os_log_type_enabled(radios_prefs_log, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      uint64_t v11 = "";
      if (v3) {
        uint64_t v11 = "WithAuthorization";
      }
      int v18 = 136315138;
      v19 = v11;
      int v12 = "SCPreferencesCreate%s success!";
      uint64_t v13 = radios_prefs_log;
      uint32_t v14 = 12;
      goto LABEL_16;
    }
  }
  else if (v10)
  {
    if (v3) {
      uint64_t v15 = "WithAuthorization";
    }
    else {
      uint64_t v15 = "";
    }
    int v16 = SCError();
    int v18 = 136315394;
    v19 = v15;
    __int16 v20 = 2080;
    v21 = SCErrorString(v16);
    int v12 = "SCPreferencesCreate%s failed, %s";
    uint64_t v13 = radios_prefs_log;
    uint32_t v14 = 22;
LABEL_16:
    _os_log_impl(&dword_18FB7F000, v13, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v18, v14);
  }
  return v8;
}

- (void)initializeSCPrefs
{
  self->_prefs = [(RadiosPreferences *)self copySCPrefs:0];
  v3[0] = 0;
  long long v4 = 0u;
  uint64_t v5 = 0;
  v3[1] = self;
  [(RadiosPreferences *)self setCallback:RadioPreferencesCallback withContext:v3];
  SCPreferencesSetDispatchQueue(self->_prefs, (dispatch_queue_t)self->_dispatchQueue);
}

- (void)notifyTarget:(unsigned int)a3
{
  if ((a3 & 2) != 0)
  {
    if (![(RadiosPreferences *)self notifyForExternalChangeOnly]
      || !self->_applySkipCount)
    {
      if (self->_delegate)
      {
        [(RadiosPreferences *)self refresh];
        [(RadiosPreferencesDelegate *)self->_delegate airplaneModeChanged];
      }
    }
    int applySkipCount = self->_applySkipCount;
    BOOL v5 = __OFSUB__(applySkipCount, 1);
    int v6 = applySkipCount - 1;
    if (v6 < 0 == v5) {
      self->_int applySkipCount = v6;
    }
  }
}

- (void)copyValueForKey:(id)a3
{
  long long v4 = [(RadiosPreferences *)self copySCPrefs:1];
  if (!v4) {
    return 0;
  }
  BOOL v5 = v4;
  CFPropertyListRef Value = SCPreferencesGetValue(v4, (CFStringRef)a3);
  SCPreferencesRef v7 = (void *)Value;
  if (Value) {
    CFRetain(Value);
  }
  CFRelease(v5);
  return v7;
}

- (void)copyValueWithLockForKey:(id)a3
{
  long long v4 = [(RadiosPreferences *)self copySCPrefs:1];
  if (!v4) {
    return 0;
  }
  BOOL v5 = v4;
  if (SCPreferencesLock(v4, 1u) || SCError() == 3005 && (SCPreferencesSynchronize(v5), SCPreferencesLock(v5, 1u)))
  {
    CFPropertyListRef Value = SCPreferencesGetValue(v5, (CFStringRef)a3);
    SCPreferencesRef v7 = (void *)Value;
    if (Value) {
      CFRetain(Value);
    }
    SCPreferencesUnlock(v5);
  }
  else
  {
    SCPreferencesRef v7 = 0;
  }
  CFRelease(v5);
  return v7;
}

- (void)setValue:(void *)a3 forKey:(id)a4
{
  SCPreferencesRef v7 = [(RadiosPreferences *)self copySCPrefs:1];
  if (v7)
  {
    __int16 v8 = v7;
    if (SCPreferencesLock(v7, 1u) || SCError() == 3005 && (SCPreferencesSynchronize(v8), SCPreferencesLock(v8, 1u)))
    {
      if (SCPreferencesSetValue(v8, (CFStringRef)a4, a3)
        && SCPreferencesCommitChanges(v8)
        && SCPreferencesApplyChanges(v8))
      {
        ++self->_applySkipCount;
      }
    }
    SCPreferencesUnlock(v8);
    CFRelease(v8);
  }
}

- (void)setCallback:(void *)a3 withContext:(id *)a4
{
}

- (RadiosPreferencesDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (RadiosPreferencesDelegate *)a3;
}

- (BOOL)notifyForExternalChangeOnly
{
  return self->notifyForExternalChangeOnly;
}

- (void)setNotifyForExternalChangeOnly:(BOOL)a3
{
  self->notifyForExternalChangeOnly = a3;
}

- (void)setAirplaneModeInNSS:(char)a1 .cold.1(char a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_fault_impl(&dword_18FB7F000, a2, OS_LOG_TYPE_FAULT, "Call to NanoSystemSettings to %d airplane mode timed out", (uint8_t *)v2, 8u);
}

@end