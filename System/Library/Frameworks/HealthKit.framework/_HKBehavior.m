@interface _HKBehavior
+ ($9FE6E10C8CE45DBC9A88DFDEA39A390D)_currentOSVersionStruct;
+ ($9FE6E10C8CE45DBC9A88DFDEA39A390D)currentOSVersionStruct;
+ (BOOL)_condensesHeartRateSamples;
+ (BOOL)_futureMigrationsEnabled;
+ (BOOL)_hasCompletedBuddyWithKey:(id)a3 version:(int64_t)a4;
+ (BOOL)_hasCompletedBuddyWithVersion:(int64_t)a3;
+ (BOOL)_hasTelephonyCapability;
+ (BOOL)_healthAppHidden;
+ (BOOL)_healthAppNotInstalled;
+ (BOOL)_healthAppSupportedOnDevice;
+ (BOOL)_isAppleInternalInstall;
+ (BOOL)_isAutomaticProcessingEnabled;
+ (BOOL)_isBuddyDisabled;
+ (BOOL)_isCollectBLETypesFromLocalSourceEnabled;
+ (BOOL)_isDataCollectionForwarderDisabled;
+ (BOOL)_isDeviceSupported;
+ (BOOL)_isForceBuddyEnabled;
+ (BOOL)_isStandalonePhoneFitnessMode;
+ (BOOL)_isiPad;
+ (BOOL)_ontologyDatabaseFutureMigrationsEnabled;
+ (BOOL)_shouldShowBuddy;
+ (BOOL)_tinkerModeEnabled;
+ (BOOL)activePairedWatchHasSmartFitnessCoaching;
+ (BOOL)activePairedWatchSupportsBradycardiaDetection;
+ (BOOL)activePairedWatchSupportsHeartRateMotionContexts;
+ (BOOL)allPairedWatchesSupportBradycardiaDetection;
+ (BOOL)allPairedWatchesSupportHeartRateMotionContexts;
+ (BOOL)anyPairedWatchHasFlightsClimbedCapability;
+ (BOOL)hasPairedWatch;
+ (BOOL)hasTelephonyCapability;
+ (BOOL)isAppleInternalInstall;
+ (BOOL)isDeviceSupported;
+ (BOOL)isRunningStoreDemoMode;
+ (BOOL)isTestingDevice;
+ (BOOL)isiPod;
+ (BOOL)processHasLoadedUIKit;
+ (BOOL)runningInStoreDemoModeF201;
+ (id)_currentDeviceName;
+ (id)_currentOSBuild;
+ (id)_currentOSVersion;
+ (id)_getActivePairedDevice;
+ (id)currentDeviceClass;
+ (id)currentDeviceDisplayName;
+ (id)currentDeviceHWModelString;
+ (id)currentDeviceManufacturer;
+ (id)currentDeviceName;
+ (id)currentDeviceProductType;
+ (id)currentDeviceRegionCode;
+ (id)currentDeviceRegionInfo;
+ (id)currentDeviceReleaseType;
+ (id)currentOSBuild;
+ (id)currentOSName;
+ (id)currentOSVersion;
+ (id)sharedBehavior;
+ (int)nanoSyncProtocolVersionForCompanionSystemBuildVersion:(id)a3;
+ (int)nanoSyncProtocolVersionForWatchSystemBuildVersion:(id)a3;
+ (unint64_t)_fitnessMode;
+ (void)_healthAppNotInstalled;
+ (void)_resetBuddy;
+ (void)_setHasCompletedBuddyWithKey:(id)a3 version:(int64_t)a4;
+ (void)_setHasCompletedBuddyWithVersion:(int64_t)a3;
+ (void)resetSharedBehavior;
+ (void)setForceBuddy:(BOOL)a3;
+ (void)setSharedBehavior:(id)a3;
- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)currentOSVersionStruct;
- (BOOL)_hasProductTypePrefix:(id)a3;
- (BOOL)canPerformOwnershipTakeover;
- (BOOL)collectsCalorimetry;
- (BOOL)collectsData;
- (BOOL)futureMigrationsEnabled;
- (BOOL)hasTelephonyCapability;
- (BOOL)healthAppHidden;
- (BOOL)healthAppHiddenOrNotInstalled;
- (BOOL)healthAppNotInstalled;
- (BOOL)healthAppSupportedOnDevice;
- (BOOL)invalidatesNotificationInstructionsOnLaunch;
- (BOOL)isAppleInternalInstall;
- (BOOL)isAppleWatch;
- (BOOL)isCompanionCapable;
- (BOOL)isDeviceSupported;
- (BOOL)isProdFused;
- (BOOL)isRealityDevice;
- (BOOL)isRunningSeedBuild;
- (BOOL)isRunningStoreDemoMode;
- (BOOL)isStandalonePhoneFitnessMode;
- (BOOL)isTestingDevice;
- (BOOL)isiPad;
- (BOOL)ontologyIndexingEnabled;
- (BOOL)ontologyIndexingRequiresAccounts;
- (BOOL)performsAutomaticConceptIndexing;
- (BOOL)performsAutomaticUserDomainConceptProcessing;
- (BOOL)performsWorkoutCondensation;
- (BOOL)processHasLoadedUIKit;
- (BOOL)runningInStoreDemoModeF201;
- (BOOL)schedulesXPCAlarms;
- (BOOL)shouldOverrideSiriUOD;
- (BOOL)shouldReceiveECGSamples;
- (BOOL)shouldRegisterPeriodicActivities;
- (BOOL)showSensitiveLogItems;
- (BOOL)supportsAWDMetricSubmission;
- (BOOL)supportsActiveQueryDaemonTransactions;
- (BOOL)supportsActivitySharing;
- (BOOL)supportsAppSubscriptions;
- (BOOL)supportsBackgroundSyncRequests;
- (BOOL)supportsBluetoothDiscovery;
- (BOOL)supportsCachedSleepDaySummaryQueries;
- (BOOL)supportsCachedStatisticsCollectionQueries;
- (BOOL)supportsCloudSync;
- (BOOL)supportsCloudSyncSharding;
- (BOOL)supportsCloudSyncStagingShard;
- (BOOL)supportsComputedUserCharacteristicCaching;
- (BOOL)supportsCoordinatedCloudSync;
- (BOOL)supportsEED;
- (BOOL)supportsHeartRateDataCollection;
- (BOOL)supportsMedicalIDSync;
- (BOOL)supportsNanoSync;
- (BOOL)supportsOntology;
- (BOOL)supportsOntologyDatabaseFutureMigrations;
- (BOOL)supportsOntologyDatabaseUpdates;
- (BOOL)supportsOntologyFeatureEvaluation;
- (BOOL)supportsPeriodicCountryMonitoring;
- (BOOL)supportsPeriodicFullCloudSync;
- (BOOL)supportsPeriodicLiteCloudSync;
- (BOOL)supportsSampleExpiration;
- (BOOL)supportsSecondaryProfiles;
- (BOOL)supportsSharedSummarySync;
- (BOOL)supportsSwimmingWorkoutSessions;
- (BOOL)supportsWorkoutRouteSmoothing;
- (BOOL)supportsWorkouts;
- (BOOL)tinkerModeEnabled;
- (NSDictionary)currentDiskUsage;
- (NSDictionary)featureRequirementOverrides;
- (NSString)additionalEntitlementForConnection;
- (NSString)currentDeviceClass;
- (NSString)currentDeviceDisplayName;
- (NSString)currentDeviceHWModelString;
- (NSString)currentDeviceManufacturer;
- (NSString)currentDeviceName;
- (NSString)currentDeviceProductType;
- (NSString)currentDeviceRegionCode;
- (NSString)currentDeviceRegionInfo;
- (NSString)currentDeviceSerialNumber;
- (NSString)currentInternalDeviceModel;
- (NSString)currentOSBuild;
- (NSString)currentOSName;
- (NSString)currentOSVersion;
- (NSString)unitTest_deviceRegionCode;
- (NSTimeZone)localTimeZone;
- (_HKBehavior)init;
- (_HKFeatureFlags)features;
- (id).cxx_construct;
- (id)currentDeviceReleaseType;
- (uint64_t)futureMigrationsEnabled;
- (uint64_t)isRunningStoreDemoMode;
- (uint64_t)isiPad;
- (uint64_t)performsAutomaticUserDomainConceptProcessing;
- (uint64_t)runningInStoreDemoModeF201;
- (uint64_t)supportsOntologyDatabaseFutureMigrations;
- (unint64_t)currentDiskSpaceAvailable;
- (unint64_t)fitnessMode;
- (unint64_t)totalDiskCapacity;
- (void)futureMigrationsEnabled;
- (void)isRunningStoreDemoMode;
- (void)isiPad;
- (void)performsAutomaticUserDomainConceptProcessing;
- (void)resetSupportsCloudSync;
- (void)runningInStoreDemoModeF201;
- (void)setAdditionalEntitlementForConnection:(id)a3;
- (void)setCanPerformOwnershipTakeover:(BOOL)a3;
- (void)setCollectsCalorimetry:(BOOL)a3;
- (void)setCollectsData:(BOOL)a3;
- (void)setCurrentDeviceClass:(id)a3;
- (void)setCurrentDeviceDisplayName:(id)a3;
- (void)setCurrentDeviceName:(id)a3;
- (void)setCurrentDeviceProductType:(id)a3;
- (void)setCurrentDeviceSerialNumber:(id)a3;
- (void)setCurrentOSBuild:(id)a3;
- (void)setCurrentOSName:(id)a3;
- (void)setCurrentOSVersion:(id)a3;
- (void)setCurrentOSVersionStruct:(id *)a3;
- (void)setFeatureRequirementOverrides:(id)a3;
- (void)setFitnessMode:(unint64_t)a3;
- (void)setFutureMigrationsEnabled:(BOOL)a3;
- (void)setHasTelephonyCapability:(BOOL)a3;
- (void)setHealthAppHidden:(BOOL)a3;
- (void)setHealthAppNotInstalled:(BOOL)a3;
- (void)setHealthAppSupportedOnDevice:(BOOL)a3;
- (void)setInvalidatesNotificationInstructionsOnLaunch:(BOOL)a3;
- (void)setIsAppleInternalInstall:(BOOL)a3;
- (void)setIsAppleWatch:(BOOL)a3;
- (void)setIsCompanionCapable:(BOOL)a3;
- (void)setIsDeviceSupported:(BOOL)a3;
- (void)setIsIOSDevice:(BOOL)a3;
- (void)setIsProdFused:(BOOL)a3;
- (void)setIsRealityDevice:(BOOL)a3;
- (void)setIsRunningSeedBuild:(BOOL)a3;
- (void)setIsRunningStoreDemoMode:(BOOL)a3;
- (void)setIsStandalonePhoneFitnessMode:(BOOL)a3;
- (void)setIsTestingDevice:(BOOL)a3;
- (void)setIsiPad:(BOOL)a3;
- (void)setOntologyIndexingEnabled:(BOOL)a3;
- (void)setOntologyIndexingRequiresAccounts:(BOOL)a3;
- (void)setPerformsAutomaticConceptIndexing:(BOOL)a3;
- (void)setPerformsAutomaticUserDomainConceptProcessing:(BOOL)a3;
- (void)setPerformsWorkoutCondensation:(BOOL)a3;
- (void)setRunningInStoreDemoModeF201:(BOOL)a3;
- (void)setSchedulesXPCAlarms:(BOOL)a3;
- (void)setShouldOverrideSiriUOD:(BOOL)a3;
- (void)setShouldReceiveECGSamples:(BOOL)a3;
- (void)setShouldRegisterPeriodicActivities:(BOOL)a3;
- (void)setShowSensitiveLogItems:(BOOL)a3;
- (void)setSupportsAWDMetricSubmission:(BOOL)a3;
- (void)setSupportsActiveQueryDaemonTransactions:(BOOL)a3;
- (void)setSupportsActivitySharing:(BOOL)a3;
- (void)setSupportsAppSubscriptions:(BOOL)a3;
- (void)setSupportsBackgroundSyncRequests:(BOOL)a3;
- (void)setSupportsBluetoothDiscovery:(BOOL)a3;
- (void)setSupportsCachedSleepDaySummaryQueries:(BOOL)a3;
- (void)setSupportsCachedStatisticsCollectionQueries:(BOOL)a3;
- (void)setSupportsCloudSync:(BOOL)a3;
- (void)setSupportsCloudSyncSharding:(BOOL)a3;
- (void)setSupportsCloudSyncStagingShard:(BOOL)a3;
- (void)setSupportsComputedUserCharacteristicCaching:(BOOL)a3;
- (void)setSupportsCoordinatedCloudSync:(BOOL)a3;
- (void)setSupportsHeartRateDataCollection:(BOOL)a3;
- (void)setSupportsMedicalIDSync:(BOOL)a3;
- (void)setSupportsNanoSync:(BOOL)a3;
- (void)setSupportsOntology:(BOOL)a3;
- (void)setSupportsOntologyDatabaseFutureMigrations:(BOOL)a3;
- (void)setSupportsOntologyDatabaseUpdates:(BOOL)a3;
- (void)setSupportsOntologyFeatureEvaluation:(BOOL)a3;
- (void)setSupportsPeriodicCountryMonitoring:(BOOL)a3;
- (void)setSupportsPeriodicFullCloudSync:(BOOL)a3;
- (void)setSupportsPeriodicLiteCloudSync:(BOOL)a3;
- (void)setSupportsSampleExpiration:(BOOL)a3;
- (void)setSupportsSharedSummarySync:(BOOL)a3;
- (void)setSupportsSwimmingWorkoutSessions:(BOOL)a3;
- (void)setSupportsWorkoutRouteSmoothing:(BOOL)a3;
- (void)setSupportsWorkoutRouteSmoothingOverride:(BOOL)a3;
- (void)setSupportsWorkouts:(BOOL)a3;
- (void)setTinkerModeEnabled:(BOOL)a3;
- (void)setUnitTest_deviceRegionCode:(id)a3;
- (void)supportsOntologyDatabaseFutureMigrations;
@end

