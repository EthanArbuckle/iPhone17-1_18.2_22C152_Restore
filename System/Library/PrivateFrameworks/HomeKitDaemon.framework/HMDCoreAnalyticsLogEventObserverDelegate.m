@interface HMDCoreAnalyticsLogEventObserverDelegate
- (HMDCoreAnalyticsLogEventObserverDelegate)initWithDataSource:(id)a3;
- (HMDCoreAnalyticsLogEventObserverDelegateDataSource)dataSource;
- (NSDictionary)aggregatedHomeCategorizationDimensions;
- (NSDictionary)aggregatedHomeDimensions;
- (NSDictionary)deviceCapabilitiesAndEnablementsDimensions;
- (NSMutableDictionary)homeDimensions;
- (id)dimensionsForHome:(id)a3;
- (void)addAggregatedHomeDimensionsToEventDictionary:(id)a3;
- (void)addCommonDimensionsToEventDictionary:(id)a3;
- (void)addDimensionsForAccessoryIdentifier:(id)a3 toEventDictionary:(id)a4;
- (void)addDimensionsForHome:(id)a3 toEventDictionary:(id)a4;
- (void)configurationChanged;
@end

@implementation HMDCoreAnalyticsLogEventObserverDelegate

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeDimensions, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_aggregatedHomeDimensions, 0);
  objc_storeStrong((id *)&self->_deviceCapabilitiesAndEnablementsDimensions, 0);
  objc_storeStrong((id *)&self->_aggregatedHomeCategorizationDimensions, 0);
}

- (NSMutableDictionary)homeDimensions
{
  return self->_homeDimensions;
}

- (HMDCoreAnalyticsLogEventObserverDelegateDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (HMDCoreAnalyticsLogEventObserverDelegateDataSource *)WeakRetained;
}

