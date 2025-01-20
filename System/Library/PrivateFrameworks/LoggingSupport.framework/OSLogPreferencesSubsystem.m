@interface OSLogPreferencesSubsystem
- (BOOL)_signpostAllowStreamingForCategory:(id)a3;
- (BOOL)_signpostBacktracesEnabledForCategory:(id)a3;
- (BOOL)_signpostEnabledForCategory:(id)a3;
- (BOOL)_signpostPersistedForCategory:(id)a3;
- (BOOL)isLocked;
- (NSArray)categories;
- (NSString)name;
- (OSLogPreferencesSubsystem)initWithName:(id)a3;
- (id)_levelPrefsForCategory:(id)a3;
- (id)_prefsForCategory:(id)a3;
- (int64_t)_defaultEnabledLevelForCategory:(id)a3;
- (int64_t)_defaultPersistedLevelForCategory:(id)a3;
- (int64_t)_enabledLevelForCategory:(id)a3;
- (int64_t)_persistedLevelForCategory:(id)a3;
- (int64_t)defaultEnabledLevel;
- (int64_t)defaultPersistedLevel;
- (int64_t)effectiveEnabledLevel;
- (int64_t)effectivePersistedLevel;
- (int64_t)enabledLevel;
- (int64_t)persistedLevel;
- (void)_resetCategory:(id)a3;
- (void)_setEnabledLevel:(int64_t)a3 forCategory:(id)a4;
- (void)_setPersistedLevel:(int64_t)a3 forCategory:(id)a4;
- (void)_setSignpostAllowStreaming:(BOOL)a3 forCategory:(id)a4;
- (void)_setSignpostBacktracesEnabled:(BOOL)a3 forCategory:(id)a4;
- (void)_setSignpostEnabled:(BOOL)a3 forCategory:(id)a4;
- (void)_setSignpostPersisted:(BOOL)a3 forCategory:(id)a4;
- (void)reset;
- (void)resetAll;
- (void)setEnabledLevel:(int64_t)a3;
- (void)setPersistedLevel:(int64_t)a3;
@end

@implementation OSLogPreferencesSubsystem

- (BOOL)isLocked
{
  v2 = [(NSMutableDictionary *)self->_prefs objectForKey:@"Locked"];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)_setSignpostPersisted:(BOOL)a3 forCategory:(id)a4
{
  BOOL v4 = a3;
  id v7 = [(OSLogPreferencesSubsystem *)self _prefsForCategory:a4];
  v6 = [MEMORY[0x1E4F28ED0] numberWithBool:v4];
  [v7 setObject:v6 forKey:@"Signpost-Persisted"];

  _OSLogInstallPreferences(3u, self->_name, (uint64_t)self->_prefs);
}

- (id)_prefsForCategory:(id)a3
{
  id v4 = a3;
  prefs = self->_prefs;
  if (!prefs)
  {
    v6 = [MEMORY[0x1E4F1CA60] dictionary];
    id v7 = self->_prefs;
    self->_prefs = v6;

    prefs = self->_prefs;
  }
  v8 = [(NSMutableDictionary *)prefs objectForKey:v4];
  if (!v8)
  {
    v8 = [MEMORY[0x1E4F1CA60] dictionary];
    [(NSMutableDictionary *)self->_prefs setObject:v8 forKey:v4];
  }

  return v8;
}

- (void)_resetCategory:(id)a3
{
  [(NSMutableDictionary *)self->_prefs removeObjectForKey:a3];
  if ([(NSMutableDictionary *)self->_prefs count])
  {
    prefs = self->_prefs;
    name = self->_name;
    _OSLogInstallPreferences(3u, name, (uint64_t)prefs);
  }
  else
  {
    v6 = self->_prefs;
    self->_prefs = 0;

    id v7 = self->_name;
    _OSLogRemovePreferences(3u, v7);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_prefs, 0);
  objc_storeStrong((id *)&self->_prefsFile, 0);
  objc_storeStrong((id *)&self->_internalPrefs, 0);
  objc_storeStrong((id *)&self->_internalPrefsFile, 0);
  objc_storeStrong((id *)&self->_systemPrefs, 0);
}

