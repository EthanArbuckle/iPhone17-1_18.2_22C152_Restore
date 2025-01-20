@interface IRFeatureFlags
+ (id)sharedFeatureFlags;
- (BOOL)isAggressiveFilteringEnabled;
- (BOOL)isAutomaticControlFeatureEnabled;
- (BOOL)isAutomaticRoutingFeatureEnabled;
- (BOOL)isPickerPrioritizationFeatureEnabled;
- (BOOL)isServiceFeatureEnabled;
- (BOOL)isSuggestedControlFeatureEnabled;
- (BOOL)isSuggestedRoutingFeatureEnabled;
- (BOOL)isTVRemoteControlFeatureEnabled;
- (void)_checkForUnitTestingWithFeatureName:(id)a3;
@end

@implementation IRFeatureFlags

+ (id)sharedFeatureFlags
{
  if (sharedFeatureFlags_onceToken != -1) {
    dispatch_once(&sharedFeatureFlags_onceToken, &__block_literal_global_20);
  }
  v2 = (void *)sharedFeatureFlags_featureFlags;

  return v2;
}

uint64_t __36__IRFeatureFlags_sharedFeatureFlags__block_invoke()
{
  sharedFeatureFlags_featureFlags = objc_alloc_init(IRFeatureFlags);

  return MEMORY[0x270F9A758]();
}

- (void)_checkForUnitTestingWithFeatureName:(id)a3
{
}

- (BOOL)isServiceFeatureEnabled
{
  if (isServiceFeatureEnabled_onceToken != -1) {
    dispatch_once(&isServiceFeatureEnabled_onceToken, &__block_literal_global_4);
  }
  return isServiceFeatureEnabled_enabled;
}

void __41__IRFeatureFlags_isServiceFeatureEnabled__block_invoke()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  isServiceFeatureEnabled_enabled = _os_feature_enabled_impl();
  v0 = *MEMORY[0x263F50090];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_DEFAULT))
  {
    if (isServiceFeatureEnabled_enabled) {
      v1 = @"YES";
    }
    else {
      v1 = @"NO";
    }
    int v2 = 138412290;
    v3 = v1;
    _os_log_impl(&dword_25418E000, v0, OS_LOG_TYPE_DEFAULT, "[IRFeatureFlags] service: %@", (uint8_t *)&v2, 0xCu);
  }
}

- (BOOL)isPickerPrioritizationFeatureEnabled
{
  if (isPickerPrioritizationFeatureEnabled_onceToken != -1) {
    dispatch_once(&isPickerPrioritizationFeatureEnabled_onceToken, &__block_literal_global_17);
  }
  return isPickerPrioritizationFeatureEnabled_enabled;
}

void __54__IRFeatureFlags_isPickerPrioritizationFeatureEnabled__block_invoke()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  isPickerPrioritizationFeatureEnabled_enabled = _os_feature_enabled_impl();
  v0 = *MEMORY[0x263F50090];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_DEFAULT))
  {
    if (isPickerPrioritizationFeatureEnabled_enabled) {
      v1 = @"YES";
    }
    else {
      v1 = @"NO";
    }
    int v2 = 138412290;
    v3 = v1;
    _os_log_impl(&dword_25418E000, v0, OS_LOG_TYPE_DEFAULT, "[IRFeatureFlags] pickerPrioritization: %@", (uint8_t *)&v2, 0xCu);
  }
}

- (BOOL)isSuggestedRoutingFeatureEnabled
{
  if (isSuggestedRoutingFeatureEnabled_onceToken != -1) {
    dispatch_once(&isSuggestedRoutingFeatureEnabled_onceToken, &__block_literal_global_23_0);
  }
  return isSuggestedRoutingFeatureEnabled_enabled;
}

void __50__IRFeatureFlags_isSuggestedRoutingFeatureEnabled__block_invoke()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  isSuggestedRoutingFeatureEnabled_enabled = _os_feature_enabled_impl();
  v0 = *MEMORY[0x263F50090];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_DEFAULT))
  {
    if (isSuggestedRoutingFeatureEnabled_enabled) {
      v1 = @"YES";
    }
    else {
      v1 = @"NO";
    }
    int v2 = 138412290;
    v3 = v1;
    _os_log_impl(&dword_25418E000, v0, OS_LOG_TYPE_DEFAULT, "[IRFeatureFlags] suggestedRouting: %@", (uint8_t *)&v2, 0xCu);
  }
}

- (BOOL)isAutomaticRoutingFeatureEnabled
{
  if (isAutomaticRoutingFeatureEnabled_onceToken != -1) {
    dispatch_once(&isAutomaticRoutingFeatureEnabled_onceToken, &__block_literal_global_29);
  }
  return isAutomaticRoutingFeatureEnabled_enabled;
}