- (id)dimensionsForHome:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  v5 = [(NSMutableDictionary *)self->_homeDimensions objectForKeyedSubscript:v4];
  if (!v5)
  {
    v6 = [(HMDCoreAnalyticsLogEventObserverDelegate *)self dataSource];
    v7 = [v6 cachedHomeConfigurationForHomeUUID:v4];

    if (v7)
    {
      v8 = [MEMORY[0x263EFF9A0] dictionary];
      v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "homeCategoryBitMask"));
      [v8 setObject:v9 forKeyedSubscript:@"homeCategoryBitMask"];

      v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "thirdPartyMediaCategoryBitMask"));
      [v8 setObject:v10 forKeyedSubscript:@"thirdPartyMediaBitMask"];

      v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "appleMediaCategoryBitMask"));
      [v8 setObject:v11 forKeyedSubscript:@"appleMediaBitMask"];

      v12 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v7, "isOwnerUser"));
      [v8 setObject:v12 forKeyedSubscript:@"isOwnerUserInHome"];

      v13 = NSNumber;
      BOOL v14 = [v7 currentUserPrivilege] == 3 || objc_msgSend(v7, "currentUserPrivilege") == 4;
      v15 = [v13 numberWithInt:v14];
      [v8 setObject:v15 forKeyedSubscript:@"isAdminUserInHome"];

      v16 = +[HMDLogEventHistograms configurationDataHistogram];
      v17 = objc_msgSend(v16, "intervalIndexForValue:", objc_msgSend(v7, "numUsers"));
      [v8 setObject:v17 forKeyedSubscript:@"numUsersInHome"];

      v18 = +[HMDLogEventHistograms configurationDataHistogram];
      v19 = objc_msgSend(v18, "intervalIndexForValue:", objc_msgSend(v7, "numAdmins"));
      [v8 setObject:v19 forKeyedSubscript:@"numAdminUsersInHome"];

      v20 = +[HMDLogEventHistograms configurationDataHistogram];
      v21 = objc_msgSend(v20, "intervalIndexForValue:", objc_msgSend(v7, "numRestrictedGuests"));
      [v8 setObject:v21 forKeyedSubscript:@"numRestrictedGuestsInHome"];

      v22 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "currentUserPrivilege"));
      [v8 setObject:v22 forKeyedSubscript:@"currentUserPrivilegeInHome"];

      v23 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "userPrivilegeBitMask"));
      [v8 setObject:v23 forKeyedSubscript:@"userPrivilegeBitMaskInHome"];

      v24 = +[HMDLogEventHistograms configurationDataHistogram];
      v25 = objc_msgSend(v24, "intervalIndexForValue:", objc_msgSend(v7, "numAccessories"));
      [v8 setObject:v25 forKeyedSubscript:@"numAccessoriesInHome"];

      v26 = +[HMDLogEventHistograms configurationDataHistogram];
      v27 = objc_msgSend(v26, "intervalIndexForValue:", objc_msgSend(v7, "numSmartHomeAccessories"));
      [v8 setObject:v27 forKeyedSubscript:@"numSmartHomeAccessoriesInHome"];

      v28 = +[HMDLogEventHistograms configurationDataHistogram];
      v29 = objc_msgSend(v28, "intervalIndexForValue:", objc_msgSend(v7, "numAppleMediaAccessories"));
      [v8 setObject:v29 forKeyedSubscript:@"numAppleMediaAccessoriesInHome"];

      v30 = +[HMDLogEventHistograms configurationDataHistogram];
      v31 = objc_msgSend(v30, "intervalIndexForValue:", objc_msgSend(v7, "numThirdPartyMediaAccessories"));
      [v8 setObject:v31 forKeyedSubscript:@"numThirdPartyMediaAccessoriesInHome"];

      v32 = +[HMDLogEventHistograms configurationDataHistogram];
      v33 = objc_msgSend(v32, "intervalIndexForValue:", objc_msgSend(v7, "numAppleAudioAccessories"));
      [v8 setObject:v33 forKeyedSubscript:@"numAppleAudioAccessoriesInHome"];

      v34 = +[HMDLogEventHistograms configurationDataHistogram];
      v35 = objc_msgSend(v34, "intervalIndexForValue:", objc_msgSend(v7, "numAppleTVAccessories"));
      [v8 setObject:v35 forKeyedSubscript:@"numAppleTVAccessoriesInHome"];

      v36 = +[HMDLogEventHistograms configurationDataHistogram];
      v37 = objc_msgSend(v36, "intervalIndexForValue:", objc_msgSend(v7, "numHAPAccessories"));
      [v8 setObject:v37 forKeyedSubscript:@"numHAPAccessoriesInHome"];

      v38 = +[HMDLogEventHistograms configurationDataHistogram];
      v39 = objc_msgSend(v38, "intervalIndexForValue:", objc_msgSend(v7, "numCHIPAccessories"));
      [v8 setObject:v39 forKeyedSubscript:@"numMatterAccessoriesInHome"];

      v40 = +[HMDLogEventHistograms configurationDataHistogram];
      v41 = objc_msgSend(v40, "intervalIndexForValue:", objc_msgSend(v7, "numCameraAccessories"));
      [v8 setObject:v41 forKeyedSubscript:@"numCameraAccessoriesInHome"];

      v42 = +[HMDLogEventHistograms configurationDataHistogram];
      v43 = objc_msgSend(v42, "intervalIndexForValue:", objc_msgSend(v7, "numCameraAccessoriesRecordingEnabled"));
      [v8 setObject:v43 forKeyedSubscript:@"numCamerasRecordingEnabledInHome"];

      v44 = +[HMDLogEventHistograms configurationDataHistogram];
      v45 = objc_msgSend(v44, "intervalIndexForValue:", objc_msgSend(v7, "numConfiguredWidgets"));
      [v8 setObject:v45 forKeyedSubscript:@"numWidgetsInHome"];

      v46 = +[HMDLogEventHistograms configurationDataHistogram];
      v47 = objc_msgSend(v46, "intervalIndexForValue:", objc_msgSend(v7, "numScenes"));
      [v8 setObject:v47 forKeyedSubscript:@"numScenesInHome"];

      v48 = +[HMDLogEventHistograms configurationDataHistogram];
      v49 = objc_msgSend(v48, "intervalIndexForValue:", objc_msgSend(v7, "numTriggers"));
      [v8 setObject:v49 forKeyedSubscript:@"numTriggersInHome"];

      v50 = +[HMDLogEventHistograms configurationDataHistogram];
      v51 = objc_msgSend(v50, "intervalIndexForValue:", objc_msgSend(v7, "numActiveTriggers"));
      [v8 setObject:v51 forKeyedSubscript:@"numActiveTriggersInHome"];

      v52 = +[HMDLogEventHistograms configurationDataHistogram];
      v53 = objc_msgSend(v52, "intervalIndexForValue:", objc_msgSend(v7, "numResidentsEnabled"));
      [v8 setObject:v53 forKeyedSubscript:@"numEnabledResidentsInHome"];

      v54 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "residentElectionBitMask"));
      [v8 setObject:v54 forKeyedSubscript:@"residentElectionBitMask"];

      v55 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v7, "isResidentSelectionEnabled"));
      [v8 setObject:v55 forKeyedSubscript:@"residentSelectionEnabledInHome"];

      v56 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "residentSelectionMode"));
      [v8 setObject:v56 forKeyedSubscript:@"residentSelectionModeInHome"];

      v57 = [v7 oldestTVOSBuildInHome];
      [v8 setObject:v57 forKeyedSubscript:@"oldestTVOSBuildInHome"];

      v58 = [v7 oldestTVOSVersionInHome];
      [v8 setObject:v58 forKeyedSubscript:@"oldestTVOSVersionInHome"];

      v59 = [v7 primaryResidentBuildInHome];
      [v8 setObject:v59 forKeyedSubscript:@"primaryResidentBuildInHome"];

      v60 = [v7 primaryResidentVersionInHome];
      [v8 setObject:v60 forKeyedSubscript:@"primaryResidentVersionInHome"];

      v5 = (void *)[v8 copy];
      [(NSMutableDictionary *)self->_homeDimensions setObject:v5 forKeyedSubscript:v4];
    }
    else
    {
      v5 = 0;
    }
  }
  os_unfair_lock_unlock(&self->_lock);

  return v5;
}

