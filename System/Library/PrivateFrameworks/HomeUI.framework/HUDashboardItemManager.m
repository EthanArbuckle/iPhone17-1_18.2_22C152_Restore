@interface HUDashboardItemManager
- (BOOL)isEmptyDashboard;
- (BOOL)isHomeMenuStatusItem:(id)a3;
- (HFAccessoryLikeItemProvider)accessoryLikeItemProvider;
- (HFAccessoryLikeItemProvider)favoritesItemProvider;
- (HFAccessoryLikeItemProvider)speakersAndTVsItemProvider;
- (HFFakeMediaAccessoryItemProvider)fakeSpeakersAndTVsItemProvider;
- (HFPinCodeManager)pinCodeManager;
- (HFProgrammableSwitchItemProvider)programmableSwitchItemProvider;
- (HFReorderableHomeKitItemList)clientReorderableFavoritesList;
- (HFScheduleRuleItemProvider)scheduleRuleItemProvider;
- (HFStaticItem)accessoryNoAccessItem;
- (HFStaticItem)alwaysAllowedScheduleItem;
- (HFStaticItem)contactOwnerItem;
- (HFStaticItem)homeKeyItem;
- (HFStaticItem)pinCodeAccessItem;
- (HFStaticItemProvider)staticItemProvider;
- (HFStaticNonBlockingItemProvider)nonBlockingItemProvider;
- (HUBannerItemModule)bannerItemModule;
- (HUDashboardAccessoryTransformItemProvider)accessoryTransformItemProvider;
- (HUDashboardActionSetItemModule)actionSetItemModule;
- (HUDashboardCameraItemModule)cameraItemModule;
- (HUDashboardContext)context;
- (HUDashboardItemManager)initWithContext:(id)a3 delegate:(id)a4;
- (HUDashboardItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4;
- (HUDashboardItemManagerDelegate)dashboardDelegate;
- (HUDashboardTipModule)tipItemModule;
- (HUEnergyDashboardItemModule)energyDashboardItemModule;
- (HUServicePlaceholderItemModule)servicePlaceholderItemModule;
- (HUStatusItemModule)statusItemModule;
- (NSMutableDictionary)clientReorderableServiceByTypeList;
- (NSMutableDictionary)clientReorderableServiceListByRoom;
- (NSSet)homeMenuStatusItems;
- (id)_buildAccessoryCategorySectionsWithItems:(id)a3;
- (id)_buildFavoritesSectionWithFavoriteItems:(id)a3;
- (id)_buildItemModulesForHome:(id)a3;
- (id)_buildItemProvidersForHome:(id)a3;
- (id)_buildNowPlayingSectionWithItems:(id)a3 forRouteIdentifier:(id)a4;
- (id)_buildRoomSectionsWithItems:(id)a3;
- (id)_buildSectionsWithDisplayedItems:(id)a3;
- (id)_buildSingleAccessoryGroupSectionWithItems:(id)a3 allDisplayedItems:(id)a4;
- (id)_buildStaticItemsForHome:(id)a3;
- (id)_homeOwnerName;
- (id)_itemSectionForRoom:(id)a3;
- (id)_itemsToHideInSet:(id)a3;
- (id)_itemsToUpdateWhenApplicationDidBecomeActive;
- (id)buildItemForHomeKitObject:(id)a3;
- (id)itemModuleForSectionIdentifier:(id)a3;
- (id)matchingItemForHomeKitObject:(id)a3;
- (id)reorderableFavoritesList;
- (id)reorderableServiceListForRoom:(id)a3;
- (id)reorderableServiceListForType:(id)a3;
- (unint64_t)getHomeButtonBadgeCount;
- (void)_didFinishUpdateTransactionWithAffectedItems:(id)a3;
- (void)_registerForExternalUpdates;
- (void)_unregisterForExternalUpdates;
- (void)_updateHomeDashboardWithHome:(id)a3;
- (void)dealloc;
- (void)home:(id)a3 didAddRoom:(id)a4;
- (void)home:(id)a3 didRemoveRoom:(id)a4;
- (void)homeDidUpdateAccessControlForCurrentUser:(id)a3;
- (void)homeDidUpdateApplicationData:(id)a3;
- (void)homeDidUpdateHomeLocationStatus:(id)a3;
- (void)pinCodeManagerDidUpdate:(id)a3 pinCodes:(id)a4;
- (void)restrictedGuestAllowedPeriodEnded:(id)a3;
- (void)restrictedGuestAllowedPeriodStarted:(id)a3;
- (void)setAccessoryLikeItemProvider:(id)a3;
- (void)setAccessoryNoAccessItem:(id)a3;
- (void)setAccessoryTransformItemProvider:(id)a3;
- (void)setActionSetItemModule:(id)a3;
- (void)setAlwaysAllowedScheduleItem:(id)a3;
- (void)setBannerItemModule:(id)a3;
- (void)setCameraItemModule:(id)a3;
- (void)setClientReorderableFavoritesList:(id)a3;
- (void)setClientReorderableServiceByTypeList:(id)a3;
- (void)setClientReorderableServiceListByRoom:(id)a3;
- (void)setContactOwnerItem:(id)a3;
- (void)setDashboardDelegate:(id)a3;
- (void)setEnergyDashboardItemModule:(id)a3;
- (void)setFakeSpeakersAndTVsItemProvider:(id)a3;
- (void)setFavoritesItemProvider:(id)a3;
- (void)setHome:(id)a3;
- (void)setHomeKeyItem:(id)a3;
- (void)setNonBlockingItemProvider:(id)a3;
- (void)setPinCodeAccessItem:(id)a3;
- (void)setPinCodeManager:(id)a3;
- (void)setProgrammableSwitchItemProvider:(id)a3;
- (void)setReorderableServiceList:(id)a3 forRoom:(id)a4;
- (void)setReorderableServiceList:(id)a3 forType:(id)a4;
- (void)setScheduleRuleItemProvider:(id)a3;
- (void)setServicePlaceholderItemModule:(id)a3;
- (void)setSpeakersAndTVsItemProvider:(id)a3;
- (void)setStaticItemProvider:(id)a3;
- (void)setStatusItemModule:(id)a3;
- (void)setTipItemModule:(id)a3;
- (void)updateItemSectionHeaderTitleForRoom:(id)a3;
@end

@implementation HUDashboardItemManager

uint64_t __71__HUDashboardItemManager__didFinishUpdateTransactionWithAffectedItems___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) isHomeMenuStatusItem:a2];
}

- (HUDashboardContext)context
{
  return self->_context;
}

uint64_t __59__HUDashboardItemManager__buildSectionsWithDisplayedItems___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  v4 = [v2 context];
  v5 = [v3 identifier];

  uint64_t v6 = [v4 shouldHideSectionWithIdentifier:v5] ^ 1;
  return v6;
}

id __54__HUDashboardItemManager__buildRoomSectionsWithItems___block_invoke(uint64_t a1, void *a2)
{
  id v3 = HUDashboardRoomSectionIdentifierForRoom(a2);
  v4 = [*(id *)(a1 + 32) context];
  char v5 = [v4 shouldHideSectionWithIdentifier:v3];

  if (v5) {
    id v6 = 0;
  }
  else {
    id v6 = v3;
  }

  return v6;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  v130[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = [MEMORY[0x1E4F1CA48] array];
  id v6 = [(HUDashboardItemManager *)self context];
  char v7 = [v6 shouldHideSectionWithIdentifier:@"bannersSection"];

  if ((v7 & 1) == 0)
  {
    v8 = [(HUDashboardItemManager *)self bannerItemModule];
    v9 = [v8 buildSectionsWithDisplayedItems:v4];

    objc_msgSend(v5, "na_safeAddObjectsFromArray:", v9);
  }
  v10 = [(HUDashboardItemManager *)self context];
  char v11 = [v10 shouldHideSectionWithIdentifier:@"statusSection"];

  if ((v11 & 1) == 0)
  {
    v12 = [(HUDashboardItemManager *)self statusItemModule];
    v13 = [v12 buildSectionsWithDisplayedItems:v4];

    objc_msgSend(v5, "na_safeAddObjectsFromArray:", v13);
  }
  v14 = [(HUDashboardItemManager *)self context];
  char v15 = [v14 shouldHideSectionWithIdentifier:@"tipsSection"];

  if (v15)
  {
    v16 = 0;
  }
  else
  {
    v17 = [(HUDashboardItemManager *)self tipItemModule];
    v16 = [v17 buildSectionsWithDisplayedItems:v4];
  }
  v18 = [(HUDashboardItemManager *)self energyDashboardItemModule];
  v19 = [v18 buildSectionsWithDisplayedItems:v4];

  v125[0] = MEMORY[0x1E4F143A8];
  v125[1] = 3221225472;
  v125[2] = __59__HUDashboardItemManager__buildSectionsWithDisplayedItems___block_invoke;
  v125[3] = &unk_1E638BEA0;
  v125[4] = self;
  uint64_t v20 = objc_msgSend(v19, "na_filter:", v125);

  v116 = (void *)v20;
  objc_msgSend(v5, "na_safeAddObjectsFromArray:", v20);
  v21 = [MEMORY[0x1E4F1CA48] array];
  v22 = [(HUDashboardItemManager *)self context];
  if (([v22 shouldHideSectionWithIdentifier:@"camerasSection"] & 1) == 0)
  {
    v23 = [(HUDashboardItemManager *)self context];
    uint64_t v24 = [v23 cameraPresentationStyle];

    if (v24 != 1) {
      goto LABEL_12;
    }
    v25 = [(HUDashboardItemManager *)self cameraItemModule];
    v22 = [v25 buildSectionsWithDisplayedItems:v4];

    objc_msgSend(v21, "na_safeAddObjectsFromArray:", v22);
  }

LABEL_12:
  v26 = [(HUDashboardItemManager *)self context];
  char v27 = [v26 shouldHideSectionWithIdentifier:@"scenesSection"];

  if ((v27 & 1) == 0)
  {
    v28 = [(HUDashboardItemManager *)self actionSetItemModule];
    v29 = [v28 buildSectionsWithDisplayedItems:v4];

    objc_msgSend(v21, "na_safeAddObjectsFromArray:", v29);
  }
  if (_os_feature_enabled_impl())
  {
    v30 = [(HUDashboardItemManager *)self context];
    char v31 = [v30 shouldHideSectionWithIdentifier:@"NowPlayingSection"];

    if ((v31 & 1) == 0)
    {
      v32 = (void *)MEMORY[0x1E4F77090];
      v122[0] = MEMORY[0x1E4F143A8];
      v122[1] = 3221225472;
      v122[2] = __59__HUDashboardItemManager__buildSectionsWithDisplayedItems___block_invoke_2;
      v122[3] = &unk_1E638BEC8;
      v122[4] = self;
      id v123 = v4;
      id v124 = v5;
      [v32 homePlatterPreferredRouteIdentifier:v122];
    }
  }
  v33 = [(HUDashboardItemManager *)self accessoryTransformItemProvider];
  v34 = [v33 items];
  v35 = (void *)[v34 mutableCopy];

  v36 = [(HUDashboardItemManager *)self programmableSwitchItemProvider];
  uint64_t v37 = [v36 items];
  [v35 unionSet:v37];

  v115 = v35;
  v38 = objc_msgSend(v35, "na_setByIntersectingWithSet:", v4);
  v39 = [(HUDashboardItemManager *)self context];
  LOBYTE(v37) = [v39 shouldHideSectionWithIdentifier:@"favoritesSection"];

  if ((v37 & 1) == 0)
  {
    v40 = [(HUDashboardItemManager *)self favoritesItemProvider];
    v41 = [v40 items];
    v42 = objc_msgSend(v41, "na_setByIntersectingWithSet:", v4);

    v43 = [(HUDashboardItemManager *)self _buildFavoritesSectionWithFavoriteItems:v42];
    objc_msgSend(v21, "na_safeAddObjectsFromArray:", v43);
  }
  v44 = [(HUDashboardItemManager *)self context];
  uint64_t v45 = [v44 accessoryGroupingStyle];

  if (v45 == 2)
  {
    v121[0] = MEMORY[0x1E4F143A8];
    v121[1] = 3221225472;
    v121[2] = __59__HUDashboardItemManager__buildSectionsWithDisplayedItems___block_invoke_314;
    v121[3] = &unk_1E63881D0;
    v121[4] = self;
    v46 = objc_msgSend(v38, "na_filter:", v121);
    v47 = [(HUDashboardItemManager *)self _buildRoomSectionsWithItems:v46];
    [v21 addObjectsFromArray:v47];
  }
  v48 = [(HUDashboardItemManager *)self context];
  uint64_t v49 = [v48 accessoryGroupingStyle];

  if (v49 == 3)
  {
    v50 = [(HUDashboardItemManager *)self _buildAccessoryCategorySectionsWithItems:v38];
    [v21 addObjectsFromArray:v50];
  }
  v51 = [(HUDashboardItemManager *)self context];
  char v52 = [v51 shouldHideSectionWithIdentifier:@"AllAccessoriesSection"];

  if ((v52 & 1) == 0)
  {
    v53 = [(HUDashboardItemManager *)self _buildSingleAccessoryGroupSectionWithItems:v38 allDisplayedItems:v4];
    [v21 addObject:v53];
  }
  v54 = [(HUDashboardItemManager *)self context];
  v55 = [v54 room];

  id v56 = objc_alloc(MEMORY[0x1E4F29008]);
  v119 = v16;
  if (v55)
  {
    v57 = [(HUDashboardItemManager *)self context];
    v58 = [v57 room];
    v59 = objc_msgSend(v58, "hf_dashboardSectionReorderableUUIDStringComparator");
    v60 = (void *)[v56 initWithKey:@"identifier" ascending:1 comparator:v59];

    v16 = v119;
  }
  else
  {
    v57 = [(HFItemManager *)self home];
    v58 = objc_msgSend(v57, "hf_dashboardSectionReorderableUUIDStringComparator");
    v60 = (void *)[v56 initWithKey:@"identifier" ascending:1 comparator:v58];
  }

  v130[0] = v60;
  v61 = [MEMORY[0x1E4F1C978] arrayWithObjects:v130 count:1];
  [v21 sortUsingDescriptors:v61];

  objc_msgSend(v5, "na_safeAddObjectsFromArray:", v21);
  if (v16)
  {
    v120[0] = MEMORY[0x1E4F143A8];
    v120[1] = 3221225472;
    v120[2] = __59__HUDashboardItemManager__buildSectionsWithDisplayedItems___block_invoke_2_320;
    v120[3] = &unk_1E638BEF0;
    v120[4] = self;
    unint64_t v62 = [v5 indexOfObjectPassingTest:v120];
    if (v62 < [v5 count])
    {
      v63 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", v62 + 1, objc_msgSend(v16, "count"));
      [v5 insertObjects:v16 atIndexes:v63];
    }
  }
  v64 = [(HUDashboardItemManager *)self context];
  if (([v64 shouldHideSectionWithIdentifier:@"camerasSection"] & 1) == 0)
  {
    v65 = [(HUDashboardItemManager *)self context];
    uint64_t v66 = [v65 cameraPresentationStyle];

    if (v66 != 2) {
      goto LABEL_35;
    }
    v67 = [(HUDashboardItemManager *)self cameraItemModule];
    v64 = [v67 buildSectionsWithDisplayedItems:v4];

    objc_msgSend(v5, "na_safeAddObjectsFromArray:", v64);
  }

LABEL_35:
  v68 = [(HUDashboardItemManager *)self context];
  char v69 = [v68 shouldHideSectionWithIdentifier:@"GuestAccessSection"];

  v117 = v38;
  if (v69) {
    goto LABEL_48;
  }
  v70 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"GuestAccessSection"];
  v71 = _HULocalizedStringWithDefaultValue(@"HUDashboardSection_GuestAccess_Title", @"HUDashboardSection_GuestAccess_Title", 1);
  [v70 setHeaderTitle:v71];

  v72 = [(HUDashboardItemManager *)self scheduleRuleItemProvider];
  v73 = [v72 items];
  int v74 = [v4 intersectsSet:v73];

  v118 = v70;
  if (v74)
  {
    v114 = [(HUDashboardItemManager *)self scheduleRuleItemProvider];
    v75 = [v114 items];
    v76 = [v75 allObjects];
    v77 = [MEMORY[0x1E4F694D8] sortComparatorForScheduleRules];
    [v76 sortedArrayUsingComparator:v77];
    v78 = v5;
    id v79 = v4;
    v80 = v21;
    v82 = v81 = v60;
    [v70 setItems:v82];

    v60 = v81;
    v21 = v80;
    id v4 = v79;
    char v5 = v78;
    v83 = v114;

    v38 = v117;
    unint64_t v84 = 0x1E4F1C000;
LABEL_40:

    goto LABEL_41;
  }
  v85 = [(HUDashboardItemManager *)self alwaysAllowedScheduleItem];
  int v86 = [v4 containsObject:v85];

  unint64_t v84 = 0x1E4F1C000uLL;
  if (v86)
  {
    v83 = [(HUDashboardItemManager *)self alwaysAllowedScheduleItem];
    v129 = v83;
    v75 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v129 count:1];
    [v118 setItems:v75];
    goto LABEL_40;
  }
