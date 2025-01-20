@interface CBTrialSettingsProvider
+ (CBTrialSettingsProvider)sharedInstance;
- (CBTrialSettingsProvider)init;
- (id)copyExperimentIdentifiers;
- (id)getMLABModelPath;
- (unint64_t)aabUpdateStrategyType;
- (void)dealloc;
- (void)registerAutoBrightnessSettingsUpdateHandler:(id)a3;
- (void)unregisterAutoBrightnessSettingsUpdateHandler;
@end

@implementation CBTrialSettingsProvider

- (CBTrialSettingsProvider)init
{
  v7 = self;
  SEL v6 = a2;
  v5.receiver = self;
  v5.super_class = (Class)CBTrialSettingsProvider;
  v7 = [(CBTrialSettingsProvider *)&v5 init];
  if (!v7) {
    return 0;
  }
  v2 = (TRIClient *)(id)[MEMORY[0x1E4FB0098] clientWithIdentifier:226];
  v7->_client = v2;
  v3 = (TRIExperimentIdentifiers *)(id)[(TRIClient *)v7->_client experimentIdentifiersWithNamespaceName:@"COREOS_BRIGHTNESS_AUTO_BRIGHTNESS"];
  v7->_experimentIdentifiers = v3;
  v7->_notificationToken = 0;
  return v7;
}

- (void)dealloc
{
  v4 = self;
  SEL v3 = a2;

  v2.receiver = v4;
  v2.super_class = (Class)CBTrialSettingsProvider;
  [(CBTrialSettingsProvider *)&v2 dealloc];
}

+ (CBTrialSettingsProvider)sharedInstance
{
  objc_sync_enter(a1);
  if (sharedInstance_onceToken_5 != -1) {
    dispatch_once(&sharedInstance_onceToken_5, &__block_literal_global_15);
  }
  SEL v3 = (CBTrialSettingsProvider *)sharedInstance__sharedObject_5;
  objc_sync_exit(a1);
  return v3;
}

CBTrialSettingsProvider *__41__CBTrialSettingsProvider_sharedInstance__block_invoke()
{
  result = objc_alloc_init(CBTrialSettingsProvider);
  sharedInstance__sharedObject_5 = (uint64_t)result;
  return result;
}

- (id)copyExperimentIdentifiers
{
  return self->_experimentIdentifiers;
}

- (id)getMLABModelPath
{
  SEL v3 = objc_msgSend((id)-[TRIClient levelForFactor:withNamespaceName:](self->_client, "levelForFactor:withNamespaceName:", @"Aether", @"COREOS_BRIGHTNESS_AUTO_BRIGHTNESS"), "fileValue");
  if ([v3 hasPath]) {
    return (id)[v3 path];
  }
  else {
    return 0;
  }
}

- (void)registerAutoBrightnessSettingsUpdateHandler:(id)a3
{
  v14 = self;
  SEL v13 = a2;
  id v12 = a3;
  [(CBTrialSettingsProvider *)self unregisterAutoBrightnessSettingsUpdateHandler];
  client = v14->_client;
  uint64_t v5 = MEMORY[0x1E4F143A8];
  int v6 = -1073741824;
  int v7 = 0;
  v8 = __71__CBTrialSettingsProvider_registerAutoBrightnessSettingsUpdateHandler___block_invoke;
  v9 = &unk_1E621AC50;
  v10 = v14;
  id v11 = v12;
  v4 = (TRINotificationToken *)(id)-[TRIClient addUpdateHandlerForNamespaceName:usingBlock:](client, "addUpdateHandlerForNamespaceName:usingBlock:", @"COREOS_BRIGHTNESS_AUTO_BRIGHTNESS");
  v14->_notificationToken = v4;
}

uint64_t __71__CBTrialSettingsProvider_registerAutoBrightnessSettingsUpdateHandler___block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 24)) {

  }
  *(void *)(*(void *)(a1 + 32) + 24) = (id)[*(id *)(*(void *)(a1 + 32) + 8) experimentIdentifiersWithNamespaceName:@"COREOS_BRIGHTNESS_AUTO_BRIGHTNESS"];
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)unregisterAutoBrightnessSettingsUpdateHandler
{
  if (self->_notificationToken)
  {
    [(TRIClient *)self->_client removeUpdateHandlerForToken:self->_notificationToken];
  }
}

- (unint64_t)aabUpdateStrategyType
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v7 = (void *)[(TRIClient *)self->_client levelForFactor:@"CBAABCurveUpdateStrategyType" withNamespaceName:@"COREOS_BRIGHTNESS_AUTO_BRIGHTNESS"];
  if (v7)
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      inited = init_default_corebrightness_log();
    }
    if (os_log_type_enabled(inited, OS_LOG_TYPE_DEFAULT))
    {
      updated = aabUpdateStrategyTypeToString_0([v7 longValue]);
      __os_log_helper_16_2_1_8_64((uint64_t)v10, (uint64_t)updated);
      _os_log_impl(&dword_1BA438000, inited, OS_LOG_TYPE_DEFAULT, "Trial settings: %@", v10, 0xCu);
    }
    return [v7 longValue];
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t v5 = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t v5 = init_default_corebrightness_log();
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      SEL v3 = aabUpdateStrategyTypeToString_0(2);
      __os_log_helper_16_2_1_8_64((uint64_t)v9, (uint64_t)v3);
      _os_log_impl(&dword_1BA438000, v5, OS_LOG_TYPE_DEFAULT, "Trial is not set => use default: %@", v9, 0xCu);
    }
    return 2;
  }
}

@end