- (NSDictionary)aggregatedHomeDimensions
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  aggregatedHomeDimensions = self->_aggregatedHomeDimensions;
  if (!aggregatedHomeDimensions)
  {
    v5 = [MEMORY[0x263EFF9A0] dictionary];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    v7 = [WeakRetained cachedConfiguration];

    if (v7)
    {
      v8 = +[HMDLogEventHistograms configurationDataHistogram];
      v9 = objc_msgSend(v8, "intervalIndexForValue:", objc_msgSend(v7, "totalHomes"));
      [v5 setObject:v9 forKeyedSubscript:@"numHomes"];

      v10 = +[HMDLogEventHistograms configurationDataHistogram];
      v11 = objc_msgSend(v10, "intervalIndexForValue:", objc_msgSend(v7, "totalNonEmptyHomes"));
      [v5 setObject:v11 forKeyedSubscript:@"numNonEmptyHomes"];

      v12 = +[HMDLogEventHistograms configurationDataHistogram];
      v13 = objc_msgSend(v12, "intervalIndexForValue:", objc_msgSend(v7, "totalOwnedHomes"));
      [v5 setObject:v13 forKeyedSubscript:@"numOwnedHomes"];

      BOOL v14 = +[HMDLogEventHistograms configurationDataHistogram];
      v15 = objc_msgSend(v14, "intervalIndexForValue:", objc_msgSend(v7, "totalResidentEnabledHomes"));
      [v5 setObject:v15 forKeyedSubscript:@"numResidentEnabledHomes"];

      v16 = +[HMDLogEventHistograms configurationDataHistogram];
      v17 = objc_msgSend(v16, "intervalIndexForValue:", objc_msgSend(v7, "totalUsers"));
      [v5 setObject:v17 forKeyedSubscript:@"numUsers"];

      v18 = +[HMDLogEventHistograms configurationDataHistogram];
      v19 = objc_msgSend(v18, "intervalIndexForValue:", objc_msgSend(v7, "totalAdminUsers"));
      [v5 setObject:v19 forKeyedSubscript:@"numAdminUsers"];

      v20 = +[HMDLogEventHistograms configurationDataHistogram];
      v21 = objc_msgSend(v20, "intervalIndexForValue:", objc_msgSend(v7, "totalRestrictedGuests"));
      [v5 setObject:v21 forKeyedSubscript:@"numRestrictedGuests"];

      v22 = +[HMDLogEventHistograms configurationDataHistogram];
      v23 = objc_msgSend(v22, "intervalIndexForValue:", objc_msgSend(v7, "totalAccessories"));
      [v5 setObject:v23 forKeyedSubscript:@"numAccessories"];

      v24 = +[HMDLogEventHistograms configurationDataHistogram];
      v25 = objc_msgSend(v24, "intervalIndexForValue:", objc_msgSend(v7, "totalCertifiedAccessories"));
      [v5 setObject:v25 forKeyedSubscript:@"numCertifiedAccessories"];

      v26 = +[HMDLogEventHistograms configurationDataHistogram];
      v27 = objc_msgSend(v26, "intervalIndexForValue:", objc_msgSend(v7, "totalHAPAccessories"));
      [v5 setObject:v27 forKeyedSubscript:@"numHAPAccessories"];

      v28 = +[HMDLogEventHistograms configurationDataHistogram];
      v29 = objc_msgSend(v28, "intervalIndexForValue:", objc_msgSend(v7, "totalHAPIPAccessories"));
      [v5 setObject:v29 forKeyedSubscript:@"numHAPIPAccessories"];

      v30 = +[HMDLogEventHistograms configurationDataHistogram];
      v31 = objc_msgSend(v30, "intervalIndexForValue:", objc_msgSend(v7, "totalHAPBTAccessories"));
      [v5 setObject:v31 forKeyedSubscript:@"numHAPBTAccessories"];

      v32 = +[HMDLogEventHistograms configurationDataHistogram];
      v33 = objc_msgSend(v32, "intervalIndexForValue:", objc_msgSend(v7, "totalCHIPAccessories"));
      [v5 setObject:v33 forKeyedSubscript:@"numMatterAccessories"];

      v34 = +[HMDLogEventHistograms configurationDataHistogram];
      v35 = objc_msgSend(v34, "intervalIndexForValue:", objc_msgSend(v7, "totalThreadAccessories"));
      [v5 setObject:v35 forKeyedSubscript:@"numThreadAccessories"];

      v36 = +[HMDLogEventHistograms configurationDataHistogram];
      v37 = objc_msgSend(v36, "intervalIndexForValue:", objc_msgSend(v7, "totalTelevisionServiceAccessories"));
      [v5 setObject:v37 forKeyedSubscript:@"numTelevisionServiceAccessories"];

      v38 = +[HMDLogEventHistograms configurationDataHistogram];
      v39 = objc_msgSend(v38, "intervalIndexForValue:", objc_msgSend(v7, "totalBridgedAccessories"));
      [v5 setObject:v39 forKeyedSubscript:@"numBridgedAccessories"];

      v40 = +[HMDLogEventHistograms configurationDataHistogram];
      v41 = objc_msgSend(v40, "intervalIndexForValue:", objc_msgSend(v7, "totalCameraAccessories"));
      [v5 setObject:v41 forKeyedSubscript:@"numCameraAccessories"];

      v42 = +[HMDLogEventHistograms configurationDataHistogram];
      v43 = objc_msgSend(v42, "intervalIndexForValue:", objc_msgSend(v7, "totalCameraAccessoriesRecordingEnabled"));
      [v5 setObject:v43 forKeyedSubscript:@"numCameraAccessoriesRecordingEnabled"];

      v44 = +[HMDLogEventHistograms configurationDataHistogram];
      v45 = objc_msgSend(v44, "intervalIndexForValue:", objc_msgSend(v7, "totalScenes"));
      [v5 setObject:v45 forKeyedSubscript:@"numScenes"];

      v46 = +[HMDLogEventHistograms configurationDataHistogram];
      v47 = objc_msgSend(v46, "intervalIndexForValue:", objc_msgSend(v7, "totalTriggers"));
      [v5 setObject:v47 forKeyedSubscript:@"numTriggers"];

      v48 = +[HMDLogEventHistograms configurationDataHistogram];
      v49 = objc_msgSend(v48, "intervalIndexForValue:", objc_msgSend(v7, "totalActiveTriggers"));
      [v5 setObject:v49 forKeyedSubscript:@"numActiveTriggers"];

      v50 = +[HMDLogEventHistograms configurationDataHistogram];
      v51 = objc_msgSend(v50, "intervalIndexForValue:", objc_msgSend(v7, "totalWidgets"));
      [v5 setObject:v51 forKeyedSubscript:@"numHomeWidgetsEnabled"];

      v52 = +[HMDLogEventHistograms configurationDataHistogram];
      v53 = objc_msgSend(v52, "intervalIndexForValue:", objc_msgSend(v7, "totalAppleAudioAccessories"));
      [v5 setObject:v53 forKeyedSubscript:@"numAppleAudioAccessories"];

      v54 = +[HMDLogEventHistograms configurationDataHistogram];
      v55 = objc_msgSend(v54, "intervalIndexForValue:", objc_msgSend(v7, "totalAppleTVAccessories"));
      [v5 setObject:v55 forKeyedSubscript:@"numAppleTVAccessories"];

      v56 = +[HMDLogEventHistograms configurationDataHistogram];
      v57 = objc_msgSend(v56, "intervalIndexForValue:", objc_msgSend(v7, "totalEnabledResidents"));
      [v5 setObject:v57 forKeyedSubscript:@"numEnabledResidents"];

      v58 = +[HMDLogEventHistograms configurationDataHistogram];
      v59 = objc_msgSend(v58, "intervalIndexForValue:", objc_msgSend(v7, "totalSmartHomeAccessories"));
      [v5 setObject:v59 forKeyedSubscript:@"numSmartHomeAccessories"];

      v60 = +[HMDLogEventHistograms configurationDataHistogram];
      v61 = objc_msgSend(v60, "intervalIndexForValue:", objc_msgSend(v7, "totalAppleMediaAccessories"));
      [v5 setObject:v61 forKeyedSubscript:@"numAppleMediaAccessories"];

      v62 = +[HMDLogEventHistograms configurationDataHistogram];
      v63 = objc_msgSend(v62, "intervalIndexForValue:", objc_msgSend(v7, "totalThirdPartyMediaAccessories"));
      [v5 setObject:v63 forKeyedSubscript:@"numThirdPartyMediaAccessories"];

      v64 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "totalUserPrivilegeBitMask"));
      [v5 setObject:v64 forKeyedSubscript:@"totalUserPrivilegeBitMask"];

      v65 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v7, "isTelevisionOnlyConfiguration"));
      [v5 setObject:v65 forKeyedSubscript:@"televisionOnlyConfiguration"];

      v66 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v7, "isMediaOnlyConfiguration"));
      [v5 setObject:v66 forKeyedSubscript:@"mediaOnlyConfiguration"];
    }
    v67 = (NSDictionary *)[v5 copy];
    v68 = self->_aggregatedHomeDimensions;
    self->_aggregatedHomeDimensions = v67;

    aggregatedHomeDimensions = self->_aggregatedHomeDimensions;
  }
  v69 = aggregatedHomeDimensions;
  os_unfair_lock_unlock(p_lock);
  return v69;
}