@implementation _HKBehavior

- (BOOL)isAppleInternalInstall
{
  return self->_isAppleInternalInstall;
}

- (BOOL)supportsSampleExpiration
{
  return self->_supportsSampleExpiration;
}

- (BOOL)isDeviceSupported
{
  return self->_isDeviceSupported;
}

+ (BOOL)isAppleInternalInstall
{
  v2 = [a1 sharedBehavior];
  char v3 = [v2 isAppleInternalInstall];

  return v3;
}

+ (id)sharedBehavior
{
  os_unfair_lock_lock((os_unfair_lock_t)&_sharedBehaviorLock);
  if (!+[_HKBehavior sharedBehavior]::defaultBehavior)
  {
    v2 = objc_alloc_init(_HKBehavior);
    char v3 = (void *)+[_HKBehavior sharedBehavior]::defaultBehavior;
    +[_HKBehavior sharedBehavior]::defaultBehavior = (uint64_t)v2;
  }
  id v4 = (id)_sharedBehaviorOverride;
  os_unfair_lock_unlock((os_unfair_lock_t)&_sharedBehaviorLock);
  if (v4) {
    v5 = v4;
  }
  else {
    v5 = (void *)+[_HKBehavior sharedBehavior]::defaultBehavior;
  }
  id v6 = v5;

  return v6;
}

- (NSTimeZone)localTimeZone
{
  return (NSTimeZone *)[MEMORY[0x1E4F1CAF0] localTimeZone];
}

+ (BOOL)activePairedWatchHasSmartFitnessCoaching
{
  v2 = [(id)objc_opt_class() _getActivePairedDevice];
  char v3 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"6ADE877A-70EB-43A1-A4D1-3E4BB50EFA54"];
  char v4 = [v2 supportsCapability:v3];

  return v4;
}

- (BOOL)futureMigrationsEnabled
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v6 = self;
  v7[0] = &unk_1EEC5BD50;
  v7[1] = &v6;
  v8 = v7;
  p_loadLock = &self->_futureMigrationsEnabled._loadLock;
  os_unfair_lock_lock(&self->_futureMigrationsEnabled._loadLock);
  if (self->_futureMigrationsEnabled._hasLoaded)
  {
    char value = self->_futureMigrationsEnabled._value;
  }
  else
  {
    if (!v8) {
      std::__throw_bad_function_call[abi:ne180100]();
    }
    char value = (*(uint64_t (**)(void *))(*v8 + 48))(v8);
    self->_futureMigrationsEnabled._char value = value;
    self->_futureMigrationsEnabled._hasLoaded = 1;
  }
  os_unfair_lock_unlock(p_loadLock);
  std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100](v7);
  return value;
}

- (BOOL)isAppleWatch
{
  return self->_isAppleWatch;
}

- (NSString)currentDeviceProductType
{
  return self->_currentDeviceProductType;
}

- (NSString)currentOSBuild
{
  return self->_currentOSBuild;
}

- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)currentOSVersionStruct
{
  *($A44FF20282FB96BA82CF1B0FF6945C38 *)retstr = ($A44FF20282FB96BA82CF1B0FF6945C38)self[14];
  return self;
}

- (NSString)currentOSVersion
{
  return self->_currentOSVersion;
}

+ (id)currentDeviceProductType
{
  v2 = [a1 sharedBehavior];
  char v3 = [v2 currentDeviceProductType];

  return v3;
}

+ (id)currentDeviceDisplayName
{
  v2 = [a1 sharedBehavior];
  char v3 = [v2 currentDeviceDisplayName];

  return v3;
}

- (NSString)currentDeviceDisplayName
{
  v2 = (void *)MGCopyAnswer();

  return (NSString *)v2;
}

+ (void)setSharedBehavior:(id)a3
{
  id v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&_sharedBehaviorLock);
  char v4 = (void *)_sharedBehaviorOverride;
  _sharedBehaviorOverride = (uint64_t)v3;

  os_unfair_lock_unlock((os_unfair_lock_t)&_sharedBehaviorLock);
}

+ (void)resetSharedBehavior
{
  os_unfair_lock_lock((os_unfair_lock_t)&_sharedBehaviorLock);
  v2 = (void *)_sharedBehaviorOverride;
  _sharedBehaviorOverride = 0;

  os_unfair_lock_unlock((os_unfair_lock_t)&_sharedBehaviorLock);
}

+ (int)nanoSyncProtocolVersionForWatchSystemBuildVersion:(id)a3
{
  id v3 = a3;
  if (objc_msgSend(v3, "hk_compareBuildVersionWithString:", @"15R1") == -1)
  {
    int v4 = 5;
  }
  else if (objc_msgSend(v3, "hk_compareBuildVersionWithString:", @"16R1") == -1)
  {
    int v4 = 6;
  }
  else if (objc_msgSend(v3, "hk_compareBuildVersionWithString:", @"16R565") == -1 {
         || (objc_msgSend(v3, "hk_isBetweenLowerBuildVersion:upperBuildVersion:", @"16R5000", @"16R5565") & 1) != 0)
  }
  {
    int v4 = 8;
  }
  else if (objc_msgSend(v3, "hk_compareBuildVersionWithString:", @"16S36") == -1 {
         || (objc_msgSend(v3, "hk_isBetweenLowerBuildVersion:upperBuildVersion:", @"16S5000", @"16S5036") & 1) != 0)
  }
  {
    int v4 = 9;
  }
  else if (objc_msgSend(v3, "hk_compareBuildVersionWithString:", @"17R540") == -1 {
         || (objc_msgSend(v3, "hk_isBetweenLowerBuildVersion:upperBuildVersion:", @"17R5000", @"17R5540") & 1) != 0)
  }
  {
    int v4 = 10;
  }
  else if (objc_msgSend(v3, "hk_compareBuildVersionWithString:", @"18R325") == -1 {
         || (objc_msgSend(v3, "hk_isBetweenLowerBuildVersion:upperBuildVersion:", @"18R5000", @"18R5325") & 1) != 0)
  }
  {
    int v4 = 11;
  }
  else if (objc_msgSend(v3, "hk_compareBuildVersionWithString:", @"19R321") == -1 {
         || (objc_msgSend(v3, "hk_isBetweenLowerBuildVersion:upperBuildVersion:", @"19R5000", @"19R5321") & 1) != 0)
  }
  {
    int v4 = 12;
  }
  else if (objc_msgSend(v3, "hk_compareBuildVersionWithString:", @"20R263") == -1)
  {
    int v4 = 13;
  }
  else if (objc_msgSend(v3, "hk_compareBuildVersionWithString:", @"21R305") == -1 {
         || (objc_msgSend(v3, "hk_isBetweenLowerBuildVersion:upperBuildVersion:", @"21R5000", @"21R5304") & 1) != 0)
  }
  {
    int v4 = 14;
  }
  else if (objc_msgSend(v3, "hk_compareBuildVersionWithString:", @"22R278") == -1)
  {
    int v4 = 15;
  }
  else
  {
    int v4 = 16;
  }

  return v4;
}

