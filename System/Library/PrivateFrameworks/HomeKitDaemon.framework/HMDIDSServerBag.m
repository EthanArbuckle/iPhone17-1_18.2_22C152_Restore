@interface HMDIDSServerBag
+ (id)logCategory;
- (BOOL)fetchHomeWiFiInfosMessageDisable;
- (BOOL)hh2SuppressDuplicateUserModelBulletins;
- (BOOL)homeSafetySecurityEnabled;
- (BOOL)isHH2AutoMigrationEnabled;
- (BOOL)isHH2ManualMigrationEnabled;
- (BOOL)isHH2SoftwareReleased;
- (BOOL)statusKitResidentStatusEnabled;
- (HMDHomeKitVersion)minimumHomeKitVersionForOwnerMeDeviceAutoHH2MigrationWithSharedUsers;
- (HMDHomeKitVersion)minimumHomeKitVersionForOwnerMeDeviceAutoHH2MigrationWithoutSharedUsers;
- (HMDHomeKitVersion)minimumHomeKitVersionForOwnerOtherDevicesAutoHH2MigrationWithSharedUsers;
- (HMDHomeKitVersion)minimumHomeKitVersionForOwnerOtherDevicesAutoHH2MigrationWithoutSharedUsers;
- (HMDHomeKitVersion)minimumHomeKitVersionForOwnerResidentDevicesAutoHH2MigrationWithSharedUsers;
- (HMDHomeKitVersion)minimumHomeKitVersionForOwnerResidentDevicesAutoHH2MigrationWithoutSharedUsers;
- (HMDHomeKitVersion)minimumHomeKitVersionForSharedUserHH2MigrationByOwnerAuto;
- (HMDHomeKitVersion)minimumHomeKitVersionForSharedUserHH2MigrationByOwnerManual;
- (HMDHomeKitVersion)residentSelectionMinHomeKitVersion;
- (HMDHomeKitVersion)serverBagHomeKitVersionForKey:(void *)a1;
- (HMDIDSServerBag)init;
- (HMDIDSServerBag)initWithIDSServerBag:(id)a3 refreshTimer:(id)a4 keySuffix:(id)a5;
- (HMDIDSServerBagDelegate)delegate;
- (HMFTimer)refreshTimer;
- (IDSServerBag)idsServerBag;
- (NSNumber)hh2AutoMigrationWithSharedUserRampDivisor;
- (NSNumber)hh2AutoMigrationWithSharedUserRampRemainder;
- (NSNumber)hh2AutoMigrationWithoutSharedUserRampDivisor;
- (NSNumber)hh2AutoMigrationWithoutSharedUserRampRemainder;
- (NSNumber)residentDeviceManagerBlockPrimaryTakeoverDurationSeconds;
- (NSNumber)residentSelectionPreferredListGenerationEndHour;
- (NSNumber)residentSelectionPreferredListGenerationStartHour;
- (NSNumber)residentSelectionPreferredResidentEvaluationDelay;
- (NSNumber)residentSelectionPreferredResidentsListMaxSize;
- (NSNumber)residentSelectionReachabilityNotificationAfterConnectivityDelay;
- (NSNumber)residentSelectionStatusDebounceInterval;
- (NSNumber)residentSelectionTakeOverIfPrimaryIsNotViableInterval;
- (NSNumber)residentSelectionTakeOverInterval;
- (NSNumber)residentSelectionTakeOverOnlyIfCurrentPrimaryIsNotViableJitter;
- (NSNumber)residentSelectionUserPreferredReachabilityNotificationDelay;
- (NSNumber)statusKitConnectionTTSUNoReachablePrimaryTimeoutSeconds;
- (NSNumber)statusKitInitialConnectionTimeoutSeconds;
- (NSNumber)statusKitUnsubscribeFromChannelDebounceTimeSec;
- (NSString)keySuffix;
- (id)serverBagNumberValueForKey:(void *)a1;
- (id)serverBagValueForKey:(void *)a1;
- (void)configure;
- (void)setDelegate:(id)a3;
- (void)setFetchHomeWiFiInfosMessageDisable:(BOOL)a3;
- (void)setHh2AutoMigrationEnabled:(BOOL)a3;
- (void)setHh2AutoMigrationWithSharedUserRampDivisor:(id)a3;
- (void)setHh2AutoMigrationWithSharedUserRampRemainder:(id)a3;
- (void)setHh2AutoMigrationWithoutSharedUserRampDivisor:(id)a3;
- (void)setHh2AutoMigrationWithoutSharedUserRampRemainder:(id)a3;
- (void)setHh2ManualMigrationEnabled:(BOOL)a3;
- (void)setHh2SoftwareReleased:(BOOL)a3;
- (void)setHh2SuppressDuplicateUserModelBulletins:(BOOL)a3;
- (void)setHomeSafetySecurityEnabled:(BOOL)a3;
- (void)setMinimumHomeKitVersionForOwnerMeDeviceAutoHH2MigrationWithSharedUsers:(id)a3;
- (void)setMinimumHomeKitVersionForOwnerMeDeviceAutoHH2MigrationWithoutSharedUsers:(id)a3;
- (void)setMinimumHomeKitVersionForOwnerOtherDevicesAutoHH2MigrationWithSharedUsers:(id)a3;
- (void)setMinimumHomeKitVersionForOwnerOtherDevicesAutoHH2MigrationWithoutSharedUsers:(id)a3;
- (void)setMinimumHomeKitVersionForOwnerResidentDevicesAutoHH2MigrationWithSharedUsers:(id)a3;
- (void)setMinimumHomeKitVersionForOwnerResidentDevicesAutoHH2MigrationWithoutSharedUsers:(id)a3;
- (void)setMinimumHomeKitVersionForSharedUserHH2MigrationByOwnerAuto:(id)a3;
- (void)setMinimumHomeKitVersionForSharedUserHH2MigrationByOwnerManual:(id)a3;
- (void)setResidentDeviceManagerBlockPrimaryTakeoverDurationSeconds:(id)a3;
- (void)setResidentSelectionMinHomeKitVersion:(id)a3;
- (void)setResidentSelectionPreferredListGenerationEndHour:(id)a3;
- (void)setResidentSelectionPreferredListGenerationStartHour:(id)a3;
- (void)setResidentSelectionPreferredResidentEvaluationDelay:(id)a3;
- (void)setResidentSelectionPreferredResidentsListMaxSize:(id)a3;
- (void)setResidentSelectionReachabilityNotificationAfterConnectivityDelay:(id)a3;
- (void)setResidentSelectionStatusDebounceInterval:(id)a3;
- (void)setResidentSelectionTakeOverIfPrimaryIsNotViableInterval:(id)a3;
- (void)setResidentSelectionTakeOverInterval:(id)a3;
- (void)setResidentSelectionTakeOverOnlyIfCurrentPrimaryIsNotViableJitter:(id)a3;
- (void)setResidentSelectionUserPreferredReachabilityNotificationDelay:(id)a3;
- (void)setStatusKitConnectionTTSUNoReachablePrimaryTimeoutSeconds:(id)a3;
- (void)setStatusKitInitialConnectionTimeoutSeconds:(id)a3;
- (void)setStatusKitResidentStatusEnabled:(BOOL)a3;
- (void)setStatusKitUnsubscribeFromChannelDebounceTimeSec:(id)a3;
- (void)timerDidFire:(id)a3;
- (void)updateCachedValuesWithServerValues;
@end