- (NSDictionary)deviceCapabilitiesAndEnablementsDimensions
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  deviceCapabilitiesAndEnablementsDimensions = self->_deviceCapabilitiesAndEnablementsDimensions;
  if (!deviceCapabilitiesAndEnablementsDimensions)
  {
    v5 = [MEMORY[0x263EFF9A0] dictionary];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    v7 = [WeakRetained cachedConfiguration];

    if (v7)
    {
      v8 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v7, "isFMFDevice"));
      [v5 setObject:v8 forKeyedSubscript:@"isFMFDevice"];

      v9 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v7, "isResidentCapable"));
      [v5 setObject:v9 forKeyedSubscript:@"currentDeviceResidentCapable"];

      v10 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v7, "isResidentEnabled"));
      [v5 setObject:v10 forKeyedSubscript:@"currentDeviceResidentEnabled"];

      v11 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v7, "isPrimaryResidentForSomeHome"));
      [v5 setObject:v11 forKeyedSubscript:@"currentDeviceResidentPrimaryResidentAnyHome"];

      v12 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v7, "isResidentFirstEnabledAnyHome"));
      [v5 setObject:v12 forKeyedSubscript:@"isResidentFirstEnabledAnyHome"];

      v13 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v7, "isResidentElectionV2EnabledAnyHome"));
      [v5 setObject:v13 forKeyedSubscript:@"isResidentElectionV2EnabledAnyHome"];

      BOOL v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "totalResidentElectionBitMask"));
      [v5 setObject:v14 forKeyedSubscript:@"totalResidentElectionBitMask"];

      v15 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v7, "isResidentSelectionEnabledAnyHome"));
      [v5 setObject:v15 forKeyedSubscript:@"isResidentSelectionEnabledAnyHome"];

      v16 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v7, "isResidentSelectionModeAutoAnyHome"));
      [v5 setObject:v16 forKeyedSubscript:@"isResidentSelectionModeAutoAnyHome"];

      v17 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v7, "isResidentSelectionModeManualAnyHome"));
      [v5 setObject:v17 forKeyedSubscript:@"isResidentSelectionModeManualAnyHome"];

      v18 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v7, "isResidentSelectionModeCoordinationAnyHome"));
      [v5 setObject:v18 forKeyedSubscript:@"isResidentSelectionModeCoordinationAnyHome"];
    }
    [v5 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"isHH2Enabled"];
    [v5 setObject:&unk_26E470BE8 forKeyedSubscript:@"isHH2Enabled_INT"];
    v19 = (NSDictionary *)[v5 copy];
    v20 = self->_deviceCapabilitiesAndEnablementsDimensions;
    self->_deviceCapabilitiesAndEnablementsDimensions = v19;

    deviceCapabilitiesAndEnablementsDimensions = self->_deviceCapabilitiesAndEnablementsDimensions;
  }
  v21 = deviceCapabilitiesAndEnablementsDimensions;
  os_unfair_lock_unlock(p_lock);
  return v21;
}

