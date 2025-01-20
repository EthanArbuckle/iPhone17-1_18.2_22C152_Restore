@interface HMMediaSystem
@end

@implementation HMMediaSystem

void __50__HMMediaSystem_HFAdditions__hf_fakeDebugSymptoms__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "hf_fakeDebugSymptoms");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  v3 = [v4 allObjects];
  [v2 addObjectsFromArray:v3];
}

uint64_t __66__HMMediaSystem_HFIncludedContextProtocol__hf_isOnForContextType___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isOnForContextType:", *(void *)(a1 + 32));
}

uint64_t __68__HMMediaSystem_HFIncludedContextProtocol__hf_hasSetForContextType___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_hasSetForContextType:", *(void *)(a1 + 32));
}

uint64_t __72__HMMediaSystem_HFIncludedContextProtocol__hf_shouldHideForContextType___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_shouldHideForContextType:", *(void *)(a1 + 32));
}

BOOL __61__HMMediaSystem_HFHomeKitObjectConformance__hf_isValidObject__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 mediaProfile];
  v3 = [v2 accessory];
  id v4 = [v3 home];
  BOOL v5 = v4 != 0;

  return v5;
}

uint64_t __61__HMMediaSystem_HFHomeKitObjectConformance__hf_isValidObject__block_invoke_2(uint64_t a1, void *a2)
{
  v3 = [a2 uniqueIdentifier];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

uint64_t __64__HMMediaSystem_HFMediaAccessoryProfileAdditions__mediaProfiles__block_invoke(uint64_t a1, void *a2)
{
  return [a2 mediaProfile];
}

uint64_t __72__HMMediaSystem_HFMediaAccessoryProfileAdditions__hf_isCurrentAccessory__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isCurrentAccessory];
}

uint64_t __65__HMMediaSystem_HFMediaAccessoryProfileAdditions__hf_isReachable__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  int v3 = [v2 isReachable];
  int v4 = objc_msgSend(v2, "hf_fakeUnreachableError");

  return v3 & ~v4;
}

uint64_t __75__HMMediaSystem_HFMediaAccessoryProfileAdditions__hf_isAppleMusicReachable__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 remoteLoginHandler];
  uint64_t v3 = [v2 isControllable];

  return v3;
}

uint64_t __82__HMMediaSystem_HFMediaAccessoryProfileAdditions__hf_isAccessorySettingsReachable__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 settings];
  uint64_t v3 = [v2 isControllable];

  return v3;
}

id __75__HMMediaSystem_HFMediaAccessoryProfileAdditions__homekitObjectIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 accessory];
  uint64_t v3 = [v2 uniqueIdentifier];

  return v3;
}

id __90__HMMediaSystem_HFMediaAccessoryProfileAdditions__hf_appleMusicCurrentLoggedInAccountDSID__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 mediaProfile];
  uint64_t v3 = objc_msgSend(v2, "hf_appleMusicCurrentLoggedInAccountDSID");

  return v3;
}

void __86__HMMediaSystem_HFMediaAccessoryProfileAdditions__hf_homePodSupportsMultiUserLanguage__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc_init(MEMORY[0x263F285E0]);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __86__HMMediaSystem_HFMediaAccessoryProfileAdditions__hf_homePodSupportsMultiUserLanguage__block_invoke_2;
  v6[3] = &unk_2640988D8;
  id v7 = v3;
  long long v8 = *(_OWORD *)(a1 + 32);
  id v5 = v3;
  [v4 fetchSupportedMultiUserLanguageCodes:v6];
}