@implementation HMDIDSServerBag

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keySuffix, 0);
  objc_storeStrong((id *)&self->_refreshTimer, 0);
  objc_storeStrong((id *)&self->_idsServerBag, 0);
  objc_storeStrong((id *)&self->_residentDeviceManagerBlockPrimaryTakeoverDurationSeconds, 0);
  objc_storeStrong((id *)&self->_residentSelectionUserPreferredReachabilityNotificationDelay, 0);
  objc_storeStrong((id *)&self->_residentSelectionReachabilityNotificationAfterConnectivityDelay, 0);
  objc_storeStrong((id *)&self->_residentSelectionMinHomeKitVersion, 0);
  objc_storeStrong((id *)&self->_residentSelectionPreferredListGenerationEndHour, 0);
  objc_storeStrong((id *)&self->_residentSelectionPreferredListGenerationStartHour, 0);
  objc_storeStrong((id *)&self->_residentSelectionTakeOverOnlyIfCurrentPrimaryIsNotViableJitter, 0);
  objc_storeStrong((id *)&self->_residentSelectionTakeOverInterval, 0);
  objc_storeStrong((id *)&self->_residentSelectionTakeOverIfPrimaryIsNotViableInterval, 0);
  objc_storeStrong((id *)&self->_residentSelectionStatusDebounceInterval, 0);
  objc_storeStrong((id *)&self->_residentSelectionPreferredResidentsListMaxSize, 0);
  objc_storeStrong((id *)&self->_residentSelectionPreferredResidentEvaluationDelay, 0);
  objc_storeStrong((id *)&self->_statusKitUnsubscribeFromChannelDebounceTimeSec, 0);
  objc_storeStrong((id *)&self->_statusKitConnectionTTSUNoReachablePrimaryTimeoutSeconds, 0);
  objc_storeStrong((id *)&self->_statusKitInitialConnectionTimeoutSeconds, 0);
  objc_storeStrong((id *)&self->_hh2AutoMigrationWithSharedUserRampRemainder, 0);
  objc_storeStrong((id *)&self->_hh2AutoMigrationWithSharedUserRampDivisor, 0);
  objc_storeStrong((id *)&self->_hh2AutoMigrationWithoutSharedUserRampRemainder, 0);
  objc_storeStrong((id *)&self->_hh2AutoMigrationWithoutSharedUserRampDivisor, 0);
  objc_storeStrong((id *)&self->_minimumHomeKitVersionForOwnerResidentDevicesAutoHH2MigrationWithSharedUsers, 0);
  objc_storeStrong((id *)&self->_minimumHomeKitVersionForOwnerOtherDevicesAutoHH2MigrationWithSharedUsers, 0);
  objc_storeStrong((id *)&self->_minimumHomeKitVersionForOwnerMeDeviceAutoHH2MigrationWithSharedUsers, 0);
  objc_storeStrong((id *)&self->_minimumHomeKitVersionForOwnerResidentDevicesAutoHH2MigrationWithoutSharedUsers, 0);
  objc_storeStrong((id *)&self->_minimumHomeKitVersionForOwnerOtherDevicesAutoHH2MigrationWithoutSharedUsers, 0);
  objc_storeStrong((id *)&self->_minimumHomeKitVersionForOwnerMeDeviceAutoHH2MigrationWithoutSharedUsers, 0);
  objc_storeStrong((id *)&self->_minimumHomeKitVersionForSharedUserHH2MigrationByOwnerAuto, 0);
  objc_storeStrong((id *)&self->_minimumHomeKitVersionForSharedUserHH2MigrationByOwnerManual, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (NSString)keySuffix
{
  return (NSString *)objc_getProperty(self, a2, 256, 1);
}

- (HMFTimer)refreshTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 248, 1);
}

- (IDSServerBag)idsServerBag
{
  return (IDSServerBag *)objc_getProperty(self, a2, 240, 1);
}

- (void)setFetchHomeWiFiInfosMessageDisable:(BOOL)a3
{
  self->_fetchHomeWiFiInfosMessageDisable = a3;
}

- (BOOL)fetchHomeWiFiInfosMessageDisable
{
  return self->_fetchHomeWiFiInfosMessageDisable;
}

- (void)setResidentDeviceManagerBlockPrimaryTakeoverDurationSeconds:(id)a3
{
}

- (NSNumber)residentDeviceManagerBlockPrimaryTakeoverDurationSeconds
{
  return (NSNumber *)objc_getProperty(self, a2, 232, 1);
}

- (void)setResidentSelectionUserPreferredReachabilityNotificationDelay:(id)a3
{
}

- (NSNumber)residentSelectionUserPreferredReachabilityNotificationDelay
{
  return (NSNumber *)objc_getProperty(self, a2, 224, 1);
}

- (void)setResidentSelectionReachabilityNotificationAfterConnectivityDelay:(id)a3
{
}

- (NSNumber)residentSelectionReachabilityNotificationAfterConnectivityDelay
{
  return (NSNumber *)objc_getProperty(self, a2, 216, 1);
}

- (void)setResidentSelectionMinHomeKitVersion:(id)a3
{
}

- (HMDHomeKitVersion)residentSelectionMinHomeKitVersion
{
  return (HMDHomeKitVersion *)objc_getProperty(self, a2, 208, 1);
}

- (void)setResidentSelectionPreferredListGenerationEndHour:(id)a3
{
}

- (NSNumber)residentSelectionPreferredListGenerationEndHour
{
  return (NSNumber *)objc_getProperty(self, a2, 200, 1);
}

- (void)setResidentSelectionPreferredListGenerationStartHour:(id)a3
{
}

- (NSNumber)residentSelectionPreferredListGenerationStartHour
{
  return (NSNumber *)objc_getProperty(self, a2, 192, 1);
}

- (void)setResidentSelectionTakeOverOnlyIfCurrentPrimaryIsNotViableJitter:(id)a3
{
}

- (NSNumber)residentSelectionTakeOverOnlyIfCurrentPrimaryIsNotViableJitter
{
  return (NSNumber *)objc_getProperty(self, a2, 184, 1);
}

- (void)setResidentSelectionTakeOverInterval:(id)a3
{
}

- (NSNumber)residentSelectionTakeOverInterval
{
  return (NSNumber *)objc_getProperty(self, a2, 176, 1);
}

- (void)setResidentSelectionTakeOverIfPrimaryIsNotViableInterval:(id)a3
{
}

- (NSNumber)residentSelectionTakeOverIfPrimaryIsNotViableInterval
{
  return (NSNumber *)objc_getProperty(self, a2, 168, 1);
}

- (void)setResidentSelectionStatusDebounceInterval:(id)a3
{
}

- (NSNumber)residentSelectionStatusDebounceInterval
{
  return (NSNumber *)objc_getProperty(self, a2, 160, 1);
}

- (void)setResidentSelectionPreferredResidentsListMaxSize:(id)a3
{
}

- (NSNumber)residentSelectionPreferredResidentsListMaxSize
{
  return (NSNumber *)objc_getProperty(self, a2, 152, 1);
}

- (void)setResidentSelectionPreferredResidentEvaluationDelay:(id)a3
{
}

- (NSNumber)residentSelectionPreferredResidentEvaluationDelay
{
  return (NSNumber *)objc_getProperty(self, a2, 144, 1);
}

- (void)setStatusKitUnsubscribeFromChannelDebounceTimeSec:(id)a3
{
}

- (NSNumber)statusKitUnsubscribeFromChannelDebounceTimeSec
{
  return (NSNumber *)objc_getProperty(self, a2, 136, 1);
}

- (void)setStatusKitConnectionTTSUNoReachablePrimaryTimeoutSeconds:(id)a3
{
}

- (NSNumber)statusKitConnectionTTSUNoReachablePrimaryTimeoutSeconds
{
  return (NSNumber *)objc_getProperty(self, a2, 128, 1);
}

- (void)setStatusKitInitialConnectionTimeoutSeconds:(id)a3
{
}

- (NSNumber)statusKitInitialConnectionTimeoutSeconds
{
  return (NSNumber *)objc_getProperty(self, a2, 120, 1);
}

- (void)setStatusKitResidentStatusEnabled:(BOOL)a3
{
  self->_statusKitResidentStatusEnabled = a3;
}

- (BOOL)statusKitResidentStatusEnabled
{
  return self->_statusKitResidentStatusEnabled;
}

- (void)setHh2AutoMigrationWithSharedUserRampRemainder:(id)a3
{
}

- (NSNumber)hh2AutoMigrationWithSharedUserRampRemainder
{
  return (NSNumber *)objc_getProperty(self, a2, 112, 1);
}

- (void)setHh2AutoMigrationWithSharedUserRampDivisor:(id)a3
{
}

- (NSNumber)hh2AutoMigrationWithSharedUserRampDivisor
{
  return (NSNumber *)objc_getProperty(self, a2, 104, 1);
}

- (void)setHh2AutoMigrationWithoutSharedUserRampRemainder:(id)a3
{
}

- (NSNumber)hh2AutoMigrationWithoutSharedUserRampRemainder
{
  return (NSNumber *)objc_getProperty(self, a2, 96, 1);
}

- (void)setHh2AutoMigrationWithoutSharedUserRampDivisor:(id)a3
{
}

- (NSNumber)hh2AutoMigrationWithoutSharedUserRampDivisor
{
  return (NSNumber *)objc_getProperty(self, a2, 88, 1);
}

- (void)setHomeSafetySecurityEnabled:(BOOL)a3
{
  self->_homeSafetySecurityEnabled = a3;
}

- (BOOL)homeSafetySecurityEnabled
{
  return self->_homeSafetySecurityEnabled;
}

- (void)setHh2SuppressDuplicateUserModelBulletins:(BOOL)a3
{
  self->_hh2SuppressDuplicateUserModelBulletins = a3;
}

