@interface HMNetworkConfigurationProfile(HFAdditions)
+ (BOOL)hf_targetProtectionModeIsValid:()HFAdditions;
+ (id)_localizedStringForPurpose;
+ (id)_validCurrentModesForTargetModes;
+ (id)hf_detailedLocalizedDescriptionForTargetProtectionMode:()HFAdditions;
+ (id)hf_detailedLocalizedTitleForTargetProtectionMode:()HFAdditions;
+ (id)hf_localizedDescriptionForAllowedHostPurpose:()HFAdditions;
+ (id)hf_localizedDescriptionForCredentialType:()HFAdditions;
+ (id)hf_localizedTitleForTargetProtectionMode:()HFAdditions;
+ (uint64_t)hf_currentProtectionMode:()HFAdditions isValidForTargetProtectionMode:;
- (BOOL)hf_hasManagedNetworkCredential;
- (uint64_t)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;
- (uint64_t)hf_hasCurrentNetworkAccessViolation;
- (uint64_t)hf_hasProtectionModeMismatch;
- (uint64_t)hf_requiresManualWiFiReconfiguration;
- (uint64_t)hf_targetProtectionModeDetailedLocalizedDescription;
- (uint64_t)hf_targetProtectionModeDetailedLocalizedTitle;
- (uint64_t)hf_targetProtectionModeIsValid;
- (uint64_t)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;
@end

@implementation HMNetworkConfigurationProfile(HFAdditions)

- (uint64_t)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
{
  v2 = objc_opt_class();
  uint64_t v3 = [a1 targetProtectionMode];
  return objc_msgSend(v2, "hf_localizedTitleForTargetProtectionMode:", v3);
}

- (uint64_t)hf_targetProtectionModeDetailedLocalizedTitle
{
  v2 = objc_opt_class();
  uint64_t v3 = [a1 targetProtectionMode];
  return objc_msgSend(v2, "hf_detailedLocalizedTitleForTargetProtectionMode:", v3);
}

- (uint64_t)hf_targetProtectionModeDetailedLocalizedDescription
{
  v2 = objc_opt_class();
  uint64_t v3 = [a1 targetProtectionMode];
  return objc_msgSend(v2, "hf_detailedLocalizedDescriptionForTargetProtectionMode:", v3);
}

- (uint64_t)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
{
  v2 = objc_opt_class();
  uint64_t v3 = [a1 credentialType];
  return objc_msgSend(v2, "hf_localizedDescriptionForCredentialType:", v3);
}

- (uint64_t)hf_hasProtectionModeMismatch
{
  return objc_msgSend((id)objc_opt_class(), "hf_currentProtectionMode:isValidForTargetProtectionMode:", objc_msgSend(a1, "currentProtectionMode"), objc_msgSend(a1, "targetProtectionMode")) ^ 1;
}

- (uint64_t)hf_targetProtectionModeIsValid
{
  v2 = objc_opt_class();
  uint64_t v3 = [a1 targetProtectionMode];
  return objc_msgSend(v2, "hf_targetProtectionModeIsValid:", v3);
}

- (uint64_t)hf_hasCurrentNetworkAccessViolation
{
  v2 = [a1 accessViolation];
  if (v2)
  {
    uint64_t v3 = [a1 accessViolation];
    uint64_t v4 = [v3 hasCurrentViolation];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (BOOL)hf_hasManagedNetworkCredential
{
  return [a1 credentialType] == 3;
}

- (uint64_t)hf_requiresManualWiFiReconfiguration
{
  if ([a1 supportsWiFiReconfiguration])
  {
    v2 = [a1 accessory];
    int v3 = [v2 isReachable] ^ 1;
  }
  else
  {
    int v3 = 1;
  }
  return objc_msgSend(a1, "hf_requiresWiFiReconfiguration") & v3;
}

+ (id)hf_localizedTitleForTargetProtectionMode:()HFAdditions
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (a3)
  {
    if (a3 == 3)
    {
      uint64_t v4 = @"HFNetworkProtectionLevelOpen";
    }
    else if (a3 == 1)
    {
      uint64_t v4 = @"HFNetworkProtectionLevelHomeKit";
    }
    else
    {
      v5 = HFLogForCategory(0);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        int v8 = 134217984;
        uint64_t v9 = a3;
        _os_log_error_impl(&dword_20B986000, v5, OS_LOG_TYPE_ERROR, "Invalid targetProtectionMode %li", (uint8_t *)&v8, 0xCu);
      }

      uint64_t v4 = @"HFNetworkProtectionLevelUnknown";
    }
  }
  else
  {
    uint64_t v4 = @"HFNetworkProtectionLevelAuto";
  }
  v6 = _HFLocalizedStringWithDefaultValue(v4, v4, 1);
  return v6;
}

