@interface HUQuickControlGridCollectionItemManager
+ (BOOL)isPrimaryOrBinaryStateControlItem:(id)a3;
+ (id)serviceItemComparator;
+ (unint64_t)preferredControlForControlItem:(id)a3 allControlItems:(id)a4 isSupplementary:(BOOL)a5;
+ (unint64_t)specialCaseSectionSortingForControlItem:(id)a3 quickControlContext:(id)a4 fromControlItems:(id)a5 primaryServiceType:(id)a6;
- (BOOL)_catchAllLayoutForGridViewProfiles:(id)a3 supplementaryViewProfiles:(id)a4;
- (BOOL)_shouldDisableOptionalDataDuringFastInitialUpdate;
- (BOOL)isRTL;
- (BOOL)isSpeakerAccessory;
- (HFAccessoryControlItem)accessoryControlItem;
- (HFItemProvider)controlItemProvider;
- (HFItemProvider)overflowItemProvider;
- (HFItemProvider)supplementaryItemProvider;
- (HFServiceItemProvider)serviceItemProvider;
- (HFServiceLikeItem)sourceServiceLikeItem;
- (HUQuickControlGridCollectionItemManager)initWithDelegate:(id)a3 controlItems:(id)a4;
- (HUQuickControlGridCollectionItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4;
- (NSArray)mediaControlItems;
- (NSMapTable)controlItemToQuickControlContextTable;
- (NSNumber)airPlayEnabledSettingNumberValue;
- (NSSet)controlItems;
- (id)_buildItemProvidersForHome:(id)a3;
- (id)_buildSectionsWithDisplayedItems:(id)a3;
- (id)_composeIdentifierForService:(id)a3 section:(unint64_t)a4;
- (id)_findAndRemoveMediaAlarmsAndTimerItemsFromSection:(id)a3;
- (id)_findAndRemoveMediaControlItemsFromSection:(id)a3;
- (id)_generateQuickControlGroupContextForControlItems:(id)a3;
- (id)_itemsToHideInSet:(id)a3;
- (id)_mediaAlarmsAndTimerItemsFromControlItems:(id)a3;
- (id)configuration;
- (id)headerAccessoryButtonTargetForSection:(unint64_t)a3;
- (id)headerAccessoryButtonTitleForSection:(unint64_t)a3;
- (id)quickControlContextForItem:(id)a3;
- (id)titleForItem:(id)a3;
- (void)_addMediaAlarmsAndTimers:(id)a3 toSections:(id)a4;
- (void)setAccessoryControlItem:(id)a3;
- (void)setAirPlayEnabledSettingNumberValue:(id)a3;
- (void)setControlItemProvider:(id)a3;
- (void)setControlItemToQuickControlContextTable:(id)a3;
- (void)setControlItems:(id)a3;
- (void)setIsRTL:(BOOL)a3;
- (void)setIsSpeakerAccessory:(BOOL)a3;
- (void)setMediaControlItems:(id)a3;
- (void)setServiceItemProvider:(id)a3;
- (void)setSourceServiceLikeItem:(id)a3;
- (void)tearDown;
- (void)updateSettingValue:(id)a3 forKeyPath:(id)a4;
@end

@implementation HUQuickControlGridCollectionItemManager

- (HUQuickControlGridCollectionItemManager)initWithDelegate:(id)a3 controlItems:(id)a4
{
  id v6 = a4;
  v22.receiver = self;
  v22.super_class = (Class)HUQuickControlGridCollectionItemManager;
  v7 = [(HFItemManager *)&v22 initWithDelegate:a3 sourceItem:0];
  if (v7)
  {
    uint64_t v8 = objc_msgSend(v6, "na_map:", &__block_literal_global_57);
    controlItems = v7->_controlItems;
    v7->_controlItems = (NSSet *)v8;

    v10 = objc_msgSend(v6, "na_firstObjectPassingTest:", &__block_literal_global_3_1);
    uint64_t v11 = [v10 copy];
    accessoryControlItem = v7->_accessoryControlItem;
    v7->_accessoryControlItem = (HFAccessoryControlItem *)v11;

    uint64_t v13 = [MEMORY[0x1E4F28E10] mapTableWithWeakToStrongObjects];
    controlItemToQuickControlContextTable = v7->_controlItemToQuickControlContextTable;
    v7->_controlItemToQuickControlContextTable = (NSMapTable *)v13;

    objc_opt_class();
    v15 = [(HFItemManager *)v7 delegate];
    if (objc_opt_isKindOfClass()) {
      v16 = v15;
    }
    else {
      v16 = 0;
    }
    id v17 = v16;

    v18 = [v17 view];

    v7->_isRTL = [v18 effectiveUserInterfaceLayoutDirection] == 1;
    v19 = [MEMORY[0x1E4F691A0] sharedDispatcher];
    v20 = [v19 accessorySettingsDataSource];
    [v20 addObserver:v7];
  }
  return v7;
}

id __73__HUQuickControlGridCollectionItemManager_initWithDelegate_controlItems___block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)[a2 copy];

  return v2;
}

uint64_t __73__HUQuickControlGridCollectionItemManager_initWithDelegate_controlItems___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (HUQuickControlGridCollectionItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4
{
  id v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  v7 = NSStringFromSelector(sel_initWithDelegate_controlItems_);
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUQuickControlGridCollectionItemManager.m", 88, @"%s is unavailable; use %@ instead",
    "-[HUQuickControlGridCollectionItemManager initWithDelegate:sourceItem:]",
    v7);

  return 0;
}

- (void)tearDown
{
  id v4 = [MEMORY[0x1E4F691A0] sharedDispatcher];
  v3 = [v4 accessorySettingsDataSource];
  [v3 removeObserver:self];
}

- (BOOL)_shouldDisableOptionalDataDuringFastInitialUpdate
{
  return 0;
}

- (id)configuration
{
  v3 = [HUQuickControlViewControllerConfiguration alloc];
  id v4 = [(HFItemManager *)self home];
  v5 = [(HUQuickControlViewControllerConfiguration *)v3 initWithHome:v4];

  [(HUQuickControlViewControllerConfiguration *)v5 setCopyItems:0];
  id v6 = [(HFItemManager *)self delegate];
  if ([v6 conformsToProtocol:&unk_1F1A41998]) {
    v7 = v6;
  }
  else {
    v7 = 0;
  }
  id v8 = v7;
  [(HUQuickControlViewControllerConfiguration *)v5 setItemUpdater:v8];

  return v5;
}

