@interface HUPresenceUserPickerItemModule
+ (NSString)sectionID;
+ (id)_locationDeviceTextForDeviceNameString:(id)a3;
+ (id)_userItemComparator;
- (BOOL)_canDeselectUserHandle:(id)a3;
- (BOOL)_isPresenceAuthorizedForUser:(id)a3;
- (BOOL)_isUserHandleSelected:(id)a3;
- (BOOL)_shouldUseSingleUserStyle;
- (HFItem)singleUserSummaryItem;
- (HFPresenceEventBuilder)presenceEventBuilder;
- (HFStaticItemProvider)staticItemProvider;
- (HMHome)home;
- (HULocationDeviceManager)locationDeviceManager;
- (HUPresenceUserPickerItemModule)initWithItemUpdater:(id)a3;
- (HUPresenceUserPickerItemModule)initWithItemUpdater:(id)a3 home:(id)a4 presenceEvent:(id)a5 options:(id)a6 delegate:(id)a7;
- (HUPresenceUserPickerItemModuleDelegate)delegate;
- (HUPresenceUserPickerItemModuleOptions)options;
- (NSDictionary)activationOptionStateByGranularity;
- (id)_allSelectedAndSupportedUsers;
- (id)_attributedFooterTitle;
- (id)_combinedFooterStringForLocationDeviceText:(id)a3;
- (id)_homeHubNeedsUpdateWarningText;
- (id)_someUsersNeedSoftwareUpdateWarningText;
- (id)_sortedActivationGranularities;
- (id)activationOptionItemForGranularity:(unint64_t)a3;
- (id)buildSectionsWithDisplayedItems:(id)a3;
- (id)confirmationPromptForOptionItem:(id)a3;
- (id)itemProviders;
- (id)stateForActivationOptionItem:(id)a3;
- (id)stateForUserItem:(id)a3;
- (unint64_t)_activationGranularityForUserItem:(id)a3;
- (unint64_t)itemTypeForItem:(id)a3;
- (void)_createItemProviders;
- (void)_resetSelectionForCustomLocation;
- (void)_updateSelected:(BOOL)a3 forUserHandle:(id)a4;
- (void)deselectUserItem:(id)a3;
- (void)locationDeviceManager:(id)a3 didUpdateActiveLocationDevice:(id)a4;
- (void)registerForExternalUpdates;
- (void)selectActivationOptionItem:(id)a3;
- (void)selectUserItem:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setOptions:(id)a3;
- (void)toggleExpandedForActivationOptionItem:(id)a3;
- (void)unregisterForExternalUpdates;
@end

@implementation HUPresenceUserPickerItemModule

+ (NSString)sectionID
{
  if (_MergedGlobals_4 != -1) {
    dispatch_once(&_MergedGlobals_4, &__block_literal_global_3_0);
  }
  v2 = (void *)qword_1EA12DF70;

  return (NSString *)v2;
}

void __43__HUPresenceUserPickerItemModule_sectionID__block_invoke_2()
{
  v0 = (void *)qword_1EA12DF70;
  qword_1EA12DF70 = @"userList";
}

- (HUPresenceUserPickerItemModule)initWithItemUpdater:(id)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  v6 = NSStringFromSelector(sel_initWithItemUpdater_home_presenceEvent_options_delegate_);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUPresenceUserPickerItemModule.m", 60, @"%s is unavailable; use %@ instead",
    "-[HUPresenceUserPickerItemModule initWithItemUpdater:]",
    v6);

  return 0;
}

- (HUPresenceUserPickerItemModule)initWithItemUpdater:(id)a3 home:(id)a4 presenceEvent:(id)a5 options:(id)a6 delegate:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  if (v14)
  {
    if (v15) {
      goto LABEL_3;
    }
  }
  else
  {
    v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, self, @"HUPresenceUserPickerItemModule.m", 65, @"Invalid parameter not satisfying: %@", @"home" object file lineNumber description];

    if (v15) {
      goto LABEL_3;
    }
  }
  v26 = [MEMORY[0x1E4F28B00] currentHandler];
  [v26 handleFailureInMethod:a2, self, @"HUPresenceUserPickerItemModule.m", 66, @"Invalid parameter not satisfying: %@", @"presenceEvent" object file lineNumber description];

LABEL_3:
  v27.receiver = self;
  v27.super_class = (Class)HUPresenceUserPickerItemModule;
  v18 = [(HFItemModule *)&v27 initWithItemUpdater:v13];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_home, a4);
    uint64_t v20 = [objc_alloc(MEMORY[0x1E4F69408]) initWithEvent:v15];
    presenceEventBuilder = v19->_presenceEventBuilder;
    v19->_presenceEventBuilder = (HFPresenceEventBuilder *)v20;

    objc_storeStrong((id *)&v19->_options, a6);
    objc_storeWeak((id *)&v19->_delegate, v17);
    uint64_t v22 = +[HULocationDeviceManager sharedInstance];
    locationDeviceManager = v19->_locationDeviceManager;
    v19->_locationDeviceManager = (HULocationDeviceManager *)v22;

    [(HUPresenceUserPickerItemModule *)v19 _createItemProviders];
  }

  return v19;
}

- (void)registerForExternalUpdates
{
  id v3 = [(HUPresenceUserPickerItemModule *)self locationDeviceManager];
  [v3 addObserver:self];
}