void __86__HMMediaSystem_HFMediaAccessoryProfileAdditions__hf_homePodSupportsMultiUserLanguage__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = HFLogForCategory(0);
  long long v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v26 = NSStringFromSelector(*(SEL *)(a1 + 48));
      int v27 = 138412546;
      v28 = v26;
      __int16 v29 = 2112;
      id v30 = v6;
      _os_log_error_impl(&dword_20B986000, v8, OS_LOG_TYPE_ERROR, "%@ Error fetching voice recognition languages [%@]", (uint8_t *)&v27, 0x16u);
    }
    [*(id *)(a1 + 32) finishWithNoResult];
    goto LABEL_20;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(void **)(a1 + 40);
    v10 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v27 = 138412802;
    v28 = v9;
    __int16 v29 = 2112;
    id v30 = v10;
    __int16 v31 = 2112;
    id v32 = v5;
    _os_log_impl(&dword_20B986000, v8, OS_LOG_TYPE_DEFAULT, "%@:%@ Supported voice recognition languages %@", (uint8_t *)&v27, 0x20u);
  }
  v11 = [*(id *)(a1 + 40) accessories];
  v12 = [v11 anyObject];
  if (objc_msgSend(v12, "hf_isSiriEndpoint"))
  {

LABEL_10:
    v16 = objc_msgSend(*(id *)(a1 + 40), "hf_siriLanguageOptionsManager");
    v17 = [v16 selectedLanguageOption];
    goto LABEL_15;
  }
  v13 = +[HFHomeKitDispatcher sharedDispatcher];
  v14 = [v13 homeManager];
  int v15 = [v14 hasOptedToHH2];

  if (v15) {
    goto LABEL_10;
  }
  v16 = objc_msgSend(*(id *)(a1 + 40), "hf_settingsAdapterManager");
  v18 = [v16 adapterForIdentifier:@"SiriLanguageAdapter"];
  objc_opt_class();
  id v19 = v18;
  if (objc_opt_isKindOfClass()) {
    v20 = v19;
  }
  else {
    v20 = 0;
  }
  id v21 = v20;

  v17 = [v21 selectedLanguageOption];

LABEL_15:
  if (v17
    && ([v17 recognitionLanguage],
        v22 = objc_claimAutoreleasedReturnValue(),
        char v23 = [v5 containsObject:v22],
        v22,
        (v23 & 1) != 0))
  {
    [*(id *)(a1 + 32) finishWithNoResult];
  }
  else
  {
    v24 = *(void **)(a1 + 32);
    v25 = objc_msgSend(MEMORY[0x263F087E8], "hf_errorWithCode:", 45);
    [v24 finishWithError:v25];
  }
LABEL_20:
}

uint64_t __81__HMMediaSystem_HFMediaAccessoryProfileAdditions__hf_isForcedVisibleInHomeStatus__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isForcedVisibleInHomeStatus");
}

void __62__HMMediaSystem_HFMediaAccessoryProfileAdditions__hf_tileSize__block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = +[HFHomeKitObjectSettingsStore tileSizeForObject:a2];
  objc_msgSend(v2, "na_safeAddObject:", v3);
}

id __66__HMMediaSystem_HFMediaAccessoryProfileAdditions__hf_setTileSize___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[HFHomeKitObjectSettingsStore setTileSize:*(void *)(a1 + 32) forObject:a2];
}

uint64_t __66__HMMediaSystem_HFMediaAccessoryProfileAdditions__hf_setTileSize___block_invoke_2()
{
  return [MEMORY[0x263F58190] futureWithNoResult];
}

id __71__HMMediaSystem_HFMediaAccessoryProfileAdditions__hf_containedServices__block_invoke(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x263EFFA08];
  id v3 = [a2 services];
  id v4 = [v2 setWithArray:v3];

  return v4;
}

uint64_t __78__HMMediaSystem_HFMediaAccessoryProfileAdditions__hf_containedCharacteristics__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_containedCharacteristics");
}

uint64_t __63__HMMediaSystem_HFMediaAccessoryProfileAdditions__hf_isInRoom___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 room];
  id v4 = [v3 uniqueIdentifier];
  id v5 = [*(id *)(a1 + 32) uniqueIdentifier];
  uint64_t v6 = objc_msgSend(v4, "hmf_isEqualToUUID:", v5);

  return v6;
}

uint64_t __62__HMMediaSystem_HFMediaAccessoryProfileAdditions__hf_safeRoom__block_invoke(uint64_t a1, void *a2)
{
  return [a2 room];
}

uint64_t __65__HMMediaSystem_HFMediaAccessoryProfileAdditions__hf_moveToRoom___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_moveToRoom:", *(void *)(a1 + 32));
}

uint64_t __62__HMMediaSystem_HFMediaAccessoryProfileAdditions__hf_identify__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_identifyHomePod");
}

@end