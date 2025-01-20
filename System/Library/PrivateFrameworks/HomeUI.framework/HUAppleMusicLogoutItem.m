@interface HUAppleMusicLogoutItem
- (id)_subclass_updateWithOptions:(id)a3;
@end

@implementation HUAppleMusicLogoutItem

- (id)_subclass_updateWithOptions:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v10.receiver = self;
  v10.super_class = (Class)HUAppleMusicLogoutItem;
  v5 = [(HUAppleMusicItem *)&v10 _subclass_updateWithOptions:v4];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __54__HUAppleMusicLogoutItem__subclass_updateWithOptions___block_invoke;
  v8[3] = &unk_1E6385350;
  objc_copyWeak(&v9, &location);
  v6 = [v5 flatMap:v8];
  objc_destroyWeak(&v9);

  objc_destroyWeak(&location);

  return v6;
}

id __54__HUAppleMusicLogoutItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  v5 = (void *)[v3 mutableCopy];

  v6 = [WeakRetained mediaProfileContainer];
  v7 = objc_msgSend(v6, "hf_appleMusicCurrentLoggedInAccount");

  int v8 = v7 != 0;
  id v9 = [WeakRetained mediaProfileContainer];
  int v10 = objc_msgSend(v9, "hf_homePodSupportsMultiUser");

  if (v10)
  {
    v11 = [MEMORY[0x1E4F68F00] sharedInstance];
    v12 = [MEMORY[0x1E4F691A0] sharedDispatcher];
    v13 = [v12 home];
    v14 = [v13 uniqueIdentifier];
    v15 = [v14 UUIDString];
    v16 = [v11 mediaAccountForHomeIdentifier:v15];

    objc_opt_class();
    id v17 = v16;
    if (objc_opt_isKindOfClass()) {
      v18 = v17;
    }
    else {
      v18 = 0;
    }
    id v19 = v18;

    if (v7)
    {
      v20 = objc_msgSend(v7, "ams_altDSID");
      v21 = objc_msgSend(v19, "ams_altDSID");
      int v8 = [v20 isEqualToString:v21] ^ 1;
    }
    else
    {
      int v8 = 0;
    }
  }
  v22 = _HULocalizedStringWithDefaultValue(@"HUAppleMusicStopUsingThisAccount", @"HUAppleMusicStopUsingThisAccount", 1);
  uint64_t v23 = *MEMORY[0x1E4F68AB8];
  [v5 setObject:v22 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];

  v24 = [NSNumber numberWithInt:v8 ^ 1u];
  uint64_t v25 = *MEMORY[0x1E4F68B10];
  [v5 setObject:v24 forKeyedSubscript:*MEMORY[0x1E4F68B10]];

  v26 = [WeakRetained mediaProfileContainer];
  int v27 = objc_msgSend(v26, "hf_supportsPreferredMediaUser");

  if (v27)
  {
    v28 = _HULocalizedStringWithDefaultValue(@"HUAppleMusicSignOut", @"HUAppleMusicSignOut", 1);
    [v5 setObject:v28 forKeyedSubscript:v23];

    v29 = [NSNumber numberWithInt:v7 == 0];
    [v5 setObject:v29 forKeyedSubscript:v25];
  }
  v30 = [MEMORY[0x1E4F7A0D8] futureWithResult:v5];

  return v30;
}

@end