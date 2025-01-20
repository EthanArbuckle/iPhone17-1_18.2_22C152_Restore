@interface OSLogPreferencesManager
+ (id)sharedManager;
- (NSArray)processes;
- (NSArray)subsystems;
- (OSLogPreferencesManager)init;
- (id)_levelPrefs;
- (int64_t)enabledLevel;
- (int64_t)persistedLevel;
- (void)reset;
- (void)resetAll;
- (void)resetAllProcesses;
- (void)resetAllSubsystems;
- (void)setEnabledLevel:(int64_t)a3;
- (void)setPersistedLevel:(int64_t)a3;
@end

@implementation OSLogPreferencesManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prefs, 0);
  objc_storeStrong((id *)&self->_prefsFile, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (void)resetAllSubsystems
{
  id v2 = [(OSLogPreferencesManager *)self subsystems];
  [v2 enumerateObjectsUsingBlock:&__block_literal_global_39];
}

void __45__OSLogPreferencesManager_resetAllSubsystems__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[OSLogPreferencesSubsystem alloc] initWithName:v2];

  [(OSLogPreferencesSubsystem *)v3 resetAll];
}

- (void)resetAllProcesses
{
  id v2 = [(OSLogPreferencesManager *)self processes];
  [v2 enumerateObjectsUsingBlock:&__block_literal_global_36];
}

void __44__OSLogPreferencesManager_resetAllProcesses__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[OSLogPreferencesProcess alloc] initWithBundleID:v2];

  [(OSLogPreferencesProcess *)v3 reset];
}

- (void)resetAll
{
  [(OSLogPreferencesManager *)self reset];
  [(OSLogPreferencesManager *)self resetAllProcesses];
  [(OSLogPreferencesManager *)self resetAllSubsystems];
}

- (void)reset
{
  prefs = self->_prefs;
  self->_prefs = 0;

  name = self->_name;
  _OSLogRemovePreferences(1u, name);
}

- (void)setPersistedLevel:(int64_t)a3
{
  v5 = [(OSLogPreferencesManager *)self _levelPrefs];
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
  _OSLogInstallPreferences(1u, self->_name, (uint64_t)self->_prefs);
}

- (void)setEnabledLevel:(int64_t)a3
{
  v5 = [(OSLogPreferencesManager *)self _levelPrefs];
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
  _OSLogInstallPreferences(1u, self->_name, (uint64_t)self->_prefs);
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
  id v2 = [(NSMutableDictionary *)self->_prefs objectForKey:@"Level"];
  uint64_t v3 = _LevelForKey(v2, @"Persist");
  if (v3 == 1) {
    int64_t v4 = 2;
  }
  else {
    int64_t v4 = v3;
  }

  return v4;
}

- (int64_t)enabledLevel
{
  id v2 = [(NSMutableDictionary *)self->_prefs objectForKey:@"Level"];
  uint64_t v3 = _LevelForKey(v2, @"Enable");
  if (v3 == 1) {
    int64_t v4 = 3;
  }
  else {
    int64_t v4 = v3;
  }

  return v4;
}

- (NSArray)subsystems
{
  return (NSArray *)OSLogPreferencesList(@"Subsystems");
}

- (NSArray)processes
{
  return (NSArray *)OSLogPreferencesList(@"Processes");
}

- (OSLogPreferencesManager)init
{
  v12.receiver = self;
  v12.super_class = (Class)OSLogPreferencesManager;
  id v2 = [(OSLogPreferencesManager *)&v12 init];
  uint64_t v3 = v2;
  if (v2)
  {
    name = v2->_name;
    v2->_name = (NSString *)@"com.apple.system.logging";

    v5 = [NSString stringWithUTF8String:_os_trace_prefsdir_path()];
    v6 = [v5 stringByAppendingPathComponent:v3->_name];
    uint64_t v7 = [v6 stringByAppendingPathExtension:@"plist"];
    prefsFile = v3->_prefsFile;
    v3->_prefsFile = (NSString *)v7;

    uint64_t v9 = [MEMORY[0x1E4F1CA60] dictionaryWithContentsOfFile:v3->_prefsFile];
    prefs = v3->_prefs;
    v3->_prefs = (NSMutableDictionary *)v9;
  }
  return v3;
}

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1) {
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_19);
  }
  id v2 = (void *)sharedManager_manager;
  return v2;
}

uint64_t __40__OSLogPreferencesManager_sharedManager__block_invoke()
{
  v0 = objc_alloc_init(OSLogPreferencesManager);
  uint64_t v1 = sharedManager_manager;
  sharedManager_manager = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end