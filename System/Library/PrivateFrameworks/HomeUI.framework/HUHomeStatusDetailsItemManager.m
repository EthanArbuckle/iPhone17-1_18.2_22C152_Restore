@interface HUHomeStatusDetailsItemManager
- (BOOL)_shouldHideHomeKitObject:(id)a3;
- (BOOL)_shouldUseSoftwareUpdateSectionForItem:(id)a3;
- (BOOL)hasSymptomsHandlerForMediaProfileContainer:(id)a3;
- (BOOL)isDisplayingRoomLevelStatus;
- (BOOL)isFirmwareUpdateStatusItem;
- (BOOL)isLowBatteryStatusItem;
- (BOOL)isNoResponseStatusItem;
- (BOOL)isResidentDeviceStatusItem;
- (BOOL)shouldHideItem:(id)a3;
- (BOOL)shouldReloadItemProvidersOnSourceItemChange;
- (BOOL)shouldShowAccessoryTiles;
- (BOOL)shouldShowRoomNameForItem:(id)a3;
- (BOOL)shouldShowServiceGroupTiles;
- (BOOL)shouldUseTitleDescriptionStyleForItem:(id)a3;
- (HFNoRemoteAccessStatusDetailsItem)noRemoteAccessItem;
- (HFResidentDeviceStatusDetailsItemProvider)residentDeviceStatusItemProvider;
- (HUFirmwareUpdateItemProvider)firmwareUpdateItemProvider;
- (HUSoftwareUpdateInfoItemProvider)softwareUpdateItemProvider;
- (NSArray)cachedSectionIdentifiers;
- (NSMutableDictionary)cachedRoomNamesByIdentifier;
- (NSMutableSet)minimumPriorityItemTuples;
- (NSMutableSet)representedHomeKitObjects;
- (id)_buildItemProvidersForHome:(id)a3;
- (id)_comparatorForSectionIdentifier:(id)a3;
- (id)_identifierForSection:(unint64_t)a3;
- (id)_itemsToHideInSet:(id)a3;
- (id)_minimumPriorityNumberForItem:(id)a3;
- (id)_roomForItem:(id)a3;
- (id)_sectionComparator;
- (id)_sectionIdentifierForItem:(id)a3;
- (id)_separateSectionIdentifierForItem:(id)a3;
- (id)_titleForSectionWithIdentifier:(id)a3;
- (id)matchingItemForHomeKitObject:(id)a3;
- (id)statusItem;
- (int64_t)_effectivePriorityForItem:(id)a3;
- (unint64_t)_numberOfSections;
- (void)_didFinishUpdateTransactionWithAffectedItems:(id)a3;
- (void)_willUpdateSections;
- (void)maintainMinimumPriorityForItem:(id)a3;
- (void)resetItemPrioritiesToDefaults;
- (void)setCachedRoomNamesByIdentifier:(id)a3;
- (void)setCachedSectionIdentifiers:(id)a3;
- (void)setFirmwareUpdateItemProvider:(id)a3;
- (void)setMinimumPriorityItemTuples:(id)a3;
- (void)setNoRemoteAccessItem:(id)a3;
- (void)setRepresentedHomeKitObjects:(id)a3;
- (void)setResidentDeviceStatusItemProvider:(id)a3;
- (void)setSoftwareUpdateItemProvider:(id)a3;
@end

@implementation HUHomeStatusDetailsItemManager

- (NSMutableSet)representedHomeKitObjects
{
  representedHomeKitObjects = self->_representedHomeKitObjects;
  if (!representedHomeKitObjects)
  {
    v4 = [(HFItemManager *)self sourceItem];
    v5 = [v4 latestResults];
    v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F68BD0]];
    v7 = (void *)[v6 mutableCopy];
    v8 = v7;
    if (v7)
    {
      v9 = v7;
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA80] set];
    }
    v10 = self->_representedHomeKitObjects;
    self->_representedHomeKitObjects = v9;

    representedHomeKitObjects = self->_representedHomeKitObjects;
  }

  return representedHomeKitObjects;
}

- (BOOL)shouldUseTitleDescriptionStyleForItem:(id)a3
{
  id v4 = a3;
  v5 = [(HUHomeStatusDetailsItemManager *)self residentDeviceStatusItemProvider];
  v6 = [v5 items];
  if ([v6 containsObject:v4] & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    BOOL v7 = 1;
  }
  else
  {
    id v8 = [(HUHomeStatusDetailsItemManager *)self noRemoteAccessItem];
    BOOL v7 = v8 == v4;
  }
  return v7;
}

- (BOOL)shouldShowRoomNameForItem:(id)a3
{
  id v4 = [(HUHomeStatusDetailsItemManager *)self _sectionIdentifierForItem:a3];
  v5 = [(HUHomeStatusDetailsItemManager *)self cachedRoomNamesByIdentifier];
  v6 = [v5 allKeys];
  char v7 = [v6 containsObject:v4] ^ 1;

  return v7;
}

