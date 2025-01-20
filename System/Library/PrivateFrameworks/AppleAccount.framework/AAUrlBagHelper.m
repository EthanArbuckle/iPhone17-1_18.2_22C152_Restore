@interface AAUrlBagHelper
+ (BOOL)canRepairBeneficiary;
+ (BOOL)canRepairCustodian;
+ (BOOL)isLCInviteAcceptanceEnabled;
+ (int64_t)maxRepairCount;
+ (int64_t)maxRepairCountForBeneficiaries;
@end

@implementation AAUrlBagHelper

+ (BOOL)canRepairCustodian
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F4F0C8] sharedBag];
  v3 = [v2 configurationAtKey:@"custodianCfgsV2"];

  v4 = _AALogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    v13 = v3;
    _os_log_impl(&dword_1A11D8000, v4, OS_LOG_TYPE_DEFAULT, "custodianCfgsV2 from urlbag: %@", (uint8_t *)&v12, 0xCu);
  }

  v5 = [v3 objectForKeyedSubscript:@"canRepairCustodianV2"];
  if (v5)
  {
    v6 = _AALogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      v13 = v5;
      _os_log_impl(&dword_1A11D8000, v6, OS_LOG_TYPE_DEFAULT, "Returning canRepairCustodianV2 from urlbag: %@", (uint8_t *)&v12, 0xCu);
    }

    char v7 = [v5 BOOLValue];
  }
  else
  {
    int v8 = _os_feature_enabled_impl();
    v9 = _AALogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 67109120;
      LODWORD(v13) = v8;
      _os_log_impl(&dword_1A11D8000, v9, OS_LOG_TYPE_DEFAULT, "Returning canRepairCustodian based on feature flag: %d", (uint8_t *)&v12, 8u);
    }

    char v7 = _os_feature_enabled_impl();
  }
  BOOL v10 = v7;

  return v10;
}

+ (BOOL)canRepairBeneficiary
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F4F0C8] sharedBag];
  v3 = [v2 configurationAtKey:@"inheritanceCfgs"];

  v4 = _AALogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    BOOL v10 = v3;
    _os_log_impl(&dword_1A11D8000, v4, OS_LOG_TYPE_DEFAULT, "inheritanceCfgs from urlbag: %@", (uint8_t *)&v9, 0xCu);
  }

  v5 = [v3 objectForKeyedSubscript:@"canRepairBeneficiaries"];
  if (v5)
  {
    v6 = _AALogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      BOOL v10 = v5;
      _os_log_impl(&dword_1A11D8000, v6, OS_LOG_TYPE_DEFAULT, "Returning canRepairBeneficiary from urlbag: %@", (uint8_t *)&v9, 0xCu);
    }

    LOBYTE(v6) = [v5 BOOLValue];
  }
  else
  {
    LODWORD(v6) = _os_feature_enabled_impl();
    char v7 = _AALogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 67109120;
      LODWORD(v10) = v6;
      _os_log_impl(&dword_1A11D8000, v7, OS_LOG_TYPE_DEFAULT, "Returning canRepairCustodian based on feature flag: %d", (uint8_t *)&v9, 8u);
    }
  }
  return (char)v6;
}

+ (int64_t)maxRepairCount
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F4F0C8] sharedBag];
  v3 = [v2 configurationAtKey:@"custodianCfgsV2"];

  v4 = _AALogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    uint64_t v11 = v3;
    _os_log_impl(&dword_1A11D8000, v4, OS_LOG_TYPE_DEFAULT, "custodianCfgsV2 from urlbag: %@", (uint8_t *)&v10, 0xCu);
  }

  v5 = [v3 objectForKeyedSubscript:@"maxRepairCountV2"];
  v6 = _AALogSystem();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      int v10 = 138412290;
      uint64_t v11 = v5;
      _os_log_impl(&dword_1A11D8000, v6, OS_LOG_TYPE_DEFAULT, "Returning maxRepairCountV2 from urlbag: %@", (uint8_t *)&v10, 0xCu);
    }

    int64_t v8 = [v5 integerValue];
  }
  else
  {
    if (v7)
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_1A11D8000, v6, OS_LOG_TYPE_DEFAULT, "Returning maxRepairCount default value: 1", (uint8_t *)&v10, 2u);
    }

    int64_t v8 = 1;
  }

  return v8;
}

+ (int64_t)maxRepairCountForBeneficiaries
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F4F0C8] sharedBag];
  v3 = [v2 configurationAtKey:@"inheritanceCfgs"];

  v4 = _AALogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    uint64_t v11 = v3;
    _os_log_impl(&dword_1A11D8000, v4, OS_LOG_TYPE_DEFAULT, "beneficiaryCfgs from urlbag: %@", (uint8_t *)&v10, 0xCu);
  }

  v5 = [v3 objectForKeyedSubscript:@"maxRepairCount"];
  v6 = _AALogSystem();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      int v10 = 138412290;
      uint64_t v11 = v5;
      _os_log_impl(&dword_1A11D8000, v6, OS_LOG_TYPE_DEFAULT, "Returning maxRepairCount from urlbag: %@", (uint8_t *)&v10, 0xCu);
    }

    int64_t v8 = [v5 integerValue];
  }
  else
  {
    if (v7)
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_1A11D8000, v6, OS_LOG_TYPE_DEFAULT, "Returning maxRepairCount default value: 1", (uint8_t *)&v10, 2u);
    }

    int64_t v8 = 1;
  }

  return v8;
}

+ (BOOL)isLCInviteAcceptanceEnabled
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F4F0C8] sharedBag];
  v3 = [v2 configurationAtKey:@"inheritanceCfgs"];

  v4 = _AALogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    int v10 = v3;
    _os_log_impl(&dword_1A11D8000, v4, OS_LOG_TYPE_DEFAULT, "LCInvite: inheritanceCfgs from urlbag: %@", (uint8_t *)&v9, 0xCu);
  }

  v5 = [v3 objectForKeyedSubscript:@"inviteAcceptance"];
  if (v5)
  {
    v6 = _AALogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      int v10 = v5;
      _os_log_impl(&dword_1A11D8000, v6, OS_LOG_TYPE_DEFAULT, "LCInvite: Returning LCInviteAcceptance from urlbag: %@", (uint8_t *)&v9, 0xCu);
    }

    LOBYTE(v6) = [v5 BOOLValue];
  }
  else
  {
    LODWORD(v6) = _os_feature_enabled_impl();
    BOOL v7 = _AALogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 67109120;
      LODWORD(v10) = v6;
      _os_log_impl(&dword_1A11D8000, v7, OS_LOG_TYPE_DEFAULT, "LCInvite: No IdMS feature flag found. is OS FeatureFlag Enabled %d", (uint8_t *)&v9, 8u);
    }
  }
  return (char)v6;
}

@end