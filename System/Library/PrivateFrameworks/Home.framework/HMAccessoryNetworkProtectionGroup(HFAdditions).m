@interface HMAccessoryNetworkProtectionGroup(HFAdditions)
+ (id)hf_updateProtectionMode:()HFAdditions forGroups:;
- (id)hf_home;
- (id)hf_networkConfigurationProfiles;
- (id)hf_title;
- (id)hf_updateProtectionMode:()HFAdditions;
- (uint64_t)hf_displayCurrentProtectionMode;
@end

@implementation HMAccessoryNetworkProtectionGroup(HFAdditions)

- (id)hf_networkConfigurationProfiles
{
  v1 = [a1 accessories];
  v2 = objc_msgSend(v1, "na_flatMap:", &__block_literal_global_61);

  return v2;
}

- (id)hf_home
{
  v1 = [a1 accessories];
  v2 = [v1 firstObject];
  v3 = [v2 home];

  return v3;
}

- (id)hf_title
{
  v2 = [a1 manufacturer];
  v3 = (void *)MEMORY[0x263F0DF00];
  v4 = [a1 category];
  v5 = [v4 categoryType];
  v14 = objc_msgSend(v3, "hf_userFriendlyLocalizedCapitalizedDescription:", v5);
  v12 = HFLocalizedStringWithFormat(@"HFNetworkProtectionTitleFormat", @"%@ %@", v6, v7, v8, v9, v10, v11, (uint64_t)v2);

  return v12;
}

- (uint64_t)hf_displayCurrentProtectionMode
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v2 = objc_msgSend(a1, "hf_networkConfigurationProfiles");
  v3 = objc_msgSend(v2, "na_map:", &__block_literal_global_14_0);

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = [&unk_26C0F8188 countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(&unk_26C0F8188);
        }
        uint64_t v8 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ([v3 containsObject:v8])
        {
          uint64_t v12 = [v8 unsignedIntegerValue];
          goto LABEL_13;
        }
      }
      uint64_t v5 = [&unk_26C0F8188 countByEnumeratingWithState:&v14 objects:v20 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  uint64_t v9 = HFLogForCategory(0x3AuLL);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v19 = a1;
    _os_log_error_impl(&dword_20B986000, v9, OS_LOG_TYPE_ERROR, "Invalid current protection mode for group %@", buf, 0xCu);
  }

  uint64_t v10 = objc_msgSend(a1, "hf_networkConfigurationProfiles");
  uint64_t v11 = [v10 firstObject];
  uint64_t v12 = [v11 currentProtectionMode];

LABEL_13:
  return v12;
}

- (id)hf_updateProtectionMode:()HFAdditions
{
  objc_initWeak(&location, val);
  uint64_t v4 = (void *)MEMORY[0x263F58190];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __74__HMAccessoryNetworkProtectionGroup_HFAdditions__hf_updateProtectionMode___block_invoke;
  v7[3] = &unk_264091E98;
  objc_copyWeak(v8, &location);
  v8[1] = a3;
  uint64_t v5 = [v4 futureWithErrorOnlyHandlerAdapterBlock:v7];
  objc_destroyWeak(v8);
  objc_destroyWeak(&location);
  return v5;
}

+ (id)hf_updateProtectionMode:()HFAdditions forGroups:
{
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __84__HMAccessoryNetworkProtectionGroup_HFAdditions__hf_updateProtectionMode_forGroups___block_invoke;
  v9[3] = &__block_descriptor_40_e43__16__0__HMAccessoryNetworkProtectionGroup_8l;
  v9[4] = a3;
  uint64_t v4 = objc_msgSend(a4, "na_map:", v9);
  uint64_t v5 = (void *)MEMORY[0x263F58190];
  uint64_t v6 = [v4 allObjects];
  uint64_t v7 = [v5 combineAllFutures:v6];

  return v7;
}

@end