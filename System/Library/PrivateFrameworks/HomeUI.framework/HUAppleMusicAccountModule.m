@interface HUAppleMusicAccountModule
- (HFMediaProfileContainer)mediaProfileContainer;
- (HFStaticItemProvider)appleMusicAccountActionItemProvider;
- (HUAppleMusicAccountItemProvider)appleMusicAccountItemProvider;
- (HUAppleMusicAccountModule)initWithMediaProfileContainer:(id)a3 itemUpdater:(id)a4;
- (HUAppleMusicItem)loggedInUsernameItem;
- (HUAppleMusicItem)loginItem;
- (HUAppleMusicItem)logoutItem;
- (NSString)explicitAccountSignedInMessage;
- (id)buildSectionsWithDisplayedItems:(id)a3;
- (id)itemProviders;
- (id)signInMessage:(BOOL)a3;
- (id)stateChangeObserver;
- (unint64_t)numberOfKnownAccounts;
- (unint64_t)state;
- (void)accessoryDidUpdatePreferredMediaUser:(id)a3;
- (void)dispatcher:(id)a3 appleMusicAccountsDidUpdate:(id)a4;
- (void)setState:(unint64_t)a3;
- (void)setStateChangeObserver:(id)a3;
@end

@implementation HUAppleMusicAccountModule

- (HUAppleMusicAccountModule)initWithMediaProfileContainer:(id)a3 itemUpdater:(id)a4
{
  id v7 = a3;
  v43.receiver = self;
  v43.super_class = (Class)HUAppleMusicAccountModule;
  v8 = [(HFItemModule *)&v43 initWithItemUpdater:a4];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_mediaProfileContainer, a3);
    v10 = [(HUAppleMusicItem *)[HUAppleMusicLogoutItem alloc] initWithMediaProfileContainer:v7];
    logoutItem = v9->_logoutItem;
    v9->_logoutItem = &v10->super;

    v12 = [(HUAppleMusicItem *)[HUAppleMusicLoginItem alloc] initWithMediaProfileContainer:v7];
    loginItem = v9->_loginItem;
    v9->_loginItem = &v12->super;

    v14 = [(HUAppleMusicItem *)[HUAppleMusicCurrentlyLoggedInAccountItem alloc] initWithMediaProfileContainer:v7];
    loggedInUsernameItem = v9->_loggedInUsernameItem;
    v9->_loggedInUsernameItem = &v14->super.super;

    id v16 = objc_alloc(MEMORY[0x1E4F695C8]);
    v17 = (void *)MEMORY[0x1E4F1CAD0];
    v18 = [(HUAppleMusicAccountModule *)v9 logoutItem];
    v19 = [(HUAppleMusicAccountModule *)v9 loginItem];
    v20 = [(HUAppleMusicAccountModule *)v9 loggedInUsernameItem];
    v21 = objc_msgSend(v17, "setWithObjects:", v18, v19, v20, 0);
    uint64_t v22 = [v16 initWithItems:v21];
    appleMusicAccountActionItemProvider = v9->_appleMusicAccountActionItemProvider;
    v9->_appleMusicAccountActionItemProvider = (HFStaticItemProvider *)v22;

    v24 = [[HUAppleMusicAccountItemProvider alloc] initWithMediaProfileContainer:v7];
    appleMusicAccountItemProvider = v9->_appleMusicAccountItemProvider;
    v9->_appleMusicAccountItemProvider = v24;

    v26 = objc_msgSend(v7, "hf_appleMusicCurrentLoggedInAccount");
    int v27 = objc_msgSend(v7, "hf_homePodSupportsMultiUser");
    v28 = [MEMORY[0x1E4F68F00] sharedInstance];
    v29 = [MEMORY[0x1E4F691A0] sharedDispatcher];
    v30 = [v29 home];
    v31 = [v30 uniqueIdentifier];
    v32 = [v31 UUIDString];
    v33 = [v28 mediaAccountForHomeIdentifier:v32];

    objc_opt_class();
    id v34 = v33;
    if (objc_opt_isKindOfClass()) {
      v35 = v34;
    }
    else {
      v35 = 0;
    }
    id v36 = v35;

    if (v27 && v26)
    {
      v37 = objc_msgSend(v26, "ams_altDSID");
      v38 = objc_msgSend(v36, "ams_altDSID");
      char v39 = [v37 isEqualToString:v38];

      if (v39)
      {
LABEL_12:
        uint64_t v40 = 0;
        goto LABEL_13;
      }
    }
    else if ((v27 & 1) != 0 || !v26)
    {
      goto LABEL_12;
    }
    uint64_t v40 = 1;