LABEL_41:
  v87 = [(HUDashboardItemManager *)self pinCodeAccessItem];
  int v88 = [v4 containsObject:v87];

  v89 = v118;
  if (v88)
  {
    v90 = [v118 items];
    v91 = [(HUDashboardItemManager *)self pinCodeAccessItem];
    v128 = v91;
    v92 = [*(id *)(v84 + 2424) arrayWithObjects:&v128 count:1];
    v93 = [v90 arrayByAddingObjectsFromArray:v92];
    [v118 setItems:v93];

    v89 = v118;
    v38 = v117;
  }
  v94 = [(HUDashboardItemManager *)self homeKeyItem];
  int v95 = [v4 containsObject:v94];

  if (v95)
  {
    v96 = [v89 items];
    v97 = [(HUDashboardItemManager *)self homeKeyItem];
    v127 = v97;
    v98 = [*(id *)(v84 + 2424) arrayWithObjects:&v127 count:1];
    v99 = [v96 arrayByAddingObjectsFromArray:v98];
    [v118 setItems:v99];

    v89 = v118;
    v38 = v117;
  }
  v100 = [(HUDashboardItemManager *)self contactOwnerItem];
  int v101 = [v4 containsObject:v100];

  if (v101)
  {
    v102 = [v89 items];
    v103 = [(HUDashboardItemManager *)self contactOwnerItem];
    v126 = v103;
    v104 = [*(id *)(v84 + 2424) arrayWithObjects:&v126 count:1];
    v105 = [v102 arrayByAddingObjectsFromArray:v104];
    [v118 setItems:v105];

    v89 = v118;
    v38 = v117;
  }
  objc_msgSend(v5, "na_safeAddObject:", v89);

LABEL_48:
  v106 = objc_msgSend(v5, "na_firstObjectPassingTest:", &__block_literal_global_328);
  if (v106)
  {
    [v5 removeObject:v106];
    [v5 addObject:v106];
  }
  v107 = [(HUDashboardItemManager *)self context];
  if ([v107 shouldHideSectionWithIdentifier:@"servicePlaceholder"]) {
    goto LABEL_55;
  }
  v108 = [(HFItemManager *)self home];
  if (objc_msgSend(v108, "hf_hasVisibleAccessories"))
  {

LABEL_55:
    goto LABEL_56;
  }
  v109 = [(HUDashboardItemManager *)self context];
  char v110 = [v109 shouldHidePlaceholderService];

  v38 = v117;
  if ((v110 & 1) == 0)
  {
    v111 = [(HUDashboardItemManager *)self servicePlaceholderItemModule];
    v107 = [v111 buildSectionsWithDisplayedItems:v4];

    objc_msgSend(v5, "na_safeAddObjectsFromArray:", v107);
    goto LABEL_55;
  }
LABEL_56:
  id v112 = v5;

  return v112;
}

- (HUBannerItemModule)bannerItemModule
{
  return self->_bannerItemModule;
}

- (BOOL)isEmptyDashboard
{
  id v3 = [(HUDashboardItemManager *)self context];
  id v4 = [v3 room];

  if (v4)
  {
    uint64_t v5 = [(HUDashboardItemManager *)self context];
    id v6 = [(id)v5 room];
    char v7 = objc_msgSend(v6, "hf_visibleAccessories");

    LODWORD(v5) = objc_msgSend(v7, "na_all:", &__block_literal_global_129);
    v8 = [(HUDashboardItemManager *)self context];
    v9 = [v8 room];
    int v10 = objc_msgSend(v9, "hf_hasVisibleAccessories") ^ 1 | v5;
  }
  else
  {
    char v7 = [(HFItemManager *)self home];
    int v10 = objc_msgSend(v7, "hf_hasVisibleAccessories") ^ 1;
  }

  return v10;
}

- (HFProgrammableSwitchItemProvider)programmableSwitchItemProvider
{
  return self->_programmableSwitchItemProvider;
}

- (HFAccessoryLikeItemProvider)favoritesItemProvider
{
  return self->_favoritesItemProvider;
}

- (HUDashboardAccessoryTransformItemProvider)accessoryTransformItemProvider
{
  return self->_accessoryTransformItemProvider;
}

- (id)_itemsToHideInSet:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)HUDashboardItemManager;
  id v4 = a3;
  uint64_t v5 = [(HFItemManager *)&v10 _itemsToHideInSet:v4];
  id v6 = objc_msgSend(v5, "mutableCopy", v10.receiver, v10.super_class);

  char v7 = [(HUDashboardItemManager *)self homeMenuStatusItems];
  v8 = objc_msgSend(v4, "na_setByIntersectingWithSet:", v7);

  [v6 unionSet:v8];

  return v6;
}

- (NSSet)homeMenuStatusItems
{
  id v3 = [(HUDashboardItemManager *)self statusItemModule];
  id v4 = [v3 allItems];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__HUDashboardItemManager_homeMenuStatusItems__block_invoke;
  v7[3] = &unk_1E6386108;
  v7[4] = self;
  uint64_t v5 = objc_msgSend(v4, "na_filter:", v7);

  return (NSSet *)v5;
}

- (HUStatusItemModule)statusItemModule
{
  return self->_statusItemModule;
}

- (HUDashboardTipModule)tipItemModule
{
  return self->_tipItemModule;
}

- (HUEnergyDashboardItemModule)energyDashboardItemModule
{
  return self->_energyDashboardItemModule;
}

- (HUDashboardCameraItemModule)cameraItemModule
{
  return self->_cameraItemModule;
}

- (HUDashboardActionSetItemModule)actionSetItemModule
{
  return self->_actionSetItemModule;
}

- (id)_buildRoomSectionsWithItems:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x1E4F68E38];
  id v6 = [v4 allObjects];
  char v7 = [(HFItemManager *)self home];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __54__HUDashboardItemManager__buildRoomSectionsWithItems___block_invoke;
  v13[3] = &unk_1E638BF40;
  v13[4] = self;
  v8 = [v5 createRoomSectionsWithItems:v6 inHome:v7 sectionIdentifierBlock:v13];

  v9 = [(HUDashboardItemManager *)self context];
  LODWORD(v6) = [v9 shouldHideEmptySections];

  if (v6)
  {
    id v10 = [MEMORY[0x1E4F69220] filterSections:v8 toDisplayedItems:v4];
  }
  else
  {
    id v10 = v8;
  }
  char v11 = v10;

  return v11;
}

- (id)_buildFavoritesSectionWithFavoriteItems:(id)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v4 = (objc_class *)MEMORY[0x1E4F692E8];
  id v5 = a3;
  id v6 = (void *)[[v4 alloc] initWithIdentifier:@"favoritesSection"];
  char v7 = _HULocalizedStringWithDefaultValue(@"HUDashboardFavoritesHeaderTitle", @"HUDashboardFavoritesHeaderTitle", 1);
  [v6 setHeaderTitle:v7];

  v8 = [(HUDashboardItemManager *)self reorderableFavoritesList];
  v9 = [v8 sortedHomeKitItemComparator];
  if (!v8)
  {
    v17.receiver = self;
    v17.super_class = (Class)HUDashboardItemManager;
    uint64_t v10 = [(HFItemManager *)&v17 _comparatorForSectionIdentifier:@"favoritesSection"];

    v9 = (void *)v10;
  }
  char v11 = [v5 allObjects];
  v12 = [v11 sortedArrayUsingComparator:v9];
  [v6 setItems:v12];

  v13 = (void *)MEMORY[0x1E4F69220];
  v18[0] = v6;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
  char v15 = [v13 filterSections:v14 toDisplayedItems:v5];

  return v15;
}

- (id)reorderableFavoritesList
{
  id v3 = [(HUDashboardItemManager *)self clientReorderableFavoritesList];

  if (v3)
  {
    id v4 = [(HUDashboardItemManager *)self clientReorderableFavoritesList];
  }
  else
  {
    objc_opt_class();
    id v5 = [(HFItemManager *)self sourceItem];
    id v6 = [v5 latestResults];
    char v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F68A48]];
    if (objc_opt_isKindOfClass()) {
      v8 = v7;
    }
    else {
      v8 = 0;
    }
    id v4 = v8;
  }

  return v4;
}

- (HFReorderableHomeKitItemList)clientReorderableFavoritesList
{
  return self->_clientReorderableFavoritesList;
}

void __71__HUDashboardItemManager__didFinishUpdateTransactionWithAffectedItems___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 supportsReordering]) {
    [v2 setReorderableHomeKitItemList:0];
  }
}

uint64_t __59__HUDashboardItemManager__buildSectionsWithDisplayedItems___block_invoke_314(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 conformsToProtocol:&unk_1F1A3D190]) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;
  id v6 = [*(id *)(a1 + 32) context];
  int v7 = [v6 shouldHideInRoomSectionForAccessoryRepresentableItem:v5];

  return v7 ^ 1u;
}

uint64_t __59__HUDashboardItemManager__buildSectionsWithDisplayedItems___block_invoke_2_320(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  int v7 = [v6 identifier];
  char v8 = [v7 isEqual:@"favoritesSection"];

  if (v8)
  {
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v10 = [v6 items];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __59__HUDashboardItemManager__buildSectionsWithDisplayedItems___block_invoke_3;
    v12[3] = &unk_1E6386108;
    v12[4] = *(void *)(a1 + 32);
    uint64_t v9 = objc_msgSend(v10, "na_any:", v12);

    if (v9) {
      *a4 = 1;
    }
  }

  return v9;
}