- (void)unregisterForExternalUpdates
{
  id v3 = [(HUPresenceUserPickerItemModule *)self locationDeviceManager];
  [v3 removeObserver:self];
}

- (unint64_t)itemTypeForItem:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HUPresenceUserPickerItemModule *)self singleUserSummaryItem];

  if (v5 == v4)
  {
    unint64_t v11 = 0;
  }
  else
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    v6 = [(HUPresenceUserPickerItemModule *)self activationOptionStateByGranularity];
    v7 = [v6 objectEnumerator];

    uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v20;
      unint64_t v11 = 1;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v20 != v10) {
            objc_enumerationMutation(v7);
          }
          id v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          id v14 = [v13 activationOptionItem];

          if (v14 == v4) {
            goto LABEL_14;
          }
          id v15 = [v13 userOptionItemProvider];
          id v16 = [v15 items];
          char v17 = [v16 containsObject:v4];

          if (v17)
          {
            unint64_t v11 = 2;
LABEL_14:

            goto LABEL_15;
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }

    NSLog(&cfstr_UnexpectedItem_2.isa, v4);
    unint64_t v11 = 2;
  }
LABEL_15:

  return v11;
}

- (id)activationOptionItemForGranularity:(unint64_t)a3
{
  id v4 = [(HUPresenceUserPickerItemModule *)self activationOptionStateByGranularity];
  id v5 = [NSNumber numberWithUnsignedInteger:a3];
  v6 = [v4 objectForKeyedSubscript:v5];
  v7 = [v6 activationOptionItem];

  return v7;
}

- (id)stateForActivationOptionItem:(id)a3
{
  id v4 = a3;
  id v5 = [(HUPresenceUserPickerItemModule *)self activationOptionStateByGranularity];
  v6 = [v5 objectEnumerator];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __63__HUPresenceUserPickerItemModule_stateForActivationOptionItem___block_invoke;
  v10[3] = &unk_1E6387E88;
  id v11 = v4;
  id v7 = v4;
  uint64_t v8 = objc_msgSend(v6, "na_firstObjectPassingTest:", v10);

  return v8;
}

BOOL __63__HUPresenceUserPickerItemModule_stateForActivationOptionItem___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 activationOptionItem];
  BOOL v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

- (void)selectActivationOptionItem:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v6 = [(HUPresenceUserPickerItemModule *)self activationOptionStateByGranularity];
  id v7 = [v6 objectEnumerator];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v27 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        id v13 = [v12 activationOptionItem];
        [v12 setSelected:v13 == v5];

        if ([v12 isSelected])
        {
          uint64_t v14 = [v12 activationGranularity];
          id v15 = [(HUPresenceUserPickerItemModule *)self presenceEventBuilder];
          [v15 setActivationGranularity:v14];

          id v16 = [v12 activationOptionItem];
          char v17 = [v16 selectedUsers];
          v18 = [(HUPresenceUserPickerItemModule *)self presenceEventBuilder];
          [v18 setUsers:v17];
        }
        else
        {
          [v12 setExpanded:0];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v9);
  }

  long long v19 = [(HFItemModule *)self itemUpdater];
  long long v20 = (void *)MEMORY[0x1E4F69230];
  long long v21 = [(HFItemModule *)self allItems];
  long long v22 = [v20 requestToUpdateItems:v21 senderSelector:a2];
  id v23 = (id)[v19 performItemUpdateRequest:v22];

  uint64_t v24 = [(HUPresenceUserPickerItemModule *)self delegate];
  v25 = [(HUPresenceUserPickerItemModule *)self presenceEventBuilder];
  [v24 userPickerModule:self didUpdatePresenceEvent:v25];
}

- (void)toggleExpandedForActivationOptionItem:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v6 = [(HUPresenceUserPickerItemModule *)self activationOptionStateByGranularity];
  id v7 = [v6 objectEnumerator];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        id v13 = [v12 activationOptionItem];

        if (v13 == v5) {
          uint64_t v14 = [v12 isExpanded] ^ 1;
        }
        else {
          uint64_t v14 = 0;
        }
        [v12 setExpanded:v14];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v9);
  }

  id v15 = [(HFItemModule *)self itemUpdater];
  id v16 = (void *)MEMORY[0x1E4F69230];
  char v17 = [(HFItemModule *)self allItems];
  v18 = [v16 requestToUpdateItems:v17 senderSelector:a2];
  id v19 = (id)[v15 performItemUpdateRequest:v18];
}

- (id)stateForUserItem:(id)a3
{
  id v4 = a3;
  id v5 = [v4 latestResults];
  v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F68C78]];

  if (v6)
  {
    BOOL v7 = [(HUPresenceUserPickerItemModule *)self _isUserHandleSelected:v6];
    uint64_t v8 = [(HUPresenceUserPickerItemModule *)self home];
    uint64_t v9 = [(HUPresenceUserPickerItemModule *)self home];
    uint64_t v10 = objc_msgSend(v9, "hf_userForHandle:", v6);
    uint64_t v11 = objc_msgSend(v8, "hf_isPresenceAuthorizedForUser:", v10);

    v12 = [[HUPresenceUserOptionState alloc] initWithActivationGranularity:[(HUPresenceUserPickerItemModule *)self _activationGranularityForUserItem:v4] selected:v7 locationAvailable:v11];
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)selectUserItem:(id)a3
{
  id v4 = [a3 latestResults];
  id v6 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F68C78]];

  id v5 = v6;
  if (v6)
  {
    [(HUPresenceUserPickerItemModule *)self _updateSelected:1 forUserHandle:v6];
    id v5 = v6;
  }
}

