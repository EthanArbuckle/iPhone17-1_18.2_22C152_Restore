@interface HUResidentDeviceStatusBannerItem
- (id)_subclass_updateWithOptions:(id)a3;
@end

@implementation HUResidentDeviceStatusBannerItem

- (id)_subclass_updateWithOptions:(id)a3
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F68720]];
  if ([v5 BOOLValue])
  {

LABEL_4:
    v7 = (void *)MEMORY[0x1E4F7A0D8];
    v8 = (void *)MEMORY[0x1E4F69228];
    uint64_t v20 = *MEMORY[0x1E4F68B10];
    v21[0] = MEMORY[0x1E4F1CC38];
    v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
    v10 = [v8 outcomeWithResults:v9];
    v11 = [v7 futureWithResult:v10];

    goto LABEL_6;
  }
  char v6 = [MEMORY[0x1E4F69758] isPressDemoModeEnabled];

  if (v6) {
    goto LABEL_4;
  }
  v12 = (void *)MEMORY[0x1E4F7A0D8];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __64__HUResidentDeviceStatusBannerItem__subclass_updateWithOptions___block_invoke;
  v17[3] = &unk_1E6385D90;
  id v18 = v4;
  v19 = self;
  v13 = [MEMORY[0x1E4F7A0F0] globalAsyncScheduler];
  v14 = [v12 futureWithBlock:v17 scheduler:v13];
  v15 = [MEMORY[0x1E4F7A0F0] mainThreadScheduler];
  v11 = [v14 reschedule:v15];

  v9 = v18;
LABEL_6:

  return v11;
}