uint64_t __59__HUDashboardItemManager__buildSectionsWithDisplayedItems___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = [a2 identifier];
  id v3 = HUAccessoryTypeGroupForDashboardSectionIdentifier(v2);
  id v4 = [MEMORY[0x1E4F68EA0] otherAccessoryTypeGroup];
  uint64_t v5 = [v3 isEqual:v4];

  return v5;
}

BOOL __59__HUDashboardItemManager__buildSectionsWithDisplayedItems___block_invoke_3(uint64_t a1, uint64_t a2)
{
  id v2 = [*(id *)(a1 + 32) childItemsForItem:a2];
  id v3 = objc_msgSend(MEMORY[0x1E4F69098], "hu_preferredToggleableControlItemInControlItems:", v2);
  BOOL v4 = v3 != 0;

  return v4;
}

uint64_t __45__HUDashboardItemManager_homeMenuStatusItems__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) isHomeMenuStatusItem:v3])
  {
    BOOL v4 = [v3 latestResults];
    uint64_t v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F68B10]];
    uint64_t v6 = [v5 BOOLValue] ^ 1;
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (BOOL)isHomeMenuStatusItem:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = v5;

  if (v6)
  {
    int v7 = objc_msgSend(MEMORY[0x1E4F695E0], "hu_homeMenuStatusItemClasses");
    char v8 = [v7 containsObject:objc_opt_class()];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

uint64_t __53__HUDashboardItemManager__buildItemProvidersForHome___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  uint64_t v5 = [WeakRetained context];
  uint64_t v6 = [v5 accessoryRepresentableHasStandardTileRepresentation:v3];

  return v6;
}

uint64_t __53__HUDashboardItemManager__buildItemProvidersForHome___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = [WeakRetained context];
  char v6 = [v5 shouldHideAccessoryRepresentable:v3];

  if (v6) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = objc_msgSend(v3, "hf_isFavorite");
  }

  return v7;
}

- (void)_didFinishUpdateTransactionWithAffectedItems:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HUDashboardItemManager;
  [(HFItemManager *)&v11 _didFinishUpdateTransactionWithAffectedItems:v4];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __71__HUDashboardItemManager__didFinishUpdateTransactionWithAffectedItems___block_invoke;
  v10[3] = &unk_1E6386108;
  v10[4] = self;
  uint64_t v5 = objc_msgSend(v4, "na_filter:", v10);
  if ([v5 count])
  {
    char v6 = [(HUDashboardItemManager *)self dashboardDelegate];
    [v6 dashboardItemManager:self didUpdateHomeMenuStatusItems:v5];
  }
  uint64_t v7 = [(HFItemManager *)self sourceItem];
  int v8 = [v4 containsObject:v7];

  if (v8)
  {
    uint64_t v9 = [(HFItemManager *)self itemModules];
    objc_msgSend(v9, "na_each:", &__block_literal_global_358);
  }
}

- (unint64_t)getHomeButtonBadgeCount
{
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  id v3 = [MEMORY[0x1E4F691A0] sharedDispatcher];
  id v4 = [v3 homeManager];
  uint64_t v5 = [v4 incomingHomeInvitations];
  uint64_t v6 = [v5 count];

  uint64_t v16 = v6;
  objc_initWeak(&location, self);
  uint64_t v7 = [(HUDashboardItemManager *)self homeMenuStatusItems];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __49__HUDashboardItemManager_getHomeButtonBadgeCount__block_invoke;
  v10[3] = &unk_1E638BD60;
  objc_copyWeak(&v11, &location);
  v10[4] = &v13;
  objc_msgSend(v7, "na_each:", v10);

  unint64_t v8 = v14[3];
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v13, 8);
  return v8;
}

- (HUDashboardItemManagerDelegate)dashboardDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dashboardDelegate);

  return (HUDashboardItemManagerDelegate *)WeakRetained;
}

- (void)_unregisterForExternalUpdates
{
  v4.receiver = self;
  v4.super_class = (Class)HUDashboardItemManager;
  [(HFItemManager *)&v4 _unregisterForExternalUpdates];
  id v3 = [(HUDashboardItemManager *)self pinCodeManager];
  [v3 removeObserver:self];
}

- (void)_registerForExternalUpdates
{
  v4.receiver = self;
  v4.super_class = (Class)HUDashboardItemManager;
  [(HFItemManager *)&v4 _registerForExternalUpdates];
  id v3 = [(HUDashboardItemManager *)self pinCodeManager];
  [v3 addObserver:self];
}

- (HFPinCodeManager)pinCodeManager
{
  return self->_pinCodeManager;
}

- (id)_itemsToUpdateWhenApplicationDidBecomeActive
{
  id v2 = (void *)MEMORY[0x1E4F1CAD0];
  id v3 = [(HUDashboardItemManager *)self bannerItemModule];
  objc_super v4 = [v3 bannerItemProvider];
  uint64_t v5 = [v4 setupBannerItem];
  uint64_t v6 = objc_msgSend(v2, "na_setWithSafeObject:", v5);

  return v6;
}

- (void)setDashboardDelegate:(id)a3
{
}

- (HUDashboardItemManager)initWithContext:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)HUDashboardItemManager;
  uint64_t v9 = [(HFItemManager *)&v22 initWithDelegate:v8 sourceItem:0];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_context, a3);
    objc_storeWeak((id *)&v10->_dashboardDelegate, v8);
    id v11 = [(HFItemModule *)[HUServicePlaceholderItemModule alloc] initWithItemUpdater:v10];
    servicePlaceholderItemModule = v10->_servicePlaceholderItemModule;
    v10->_servicePlaceholderItemModule = v11;

    uint64_t v13 = [(HUDashboardItemManager *)v10 context];
    v14 = [v13 home];
    int v15 = objc_msgSend(v14, "hf_currentUserIsRestrictedGuest");

    if (v15)
    {
      uint64_t v16 = [MEMORY[0x1E4F691A0] sharedDispatcher];
      objc_super v17 = [(HUDashboardItemManager *)v10 context];
      v18 = [v17 home];
      uint64_t v19 = [v16 pinCodeManagerForHome:v18];
      pinCodeManager = v10->_pinCodeManager;
      v10->_pinCodeManager = (HFPinCodeManager *)v19;
    }
  }

  return v10;
}

id __51__HUDashboardItemManager__buildStaticItemsForHome___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_opt_new();
  id v3 = [WeakRetained context];
  objc_super v4 = [v3 home];
  if (objc_msgSend(v4, "hf_currentUserIsRestrictedGuest"))
  {
    uint64_t v5 = [WeakRetained context];
    uint64_t v6 = [v5 home];
    char v7 = objc_msgSend(v6, "hf_isCurrentUserInRestrictedGuestAllowedPeriod");

    if ((v7 & 1) == 0)
    {
      id v8 = _HULocalizedStringWithDefaultValue(@"HUDashboardSection_Accessories_NoAccess_OutOfSchedule_Title", @"HUDashboardSection_Accessories_NoAccess_OutOfSchedule_Title", 1);
      uint64_t v9 = @"HUDashboardSection_Accessories_NoAccess_OutOfSchedule_Description";
LABEL_7:
      uint64_t v13 = _HULocalizedStringWithDefaultValue(v9, v9, 1);
      goto LABEL_9;
    }
  }
  else
  {
  }
  uint64_t v10 = [WeakRetained context];
  id v11 = [v10 home];
  int v12 = objc_msgSend(v11, "hf_isCurrentRestrictedGuestAwayFromHome");

  if (v12)
  {
    id v8 = _HULocalizedStringWithDefaultValue(@"HUDashboardSection_Accessories_NoAccess_AwayFromHome_Title", @"HUDashboardSection_Accessories_NoAccess_AwayFromHome_Title", 1);
    uint64_t v9 = @"HUDashboardSection_Accessories_NoAccess_AwayFromHome_Description";
    goto LABEL_7;
  }
  id v8 = 0;
  uint64_t v13 = 0;
LABEL_9:
  [v2 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];
  [v2 setObject:v13 forKeyedSubscript:*MEMORY[0x1E4F68980]];
  [v2 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F68A18]];
  v14 = [WeakRetained context];
  int v15 = [v14 home];
  int v16 = objc_msgSend(v15, "hf_shouldBlockCurrentRestrictedGuestFromHome");

  objc_super v17 = [NSNumber numberWithBool:v16 ^ 1u];
  [v2 setObject:v17 forKeyedSubscript:*MEMORY[0x1E4F68B10]];

  v18 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v19 = objc_opt_class();
  uint64_t v20 = objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
  [v2 setObject:v20 forKeyedSubscript:*MEMORY[0x1E4F68900]];

  v21 = [MEMORY[0x1E4F7A0D8] futureWithResult:v2];

  return v21;
}

id __51__HUDashboardItemManager__buildStaticItemsForHome___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_opt_new();
  id v3 = [MEMORY[0x1E4F694D8] localizedStringFromScheduleType:0];
  [v2 setObject:v3 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];

  objc_super v4 = (void *)[objc_alloc(MEMORY[0x1E4F691D0]) initWithSystemImageNamed:@"calendar.badge.clock"];
  [v2 setObject:v4 forKeyedSubscript:*MEMORY[0x1E4F689E8]];
  [v2 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F689C0]];
  uint64_t v5 = NSNumber;
  uint64_t v6 = [WeakRetained context];
  char v7 = [v6 home];
  id v8 = objc_msgSend(v5, "numberWithInt:", objc_msgSend(v7, "hf_currentUserIsRestrictedGuest") ^ 1);
  [v2 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F68B10]];

  uint64_t v9 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v10 = objc_opt_class();
  id v11 = objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  [v2 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4F68900]];

  int v12 = [MEMORY[0x1E4F7A0D8] futureWithResult:v2];

  return v12;
}

id __51__HUDashboardItemManager__buildStaticItemsForHome___block_invoke_284(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_opt_new();
  id v3 = [WeakRetained _homeOwnerName];
  if (![v3 length]) {
    goto LABEL_3;
  }
  objc_super v4 = [WeakRetained context];
  uint64_t v5 = [v4 home];
  uint64_t v6 = [v5 owner];
  char v7 = [v6 userID];
  int v8 = [v3 isEqualToString:v7];

  if (!v8)
  {
    uint64_t v15 = HULocalizedStringWithFormat(@"HURestrictedGuestAccess_ContactOwner_WithName_Button_Title", @"%@", v9, v10, v11, v12, v13, v14, (uint64_t)v3);
  }
  else
  {
LABEL_3:
    uint64_t v15 = _HULocalizedStringWithDefaultValue(@"HURestrictedGuestAccess_ContactOwner_Button_Title", @"HURestrictedGuestAccess_ContactOwner_Button_Title", 1);
  }
  int v16 = (void *)v15;
  [v2 setObject:v15 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];

  [v2 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F689C0]];
  objc_super v17 = NSNumber;
  v18 = [WeakRetained context];
  uint64_t v19 = [v18 home];
  uint64_t v20 = objc_msgSend(v17, "numberWithInt:", objc_msgSend(v19, "hf_currentUserIsRestrictedGuest") ^ 1);
  [v2 setObject:v20 forKeyedSubscript:*MEMORY[0x1E4F68B10]];

  v21 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v22 = objc_opt_class();
  v23 = objc_msgSend(v21, "setWithObjects:", v22, objc_opt_class(), 0);
  [v2 setObject:v23 forKeyedSubscript:*MEMORY[0x1E4F68900]];

  uint64_t v24 = [MEMORY[0x1E4F7A0D8] futureWithResult:v2];

  return v24;
}

- (id)_homeOwnerName
{
  v15[1] = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F69758] isInternalTest])
  {
    id v3 = HFLogForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v14 = 0;
      _os_log_impl(&dword_1BE345000, v3, OS_LOG_TYPE_INFO, "Skipping home owner name lookup as this is an internal unit test", v14, 2u);
    }
    objc_super v4 = 0;
  }
  else
  {
    uint64_t v5 = [(HUDashboardItemManager *)self context];
    id v3 = [v5 home];

    uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F69720]) initWithHome:v3];
    [v6 setStyle:1];
    char v7 = [v3 owner];
    int v8 = [v3 hf_handleForUser:v7];

    if ([MEMORY[0x1E4F69758] isAMac])
    {
      uint64_t v9 = [MEMORY[0x1E4F1B910] descriptorForRequiredKeysForStyle:1000];
      v15[0] = v9;
      uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];

      uint64_t v11 = [MEMORY[0x1E4F69090] defaultStore];
      uint64_t v12 = [v11 contactForUserHandle:v8 withKeys:v10];

      objc_super v4 = [MEMORY[0x1E4F1B910] stringFromContact:v12 style:1000];
    }
    else
    {
      objc_super v4 = [v6 stringForObjectValue:v8];
    }
  }

  return v4;
}