- (void)deselectUserItem:(id)a3
{
  id v4 = [a3 latestResults];
  id v6 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F68C78]];

  id v5 = v6;
  if (v6)
  {
    [(HUPresenceUserPickerItemModule *)self _updateSelected:0 forUserHandle:v6];
    id v5 = v6;
  }
}

- (void)setOptions:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = (HUPresenceUserPickerItemModuleOptions *)a3;
  if (self->_options != v6)
  {
    objc_storeStrong((id *)&self->_options, a3);
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v20 = self;
    BOOL v7 = [(HUPresenceUserPickerItemModule *)self activationOptionStateByGranularity];
    uint64_t v8 = [v7 objectEnumerator];

    uint64_t v9 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v24 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = [*(id *)(*((void *)&v23 + 1) + 8 * i) userOptionItemProvider];
          uint64_t v14 = [v13 items];
          v21[0] = MEMORY[0x1E4F143A8];
          v21[1] = 3221225472;
          v21[2] = __45__HUPresenceUserPickerItemModule_setOptions___block_invoke;
          v21[3] = &unk_1E6387EB0;
          long long v22 = v6;
          objc_msgSend(v14, "na_each:", v21);
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v10);
    }

    if ([(HUPresenceUserPickerItemModuleOptions *)v6 customLocationSelected]) {
      [(HUPresenceUserPickerItemModule *)v20 _resetSelectionForCustomLocation];
    }
    id v15 = [(HFItemModule *)v20 itemUpdater];
    id v16 = (void *)MEMORY[0x1E4F69230];
    char v17 = [(HFItemModule *)v20 allItems];
    v18 = [v16 requestToUpdateItems:v17 senderSelector:a2];
    id v19 = (id)[v15 performItemUpdateRequest:v18];
  }
}

void __45__HUPresenceUserPickerItemModule_setOptions___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v5 = [v2 locationDevice];
  id v4 = [v3 sourceItem];

  [v4 setSelectedLocationDevice:v5];
}

- (id)confirmationPromptForOptionItem:(id)a3
{
  id v4 = a3;
  id v5 = [(HUPresenceUserPickerItemModule *)self options];
  int v6 = [v5 customLocationSelected];

  if (!v6) {
    goto LABEL_5;
  }
  unint64_t v7 = [(HUPresenceUserPickerItemModule *)self itemTypeForItem:v4];
  if (v7 == 2)
  {
    uint64_t v11 = [v4 latestResults];
    v12 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4F68C78]];

    uint64_t v13 = [v12 type];
    if (!v13)
    {
LABEL_5:
      uint64_t v10 = 0;
      goto LABEL_8;
    }
  }
  else
  {
    if (v7 != 1) {
      goto LABEL_5;
    }
    uint64_t v8 = [(HUPresenceUserPickerItemModule *)self stateForActivationOptionItem:v4];
    uint64_t v9 = [v8 activationGranularity];

    if (!v9) {
      goto LABEL_5;
    }
  }
  uint64_t v14 = _HULocalizedStringWithDefaultValue(@"HUPresenceEventUnsupportedCustomLocationAlertTitleResetLocation", @"HUPresenceEventUnsupportedCustomLocationAlertTitleResetLocation", 1);
  id v15 = [(HUPresenceUserPickerItemModule *)self home];
  id v16 = [v15 name];
  long long v23 = HULocalizedStringWithFormat(@"HUPresenceEventUnsupportedCustomLocationAlertMessageResetLocation", @"%@", v17, v18, v19, v20, v21, v22, (uint64_t)v16);

  uint64_t v10 = [[HUPresenceOptionSelectionConfirmationPrompt alloc] initWithAlertTitle:v14 alertBody:v23 resetLocationToHomeOnConfirmation:1];
LABEL_8:

  return v10;
}

- (void)_resetSelectionForCustomLocation
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  int v6 = [MEMORY[0x1E4F694F8] currentUserCollection];
  unint64_t v7 = [(HUPresenceUserPickerItemModule *)self presenceEventBuilder];
  [v7 setUsers:v6];

  uint64_t v8 = [(HUPresenceUserPickerItemModule *)self presenceEventBuilder];
  [v8 setActivationGranularity:0];

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v9 = [(HUPresenceUserPickerItemModule *)self activationOptionStateByGranularity];
  uint64_t v10 = [v9 objectEnumerator];

  id obj = v10;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v26 != v13) {
          objc_enumerationMutation(obj);
        }
        id v15 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        [v15 setExpanded:0];
        uint64_t v16 = [v15 activationGranularity];
        uint64_t v17 = [(HUPresenceUserPickerItemModule *)self presenceEventBuilder];
        objc_msgSend(v15, "setSelected:", v16 == objc_msgSend(v17, "activationGranularity"));

        int v18 = [v15 isSelected];
        if (v18)
        {
          v2 = [(HUPresenceUserPickerItemModule *)self presenceEventBuilder];
          uint64_t v19 = [v2 users];
          id v3 = (void *)v19;
        }
        else
        {
          uint64_t v19 = [MEMORY[0x1E4F694F8] allUsersCollection];
          id v4 = (void *)v19;
        }
        uint64_t v20 = [v15 activationOptionItem];
        [v20 setSelectedUsers:v19];

        uint64_t v21 = v4;
        if (v18)
        {

          uint64_t v21 = v2;
        }
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v12);
  }

  uint64_t v22 = [(HUPresenceUserPickerItemModule *)self delegate];
  long long v23 = [(HUPresenceUserPickerItemModule *)self presenceEventBuilder];
  [v22 userPickerModule:self didUpdatePresenceEvent:v23];
}