- (void)maintainMinimumPriorityForItem:(id)a3
{
  id v4 = a3;
  v5 = [(HUHomeStatusDetailsItemManager *)self minimumPriorityItemTuples];

  if (!v5)
  {
    v6 = [MEMORY[0x1E4F1CA80] set];
    [(HUHomeStatusDetailsItemManager *)self setMinimumPriorityItemTuples:v6];
  }
  char v7 = [v4 latestResults];
  id v8 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F68A28]];

  if (v8)
  {
    uint64_t v9 = [v8 integerValue];
    if (v9 >= [(HUHomeStatusDetailsItemManager *)self _effectivePriorityForItem:v4])
    {
      v10 = [(HUHomeStatusDetailsItemManager *)self minimumPriorityItemTuples];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __65__HUHomeStatusDetailsItemManager_maintainMinimumPriorityForItem___block_invoke;
      v14[3] = &unk_1E638EC70;
      id v11 = v4;
      id v15 = v11;
      objc_msgSend(v10, "na_firstObjectPassingTest:", v14);
      v12 = (HUHomeStatusDetailsItemAndPriorityTuple *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        -[HUHomeStatusDetailsItemAndPriorityTuple setPriority:](v12, "setPriority:", [v8 integerValue]);
      }
      else
      {
        v12 = -[HUHomeStatusDetailsItemAndPriorityTuple initWithItem:priority:]([HUHomeStatusDetailsItemAndPriorityTuple alloc], "initWithItem:priority:", v11, [v8 integerValue]);
        v13 = [(HUHomeStatusDetailsItemManager *)self minimumPriorityItemTuples];
        [v13 addObject:v12];
      }
    }
  }
}

uint64_t __65__HUHomeStatusDetailsItemManager_maintainMinimumPriorityForItem___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 item];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

- (BOOL)hasSymptomsHandlerForMediaProfileContainer:(id)a3
{
  id v3 = a3;
  char v4 = [MEMORY[0x1E4F692A8] isAnyKindOfGroup:v3];
  int v5 = [MEMORY[0x1E4F692A8] isContainedWithinAGroup:v3];
  if ((v4 & 1) != 0 || !v5)
  {
    char v7 = [v3 accessories];
    char v6 = objc_msgSend(v7, "na_any:", &__block_literal_global_203);
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

BOOL __77__HUHomeStatusDetailsItemManager_hasSymptomsHandlerForMediaProfileContainer___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 symptomsHandler];
  id v3 = [v2 symptoms];
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (void)resetItemPrioritiesToDefaults
{
  id v2 = [(HUHomeStatusDetailsItemManager *)self minimumPriorityItemTuples];
  [v2 removeAllObjects];
}

- (id)_buildItemProvidersForHome:(id)a3
{
  v37[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4F68E28]);
  char v6 = [(HUHomeStatusDetailsItemManager *)self statusItem];
  uint64_t v7 = [v6 room];
  id v8 = (void *)v7;
  if (v7) {
    id v9 = (id)v7;
  }
  else {
    id v9 = v4;
  }
  v10 = (void *)[v5 initWithAccessoryContainer:v9 inHome:v4];

  if ([(HUHomeStatusDetailsItemManager *)self shouldShowAccessoryTiles]) {
    uint64_t v11 = 0;
  }
  else {
    uint64_t v11 = 4;
  }
  [v10 setObjectLevel:v11];
  v12 = (void *)[objc_alloc(MEMORY[0x1E4F69468]) initWithHome:v4];
  [(HUHomeStatusDetailsItemManager *)self setResidentDeviceStatusItemProvider:v12];

  v13 = (void *)[objc_alloc(MEMORY[0x1E4F69358]) initWithHome:v4];
  [(HUHomeStatusDetailsItemManager *)self setNoRemoteAccessItem:v13];

  id v14 = objc_alloc(MEMORY[0x1E4F695C8]);
  id v15 = (void *)MEMORY[0x1E4F1CAD0];
  v16 = [(HUHomeStatusDetailsItemManager *)self noRemoteAccessItem];
  v17 = [v15 setWithObject:v16];
  v18 = (void *)[v14 initWithItems:v17];

  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __61__HUHomeStatusDetailsItemManager__buildItemProvidersForHome___block_invoke;
  aBlock[3] = &unk_1E63862F8;
  objc_copyWeak(&v35, &location);
  v19 = _Block_copy(aBlock);
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __61__HUHomeStatusDetailsItemManager__buildItemProvidersForHome___block_invoke_2;
  v32[3] = &unk_1E63862F8;
  objc_copyWeak(&v33, &location);
  v20 = _Block_copy(v32);
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __61__HUHomeStatusDetailsItemManager__buildItemProvidersForHome___block_invoke_4;
  v30[3] = &unk_1E638EC98;
  id v21 = v20;
  id v31 = v21;
  [v10 setFilterBlock:v30];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __61__HUHomeStatusDetailsItemManager__buildItemProvidersForHome___block_invoke_5;
  v27[3] = &unk_1E638ECC0;
  objc_copyWeak(&v29, &location);
  id v22 = v19;
  id v28 = v22;
  v23 = [(HUHomeStatusDetailsItemManager *)self residentDeviceStatusItemProvider];
  [v23 setFilter:v27];

  v37[0] = v10;
  v24 = [(HUHomeStatusDetailsItemManager *)self residentDeviceStatusItemProvider];
  v37[1] = v24;
  v37[2] = v18;
  v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:3];

  objc_destroyWeak(&v29);
  objc_destroyWeak(&v33);

  objc_destroyWeak(&v35);
  objc_destroyWeak(&location);

  return v25;
}

uint64_t __61__HUHomeStatusDetailsItemManager__buildItemProvidersForHome___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 conformsToProtocol:&unk_1F1A6A1B0]) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v7 = [WeakRetained statusItem];
  id v8 = [v7 room];

  uint64_t v9 = 1;
  if (v8 && v5)
  {
    v10 = objc_msgSend(v5, "hf_parentRoom");
    uint64_t v9 = [v8 isEqual:v10];
  }
  return v9;
}