- (id)_buildItemProvidersForHome:(id)a3
{
  v91[1] = *MEMORY[0x1E4F143B8];
  id v81 = a3;
  uint64_t v5 = [(HUDashboardItemManager *)self context];
  uint64_t v6 = [v5 room];

  if (v6)
  {
    id v7 = objc_alloc(MEMORY[0x1E4F69480]);
    int v8 = [(HUDashboardItemManager *)self context];
    uint64_t v9 = [v8 room];
    uint64_t v10 = (void *)[v7 initWithHome:v81 room:v9];
    [(HFItemManager *)self setSourceItem:v10];
  }
  else
  {
    if (!v81) {
      goto LABEL_6;
    }
    int v8 = (void *)[objc_alloc(MEMORY[0x1E4F69188]) initWithHome:v81];
    [(HFItemManager *)self setSourceItem:v8];
  }

LABEL_6:
  uint64_t v11 = [MEMORY[0x1E4F1CA48] array];
  objc_initWeak(&location, self);
  if (_os_feature_enabled_impl())
  {
    if ([MEMORY[0x1E4F69758] shouldShowFakeContentForPerformanceTesting])
    {
      id v12 = objc_alloc_init(MEMORY[0x1E4F69148]);
      [(HUDashboardItemManager *)self setFakeSpeakersAndTVsItemProvider:v12];

      uint64_t v13 = [(HUDashboardItemManager *)self fakeSpeakersAndTVsItemProvider];
      [v11 addObject:v13];
    }
    id v14 = objc_alloc(MEMORY[0x1E4F68E28]);
    uint64_t v15 = [(HUDashboardItemManager *)self context];
    int v16 = [v15 room];
    objc_super v17 = v16;
    if (!v16)
    {
      id v3 = [(HUDashboardItemManager *)self context];
      objc_super v17 = [v3 home];
    }
    v18 = [(HUDashboardItemManager *)self context];
    uint64_t v19 = [v18 home];
    uint64_t v20 = (void *)[v14 initWithAccessoryContainer:v17 inHome:v19];
    [(HUDashboardItemManager *)self setSpeakersAndTVsItemProvider:v20];

    if (!v16)
    {
    }
    v88[0] = MEMORY[0x1E4F143A8];
    v88[1] = 3221225472;
    v88[2] = __53__HUDashboardItemManager__buildItemProvidersForHome___block_invoke;
    v88[3] = &unk_1E638BE78;
    objc_copyWeak(&v89, &location);
    v21 = [(HUDashboardItemManager *)self speakersAndTVsItemProvider];
    [v21 setFilterBlock:v88];

    uint64_t v22 = [(HUDashboardItemManager *)self speakersAndTVsItemProvider];
    [v11 addObject:v22];

    objc_destroyWeak(&v89);
  }
  id v23 = objc_alloc(MEMORY[0x1E4F68E28]);
  uint64_t v24 = [(HUDashboardItemManager *)self context];
  v25 = [v24 room];
  v26 = v25;
  if (!v25)
  {
    id v3 = [(HUDashboardItemManager *)self context];
    v26 = [v3 home];
  }
  char v27 = [(HUDashboardItemManager *)self context];
  v28 = [v27 home];
  v29 = (void *)[v23 initWithAccessoryContainer:v26 inHome:v28];
  [(HUDashboardItemManager *)self setFavoritesItemProvider:v29];

  if (!v25)
  {
  }
  v86[0] = MEMORY[0x1E4F143A8];
  v86[1] = 3221225472;
  v86[2] = __53__HUDashboardItemManager__buildItemProvidersForHome___block_invoke_2;
  v86[3] = &unk_1E638BE78;
  objc_copyWeak(&v87, &location);
  v30 = [(HUDashboardItemManager *)self favoritesItemProvider];
  [v30 setFilterBlock:v86];

  char v31 = [(HUDashboardItemManager *)self favoritesItemProvider];
  [v11 addObject:v31];

  id v32 = objc_alloc(MEMORY[0x1E4F68E28]);
  v33 = [(HUDashboardItemManager *)self context];
  v34 = [v33 room];
  v35 = v34;
  if (!v34)
  {
    v26 = [(HUDashboardItemManager *)self context];
    v35 = [v26 home];
  }
  v36 = [(HUDashboardItemManager *)self context];
  uint64_t v37 = [v36 home];
  v38 = (void *)[v32 initWithAccessoryContainer:v35 inHome:v37];
  [(HUDashboardItemManager *)self setAccessoryLikeItemProvider:v38];

  if (!v34)
  {
  }
  v39 = [(HUDashboardItemManager *)self context];
  uint64_t v40 = [v39 accessoryLikeItemObjectLevel];
  v41 = [(HUDashboardItemManager *)self accessoryLikeItemProvider];
  [v41 setObjectLevel:v40];

  v84[0] = MEMORY[0x1E4F143A8];
  v84[1] = 3221225472;
  v84[2] = __53__HUDashboardItemManager__buildItemProvidersForHome___block_invoke_3;
  v84[3] = &unk_1E638BE78;
  objc_copyWeak(&v85, &location);
  v42 = [(HUDashboardItemManager *)self accessoryLikeItemProvider];
  [v42 setFilterBlock:v84];

  v43 = [(HUDashboardItemManager *)self context];
  v44 = [v43 accessoryTypeGroup];

  if (v44)
  {
    uint64_t v45 = [(HUDashboardItemManager *)self context];
    v46 = [v45 accessoryTypeGroup];
    v91[0] = v46;
    v47 = [MEMORY[0x1E4F1C978] arrayWithObjects:v91 count:1];
    v48 = [(HUDashboardItemManager *)self accessoryLikeItemProvider];
    [v48 setAccessoryTypeGroups:v47];
  }
  else
  {
    uint64_t v45 = [MEMORY[0x1E4F68E38] sortedAccessoryTypeGroups];
    v46 = [(HUDashboardItemManager *)self accessoryLikeItemProvider];
    [v46 setAccessoryTypeGroups:v45];
  }

  uint64_t v49 = [HUDashboardAccessoryTransformItemProvider alloc];
  v50 = [(HUDashboardItemManager *)self accessoryLikeItemProvider];
  v51 = [(HFItemManager *)self home];
  char v52 = [(HUDashboardAccessoryTransformItemProvider *)v49 initWithSourceProvider:v50 inHome:v51];
  [(HUDashboardItemManager *)self setAccessoryTransformItemProvider:v52];

  v53 = [(HUDashboardItemManager *)self context];
  uint64_t v54 = [v53 accessoryGroupingStyle];
  v55 = [(HUDashboardItemManager *)self accessoryTransformItemProvider];
  [v55 setSplitAccessoryGroupsByRoom:v54 == 2];

  id v56 = [(HUDashboardItemManager *)self accessoryTransformItemProvider];
  [v11 addObject:v56];

  id v57 = objc_alloc(MEMORY[0x1E4F694C0]);
  v58 = [(HUDashboardItemManager *)self context];
  v59 = [v58 home];
  v60 = (void *)[v57 initWithHome:v59];
  [(HUDashboardItemManager *)self setScheduleRuleItemProvider:v60];

  v61 = [(HUDashboardItemManager *)self scheduleRuleItemProvider];
  [v11 addObject:v61];

  unint64_t v62 = (void *)[objc_alloc(MEMORY[0x1E4F69428]) initWithHome:v81];
  [(HUDashboardItemManager *)self setProgrammableSwitchItemProvider:v62];

  v82[0] = MEMORY[0x1E4F143A8];
  v82[1] = 3221225472;
  v82[2] = __53__HUDashboardItemManager__buildItemProvidersForHome___block_invoke_4;
  v82[3] = &unk_1E63862F8;
  objc_copyWeak(&v83, &location);
  v63 = [(HUDashboardItemManager *)self programmableSwitchItemProvider];
  [v63 setFilter:v82];

  v64 = [(HUDashboardItemManager *)self programmableSwitchItemProvider];
  objc_msgSend(v11, "na_safeAddObject:", v64);

  v65 = [(HUDashboardItemManager *)self _buildStaticItemsForHome:v81];
  if ([v65 count])
  {
    uint64_t v66 = [(HUDashboardItemManager *)self context];
    v67 = [v66 home];
    int v68 = objc_msgSend(v67, "hf_currentUserIsRestrictedGuest");

    char v69 = (void *)MEMORY[0x1E4F1CAD0];
    v70 = [(HUDashboardItemManager *)self pinCodeAccessItem];
    v71 = [(HUDashboardItemManager *)self homeKeyItem];
    v72 = objc_msgSend(v69, "setWithObjects:", v70, v71, 0);

    if (v68)
    {
      v73 = (void *)[objc_alloc(MEMORY[0x1E4F695D0]) initWithItems:v72];
      [(HUDashboardItemManager *)self setNonBlockingItemProvider:v73];

      int v74 = [MEMORY[0x1E4F1CAD0] setWithObject:*MEMORY[0x1E4F68700]];
      v75 = [(HUDashboardItemManager *)self nonBlockingItemProvider];
      [v75 setClientInvalidationReasons:v74];

      v76 = [(HUDashboardItemManager *)self nonBlockingItemProvider];
      [v11 addObject:v76];
    }
    v77 = objc_msgSend(v65, "na_setByRemovingObjectsFromSet:", v72);

    v78 = (void *)[objc_alloc(MEMORY[0x1E4F695C8]) initWithItems:v77];
    [(HUDashboardItemManager *)self setStaticItemProvider:v78];

    id v79 = [(HUDashboardItemManager *)self staticItemProvider];
    objc_msgSend(v11, "na_safeAddObject:", v79);
  }
  else
  {
    v77 = v65;
  }

  objc_destroyWeak(&v83);
  objc_destroyWeak(&v85);
  objc_destroyWeak(&v87);
  objc_destroyWeak(&location);

  return v11;
}

- (HFAccessoryLikeItemProvider)accessoryLikeItemProvider
{
  return self->_accessoryLikeItemProvider;
}

- (HFStaticItem)pinCodeAccessItem
{
  return self->_pinCodeAccessItem;
}

- (HFStaticItem)homeKeyItem
{
  return self->_homeKeyItem;
}

- (HFStaticItemProvider)staticItemProvider
{
  return self->_staticItemProvider;
}

- (void)setStaticItemProvider:(id)a3
{
}

- (void)setScheduleRuleItemProvider:(id)a3
{
}

- (void)setProgrammableSwitchItemProvider:(id)a3
{
}

- (void)setFavoritesItemProvider:(id)a3
{
}

- (void)setAccessoryTransformItemProvider:(id)a3
{
}

- (void)setAccessoryLikeItemProvider:(id)a3
{
}

- (HFScheduleRuleItemProvider)scheduleRuleItemProvider
{
  return self->_scheduleRuleItemProvider;
}

- (id)_buildStaticItemsForHome:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [MEMORY[0x1E4F1CA80] set];
  objc_initWeak(location, self);
  id v7 = objc_alloc(MEMORY[0x1E4F695C0]);
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __51__HUDashboardItemManager__buildStaticItemsForHome___block_invoke;
  v36[3] = &unk_1E6384FD0;
  objc_copyWeak(&v37, location);
  int v8 = (void *)[v7 initWithResultsBlock:v36];
  [(HUDashboardItemManager *)self setAccessoryNoAccessItem:v8];

  uint64_t v9 = [(HUDashboardItemManager *)self accessoryNoAccessItem];
  [v6 addObject:v9];

  id v10 = objc_alloc(MEMORY[0x1E4F695C0]);
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __51__HUDashboardItemManager__buildStaticItemsForHome___block_invoke_2;
  v34[3] = &unk_1E6384FD0;
  objc_copyWeak(&v35, location);
  uint64_t v11 = (void *)[v10 initWithResultsBlock:v34];
  [(HUDashboardItemManager *)self setAlwaysAllowedScheduleItem:v11];

  id v12 = [(HUDashboardItemManager *)self alwaysAllowedScheduleItem];
  [v6 addObject:v12];

  id v13 = objc_alloc(MEMORY[0x1E4F695C0]);
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __51__HUDashboardItemManager__buildStaticItemsForHome___block_invoke_3;
  v31[3] = &unk_1E638BE28;
  objc_copyWeak(v33, location);
  v33[1] = (id)a2;
  id v14 = v5;
  id v32 = v14;
  uint64_t v15 = (void *)[v13 initWithResultsBlock:v31];
  [(HUDashboardItemManager *)self setPinCodeAccessItem:v15];

  int v16 = [(HUDashboardItemManager *)self pinCodeAccessItem];
  [v6 addObject:v16];

  id v17 = objc_alloc(MEMORY[0x1E4F695C0]);
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __51__HUDashboardItemManager__buildStaticItemsForHome___block_invoke_270;
  v28[3] = &unk_1E638BE28;
  objc_copyWeak(v30, location);
  v30[1] = (id)a2;
  id v18 = v14;
  id v29 = v18;
  uint64_t v19 = (void *)[v17 initWithResultsBlock:v28];
  [(HUDashboardItemManager *)self setHomeKeyItem:v19];

  uint64_t v20 = [(HUDashboardItemManager *)self homeKeyItem];
  [v6 addObject:v20];

  id v21 = objc_alloc(MEMORY[0x1E4F695C0]);
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __51__HUDashboardItemManager__buildStaticItemsForHome___block_invoke_284;
  v26[3] = &unk_1E6384FD0;
  objc_copyWeak(&v27, location);
  uint64_t v22 = (void *)[v21 initWithResultsBlock:v26];
  [(HUDashboardItemManager *)self setContactOwnerItem:v22];

  id v23 = [(HUDashboardItemManager *)self contactOwnerItem];
  [v6 addObject:v23];

  uint64_t v24 = (void *)[v6 copy];
  objc_destroyWeak(&v27);

  objc_destroyWeak(v30);
  objc_destroyWeak(v33);
  objc_destroyWeak(&v35);
  objc_destroyWeak(&v37);
  objc_destroyWeak(location);

  return v24;
}

- (void)setPinCodeAccessItem:(id)a3
{
}

- (void)setHomeKeyItem:(id)a3
{
}

- (void)setContactOwnerItem:(id)a3
{
}

