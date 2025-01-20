@interface HULocationEventEditorSummaryItemManager
+ (NSString)locationSectionID;
+ (NSString)usersHeaderSectionID;
+ (NSString)usersListSectionID;
- (BOOL)_canEditLocation;
- (BOOL)_hasCustomLocation;
- (BOOL)canChangeLocation;
- (BOOL)isInstructionsItem:(id)a3;
- (HFItem)locationItem;
- (HFItem)usersInstructionsItem;
- (HUEventUIFlow)flow;
- (HULocationEventEditorSummaryItemManager)initWithDelegate:(id)a3 flow:(id)a4;
- (HULocationEventEditorSummaryItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4;
- (HUPresenceUserPickerItemModule)userPickerModule;
- (HUTriggerConditionEditorItemModule)conditionEditorModule;
- (id)_buildItemModulesForHome:(id)a3;
- (id)_buildItemProvidersForHome:(id)a3;
- (id)_buildSectionsWithDisplayedItems:(id)a3;
- (id)_userPickerOptions;
- (id)home;
- (id)locationEventRegion;
- (void)setFlow:(id)a3;
- (void)setLocationItem:(id)a3;
- (void)setUsersInstructionsItem:(id)a3;
- (void)updateLocationEventWithRegion:(id)a3;
- (void)userPickerModule:(id)a3 didUpdatePresenceEvent:(id)a4;
@end

@implementation HULocationEventEditorSummaryItemManager

+ (NSString)usersHeaderSectionID
{
  if (_MergedGlobals_5_1 != -1) {
    dispatch_once(&_MergedGlobals_5_1, &__block_literal_global_3_3);
  }
  v2 = (void *)qword_1EBA472B8;

  return (NSString *)v2;
}

void __63__HULocationEventEditorSummaryItemManager_usersHeaderSectionID__block_invoke_2()
{
  v0 = (void *)qword_1EBA472B8;
  qword_1EBA472B8 = @"users";
}

+ (NSString)usersListSectionID
{
  return +[HUPresenceUserPickerItemModule sectionID];
}

+ (NSString)locationSectionID
{
  if (qword_1EBA472C0 != -1) {
    dispatch_once(&qword_1EBA472C0, &__block_literal_global_8_1);
  }
  v2 = (void *)qword_1EBA472C8;

  return (NSString *)v2;
}

void __60__HULocationEventEditorSummaryItemManager_locationSectionID__block_invoke_2()
{
  v0 = (void *)qword_1EBA472C8;
  qword_1EBA472C8 = @"location";
}

- (HULocationEventEditorSummaryItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4
{
  v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  v7 = NSStringFromSelector(sel_initWithDelegate_flow_);
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HULocationEventEditorSummaryItemManager.m", 46, @"%s is unavailable; use %@ instead",
    "-[HULocationEventEditorSummaryItemManager initWithDelegate:sourceItem:]",
    v7);

  return 0;
}

- (HULocationEventEditorSummaryItemManager)initWithDelegate:(id)a3 flow:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  v9 = [v7 eventBuilderItem];
  v10 = [v9 locationEventBuilder];

  if (!v10)
  {
    id v11 = objc_alloc_init(MEMORY[0x1E4F69408]);
    uint64_t v12 = [v7 eventType];
    if ((unint64_t)(v12 - 1) <= 1) {
      [v11 setLocationEventType:v12];
    }
    v13 = [v7 eventBuilderItem];
    [v13 setLocationEventBuilder:v11];
  }
  id v14 = objc_alloc(MEMORY[0x1E4F695C0]);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __65__HULocationEventEditorSummaryItemManager_initWithDelegate_flow___block_invoke;
  v20[3] = &unk_1E6385000;
  v15 = self;
  v21 = v15;
  v16 = (void *)[v14 initWithResultsBlock:v20];
  v19.receiver = v15;
  v19.super_class = (Class)HULocationEventEditorSummaryItemManager;
  v17 = [(HFItemManager *)&v19 initWithDelegate:v8 sourceItem:v16];

  if (v17) {
    objc_storeStrong((id *)&v17->_flow, a4);
  }

  return v17;
}

