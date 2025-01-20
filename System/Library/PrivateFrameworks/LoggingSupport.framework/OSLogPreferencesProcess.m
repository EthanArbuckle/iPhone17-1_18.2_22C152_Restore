@interface OSLogPreferencesProcess
- (BOOL)isLocked;
- (NSString)bundleID;
- (OSLogPreferencesProcess)initWithBundleID:(id)a3;
- (id)_levelPrefs;
- (int64_t)defaultEnabledLevel;
- (int64_t)defaultPersistedLevel;
- (int64_t)effectiveEnabledLevel;
- (int64_t)effectivePersistedLevel;
- (int64_t)enabledLevel;
- (int64_t)persistedLevel;
- (void)reset;
- (void)setEnabledLevel:(int64_t)a3;
- (void)setPersistedLevel:(int64_t)a3;
@end

@implementation OSLogPreferencesProcess

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_prefs, 0);
  objc_storeStrong((id *)&self->_prefsFile, 0);
  objc_storeStrong((id *)&self->_internalPrefs, 0);
  objc_storeStrong((id *)&self->_internalPrefsFile, 0);
  objc_storeStrong((id *)&self->_systemPrefs, 0);
  objc_storeStrong((id *)&self->_systemPrefsFile, 0);
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)reset
{
  if (![(OSLogPreferencesProcess *)self isLocked])
  {
    prefs = self->_prefs;
    self->_prefs = 0;

    bundleID = self->_bundleID;
    _OSLogRemovePreferences(2u, bundleID);
  }
}

- (void)setPersistedLevel:(int64_t)a3
{
  if (![(OSLogPreferencesProcess *)self isLocked])
  {
    v5 = [(OSLogPreferencesProcess *)self _levelPrefs];
    if ((unint64_t)a3 > 4) {
      v6 = @"inherit";
    }
    else {
      v6 = off_1E5A43080[a3];
    }
    id v8 = v5;
    [v5 setObject:v6 forKey:@"Persist"];
    if (_LevelForKey(v8, @"Enable") < a3)
    {
      if ((unint64_t)a3 > 4) {
        v7 = @"inherit";
      }
      else {
        v7 = off_1E5A43080[a3];
      }
      [v8 setObject:v7 forKey:@"Enable"];
    }
    _OSLogInstallPreferences(2u, self->_bundleID, (uint64_t)self->_prefs);
  }
}

- (void)setEnabledLevel:(int64_t)a3
{
  if (![(OSLogPreferencesProcess *)self isLocked])
  {
    v5 = [(OSLogPreferencesProcess *)self _levelPrefs];
    if ((unint64_t)a3 > 4) {
      v6 = @"inherit";
    }
    else {
      v6 = off_1E5A43080[a3];
    }
    id v8 = v5;
    [v5 setObject:v6 forKey:@"Enable"];
    if (_LevelForKey(v8, @"Persist") > a3)
    {
      if ((unint64_t)a3 > 4) {
        v7 = @"inherit";
      }
      else {
        v7 = off_1E5A43080[a3];
      }
      [v8 setObject:v7 forKey:@"Persist"];
    }
    _OSLogInstallPreferences(2u, self->_bundleID, (uint64_t)self->_prefs);
  }
}

- (id)_levelPrefs
{
  prefs = self->_prefs;
  if (!prefs)
  {
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = self->_prefs;
    self->_prefs = v4;

    prefs = self->_prefs;
  }
  v6 = [(NSMutableDictionary *)prefs objectForKey:@"Level"];
  if (!v6)
  {
    v6 = [MEMORY[0x1E4F1CA60] dictionary];
    [(NSMutableDictionary *)self->_prefs setObject:v6 forKey:@"Level"];
  }
  return v6;
}

- (int64_t)persistedLevel
{
  v2 = [(NSMutableDictionary *)self->_prefs objectForKey:@"Level"];
  int64_t v3 = _LevelForKey(v2, @"Persist");

  return v3;
}

- (int64_t)enabledLevel
{
  v2 = [(NSMutableDictionary *)self->_prefs objectForKey:@"Level"];
  int64_t v3 = _LevelForKey(v2, @"Enable");

  return v3;
}