- (void)setAlwaysAllowedScheduleItem:(id)a3
{
}

- (void)setAccessoryNoAccessItem:(id)a3
{
}

- (HFStaticItem)contactOwnerItem
{
  return self->_contactOwnerItem;
}

- (HFStaticItem)alwaysAllowedScheduleItem
{
  return self->_alwaysAllowedScheduleItem;
}

- (HFStaticItem)accessoryNoAccessItem
{
  return self->_accessoryNoAccessItem;
}

- (id)_buildItemModulesForHome:(id)a3
{
  objc_super v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "array", a3);
  id v5 = [HUStatusItemModule alloc];
  uint64_t v6 = [(HUDashboardItemManager *)self context];
  id v7 = [(HUStatusItemModule *)v5 initWithContext:v6 itemUpdater:self];
  [(HUDashboardItemManager *)self setStatusItemModule:v7];

  int v8 = [(HUDashboardItemManager *)self statusItemModule];
  objc_msgSend(v4, "na_safeAddObject:", v8);

  uint64_t v9 = [HUDashboardActionSetItemModule alloc];
  id v10 = [(HUDashboardItemManager *)self context];
  uint64_t v11 = [(HUDashboardActionSetItemModule *)v9 initWithContext:v10 itemUpdater:self];
  [(HUDashboardItemManager *)self setActionSetItemModule:v11];

  id v12 = [(HUDashboardItemManager *)self actionSetItemModule];
  [v4 addObject:v12];

  id v13 = [HUDashboardCameraItemModule alloc];
  id v14 = [(HUDashboardItemManager *)self context];
  uint64_t v15 = [(HUDashboardCameraItemModule *)v13 initWithContext:v14 itemUpdater:self];
  [(HUDashboardItemManager *)self setCameraItemModule:v15];

  int v16 = [(HUDashboardItemManager *)self cameraItemModule];
  [v4 addObject:v16];

  if ([MEMORY[0x1E4F69138] isHomeApp])
  {
    id v17 = [(HUDashboardItemManager *)self context];
    int v18 = [v17 shouldCreateModule:objc_opt_class()];

    if (v18)
    {
      uint64_t v19 = [HUBannerItemModule alloc];
      uint64_t v20 = [(HUDashboardItemManager *)self context];
      id v21 = [(HUBannerItemModule *)v19 initWithContext:v20 itemUpdater:self];
      [(HUDashboardItemManager *)self setBannerItemModule:v21];

      uint64_t v22 = [(HUDashboardItemManager *)self bannerItemModule];
      [v4 addObject:v22];
    }
    id v23 = [HUDashboardTipModule alloc];
    uint64_t v24 = [(HUDashboardItemManager *)self context];
    v25 = [(HUDashboardTipModule *)v23 initWithContext:v24 itemUpdater:self];
    [(HUDashboardItemManager *)self setTipItemModule:v25];

    v26 = [(HUDashboardItemManager *)self tipItemModule];
    [v4 addObject:v26];
  }
  id v27 = [(HUDashboardItemManager *)self servicePlaceholderItemModule];
  [v4 addObject:v27];

  v28 = [HUEnergyDashboardItemModule alloc];
  id v29 = [(HUDashboardItemManager *)self context];
  v30 = [(HFItemManager *)self home];
  char v31 = [(HUEnergyDashboardItemModule *)v28 initWithItemUpdater:self dashboardContext:v29 home:v30];
  [(HUDashboardItemManager *)self setEnergyDashboardItemModule:v31];

  id v32 = [(HUDashboardItemManager *)self energyDashboardItemModule];
  [v4 addObject:v32];

  return v4;
}

- (void)setTipItemModule:(id)a3
{
}

- (void)setStatusItemModule:(id)a3
{
}

- (void)setEnergyDashboardItemModule:(id)a3
{
}

- (void)setCameraItemModule:(id)a3
{
}

- (void)setBannerItemModule:(id)a3
{
}

- (void)setActionSetItemModule:(id)a3
{
}

- (HUServicePlaceholderItemModule)servicePlaceholderItemModule
{
  return self->_servicePlaceholderItemModule;
}

- (void)setHome:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(HUDashboardItemManager *)self context];
    id v6 = [v5 home];
    id v7 = v4;
    int v8 = v7;
    if (v6 == v7)
    {
    }
    else
    {
      if (v6)
      {
        char v9 = [v6 isEqual:v7];

        if (v9) {
          goto LABEL_13;
        }
      }
      else
      {
      }
      id v10 = +[HUDashboardContext homeDashboardForHome:v8];
      context = self->_context;
      self->_context = v10;

      id v12 = [(HUDashboardItemManager *)self context];
      id v13 = [v12 home];
      int v14 = objc_msgSend(v13, "hf_currentUserIsRestrictedGuest");

      if (v14)
      {
        uint64_t v15 = [MEMORY[0x1E4F691A0] sharedDispatcher];
        int v16 = [(HUDashboardItemManager *)self context];
        id v17 = [v16 home];
        int v18 = [v15 pinCodeManagerForHome:v17];
        [(HUDashboardItemManager *)self setPinCodeManager:v18];

        uint64_t v19 = [(HUDashboardItemManager *)self pinCodeManager];
        [v19 addObserver:self];
      }
      else
      {
        uint64_t v20 = [(HUDashboardItemManager *)self pinCodeManager];
        [v20 removeObserver:self];

        [(HUDashboardItemManager *)self setPinCodeManager:0];
      }
      id v5 = [(HUDashboardItemManager *)self dashboardDelegate];
      int v8 = [(HUDashboardItemManager *)self context];
      [v5 dashboardItemManager:self didUpdateContext:v8];
    }
  }
LABEL_13:
  v21.receiver = self;
  v21.super_class = (Class)HUDashboardItemManager;
  [(HFItemManager *)&v21 setHome:v4];
}

- (HUDashboardItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4
{
  id v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  id v7 = NSStringFromSelector(sel_initWithContext_delegate_);
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUDashboardItemManager.m", 100, @"%s is unavailable; use %@ instead",
    "-[HUDashboardItemManager initWithDelegate:sourceItem:]",
    v7);

  return 0;
}

uint64_t __42__HUDashboardItemManager_isEmptyDashboard__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isSensorAccessory");
}

- (id)itemModuleForSectionIdentifier:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"scenesSection"])
  {
    uint64_t v5 = [(HUDashboardItemManager *)self actionSetItemModule];
LABEL_9:
    id v6 = (void *)v5;
    goto LABEL_10;
  }
  if ([v4 isEqualToString:@"camerasSection"])
  {
    uint64_t v5 = [(HUDashboardItemManager *)self cameraItemModule];
    goto LABEL_9;
  }
  if ([v4 isEqualToString:@"statusSection"])
  {
    uint64_t v5 = [(HUDashboardItemManager *)self statusItemModule];
    goto LABEL_9;
  }
  if ([v4 isEqualToString:@"tipsSection"])
  {
    uint64_t v5 = [(HUDashboardItemManager *)self tipItemModule];
    goto LABEL_9;
  }
  id v6 = 0;
LABEL_10:

  return v6;
}

- (id)buildItemForHomeKitObject:(id)a3
{
  id v4 = a3;
  if ([v4 conformsToProtocol:&unk_1F1AD8588]) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = v5;
  if (v6)
  {
    id v7 = [(HUDashboardItemManager *)self accessoryLikeItemProvider];
    int v8 = [v7 buildItemForAccessoryRepresentable:v6];
  }
  else
  {
    int v8 = 0;
  }

  return v8;
}

- (id)_itemSectionForRoom:(id)a3
{
  id v4 = HUDashboardRoomSectionIdentifierForRoom(a3);
  if ([v4 length]
    && (unint64_t v5 = [(HFItemManager *)self sectionIndexForDisplayedSectionIdentifier:v4], v5 != 0x7FFFFFFFFFFFFFFFLL))
  {
    id v6 = [(HFItemManager *)self itemSectionForSectionIndex:v5];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)updateItemSectionHeaderTitleForRoom:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  unint64_t v5 = [(HUDashboardItemManager *)self _itemSectionForRoom:v4];
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    int v8 = [v7 headerTitle];
    char v9 = [v4 name];
    int v10 = [v8 isEqualToString:v9];

    uint64_t v11 = HFLogForCategory();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      if (v12)
      {
        id v13 = [v4 name];
        *(_DWORD *)buf = 138412802;
        uint64_t v20 = self;
        __int16 v21 = 2080;
        uint64_t v22 = "-[HUDashboardItemManager updateItemSectionHeaderTitleForRoom:]";
        __int16 v23 = 2112;
        uint64_t v24 = v13;
        int v14 = "(%@ %s) Not updating room name %@ since it's the same.";
LABEL_10:
        _os_log_impl(&dword_1BE345000, v11, OS_LOG_TYPE_DEFAULT, v14, buf, 0x20u);
      }
    }
    else
    {
      if (v12)
      {
        uint64_t v15 = [v7 headerTitle];
        int v16 = [v4 name];
        *(_DWORD *)buf = 138413314;
        uint64_t v20 = self;
        __int16 v21 = 2080;
        uint64_t v22 = "-[HUDashboardItemManager updateItemSectionHeaderTitleForRoom:]";
        __int16 v23 = 2112;
        uint64_t v24 = v15;
        __int16 v25 = 2112;
        v26 = v16;
        __int16 v27 = 2112;
        id v28 = v4;
        _os_log_impl(&dword_1BE345000, v11, OS_LOG_TYPE_DEFAULT, "(%@ %s) Updating room name from \"%@\" to %@ for room %@", buf, 0x34u);
      }
      id v17 = [v4 name];
      [v7 setHeaderTitle:v17];

      id v18 = v7;
      uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1];
      [(HFItemManager *)self reloadUIRepresentationForSections:v11 withAnimation:0];
    }
  }
  else
  {
    uint64_t v11 = HFLogForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = [v4 name];
      *(_DWORD *)buf = 138412802;
      uint64_t v20 = self;
      __int16 v21 = 2080;
      uint64_t v22 = "-[HUDashboardItemManager updateItemSectionHeaderTitleForRoom:]";
      __int16 v23 = 2112;
      uint64_t v24 = v13;
      int v14 = "(%@ %s) roomItemSection is nil for room %@";
      goto LABEL_10;
    }
  }
}

void __49__HUDashboardItemManager_getHomeButtonBadgeCount__block_invoke(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  unint64_t v5 = [v4 latestResults];

  id v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F68BD0]];

  id v7 = [WeakRetained context];
  int v8 = [v7 home];
  char v9 = objc_msgSend(v8, "hf_shouldBlockCurrentRestrictedGuestFromHome");

  if ((v9 & 1) == 0) {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += [v6 count];
  }
}

- (id)matchingItemForHomeKitObject:(id)a3
{
  id v4 = a3;
  unint64_t v5 = v4;
  if (v4)
  {
    id v6 = (void *)MEMORY[0x1E4F1CA80];
    id v7 = [v4 uniqueIdentifier];
    int v8 = objc_msgSend(v6, "na_setWithSafeObject:", v7);

    id v9 = v5;
    int v10 = &unk_1F1AD8588;
    if ([v9 conformsToProtocol:v10]) {
      uint64_t v11 = v9;
    }
    else {
      uint64_t v11 = 0;
    }
    id v12 = v11;

    if (v12)
    {
      id v13 = [MEMORY[0x1E4F68E30] accessoryLikeObjectsForAccessoryRepresentable:v12];
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __55__HUDashboardItemManager_matchingItemForHomeKitObject___block_invoke;
      v21[3] = &unk_1E638BDD8;
      id v22 = v8;
      objc_msgSend(v13, "na_each:", v21);
    }
    int v14 = [(HFItemManager *)self allDisplayedItems];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    void v18[2] = __55__HUDashboardItemManager_matchingItemForHomeKitObject___block_invoke_4;
    v18[3] = &unk_1E6387098;
    id v19 = v9;
    id v20 = v8;
    id v15 = v8;
    int v16 = objc_msgSend(v14, "na_firstObjectPassingTest:", v18);
  }
  else
  {
    int v16 = 0;
  }

  return v16;
}

void __55__HUDashboardItemManager_matchingItemForHomeKitObject___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  unint64_t v5 = [v4 homeKitObject];
  id v6 = [v5 uniqueIdentifier];
  [v3 addObject:v6];

  id v7 = [v4 services];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __55__HUDashboardItemManager_matchingItemForHomeKitObject___block_invoke_2;
  v11[3] = &unk_1E638BD88;
  id v12 = *(id *)(a1 + 32);
  objc_msgSend(v7, "na_each:", v11);

  int v8 = [v4 profiles];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __55__HUDashboardItemManager_matchingItemForHomeKitObject___block_invoke_3;
  v9[3] = &unk_1E638BDB0;
  id v10 = *(id *)(a1 + 32);
  objc_msgSend(v8, "na_each:", v9);
}

void __55__HUDashboardItemManager_matchingItemForHomeKitObject___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 uniqueIdentifier];
  [v2 addObject:v3];
}

void __55__HUDashboardItemManager_matchingItemForHomeKitObject___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 uniqueIdentifier];
  [v2 addObject:v3];
}