- (NSDictionary)aggregatedHomeCategorizationDimensions
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  aggregatedHomeCategorizationDimensions = self->_aggregatedHomeCategorizationDimensions;
  if (!aggregatedHomeCategorizationDimensions)
  {
    v5 = [MEMORY[0x263EFF9A0] dictionary];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    v7 = [WeakRetained cachedConfiguration];

    if (v7)
    {
      v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "totalHomeCategoryBitMask"));
      [v5 setObject:v8 forKeyedSubscript:@"totalHomeCategoryBitMask"];

      v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "totalAppleMediaCategoryBitMask"));
      [v5 setObject:v9 forKeyedSubscript:@"totalAppleMediaBitMask"];

      v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "totalThirdPartyMediaCategoryBitMask"));
      [v5 setObject:v10 forKeyedSubscript:@"totalThirdPartyMediaBitMask"];

      v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "currentUserPrivilegeBitMask"));
      [v5 setObject:v11 forKeyedSubscript:@"currentUserPrivilegeBitMask"];
    }
    v12 = (NSDictionary *)[v5 copy];
    v13 = self->_aggregatedHomeCategorizationDimensions;
    self->_aggregatedHomeCategorizationDimensions = v12;

    aggregatedHomeCategorizationDimensions = self->_aggregatedHomeCategorizationDimensions;
  }
  BOOL v14 = aggregatedHomeCategorizationDimensions;
  os_unfair_lock_unlock(p_lock);
  return v14;
}

