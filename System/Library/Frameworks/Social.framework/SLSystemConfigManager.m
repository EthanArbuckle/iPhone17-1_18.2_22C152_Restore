@interface SLSystemConfigManager
+ (id)sharedInstanceForCallbackWhileLocked:(void *)a3;
+ (id)sharedInstanceForServiceType:(id)a3;
- (SLSystemConfigManager)initWithServiceType:(id)a3;
- (id)cachedUsername;
- (void)_getValueForKey:(id)a3;
- (void)_initializeSystemConfigPrefs:(id)a3;
- (void)_keepAlive;
- (void)_notifyTarget:(unsigned int)a3;
- (void)_setCallback:(void *)a3 withContext:(id *)a4;
- (void)_setValue:(void *)a3 forKey:(id)a4;
- (void)_synchronize;
- (void)_tearDown;
- (void)dealloc;
- (void)setCachedUsername:(id)a3;
@end

@implementation SLSystemConfigManager

+ (id)sharedInstanceForServiceType:(id)a3
{
  id v3 = a3;
  pthread_mutex_lock(&__SystemConfigManagerMutex);
  if (__sharedSLSystemConfigManagers)
  {
    v4 = [(id)__sharedSLSystemConfigManagers objectForKey:v3];
    if (v4) {
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:1];
    v6 = (void *)__sharedSLSystemConfigManagers;
    __sharedSLSystemConfigManagers = v5;
  }
  v4 = [[SLSystemConfigManager alloc] initWithServiceType:v3];
  [(id)__sharedSLSystemConfigManagers setObject:v4 forKey:v3];
LABEL_6:
  pthread_mutex_unlock(&__SystemConfigManagerMutex);
  [(SLSystemConfigManager *)v4 _keepAlive];

  return v4;
}

+ (id)sharedInstanceForCallbackWhileLocked:(void *)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = (id)__sharedSLSystemConfigManagers;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        if (*(void **)(*((void *)&v11 + 1) + 8 * i) == a3)
        {
          v9 = a3;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  v9 = 0;
LABEL_11:

  return v9;
}

- (SLSystemConfigManager)initWithServiceType:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SLSystemConfigManager;
  uint64_t v6 = [(SLSystemConfigManager *)&v10 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_serviceType, a3);
    if ([v5 isEqualToString:@"com.apple.social.twitter"])
    {
      v8 = @"com.apple.twitter.plist";
LABEL_8:
      [(SLSystemConfigManager *)v7 _initializeSystemConfigPrefs:v8];
      goto LABEL_9;
    }
    if ([v5 isEqualToString:@"com.apple.social.sinaweibo"])
    {
      v8 = @"com.apple.sinaweibo.plist";
      goto LABEL_8;
    }
    if ([v5 isEqualToString:@"com.apple.social.facebook"])
    {
      v8 = @"com.apple.facebook.plist";
      goto LABEL_8;
    }
  }
LABEL_9:

  return v7;
}

- (void)dealloc
{
  prefs = (const __SCPreferences *)self->_prefs;
  if (prefs)
  {
    Main = CFRunLoopGetMain();
    SCPreferencesUnscheduleFromRunLoop(prefs, Main, (CFStringRef)*MEMORY[0x1E4F1D418]);
    CFRelease(self->_prefs);
  }
  v5.receiver = self;
  v5.super_class = (Class)SLSystemConfigManager;
  [(SLSystemConfigManager *)&v5 dealloc];
}

- (void)setCachedUsername:(id)a3
{
  if (a3) {
    [(SLSystemConfigManager *)self _setValue:a3 forKey:@"SLCachedUsername"];
  }
}

- (id)cachedUsername
{
  return [(SLSystemConfigManager *)self _getValueForKey:@"SLCachedUsername"];
}