id __65__HULocationEventEditorSummaryItemManager_initWithDelegate_flow___block_invoke(uint64_t a1)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v1 = [*(id *)(a1 + 32) flow];
  uint64_t v2 = [v1 eventType];

  if (v2 == 1) {
    v3 = @"HULocationTriggerSummaryTitlePeopleArrive";
  }
  else {
    v3 = @"HULocationTriggerSummaryTitlePeopleLeave";
  }
  v4 = _HULocalizedStringWithDefaultValue(v3, v3, 1);
  v5 = (void *)MEMORY[0x1E4F7A0D8];
  uint64_t v9 = *MEMORY[0x1E4F68AB8];
  v10[0] = v4;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  id v7 = [v5 futureWithResult:v6];

  return v7;
}

- (id)home
{
  v3 = [(HULocationEventEditorSummaryItemManager *)self flow];
  v4 = [v3 triggerBuilder];
  v5 = [v4 home];
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)HULocationEventEditorSummaryItemManager;
    id v7 = [(HFItemManager *)&v10 home];
  }
  id v8 = v7;

  return v8;
}

- (BOOL)isInstructionsItem:(id)a3
{
  id v4 = a3;
  id v5 = [(HULocationEventEditorSummaryItemManager *)self usersInstructionsItem];

  return v5 == v4;
}

- (id)locationEventRegion
{
  v3 = [(HULocationEventEditorSummaryItemManager *)self flow];
  id v4 = [v3 eventBuilderItem];
  id v5 = [v4 locationEventBuilder];

  objc_opt_class();
  id v6 = v5;
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;

  if (v8)
  {
    uint64_t v9 = [v8 region];
    uint64_t v10 = +[HULocationTriggerRegion customRegionWithCircularRegion:v9];
LABEL_8:
    id v11 = (void *)v10;

    goto LABEL_10;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [(HULocationEventEditorSummaryItemManager *)self home];
    uint64_t v10 = +[HULocationTriggerRegion homeRegionWithHome:eventType:](HULocationTriggerRegion, "homeRegionWithHome:eventType:", v9, [v6 locationEventType]);
    goto LABEL_8;
  }
  id v11 = 0;
LABEL_10:

  return v11;
}

- (BOOL)canChangeLocation
{
  objc_opt_class();
  v3 = [(HULocationEventEditorSummaryItemManager *)self locationItem];
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  BOOL v6 = v5 && ([v5 locationCanBeEdited] & 1) != 0;
  return v6;
}

- (void)updateLocationEventWithRegion:(id)a3
{
  id v20 = a3;
  uint64_t v5 = [v20 regionType];
  if (v5 == 1)
  {
    objc_opt_class();
    uint64_t v10 = [(HULocationEventEditorSummaryItemManager *)self flow];
    id v11 = [v10 eventBuilderItem];
    id v6 = [v11 locationEventBuilder];
    if (objc_opt_isKindOfClass()) {
      uint64_t v12 = v6;
    }
    else {
      uint64_t v12 = 0;
    }
    id v13 = v12;

    if (!v13)
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4F69258]);
      id v14 = [(HULocationEventEditorSummaryItemManager *)self flow];
      v15 = [v14 eventBuilderItem];
      [v15 setLocationEventBuilder:v6];
    }
    id v7 = [v20 circularRegion];
    [v6 setRegion:v7];
  }
  else
  {
    if (v5) {
      goto LABEL_11;
    }
    id v6 = [(HULocationEventEditorSummaryItemManager *)self userPickerModule];
    id v7 = [v6 presenceEventBuilder];
    id v8 = [(HULocationEventEditorSummaryItemManager *)self flow];
    uint64_t v9 = [v8 eventBuilderItem];
    [v9 setLocationEventBuilder:v7];
  }
LABEL_11:
  v16 = [(HULocationEventEditorSummaryItemManager *)self _userPickerOptions];
  v17 = [(HULocationEventEditorSummaryItemManager *)self userPickerModule];
  [v17 setOptions:v16];

  v18 = [(HFItemManager *)self allItems];
  id v19 = [(HFItemManager *)self updateResultsForItems:v18 senderSelector:a2];
}

- (id)_userPickerOptions
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __61__HULocationEventEditorSummaryItemManager__userPickerOptions__block_invoke;
  v6[3] = &unk_1E638E728;
  v6[4] = self;
  v3 = __61__HULocationEventEditorSummaryItemManager__userPickerOptions__block_invoke((uint64_t)v6);
  id v4 = [[HUPresenceUserPickerItemModuleOptions alloc] initWithLocationDevice:v3 customLocationSelected:[(HULocationEventEditorSummaryItemManager *)self _hasCustomLocation]];

  return v4;
}

