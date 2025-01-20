@interface HUFirmwareUpdateStatusBannerItem
- (id)_subclass_updateWithOptions:(id)a3;
@end

@implementation HUFirmwareUpdateStatusBannerItem

- (id)_subclass_updateWithOptions:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)HUFirmwareUpdateStatusBannerItem;
  v4 = [(HUStatusBannerItem *)&v8 _subclass_updateWithOptions:a3];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__HUFirmwareUpdateStatusBannerItem__subclass_updateWithOptions___block_invoke;
  v7[3] = &unk_1E6389290;
  v7[4] = self;
  v5 = [v4 flatMap:v7];

  return v5;
}

id __64__HUFirmwareUpdateStatusBannerItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *MEMORY[0x1E4F68B10];
  v5 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F68B10]];
  int v6 = [v5 BOOLValue];

  if (v6)
  {
    v7 = [MEMORY[0x1E4F7A0D8] futureWithResult:v3];
  }
  else
  {
    objc_super v8 = (void *)[v3 mutableCopy];
    v9 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F68BD0]];
    uint64_t v19 = 0;
    v20 = &v19;
    uint64_t v21 = 0x3032000000;
    v22 = __Block_byref_object_copy__22;
    v23 = __Block_byref_object_dispose__22;
    id v24 = 0;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __64__HUFirmwareUpdateStatusBannerItem__subclass_updateWithOptions___block_invoke_1;
    v18[3] = &unk_1E638D590;
    v18[4] = &v19;
    v10 = objc_msgSend(v9, "na_filter:", v18);
    if ([v10 count])
    {
      uint64_t v11 = [v10 count];
      v12 = @"HUBannerFirmwareUpdate_Title_Multiple";
      if (v11 == 1) {
        v12 = @"HUBannerFirmwareUpdate_Title";
      }
      v13 = v12;
      [v8 setObject:v13 forKeyedSubscript:*MEMORY[0x1E4F68AC0]];
      v14 = _HULocalizedStringWithDefaultValue(v13, v13, 1);
      [v8 setObject:v14 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];

      v15 = [*(id *)(a1 + 32) _descriptionForLocalizedStringKey:@"HUBannerFirmwareUpdate_Description" representedHomeKitObjects:v10];
      [v8 setObject:v15 forKeyedSubscript:*MEMORY[0x1E4F68980]];

      v16 = (void *)[objc_alloc(MEMORY[0x1E4F691D0]) initWithSystemImageNamed:@"square.and.arrow.down.fill"];
      [v8 setObject:v16 forKeyedSubscript:*MEMORY[0x1E4F689E8]];

      [v8 setObject:&unk_1F19B4880 forKeyedSubscript:@"bannerItemCategory"];
      if (objc_msgSend((id)v20[5], "hf_currentUserIsRestrictedGuest")) {
        [v8 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:v4];
      }
    }
    else
    {
      [v8 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:v4];
    }
    v7 = [MEMORY[0x1E4F7A0D8] futureWithResult:v8];

    _Block_object_dispose(&v19, 8);
  }

  return v7;
}

uint64_t __64__HUFirmwareUpdateStatusBannerItem__subclass_updateWithOptions___block_invoke_1(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;

  uint64_t v7 = [v6 home];
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  if (objc_msgSend(v6, "hf_isReadyToInstallSoftwareUpdate")
    && [v6 isControllable])
  {
    char v10 = objc_msgSend(v6, "hf_isHomePod");
    uint64_t v11 = [v6 home];
    v12 = v11;
    if (v10) {
      int v13 = [v11 isAutomaticSoftwareUpdateEnabled];
    }
    else {
      int v13 = objc_msgSend(v11, "hf_isAutomaticThirdPartyAccessorySoftwareUpdateEnabled");
    }
    uint64_t v14 = v13 ^ 1u;
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

@end