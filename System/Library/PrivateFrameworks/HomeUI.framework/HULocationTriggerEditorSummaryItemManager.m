@interface HULocationTriggerEditorSummaryItemManager
+ (NSString)locationSectionID;
+ (NSString)usersHeaderSectionID;
+ (NSString)usersListSectionID;
- (BOOL)_canEditLocation;
- (BOOL)_hasCustomLocation;
- (BOOL)canChangeLocation;
- (BOOL)isInstructionsItem:(id)a3;
- (HFEventTriggerBuilder)triggerBuilder;
- (HFItem)locationItem;
- (HFItem)usersInstructionsItem;
- (HULocationTriggerEditorSummaryItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4;
- (HULocationTriggerEditorSummaryItemManager)initWithDelegate:(id)a3 triggerBuilder:(id)a4;
- (HUPresenceUserPickerItemModule)userPickerModule;
- (HUTriggerConditionEditorItemModule)conditionEditorModule;
- (id)_buildItemModulesForHome:(id)a3;
- (id)_buildItemProvidersForHome:(id)a3;
- (id)_buildSectionsWithDisplayedItems:(id)a3;
- (id)_userPickerOptions;
- (id)locationEventRegion;
- (void)setLocationItem:(id)a3;
- (void)setUsersInstructionsItem:(id)a3;
- (void)updateLocationEventWithRegion:(id)a3;
- (void)userPickerModule:(id)a3 didUpdatePresenceEvent:(id)a4;
@end

@implementation HULocationTriggerEditorSummaryItemManager

+ (NSString)usersHeaderSectionID
{
  return (NSString *)@"users";
}

+ (NSString)usersListSectionID
{
  return +[HUPresenceUserPickerItemModule sectionID];
}

+ (NSString)locationSectionID
{
  return (NSString *)@"location";
}

- (HULocationTriggerEditorSummaryItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4
{
  v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  v7 = NSStringFromSelector(sel_initWithDelegate_triggerBuilder_);
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HULocationTriggerEditorSummaryItemManager.m", 44, @"%s is unavailable; use %@ instead",
    "-[HULocationTriggerEditorSummaryItemManager initWithDelegate:sourceItem:]",
    v7);

  return 0;
}

- (HULocationTriggerEditorSummaryItemManager)initWithDelegate:(id)a3 triggerBuilder:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  v9 = [v7 locationInterface];
  v10 = [v9 locationEventBuilder];

  if (!v10)
  {
    uint64_t v11 = objc_opt_class();
    NSLog(&cfstr_MustBeInitiali.isa, v11, v7);
  }
  id v12 = objc_alloc(MEMORY[0x1E4F695C0]);
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __77__HULocationTriggerEditorSummaryItemManager_initWithDelegate_triggerBuilder___block_invoke;
  v33[3] = &unk_1E6385000;
  id v13 = v7;
  id v34 = v13;
  v14 = (void *)[v12 initWithResultsBlock:v33];
  v32.receiver = self;
  v32.super_class = (Class)HULocationTriggerEditorSummaryItemManager;
  v15 = [(HFItemManager *)&v32 initWithDelegate:v8 sourceItem:v14];

  if (v15)
  {
    objc_storeStrong((id *)&v15->_triggerBuilder, a4);
    v16 = [HUTriggerConditionEditorItemModule alloc];
    v17 = [v13 home];
    v18 = [v13 conditionCollection];
    v19 = [MEMORY[0x1E4F1CAD0] setWithObject:&unk_1F19B4BE0];
    uint64_t v20 = [(HUTriggerConditionEditorItemModule *)v16 initWithItemUpdater:v15 home:v17 conditionCollection:v18 disallowedConditionTypes:v19];
    conditionEditorModule = v15->_conditionEditorModule;
    v15->_conditionEditorModule = (HUTriggerConditionEditorItemModule *)v20;

    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __77__HULocationTriggerEditorSummaryItemManager_initWithDelegate_triggerBuilder___block_invoke_29;
    v30[3] = &unk_1E638E750;
    id v22 = v13;
    id v31 = v22;
    v23 = __77__HULocationTriggerEditorSummaryItemManager_initWithDelegate_triggerBuilder___block_invoke_29((uint64_t)v30);
    v24 = [HUPresenceUserPickerItemModule alloc];
    v25 = [v22 home];
    v26 = [(HULocationTriggerEditorSummaryItemManager *)v15 _userPickerOptions];
    uint64_t v27 = [(HUPresenceUserPickerItemModule *)v24 initWithItemUpdater:v15 home:v25 presenceEvent:v23 options:v26 delegate:v15];
    userPickerModule = v15->_userPickerModule;
    v15->_userPickerModule = (HUPresenceUserPickerItemModule *)v27;
  }
  return v15;
}