id __64__HUResidentDeviceStatusBannerItem__subclass_updateWithOptions___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *MEMORY[0x1E4F68B10];
  id v4 = a2;
  v5 = [v4 objectForKeyedSubscript:v3];
  int v6 = [v5 BOOLValue];

  if (v6)
  {
    v7 = [MEMORY[0x1E4F7A0D8] futureWithResult:v4];

    goto LABEL_35;
  }
  v8 = (void *)[v4 mutableCopy];

  v9 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F68BD0]];
  uint64_t v10 = [v9 count];
  v11 = *(void **)(a1 + 32);
  if (!v10)
  {
    v23 = [v11 sourceItem];
    v12 = [v23 home];

    uint64_t v24 = objc_msgSend(v12, "hf_remoteAccessState");
    v25 = [MEMORY[0x1E4F691A0] sharedDispatcher];
    v26 = [v25 homeManager];
    char v27 = [v26 residentProvisioningStatus];

    int v28 = objc_msgSend(v12, "hf_hasAppleTVs");
    int v29 = objc_msgSend(v12, "hf_hasHomePods");
    v30 = (uint64_t *)MEMORY[0x1E4F68920];
    if (v27)
    {
      v35 = @"HFStatusDetailsRemoteAccessAvailableButNeedsTwoFactorAuthTitle";
      if (v24 == 1) {
        v35 = @"HFStatusDetailsNeedsTwoFactorAuthTitle";
      }
      uint64_t v36 = *MEMORY[0x1E4F68AC0];
      v37 = v35;
      [v8 setObject:v37 forKeyedSubscript:v36];
      v38 = HFLocalizedString();

      [v8 setObject:v38 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];
      v39 = HFLocalizedString();
      uint64_t v40 = *MEMORY[0x1E4F68980];
    }
    else
    {
      int v31 = v29;
      if ((v27 & 2) != 0 && v24 == 1)
      {
        v32 = HFLocalizedString();
        [v8 setObject:v32 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];

        uint64_t v33 = *MEMORY[0x1E4F68AC0];
        if ((v28 & v31) == 1)
        {
          v34 = @"HFStatusDetailsNoRemoteAccessDescription_AppleTVHomePod";
        }
        else if (v28)
        {
          v34 = @"HFStatusDetailsNoRemoteAccessDescription_AppleTV";
        }
        else
        {
          if (!v31)
          {
            [v8 setObject:@"HFStatusDetailsNoRemoteAccessNotAtHomeTitle" forKeyedSubscript:v33];
            v52 = HFLogForCategory();
            if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
            {
              uint64_t v54 = *(void *)(a1 + 32);
              *(_DWORD *)buf = 138412290;
              uint64_t v56 = v54;
              _os_log_error_impl(&dword_1BE345000, v52, OS_LOG_TYPE_ERROR, "%@: Showing 'No Remote Access' banner but there are no HomePods or Apple TVs in the home.", buf, 0xCu);
            }

            goto LABEL_29;
          }
          v34 = @"HFStatusDetailsNoRemoteAccessDescription_HomePod";
        }
        [v8 setObject:v34 forKeyedSubscript:v33];
        v45 = HFLocalizedString();
        [v8 setObject:v45 forKeyedSubscript:*MEMORY[0x1E4F68980]];

LABEL_29:
        uint64_t v43 = *MEMORY[0x1E4F68948];
        v42 = v8;
        uint64_t v41 = 0;
        goto LABEL_30;
      }
      if (v24 != 1 || objc_msgSend(v12, "hf_isCurrentLocationHome"))
      {
        uint64_t v41 = MEMORY[0x1E4F1CC38];
        v42 = v8;
        uint64_t v43 = v3;
LABEL_30:
        [v42 setObject:v41 forKeyedSubscript:v43];
        goto LABEL_31;
      }
      if ((v28 | v31))
      {
        [v8 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:v3];
        v44 = HFLogForCategory();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        {
          uint64_t v53 = *(void *)(a1 + 32);
          *(_DWORD *)buf = 138412290;
          uint64_t v56 = v53;
          _os_log_error_impl(&dword_1BE345000, v44, OS_LOG_TYPE_ERROR, "%@: Hiding banner since there are HomePods or Apple TVs in the home that are still configuring.", buf, 0xCu);
        }

        goto LABEL_31;
      }
      v50 = HFLocalizedString();
      [v8 setObject:v50 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];

      [v8 setObject:@"HFStatusDetailsNoRemoteAccessTitle" forKeyedSubscript:*MEMORY[0x1E4F68AC0]];
      v39 = [MEMORY[0x1E4F696F8] aboutResidentDeviceURL];
      v51 = HFLocalizedString();
      [v8 setObject:v51 forKeyedSubscript:*MEMORY[0x1E4F68980]];

      uint64_t v40 = *v30;
    }
    [v8 setObject:v39 forKeyedSubscript:v40];

LABEL_31:
    uint64_t v46 = MEMORY[0x1E4F1CC38];
    [v8 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F68AF0]];
    [v8 setObject:v46 forKeyedSubscript:*MEMORY[0x1E4F68AE8]];
    v47 = [v8 objectForKeyedSubscript:*v30];

    if (v47)
    {
      v48 = _HULocalizedStringWithDefaultValue(@"HUBannerStatus_LearnMore", @"HUBannerStatus_LearnMore", 1);
      [v8 setObject:v48 forKeyedSubscript:*MEMORY[0x1E4F68948]];
    }
    [v8 setObject:&unk_1F19B4850 forKeyedSubscript:@"bannerItemCategory"];
    goto LABEL_34;
  }
  v12 = [v11 _sortedObjectDisplayNamesForHomeKitObjects:v9];
  uint64_t v13 = [v12 count];
  uint64_t v14 = *MEMORY[0x1E4F68AC0];
  if (v13 == 1)
  {
    [v8 setObject:@"HUBannerResidentDevice_Description_NotReady_OneObject" forKeyedSubscript:v14];
    v15 = [v12 objectAtIndexedSubscript:0];
    v22 = HULocalizedStringWithFormat(@"HUBannerResidentDevice_Description_NotReady_OneObject", @"%@", v16, v17, v18, v19, v20, v21, (uint64_t)v15);
    [v8 setObject:v22 forKeyedSubscript:*MEMORY[0x1E4F68980]];
  }
  else
  {
    [v8 setObject:@"HUBannerResidentDevice_Description_NotReady_MultipleObjects" forKeyedSubscript:v14];
    v15 = _HULocalizedStringWithDefaultValue(@"HUBannerResidentDevice_Description_NotReady_MultipleObjects", @"HUBannerResidentDevice_Description_NotReady_MultipleObjects", 1);
    [v8 setObject:v15 forKeyedSubscript:*MEMORY[0x1E4F68980]];
  }

LABEL_34:
  v7 = [MEMORY[0x1E4F7A0D8] futureWithResult:v8];

LABEL_35:

  return v7;
}

void __64__HUResidentDeviceStatusBannerItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  v10.receiver = *(id *)(a1 + 40);
  v10.super_class = (Class)HUResidentDeviceStatusBannerItem;
  id v4 = a2;
  v5 = objc_msgSendSuper2(&v10, sel__subclass_updateWithOptions_, v3);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __64__HUResidentDeviceStatusBannerItem__subclass_updateWithOptions___block_invoke_2;
  v9[3] = &unk_1E6389290;
  v9[4] = *(void *)(a1 + 40);
  int v6 = [v5 flatMap:v9];

  v7 = [v4 completionHandlerAdapter];

  id v8 = (id)[v6 addCompletionBlock:v7];
}

@end