uint64_t __61__HUHomeStatusDetailsItemManager__buildItemProvidersForHome___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (![WeakRetained shouldReloadItemProvidersOnSourceItemChange])
  {
    char v6 = [WeakRetained statusItem];
    uint64_t v7 = [v6 latestResults];
    id v8 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F68910]];

    if (v8)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v9 = [MEMORY[0x1E4F1CAD0] setWithObject:v3];
LABEL_6:
        id v10 = (id)v9;
LABEL_13:
        v33[0] = MEMORY[0x1E4F143A8];
        v33[1] = 3221225472;
        v33[2] = __61__HUHomeStatusDetailsItemManager__buildItemProvidersForHome___block_invoke_3;
        v33[3] = &unk_1E6387048;
        id v34 = v8;
        uint64_t v5 = objc_msgSend(v10, "na_any:", v33);

        goto LABEL_43;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v14 = (void *)MEMORY[0x1E4F1CAD0];
        id v15 = [v3 services];
        uint64_t v16 = [v14 setWithArray:v15];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v9 = objc_msgSend(v3, "hf_visibleServices");
          goto LABEL_6;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          id v10 = 0;
          goto LABEL_13;
        }
        id v15 = [v3 accessory];
        uint64_t v16 = objc_msgSend(v15, "hf_visibleServices");
      }
      id v10 = (id)v16;

      goto LABEL_13;
    }
    uint64_t v11 = [WeakRetained sourceItem];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      v17 = [WeakRetained sourceItem];
      objc_opt_class();
      char v18 = objc_opt_isKindOfClass();

      if ((v18 & 1) == 0)
      {
        uint64_t v5 = 1;
LABEL_44:

        goto LABEL_45;
      }
      id v19 = v3;
      if ([v19 conformsToProtocol:&unk_1F1ABB468]) {
        v20 = v19;
      }
      else {
        v20 = 0;
      }
      id v10 = v20;

      id v21 = v19;
      if ([v21 conformsToProtocol:&unk_1F1AD86A8]) {
        id v22 = v21;
      }
      else {
        id v22 = 0;
      }
      id v23 = v22;

      objc_opt_class();
      id v24 = v21;
      if (objc_opt_isKindOfClass()) {
        v25 = v24;
      }
      else {
        v25 = 0;
      }
      id v26 = v25;

      v27 = [v26 mediaProfile];

      if (v27)
      {
        id v28 = v24;
        if ([v28 conformsToProtocol:&unk_1F1AD86A8]) {
          id v29 = v28;
        }
        else {
          id v29 = 0;
        }
        id v30 = v29;

        id v23 = v30;
      }
      if (v23)
      {
        uint64_t v5 = [WeakRetained hasSymptomsHandlerForMediaProfileContainer:v23];
      }
      else
      {
        id v31 = [v10 symptomsHandler];
        uint64_t v5 = v31 != 0;
      }
LABEL_43:

      goto LABEL_44;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v13 = v3;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v10 = 0;
        goto LABEL_40;
      }
      id v13 = [v3 accessory];
    }
    id v10 = v13;
LABEL_40:
    uint64_t v5 = objc_msgSend(v10, "hf_isNetworkRouter");
    goto LABEL_43;
  }
  uint64_t v5 = [WeakRetained _shouldHideHomeKitObject:v3] ^ 1;
LABEL_45:

  return v5;
}

uint64_t __61__HUHomeStatusDetailsItemManager__buildItemProvidersForHome___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 serviceType];
  uint64_t v4 = [v2 containsObject:v3];

  return v4;
}

uint64_t __61__HUHomeStatusDetailsItemManager__buildItemProvidersForHome___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = objc_msgSend(a2, "hf_homeKitObject");
  uint64_t v4 = (*(uint64_t (**)(uint64_t, void *))(v2 + 16))(v2, v3);

  return v4;
}

uint64_t __61__HUHomeStatusDetailsItemManager__buildItemProvidersForHome___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (([WeakRetained isResidentDeviceStatusItem] & 1) != 0
    || [WeakRetained isNoResponseStatusItem])
  {
    uint64_t v5 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (unint64_t)_numberOfSections
{
  uint64_t v2 = [(HUHomeStatusDetailsItemManager *)self cachedSectionIdentifiers];
  unint64_t v3 = [v2 count];

  return v3;
}

- (id)_identifierForSection:(unint64_t)a3
{
  uint64_t v4 = [(HUHomeStatusDetailsItemManager *)self cachedSectionIdentifiers];
  if ([v4 count] <= a3) {
    NSLog(&cfstr_ReceivedIdenti.isa, a3, [v4 count]);
  }
  if ([v4 count] <= a3)
  {
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = [v4 objectAtIndexedSubscript:a3];
  }

  return v5;
}

- (id)_titleForSectionWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HUHomeStatusDetailsItemManager *)self cachedRoomNamesByIdentifier];
  if (v5)
  {
    char v6 = (void *)v5;
    uint64_t v7 = [(HUHomeStatusDetailsItemManager *)self cachedRoomNamesByIdentifier];
    id v8 = [v7 objectForKeyedSubscript:v4];

    if (v8)
    {
      uint64_t v9 = [(HUHomeStatusDetailsItemManager *)self cachedRoomNamesByIdentifier];
      id v10 = [v9 objectForKeyedSubscript:v4];

      goto LABEL_13;
    }
  }
  if ([v4 isEqualToString:@"UrgentServices"])
  {
    uint64_t v11 = @"HUStatusDetailsUrgentSectionTitle";
LABEL_12:
    id v10 = _HULocalizedStringWithDefaultValue(v11, v11, 1);
    goto LABEL_13;
  }
  if ([v4 isEqualToString:@"GeneralServices"])
  {
    uint64_t v11 = @"HUStatusDetailsGeneralSectionTitle";
    goto LABEL_12;
  }
  if ([v4 isEqualToString:@"LowBattery"])
  {
    uint64_t v11 = @"HUStatusDetailsLowBatterySectionTitle";
    goto LABEL_12;
  }
  if ([v4 isEqualToString:@"SoftwareUpdateInfo"])
  {
    uint64_t v11 = @"HUStatusDetailsSoftwareUpdateSectionTitle";
    goto LABEL_12;
  }
  id v10 = 0;
