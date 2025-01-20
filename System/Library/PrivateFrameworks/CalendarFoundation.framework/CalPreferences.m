@interface CalPreferences
+ (id)_debugColorPreferences;
+ (id)getDebugColorNumberForPreference:(id)a3 dark:(BOOL)a4;
+ (id)getDebugColorStringForPreference:(id)a3 dark:(BOOL)a4;
+ (id)log;
+ (void)removeDebugColorPreference:(id)a3 dark:(BOOL)a4;
+ (void)setDebugColorNumberForPreference:(id)a3 value:(id)a4 dark:(BOOL)a5;
+ (void)setDebugColorStringForPreference:(id)a3 value:(id)a4 dark:(BOOL)a5;
- (BOOL)getBooleanPreference:(id)a3 defaultValue:(BOOL)a4;
- (CalPreferences)init;
- (CalPreferences)initWithDomain:(id)a3;
- (CalPreferences)initWithDomain:(id)a3 readOnly:(BOOL)a4;
- (CalPreferences)initWithDomain:(id)a3 store:(id)a4;
- (CalPreferences)initWithDomain:(id)a3 store:(id)a4 readOnly:(BOOL)a5;
- (id)debugColorStringForString:(id)a3 isDark:(BOOL)a4;
- (id)getValueForPreference:(id)a3 expectedClass:(Class)a4;
- (int64_t)getIntegerPreference:(id)a3 defaultValue:(int64_t)a4;
- (void)_preferenceChangedExternally:(id)a3;
- (void)_preferenceChangedInternally:(id)a3;
- (void)_synchronizePreferences;
- (void)dealloc;
- (void)registerReflectionForPreferenceWithNotificationName:(id)a3;
- (void)removePreference:(id)a3 notificationName:(id)a4;
- (void)setBooleanPreference:(id)a3 value:(BOOL)a4 notificationName:(id)a5;
- (void)setIntegerPreference:(id)a3 value:(int64_t)a4 notificationName:(id)a5;
- (void)setValueForPreference:(id)a3 value:(id)a4 notificationName:(id)a5;
- (void)unregisterReflectionForPreferenceWithNotificationName:(id)a3;
@end

@implementation CalPreferences

- (CalPreferences)initWithDomain:(id)a3
{
  return [(CalPreferences *)self initWithDomain:a3 readOnly:0];
}

- (BOOL)getBooleanPreference:(id)a3 defaultValue:(BOOL)a4
{
  id v6 = a3;
  v7 = v6;
  BOOL v10 = a4;
  if (v6 && [v6 length])
  {
    [(CalPreferencesStore *)self->_store getBoolean:&v10 forDomain:self->_domain key:v7];
    a4 = v10;
  }
  else
  {
    v8 = +[CalPreferences log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[CalPreferences getBooleanPreference:defaultValue:]();
    }
  }
  return a4;
}

- (id)getValueForPreference:(id)a3 expectedClass:(Class)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = v6;
  if (!v6 || ![v6 length])
  {
    v9 = +[CalPreferences log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[CalPreferences getBooleanPreference:defaultValue:]();
    }
    goto LABEL_11;
  }
  id v14 = 0;
  [(CalPreferencesStore *)self->_store getValue:&v14 forDomain:self->_domain key:v7];
  v8 = v14;
  v9 = v8;
  if (a4 && v8 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    BOOL v10 = +[CalPreferences log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v12 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v16 = v7;
      __int16 v17 = 2114;
      Class v18 = a4;
      __int16 v19 = 2114;
      v20 = v12;
      id v13 = v12;
      _os_log_error_impl(&dword_190D88000, v10, OS_LOG_TYPE_ERROR, "Unexpected type for preference [%{public}@] encountered.  Expected type: [%{public}@].  Actual type: [%{public}@]", buf, 0x20u);
    }
LABEL_11:

    v9 = 0;
  }

  return v9;
}

- (void)registerReflectionForPreferenceWithNotificationName:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4 && [v4 length])
  {
    +[CalDistributedNotificationCenter addObserver:self selector:sel__preferenceChangedExternally_ name:v5];
    [(NSMutableSet *)self->_registeredNotificationsToReflect addObject:v5];
  }
  else
  {
    id v6 = +[CalPreferences log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[CalPreferences registerReflectionForPreferenceWithNotificationName:]();
    }
  }
}

