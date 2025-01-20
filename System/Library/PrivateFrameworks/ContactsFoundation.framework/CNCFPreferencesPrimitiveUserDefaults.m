@interface CNCFPreferencesPrimitiveUserDefaults
- (BOOL)primitiveBoolValueForKey:(id)a3 keyExists:(BOOL *)a4;
- (BOOL)synchronize;
- (CNCFPreferencesPrimitiveUserDefaults)initWithApplicationID:(id)a3;
- (__CFString)CFApplicationID;
- (id)primitiveObjectForKey:(id)a3;
- (int64_t)primitiveIntegerValueForKey:(id)a3 keyExists:(BOOL *)a4;
- (void)primitiveRemoveObjectForKey:(id)a3;
- (void)setPrimitiveObject:(id)a3 forKey:(id)a4;
- (void)setupAutosync;
@end

@implementation CNCFPreferencesPrimitiveUserDefaults

- (int64_t)primitiveIntegerValueForKey:(id)a3 keyExists:(BOOL *)a4
{
  v6 = (__CFString *)a3;
  CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(v6, [(CNCFPreferencesPrimitiveUserDefaults *)self CFApplicationID], (Boolean *)a4);

  return AppIntegerValue;
}

- (id)primitiveObjectForKey:(id)a3
{
  v4 = (__CFString *)a3;
  v5 = (void *)CFPreferencesCopyAppValue(v4, [(CNCFPreferencesPrimitiveUserDefaults *)self CFApplicationID]);

  return v5;
}

- (BOOL)primitiveBoolValueForKey:(id)a3 keyExists:(BOOL *)a4
{
  v6 = (__CFString *)a3;
  LODWORD(a4) = CFPreferencesGetAppBooleanValue(v6, [(CNCFPreferencesPrimitiveUserDefaults *)self CFApplicationID], (Boolean *)a4);

  return a4 != 0;
}

- (__CFString)CFApplicationID
{
  if (self->_applicationID) {
    return (__CFString *)self->_applicationID;
  }
  else {
    return (__CFString *)*MEMORY[0x1E4F1D3D8];
  }
}

- (CNCFPreferencesPrimitiveUserDefaults)initWithApplicationID:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNCFPreferencesPrimitiveUserDefaults;
  v5 = [(CNCFPreferencesPrimitiveUserDefaults *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    applicationID = v5->_applicationID;
    v5->_applicationID = (NSString *)v6;

    v5->_autosyncTimerIsActive = 0;
    v8 = v5;
  }

  return v5;
}

- (void)setPrimitiveObject:(id)a3 forKey:(id)a4
{
  uint64_t v6 = (__CFString *)a4;
  id value = a3;
  CFPreferencesSetAppValue(v6, value, [(CNCFPreferencesPrimitiveUserDefaults *)self CFApplicationID]);
}

- (void)primitiveRemoveObjectForKey:(id)a3
{
  key = (__CFString *)a3;
  CFPreferencesSetAppValue(key, 0, [(CNCFPreferencesPrimitiveUserDefaults *)self CFApplicationID]);
}

- (BOOL)synchronize
{
  return CFPreferencesAppSynchronize([(CNCFPreferencesPrimitiveUserDefaults *)self CFApplicationID]) != 0;
}

- (void)setupAutosync
{
  uint64_t v2 = 0;
  atomic_compare_exchange_strong(&self->_autosyncTimerIsActive, (unint64_t *)&v2, 0xFFFFFFFFFFFFFFFFLL);
  if (!v2)
  {
    dispatch_time_t v4 = dispatch_time(0, 15000000000);
    v5 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __53__CNCFPreferencesPrimitiveUserDefaults_setupAutosync__block_invoke;
    block[3] = &unk_1E569F9D8;
    block[4] = self;
    dispatch_after(v4, v5, block);
  }
}

uint64_t __53__CNCFPreferencesPrimitiveUserDefaults_setupAutosync__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 16) = 0;
  return [*(id *)(a1 + 32) synchronize];
}

- (void).cxx_destruct
{
}

@end