- (BOOL)hh2SuppressDuplicateUserModelBulletins
{
  return self->_hh2SuppressDuplicateUserModelBulletins;
}

- (void)setMinimumHomeKitVersionForOwnerResidentDevicesAutoHH2MigrationWithSharedUsers:(id)a3
{
}

- (HMDHomeKitVersion)minimumHomeKitVersionForOwnerResidentDevicesAutoHH2MigrationWithSharedUsers
{
  return (HMDHomeKitVersion *)objc_getProperty(self, a2, 80, 1);
}

- (void)setMinimumHomeKitVersionForOwnerOtherDevicesAutoHH2MigrationWithSharedUsers:(id)a3
{
}

- (HMDHomeKitVersion)minimumHomeKitVersionForOwnerOtherDevicesAutoHH2MigrationWithSharedUsers
{
  return (HMDHomeKitVersion *)objc_getProperty(self, a2, 72, 1);
}

- (void)setMinimumHomeKitVersionForOwnerMeDeviceAutoHH2MigrationWithSharedUsers:(id)a3
{
}

- (HMDHomeKitVersion)minimumHomeKitVersionForOwnerMeDeviceAutoHH2MigrationWithSharedUsers
{
  return (HMDHomeKitVersion *)objc_getProperty(self, a2, 64, 1);
}

- (void)setMinimumHomeKitVersionForOwnerResidentDevicesAutoHH2MigrationWithoutSharedUsers:(id)a3
{
}

- (HMDHomeKitVersion)minimumHomeKitVersionForOwnerResidentDevicesAutoHH2MigrationWithoutSharedUsers
{
  return (HMDHomeKitVersion *)objc_getProperty(self, a2, 56, 1);
}

- (void)setMinimumHomeKitVersionForOwnerOtherDevicesAutoHH2MigrationWithoutSharedUsers:(id)a3
{
}

- (HMDHomeKitVersion)minimumHomeKitVersionForOwnerOtherDevicesAutoHH2MigrationWithoutSharedUsers
{
  return (HMDHomeKitVersion *)objc_getProperty(self, a2, 48, 1);
}

- (void)setMinimumHomeKitVersionForOwnerMeDeviceAutoHH2MigrationWithoutSharedUsers:(id)a3
{
}

- (HMDHomeKitVersion)minimumHomeKitVersionForOwnerMeDeviceAutoHH2MigrationWithoutSharedUsers
{
  return (HMDHomeKitVersion *)objc_getProperty(self, a2, 40, 1);
}

- (void)setMinimumHomeKitVersionForSharedUserHH2MigrationByOwnerAuto:(id)a3
{
}

- (HMDHomeKitVersion)minimumHomeKitVersionForSharedUserHH2MigrationByOwnerAuto
{
  return (HMDHomeKitVersion *)objc_getProperty(self, a2, 32, 1);
}

- (void)setMinimumHomeKitVersionForSharedUserHH2MigrationByOwnerManual:(id)a3
{
}

- (HMDHomeKitVersion)minimumHomeKitVersionForSharedUserHH2MigrationByOwnerManual
{
  return (HMDHomeKitVersion *)objc_getProperty(self, a2, 24, 1);
}

- (void)setHh2AutoMigrationEnabled:(BOOL)a3
{
  self->_hh2AutoMigrationEnabled = a3;
}

- (BOOL)isHH2AutoMigrationEnabled
{
  return self->_hh2AutoMigrationEnabled;
}

- (void)setHh2ManualMigrationEnabled:(BOOL)a3
{
  self->_hh2ManualMigrationEnabled = a3;
}

- (BOOL)isHH2ManualMigrationEnabled
{
  return self->_hh2ManualMigrationEnabled;
}

- (void)setHh2SoftwareReleased:(BOOL)a3
{
  self->_hh2SoftwareReleased = a3;
}

- (BOOL)isHH2SoftwareReleased
{
  return self->_hh2SoftwareReleased;
}

- (void)setDelegate:(id)a3
{
}

- (HMDIDSServerBagDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMDIDSServerBagDelegate *)WeakRetained;
}

- (void)timerDidFire:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDIDSServerBag *)self refreshTimer];

  if (v5 == v4)
  {
    v6 = (void *)MEMORY[0x230FBD990]();
    v7 = self;
    v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = HMFGetLogIdentifier();
      int v10 = 138543362;
      v11 = v9;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Server bag refresh timer fired", (uint8_t *)&v10, 0xCu);
    }
    -[HMDIDSServerBag updateCachedValuesWithServerValues](v7);
  }
}

