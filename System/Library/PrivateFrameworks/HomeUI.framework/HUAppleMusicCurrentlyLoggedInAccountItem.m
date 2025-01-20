@interface HUAppleMusicCurrentlyLoggedInAccountItem
- (id)_subclass_updateWithOptions:(id)a3;
- (id)account;
@end

@implementation HUAppleMusicCurrentlyLoggedInAccountItem

- (id)account
{
  v2 = [(HUAppleMusicItem *)self mediaProfileContainer];
  v3 = objc_msgSend(v2, "hf_appleMusicCurrentLoggedInAccount");

  return v3;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v10.receiver = self;
  v10.super_class = (Class)HUAppleMusicCurrentlyLoggedInAccountItem;
  v5 = [(HUAppleMusicAccountItem *)&v10 _subclass_updateWithOptions:v4];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __72__HUAppleMusicCurrentlyLoggedInAccountItem__subclass_updateWithOptions___block_invoke;
  v8[3] = &unk_1E6385350;
  objc_copyWeak(&v9, &location);
  v6 = [v5 flatMap:v8];
  objc_destroyWeak(&v9);

  objc_destroyWeak(&location);

  return v6;
}

id __72__HUAppleMusicCurrentlyLoggedInAccountItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  v5 = (void *)[v3 mutableCopy];

  v6 = [WeakRetained mediaProfileContainer];
  int v7 = objc_msgSend(v6, "hf_homePodSupportsMultiUser");

  if (v7)
  {
    v8 = [MEMORY[0x1E4F68F00] sharedInstance];
    id v9 = [MEMORY[0x1E4F691A0] sharedDispatcher];
    objc_super v10 = [v9 home];
    v11 = [v10 uniqueIdentifier];
    v12 = [v11 UUIDString];
    v13 = [v8 mediaAccountForHomeIdentifier:v12];

    objc_opt_class();
    id v14 = v13;
    if (objc_opt_isKindOfClass()) {
      v15 = v14;
    }
    else {
      v15 = 0;
    }
    id v16 = v15;

    uint64_t v17 = [WeakRetained account];
    if (!v17) {
      goto LABEL_7;
    }
    v18 = (void *)v17;
    v19 = [WeakRetained account];
    v20 = objc_msgSend(v19, "ams_altDSID");
    v21 = objc_msgSend(v16, "ams_altDSID");
    char v22 = [v20 isEqualToString:v21];

    if ((v22 & 1) == 0)
    {
      v30 = _HULocalizedStringWithDefaultValue(@"HUAppleMusicUsername", @"HUAppleMusicUsername", 1);
      [v5 setObject:v30 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];

      v31 = [WeakRetained account];
      v32 = [v31 username];
      [v5 setObject:v32 forKeyedSubscript:*MEMORY[0x1E4F68980]];

      uint64_t v23 = *MEMORY[0x1E4F68B10];
      uint64_t v24 = MEMORY[0x1E4F1CC28];
    }
    else
    {
LABEL_7:
      uint64_t v23 = *MEMORY[0x1E4F68B10];
      uint64_t v24 = MEMORY[0x1E4F1CC38];
    }
    [v5 setObject:v24 forKeyedSubscript:v23];
  }
  else
  {
    v25 = [WeakRetained account];

    if (v25)
    {
      v26 = _HULocalizedStringWithDefaultValue(@"HUAppleMusicUsername", @"HUAppleMusicUsername", 1);
      [v5 setObject:v26 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];

      v27 = [WeakRetained account];
      v28 = [v27 username];
      [v5 setObject:v28 forKeyedSubscript:*MEMORY[0x1E4F68980]];

      uint64_t v23 = *MEMORY[0x1E4F68B10];
      uint64_t v29 = MEMORY[0x1E4F1CC28];
    }
    else
    {
      uint64_t v23 = *MEMORY[0x1E4F68B10];
      uint64_t v29 = MEMORY[0x1E4F1CC38];
    }
    [v5 setObject:v29 forKeyedSubscript:v23];
  }
  v33 = [WeakRetained mediaProfileContainer];
  int v34 = objc_msgSend(v33, "hf_supportsPreferredMediaUser");

  if (v34)
  {
    v35 = _HULocalizedStringWithDefaultValue(@"HUPrimaryUserSettingsHomePodAccountSection_AccountInfoTitle", @"HUPrimaryUserSettingsHomePodAccountSection_AccountInfoTitle", 1);
    [v5 setObject:v35 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];

    v36 = [WeakRetained mediaProfileContainer];
    v37 = objc_msgSend(v36, "hf_appleMusicCurrentLoggedInAccount");

    if (v37)
    {
      v38 = [WeakRetained account];
      v39 = [v38 username];
      [v5 setObject:v39 forKeyedSubscript:*MEMORY[0x1E4F68980]];
    }
    else
    {
      v38 = _HULocalizedStringWithDefaultValue(@"HUPrimaryUserSettingsHomePodAccountSection_AccountInfoPlaceholderValue", @"HUPrimaryUserSettingsHomePodAccountSection_AccountInfoPlaceholderValue", 1);
      [v5 setObject:v38 forKeyedSubscript:*MEMORY[0x1E4F68980]];
    }

    [v5 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:v23];
  }
  v40 = [MEMORY[0x1E4F7A0D8] futureWithResult:v5];

  return v40;
}

@end