id __77__HULocationTriggerEditorSummaryItemManager_initWithDelegate_triggerBuilder___block_invoke(uint64_t a1)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v1 = [*(id *)(a1 + 32) locationInterface];
  v2 = [v1 locationEventBuilder];
  uint64_t v3 = [v2 locationEventType];

  if (v3 == 1) {
    v4 = @"HULocationTriggerSummaryTitlePeopleArrive";
  }
  else {
    v4 = @"HULocationTriggerSummaryTitlePeopleLeave";
  }
  v5 = _HULocalizedStringWithDefaultValue(v4, v4, 1);
  v6 = (void *)MEMORY[0x1E4F7A0D8];
  uint64_t v10 = *MEMORY[0x1E4F68AB8];
  v11[0] = v5;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  id v8 = [v6 futureWithResult:v7];

  return v8;
}

id __77__HULocationTriggerEditorSummaryItemManager_initWithDelegate_triggerBuilder___block_invoke_29(uint64_t a1)
{
  objc_opt_class();
  v2 = [*(id *)(a1 + 32) locationInterface];
  id v3 = [v2 locationEventBuilder];
  if (objc_opt_isKindOfClass()) {
    v4 = v3;
  }
  else {
    v4 = 0;
  }
  id v5 = v4;

  if (!v5)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F69408]);
    v6 = [*(id *)(a1 + 32) locationInterface];
    id v7 = [v6 locationEventBuilder];
    objc_msgSend(v3, "setLocationEventType:", objc_msgSend(v7, "locationEventType"));

    id v8 = [MEMORY[0x1E4F694F8] currentUserCollection];
    [v3 setUsers:v8];

    [v3 setActivationGranularity:0];
  }
  v9 = [v3 buildNewEventsFromCurrentState];
  uint64_t v10 = [v9 anyObject];

  return v10;
}

- (BOOL)isInstructionsItem:(id)a3
{
  id v4 = a3;
  id v5 = [(HULocationTriggerEditorSummaryItemManager *)self usersInstructionsItem];

  return v5 == v4;
}

- (id)locationEventRegion
{
  id v3 = [(HULocationTriggerEditorSummaryItemManager *)self triggerBuilder];
  id v4 = [v3 locationInterface];
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
    v9 = [v8 region];
    uint64_t v10 = +[HULocationTriggerRegion customRegionWithCircularRegion:v9];
LABEL_8:
    uint64_t v11 = (void *)v10;

    goto LABEL_10;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v9 = [(HFItemManager *)self home];
    uint64_t v10 = +[HULocationTriggerRegion homeRegionWithHome:eventType:](HULocationTriggerRegion, "homeRegionWithHome:eventType:", v9, [v6 locationEventType]);
    goto LABEL_8;
  }
  uint64_t v11 = 0;
LABEL_10:

  return v11;
}

- (BOOL)canChangeLocation
{
  objc_opt_class();
  id v3 = [(HULocationTriggerEditorSummaryItemManager *)self locationItem];
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
    uint64_t v10 = [(HULocationTriggerEditorSummaryItemManager *)self triggerBuilder];
    uint64_t v11 = [v10 locationInterface];
    id v6 = [v11 locationEventBuilder];
    if (objc_opt_isKindOfClass()) {
      id v12 = v6;
    }
    else {
      id v12 = 0;
    }
    id v13 = v12;

    if (!v13)
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4F69258]);
      v14 = [(HULocationTriggerEditorSummaryItemManager *)self triggerBuilder];
      v15 = [v14 locationInterface];
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
    id v6 = [(HULocationTriggerEditorSummaryItemManager *)self userPickerModule];
    id v7 = [v6 presenceEventBuilder];
    id v8 = [(HULocationTriggerEditorSummaryItemManager *)self triggerBuilder];
    v9 = [v8 locationInterface];
    [v9 setLocationEventBuilder:v7];
  }