uint64_t __55__HUDashboardItemManager_matchingItemForHomeKitObject___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 conformsToProtocol:&unk_1F19E4798]) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;
  id v6 = v3;
  if ([v6 conformsToProtocol:&unk_1F1A3D190]) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;

  id v9 = [v5 homeKitObject];
  if (v9
    || ([v8 accessoryRepresentableObject],
        id v10 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v10, "hf_homeKitObject"),
        id v9 = objc_claimAutoreleasedReturnValue(),
        v10,
        v9))
  {
    if (([v9 isEqual:*(void *)(a1 + 32)] & 1) != 0
      || ([v9 uniqueIdentifier],
          uint64_t v11 = objc_claimAutoreleasedReturnValue(),
          [*(id *)(a1 + 32) uniqueIdentifier],
          id v12 = objc_claimAutoreleasedReturnValue(),
          char v13 = [v11 isEqual:v12],
          v12,
          v11,
          (v13 & 1) != 0))
    {
      uint64_t v14 = 1;
    }
    else
    {
      id v15 = *(void **)(a1 + 40);
      int v16 = [v9 uniqueIdentifier];
      uint64_t v14 = [v15 containsObject:v16];
    }
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

id __51__HUDashboardItemManager__buildStaticItemsForHome___block_invoke_3(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = [WeakRetained context];
  id v4 = [v3 home];
  char v5 = objc_msgSend(v4, "hf_currentUserIsRestrictedGuest");

  if (v5)
  {
    id v6 = [WeakRetained pinCodeManager];
    id v7 = [v6 currentUserPinCode];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    void v15[2] = __51__HUDashboardItemManager__buildStaticItemsForHome___block_invoke_257;
    v15[3] = &unk_1E638BE00;
    uint64_t v8 = *(void *)(a1 + 48);
    v15[4] = WeakRetained;
    uint64_t v17 = v8;
    id v16 = *(id *)(a1 + 32);
    id v9 = [v7 flatMap:v15];
    id v10 = [v9 recover:&__block_literal_global_269];
  }
  else
  {
    uint64_t v11 = HFLogForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = NSStringFromSelector(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 138412546;
      id v21 = WeakRetained;
      __int16 v22 = 2112;
      __int16 v23 = v12;
      _os_log_impl(&dword_1BE345000, v11, OS_LOG_TYPE_DEFAULT, "%@: %@ Current user is not a restricted guest. Hiding personal code item.", buf, 0x16u);
    }
    char v13 = (void *)MEMORY[0x1E4F7A0D8];
    uint64_t v18 = *MEMORY[0x1E4F68B10];
    uint64_t v19 = MEMORY[0x1E4F1CC38];
    id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v19 forKeys:&v18 count:1];
    id v10 = [v13 futureWithResult:v6];
  }

  return v10;
}

id __51__HUDashboardItemManager__buildStaticItemsForHome___block_invoke_257(uint64_t a1, uint64_t a2)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    id v3 = HFLogForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      char v5 = NSStringFromSelector(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 138412546;
      uint64_t v29 = v4;
      __int16 v30 = 2112;
      char v31 = v5;
      _os_log_impl(&dword_1BE345000, v3, OS_LOG_TYPE_DEFAULT, "%@: %@ Found matching PIN code for user.", buf, 0x16u);
    }
    id v6 = objc_msgSend(*(id *)(a1 + 40), "hf_accessoriesSupportingAccessCodes");
    if ([v6 count])
    {
      id v7 = [*(id *)(a1 + 32) context];
      uint64_t v8 = [v7 home];
      if (objc_msgSend(v8, "hf_currentUserIsRestrictedGuest"))
      {
        id v9 = [*(id *)(a1 + 32) home];
        uint64_t v10 = [v9 hasOnboardedForAccessCode] ^ 1;
      }
      else
      {
        uint64_t v10 = 1;
      }
    }
    else
    {
      uint64_t v10 = 1;
    }
  }
  else
  {
    uint64_t v10 = 1;
  }
  uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F691D0]) initWithSystemImageNamed:@"number"];
  id v12 = (void *)MEMORY[0x1E4F7A0D8];
  v26[0] = *MEMORY[0x1E4F68AB8];
  char v13 = _HULocalizedStringWithDefaultValue(@"HUDashboardSection_GuestAccess_PersonalCode", @"HUDashboardSection_GuestAccess_PersonalCode", 1);
  uint64_t v14 = *MEMORY[0x1E4F689C0];
  v27[0] = v13;
  v27[1] = MEMORY[0x1E4F1CC38];
  uint64_t v15 = *MEMORY[0x1E4F68B10];
  v26[1] = v14;
  v26[2] = v15;
  id v16 = [NSNumber numberWithBool:v10];
  uint64_t v17 = *MEMORY[0x1E4F689E8];
  v27[2] = v16;
  v27[3] = v11;
  uint64_t v18 = *MEMORY[0x1E4F68900];
  v26[3] = v17;
  void v26[4] = v18;
  uint64_t v19 = (void *)MEMORY[0x1E4F1CAD0];
  v25[0] = objc_opt_class();
  v25[1] = objc_opt_class();
  v25[2] = objc_opt_class();
  id v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:3];
  id v21 = [v19 setWithArray:v20];
  v27[4] = v21;
  __int16 v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:5];
  __int16 v23 = [v12 futureWithResult:v22];

  return v23;
}

id __51__HUDashboardItemManager__buildStaticItemsForHome___block_invoke_266(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = HFLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v11 = "-[HUDashboardItemManager _buildStaticItemsForHome:]_block_invoke";
    __int16 v12 = 2112;
    id v13 = v2;
    _os_log_impl(&dword_1BE345000, v3, OS_LOG_TYPE_DEFAULT, "(%s) Failed to get access codes for current user. Error = %@. Hiding 'Personal Code' item.", buf, 0x16u);
  }

  uint64_t v4 = (void *)MEMORY[0x1E4F7A0D8];
  uint64_t v8 = *MEMORY[0x1E4F68B10];
  uint64_t v9 = MEMORY[0x1E4F1CC38];
  char v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  id v6 = [v4 futureWithResult:v5];

  return v6;
}

id __51__HUDashboardItemManager__buildStaticItemsForHome___block_invoke_270(uint64_t a1)
{
  v59[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = objc_opt_new();
  uint64_t v4 = [WeakRetained context];
  char v5 = [v4 home];
  char v6 = objc_msgSend(v5, "hf_currentUserIsRestrictedGuest");

  if (v6)
  {
    id v7 = _HULocalizedStringWithDefaultValue(@"HUDashboardSection_GuestAccess_HomeKey", @"HUDashboardSection_GuestAccess_HomeKey", 1);
    [v3 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];

    [v3 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F689C0]];
    uint64_t v8 = NSNumber;
    uint64_t v9 = [WeakRetained context];
    uint64_t v10 = [v9 home];
    uint64_t v11 = objc_msgSend(v8, "numberWithInt:", objc_msgSend(v10, "hf_currentUserIsRestrictedGuest") ^ 1);
    uint64_t v45 = *MEMORY[0x1E4F68B10];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11);

    [v3 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:*MEMORY[0x1E4F68A70]];
    __int16 v12 = (void *)[objc_alloc(MEMORY[0x1E4F691D0]) initWithSystemImageNamed:@"apple.homekey"];
    [v3 setObject:v12 forKeyedSubscript:*MEMORY[0x1E4F689E8]];
    id v13 = objc_opt_new();
    objc_msgSend(v13, "na_safeAddObject:", *(void *)(a1 + 32));
    uint64_t v14 = objc_msgSend(*(id *)(a1 + 32), "hf_walletKeyAccessories");
    uint64_t v15 = (void *)[v14 copy];
    objc_msgSend(v13, "na_safeAddObjectsFromArray:", v15);

    id v16 = (void *)[v13 copy];
    objc_msgSend(v3, "na_safeSetObject:forKey:", v16, *MEMORY[0x1E4F68908]);

    uint64_t v17 = [WeakRetained context];
    uint64_t v18 = [v17 home];
    uint64_t v19 = [v18 currentUser];

    v46 = v14;
    uint64_t v20 = [v14 count];
    id v21 = [*(id *)(a1 + 32) currentUser];
    int v22 = [v19 isEqual:v21] ^ 1;
    if (v19) {
      int v23 = v22;
    }
    else {
      int v23 = 1;
    }

    int v24 = [MEMORY[0x1E4F69758] isAnIPhone] ^ 1;
    if ((v23 & 1) != 0
      || (v24 & 1) != 0
      || !v20
      || ([*(id *)(a1 + 32) hasOnboardedForWalletKey] & 1) == 0)
    {
      if (v23)
      {
        v33 = HFLogForCategory();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          v43 = objc_msgSend(v19, "hf_prettyDescription");
          v42 = [*(id *)(a1 + 32) currentUser];
          v41 = objc_msgSend(v42, "hf_prettyDescription");
          *(_DWORD *)buf = 136315906;
          v51 = "-[HUDashboardItemManager _buildStaticItemsForHome:]_block_invoke";
          __int16 v52 = 1024;
          *(_DWORD *)v53 = 1;
          *(_WORD *)&v53[4] = 2112;
          *(void *)&v53[6] = v43;
          *(_WORD *)&v53[14] = 2112;
          *(void *)&v53[16] = v41;
          _os_log_impl(&dword_1BE345000, v33, OS_LOG_TYPE_DEFAULT, "(%s) Hiding homeKeyItem | shouldHideForUser: %{BOOL}d | user = %@ | home.currentUser = %@", buf, 0x26u);
        }
      }
      v34 = HFLogForCategory();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        v44 = v19;
        id v35 = v13;
        BOOL v36 = v20 != 0;
        int v37 = [*(id *)(a1 + 32) hasOnboardedForWalletKey];
        v38 = objc_msgSend(MEMORY[0x1E4F2E4F8], "hf_minimumDescriptionsOfAccessories:", v46);
        *(_DWORD *)buf = 138413826;
        v51 = (const char *)WeakRetained;
        __int16 v52 = 2080;
        *(void *)v53 = "-[HUDashboardItemManager _buildStaticItemsForHome:]_block_invoke";
        *(_WORD *)&v53[8] = 1024;
        *(_DWORD *)&v53[10] = v23;
        *(_WORD *)&v53[14] = 1024;
        *(_DWORD *)&v53[16] = v24;
        *(_WORD *)&v53[20] = 1024;
        *(_DWORD *)&v53[22] = v36;
        id v13 = v35;
        uint64_t v19 = v44;
        __int16 v54 = 1024;
        int v55 = v37;
        __int16 v56 = 2112;
        id v57 = v38;
        _os_log_impl(&dword_1BE345000, v34, OS_LOG_TYPE_DEFAULT, "(%@: %s) Hiding homeKeyItem | shouldHideForUser: %{BOOL}d | shouldHideForDevice: %{BOOL}d, hasWalletKeyAccessories: %{BOOL}d | home.hasOnboardedForWalletKey: %{BOOL}d | walletKeyAccessories: %@", buf, 0x38u);
      }
      v39 = [NSNumber numberWithBool:1];
      objc_msgSend(v3, "na_safeSetObject:forKey:", v39, v45);

      __int16 v27 = [MEMORY[0x1E4F7A0D8] futureWithResult:v3];
    }
    else
    {
      __int16 v25 = [WeakRetained home];
      v26 = objc_msgSend(v25, "hf_fetchWalletKeyDeviceStateForCurrentDeviceIfNecessary");
      v47[0] = MEMORY[0x1E4F143A8];
      v47[1] = 3221225472;
      v47[2] = __51__HUDashboardItemManager__buildStaticItemsForHome___block_invoke_279;
      v47[3] = &unk_1E638BE50;
      id v48 = v3;
      id v49 = *(id *)(a1 + 32);
      __int16 v27 = [v26 flatMap:v47];
    }
  }
  else
  {
    id v28 = HFLogForCategory();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v29 = NSStringFromSelector(*(SEL *)(a1 + 48));
      __int16 v30 = [WeakRetained context];
      char v31 = [v30 home];
      *(_DWORD *)buf = 138412802;
      v51 = (const char *)WeakRetained;
      __int16 v52 = 2112;
      *(void *)v53 = v29;
      *(_WORD *)&v53[8] = 2112;
      *(void *)&v53[10] = v31;
      _os_log_impl(&dword_1BE345000, v28, OS_LOG_TYPE_DEFAULT, "%@: %@ Current user is not a restricted guest. Hiding home key item for home %@.", buf, 0x20u);
    }
    uint64_t v32 = (void *)MEMORY[0x1E4F7A0D8];
    uint64_t v58 = *MEMORY[0x1E4F68B10];
    v59[0] = MEMORY[0x1E4F1CC38];
    __int16 v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v59 forKeys:&v58 count:1];
    __int16 v27 = [v32 futureWithResult:v12];
  }

  return v27;
}

id __51__HUDashboardItemManager__buildStaticItemsForHome___block_invoke_279(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if ([a2 canAddWalletKeyErrorCode] == 8)
  {
    id v3 = HFLogForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v11 = "-[HUDashboardItemManager _buildStaticItemsForHome:]_block_invoke";
      _os_log_impl(&dword_1BE345000, v3, OS_LOG_TYPE_DEFAULT, "(%s) Hiding \"Home Key\" button because current device has Wallet app deleted", buf, 0xCu);
    }

    [*(id *)(a1 + 32) setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F68B10]];
    uint64_t v4 = [MEMORY[0x1E4F7A0D8] futureWithResult:*(void *)(a1 + 32)];
  }
  else
  {
    char v5 = objc_msgSend(*(id *)(a1 + 40), "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");
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __51__HUDashboardItemManager__buildStaticItemsForHome___block_invoke_280;
    v7[3] = &unk_1E638AEC0;
    id v8 = *(id *)(a1 + 40);
    id v9 = *(id *)(a1 + 32);
    uint64_t v4 = [v5 flatMap:v7];
  }

  return v4;
}