+ (int)nanoSyncProtocolVersionForCompanionSystemBuildVersion:(id)a3
{
  id v3 = a3;
  if (objc_msgSend(v3, "hk_compareBuildVersionWithString:", @"15A1") == -1)
  {
    int v4 = 5;
  }
  else if (objc_msgSend(v3, "hk_compareBuildVersionWithString:", @"16A1") == -1)
  {
    int v4 = 6;
  }
  else if (objc_msgSend(v3, "hk_compareBuildVersionWithString:", @"16B65") == -1 {
         || (objc_msgSend(v3, "hk_isBetweenLowerBuildVersion:upperBuildVersion:", @"16B5000", @"16B5065") & 1) != 0)
  }
  {
    int v4 = 8;
  }
  else if (objc_msgSend(v3, "hk_compareBuildVersionWithString:", @"16C37") == -1 {
         || (objc_msgSend(v3, "hk_isBetweenLowerBuildVersion:upperBuildVersion:", @"16C5000", @"16C5037") & 1) != 0)
  }
  {
    int v4 = 9;
  }
  else if (objc_msgSend(v3, "hk_compareBuildVersionWithString:", @"17A540") == -1 {
         || (objc_msgSend(v3, "hk_isBetweenLowerBuildVersion:upperBuildVersion:", @"17A5000", @"17A5540") & 1) != 0)
  }
  {
    int v4 = 10;
  }
  else if (objc_msgSend(v3, "hk_compareBuildVersionWithString:", @"18A315") == -1 {
         || (objc_msgSend(v3, "hk_isBetweenLowerBuildVersion:upperBuildVersion:", @"18A5000", @"18A5315") & 1) != 0)
  }
  {
    int v4 = 11;
  }
  else if (objc_msgSend(v3, "hk_compareBuildVersionWithString:", @"19A316") == -1 {
         || (objc_msgSend(v3, "hk_isBetweenLowerBuildVersion:upperBuildVersion:", @"19A5000", @"19A5316") & 1) != 0)
  }
  {
    int v4 = 12;
  }
  else if (objc_msgSend(v3, "hk_compareBuildVersionWithString:", @"20A260") == -1)
  {
    int v4 = 13;
  }
  else if (objc_msgSend(v3, "hk_compareBuildVersionWithString:", @"21A277") == -1 {
         || (objc_msgSend(v3, "hk_isBetweenLowerBuildVersion:upperBuildVersion:", @"21A5000", @"21A5276") & 1) != 0)
  }
  {
    int v4 = 14;
  }
  else if (objc_msgSend(v3, "hk_compareBuildVersionWithString:", @"22A276") == -1)
  {
    int v4 = 15;
  }
  else
  {
    int v4 = 16;
  }

  return v4;
}

+ (BOOL)hasPairedWatch
{
  v2 = [(id)objc_opt_class() _getActivePairedDevice];
  BOOL v3 = v2 != 0;

  return v3;
}

+ (id)_getActivePairedDevice
{
  v2 = [getNRPairedDeviceRegistryClass() sharedInstance];
  BOOL v3 = [v2 getActivePairedDevice];

  return v3;
}

+ (BOOL)anyPairedWatchHasFlightsClimbedCapability
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = [getNRPairedDeviceRegistryClass() sharedInstance];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  BOOL v3 = objc_msgSend(v2, "getSetupCompletedDevices", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v3);
        }
        v7 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        v8 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"D1DBCF21-D875-4EA8-B63E-8182578C0B0C"];
        LOBYTE(v7) = [v7 supportsCapability:v8];

        if (v7)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

+ (BOOL)activePairedWatchSupportsHeartRateMotionContexts
{
  v2 = [(id)objc_opt_class() _getActivePairedDevice];
  BOOL v3 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"E17D2903-B868-4E6C-8E76-6D4939BEED44"];
  char v4 = [v2 supportsCapability:v3];

  return v4;
}

+ (BOOL)allPairedWatchesSupportHeartRateMotionContexts
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = [getNRPairedDeviceRegistryClass() sharedInstance];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  BOOL v3 = objc_msgSend(v2, "getSetupCompletedDevices", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v3);
        }
        v7 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        v8 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"E17D2903-B868-4E6C-8E76-6D4939BEED44"];
        LOBYTE(v7) = [v7 supportsCapability:v8];

        if ((v7 & 1) == 0)
        {
          BOOL v9 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  BOOL v9 = 1;
LABEL_11:

  return v9;
}

+ (BOOL)activePairedWatchSupportsBradycardiaDetection
{
  char v2 = [a1 activePairedWatchSupportsHeartRateMotionContexts];
  BOOL v3 = [(id)objc_opt_class() _getActivePairedDevice];
  getNRWatchOSVersionForRemoteDevice(v3);
  uint64_t v5 = v4;

  getNRVersionIsGreaterThanOrEqual(v5);
  return v2 & v6;
}

+ (BOOL)allPairedWatchesSupportBradycardiaDetection
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (![a1 allPairedWatchesSupportHeartRateMotionContexts]) {
    return 0;
  }
  char v2 = [getNRPairedDeviceRegistryClass() sharedInstance];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  BOOL v3 = objc_msgSend(v2, "getSetupCompletedDevices", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v3);
        }
        getNRWatchOSVersionForRemoteDevice(*(void **)(*((void *)&v11 + 1) + 8 * i));
        getNRVersionIsGreaterThanOrEqual(v7);
        if (!v8)
        {
          BOOL v9 = 0;
          goto LABEL_13;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  BOOL v9 = 1;
LABEL_13:

  return v9;
}

- (_HKBehavior)init
{
  v24.receiver = self;
  v24.super_class = (Class)_HKBehavior;
  char v2 = [(_HKBehavior *)&v24 init];
  if (v2)
  {
    v2->_isDeviceSupported = [(id)objc_opt_class() _isDeviceSupported];
    *(_WORD *)&v2->_BOOL isAppleWatch = 0;
    v2->_isRunningSeedBuild = 0;
    v2->_isAppleInternalInstall = [(id)objc_opt_class() _isAppleInternalInstall];
    v2->_char isCompanionCapable = MGGetBoolAnswer();
    v2->_hasTelephonyCapability = [(id)objc_opt_class() _hasTelephonyCapability];
    uint64_t v3 = [(id)objc_opt_class() _currentDeviceName];
    currentDeviceName = v2->_currentDeviceName;
    v2->_currentDeviceName = (NSString *)v3;

    uint64_t v5 = [(id)objc_opt_class() _currentOSBuild];
    currentOSBuild = v2->_currentOSBuild;
    v2->_currentOSBuild = (NSString *)v5;

    uint64_t v7 = [(id)objc_opt_class() _currentOSVersion];
    currentOSVersion = v2->_currentOSVersion;
    v2->_currentOSVersion = (NSString *)v7;

    BOOL v9 = objc_opt_class();
    if (v9)
    {
      [v9 _currentOSVersionStruct];
    }
    else
    {
      long long v22 = 0uLL;
      int64_t v23 = 0;
    }
    *(_OWORD *)&v2->_currentOSVersionStruct.majorVersion = v22;
    v2->_currentOSVersionStruct.patchVersion = v23;
    BOOL isAppleWatch = v2->_isAppleWatch;
    if (isAppleWatch)
    {
      char v11 = 0;
      char isCompanionCapable = 1;
      BOOL v13 = 1;
    }
    else
    {
      char isCompanionCapable = v2->_isCompanionCapable;
      BOOL v13 = isCompanionCapable != 0;
      char v11 = 1;
    }
    v2->_supportsActivitySharing = isCompanionCapable;
    v2->_supportsBackgroundSyncRequests = 1;
    v2->_supportsAppSubscriptions = 1;
    v2->_supportsAWDMetricSubmission = v11;
    v2->_supportsNanoSync = v13;
    v2->_supportsSampleExpiration = isAppleWatch;
    v2->_supportsComputedUserCharacteristicCaching = v11;
    v2->_supportsHeartRateDataCollection = isAppleWatch;
    v2->_supportsBluetoothDiscovery = 1;
    v2->_isProdFused = MGGetBoolAnswer();
    uint64_t v14 = MGCopyAnswer();
    currentDeviceProductType = v2->_currentDeviceProductType;
    v2->_currentDeviceProductType = (NSString *)v14;

    uint64_t v16 = MGCopyAnswer();
    currentDeviceSerialNumber = v2->_currentDeviceSerialNumber;
    v2->_currentDeviceSerialNumber = (NSString *)v16;

    v2->_collectsData = 1;
    BOOL v18 = v2->_isAppleWatch;
    v2->_collectsCalorimetry = v18;
    v2->_performsAutomaticConceptIndexing = !v18;
    v2->_performsWorkoutCondensation = [(id)objc_opt_class() _isiPad] ^ 1;
    v2->_supportsWorkouts = 1;
    BOOL v19 = !v2->_isAppleWatch;
    v2->_supportsOntology = v19;
    v2->_supportsOntologyDatabaseUpdates = v19;
    v2->_supportsOntologyFeatureEvaluation = v19;
    v2->_supportsPeriodicCountryMonitoring = v19;
    v2->_ontologyIndexingEnabled = v19;
    v2->_ontologyIndexingRequiresAccounts = 1;
    v2->_schedulesXPCAlarms = 1;
    v2->_invalidatesNotificationInstructionsOnLaunch = 1;
    featureRequirementOverrides = v2->_featureRequirementOverrides;
    v2->_featureRequirementOverrides = 0;

    v2->_shouldRegisterPeriodicActivities = 1;
    v2->_shouldOverrideSiriUOD = 0;
  }
  return v2;
}

- (_HKFeatureFlags)features
{
  v4[4] = *MEMORY[0x1E4F143B8];
  v4[0] = &unk_1EEC5BB40;
  v4[1] = &__block_literal_global_129;
  v4[3] = v4;
  char v2 = _HKLazyLoader<_HKFeatureFlags * {__strong}>::valueWithLoader((uint64_t)&self->_featureFlags, (uint64_t)v4);
  std::__function::__value_func<_HKFeatureFlags * ()(void)>::~__value_func[abi:ne180100](v4);

  return (_HKFeatureFlags *)v2;
}

+ (BOOL)hasTelephonyCapability
{
  char v2 = [a1 sharedBehavior];
  char v3 = [v2 hasTelephonyCapability];

  return v3;
}

+ (BOOL)isDeviceSupported
{
  char v2 = [a1 sharedBehavior];
  char v3 = [v2 isDeviceSupported];

  return v3;
}

+ (BOOL)isRunningStoreDemoMode
{
  char v2 = [a1 sharedBehavior];
  char v3 = [v2 isRunningStoreDemoMode];

  return v3;
}

+ (BOOL)isiPod
{
  char v2 = [a1 sharedBehavior];
  char v3 = [v2 currentDeviceName];
  char v4 = [v3 isEqualToString:@"iPod touch"];

  return v4;
}

- (BOOL)isiPad
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  char v6 = self;
  v7[0] = &unk_1EEC5BBD0;
  v7[1] = &v6;
  int v8 = v7;
  p_loadLock = &self->_isiPad._loadLock;
  os_unfair_lock_lock(&self->_isiPad._loadLock);
  if (self->_isiPad._hasLoaded)
  {
    char value = self->_isiPad._value;
  }
  else
  {
    if (!v8) {
      std::__throw_bad_function_call[abi:ne180100]();
    }
    char value = (*(uint64_t (**)(void *))(*v8 + 48))(v8);
    self->_isiPad._char value = value;
    self->_isiPad._hasLoaded = 1;
  }
  os_unfair_lock_unlock(p_loadLock);
  std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100](v7);
  return value;
}

- (void)setIsiPad:(BOOL)a3
{
  p_loadLock = &self->_isiPad._loadLock;
  os_unfair_lock_lock(&self->_isiPad._loadLock);
  self->_isiPad._hasLoaded = 1;
  self->_isiPad._char value = a3;

  os_unfair_lock_unlock(p_loadLock);
}