- (id)_buildItemProvidersForHome:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:2];
  id v6 = [(HUQuickControlGridCollectionItemManager *)self accessoryControlItem];

  if (v6)
  {
    v7 = [(HUQuickControlGridCollectionItemManager *)self accessoryControlItem];
    id v8 = [v7 valueSource];
    v9 = [v8 valueSource];

    id v10 = objc_alloc(MEMORY[0x1E4F68E18]);
    uint64_t v11 = [(HUQuickControlGridCollectionItemManager *)self accessoryControlItem];
    v12 = [v11 accessory];
    uint64_t v13 = (void *)[v10 initWithAccessory:v12 valueSource:v9];

    v14 = (void *)[objc_alloc(MEMORY[0x1E4F68DE0]) initWithAccessoryItem:v13];
    [(HUQuickControlGridCollectionItemManager *)self setControlItemProvider:v14];

    v15 = [(HUQuickControlGridCollectionItemManager *)self accessoryControlItem];
    v16 = (void *)[v15 copy];

    id v17 = (void *)[objc_alloc(MEMORY[0x1E4F69558]) initWithHome:v4];
    [(HUQuickControlGridCollectionItemManager *)self setServiceItemProvider:v17];

    v18 = [(HUQuickControlGridCollectionItemManager *)self serviceItemProvider];
    [v18 setValueSource:v9];

    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __70__HUQuickControlGridCollectionItemManager__buildItemProvidersForHome___block_invoke;
    v27[3] = &unk_1E6387268;
    id v28 = v16;
    id v19 = v16;
    v20 = [(HUQuickControlGridCollectionItemManager *)self serviceItemProvider];
    [v20 setSourceServiceGenerator:v27];
  }
  else
  {
    id v21 = objc_alloc(MEMORY[0x1E4F695C8]);
    objc_super v22 = [(HUQuickControlGridCollectionItemManager *)self controlItems];
    v23 = (void *)[v21 initWithItems:v22];
    [(HUQuickControlGridCollectionItemManager *)self setControlItemProvider:v23];
  }
  v24 = [(HUQuickControlGridCollectionItemManager *)self controlItemProvider];
  objc_msgSend(v5, "na_safeAddObject:", v24);

  v25 = [(HUQuickControlGridCollectionItemManager *)self serviceItemProvider];
  objc_msgSend(v5, "na_safeAddObject:", v25);

  return v5;
}

