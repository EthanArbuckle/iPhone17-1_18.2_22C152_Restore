@interface HMHomeManager(HFAdditions)
+ (id)hf_homeFutureForName:()HFAdditions;
- (HFMutableReorderableHomeKitItemList)hf_mutableOrderedHomesList;
- (id)hf_homeForName:()HFAdditions;
- (id)hf_homeForURL:()HFAdditions;
- (id)hf_homeWithIdentifier:()HFAdditions;
- (id)hf_orderedHomes;
- (id)hf_orderedHomesList;
- (id)hf_setHasSeenOnboardingWelcomeView:()HFAdditions;
- (id)hf_setOrderedHomes:()HFAdditions;
- (id)hf_setSeenNewFeaturesViewVersion:()HFAdditions;
- (id)hf_updateApplicationDataFuture;
- (uint64_t)hf_canAccessHomeRemotely:()HFAdditions;
- (uint64_t)hf_hasSeenOnboardingWelcomeView;
- (uint64_t)hf_lastNewFeaturesViewVersionSeen;
- (unint64_t)hf_hasDetectediCloudIssue;
- (void)hf_enableEventLogOnboardingFlag;
@end

@implementation HMHomeManager(HFAdditions)

- (uint64_t)hf_lastNewFeaturesViewVersionSeen
{
  v2 = objc_msgSend(a1, "_cached_lastOnboardingNewFeaturesVersionSeenNumber");
  v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    v5 = [a1 applicationData];
    id v4 = [v5 objectForKey:@"lastOnboardingNewFeaturesVersionSeen"];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v6 = [v4 integerValue];
  }
  else {
    uint64_t v6 = 0;
  }

  return v6;
}

- (unint64_t)hf_hasDetectediCloudIssue
{
  if ([a1 dataSyncState] == 1) {
    return ((unint64_t)[a1 status] >> 5) & 1;
  }
  else {
    return 1;
  }
}

- (uint64_t)hf_hasSeenOnboardingWelcomeView
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v2 = HFLogForCategory(9uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = objc_msgSend(a1, "_cached_hasSeenOnboardingWelcomeViewNumber");
    id v4 = [a1 applicationData];
    v5 = [v4 objectForKey:@"hasSeenOnboardingWelcomeView"];
    int v15 = 138412546;
    v16 = v3;
    __int16 v17 = 2112;
    v18 = v5;
    _os_log_impl(&dword_20B986000, v2, OS_LOG_TYPE_DEFAULT, "*** Cached_hasSeenOnboardingWelcomeViewNumber =  [%@] - applicationData = [%@] ***", (uint8_t *)&v15, 0x16u);
  }
  uint64_t v6 = HFLogForCategory(9uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = [a1 applicationData];
    v8 = [v7 dictionary];
    int v15 = 138412290;
    v16 = v8;
    _os_log_impl(&dword_20B986000, v6, OS_LOG_TYPE_DEFAULT, "*** applicationData = [%@] ***", (uint8_t *)&v15, 0xCu);
  }
  v9 = objc_msgSend(a1, "_cached_hasSeenOnboardingWelcomeViewNumber");
  v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    v12 = [a1 applicationData];
    id v11 = [v12 objectForKey:@"hasSeenOnboardingWelcomeView"];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v13 = [v11 BOOLValue];
  }
  else {
    uint64_t v13 = 0;
  }

  return v13;
}

- (id)hf_homeWithIdentifier:()HFAdditions
{
  id v4 = a3;
  v5 = [a1 homes];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __52__HMHomeManager_HFAdditions__hf_homeWithIdentifier___block_invoke;
  v9[3] = &unk_26408FFE0;
  id v10 = v4;
  id v6 = v4;
  v7 = objc_msgSend(v5, "na_firstObjectPassingTest:", v9);

  return v7;
}

- (HFMutableReorderableHomeKitItemList)hf_mutableOrderedHomesList
{
  objc_getAssociatedObject(a1, a2);
  id v4 = (HFMutableReorderableHomeKitItemList *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    id v4 = [(HFReorderableHomeKitItemList *)[HFMutableReorderableHomeKitItemList alloc] initWithApplicationDataContainer:a1 category:@"OrderedHomes"];
    objc_setAssociatedObject(a1, a2, v4, (void *)1);
  }
  return v4;
}

- (id)hf_orderedHomesList
{
  v1 = objc_msgSend(a1, "hf_mutableOrderedHomesList");
  v2 = (void *)[v1 copy];

  return v2;
}

- (id)hf_orderedHomes
{
  v2 = [a1 homes];
  v3 = objc_msgSend(a1, "hf_mutableOrderedHomesList");
  id v4 = [v3 sortedHomeKitObjectComparator];
  v5 = [v2 sortedArrayUsingComparator:v4];

  return v5;
}

- (id)hf_setOrderedHomes:()HFAdditions
{
  id v4 = a3;
  v5 = objc_msgSend(a1, "hf_mutableOrderedHomesList");
  [v5 setSortedHomeKitObjects:v4];

  id v6 = objc_msgSend(a1, "hf_mutableOrderedHomesList");
  v7 = [v6 saveWithSender:0];

  return v7;
}

+ (id)hf_homeFutureForName:()HFAdditions
{
  id v3 = a3;
  id v4 = +[HFHomeKitDispatcher sharedDispatcher];
  v5 = [v4 allHomesFuture];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __51__HMHomeManager_HFAdditions__hf_homeFutureForName___block_invoke;
  v9[3] = &unk_26408FAA0;
  id v10 = v3;
  id v6 = v3;
  v7 = [v5 flatMap:v9];

  return v7;
}