- (OSLogPreferencesSubsystem)initWithName:(id)a3
{
  id v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)OSLogPreferencesSubsystem;
  v5 = [(OSLogPreferencesSubsystem *)&v38 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    name = v5->_name;
    v5->_name = (NSString *)v6;

    id v8 = v4;
    v9 = [NSString stringWithUTF8String:_os_trace_app_cryptex_sysprefsdir_path()];
    v10 = [v9 stringByAppendingPathComponent:@"Subsystems"];
    v11 = [v10 stringByAppendingPathComponent:v8];
    v12 = [v11 stringByAppendingPathExtension:@"plist"];

    v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:v12];
    if (!v13)
    {
      v14 = [NSString stringWithUTF8String:_os_trace_os_cryptex_sysprefsdir_path()];
      v15 = [v14 stringByAppendingPathComponent:@"Subsystems"];
      v16 = [v15 stringByAppendingPathComponent:v8];
      v17 = [v16 stringByAppendingPathExtension:@"plist"];

      v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:v17];
      if (v13)
      {
        v12 = v17;
      }
      else
      {
        v18 = [NSString stringWithUTF8String:_os_trace_sysprefsdir_path()];
        v19 = [v18 stringByAppendingPathComponent:@"Subsystems"];
        v20 = [v19 stringByAppendingPathComponent:v8];
        v12 = [v20 stringByAppendingPathExtension:@"plist"];

        v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:v12];
      }
    }
    v21 = v13;

    systemPrefs = v5->_systemPrefs;
    v5->_systemPrefs = v21;

    if (_os_trace_is_development_build())
    {
      v23 = [NSString stringWithUTF8String:_os_trace_intprefsdir_path()];
      v24 = [v23 stringByAppendingPathComponent:@"Subsystems"];
      v25 = [v24 stringByAppendingPathComponent:v8];
      uint64_t v26 = [v25 stringByAppendingPathExtension:@"plist"];
      internalPrefsFile = v5->_internalPrefsFile;
      v5->_internalPrefsFile = (NSString *)v26;

      uint64_t v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:v5->_internalPrefsFile];
      internalPrefs = v5->_internalPrefs;
      v5->_internalPrefs = (NSDictionary *)v28;
    }
    v30 = [NSString stringWithUTF8String:_os_trace_prefsdir_path()];
    v31 = [v30 stringByAppendingPathComponent:@"Subsystems"];
    v32 = [v31 stringByAppendingPathComponent:v8];
    uint64_t v33 = [v32 stringByAppendingPathExtension:@"plist"];
    prefsFile = v5->_prefsFile;
    v5->_prefsFile = (NSString *)v33;

    uint64_t v35 = [MEMORY[0x1E4F1CA60] dictionaryWithContentsOfFile:v5->_prefsFile];
    prefs = v5->_prefs;
    v5->_prefs = (NSMutableDictionary *)v35;
  }
  return v5;
}

- (NSString)name
{
  return self->_name;
}

- (void)_setSignpostAllowStreaming:(BOOL)a3 forCategory:(id)a4
{
  BOOL v4 = a3;
  id v7 = [(OSLogPreferencesSubsystem *)self _prefsForCategory:a4];
  uint64_t v6 = [MEMORY[0x1E4F28ED0] numberWithBool:v4];
  [v7 setObject:v6 forKey:@"Signpost-Allow-Streaming"];

  _OSLogInstallPreferences(3u, self->_name, (uint64_t)self->_prefs);
}

- (void)_setSignpostBacktracesEnabled:(BOOL)a3 forCategory:(id)a4
{
  BOOL v4 = a3;
  id v7 = [(OSLogPreferencesSubsystem *)self _prefsForCategory:a4];
  uint64_t v6 = [MEMORY[0x1E4F28ED0] numberWithBool:v4];
  [v7 setObject:v6 forKey:@"Signpost-Backtraces-Enabled"];

  _OSLogInstallPreferences(3u, self->_name, (uint64_t)self->_prefs);
}