LABEL_13:

  return v10;
}

- (BOOL)_shouldUseSoftwareUpdateSectionForItem:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HUHomeStatusDetailsItemManager *)self softwareUpdateItemProvider];
  char v6 = [v5 items];
  char v7 = [v6 containsObject:v4];

  return v7;
}

- (id)_separateSectionIdentifierForItem:(id)a3
{
  id v4 = a3;
  if (![(HUHomeStatusDetailsItemManager *)self _shouldUseSeparateSectionForItem:v4])goto LABEL_11; {
  uint64_t v5 = [(HUHomeStatusDetailsItemManager *)self noRemoteAccessItem];
  }
  if ((id)v5 == v4)
  {

    goto LABEL_8;
  }
  char v6 = (void *)v5;
  char v7 = [(HUHomeStatusDetailsItemManager *)self residentDeviceStatusItemProvider];
  id v8 = [v7 items];
  char v9 = [v8 containsObject:v4];

  if (v9)
  {
LABEL_8:
    id v14 = @"ResidentDevice";
    goto LABEL_12;
  }
  id v10 = [(HUHomeStatusDetailsItemManager *)self firmwareUpdateItemProvider];
  id v11 = [v10 instructionsItem];

  if (v11 == v4)
  {
    id v14 = @"FirmwareUpdateInstructions";
    goto LABEL_12;
  }
  if ([v4 conformsToProtocol:&unk_1F19E4798])
  {
    v12 = [v4 homeKitObject];
    id v13 = [v12 uniqueIdentifier];
    id v14 = [v13 UUIDString];

    goto LABEL_12;
  }
  NSLog(&cfstr_UnexpectedItem_2.isa, v4);
LABEL_11:
  id v14 = 0;
LABEL_12:

  return v14;
}

- (id)_roomForItem:(id)a3
{
  id v4 = a3;
  if ([v4 conformsToProtocol:&unk_1F19E4798]) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = v5;
  char v7 = v6;
  if (!v6) {
    goto LABEL_13;
  }
  id v8 = [v6 homeKitObject];
  if ([v8 conformsToProtocol:&unk_1F1A6A1B0]) {
    char v9 = v8;
  }
  else {
    char v9 = 0;
  }
  id v10 = v9;

  if (!v10)
  {
    v12 = [v7 homeKitObject];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id v14 = [v7 homeKitObject];
      if ([(HUHomeStatusDetailsItemManager *)self isDisplayingRoomLevelStatus])
      {
        id v15 = [(HUHomeStatusDetailsItemManager *)self statusItem];
        id v11 = [v15 room];
      }
      else
      {
        id v15 = [v14 services];
        uint64_t v16 = [v15 firstObject];
        id v11 = objc_msgSend(v16, "hf_parentRoom");
      }
      goto LABEL_16;
    }
LABEL_13:
    id v11 = 0;
    goto LABEL_17;
  }
  id v11 = objc_msgSend(v10, "hf_parentRoom");
LABEL_16:

LABEL_17:

  return v11;
}

- (id)_sectionIdentifierForItem:(id)a3
{
  id v4 = a3;
  if ([(HUHomeStatusDetailsItemManager *)self _shouldUseSeparateSectionForItem:v4])
  {
    uint64_t v5 = [(HUHomeStatusDetailsItemManager *)self _separateSectionIdentifierForItem:v4];
  }
  else
  {
    id v6 = [(HUHomeStatusDetailsItemManager *)self firmwareUpdateItemProvider];
    char v7 = [v6 items];
    char v8 = [v7 containsObject:v4];

    if (v8)
    {
      uint64_t v5 = @"FirmwareUpdateAppPunchOut";
    }
    else if ([(HUHomeStatusDetailsItemManager *)self _shouldUseSoftwareUpdateSectionForItem:v4])
    {
      uint64_t v5 = @"SoftwareUpdateInfo";
    }
    else
    {
      char v9 = [(HUHomeStatusDetailsItemManager *)self _roomForItem:v4];
      id v10 = [v9 uniqueIdentifier];
      uint64_t v11 = [v10 UUIDString];
      v12 = (void *)v11;
      id v13 = @"GeneralServices";
      if (v11) {
        id v13 = (__CFString *)v11;
      }
      uint64_t v5 = v13;
    }
  }

  return v5;
}

- (id)_itemsToHideInSet:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)HUHomeStatusDetailsItemManager;
  id v4 = a3;
  uint64_t v5 = [(HFItemManager *)&v10 _itemsToHideInSet:v4];
  id v6 = (void *)[v5 mutableCopy];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __52__HUHomeStatusDetailsItemManager__itemsToHideInSet___block_invoke;
  v9[3] = &unk_1E6386108;
  v9[4] = self;
  char v7 = objc_msgSend(v4, "na_filter:", v9);

  [v6 unionSet:v7];

  return v6;
}

uint64_t __52__HUHomeStatusDetailsItemManager__itemsToHideInSet___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) shouldHideItem:a2];
}