+ (BOOL)_isiPad
{
  char v2 = (void *)MGCopyAnswer();
  char v3 = [v2 isEqualToString:@"iPad"];

  return v3;
}

+ (BOOL)runningInStoreDemoModeF201
{
  char v2 = [a1 sharedBehavior];
  char v3 = [v2 runningInStoreDemoModeF201];

  return v3;
}

+ (BOOL)isTestingDevice
{
  char v2 = [a1 sharedBehavior];
  char v3 = [v2 isTestingDevice];

  return v3;
}

+ (void)setForceBuddy:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v4 setBool:v3 forKey:@"ForceBuddy"];
}

+ (id)currentDeviceName
{
  char v2 = [a1 sharedBehavior];
  BOOL v3 = [v2 currentDeviceName];

  return v3;
}

+ (id)currentDeviceManufacturer
{
  char v2 = [a1 sharedBehavior];
  BOOL v3 = [v2 currentDeviceManufacturer];

  return v3;
}

+ (id)currentDeviceHWModelString
{
  char v2 = [a1 sharedBehavior];
  BOOL v3 = [v2 currentDeviceHWModelString];

  return v3;
}

+ (id)currentDeviceRegionCode
{
  char v2 = [a1 sharedBehavior];
  BOOL v3 = [v2 currentDeviceRegionCode];

  return v3;
}

+ (id)currentDeviceRegionInfo
{
  char v2 = [a1 sharedBehavior];
  BOOL v3 = [v2 currentDeviceRegionInfo];

  return v3;
}

+ (id)currentDeviceClass
{
  char v2 = [a1 sharedBehavior];
  BOOL v3 = [v2 currentDeviceClass];

  return v3;
}

+ (id)currentDeviceReleaseType
{
  char v2 = [a1 sharedBehavior];
  BOOL v3 = [v2 currentDeviceReleaseType];

  return v3;
}

+ (id)currentOSName
{
  char v2 = [a1 sharedBehavior];
  BOOL v3 = [v2 currentOSName];

  return v3;
}

+ (id)currentOSBuild
{
  char v2 = [a1 sharedBehavior];
  BOOL v3 = [v2 currentOSBuild];

  return v3;
}

+ (id)currentOSVersion
{
  char v2 = [a1 sharedBehavior];
  BOOL v3 = [v2 currentOSVersion];

  return v3;
}

+ ($9FE6E10C8CE45DBC9A88DFDEA39A390D)currentOSVersionStruct
{
  id v4 = [a2 sharedBehavior];
  id v6 = v4;
  if (v4)
  {
    [v4 currentOSVersionStruct];
  }
  else
  {
    retstr->var0 = 0;
    retstr->var1 = 0;
    retstr->var2 = 0;
  }

  return result;
}

+ (BOOL)_tinkerModeEnabled
{
  return 0;
}

+ (BOOL)_healthAppHidden
{
  char v2 = +[_HKBehavior sharedBehavior];
  int v3 = [v2 isAppleWatch];

  if (v3)
  {
    id v4 = [MEMORY[0x1E4F74230] sharedConnection];
    uint64_t v5 = [v4 restrictedAppBundleIDs];
    char v6 = [v5 containsObject:@"com.apple.Health"];
    uint64_t v7 = [v4 parentalControlsBlockedAppBundleIDs];
    char v8 = [v7 containsObject:@"com.apple.Health"];
    if ([v4 effectiveBoolValueForSetting:*MEMORY[0x1E4F74060]] == 2) {
      char v9 = 1;
    }
    else {
      char v9 = v6;
    }
    char v10 = v9 | v8;
  }
  else
  {
    char v11 = [MEMORY[0x1E4F223B8] applicationProxyForIdentifier:@"com.apple.Health" placeholder:0];
    id v4 = v11;
    if (!v11)
    {
      char v10 = 0;
      goto LABEL_9;
    }
    uint64_t v5 = [v11 appState];
    char v10 = [v5 isRestricted];
  }

LABEL_9:
  return v10;
}

+ (BOOL)_healthAppNotInstalled
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  char v2 = [a1 sharedBehavior];
  char v3 = [v2 isAppleWatch];

  if (v3) {
    return 0;
  }
  id v12 = 0;
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:@"com.apple.Health" allowPlaceholder:1 error:&v12];
  id v6 = v12;
  uint64_t v7 = v6;
  if (v6 && (objc_msgSend(v6, "hk_isErrorInDomain:code:", *MEMORY[0x1E4F28760], -10814) & 1) == 0)
  {
    _HKInitializeLogging();
    char v8 = HKLogInfrastructure();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = (id)objc_opt_class();
      char v10 = [v7 localizedDescription];
      +[_HKBehavior _healthAppNotInstalled];
    }

    BOOL v4 = 0;
  }
  else
  {
    BOOL v4 = v5 == 0;
  }

  return v4;
}

+ (BOOL)_healthAppSupportedOnDevice
{
  return 1;
}

+ (BOOL)_isStandalonePhoneFitnessMode
{
  return ([(id)objc_opt_class() _isiPad] & 1) == 0
      && CFPreferencesGetAppBooleanValue(@"IsStandalonePhoneFitnessMode", @"com.apple.nanolifestyle", 0) != 0;
}

+ (unint64_t)_fitnessMode
{
  if ([(id)objc_opt_class() _isiPad]) {
    return 1;
  }
  Boolean keyExistsAndHasValidFormat = 0;
  unint64_t result = CFPreferencesGetAppIntegerValue(@"FitnessMode", @"com.apple.nanolifestyle", &keyExistsAndHasValidFormat);
  if (!keyExistsAndHasValidFormat) {
    return 1;
  }
  return result;
}

- (BOOL)tinkerModeEnabled
{
  if (self->_tinkerModeEnabled) {
    return 1;
  }
  char v3 = objc_opt_class();

  return [v3 _tinkerModeEnabled];
}

- (BOOL)healthAppHidden
{
  if (self->_healthAppHidden) {
    return 1;
  }
  char v3 = objc_opt_class();

  return [v3 _healthAppHidden];
}

- (BOOL)healthAppNotInstalled
{
  if (self->_healthAppNotInstalled) {
    return 1;
  }
  char v3 = objc_opt_class();

  return [v3 _healthAppNotInstalled];
}

- (BOOL)healthAppHiddenOrNotInstalled
{
  if ([(_HKBehavior *)self healthAppHidden]) {
    return 1;
  }

  return [(_HKBehavior *)self healthAppNotInstalled];
}

- (BOOL)healthAppSupportedOnDevice
{
  if (self->_healthAppSupportedOnDevice) {
    return 1;
  }
  char v3 = objc_opt_class();

  return [v3 _healthAppSupportedOnDevice];
}

- (BOOL)isStandalonePhoneFitnessMode
{
  if (self->_isStandalonePhoneFitnessMode) {
    return 1;
  }
  char v3 = objc_opt_class();

  return [v3 _isStandalonePhoneFitnessMode];
}

- (unint64_t)fitnessMode
{
  if (self->_overriddenFitnessMode)
  {
    overriddenFitnessMode = self->_overriddenFitnessMode;
    return [(NSNumber *)overriddenFitnessMode unsignedIntegerValue];
  }
  else
  {
    BOOL v4 = objc_opt_class();
    return [v4 _fitnessMode];
  }
}

- (void)setFitnessMode:(unint64_t)a3
{
  BOOL v4 = [NSNumber numberWithUnsignedInteger:a3];
  overriddenFitnessMode = self->_overriddenFitnessMode;
  self->_overriddenFitnessMode = v4;

  MEMORY[0x1F41817F8](v4, overriddenFitnessMode);
}

- (BOOL)supportsWorkoutRouteSmoothing
{
  if (self->_overriddenSupportsWorkoutSmoothing)
  {
    overriddenSupportsWorkoutSmoothing = self->_overriddenSupportsWorkoutSmoothing;
    return [(NSNumber *)overriddenSupportsWorkoutSmoothing BOOLValue];
  }
  else if ([(_HKBehavior *)self isAppleWatch])
  {
    return _os_feature_enabled_impl();
  }
  else
  {
    return 1;
  }
}

- (void)setSupportsWorkoutRouteSmoothingOverride:(BOOL)a3
{
  BOOL v4 = [NSNumber numberWithBool:a3];
  overriddenSupportsWorkoutSmoothing = self->_overriddenSupportsWorkoutSmoothing;
  self->_overriddenSupportsWorkoutSmoothing = v4;

  MEMORY[0x1F41817F8](v4, overriddenSupportsWorkoutSmoothing);
}

- (BOOL)supportsCachedStatisticsCollectionQueries
{
  overriddenSupportsCachedStatisticsCollectionQueries = self->_overriddenSupportsCachedStatisticsCollectionQueries;
  if (overriddenSupportsCachedStatisticsCollectionQueries) {
    return [(NSNumber *)overriddenSupportsCachedStatisticsCollectionQueries BOOLValue];
  }
  else {
    return _os_feature_enabled_impl();
  }
}

- (void)setSupportsCachedStatisticsCollectionQueries:(BOOL)a3
{
  BOOL v4 = [NSNumber numberWithBool:a3];
  overriddenSupportsCachedStatisticsCollectionQueries = self->_overriddenSupportsCachedStatisticsCollectionQueries;
  self->_overriddenSupportsCachedStatisticsCollectionQueries = v4;

  MEMORY[0x1F41817F8](v4, overriddenSupportsCachedStatisticsCollectionQueries);
}

- (BOOL)supportsCachedSleepDaySummaryQueries
{
  overriddenSupportsCachedSleepDaySummaryQueries = self->_overriddenSupportsCachedSleepDaySummaryQueries;
  if (overriddenSupportsCachedSleepDaySummaryQueries) {
    return [(NSNumber *)overriddenSupportsCachedSleepDaySummaryQueries BOOLValue];
  }
  else {
    return _os_feature_enabled_impl();
  }
}

- (void)setSupportsCachedSleepDaySummaryQueries:(BOOL)a3
{
  BOOL v4 = [NSNumber numberWithBool:a3];
  overriddenSupportsCachedSleepDaySummaryQueries = self->_overriddenSupportsCachedSleepDaySummaryQueries;
  self->_overriddenSupportsCachedSleepDaySummaryQueries = v4;

  MEMORY[0x1F41817F8](v4, overriddenSupportsCachedSleepDaySummaryQueries);
}

- (BOOL)supportsActiveQueryDaemonTransactions
{
  overriddenSupportsActiveQueryDaemonTransactions = self->_overriddenSupportsActiveQueryDaemonTransactions;
  if (overriddenSupportsActiveQueryDaemonTransactions) {
    return [(NSNumber *)overriddenSupportsActiveQueryDaemonTransactions BOOLValue];
  }
  else {
    return _os_feature_enabled_impl();
  }
}

- (void)setSupportsActiveQueryDaemonTransactions:(BOOL)a3
{
  BOOL v4 = [NSNumber numberWithBool:a3];
  overriddenSupportsActiveQueryDaemonTransactions = self->_overriddenSupportsActiveQueryDaemonTransactions;
  self->_overriddenSupportsActiveQueryDaemonTransactions = v4;

  MEMORY[0x1F41817F8](v4, overriddenSupportsActiveQueryDaemonTransactions);
}