id __70__HUQuickControlGridCollectionItemManager__buildItemProvidersForHome___block_invoke(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F7A0D8];
  id v2 = [*(id *)(a1 + 32) accessory];
  v3 = objc_msgSend(v2, "hf_visibleServices");
  id v4 = [v1 futureWithResult:v3];

  return v4;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  uint64_t v163 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HUQuickControlGridCollectionItemManager *)self controlItemProvider];
  id v6 = [v5 items];
  v7 = objc_msgSend(v6, "na_setByIntersectingWithSet:", v4);

  id v8 = [(HUQuickControlGridCollectionItemManager *)self serviceItemProvider];
  v9 = [v8 items];
  v133 = v4;
  id v10 = objc_msgSend(v9, "na_setByIntersectingWithSet:", v4);
  uint64_t v11 = v10;
  if (v10)
  {
    id v12 = v10;
  }
  else
  {
    id v12 = [MEMORY[0x1E4F1CAD0] set];
  }
  uint64_t v13 = v12;

  v14 = [v13 allObjects];
  v15 = [(id)objc_opt_class() serviceItemComparator];
  v16 = [v14 sortedArrayUsingComparator:v15];

  unint64_t v17 = 0x1E4F1C000uLL;
  v18 = [MEMORY[0x1E4F1CA48] array];
  id v19 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v13, "count"));
  v20 = objc_msgSend(MEMORY[0x1E4F28BD0], "setWithCapacity:", objc_msgSend(v13, "count"));
  id v21 = objc_msgSend(MEMORY[0x1E4F28BD0], "setWithCapacity:", objc_msgSend(v13, "count"));
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __76__HUQuickControlGridCollectionItemManager__buildSectionsWithDisplayedItems___block_invoke;
  aBlock[3] = &unk_1E6388180;
  aBlock[4] = self;
  id v131 = v18;
  id v158 = v131;
  id v137 = v20;
  id v159 = v137;
  id v136 = v21;
  id v160 = v136;
  objc_super v22 = _Block_copy(aBlock);
  v23 = [(HUQuickControlGridCollectionItemManager *)self accessoryControlItem];

  v140 = (void (**)(void, void, void, void, void, void))v22;
  v141 = v19;
  v143 = self;
  v134 = v13;
  v135 = v7;
  v132 = v16;
  if (v23)
  {
    v24 = [(HUQuickControlGridCollectionItemManager *)self accessoryControlItem];
    v25 = [v24 accessory];
    v26 = objc_msgSend(v25, "hf_primaryService");

    v27 = [v26 serviceType];
    id v28 = [(HUQuickControlGridCollectionItemManager *)self controlItemProvider];
    v29 = [v28 items];

    long long v155 = 0u;
    long long v156 = 0u;
    long long v153 = 0u;
    long long v154 = 0u;
    obuint64_t j = v16;
    uint64_t v30 = [obj countByEnumeratingWithState:&v153 objects:v162 count:16];
    if (v30)
    {
      uint64_t v31 = v30;
      uint64_t v32 = *(void *)v154;
      do
      {
        for (uint64_t i = 0; i != v31; ++i)
        {
          if (*(void *)v154 != v32) {
            objc_enumerationMutation(obj);
          }
          uint64_t v34 = *(void *)(*((void *)&v153 + 1) + 8 * i);
          v35 = [(HFItemManager *)v143 childItemsForItem:v34 ofClass:objc_opt_class()];
          v36 = [(HUQuickControlGridCollectionItemManager *)v143 _generateQuickControlGroupContextForControlItems:v35];
          v37 = ((void (**)(void, void *, void *, void *, void *, uint64_t))v140)[2](v140, v36, v35, v27, v29, v34);
          [v141 addObject:v37];
        }
        uint64_t v31 = [obj countByEnumeratingWithState:&v153 objects:v162 count:16];
      }
      while (v31);
    }

    BOOL v38 = [(HUQuickControlGridCollectionItemManager *)v143 _catchAllLayoutForGridViewProfiles:v137 supplementaryViewProfiles:v136];
    v7 = v135;
    id v19 = v141;
    unint64_t v17 = 0x1E4F1C000;
  }
  else
  {
    v26 = [(HUQuickControlGridCollectionItemManager *)self _generateQuickControlGroupContextForControlItems:v7];
    v27 = (*((void (**)(void *, void *, void *, void, void, void))v22 + 2))(v22, v26, v7, 0, 0, 0);
    [v19 addObject:v27];
    BOOL v38 = 0;
  }

  id obja = [*(id *)(v17 + 2632) array];
  if (!v38)
  {
    v74 = [*(id *)(v17 + 2632) array];
    v75 = [*(id *)(v17 + 2632) array];
    v146[0] = MEMORY[0x1E4F143A8];
    v146[1] = 3221225472;
    v146[2] = __76__HUQuickControlGridCollectionItemManager__buildSectionsWithDisplayedItems___block_invoke_4;
    v146[3] = &unk_1E63881A8;
    id v76 = v74;
    id v147 = v76;
    id v139 = v75;
    id v148 = v139;
    objc_msgSend(v19, "na_each:", v146);
    v142 = v76;
    if ([v76 count])
    {
      v77 = objc_msgSend(v76, "na_firstObjectPassingTest:", &__block_literal_global_86);
      v78 = [v77 valueSource];
      v79 = [v78 allServices];
      v80 = [v79 anyObject];

      v81 = [v80 accessory];
      v82 = objc_msgSend(v81, "hf_siriEndpointProfile");

      BOOL v83 = v82 != 0;
      v84 = v143;
      if (v82)
      {
        v85 = [v80 accessory];
        -[HUQuickControlGridCollectionItemManager setIsSpeakerAccessory:](v143, "setIsSpeakerAccessory:", objc_msgSend(v85, "hf_isDumbSpeaker"));

        if (![(HUQuickControlGridCollectionItemManager *)v143 isSpeakerAccessory])
        {
          v86 = [(HUQuickControlGridCollectionItemManager *)v143 airPlayEnabledSettingNumberValue];

          if (!v86)
          {
            v87 = [v80 accessory];
            v88 = [v87 mediaProfile];
            v89 = objc_msgSend(v88, "hf_mediaAccessoryCommonSettingsManager");

            v90 = [v89 settingValueForKeyPath:*MEMORY[0x1E4F68028]];
            [(HUQuickControlGridCollectionItemManager *)v143 setAirPlayEnabledSettingNumberValue:v90];
          }
        }
        v91 = objc_msgSend(v76, "na_filter:", &__block_literal_global_88_0);
        v92 = [(HUQuickControlGridCollectionItemManager *)v143 mediaControlItems];

        if (!v92) {
          [(HUQuickControlGridCollectionItemManager *)v143 setMediaControlItems:v91];
        }
        [v76 removeObjectsInArray:v91];
      }
      v93 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"grid"];
      [v93 setItems:v76];
      [obja addObject:v93];
    }
    else
    {
      BOOL v83 = 0;
      v84 = v143;
    }
    uint64_t v103 = [(HUQuickControlGridCollectionItemManager *)v84 _mediaAlarmsAndTimerItemsFromControlItems:v139];
    v104 = v84;
    v105 = (void *)v103;
    v106 = [(HUQuickControlGridCollectionItemManager *)v104 mediaControlItems];
    uint64_t v107 = [v106 count];

    v108 = 0;
    if (v83 && v107)
    {
      id v109 = objc_alloc(MEMORY[0x1E4F692E8]);
      v110 = [NSString stringWithFormat:@"Media-%@", @"grid"];
      v108 = (void *)[v109 initWithIdentifier:v110];

      [v108 setItems:MEMORY[0x1E4F1CBF0]];
      if ([(HUQuickControlGridCollectionItemManager *)v143 isSpeakerAccessory]
        || (-[HUQuickControlGridCollectionItemManager airPlayEnabledSettingNumberValue](v143, "airPlayEnabledSettingNumberValue"), v111 = objc_claimAutoreleasedReturnValue(), int v112 = [v111 BOOLValue], v111, v112))
      {
        v113 = _HULocalizedStringWithDefaultValue(@"HUMediaSectionTitle", @"HUMediaSectionTitle", 1);
        v114 = [(HUQuickControlGridCollectionItemManager *)v143 mediaControlItems];
        [v108 setItems:v114];
      }
      else
      {
        v113 = 0;
      }
      [v108 setHeaderTitle:v113];
      [obja addObject:v108];
    }
    if ([v105 count])
    {
      [v139 removeObjectsInArray:v105];
      [(HUQuickControlGridCollectionItemManager *)v143 _addMediaAlarmsAndTimers:v105 toSections:obja];
    }
    v94 = v141;
    if (![v139 count]) {
      goto LABEL_87;
    }
    v118 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"supplementary"];
    v119 = [MEMORY[0x1E4F69220] defaultItemComparator];
    v120 = [v139 sortedArrayUsingComparator:v119];
    [v118 setItems:v120];

    if ([(HUQuickControlGridCollectionItemManager *)v143 isSpeakerAccessory])
    {
      uint64_t v121 = [obja indexOfObject:v108];
    }
    else
    {
      v122 = [(HUQuickControlGridCollectionItemManager *)v143 airPlayEnabledSettingNumberValue];
      if ([v122 BOOLValue]) {
        uint64_t v121 = [obja indexOfObject:v108];
      }
      else {
        uint64_t v121 = 0x7FFFFFFFFFFFFFFFLL;
      }

      v94 = v141;
    }
    if (v121 != 0x7FFFFFFFFFFFFFFFLL && v83)
    {
      v124 = obja;
      v125 = v118;
      uint64_t v126 = v121;
    }
    else
    {
      if ((unint64_t)[obja count] < 2)
      {
        [obja addObject:v118];
        goto LABEL_86;
      }
      v124 = obja;
      v125 = v118;
      uint64_t v126 = 1;
    }
    [v124 insertObject:v125 atIndex:v126];
LABEL_86:

LABEL_87:
    v95 = v147;