- (void)updateCachedValuesWithServerValues
{
  uint64_t v289 = *MEMORY[0x263EF8340];
  if (a1)
  {
    uint64_t v2 = -[HMDIDSServerBag serverBagNumberValueForKey:](a1, @"hh2SoftwareReleased");
    v282 = (void *)v2;
    if (!v2
      || (v3 = (void *)v2,
          int v4 = [a1 isHH2SoftwareReleased],
          v4 == [v3 BOOLValue]))
    {
      int v11 = 0;
    }
    else
    {
      id v5 = (void *)MEMORY[0x230FBD990]();
      id v6 = a1;
      v7 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v8 = HMFGetLogIdentifier();
        [v6 isHH2SoftwareReleased];
        v9 = HMFBooleanToString();
        [v3 BOOLValue];
        int v10 = HMFBooleanToString();
        *(_DWORD *)buf = 138543874;
        v284 = v8;
        __int16 v285 = 2112;
        v286 = v9;
        __int16 v287 = 2112;
        v288 = v10;
        _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Updating hh2SoftwareReleased from %@ to %@", buf, 0x20u);

        v3 = v282;
      }

      objc_msgSend(v6, "setHh2SoftwareReleased:", objc_msgSend(v3, "BOOLValue"));
      int v11 = 1;
    }
    uint64_t v12 = -[HMDIDSServerBag serverBagNumberValueForKey:](a1, @"hh2ManualMigrationEnabledV2");
    uint64_t v13 = -[HMDIDSServerBag serverBagNumberValueForKey:](a1, @"home-rme-c");
    if ([(id)v12 BOOLValue]) {
      uint64_t v14 = 1;
    }
    else {
      uint64_t v14 = [(id)v13 BOOLValue];
    }
    v280 = (void *)v13;
    v281 = (void *)v12;
    if (v12 | v13 && v14 != [a1 isHH2ManualMigrationEnabled])
    {
      v15 = (void *)MEMORY[0x230FBD990]();
      id v16 = a1;
      v17 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        v18 = HMFGetLogIdentifier();
        [v16 isHH2ManualMigrationEnabled];
        v19 = HMFBooleanToString();
        v20 = HMFBooleanToString();
        *(_DWORD *)buf = 138543874;
        v284 = v18;
        __int16 v285 = 2112;
        v286 = v19;
        __int16 v287 = 2112;
        v288 = v20;
        _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_INFO, "%{public}@Updating hh2ManualMigrationEnabled from %@ to %@", buf, 0x20u);
      }
      [v16 setHh2ManualMigrationEnabled:v14];
      int v11 = 1;
    }
    uint64_t v21 = -[HMDIDSServerBag serverBagNumberValueForKey:](a1, @"hh2AutoMigrationEnabledV2");
    uint64_t v22 = -[HMDIDSServerBag serverBagNumberValueForKey:](a1, @"home-rae-c");
    if ([(id)v21 BOOLValue]) {
      uint64_t v23 = 1;
    }
    else {
      uint64_t v23 = [(id)v22 BOOLValue];
    }
    if (v21 | v22 && v23 != [a1 isHH2AutoMigrationEnabled])
    {
      v24 = (void *)MEMORY[0x230FBD990]();
      id v25 = a1;
      v26 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        v27 = HMFGetLogIdentifier();
        [v25 isHH2AutoMigrationEnabled];
        v28 = HMFBooleanToString();
        v29 = HMFBooleanToString();
        *(_DWORD *)buf = 138543874;
        v284 = v27;
        __int16 v285 = 2112;
        v286 = v28;
        __int16 v287 = 2112;
        v288 = v29;
        _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_INFO, "%{public}@Updating hh2AutoMigrationEnabled from %@ to %@", buf, 0x20u);
      }
      [v25 setHh2AutoMigrationEnabled:v23];
      int v11 = 1;
    }
    v30 = -[HMDIDSServerBag serverBagNumberValueForKey:](a1, @"home-ramrd");
    v276 = (void *)v21;
    v279 = (void *)v22;
    if (v30
      && ([a1 hh2AutoMigrationWithoutSharedUserRampDivisor],
          v31 = objc_claimAutoreleasedReturnValue(),
          char v32 = [v31 isEqual:v30],
          v31,
          (v32 & 1) == 0))
    {
      v34 = (void *)MEMORY[0x230FBD990]();
      id v35 = a1;
      v36 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        v37 = HMFGetLogIdentifier();
        v38 = [v35 hh2AutoMigrationWithoutSharedUserRampDivisor];
        *(_DWORD *)buf = 138543874;
        v284 = v37;
        __int16 v285 = 2112;
        v286 = v38;
        __int16 v287 = 2112;
        v288 = v30;
        _os_log_impl(&dword_22F52A000, v36, OS_LOG_TYPE_INFO, "%{public}@Updating hh2AutoMigrationWithoutSharedUserRampDivisor from %@ to %@", buf, 0x20u);
      }
      [v35 setHh2AutoMigrationWithoutSharedUserRampDivisor:v30];
      int v33 = 1;
    }
    else
    {
      int v33 = 0;
    }

    v39 = -[HMDIDSServerBag serverBagNumberValueForKey:](a1, @"home-ramrr");
    if (v39)
    {
      v40 = [a1 hh2AutoMigrationWithoutSharedUserRampRemainder];
      char v41 = [v40 isEqual:v39];

      if ((v41 & 1) == 0)
      {
        v42 = (void *)MEMORY[0x230FBD990]();
        id v43 = a1;
        v44 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
        {
          v45 = HMFGetLogIdentifier();
          v46 = [v43 hh2AutoMigrationWithoutSharedUserRampRemainder];
          *(_DWORD *)buf = 138543874;
          v284 = v45;
          __int16 v285 = 2112;
          v286 = v46;
          __int16 v287 = 2112;
          v288 = v39;
          _os_log_impl(&dword_22F52A000, v44, OS_LOG_TYPE_INFO, "%{public}@Updating hh2AutoMigrationWithoutSharedUserRampRemainder from %@ to %@", buf, 0x20u);
        }
        [v43 setHh2AutoMigrationWithoutSharedUserRampRemainder:v39];
        int v33 = 1;
      }
    }

    v47 = -[HMDIDSServerBag serverBagNumberValueForKey:](a1, @"home-ramrdwsu");
    if (v47)
    {
      v48 = [a1 hh2AutoMigrationWithSharedUserRampDivisor];
      char v49 = [v48 isEqual:v47];

      if ((v49 & 1) == 0)
      {
        v50 = (void *)MEMORY[0x230FBD990]();
        id v51 = a1;
        v52 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
        {
          v53 = HMFGetLogIdentifier();
          v54 = [v51 hh2AutoMigrationWithSharedUserRampDivisor];
          *(_DWORD *)buf = 138543874;
          v284 = v53;
          __int16 v285 = 2112;
          v286 = v54;
          __int16 v287 = 2112;
          v288 = v47;
          _os_log_impl(&dword_22F52A000, v52, OS_LOG_TYPE_INFO, "%{public}@Updating hh2AutoMigrationWithSharedUserRampDivisor from %@ to %@", buf, 0x20u);
        }
        [v51 setHh2AutoMigrationWithSharedUserRampDivisor:v47];
        int v33 = 1;
      }
    }

    v55 = -[HMDIDSServerBag serverBagNumberValueForKey:](a1, @"home-ramrrwsu");
    if (v55)
    {
      v56 = [a1 hh2AutoMigrationWithSharedUserRampRemainder];
      char v57 = [v56 isEqual:v55];

      if ((v57 & 1) == 0)
      {
        v58 = (void *)MEMORY[0x230FBD990]();
        id v59 = a1;
        v60 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
        {
          v61 = HMFGetLogIdentifier();
          v62 = [v59 hh2AutoMigrationWithSharedUserRampRemainder];
          *(_DWORD *)buf = 138543874;
          v284 = v61;
          __int16 v285 = 2112;
          v286 = v62;
          __int16 v287 = 2112;
          v288 = v55;
          _os_log_impl(&dword_22F52A000, v60, OS_LOG_TYPE_INFO, "%{public}@Updating hh2AutoMigrationWithSharedUserRampRemainder from %@ to %@", buf, 0x20u);
        }
        [v59 setHh2AutoMigrationWithSharedUserRampRemainder:v55];
        int v33 = 1;
      }
    }

    v63 = -[HMDIDSServerBag serverBagHomeKitVersionForKey:](a1, @"home-rmvfsumbom");
    v64 = [a1 minimumHomeKitVersionForSharedUserHH2MigrationByOwnerManual];
    int v277 = v11;
    if (v63 && ([v63 isEqualToVersion:v64] & 1) == 0)
    {
      v66 = (void *)MEMORY[0x230FBD990]();
      id v67 = a1;
      v68 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
      {
        v69 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        v284 = v69;
        __int16 v285 = 2114;
        v286 = v64;
        __int16 v287 = 2114;
        v288 = v63;
        _os_log_impl(&dword_22F52A000, v68, OS_LOG_TYPE_INFO, "%{public}@Updating minimumHomeKitVersionForSharedUserHH2MigrationByOwnerManual from %{public}@ to %{public}@", buf, 0x20u);
      }
      [v67 setMinimumHomeKitVersionForSharedUserHH2MigrationByOwnerManual:v63];
      int v65 = 1;
    }
    else
    {
      int v65 = 0;
    }

    v70 = -[HMDIDSServerBag serverBagHomeKitVersionForKey:](a1, @"home-rmvfsumboa");
    v71 = [a1 minimumHomeKitVersionForSharedUserHH2MigrationByOwnerAuto];
    if (v70 && ([v70 isEqualToVersion:v71] & 1) == 0)
    {
      v72 = (void *)MEMORY[0x230FBD990]();
      id v73 = a1;
      v74 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v74, OS_LOG_TYPE_INFO))
      {
        v75 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        v284 = v75;
        __int16 v285 = 2114;
        v286 = v71;
        __int16 v287 = 2114;
        v288 = v70;
        _os_log_impl(&dword_22F52A000, v74, OS_LOG_TYPE_INFO, "%{public}@Updating minimumHomeKitVersionForSharedUserHH2MigrationByOwnerAuto from %{public}@ to %{public}@", buf, 0x20u);
      }
      [v73 setMinimumHomeKitVersionForSharedUserHH2MigrationByOwnerAuto:v70];
      int v65 = 1;
    }

    v76 = -[HMDIDSServerBag serverBagHomeKitVersionForKey:](a1, @"home-rmvfomdmwosu");
    v77 = [a1 minimumHomeKitVersionForOwnerMeDeviceAutoHH2MigrationWithoutSharedUsers];
    if (v76 && ([v76 isEqualToVersion:v77] & 1) == 0)
    {
      v79 = (void *)MEMORY[0x230FBD990]();
      id v80 = a1;
      v81 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v81, OS_LOG_TYPE_INFO))
      {
        v82 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        v284 = v82;
        __int16 v285 = 2114;
        v286 = v77;
        __int16 v287 = 2114;
        v288 = v76;
        _os_log_impl(&dword_22F52A000, v81, OS_LOG_TYPE_INFO, "%{public}@Updating minimumHomeKitVersionForOwnerMeDeviceAutoHH2MigrationWithoutSharedUsers from %{public}@ to %{public}@", buf, 0x20u);
      }
      [v80 setMinimumHomeKitVersionForOwnerMeDeviceAutoHH2MigrationWithoutSharedUsers:v76];
      int v78 = 1;
    }
    else
    {
      int v78 = 0;
    }

    v83 = -[HMDIDSServerBag serverBagHomeKitVersionForKey:](a1, @"home-rmvfoodmwosu");
    v84 = [a1 minimumHomeKitVersionForOwnerOtherDevicesAutoHH2MigrationWithoutSharedUsers];
    if (v83 && ([v83 isEqualToVersion:v84] & 1) == 0)
    {
      v85 = (void *)MEMORY[0x230FBD990]();
      id v86 = a1;
      v87 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v87, OS_LOG_TYPE_INFO))
      {
        v88 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        v284 = v88;
        __int16 v285 = 2114;
        v286 = v84;
        __int16 v287 = 2114;
        v288 = v83;
        _os_log_impl(&dword_22F52A000, v87, OS_LOG_TYPE_INFO, "%{public}@Updating minimumHomeKitVersionForOwnerOtherDevicesAutoHH2MigrationWithoutSharedUsers from %{public}@ to %{public}@", buf, 0x20u);
      }
      [v86 setMinimumHomeKitVersionForOwnerOtherDevicesAutoHH2MigrationWithoutSharedUsers:v83];
      int v78 = 1;
    }

    v89 = -[HMDIDSServerBag serverBagHomeKitVersionForKey:](a1, @"home-rmvfordmwosu");
    v90 = [a1 minimumHomeKitVersionForOwnerResidentDevicesAutoHH2MigrationWithoutSharedUsers];
    if (v89 && ([v89 isEqualToVersion:v90] & 1) == 0)
    {
      v91 = (void *)MEMORY[0x230FBD990]();
      id v92 = a1;
      v93 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v93, OS_LOG_TYPE_INFO))
      {
        v94 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        v284 = v94;
        __int16 v285 = 2114;
        v286 = v90;
        __int16 v287 = 2114;
        v288 = v89;
        _os_log_impl(&dword_22F52A000, v93, OS_LOG_TYPE_INFO, "%{public}@Updating minimumHomeKitVersionForOwnerResidentDevicesAutoHH2MigrationWithoutSharedUsers from %{public}@ to %{public}@", buf, 0x20u);
      }
      [v92 setMinimumHomeKitVersionForOwnerResidentDevicesAutoHH2MigrationWithoutSharedUsers:v89];
      int v78 = 1;
    }

    v95 = -[HMDIDSServerBag serverBagHomeKitVersionForKey:](a1, @"home-rmvfomdm");
    v96 = [a1 minimumHomeKitVersionForOwnerMeDeviceAutoHH2MigrationWithSharedUsers];
    if (v95 && ([v95 isEqualToVersion:v96] & 1) == 0)
    {
      v98 = (void *)MEMORY[0x230FBD990]();
      id v99 = a1;
      v100 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v100, OS_LOG_TYPE_INFO))
      {
        v101 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        v284 = v101;
        __int16 v285 = 2114;
        v286 = v96;
        __int16 v287 = 2114;
        v288 = v95;
        _os_log_impl(&dword_22F52A000, v100, OS_LOG_TYPE_INFO, "%{public}@Updating minimumHomeKitVersionForOwnerMeDeviceAutoHH2MigrationWithSharedUsers from %{public}@ to %{public}@", buf, 0x20u);
      }
      [v99 setMinimumHomeKitVersionForOwnerMeDeviceAutoHH2MigrationWithSharedUsers:v95];
      int v97 = 1;
    }
    else
    {
      int v97 = 0;
    }

    v102 = -[HMDIDSServerBag serverBagHomeKitVersionForKey:](a1, @"home-rmvfoodm");
    v103 = [a1 minimumHomeKitVersionForOwnerOtherDevicesAutoHH2MigrationWithSharedUsers];
    if (v102 && ([v102 isEqualToVersion:v103] & 1) == 0)
    {
      v104 = (void *)MEMORY[0x230FBD990]();
      id v105 = a1;
      v106 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v106, OS_LOG_TYPE_INFO))
      {
        v107 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        v284 = v107;
        __int16 v285 = 2114;
        v286 = v103;
        __int16 v287 = 2114;
        v288 = v102;
        _os_log_impl(&dword_22F52A000, v106, OS_LOG_TYPE_INFO, "%{public}@Updating minimumHomeKitVersionForOwnerOtherDevicesAutoHH2MigrationWithSharedUsers from %{public}@ to %{public}@", buf, 0x20u);
      }
      [v105 setMinimumHomeKitVersionForOwnerOtherDevicesAutoHH2MigrationWithSharedUsers:v102];
      int v97 = 1;
    }
    int v108 = v277 | v33;

    v109 = -[HMDIDSServerBag serverBagHomeKitVersionForKey:](a1, @"home-rmvfordm");
    v110 = [a1 minimumHomeKitVersionForOwnerResidentDevicesAutoHH2MigrationWithSharedUsers];
    if (v109 && ([v109 isEqualToVersion:v110] & 1) == 0)
    {
      v111 = (void *)MEMORY[0x230FBD990]();
      id v112 = a1;
      v113 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v113, OS_LOG_TYPE_INFO))
      {
        v114 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        v284 = v114;
        __int16 v285 = 2114;
        v286 = v110;
        __int16 v287 = 2114;
        v288 = v109;
        _os_log_impl(&dword_22F52A000, v113, OS_LOG_TYPE_INFO, "%{public}@Updating minimumHomeKitVersionForOwnerResidentDevicesAutoHH2MigrationWithSharedUsers from %{public}@ to %{public}@", buf, 0x20u);
      }
      [v112 setMinimumHomeKitVersionForOwnerResidentDevicesAutoHH2MigrationWithSharedUsers:v109];
      int v97 = 1;
    }

    int v115 = v97 | v78 | v65 | v108;
    v116 = -[HMDIDSServerBag serverBagNumberValueForKey:](a1, @"hh2SuppressDuplicateUserModelBulletins");
    if (v116)
    {
      int v117 = [a1 hh2SuppressDuplicateUserModelBulletins];
      if (v117 != [v116 BOOLValue])
      {
        v118 = (void *)MEMORY[0x230FBD990]();
        id v119 = a1;
        v120 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v120, OS_LOG_TYPE_INFO))
        {
          v121 = HMFGetLogIdentifier();
          [v119 hh2SuppressDuplicateUserModelBulletins];
          v122 = HMFBooleanToString();
          [v116 BOOLValue];
          v123 = HMFBooleanToString();
          *(_DWORD *)buf = 138543874;
          v284 = v121;
          __int16 v285 = 2112;
          v286 = v122;
          __int16 v287 = 2112;
          v288 = v123;
          _os_log_impl(&dword_22F52A000, v120, OS_LOG_TYPE_INFO, "%{public}@Updating hh2SuppressDuplicateUserModelBulletins from %@ to %@", buf, 0x20u);
        }
        objc_msgSend(v119, "setHh2SuppressDuplicateUserModelBulletins:", objc_msgSend(v116, "BOOLValue"));
        int v115 = 1;
      }
    }
    v124 = -[HMDIDSServerBag serverBagNumberValueForKey:](a1, @"home-cb");
    if (v124)
    {
      int v125 = [a1 homeSafetySecurityEnabled];
      if (v125 != [v124 BOOLValue])
      {
        v126 = (void *)MEMORY[0x230FBD990]();
        id v127 = a1;
        v128 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v128, OS_LOG_TYPE_INFO))
        {
          v129 = HMFGetLogIdentifier();
          [v127 homeSafetySecurityEnabled];
          v130 = HMFBooleanToString();
          [v124 BOOLValue];
          v131 = HMFBooleanToString();
          *(_DWORD *)buf = 138543874;
          v284 = v129;
          __int16 v285 = 2112;
          v286 = v130;
          __int16 v287 = 2112;
          v288 = v131;
          _os_log_impl(&dword_22F52A000, v128, OS_LOG_TYPE_INFO, "%{public}@Updating homeSafetySecurityEnabled from %@ to %@", buf, 0x20u);
        }
        objc_msgSend(v127, "setHomeSafetySecurityEnabled:", objc_msgSend(v124, "BOOLValue"));
        int v115 = 1;
      }
    }
    v132 = -[HMDIDSServerBag serverBagNumberValueForKey:](a1, @"home-skrse");
    int v278 = v115;
    if (!v132
      || (int v133 = [a1 statusKitResidentStatusEnabled],
          v133 == [v132 BOOLValue]))
    {
      int v140 = 0;
    }
    else
    {
      v134 = (void *)MEMORY[0x230FBD990]();
      id v135 = a1;
      v136 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v136, OS_LOG_TYPE_INFO))
      {
        v137 = HMFGetLogIdentifier();
        [v135 statusKitResidentStatusEnabled];
        v138 = HMFBooleanToString();
        [v132 BOOLValue];
        v139 = HMFBooleanToString();
        *(_DWORD *)buf = 138543874;
        v284 = v137;
        __int16 v285 = 2112;
        v286 = v138;
        __int16 v287 = 2112;
        v288 = v139;
        _os_log_impl(&dword_22F52A000, v136, OS_LOG_TYPE_INFO, "%{public}@Updating statusKitResidentStatusEnabled from %@ to %@", buf, 0x20u);
      }
      objc_msgSend(v135, "setStatusKitResidentStatusEnabled:", objc_msgSend(v132, "BOOLValue"));
      int v140 = 1;
    }

    v141 = -[HMDIDSServerBag serverBagNumberValueForKey:](a1, @"home-skict");
    if (v141)
    {
      v142 = [a1 statusKitInitialConnectionTimeoutSeconds];
      char v143 = [v142 isEqual:v141];

      if ((v143 & 1) == 0)
      {
        v144 = (void *)MEMORY[0x230FBD990]();
        id v145 = a1;
        v146 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v146, OS_LOG_TYPE_INFO))
        {
          v147 = HMFGetLogIdentifier();
          v148 = [v145 statusKitInitialConnectionTimeoutSeconds];
          *(_DWORD *)buf = 138543874;
          v284 = v147;
          __int16 v285 = 2112;
          v286 = v148;
          __int16 v287 = 2112;
          v288 = v141;
          _os_log_impl(&dword_22F52A000, v146, OS_LOG_TYPE_INFO, "%{public}@Updating statusKitInitialConnectionTimeoutSeconds from %@ to %@", buf, 0x20u);
        }
        [v145 setStatusKitInitialConnectionTimeoutSeconds:v141];
        int v140 = 1;
      }
    }

    v149 = -[HMDIDSServerBag serverBagNumberValueForKey:](a1, @"home-skctnrpt");
    if (v149)
    {
      v150 = [a1 statusKitConnectionTTSUNoReachablePrimaryTimeoutSeconds];
      char v151 = [v150 isEqual:v149];

      if ((v151 & 1) == 0)
      {
        v152 = (void *)MEMORY[0x230FBD990]();
        id v153 = a1;
        v154 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v154, OS_LOG_TYPE_INFO))
        {
          v155 = HMFGetLogIdentifier();
          v156 = [v153 statusKitConnectionTTSUNoReachablePrimaryTimeoutSeconds];
          *(_DWORD *)buf = 138543874;
          v284 = v155;
          __int16 v285 = 2112;
          v286 = v156;
          __int16 v287 = 2112;
          v288 = v149;
          _os_log_impl(&dword_22F52A000, v154, OS_LOG_TYPE_INFO, "%{public}@Updating statusKitConnectionTTSUNoReachablePrimaryTimeoutSeconds from %@ to %@", buf, 0x20u);
        }
        [v153 setStatusKitConnectionTTSUNoReachablePrimaryTimeoutSeconds:v149];
        int v140 = 1;
      }
    }

    v157 = -[HMDIDSServerBag serverBagNumberValueForKey:](a1, @"home-skufcdt");
    if (v157)
    {
      v158 = [a1 statusKitUnsubscribeFromChannelDebounceTimeSec];
      char v159 = [v158 isEqual:v157];

      if ((v159 & 1) == 0)
      {
        v160 = (void *)MEMORY[0x230FBD990]();
        id v161 = a1;
        v162 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v162, OS_LOG_TYPE_INFO))
        {
          v163 = HMFGetLogIdentifier();
          v164 = [v161 statusKitUnsubscribeFromChannelDebounceTimeSec];
          *(_DWORD *)buf = 138543874;
          v284 = v163;
          __int16 v285 = 2112;
          v286 = v164;
          __int16 v287 = 2112;
          v288 = v157;
          _os_log_impl(&dword_22F52A000, v162, OS_LOG_TYPE_INFO, "%{public}@Updating statusKitUnsubscribeFromChannelDebounceTimeSec from %@ to %@", buf, 0x20u);
        }
        [v161 setStatusKitUnsubscribeFromChannelDebounceTimeSec:v157];
        int v140 = 1;
      }
    }

    v165 = -[HMDIDSServerBag serverBagNumberValueForKey:](a1, @"home-rs-pred");
    if (v165
      && ([a1 residentSelectionPreferredResidentEvaluationDelay],
          v166 = objc_claimAutoreleasedReturnValue(),
          char v167 = [v166 isEqual:v165],
          v166,
          (v167 & 1) == 0))
    {
      v169 = (void *)MEMORY[0x230FBD990]();
      id v170 = a1;
      v171 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v171, OS_LOG_TYPE_INFO))
      {
        v172 = HMFGetLogIdentifier();
        v173 = [v170 residentSelectionPreferredResidentEvaluationDelay];
        *(_DWORD *)buf = 138543874;
        v284 = v172;
        __int16 v285 = 2112;
        v286 = v173;
        __int16 v287 = 2112;
        v288 = v165;
        _os_log_impl(&dword_22F52A000, v171, OS_LOG_TYPE_INFO, "%{public}@Updating residentSelectionPreferredResidentEvaluationDelay from %@ to %@", buf, 0x20u);
      }
      [v170 setResidentSelectionPreferredResidentEvaluationDelay:v165];
      int v168 = 1;
    }
    else
    {
      int v168 = 0;
    }

    v174 = -[HMDIDSServerBag serverBagNumberValueForKey:](a1, @"home-rs-prlms");
    if (v174)
    {
      v175 = [a1 residentSelectionPreferredResidentsListMaxSize];
      char v176 = [v175 isEqual:v174];

      if ((v176 & 1) == 0)
      {
        v177 = (void *)MEMORY[0x230FBD990]();
        id v178 = a1;
        v179 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v179, OS_LOG_TYPE_INFO))
        {
          v180 = HMFGetLogIdentifier();
          v181 = [v178 residentSelectionPreferredResidentsListMaxSize];
          *(_DWORD *)buf = 138543874;
          v284 = v180;
          __int16 v285 = 2112;
          v286 = v181;
          __int16 v287 = 2112;
          v288 = v174;
          _os_log_impl(&dword_22F52A000, v179, OS_LOG_TYPE_INFO, "%{public}@Updating residentSelectionPreferredResidentsListMaxSize from %@ to %@", buf, 0x20u);
        }
        [v178 setResidentSelectionPreferredResidentsListMaxSize:v174];
        int v168 = 1;
      }
    }

    v182 = -[HMDIDSServerBag serverBagNumberValueForKey:](a1, @"home-rs-sdi");
    if (v182)
    {
      v183 = [a1 residentSelectionStatusDebounceInterval];
      char v184 = [v183 isEqual:v182];

      if ((v184 & 1) == 0)
      {
        v185 = (void *)MEMORY[0x230FBD990]();
        id v186 = a1;
        v187 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v187, OS_LOG_TYPE_INFO))
        {
          v188 = HMFGetLogIdentifier();
          v189 = [v186 residentSelectionStatusDebounceInterval];
          *(_DWORD *)buf = 138543874;
          v284 = v188;
          __int16 v285 = 2112;
          v286 = v189;
          __int16 v287 = 2112;
          v288 = v182;
          _os_log_impl(&dword_22F52A000, v187, OS_LOG_TYPE_INFO, "%{public}@Updating residentSelectionStatusDebounceInterval from %@ to %@", buf, 0x20u);
        }
        [v186 setResidentSelectionStatusDebounceInterval:v182];
        int v168 = 1;
      }
    }

    v190 = -[HMDIDSServerBag serverBagNumberValueForKey:](a1, @"home-rs-toipinvi");
    if (v190)
    {
      v191 = [a1 residentSelectionTakeOverIfPrimaryIsNotViableInterval];
      char v192 = [v191 isEqual:v190];

      if ((v192 & 1) == 0)
      {
        v193 = (void *)MEMORY[0x230FBD990]();
        id v194 = a1;
        v195 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v195, OS_LOG_TYPE_INFO))
        {
          v196 = HMFGetLogIdentifier();
          v197 = [v194 residentSelectionTakeOverIfPrimaryIsNotViableInterval];
          *(_DWORD *)buf = 138543874;
          v284 = v196;
          __int16 v285 = 2112;
          v286 = v197;
          __int16 v287 = 2112;
          v288 = v190;
          _os_log_impl(&dword_22F52A000, v195, OS_LOG_TYPE_INFO, "%{public}@Updating residentSelectionTakeOverIfPrimaryIsNotViableInterval from %@ to %@", buf, 0x20u);
        }
        [v194 setResidentSelectionTakeOverIfPrimaryIsNotViableInterval:v190];
        int v168 = 1;
      }
    }

    v198 = -[HMDIDSServerBag serverBagNumberValueForKey:](a1, @"home-rs-toi");
    if (v198)
    {
      v199 = [a1 residentSelectionTakeOverInterval];
      char v200 = [v199 isEqual:v198];

      if ((v200 & 1) == 0)
      {
        v201 = (void *)MEMORY[0x230FBD990]();
        id v202 = a1;
        v203 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v203, OS_LOG_TYPE_INFO))
        {
          v204 = HMFGetLogIdentifier();
          v205 = [v202 residentSelectionTakeOverInterval];
          *(_DWORD *)buf = 138543874;
          v284 = v204;
          __int16 v285 = 2112;
          v286 = v205;
          __int16 v287 = 2112;
          v288 = v198;
          _os_log_impl(&dword_22F52A000, v203, OS_LOG_TYPE_INFO, "%{public}@Updating residentSelectionTakeOverInterval from %@ to %@", buf, 0x20u);
        }
        [v202 setResidentSelectionTakeOverInterval:v198];
        int v168 = 1;
      }
    }

    v206 = -[HMDIDSServerBag serverBagNumberValueForKey:](a1, @"home-rs-tooicpinvj");
    if (v206)
    {
      v207 = [a1 residentSelectionTakeOverOnlyIfCurrentPrimaryIsNotViableJitter];
      char v208 = [v207 isEqual:v206];

      if ((v208 & 1) == 0)
      {
        v209 = (void *)MEMORY[0x230FBD990]();
        id v210 = a1;
        v211 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v211, OS_LOG_TYPE_INFO))
        {
          v212 = HMFGetLogIdentifier();
          v213 = [v210 residentSelectionTakeOverOnlyIfCurrentPrimaryIsNotViableJitter];
          *(_DWORD *)buf = 138543874;
          v284 = v212;
          __int16 v285 = 2112;
          v286 = v213;
          __int16 v287 = 2112;
          v288 = v206;
          _os_log_impl(&dword_22F52A000, v211, OS_LOG_TYPE_INFO, "%{public}@Updating residentSelectionTakeOverOnlyIfCurrentPrimaryIsNotViableJitter from %@ to %@", buf, 0x20u);
        }
        [v210 setResidentSelectionTakeOverOnlyIfCurrentPrimaryIsNotViableJitter:v206];
        int v168 = 1;
      }
    }

    v214 = -[HMDIDSServerBag serverBagNumberValueForKey:](a1, @"home-rs-plgsh");
    if (v214)
    {
      v215 = [a1 residentSelectionPreferredListGenerationStartHour];
      char v216 = [v215 isEqual:v214];

      if ((v216 & 1) == 0)
      {
        v217 = (void *)MEMORY[0x230FBD990]();
        id v218 = a1;
        v219 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v219, OS_LOG_TYPE_INFO))
        {
          v220 = HMFGetLogIdentifier();
          v221 = [v218 residentSelectionPreferredListGenerationStartHour];
          *(_DWORD *)buf = 138543874;
          v284 = v220;
          __int16 v285 = 2112;
          v286 = v221;
          __int16 v287 = 2112;
          v288 = v214;
          _os_log_impl(&dword_22F52A000, v219, OS_LOG_TYPE_INFO, "%{public}@Updating residentSelectionPreferredListGenerationStartHour from %@ to %@", buf, 0x20u);
        }
        [v218 setResidentSelectionPreferredListGenerationStartHour:v214];
        int v168 = 1;
      }
    }

    v222 = -[HMDIDSServerBag serverBagNumberValueForKey:](a1, @"home-rs-plgeh");
    if (v222)
    {
      v223 = [a1 residentSelectionPreferredListGenerationEndHour];
      char v224 = [v223 isEqual:v222];

      if ((v224 & 1) == 0)
      {
        v225 = (void *)MEMORY[0x230FBD990]();
        id v226 = a1;
        v227 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v227, OS_LOG_TYPE_INFO))
        {
          v228 = HMFGetLogIdentifier();
          v229 = [v226 residentSelectionPreferredListGenerationEndHour];
          *(_DWORD *)buf = 138543874;
          v284 = v228;
          __int16 v285 = 2112;
          v286 = v229;
          __int16 v287 = 2112;
          v288 = v222;
          _os_log_impl(&dword_22F52A000, v227, OS_LOG_TYPE_INFO, "%{public}@Updating residentSelectionPreferredListGenerationEndHour from %@ to %@", buf, 0x20u);
        }
        [v226 setResidentSelectionPreferredListGenerationEndHour:v222];
        int v168 = 1;
      }
    }

    v230 = -[HMDIDSServerBag serverBagHomeKitVersionForKey:](a1, @"home-rs-mhv");
    v231 = [a1 residentSelectionMinHomeKitVersion];
    if (v230 && ([v230 isEqualToVersion:v231] & 1) == 0)
    {
      v232 = (void *)MEMORY[0x230FBD990]();
      id v233 = a1;
      v234 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v234, OS_LOG_TYPE_INFO))
      {
        v235 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        v284 = v235;
        __int16 v285 = 2114;
        v286 = v231;
        __int16 v287 = 2114;
        v288 = v230;
        _os_log_impl(&dword_22F52A000, v234, OS_LOG_TYPE_INFO, "%{public}@Updating residentSelectionMinHomeKitVersion from %{public}@ to %{public}@", buf, 0x20u);
      }
      [v233 setResidentSelectionMinHomeKitVersion:v230];
      int v168 = 1;
    }

    v236 = -[HMDIDSServerBag serverBagNumberValueForKey:](a1, @"home-rs-rnacd");
    if (v236)
    {
      v237 = [a1 residentSelectionReachabilityNotificationAfterConnectivityDelay];
      char v238 = [v237 isEqual:v236];

      if ((v238 & 1) == 0)
      {
        v239 = (void *)MEMORY[0x230FBD990]();
        id v240 = a1;
        v241 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v241, OS_LOG_TYPE_INFO))
        {
          v242 = HMFGetLogIdentifier();
          v243 = [v240 residentSelectionReachabilityNotificationAfterConnectivityDelay];
          *(_DWORD *)buf = 138543874;
          v284 = v242;
          __int16 v285 = 2112;
          v286 = v243;
          __int16 v287 = 2112;
          v288 = v236;
          _os_log_impl(&dword_22F52A000, v241, OS_LOG_TYPE_INFO, "%{public}@Updating residentSelectionReachabilityNotificationAfterConnectivityDelay from %@ to %@", buf, 0x20u);
        }
        [v240 setResidentSelectionReachabilityNotificationAfterConnectivityDelay:v236];
        int v168 = 1;
      }
    }

    v244 = -[HMDIDSServerBag serverBagNumberValueForKey:](a1, @"home-rs-uprnd");
    if (v244)
    {
      v245 = [a1 residentSelectionUserPreferredReachabilityNotificationDelay];
      char v246 = [v245 isEqual:v244];

      if ((v246 & 1) == 0)
      {
        v247 = (void *)MEMORY[0x230FBD990]();
        id v248 = a1;
        v249 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v249, OS_LOG_TYPE_INFO))
        {
          v250 = HMFGetLogIdentifier();
          v251 = [v248 residentSelectionUserPreferredReachabilityNotificationDelay];
          *(_DWORD *)buf = 138543874;
          v284 = v250;
          __int16 v285 = 2112;
          v286 = v251;
          __int16 v287 = 2112;
          v288 = v244;
          _os_log_impl(&dword_22F52A000, v249, OS_LOG_TYPE_INFO, "%{public}@Updating residentSelectionUserPreferredReachabilityNotificationDelay from %@ to %@", buf, 0x20u);
        }
        [v248 setResidentSelectionUserPreferredReachabilityNotificationDelay:v244];
        int v168 = 1;
      }
    }

    v252 = -[HMDIDSServerBag serverBagNumberValueForKey:](a1, @"home-rdm-bptd");
    if (v252)
    {
      v253 = [a1 residentDeviceManagerBlockPrimaryTakeoverDurationSeconds];
      char v254 = [v253 isEqual:v252];

      if ((v254 & 1) == 0)
      {
        v255 = (void *)MEMORY[0x230FBD990]();
        id v256 = a1;
        v257 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v257, OS_LOG_TYPE_INFO))
        {
          v258 = HMFGetLogIdentifier();
          v259 = [v256 residentDeviceManagerBlockPrimaryTakeoverDurationSeconds];
          *(_DWORD *)buf = 138543874;
          v284 = v258;
          __int16 v285 = 2112;
          v286 = v259;
          __int16 v287 = 2112;
          v288 = v252;
          _os_log_impl(&dword_22F52A000, v257, OS_LOG_TYPE_INFO, "%{public}@Updating residentDeviceManagerBlockPrimaryTakeoverDurationSeconds from %@ to %@", buf, 0x20u);
        }
        [v256 setResidentDeviceManagerBlockPrimaryTakeoverDurationSeconds:v252];
        int v168 = 1;
      }
    }

    uint64_t v260 = -[HMDIDSServerBag serverBagNumberValueForKey:](a1, @"home-fhwimd");
    v261 = (void *)v260;
    if (!v260
      || (int v262 = [a1 fetchHomeWiFiInfosMessageDisable],
          uint64_t v260 = [v261 BOOLValue],
          v262 == v260))
    {
      int v270 = v168 | v140 | v278;
      v269 = v276;
      if (!v270)
      {
LABEL_191:

        return;
      }
    }
    else
    {
      v263 = (void *)MEMORY[0x230FBD990]();
      id v264 = a1;
      v265 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v265, OS_LOG_TYPE_INFO))
      {
        v266 = HMFGetLogIdentifier();
        [v264 fetchHomeWiFiInfosMessageDisable];
        v267 = HMFBooleanToString();
        [v261 BOOLValue];
        v268 = HMFBooleanToString();
        *(_DWORD *)buf = 138543874;
        v284 = v266;
        __int16 v285 = 2112;
        v286 = v267;
        __int16 v287 = 2112;
        v288 = v268;
        _os_log_impl(&dword_22F52A000, v265, OS_LOG_TYPE_INFO, "%{public}@Updating fetchHomeWiFiInfosMessageDisableNumber from %@ to %@", buf, 0x20u);
      }
      uint64_t v260 = objc_msgSend(v264, "setFetchHomeWiFiInfosMessageDisable:", objc_msgSend(v261, "BOOLValue"));
      v269 = v276;
    }
    v271 = (void *)MEMORY[0x230FBD990](v260);
    id v272 = a1;
    v273 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v273, OS_LOG_TYPE_INFO))
    {
      v274 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v284 = v274;
      _os_log_impl(&dword_22F52A000, v273, OS_LOG_TYPE_INFO, "%{public}@Notifying delegate of server bag update", buf, 0xCu);
    }
    v275 = [v272 delegate];
    if (objc_opt_respondsToSelector()) {
      [v275 idsServerBagDidUpdate:v272];
    }

    goto LABEL_191;
  }
}