LABEL_13:
    v9->_state = v40;
    v41 = [MEMORY[0x1E4F692A0] sharedDispatcher];
    [v41 addAppleMusicAccountObserver:v9];
  }
  return v9;
}

- (id)itemProviders
{
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  v4 = [(HUAppleMusicAccountModule *)self appleMusicAccountItemProvider];
  v5 = [(HUAppleMusicAccountModule *)self appleMusicAccountActionItemProvider];
  v6 = objc_msgSend(v3, "setWithObjects:", v4, v5, 0);

  return v6;
}

- (id)buildSectionsWithDisplayedItems:(id)a3
{
  id v4 = a3;
  if (![v4 count])
  {
    id v16 = (void *)MEMORY[0x1E4F1CBF0];
    goto LABEL_24;
  }
  v5 = [(HUAppleMusicAccountModule *)self loggedInUsernameItem];
  if (([v4 containsObject:v5] & 1) == 0)
  {

    v5 = 0;
  }
  v6 = [(HUAppleMusicAccountModule *)self appleMusicAccountItemProvider];
  id v7 = [v6 items];
  v8 = objc_msgSend(v7, "na_setByIntersectingWithSet:", v4);
  v9 = [v8 allObjects];

  v10 = [(HUAppleMusicAccountModule *)self appleMusicAccountActionItemProvider];
  v11 = [v10 items];
  v12 = objc_msgSend(v11, "na_setByIntersectingWithSet:", v4);
  v13 = [v12 allObjects];
  v14 = (void *)[v13 mutableCopy];

  [v14 removeObject:v5];
  v15 = objc_msgSend(MEMORY[0x1E4F1C978], "na_arrayWithSafeObject:", v5);
  if (![v9 count] && !objc_msgSend(v14, "count") && !objc_msgSend(v15, "count"))
  {
    id v16 = (void *)MEMORY[0x1E4F1CBF0];
    goto LABEL_23;
  }
  id v16 = objc_opt_new();
  uint64_t v17 = [v9 count];
  unint64_t v18 = [(HUAppleMusicAccountModule *)self state];
  if ([v9 count] && v18 != 1)
  {
    v19 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"HUAppleMusicAccountModule_MusicCredentialsSectionIdentifier"];
    [v19 setItems:v9];
    if (v17 >= 1)
    {
      v20 = _HULocalizedStringWithDefaultValue(@"HUAppleMusicAccountSelectionHeader", @"HUAppleMusicAccountSelectionHeader", 1);
      [v19 setHeaderTitle:v20];
    }
    v21 = [(HUAppleMusicAccountModule *)self mediaProfileContainer];
    char v22 = objc_msgSend(v21, "hf_supportsPreferredMediaUser");

    if ((v22 & 1) == 0) {
      [v16 addObject:v19];
    }
  }
  if ([v15 count])
  {
    v23 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"HUAppleMusicAccountModule_MusicCurrentUserSectionIdentifier"];
    [v23 setItems:v15];
    v24 = [(HUAppleMusicAccountModule *)self mediaProfileContainer];
    int v25 = objc_msgSend(v24, "hf_supportsPreferredMediaUser");

    if (v25)
    {
      v26 = _HULocalizedStringWithDefaultValue(@"HUPrimaryUserSettingsHomePodAccountSection_Header", @"HUPrimaryUserSettingsHomePodAccountSection_Header", 1);
      [v23 setHeaderTitle:v26];

      int v27 = _HULocalizedStringWithDefaultValue(@"HUPrimaryUserSettingsHomePodAccountSection_Footer", @"HUPrimaryUserSettingsHomePodAccountSection_Footer", 1);
      [v23 setFooterTitle:v27];
    }
    [v16 addObject:v23];
    if ([v14 count])
    {
      v28 = [MEMORY[0x1E4F1CA48] arrayWithArray:v15];
      [v28 addObjectsFromArray:v14];
      v29 = (void *)[v28 copy];
      [v23 setItems:v29];
    }
    goto LABEL_22;
  }
  if ([v14 count])
  {
    v23 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"HUAppleMusicAccountModule_MusicActionsSectionIdentifier"];
    [v23 setItems:v14];
    [v16 addObject:v23];