id __61__HULocationEventEditorSummaryItemManager__userPickerOptions__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) flow];
  v3 = [v2 eventBuilderItem];
  id v4 = [v3 locationEventBuilder];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v6 = +[HUPresenceCurrentUserLocationDevice FMFDevice];
  }
  else
  {
    id v7 = [*(id *)(a1 + 32) flow];
    id v8 = [v7 triggerBuilder];
    uint64_t v9 = [v8 trigger];
    uint64_t v10 = [v9 creatorDevice];

    if (v10) {
      +[HUPresenceCurrentUserLocationDevice customDeviceWithHMDevice:v10];
    }
    else {
    id v6 = +[HUPresenceCurrentUserLocationDevice currentDevice];
    }
  }

  return v6;
}

- (id)_buildItemModulesForHome:(id)a3
{
  v29[2] = *MEMORY[0x1E4F143B8];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __68__HULocationEventEditorSummaryItemManager__buildItemModulesForHome___block_invoke;
  v27[3] = &unk_1E638E750;
  v27[4] = self;
  id v4 = a3;
  uint64_t v5 = __68__HULocationEventEditorSummaryItemManager__buildItemModulesForHome___block_invoke((uint64_t)v27);
  id v6 = [HUPresenceUserPickerItemModule alloc];
  id v7 = [(HULocationEventEditorSummaryItemManager *)self flow];
  id v8 = [v7 triggerBuilder];
  uint64_t v9 = [v8 home];
  uint64_t v10 = (void *)v9;
  if (v9) {
    id v11 = (id)v9;
  }
  else {
    id v11 = v4;
  }
  uint64_t v12 = [(HULocationEventEditorSummaryItemManager *)self _userPickerOptions];
  id v13 = [(HUPresenceUserPickerItemModule *)v6 initWithItemUpdater:self home:v11 presenceEvent:v5 options:v12 delegate:self];

  userPickerModule = self->_userPickerModule;
  self->_userPickerModule = v13;

  if (_os_feature_enabled_impl())
  {
    v15 = [(HULocationEventEditorSummaryItemManager *)self userPickerModule];
    v28 = v15;
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v28 count:1];
  }
  else
  {
    v17 = [HUTriggerConditionEditorItemModule alloc];
    v18 = [(HULocationEventEditorSummaryItemManager *)self home];
    id v19 = [(HULocationEventEditorSummaryItemManager *)self flow];
    id v20 = [v19 triggerBuilder];
    v21 = [v20 conditionCollection];
    v22 = [MEMORY[0x1E4F1CAD0] setWithObject:&unk_1F19B4AC0];
    v23 = [(HUTriggerConditionEditorItemModule *)v17 initWithItemUpdater:self home:v18 conditionCollection:v21 disallowedConditionTypes:v22];
    conditionEditorModule = self->_conditionEditorModule;
    self->_conditionEditorModule = v23;

    v15 = [(HULocationEventEditorSummaryItemManager *)self userPickerModule];
    v29[0] = v15;
    v25 = [(HULocationEventEditorSummaryItemManager *)self conditionEditorModule];
    v29[1] = v25;
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:2];
  }

  return v16;
}

id __68__HULocationEventEditorSummaryItemManager__buildItemModulesForHome___block_invoke(uint64_t a1)
{
  objc_opt_class();
  uint64_t v2 = [*(id *)(a1 + 32) flow];
  v3 = [v2 eventBuilderItem];
  id v4 = [v3 locationEventBuilder];
  if (objc_opt_isKindOfClass()) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = v5;

  if (!v6)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F69408]);
    id v7 = [*(id *)(a1 + 32) flow];
    uint64_t v8 = [v7 eventType];

    if (v8 == 1)
    {
      uint64_t v9 = 1;
    }
    else
    {
      uint64_t v10 = [*(id *)(a1 + 32) flow];
      uint64_t v11 = [v10 eventType];

      if (v11 != 2)
      {
LABEL_10:
        uint64_t v12 = [MEMORY[0x1E4F694F8] currentUserCollection];
        [v4 setUsers:v12];

        [v4 setActivationGranularity:0];
        goto LABEL_11;
      }
      uint64_t v9 = 2;
    }
    [v4 setLocationEventType:v9];
    goto LABEL_10;
  }