- (void)_didFinishUpdateTransactionWithAffectedItems:(id)a3
{
  v23.receiver = self;
  v23.super_class = (Class)HUHomeStatusDetailsItemManager;
  id v5 = a3;
  [(HFItemManager *)&v23 _didFinishUpdateTransactionWithAffectedItems:v5];
  id v6 = [(HFItemManager *)self sourceItem];
  int v7 = [v5 containsObject:v6];

  if (v7)
  {
    char v8 = [(HFItemManager *)self sourceItem];
    char v9 = [v8 latestResults];
    objc_super v10 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F68BD0]];
    uint64_t v11 = v10;
    if (v10)
    {
      id v12 = v10;
    }
    else
    {
      id v12 = [MEMORY[0x1E4F1CAD0] set];
    }
    id v13 = v12;

    id v14 = [(HUHomeStatusDetailsItemManager *)self representedHomeKitObjects];
    char v15 = [v14 isEqual:v13];

    if ((v15 & 1) == 0)
    {
      if ([(HUHomeStatusDetailsItemManager *)self shouldReloadItemProvidersOnSourceItemChange])
      {
        [(HUHomeStatusDetailsItemManager *)self setRepresentedHomeKitObjects:0];
        uint64_t v16 = [(HFItemManager *)self itemProviders];
        id v17 = [(HFItemManager *)self reloadAndUpdateItemsForProviders:v16 senderSelector:a2];
      }
      else
      {
        char v18 = [(HFItemManager *)self sourceItem];
        id v19 = [v18 latestResults];
        v20 = [v19 objectForKeyedSubscript:*MEMORY[0x1E4F68B10]];
        char v21 = [v20 BOOLValue];

        if ((v21 & 1) == 0)
        {
          id v22 = [(HUHomeStatusDetailsItemManager *)self representedHomeKitObjects];
          [v22 unionSet:v13];

          [(HFItemManager *)self recalculateVisibilityAndSortAllItems];
        }
      }
    }
  }
}

- (void)_willUpdateSections
{
  v23[1] = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [MEMORY[0x1E4F1CA80] set];
  id v4 = objc_opt_new();
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __53__HUHomeStatusDetailsItemManager__willUpdateSections__block_invoke;
  aBlock[3] = &unk_1E638ECE8;
  void aBlock[4] = self;
  id v21 = v3;
  id v22 = v4;
  id v5 = v4;
  id v6 = v3;
  int v7 = _Block_copy(aBlock);
  char v8 = [(HFItemManager *)self itemProviders];
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  id v17 = __53__HUHomeStatusDetailsItemManager__willUpdateSections__block_invoke_2;
  char v18 = &unk_1E638ED10;
  id v19 = v7;
  id v9 = v7;
  objc_msgSend(v8, "na_each:", &v15);

  id v10 = objc_alloc(MEMORY[0x1E4F29008]);
  uint64_t v11 = [(HUHomeStatusDetailsItemManager *)self _sectionComparator];
  id v12 = (void *)[v10 initWithKey:0 ascending:1 comparator:v11];

  v23[0] = v12;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
  id v14 = [v6 sortedArrayUsingDescriptors:v13];

  [(HUHomeStatusDetailsItemManager *)self setCachedRoomNamesByIdentifier:v5];
  [(HUHomeStatusDetailsItemManager *)self setCachedSectionIdentifiers:v14];
}

void __53__HUHomeStatusDetailsItemManager__willUpdateSections__block_invoke(id *a1, void *a2)
{
  id v12 = a2;
  char v3 = [a1[4] shouldHideItem:v12];
  id v4 = v12;
  if ((v3 & 1) == 0)
  {
    id v5 = [a1[4] _sectionIdentifierForItem:v12];
    [a1[5] addObject:v5];
    if (([a1[4] _shouldUseSeparateSectionForItem:v12] & 1) == 0)
    {
      id v6 = [a1[4] _roomForItem:v12];
      int v7 = v6;
      if (v6)
      {
        char v8 = [v6 uniqueIdentifier];
        id v9 = [v8 UUIDString];
        int v10 = [v5 isEqualToString:v9];

        if (v10)
        {
          uint64_t v11 = [v7 name];
          [a1[6] setObject:v11 forKeyedSubscript:v5];
        }
      }
    }
    id v4 = v12;
  }
}

void __53__HUHomeStatusDetailsItemManager__willUpdateSections__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 items];
  objc_msgSend(v3, "na_each:", *(void *)(a1 + 32));
}

- (id)_sectionComparator
{
  if (_MergedGlobals_4_5 != -1) {
    dispatch_once(&_MergedGlobals_4_5, &__block_literal_global_340);
  }
  id v3 = (id)qword_1EA12E140;
  id v4 = [(HFItemManager *)self home];
  id v5 = objc_msgSend(v4, "hf_orderedRooms");
  id v6 = objc_msgSend(v5, "na_map:", &__block_literal_global_343);

  int v7 = [v3 arrayByAddingObjectsFromArray:v6];
  char v8 = [MEMORY[0x1E4F69758] comparatorWithSortedObjects:v7];

  return v8;
}

void __52__HUHomeStatusDetailsItemManager__sectionComparator__block_invoke_2()
{
  v2[7] = *MEMORY[0x1E4F143B8];
  v2[0] = @"UrgentServices";
  v2[1] = @"ResidentDevice";
  v2[2] = @"FirmwareUpdateInstructions";
  v2[3] = @"FirmwareUpdateAppPunchOut";
  v2[4] = @"SoftwareUpdateInfo";
  v2[5] = @"LowBattery";
  v2[6] = @"GeneralServices";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:7];
  v1 = (void *)qword_1EA12E140;
  qword_1EA12E140 = v0;
}