- (id)serverBagNumberValueForKey:(void *)a1
{
  uint64_t v2 = -[HMDIDSServerBag serverBagValueForKey:](a1, a2);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  id v4 = v3;

  return v4;
}

- (HMDHomeKitVersion)serverBagHomeKitVersionForKey:(void *)a1
{
  uint64_t v2 = -[HMDIDSServerBag serverBagValueForKey:](a1, a2);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  id v4 = v3;

  if (v4) {
    id v5 = [[HMDHomeKitVersion alloc] initWithVersionString:v4];
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (id)serverBagValueForKey:(void *)a1
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [a1 keySuffix];
  uint64_t v5 = [v4 length];

  if (v5)
  {
    id v6 = [a1 keySuffix];
    v7 = [v3 stringByAppendingString:v6];

    v8 = [a1 idsServerBag];
    v9 = [v8 objectForKey:v7];

    if (v9) {
      goto LABEL_6;
    }
  }
  else
  {
    v7 = 0;
  }
  id v10 = v3;

  int v11 = [a1 idsServerBag];
  v9 = [v11 objectForKey:v10];

  v7 = v10;
LABEL_6:
  uint64_t v12 = (void *)MEMORY[0x230FBD990]();
  id v13 = a1;
  uint64_t v14 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    v15 = HMFGetLogIdentifier();
    int v17 = 138543874;
    v18 = v15;
    __int16 v19 = 2112;
    v20 = v7;
    __int16 v21 = 2112;
    uint64_t v22 = v9;
    _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@serverBagValueForKey %@ returned %@", (uint8_t *)&v17, 0x20u);
  }

  return v9;
}