LABEL_11:
  id v13 = [v4 buildNewEventsFromCurrentState];
  id v14 = [v13 anyObject];

  return v14;
}

- (id)_buildItemProvidersForHome:(id)a3
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v4 = objc_msgSend(MEMORY[0x1E4F1CA80], "set", a3);
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F695C0]) initWithResultsBlock:&__block_literal_global_50_1];
  [(HULocationEventEditorSummaryItemManager *)self setUsersInstructionsItem:v5];

  id v6 = [(HULocationEventEditorSummaryItemManager *)self usersInstructionsItem];
  [v4 addObject:v6];

  id v7 = [HULocationEventSelectedLocationItem alloc];
  uint64_t v8 = [(HULocationEventEditorSummaryItemManager *)self flow];
  uint64_t v9 = [v8 eventBuilderItem];
  uint64_t v10 = [v9 locationEventBuilder];
  uint64_t v11 = [(HULocationEventEditorSummaryItemManager *)self home];
  uint64_t v12 = [(HULocationEventSelectedLocationItem *)v7 initWithEvent:v10 inHome:v11];

  id v13 = [(HULocationEventEditorSummaryItemManager *)self flow];
  id v14 = [v13 triggerBuilder];

  if (v14)
  {
    v15 = [(HULocationEventEditorSummaryItemManager *)self flow];
    v16 = [v15 triggerBuilder];
    -[HULocationEventSelectedLocationItem setLocationCanBeEdited:](v12, "setLocationCanBeEdited:", [v16 isShortcutOwned] ^ 1);
  }
  else
  {
    [(HULocationEventSelectedLocationItem *)v12 setLocationCanBeEdited:1];
  }
  [(HULocationEventEditorSummaryItemManager *)self setLocationItem:v12];
  v17 = [(HULocationEventEditorSummaryItemManager *)self locationItem];
  [v4 addObject:v17];

  v18 = (void *)[objc_alloc(MEMORY[0x1E4F695C8]) initWithItems:v4];
  v21[0] = v18;
  id v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];

  return v19;
}

id __70__HULocationEventEditorSummaryItemManager__buildItemProvidersForHome___block_invoke()
{
  v0 = objc_opt_new();
  [v0 setObject:&unk_1F19B4AD8 forKeyedSubscript:@"instructionsStyle"];
  v1 = _HULocalizedStringWithDefaultValue(@"HULocationTriggerEditorUserListSectionTitle", @"HULocationTriggerEditorUserListSectionTitle", 1);
  [v0 setObject:v1 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];

  uint64_t v2 = [MEMORY[0x1E4F7A0D8] futureWithResult:v0];

  return v2;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  id v6 = objc_alloc(MEMORY[0x1E4F692E8]);
  id v7 = +[HULocationEventEditorSummaryItemManager usersHeaderSectionID];
  uint64_t v8 = (void *)[v6 initWithIdentifier:v7];

  uint64_t v9 = [(HULocationEventEditorSummaryItemManager *)self usersInstructionsItem];
  v23[0] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
  [v8 setItems:v10 filteringToDisplayedItems:v4];

  [v5 addObject:v8];
  uint64_t v11 = [(HULocationEventEditorSummaryItemManager *)self userPickerModule];
  uint64_t v12 = [v11 buildSectionsWithDisplayedItems:v4];
  [v5 addObjectsFromArray:v12];

  id v13 = objc_alloc(MEMORY[0x1E4F692E8]);
  id v14 = +[HULocationEventEditorSummaryItemManager locationSectionID];
  v15 = (void *)[v13 initWithIdentifier:v14];

  v16 = [(HULocationEventEditorSummaryItemManager *)self locationItem];
  v22 = v16;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];
  [v15 setItems:v17 filteringToDisplayedItems:v4];

  [v5 addObject:v15];
  v18 = [(HULocationEventEditorSummaryItemManager *)self conditionEditorModule];

  if (v18)
  {
    id v19 = [(HULocationEventEditorSummaryItemManager *)self conditionEditorModule];
    id v20 = [v19 buildSectionsWithDisplayedItems:v4];
    [v5 addObjectsFromArray:v20];
  }

  return v5;
}