- (id)itemProviders
{
  id v3 = [(HUPresenceUserPickerItemModule *)self activationOptionStateByGranularity];
  id v4 = [v3 allValues];
  id v5 = objc_msgSend(v4, "na_map:", &__block_literal_global_45_0);

  int v6 = (void *)MEMORY[0x1E4F1CAD0];
  unint64_t v7 = [(HUPresenceUserPickerItemModule *)self staticItemProvider];
  uint64_t v8 = [v5 arrayByAddingObject:v7];
  uint64_t v9 = [v6 setWithArray:v8];

  return v9;
}

uint64_t __47__HUPresenceUserPickerItemModule_itemProviders__block_invoke(uint64_t a1, void *a2)
{
  return [a2 userOptionItemProvider];
}

- (id)buildSectionsWithDisplayedItems:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4F692E8]);
  int v6 = +[HUPresenceUserPickerItemModule sectionID];
  unint64_t v7 = (void *)[v5 initWithIdentifier:v6];

  uint64_t v8 = objc_opt_new();
  if ([(HUPresenceUserPickerItemModule *)self _shouldUseSingleUserStyle])
  {
    uint64_t v9 = [(HUPresenceUserPickerItemModule *)self singleUserSummaryItem];
    [v8 addObject:v9];
  }
  else
  {
    long long v27 = v7;
    id v28 = v4;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id obj = [(HUPresenceUserPickerItemModule *)self _sortedActivationGranularities];
    uint64_t v10 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v30 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v32 != v30) {
            objc_enumerationMutation(obj);
          }
          uint64_t v13 = *(void *)(*((void *)&v31 + 1) + 8 * i);
          uint64_t v14 = [(HUPresenceUserPickerItemModule *)self activationOptionStateByGranularity];
          id v15 = [v14 objectForKeyedSubscript:v13];

          uint64_t v16 = [v15 activationOptionItem];
          [v8 addObject:v16];

          uint64_t v17 = [v15 userOptionItemProvider];
          int v18 = [v17 items];
          uint64_t v19 = [v18 allObjects];
          uint64_t v20 = [(id)objc_opt_class() _userItemComparator];
          uint64_t v21 = [v19 sortedArrayUsingComparator:v20];
          [v8 addObjectsFromArray:v21];
        }
        uint64_t v11 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
      }
      while (v11);
    }

    unint64_t v7 = v27;
    id v4 = v28;
  }
  [v7 setItems:v8];
  uint64_t v22 = [(HUPresenceUserPickerItemModule *)self _attributedFooterTitle];
  [v7 setAttributedFooterTitle:v22];

  long long v23 = (void *)MEMORY[0x1E4F69220];
  v35 = v7;
  long long v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v35 count:1];
  long long v25 = [v23 filterSections:v24 toDisplayedItems:v4];

  return v25;
}

- (void)locationDeviceManager:(id)a3 didUpdateActiveLocationDevice:(id)a4
{
  id v10 = [(HFItemModule *)self itemUpdater];
  int v6 = (void *)MEMORY[0x1E4F69230];
  unint64_t v7 = [(HFItemModule *)self allItems];
  uint64_t v8 = [v6 requestToUpdateItems:v7 senderSelector:a2];
  id v9 = (id)[v10 performItemUpdateRequest:v8];
}

- (id)_sortedActivationGranularities
{
  return &unk_1F19B56C0;
}

- (unint64_t)_activationGranularityForUserItem:(id)a3
{
  id v4 = a3;
  id v5 = [(HUPresenceUserPickerItemModule *)self activationOptionStateByGranularity];
  int v6 = [v5 objectEnumerator];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __68__HUPresenceUserPickerItemModule__activationGranularityForUserItem___block_invoke;
  v11[3] = &unk_1E6387E88;
  id v12 = v4;
  id v7 = v4;
  uint64_t v8 = objc_msgSend(v6, "na_firstObjectPassingTest:", v11);
  unint64_t v9 = [v8 activationGranularity];

  return v9;
}

uint64_t __68__HUPresenceUserPickerItemModule__activationGranularityForUserItem___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 userOptionItemProvider];
  id v4 = [v3 items];
  uint64_t v5 = [v4 containsObject:*(void *)(a1 + 32)];

  return v5;
}