- (void)configure
{
  id v3 = [(HMDIDSServerBag *)self refreshTimer];
  [v3 setDelegate:self];

  id v4 = [(HMDIDSServerBag *)self refreshTimer];
  [v4 resume];

  -[HMDIDSServerBag updateCachedValuesWithServerValues](self);
}

- (HMDIDSServerBag)initWithIDSServerBag:(id)a3 refreshTimer:(id)a4 keySuffix:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v25.receiver = self;
  v25.super_class = (Class)HMDIDSServerBag;
  uint64_t v12 = [(HMDIDSServerBag *)&v25 init];
  id v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_idsServerBag, a3);
    objc_storeStrong((id *)&v13->_refreshTimer, a4);
    uint64_t v14 = [v11 copy];
    keySuffix = v13->_keySuffix;
    v13->_keySuffix = (NSString *)v14;

    hh2AutoMigrationWithoutSharedUserRampDivisor = v13->_hh2AutoMigrationWithoutSharedUserRampDivisor;
    v13->_hh2AutoMigrationWithoutSharedUserRampDivisor = (NSNumber *)&unk_26E471BF0;

    hh2AutoMigrationWithoutSharedUserRampRemainder = v13->_hh2AutoMigrationWithoutSharedUserRampRemainder;
    v13->_hh2AutoMigrationWithoutSharedUserRampRemainder = (NSNumber *)&unk_26E471C08;

    hh2AutoMigrationWithSharedUserRampDivisor = v13->_hh2AutoMigrationWithSharedUserRampDivisor;
    v13->_hh2AutoMigrationWithSharedUserRampDivisor = (NSNumber *)&unk_26E471BF0;

    hh2AutoMigrationWithSharedUserRampRemainder = v13->_hh2AutoMigrationWithSharedUserRampRemainder;
    v13->_hh2AutoMigrationWithSharedUserRampRemainder = (NSNumber *)&unk_26E471C08;

    v20 = [[HMDHomeKitVersion alloc] initWithVersionString:@"9999"];
    __int16 v21 = [[HMDHomeKitVersion alloc] initWithVersionString:@"10.4"];
    minimumHomeKitVersionForSharedUserHH2MigrationByOwnerManual = v13->_minimumHomeKitVersionForSharedUserHH2MigrationByOwnerManual;
    v13->_minimumHomeKitVersionForSharedUserHH2MigrationByOwnerManual = v21;

    objc_storeStrong((id *)&v13->_minimumHomeKitVersionForSharedUserHH2MigrationByOwnerAuto, v20);
    objc_storeStrong((id *)&v13->_minimumHomeKitVersionForOwnerMeDeviceAutoHH2MigrationWithoutSharedUsers, v20);
    objc_storeStrong((id *)&v13->_minimumHomeKitVersionForOwnerOtherDevicesAutoHH2MigrationWithoutSharedUsers, v20);
    objc_storeStrong((id *)&v13->_minimumHomeKitVersionForOwnerResidentDevicesAutoHH2MigrationWithoutSharedUsers, v20);
    objc_storeStrong((id *)&v13->_minimumHomeKitVersionForOwnerMeDeviceAutoHH2MigrationWithSharedUsers, v20);
    objc_storeStrong((id *)&v13->_minimumHomeKitVersionForOwnerOtherDevicesAutoHH2MigrationWithSharedUsers, v20);
    minimumHomeKitVersionForOwnerResidentDevicesAutoHH2MigrationWithSharedUsers = v13->_minimumHomeKitVersionForOwnerResidentDevicesAutoHH2MigrationWithSharedUsers;
    v13->_minimumHomeKitVersionForOwnerResidentDevicesAutoHH2MigrationWithSharedUsers = v20;
  }
  return v13;
}