- (void)_setSignpostEnabled:(BOOL)a3 forCategory:(id)a4
{
  BOOL v4 = a3;
  id v7 = [(OSLogPreferencesSubsystem *)self _prefsForCategory:a4];
  uint64_t v6 = [MEMORY[0x1E4F28ED0] numberWithBool:v4];
  [v7 setObject:v6 forKey:@"Signpost-Enabled"];

  _OSLogInstallPreferences(3u, self->_name, (uint64_t)self->_prefs);
}

- (void)_setPersistedLevel:(int64_t)a3 forCategory:(id)a4
{
  uint64_t v6 = [(OSLogPreferencesSubsystem *)self _levelPrefsForCategory:a4];
  if ((unint64_t)a3 > 4) {
    id v7 = @"inherit";
  }
  else {
    id v7 = off_1E5A43080[a3];
  }
  id v9 = v6;
  [v6 setObject:v7 forKey:@"Persist"];
  if (_LevelForKey(v9, @"Enable") < a3)
  {
    if ((unint64_t)a3 > 4) {
      id v8 = @"inherit";
    }
    else {
      id v8 = off_1E5A43080[a3];
    }
    [v9 setObject:v8 forKey:@"Enable"];
  }
  _OSLogInstallPreferences(3u, self->_name, (uint64_t)self->_prefs);
}

- (void)_setEnabledLevel:(int64_t)a3 forCategory:(id)a4
{
  uint64_t v6 = [(OSLogPreferencesSubsystem *)self _levelPrefsForCategory:a4];
  if ((unint64_t)a3 > 4) {
    id v7 = @"inherit";
  }
  else {
    id v7 = off_1E5A43080[a3];
  }
  id v9 = v6;
  [v6 setObject:v7 forKey:@"Enable"];
  if (_LevelForKey(v9, @"Persist") > a3)
  {
    if ((unint64_t)a3 > 4) {
      id v8 = @"inherit";
    }
    else {
      id v8 = off_1E5A43080[a3];
    }
    [v9 setObject:v8 forKey:@"Persist"];
  }
  _OSLogInstallPreferences(3u, self->_name, (uint64_t)self->_prefs);
}

- (id)_levelPrefsForCategory:(id)a3
{
  BOOL v3 = [(OSLogPreferencesSubsystem *)self _prefsForCategory:a3];
  BOOL v4 = [v3 objectForKey:@"Level"];
  if (!v4)
  {
    BOOL v4 = [MEMORY[0x1E4F1CA60] dictionary];
    [v3 setObject:v4 forKey:@"Level"];
  }

  return v4;
}

- (BOOL)_signpostAllowStreamingForCategory:(id)a3
{
  id v4 = a3;
  v5 = [(NSMutableDictionary *)self->_prefs objectForKeyedSubscript:v4];
  uint64_t v6 = [v5 objectForKeyedSubscript:@"Signpost-Allow-Streaming"];

  if (v6
    || ([(NSDictionary *)self->_systemPrefs objectForKeyedSubscript:v4],
        id v7 = objc_claimAutoreleasedReturnValue(),
        [v7 objectForKeyedSubscript:@"Signpost-Allow-Streaming"],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        v7,
        v6))
  {
    char v8 = [v6 BOOLValue];
  }
  else
  {
    char v8 = 1;
  }

  return v8;
}

- (BOOL)_signpostBacktracesEnabledForCategory:(id)a3
{
  id v4 = a3;
  v5 = [(NSMutableDictionary *)self->_prefs objectForKey:v4];
  uint64_t v6 = [v5 objectForKey:@"Signpost-Backtraces-Enabled"];

  if (v6
    || ([(NSDictionary *)self->_systemPrefs objectForKey:v4],
        id v7 = objc_claimAutoreleasedReturnValue(),
        [v7 objectForKey:@"Signpost-Backtraces-Enabled"],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        v7,
        v6))
  {
    char v8 = [v6 BOOLValue];
  }
  else
  {
    char v8 = [v4 isEqualToString:@"DynamicStackTracing"];
  }

  return v8;
}