void __50__IRFeatureFlags_isAutomaticRoutingFeatureEnabled__block_invoke()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  isAutomaticRoutingFeatureEnabled_enabled = _os_feature_enabled_impl();
  v0 = *MEMORY[0x263F50090];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_DEFAULT))
  {
    if (isAutomaticRoutingFeatureEnabled_enabled) {
      v1 = @"YES";
    }
    else {
      v1 = @"NO";
    }
    int v2 = 138412290;
    v3 = v1;
    _os_log_impl(&dword_25418E000, v0, OS_LOG_TYPE_DEFAULT, "[IRFeatureFlags] automaticRouting: %@", (uint8_t *)&v2, 0xCu);
  }
}

- (BOOL)isSuggestedControlFeatureEnabled
{
  if (isSuggestedControlFeatureEnabled_onceToken != -1) {
    dispatch_once(&isSuggestedControlFeatureEnabled_onceToken, &__block_literal_global_35);
  }
  return isSuggestedControlFeatureEnabled_enabled;
}

void __50__IRFeatureFlags_isSuggestedControlFeatureEnabled__block_invoke()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  isSuggestedControlFeatureEnabled_enabled = _os_feature_enabled_impl();
  v0 = *MEMORY[0x263F50090];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_DEFAULT))
  {
    if (isSuggestedControlFeatureEnabled_enabled) {
      v1 = @"YES";
    }
    else {
      v1 = @"NO";
    }
    int v2 = 138412290;
    v3 = v1;
    _os_log_impl(&dword_25418E000, v0, OS_LOG_TYPE_DEFAULT, "[IRFeatureFlags] suggestedControl: %@", (uint8_t *)&v2, 0xCu);
  }
}

- (BOOL)isAutomaticControlFeatureEnabled
{
  if (isAutomaticControlFeatureEnabled_onceToken != -1) {
    dispatch_once(&isAutomaticControlFeatureEnabled_onceToken, &__block_literal_global_41_0);
  }
  return isAutomaticControlFeatureEnabled_enabled;
}

void __50__IRFeatureFlags_isAutomaticControlFeatureEnabled__block_invoke()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  isAutomaticControlFeatureEnabled_enabled = _os_feature_enabled_impl();
  v0 = *MEMORY[0x263F50090];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_DEFAULT))
  {
    if (isAutomaticControlFeatureEnabled_enabled) {
      v1 = @"YES";
    }
    else {
      v1 = @"NO";
    }
    int v2 = 138412290;
    v3 = v1;
    _os_log_impl(&dword_25418E000, v0, OS_LOG_TYPE_DEFAULT, "[IRFeatureFlags] automaticControl: %@", (uint8_t *)&v2, 0xCu);
  }
}

- (BOOL)isTVRemoteControlFeatureEnabled
{
  if (isTVRemoteControlFeatureEnabled_onceToken != -1) {
    dispatch_once(&isTVRemoteControlFeatureEnabled_onceToken, &__block_literal_global_47);
  }
  return isTVRemoteControlFeatureEnabled_enabled;
}

void __49__IRFeatureFlags_isTVRemoteControlFeatureEnabled__block_invoke()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  isTVRemoteControlFeatureEnabled_enabled = _os_feature_enabled_impl();
  v0 = *MEMORY[0x263F50090];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_DEFAULT))
  {
    if (isTVRemoteControlFeatureEnabled_enabled) {
      v1 = @"YES";
    }
    else {
      v1 = @"NO";
    }
    int v2 = 138412290;
    v3 = v1;
    _os_log_impl(&dword_25418E000, v0, OS_LOG_TYPE_DEFAULT, "[IRFeatureFlags] tvRemoteControl: %@", (uint8_t *)&v2, 0xCu);
  }
}

- (BOOL)isAggressiveFilteringEnabled
{
  if (isAggressiveFilteringEnabled_onceToken != -1) {
    dispatch_once(&isAggressiveFilteringEnabled_onceToken, &__block_literal_global_53);
  }
  return isAggressiveFilteringEnabled_enabled;
}

void __46__IRFeatureFlags_isAggressiveFilteringEnabled__block_invoke()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  isAggressiveFilteringEnabled_enabled = _os_feature_enabled_impl();
  v0 = *MEMORY[0x263F50090];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_DEFAULT))
  {
    if (isAggressiveFilteringEnabled_enabled) {
      v1 = @"YES";
    }
    else {
      v1 = @"NO";
    }
    int v2 = 138412290;
    v3 = v1;
    _os_log_impl(&dword_25418E000, v0, OS_LOG_TYPE_DEFAULT, "[IRFeatureFlags] cilantro_show_less: %@", (uint8_t *)&v2, 0xCu);
  }
}

@end