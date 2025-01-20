@interface HUSoftwareUpdateSettingsItem
+ (id)footerTitleForHome:(id)a3;
- (BOOL)_shouldShowSoftwareUpdateIcon;
- (HMHome)home;
- (HUSoftwareUpdateSettingsItem)initWithHome:(id)a3;
- (id)_subclass_updateWithOptions:(id)a3;
- (id)description;
- (void)setHome:(id)a3;
@end

@implementation HUSoftwareUpdateSettingsItem

- (HUSoftwareUpdateSettingsItem)initWithHome:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HUSoftwareUpdateSettingsItem;
  v6 = [(HUSoftwareUpdateSettingsItem *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_home, a3);
  }

  return v7;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  v4 = objc_opt_new();
  id v5 = _HULocalizedStringWithDefaultValue(@"HUEditLocationSoftwareUpdateTitle", @"HUEditLocationSoftwareUpdateTitle", 1);
  [v4 setObject:v5 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];

  uint64_t v6 = *MEMORY[0x1E4F68940];
  [v4 setObject:&unk_1F19B4FD0 forKeyedSubscript:*MEMORY[0x1E4F68940]];
  [v4 setObject:@"Home.HomeSettings.SoftwareUpdate" forKeyedSubscript:*MEMORY[0x1E4F68928]];
  if ([(HUSoftwareUpdateSettingsItem *)self _shouldShowSoftwareUpdateIcon])
  {
    id v7 = objc_alloc(MEMORY[0x1E4F691D0]);
    v8 = [MEMORY[0x1E4F42A98] configurationWithPointSize:24.0];
    objc_super v9 = (void *)[v7 initWithSystemImageNamed:@"square.and.arrow.down.fill" configuration:v8];
    [v4 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F689E8]];
  }
  id v10 = objc_alloc(MEMORY[0x1E4F695B0]);
  v11 = [(HUSoftwareUpdateSettingsItem *)self home];
  v12 = [v11 accessories];
  v13 = (void *)[v10 initWithAccessories:v12];

  v14 = [(HUSoftwareUpdateSettingsItem *)self home];
  int v15 = objc_msgSend(v14, "hf_hasFirstPartyAccessoriesSupportingSoftwareUpdate");

  v16 = [(HUSoftwareUpdateSettingsItem *)self home];
  int v17 = objc_msgSend(v16, "hf_hasThirdPartyAccessoriesSupportingSoftwareUpdate");

  v18 = (uint64_t *)MEMORY[0x1E4F68980];
  if (v15 && v17)
  {
    v19 = [(HUSoftwareUpdateSettingsItem *)self home];
    if ([v19 isAutomaticSoftwareUpdateEnabled])
    {
      v20 = [(HUSoftwareUpdateSettingsItem *)self home];
      char v21 = objc_msgSend(v20, "hf_isAutomaticThirdPartyAccessorySoftwareUpdateEnabled");

      if (v21) {
        goto LABEL_23;
      }
    }
    else
    {
    }
    v22 = [(HUSoftwareUpdateSettingsItem *)self home];
    char v23 = [v22 isAutomaticSoftwareUpdateEnabled];

    if (v23)
    {
      v24 = @"HUSoftwareUpdateAutomaticSetting_FirstParty";
    }
    else
    {
      v25 = [(HUSoftwareUpdateSettingsItem *)self home];
      char v26 = objc_msgSend(v25, "hf_isAutomaticThirdPartyAccessorySoftwareUpdateEnabled");

      if ((v26 & 1) == 0) {
        goto LABEL_26;
      }
      v24 = @"HUSoftwareUpdateAutomaticSetting_ThirdParty";
    }
    goto LABEL_24;
  }
  if (v15)
  {
    v16 = [(HUSoftwareUpdateSettingsItem *)self home];
    if ([v16 isAutomaticSoftwareUpdateEnabled])
    {

      goto LABEL_23;
    }
    if ((v17 & 1) == 0)
    {
LABEL_25:

      goto LABEL_26;
    }
  }
  else if (!v17)
  {
    goto LABEL_26;
  }
  v27 = [(HUSoftwareUpdateSettingsItem *)self home];
  int v28 = objc_msgSend(v27, "hf_isAutomaticThirdPartyAccessorySoftwareUpdateEnabled");

  if (!v15)
  {
    if (!v28) {
      goto LABEL_26;
    }
    goto LABEL_23;
  }

  if (v28)
  {
LABEL_23:
    v24 = @"HUSoftwareUpdateAutomaticSetting_All";
LABEL_24:
    v16 = _HULocalizedStringWithDefaultValue(v24, v24, 1);
    [v4 setObject:v16 forKeyedSubscript:*v18];
    goto LABEL_25;
  }