- (HMDIDSServerBag)init
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263F4A0B8] sharedInstanceForBagType:0];
  id v4 = [MEMORY[0x263F42608] sharedPreferences];
  uint64_t v5 = [v4 preferenceForKey:@"idsServerBagMaximumPollInterval"];
  id v6 = [v5 numberValue];
  [v6 doubleValue];
  double v8 = v7;

  if (fabs(v8) < 2.22044605e-16) {
    _HMFPreconditionFailure();
  }
  id v9 = (void *)[objc_alloc(MEMORY[0x263F42528]) initWithMinimumTimeInterval:2 maximumTimeInterval:12 exponentialFactor:30.0 options:v8];
  int v10 = isInternalBuild();
  id v11 = &stru_26E2EB898;
  if (v10) {
    id v11 = @"-internal";
  }
  uint64_t v12 = v11;
  id v13 = (void *)MEMORY[0x230FBD990]();
  uint64_t v14 = self;
  v15 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    id v16 = HMFGetLogIdentifier();
    int v19 = 138544130;
    v20 = v16;
    __int16 v21 = 2112;
    uint64_t v22 = v12;
    __int16 v23 = 2048;
    uint64_t v24 = 0x403E000000000000;
    __int16 v25 = 2048;
    double v26 = v8;
    _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@Initializing using key suffix %@ with initial timer interval of %fs and maximum of %fs", (uint8_t *)&v19, 0x2Au);
  }
  int v17 = [(HMDIDSServerBag *)v14 initWithIDSServerBag:v3 refreshTimer:v9 keySuffix:v12];

  return v17;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t39_136094 != -1) {
    dispatch_once(&logCategory__hmf_once_t39_136094, &__block_literal_global_136095);
  }
  uint64_t v2 = (void *)logCategory__hmf_once_v40_136096;
  return v2;
}

void __30__HMDIDSServerBag_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v40_136096;
  logCategory__hmf_once_v40_136096 = v0;
}

@end