- (void)_createItemProviders
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  objc_initWeak(&location, self);
  id v37 = (id)objc_opt_new();
  v38 = objc_opt_new();
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  v2 = [(HUPresenceUserPickerItemModule *)self _sortedActivationGranularities];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v44 objects:v49 count:16];
  if (v3)
  {
    uint64_t v36 = *(void *)v45;
    id obj = v2;
    do
    {
      uint64_t v39 = v3;
      for (uint64_t i = 0; i != v39; ++i)
      {
        if (*(void *)v45 != v36) {
          objc_enumerationMutation(obj);
        }
        uint64_t v5 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        id v6 = objc_alloc(MEMORY[0x1E4F69718]);
        id v7 = [(HUPresenceUserPickerItemModule *)self home];
        uint64_t v8 = (void *)[v6 initWithHome:v7];

        [v8 setIncludeCurrentUser:1];
        [v8 setIncludeGuestUsers:1];
        [v8 setNameStyle:2];
        id v9 = objc_alloc(MEMORY[0x1E4F696B0]);
        v42[0] = MEMORY[0x1E4F143A8];
        v42[1] = 3221225472;
        v42[2] = __54__HUPresenceUserPickerItemModule__createItemProviders__block_invoke;
        v42[3] = &unk_1E6387F20;
        objc_copyWeak(&v43, &location);
        v42[4] = v5;
        id v10 = (void *)[v9 initWithSourceProvider:v8 transformationBlock:v42];
        uint64_t v11 = [v5 unsignedIntegerValue];
        id v12 = [(HUPresenceUserPickerItemModule *)self presenceEventBuilder];
        uint64_t v13 = [v12 activationGranularity];

        v40 = v5;
        if (v13 == v11)
        {
          uint64_t v14 = [(HUPresenceUserPickerItemModule *)self presenceEventBuilder];
          id v15 = [v14 users];
        }
        else
        {
          id v15 = [MEMORY[0x1E4F694F8] allUsersCollection];
        }
        uint64_t v16 = [HUPresenceActivationOptionItem alloc];
        uint64_t v17 = [(HUPresenceUserPickerItemModule *)self presenceEventBuilder];
        uint64_t v18 = [v17 locationEventType];
        uint64_t v19 = [(HUPresenceUserPickerItemModule *)self home];
        uint64_t v20 = [(HUPresenceActivationOptionItem *)v16 initWithEventType:v18 selectedUsers:v15 activationGranularity:v11 style:0 home:v19];

        [(HUPresenceActivationOptionItem *)v20 setSelected:v13 == v11];
        [v38 addObject:v20];
        uint64_t v21 = [[HUPresenceActivationOptionState alloc] initWithUserOptionItemProvider:v10 activationOptionItem:v20];
        [v37 setObject:v21 forKeyedSubscript:v40];

        objc_destroyWeak(&v43);
      }
      v2 = obj;
      uint64_t v3 = [obj countByEnumeratingWithState:&v44 objects:v49 count:16];
    }
    while (v3);
  }

  objc_storeStrong((id *)&self->_activationOptionStateByGranularity, v37);
  uint64_t v22 = [HUPresenceActivationOptionItem alloc];
  long long v23 = [(HUPresenceUserPickerItemModule *)self presenceEventBuilder];
  uint64_t v24 = [v23 locationEventType];
  long long v25 = [(HUPresenceUserPickerItemModule *)self presenceEventBuilder];
  long long v26 = [v25 users];
  long long v27 = [(HUPresenceUserPickerItemModule *)self presenceEventBuilder];
  uint64_t v28 = [v27 activationGranularity];
  long long v29 = [(HUPresenceUserPickerItemModule *)self home];
  uint64_t v30 = [(HUPresenceActivationOptionItem *)v22 initWithEventType:v24 selectedUsers:v26 activationGranularity:v28 style:1 home:v29];
  singleUserSummaryItem = self->_singleUserSummaryItem;
  self->_singleUserSummaryItem = v30;

  long long v32 = [(HUPresenceUserPickerItemModule *)self singleUserSummaryItem];
  [v38 addObject:v32];

  long long v33 = (HFStaticItemProvider *)[objc_alloc(MEMORY[0x1E4F695C8]) initWithItems:v38];
  staticItemProvider = self->_staticItemProvider;
  self->_staticItemProvider = v33;

  objc_destroyWeak(&location);
}

id __54__HUPresenceUserPickerItemModule__createItemProviders__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = [HUPresenceUserOptionItem alloc];
  id v6 = [WeakRetained options];
  id v7 = [v6 locationDevice];
  uint64_t v8 = [WeakRetained locationDeviceManager];
  id v9 = [(HUPresenceUserOptionItem *)v5 initWithUserItem:v3 selectedLocationDevice:v7 locationDeviceManager:v8];

  id v10 = objc_alloc(MEMORY[0x1E4F696A8]);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __54__HUPresenceUserPickerItemModule__createItemProviders__block_invoke_2;
  v13[3] = &unk_1E6387EF8;
  objc_copyWeak(&v14, (id *)(a1 + 40));
  v13[4] = *(void *)(a1 + 32);
  uint64_t v11 = (void *)[v10 initWithSourceItem:v9 transformationBlock:v13];
  objc_destroyWeak(&v14);

  return v11;
}

id __54__HUPresenceUserPickerItemModule__createItemProviders__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  id v6 = (void *)[v4 mutableCopy];
  id v7 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F68C78]];

  uint64_t v8 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(WeakRetained, "_isUserHandleSelected:", v7));
  [v6 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F68B40]];

  id v9 = NSNumber;
  id v10 = [WeakRetained activationOptionStateByGranularity];
  uint64_t v11 = [v10 objectForKeyedSubscript:*(void *)(a1 + 32)];
  id v12 = objc_msgSend(v9, "numberWithInt:", objc_msgSend(v11, "isExpanded") ^ 1);
  [v6 setObject:v12 forKeyedSubscript:*MEMORY[0x1E4F68B10]];

  return v6;
}

