@interface ClarityUISettingsDataSource
+ (id)applicationRecordForBundleIdentifier:(id)a3;
- (BOOL)_areSpecifiersLoaded;
- (BOOL)areSpecifiersLoaded;
- (BOOL)hasClaritySettings;
- (BOOL)hasClaritySettingsIncludingSystem:(BOOL)a3;
- (ClarityUISettingsDataSource)initWithBundleIdentifier:(id)a3;
- (ClarityUISystemPolicyForApp)clarityAppPolicy;
- (LSApplicationRecord)record;
- (NSMutableArray)systemSpecifiers;
- (NSString)bundleIdentifier;
- (id)_bundle;
- (id)_claritySettingsBundlePath;
- (id)_claritySettingsPath;
- (id)_claritySettingsPathUsingBundle:(id)a3;
- (id)_dataContainerURL;
- (id)_settingsBundle;
- (id)_systemPolicySpecifiers;
- (id)privacySpecifiers;
- (unint64_t)claritySupportedPolicyOptions;
- (void)_areSpecifiersLoaded;
- (void)_loadSpecifiers;
- (void)_systemPolicySpecifiers;
- (void)loadSpecifiers;
- (void)reloadSpecifiers;
- (void)setClaritySupportedPolicyOptions:(unint64_t)a3;
- (void)setSystemSpecifiers:(id)a3;
@end

@implementation ClarityUISettingsDataSource

- (ClarityUISettingsDataSource)initWithBundleIdentifier:(id)a3
{
  v4 = (NSString *)a3;
  v14.receiver = self;
  v14.super_class = (Class)ClarityUISettingsDataSource;
  v5 = [(ClarityUISettingsDataSource *)&v14 init];
  v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    v5->_bundleIdentifier = v4;
    uint64_t v7 = +[ClarityUISettingsDataSource applicationRecordForBundleIdentifier:v4];
    record = v6->_record;
    v6->_record = (LSApplicationRecord *)v7;

    v9 = [[ClarityUISystemPolicyForApp alloc] initWithBundleIdentifier:v4];
    clarityAppPolicy = v6->_clarityAppPolicy;
    v6->_clarityAppPolicy = v9;

    v6->_claritySupportedPolicyOptions = -142770180;
    uint64_t v11 = objc_opt_new();
    systemSpecifiers = v6->_systemSpecifiers;
    v6->_systemSpecifiers = (NSMutableArray *)v11;

    v6->_specifiersLoaded = 0;
    v6->_systemSpecifiersLoaded = 0;
  }

  return v6;
}

+ (id)applicationRecordForBundleIdentifier:(id)a3
{
  id v3 = a3;
  id v9 = 0;
  id v4 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifier:v3 allowPlaceholder:0 error:&v9];
  id v5 = v9;
  if (v5)
  {
    v6 = CLFLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      [(ClarityUIAppSelectionTableViewDataSource *)(uint64_t)v3 _applicationRecordForIdentifier:v6];
    }

    id v7 = 0;
  }
  else
  {
    id v7 = v4;
  }

  return v7;
}

- (BOOL)hasClaritySettings
{
  return [(ClarityUISettingsDataSource *)self hasClaritySettingsIncludingSystem:1];
}