- (BOOL)_canEditLocation
{
  v3 = [(HULocationEventEditorSummaryItemManager *)self flow];
  id v4 = [v3 eventBuilderItem];
  uint64_t v5 = [v4 locationEventBuilder];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    return 1;
  }
  uint64_t v8 = [(HULocationEventEditorSummaryItemManager *)self userPickerModule];
  uint64_t v9 = [v8 presenceEventBuilder];
  uint64_t v10 = [v9 users];
  uint64_t v11 = [(HULocationEventEditorSummaryItemManager *)self home];
  uint64_t v12 = [v10 resolveSelectedUsersWithHome:v11];

  id v13 = (void *)MEMORY[0x1E4F1CAD0];
  id v14 = [(HULocationEventEditorSummaryItemManager *)self home];
  v15 = [v14 currentUser];
  v16 = [v13 setWithObject:v15];
  LOBYTE(v10) = [v12 isEqualToSet:v16];

  return (char)v10;
}

- (BOOL)_hasCustomLocation
{
  v3 = [(HULocationEventEditorSummaryItemManager *)self flow];
  id v4 = [v3 eventBuilderItem];
  uint64_t v5 = [v4 locationEventBuilder];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    return 0;
  }
  objc_opt_class();
  uint64_t v8 = [(HULocationEventEditorSummaryItemManager *)self flow];
  uint64_t v9 = [v8 eventBuilderItem];
  uint64_t v10 = [v9 locationEventBuilder];
  if (objc_opt_isKindOfClass()) {
    uint64_t v11 = v10;
  }
  else {
    uint64_t v11 = 0;
  }
  id v12 = v11;

  id v13 = [(HULocationEventEditorSummaryItemManager *)self home];
  char v14 = [v12 isRegionAtHome:v13];

  char v7 = v14 ^ 1;
  return v7;
}

- (void)userPickerModule:(id)a3 didUpdatePresenceEvent:(id)a4
{
  id v25 = a4;
  if (![(HULocationEventEditorSummaryItemManager *)self _hasCustomLocation]
    || ([v25 users],
        id v6 = objc_claimAutoreleasedReturnValue(),
        uint64_t v7 = [v6 type],
        v6,
        v7 != 1))
  {
    uint64_t v8 = [(HULocationEventEditorSummaryItemManager *)self flow];
    uint64_t v9 = [v8 eventBuilderItem];
    uint64_t v10 = [v9 locationEventBuilder];

    if (v10)
    {
      uint64_t v11 = [(HULocationEventEditorSummaryItemManager *)self flow];
      id v12 = [v11 triggerBuilder];
      id v13 = [v12 eventBuilders];
      int v14 = [v13 containsObject:v10];

      if (v14)
      {
        v15 = [(HULocationEventEditorSummaryItemManager *)self flow];
        v16 = [v15 triggerBuilder];
        [v16 removeEventBuilder:v10];

        v17 = [(HULocationEventEditorSummaryItemManager *)self flow];
        v18 = [v17 triggerBuilder];
        [v18 addEventBuilder:v25];
      }
    }
    id v19 = [(HULocationEventEditorSummaryItemManager *)self flow];
    id v20 = [v19 eventBuilderItem];
    [v20 setLocationEventBuilder:v25];

    v21 = (void *)MEMORY[0x1E4F1CAD0];
    v22 = [(HULocationEventEditorSummaryItemManager *)self locationItem];
    v23 = [v21 setWithObject:v22];
    id v24 = [(HFItemManager *)self updateResultsForItems:v23 senderSelector:a2];
  }
}

- (HUPresenceUserPickerItemModule)userPickerModule
{
  return self->_userPickerModule;
}

- (HUTriggerConditionEditorItemModule)conditionEditorModule
{
  return self->_conditionEditorModule;
}

- (HFItem)locationItem
{
  return self->_locationItem;
}

- (void)setLocationItem:(id)a3
{
}

- (HFItem)usersInstructionsItem
{
  return self->_usersInstructionsItem;
}

- (void)setUsersInstructionsItem:(id)a3
{
}

- (HUEventUIFlow)flow
{
  return self->_flow;
}

- (void)setFlow:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flow, 0);
  objc_storeStrong((id *)&self->_usersInstructionsItem, 0);
  objc_storeStrong((id *)&self->_locationItem, 0);
  objc_storeStrong((id *)&self->_conditionEditorModule, 0);

  objc_storeStrong((id *)&self->_userPickerModule, 0);
}

@end