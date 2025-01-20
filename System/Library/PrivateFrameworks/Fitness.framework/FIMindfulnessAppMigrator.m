@interface FIMindfulnessAppMigrator
- (FIMindfulnessAppMigrator)init;
- (FIMindfulnessAppMigrator)initWithContainer:(id)a3;
- (int64_t)_integerForKey:(id)a3 exists:(BOOL *)a4;
- (void)_removeObjectForKey:(id)a3;
- (void)_setInteger:(int64_t)a3 key:(id)a4;
- (void)_synchronize;
- (void)migrateIfNeeded;
@end

@implementation FIMindfulnessAppMigrator

- (FIMindfulnessAppMigrator)init
{
  return [(FIMindfulnessAppMigrator *)self initWithContainer:0];
}

- (FIMindfulnessAppMigrator)initWithContainer:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FIMindfulnessAppMigrator;
  v6 = [(FIMindfulnessAppMigrator *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_container, a3);
  }

  return v7;
}

- (void)migrateIfNeeded
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  unsigned __int8 v28 = 0;
  int64_t v3 = [(FIMindfulnessAppMigrator *)self _integerForKey:@"MigratedBreathRate" exists:&v28];
  unsigned __int8 v27 = 0;
  int64_t v4 = [(FIMindfulnessAppMigrator *)self _integerForKey:@"MigratedHapticLevel" exists:&v27];
  if (v28 | v27)
  {
    int64_t v6 = v4;
    unsigned __int8 v26 = 0;
    int64_t v7 = [(FIMindfulnessAppMigrator *)self _integerForKey:@"BreathRate" exists:&v26];
    unsigned __int8 v25 = 0;
    int64_t v8 = [(FIMindfulnessAppMigrator *)self _integerForKey:@"HapticLevel" exists:&v25];
    int v9 = v26;
    if (v26 && v25)
    {
      int64_t v10 = v8;
      _HKInitializeLogging();
      v11 = *MEMORY[0x263F098F0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098F0], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        *(void *)v31 = v7;
        *(_WORD *)&v31[8] = 2048;
        int64_t v32 = v10;
        _os_log_impl(&dword_21C74B000, v11, OS_LOG_TYPE_DEFAULT, "[FIMindfulnessAppMigrator] Values already exist (BreathRate: %ld, HapticLevel: %ld)", buf, 0x16u);
      }
      [(FIMindfulnessAppMigrator *)self _removeObjectForKey:@"MigratedBreathRate"];
      [(FIMindfulnessAppMigrator *)self _removeObjectForKey:@"MigratedHapticLevel"];
    }
    else
    {
      int v12 = v28;
      _HKInitializeLogging();
      v13 = *MEMORY[0x263F098F0];
      BOOL v14 = os_log_type_enabled((os_log_t)*MEMORY[0x263F098F0], OS_LOG_TYPE_DEFAULT);
      if (v9 || !v12)
      {
        v15 = (os_log_t *)MEMORY[0x263F098F0];
        if (v14)
        {
          *(_DWORD *)buf = 67109376;
          *(_DWORD *)v31 = v26;
          *(_WORD *)&v31[4] = 1024;
          *(_DWORD *)&v31[6] = v28;
          _os_log_impl(&dword_21C74B000, v13, OS_LOG_TYPE_DEFAULT, "[FIMindfulnessAppMigrator] Not migrating breath rate (existing: %{BOOL}d, migrated: %{BOOL}d)", buf, 0xEu);
        }
      }
      else
      {
        if (v14)
        {
          *(_DWORD *)buf = 134217984;
          *(void *)v31 = v3;
          _os_log_impl(&dword_21C74B000, v13, OS_LOG_TYPE_DEFAULT, "[FIMindfulnessAppMigrator] Migrating BreatheRate: %ld", buf, 0xCu);
        }
        [(FIMindfulnessAppMigrator *)self _setInteger:v3 key:@"BreathRate"];
        v15 = (os_log_t *)MEMORY[0x263F098F0];
      }
      int v16 = v25;
      int v17 = v27;
      _HKInitializeLogging();
      v18 = *v15;
      BOOL v19 = os_log_type_enabled(*v15, OS_LOG_TYPE_DEFAULT);
      if (v16 || !v17)
      {
        if (v19)
        {
          *(_DWORD *)buf = 67109376;
          *(_DWORD *)v31 = v25;
          *(_WORD *)&v31[4] = 1024;
          *(_DWORD *)&v31[6] = v27;
          _os_log_impl(&dword_21C74B000, v18, OS_LOG_TYPE_DEFAULT, "[FIMindfulnessAppMigrator] Not migrating haptic level (existing: %{BOOL}d, migratedBreathRateExists %{BOOL}d)", buf, 0xEu);
        }
      }
      else
      {
        if (v19)
        {
          *(_DWORD *)buf = 134217984;
          *(void *)v31 = v6;
          _os_log_impl(&dword_21C74B000, v18, OS_LOG_TYPE_DEFAULT, "[FIMindfulnessAppMigrator] Migrating HapticLevel: %ld", buf, 0xCu);
        }
        [(FIMindfulnessAppMigrator *)self _setInteger:v6 key:@"HapticLevel"];
      }
      [(FIMindfulnessAppMigrator *)self _synchronize];
      _HKInitializeLogging();
      v20 = *v15;
      if (os_log_type_enabled(*v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21C74B000, v20, OS_LOG_TYPE_DEFAULT, "[FIMindfulnessAppMigrator] Syncing to Companion", buf, 2u);
      }
      id v21 = objc_alloc_init(MEMORY[0x263F57528]);
      v22 = (void *)MEMORY[0x263EFFA08];
      v29[0] = @"BreathRate";
      v29[1] = @"HapticLevel";
      v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v29 count:2];
      v24 = [v22 setWithArray:v23];
      [v21 synchronizeUserDefaultsDomain:@"com.apple.Mind" keys:v24 container:@"com.apple.Mind"];

      [(FIMindfulnessAppMigrator *)self _removeObjectForKey:@"MigratedBreathRate"];
      [(FIMindfulnessAppMigrator *)self _removeObjectForKey:@"MigratedHapticLevel"];
      notify_post("NanoLifestyleMindfulnessPreferencesChangedNotification");
    }
  }
  else
  {
    _HKInitializeLogging();
    id v5 = *MEMORY[0x263F098F0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098F0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21C74B000, v5, OS_LOG_TYPE_DEFAULT, "[FIMindfulnessAppMigrator] No keys to migrate", buf, 2u);
    }
  }
}