- (id)hf_homeForURL:()HFAdditions
{
  id v4 = a3;
  v5 = [[HFURLComponents alloc] initWithURL:v4];

  id v6 = [(HFURLComponents *)v5 valueForParameter:@"homeid"];
  if (v6)
  {
    v7 = [a1 homes];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __44__HMHomeManager_HFAdditions__hf_homeForURL___block_invoke;
    v10[3] = &unk_26408FFE0;
    id v11 = v6;
    v8 = objc_msgSend(v7, "na_firstObjectPassingTest:", v10);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)hf_homeForName:()HFAdditions
{
  id v4 = a3;
  v5 = objc_msgSend(a1, "hf_orderedHomes");
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __45__HMHomeManager_HFAdditions__hf_homeForName___block_invoke;
  v10[3] = &unk_26408FFE0;
  id v11 = v4;
  id v6 = v4;
  v7 = objc_msgSend(v5, "na_filter:", v10);

  if ([v7 count] == 1)
  {
    v8 = [v7 objectAtIndexedSubscript:0];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)hf_setHasSeenOnboardingWelcomeView:()HFAdditions
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v5 = HFLogForCategory(9uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [NSNumber numberWithBool:a3];
    *(_DWORD *)buf = 138412290;
    __int16 v17 = v6;
    _os_log_impl(&dword_20B986000, v5, OS_LOG_TYPE_DEFAULT, "*** Setting HasSeenOnboardingWelcomeView =  [%@]  ***", buf, 0xCu);
  }
  v7 = [NSNumber numberWithBool:a3];
  v8 = [a1 applicationData];
  [v8 setObject:v7 forKeyedSubscript:@"hasSeenOnboardingWelcomeView"];

  objc_msgSend(a1, "set_cached_hasSeenOnboardingWelcomeViewNumber:", v7);
  v9 = objc_msgSend(a1, "hf_updateApplicationDataFuture");
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __65__HMHomeManager_HFAdditions__hf_setHasSeenOnboardingWelcomeView___block_invoke;
  v13[3] = &unk_2640914C0;
  char v15 = a3;
  v13[4] = a1;
  id v14 = v7;
  id v10 = v7;
  id v11 = [v9 addCompletionBlock:v13];

  return v11;
}

- (id)hf_setSeenNewFeaturesViewVersion:()HFAdditions
{
  if (objc_msgSend(a1, "hf_lastNewFeaturesViewVersionSeen") <= a3)
  {
    id v6 = [NSNumber numberWithInteger:a3];
    v7 = [a1 applicationData];
    [v7 setObject:v6 forKeyedSubscript:@"lastOnboardingNewFeaturesVersionSeen"];

    objc_msgSend(a1, "set_cached_lastOnboardingNewFeaturesVersionSeenNumber:", v6);
    v8 = objc_msgSend(a1, "hf_updateApplicationDataFuture");
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __63__HMHomeManager_HFAdditions__hf_setSeenNewFeaturesViewVersion___block_invoke;
    v11[3] = &unk_2640914E8;
    id v12 = v6;
    uint64_t v13 = a3;
    v11[4] = a1;
    id v9 = v6;
    v5 = [v8 addCompletionBlock:v11];
  }
  else
  {
    v5 = [MEMORY[0x263F58190] futureWithNoResult];
  }
  return v5;
}

- (id)hf_updateApplicationDataFuture
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __60__HMHomeManager_HFAdditions__hf_updateApplicationDataFuture__block_invoke;
  v3[3] = &unk_26408CD50;
  v3[4] = a1;
  v1 = [MEMORY[0x263F58190] futureWithErrorOnlyHandlerAdapterBlock:v3];
  return v1;
}

- (void)hf_enableEventLogOnboardingFlag
{
  id v1 = [a1 homes];
  objc_msgSend(v1, "na_each:", &__block_literal_global_52);
}

- (uint64_t)hf_canAccessHomeRemotely:()HFAdditions
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([a1 residentProvisioningStatus])
  {
    id v6 = HFLogForCategory(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v10 = 138412290;
      id v11 = v4;
      v7 = "No remote access to %@. Some resident on the account needs 2FA.";
      goto LABEL_15;
    }
  }
  else
  {
    uint64_t v5 = objc_msgSend(v4, "hf_remoteAccessState");
    if (([a1 residentProvisioningStatus] & 2) != 0 && v5 == 1)
    {
      id v6 = HFLogForCategory(0);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        int v10 = 138412290;
        id v11 = v4;
        v7 = "No remote access to %@. A resident that cannot be seen requires a key transfer and there are no enabled res"
             "ident devices on the account.";
LABEL_15:
        _os_log_error_impl(&dword_20B986000, v6, OS_LOG_TYPE_ERROR, v7, (uint8_t *)&v10, 0xCu);
      }
    }
    else
    {
      if (v5 != 1 || (objc_msgSend(v4, "hf_isCurrentLocationHome") & 1) != 0)
      {
        uint64_t v8 = 1;
        goto LABEL_8;
      }
      id v6 = HFLogForCategory(0);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        int v10 = 138412290;
        id v11 = v4;
        v7 = "No remote access to %@. there are no enabled resident devices on the account and the user is not home.";
        goto LABEL_15;
      }
    }
  }

  uint64_t v8 = 0;
LABEL_8:

  return v8;
}

@end