id __52__HUHomeStatusDetailsItemManager__sectionComparator__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 uniqueIdentifier];
  id v3 = [v2 UUIDString];

  return v3;
}

- (id)_comparatorForSectionIdentifier:(id)a3
{
  v19[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v19[0] = @"UrgentServices";
  v19[1] = @"GeneralServices";
  v19[2] = @"LowBattery";
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:3];
  char v6 = [v5 containsObject:v4];

  if (v6)
  {
    int v7 = &__block_literal_global_347_0;
    goto LABEL_9;
  }
  v18[0] = @"FirmwareUpdateInstructions";
  v18[1] = @"FirmwareUpdateAppPunchOut";
  char v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
  int v9 = [v8 containsObject:v4];

  if (v9)
  {
    uint64_t v10 = +[HUFirmwareUpdateItemProvider itemComparator];
  }
  else
  {
    if ([v4 isEqualToString:@"SoftwareUpdateInfo"])
    {
      uint64_t v11 = (void *)MEMORY[0x1E4F69758];
      uint64_t v17 = objc_opt_class();
      id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
      v16.receiver = self;
      v16.super_class = (Class)HUHomeStatusDetailsItemManager;
      id v13 = [(HFItemManager *)&v16 _comparatorForSectionIdentifier:v4];
      int v7 = [v11 comparatorWithSortedClasses:v12 secondaryComparator:v13];

      goto LABEL_9;
    }
    v15.receiver = self;
    v15.super_class = (Class)HUHomeStatusDetailsItemManager;
    uint64_t v10 = [(HFItemManager *)&v15 _comparatorForSectionIdentifier:v4];
  }
  int v7 = (void *)v10;
LABEL_9:

  return v7;
}

uint64_t __66__HUHomeStatusDetailsItemManager__comparatorForSectionIdentifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 latestResults];
  uint64_t v6 = *MEMORY[0x1E4F68C10];
  int v7 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F68C10]];
  char v8 = [v4 latestResults];

  int v9 = [v8 objectForKeyedSubscript:v6];
  uint64_t v10 = [v7 localizedStandardCompare:v9];

  return v10;
}

- (id)matchingItemForHomeKitObject:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = v4;
  if (objc_opt_isKindOfClass()) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    if (objc_msgSend(v7, "hf_isCamera")
      && ([v7 cameraProfiles],
          char v8 = objc_claimAutoreleasedReturnValue(),
          uint64_t v9 = [v8 count],
          v8,
          v9))
    {
      uint64_t v10 = [v7 cameraProfiles];
      id v11 = [v10 firstObject];
    }
    else
    {
      if (!objc_msgSend(v7, "hf_isHomePod")) {
        goto LABEL_14;
      }
      uint64_t v10 = [v7 home];
      uint64_t v12 = objc_msgSend(v10, "hf_mediaSystemForAccessory:", v7);
      id v13 = (void *)v12;
      if (v12) {
        id v14 = (void *)v12;
      }
      else {
        id v14 = v5;
      }
      id v11 = v14;

      id v5 = v13;
    }

    id v5 = v11;
  }
LABEL_14:
  objc_super v15 = [(HFItemManager *)self allDisplayedItems];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __63__HUHomeStatusDetailsItemManager_matchingItemForHomeKitObject___block_invoke;
  v19[3] = &unk_1E6386108;
  id v20 = v5;
  id v16 = v5;
  uint64_t v17 = objc_msgSend(v15, "na_firstObjectPassingTest:", v19);

  return v17;
}

uint64_t __63__HUHomeStatusDetailsItemManager_matchingItemForHomeKitObject___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 conformsToProtocol:&unk_1F19E4798]) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;
  uint64_t v6 = v5;
  if (v5)
  {
    id v7 = [v5 homeKitObject];
    uint64_t v8 = [v7 isEqual:*(void *)(a1 + 32)];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (BOOL)shouldHideItem:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v10 = [(HUHomeStatusDetailsItemManager *)self representedHomeKitObjects];
      int v11 = objc_msgSend(v10, "na_any:", &__block_literal_global_354);

      if (!v11 || ![(HUHomeStatusDetailsItemManager *)self isFirmwareUpdateStatusItem]) {
        goto LABEL_7;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v12 = v4;
        if ([v12 conformsToProtocol:&unk_1F19E4798]) {
          id v13 = v12;
        }
        else {
          id v13 = 0;
        }
        id v5 = v13;

        if (v5)
        {
          id v14 = [v5 homeKitObject];
          BOOL v15 = [(HUHomeStatusDetailsItemManager *)self _shouldHideHomeKitObject:v14];

          if (v15)
          {
            char v9 = 1;
LABEL_19:

            goto LABEL_20;
          }
        }
        uint64_t v6 = [v12 latestResults];
        id v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F68B10]];
        char v9 = [v7 BOOLValue];
        goto LABEL_17;
      }
    }
    id v5 = [v4 latestResults];
    uint64_t v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F68B10]];
    char v9 = [v6 BOOLValue];
LABEL_18:

    id v12 = v5;
    goto LABEL_19;
  }
  if ([(HUHomeStatusDetailsItemManager *)self isFirmwareUpdateStatusItem])
  {
    id v5 = [(HUHomeStatusDetailsItemManager *)self firmwareUpdateItemProvider];
    uint64_t v6 = [v5 instructionsItem];
    id v7 = [v6 latestResults];
    uint64_t v8 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F68B10]];
    char v9 = [v8 BOOLValue];