id __51__HUDashboardItemManager__buildStaticItemsForHome___block_invoke_280(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if ([a2 BOOLValue])
  {
    id v3 = objc_msgSend(*(id *)(a1 + 32), "hf_hasWalletKey");
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __51__HUDashboardItemManager__buildStaticItemsForHome___block_invoke_2_281;
    v7[3] = &unk_1E6385648;
    id v8 = *(id *)(a1 + 40);
    uint64_t v4 = [v3 flatMap:v7];
  }
  else
  {
    char v5 = HFLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v10 = "-[HUDashboardItemManager _buildStaticItemsForHome:]_block_invoke";
      _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "(%s) Hiding 'Home Key' button because current device is NOT wallet key compatible.", buf, 0xCu);
    }

    [*(id *)(a1 + 40) setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F68B10]];
    uint64_t v4 = [MEMORY[0x1E4F7A0D8] futureWithResult:*(void *)(a1 + 40)];
  }

  return v4;
}

id __51__HUDashboardItemManager__buildStaticItemsForHome___block_invoke_2_281(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315650;
    id v9 = "-[HUDashboardItemManager _buildStaticItemsForHome:]_block_invoke_2";
    __int16 v10 = 1024;
    int v11 = [v3 BOOLValue] ^ 1;
    __int16 v12 = 1024;
    int v13 = [v3 BOOLValue];
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "(%s) For homeKeyItem, hidden = %{BOOL}d because hasWalletKey = %{BOOL}d", (uint8_t *)&v8, 0x18u);
  }

  char v5 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v3, "BOOLValue") ^ 1);
  [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:*MEMORY[0x1E4F68B10]];

  char v6 = [MEMORY[0x1E4F7A0D8] futureWithResult:*(void *)(a1 + 32)];

  return v6;
}

uint64_t __53__HUDashboardItemManager__buildItemProvidersForHome___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  char v5 = [WeakRetained context];
  if ([v5 shouldHideAccessoryRepresentable:v3])
  {
    uint64_t v6 = 0;
  }
  else
  {
    id v7 = [MEMORY[0x1E4F68EA0] mediaAccessoryTypeGroup];
    int v8 = objc_msgSend(v3, "hf_accessoryType");
    uint64_t v6 = [v7 containsType:v8];
  }
  return v6;
}

uint64_t __53__HUDashboardItemManager__buildItemProvidersForHome___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  char v5 = [WeakRetained context];
  char v6 = [v5 shouldHideHomeKitObject:v3];

  if (v6)
  {
    uint64_t v7 = 0;
  }
  else
  {
    objc_opt_class();
    id v8 = v3;
    if (objc_opt_isKindOfClass()) {
      id v9 = v8;
    }
    else {
      id v9 = 0;
    }
    id v10 = v9;

    if (v10)
    {
      objc_msgSend(MEMORY[0x1E4F2EA88], "hf_programmableSwitchServiceTypes");
      id v11 = (id)objc_claimAutoreleasedReturnValue();
      __int16 v12 = [v10 serviceType];
      uint64_t v7 = [v11 containsObject:v12];
    }
    else
    {
      objc_opt_class();
      id v11 = v8;
      if (objc_opt_isKindOfClass()) {
        int v13 = v11;
      }
      else {
        int v13 = 0;
      }
      uint64_t v7 = v13;

      if (v7) {
        uint64_t v7 = objc_msgSend((id)v7, "hf_isPureProgrammableSwitch") ^ 1;
      }
      else {
        id v11 = 0;
      }
    }
  }
  return v7;
}

void __59__HUDashboardItemManager__buildSectionsWithDisplayedItems___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v7 = 138412546;
    uint64_t v8 = v5;
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "%@ routeIdentifier returned by MRNowPlayingRequest: %@", (uint8_t *)&v7, 0x16u);
  }

  char v6 = [*(id *)(a1 + 32) _buildNowPlayingSectionWithItems:*(void *)(a1 + 40) forRouteIdentifier:v3];
  objc_msgSend(*(id *)(a1 + 48), "na_safeAddObjectsFromArray:", v6);
}

- (id)_buildNowPlayingSectionWithItems:(id)a3 forRouteIdentifier:(id)a4
{
  v41[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  int v7 = (objc_class *)MEMORY[0x1E4F692E8];
  id v8 = a3;
  __int16 v9 = (void *)[[v7 alloc] initWithIdentifier:@"NowPlayingSection"];
  id v10 = _HULocalizedStringWithDefaultValue(@"HUDashboardNowPlayingSectionTitle", @"HUDashboardNowPlayingSectionTitle", 1);
  [v9 setHeaderTitle:v10];

  uint64_t v11 = [MEMORY[0x1E4F1CA48] array];
  __int16 v12 = [(HUDashboardItemManager *)self fakeSpeakersAndTVsItemProvider];
  int v13 = [v12 items];
  uint64_t v14 = [v13 count];

  if (v14)
  {
    uint64_t v15 = [(HUDashboardItemManager *)self fakeSpeakersAndTVsItemProvider];
    id v16 = [v15 items];
    uint64_t v17 = [v16 allObjects];
    [v11 addObjectsFromArray:v17];
  }
  uint64_t v18 = [(HUDashboardItemManager *)self speakersAndTVsItemProvider];
  uint64_t v19 = [v18 items];
  uint64_t v20 = [v19 count];

  if (v20)
  {
    id v21 = [(HUDashboardItemManager *)self speakersAndTVsItemProvider];
    int v22 = [v21 items];
    int v23 = [v22 allObjects];
    uint64_t v35 = MEMORY[0x1E4F143A8];
    uint64_t v36 = 3221225472;
    int v37 = __78__HUDashboardItemManager__buildNowPlayingSectionWithItems_forRouteIdentifier___block_invoke;
    v38 = &unk_1E638BF18;
    id v39 = v6;
    int v24 = objc_msgSend(v23, "na_firstObjectPassingTest:", &v35);

    objc_msgSend(v11, "na_safeAddObject:", v24, v35, v36, v37, v38);
  }
  __int16 v25 = [(HUDashboardItemManager *)self context];
  uint64_t v26 = [v25 maximumNumberOfItemsInSectionWithIdentifier:@"SpeakersAndTVsSection"];

  if (v26 < 2)
  {
    if ([v11 count])
    {
      __int16 v30 = [v11 firstObject];
      v41[0] = v30;
      id v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:1];
    }
    else
    {
      id v27 = 0;
    }
  }
  else
  {
    id v27 = v11;
    id v28 = [(HUDashboardItemManager *)self context];
    uint64_t v29 = [v28 room];

    if (!v29) {
      [v9 setHeaderTitle:0];
    }
  }
  [v9 setItems:v27];
  char v31 = (void *)MEMORY[0x1E4F69220];
  uint64_t v40 = v9;
  uint64_t v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v40 count:1];
  v33 = [v31 filterSections:v32 toDisplayedItems:v8];

  return v33;
}

uint64_t __78__HUDashboardItemManager__buildNowPlayingSectionWithItems_forRouteIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  uint64_t v4 = [v3 latestResults];

  uint64_t v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F68B58]];
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  uint64_t v8 = [v7 isEqualToString:*(void *)(a1 + 32)];
  return v8;
}

- (id)_buildSingleAccessoryGroupSectionWithItems:(id)a3 allDisplayedItems:(id)a4
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (objc_class *)MEMORY[0x1E4F692E8];
  id v8 = a4;
  __int16 v9 = (void *)[[v7 alloc] initWithIdentifier:@"AllAccessoriesSection"];
  id v10 = _HULocalizedStringWithDefaultValue(@"HUDashboardSection_Accessories_Title", @"HUDashboardSection_Accessories_Title", 1);
  [v9 setHeaderTitle:v10];

  uint64_t v11 = [(HUDashboardItemManager *)self accessoryNoAccessItem];
  int v12 = [v8 containsObject:v11];

  if (v12)
  {
    int v13 = [(HUDashboardItemManager *)self accessoryNoAccessItem];
    v17[0] = v13;
    uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
    [v9 setItems:v14];
  }
  else
  {
    int v13 = [v6 allObjects];
    uint64_t v14 = [MEMORY[0x1E4F69220] defaultItemComparator];
    uint64_t v15 = [v13 sortedArrayUsingComparator:v14];
    [v9 setItems:v15];
  }

  return v9;
}

- (id)_buildAccessoryCategorySectionsWithItems:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA80] setWithSet:v4];
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x3032000000;
  __int16 v30 = __Block_byref_object_copy__18;
  char v31 = __Block_byref_object_dispose__18;
  id v32 = 0;
  id v6 = [MEMORY[0x1E4F68E38] sortedAccessoryTypeGroups];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __67__HUDashboardItemManager__buildAccessoryCategorySectionsWithItems___block_invoke;
  v24[3] = &unk_1E638BF68;
  v24[4] = self;
  id v7 = v5;
  id v25 = v7;
  uint64_t v26 = &v27;
  id v8 = objc_msgSend(v6, "na_map:", v24);

  if ([v7 count])
  {
    __int16 v9 = HFLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = [v7 count];
      *(_DWORD *)buf = 138412802;
      v34 = self;
      __int16 v35 = 2048;
      uint64_t v36 = v10;
      __int16 v37 = 2112;
      id v38 = v7;
      _os_log_impl(&dword_1BE345000, v9, OS_LOG_TYPE_DEFAULT, "%@ Found %lu item(s) without an identified category: %@", buf, 0x20u);
    }

    uint64_t v11 = [MEMORY[0x1E4F68EA0] otherAccessoryTypeGroup];
    int v12 = [(HUDashboardItemManager *)self reorderableServiceListForType:v11];
    int v13 = [v12 sortedHomeKitItemComparator];
    uint64_t v14 = v13;
    if (v13)
    {
      uint64_t v15 = _Block_copy(v13);
    }
    else
    {
      id v16 = [MEMORY[0x1E4F69220] defaultItemComparator];
      uint64_t v15 = _Block_copy(v16);
    }
    uint64_t v17 = [v7 allObjects];
    uint64_t v18 = [v17 sortedArrayUsingComparator:v15];
    [(id)v28[5] setItems:v18];
  }
  uint64_t v19 = [(HUDashboardItemManager *)self context];
  int v20 = [v19 shouldHideEmptySections];

  if (v20)
  {
    id v21 = [MEMORY[0x1E4F69220] filterSections:v8 toDisplayedItems:v4];
  }
  else
  {
    id v21 = v8;
  }
  int v22 = v21;

  _Block_object_dispose(&v27, 8);

  return v22;
}

id __67__HUDashboardItemManager__buildAccessoryCategorySectionsWithItems___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = HUDashboardAccessoryCategorySectionIdentifierForAccessoryTypeGroup(v3);
  uint64_t v5 = [*(id *)(a1 + 32) context];
  char v6 = [v5 shouldHideSectionWithIdentifier:v4];

  if (v6)
  {
    id v7 = 0;
  }
  else
  {
    id v8 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:v4];
    __int16 v9 = [v3 name];
    [v8 setHeaderTitle:v9];

    uint64_t v10 = *(void **)(a1 + 40);
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __67__HUDashboardItemManager__buildAccessoryCategorySectionsWithItems___block_invoke_2;
    v23[3] = &unk_1E638BF18;
    id v11 = v3;
    id v24 = v11;
    int v12 = objc_msgSend(v10, "na_filter:", v23);
    int v13 = [*(id *)(a1 + 32) reorderableServiceListForType:v11];
    uint64_t v14 = [v13 sortedHomeKitItemComparator];
    uint64_t v15 = v14;
    if (v14)
    {
      id v16 = _Block_copy(v14);
    }
    else
    {
      uint64_t v17 = [MEMORY[0x1E4F69220] defaultItemComparator];
      id v16 = _Block_copy(v17);
    }
    uint64_t v18 = [v12 allObjects];
    uint64_t v19 = [v18 sortedArrayUsingComparator:v16];
    [v8 setItems:v19];

    [*(id *)(a1 + 40) minusSet:v12];
    int v20 = [MEMORY[0x1E4F68EA0] otherAccessoryTypeGroup];
    int v21 = [v11 isEqual:v20];

    if (v21) {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v8);
    }
    id v7 = v8;
  }

  return v7;
}

uint64_t __67__HUDashboardItemManager__buildAccessoryCategorySectionsWithItems___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 accessoryRepresentableObject];
  id v4 = objc_msgSend(v3, "hf_accessoryType");
  uint64_t v5 = [v2 containsType:v4];

  return v5;
}

- (id)reorderableServiceListForRoom:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 uniqueIdentifier];
  char v6 = [v5 UUIDString];

  id v7 = [(HUDashboardItemManager *)self clientReorderableServiceListByRoom];

  if (!v7)
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [(HUDashboardItemManager *)self setClientReorderableServiceListByRoom:v8];
  }
  __int16 v9 = [(HUDashboardItemManager *)self clientReorderableServiceListByRoom];
  uint64_t v10 = [v9 objectForKeyedSubscript:v6];

  if (v10)
  {
    id v11 = [(HUDashboardItemManager *)self clientReorderableServiceListByRoom];
    int v12 = [v11 objectForKeyedSubscript:v6];
  }
  else
  {
    int v12 = objc_msgSend(v4, "hf_reorderableServicesList");
  }

  return v12;
}