- (BOOL)supportsSecondaryProfiles
{
  return !self->_isAppleWatch && !self->_isRealityDevice;
}

- (BOOL)isTestingDevice
{
  return CFPreferencesGetAppBooleanValue(@"device-used-for-testing", @"com.apple.dt.Xcode", 0) != 0;
}

- (BOOL)isRunningStoreDemoMode
{
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"StoreDemoMode", @"com.apple.demo-settings", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v1 = AppBooleanValue == 0;
  }
  else {
    BOOL v1 = 1;
  }
  return !v1;
}

- (void)setIsRunningStoreDemoMode:(BOOL)a3
{
  p_loadLock = &self->_isRunningStoreDemoMode._loadLock;
  os_unfair_lock_lock(&self->_isRunningStoreDemoMode._loadLock);
  self->_isRunningStoreDemoMode._hasLoaded = 1;
  self->_isRunningStoreDemoMode._char value = a3;

  os_unfair_lock_unlock(p_loadLock);
}

- (BOOL)runningInStoreDemoModeF201
{
  return ___ZZ41___HKBehavior_runningInStoreDemoModeF201_ENK3__2clEv_block_invoke() == 201;
}

- (void)setRunningInStoreDemoModeF201:(BOOL)a3
{
  p_loadLock = &self->_runningInStoreDemoModeF201._loadLock;
  os_unfair_lock_lock(&self->_runningInStoreDemoModeF201._loadLock);
  self->_runningInStoreDemoModeF201._hasLoaded = 1;
  self->_runningInStoreDemoModeF201._char value = a3;

  os_unfair_lock_unlock(p_loadLock);
}

- (BOOL)shouldReceiveECGSamples
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __38___HKBehavior_shouldReceiveECGSamples__block_invoke;
  v5[3] = &unk_1E58C91A0;
  uint64_t v7 = 0;
  v5[4] = self;
  v6[0] = &unk_1EEC5B8B0;
  v6[1] = _Block_copy(v5);
  uint64_t v7 = v6;
  os_unfair_lock_lock(&self->_shouldReceiveECGSamples._loadLock);
  if (self->_shouldReceiveECGSamples._hasLoaded)
  {
    char value = self->_shouldReceiveECGSamples._value;
  }
  else
  {
    if (!v7) {
      std::__throw_bad_function_call[abi:ne180100]();
    }
    char value = (*(uint64_t (**)(void *))(*v7 + 48))(v7);
    self->_shouldReceiveECGSamples._char value = value;
    self->_shouldReceiveECGSamples._hasLoaded = 1;
  }
  os_unfair_lock_unlock(&self->_shouldReceiveECGSamples._loadLock);
  std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100](v6);
  return value;
}

- (void)setShouldReceiveECGSamples:(BOOL)a3
{
  p_loadLock = &self->_shouldReceiveECGSamples._loadLock;
  os_unfair_lock_lock(&self->_shouldReceiveECGSamples._loadLock);
  self->_shouldReceiveECGSamples._hasLoaded = 1;
  self->_shouldReceiveECGSamples._char value = a3;

  os_unfair_lock_unlock(p_loadLock);
}

- (void)setIsAppleWatch:(BOOL)a3
{
  self->_BOOL isAppleWatch = a3;
  if (a3) {
    self->_isRealityDevice = 0;
  }
}

- (void)setIsRealityDevice:(BOOL)a3
{
  self->_isRealityDevice = a3;
  if (a3) {
    self->_BOOL isAppleWatch = 0;
  }
}

- (void)setIsIOSDevice:(BOOL)a3
{
  if (a3) {
    *(_WORD *)&self->_BOOL isAppleWatch = 0;
  }
}

- (void)setCurrentDeviceDisplayName:(id)a3
{
}

- (NSString)currentDeviceRegionCode
{
  unitTest_deviceRegionCode = self->_unitTest_deviceRegionCode;
  if (unitTest_deviceRegionCode) {
    char v3 = unitTest_deviceRegionCode;
  }
  else {
    char v3 = (NSString *)MGCopyAnswer();
  }

  return v3;
}

- (NSString)currentDeviceRegionInfo
{
  char v2 = (void *)MGCopyAnswer();

  return (NSString *)v2;
}

- (NSString)currentDeviceManufacturer
{
  return (NSString *)@"Apple Inc.";
}

- (NSString)currentDeviceHWModelString
{
  char v2 = (void *)MGCopyAnswer();

  return (NSString *)v2;
}

- (NSString)currentInternalDeviceModel
{
  if ([(_HKBehavior *)self isAppleInternalInstall])
  {
    char v3 = [(_HKBehavior *)self currentDeviceHWModelString];
  }
  else
  {
    char v3 = 0;
  }

  return (NSString *)v3;
}

- (id)currentDeviceReleaseType
{
  char v2 = (void *)MGCopyAnswer();

  return v2;
}

- (BOOL)_hasProductTypePrefix:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(_HKBehavior *)self currentDeviceProductType];
  char v6 = [v5 hasPrefix:v4];

  return v6;
}

- (BOOL)supportsSharedSummarySync
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __40___HKBehavior_supportsSharedSummarySync__block_invoke;
  v5[3] = &unk_1E58C91A0;
  uint64_t v7 = 0;
  v5[4] = self;
  v6[0] = &unk_1EEC5B8B0;
  v6[1] = _Block_copy(v5);
  uint64_t v7 = v6;
  os_unfair_lock_lock(&self->_supportsSharedSummarySync._loadLock);
  if (self->_supportsSharedSummarySync._hasLoaded)
  {
    char value = self->_supportsSharedSummarySync._value;
  }
  else
  {
    if (!v7) {
      std::__throw_bad_function_call[abi:ne180100]();
    }
    char value = (*(uint64_t (**)(void *))(*v7 + 48))(v7);
    self->_supportsSharedSummarySync._char value = value;
    self->_supportsSharedSummarySync._hasLoaded = 1;
  }
  os_unfair_lock_unlock(&self->_supportsSharedSummarySync._loadLock);
  std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100](v6);
  return value;
}

- (void)setSupportsSharedSummarySync:(BOOL)a3
{
  p_loadLock = &self->_supportsSharedSummarySync._loadLock;
  os_unfair_lock_lock(&self->_supportsSharedSummarySync._loadLock);
  self->_supportsSharedSummarySync._hasLoaded = 1;
  self->_supportsSharedSummarySync._char value = a3;

  os_unfair_lock_unlock(p_loadLock);
}

- (BOOL)supportsMedicalIDSync
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __36___HKBehavior_supportsMedicalIDSync__block_invoke;
  v5[3] = &unk_1E58C91A0;
  uint64_t v7 = 0;
  v5[4] = self;
  v6[0] = &unk_1EEC5B8B0;
  v6[1] = _Block_copy(v5);
  uint64_t v7 = v6;
  os_unfair_lock_lock(&self->_supportsMedicalIDSync._loadLock);
  if (self->_supportsMedicalIDSync._hasLoaded)
  {
    char value = self->_supportsMedicalIDSync._value;
  }
  else
  {
    if (!v7) {
      std::__throw_bad_function_call[abi:ne180100]();
    }
    char value = (*(uint64_t (**)(void *))(*v7 + 48))(v7);
    self->_supportsMedicalIDSync._char value = value;
    self->_supportsMedicalIDSync._hasLoaded = 1;
  }
  os_unfair_lock_unlock(&self->_supportsMedicalIDSync._loadLock);
  std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100](v6);
  return value;
}

- (void)setSupportsMedicalIDSync:(BOOL)a3
{
  p_loadLock = &self->_supportsMedicalIDSync._loadLock;
  os_unfair_lock_lock(&self->_supportsMedicalIDSync._loadLock);
  self->_supportsMedicalIDSync._hasLoaded = 1;
  self->_supportsMedicalIDSync._char value = a3;

  os_unfair_lock_unlock(p_loadLock);
}

- (BOOL)canPerformOwnershipTakeover
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42___HKBehavior_canPerformOwnershipTakeover__block_invoke;
  v5[3] = &unk_1E58C91A0;
  uint64_t v7 = 0;
  v5[4] = self;
  v6[0] = &unk_1EEC5B8B0;
  v6[1] = _Block_copy(v5);
  uint64_t v7 = v6;
  os_unfair_lock_lock(&self->_canPerformOwnershipTakeover._loadLock);
  if (self->_canPerformOwnershipTakeover._hasLoaded)
  {
    char value = self->_canPerformOwnershipTakeover._value;
  }
  else
  {
    if (!v7) {
      std::__throw_bad_function_call[abi:ne180100]();
    }
    char value = (*(uint64_t (**)(void *))(*v7 + 48))(v7);
    self->_canPerformOwnershipTakeover._char value = value;
    self->_canPerformOwnershipTakeover._hasLoaded = 1;
  }
  os_unfair_lock_unlock(&self->_canPerformOwnershipTakeover._loadLock);
  std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100](v6);
  return value;
}

- (void)setCanPerformOwnershipTakeover:(BOOL)a3
{
  p_loadLock = &self->_canPerformOwnershipTakeover._loadLock;
  os_unfair_lock_lock(&self->_canPerformOwnershipTakeover._loadLock);
  self->_canPerformOwnershipTakeover._hasLoaded = 1;
  self->_canPerformOwnershipTakeover._char value = a3;

  os_unfair_lock_unlock(p_loadLock);
}

- (NSString)currentDeviceClass
{
  currentDeviceClass = self->_currentDeviceClass;
  if (currentDeviceClass) {
    char v3 = currentDeviceClass;
  }
  else {
    char v3 = (NSString *)MGCopyAnswer();
  }

  return v3;
}

+ (id)_currentOSBuild
{
  char v2 = (void *)MGCopyAnswer();

  return v2;
}

- (NSString)currentOSName
{
  char v2 = (void *)MGCopyAnswer();

  return (NSString *)v2;
}

+ (id)_currentDeviceName
{
  char v2 = (void *)MGCopyAnswer();

  return v2;
}

+ (id)_currentOSVersion
{
  char v2 = (void *)MGCopyAnswer();

  return v2;
}

+ ($9FE6E10C8CE45DBC9A88DFDEA39A390D)_currentOSVersionStruct
{
  id v4 = [MEMORY[0x1E4F28F80] processInfo];
  id v6 = v4;
  if (v4)
  {
    [v4 operatingSystemVersion];
  }
  else
  {
    retstr->var0 = 0;
    retstr->var1 = 0;
    retstr->var2 = 0;
  }

  return result;
}

- (NSDictionary)currentDiskUsage
{
  char v2 = (void *)MGCopyAnswer();

  return (NSDictionary *)v2;
}

- (unint64_t)totalDiskCapacity
{
  char v2 = [(_HKBehavior *)self currentDiskUsage];
  char v3 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4FBA0F8]];
  unint64_t v4 = [v3 unsignedLongLongValue];

  return v4;
}