LABEL_22:
  }
LABEL_23:

LABEL_24:

  return v16;
}

- (unint64_t)numberOfKnownAccounts
{
  v2 = [(HUAppleMusicAccountModule *)self appleMusicAccountItemProvider];
  v3 = [v2 items];
  unint64_t v4 = [v3 count];

  return v4;
}

- (id)signInMessage:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(HUAppleMusicAccountModule *)self mediaProfileContainer];
  v6 = v5;
  if (v3)
  {
    id v7 = objc_msgSend(v5, "hf_appleMusicCurrentLoggedInAccount");

    v8 = [MEMORY[0x1E4F68F00] sharedInstance];
    v9 = [MEMORY[0x1E4F691A0] sharedDispatcher];
    v10 = [v9 home];
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

    if (v7
      && (objc_msgSend(v7, "ams_altDSID"),
          uint64_t v17 = objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v16, "ams_altDSID"),
          unint64_t v18 = objc_claimAutoreleasedReturnValue(),
          int v19 = [v17 isEqualToString:v18],
          v18,
          v17,
          v19))
    {
      v20 = [v7 username];
      int v27 = HULocalizedStringWithFormat(@"HUAppleMusicAccountSignInFooter", @"%@", v21, v22, v23, v24, v25, v26, (uint64_t)v20);
    }
    else
    {
      int v27 = 0;
    }
  }
  else
  {
    v28 = objc_msgSend(v5, "hf_appleMusicCurrentLoggedInAccountDSID");

    if (v28)
    {
      int v27 = 0;
    }
    else if ([(HUAppleMusicAccountModule *)self numberOfKnownAccounts] == 1)
    {
      v30 = [(HUAppleMusicAccountModule *)self appleMusicAccountItemProvider];
      v31 = [v30 items];
      v32 = [v31 anyObject];

      v33 = [v32 latestResults];
      id v34 = [v33 objectForKeyedSubscript:@"HOAppleMusicAccountKey"];

      v35 = [v34 username];
      int v27 = HULocalizedStringWithFormat(@"HUAppleMusicAccountSelectionFooter_Singular", @"%@", v36, v37, v38, v39, v40, v41, (uint64_t)v35);
    }
    else
    {
      int v27 = _HULocalizedStringWithDefaultValue(@"HUAppleMusicAccountSelectionFooter_Plural", @"HUAppleMusicAccountSelectionFooter_Plural", 1);
    }
  }

  return v27;
}