- (BOOL)_shouldUseSingleUserStyle
{
  id v3 = [(HUPresenceUserPickerItemModule *)self home];
  id v4 = objc_msgSend(v3, "hf_allUsersIncludingCurrentUser");
  if ((unint64_t)[v4 count] < 2)
  {
    BOOL v7 = 1;
  }
  else
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F2EA28];
    id v6 = [(HUPresenceUserPickerItemModule *)self home];
    BOOL v7 = objc_msgSend(v5, "hf_presenceDisableReasonsForHome:", v6) != 0;
  }
  return v7;
}

- (BOOL)_canDeselectUserHandle:(id)a3
{
  if (![(HUPresenceUserPickerItemModule *)self _isUserHandleSelected:a3]) {
    return 0;
  }
  id v4 = [(HUPresenceUserPickerItemModule *)self _allSelectedAndSupportedUsers];
  BOOL v5 = (unint64_t)[v4 count] > 1;

  return v5;
}

- (BOOL)_isUserHandleSelected:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = a3;
  BOOL v5 = [(HUPresenceUserPickerItemModule *)self home];
  id v6 = objc_msgSend(v5, "hf_userForHandle:", v4);

  BOOL v7 = [(HUPresenceUserPickerItemModule *)self _allSelectedAndSupportedUsers];
  LOBYTE(v4) = [v7 containsObject:v6];

  return (char)v4;
}

- (void)_updateSelected:(BOOL)a3 forUserHandle:(id)a4
{
  BOOL v4 = a3;
  id v34 = a4;
  if (-[HUPresenceUserPickerItemModule _isUserHandleSelected:](self, "_isUserHandleSelected:") != v4
    && (v4 || [(HUPresenceUserPickerItemModule *)self _canDeselectUserHandle:v34]))
  {
    BOOL v7 = [(HUPresenceUserPickerItemModule *)self home];
    uint64_t v8 = objc_msgSend(v7, "hf_userForHandle:", v34);

    id v9 = [(HUPresenceUserPickerItemModule *)self presenceEventBuilder];
    id v10 = [v9 users];
    uint64_t v11 = [(HUPresenceUserPickerItemModule *)self home];
    id v12 = [v10 resolveSelectedUsersWithHome:v11];
    uint64_t v13 = (void *)[v12 mutableCopy];

    if (v4) {
      [v13 addObject:v8];
    }
    else {
      [v13 removeObject:v8];
    }
    id v14 = (void *)MEMORY[0x1E4F694F8];
    id v15 = [(HUPresenceUserPickerItemModule *)self home];
    uint64_t v16 = [v14 collectionWithResolvedUsers:v13 inHome:v15];

    uint64_t v17 = [(HUPresenceUserPickerItemModule *)self presenceEventBuilder];
    uint64_t v18 = [v17 users];
    char v19 = [v16 isEqual:v18];

    if ((v19 & 1) == 0)
    {
      uint64_t v20 = [(HUPresenceUserPickerItemModule *)self presenceEventBuilder];
      [v20 setUsers:v16];

      uint64_t v21 = [(HUPresenceUserPickerItemModule *)self activationOptionStateByGranularity];
      uint64_t v22 = NSNumber;
      long long v23 = [(HUPresenceUserPickerItemModule *)self presenceEventBuilder];
      uint64_t v24 = objc_msgSend(v22, "numberWithUnsignedInteger:", objc_msgSend(v23, "activationGranularity"));
      long long v25 = [v21 objectForKeyedSubscript:v24];

      long long v26 = [v25 activationOptionItem];
      [v26 setSelectedUsers:v16];

      [(HUPresenceActivationOptionItem *)self->_singleUserSummaryItem setSelectedUsers:v16];
      long long v27 = (void *)MEMORY[0x1E4F69230];
      uint64_t v28 = [(HFItemModule *)self allItems];
      long long v29 = [v27 requestToUpdateItems:v28 senderSelector:a2];

      uint64_t v30 = [(HFItemModule *)self itemUpdater];
      id v31 = (id)[v30 performItemUpdateRequest:v29];

      long long v32 = [(HUPresenceUserPickerItemModule *)self delegate];
      long long v33 = [(HUPresenceUserPickerItemModule *)self presenceEventBuilder];
      [v32 userPickerModule:self didUpdatePresenceEvent:v33];
    }
  }
}

- (id)_allSelectedAndSupportedUsers
{
  id v3 = [(HUPresenceUserPickerItemModule *)self options];
  int v4 = [v3 customLocationSelected];

  if (v4)
  {
    BOOL v5 = (void *)MEMORY[0x1E4F1CAD0];
    id v6 = [(HUPresenceUserPickerItemModule *)self home];
    BOOL v7 = [v6 currentUser];
    uint64_t v8 = [v5 setWithObject:v7];
  }
  else
  {
    id v6 = [(HUPresenceUserPickerItemModule *)self presenceEventBuilder];
    BOOL v7 = [v6 users];
    id v9 = [(HUPresenceUserPickerItemModule *)self home];
    uint64_t v8 = [v7 resolveSelectedUsersWithHome:v9];
  }

  return v8;
}