- (int64_t)_integerForKey:(id)a3 exists:(BOOL *)a4
{
  id v6 = a3;
  BOOL v12 = 0;
  if (self->_container)
  {
    int64_t AppIntegerValueWithContainer = _CFPreferencesGetAppIntegerValueWithContainer();
    if (a4) {
LABEL_3:
    }
      *a4 = v12;
  }
  else
  {
    int v9 = [MEMORY[0x263EFFA40] standardUserDefaults];
    int64_t v10 = [v9 objectForKey:v6];

    if (objc_opt_respondsToSelector())
    {
      uint64_t v11 = [v10 integerValue];
      BOOL v12 = v11 != 0;
      if (v11) {
        int64_t AppIntegerValueWithContainer = [v10 integerValue];
      }
      else {
        int64_t AppIntegerValueWithContainer = 0;
      }
    }
    else
    {
      int64_t AppIntegerValueWithContainer = 0;
      BOOL v12 = 0;
    }

    if (a4) {
      goto LABEL_3;
    }
  }

  return AppIntegerValueWithContainer;
}

- (void)_setInteger:(int64_t)a3 key:(id)a4
{
  if (self->_container)
  {
    id v5 = NSNumber;
    id v8 = a4;
    [v5 numberWithInteger:a3];
    _CFPreferencesSetAppValueWithContainer();
  }
  else
  {
    id v6 = (void *)MEMORY[0x263EFFA40];
    id v7 = a4;
    id v8 = [v6 standardUserDefaults];
    [v8 setInteger:a3 forKey:v7];
  }
}

- (void)_removeObjectForKey:(id)a3
{
  if (self->_container)
  {
    id v5 = a3;
    _CFPreferencesSetAppValueWithContainer();
  }
  else
  {
    int64_t v3 = (void *)MEMORY[0x263EFFA40];
    id v4 = a3;
    id v5 = [v3 standardUserDefaults];
    [v5 removeObjectForKey:v4];
  }
}

- (void)_synchronize
{
  if (self->_container)
  {
    MEMORY[0x270EE5658](@"com.apple.Mind");
  }
  else
  {
    id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
    [v2 synchronize];
  }
}

- (void).cxx_destruct
{
}

@end