LABEL_88:
    v115 = v132;
    goto LABEL_89;
  }
  v39 = [(HUQuickControlGridCollectionItemManager *)v143 accessoryControlItem];
  v40 = [v39 accessory];
  v41 = objc_msgSend(v40, "hf_primaryService");

  v42 = [v41 accessory];
  v43 = objc_msgSend(v42, "hf_siriEndpointProfile");

  v44 = [v41 accessory];
  -[HUQuickControlGridCollectionItemManager setIsSpeakerAccessory:](v143, "setIsSpeakerAccessory:", objc_msgSend(v44, "hf_isDumbSpeaker"));

  if (![(HUQuickControlGridCollectionItemManager *)v143 isSpeakerAccessory])
  {
    v45 = [(HUQuickControlGridCollectionItemManager *)v143 airPlayEnabledSettingNumberValue];

    if (!v45)
    {
      v46 = [v41 accessory];
      v47 = [v46 mediaProfile];
      v48 = objc_msgSend(v47, "hf_mediaAccessoryCommonSettingsManager");

      v49 = [v48 settingValueForKeyPath:*MEMORY[0x1E4F68028]];
      [(HUQuickControlGridCollectionItemManager *)v143 setAirPlayEnabledSettingNumberValue:v49];
    }
  }
  v130 = v41;
  long long v151 = 0u;
  long long v152 = 0u;
  long long v149 = 0u;
  long long v150 = 0u;
  id v138 = v19;
  uint64_t v50 = [v138 countByEnumeratingWithState:&v149 objects:v161 count:16];
  if (v50)
  {
    uint64_t v51 = v50;
    id v139 = 0;
    v142 = 0;
    uint64_t v52 = *(void *)v150;
    v53 = v143;
    do
    {
      for (uint64_t j = 0; j != v51; ++j)
      {
        if (*(void *)v150 != v52) {
          objc_enumerationMutation(v138);
        }
        v55 = *(void **)(*((void *)&v149 + 1) + 8 * j);
        v56 = [v55 serviceItem];
        v57 = [v56 service];

        if (v43)
        {
          uint64_t v58 = (uint64_t)v142;
          if (!v142)
          {
            uint64_t v58 = [(HUQuickControlGridCollectionItemManager *)v53 _findAndRemoveMediaControlItemsFromSection:v55];
          }
          v142 = (void *)v58;
          if (!v139)
          {
            id v139 = [(HUQuickControlGridCollectionItemManager *)v53 _findAndRemoveMediaAlarmsAndTimerItemsFromSection:v55];
          }
        }
        v59 = [v55 gridControlItems];
        uint64_t v60 = [v59 count];

        if (v60)
        {
          id v61 = objc_alloc(MEMORY[0x1E4F692E8]);
          v62 = [(HUQuickControlGridCollectionItemManager *)v53 _composeIdentifierForService:v57 section:1];
          v63 = (void *)[v61 initWithIdentifier:v62];

          v64 = [v55 gridControlItems];
          [v63 setItems:v64];

          if (v43 && [obja count])
          {
            v65 = [v55 serviceItem];
            v66 = [v65 namingComponentForHomeKitObject];
            v67 = [v66 name];
            [v63 setHeaderTitle:v67];

            v53 = v143;
          }
          [obja addObject:v63];
        }
        v68 = [v55 supplementaryControlItems];
        uint64_t v69 = [v68 count];

        if (v69)
        {
          id v70 = objc_alloc(MEMORY[0x1E4F692E8]);
          v71 = [(HUQuickControlGridCollectionItemManager *)v53 _composeIdentifierForService:v57 section:2];
          v72 = (void *)[v70 initWithIdentifier:v71];

          v73 = [v55 supplementaryControlItems];
          [v72 setItems:v73];

          [obja addObject:v72];
        }
      }
      uint64_t v51 = [v138 countByEnumeratingWithState:&v149 objects:v161 count:16];
    }
    while (v51);
  }
  else
  {
    id v139 = 0;
    v142 = 0;
    v53 = v143;
  }

  uint64_t v13 = v134;
  v7 = v135;
  v94 = v141;
  v95 = v130;
  if ([v142 count] && v43)
  {
    id v96 = objc_alloc(MEMORY[0x1E4F692E8]);
    v97 = [NSString stringWithFormat:@"Media-%@", @"grid"];
    v98 = (void *)[v96 initWithIdentifier:v97];

    [v98 setItems:v142];
    [v98 setItems:MEMORY[0x1E4F1CBF0]];
    if ([(HUQuickControlGridCollectionItemManager *)v53 isSpeakerAccessory]
      || (-[HUQuickControlGridCollectionItemManager airPlayEnabledSettingNumberValue](v53, "airPlayEnabledSettingNumberValue"), v99 = objc_claimAutoreleasedReturnValue(), int v100 = [v99 BOOLValue], v99, v100))
    {
      v101 = _HULocalizedStringWithDefaultValue(@"HUMediaSectionTitle", @"HUMediaSectionTitle", 1);
      if (v142) {
        -[HUQuickControlGridCollectionItemManager setMediaControlItems:](v53, "setMediaControlItems:");
      }
      v102 = [(HUQuickControlGridCollectionItemManager *)v53 mediaControlItems];
      [v98 setItems:v102];
    }
    else
    {
      v101 = 0;
    }
    [v98 setHeaderTitle:v101];
    [obja addObject:v98];
  }
  if (!v139) {
    goto LABEL_88;
  }
  v115 = v132;
  if (v43)
  {
    v116 = v53;
    v117 = obja;
    -[HUQuickControlGridCollectionItemManager _addMediaAlarmsAndTimers:toSections:](v116, "_addMediaAlarmsAndTimers:toSections:");
    goto LABEL_90;
  }
LABEL_89:
  v117 = obja;
LABEL_90:

  if ([v131 count])
  {
    v127 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"sensors"];
    v128 = [v131 sortedArrayUsingComparator:&__block_literal_global_92];
    [v127 setItems:v128];

    [v117 addObject:v127];
  }

  return v117;
}

HUQuickControlGridServiceSection *__76__HUQuickControlGridCollectionItemManager__buildSectionsWithDisplayedItems___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a2;
  v15 = [a3 allObjects];
  v16 = objc_msgSend(MEMORY[0x1E4F69098], "hf_controlItemComparator");
  unint64_t v17 = [v15 sortedArrayUsingComparator:v16];

  v18 = [v14 primaryQuickControlContext];
  id v19 = [v14 alternateQuickControlContexts];

  v20 = objc_msgSend(MEMORY[0x1E4F1CA80], "na_setWithSafeObject:", v18);
  [v20 unionSet:v19];
  id v21 = objc_alloc_init(HUQuickControlGridServiceSection);
  [(HUQuickControlGridServiceSection *)v21 setServiceItem:v13];

  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __76__HUQuickControlGridCollectionItemManager__buildSectionsWithDisplayedItems___block_invoke_2;
  v31[3] = &unk_1E6388158;
  uint64_t v22 = *(void *)(a1 + 32);
  id v32 = v20;
  uint64_t v33 = v22;
  id v34 = v17;
  id v35 = v12;
  id v36 = v11;
  v23 = v21;
  v37 = v23;
  id v38 = *(id *)(a1 + 40);
  id v39 = *(id *)(a1 + 48);
  id v40 = *(id *)(a1 + 56);
  id v24 = v11;
  id v25 = v12;
  id v26 = v17;
  id v27 = v20;
  objc_msgSend(v26, "na_each:", v31);
  id v28 = v40;
  v29 = v23;

  return v29;
}