- (BOOL)_isPresenceAuthorizedForUser:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(HUPresenceUserPickerItemModule *)self home];
  id v6 = objc_msgSend(v5, "hf_handleForUser:", v4);
  uint64_t v7 = [v6 type];

  if (v7)
  {
    uint64_t v8 = [(HUPresenceUserPickerItemModule *)self home];
    id v9 = [v8 homeAccessControlForUser:v4];

    BOOL v10 = [v9 presenceAuthorizationStatus] != 1;
  }
  else
  {
    BOOL v10 = 1;
  }

  return v10;
}

+ (id)_userItemComparator
{
  return &__block_literal_global_69;
}

uint64_t __53__HUPresenceUserPickerItemModule__userItemComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = [v4 latestResults];
  uint64_t v7 = *MEMORY[0x1E4F68C78];
  uint64_t v8 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F68C78]];

  id v9 = [v5 latestResults];
  BOOL v10 = [v9 objectForKeyedSubscript:v7];

  if ([v8 type] || !objc_msgSend(v10, "type"))
  {
    if ([v8 type] && !objc_msgSend(v10, "type"))
    {
      uint64_t v12 = 1;
    }
    else
    {
      uint64_t v11 = [MEMORY[0x1E4F69220] defaultItemComparator];
      uint64_t v12 = ((uint64_t (**)(void, id, id))v11)[2](v11, v4, v5);
    }
  }
  else
  {
    uint64_t v12 = -1;
  }

  return v12;
}

- (id)_attributedFooterTitle
{
  id v3 = [(HUPresenceUserPickerItemModule *)self options];
  id v4 = [v3 locationDevice];
  uint64_t v5 = [v4 type];

  if (v5)
  {
    id v6 = [(HUPresenceUserPickerItemModule *)self _combinedFooterStringForLocationDeviceText:0];
  }
  else
  {
    uint64_t v16 = 0;
    uint64_t v17 = &v16;
    uint64_t v18 = 0x3032000000;
    char v19 = __Block_byref_object_copy__6;
    uint64_t v20 = __Block_byref_object_dispose__6;
    id v21 = 0;
    uint64_t v7 = [(HUPresenceUserPickerItemModule *)self locationDeviceManager];
    uint64_t v8 = [v7 activeLocationDeviceFuture];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __56__HUPresenceUserPickerItemModule__attributedFooterTitle__block_invoke;
    v15[3] = &unk_1E6387F70;
    v15[4] = self;
    id v9 = [v8 flatMap:v15];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __56__HUPresenceUserPickerItemModule__attributedFooterTitle__block_invoke_3;
    v14[3] = &unk_1E6387340;
    v14[4] = self;
    BOOL v10 = [v9 recover:v14];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __56__HUPresenceUserPickerItemModule__attributedFooterTitle__block_invoke_4;
    v13[3] = &unk_1E6387F98;
    v13[4] = self;
    void v13[5] = &v16;
    id v11 = (id)[v10 flatMap:v13];

    id v6 = (id)v17[5];
    _Block_object_dispose(&v16, 8);
  }

  return v6;
}

id __56__HUPresenceUserPickerItemModule__attributedFooterTitle__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __56__HUPresenceUserPickerItemModule__attributedFooterTitle__block_invoke_2;
  v9[3] = &unk_1E6387F48;
  id v10 = v2;
  id v3 = v2;
  id v4 = __56__HUPresenceUserPickerItemModule__attributedFooterTitle__block_invoke_2((uint64_t)v9);
  uint64_t v5 = (void *)MEMORY[0x1E4F7A0D8];
  id v6 = [(id)objc_opt_class() _locationDeviceTextForDeviceNameString:v4];
  uint64_t v7 = [v5 futureWithResult:v6];

  return v7;
}

id __56__HUPresenceUserPickerItemModule__attributedFooterTitle__block_invoke_2(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isCurrentDevice])
  {
    id v2 = HULocalizedModelString(@"HUPresenceActiveLocationDeviceFooterFormatThisDevice");
  }
  else
  {
    id v3 = [*(id *)(a1 + 32) name];
    id v2 = HULocalizedStringWithFormat(@"HUPresenceActiveLocationDeviceFooterFormatOtherDevice", @"%@", v4, v5, v6, v7, v8, v9, (uint64_t)v3);
  }

  return v2;
}

id __56__HUPresenceUserPickerItemModule__attributedFooterTitle__block_invoke_3()
{
  v0 = (void *)MEMORY[0x1E4F7A0D8];
  v1 = [(id)objc_opt_class() _locationDeviceTextForDeviceNameString:0];
  id v2 = [v0 futureWithResult:v1];

  return v2;
}

uint64_t __56__HUPresenceUserPickerItemModule__attributedFooterTitle__block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(a1 + 32) _combinedFooterStringForLocationDeviceText:a2];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  uint64_t v6 = (void *)MEMORY[0x1E4F7A0D8];

  return [v6 futureWithNoResult];
}

- (id)_combinedFooterStringForLocationDeviceText:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  uint64_t v6 = [(HUPresenceUserPickerItemModule *)self _homeHubNeedsUpdateWarningText];
  objc_msgSend(v5, "na_safeAddObject:", v6);

  uint64_t v7 = [(HUPresenceUserPickerItemModule *)self _someUsersNeedSoftwareUpdateWarningText];
  objc_msgSend(v5, "na_safeAddObject:", v7);

  objc_msgSend(v5, "na_safeAddObject:", v4);
  if ([v5 count])
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F28E48]);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __77__HUPresenceUserPickerItemModule__combinedFooterStringForLocationDeviceText___block_invoke;
    v11[3] = &unk_1E6387FC0;
    id v9 = v8;
    id v12 = v9;
    [v5 enumerateObjectsUsingBlock:v11];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