- (unint64_t)currentDiskSpaceAvailable
{
  char v2 = [(_HKBehavior *)self currentDiskUsage];
  char v3 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4FBA0D8]];
  unint64_t v4 = [v3 unsignedLongLongValue];

  return v4;
}

- (BOOL)supportsSwimmingWorkoutSessions
{
  overriddenSupportsSwimmingWorkoutSessions = self->_overriddenSupportsSwimmingWorkoutSessions;
  if (overriddenSupportsSwimmingWorkoutSessions) {
    return [(NSNumber *)overriddenSupportsSwimmingWorkoutSessions BOOLValue];
  }
  else {
    return HKCoreMotionSupportsSwimmingWorkoutSessions();
  }
}

- (void)setSupportsSwimmingWorkoutSessions:(BOOL)a3
{
  unint64_t v4 = [NSNumber numberWithBool:a3];
  overriddenSupportsSwimmingWorkoutSessions = self->_overriddenSupportsSwimmingWorkoutSessions;
  self->_overriddenSupportsSwimmingWorkoutSessions = v4;

  MEMORY[0x1F41817F8](v4, overriddenSupportsSwimmingWorkoutSessions);
}

- (BOOL)supportsEED
{
  return CLShouldDisplayEEDUI() != 0;
}

- (void)setFutureMigrationsEnabled:(BOOL)a3
{
  p_loadLock = &self->_futureMigrationsEnabled._loadLock;
  os_unfair_lock_lock(&self->_futureMigrationsEnabled._loadLock);
  self->_futureMigrationsEnabled._hasLoaded = 1;
  self->_futureMigrationsEnabled._char value = a3;

  os_unfair_lock_unlock(p_loadLock);
}

- (BOOL)supportsOntologyDatabaseFutureMigrations
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v6 = self;
  v7[0] = &unk_1EEC5BDD0;
  v7[1] = &v6;
  uint64_t v8 = v7;
  p_loadLock = &self->_ontologyDatabaseFutureMigrationsEnabled._loadLock;
  os_unfair_lock_lock(&self->_ontologyDatabaseFutureMigrationsEnabled._loadLock);
  if (self->_ontologyDatabaseFutureMigrationsEnabled._hasLoaded)
  {
    char value = self->_ontologyDatabaseFutureMigrationsEnabled._value;
  }
  else
  {
    if (!v8) {
      std::__throw_bad_function_call[abi:ne180100]();
    }
    char value = (*(uint64_t (**)(void *))(*v8 + 48))(v8);
    self->_ontologyDatabaseFutureMigrationsEnabled._char value = value;
    self->_ontologyDatabaseFutureMigrationsEnabled._hasLoaded = 1;
  }
  os_unfair_lock_unlock(p_loadLock);
  std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100](v7);
  return value;
}

- (void)setSupportsOntologyDatabaseFutureMigrations:(BOOL)a3
{
  p_loadLock = &self->_ontologyDatabaseFutureMigrationsEnabled._loadLock;
  os_unfair_lock_lock(&self->_ontologyDatabaseFutureMigrationsEnabled._loadLock);
  self->_ontologyDatabaseFutureMigrationsEnabled._hasLoaded = 1;
  self->_ontologyDatabaseFutureMigrationsEnabled._char value = a3;

  os_unfair_lock_unlock(p_loadLock);
}

- (BOOL)performsAutomaticUserDomainConceptProcessing
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v6 = self;
  v7[0] = &unk_1EEC5BE50;
  v7[1] = &v6;
  uint64_t v8 = v7;
  p_loadLock = &self->_performsAutomaticUserDomainConceptProcessing._loadLock;
  os_unfair_lock_lock(&self->_performsAutomaticUserDomainConceptProcessing._loadLock);
  if (self->_performsAutomaticUserDomainConceptProcessing._hasLoaded)
  {
    char value = self->_performsAutomaticUserDomainConceptProcessing._value;
  }
  else
  {
    if (!v8) {
      std::__throw_bad_function_call[abi:ne180100]();
    }
    char value = (*(uint64_t (**)(void *))(*v8 + 48))(v8);
    self->_performsAutomaticUserDomainConceptProcessing._char value = value;
    self->_performsAutomaticUserDomainConceptProcessing._hasLoaded = 1;
  }
  os_unfair_lock_unlock(p_loadLock);
  std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100](v7);
  return value;
}

- (void)setPerformsAutomaticUserDomainConceptProcessing:(BOOL)a3
{
  p_loadLock = &self->_performsAutomaticUserDomainConceptProcessing._loadLock;
  os_unfair_lock_lock(&self->_performsAutomaticUserDomainConceptProcessing._loadLock);
  self->_performsAutomaticUserDomainConceptProcessing._hasLoaded = 1;
  self->_performsAutomaticUserDomainConceptProcessing._char value = a3;

  os_unfair_lock_unlock(p_loadLock);
}

- (void)setSupportsCloudSync:(BOOL)a3
{
  p_loadLock = &self->_supportsCloudSync._loadLock;
  os_unfair_lock_lock(&self->_supportsCloudSync._loadLock);
  self->_supportsCloudSync._hasLoaded = 1;
  self->_supportsCloudSync._char value = a3;

  os_unfair_lock_unlock(p_loadLock);
}

- (BOOL)supportsCloudSync
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v6[0] = &unk_1EEC5B8B0;
  v6[1] = &__block_literal_global_228;
  uint64_t v7 = v6;
  p_loadLock = &self->_supportsCloudSync._loadLock;
  os_unfair_lock_lock(&self->_supportsCloudSync._loadLock);
  if (self->_supportsCloudSync._hasLoaded)
  {
    char value = self->_supportsCloudSync._value;
  }
  else
  {
    if (!v7) {
      std::__throw_bad_function_call[abi:ne180100]();
    }
    char value = (*(uint64_t (**)(void *))(*v7 + 48))(v7);
    self->_supportsCloudSync._char value = value;
    self->_supportsCloudSync._hasLoaded = 1;
  }
  os_unfair_lock_unlock(p_loadLock);
  std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100](v6);
  return value;
}

- (void)resetSupportsCloudSync
{
  p_loadLock = &self->_supportsCloudSync._loadLock;
  os_unfair_lock_lock(&self->_supportsCloudSync._loadLock);
  self->_supportsCloudSync._hasLoaded = 0;

  os_unfair_lock_unlock(p_loadLock);
}

- (BOOL)supportsCloudSyncSharding
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __40___HKBehavior_supportsCloudSyncSharding__block_invoke;
  v5[3] = &unk_1E58C91A0;
  uint64_t v7 = 0;
  v5[4] = self;
  v6[0] = &unk_1EEC5B8B0;
  v6[1] = _Block_copy(v5);
  uint64_t v7 = v6;
  os_unfair_lock_lock(&self->_supportsCloudSyncSharding._loadLock);
  if (self->_supportsCloudSyncSharding._hasLoaded)
  {
    char value = self->_supportsCloudSyncSharding._value;
  }
  else
  {
    if (!v7) {
      std::__throw_bad_function_call[abi:ne180100]();
    }
    char value = (*(uint64_t (**)(void *))(*v7 + 48))(v7);
    self->_supportsCloudSyncSharding._char value = value;
    self->_supportsCloudSyncSharding._hasLoaded = 1;
  }
  os_unfair_lock_unlock(&self->_supportsCloudSyncSharding._loadLock);
  std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100](v6);
  return value;
}

- (void)setSupportsCloudSyncSharding:(BOOL)a3
{
  p_loadLock = &self->_supportsCloudSyncSharding._loadLock;
  os_unfair_lock_lock(&self->_supportsCloudSyncSharding._loadLock);
  self->_supportsCloudSyncSharding._hasLoaded = 1;
  self->_supportsCloudSyncSharding._char value = a3;

  os_unfair_lock_unlock(p_loadLock);
}

- (BOOL)supportsCloudSyncStagingShard
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __44___HKBehavior_supportsCloudSyncStagingShard__block_invoke;
  v5[3] = &unk_1E58C91A0;
  uint64_t v7 = 0;
  v5[4] = self;
  v6[0] = &unk_1EEC5B8B0;
  v6[1] = _Block_copy(v5);
  uint64_t v7 = v6;
  os_unfair_lock_lock(&self->_supportsCloudSyncStagingShard._loadLock);
  if (self->_supportsCloudSyncStagingShard._hasLoaded)
  {
    char value = self->_supportsCloudSyncStagingShard._value;
  }
  else
  {
    if (!v7) {
      std::__throw_bad_function_call[abi:ne180100]();
    }
    char value = (*(uint64_t (**)(void *))(*v7 + 48))(v7);
    self->_supportsCloudSyncStagingShard._char value = value;
    self->_supportsCloudSyncStagingShard._hasLoaded = 1;
  }
  os_unfair_lock_unlock(&self->_supportsCloudSyncStagingShard._loadLock);
  std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100](v6);
  return value;
}

- (void)setSupportsCloudSyncStagingShard:(BOOL)a3
{
  p_loadLock = &self->_supportsCloudSyncStagingShard._loadLock;
  os_unfair_lock_lock(&self->_supportsCloudSyncStagingShard._loadLock);
  self->_supportsCloudSyncStagingShard._hasLoaded = 1;
  self->_supportsCloudSyncStagingShard._char value = a3;

  os_unfair_lock_unlock(p_loadLock);
}

- (BOOL)supportsPeriodicFullCloudSync
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __44___HKBehavior_supportsPeriodicFullCloudSync__block_invoke;
  v5[3] = &unk_1E58C91A0;
  uint64_t v7 = 0;
  v5[4] = self;
  v6[0] = &unk_1EEC5B8B0;
  v6[1] = _Block_copy(v5);
  uint64_t v7 = v6;
  os_unfair_lock_lock(&self->_supportsPeriodicFullCloudSync._loadLock);
  if (self->_supportsPeriodicFullCloudSync._hasLoaded)
  {
    char value = self->_supportsPeriodicFullCloudSync._value;
  }
  else
  {
    if (!v7) {
      std::__throw_bad_function_call[abi:ne180100]();
    }
    char value = (*(uint64_t (**)(void *))(*v7 + 48))(v7);
    self->_supportsPeriodicFullCloudSync._char value = value;
    self->_supportsPeriodicFullCloudSync._hasLoaded = 1;
  }
  os_unfair_lock_unlock(&self->_supportsPeriodicFullCloudSync._loadLock);
  std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100](v6);
  return value;
}

- (void)setSupportsPeriodicFullCloudSync:(BOOL)a3
{
  p_loadLock = &self->_supportsPeriodicFullCloudSync._loadLock;
  os_unfair_lock_lock(&self->_supportsPeriodicFullCloudSync._loadLock);
  self->_supportsPeriodicFullCloudSync._hasLoaded = 1;
  self->_supportsPeriodicFullCloudSync._char value = a3;

  os_unfair_lock_unlock(p_loadLock);
}

