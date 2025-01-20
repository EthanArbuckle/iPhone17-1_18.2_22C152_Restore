@interface HMDConfigurationLogEvent
- (BOOL)isFMFDevice;
- (BOOL)isMediaOnlyConfiguration;
- (BOOL)isPrimaryResidentForSomeHome;
- (BOOL)isResidentCapable;
- (BOOL)isResidentElectionV2EnabledAnyHome;
- (BOOL)isResidentEnabled;
- (BOOL)isResidentFirstEnabledAnyHome;
- (BOOL)isSubmitted;
- (BOOL)isTelevisionOnlyConfiguration;
- (HMDConfigurationLogEvent)initWithHomeConfigurations:(id)a3 widgetDataSource:(id)a4 isFMFDevice:(BOOL)a5;
- (HMDConfigurationLogEvent)initWithHomeManager:(id)a3 widgetDataSource:(id)a4 metadataVersion:(unsigned int)a5;
- (NSArray)homeConfigurations;
- (int64_t)totalAdminUsers;
- (int64_t)totalRestrictedGuests;
- (int64_t)totalUsers;
- (int64_t)totalWidgets;
- (unint64_t)currentUserPrivilegeBitMask;
- (unint64_t)instanceId;
- (unint64_t)totalAccessories;
- (unint64_t)totalActiveTriggers;
- (unint64_t)totalAppleAudioAccessories;
- (unint64_t)totalAppleMediaAccessories;
- (unint64_t)totalAppleMediaCategoryBitMask;
- (unint64_t)totalAppleTVAccessories;
- (unint64_t)totalBridgedAccessories;
- (unint64_t)totalCHIPAccessories;
- (unint64_t)totalCameraAccessories;
- (unint64_t)totalCameraAccessoriesRecordingEnabled;
- (unint64_t)totalCertifiedAccessories;
- (unint64_t)totalEnabledResidents;
- (unint64_t)totalHAPAccessories;
- (unint64_t)totalHAPBTAccessories;
- (unint64_t)totalHAPIPAccessories;
- (unint64_t)totalHAPSpeakerAccessories;
- (unint64_t)totalHomeCategoryBitMask;
- (unint64_t)totalHomes;
- (unint64_t)totalNonEmptyHomes;
- (unint64_t)totalOwnedHomes;
- (unint64_t)totalResidentElectionBitMask;
- (unint64_t)totalResidentEnabledHomes;
- (unint64_t)totalScenes;
- (unint64_t)totalSmartHomeAccessories;
- (unint64_t)totalTelevisionServiceAccessories;
- (unint64_t)totalThirdPartyMediaAccessories;
- (unint64_t)totalThirdPartyMediaCategoryBitMask;
- (unint64_t)totalThreadAccessories;
- (unint64_t)totalTriggers;
- (unint64_t)totalUserPrivilegeBitMask;
- (unint64_t)totalWholeHouseAudioAccessories;
- (unsigned)databaseSize;
- (unsigned)metadataVersion;
@end

@implementation HMDConfigurationLogEvent

- (void).cxx_destruct
{
}

- (BOOL)isFMFDevice
{
  return self->_isFMFDevice;
}

- (unint64_t)totalResidentElectionBitMask
{
  return self->_totalResidentElectionBitMask;
}

- (BOOL)isResidentElectionV2EnabledAnyHome
{
  return self->_isResidentElectionV2EnabledAnyHome;
}

- (BOOL)isResidentFirstEnabledAnyHome
{
  return self->_isResidentFirstEnabledAnyHome;
}

- (BOOL)isPrimaryResidentForSomeHome
{
  return self->_isPrimaryResidentForSomeHome;
}

- (BOOL)isResidentEnabled
{
  return self->_isResidentEnabled;
}

- (BOOL)isResidentCapable
{
  return self->_isResidentCapable;
}

- (unsigned)metadataVersion
{
  return self->_metadataVersion;
}

- (unsigned)databaseSize
{
  return self->_databaseSize;
}

- (int64_t)totalWidgets
{
  return self->_totalWidgets;
}

- (unint64_t)totalActiveTriggers
{
  return self->_totalActiveTriggers;
}

- (unint64_t)totalTriggers
{
  return self->_totalTriggers;
}

- (unint64_t)totalScenes
{
  return self->_totalScenes;
}

- (unint64_t)totalEnabledResidents
{
  return self->_totalEnabledResidents;
}

- (unint64_t)totalHAPSpeakerAccessories
{
  return self->_totalHAPSpeakerAccessories;
}

- (unint64_t)totalWholeHouseAudioAccessories
{
  return self->_totalWholeHouseAudioAccessories;
}

- (unint64_t)totalThirdPartyMediaAccessories
{
  return self->_totalThirdPartyMediaAccessories;
}

- (unint64_t)totalAppleTVAccessories
{
  return self->_totalAppleTVAccessories;
}

- (unint64_t)totalAppleAudioAccessories
{
  return self->_totalAppleAudioAccessories;
}