void __77__HUPresenceUserPickerItemModule__combinedFooterStringForLocationDeviceText___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v7 = a2;
  if (a3)
  {
    uint64_t v5 = *(void **)(a1 + 32);
    uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@"\n\n"];
    [v5 appendAttributedString:v6];
  }
  [*(id *)(a1 + 32) appendAttributedString:v7];
}

- (id)_homeHubNeedsUpdateWarningText
{
  id v2 = [(HUPresenceUserPickerItemModule *)self home];
  if (objc_msgSend(v2, "hf_supportsSharedEventAutomation"))
  {
    uint64_t v3 = 0;
  }
  else
  {
    id v4 = objc_alloc(MEMORY[0x1E4F28B18]);
    uint64_t v5 = _HULocalizedStringWithDefaultValue(@"HUPresenceActivationWarningFooterHomeHubNeedsUpdate", @"HUPresenceActivationWarningFooterHomeHubNeedsUpdate", 1);
    uint64_t v3 = (void *)[v4 initWithString:v5];
  }

  return v3;
}

- (id)_someUsersNeedSoftwareUpdateWarningText
{
  if ([(HUPresenceUserPickerItemModule *)self _shouldUseSingleUserStyle]) {
    goto LABEL_4;
  }
  uint64_t v3 = [(HUPresenceUserPickerItemModule *)self home];
  id v4 = [v3 users];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __73__HUPresenceUserPickerItemModule__someUsersNeedSoftwareUpdateWarningText__block_invoke;
  v10[3] = &unk_1E63858F0;
  void v10[4] = self;
  int v5 = objc_msgSend(v4, "na_any:", v10);

  if (!v5)
  {
LABEL_4:
    id v8 = 0;
  }
  else
  {
    id v6 = objc_alloc(MEMORY[0x1E4F28B18]);
    id v7 = _HULocalizedStringWithDefaultValue(@"HUPresenceActivationWarningFooterSomeUsersNeedSoftwareUpdate", @"HUPresenceActivationWarningFooterSomeUsersNeedSoftwareUpdate", 1);
    id v8 = (void *)[v6 initWithString:v7];
  }

  return v8;
}

uint64_t __73__HUPresenceUserPickerItemModule__someUsersNeedSoftwareUpdateWarningText__block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 home];
  int v5 = objc_msgSend(v4, "hf_isPresenceAuthorizedForUser:", v3);

  return v5 ^ 1u;
}

+ (id)_locationDeviceTextForDeviceNameString:(id)a3
{
  id v3 = a3;
  uint64_t v4 = _HULocalizedStringWithDefaultValue(@"HUPresenceActiveLocationDeviceFooterSettingsLinkTitle", @"HUPresenceActiveLocationDeviceFooterSettingsLinkTitle", 1);
  id v11 = (void *)v4;
  if (v3)
  {
    uint64_t v24 = HULocalizedStringWithFormat(@"HUPresenceActiveLocationDeviceFooterSettingsDescription", @"%@", v5, v6, v7, v8, v9, v10, v4);
    uint64_t v18 = HULocalizedStringWithFormat(@"HUPresenceActiveLocationDeviceFooterFormat", @"%@%@", v12, v13, v14, v15, v16, v17, (uint64_t)v3);
  }
  else
  {
    uint64_t v18 = HULocalizedStringWithFormat(@"HUPresenceActiveLocationDeviceFooterNoFMFDeviceSettingsDescription", @"%@", v5, v6, v7, v8, v9, v10, v4);
  }
  int v19 = [MEMORY[0x1E4F69758] isAMac];
  uint64_t v20 = (void *)MEMORY[0x1E4F28B18];
  if (v19)
  {
    id v21 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v18];
  }
  else
  {
    uint64_t v22 = objc_msgSend(MEMORY[0x1E4F1CB10], "hf_locationDeviceSettingsURL");
    id v21 = objc_msgSend(v20, "hf_attributedLinkStringForString:linkString:linkURL:", v18, v11, v22);
  }

  return v21;
}

- (HFItem)singleUserSummaryItem
{
  return &self->_singleUserSummaryItem->super;
}

- (HMHome)home
{
  return self->_home;
}

- (HUPresenceUserPickerItemModuleDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUPresenceUserPickerItemModuleDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (HFPresenceEventBuilder)presenceEventBuilder
{
  return self->_presenceEventBuilder;
}

- (HUPresenceUserPickerItemModuleOptions)options
{
  return self->_options;
}

- (NSDictionary)activationOptionStateByGranularity
{
  return self->_activationOptionStateByGranularity;
}

- (HFStaticItemProvider)staticItemProvider
{
  return self->_staticItemProvider;
}

- (HULocationDeviceManager)locationDeviceManager
{
  return self->_locationDeviceManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationDeviceManager, 0);
  objc_storeStrong((id *)&self->_staticItemProvider, 0);
  objc_storeStrong((id *)&self->_activationOptionStateByGranularity, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_presenceEventBuilder, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_home, 0);

  objc_storeStrong((id *)&self->_singleUserSummaryItem, 0);
}

@end