- (BOOL)_signpostPersistedForCategory:(id)a3
{
  id v4 = a3;
  v5 = [(NSMutableDictionary *)self->_prefs objectForKey:v4];
  uint64_t v6 = [v5 objectForKey:@"Signpost-Persisted"];

  if (v6
    || ([(NSDictionary *)self->_systemPrefs objectForKey:v4],
        id v7 = objc_claimAutoreleasedReturnValue(),
        [v7 objectForKey:@"Signpost-Persisted"],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        v7,
        v6))
  {
    char v8 = [v6 BOOLValue];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (BOOL)_signpostEnabledForCategory:(id)a3
{
  id v4 = a3;
  v5 = [(NSMutableDictionary *)self->_prefs objectForKey:v4];
  uint64_t v6 = [v5 objectForKey:@"Signpost-Enabled"];

  if (v6
    || ([(NSDictionary *)self->_systemPrefs objectForKey:v4],
        id v7 = objc_claimAutoreleasedReturnValue(),
        [v7 objectForKey:@"Signpost-Enabled"],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        v7,
        v6))
  {
    LOBYTE(v8) = [v6 BOOLValue];
  }
  else if ([v4 isEqualToString:@"DynamicTracing"])
  {
    LOBYTE(v8) = 0;
  }
  else
  {
    int v8 = [v4 isEqualToString:@"DynamicStackTracing"] ^ 1;
  }

  return v8;
}

- (int64_t)_persistedLevelForCategory:(id)a3
{
  BOOL v3 = [(NSMutableDictionary *)self->_prefs objectForKey:a3];
  id v4 = [v3 objectForKey:@"Level"];

  int64_t v5 = _LevelForKey(v4, @"Persist");
  return v5;
}

- (int64_t)_enabledLevelForCategory:(id)a3
{
  BOOL v3 = [(NSMutableDictionary *)self->_prefs objectForKey:a3];
  id v4 = [v3 objectForKey:@"Level"];

  int64_t v5 = _LevelForKey(v4, @"Enable");
  return v5;
}

- (int64_t)_defaultPersistedLevelForCategory:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(NSDictionary *)self->_internalPrefs objectForKey:v4];
  uint64_t v6 = [v5 objectForKey:@"Level"];

  uint64_t v7 = _LevelForKey(v6, @"Persist");
  if (v7 == 1)
  {
    int v8 = [(NSDictionary *)self->_systemPrefs objectForKey:v4];
    id v9 = [v8 objectForKey:@"Level"];

    int64_t v10 = _LevelForKey(v9, @"Persist");
    uint64_t v6 = v9;
  }
  else
  {
    int64_t v10 = v7;
  }

  return v10;
}

- (int64_t)_defaultEnabledLevelForCategory:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(NSDictionary *)self->_internalPrefs objectForKey:v4];
  uint64_t v6 = [v5 objectForKey:@"Level"];

  uint64_t v7 = _LevelForKey(v6, @"Enable");
  if (v7 == 1)
  {
    int v8 = [(NSDictionary *)self->_systemPrefs objectForKey:v4];
    id v9 = [v8 objectForKey:@"Level"];

    int64_t v10 = _LevelForKey(v9, @"Enable");
    uint64_t v6 = v9;
  }
  else
  {
    int64_t v10 = v7;
  }

  return v10;
}

- (void)resetAll
{
  if (![(OSLogPreferencesSubsystem *)self isLocked])
  {
    prefs = self->_prefs;
    self->_prefs = 0;

    name = self->_name;
    _OSLogRemovePreferences(3u, name);
  }
}

- (void)reset
{
  if (![(OSLogPreferencesSubsystem *)self isLocked])
  {
    [(OSLogPreferencesSubsystem *)self _resetCategory:@"DEFAULT-OPTIONS"];
  }
}

- (void)setPersistedLevel:(int64_t)a3
{
  if (![(OSLogPreferencesSubsystem *)self isLocked])
  {
    [(OSLogPreferencesSubsystem *)self _setPersistedLevel:a3 forCategory:@"DEFAULT-OPTIONS"];
  }
}