LABEL_17:
    goto LABEL_18;
  }
LABEL_7:
  char v9 = 1;
LABEL_20:

  return v9;
}

uint64_t __49__HUHomeStatusDetailsItemManager_shouldHideItem___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = [v2 category];
    id v4 = [v3 categoryType];
    uint64_t v5 = [v4 isEqualToString:*MEMORY[0x1E4F2C1D0]];

LABEL_5:
    goto LABEL_6;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = [v2 accessory];
    uint64_t v5 = objc_msgSend(v3, "hf_isHomePod");
    goto LABEL_5;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v5 = objc_msgSend(v2, "hf_isHomePod");
  }
  else {
    uint64_t v5 = 0;
  }
LABEL_6:

  return v5;
}

- (BOOL)_shouldHideHomeKitObject:(id)a3
{
  id v4 = a3;
  uint64_t v6 = [(HUHomeStatusDetailsItemManager *)self representedHomeKitObjects];
  uint64_t v5 = [v6 count];

  LOBYTE(v6) = 1;
  if (v4 && v5)
  {
    if ([(HUHomeStatusDetailsItemManager *)self isDisplayingRoomLevelStatus])
    {
      id v7 = v4;
      uint64_t v8 = &unk_1F1A6A1B0;
      if ([v7 conformsToProtocol:v8]) {
        char v9 = v7;
      }
      else {
        char v9 = 0;
      }
      id v10 = v9;

      if (!v10) {
        goto LABEL_19;
      }
      int v11 = [(HUHomeStatusDetailsItemManager *)self statusItem];
      id v12 = [v11 room];
      id v13 = objc_msgSend(v10, "hf_parentRoom");
      char v14 = [v12 isEqual:v13];

      if (v14) {
        goto LABEL_19;
      }
    }
    else
    {
      BOOL v15 = [(HUHomeStatusDetailsItemManager *)self statusItem];
      id v16 = [v15 latestResults];
      uint64_t v17 = [v16 objectForKeyedSubscript:*MEMORY[0x1E4F68A28]];
      uint64_t v18 = [v17 integerValue];

      id v19 = v4;
      id v20 = &unk_1F1ABACC0;
      if ([v19 conformsToProtocol:v20]) {
        id v21 = v19;
      }
      else {
        id v21 = 0;
      }
      id v22 = v21;

      if (!objc_msgSend(v22, "hf_hasSetVisibleInHomeStatus")
        || (objc_msgSend(v22, "hf_isVisibleInHomeStatus") & 1) != 0
        || v18 >= 2)
      {

LABEL_19:
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v23 = v4;
          id v24 = [v23 services];
          v34[0] = MEMORY[0x1E4F143A8];
          v34[1] = 3221225472;
          v34[2] = __59__HUHomeStatusDetailsItemManager__shouldHideHomeKitObject___block_invoke;
          v34[3] = &unk_1E6387048;
          v34[4] = self;
          LOBYTE(v6) = objc_msgSend(v24, "na_all:", v34);

          goto LABEL_30;
        }
        objc_opt_class();
        char v25 = objc_opt_isKindOfClass() & 1;
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          goto LABEL_22;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v26 = v4;
          goto LABEL_28;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
LABEL_22:
          id v26 = [v4 accessory];
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            uint64_t v6 = 0;
            goto LABEL_29;
          }
          objc_msgSend(v4, "hf_linkedAccessory");
          id v26 = (id)objc_claimAutoreleasedReturnValue();
        }
LABEL_28:
        uint64_t v6 = v26;
LABEL_29:
        v27 = [(HUHomeStatusDetailsItemManager *)self representedHomeKitObjects];
        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        v30[2] = __59__HUHomeStatusDetailsItemManager__shouldHideHomeKitObject___block_invoke_2;
        v30[3] = &unk_1E638ED58;
        char v33 = v25;
        id v31 = v4;
        id v32 = v6;
        id v28 = v6;
        LODWORD(v6) = objc_msgSend(v27, "na_any:", v30) ^ 1;

        goto LABEL_30;
      }
    }
    LOBYTE(v6) = 1;
  }
LABEL_30:

  return (char)v6;
}

uint64_t __59__HUHomeStatusDetailsItemManager__shouldHideHomeKitObject___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _shouldHideHomeKitObject:a2];
}

uint64_t __59__HUHomeStatusDetailsItemManager__shouldHideHomeKitObject___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) isEqual:v3])
  {
    uint64_t v4 = 1;
    goto LABEL_13;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v3;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_10:
      uint64_t v4 = 0;
      goto LABEL_13;
    }
    objc_msgSend(v3, "hf_linkedAccessory");
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v6 = v5;
  if (!v5) {
    goto LABEL_10;
  }
  if (*(unsigned char *)(a1 + 48))
  {
    id v7 = [v5 home];
    uint64_t v8 = objc_msgSend(v7, "hf_mediaSystemForAccessory:", v6);
    uint64_t v4 = [v8 isEqual:*(void *)(a1 + 32)];
  }
  else
  {
    uint64_t v4 = [v5 isEqual:*(void *)(a1 + 40)];
  }

LABEL_13:
  return v4;
}

- (int64_t)_effectivePriorityForItem:(id)a3
{
  id v4 = a3;
  id v5 = [v4 latestResults];
  uint64_t v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F68A28]];

  id v7 = [(HUHomeStatusDetailsItemManager *)self _minimumPriorityNumberForItem:v4];

  if (v6)
  {
    int64_t v8 = [v6 integerValue];
    if (v7)
    {
LABEL_3:
      uint64_t v9 = [v7 integerValue];
      goto LABEL_6;
    }
  }
  else
  {
    int64_t v8 = -1;
    if (v7) {
      goto LABEL_3;
    }
  }
  uint64_t v9 = -1;
