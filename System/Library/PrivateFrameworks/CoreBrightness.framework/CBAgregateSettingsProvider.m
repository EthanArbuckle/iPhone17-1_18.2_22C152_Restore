@interface CBAgregateSettingsProvider
+ (id)sharedInstance;
- (CBAgregateSettingsProvider)initWithPreferences:(id)a3 andTrial:(id)a4;
- (id)getMLABModelPath;
- (unint64_t)aabUpdateStrategyType;
- (void)dealloc;
- (void)registerAutoBrightnessSettingsUpdateHandler:(id)a3;
- (void)unregisterAutoBrightnessSettingsUpdateHandler;
@end

@implementation CBAgregateSettingsProvider

+ (id)sharedInstance
{
  objc_sync_enter(a1);
  if (sharedInstance_onceToken_4 != -1) {
    dispatch_once(&sharedInstance_onceToken_4, &__block_literal_global_12);
  }
  v3 = (void *)sharedInstance__sharedObject_4;
  objc_sync_exit(a1);
  return v3;
}

CBAgregateSettingsProvider *__44__CBAgregateSettingsProvider_sharedInstance__block_invoke()
{
  result = [[CBAgregateSettingsProvider alloc] initWithPreferences:+[CBPreferencesSettingsProvider sharedInstance](CBPreferencesSettingsProvider, "sharedInstance") andTrial:+[CBTrialSettingsProvider sharedInstance]];
  sharedInstance__sharedObject_4 = (uint64_t)result;
  return result;
}

- (CBAgregateSettingsProvider)initWithPreferences:(id)a3 andTrial:(id)a4
{
  v18 = self;
  SEL v17 = a2;
  id v16 = a3;
  id v15 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CBAgregateSettingsProvider;
  v18 = [(CBAgregateSettingsProvider *)&v14 init];
  if (!v18) {
    return 0;
  }
  os_log_t v4 = os_log_create("com.apple.CoreBrightness.CBAgregateSettingsProvider", "default");
  v18->_logHandle = (OS_os_log *)v4;
  if (!v18->_logHandle)
  {
    os_log_t oslog = 0;
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      inited = init_default_corebrightness_log();
    }
    os_log_t oslog = inited;
    os_log_type_t type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(inited, OS_LOG_TYPE_ERROR))
    {
      log = oslog;
      os_log_type_t v9 = type;
      __os_log_helper_16_0_0(v11);
      _os_log_error_impl(&dword_1BA438000, log, v9, "Failed to create log handle for agregate settings provider", v11, 2u);
    }
  }
  v5 = (CBPreferencesSettingsProvider *)v16;
  v18->_preferencesSettingsProvider = v5;
  v6 = (CBTrialSettingsProvider *)v15;
  v18->_trialSettingsProvider = v6;
  return v18;
}

- (void)dealloc
{
  os_log_t v4 = self;
  SEL v3 = a2;

  v2.receiver = v4;
  v2.super_class = (Class)CBAgregateSettingsProvider;
  [(CBAgregateSettingsProvider *)&v2 dealloc];
}

- (id)getMLABModelPath
{
  return [(CBTrialSettingsProvider *)self->_trialSettingsProvider getMLABModelPath];
}

- (void)registerAutoBrightnessSettingsUpdateHandler:(id)a3
{
}

- (void)unregisterAutoBrightnessSettingsUpdateHandler
{
}

- (unint64_t)aabUpdateStrategyType
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (CBU_IsPad()) {
    return 0;
  }
  if (![(CBPreferencesSettingsProvider *)self->_preferencesSettingsProvider specifiesAABCurveUpdateStrategy])return [(CBTrialSettingsProvider *)self->_trialSettingsProvider aabUpdateStrategyType]; {
  if (self->_logHandle)
  }
  {
    logHandle = self->_logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t inited = init_default_corebrightness_log();
    }
    logHandle = inited;
  }
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
  {
    updated = aabUpdateStrategyTypeToString([(CBPreferencesSettingsProvider *)self->_preferencesSettingsProvider aabUpdateStrategyType]);
    __os_log_helper_16_2_1_8_66((uint64_t)v8, (uint64_t)updated);
    _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEFAULT, "AAB curve update strategy overriden by preferences. Use %{public}@", v8, 0xCu);
  }
  return [(CBPreferencesSettingsProvider *)self->_preferencesSettingsProvider aabUpdateStrategyType];
}

@end