- (void)setValueForPreference:(id)a3 value:(id)a4 notificationName:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!self->_readOnly)
  {
    if (v8 && [v8 length])
    {
      [(CalPreferencesStore *)self->_store setValue:v9 forDomain:self->_domain key:v8];
      [(CalPreferences *)self _preferenceChangedInternally:v10];
    }
    else
    {
      v11 = +[CalPreferences log];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[CalPreferences getBooleanPreference:defaultValue:]();
      }
    }
  }
}

- (void)_preferenceChangedInternally:(id)a3
{
  name = (__CFString *)a3;
  [(CalPreferences *)self _synchronizePreferences];
  if (name && [(__CFString *)name length])
  {
    id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 postNotificationName:name object:0];

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, name, 0, 0, 1u);
  }
}

- (void)_synchronizePreferences
{
}

- (void)_preferenceChangedExternally:(id)a3
{
  id v5 = a3;
  [(CalPreferences *)self _synchronizePreferences];
  if (v5 && [v5 length])
  {
    id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 postNotificationName:v5 object:0];
  }
}

- (void)setBooleanPreference:(id)a3 value:(BOOL)a4 notificationName:(id)a5
{
  BOOL v6 = a4;
  id v10 = a3;
  id v8 = a5;
  if (v10 && !self->_readOnly && [v10 length])
  {
    id v9 = (void *)MEMORY[0x1E4F1CFD0];
    if (!v6) {
      id v9 = (void *)MEMORY[0x1E4F1CFC8];
    }
    [(CalPreferencesStore *)self->_store setValue:*v9 forDomain:self->_domain key:v10];
    [(CalPreferences *)self _preferenceChangedInternally:v8];
  }
}

+ (id)log
{
  if (log_onceToken != -1) {
    dispatch_once(&log_onceToken, &__block_literal_global_32);
  }
  v2 = (void *)log_log;

  return v2;
}

uint64_t __21__CalPreferences_log__block_invoke()
{
  log_log = (uint64_t)os_log_create("com.apple.calendar", "Preferences");

  return MEMORY[0x1F41817F8]();
}

- (CalPreferences)init
{
  return [(CalPreferences *)self initWithDomain:0];
}

- (CalPreferences)initWithDomain:(id)a3 readOnly:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = +[CalCFPreferencesStore shared];
  id v8 = [(CalPreferences *)self initWithDomain:v6 store:v7 readOnly:v4];

  return v8;
}

- (CalPreferences)initWithDomain:(id)a3 store:(id)a4
{
  return [(CalPreferences *)self initWithDomain:a3 store:a4 readOnly:0];
}

- (CalPreferences)initWithDomain:(id)a3 store:(id)a4 readOnly:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v18.receiver = self;
  v18.super_class = (Class)CalPreferences;
  id v10 = [(CalPreferences *)&v18 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_store, a4);
    v11->_readOnly = a5;
    v12 = (void *)*MEMORY[0x1E4F1D3D8];
    if (v8) {
      v12 = v8;
    }
    id v13 = v12;
    domain = v11->_domain;
    v11->_domain = v13;

    v15 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    registeredNotificationsToReflect = v11->_registeredNotificationsToReflect;
    v11->_registeredNotificationsToReflect = v15;
  }
  return v11;
}

- (void)dealloc
{
  registeredNotificationsToReflect = self->_registeredNotificationsToReflect;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __25__CalPreferences_dealloc__block_invoke;
  v5[3] = &unk_1E56CDBF0;
  v5[4] = self;
  [(NSMutableSet *)registeredNotificationsToReflect enumerateObjectsUsingBlock:v5];
  v4.receiver = self;
  v4.super_class = (Class)CalPreferences;
  [(CalPreferences *)&v4 dealloc];
}

uint64_t __25__CalPreferences_dealloc__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) unregisterReflectionForPreferenceWithNotificationName:a2];
}

- (void)unregisterReflectionForPreferenceWithNotificationName:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4 && [v4 length])
  {
    +[CalDistributedNotificationCenter removeObserver:self name:v5];
    [(NSMutableSet *)self->_registeredNotificationsToReflect removeObject:v5];
  }
  else
  {
    id v6 = +[CalPreferences log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[CalPreferences registerReflectionForPreferenceWithNotificationName:]();
    }
  }
}

