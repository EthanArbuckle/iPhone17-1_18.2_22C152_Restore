@interface LACFlags
+ (LACFlags)sharedInstance;
- (BOOL)featureFlagApproveByMacEnabled;
- (BOOL)featureFlagApproveByMacFailureUIEnabled;
- (BOOL)featureFlagDimpleKeyGracePeriodEnabled;
- (BOOL)featureFlagDimpleKeySecureRepairEnabled;
- (BOOL)featureFlagEssoniteClickEnabled;
- (BOOL)featureFlagPreboardDeveloperModeEnabled;
- (BOOL)featureFlagPreboardEnabled;
- (BOOL)featureFlagPreboardProtectedVariablesEnabled;
- (BOOL)featureFlagPreboardUPPEnabled;
- (BOOL)featureFlagSecureUIEnabled;
- (NSData)valueForFlagOnenessSessionAuthentication;
- (NSNumber)valueForFlagCompanionMockDevices;
- (NSNumber)valueForFlagDTOSecureRepairMockRepairType;
- (NSNumber)valueForFlagDTOSecureRepairMockRepairTypeQueryLatency;
- (NSNumber)valueForFlagDTOStrictModeEnabled;
- (NSNumber)valueForFlagOnenessSessionActive;
- (NSNumber)valueForFlagPreboardMode;
- (NSNumber)valueForFlagRunningInBATS;
- (NSNumber)valueForFlagSecureUIMinDisplayTime;
- (NSNumber)valueForFlagSharedModeActive;
- (NSNumber)valueForFlagSharedModeLatency;
- (NSString)flagCompanionMockDevicesKey;
- (NSString)flagDTOSecureRepairMockRepairTypeKey;
- (NSString)flagDTOSecureRepairMockRepairTypeQueryLatencyKey;
- (NSString)flagDTOStrictModeEnabledKey;
- (NSString)flagOnenessSessionActiveKey;
- (NSString)flagOnenessSessionAuthenticationKey;
- (NSString)flagPreboardModeKey;
- (NSString)flagRunningInBATSKey;
- (NSString)flagSecureUIMinDisplayTimeKey;
- (NSString)flagSharedModeActiveKey;
- (NSString)flagSharedModeLatencyKey;
@end

@implementation LACFlags

+ (LACFlags)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global);
  }
  v2 = (void *)sharedInstance_sharedInstance;
  return (LACFlags *)v2;
}

id __44__LACFlags_valueForFlagCompanionMockDevices__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  if (os_variant_allows_internal_security_policies())
  {
    v6 = [MEMORY[0x263F08AB0] processInfo];
    v7 = [v6 environment];
    v8 = [v7 objectForKeyedSubscript:v4];

    if (!v8) {
      goto LABEL_4;
    }
    id v9 = objc_alloc_init(MEMORY[0x263F08A30]);
    v10 = [MEMORY[0x263F08AB0] processInfo];
    v11 = [v10 environment];
    v12 = [v11 objectForKeyedSubscript:v4];
    id v13 = [v9 numberFromString:v12];

    if (!v13)
    {
LABEL_4:
      v14 = [MEMORY[0x263EFFA40] standardUserDefaults];
      v15 = [v14 persistentDomainForName:*MEMORY[0x263F08100]];

      uint64_t v16 = [v15 objectForKeyedSubscript:v4];
      if (v16
        && (v17 = (void *)v16,
            [v15 objectForKeyedSubscript:v4],
            v18 = objc_claimAutoreleasedReturnValue(),
            objc_opt_class(),
            char isKindOfClass = objc_opt_isKindOfClass(),
            v18,
            v17,
            (isKindOfClass & 1) != 0))
      {
        id v20 = [v15 objectForKeyedSubscript:v4];
      }
      else
      {
        id v20 = v5;
      }
      id v13 = v20;
    }
  }
  else
  {
    id v13 = v5;
  }

  return v13;
}

- (NSNumber)valueForFlagOnenessSessionActive
{
  return (NSNumber *)__44__LACFlags_valueForFlagCompanionMockDevices__block_invoke((uint64_t)self, @"LA.companion.sessionActive", 0);
}

- (BOOL)featureFlagApproveByMacEnabled
{
  return _os_feature_enabled_impl();
}

- (NSNumber)valueForFlagSharedModeActive
{
  return (NSNumber *)__44__LACFlags_valueForFlagCompanionMockDevices__block_invoke((uint64_t)self, @"LA.sharedMode.isActive", 0);
}

- (BOOL)featureFlagEssoniteClickEnabled
{
  return _os_feature_enabled_impl();
}

uint64_t __26__LACFlags_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance = objc_alloc_init(LACFlags);
  return MEMORY[0x270F9A758]();
}

- (NSString)flagCompanionMockDevicesKey
{
  return (NSString *)@"LA.companion.device-mock";
}

- (NSNumber)valueForFlagCompanionMockDevices
{
  return (NSNumber *)__44__LACFlags_valueForFlagCompanionMockDevices__block_invoke((uint64_t)self, @"LA.companion.device-mock", 0);
}