- (BOOL)supportsPeriodicLiteCloudSync
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __44___HKBehavior_supportsPeriodicLiteCloudSync__block_invoke;
  v5[3] = &unk_1E58C91A0;
  uint64_t v7 = 0;
  v5[4] = self;
  v6[0] = &unk_1EEC5B8B0;
  v6[1] = _Block_copy(v5);
  uint64_t v7 = v6;
  os_unfair_lock_lock(&self->_supportsPeriodicLiteCloudSync._loadLock);
  if (self->_supportsPeriodicLiteCloudSync._hasLoaded)
  {
    char value = self->_supportsPeriodicLiteCloudSync._value;
  }
  else
  {
    if (!v7) {
      std::__throw_bad_function_call[abi:ne180100]();
    }
    char value = (*(uint64_t (**)(void *))(*v7 + 48))(v7);
    self->_supportsPeriodicLiteCloudSync._char value = value;
    self->_supportsPeriodicLiteCloudSync._hasLoaded = 1;
  }
  os_unfair_lock_unlock(&self->_supportsPeriodicLiteCloudSync._loadLock);
  std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100](v6);
  return value;
}

- (void)setSupportsPeriodicLiteCloudSync:(BOOL)a3
{
  p_loadLock = &self->_supportsPeriodicLiteCloudSync._loadLock;
  os_unfair_lock_lock(&self->_supportsPeriodicLiteCloudSync._loadLock);
  self->_supportsPeriodicLiteCloudSync._hasLoaded = 1;
  self->_supportsPeriodicLiteCloudSync._char value = a3;

  os_unfair_lock_unlock(p_loadLock);
}

- (BOOL)supportsCoordinatedCloudSync
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __43___HKBehavior_supportsCoordinatedCloudSync__block_invoke;
  v5[3] = &unk_1E58C91A0;
  uint64_t v7 = 0;
  v5[4] = self;
  v6[0] = &unk_1EEC5B8B0;
  v6[1] = _Block_copy(v5);
  uint64_t v7 = v6;
  os_unfair_lock_lock(&self->_supportsCoordinatedCloudSync._loadLock);
  if (self->_supportsCoordinatedCloudSync._hasLoaded)
  {
    char value = self->_supportsCoordinatedCloudSync._value;
  }
  else
  {
    if (!v7) {
      std::__throw_bad_function_call[abi:ne180100]();
    }
    char value = (*(uint64_t (**)(void *))(*v7 + 48))(v7);
    self->_supportsCoordinatedCloudSync._char value = value;
    self->_supportsCoordinatedCloudSync._hasLoaded = 1;
  }
  os_unfair_lock_unlock(&self->_supportsCoordinatedCloudSync._loadLock);
  std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100](v6);
  return value;
}

- (void)setSupportsCoordinatedCloudSync:(BOOL)a3
{
  p_loadLock = &self->_supportsCoordinatedCloudSync._loadLock;
  os_unfair_lock_lock(&self->_supportsCoordinatedCloudSync._loadLock);
  self->_supportsCoordinatedCloudSync._hasLoaded = 1;
  self->_supportsCoordinatedCloudSync._char value = a3;

  os_unfair_lock_unlock(p_loadLock);
}

+ (BOOL)processHasLoadedUIKit
{
  return NSClassFromString(&cfstr_Uicolor.isa) != 0;
}

- (BOOL)processHasLoadedUIKit
{
  char v2 = objc_opt_class();

  return [v2 processHasLoadedUIKit];
}

+ (BOOL)_isDeviceSupported
{
  if (MGGetBoolAnswer()) {
    return 1;
  }
  if ([a1 _isAppleInternalInstall]
    && ([MEMORY[0x1E4F1CB18] standardUserDefaults],
        unint64_t v4 = objc_claimAutoreleasedReturnValue(),
        int v5 = [v4 BOOLForKey:@"HealthKitOverrideDeviceSupported"],
        v4,
        v5))
  {
    id v6 = v10;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    BOOL v3 = 1;
    uint64_t v7 = __33___HKBehavior__isDeviceSupported__block_invoke;
  }
  else
  {
    BOOL v3 = 0;
    id v6 = v9;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    uint64_t v7 = __33___HKBehavior__isDeviceSupported__block_invoke_236;
  }
  v6[2] = v7;
  void v6[3] = &__block_descriptor_40_e5_v8__0l;
  v6[4] = a1;
  HKDispatchAsyncOnGlobalConcurrentQueue(0x15u, v6);
  return v3;
}

+ (BOOL)_isAppleInternalInstall
{
  char has_internal_diagnostics = os_variant_has_internal_diagnostics();
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __38___HKBehavior__isAppleInternalInstall__block_invoke;
  v4[3] = &__block_descriptor_33_e5_v8__0l;
  char v5 = has_internal_diagnostics;
  HKDispatchAsyncOnGlobalConcurrentQueue(0x15u, v4);
  return has_internal_diagnostics;
}

+ (BOOL)_hasTelephonyCapability
{
  return MGGetBoolAnswer();
}

+ (BOOL)_isForceBuddyEnabled
{
  char v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  if ([v2 BOOLForKey:@"ForceBuddy"])
  {
    char v3 = 1;
  }
  else
  {
    unint64_t v4 = [MEMORY[0x1E4F28F80] processInfo];
    char v5 = [v4 environment];
    id v6 = [v5 objectForKeyedSubscript:@"WD_FORCE_BUDDY"];
    char v3 = [v6 isEqualToString:@"YES"];
  }
  return v3;
}

+ (BOOL)_hasCompletedBuddyWithVersion:(int64_t)a3
{
  char v5 = [a1 sharedBehavior];
  id v6 = [v5 features];
  if ([v6 stanley])
  {
    uint64_t v7 = [a1 sharedBehavior];
    char v8 = [v7 isiPad];

    if (v8)
    {
      uint64_t v9 = (uint64_t *)&kHKHAKeyCompletedBuddyOniPadVersion;
      goto LABEL_6;
    }
  }
  else
  {
  }
  uint64_t v9 = (uint64_t *)&kHKHAKeyCompletedBuddyVersion;
LABEL_6:
  uint64_t v10 = *v9;

  return [a1 _hasCompletedBuddyWithKey:v10 version:a3];
}

+ (void)_setHasCompletedBuddyWithVersion:(int64_t)a3
{
  [a1 _setHasCompletedBuddyWithKey:@"CompletedBuddyVersion" version:a3];
  id v8 = [a1 sharedBehavior];
  char v5 = [v8 features];
  if ([v5 stanley])
  {
    id v6 = [a1 sharedBehavior];
    int v7 = [v6 isiPad];

    if (v7)
    {
      [a1 _setHasCompletedBuddyWithKey:@"CompletedBuddyOniPadVersion" version:a3];
    }
  }
  else
  {
  }
}

+ (BOOL)_hasCompletedBuddyWithKey:(id)a3 version:(int64_t)a4
{
  id v5 = a3;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.health.shared"];
  int v7 = [v6 objectForKey:v5];
  id v8 = v7;
  if (v7)
  {
    int64_t v9 = [v7 integerValue];
  }
  else
  {
    uint64_t v10 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    int64_t v9 = [v10 integerForKey:v5];

    [v6 setInteger:v9 forKey:v5];
  }

  return v9 >= a4;
}

+ (void)_setHasCompletedBuddyWithKey:(id)a3 version:(int64_t)a4
{
  id v7 = a3;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.health.shared"];
  [v5 setInteger:a4 forKey:v7];
  id v6 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v6 setInteger:a4 forKey:v7];
}

+ (void)_resetBuddy
{
}

+ (BOOL)_shouldShowBuddy
{
  if [a1 _isAppleInternalInstall] && (objc_msgSend(a1, "_isForceBuddyEnabled")) {
    return 1;
  }
  else {
    return [a1 hasCompletedBuddyWithVersion:2] ^ 1;
  }
}

+ (BOOL)_isBuddyDisabled
{
  if ([(id)objc_opt_class() isRunningStoreDemoMode]) {
    return 1;
  }
  char v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v2 = [v3 BOOLForKey:@"DisableBuddy"];

  return v2;
}

+ (BOOL)_isDataCollectionForwarderDisabled
{
  char v2 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.healthd"];
  char v3 = [v2 BOOLForKey:@"DisableDataCollectionForwarder"];

  return v3;
}

+ (BOOL)_isCollectBLETypesFromLocalSourceEnabled
{
  char v2 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.healthd"];
  char v3 = [v2 BOOLForKey:@"CollectBLETypesFromLocalSource"];

  return v3;
}

+ (BOOL)_futureMigrationsEnabled
{
  char v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v3 = [v2 persistentDomainForName:@"com.apple.healthd"];

  unint64_t v4 = [v3 objectForKey:@"EnableFutureMigrations"];
  char v5 = [v4 BOOLValue];

  return v5;
}

+ (BOOL)_ontologyDatabaseFutureMigrationsEnabled
{
  char v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v3 = [v2 persistentDomainForName:@"com.apple.healthd"];

  unint64_t v4 = [v3 objectForKey:@"EnableOntologyFutureMigrations"];
  char v5 = [v4 BOOLValue];

  return v5;
}

+ (BOOL)_condensesHeartRateSamples
{
  char v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"HDWorkoutCondenser-heartRate"];

  return v3;
}

+ (BOOL)_isAutomaticProcessingEnabled
{
  char v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"DisableAutomaticUDCProcessing"] ^ 1;

  return v3;
}

- (void)setIsDeviceSupported:(BOOL)a3
{
  self->_isDeviceSupported = a3;
}

- (void)setIsAppleInternalInstall:(BOOL)a3
{
  self->_isAppleInternalInstall = a3;
}

- (BOOL)isRealityDevice
{
  return self->_isRealityDevice;
}

- (BOOL)isCompanionCapable
{
  return self->_isCompanionCapable;
}

- (void)setIsCompanionCapable:(BOOL)a3
{
  self->_char isCompanionCapable = a3;
}

- (BOOL)hasTelephonyCapability
{
  return self->_hasTelephonyCapability;
}

- (void)setHasTelephonyCapability:(BOOL)a3
{
  self->_hasTelephonyCapability = a3;
}

- (void)setIsTestingDevice:(BOOL)a3
{
  self->_isTestingDevice = a3;
}

- (BOOL)isRunningSeedBuild
{
  return self->_isRunningSeedBuild;
}

- (void)setIsRunningSeedBuild:(BOOL)a3
{
  self->_isRunningSeedBuild = a3;
}

- (BOOL)supportsBluetoothDiscovery
{
  return self->_supportsBluetoothDiscovery;
}

- (void)setSupportsBluetoothDiscovery:(BOOL)a3
{
  self->_supportsBluetoothDiscovery = a3;
}

- (BOOL)isProdFused
{
  return self->_isProdFused;
}

- (void)setIsProdFused:(BOOL)a3
{
  self->_isProdFused = a3;
}

- (BOOL)collectsCalorimetry
{
  return self->_collectsCalorimetry;
}

- (void)setCollectsCalorimetry:(BOOL)a3
{
  self->_collectsCalorimetry = a3;
}

- (BOOL)collectsData
{
  return self->_collectsData;
}