LABEL_11:
  v16 = [(HULocationTriggerEditorSummaryItemManager *)self _userPickerOptions];
  v17 = [(HULocationTriggerEditorSummaryItemManager *)self userPickerModule];
  [v17 setOptions:v16];

  v18 = [(HFItemManager *)self allItems];
  id v19 = [(HFItemManager *)self updateResultsForItems:v18 senderSelector:a2];
}

- (id)_userPickerOptions
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __63__HULocationTriggerEditorSummaryItemManager__userPickerOptions__block_invoke;
  v6[3] = &unk_1E638E728;
  v6[4] = self;
  id v3 = __63__HULocationTriggerEditorSummaryItemManager__userPickerOptions__block_invoke((uint64_t)v6);
  id v4 = [[HUPresenceUserPickerItemModuleOptions alloc] initWithLocationDevice:v3 customLocationSelected:[(HULocationTriggerEditorSummaryItemManager *)self _hasCustomLocation]];

  return v4;
}

id __63__HULocationTriggerEditorSummaryItemManager__userPickerOptions__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) triggerBuilder];
  id v3 = [v2 locationInterface];
  id v4 = [v3 locationEventBuilder];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v6 = +[HUPresenceCurrentUserLocationDevice FMFDevice];
  }
  else
  {
    id v7 = [*(id *)(a1 + 32) triggerBuilder];
    id v8 = [v7 trigger];
    v9 = [v8 creatorDevice];

    if (v9) {
      +[HUPresenceCurrentUserLocationDevice customDeviceWithHMDevice:v9];
    }
    else {
    id v6 = +[HUPresenceCurrentUserLocationDevice currentDevice];
    }
  }

  return v6;
}

- (id)_buildItemProvidersForHome:(id)a3
{
  id v4 = objc_msgSend(MEMORY[0x1E4F1CA80], "set", a3);
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F695C0]) initWithResultsBlock:&__block_literal_global_218];
  [(HULocationTriggerEditorSummaryItemManager *)self setUsersInstructionsItem:v5];

  id v6 = [(HULocationTriggerEditorSummaryItemManager *)self usersInstructionsItem];
  [v4 addObject:v6];

  id v7 = [HULocationTriggerSelectedLocationItem alloc];
  id v8 = [(HULocationTriggerEditorSummaryItemManager *)self triggerBuilder];
  v9 = [(HULocationTriggerSelectedLocationItem *)v7 initWithTriggerBuilder:v8];
  [(HULocationTriggerEditorSummaryItemManager *)self setLocationItem:v9];

  uint64_t v10 = [(HULocationTriggerEditorSummaryItemManager *)self locationItem];
  [v4 addObject:v10];

  uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F695C8]) initWithItems:v4];
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObject:v11];

  return v12;
}

id __72__HULocationTriggerEditorSummaryItemManager__buildItemProvidersForHome___block_invoke()
{
  v0 = objc_opt_new();
  [v0 setObject:&unk_1F19B4BF8 forKeyedSubscript:@"instructionsStyle"];
  v1 = _HULocalizedStringWithDefaultValue(@"HULocationTriggerEditorUserListSectionTitle", @"HULocationTriggerEditorUserListSectionTitle", 1);
  [v0 setObject:v1 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];

  v2 = [MEMORY[0x1E4F7A0D8] futureWithResult:v0];

  return v2;
}