- (void)setReorderableServiceList:(id)a3 forRoom:(id)a4
{
  id v6 = a3;
  id v7 = [a4 uniqueIdentifier];
  id v9 = [v7 UUIDString];

  id v8 = [(HUDashboardItemManager *)self clientReorderableServiceListByRoom];
  [v8 setObject:v6 forKeyedSubscript:v9];
}

- (id)reorderableServiceListForType:(id)a3
{
  id v4 = [a3 uniqueIdentifier];
  uint64_t v5 = [v4 UUIDString];

  id v6 = [(HUDashboardItemManager *)self clientReorderableServiceByTypeList];

  if (!v6)
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [(HUDashboardItemManager *)self setClientReorderableServiceByTypeList:v7];
  }
  id v8 = [(HUDashboardItemManager *)self clientReorderableServiceByTypeList];
  id v9 = [v8 objectForKeyedSubscript:v5];

  if (v9)
  {
    uint64_t v10 = [(HUDashboardItemManager *)self clientReorderableServiceByTypeList];
    id v11 = [v10 objectForKeyedSubscript:v5];
  }
  else
  {
    uint64_t v10 = [(HFItemManager *)self sourceItem];
    int v12 = [v10 latestResults];
    int v13 = [v12 objectForKeyedSubscript:*MEMORY[0x1E4F68A50]];
    id v11 = [v13 objectForKeyedSubscript:v5];
  }

  return v11;
}

- (void)setReorderableServiceList:(id)a3 forType:(id)a4
{
  id v6 = a3;
  id v7 = [a4 uniqueIdentifier];
  id v9 = [v7 UUIDString];

  id v8 = [(HUDashboardItemManager *)self clientReorderableServiceByTypeList];
  [v8 setObject:v6 forKeyedSubscript:v9];
}

- (void)_updateHomeDashboardWithHome:(id)a3
{
  v14[3] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = +[HUDashboardContext homeDashboardForHome:a3];
  context = self->_context;
  self->_context = v5;

  id v7 = [(HUDashboardItemManager *)self dashboardDelegate];
  id v8 = [(HUDashboardItemManager *)self context];
  [v7 dashboardItemManager:self didUpdateContext:v8];

  [(HFItemManager *)self recalculateVisibilityAndSortAllItems];
  id v9 = [(HUDashboardItemManager *)self accessoryLikeItemProvider];
  uint64_t v10 = [(HUDashboardItemManager *)self accessoryTransformItemProvider];
  v14[1] = v10;
  id v11 = [(HUDashboardItemManager *)self staticItemProvider];
  v14[2] = v11;
  int v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:3];
  id v13 = [(HFItemManager *)self reloadAndUpdateItemsForProviders:v12 senderSelector:a2];
}

- (void)setPinCodeManager:(id)a3
{
}

- (HFStaticNonBlockingItemProvider)nonBlockingItemProvider
{
  return self->_nonBlockingItemProvider;
}

- (void)setNonBlockingItemProvider:(id)a3
{
}

- (HFAccessoryLikeItemProvider)speakersAndTVsItemProvider
{
  return self->_speakersAndTVsItemProvider;
}

- (void)setSpeakersAndTVsItemProvider:(id)a3
{
}

- (HFFakeMediaAccessoryItemProvider)fakeSpeakersAndTVsItemProvider
{
  return self->_fakeSpeakersAndTVsItemProvider;
}

- (void)setFakeSpeakersAndTVsItemProvider:(id)a3
{
}

- (void)setServicePlaceholderItemModule:(id)a3
{
}

- (NSMutableDictionary)clientReorderableServiceListByRoom
{
  return self->_clientReorderableServiceListByRoom;
}

- (void)setClientReorderableServiceListByRoom:(id)a3
{
}

- (NSMutableDictionary)clientReorderableServiceByTypeList
{
  return self->_clientReorderableServiceByTypeList;
}

- (void)setClientReorderableServiceByTypeList:(id)a3
{
}

- (void)setClientReorderableFavoritesList:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientReorderableFavoritesList, 0);
  objc_storeStrong((id *)&self->_clientReorderableServiceByTypeList, 0);
  objc_storeStrong((id *)&self->_clientReorderableServiceListByRoom, 0);
  objc_storeStrong((id *)&self->_energyDashboardItemModule, 0);
  objc_storeStrong((id *)&self->_servicePlaceholderItemModule, 0);
  objc_storeStrong((id *)&self->_fakeSpeakersAndTVsItemProvider, 0);
  objc_storeStrong((id *)&self->_speakersAndTVsItemProvider, 0);
  objc_storeStrong((id *)&self->_favoritesItemProvider, 0);
  objc_storeStrong((id *)&self->_programmableSwitchItemProvider, 0);
  objc_storeStrong((id *)&self->_staticItemProvider, 0);
  objc_storeStrong((id *)&self->_nonBlockingItemProvider, 0);
  objc_storeStrong((id *)&self->_accessoryTransformItemProvider, 0);
  objc_storeStrong((id *)&self->_accessoryLikeItemProvider, 0);
  objc_storeStrong((id *)&self->_bannerItemModule, 0);
  objc_storeStrong((id *)&self->_tipItemModule, 0);
  objc_storeStrong((id *)&self->_cameraItemModule, 0);
  objc_storeStrong((id *)&self->_actionSetItemModule, 0);
  objc_storeStrong((id *)&self->_statusItemModule, 0);
  objc_storeStrong((id *)&self->_pinCodeManager, 0);
  objc_storeStrong((id *)&self->_contactOwnerItem, 0);
  objc_storeStrong((id *)&self->_homeKeyItem, 0);
  objc_storeStrong((id *)&self->_pinCodeAccessItem, 0);
  objc_storeStrong((id *)&self->_alwaysAllowedScheduleItem, 0);
  objc_storeStrong((id *)&self->_accessoryNoAccessItem, 0);
  objc_storeStrong((id *)&self->_scheduleRuleItemProvider, 0);
  objc_destroyWeak((id *)&self->_dashboardDelegate);

  objc_storeStrong((id *)&self->_context, 0);
}

- (void)home:(id)a3 didAddRoom:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)HUDashboardItemManager;
  [(HFItemManager *)&v5 home:a3 didAddRoom:a4];
  [(HFItemManager *)self recalculateVisibilityAndSortAllItems];
}

- (void)home:(id)a3 didRemoveRoom:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)HUDashboardItemManager;
  [(HFItemManager *)&v5 home:a3 didRemoveRoom:a4];
  [(HFItemManager *)self recalculateVisibilityAndSortAllItems];
}

- (void)homeDidUpdateApplicationData:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)HUDashboardItemManager;
  [(HFItemManager *)&v9 homeDidUpdateApplicationData:a3];
  [(HFItemManager *)self recalculateVisibilityAndSortAllItems];
  objc_super v5 = [(HUDashboardItemManager *)self actionSetItemModule];
  id v6 = [v5 itemProviders];
  id v7 = [v6 allObjects];
  id v8 = [(HFItemManager *)self reloadAndUpdateItemsForProviders:v7 senderSelector:a2];
}

- (void)homeDidUpdateAccessControlForCurrentUser:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HUDashboardItemManager;
  [(HFItemManager *)&v13 homeDidUpdateAccessControlForCurrentUser:v5];
  id v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412802;
    uint64_t v15 = self;
    __int16 v16 = 2112;
    uint64_t v17 = v7;
    __int16 v18 = 2112;
    id v19 = v5;
    _os_log_impl(&dword_1BE345000, v6, OS_LOG_TYPE_DEFAULT, "%@: %@ Access control for current user did update for home: %@.", buf, 0x20u);
  }
  id v8 = [(HUDashboardItemManager *)self context];
  id v9 = [v8 home];
  id v10 = v5;
  id v11 = v10;
  if (v9 == v10)
  {
  }
  else
  {
    if (!v9)
    {

      goto LABEL_12;
    }
    char v12 = [v9 isEqual:v10];

    if ((v12 & 1) == 0) {
      goto LABEL_12;
    }
  }
  if ((objc_msgSend(v11, "hf_shouldBlockCurrentUserFromHomeForRoarUpgrade") & 1) != 0
    || objc_msgSend(v11, "hf_currentUserIsRestrictedGuest"))
  {
    [(HUDashboardItemManager *)self _updateHomeDashboardWithHome:v11];
  }
LABEL_12:
}

- (void)homeDidUpdateHomeLocationStatus:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = NSStringFromSelector(a2);
    [v5 homeLocationStatus];
    id v8 = HMStringFromHomeLocation();
    int v14 = 138413058;
    uint64_t v15 = self;
    __int16 v16 = 2112;
    uint64_t v17 = v7;
    __int16 v18 = 2112;
    id v19 = v5;
    __int16 v20 = 2112;
    int v21 = v8;
    _os_log_impl(&dword_1BE345000, v6, OS_LOG_TYPE_DEFAULT, "%@: %@ Home location status did update for home: %@. homeLocationStatus = %@", (uint8_t *)&v14, 0x2Au);
  }
  id v9 = [(HUDashboardItemManager *)self context];
  id v10 = [v9 home];
  id v11 = v5;
  char v12 = v11;
  if (v10 == v11)
  {
  }
  else
  {
    if (!v10)
    {

      goto LABEL_11;
    }
    char v13 = [v10 isEqual:v11];

    if ((v13 & 1) == 0) {
      goto LABEL_11;
    }
  }
  if (objc_msgSend(v12, "hf_currentUserIsRestrictedGuest")) {
    [(HUDashboardItemManager *)self _updateHomeDashboardWithHome:v12];
  }
LABEL_11:
}

- (void)restrictedGuestAllowedPeriodStarted:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = NSStringFromSelector(a2);
    int v17 = 138412802;
    __int16 v18 = self;
    __int16 v19 = 2112;
    __int16 v20 = v7;
    __int16 v21 = 2112;
    id v22 = v5;
    _os_log_impl(&dword_1BE345000, v6, OS_LOG_TYPE_DEFAULT, "%@: %@ Restricted Guest allowed period started for user: %@.", (uint8_t *)&v17, 0x20u);
  }
  id v8 = [(HUDashboardItemManager *)self context];
  id v9 = [v8 home];
  id v10 = [v9 currentUser];
  id v11 = v5;
  char v12 = v11;
  if (v10 == v11)
  {
  }
  else
  {
    if (!v10)
    {

      goto LABEL_11;
    }
    char v13 = [v10 isEqual:v11];

    if ((v13 & 1) == 0) {
      goto LABEL_12;
    }
  }
  int v14 = [(HUDashboardItemManager *)self context];
  uint64_t v15 = [v14 home];
  int v16 = objc_msgSend(v15, "hf_currentUserIsRestrictedGuest");

  if (v16)
  {
    id v8 = [(HUDashboardItemManager *)self context];
    id v9 = [v8 home];
    [(HUDashboardItemManager *)self _updateHomeDashboardWithHome:v9];
LABEL_11:
  }
LABEL_12:
}

- (void)restrictedGuestAllowedPeriodEnded:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = NSStringFromSelector(a2);
    int v17 = 138412802;
    __int16 v18 = self;
    __int16 v19 = 2112;
    __int16 v20 = v7;
    __int16 v21 = 2112;
    id v22 = v5;
    _os_log_impl(&dword_1BE345000, v6, OS_LOG_TYPE_DEFAULT, "%@: %@ Restricted Guest allowed period ended for user: %@.", (uint8_t *)&v17, 0x20u);
  }
  id v8 = [(HUDashboardItemManager *)self context];
  id v9 = [v8 home];
  id v10 = [v9 currentUser];
  id v11 = v5;
  char v12 = v11;
  if (v10 == v11)
  {
  }
  else
  {
    if (!v10)
    {

      goto LABEL_11;
    }
    char v13 = [v10 isEqual:v11];

    if ((v13 & 1) == 0) {
      goto LABEL_12;
    }
  }
  int v14 = [(HUDashboardItemManager *)self context];
  uint64_t v15 = [v14 home];
  int v16 = objc_msgSend(v15, "hf_currentUserIsRestrictedGuest");

  if (v16)
  {
    id v8 = [(HUDashboardItemManager *)self context];
    id v9 = [v8 home];
    [(HUDashboardItemManager *)self _updateHomeDashboardWithHome:v9];
LABEL_11:
  }
LABEL_12:
}

- (void)pinCodeManagerDidUpdate:(id)a3 pinCodes:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    int v14 = self;
    __int16 v15 = 2112;
    int v16 = v7;
    _os_log_impl(&dword_1BE345000, v6, OS_LOG_TYPE_DEFAULT, "%@: %@ Reloading PIN Code related items...", buf, 0x16u);
  }
  id v8 = [(HUDashboardItemManager *)self nonBlockingItemProvider];

  if (v8)
  {
    id v9 = [(HUDashboardItemManager *)self nonBlockingItemProvider];
    char v12 = v9;
    id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:1];
    id v11 = [(HFItemManager *)self reloadAndUpdateItemsForProviders:v10 senderSelector:a2];
  }
}

- (void)dealloc
{
  [(HUDashboardItemManager *)self setEnergyDashboardItemModule:0];
  v3.receiver = self;
  v3.super_class = (Class)HUDashboardItemManager;
  [(HFItemManager *)&v3 dealloc];
}

@end