LABEL_6:
  if (v9 > v8) {
    int64_t v8 = v9;
  }

  return v8;
}

- (id)_minimumPriorityNumberForItem:(id)a3
{
  id v4 = a3;
  id v5 = [(HUHomeStatusDetailsItemManager *)self minimumPriorityItemTuples];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __64__HUHomeStatusDetailsItemManager__minimumPriorityNumberForItem___block_invoke;
  v10[3] = &unk_1E638EC70;
  id v6 = v4;
  id v11 = v6;
  id v7 = objc_msgSend(v5, "na_firstObjectPassingTest:", v10);

  if (v7)
  {
    int64_t v8 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v7, "priority"));
  }
  else
  {
    int64_t v8 = 0;
  }

  return v8;
}

uint64_t __64__HUHomeStatusDetailsItemManager__minimumPriorityNumberForItem___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 item];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

- (id)statusItem
{
  objc_opt_class();
  id v3 = [(HFItemManager *)self sourceItem];
  if (objc_opt_isKindOfClass()) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (BOOL)isDisplayingRoomLevelStatus
{
  id v2 = [(HUHomeStatusDetailsItemManager *)self statusItem];
  id v3 = [v2 room];
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)isNoResponseStatusItem
{
  id v2 = [(HUHomeStatusDetailsItemManager *)self statusItem];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)isFirmwareUpdateStatusItem
{
  id v2 = [(HUHomeStatusDetailsItemManager *)self statusItem];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)isLowBatteryStatusItem
{
  id v2 = [(HUHomeStatusDetailsItemManager *)self statusItem];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)isResidentDeviceStatusItem
{
  id v2 = [(HUHomeStatusDetailsItemManager *)self statusItem];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)shouldShowAccessoryTiles
{
  if ([(HUHomeStatusDetailsItemManager *)self isNoResponseStatusItem]
    || [(HUHomeStatusDetailsItemManager *)self isFirmwareUpdateStatusItem]
    || [(HUHomeStatusDetailsItemManager *)self isLowBatteryStatusItem])
  {
    char isKindOfClass = 1;
  }
  else
  {
    id v5 = [(HFItemManager *)self sourceItem];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char isKindOfClass = 1;
    }
    else
    {
      id v6 = [(HFItemManager *)self sourceItem];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
    }
  }
  return isKindOfClass & 1;
}

- (BOOL)shouldShowServiceGroupTiles
{
  if ([(HUHomeStatusDetailsItemManager *)self isNoResponseStatusItem]
    || [(HUHomeStatusDetailsItemManager *)self isFirmwareUpdateStatusItem])
  {
    return 0;
  }
  else
  {
    return ![(HUHomeStatusDetailsItemManager *)self isLowBatteryStatusItem];
  }
}

- (BOOL)shouldReloadItemProvidersOnSourceItemChange
{
  if ([(HUHomeStatusDetailsItemManager *)self isNoResponseStatusItem]
    || [(HUHomeStatusDetailsItemManager *)self isFirmwareUpdateStatusItem]
    || [(HUHomeStatusDetailsItemManager *)self isLowBatteryStatusItem])
  {
    return 1;
  }

  return [(HUHomeStatusDetailsItemManager *)self isResidentDeviceStatusItem];
}

- (HFResidentDeviceStatusDetailsItemProvider)residentDeviceStatusItemProvider
{
  return self->_residentDeviceStatusItemProvider;
}

- (void)setResidentDeviceStatusItemProvider:(id)a3
{
}

- (HUFirmwareUpdateItemProvider)firmwareUpdateItemProvider
{
  return self->_firmwareUpdateItemProvider;
}

- (void)setFirmwareUpdateItemProvider:(id)a3
{
}

- (HUSoftwareUpdateInfoItemProvider)softwareUpdateItemProvider
{
  return self->_softwareUpdateItemProvider;
}

- (void)setSoftwareUpdateItemProvider:(id)a3
{
}

- (HFNoRemoteAccessStatusDetailsItem)noRemoteAccessItem
{
  return self->_noRemoteAccessItem;
}

- (void)setNoRemoteAccessItem:(id)a3
{
}

- (void)setRepresentedHomeKitObjects:(id)a3
{
}

- (NSArray)cachedSectionIdentifiers
{
  return self->_cachedSectionIdentifiers;
}

- (void)setCachedSectionIdentifiers:(id)a3
{
}

- (NSMutableDictionary)cachedRoomNamesByIdentifier
{
  return self->_cachedRoomNamesByIdentifier;
}

- (void)setCachedRoomNamesByIdentifier:(id)a3
{
}

- (NSMutableSet)minimumPriorityItemTuples
{
  return self->_minimumPriorityItemTuples;
}

- (void)setMinimumPriorityItemTuples:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_minimumPriorityItemTuples, 0);
  objc_storeStrong((id *)&self->_cachedRoomNamesByIdentifier, 0);
  objc_storeStrong((id *)&self->_cachedSectionIdentifiers, 0);
  objc_storeStrong((id *)&self->_representedHomeKitObjects, 0);
  objc_storeStrong((id *)&self->_noRemoteAccessItem, 0);
  objc_storeStrong((id *)&self->_softwareUpdateItemProvider, 0);
  objc_storeStrong((id *)&self->_firmwareUpdateItemProvider, 0);

  objc_storeStrong((id *)&self->_residentDeviceStatusItemProvider, 0);
}

@end