- (void)_initializeSystemConfigPrefs:(id)a3
{
  id v4 = (__CFString *)a3;
  objc_super v5 = [MEMORY[0x1E4F28B50] mainBundle];
  uint64_t v6 = [v5 bundleIdentifier];

  if (!v6)
  {
    uint64_t v7 = [MEMORY[0x1E4F28F80] processInfo];
    uint64_t v6 = [v7 processName];
  }
  SCPreferencesRef v8 = SCPreferencesCreateWithAuthorization((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v6, v4, 0);
  self->_prefs = v8;
  Main = CFRunLoopGetMain();
  SCPreferencesScheduleWithRunLoop(v8, Main, (CFStringRef)*MEMORY[0x1E4F1D418]);
  v10[0] = 0;
  long long v11 = 0u;
  uint64_t v12 = 0;
  v10[1] = self;
  [(SLSystemConfigManager *)self _setCallback:_SLSystemConfigManagerPreferencesCallback withContext:v10];
}

- (void)_keepAlive
{
  pthread_mutex_lock(&__SystemConfigManagerMutex);
  +[SLSystemConfigManager cancelPreviousPerformRequestsWithTarget:self selector:sel__tearDown object:0];
  [(SLSystemConfigManager *)self performSelector:sel__tearDown withObject:0 afterDelay:3.0];

  pthread_mutex_unlock(&__SystemConfigManagerMutex);
}

- (void)_tearDown
{
  pthread_mutex_lock(&__SystemConfigManagerMutex);
  id v4 = [(id)__sharedSLSystemConfigManagers objectForKey:self->_serviceType];
  if (v4) {
    [(id)__sharedSLSystemConfigManagers removeObjectForKey:self->_serviceType];
  }
  if (![(id)__sharedSLSystemConfigManagers count])
  {
    id v3 = (void *)__sharedSLSystemConfigManagers;
    __sharedSLSystemConfigManagers = 0;
  }
  pthread_mutex_unlock(&__SystemConfigManagerMutex);
}

- (void)_notifyTarget:(unsigned int)a3
{
  if ((a3 & 2) != 0)
  {
    int applySkipCount = self->_applySkipCount;
    if (!applySkipCount)
    {
      [(SLSystemConfigManager *)self _refresh];
      [(SLSystemConfigManager *)self _synchronize];
      int applySkipCount = self->_applySkipCount;
    }
    BOOL v5 = __OFSUB__(applySkipCount, 1);
    int v6 = applySkipCount - 1;
    if (v6 < 0 == v5) {
      self->_int applySkipCount = v6;
    }
  }
}

- (void)_synchronize
{
}

- (void)_getValueForKey:(id)a3
{
  return (void *)SCPreferencesGetValue((SCPreferencesRef)self->_prefs, (CFStringRef)a3);
}

- (void)_setValue:(void *)a3 forKey:(id)a4
{
  key = (__CFString *)a4;
  if (SCPreferencesLock((SCPreferencesRef)self->_prefs, 1u)) {
    goto LABEL_16;
  }
  if (SCError() == 1006) {
    -[SLSystemConfigManager _setValue:forKey:]();
  }
  if (SCError() == 3005)
  {
    SCPreferencesSynchronize((SCPreferencesRef)self->_prefs);
    if (SCPreferencesLock((SCPreferencesRef)self->_prefs, 1u))
    {
LABEL_16:
      if (SCPreferencesSetValue((SCPreferencesRef)self->_prefs, key, a3)
        && SCPreferencesCommitChanges((SCPreferencesRef)self->_prefs)
        && SCPreferencesApplyChanges((SCPreferencesRef)self->_prefs))
      {
        ++self->_applySkipCount;
        [(SLSystemConfigManager *)self _synchronize];
      }
      SCPreferencesUnlock((SCPreferencesRef)self->_prefs);
    }
  }
}

- (void)_setCallback:(void *)a3 withContext:(id *)a4
{
}

- (void).cxx_destruct
{
}

- (void)_setValue:forKey:.cold.1()
{
  __assert_rtn("-[SLSystemConfigManager _setValue:forKey:]", "SLSystemConfigManager.m", 221, "success || SCError() != kSCStatusLocked");
}

@end