- (BOOL)hasClaritySettingsIncludingSystem:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3)
  {
    os_unfair_lock_lock(&self->_lock);
    id v5 = [(ClarityUISettingsDataSource *)self _systemPolicySpecifiers];
    BOOL v6 = [v5 count] != 0;

    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    BOOL v6 = 0;
  }
  id v7 = self->_record;
  if (v7)
  {
    v8 = [(ClarityUISettingsDataSource *)self _claritySettingsPath];
    if (v8 || ([(LSApplicationRecord *)v7 hasSettingsBundle] & 1) != 0)
    {
      id v9 = [(ClarityUISettingsDataSource *)self _claritySettingsBundlePath];

      if (v9) {
        int v10 = 1;
      }
      else {
        int v10 = v6;
      }
      if (v3) {
        BOOL v6 = v10;
      }
      else {
        BOOL v6 = v9 != 0;
      }
      uint64_t v11 = CLFLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        bundleIdentifier = self->_bundleIdentifier;
        int v15 = 138412802;
        v16 = bundleIdentifier;
        __int16 v17 = 1024;
        BOOL v18 = v6;
        __int16 v19 = 1024;
        BOOL v20 = v3;
        _os_log_debug_impl(&dword_0, v11, OS_LOG_TYPE_DEBUG, "Bundle Identifier: %@ - Has Clarity Settings: %d - Include System?: %d", (uint8_t *)&v15, 0x18u);
      }
    }
    else
    {
      id v9 = CLFLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        objc_super v14 = self->_bundleIdentifier;
        int v15 = 138412802;
        v16 = v14;
        __int16 v17 = 1024;
        BOOL v18 = v6;
        __int16 v19 = 1024;
        BOOL v20 = v3;
        _os_log_debug_impl(&dword_0, v9, OS_LOG_TYPE_DEBUG, "Bundle Identifier: %@ - Has Clarity Settings: %d - Include System?: %d", (uint8_t *)&v15, 0x18u);
      }
    }
  }
  else
  {
    id v9 = CLFLogCommon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[ClarityUISettingsDataSource hasClaritySettingsIncludingSystem:]();
    }
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (id)_bundle
{
  v2 = [(ClarityUISettingsDataSource *)self record];
  BOOL v3 = v2;
  if (v2)
  {
    id v4 = [v2 URL];
    id v5 = +[NSBundle bundleWithURL:v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)_settingsBundle
{
  v2 = [(ClarityUISettingsDataSource *)self record];
  BOOL v3 = v2;
  if (v2 && [v2 hasSettingsBundle])
  {
    id v4 = [v3 URL];
    id v5 = [v4 URLByAppendingPathComponent:@"Settings.bundle"];
    BOOL v6 = +[NSBundle bundleWithURL:v5];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)_claritySettingsPath
{
  BOOL v3 = [(ClarityUISettingsDataSource *)self _bundle];
  id v4 = [(ClarityUISettingsDataSource *)self _claritySettingsPathUsingBundle:v3];

  return v4;
}

- (id)_claritySettingsBundlePath
{
  BOOL v3 = [(ClarityUISettingsDataSource *)self _settingsBundle];
  id v4 = [(ClarityUISettingsDataSource *)self _claritySettingsPathUsingBundle:v3];

  return v4;
}

- (id)_claritySettingsPathUsingBundle:(id)a3
{
  return [a3 pathForResource:@"ClarityUIRoot" ofType:@"plist"];
}

- (id)_dataContainerURL
{
  v2 = [(ClarityUISettingsDataSource *)self record];
  BOOL v3 = [v2 dataContainerURL];

  return v3;
}

- (BOOL)_areSpecifiersLoaded
{
  os_unfair_lock_assert_owner(&self->_lock);
  BOOL v3 = self->_systemSpecifiersLoaded && self->_specifiersLoaded;
  id v4 = CLFLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    [(ClarityUISettingsDataSource *)v3 _areSpecifiersLoaded];
  }

  return v3;
}

- (BOOL)areSpecifiersLoaded
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = [(ClarityUISettingsDataSource *)v2 _areSpecifiersLoaded];
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)reloadSpecifiers
{
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_6(&dword_0, v0, v1, "Reloading specifiers for bundle identifier: %@", v2, v3, v4, v5, v6);
}

- (id)_systemPolicySpecifiers
{
  os_unfair_lock_assert_owner(&self->_lock);
  if (self->_systemSpecifiersLoaded)
  {
    uint64_t v3 = self->_systemSpecifiers;
  }
  else
  {
    uint64_t v4 = CLFLogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      -[ClarityUISettingsDataSource _systemPolicySpecifiers]();
    }

    [(NSMutableArray *)self->_systemSpecifiers removeAllObjects];
    uint64_t v5 = [(ClarityUISystemPolicyForApp *)self->_clarityAppPolicy clarityPolicySpecifiers];
    [(NSMutableArray *)self->_systemSpecifiers addObjectsFromArray:v5];
    self->_systemSpecifiersLoaded = 1;
    uint64_t v3 = self->_systemSpecifiers;
  }

  return v3;
}

- (void)_loadSpecifiers
{
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_6(&dword_0, v0, v1, "Specifiers not loaded. Loading specifiers for bundle identifier: %@", v2, v3, v4, v5, v6);
}

- (void)loadSpecifiers
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [(ClarityUISettingsDataSource *)self _loadSpecifiers];

  os_unfair_lock_unlock(p_lock);
}

- (id)privacySpecifiers
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v4 = [(ClarityUISystemPolicyForApp *)self->_clarityAppPolicy clarityPolicySpecifiers];
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (LSApplicationRecord)record
{
  return self->_record;
}

- (ClarityUISystemPolicyForApp)clarityAppPolicy
{
  return self->_clarityAppPolicy;
}

- (unint64_t)claritySupportedPolicyOptions
{
  return self->_claritySupportedPolicyOptions;
}

- (void)setClaritySupportedPolicyOptions:(unint64_t)a3
{
  self->_claritySupportedPolicyOptions = a3;
}

- (NSMutableArray)systemSpecifiers
{
  return self->_systemSpecifiers;
}

- (void)setSystemSpecifiers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemSpecifiers, 0);
  objc_storeStrong((id *)&self->_clarityAppPolicy, 0);

  objc_storeStrong((id *)&self->_record, 0);
}

- (void)hasClaritySettingsIncludingSystem:.cold.1()
{
  OUTLINED_FUNCTION_0_4();
  _os_log_error_impl(&dword_0, v0, OS_LOG_TYPE_ERROR, "No Application Record found for bundle identifier: %@", v1, 0xCu);
}

- (void)_areSpecifiersLoaded
{
  uint64_t v3 = *(void *)(a2 + 32);
  v4[0] = 67109378;
  v4[1] = a1 & 1;
  __int16 v5 = 2112;
  uint64_t v6 = v3;
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "Specifiers are loaded: %d - Bundle Identifier: %@", (uint8_t *)v4, 0x12u);
}

- (void)_systemPolicySpecifiers
{
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_6(&dword_0, v0, v1, "System Specifiers not loaded. Loading system policy specifiers for bundle identifier: %@", v2, v3, v4, v5, v6);
}

@end