- (NSString)flagDTOStrictModeEnabledKey
{
  return (NSString *)@"LA.dto.strictModeEnabled";
}

- (NSNumber)valueForFlagDTOStrictModeEnabled
{
  return (NSNumber *)__44__LACFlags_valueForFlagCompanionMockDevices__block_invoke((uint64_t)self, @"LA.dto.strictModeEnabled", 0);
}

- (NSString)flagDTOSecureRepairMockRepairTypeKey
{
  return (NSString *)@"LA.dto.sr.mock.repairType";
}

- (NSNumber)valueForFlagDTOSecureRepairMockRepairType
{
  return (NSNumber *)__44__LACFlags_valueForFlagCompanionMockDevices__block_invoke((uint64_t)self, @"LA.dto.sr.mock.repairType", 0);
}

- (NSString)flagDTOSecureRepairMockRepairTypeQueryLatencyKey
{
  return (NSString *)@"LA.dto.sr.mock.repairTypeQueryLatency";
}

- (NSNumber)valueForFlagDTOSecureRepairMockRepairTypeQueryLatency
{
  return (NSNumber *)__44__LACFlags_valueForFlagCompanionMockDevices__block_invoke((uint64_t)self, @"LA.dto.sr.mock.repairTypeQueryLatency", 0);
}

- (NSString)flagOnenessSessionActiveKey
{
  return (NSString *)@"LA.companion.sessionActive";
}

- (NSString)flagOnenessSessionAuthenticationKey
{
  return (NSString *)@"LA.companion.sessionAuthentication";
}

- (NSData)valueForFlagOnenessSessionAuthentication
{
  return (NSData *)__52__LACFlags_valueForFlagOnenessSessionAuthentication__block_invoke((uint64_t)self, @"LA.companion.sessionAuthentication", 0);
}

id __52__LACFlags_valueForFlagOnenessSessionAuthentication__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  if (os_variant_allows_internal_security_policies())
  {
    v6 = [MEMORY[0x263F08AB0] processInfo];
    v7 = [v6 environment];
    v8 = [v7 objectForKeyedSubscript:v4];

    if (v8)
    {
      id v9 = [MEMORY[0x263F08AB0] processInfo];
      v10 = [v9 environment];
      v11 = [v10 objectForKeyedSubscript:v4];
      id v12 = [v11 dataUsingEncoding:4];
    }
    else
    {
      id v13 = [MEMORY[0x263EFFA40] standardUserDefaults];
      id v9 = [v13 persistentDomainForName:*MEMORY[0x263F08100]];

      uint64_t v14 = [v9 objectForKeyedSubscript:v4];
      if (v14
        && (v15 = (void *)v14,
            [v9 objectForKeyedSubscript:v4],
            uint64_t v16 = objc_claimAutoreleasedReturnValue(),
            objc_opt_class(),
            char isKindOfClass = objc_opt_isKindOfClass(),
            v16,
            v15,
            (isKindOfClass & 1) != 0))
      {
        id v18 = [v9 objectForKeyedSubscript:v4];
      }
      else
      {
        id v18 = v5;
      }
      id v12 = v18;
    }
  }
  else
  {
    id v12 = v5;
  }

  return v12;
}

- (NSString)flagPreboardModeKey
{
  return (NSString *)@"LA.Preboard.Mode";
}

- (NSNumber)valueForFlagPreboardMode
{
  return (NSNumber *)__44__LACFlags_valueForFlagCompanionMockDevices__block_invoke((uint64_t)self, @"LA.Preboard.Mode", 0);
}

- (NSString)flagRunningInBATSKey
{
  return (NSString *)@"LA.RunningInBATS";
}

- (NSNumber)valueForFlagRunningInBATS
{
  return (NSNumber *)__44__LACFlags_valueForFlagCompanionMockDevices__block_invoke((uint64_t)self, @"LA.RunningInBATS", 0);
}

- (NSString)flagSharedModeActiveKey
{
  return (NSString *)@"LA.sharedMode.isActive";
}

- (NSString)flagSharedModeLatencyKey
{
  return (NSString *)@"LA.sharedMode.latency";
}

- (NSNumber)valueForFlagSharedModeLatency
{
  return (NSNumber *)__44__LACFlags_valueForFlagCompanionMockDevices__block_invoke((uint64_t)self, @"LA.sharedMode.latency", 0);
}

- (NSString)flagSecureUIMinDisplayTimeKey
{
  return (NSString *)@"LA.SecureUI.minDisplayTime";
}

- (NSNumber)valueForFlagSecureUIMinDisplayTime
{
  return (NSNumber *)__44__LACFlags_valueForFlagCompanionMockDevices__block_invoke((uint64_t)self, @"LA.SecureUI.minDisplayTime", 0);
}

- (BOOL)featureFlagApproveByMacFailureUIEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)featureFlagDimpleKeyGracePeriodEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)featureFlagDimpleKeySecureRepairEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)featureFlagPreboardEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)featureFlagPreboardDeveloperModeEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)featureFlagPreboardProtectedVariablesEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)featureFlagPreboardUPPEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)featureFlagSecureUIEnabled
{
  return _os_feature_enabled_impl();
}

@end