- (void)configurationChanged
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  aggregatedHomeCategorizationDimensions = self->_aggregatedHomeCategorizationDimensions;
  self->_aggregatedHomeCategorizationDimensions = 0;

  deviceCapabilitiesAndEnablementsDimensions = self->_deviceCapabilitiesAndEnablementsDimensions;
  self->_deviceCapabilitiesAndEnablementsDimensions = 0;

  aggregatedHomeDimensions = self->_aggregatedHomeDimensions;
  self->_aggregatedHomeDimensions = 0;

  [(NSMutableDictionary *)self->_homeDimensions removeAllObjects];
  os_unfair_lock_unlock(p_lock);
}

- (void)addDimensionsForHome:(id)a3 toEventDictionary:(id)a4
{
  id v6 = a4;
  id v7 = [(HMDCoreAnalyticsLogEventObserverDelegate *)self dimensionsForHome:a3];
  [v6 addEntriesFromDictionary:v7];
}

- (void)addAggregatedHomeDimensionsToEventDictionary:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDCoreAnalyticsLogEventObserverDelegate *)self aggregatedHomeDimensions];
  [v4 addEntriesFromDictionary:v5];
}

- (void)addDimensionsForAccessoryIdentifier:(id)a3 toEventDictionary:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [(HMDCoreAnalyticsLogEventObserverDelegate *)self dataSource];
  v9 = [v8 accessoryForIdentifier:v6];

  if (v9)
  {
    [v9 populateVendorDetailsForCoreAnalytics:v7 keyPrefix:@"accessory"];
  }
  else
  {
    v10 = (void *)MEMORY[0x230FBD990]();
    v11 = self;
    v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = HMFGetLogIdentifier();
      int v14 = 138543618;
      v15 = v13;
      __int16 v16 = 2114;
      id v17 = v6;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, "%{public}@Accessory with identifier %{public}@ doesn't exist", (uint8_t *)&v14, 0x16u);
    }
  }
}