void __76__HUQuickControlGridCollectionItemManager__buildSectionsWithDisplayedItems___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 latestResults];
  v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F683C0]];
  unint64_t v6 = [v5 unsignedIntegerValue];

  v7 = *(void **)(a1 + 32);
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __76__HUQuickControlGridCollectionItemManager__buildSectionsWithDisplayedItems___block_invoke_3;
  v28[3] = &unk_1E6388130;
  id v8 = v3;
  id v29 = v8;
  v9 = objc_msgSend(v7, "na_firstObjectPassingTest:", v28);
  if (v9)
  {
    id v10 = [*(id *)(a1 + 40) controlItemToQuickControlContextTable];
    [v10 setObject:v9 forKey:v8];

    id v11 = [v8 valueSource];
    id v12 = [v11 allServices];

    if ([v12 count] == 1)
    {
      id v13 = [v12 anyObject];
      int v14 = [v13 isPrimaryService];

      int v15 = v14 ^ 1;
    }
    else
    {
      int v15 = 1;
    }
    uint64_t v16 = [*(id *)(a1 + 48) indexOfObject:v8];
    uint64_t v17 = [(id)objc_opt_class() specialCaseSectionSortingForControlItem:v8 quickControlContext:v9 fromControlItems:*(void *)(a1 + 56) primaryServiceType:*(void *)(a1 + 64)];
    if (v17 == 2) {
      int v18 = 1;
    }
    else {
      int v18 = (v6 >> 2) & 1;
    }
    int v19 = 1;
    if (v15 && (v6 & 2) == 0)
    {
      if (v16) {
        BOOL v20 = v17 == 1;
      }
      else {
        BOOL v20 = 1;
      }
      int v19 = v20;
    }
    if (v18)
    {
      id v21 = *(void **)(a1 + 72);
    }
    else
    {
      if (v17 == 3)
      {
        [*(id *)(a1 + 80) addObject:v8];
        uint64_t v22 = 0;
        int v23 = 0;
        goto LABEL_23;
      }
      id v21 = *(void **)(a1 + 72);
      if (v19)
      {
        id v24 = [v21 gridControlItems];
        [v24 addObject:v8];

        uint64_t v22 = 0;
        int v23 = 1;
        goto LABEL_23;
      }
    }
    id v25 = [v21 supplementaryControlItems];
    [v25 addObject:v8];

    int v23 = 0;
    uint64_t v22 = 1;
LABEL_23:
    objc_msgSend(v9, "setPreferredControl:", objc_msgSend((id)objc_opt_class(), "preferredControlForControlItem:allControlItems:isSupplementary:", v8, *(void *)(a1 + 56), v22));
    if (v23)
    {
      id v26 = (id *)(a1 + 88);
    }
    else
    {
      if (!v22) {
        goto LABEL_28;
      }
      id v26 = (id *)(a1 + 96);
    }
    objc_msgSend(*v26, "na_safeAddObject:", objc_msgSend(v9, "viewProfileClass"));
LABEL_28:
    int v27 = objc_msgSend((id)objc_msgSend(v9, "viewProfileClass"), "isEqual:", objc_opt_class());
    if (v27)
    {
      if ([*(id *)(a1 + 64) isEqualToString:*MEMORY[0x1E4F2DF00]])
      {
LABEL_33:

        goto LABEL_34;
      }
      int v27 = [*(id *)(a1 + 64) isEqualToString:*MEMORY[0x1E4F2DE40]];
    }
    if (((v23 | v27) & 1) == 0) {
      [v9 setControlOrientation:1];
    }
    goto LABEL_33;
  }
LABEL_34:
}

uint64_t __76__HUQuickControlGridCollectionItemManager__buildSectionsWithDisplayedItems___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = [a2 controlItems];
  uint64_t v4 = [v3 containsObject:*(void *)(a1 + 32)];

  return v4;
}

void __76__HUQuickControlGridCollectionItemManager__buildSectionsWithDisplayedItems___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  v5 = [v4 gridControlItems];
  unint64_t v6 = [MEMORY[0x1E4F69220] defaultItemComparator];
  v7 = [v5 sortedArrayUsingComparator:v6];
  [v3 addObjectsFromArray:v7];

  id v8 = *(void **)(a1 + 40);
  id v11 = [v4 supplementaryControlItems];

  v9 = [MEMORY[0x1E4F69220] defaultItemComparator];
  id v10 = [v11 sortedArrayUsingComparator:v9];
  [v8 addObjectsFromArray:v10];
}

BOOL __76__HUQuickControlGridCollectionItemManager__buildSectionsWithDisplayedItems___block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = [a2 valueSource];
  id v3 = [v2 allServices];
  BOOL v4 = [v3 count] != 0;

  return v4;
}