- (NSString)explicitAccountSignedInMessage
{
  BOOL v3 = [(HUAppleMusicAccountModule *)self mediaProfileContainer];
  unint64_t v4 = objc_msgSend(v3, "hf_appleMusicCurrentLoggedInAccount");

  v5 = [MEMORY[0x1E4F68F00] sharedInstance];
  v6 = [MEMORY[0x1E4F691A0] sharedDispatcher];
  id v7 = [v6 home];
  v8 = [v7 uniqueIdentifier];
  v9 = [v8 UUIDString];
  v10 = [v5 mediaAccountForHomeIdentifier:v9];

  objc_opt_class();
  id v11 = v10;
  if (objc_opt_isKindOfClass()) {
    v12 = v11;
  }
  else {
    v12 = 0;
  }
  id v13 = v12;

  id v14 = [(HUAppleMusicAccountModule *)self mediaProfileContainer];
  if (objc_msgSend(v14, "hf_homePodSupportsMultiUser") && v4)
  {
    v15 = objc_msgSend(v4, "ams_altDSID");
    id v16 = objc_msgSend(v13, "ams_altDSID");
    char v17 = [v15 isEqualToString:v16];

    if ((v17 & 1) == 0)
    {
      unint64_t v18 = _HULocalizedStringWithDefaultValue(@"HUAppleMusicAccountExplicitSignedInFooter", @"HUAppleMusicAccountExplicitSignedInFooter", 1);
      goto LABEL_10;
    }
  }
  else
  {
  }
  unint64_t v18 = 0;
LABEL_10:

  return (NSString *)v18;
}

- (void)setState:(unint64_t)a3
{
  unint64_t state = self->_state;
  if (state != a3)
  {
    self->_unint64_t state = a3;
    if (a3 <= 1)
    {
      id v7 = [(HFItemModule *)self itemUpdater];
      v8 = (void *)MEMORY[0x1E4F69230];
      v9 = [(HUAppleMusicAccountModule *)self itemProviders];
      v10 = [v8 requestToReloadItemProviders:v9 senderSelector:a2];
      id v11 = (id)[v7 performItemUpdateRequest:v10];
    }
    v12 = [(HUAppleMusicAccountModule *)self stateChangeObserver];

    if (v12)
    {
      id v13 = [(HUAppleMusicAccountModule *)self stateChangeObserver];
      v13[2](v13, state, a3);
    }
  }
}

- (void)dispatcher:(id)a3 appleMusicAccountsDidUpdate:(id)a4
{
  id v10 = [(HFItemModule *)self itemUpdater];
  v6 = (void *)MEMORY[0x1E4F69230];
  id v7 = [(HUAppleMusicAccountModule *)self itemProviders];
  v8 = [v6 requestToReloadItemProviders:v7 senderSelector:a2];
  id v9 = (id)[v10 performItemUpdateRequest:v8];
}

- (void)accessoryDidUpdatePreferredMediaUser:(id)a3
{
  id v9 = [(HFItemModule *)self itemUpdater];
  v5 = (void *)MEMORY[0x1E4F69230];
  v6 = [(HUAppleMusicAccountModule *)self itemProviders];
  id v7 = [v5 requestToReloadItemProviders:v6 senderSelector:a2];
  id v8 = (id)[v9 performItemUpdateRequest:v7];
}

- (HFMediaProfileContainer)mediaProfileContainer
{
  return self->_mediaProfileContainer;
}

- (HUAppleMusicAccountItemProvider)appleMusicAccountItemProvider
{
  return self->_appleMusicAccountItemProvider;
}

- (HUAppleMusicItem)loggedInUsernameItem
{
  return self->_loggedInUsernameItem;
}

- (HUAppleMusicItem)logoutItem
{
  return self->_logoutItem;
}

- (HUAppleMusicItem)loginItem
{
  return self->_loginItem;
}

- (unint64_t)state
{
  return self->_state;
}

- (id)stateChangeObserver
{
  return self->_stateChangeObserver;
}

- (void)setStateChangeObserver:(id)a3
{
}

- (HFStaticItemProvider)appleMusicAccountActionItemProvider
{
  return self->_appleMusicAccountActionItemProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appleMusicAccountActionItemProvider, 0);
  objc_storeStrong(&self->_stateChangeObserver, 0);
  objc_storeStrong((id *)&self->_loginItem, 0);
  objc_storeStrong((id *)&self->_logoutItem, 0);
  objc_storeStrong((id *)&self->_loggedInUsernameItem, 0);
  objc_storeStrong((id *)&self->_appleMusicAccountItemProvider, 0);

  objc_storeStrong((id *)&self->_mediaProfileContainer, 0);
}

@end