- (void)addCommonDimensionsToEventDictionary:(id)a3
{
  id v4 = a3;
  id v25 = [(HMDCoreAnalyticsLogEventObserverDelegate *)self dataSource];
  id v5 = [(HMDCoreAnalyticsLogEventObserverDelegate *)self aggregatedHomeCategorizationDimensions];
  [v4 addEntriesFromDictionary:v5];

  id v6 = [(HMDCoreAnalyticsLogEventObserverDelegate *)self deviceCapabilitiesAndEnablementsDimensions];
  [v4 addEntriesFromDictionary:v6];

  id v7 = NSNumber;
  v8 = [v25 deviceStateProvider];
  v9 = objc_msgSend(v7, "numberWithUnsignedInteger:", objc_msgSend(v8, "currentDataSyncState"));
  [v4 setObject:v9 forKeyedSubscript:@"dataSyncState"];

  v10 = NSNumber;
  v11 = [v25 deviceStateProvider];
  v12 = objc_msgSend(v10, "numberWithUnsignedInteger:", objc_msgSend(v11, "currentHomeManagerStatus"));
  [v4 setObject:v12 forKeyedSubscript:@"homeManagerStatus"];

  v13 = NSNumber;
  int v14 = [v25 deviceStateProvider];
  v15 = objc_msgSend(v13, "numberWithInteger:", objc_msgSend(v14, "deviceDaysSinceSoftwareUpdate"));
  [v4 setObject:v15 forKeyedSubscript:@"daysSinceSWUpdate"];

  __int16 v16 = NSNumber;
  id v17 = [v25 deviceStateProvider];
  uint64_t v18 = objc_msgSend(v16, "numberWithUnsignedInteger:", objc_msgSend(v17, "bitMappedMissingKeys"));
  [v4 setObject:v18 forKeyedSubscript:@"missingKeyTypes"];

  v19 = NSNumber;
  v20 = [v25 deviceStateProvider];
  v21 = objc_msgSend(v19, "numberWithUnsignedInteger:", objc_msgSend(v20, "bitMappedDuplicateKeys"));
  [v4 setObject:v21 forKeyedSubscript:@"duplicateKeyTypes"];

  v22 = NSNumber;
  v23 = [v25 deviceStateProvider];
  v24 = objc_msgSend(v22, "numberWithBool:", objc_msgSend(v23, "hh2SentinelZoneExists"));
  [v4 setObject:v24 forKeyedSubscript:@"hh2SentinelZoneExists"];
}

- (HMDCoreAnalyticsLogEventObserverDelegate)initWithDataSource:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HMDCoreAnalyticsLogEventObserverDelegate;
  id v5 = [(HMDCoreAnalyticsLogEventObserverDelegate *)&v13 init];
  id v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_dataSource, v4);
    uint64_t v7 = [MEMORY[0x263EFF9A0] dictionary];
    homeDimensions = v6->_homeDimensions;
    v6->_homeDimensions = (NSMutableDictionary *)v7;

    objc_initWeak(&location, v6);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __63__HMDCoreAnalyticsLogEventObserverDelegate_initWithDataSource___block_invoke;
    v10[3] = &unk_264A1A898;
    objc_copyWeak(&v11, &location);
    [v4 addConfigurationChangedObserver:v10];
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }

  return v6;
}

void __63__HMDCoreAnalyticsLogEventObserverDelegate_initWithDataSource___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained configurationChanged];
}

@end