LABEL_26:
  uint64_t v29 = *v18;
  v30 = [v4 objectForKeyedSubscript:*v18];

  if (!v30)
  {
    if ([v13 updatesReadyToInstall])
    {
      [v4 setObject:&unk_1F19B4FE8 forKeyedSubscript:v6];
      uint64_t v31 = [v13 updatesReadyToInstall];
      v32 = [NSNumber numberWithUnsignedInteger:v31];
      [v4 setObject:v32 forKeyedSubscript:*MEMORY[0x1E4F68930]];

      [v4 setObject:0 forKeyedSubscript:v29];
    }
    else
    {
      v33 = _HULocalizedStringWithDefaultValue(@"HUSoftwareUpdateAutomaticSetting_Off", @"HUSoftwareUpdateAutomaticSetting_Off", 1);
      [v4 setObject:v33 forKeyedSubscript:v29];
    }
  }
  v34 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v35 = objc_opt_class();
  uint64_t v36 = objc_opt_class();
  v37 = objc_msgSend(v34, "setWithObjects:", v35, v36, objc_opt_class(), 0);
  [v4 setObject:v37 forKeyedSubscript:*MEMORY[0x1E4F68900]];

  v38 = (void *)MEMORY[0x1E4F1CAD0];
  v39 = [(HUSoftwareUpdateSettingsItem *)self home];
  v40 = [v38 setWithObject:v39];
  [v4 setObject:v40 forKeyedSubscript:*MEMORY[0x1E4F68908]];

  uint64_t v41 = MEMORY[0x1E4F1CC38];
  [v4 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F68B00]];
  [v4 setObject:v41 forKeyedSubscript:*MEMORY[0x1E4F68A78]];
  if (![v13 allUpdates])
  {
    v42 = [(HUSoftwareUpdateSettingsItem *)self home];
    char v43 = objc_msgSend(v42, "hf_shouldShowSoftwareUpdateSettings");

    if ((v43 & 1) == 0) {
      [v4 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F68B10]];
    }
  }
  v44 = (void *)MEMORY[0x1E4F7A0D8];
  v45 = [MEMORY[0x1E4F69228] outcomeWithResults:v4];
  v46 = [v44 futureWithResult:v45];

  return v46;
}

+ (id)footerTitleForHome:(id)a3
{
  id v3 = a3;
  int v4 = objc_msgSend(v3, "hf_hasFirstPartyAccessoriesSupportingSoftwareUpdate");
  int v5 = objc_msgSend(v3, "hf_hasThirdPartyAccessoriesSupportingSoftwareUpdate");
  if (v4 && v5)
  {
    if ([v3 isAutomaticSoftwareUpdateEnabled]
      && objc_msgSend(v3, "hf_isAutomaticThirdPartyAccessorySoftwareUpdateEnabled"))
    {
      uint64_t v6 = @"HUSoftwareUpdateAutomaticSetting_All_Footer";
      goto LABEL_21;
    }
    if ([v3 isAutomaticSoftwareUpdateEnabled])
    {
      id v7 = _HULocalizedStringWithDefaultValue(@"HUSoftwareUpdateAutomaticSetting_FirstParty_On_Footer", @"HUSoftwareUpdateAutomaticSetting_FirstParty_On_Footer", 1);
    }
    else
    {
      int v8 = objc_msgSend(v3, "hf_isAutomaticThirdPartyAccessorySoftwareUpdateEnabled");
      id v7 = _HULocalizedStringWithDefaultValue(@"HUSoftwareUpdateAutomaticSetting_FirstParty_Off_Footer", @"HUSoftwareUpdateAutomaticSetting_FirstParty_Off_Footer", 1);
      if (v8)
      {
        objc_super v9 = @"HUSoftwareUpdateAutomaticSetting_ThirdParty_On_Footer";
LABEL_17:
        v18 = _HULocalizedStringWithDefaultValue(v9, v9, 1);
        v16 = HULocalizedStringWithFormat(@"HUSoftwareUpdateAutomaticSettingFooterFormat", @"%@%@", v10, v11, v12, v13, v14, v15, (uint64_t)v7);

        goto LABEL_22;
      }
    }
    objc_super v9 = @"HUSoftwareUpdateAutomaticSetting_ThirdParty_Off_Footer";
    goto LABEL_17;
  }
  if (v4)
  {
    if ([v3 isAutomaticSoftwareUpdateEnabled]) {
      uint64_t v6 = @"HUSoftwareUpdateAutomaticSetting_FirstParty_On_Footer";
    }
    else {
      uint64_t v6 = @"HUSoftwareUpdateAutomaticSetting_FirstParty_Off_Footer";
    }
  }
  else
  {
    if (!v5)
    {
      v16 = 0;
      goto LABEL_22;
    }
    if (objc_msgSend(v3, "hf_isAutomaticThirdPartyAccessorySoftwareUpdateEnabled")) {
      uint64_t v6 = @"HUSoftwareUpdateAutomaticSetting_ThirdParty_On_Footer";
    }
    else {
      uint64_t v6 = @"HUSoftwareUpdateAutomaticSetting_ThirdParty_Off_Footer";
    }
  }
LABEL_21:
  v16 = _HULocalizedStringWithDefaultValue(v6, v6, 1);
LABEL_22:

  return v16;
}

- (id)description
{
  id v3 = [MEMORY[0x1E4F7A0D0] builderWithObject:self];
  int v4 = [(HUSoftwareUpdateSettingsItem *)self latestResults];
  int v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F68B10]];
  id v6 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", objc_msgSend(v5, "BOOLValue"), @"hidden", 1);

  id v7 = [(HUSoftwareUpdateSettingsItem *)self latestResults];
  int v8 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F68AB8]];
  [v3 appendString:v8 withName:@"title"];

  objc_super v9 = [(HUSoftwareUpdateSettingsItem *)self latestResults];
  uint64_t v10 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F68980]];
  [v3 appendString:v10 withName:@"description" skipIfEmpty:1];

  uint64_t v11 = [(HUSoftwareUpdateSettingsItem *)self latestResults];
  uint64_t v12 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4F68930]];
  id v13 = (id)[v3 appendObject:v12 withName:@"badgeCount" skipIfNil:1];

  uint64_t v14 = [v3 build];

  return v14;
}

- (BOOL)_shouldShowSoftwareUpdateIcon
{
  v2 = [MEMORY[0x1E4F691A0] sharedDispatcher];
  id v3 = [v2 homeManager];
  char v4 = [v3 hasOptedToHH2] ^ 1;

  return v4;
}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
}

- (void).cxx_destruct
{
}

@end