- (void)setEnabledLevel:(int64_t)a3
{
  if (![(OSLogPreferencesSubsystem *)self isLocked])
  {
    [(OSLogPreferencesSubsystem *)self _setEnabledLevel:a3 forCategory:@"DEFAULT-OPTIONS"];
  }
}

- (int64_t)persistedLevel
{
  return [(OSLogPreferencesSubsystem *)self _persistedLevelForCategory:@"DEFAULT-OPTIONS"];
}

- (int64_t)enabledLevel
{
  return [(OSLogPreferencesSubsystem *)self _enabledLevelForCategory:@"DEFAULT-OPTIONS"];
}

- (int64_t)defaultPersistedLevel
{
  return [(OSLogPreferencesSubsystem *)self _defaultPersistedLevelForCategory:@"DEFAULT-OPTIONS"];
}

- (int64_t)defaultEnabledLevel
{
  return [(OSLogPreferencesSubsystem *)self _defaultEnabledLevelForCategory:@"DEFAULT-OPTIONS"];
}

- (int64_t)effectivePersistedLevel
{
  int64_t result = [(OSLogPreferencesSubsystem *)self persistedLevel];
  if (result == 1)
  {
    int64_t result = [(OSLogPreferencesSubsystem *)self defaultPersistedLevel];
    if (result == 1)
    {
      id v4 = +[OSLogPreferencesManager sharedManager];
      int64_t v5 = [v4 persistedLevel];

      return v5;
    }
  }
  return result;
}

- (int64_t)effectiveEnabledLevel
{
  int64_t result = [(OSLogPreferencesSubsystem *)self enabledLevel];
  if (result == 1)
  {
    int64_t result = [(OSLogPreferencesSubsystem *)self defaultEnabledLevel];
    if (result == 1)
    {
      id v4 = +[OSLogPreferencesManager sharedManager];
      int64_t v5 = [v4 enabledLevel];

      return v5;
    }
  }
  return result;
}

- (NSArray)categories
{
  BOOL v3 = [MEMORY[0x1E4F1CA48] array];
  systemPrefs = self->_systemPrefs;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __39__OSLogPreferencesSubsystem_categories__block_invoke;
  v17[3] = &unk_1E5A43018;
  id v5 = v3;
  id v18 = v5;
  [(NSDictionary *)systemPrefs enumerateKeysAndObjectsUsingBlock:v17];
  internalPrefs = self->_internalPrefs;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __39__OSLogPreferencesSubsystem_categories__block_invoke_2;
  v15[3] = &unk_1E5A43018;
  id v7 = v5;
  id v16 = v7;
  [(NSDictionary *)internalPrefs enumerateKeysAndObjectsUsingBlock:v15];
  prefs = self->_prefs;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __39__OSLogPreferencesSubsystem_categories__block_invoke_3;
  v13[3] = &unk_1E5A43018;
  id v9 = v7;
  id v14 = v9;
  [(NSMutableDictionary *)prefs enumerateKeysAndObjectsUsingBlock:v13];
  int64_t v10 = v14;
  v11 = (NSArray *)v9;

  return v11;
}

void __39__OSLogPreferencesSubsystem_categories__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([v3 isEqualToString:@"DEFAULT-OPTIONS"] & 1) == 0
    && ([v3 isEqualToString:@"Locked"] & 1) == 0)
  {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

void __39__OSLogPreferencesSubsystem_categories__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([v3 isEqualToString:@"DEFAULT-OPTIONS"] & 1) == 0
    && ([v3 isEqualToString:@"Locked"] & 1) == 0
    && ([*(id *)(a1 + 32) containsObject:v3] & 1) == 0)
  {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

void __39__OSLogPreferencesSubsystem_categories__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([v3 isEqualToString:@"DEFAULT-OPTIONS"] & 1) == 0
    && ([v3 isEqualToString:@"Locked"] & 1) == 0
    && ([*(id *)(a1 + 32) containsObject:v3] & 1) == 0)
  {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

@end