uint64_t __76__HUQuickControlGridCollectionItemManager__buildSectionsWithDisplayedItems___block_invoke_6(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __76__HUQuickControlGridCollectionItemManager__buildSectionsWithDisplayedItems___block_invoke_7(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  objc_opt_class();
  id v6 = v4;
  if (objc_opt_isKindOfClass()) {
    v7 = v6;
  }
  else {
    v7 = 0;
  }
  id v8 = v7;

  objc_opt_class();
  id v9 = v5;
  if (objc_opt_isKindOfClass()) {
    id v10 = v9;
  }
  else {
    id v10 = 0;
  }
  id v11 = v10;

  id v12 = [v8 latestResults];
  uint64_t v13 = *MEMORY[0x1E4F68A88];
  int v14 = [v12 objectForKeyedSubscript:*MEMORY[0x1E4F68A88]];
  uint64_t v15 = [v14 localizedLowercaseString];
  uint64_t v16 = (void *)v15;
  if (v15) {
    uint64_t v17 = (__CFString *)v15;
  }
  else {
    uint64_t v17 = &stru_1F18F92B8;
  }
  int v18 = v17;

  int v19 = [v11 latestResults];
  BOOL v20 = [v19 objectForKeyedSubscript:v13];
  uint64_t v21 = [v20 localizedLowercaseString];
  uint64_t v22 = (void *)v21;
  if (v21) {
    int v23 = (__CFString *)v21;
  }
  else {
    int v23 = &stru_1F18F92B8;
  }
  id v24 = v23;

  uint64_t v25 = [(__CFString *)v18 compare:v24];
  return v25;
}

- (id)_itemsToHideInSet:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)HUQuickControlGridCollectionItemManager;
  id v4 = [(HFItemManager *)&v11 _itemsToHideInSet:a3];
  id v5 = (void *)[v4 mutableCopy];

  uint64_t v6 = [(HUQuickControlGridCollectionItemManager *)self mediaControlItems];
  if (v6)
  {
    v7 = (void *)v6;
    id v8 = [(HUQuickControlGridCollectionItemManager *)self airPlayEnabledSettingNumberValue];
    if ([v8 BOOLValue])
    {
    }
    else
    {
      BOOL v9 = [(HUQuickControlGridCollectionItemManager *)self isSpeakerAccessory];

      if (v9) {
        goto LABEL_7;
      }
      v7 = [(HUQuickControlGridCollectionItemManager *)self mediaControlItems];
      [v5 addObjectsFromArray:v7];
    }
  }
LABEL_7:

  return v5;
}

- (id)_generateQuickControlGroupContextForControlItems:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = [(HUQuickControlGridCollectionItemManager *)self configuration];
    uint64_t v6 = objc_msgSend(MEMORY[0x1E4F69098], "hu_preferredQuickControlGroupContextForControlItems:configuration:ignoringGrid:", v4, v5, 1);
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (void)_addMediaAlarmsAndTimers:(id)a3 toSections:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v34 = a4;
  v7 = [MEMORY[0x1E4F69138] sharedInstance];
  if ([v7 hostProcess] == 100)
  {
    BOOL v33 = 1;
  }
  else
  {
    id v8 = [MEMORY[0x1E4F69138] sharedInstance];
    BOOL v33 = [v8 hostProcess] == 3;
  }
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  obuint64_t j = v6;
  uint64_t v9 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v31 = (void *)*MEMORY[0x1E4F68510];
    uint64_t v32 = *(void *)v36;
    uint64_t v30 = (void *)*MEMORY[0x1E4F685A8];
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v36 != v32) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v35 + 1) + 8 * v11);
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();
        int v14 = v31;
        if ((isKindOfClass & 1) == 0) {
          int v14 = v30;
        }
        uint64_t v15 = (objc_class *)MEMORY[0x1E4F692E8];
        id v16 = v14;
        uint64_t v17 = (void *)[[v15 alloc] initWithIdentifier:v16];

        int v18 = (void *)MEMORY[0x1E4F28B18];
        int v19 = _HULocalizedStringWithDefaultValue(@"HUQuickControlAlarmsDetailsButtonTitle", @"HUQuickControlAlarmsDetailsButtonTitle", 1);
        BOOL v20 = objc_msgSend(v18, "hf_attributedStringWithSystemImageNamed:title:isRTL:", @"alarm.fill", v19, -[HUQuickControlGridCollectionItemManager isRTL](self, "isRTL"));

        uint64_t v21 = (void *)MEMORY[0x1E4F28B18];
        uint64_t v22 = _HULocalizedStringWithDefaultValue(@"HUQuickControlTimersDetailsButtonTitle", @"HUQuickControlTimersDetailsButtonTitle", 1);
        uint64_t v23 = objc_msgSend(v21, "hf_attributedStringWithSystemImageNamed:title:isRTL:", @"timer", v22, -[HUQuickControlGridCollectionItemManager isRTL](self, "isRTL"));
        id v24 = (void *)v23;
        if (isKindOfClass) {
          uint64_t v25 = v20;
        }
        else {
          uint64_t v25 = (void *)v23;
        }

        [v17 setAttributedHeaderTitle:v25];
        if (!v33 || [MEMORY[0x1E4F69758] isDeviceUnlocked])
        {
          if (isKindOfClass) {
            id v26 = @"HUHomePodAlarmsNew";
          }
          else {
            id v26 = @"HUHomePodTimersNew";
          }
          int v27 = _HULocalizedStringWithDefaultValue(v26, v26, 1);
          [v17 setHeaderAccessoryButtonTitle:v27];
        }
        uint64_t v39 = v12;
        id v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v39 count:1];
        [v17 setItems:v28];

        [v34 addObject:v17];
        ++v11;
      }
      while (v10 != v11);
      uint64_t v10 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
    }
    while (v10);
  }
}

- (id)_mediaAlarmsAndTimerItemsFromControlItems:(id)a3
{
  return (id)objc_msgSend(a3, "na_filter:", &__block_literal_global_123_0);
}

uint64_t __85__HUQuickControlGridCollectionItemManager__mediaAlarmsAndTimerItemsFromControlItems___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  int v4 = _os_feature_enabled_impl();
  if (v4)
  {
    objc_opt_class();
    LOBYTE(v4) = objc_opt_isKindOfClass();
  }
  char v5 = isKindOfClass | v4;

  return v5 & 1;
}

- (id)_findAndRemoveMediaControlItemsFromSection:(id)a3
{
  id v3 = a3;
  int v4 = [v3 gridControlItems];
  char v5 = objc_msgSend(v4, "na_filter:", &__block_literal_global_128);

  if (![v5 count])
  {
    id v6 = [v3 supplementaryControlItems];
    uint64_t v7 = objc_msgSend(v6, "na_filter:", &__block_literal_global_130);

    char v5 = (void *)v7;
  }
  if ([v5 count])
  {
    id v8 = [v3 gridControlItems];
    [v8 removeObjectsInArray:v5];

    uint64_t v9 = [v3 supplementaryControlItems];
    [v9 removeObjectsInArray:v5];
  }
  if ([v5 count]) {
    uint64_t v10 = v5;
  }
  else {
    uint64_t v10 = 0;
  }
  id v11 = v10;

  return v11;
}