- (unint64_t)totalAppleMediaAccessories
{
  return self->_totalAppleMediaAccessories;
}

- (unint64_t)totalCameraAccessoriesRecordingEnabled
{
  return self->_totalCameraAccessoriesRecordingEnabled;
}

- (unint64_t)totalCameraAccessories
{
  return self->_totalCameraAccessories;
}

- (unint64_t)totalTelevisionServiceAccessories
{
  return self->_totalTelevisionServiceAccessories;
}

- (unint64_t)totalBridgedAccessories
{
  return self->_totalBridgedAccessories;
}

- (unint64_t)totalThreadAccessories
{
  return self->_totalThreadAccessories;
}

- (unint64_t)totalCHIPAccessories
{
  return self->_totalCHIPAccessories;
}

- (unint64_t)totalHAPBTAccessories
{
  return self->_totalHAPBTAccessories;
}

- (unint64_t)totalHAPIPAccessories
{
  return self->_totalHAPIPAccessories;
}

- (unint64_t)totalHAPAccessories
{
  return self->_totalHAPAccessories;
}

- (unint64_t)totalSmartHomeAccessories
{
  return self->_totalSmartHomeAccessories;
}

- (unint64_t)totalCertifiedAccessories
{
  return self->_totalCertifiedAccessories;
}

- (unint64_t)totalAccessories
{
  return self->_totalAccessories;
}

- (unint64_t)currentUserPrivilegeBitMask
{
  return self->_currentUserPrivilegeBitMask;
}

- (unint64_t)totalUserPrivilegeBitMask
{
  return self->_totalUserPrivilegeBitMask;
}

- (int64_t)totalRestrictedGuests
{
  return self->_totalRestrictedGuests;
}

- (int64_t)totalAdminUsers
{
  return self->_totalAdminUsers;
}

- (int64_t)totalUsers
{
  return self->_totalUsers;
}

- (unint64_t)totalThirdPartyMediaCategoryBitMask
{
  return self->_totalThirdPartyMediaCategoryBitMask;
}

- (unint64_t)totalAppleMediaCategoryBitMask
{
  return self->_totalAppleMediaCategoryBitMask;
}

- (unint64_t)totalHomeCategoryBitMask
{
  return self->_totalHomeCategoryBitMask;
}

- (unint64_t)totalResidentEnabledHomes
{
  return self->_totalResidentEnabledHomes;
}

- (unint64_t)totalOwnedHomes
{
  return self->_totalOwnedHomes;
}

- (unint64_t)totalNonEmptyHomes
{
  return self->_totalNonEmptyHomes;
}

- (unint64_t)totalHomes
{
  return self->_totalHomes;
}

- (NSArray)homeConfigurations
{
  return self->_homeConfigurations;
}

- (unint64_t)instanceId
{
  return self->_instanceId;
}

- (BOOL)isSubmitted
{
  return 0;
}

- (BOOL)isMediaOnlyConfiguration
{
  unint64_t v3 = [(HMDConfigurationLogEvent *)self totalAccessories];
  if (v3)
  {
    unint64_t v4 = [(HMDConfigurationLogEvent *)self totalAccessories];
    unint64_t v5 = [(HMDConfigurationLogEvent *)self totalTelevisionServiceAccessories];
    unint64_t v6 = [(HMDConfigurationLogEvent *)self totalHAPSpeakerAccessories] + v5;
    unint64_t v7 = [(HMDConfigurationLogEvent *)self totalWholeHouseAudioAccessories];
    LOBYTE(v3) = v4 == v6
                     + v7
                     + [(HMDConfigurationLogEvent *)self totalAppleMediaAccessories];
  }
  return v3;
}

- (BOOL)isTelevisionOnlyConfiguration
{
  unint64_t v3 = [(HMDConfigurationLogEvent *)self totalAccessories];
  if (v3)
  {
    unint64_t v4 = [(HMDConfigurationLogEvent *)self totalAccessories];
    LOBYTE(v3) = v4 == [(HMDConfigurationLogEvent *)self totalTelevisionServiceAccessories];
  }
  return v3;
}

