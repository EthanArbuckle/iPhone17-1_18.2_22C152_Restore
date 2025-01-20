@interface HMRoom(HFAdditions)
- (HFReorderableHomeKitItemList)hf_reorderableServicesList;
- (HFRoomDashboardReorderableItemList)hf_reorderableDashboardSectionList;
- (id)availableHomePodsSupportingStereoPairingVersions:()HFAdditions;
- (id)availableHomeTheaterMediaPartnerFor:()HFAdditions;
- (id)hf_accessoryRepresentableUsageCountsWithFilter:()HFAdditions;
- (id)hf_allCameraProfiles;
- (id)hf_allNonEmptyActionSets;
- (id)hf_allServices;
- (id)hf_allUniqueMediaProfileContainersExcludingMediaGroups;
- (id)hf_allVisibleServices;
- (id)hf_allZones;
- (id)hf_dashboardSectionReorderableUUIDStringComparator;
- (id)hf_homePodPairsNotInHomeTheaterGroup;
- (id)hf_homePodsNotInHomeTheaterGroup;
- (id)hf_pairedHomePods;
- (id)hf_roomsSortDescriptorUsingDashboardSectionOrder;
- (id)hf_unitaryCameraProfile;
- (id)hf_visibleAccessories;
- (uint64_t)hf_atleastOneHomePodSupportsAnnounce;
- (uint64_t)hf_atleastOneMediaAccessorySupportsAndHasAnnounceEnabled;
- (uint64_t)hf_hasAtLeastOneAnnounceSupportedAccessory;
- (uint64_t)hf_hasAtLeastOneReachableHomeMediaAccessory;
- (uint64_t)hf_hasVisibleAccessories;
- (uint64_t)hf_shouldShowAnnounceButtonForThisRoom;
- (uint64_t)hf_shouldShowAnnounceFeatureForThisRoom;
@end

@implementation HMRoom(HFAdditions)

- (HFReorderableHomeKitItemList)hf_reorderableServicesList
{
  v1 = [[HFReorderableHomeKitItemList alloc] initWithApplicationDataContainer:a1 category:@"roomServices"];
  return v1;
}

- (uint64_t)hf_hasVisibleAccessories
{
  v1 = [a1 accessories];
  uint64_t v2 = objc_msgSend(v1, "na_any:", &__block_literal_global_25_5);

  return v2;
}

- (id)hf_allCameraProfiles
{
  v1 = [a1 accessories];
  uint64_t v2 = objc_msgSend(v1, "na_flatMap:", &__block_literal_global_99);

  return v2;
}