- (int64_t)getIntegerPreference:(id)a3 defaultValue:(int64_t)a4
{
  id v6 = a3;
  v7 = v6;
  int64_t v10 = a4;
  if (v6 && [v6 length])
  {
    [(CalPreferencesStore *)self->_store getInteger:&v10 forDomain:self->_domain key:v7];
    a4 = v10;
  }
  else
  {
    id v8 = +[CalPreferences log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[CalPreferences getBooleanPreference:defaultValue:]();
    }
  }
  return a4;
}

- (void)setIntegerPreference:(id)a3 value:(int64_t)a4 notificationName:(id)a5
{
  id v8 = a3;
  int64_t valuePtr = a4;
  id v9 = a5;
  if (v8 && !self->_readOnly && [v8 length])
  {
    CFNumberRef v10 = CFNumberCreate(0, kCFNumberLongType, &valuePtr);
    if (v10)
    {
      CFNumberRef v11 = v10;
      [(CalPreferencesStore *)self->_store setValue:v10 forDomain:self->_domain key:v8];
      CFRelease(v11);
    }
    [(CalPreferences *)self _preferenceChangedInternally:v9];
  }
}

- (void)removePreference:(id)a3 notificationName:(id)a4
{
  if (!self->_readOnly)
  {
    store = self->_store;
    domain = self->_domain;
    id v8 = a4;
    [(CalPreferencesStore *)store setValue:0 forDomain:domain key:a3];
    [(CalPreferences *)self _preferenceChangedInternally:v8];
  }
}

- (id)debugColorStringForString:(id)a3 isDark:(BOOL)a4
{
  id v4 = @"DebugColorLight-%@";
  if (a4) {
    id v4 = @"DebugColorDark-%@";
  }
  id v5 = objc_msgSend(NSString, "stringWithFormat:", v4, a3);

  return v5;
}

+ (id)_debugColorPreferences
{
  if (_debugColorPreferences_onceToken != -1) {
    dispatch_once(&_debugColorPreferences_onceToken, &__block_literal_global_95);
  }
  v2 = (void *)_debugColorPreferences__preferences;

  return v2;
}

uint64_t __40__CalPreferences__debugColorPreferences__block_invoke()
{
  _debugColorPreferences__preferences = [[CalPreferences alloc] initWithDomain:@"com.apple.mobilecal"];

  return MEMORY[0x1F41817F8]();
}

+ (id)getDebugColorStringForPreference:(id)a3 dark:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [a1 _debugColorPreferences];
  id v8 = [v7 debugColorStringForString:v6 isDark:v4];

  id v9 = [v7 getValueForPreference:v8 expectedClass:objc_opt_class()];

  return v9;
}

+ (void)setDebugColorStringForPreference:(id)a3 value:(id)a4 dark:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  id v11 = [a1 _debugColorPreferences];
  CFNumberRef v10 = [v11 debugColorStringForString:v9 isDark:v5];

  [v11 setValueForPreference:v10 value:v8 notificationName:0];
}

+ (id)getDebugColorNumberForPreference:(id)a3 dark:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [a1 _debugColorPreferences];
  id v8 = [v7 debugColorStringForString:v6 isDark:v4];

  id v9 = [v7 getValueForPreference:v8 expectedClass:objc_opt_class()];

  return v9;
}

+ (void)setDebugColorNumberForPreference:(id)a3 value:(id)a4 dark:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  id v11 = [a1 _debugColorPreferences];
  CFNumberRef v10 = [v11 debugColorStringForString:v9 isDark:v5];

  [v11 setValueForPreference:v10 value:v8 notificationName:0];
}

+ (void)removeDebugColorPreference:(id)a3 dark:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v8 = [a1 _debugColorPreferences];
  v7 = [v8 debugColorStringForString:v6 isDark:v4];

  [v8 removePreference:v7 notificationName:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registeredNotificationsToReflect, 0);
  objc_storeStrong((id *)&self->_domain, 0);

  objc_storeStrong((id *)&self->_store, 0);
}

- (void)registerReflectionForPreferenceWithNotificationName:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4_1(&dword_190D88000, v0, v1, "'name' should be non-nil and non-empty", v2, v3, v4, v5, v6);
}

- (void)getBooleanPreference:defaultValue:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4_1(&dword_190D88000, v0, v1, "'preferenceName' should be non-nil and non-empty", v2, v3, v4, v5, v6);
}

@end