- (HMDConfigurationLogEvent)initWithHomeConfigurations:(id)a3 widgetDataSource:(id)a4 isFMFDevice:(BOOL)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  v25.receiver = self;
  v25.super_class = (Class)HMDConfigurationLogEvent;
  v11 = [(HMMLogEvent *)&v25 init];
  if (v11)
  {
    id v20 = v9;
    os_unfair_lock_lock_with_options();
    v11->_instanceId = ++_currentInstanceId;
    os_unfair_lock_unlock((os_unfair_lock_t)&_lock_25428);
    id v19 = v10;
    v11->_totalWidgets = [v10 configuredWidgetsCount];
    objc_storeStrong((id *)&v11->_homeConfigurations, a3);
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    v12 = [(HMDConfigurationLogEvent *)v11 homeConfigurations];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v22 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          ++v11->_totalHomes;
          v11->_totalHomeCategoryBitMask |= [v17 homeCategoryBitMask];
          v11->_totalAppleMediaCategoryBitMask |= [v17 appleMediaCategoryBitMask];
          v11->_totalThirdPartyMediaCategoryBitMask |= [v17 thirdPartyMediaCategoryBitMask];
          if ([v17 numAccessories])
          {
            ++v11->_totalNonEmptyHomes;
            if ([v17 isOwnerUser]) {
              ++v11->_totalOwnedHomes;
            }
            if ([v17 numResidentsEnabled]) {
              ++v11->_totalResidentEnabledHomes;
            }
            v11->_isResidentCapable |= [v17 isCurrentDeviceResidentCapable];
            v11->_isResidentEnabled |= [v17 isCurrentDeviceResidentEnabled];
            v11->_isPrimaryResidentForSomeHome |= [v17 isCurrentDevicePrimaryResident];
            v11->_isResidentFirstEnabledAnyHome |= [v17 isResidentFirstEnabled];
            v11->_isResidentElectionV2EnabledAnyHome |= [v17 isResidentElectionV2Enabled];
            v11->_totalResidentElectionBitMask |= [v17 residentElectionBitMask];
            v11->_totalUsers += [v17 numUsers];
            v11->_totalAdminUsers += [v17 numAdmins];
            v11->_totalRestrictedGuests += [v17 numRestrictedGuests];
            v11->_currentUserPrivilegeBitMask |= [v17 currentUserPrivilegeBitMask];
            v11->_totalUserPrivilegeBitMask |= [v17 userPrivilegeBitMask];
            v11->_totalAccessories += [v17 numAccessories];
            v11->_totalCertifiedAccessories += [v17 numCertifiedAccessories];
            v11->_totalSmartHomeAccessories += [v17 numSmartHomeAccessories];
            v11->_totalHAPAccessories += [v17 numHAPAccessories];
            v11->_totalHAPIPAccessories += [v17 numHAPIPAccessories];
            v11->_totalHAPBTAccessories += [v17 numHAPBTAccessories];
            v11->_totalCHIPAccessories += [v17 numCHIPAccessories];
            v11->_totalThreadAccessories += [v17 numThreadAccessories];
            v11->_totalBridgedAccessories += [v17 numBridgedAccessories];
            v11->_totalTelevisionServiceAccessories += [v17 numTelevisionServiceAccessories];
            v11->_totalCameraAccessories += [v17 numCameraAccessories];
            v11->_totalCameraAccessoriesRecordingEnabled += [v17 numCameraAccessoriesRecordingEnabled];
            v11->_totalAppleMediaAccessories += [v17 numAppleMediaAccessories];
            v11->_totalAppleAudioAccessories += [v17 numAppleAudioAccessories];
            v11->_totalAppleTVAccessories += [v17 numAppleTVAccessories];
            v11->_totalThirdPartyMediaAccessories += [v17 numThirdPartyMediaAccessories];
            v11->_totalHAPSpeakerAccessories += [v17 numPrimaryHAPSpeakerServiceAccessories];
            v11->_totalWholeHouseAudioAccessories += [v17 numWholeHouseAudioAccessories];
            v11->_totalEnabledResidents += [v17 numResidentsEnabled];
            v11->_totalScenes += [v17 numConfiguredScenes];
            v11->_totalTriggers += [v17 numTriggers];
            v11->_totalActiveTriggers += [v17 numActiveTriggers];
            v11->_databaseSize = [v17 databaseSize];
            v11->_metadataVersion = [v17 metadataVersion];
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v14);
    }

    v11->_isFMFDevice = a5;
    id v10 = v19;
    id v9 = v20;
  }

  return v11;
}

- (HMDConfigurationLogEvent)initWithHomeManager:(id)a3 widgetDataSource:(id)a4 metadataVersion:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = [MEMORY[0x1E4F1CA48] array];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = [v7 homes];
  uint64_t v10 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = 0;
    uint64_t v13 = *(void *)v21;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v21 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = -[HMDHomeConfigurationLogEvent initWithHome:configuredWidgetsCount:]([HMDHomeConfigurationLogEvent alloc], "initWithHome:configuredWidgetsCount:", *(void *)(*((void *)&v20 + 1) + 8 * v14++), [v8 configuredWidgetsCount]);
        [(HMDHomeConfigurationLogEvent *)v15 setHomeIndex:v12 + v14];
        -[HMDHomeConfigurationLogEvent setDatabaseSize:](v15, "setDatabaseSize:", [v7 homeDatabaseSize]);
        [(HMDHomeConfigurationLogEvent *)v15 setMetadataVersion:v5];
        [v9 addObject:v15];
      }
      while (v11 != v14);
      uint64_t v11 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
      v12 += v14;
    }
    while (v11);
  }

  v16 = [(HMDConfigurationLogEvent *)self initWithHomeConfigurations:v9 widgetDataSource:v8 isFMFDevice:isThisDeviceDesignatedFMFDevice()];
  return v16;
}

@end