- (id)hf_unitaryCameraProfile
{
  v1 = objc_msgSend(a1, "hf_allCameraProfiles");
  if ([v1 count] == 1)
  {
    uint64_t v2 = [v1 firstObject];
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

- (id)hf_allServices
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v3 = objc_msgSend(a1, "accessories", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = [*(id *)(*((void *)&v10 + 1) + 8 * i) services];
        [v2 addObjectsFromArray:v8];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  return v2;
}

- (id)hf_allZones
{
  id v2 = [a1 home];
  v3 = [v2 zones];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __34__HMRoom_HFAdditions__hf_allZones__block_invoke;
  v6[3] = &unk_264091F98;
  v6[4] = a1;
  uint64_t v4 = objc_msgSend(v3, "na_filter:", v6);

  return v4;
}

- (id)hf_allUniqueMediaProfileContainersExcludingMediaGroups
{
  id v2 = [a1 accessories];
  v3 = objc_msgSend(v2, "na_map:", &__block_literal_global_3_14);

  uint64_t v4 = objc_msgSend(a1, "hf_pairedHomePods");
  uint64_t v5 = [v3 arrayByAddingObjectsFromArray:v4];

  uint64_t v6 = objc_msgSend(v5, "na_filter:", &__block_literal_global_6_2);
  v7 = (void *)[v6 mutableCopy];

  v8 = [MEMORY[0x263EFFA08] setWithArray:v7];

  return v8;
}

- (id)hf_pairedHomePods
{
  v1 = [a1 accessories];
  id v2 = objc_msgSend(v1, "na_map:", &__block_literal_global_9_3);

  return v2;
}

- (id)hf_homePodPairsNotInHomeTheaterGroup
{
  v1 = objc_msgSend(a1, "hf_pairedHomePods");
  id v2 = objc_msgSend(v1, "na_filter:", &__block_literal_global_12_2);

  return v2;
}

- (id)hf_homePodsNotInHomeTheaterGroup
{
  v1 = [a1 accessories];
  id v2 = objc_msgSend(v1, "na_filter:", &__block_literal_global_15_4);

  return v2;
}

- (id)availableHomeTheaterMediaPartnerFor:()HFAdditions
{
  id v4 = a3;
  if (+[HFMediaHelper isHomePod:v4]
    || +[HFMediaHelper isHomePodMediaSystem:v4])
  {
    uint64_t v5 = [a1 accessories];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __59__HMRoom_HFAdditions__availableHomeTheaterMediaPartnerFor___block_invoke;
    v19[3] = &unk_26408D968;
    id v20 = v4;
    uint64_t v6 = objc_msgSend(v5, "na_firstObjectPassingTest:", v19);

    id v7 = [v6 mediaProfile];

    v8 = v7;
LABEL_4:

    goto LABEL_5;
  }
  if (+[HFMediaHelper isAppleTV:v4])
  {
    long long v10 = objc_msgSend(a1, "hf_homePodPairsNotInHomeTheaterGroup");
    uint64_t v11 = [v10 count];

    if (v11)
    {
      long long v12 = objc_msgSend(a1, "hf_homePodPairsNotInHomeTheaterGroup");
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __59__HMRoom_HFAdditions__availableHomeTheaterMediaPartnerFor___block_invoke_2;
      v17[3] = &unk_2640913C0;
      long long v13 = &v18;
      id v18 = v4;
      v8 = objc_msgSend(v12, "na_firstObjectPassingTest:", v17);
    }
    else
    {
      long long v12 = objc_msgSend(a1, "hf_homePodsNotInHomeTheaterGroup");
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __59__HMRoom_HFAdditions__availableHomeTheaterMediaPartnerFor___block_invoke_3;
      v15[3] = &unk_26408D968;
      long long v13 = &v16;
      id v16 = v4;
      v14 = objc_msgSend(v12, "na_firstObjectPassingTest:", v15);
      v8 = [v14 mediaProfile];
    }
    id v7 = *v13;
    goto LABEL_4;
  }
  v8 = 0;
LABEL_5:

  return v8;
}

- (id)availableHomePodsSupportingStereoPairingVersions:()HFAdditions
{
  id v4 = [a1 accessories];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __72__HMRoom_HFAdditions__availableHomePodsSupportingStereoPairingVersions___block_invoke;
  v7[3] = &__block_descriptor_40_e21_B16__0__HMAccessory_8l;
  v7[4] = a3;
  uint64_t v5 = objc_msgSend(v4, "na_filter:", v7);

  return v5;
}

- (uint64_t)hf_hasAtLeastOneAnnounceSupportedAccessory
{
  v1 = [a1 accessories];
  uint64_t v2 = objc_msgSend(v1, "na_any:", &__block_literal_global_18_2);

  return v2;
}

- (id)hf_allVisibleServices
{
  v1 = (void *)MEMORY[0x263EFFA08];
  uint64_t v2 = [a1 accessories];
  v3 = [v1 setWithArray:v2];
  id v4 = objc_msgSend(v3, "na_flatMap:", &__block_literal_global_21_2);

  return v4;
}

- (id)hf_visibleAccessories
{
  v1 = [a1 accessories];
  uint64_t v2 = objc_msgSend(v1, "na_filter:", &__block_literal_global_23_2);

  return v2;
}

- (uint64_t)hf_shouldShowAnnounceButtonForThisRoom
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v2 = [a1 home];
  v3 = [a1 home];
  id v4 = [v3 currentUser];
  uint64_t v5 = [v2 homeAccessControlForUser:v4];

  int v6 = [v5 isAnnounceAccessAllowed];
  unsigned int v7 = objc_msgSend(a1, "hf_atleastOneMediaAccessorySupportsAndHasAnnounceEnabled");
  v8 = HFLogForCategory(7uLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109634;
    v10[1] = v6;
    __int16 v11 = 1024;
    unsigned int v12 = v7;
    __int16 v13 = 2112;
    v14 = a1;
    _os_log_impl(&dword_20B986000, v8, OS_LOG_TYPE_DEFAULT, "isAnnounceAccessAllowedForThisUser = %d, atleastOneMediaAccessorySupportsAnnounce = [%d], for room = %@", (uint8_t *)v10, 0x18u);
  }

  return v6 & v7;
}

- (uint64_t)hf_shouldShowAnnounceFeatureForThisRoom
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v2 = objc_msgSend(a1, "hf_atleastOneHomePodSupportsAnnounce");
  v3 = HFLogForCategory(7uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67109378;
    v5[1] = v2;
    __int16 v6 = 2112;
    unsigned int v7 = a1;
    _os_log_impl(&dword_20B986000, v3, OS_LOG_TYPE_DEFAULT, "atleastOneHomePodSupportsAnnounce = [%d], for room = %@", (uint8_t *)v5, 0x12u);
  }

  return v2;
}