- (id)_buildItemModulesForHome:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1C978];
  uint64_t v5 = [(HULocationTriggerEditorSummaryItemManager *)self conditionEditorModule];
  id v6 = [(HULocationTriggerEditorSummaryItemManager *)self userPickerModule];
  id v7 = objc_msgSend(v4, "arrayWithObjects:", v5, v6, 0);

  return v7;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  id v6 = objc_alloc(MEMORY[0x1E4F692E8]);
  id v7 = +[HULocationTriggerEditorSummaryItemManager usersHeaderSectionID];
  id v8 = (void *)[v6 initWithIdentifier:v7];

  v9 = [(HULocationTriggerEditorSummaryItemManager *)self usersInstructionsItem];
  v22[0] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
  [v8 setItems:v10 filteringToDisplayedItems:v4];

  [v5 addObject:v8];
  uint64_t v11 = [(HULocationTriggerEditorSummaryItemManager *)self userPickerModule];
  id v12 = [v11 buildSectionsWithDisplayedItems:v4];
  [v5 addObjectsFromArray:v12];

  id v13 = objc_alloc(MEMORY[0x1E4F692E8]);
  v14 = +[HULocationTriggerEditorSummaryItemManager locationSectionID];
  v15 = (void *)[v13 initWithIdentifier:v14];

  v16 = [(HULocationTriggerEditorSummaryItemManager *)self locationItem];
  v21 = v16;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
  [v15 setItems:v17 filteringToDisplayedItems:v4];

  [v5 addObject:v15];
  v18 = [(HULocationTriggerEditorSummaryItemManager *)self conditionEditorModule];
  id v19 = [v18 buildSectionsWithDisplayedItems:v4];

  [v5 addObjectsFromArray:v19];

  return v5;
}

- (BOOL)_canEditLocation
{
  id v3 = [(HULocationTriggerEditorSummaryItemManager *)self triggerBuilder];
  id v4 = [v3 locationInterface];
  uint64_t v5 = [v4 locationEventBuilder];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    return 1;
  }
  id v8 = [(HULocationTriggerEditorSummaryItemManager *)self userPickerModule];
  v9 = [v8 presenceEventBuilder];
  uint64_t v10 = [v9 users];
  uint64_t v11 = [(HFItemManager *)self home];
  id v12 = [v10 resolveSelectedUsersWithHome:v11];

  id v13 = (void *)MEMORY[0x1E4F1CAD0];
  v14 = [(HFItemManager *)self home];
  v15 = [v14 currentUser];
  v16 = [v13 setWithObject:v15];
  LOBYTE(v10) = [v12 isEqualToSet:v16];

  return (char)v10;
}

- (BOOL)_hasCustomLocation
{
  id v3 = [(HULocationTriggerEditorSummaryItemManager *)self triggerBuilder];
  id v4 = [v3 locationInterface];
  uint64_t v5 = [v4 locationEventBuilder];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    return 0;
  }
  objc_opt_class();
  id v8 = [(HULocationTriggerEditorSummaryItemManager *)self triggerBuilder];
  v9 = [v8 locationInterface];
  uint64_t v10 = [v9 locationEventBuilder];
  if (objc_opt_isKindOfClass()) {
    uint64_t v11 = v10;
  }
  else {
    uint64_t v11 = 0;
  }
  id v12 = v11;

  id v13 = [(HULocationTriggerEditorSummaryItemManager *)self triggerBuilder];
  v14 = [v13 home];
  char v15 = [v12 isRegionAtHome:v14];

  char v7 = v15 ^ 1;
  return v7;
}

- (void)userPickerModule:(id)a3 didUpdatePresenceEvent:(id)a4
{
  id v14 = a4;
  if (![(HULocationTriggerEditorSummaryItemManager *)self _hasCustomLocation]
    || ([v14 users],
        id v6 = objc_claimAutoreleasedReturnValue(),
        uint64_t v7 = [v6 type],
        v6,
        v7 != 1))
  {
    id v8 = [(HULocationTriggerEditorSummaryItemManager *)self triggerBuilder];
    v9 = [v8 locationInterface];
    [v9 setLocationEventBuilder:v14];

    uint64_t v10 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v11 = [(HULocationTriggerEditorSummaryItemManager *)self locationItem];
    id v12 = [v10 setWithObject:v11];
    id v13 = [(HFItemManager *)self updateResultsForItems:v12 senderSelector:a2];
  }
}

- (HFEventTriggerBuilder)triggerBuilder
{
  return self->_triggerBuilder;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_usersInstructionsItem, 0);
  objc_storeStrong((id *)&self->_locationItem, 0);
  objc_storeStrong((id *)&self->_conditionEditorModule, 0);
  objc_storeStrong((id *)&self->_userPickerModule, 0);

  objc_storeStrong((id *)&self->_triggerBuilder, 0);
}

@end