uint64_t __86__HUQuickControlGridCollectionItemManager__findAndRemoveMediaControlItemsFromSection___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __86__HUQuickControlGridCollectionItemManager__findAndRemoveMediaControlItemsFromSection___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)_findAndRemoveMediaAlarmsAndTimerItemsFromSection:(id)a3
{
  id v4 = a3;
  char v5 = [v4 gridControlItems];
  id v6 = [(HUQuickControlGridCollectionItemManager *)self _mediaAlarmsAndTimerItemsFromControlItems:v5];

  if ([v6 count])
  {
    if (!v6) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  uint64_t v12 = [v4 supplementaryControlItems];
  uint64_t v13 = [(HUQuickControlGridCollectionItemManager *)self _mediaAlarmsAndTimerItemsFromControlItems:v12];

  id v6 = (void *)v13;
  if (v13)
  {
LABEL_3:
    uint64_t v7 = [v4 gridControlItems];
    [v7 removeObjectsInArray:v6];

    id v8 = [v4 supplementaryControlItems];
    [v8 removeObjectsInArray:v6];
  }
LABEL_4:
  if ([v6 count]) {
    uint64_t v9 = v6;
  }
  else {
    uint64_t v9 = 0;
  }
  id v10 = v9;

  return v10;
}

- (id)quickControlContextForItem:(id)a3
{
  id v4 = a3;
  char v5 = [(HUQuickControlGridCollectionItemManager *)self controlItemToQuickControlContextTable];
  id v6 = [v5 objectForKey:v4];

  return v6;
}

- (id)titleForItem:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v4 latestResults];
    id v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F68AB8]];
  }
  else
  {
    uint64_t v7 = [(HUQuickControlGridCollectionItemManager *)self controlItemProvider];
    id v8 = [v7 items];
    int v9 = [v8 containsObject:v4];

    if (!v9)
    {
      id v6 = 0;
      goto LABEL_18;
    }
    objc_opt_class();
    id v10 = v4;
    if (objc_opt_isKindOfClass()) {
      id v11 = v10;
    }
    else {
      id v11 = 0;
    }
    id v5 = v11;

    uint64_t v12 = [v5 valueSource];
    uint64_t v13 = [v12 allServices];

    id v6 = 0;
    if ([v13 count] == 1)
    {
      int v14 = [v13 anyObject];
      uint64_t v15 = [(HUQuickControlGridCollectionItemManager *)self serviceItemProvider];
      id v16 = [v15 items];
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __56__HUQuickControlGridCollectionItemManager_titleForItem___block_invoke;
      v24[3] = &unk_1E63881D0;
      id v17 = v14;
      id v25 = v17;
      int v18 = objc_msgSend(v16, "na_firstObjectPassingTest:", v24);

      id v19 = v18;
      if ([v19 conformsToProtocol:&unk_1F1A3D4E0]) {
        BOOL v20 = v19;
      }
      else {
        BOOL v20 = 0;
      }
      id v21 = v20;

      if (v21)
      {
        uint64_t v22 = [v21 namingComponentForHomeKitObject];

        [v22 name];
      }
      else
      {
        uint64_t v22 = [v19 latestResults];
        [v22 objectForKeyedSubscript:*MEMORY[0x1E4F68AB8]];
      id v6 = };
    }
  }

LABEL_18:

  return v6;
}

uint64_t __56__HUQuickControlGridCollectionItemManager_titleForItem___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  uint64_t v7 = [v6 services];
  uint64_t v8 = [v7 containsObject:*(void *)(a1 + 32)];

  return v8;
}

- (id)headerAccessoryButtonTitleForSection:(unint64_t)a3
{
  id v3 = [(HFItemManager *)self itemSectionForSectionIndex:a3];
  id v4 = [v3 headerAccessoryButtonTitle];

  return v4;
}

- (id)headerAccessoryButtonTargetForSection:(unint64_t)a3
{
  id v3 = [(HFItemManager *)self itemSectionForSectionIndex:a3];
  id v4 = [v3 headerAccessoryButtonDelegate];

  return v4;
}

+ (unint64_t)preferredControlForControlItem:(id)a3 allControlItems:(id)a4 isSupplementary:(BOOL)a5
{
  id v8 = a3;
  int v9 = [a4 allObjects];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __106__HUQuickControlGridCollectionItemManager_preferredControlForControlItem_allControlItems_isSupplementary___block_invoke;
  v13[3] = &__block_descriptor_40_e23_B16__0__HFControlItem_8l;
  v13[4] = a1;
  id v10 = objc_msgSend(v9, "na_filter:", v13);

  LODWORD(a1) = [(id)objc_opt_class() isPrimaryOrBinaryStateControlItem:v8];
  if (!a1 || (unint64_t v11 = 1, (unint64_t)[v10 count] <= 2) && !a5) {
    unint64_t v11 = 0;
  }

  return v11;
}

uint64_t __106__HUQuickControlGridCollectionItemManager_preferredControlForControlItem_allControlItems_isSupplementary___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [(id)objc_opt_class() isPrimaryOrBinaryStateControlItem:v2];

  return v3;
}

+ (BOOL)isPrimaryOrBinaryStateControlItem:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  if (v6)
  {
    uint64_t v7 = [v6 possibleValueSet];
    id v8 = [v7 allValues];
    BOOL v9 = [v8 count] == 2;
  }
  else
  {
    BOOL v9 = 0;
  }
  char v10 = [v4 conformsToProtocol:&unk_1F1AD9090] | v9;

  return v10;
}

+ (unint64_t)specialCaseSectionSortingForControlItem:(id)a3 quickControlContext:(id)a4 fromControlItems:(id)a5 primaryServiceType:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v12 = [a3 valueSource];
  uint64_t v13 = [v12 allServices];

  if ([v13 count] != 1)
  {
    uint64_t v15 = 0;
    goto LABEL_7;
  }
  int v14 = [v13 anyObject];
  uint64_t v15 = [v14 serviceType];

  unint64_t v16 = 0;
  if (v11 && v15)
  {
    if (objc_msgSend((id)objc_msgSend(v9, "quickControlClass"), "isEqual:", objc_opt_class()))
    {
      unint64_t v16 = 3;
      goto LABEL_8;
    }
    int v18 = objc_msgSend(MEMORY[0x1E4F2EA88], "hf_fanServiceTypes");
    int v19 = [v18 containsObject:v11];

    if (v19)
    {
      int v20 = [v15 isEqualToString:*MEMORY[0x1E4F2DE78]];
      int v21 = objc_msgSend((id)objc_msgSend(v9, "quickControlClass"), "isEqual:", objc_opt_class());
      int v22 = objc_msgSend(v10, "na_any:", &__block_literal_global_149);
      if (v20 & v21) == 1 && (v22)
      {
        unint64_t v16 = 2;
        goto LABEL_8;
      }
      if ((v20 & v21 ^ 1 | v22) != 1)
      {
        unint64_t v16 = 1;
        goto LABEL_8;
      }
    }
LABEL_7:
    unint64_t v16 = 0;
  }
