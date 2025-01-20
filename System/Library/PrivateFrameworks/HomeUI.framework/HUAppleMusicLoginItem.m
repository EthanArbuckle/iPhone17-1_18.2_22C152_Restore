@interface HUAppleMusicLoginItem
- (id)_subclass_updateWithOptions:(id)a3;
@end

@implementation HUAppleMusicLoginItem

- (id)_subclass_updateWithOptions:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v10.receiver = self;
  v10.super_class = (Class)HUAppleMusicLoginItem;
  v5 = [(HUAppleMusicItem *)&v10 _subclass_updateWithOptions:v4];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __53__HUAppleMusicLoginItem__subclass_updateWithOptions___block_invoke;
  v8[3] = &unk_1E6385350;
  objc_copyWeak(&v9, &location);
  v6 = [v5 flatMap:v8];
  objc_destroyWeak(&v9);

  objc_destroyWeak(&location);

  return v6;
}

id __53__HUAppleMusicLoginItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  v5 = (void *)[v3 mutableCopy];

  v6 = [MEMORY[0x1E4F692A0] sharedDispatcher];
  v7 = [v6 appleMusicMagicAuthCapableAccounts];
  uint64_t v8 = [v7 count];

  if (v8)
  {
    uint64_t v9 = *MEMORY[0x1E4F68B10];
    [v5 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F68B10]];
  }
  else
  {
    objc_super v10 = NSNumber;
    v11 = [WeakRetained mediaProfileContainer];
    v12 = objc_msgSend(v11, "hf_appleMusicCurrentLoggedInAccount");
    v13 = [v10 numberWithInt:v12 != 0];
    uint64_t v9 = *MEMORY[0x1E4F68B10];
    [v5 setObject:v13 forKeyedSubscript:*MEMORY[0x1E4F68B10]];
  }
  v14 = [WeakRetained mediaProfileContainer];
  int v15 = objc_msgSend(v14, "hf_homePodSupportsMultiUser");

  if (v15)
  {
    v16 = [WeakRetained mediaProfileContainer];
    v17 = objc_msgSend(v16, "hf_appleMusicCurrentLoggedInAccount");

    v18 = [MEMORY[0x1E4F68F00] sharedInstance];
    v19 = [MEMORY[0x1E4F691A0] sharedDispatcher];
    v20 = [v19 home];
    v21 = [v20 uniqueIdentifier];
    v22 = [v21 UUIDString];
    v23 = [v18 mediaAccountForHomeIdentifier:v22];

    objc_opt_class();
    id v24 = v23;
    if (objc_opt_isKindOfClass()) {
      v25 = v24;
    }
    else {
      v25 = 0;
    }
    id v26 = v25;

    v27 = NSNumber;
    if (v17)
    {
      v20 = objc_msgSend(v17, "ams_altDSID");
      v21 = objc_msgSend(v26, "ams_altDSID");
      uint64_t v28 = [v20 isEqualToString:v21] ^ 1;
    }
    else
    {
      uint64_t v28 = 0;
    }
    v29 = [v27 numberWithInt:v28];
    [v5 setObject:v29 forKeyedSubscript:v9];

    if (v17)
    {
    }
    v30 = HFLocalizedString();
    uint64_t v31 = *MEMORY[0x1E4F68AB8];
    [v5 setObject:v30 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];

    v32 = [WeakRetained mediaProfileContainer];
    int v33 = objc_msgSend(v32, "hf_supportsPreferredMediaUser");

    if (v33)
    {
      v34 = _HULocalizedStringWithDefaultValue(@"HUPrimaryUserSettingsHomePodAccountSection_SignInButton", @"HUPrimaryUserSettingsHomePodAccountSection_SignInButton", 1);
      [v5 setObject:v34 forKeyedSubscript:v31];

      v35 = [NSNumber numberWithInt:v17 != 0];
      [v5 setObject:v35 forKeyedSubscript:v9];
    }
  }
  else
  {
    v17 = HFLocalizedString();
    [v5 setObject:v17 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];
  }

  v36 = [MEMORY[0x1E4F7A0D8] futureWithResult:v5];

  return v36;
}

@end