- (void)setCollectsData:(BOOL)a3
{
  self->_collectsData = a3;
}

- (BOOL)performsAutomaticConceptIndexing
{
  return self->_performsAutomaticConceptIndexing;
}

- (void)setPerformsAutomaticConceptIndexing:(BOOL)a3
{
  self->_performsAutomaticConceptIndexing = a3;
}

- (BOOL)performsWorkoutCondensation
{
  return self->_performsWorkoutCondensation;
}

- (void)setPerformsWorkoutCondensation:(BOOL)a3
{
  self->_performsWorkoutCondensation = a3;
}

- (BOOL)supportsAWDMetricSubmission
{
  return self->_supportsAWDMetricSubmission;
}

- (void)setSupportsAWDMetricSubmission:(BOOL)a3
{
  self->_supportsAWDMetricSubmission = a3;
}

- (BOOL)supportsActivitySharing
{
  return self->_supportsActivitySharing;
}

- (void)setSupportsActivitySharing:(BOOL)a3
{
  self->_supportsActivitySharing = a3;
}

- (BOOL)supportsAppSubscriptions
{
  return self->_supportsAppSubscriptions;
}

- (void)setSupportsAppSubscriptions:(BOOL)a3
{
  self->_supportsAppSubscriptions = a3;
}

- (BOOL)supportsComputedUserCharacteristicCaching
{
  return self->_supportsComputedUserCharacteristicCaching;
}

- (void)setSupportsComputedUserCharacteristicCaching:(BOOL)a3
{
  self->_supportsComputedUserCharacteristicCaching = a3;
}

- (BOOL)supportsHeartRateDataCollection
{
  return self->_supportsHeartRateDataCollection;
}

- (void)setSupportsHeartRateDataCollection:(BOOL)a3
{
  self->_supportsHeartRateDataCollection = a3;
}

- (BOOL)supportsNanoSync
{
  return self->_supportsNanoSync;
}

- (void)setSupportsNanoSync:(BOOL)a3
{
  self->_supportsNanoSync = a3;
}

- (void)setSupportsSampleExpiration:(BOOL)a3
{
  self->_supportsSampleExpiration = a3;
}

- (BOOL)supportsWorkouts
{
  return self->_supportsWorkouts;
}

- (void)setSupportsWorkouts:(BOOL)a3
{
  self->_supportsWorkouts = a3;
}

- (BOOL)supportsOntology
{
  return self->_supportsOntology;
}

- (void)setSupportsOntology:(BOOL)a3
{
  self->_supportsOntology = a3;
}

- (BOOL)supportsOntologyDatabaseUpdates
{
  return self->_supportsOntologyDatabaseUpdates;
}

- (void)setSupportsOntologyDatabaseUpdates:(BOOL)a3
{
  self->_supportsOntologyDatabaseUpdates = a3;
}

- (BOOL)supportsOntologyFeatureEvaluation
{
  return self->_supportsOntologyFeatureEvaluation;
}

- (void)setSupportsOntologyFeatureEvaluation:(BOOL)a3
{
  self->_supportsOntologyFeatureEvaluation = a3;
}

- (void)setSupportsWorkoutRouteSmoothing:(BOOL)a3
{
  self->_supportsWorkoutRouteSmoothing = a3;
}

- (BOOL)supportsPeriodicCountryMonitoring
{
  return self->_supportsPeriodicCountryMonitoring;
}

- (void)setSupportsPeriodicCountryMonitoring:(BOOL)a3
{
  self->_supportsPeriodicCountryMonitoring = a3;
}

- (BOOL)shouldOverrideSiriUOD
{
  return self->_shouldOverrideSiriUOD;
}

- (void)setShouldOverrideSiriUOD:(BOOL)a3
{
  self->_shouldOverrideSiriUOD = a3;
}

- (void)setTinkerModeEnabled:(BOOL)a3
{
  self->_tinkerModeEnabled = a3;
}

- (void)setHealthAppHidden:(BOOL)a3
{
  self->_healthAppHidden = a3;
}

- (void)setHealthAppNotInstalled:(BOOL)a3
{
  self->_healthAppNotInstalled = a3;
}

- (void)setHealthAppSupportedOnDevice:(BOOL)a3
{
  self->_healthAppSupportedOnDevice = a3;
}

- (BOOL)schedulesXPCAlarms
{
  return self->_schedulesXPCAlarms;
}

- (void)setSchedulesXPCAlarms:(BOOL)a3
{
  self->_schedulesXPCAlarms = a3;
}

- (void)setIsStandalonePhoneFitnessMode:(BOOL)a3
{
  self->_isStandalonePhoneFitnessMode = a3;
}

- (NSString)currentDeviceName
{
  return self->_currentDeviceName;
}

- (void)setCurrentDeviceName:(id)a3
{
}

- (void)setCurrentDeviceClass:(id)a3
{
}

- (void)setCurrentDeviceProductType:(id)a3
{
}

- (NSString)currentDeviceSerialNumber
{
  return self->_currentDeviceSerialNumber;
}

- (void)setCurrentDeviceSerialNumber:(id)a3
{
}

- (void)setCurrentOSBuild:(id)a3
{
}

- (void)setCurrentOSName:(id)a3
{
}

- (void)setCurrentOSVersion:(id)a3
{
}

- (void)setCurrentOSVersionStruct:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_currentOSVersionStruct.patchVersion = a3->var2;
  *(_OWORD *)&self->_currentOSVersionStruct.majorVersion = v3;
}

- (NSString)additionalEntitlementForConnection
{
  return self->_additionalEntitlementForConnection;
}

- (void)setAdditionalEntitlementForConnection:(id)a3
{
}

- (BOOL)shouldRegisterPeriodicActivities
{
  return self->_shouldRegisterPeriodicActivities;
}

- (void)setShouldRegisterPeriodicActivities:(BOOL)a3
{
  self->_shouldRegisterPeriodicActivities = a3;
}

- (BOOL)invalidatesNotificationInstructionsOnLaunch
{
  return self->_invalidatesNotificationInstructionsOnLaunch;
}

- (void)setInvalidatesNotificationInstructionsOnLaunch:(BOOL)a3
{
  self->_invalidatesNotificationInstructionsOnLaunch = a3;
}

- (NSString)unitTest_deviceRegionCode
{
  return self->_unitTest_deviceRegionCode;
}

- (void)setUnitTest_deviceRegionCode:(id)a3
{
}

- (BOOL)ontologyIndexingEnabled
{
  return self->_ontologyIndexingEnabled;
}

- (void)setOntologyIndexingEnabled:(BOOL)a3
{
  self->_ontologyIndexingEnabled = a3;
}

- (BOOL)ontologyIndexingRequiresAccounts
{
  return self->_ontologyIndexingRequiresAccounts;
}

- (void)setOntologyIndexingRequiresAccounts:(BOOL)a3
{
  self->_ontologyIndexingRequiresAccounts = a3;
}

- (BOOL)supportsBackgroundSyncRequests
{
  return self->_supportsBackgroundSyncRequests;
}

- (void)setSupportsBackgroundSyncRequests:(BOOL)a3
{
  self->_supportsBackgroundSyncRequests = a3;
}

- (BOOL)showSensitiveLogItems
{
  return self->_showSensitiveLogItems;
}

- (void)setShowSensitiveLogItems:(BOOL)a3
{
  self->_showSensitiveLogItems = a3;
}

- (NSDictionary)featureRequirementOverrides
{
  return self->_featureRequirementOverrides;
}

- (void)setFeatureRequirementOverrides:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureRequirementOverrides, 0);
  objc_storeStrong((id *)&self->_unitTest_deviceRegionCode, 0);
  objc_storeStrong((id *)&self->_additionalEntitlementForConnection, 0);
  objc_storeStrong((id *)&self->_currentOSVersion, 0);
  objc_storeStrong((id *)&self->_currentOSName, 0);
  objc_storeStrong((id *)&self->_currentOSBuild, 0);
  objc_storeStrong((id *)&self->_currentDeviceSerialNumber, 0);
  objc_storeStrong((id *)&self->_currentDeviceProductType, 0);
  objc_storeStrong((id *)&self->_currentDeviceClass, 0);
  objc_storeStrong((id *)&self->_currentDeviceName, 0);
  objc_storeStrong((id *)&self->_overriddenCurrentDeviceDisplayName, 0);
  objc_storeStrong((id *)&self->_overriddenFitnessMode, 0);
  objc_storeStrong((id *)&self->_overriddenSupportsActiveQueryDaemonTransactions, 0);
  objc_storeStrong((id *)&self->_overriddenSupportsCachedSleepDaySummaryQueries, 0);
  objc_storeStrong((id *)&self->_overriddenSupportsCachedStatisticsCollectionQueries, 0);
  objc_storeStrong((id *)&self->_overriddenSupportsWorkoutSmoothing, 0);
  objc_storeStrong((id *)&self->_overriddenEnableManateeForHSA2Accounts, 0);
  objc_storeStrong((id *)&self->_overriddenSupportsSwimmingWorkoutSessions, 0);
  char value = self->_featureFlags._value;
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((_DWORD *)self + 5) = 0;
  *((_DWORD *)self + 23) = 0;
  *((_DWORD *)self + 25) = 0;
  *((_DWORD *)self + 27) = 0;
  *((_DWORD *)self + 29) = 0;
  *((_DWORD *)self + 31) = 0;
  *((_DWORD *)self + 33) = 0;
  *((_DWORD *)self + 35) = 0;
  *((_DWORD *)self + 37) = 0;
  *((_DWORD *)self + 39) = 0;
  *((_DWORD *)self + 41) = 0;
  *((_DWORD *)self + 43) = 0;
  *((_DWORD *)self + 45) = 0;
  *((_DWORD *)self + 47) = 0;
  *((_DWORD *)self + 49) = 0;
  *((_DWORD *)self + 51) = 0;
  *((_DWORD *)self + 53) = 0;
  return self;
}

- (void)isiPad
{
}

- (uint64_t)isiPad
{
    return a1 + 8;
  else {
    return 0;
  }
}

- (void)isRunningStoreDemoMode
{
}

- (uint64_t)isRunningStoreDemoMode
{
    return a1 + 8;
  else {
    return 0;
  }
}

- (void)runningInStoreDemoModeF201
{
}

- (uint64_t)runningInStoreDemoModeF201
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

- (void)futureMigrationsEnabled
{
}

- (uint64_t)futureMigrationsEnabled
{
    return a1 + 8;
  else {
    return 0;
  }
}

- (void)supportsOntologyDatabaseFutureMigrations
{
}

- (uint64_t)supportsOntologyDatabaseFutureMigrations
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

- (void)performsAutomaticUserDomainConceptProcessing
{
}

- (uint64_t)performsAutomaticUserDomainConceptProcessing
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

+ (void)_healthAppNotInstalled
{
  *(_DWORD *)buf = 138543618;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl(&dword_19C023000, log, OS_LOG_TYPE_ERROR, "%{public}@: Assuming installed due to error in getting Health app install state: %{public}@", buf, 0x16u);
}

@end