- (uint64_t)hf_atleastOneHomePodSupportsAnnounce
{
  v1 = [a1 accessories];
  uint64_t v2 = objc_msgSend(v1, "na_any:", &__block_literal_global_27_5);

  return v2;
}

- (uint64_t)hf_atleastOneMediaAccessorySupportsAndHasAnnounceEnabled
{
  v1 = [a1 accessories];
  uint64_t v2 = objc_msgSend(v1, "na_any:", &__block_literal_global_29_0);

  return v2;
}

- (uint64_t)hf_hasAtLeastOneReachableHomeMediaAccessory
{
  v1 = [a1 accessories];
  uint64_t v2 = objc_msgSend(v1, "na_any:", &__block_literal_global_32_0);

  return v2;
}

- (HFRoomDashboardReorderableItemList)hf_reorderableDashboardSectionList
{
  v1 = [[HFRoomDashboardReorderableItemList alloc] initWithApplicationDataContainer:a1 category:@"dashboardSections"];
  return v1;
}

- (id)hf_dashboardSectionReorderableUUIDStringComparator
{
  objc_initWeak(&location, val);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __73__HMRoom_HFAdditions__hf_dashboardSectionReorderableUUIDStringComparator__block_invoke;
  v3[3] = &unk_264092370;
  objc_copyWeak(&v4, &location);
  v1 = _Block_copy(v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
  return v1;
}

- (id)hf_roomsSortDescriptorUsingDashboardSectionOrder
{
  id v2 = objc_alloc(MEMORY[0x263F08B30]);
  v3 = [a1 home];
  id v4 = objc_msgSend(v3, "hf_dashboardSectionReorderableUUIDStringComparator");
  uint64_t v5 = (void *)[v2 initWithKey:@"uniqueIdentifier.UUIDString" ascending:1 comparator:v4];

  return v5;
}

- (id)hf_allNonEmptyActionSets
{
  id v2 = [a1 home];
  v3 = objc_msgSend(v2, "hf_allNonEmptyActionSets");
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __47__HMRoom_HFAdditions__hf_allNonEmptyActionSets__block_invoke;
  v6[3] = &unk_26408E348;
  v6[4] = a1;
  id v4 = objc_msgSend(v3, "na_filter:", v6);

  return v4;
}

- (id)hf_accessoryRepresentableUsageCountsWithFilter:()HFAdditions
{
  id v4 = a3;
  uint64_t v5 = [HFBiomeUsageCountsFetchRequest alloc];
  __int16 v6 = [a1 home];
  unsigned int v7 = [(HFBiomeUsageCountsFetchRequest *)v5 initWithHome:v6];

  [(HFBiomeAbstractFetchRequest *)v7 setRoom:a1];
  [(HFBiomeUsageCountsFetchRequest *)v7 setFilter:v4];

  uint64_t v8 = [(HFBiomeAbstractFetchRequest *)v7 fetch];

  return v8;
}

@end