+ (id)hf_detailedLocalizedTitleForTargetProtectionMode:()HFAdditions
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (a3)
  {
    if (a3 == 3)
    {
      uint64_t v4 = @"HFNetworkProtectionLevelOpen_Detail";
    }
    else if (a3 == 1)
    {
      uint64_t v4 = @"HFNetworkProtectionLevelHomeKit_Detail";
    }
    else
    {
      v5 = HFLogForCategory(0);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        int v8 = 134217984;
        uint64_t v9 = a3;
        _os_log_error_impl(&dword_20B986000, v5, OS_LOG_TYPE_ERROR, "Invalid targetProtectionMode %li", (uint8_t *)&v8, 0xCu);
      }

      uint64_t v4 = @"HFNetworkProtectionLevelUnknown_Detail";
    }
  }
  else
  {
    uint64_t v4 = @"HFNetworkProtectionLevelAuto_Detail";
  }
  v6 = _HFLocalizedStringWithDefaultValue(v4, v4, 1);
  return v6;
}

+ (id)hf_detailedLocalizedDescriptionForTargetProtectionMode:()HFAdditions
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (a3)
  {
    if (a3 == 3)
    {
      uint64_t v4 = @"HFNetworkProtectionLevelOpen_Description";
    }
    else if (a3 == 1)
    {
      uint64_t v4 = @"HFNetworkProtectionLevelHomeKit_Description";
    }
    else
    {
      v5 = HFLogForCategory(0);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        int v8 = 134217984;
        uint64_t v9 = a3;
        _os_log_error_impl(&dword_20B986000, v5, OS_LOG_TYPE_ERROR, "Invalid targetProtectionMode %li", (uint8_t *)&v8, 0xCu);
      }

      uint64_t v4 = @"HFNetworkProtectionLevelUnknown_Description";
    }
  }
  else
  {
    uint64_t v4 = @"HFNetworkProtectionLevelAuto_Description";
  }
  v6 = _HFLocalizedStringWithDefaultValue(v4, v4, 1);
  return v6;
}

+ (id)hf_localizedDescriptionForAllowedHostPurpose:()HFAdditions
{
  uint64_t v4 = [(id)objc_opt_class() _localizedStringForPurpose];
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__21;
  v30 = __Block_byref_object_dispose__21;
  id v31 = [MEMORY[0x263EFF9C0] set];
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x2020000000;
  uint64_t v25 = a3;
  v5 = [v4 allKeys];
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  v16 = __91__HMNetworkConfigurationProfile_HFAdditions__hf_localizedDescriptionForAllowedHostPurpose___block_invoke;
  v17 = &unk_264097C90;
  uint64_t v21 = a3;
  v19 = &v26;
  id v6 = v4;
  id v18 = v6;
  v20 = &v22;
  objc_msgSend(v5, "na_each:", &v14);

  if (v23[3])
  {
    v7 = (void *)v27[5];
    int v8 = objc_msgSend(v6, "objectForKeyedSubscript:", &unk_26C0F7050, v14, v15, v16, v17);
    [v7 addObject:v8];
  }
  uint64_t v9 = (void *)MEMORY[0x263F08950];
  uint64_t v10 = objc_msgSend((id)v27[5], "allObjects", v14, v15, v16, v17);
  v11 = [v10 sortedArrayUsingSelector:sel_localizedStandardCompare_];
  v12 = [v9 localizedStringByJoiningStrings:v11];

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v26, 8);

  return v12;
}

+ (id)hf_localizedDescriptionForCredentialType:()HFAdditions
{
  if ((unint64_t)(a3 - 1) > 2) {
    int v3 = @"HFNetworkConfigurationCredential_Unknown";
  }
  else {
    int v3 = off_264097CB0[a3 - 1];
  }
  uint64_t v4 = _HFLocalizedStringWithDefaultValue(v3, v3, 1);
  return v4;
}

+ (BOOL)hf_targetProtectionModeIsValid:()HFAdditions
{
  uint64_t v4 = [a1 _validCurrentModesForTargetModes];
  v5 = [NSNumber numberWithInteger:a3];
  id v6 = [v4 objectForKeyedSubscript:v5];
  BOOL v7 = v6 != 0;

  return v7;
}

+ (uint64_t)hf_currentProtectionMode:()HFAdditions isValidForTargetProtectionMode:
{
  id v6 = [a1 _validCurrentModesForTargetModes];
  BOOL v7 = [NSNumber numberWithInteger:a4];
  int v8 = [v6 objectForKeyedSubscript:v7];

  uint64_t v9 = [NSNumber numberWithInteger:a3];
  uint64_t v10 = [v8 containsObject:v9];

  return v10;
}

+ (id)_validCurrentModesForTargetModes
{
  if (_MergedGlobals_285 != -1) {
    dispatch_once(&_MergedGlobals_285, &__block_literal_global_53_3);
  }
  v0 = (void *)qword_26AB2F888;
  return v0;
}

+ (id)_localizedStringForPurpose
{
  if (qword_26AB2F890 != -1) {
    dispatch_once(&qword_26AB2F890, &__block_literal_global_75_0);
  }
  v0 = (void *)qword_26AB2F898;
  return v0;
}

@end