LABEL_8:

  return v16;
}

uint64_t __139__HUQuickControlGridCollectionItemManager_specialCaseSectionSortingForControlItem_quickControlContext_fromControlItems_primaryServiceType___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 characteristicOptions];
  id v3 = [v2 allCharacteristicTypes];
  uint64_t v4 = [v3 containsObject:*MEMORY[0x1E4F2CF80]];

  return v4;
}

- (BOOL)_catchAllLayoutForGridViewProfiles:(id)a3 supplementaryViewProfiles:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  unint64_t v7 = [v5 countForObject:objc_opt_class()];
  unint64_t v8 = [v5 countForObject:objc_opt_class()];
  uint64_t v9 = [v5 countForObject:objc_opt_class()];
  unint64_t v10 = [v6 countForObject:objc_opt_class()];
  uint64_t v11 = [v6 countForObject:objc_opt_class()];
  uint64_t v12 = [v6 countForObject:objc_opt_class()];
  if (v9) {
    LODWORD(v9) = [v5 count] != v9;
  }
  if (v8 < 2)
  {
    BOOL v13 = 0;
    if (!v11) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  BOOL v13 = (unint64_t)[v5 count] > 1;
  if (v11) {
LABEL_7:
  }
    LODWORD(v11) = [v6 count] != v11;
LABEL_8:
  if (v10)
  {
    BOOL v14 = [v6 count] != v10;
    if (v12)
    {
LABEL_10:
      BOOL v15 = [v6 count] != v12;
      goto LABEL_13;
    }
  }
  else
  {
    BOOL v14 = 0;
    if (v12) {
      goto LABEL_10;
    }
  }
  BOOL v15 = 0;
LABEL_13:
  if (v7 > 2 || v10 > 1) {
    int v17 = 1;
  }
  else {
    int v17 = v9;
  }
  char v18 = ((v17 | v14 | v11) & 1) != 0 || v13 || v15;

  return v18;
}

- (id)_composeIdentifierForService:(id)a3 section:(unint64_t)a4
{
  id v5 = NSString;
  uint64_t v6 = [a3 uniqueIdentifier];
  unint64_t v7 = (void *)v6;
  unint64_t v8 = HUQuickControlCollectionItemGridSectionID;
  if (a4 != 1) {
    unint64_t v8 = HUQuickControlCollectionItemSupplementarySectionID;
  }
  uint64_t v9 = [v5 stringWithFormat:@"%@-%@", v6, *v8];

  return v9;
}

+ (id)serviceItemComparator
{
  return &__block_literal_global_160;
}

uint64_t __64__HUQuickControlGridCollectionItemManager_serviceItemComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = [v4 service];
  char v7 = [v6 isPrimaryService];

  if (v7)
  {
    uint64_t v8 = -1;
  }
  else
  {
    uint64_t v9 = [v5 service];
    char v10 = [v9 isPrimaryService];

    if (v10)
    {
      uint64_t v8 = 1;
    }
    else
    {
      uint64_t v11 = [v4 service];
      uint64_t v12 = [v11 name];
      BOOL v13 = [v5 service];
      BOOL v14 = [v13 name];
      uint64_t v8 = [v12 compare:v14];
    }
  }

  return v8;
}

- (void)updateSettingValue:(id)a3 forKeyPath:(id)a4
{
  id v8 = a3;
  if ([a4 isEqualToString:*MEMORY[0x1E4F68028]])
  {
    [(HUQuickControlGridCollectionItemManager *)self setAirPlayEnabledSettingNumberValue:v8];
    id v7 = [(HFItemManager *)self reloadAndUpdateAllItemsFromSenderSelector:a2];
  }
}

- (HFItemProvider)supplementaryItemProvider
{
  return self->_supplementaryItemProvider;
}

- (HFItemProvider)overflowItemProvider
{
  return self->_overflowItemProvider;
}

- (HFAccessoryControlItem)accessoryControlItem
{
  return self->_accessoryControlItem;
}

- (void)setAccessoryControlItem:(id)a3
{
}

- (HFServiceLikeItem)sourceServiceLikeItem
{
  return self->_sourceServiceLikeItem;
}

- (void)setSourceServiceLikeItem:(id)a3
{
}

- (NSSet)controlItems
{
  return self->_controlItems;
}

- (void)setControlItems:(id)a3
{
}

- (HFServiceItemProvider)serviceItemProvider
{
  return self->_serviceItemProvider;
}

- (void)setServiceItemProvider:(id)a3
{
}

- (HFItemProvider)controlItemProvider
{
  return self->_controlItemProvider;
}

- (void)setControlItemProvider:(id)a3
{
}

- (NSMapTable)controlItemToQuickControlContextTable
{
  return self->_controlItemToQuickControlContextTable;
}

- (void)setControlItemToQuickControlContextTable:(id)a3
{
}

- (BOOL)isRTL
{
  return self->_isRTL;
}

- (void)setIsRTL:(BOOL)a3
{
  self->_isRTL = a3;
}

- (NSArray)mediaControlItems
{
  return self->_mediaControlItems;
}

- (void)setMediaControlItems:(id)a3
{
}

- (NSNumber)airPlayEnabledSettingNumberValue
{
  return self->_airPlayEnabledSettingNumberValue;
}

- (void)setAirPlayEnabledSettingNumberValue:(id)a3
{
}

- (BOOL)isSpeakerAccessory
{
  return self->_isSpeakerAccessory;
}

- (void)setIsSpeakerAccessory:(BOOL)a3
{
  self->_isSpeakerAccessory = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_airPlayEnabledSettingNumberValue, 0);
  objc_storeStrong((id *)&self->_mediaControlItems, 0);
  objc_storeStrong((id *)&self->_controlItemToQuickControlContextTable, 0);
  objc_storeStrong((id *)&self->_controlItemProvider, 0);
  objc_storeStrong((id *)&self->_serviceItemProvider, 0);
  objc_storeStrong((id *)&self->_controlItems, 0);
  objc_storeStrong((id *)&self->_sourceServiceLikeItem, 0);
  objc_storeStrong((id *)&self->_accessoryControlItem, 0);
  objc_storeStrong((id *)&self->_overflowItemProvider, 0);

  objc_storeStrong((id *)&self->_supplementaryItemProvider, 0);
}

@end