- (int64_t)defaultPersistedLevel
{
  int64_t v3 = [(NSDictionary *)self->_internalPrefs objectForKey:@"Level"];
  uint64_t v4 = _LevelForKey(v3, @"Persist");
  if (v4 == 1)
  {
    v5 = [(NSDictionary *)self->_systemPrefs objectForKey:@"Level"];

    int64_t v6 = _LevelForKey(v5, @"Persist");
    int64_t v3 = v5;
  }
  else
  {
    int64_t v6 = v4;
  }

  return v6;
}

- (int64_t)defaultEnabledLevel
{
  int64_t v3 = [(NSDictionary *)self->_internalPrefs objectForKey:@"Level"];
  uint64_t v4 = _LevelForKey(v3, @"Enable");
  if (v4 == 1)
  {
    v5 = [(NSDictionary *)self->_systemPrefs objectForKey:@"Level"];

    int64_t v6 = _LevelForKey(v5, @"Enable");
    int64_t v3 = v5;
  }
  else
  {
    int64_t v6 = v4;
  }

  return v6;
}

- (int64_t)effectivePersistedLevel
{
  int64_t result = [(OSLogPreferencesProcess *)self persistedLevel];
  if (result == 1)
  {
    int64_t result = [(OSLogPreferencesProcess *)self defaultPersistedLevel];
    if (result == 1)
    {
      uint64_t v4 = +[OSLogPreferencesManager sharedManager];
      int64_t v5 = [v4 persistedLevel];

      return v5;
    }
  }
  return result;
}

- (int64_t)effectiveEnabledLevel
{
  int64_t result = [(OSLogPreferencesProcess *)self enabledLevel];
  if (result == 1)
  {
    int64_t result = [(OSLogPreferencesProcess *)self defaultEnabledLevel];
    if (result == 1)
    {
      uint64_t v4 = +[OSLogPreferencesManager sharedManager];
      int64_t v5 = [v4 enabledLevel];

      return v5;
    }
  }
  return result;
}

- (BOOL)isLocked
{
  v2 = [(NSMutableDictionary *)self->_prefs objectForKey:@"Locked"];
  BOOL v3 = v2 != 0;

  return v3;
}

- (OSLogPreferencesProcess)initWithBundleID:(id)a3
{
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)OSLogPreferencesProcess;
  int64_t v5 = [(OSLogPreferencesProcess *)&v30 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v6;

    id v8 = [NSString stringWithUTF8String:_os_trace_sysprefsdir_path()];
    v9 = [v8 stringByAppendingPathComponent:@"Processes"];
    v10 = [v9 stringByAppendingPathComponent:v4];
    uint64_t v11 = [v10 stringByAppendingPathExtension:@"plist"];
    systemPrefsFile = v5->_systemPrefsFile;
    v5->_systemPrefsFile = (NSString *)v11;

    uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:v5->_systemPrefsFile];
    systemPrefs = v5->_systemPrefs;
    v5->_systemPrefs = (NSDictionary *)v13;

    if (_os_trace_is_development_build())
    {
      v15 = [NSString stringWithUTF8String:_os_trace_intprefsdir_path()];
      v16 = [v15 stringByAppendingPathComponent:@"Processes"];
      v17 = [v16 stringByAppendingPathComponent:v4];
      uint64_t v18 = [v17 stringByAppendingPathExtension:@"plist"];
      internalPrefsFile = v5->_internalPrefsFile;
      v5->_internalPrefsFile = (NSString *)v18;

      uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:v5->_internalPrefsFile];
      internalPrefs = v5->_internalPrefs;
      v5->_internalPrefs = (NSDictionary *)v20;
    }
    v22 = [NSString stringWithUTF8String:_os_trace_prefsdir_path()];
    v23 = [v22 stringByAppendingPathComponent:@"Processes"];
    v24 = [v23 stringByAppendingPathComponent:v4];
    uint64_t v25 = [v24 stringByAppendingPathExtension:@"plist"];
    prefsFile = v5->_prefsFile;
    v5->_prefsFile = (NSString *)v25;

    uint64_t v27 = [MEMORY[0x1E4F1CA60] dictionaryWithContentsOfFile:v5->_prefsFile];
    prefs = v5->_prefs;
    v5->_prefs = (NSMutableDictionary *)v27;
  }
  return v5;
}

@end