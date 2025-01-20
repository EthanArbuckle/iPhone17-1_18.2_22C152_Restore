@interface HFHomeKitDispatcher
+ (BOOL)allowHomeSensingOverride;
+ (BOOL)synchronizesHomeDataModel;
+ (HMHomeManagerConfiguration)configuration;
+ (id)_defaultLogSettings;
+ (id)_logSettingsWithFormatter:(id)a3;
+ (id)_volatileLogSettings;
+ (id)sharedDispatcher;
+ (void)initialize;
+ (void)setAllowHomeSensingOverride:(BOOL)a3;
+ (void)setAutomaticallySynchronizesHomeDataModel:(BOOL)a3;
+ (void)setConfiguration:(id)a3;
+ (void)setOverrideSynchronizesHomeDataModel:(BOOL)a3;
+ (void)setSynchronizesHomeDataModel:(BOOL)a3;
- (BOOL)_shouldPersistSelectedHomeToDefaults;
- (BOOL)hasLoadedHomes;
- (BOOL)selectedHomeFollowsLocation;
- (BOOL)setSelectedHomeWithName:(id)a3;
- (BOOL)willAcceptHomeFutures;
- (HFAccessoryDiagnosticInfoManager)diagnosticInfoManager;
- (HFActivityLogCoordinator)activityLogCoordinator;
- (HFHomeKitAccessorySettingsDataSource)accessorySettingsDataSource;
- (HFHomeKitDispatcher)init;
- (HFHomeManagerCreator)homeManagerCreator;
- (HFLocationSensingCoordinator)locationCoordinator;
- (HFPinCodeManager)pinCodeManager;
- (HFSoftwareUpdateManager)softwareUpdateManager;
- (HMHome)home;
- (HMHome)overrideHome;
- (HMHome)selectedHome;
- (HMHomeManager)homeManager;
- (NADelegateDispatcher)accessoryObserverDispatcher;
- (NADelegateDispatcher)audioControlObserverDispatcher;
- (NADelegateDispatcher)cameraObserverDispatcher;
- (NADelegateDispatcher)homeKitSettingsObserverDispatcher;
- (NADelegateDispatcher)homeManagerObserverDispatcher;
- (NADelegateDispatcher)homeObserverDispatcher;
- (NADelegateDispatcher)homePersonManagerDispatcher;
- (NADelegateDispatcher)lightObserverDispatcher;
- (NADelegateDispatcher)mediaDestinationControllerObserverDispatcher;
- (NADelegateDispatcher)mediaObjectObserverDispatcher;
- (NADelegateDispatcher)mediaSessionObserverDispatcher;
- (NADelegateDispatcher)networkConfigurationObserverDispatcher;
- (NADelegateDispatcher)residentDeviceObserverDispatcher;
- (NADelegateDispatcher)siriEndpointProfileObserverDispatcher;
- (NADelegateDispatcher)softwareUpdateControllerObserverDispatcher;
- (NADelegateDispatcher)softwareUpdateControllerV2ObserverDispatcher;
- (NADelegateDispatcher)softwareUpdateObserverDispatcher;
- (NADelegateDispatcher)symptomFixSessionObserverDispatcher;
- (NADelegateDispatcher)symptomsHandlerObserverDispatcher;
- (NADelegateDispatcher)televisionObserverDispatcher;
- (NADelegateDispatcher)userObserverDispatcher;
- (NADelegateDispatcher)walletKeyDeviceStateObserverDispatcher;
- (NAFuture)allHomesFuture;
- (NAFuture)firstHomeAddedFuture;
- (NAFuture)homeFuture;
- (NAFuture)locationCoordinatorSetupFuture;
- (NAFuture)locationSensingAvailableFuture;
- (NSMutableArray)allHomesPromises;
- (NSMutableArray)firstHomeAddedPromises;
- (NSMutableArray)homePromises;
- (NSMutableDictionary)remoteAccessStateByHomeID;
- (id)_primaryHome;
- (id)_setupLocationSensingCoordinator;
- (id)activityLogCoordinatorForHome:(id)a3;
- (id)homeFutureWithUser:(id)a3;
- (id)homeSensingActiveFuture;
- (id)pinCodeManagerForHome:(id)a3;
- (id)userFutureWithUniqueIdentifierStr:(id)a3;
- (int)homeKitPreferencesChangedNotifyToken;
- (int64_t)_dataModelContextForCurrentEnvironment;
- (void)_createHomeManagerIfNecessary;
- (void)_fetchSettingsForLightProfiles:(id)a3;
- (void)_finishAllHomesPromises:(id)a3;
- (void)_finishFirstHomeAddedPromises:(id)a3;
- (void)_finishHomePromises:(id)a3;
- (void)_handleHomeManagerDidUpdateHomes:(id)a3;
- (void)_initializeObservers;
- (void)_requestSelectedHome:(id)a3;
- (void)_setDelegationEnabled:(BOOL)a3 forAccessoryHierarchy:(id)a4;
- (void)_setDelegationEnabled:(BOOL)a3 forMediaProfileContainer:(id)a4 session:(id)a5;
- (void)_setDelegationEnabled:(BOOL)a3 forUser:(id)a4;
- (void)_setDelegationEnabledForObjectsInCurrentHome:(BOOL)a3;
- (void)_setHomePersonManagerObservationEnabled:(BOOL)a3;
- (void)_setSoftwareUpateControllerV2DelegationEnabled:(BOOL)a3;
- (void)_setupAccessoryObserver;
- (void)_setupHomeManagerObserver;
- (void)_setupHomeObserver;
- (void)_setupMediaObjectObserver;
- (void)_setupMediaSessionObserver;
- (void)_setupResidentDeviceObserver;
- (void)_setupSofwareUpdateControllerObserver;
- (void)_setupSofwareUpdateControllerV2Observer;
- (void)_setupStateDumpHandlers;
- (void)_setupSymptomFixSessionObserver;
- (void)_updateRemoteAccessStateForHome:(id)a3 notifyingObservers:(BOOL)a4;
- (void)addAccessoryObserver:(id)a3;
- (void)addAudioControlObserver:(id)a3;
- (void)addCameraObserver:(id)a3;
- (void)addDiagnosticInfoObserver:(id)a3;
- (void)addHomeKitSettingsObserver:(id)a3;
- (void)addHomeManagerObserver:(id)a3;
- (void)addHomeObserver:(id)a3;
- (void)addHomePersonManagerObserver:(id)a3;
- (void)addLightObserver:(id)a3;
- (void)addMediaDestinationControllerObserver:(id)a3;
- (void)addMediaObjectObserver:(id)a3;
- (void)addMediaProfileObserver:(id)a3;
- (void)addMediaSessionObserver:(id)a3;
- (void)addNetworkConfigurationObserver:(id)a3;
- (void)addObservationForCameraClipManager:(id)a3;
- (void)addResidentDeviceObserver:(id)a3;
- (void)addSiriEndpointProfileObserver:(id)a3;
- (void)addSoftwareUpdateControllerObserver:(id)a3;
- (void)addSoftwareUpdateControllerV2Observer:(id)a3;
- (void)addSoftwareUpdateObserver:(id)a3;
- (void)addSymptomFixSessionObserver:(id)a3;
- (void)addSymptomsHandlerObserver:(id)a3;
- (void)addTelevisionObserver:(id)a3;
- (void)addUserObserver:(id)a3;
- (void)addWalletKeyDeviceStateObserver:(id)a3;
- (void)coordinator:(id)a3 locationSensingAvailabilityDidChange:(BOOL)a4;
- (void)dealloc;
- (void)disconnectDataModelDelegatesWithReason:(id)a3;
- (void)dispatchAccessoryObserverMessage:(id)a3 sender:(id)a4;
- (void)dispatchAudioControlObserverMessage:(id)a3 sender:(id)a4;
- (void)dispatchCameraObserverMessage:(id)a3 sender:(id)a4;
- (void)dispatchHomeKitSettingMessage:(id)a3 sender:(id)a4;
- (void)dispatchHomeKitSettingsObserverMessage:(id)a3 sender:(id)a4;
- (void)dispatchHomeManagerObserverMessage:(id)a3 sender:(id)a4;
- (void)dispatchHomeObserverMessage:(id)a3 sender:(id)a4;
- (void)dispatchHomePersonManagerObserverMessage:(id)a3 sender:(id)a4;
- (void)dispatchLightObserverMessage:(id)a3 sender:(id)a4;
- (void)dispatchLightProfileUpdate:(id)a3 settings:(id)a4 error:(id)a5;
- (void)dispatchMediaDestinationControllerObserverMessage:(id)a3 sender:(id)a4;
- (void)dispatchMediaObjectObserverMessage:(id)a3 sender:(id)a4;
- (void)dispatchMediaSessionObserverMessage:(id)a3 sender:(id)a4;
- (void)dispatchNetworkConfigurationObserverMessage:(id)a3 sender:(id)a4;
- (void)dispatchSiriEndpointObserverMessage:(id)a3 sender:(id)a4;
- (void)dispatchSoftwareUpdateControllerMessage:(id)a3 sender:(id)a4;
- (void)dispatchSoftwareUpdateMessage:(id)a3 sender:(id)a4;
- (void)dispatchSymptomFixSessionObserverMessage:(id)a3 sender:(id)a4;
- (void)dispatchSymptomsHandlerMessage:(id)a3 sender:(id)a4;
- (void)dispatchTelevisionObserverMessage:(id)a3 sender:(id)a4;
- (void)dispatchUserObserverMessage:(id)a3 sender:(id)a4;
- (void)dispatchWalletKeyDeviceStateObserverMessage:(id)a3 sender:(id)a4;
- (void)fetchSettingsForLightProfiles:(id)a3;
- (void)homeManagerWasCreated:(id)a3;
- (void)installStateArbiter:(id)a3 installStateDidChange:(BOOL)a4;
- (void)reconnectDataModelDelegatesWithReason:(id)a3;
- (void)removeAccessoryObserver:(id)a3;
- (void)removeAudioControlObserver:(id)a3;
- (void)removeCameraObserver:(id)a3;
- (void)removeDiagnosticInfoObserver:(id)a3;
- (void)removeHomeKitSettingsObserver:(id)a3;
- (void)removeHomeManagerObserver:(id)a3;
- (void)removeHomeObserver:(id)a3;
- (void)removeHomePersonManagerObserver:(id)a3;
- (void)removeLightObserver:(id)a3;
- (void)removeMediaDestinationControllerObserver:(id)a3;
- (void)removeMediaObjectObserver:(id)a3;
- (void)removeMediaProfileObserver:(id)a3;
- (void)removeMediaSessionObserver:(id)a3;
- (void)removeNetworkConfigurationObserver:(id)a3;
- (void)removeObservationForCameraClipManager:(id)a3;
- (void)removeResidentDeviceObserver:(id)a3;
- (void)removeSiriEndpointProfileObserver:(id)a3;
- (void)removeSoftwareUpdateControllerObserver:(id)a3;
- (void)removeSoftwareUpdateControllerV2Observer:(id)a3;
- (void)removeSoftwareUpdateObserver:(id)a3;
- (void)removeSymptomFixSessionObserver:(id)a3;
- (void)removeSymptomsHandlerObserver:(id)a3;
- (void)removeTelevisionObserver:(id)a3;
- (void)removeUserObserver:(id)a3;
- (void)removeWalletKeyDeviceStateObserver:(id)a3;
- (void)setAccessoryObserverDispatcher:(id)a3;
- (void)setActivityLogCoordinator:(id)a3;
- (void)setAllHomesPromises:(id)a3;
- (void)setAudioControlObserverDispatcher:(id)a3;
- (void)setCameraObserverDispatcher:(id)a3;
- (void)setFirstHomeAddedPromises:(id)a3;
- (void)setHasLoadedHomes:(BOOL)a3;
- (void)setHome:(id)a3;
- (void)setHomeKitPreferencesChangedNotifyToken:(int)a3;
- (void)setHomeKitSettingsObserverDispatcher:(id)a3;
- (void)setHomeManager:(id)a3;
- (void)setHomeManagerAndUpdateDelegate:(id)a3;
- (void)setHomeManagerCreator:(id)a3;
- (void)setHomeManagerObserverDispatcher:(id)a3;
- (void)setHomeObserverDispatcher:(id)a3;
- (void)setHomePersonManagerDispatcher:(id)a3;
- (void)setHomePromises:(id)a3;
- (void)setLightObserverDispatcher:(id)a3;
- (void)setLocationCoordinator:(id)a3;
- (void)setLocationCoordinatorSetupFuture:(id)a3;
- (void)setMediaDestinationControllerObserverDispatcher:(id)a3;
- (void)setMediaObjectObserverDispatcher:(id)a3;
- (void)setMediaSessionObserverDispatcher:(id)a3;
- (void)setNetworkConfigurationObserverDispatcher:(id)a3;
- (void)setOverrideHome:(id)a3;
- (void)setPinCodeManager:(id)a3;
- (void)setRemoteAccessStateByHomeID:(id)a3;
- (void)setResidentDeviceObserverDispatcher:(id)a3;
- (void)setSelectedHome:(id)a3;
- (void)setSelectedHome:(id)a3 userInitiated:(BOOL)a4;
- (void)setSelectedHomeFollowsLocation:(BOOL)a3;
- (void)setSiriEndpointProfileObserverDispatcher:(id)a3;
- (void)setSoftwareUpdateControllerObserverDispatcher:(id)a3;
- (void)setSoftwareUpdateControllerV2ObserverDispatcher:(id)a3;
- (void)setSoftwareUpdateObserverDispatcher:(id)a3;
- (void)setSymptomFixSessionObserverDispatcher:(id)a3;
- (void)setSymptomsHandlerObserverDispatcher:(id)a3;
- (void)setTelevisionObserverDispatcher:(id)a3;
- (void)setUserObserverDispatcher:(id)a3;
- (void)setWalletKeyDeviceStateObserverDispatcher:(id)a3;
- (void)setWillAcceptHomeFutures:(BOOL)a3;
- (void)stateRestorationSettings:(id)a3 selectedHomeIdentifierDidUpdateExternally:(id)a4;
- (void)updateHome;
- (void)updateHomeManagerConfiguration:(id)a3;
- (void)updateHomeSensingState;
- (void)updateSelectedHome;
@end

@implementation HFHomeKitDispatcher

+ (BOOL)synchronizesHomeDataModel
{
  return !+[HFUtilities isInternalTest] && _MergedGlobals_325
      || byte_26AB2FE7A != 0;
}

+ (id)sharedDispatcher
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__HFHomeKitDispatcher_sharedDispatcher__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_26AB2FE90 != -1) {
    dispatch_once(&qword_26AB2FE90, block);
  }
  v2 = (void *)qword_26AB2FE88;
  return v2;
}

- (HMHome)home
{
  return self->_home;
}

+ (void)initialize
{
  uint64_t v2 = [MEMORY[0x263F0E3C8] defaultPrivateConfiguration];
  v3 = (void *)qword_26AB2FE80;
  qword_26AB2FE80 = v2;

  BOOL v4 = +[HFExecutionEnvironment isHomeApp]
    || +[HFExecutionEnvironment isShortcuts]
    || +[HFExecutionEnvironment isSpringBoard]
    || +[HFExecutionEnvironment isMacShortcuts]
    || +[HFExecutionEnvironment isHomeControlService]
    || +[HFExecutionEnvironment isSettings];
  if (_os_feature_enabled_impl())
  {
    if (v4)
    {
      BOOL v5 = 1;
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  int v6 = HM_FEATURE_RVC_DEFAULTS_ENABLED();
  if (v6) {
    char v7 = v4;
  }
  else {
    char v7 = 1;
  }
  if (v6) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = v4;
  }
  if ((v7 & 1) == 0) {
LABEL_17:
  }
    BOOL v5 = +[HFExecutionEnvironment isWatchApp];
LABEL_18:
  _MergedGlobals_325 = v5;
  if (_os_feature_enabled_impl()) {
    char v8 = !+[HFExecutionEnvironment isSpringBoard];
  }
  else {
    char v8 = 1;
  }
  byte_26AB2FE79 = v8;
}

- (void)_setDelegationEnabled:(BOOL)a3 forAccessoryHierarchy:(id)a4
{
  BOOL v4 = a3;
  uint64_t v84 = *MEMORY[0x263EF8340];
  id v6 = a4;
  char v7 = [v6 home];
  char v8 = [(HFHomeKitDispatcher *)self home];
  char v9 = [v7 isEqual:v8];

  if ((v9 & 1) == 0)
  {
    v10 = HFLogForCategory(0x25uLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v59 = [v6 home];
      v60 = [(HFHomeKitDispatcher *)self home];
      *(_DWORD *)buf = 138412802;
      id v79 = v6;
      __int16 v80 = 2112;
      v81 = v59;
      __int16 v82 = 2112;
      v83 = v60;
      _os_log_error_impl(&dword_20B986000, v10, OS_LOG_TYPE_ERROR, "Setting delegate for accessory %@ with home %@ not in current home %@", buf, 0x20u);
    }
  }
  if (v4)
  {
    v11 = [(HFHomeKitDispatcher *)self accessoryObserverDispatcher];
    v12 = [v11 proxy];
    [v6 setDelegate:v12];
  }
  else
  {
    [v6 setDelegate:0];
  }
  long long v73 = 0u;
  long long v74 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  v13 = [v6 cameraProfiles];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v71 objects:v77 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v72;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v72 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = *(void **)(*((void *)&v71 + 1) + 8 * v17);
        if (v4)
        {
          v19 = [(HFHomeKitDispatcher *)self cameraObserverDispatcher];
          v20 = [v19 proxy];
        }
        else
        {
          v20 = 0;
        }
        v21 = [v18 snapshotControl];
        [v21 setDelegate:v20];

        v22 = [v18 streamControl];
        [v22 setDelegate:v20];

        v23 = [v18 userSettings];
        [v23 setDelegate:v20];

        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [v13 countByEnumeratingWithState:&v71 objects:v77 count:16];
    }
    while (v15);
  }

  v24 = [v6 profiles];
  v25 = objc_msgSend(v24, "na_map:", &__block_literal_global_623);
  v69[0] = MEMORY[0x263EF8330];
  v69[1] = 3221225472;
  v69[2] = __67__HFHomeKitDispatcher__setDelegationEnabled_forAccessoryHierarchy___block_invoke_2;
  v69[3] = &unk_26409C308;
  BOOL v70 = v4;
  v69[4] = self;
  objc_msgSend(v25, "na_each:", v69);

  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  v26 = [v6 televisionProfiles];
  uint64_t v27 = [v26 countByEnumeratingWithState:&v65 objects:v76 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v66;
    do
    {
      uint64_t v30 = 0;
      do
      {
        if (*(void *)v66 != v29) {
          objc_enumerationMutation(v26);
        }
        v31 = *(void **)(*((void *)&v65 + 1) + 8 * v30);
        if (v4)
        {
          v32 = [(HFHomeKitDispatcher *)self televisionObserverDispatcher];
          v33 = [v32 proxy];
          [v31 setDelegate:v33];
        }
        else
        {
          [*(id *)(*((void *)&v65 + 1) + 8 * v30) setDelegate:0];
        }
        ++v30;
      }
      while (v28 != v30);
      uint64_t v28 = [v26 countByEnumeratingWithState:&v65 objects:v76 count:16];
    }
    while (v28);
  }

  if (v4)
  {
    v26 = [(HFHomeKitDispatcher *)self softwareUpdateControllerObserverDispatcher];
    v34 = [v26 proxy];
  }
  else
  {
    v34 = 0;
  }
  v35 = [v6 softwareUpdateController];
  [v35 setDelegate:v34];

  if (v4)
  {

    v26 = [(HFHomeKitDispatcher *)self softwareUpdateObserverDispatcher];
    v36 = [v26 proxy];
  }
  else
  {
    v36 = 0;
  }
  v37 = [v6 softwareUpdateController];
  v38 = [v37 availableUpdate];
  [v38 setDelegate:v36];

  if (v4)
  {

    v39 = [(HFHomeKitDispatcher *)self softwareUpdateManager];
    v40 = objc_msgSend(MEMORY[0x263EFFA08], "na_setWithSafeObject:", v6);
    [v39 startObservingSoftwareUpdatesForAccessories:v40];
  }
  else
  {
    v39 = [(HFHomeKitDispatcher *)self softwareUpdateManager];
    v40 = objc_msgSend(MEMORY[0x263EFFA08], "na_setWithSafeObject:", v6);
    [v39 stopObservingSoftwareUpdatesForAccessories:v40];
  }

  id v41 = [v6 mediaProfile];

  if (v41)
  {
    v42 = [v6 mediaProfile];
    [(HFHomeKitDispatcher *)self _setDelegationEnabled:1 forMediaProfileContainer:v42 session:0];

    id v41 = 0;
    if (objc_msgSend(v6, "hf_isAppleTV")) {
      id v41 = v6;
    }
    if (v4)
    {
      v40 = [(HFHomeKitDispatcher *)self mediaDestinationControllerObserverDispatcher];
      v43 = [v40 proxy];
    }
    else
    {
      v43 = 0;
    }
    v44 = [v41 audioDestinationController];
    [v44 setDelegate:v43];

    if (v4)
    {
    }
  }
  if (!+[HFExecutionEnvironment isHomeWidgetRelatedProcess])
  {
    if (v4)
    {
      id v41 = [(HFHomeKitDispatcher *)self symptomsHandlerObserverDispatcher];
      v45 = [v41 proxy];
    }
    else
    {
      v45 = 0;
    }
    v46 = [v6 symptomsHandler];
    [v46 setDelegate:v45];

    if (v4)
    {
    }
  }
  v47 = objc_msgSend(v6, "hf_siriEndpointProfile");

  if (v47)
  {
    v48 = [(HFHomeKitDispatcher *)self siriEndpointProfileObserverDispatcher];
    v49 = [v48 proxy];
    v50 = objc_msgSend(v6, "hf_siriEndpointProfile");
    [v50 setDelegate:v49];
  }
  v51 = [v6 lightProfiles];
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  uint64_t v52 = [v51 countByEnumeratingWithState:&v61 objects:v75 count:16];
  if (v52)
  {
    uint64_t v53 = v52;
    uint64_t v54 = *(void *)v62;
    do
    {
      uint64_t v55 = 0;
      do
      {
        if (*(void *)v62 != v54) {
          objc_enumerationMutation(v51);
        }
        v56 = *(void **)(*((void *)&v61 + 1) + 8 * v55);
        if (v4)
        {
          v57 = [(HFHomeKitDispatcher *)self lightObserverDispatcher];
          v58 = [v57 proxy];
          [v56 setDelegate:v58];
        }
        else
        {
          [*(id *)(*((void *)&v61 + 1) + 8 * v55) setDelegate:0];
        }
        ++v55;
      }
      while (v53 != v55);
      uint64_t v53 = [v51 countByEnumeratingWithState:&v61 objects:v75 count:16];
    }
    while (v53);
  }
}

- (HFSoftwareUpdateManager)softwareUpdateManager
{
  return self->_softwareUpdateManager;
}

- (NADelegateDispatcher)accessoryObserverDispatcher
{
  return self->_accessoryObserverDispatcher;
}

- (NADelegateDispatcher)softwareUpdateObserverDispatcher
{
  return self->_softwareUpdateObserverDispatcher;
}

- (NADelegateDispatcher)symptomsHandlerObserverDispatcher
{
  return self->_symptomsHandlerObserverDispatcher;
}

- (NADelegateDispatcher)softwareUpdateControllerObserverDispatcher
{
  return self->_softwareUpdateControllerObserverDispatcher;
}

- (void)addLightObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(HFHomeKitDispatcher *)self lightObserverDispatcher];
  [v5 addObserver:v4];
}

- (NADelegateDispatcher)lightObserverDispatcher
{
  return self->_lightObserverDispatcher;
}

id __42__HFHomeKitDispatcher__defaultLogSettings__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v2, "hf_prettyDescription");
  }
  else {
  v3 = [v2 description];
  }

  return v3;
}

void __67__HFHomeKitDispatcher__setDelegationEnabled_forAccessoryHierarchy___block_invoke_2(uint64_t a1, void *a2)
{
  if (*(unsigned char *)(a1 + 40))
  {
    id v2 = *(void **)(a1 + 32);
    id v3 = a2;
    id v5 = [v2 networkConfigurationObserverDispatcher];
    id v4 = [v5 proxy];
    [v3 setDelegate:v4];
  }
  else
  {
    id v5 = a2;
    [v5 setDelegate:0];
  }
}

- (void)dispatchWalletKeyDeviceStateObserverMessage:(id)a3 sender:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HFHomeKitDispatcher *)self walletKeyDeviceStateObserverDispatcher];
  [v8 dispatchMessageExcludingSender:v6 usingBlock:v7];
}

- (void)reconnectDataModelDelegatesWithReason:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(id)objc_opt_class() synchronizesHomeDataModel])
  {
    id v5 = HFLogForCategory(0x25uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138412290;
      id v18 = v4;
      _os_log_impl(&dword_20B986000, v5, OS_LOG_TYPE_DEFAULT, "Enabling data model delegates with reason: %@", (uint8_t *)&v17, 0xCu);
    }

    int64_t v6 = [(HFHomeKitDispatcher *)self _dataModelContextForCurrentEnvironment];
    [MEMORY[0x263F49240] setContext:v6];
    id v7 = [MEMORY[0x263F49240] shared];
    [(HFHomeKitDispatcher *)self addHomeManagerObserver:v7];

    id v8 = [MEMORY[0x263F49240] shared];
    [(HFHomeKitDispatcher *)self addHomeObserver:v8];

    char v9 = [MEMORY[0x263F49240] shared];
    [(HFHomeKitDispatcher *)self addAccessoryObserver:v9];

    v10 = [MEMORY[0x263F49240] shared];
    [(HFHomeKitDispatcher *)self addMediaSessionObserver:v10];

    v11 = [MEMORY[0x263F49240] shared];
    [(HFHomeKitDispatcher *)self addMediaObjectObserver:v11];

    v12 = [MEMORY[0x263F49240] shared];
    [(HFHomeKitDispatcher *)self addResidentDeviceObserver:v12];

    v13 = [MEMORY[0x263F49240] shared];
    [(HFHomeKitDispatcher *)self addLightObserver:v13];

    uint64_t v14 = [MEMORY[0x263F49240] shared];
    [(HFHomeKitDispatcher *)self addSoftwareUpdateObserver:v14];

    uint64_t v15 = [MEMORY[0x263F49240] shared];
    [(HFHomeKitDispatcher *)self addSoftwareUpdateControllerV2Observer:v15];

    uint64_t v16 = [MEMORY[0x263F49240] shared];
    [(HFHomeKitDispatcher *)self addSymptomsHandlerObserver:v16];
  }
}

- (void)addAccessoryObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(HFHomeKitDispatcher *)self accessoryObserverDispatcher];
  [v5 addObserver:v4];
}

- (void)addUserObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(HFHomeKitDispatcher *)self userObserverDispatcher];
  [v5 addObserver:v4];
}

- (NADelegateDispatcher)userObserverDispatcher
{
  return self->_userObserverDispatcher;
}

- (void)addSoftwareUpdateObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(HFHomeKitDispatcher *)self softwareUpdateObserverDispatcher];
  [v5 addObserver:v4];
}

- (void)addResidentDeviceObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(HFHomeKitDispatcher *)self residentDeviceObserverDispatcher];
  [v5 addObserver:v4];
}

- (NADelegateDispatcher)residentDeviceObserverDispatcher
{
  return self->_residentDeviceObserverDispatcher;
}

- (void)addSymptomsHandlerObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(HFHomeKitDispatcher *)self symptomsHandlerObserverDispatcher];
  [v5 addObserver:v4];
}

- (void)addMediaSessionObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(HFHomeKitDispatcher *)self mediaSessionObserverDispatcher];
  [v5 addObserver:v4];
}

- (NADelegateDispatcher)mediaSessionObserverDispatcher
{
  return self->_mediaSessionObserverDispatcher;
}

- (void)addMediaObjectObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(HFHomeKitDispatcher *)self mediaObjectObserverDispatcher];
  [v5 addObserver:v4];
}

- (NADelegateDispatcher)mediaObjectObserverDispatcher
{
  return self->_mediaObjectObserverDispatcher;
}

- (void)addHomeKitSettingsObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(HFHomeKitDispatcher *)self homeKitSettingsObserverDispatcher];
  [v5 addObserver:v4];
}

- (NADelegateDispatcher)homeKitSettingsObserverDispatcher
{
  return self->_homeKitSettingsObserverDispatcher;
}

- (void)addCameraObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(HFHomeKitDispatcher *)self cameraObserverDispatcher];
  [v5 addObserver:v4];
}

- (NADelegateDispatcher)cameraObserverDispatcher
{
  return self->_cameraObserverDispatcher;
}

- (void)addWalletKeyDeviceStateObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(HFHomeKitDispatcher *)self walletKeyDeviceStateObserverDispatcher];
  [v5 addObserver:v4];
}

- (NADelegateDispatcher)walletKeyDeviceStateObserverDispatcher
{
  return self->_walletKeyDeviceStateObserverDispatcher;
}

- (void)addTelevisionObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(HFHomeKitDispatcher *)self televisionObserverDispatcher];
  [v5 addObserver:v4];
}

- (NADelegateDispatcher)televisionObserverDispatcher
{
  return self->_televisionObserverDispatcher;
}

- (void)addSymptomFixSessionObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(HFHomeKitDispatcher *)self symptomFixSessionObserverDispatcher];
  [v5 addObserver:v4];
}

- (NADelegateDispatcher)symptomFixSessionObserverDispatcher
{
  return self->_symptomFixSessionObserverDispatcher;
}

- (void)addSoftwareUpdateControllerObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(HFHomeKitDispatcher *)self softwareUpdateControllerObserverDispatcher];
  [v5 addObserver:v4];
}

- (void)addSiriEndpointProfileObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(HFHomeKitDispatcher *)self siriEndpointProfileObserverDispatcher];
  [v5 addObserver:v4];
}

- (NADelegateDispatcher)siriEndpointProfileObserverDispatcher
{
  return self->_siriEndpointProfileObserverDispatcher;
}

- (void)addNetworkConfigurationObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(HFHomeKitDispatcher *)self networkConfigurationObserverDispatcher];
  [v5 addObserver:v4];
}

- (NADelegateDispatcher)networkConfigurationObserverDispatcher
{
  return self->_networkConfigurationObserverDispatcher;
}

- (void)addMediaDestinationControllerObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(HFHomeKitDispatcher *)self mediaDestinationControllerObserverDispatcher];
  [v5 addObserver:v4];
}

- (NADelegateDispatcher)mediaDestinationControllerObserverDispatcher
{
  return self->_mediaDestinationControllerObserverDispatcher;
}

- (void)addHomePersonManagerObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(HFHomeKitDispatcher *)self homePersonManagerDispatcher];
  [v5 addObserver:v4];
}

- (NADelegateDispatcher)homePersonManagerDispatcher
{
  return self->_homePersonManagerDispatcher;
}

- (void)addAudioControlObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(HFHomeKitDispatcher *)self audioControlObserverDispatcher];
  [v5 addObserver:v4];
}

- (NADelegateDispatcher)audioControlObserverDispatcher
{
  return self->_audioControlObserverDispatcher;
}

- (void)dispatchHomeObserverMessage:(id)a3 sender:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HFHomeKitDispatcher *)self homeObserverDispatcher];
  [v8 dispatchMessageExcludingSender:v6 usingBlock:v7];
}

- (void)addHomeObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(HFHomeKitDispatcher *)self homeObserverDispatcher];
  [v5 addObserver:v4];
}

- (NADelegateDispatcher)homeObserverDispatcher
{
  return self->_homeObserverDispatcher;
}

- (void)addHomeManagerObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(HFHomeKitDispatcher *)self homeManagerObserverDispatcher];
  [v5 addObserver:v4];
}

- (NADelegateDispatcher)homeManagerObserverDispatcher
{
  return self->_homeManagerObserverDispatcher;
}

- (void)removeWalletKeyDeviceStateObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(HFHomeKitDispatcher *)self walletKeyDeviceStateObserverDispatcher];
  [v5 removeObserver:v4];
}

- (void)removeUserObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(HFHomeKitDispatcher *)self userObserverDispatcher];
  [v5 removeObserver:v4];
}

- (void)removeTelevisionObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(HFHomeKitDispatcher *)self televisionObserverDispatcher];
  [v5 removeObserver:v4];
}

- (void)removeSymptomsHandlerObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(HFHomeKitDispatcher *)self symptomsHandlerObserverDispatcher];
  [v5 removeObserver:v4];
}

- (void)removeSymptomFixSessionObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(HFHomeKitDispatcher *)self symptomFixSessionObserverDispatcher];
  [v5 removeObserver:v4];
}

- (void)removeSoftwareUpdateObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(HFHomeKitDispatcher *)self softwareUpdateObserverDispatcher];
  [v5 removeObserver:v4];
}

- (void)removeSoftwareUpdateControllerObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(HFHomeKitDispatcher *)self softwareUpdateControllerObserverDispatcher];
  [v5 removeObserver:v4];
}

- (void)removeSiriEndpointProfileObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(HFHomeKitDispatcher *)self siriEndpointProfileObserverDispatcher];
  [v5 removeObserver:v4];
}

- (void)removeResidentDeviceObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(HFHomeKitDispatcher *)self residentDeviceObserverDispatcher];
  [v5 removeObserver:v4];
}

- (void)removeNetworkConfigurationObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(HFHomeKitDispatcher *)self networkConfigurationObserverDispatcher];
  [v5 removeObserver:v4];
}

- (void)removeMediaSessionObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(HFHomeKitDispatcher *)self mediaSessionObserverDispatcher];
  [v5 removeObserver:v4];
}

- (void)removeMediaObjectObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(HFHomeKitDispatcher *)self mediaObjectObserverDispatcher];
  [v5 removeObserver:v4];
}

- (void)removeMediaDestinationControllerObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(HFHomeKitDispatcher *)self mediaDestinationControllerObserverDispatcher];
  [v5 removeObserver:v4];
}

- (void)removeLightObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(HFHomeKitDispatcher *)self lightObserverDispatcher];
  [v5 removeObserver:v4];
}

- (void)removeHomePersonManagerObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(HFHomeKitDispatcher *)self homePersonManagerDispatcher];
  [v5 removeObserver:v4];
}

- (void)removeHomeObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(HFHomeKitDispatcher *)self homeObserverDispatcher];
  [v5 removeObserver:v4];
}

- (void)removeHomeManagerObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(HFHomeKitDispatcher *)self homeManagerObserverDispatcher];
  [v5 removeObserver:v4];
}

- (void)removeHomeKitSettingsObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(HFHomeKitDispatcher *)self homeKitSettingsObserverDispatcher];
  [v5 removeObserver:v4];
}

- (void)removeCameraObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(HFHomeKitDispatcher *)self cameraObserverDispatcher];
  [v5 removeObserver:v4];
}

- (void)removeAudioControlObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(HFHomeKitDispatcher *)self audioControlObserverDispatcher];
  [v5 removeObserver:v4];
}

- (void)removeAccessoryObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(HFHomeKitDispatcher *)self accessoryObserverDispatcher];
  [v5 removeObserver:v4];
}

- (int64_t)_dataModelContextForCurrentEnvironment
{
  if (+[HFExecutionEnvironment isHomeApp]) {
    return 1;
  }
  if (+[HFExecutionEnvironment isHomeControlService]) {
    return 2;
  }
  if (+[HFExecutionEnvironment isHomeWidgetRelatedProcess])
  {
    return 3;
  }
  if (+[HFExecutionEnvironment isHomeWidgetIntents]) {
    return 3;
  }
  return 0;
}

- (void)updateHomeSensingState
{
  objc_initWeak(&location, self);
  id v3 = HFLogForCategory(0x2BuLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20B986000, v3, OS_LOG_TYPE_DEFAULT, "updateHomeSensingState - Home Sensing: will check and switch homes if necessary", buf, 2u);
  }

  id v4 = [(HFHomeKitDispatcher *)self homeSensingActiveFuture];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __45__HFHomeKitDispatcher_updateHomeSensingState__block_invoke;
  v6[3] = &unk_26409C380;
  objc_copyWeak(&v7, &location);
  id v5 = (id)[v4 addCompletionBlock:v6];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)setLocationCoordinator:(id)a3
{
}

- (id)homeSensingActiveFuture
{
  id v3 = [(HFHomeKitDispatcher *)self locationCoordinatorSetupFuture];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __46__HFHomeKitDispatcher_homeSensingActiveFuture__block_invoke;
  v10[3] = &unk_264092428;
  v10[4] = self;
  id v4 = [v3 flatMap:v10];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __46__HFHomeKitDispatcher_homeSensingActiveFuture__block_invoke_2;
  v9[3] = &unk_26409C358;
  v9[4] = self;
  id v5 = [v4 flatMap:v9];
  id v6 = [MEMORY[0x263F581B8] mainThreadScheduler];
  id v7 = [v5 reschedule:v6];

  return v7;
}

- (NAFuture)locationCoordinatorSetupFuture
{
  return self->_locationCoordinatorSetupFuture;
}

id __67__HFHomeKitDispatcher__setDelegationEnabled_forAccessoryHierarchy___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  id v3 = v2;
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  return v5;
}

uint64_t __39__HFHomeKitDispatcher_sharedDispatcher__block_invoke(uint64_t a1)
{
  qword_26AB2FE88 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return MEMORY[0x270F9A758]();
}

- (HFHomeKitDispatcher)init
{
  v36.receiver = self;
  v36.super_class = (Class)HFHomeKitDispatcher;
  id v2 = [(HFHomeKitDispatcher *)&v36 init];
  if (v2)
  {
    id v3 = HFLogForCategory(0x25uLL);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_20B986000, v3, OS_LOG_TYPE_DEFAULT, "Initializing HomeKit dispatcher", (uint8_t *)&buf, 2u);
    }

    id v4 = HFLogForCategory(0x32uLL);
    if (os_signpost_enabled(v4))
    {
      LOWORD(buf) = 0;
      _os_signpost_emit_with_name_impl(&dword_20B986000, v4, OS_SIGNPOST_INTERVAL_BEGIN, 0x1F5uLL, "HomeKitDataLoad", "Start HomeKit Warmup", (uint8_t *)&buf, 2u);
    }

    [(HFHomeKitDispatcher *)v2 _initializeObservers];
    uint64_t v5 = [MEMORY[0x263EFF980] array];
    homePromises = v2->_homePromises;
    v2->_homePromises = (NSMutableArray *)v5;

    uint64_t v7 = [MEMORY[0x263EFF980] array];
    firstHomeAddedPromises = v2->_firstHomeAddedPromises;
    v2->_firstHomeAddedPromises = (NSMutableArray *)v7;

    uint64_t v9 = [MEMORY[0x263EFF980] array];
    allHomesPromises = v2->_allHomesPromises;
    v2->_allHomesPromises = (NSMutableArray *)v9;

    uint64_t v11 = [MEMORY[0x263EFF9A0] dictionary];
    remoteAccessStateByHomeID = v2->_remoteAccessStateByHomeID;
    v2->_remoteAccessStateByHomeID = (NSMutableDictionary *)v11;

    v2->_willAcceptHomeFutures = 0;
    v13 = objc_alloc_init(HFHomeKitPreferencesUtilities);
    uint64_t v14 = [HFHomeManagerCreator alloc];
    uint64_t v15 = +[HFExecutionEnvironment sharedInstance];
    uint64_t v16 = [v15 hostProcess];
    int v17 = [(HFHomeManagerCreator *)v14 initWithHostProcess:v16 configuration:qword_26AB2FE80 homeStatus:v13 delegate:v2];
    [(HFHomeKitDispatcher *)v2 setHomeManagerCreator:v17];

    [(HFHomeKitDispatcher *)v2 _createHomeManagerIfNecessary];
    id v18 = [(HFHomeKitDispatcher *)v2 allHomesFuture];
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = __27__HFHomeKitDispatcher_init__block_invoke;
    v34[3] = &unk_264093558;
    uint64_t v19 = v2;
    v35 = v19;
    id v20 = (id)[v18 addSuccessBlock:v34];
    v21 = [(HFHomeKitDispatcher *)v19 _setupLocationSensingCoordinator];
    [(HFHomeKitDispatcher *)v19 setLocationCoordinatorSetupFuture:v21];

    v22 = +[HFHomeAppInstallStateArbiter sharedInstance];
    [v22 addObserver:v19];

    v23 = +[HFStateRestorationSettings sharedInstance];
    [v23 addObserver:v19];

    objc_initWeak(&buf, v19);
    v24 = (const char *)*MEMORY[0x263F0CBB8];
    v25 = MEMORY[0x263EF83A0];
    id v26 = MEMORY[0x263EF83A0];
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __27__HFHomeKitDispatcher_init__block_invoke_2;
    handler[3] = &unk_26408DD70;
    objc_copyWeak(&v32, &buf);
    notify_register_dispatch(v24, &v19->_homeKitPreferencesChangedNotifyToken, v25, handler);

    if (v19->_homeManager)
    {
      uint64_t v27 = [[HFHomeKitAccessorySettingsDataSource alloc] initWithHomeManager:v19->_homeManager];
      accessorySettingsDataSource = v19->_accessorySettingsDataSource;
      v19->_accessorySettingsDataSource = v27;
    }
    [(HFHomeKitDispatcher *)v19 _setupStateDumpHandlers];
    uint64_t v29 = v19;
    objc_destroyWeak(&v32);
    objc_destroyWeak(&buf);
  }
  return v2;
}

- (void)setLocationCoordinatorSetupFuture:(id)a3
{
}

- (void)setHomeManagerCreator:(id)a3
{
}

- (id)_setupLocationSensingCoordinator
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__HFHomeKitDispatcher__setupLocationSensingCoordinator__block_invoke;
  block[3] = &unk_26408DDE0;
  block[4] = self;
  if (qword_26AB2FE98 != -1) {
    dispatch_once(&qword_26AB2FE98, block);
  }
  if (byte_26AB2FE7B)
  {
    objc_initWeak(&location, self);
    id v3 = +[HFHomeAppInstallStateArbiter sharedInstance];
    id v4 = [v3 homeAppInstalledFuture];
    uint64_t v5 = [MEMORY[0x263F42628] mainScheduler];
    id v6 = [v4 reschedule:v5];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __55__HFHomeKitDispatcher__setupLocationSensingCoordinator__block_invoke_601;
    v10[3] = &unk_264092628;
    objc_copyWeak(&v11, &location);
    uint64_t v7 = [v6 flatMap:v10];
    objc_destroyWeak(&v11);

    objc_destroyWeak(&location);
  }
  else
  {
    id v8 = HFLogForCategory(0x2BuLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(location) = 0;
      _os_log_impl(&dword_20B986000, v8, OS_LOG_TYPE_DEFAULT, "Skipping setup of Home Sensing", (uint8_t *)&location, 2u);
    }

    uint64_t v7 = [MEMORY[0x263F58190] futureWithNoResult];
  }
  return v7;
}

- (void)_createHomeManagerIfNecessary
{
  id v3 = [(HFHomeKitDispatcher *)self homeManager];

  if (!v3)
  {
    id v4 = [(HFHomeKitDispatcher *)self homeManagerCreator];
    uint64_t v5 = [v4 canCreateHomeManager];

    if (v5)
    {
      id v6 = [(HFHomeKitDispatcher *)self homeManagerCreator];
      uint64_t v7 = [v6 createHomeManagerIfNeeded];

      if (v7)
      {
        [(HFHomeKitDispatcher *)self setHomeManagerAndUpdateDelegate:v7];
        id v8 = HFLogForCategory(0x25uLL);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)id buf = 0;
          _os_log_impl(&dword_20B986000, v8, OS_LOG_TYPE_DEFAULT, "Home Manager created inline", buf, 2u);
        }
      }
    }
    else
    {
      uint64_t v9 = HFLogForCategory(0x25uLL);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_20B986000, v9, OS_LOG_TYPE_DEFAULT, "Not creating home manager, refusing to accept any home futures until one is set.", v10, 2u);
      }

      [(HFHomeKitDispatcher *)self setWillAcceptHomeFutures:0];
    }
    [(HFHomeKitDispatcher *)self setWillAcceptHomeFutures:v5];
  }
}

- (HFHomeManagerCreator)homeManagerCreator
{
  return self->_homeManagerCreator;
}

- (void)setWillAcceptHomeFutures:(BOOL)a3
{
  self->_willAcceptHomeFutures = a3;
}

- (void)setHomeManagerAndUpdateDelegate:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = HFLogForCategory(0x25uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    id v14 = v5;
    _os_log_impl(&dword_20B986000, v6, OS_LOG_TYPE_DEFAULT, "Setting home manager to %@ and awaiting home update", (uint8_t *)&v13, 0xCu);
  }

  self->_hasLoadedHomes = 0;
  home = self->_home;
  self->_home = 0;

  overrideHome = self->_overrideHome;
  self->_overrideHome = 0;

  selectedHome = self->_selectedHome;
  self->_selectedHome = 0;

  objc_storeStrong((id *)&self->_homeManager, a3);
  self->_willAcceptHomeFutures = v5 != 0;
  if ([(id)objc_opt_class() synchronizesHomeDataModel])
  {
    v10 = [MEMORY[0x263F49240] shared];
    [v10 setHomeManager:v5];
  }
  id v11 = [(HFHomeKitDispatcher *)self homeManagerObserverDispatcher];
  v12 = [v11 proxy];
  [(HMHomeManager *)self->_homeManager setDelegate:v12];

  if (!v5) {
    [(HFHomeKitDispatcher *)self _initializeObservers];
  }
}

- (void)stateRestorationSettings:(id)a3 selectedHomeIdentifierDidUpdateExternally:(id)a4
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = HFLogForCategory(0x25uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v5;
    _os_log_impl(&dword_20B986000, v6, OS_LOG_TYPE_DEFAULT, "Received selected home changed notification. New selected home identifier: %@", (uint8_t *)&v7, 0xCu);
  }

  [(HFHomeKitDispatcher *)self updateSelectedHome];
}

void __48__HFHomeKitDispatcher__setupHomeManagerObserver__block_invoke(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v4 = [v3 objectAtIndexedSubscript:0];

  [WeakRetained _handleHomeManagerDidUpdateHomes:v4];
}

- (void)_handleHomeManagerDidUpdateHomes:(id)a3
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = HFLogForCategory(0x25uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 currentHome];
    *(_DWORD *)id buf = 138412546;
    id v48 = v4;
    __int16 v49 = 2112;
    v50 = v6;
    _os_log_impl(&dword_20B986000, v5, OS_LOG_TYPE_DEFAULT, "homeManagerDidUpdateHomes: %@, manager's currentHome: %@", buf, 0x16u);
  }
  if ([(HFHomeKitDispatcher *)self hasLoadedHomes])
  {
    [(HFHomeKitDispatcher *)self updateSelectedHome];
    int v7 = HFLogForCategory(0x25uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id buf = 0;
      _os_log_impl(&dword_20B986000, v7, OS_LOG_TYPE_DEFAULT, "homeManagerDidFinishUnknownChange", buf, 2u);
    }

    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v8 = [(HFHomeKitDispatcher *)self homeManagerObserverDispatcher];
    uint64_t v9 = [v8 observers];

    uint64_t v10 = [v9 countByEnumeratingWithState:&v40 objects:v46 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v41;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v41 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = *(void **)(*((void *)&v40 + 1) + 8 * i);
          if (objc_opt_respondsToSelector())
          {
            [v14 homeManagerDidFinishUnknownChange:v4];
          }
          else if (objc_opt_respondsToSelector())
          {
            [v14 homeManagerDidUpdateHomes:v4];
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v40 objects:v46 count:16];
      }
      while (v11);
    }
  }
  else
  {
    uint64_t v15 = HFLogForCategory(0x32uLL);
    if (os_signpost_enabled(v15))
    {
      *(_WORD *)id buf = 0;
      _os_signpost_emit_with_name_impl(&dword_20B986000, v15, OS_SIGNPOST_INTERVAL_END, 0x1F5uLL, "HomeKitDataLoad", "HomeKit homes DB loaded", buf, 2u);
    }

    [(HFHomeKitDispatcher *)self updateSelectedHome];
    [(HFHomeKitDispatcher *)self setHasLoadedHomes:1];
    uint64_t v16 = [(HFHomeKitDispatcher *)self homePromises];
    [(HFHomeKitDispatcher *)self _finishHomePromises:v16];

    int v17 = [(HFHomeKitDispatcher *)self homePromises];
    [v17 removeAllObjects];

    id v18 = [(HFHomeKitDispatcher *)self allHomesPromises];
    [(HFHomeKitDispatcher *)self _finishAllHomesPromises:v18];

    uint64_t v19 = [(HFHomeKitDispatcher *)self allHomesPromises];
    [v19 removeAllObjects];

    id v20 = HFLogForCategory(0x25uLL);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id buf = 0;
      _os_log_impl(&dword_20B986000, v20, OS_LOG_TYPE_DEFAULT, "homeManagerDidFinishInitialDatabaseLoad", buf, 2u);
    }

    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    v21 = [(HFHomeKitDispatcher *)self homeManagerObserverDispatcher];
    v22 = [v21 observers];

    uint64_t v23 = [v22 countByEnumeratingWithState:&v36 objects:v45 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v37;
      do
      {
        for (uint64_t j = 0; j != v24; ++j)
        {
          if (*(void *)v37 != v25) {
            objc_enumerationMutation(v22);
          }
          uint64_t v27 = *(void **)(*((void *)&v36 + 1) + 8 * j);
          if (objc_opt_respondsToSelector())
          {
            [v27 homeManagerDidFinishInitialDatabaseLoad:v4];
          }
          else if (objc_opt_respondsToSelector())
          {
            [v27 homeManagerDidUpdateHomes:v4];
          }
        }
        uint64_t v24 = [v22 countByEnumeratingWithState:&v36 objects:v45 count:16];
      }
      while (v24);
    }

    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    uint64_t v9 = objc_msgSend(v4, "homes", 0);
    uint64_t v28 = [v9 countByEnumeratingWithState:&v32 objects:v44 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v33;
      do
      {
        for (uint64_t k = 0; k != v29; ++k)
        {
          if (*(void *)v33 != v30) {
            objc_enumerationMutation(v9);
          }
          [(HFHomeKitDispatcher *)self _updateRemoteAccessStateForHome:*(void *)(*((void *)&v32 + 1) + 8 * k) notifyingObservers:0];
        }
        uint64_t v29 = [v9 countByEnumeratingWithState:&v32 objects:v44 count:16];
      }
      while (v29);
    }
  }
}

- (NSMutableArray)homePromises
{
  return self->_homePromises;
}

- (NSMutableArray)allHomesPromises
{
  return self->_allHomesPromises;
}

- (void)setHasLoadedHomes:(BOOL)a3
{
  self->_hasLoadedHomes = a3;
}

- (void)_updateRemoteAccessStateForHome:(id)a3 notifyingObservers:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v7 = a3;
  if (v7)
  {
    id v8 = [(HFHomeKitDispatcher *)self remoteAccessStateByHomeID];
    uint64_t v9 = [v7 uniqueIdentifier];
    uint64_t v10 = [v8 objectForKeyedSubscript:v9];

    uint64_t v11 = objc_msgSend(v7, "hf_remoteAccessState");
    if (!v10 || [v10 integerValue] != v11)
    {
      uint64_t v12 = [NSNumber numberWithUnsignedInteger:v11];
      int v13 = [(HFHomeKitDispatcher *)self remoteAccessStateByHomeID];
      id v14 = [v7 uniqueIdentifier];
      [v13 setObject:v12 forKeyedSubscript:v14];

      if (v4)
      {
        uint64_t v15 = [(HFHomeKitDispatcher *)self homeObserverDispatcher];
        uint64_t v16 = [v15 proxy];
        [v16 home:v7 remoteAccessStateDidChange:v11];
      }
    }
  }
  else
  {
    int v17 = HFLogForCategory(0x25uLL);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      id v18 = NSStringFromSelector(a2);
      int v19 = 138412546;
      id v20 = self;
      __int16 v21 = 2112;
      v22 = v18;
      _os_log_error_impl(&dword_20B986000, v17, OS_LOG_TYPE_ERROR, "%@:%@: Unexpected nil home", (uint8_t *)&v19, 0x16u);
    }
  }
}

- (NSMutableDictionary)remoteAccessStateByHomeID
{
  return self->_remoteAccessStateByHomeID;
}

- (void)_setDelegationEnabled:(BOOL)a3 forUser:(id)a4
{
  BOOL v4 = a3;
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = [(HFHomeKitDispatcher *)self home];
  id v8 = [v6 userSettingsForHome:v7];

  uint64_t v9 = [v8 settings];
  uint64_t v10 = [v9 rootGroup];

  if (!v10)
  {
    uint64_t v11 = HFLogForCategory(0x25uLL);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v20 = 138412290;
      id v21 = v6;
      _os_log_error_impl(&dword_20B986000, v11, OS_LOG_TYPE_ERROR, "Attempting to set delegate for user %@ settings - but settings are invalid", (uint8_t *)&v20, 0xCu);
    }
  }
  uint64_t v12 = [v8 privateSettings];
  int v13 = [v12 rootGroup];

  if (v13)
  {
    if (v4)
    {
LABEL_7:
      uint64_t v12 = [(HFHomeKitDispatcher *)self homeKitSettingsObserverDispatcher];
      id v14 = [v12 proxy];
      goto LABEL_12;
    }
  }
  else
  {
    uint64_t v12 = HFLogForCategory(0x25uLL);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v20 = 138412290;
      id v21 = v6;
      _os_log_error_impl(&dword_20B986000, v12, OS_LOG_TYPE_ERROR, "Attempting to set delegate for user %@ private settings - but private settings are invalid", (uint8_t *)&v20, 0xCu);
    }

    if (v4) {
      goto LABEL_7;
    }
  }
  id v14 = 0;
LABEL_12:
  uint64_t v15 = [v8 settings];
  [v15 setDelegate:v14];

  if (v4)
  {

    uint64_t v12 = [(HFHomeKitDispatcher *)self homeKitSettingsObserverDispatcher];
    uint64_t v16 = [v12 proxy];
  }
  else
  {
    uint64_t v16 = 0;
  }
  int v17 = [v8 privateSettings];
  [v17 setDelegate:v16];

  if (v4)
  {

    id v18 = [(HFHomeKitDispatcher *)self userObserverDispatcher];
    int v19 = [v18 proxy];
    [v6 setDelegate:v19];
  }
  else
  {
    [v6 setDelegate:0];
  }
}

- (void)_setupStateDumpHandlers
{
  objc_initWeak(&location, self);
  id v2 = +[HFDebugStateDumpManager sharedInstance];
  uint64_t v6 = MEMORY[0x263EF8330];
  uint64_t v7 = 3221225472;
  id v8 = __46__HFHomeKitDispatcher__setupStateDumpHandlers__block_invoke;
  uint64_t v9 = &unk_26408CBE8;
  objc_copyWeak(&v10, &location);
  id v3 = (id)[v2 registerStateDumpHandler:&v6 withName:@"HFHomeKitState"];

  BOOL v4 = +[HFDebugStateDumpManager sharedInstance];
  id v5 = (id)[v4 registerStateDumpHandler:&__block_literal_global_572 withName:@"ProjectVersions"];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

uint64_t __46__HFHomeKitDispatcher_homeSensingActiveFuture__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) locationSensingAvailableFuture];
}

uint64_t __41__HFHomeKitDispatcher_updateSelectedHome__block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 uniqueIdentifier];
  uint64_t v4 = [v2 isEqual:v3];

  return v4;
}

void __45__HFHomeKitDispatcher_updateHomeSensingState__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = [WeakRetained homeManager];
  uint64_t v6 = [MEMORY[0x263F0E2B8] currentHomeUniqueIdentifier];
  uint64_t v7 = objc_msgSend(v5, "hf_homeWithIdentifier:", v6);

  id v8 = HFLogForCategory(0x2BuLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = [v3 BOOLValue];
    id v10 = objc_msgSend(v7, "hf_displayName");
    uint64_t v11 = [WeakRetained selectedHome];
    uint64_t v12 = objc_msgSend(v11, "hf_displayName");
    int v18 = 67109634;
    *(_DWORD *)int v19 = v9;
    *(_WORD *)&v19[4] = 2112;
    *(void *)&v19[6] = v10;
    __int16 v20 = 2112;
    id v21 = v12;
    _os_log_impl(&dword_20B986000, v8, OS_LOG_TYPE_DEFAULT, "updateHomeSensingState - Home Sensing: isSensingEnabled? %{BOOL}d homeManager.currentHome: %@ selectedHome: %@", (uint8_t *)&v18, 0x1Cu);
  }
  if ([v3 BOOLValue])
  {
    if (v7)
    {
      int v13 = [v7 uniqueIdentifier];
      id v14 = [WeakRetained selectedHome];
      uint64_t v15 = [v14 uniqueIdentifier];
      char v16 = [v13 isEqual:v15];

      if ((v16 & 1) == 0)
      {
        int v17 = HFLogForCategory(0x2BuLL);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          int v18 = 138412290;
          *(void *)int v19 = v7;
          _os_log_impl(&dword_20B986000, v17, OS_LOG_TYPE_DEFAULT, "Home Sensing: requesting home %@", (uint8_t *)&v18, 0xCu);
        }

        [WeakRetained _requestSelectedHome:v7];
      }
    }
  }
}

- (void)updateHome
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v3 = [(HFHomeKitDispatcher *)self overrideHome];
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(HFHomeKitDispatcher *)self selectedHome];
  }
  uint64_t v6 = v5;

  uint64_t v7 = [(HFHomeKitDispatcher *)self home];
  id v8 = [v7 uniqueIdentifier];
  int v9 = [v6 uniqueIdentifier];
  char v10 = [v8 isEqual:v9];

  if ((v10 & 1) == 0)
  {
    [(HFHomeKitDispatcher *)self _setDelegationEnabledForObjectsInCurrentHome:0];
    uint64_t v11 = HFLogForCategory(0x25uLL);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v25 = 138412546;
      id v26 = v6;
      __int16 v27 = 1024;
      int v28 = [(id)objc_opt_class() synchronizesHomeDataModel];
      _os_log_impl(&dword_20B986000, v11, OS_LOG_TYPE_DEFAULT, "Updating dispatcher home to %@. synchronizesHomeDataModel is %{BOOL}d", (uint8_t *)&v25, 0x12u);
    }

    [(HFHomeKitDispatcher *)self setHome:v6];
    [(HFHomeKitDispatcher *)self _setDelegationEnabledForObjectsInCurrentHome:1];
    uint64_t v12 = [(HFHomeKitDispatcher *)self home];

    if (v12)
    {
      int v13 = [(HFHomeKitDispatcher *)self firstHomeAddedPromises];
      [(HFHomeKitDispatcher *)self _finishFirstHomeAddedPromises:v13];

      id v14 = [(HFHomeKitDispatcher *)self firstHomeAddedPromises];
      [v14 removeAllObjects];
    }
    if ([(HFHomeKitDispatcher *)self hasLoadedHomes])
    {
      uint64_t v15 = [(HFHomeKitDispatcher *)self homeManagerObserverDispatcher];
      char v16 = [v15 proxy];
      int v17 = [(HFHomeKitDispatcher *)self homeManager];
      int v18 = [(HFHomeKitDispatcher *)self home];
      [v16 homeKitDispatcher:self manager:v17 didChangeHome:v18];
    }
    int v19 = (void *)MEMORY[0x263EFFA08];
    __int16 v20 = [(HFHomeKitDispatcher *)self home];
    id v21 = objc_msgSend(v20, "hf_allLightProfiles");
    uint64_t v22 = [v19 setWithArray:v21];

    [(HFHomeKitDispatcher *)self fetchSettingsForLightProfiles:v22];
  }
  if ([(id)objc_opt_class() synchronizesHomeDataModel])
  {
    uint64_t v23 = [(HFHomeKitDispatcher *)self home];
    uint64_t v24 = [MEMORY[0x263F49240] shared];
    [v24 setCurrentHome:v23];
  }
}

- (NSMutableArray)firstHomeAddedPromises
{
  return self->_firstHomeAddedPromises;
}

- (void)_setDelegationEnabledForObjectsInCurrentHome:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v52 = *MEMORY[0x263EF8340];
  -[HFHomeKitDispatcher _setSoftwareUpateControllerV2DelegationEnabled:](self, "_setSoftwareUpateControllerV2DelegationEnabled:");
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v5 = [(HFHomeKitDispatcher *)self home];
  uint64_t v6 = [v5 accessories];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v44 objects:v51 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v45;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v45 != v9) {
          objc_enumerationMutation(v6);
        }
        [(HFHomeKitDispatcher *)self _setDelegationEnabled:v3 forAccessoryHierarchy:*(void *)(*((void *)&v44 + 1) + 8 * v10++)];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v44 objects:v51 count:16];
    }
    while (v8);
  }

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  uint64_t v11 = [(HFHomeKitDispatcher *)self home];
  uint64_t v12 = [v11 mediaSystems];

  uint64_t v13 = [v12 countByEnumeratingWithState:&v40 objects:v50 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v41;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v41 != v15) {
          objc_enumerationMutation(v12);
        }
        [(HFHomeKitDispatcher *)self _setDelegationEnabled:v3 forMediaProfileContainer:*(void *)(*((void *)&v40 + 1) + 8 * v16++) session:0];
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v40 objects:v50 count:16];
    }
    while (v14);
  }

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  int v17 = [(HFHomeKitDispatcher *)self home];
  int v18 = [v17 residentDevices];

  uint64_t v19 = [v18 countByEnumeratingWithState:&v36 objects:v49 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v37;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v37 != v21) {
          objc_enumerationMutation(v18);
        }
        uint64_t v23 = *(void **)(*((void *)&v36 + 1) + 8 * v22);
        if (v3)
        {
          uint64_t v24 = [(HFHomeKitDispatcher *)self residentDeviceObserverDispatcher];
          int v25 = [v24 proxy];
          [v23 setDelegate:v25];
        }
        else
        {
          [*(id *)(*((void *)&v36 + 1) + 8 * v22) setDelegate:0];
        }
        ++v22;
      }
      while (v20 != v22);
      uint64_t v20 = [v18 countByEnumeratingWithState:&v36 objects:v49 count:16];
    }
    while (v20);
  }

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v26 = [(HFHomeKitDispatcher *)self home];
  __int16 v27 = objc_msgSend(v26, "hf_allUsersIncludingCurrentUser");

  uint64_t v28 = [v27 countByEnumeratingWithState:&v32 objects:v48 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v33;
    do
    {
      uint64_t v31 = 0;
      do
      {
        if (*(void *)v33 != v30) {
          objc_enumerationMutation(v27);
        }
        [(HFHomeKitDispatcher *)self _setDelegationEnabled:v3 forUser:*(void *)(*((void *)&v32 + 1) + 8 * v31++)];
      }
      while (v29 != v31);
      uint64_t v29 = [v27 countByEnumeratingWithState:&v32 objects:v48 count:16];
    }
    while (v29);
  }

  [(HFHomeKitDispatcher *)self _setHomePersonManagerObservationEnabled:v3];
}

- (void)_setSoftwareUpateControllerV2DelegationEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3)
  {
    id v8 = [(HFHomeKitDispatcher *)self softwareUpdateControllerV2ObserverDispatcher];
    id v5 = [v8 proxy];
  }
  else
  {
    id v5 = 0;
  }
  uint64_t v6 = [(HFHomeKitDispatcher *)self home];
  uint64_t v7 = [v6 softwareUpdateController];
  [v7 setDelegate:v5];

  if (v3)
  {
  }
  else
  {
    id v8 = [(HFHomeKitDispatcher *)self softwareUpdateManager];
    [v8 resetCaches];
  }
}

- (void)_setHomePersonManagerObservationEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(HFHomeKitDispatcher *)self home];
  id v8 = [v5 personManager];

  if (v8)
  {
    uint64_t v6 = [(HFHomeKitDispatcher *)self homePersonManagerDispatcher];
    uint64_t v7 = [v6 proxy];
    if (v3) {
      [v8 addObserver:v7];
    }
    else {
      [v8 removeObserver:v7];
    }
  }
}

- (HMHome)selectedHome
{
  return self->_selectedHome;
}

- (void)setHome:(id)a3
{
}

- (HMHome)overrideHome
{
  return self->_overrideHome;
}

- (void)fetchSettingsForLightProfiles:(id)a3
{
  id v4 = a3;
  id v5 = [(HFHomeKitDispatcher *)self home];

  if (v5)
  {
    if (+[HFUtilities isInternalTest])
    {
      [(HFHomeKitDispatcher *)self _fetchSettingsForLightProfiles:v4];
    }
    else
    {
      objc_initWeak(&location, self);
      uint64_t v6 = [MEMORY[0x263F42628] defaultScheduler];
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __53__HFHomeKitDispatcher_fetchSettingsForLightProfiles___block_invoke;
      v8[3] = &unk_26408DB10;
      objc_copyWeak(&v10, &location);
      id v9 = v4;
      id v7 = (id)[v6 performWithQualityOfService:17 block:v8];

      objc_destroyWeak(&v10);
      objc_destroyWeak(&location);
    }
  }
}

- (void)_initializeObservers
{
  [(HFHomeKitDispatcher *)self _setupHomeManagerObserver];
  [(HFHomeKitDispatcher *)self _setupHomeObserver];
  [(HFHomeKitDispatcher *)self _setupAccessoryObserver];
  [(HFHomeKitDispatcher *)self _setupResidentDeviceObserver];
  [(HFHomeKitDispatcher *)self _setupMediaObjectObserver];
  [(HFHomeKitDispatcher *)self _setupMediaSessionObserver];
  [(HFHomeKitDispatcher *)self _setupSofwareUpdateControllerObserver];
  [(HFHomeKitDispatcher *)self _setupSofwareUpdateControllerV2Observer];
  BOOL v3 = [[HFAccessoryDiagnosticInfoManager alloc] initWithDispatcher:self];
  diagnosticInfoManager = self->_diagnosticInfoManager;
  self->_diagnosticInfoManager = v3;

  id v5 = (void *)MEMORY[0x263F58178];
  uint64_t v6 = [(id)objc_opt_class() _defaultLogSettings];
  id v7 = [v5 dispatcherWithProtocol:&unk_26C117808 logSettings:v6];
  softwareUpdateObserverDispatcher = self->_softwareUpdateObserverDispatcher;
  self->_softwareUpdateObserverDispatcher = v7;

  if (!+[HFExecutionEnvironment isHomeWidgetRelatedProcess])
  {
    id v9 = [[HFSoftwareUpdateManager alloc] initWithDispatcher:self];
    softwareUpdateManager = self->_softwareUpdateManager;
    self->_softwareUpdateManager = v9;
  }
  uint64_t v11 = (void *)MEMORY[0x263F58178];
  uint64_t v12 = [(id)objc_opt_class() _defaultLogSettings];
  uint64_t v13 = [v11 dispatcherWithProtocol:&unk_26C1182B0 logSettings:v12];
  siriEndpointProfileObserverDispatcher = self->_siriEndpointProfileObserverDispatcher;
  self->_siriEndpointProfileObserverDispatcher = v13;

  [(HFHomeKitDispatcher *)self _setupSymptomFixSessionObserver];
  uint64_t v15 = (void *)MEMORY[0x263F58178];
  uint64_t v16 = [(id)objc_opt_class() _defaultLogSettings];
  int v17 = [v15 dispatcherWithProtocol:&unk_26C117028 logSettings:v16];
  audioControlObserverDispatcher = self->_audioControlObserverDispatcher;
  self->_audioControlObserverDispatcher = v17;

  uint64_t v19 = (void *)MEMORY[0x263F58178];
  uint64_t v20 = [(id)objc_opt_class() _defaultLogSettings];
  uint64_t v21 = [v19 dispatcherWithProtocol:&unk_26C116DC8 logSettings:v20];
  cameraObserverDispatcher = self->_cameraObserverDispatcher;
  self->_cameraObserverDispatcher = v21;

  uint64_t v23 = (void *)MEMORY[0x263F58178];
  uint64_t v24 = [(id)objc_opt_class() _defaultLogSettings];
  int v25 = [v23 dispatcherWithProtocol:&unk_26C117D48 logSettings:v24];
  userObserverDispatcher = self->_userObserverDispatcher;
  self->_userObserverDispatcher = v25;

  __int16 v27 = (void *)MEMORY[0x263F58178];
  uint64_t v28 = [(id)objc_opt_class() _defaultLogSettings];
  uint64_t v29 = [v27 dispatcherWithProtocol:&unk_26C117928 logSettings:v28];
  symptomsHandlerObserverDispatcher = self->_symptomsHandlerObserverDispatcher;
  self->_symptomsHandlerObserverDispatcher = v29;

  uint64_t v31 = (void *)MEMORY[0x263F58178];
  long long v32 = [(id)objc_opt_class() _defaultLogSettings];
  long long v33 = [v31 dispatcherWithProtocol:&unk_26C1077C8 logSettings:v32];
  homeKitSettingsObserverDispatcher = self->_homeKitSettingsObserverDispatcher;
  self->_homeKitSettingsObserverDispatcher = v33;

  long long v35 = (void *)MEMORY[0x263F58178];
  long long v36 = [(id)objc_opt_class() _defaultLogSettings];
  long long v37 = [v35 dispatcherWithProtocol:&unk_26C117350 logSettings:v36];
  networkConfigurationObserverDispatcher = self->_networkConfigurationObserverDispatcher;
  self->_networkConfigurationObserverDispatcher = v37;

  long long v39 = (void *)MEMORY[0x263F58178];
  long long v40 = [(id)objc_opt_class() _defaultLogSettings];
  long long v41 = [v39 dispatcherWithProtocol:&unk_26C117E38 logSettings:v40];
  televisionObserverDispatcher = self->_televisionObserverDispatcher;
  self->_televisionObserverDispatcher = v41;

  long long v43 = (void *)MEMORY[0x263F58178];
  long long v44 = [(id)objc_opt_class() _defaultLogSettings];
  long long v45 = [v43 dispatcherWithProtocol:&unk_26C118028 logSettings:v44];
  homePersonManagerDispatcher = self->_homePersonManagerDispatcher;
  self->_homePersonManagerDispatcher = v45;

  long long v47 = (void *)MEMORY[0x263F58178];
  id v48 = [(id)objc_opt_class() _defaultLogSettings];
  __int16 v49 = [v47 dispatcherWithProtocol:&unk_26C118550 logSettings:v48];
  lightObserverDispatcher = self->_lightObserverDispatcher;
  self->_lightObserverDispatcher = v49;

  uint64_t v51 = (void *)MEMORY[0x263F58178];
  uint64_t v52 = [(id)objc_opt_class() _defaultLogSettings];
  uint64_t v53 = [v51 dispatcherWithProtocol:&unk_26C1186E8 logSettings:v52];
  walletKeyDeviceStateObserverDispatcher = self->_walletKeyDeviceStateObserverDispatcher;
  self->_walletKeyDeviceStateObserverDispatcher = v53;

  uint64_t v55 = (void *)MEMORY[0x263F58178];
  v56 = [(id)objc_opt_class() _defaultLogSettings];
  v57 = [v55 dispatcherWithProtocol:&unk_26C118470 logSettings:v56];
  mediaDestinationControllerObserverDispatcher = self->_mediaDestinationControllerObserverDispatcher;
  self->_mediaDestinationControllerObserverDispatcher = v57;

  if (__automaticallySynchronizesHomeDataModel)
  {
    [(HFHomeKitDispatcher *)self reconnectDataModelDelegatesWithReason:@"HFHomeKitDispatcher._initializeObservers"];
  }
}

+ (id)_logSettingsWithFormatter:(id)a3
{
  BOOL v3 = (objc_class *)MEMORY[0x263F58180];
  id v4 = a3;
  id v5 = [v3 alloc];
  uint64_t v6 = HFLogForCategory(0x25uLL);
  id v7 = (void *)[v5 initWithLog:v6 logType:0 argumentFormatter:v4];

  return v7;
}

+ (id)_defaultLogSettings
{
  return (id)[a1 _logSettingsWithFormatter:&__block_literal_global_215_0];
}

- (void)addDiagnosticInfoObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(HFHomeKitDispatcher *)self diagnosticInfoManager];
  [v5 addObserver:v4];
}

- (HFAccessoryDiagnosticInfoManager)diagnosticInfoManager
{
  return self->_diagnosticInfoManager;
}

- (void)_setupSymptomFixSessionObserver
{
  BOOL v3 = (void *)MEMORY[0x263F58178];
  id v4 = [(id)objc_opt_class() _defaultLogSettings];
  id v5 = [v3 dispatcherWithProtocol:&unk_26C118338 logSettings:v4];
  symptomFixSessionObserverDispatcher = self->_symptomFixSessionObserverDispatcher;
  self->_symptomFixSessionObserverDispatcher = v5;

  id v7 = self->_symptomFixSessionObserverDispatcher;
  id v8 = [(id)objc_opt_class() _logSettingsWithFormatter:&__block_literal_global_563];
  [(NADelegateDispatcher *)v7 registerCustomLogSettings:v8 forSelector:sel_fixSession_didChangeState_ argumentIndex:1];
}

- (void)_setupSofwareUpdateControllerV2Observer
{
  BOOL v3 = (void *)MEMORY[0x263F58178];
  id v4 = [(id)objc_opt_class() _defaultLogSettings];
  id v5 = [v3 dispatcherWithProtocol:&unk_26C13C470 logSettings:v4];
  softwareUpdateControllerV2ObserverDispatcher = self->_softwareUpdateControllerV2ObserverDispatcher;
  self->_softwareUpdateControllerV2ObserverDispatcher = v5;

  id v10 = [(HFHomeKitDispatcher *)self softwareUpdateControllerV2ObserverDispatcher];
  id v7 = [v10 proxy];
  id v8 = [(HFHomeKitDispatcher *)self home];
  id v9 = [v8 softwareUpdateController];
  [v9 setDelegate:v7];
}

- (void)addSoftwareUpdateControllerV2Observer:(id)a3
{
  id v4 = a3;
  id v5 = [(HFHomeKitDispatcher *)self softwareUpdateControllerV2ObserverDispatcher];
  [v5 addObserver:v4];
}

- (NADelegateDispatcher)softwareUpdateControllerV2ObserverDispatcher
{
  return self->_softwareUpdateControllerV2ObserverDispatcher;
}

- (void)_setupSofwareUpdateControllerObserver
{
  BOOL v3 = (void *)MEMORY[0x263F58178];
  id v4 = [(id)objc_opt_class() _defaultLogSettings];
  id v5 = [v3 dispatcherWithProtocol:&unk_26C117448 logSettings:v4];
  softwareUpdateControllerObserverDispatcher = self->_softwareUpdateControllerObserverDispatcher;
  self->_softwareUpdateControllerObserverDispatcher = v5;

  objc_initWeak(&location, self);
  id v7 = self->_softwareUpdateControllerObserverDispatcher;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __60__HFHomeKitDispatcher__setupSofwareUpdateControllerObserver__block_invoke;
  v8[3] = &unk_26409C228;
  objc_copyWeak(&v9, &location);
  [(NADelegateDispatcher *)v7 registerCustomHandlerForSelector:sel_softwareUpdateController_didUpdateAvailableUpdate_ handler:v8];
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)_setupResidentDeviceObserver
{
  BOOL v3 = (void *)MEMORY[0x263F58178];
  id v4 = [(id)objc_opt_class() _defaultLogSettings];
  id v5 = [v3 dispatcherWithProtocol:&unk_26C1168A8 logSettings:v4];
  residentDeviceObserverDispatcher = self->_residentDeviceObserverDispatcher;
  self->_residentDeviceObserverDispatcher = v5;

  objc_initWeak(&location, self);
  id v7 = self->_residentDeviceObserverDispatcher;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __51__HFHomeKitDispatcher__setupResidentDeviceObserver__block_invoke;
  v15[3] = &unk_26409C228;
  objc_copyWeak(&v16, &location);
  [(NADelegateDispatcher *)v7 registerCustomHandlerForSelector:sel_residentDevice_didUpdateEnabled_ handler:v15];
  id v8 = self->_residentDeviceObserverDispatcher;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __51__HFHomeKitDispatcher__setupResidentDeviceObserver__block_invoke_2;
  v13[3] = &unk_26409C228;
  objc_copyWeak(&v14, &location);
  [(NADelegateDispatcher *)v8 registerCustomHandlerForSelector:sel_residentDevice_didUpdateStatus_ handler:v13];
  id v9 = self->_residentDeviceObserverDispatcher;
  id v10 = [(id)objc_opt_class() _logSettingsWithFormatter:&__block_literal_global_510];
  [(NADelegateDispatcher *)v9 registerCustomLogSettings:v10 forSelector:sel_residentDevice_didUpdateCapabilities_ argumentIndex:1];

  uint64_t v11 = self->_residentDeviceObserverDispatcher;
  uint64_t v12 = [(id)objc_opt_class() _logSettingsWithFormatter:&__block_literal_global_513];
  [(NADelegateDispatcher *)v11 registerCustomLogSettings:v12 forSelector:sel_residentDevice_didUpdateStatus_ argumentIndex:1];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (void)_setupMediaSessionObserver
{
  BOOL v3 = (void *)MEMORY[0x263F58178];
  id v4 = [(id)objc_opt_class() _defaultLogSettings];
  id v5 = [v3 dispatcherWithProtocol:&unk_26C116F28 logSettings:v4];
  mediaSessionObserverDispatcher = self->_mediaSessionObserverDispatcher;
  self->_mediaSessionObserverDispatcher = v5;

  id v7 = [(id)objc_opt_class() _logSettingsWithFormatter:&__block_literal_global_542];
  [(NADelegateDispatcher *)self->_mediaSessionObserverDispatcher registerCustomLogSettings:v7 forSelector:sel_mediaSession_willUpdatePlaybackState_ argumentIndex:1];
  [(NADelegateDispatcher *)self->_mediaSessionObserverDispatcher registerCustomLogSettings:v7 forSelector:sel_mediaSession_didUpdatePlaybackState_ argumentIndex:1];
}

- (void)_setupMediaObjectObserver
{
  BOOL v3 = (void *)MEMORY[0x263F58178];
  id v4 = [(id)objc_opt_class() _defaultLogSettings];
  id v5 = [v3 dispatcherWithProtocol:&unk_26C107B28 logSettings:v4];
  mediaObjectObserverDispatcher = self->_mediaObjectObserverDispatcher;
  self->_mediaObjectObserverDispatcher = v5;

  objc_initWeak(&location, self);
  id v7 = self->_mediaObjectObserverDispatcher;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __48__HFHomeKitDispatcher__setupMediaObjectObserver__block_invoke;
  v11[3] = &unk_26409C228;
  objc_copyWeak(&v12, &location);
  [(NADelegateDispatcher *)v7 registerCustomHandlerForSelector:sel_mediaObject_didUpdateSettings_ handler:v11];
  id v8 = self->_mediaObjectObserverDispatcher;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __48__HFHomeKitDispatcher__setupMediaObjectObserver__block_invoke_2;
  v9[3] = &unk_26409C228;
  objc_copyWeak(&v10, &location);
  [(NADelegateDispatcher *)v8 registerCustomHandlerForSelector:sel_mediaObject_didUpdateMediaSession_ handler:v9];
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)_setupHomeObserver
{
  BOOL v3 = (void *)MEMORY[0x263F58178];
  id v4 = [(id)objc_opt_class() _defaultLogSettings];
  id v5 = [v3 dispatcherWithProtocol:&unk_26C103D30 logSettings:v4];
  homeObserverDispatcher = self->_homeObserverDispatcher;
  self->_homeObserverDispatcher = v5;

  objc_initWeak(&location, self);
  id v7 = self->_homeObserverDispatcher;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __41__HFHomeKitDispatcher__setupHomeObserver__block_invoke;
  v20[3] = &unk_26409C228;
  objc_copyWeak(&v21, &location);
  [(NADelegateDispatcher *)v7 registerCustomHandlerForSelector:sel_home_didAddAccessory_ handler:v20];
  id v8 = self->_homeObserverDispatcher;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __41__HFHomeKitDispatcher__setupHomeObserver__block_invoke_2;
  v18[3] = &unk_26409C228;
  objc_copyWeak(&v19, &location);
  [(NADelegateDispatcher *)v8 registerCustomHandlerForSelector:sel_home_didAddResidentDevice_ handler:v18];
  id v9 = self->_homeObserverDispatcher;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __41__HFHomeKitDispatcher__setupHomeObserver__block_invoke_3;
  v16[3] = &unk_26409C228;
  objc_copyWeak(&v17, &location);
  [(NADelegateDispatcher *)v9 registerCustomHandlerForSelector:sel_home_didRemoveResidentDevice_ handler:v16];
  id v10 = self->_homeObserverDispatcher;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __41__HFHomeKitDispatcher__setupHomeObserver__block_invoke_4;
  v14[3] = &unk_26409C228;
  objc_copyWeak(&v15, &location);
  [(NADelegateDispatcher *)v10 registerCustomHandlerForSelector:sel_home_didAddMediaSystem_ handler:v14];
  uint64_t v11 = self->_homeObserverDispatcher;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __41__HFHomeKitDispatcher__setupHomeObserver__block_invoke_5;
  v12[3] = &unk_26409C228;
  objc_copyWeak(&v13, &location);
  [(NADelegateDispatcher *)v11 registerCustomHandlerForSelector:sel_home_didUpdatePersonManagerSettings_ handler:v12];
  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

- (void)_setupHomeManagerObserver
{
  objc_initWeak(&location, self);
  id v4 = (void *)MEMORY[0x263F58178];
  id v5 = [(id)objc_opt_class() _defaultLogSettings];
  uint64_t v6 = [v4 dispatcherWithProtocol:&unk_26C109868 logSettings:v5];
  homeManagerObserverDispatcher = self->_homeManagerObserverDispatcher;
  self->_homeManagerObserverDispatcher = v6;

  id v8 = self->_homeManagerObserverDispatcher;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __48__HFHomeKitDispatcher__setupHomeManagerObserver__block_invoke;
  v18[3] = &unk_26409C228;
  objc_copyWeak(&v19, &location);
  [(NADelegateDispatcher *)v8 registerCustomHandlerForSelector:sel_homeManagerDidUpdateHomes_ handler:v18];
  id v9 = self->_homeManagerObserverDispatcher;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __48__HFHomeKitDispatcher__setupHomeManagerObserver__block_invoke_2;
  v16[3] = &unk_26409C228;
  objc_copyWeak(&v17, &location);
  [(NADelegateDispatcher *)v9 registerCustomHandlerForSelector:sel_homeManagerDidUpdatePrimaryHome_ handler:v16];
  id v10 = self->_homeManagerObserverDispatcher;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __48__HFHomeKitDispatcher__setupHomeManagerObserver__block_invoke_2_276;
  v14[3] = &unk_26409C228;
  objc_copyWeak(&v15, &location);
  [(NADelegateDispatcher *)v10 registerCustomHandlerForSelector:sel_homeManager_didAddHome_ handler:v14];
  uint64_t v11 = self->_homeManagerObserverDispatcher;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __48__HFHomeKitDispatcher__setupHomeManagerObserver__block_invoke_3;
  v12[3] = &unk_26409C2A0;
  objc_copyWeak(v13, &location);
  v13[1] = (id)a2;
  [(NADelegateDispatcher *)v11 registerCustomHandlerForSelector:sel_homeManager_didRemoveHome_ handler:v12];
  objc_destroyWeak(v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

- (void)_setupAccessoryObserver
{
  BOOL v3 = (void *)MEMORY[0x263F58178];
  id v4 = [(id)objc_opt_class() _volatileLogSettings];
  id v5 = [v3 dispatcherWithProtocol:&unk_26C116720 logSettings:v4];
  accessoryObserverDispatcher = self->_accessoryObserverDispatcher;
  self->_accessoryObserverDispatcher = v5;

  objc_initWeak(&location, self);
  id v7 = self->_accessoryObserverDispatcher;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __46__HFHomeKitDispatcher__setupAccessoryObserver__block_invoke;
  v14[3] = &unk_26409C228;
  objc_copyWeak(&v15, &location);
  [(NADelegateDispatcher *)v7 registerCustomHandlerForSelector:sel_accessoryDidUpdateServices_ handler:v14];
  id v8 = self->_accessoryObserverDispatcher;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __46__HFHomeKitDispatcher__setupAccessoryObserver__block_invoke_2;
  v12[3] = &unk_26409C228;
  objc_copyWeak(&v13, &location);
  [(NADelegateDispatcher *)v8 registerCustomHandlerForSelector:sel_accessory_didAddProfile_ handler:v12];
  id v9 = self->_accessoryObserverDispatcher;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __46__HFHomeKitDispatcher__setupAccessoryObserver__block_invoke_3;
  v10[3] = &unk_26409C228;
  objc_copyWeak(&v11, &location);
  [(NADelegateDispatcher *)v9 registerCustomHandlerForSelector:sel_accessoryDidUpdateAudioDestinationController_ handler:v10];
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (void)_finishFirstHomeAddedPromises:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = [(HFHomeKitDispatcher *)self home];

  if (!v6)
  {
    id v15 = [MEMORY[0x263F08690] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"HFHomeKitDispatcher.m", 1648, @"Invalid parameter not satisfying: %@", @"self.home != nil" object file lineNumber description];
  }
  if ([v5 count])
  {
    id v7 = HFLogForCategory(0x25uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id buf = 0;
      _os_log_impl(&dword_20B986000, v7, OS_LOG_TYPE_DEFAULT, "Finishing firstHomeAddedPromises now that we have a home", buf, 2u);
    }
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v16 + 1) + 8 * v12);
        id v14 = [(HFHomeKitDispatcher *)self home];
        [v13 finishWithResult:v14];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v21 count:16];
    }
    while (v10);
  }
}

+ (id)_volatileLogSettings
{
  return (id)[a1 _logSettingsWithFormatter:&__block_literal_global_219_1];
}

void __44__HFHomeKitDispatcher__requestSelectedHome___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) uniqueIdentifier];
  v1 = +[HFStateRestorationSettings sharedInstance];
  [v1 setSelectedHomeIdentifier:v2];
}

- (void)coordinator:(id)a3 locationSensingAvailabilityDidChange:(BOOL)a4
{
  BOOL v4 = a4;
  id v8 = [(HFHomeKitDispatcher *)self homeManagerObserverDispatcher];
  uint64_t v6 = [v8 proxy];
  id v7 = [(HFHomeKitDispatcher *)self homeManager];
  [v6 homeManager:v7 didUpdateLocationSensingAvailability:v4];
}

id __46__HFHomeKitDispatcher_homeSensingActiveFuture__block_invoke_2(id *a1, void *a2)
{
  BOOL v3 = (void *)MEMORY[0x263F58190];
  BOOL v4 = NSNumber;
  int v5 = [a2 BOOLValue];
  if (v5)
  {
    a1 = [a1[4] locationCoordinator];
    uint64_t v6 = [a1 homeSensingEnabled];
  }
  else
  {
    uint64_t v6 = 0;
  }
  id v7 = [v4 numberWithInt:v6];
  id v8 = [v3 futureWithResult:v7];

  if (v5) {
  return v8;
  }
}

void __55__HFHomeKitDispatcher__setupLocationSensingCoordinator__block_invoke(uint64_t a1)
{
  if (+[HFExecutionEnvironment isHomeApp]
    || +[HFExecutionEnvironment isHomeControlService]
    || +[HFExecutionEnvironment isSpringBoard]
    || +[HFExecutionEnvironment isWatchApp]
    || +[HFExecutionEnvironment isCarousel]
    || +[HFExecutionEnvironment isHomeWidgetIntents])
  {
    id v3 = [*(id *)(a1 + 32) homeManager];
    id v2 = [v3 currentAccessory];
    byte_26AB2FE7B = v2 == 0;
  }
  else
  {
    byte_26AB2FE7B = 0;
  }
}

- (NAFuture)allHomesFuture
{
  v10[1] = *MEMORY[0x263EF8340];
  if ([(HFHomeKitDispatcher *)self willAcceptHomeFutures])
  {
    BOOL v3 = [(HFHomeKitDispatcher *)self hasLoadedHomes];
    id v4 = objc_alloc_init(MEMORY[0x263F581A8]);
    int v5 = v4;
    if (v3)
    {
      v10[0] = v4;
      uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];
      [(HFHomeKitDispatcher *)self _finishAllHomesPromises:v6];
    }
    else
    {
      id v8 = [(HFHomeKitDispatcher *)self allHomesPromises];
      [v8 addObject:v5];
    }
    id v7 = [v5 future];
  }
  else
  {
    id v7 = 0;
  }
  return (NAFuture *)v7;
}

- (NAFuture)homeFuture
{
  v9[1] = *MEMORY[0x263EF8340];
  if ([(HFHomeKitDispatcher *)self willAcceptHomeFutures])
  {
    if ([(HFHomeKitDispatcher *)self hasLoadedHomes]
      || ([(HFHomeKitDispatcher *)self home],
          BOOL v3 = objc_claimAutoreleasedReturnValue(),
          v3,
          v3))
    {
      id v4 = objc_alloc_init(MEMORY[0x263F581A8]);
      v9[0] = v4;
      int v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];
      [(HFHomeKitDispatcher *)self _finishHomePromises:v5];
    }
    else
    {
      id v4 = objc_alloc_init(MEMORY[0x263F581A8]);
      id v8 = [(HFHomeKitDispatcher *)self homePromises];
      [v8 addObject:v4];
    }
    uint64_t v6 = [v4 future];
  }
  else
  {
    uint64_t v6 = 0;
  }
  return (NAFuture *)v6;
}

- (BOOL)hasLoadedHomes
{
  return self->_hasLoadedHomes;
}

- (BOOL)willAcceptHomeFutures
{
  return self->_willAcceptHomeFutures;
}

- (void)_finishHomePromises:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * v8);
        uint64_t v10 = [(HFHomeKitDispatcher *)self home];

        if (v10)
        {
          uint64_t v11 = [(HFHomeKitDispatcher *)self home];
          [v9 finishWithResult:v11];
        }
        else
        {
          uint64_t v11 = objc_msgSend(MEMORY[0x263F087E8], "hf_errorWithCode:", 30);
          [v9 finishWithError:v11];
        }

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
}

- (void)_finishAllHomesPromises:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v15 + 1) + 8 * v8);
        uint64_t v10 = [(HFHomeKitDispatcher *)self homeManager];
        uint64_t v11 = [v10 homes];

        if (v11)
        {
          long long v12 = [(HFHomeKitDispatcher *)self homeManager];
          long long v13 = [v12 homes];
          long long v14 = [v13 sortedArrayUsingComparator:&__block_literal_global_610];
          [v9 finishWithResult:v14];
        }
        else
        {
          long long v12 = objc_msgSend(MEMORY[0x263F087E8], "hf_errorWithCode:", 30);
          [v9 finishWithError:v12];
        }

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }
}

- (void)updateSelectedHome
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  BOOL v3 = [(HFHomeKitDispatcher *)self homeManager];
  id v4 = [v3 currentAccessory];
  uint64_t v5 = [v4 home];

  if (v5)
  {
    uint64_t v6 = HFLogForCategory(0x25uLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = [(HFHomeKitDispatcher *)self homeManager];
      uint64_t v8 = [v7 currentAccessory];
      uint64_t v9 = [(HFHomeKitDispatcher *)self homeManager];
      uint64_t v10 = [v9 currentAccessory];
      uint64_t v11 = [v10 home];
      *(_DWORD *)id buf = 138413058;
      long long v34 = self;
      __int16 v35 = 2080;
      long long v36 = "-[HFHomeKitDispatcher updateSelectedHome]";
      __int16 v37 = 2112;
      long long v38 = v8;
      __int16 v39 = 2112;
      long long v40 = v11;
      _os_log_impl(&dword_20B986000, v6, OS_LOG_TYPE_DEFAULT, "(%@:%s) selected home is currentAccessory %@ home %@", buf, 0x2Au);
    }
    long long v12 = [(HFHomeKitDispatcher *)self homeManager];
    long long v13 = [v12 currentAccessory];
    long long v14 = [v13 home];
    long long v15 = [v14 uniqueIdentifier];

LABEL_5:
    goto LABEL_6;
  }
  if ([(HFHomeKitDispatcher *)self selectedHomeFollowsLocation])
  {
    if (([(id)objc_opt_class() allowHomeSensingOverride] & 1) == 0)
    {
      uint64_t v23 = [(HFHomeKitDispatcher *)self homeManager];
      uint64_t v24 = [v23 currentHome];

      if (v24)
      {
        int v25 = HFLogForCategory(0x25uLL);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          id v26 = [(HFHomeKitDispatcher *)self homeManager];
          __int16 v27 = [v26 currentHome];
          *(_DWORD *)id buf = 138412802;
          long long v34 = self;
          __int16 v35 = 2080;
          long long v36 = "-[HFHomeKitDispatcher updateSelectedHome]";
          __int16 v37 = 2112;
          long long v38 = v27;
          _os_log_impl(&dword_20B986000, v25, OS_LOG_TYPE_DEFAULT, "(%@:%s) selected home is current home %@", buf, 0x20u);
        }
        long long v12 = [(HFHomeKitDispatcher *)self homeManager];
        long long v13 = [v12 currentHome];
        long long v15 = [v13 uniqueIdentifier];
        goto LABEL_5;
      }
    }
  }
  uint64_t v29 = +[HFStateRestorationSettings sharedInstance];
  long long v15 = [v29 selectedHomeIdentifier];

  long long v12 = HFLogForCategory(0x25uLL);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id buf = 138412802;
    long long v34 = self;
    __int16 v35 = 2080;
    long long v36 = "-[HFHomeKitDispatcher updateSelectedHome]";
    __int16 v37 = 2112;
    long long v38 = v15;
    _os_log_impl(&dword_20B986000, v12, OS_LOG_TYPE_DEFAULT, "(%@:%s) selected home is synced identifier %@", buf, 0x20u);
  }
LABEL_6:

  if (v15)
  {
    long long v16 = [(HFHomeKitDispatcher *)self homeManager];
    long long v17 = [v16 homes];
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __41__HFHomeKitDispatcher_updateSelectedHome__block_invoke;
    v31[3] = &unk_26408FFE0;
    long long v18 = v15;
    p_super = &v18->super;
    objc_msgSend(v17, "na_firstObjectPassingTest:", v31);
    long long v19 = (HFHomeKitDispatcher *)objc_claimAutoreleasedReturnValue();

    uint64_t v20 = HFLogForCategory(0x25uLL);
    id v21 = v20;
    if (v19)
    {
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)id buf = 138412290;
        long long v34 = v19;
        _os_log_impl(&dword_20B986000, v21, OS_LOG_TYPE_DEFAULT, "Loaded synced selected home %@", buf, 0xCu);
      }

      uint64_t v22 = p_super;
      goto LABEL_26;
    }
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id buf = 138412290;
      long long v34 = v18;
      _os_log_error_impl(&dword_20B986000, v21, OS_LOG_TYPE_ERROR, "Unable to find synced selected home matching identifier %@", buf, 0xCu);
    }

    uint64_t v28 = p_super;
  }
  else
  {
    uint64_t v28 = HFLogForCategory(0x25uLL);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id buf = 0;
      _os_log_impl(&dword_20B986000, v28, OS_LOG_TYPE_DEFAULT, "No synced selected home found", buf, 2u);
    }
  }

  long long v19 = [(HFHomeKitDispatcher *)self _primaryHome];
  if (!v19)
  {
    uint64_t v22 = [(HFHomeKitDispatcher *)self homeManager];
    uint64_t v30 = [v22 homes];
    long long v19 = [v30 firstObject];

LABEL_26:
  }
  [(HFHomeKitDispatcher *)self _requestSelectedHome:v19];
}

- (HMHomeManager)homeManager
{
  return self->_homeManager;
}

- (BOOL)selectedHomeFollowsLocation
{
  id v2 = [(HFHomeKitDispatcher *)self locationCoordinator];
  char v3 = [v2 homeSensingEnabled];

  return v3;
}

- (void)_requestSelectedHome:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = (HMHome *)a3;
  uint64_t v5 = [(HFHomeKitDispatcher *)self homeManager];
  uint64_t v6 = [v5 currentAccessory];

  uint64_t v7 = v4;
  if (v6)
  {
    uint64_t v8 = [(HFHomeKitDispatcher *)self homeManager];
    uint64_t v9 = [v8 currentAccessory];
    uint64_t v10 = [v9 home];

    if (v10 != v4)
    {
      uint64_t v11 = HFLogForCategory(0x25uLL);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)id buf = 138412290;
        uint64_t v28 = v4;
        _os_log_error_impl(&dword_20B986000, v11, OS_LOG_TYPE_ERROR, "Current accessory set, Ignoring requested home - %@", buf, 0xCu);
      }
    }
    long long v12 = [(HFHomeKitDispatcher *)self homeManager];
    long long v13 = [v12 currentAccessory];
    uint64_t v7 = [v13 home];

    long long v14 = HFLogForCategory(0x25uLL);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)id buf = 138412290;
      uint64_t v28 = v7;
      _os_log_impl(&dword_20B986000, v14, OS_LOG_TYPE_DEFAULT, "Selected home defaulting to currentAccessory Home - %@", buf, 0xCu);
    }
  }
  if (!v7)
  {
    uint64_t v7 = [(HFHomeKitDispatcher *)self _primaryHome];
    long long v15 = HFLogForCategory(0x25uLL);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)id buf = 138412290;
      uint64_t v28 = v7;
      _os_log_impl(&dword_20B986000, v15, OS_LOG_TYPE_DEFAULT, "Selected home not specified - using primary home %@", buf, 0xCu);
    }

    if (!v7)
    {
      long long v16 = [(HFHomeKitDispatcher *)self homeManager];
      long long v17 = [v16 homes];
      uint64_t v7 = [v17 firstObject];

      long long v18 = HFLogForCategory(0x25uLL);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)id buf = 138412290;
        uint64_t v28 = v7;
        _os_log_impl(&dword_20B986000, v18, OS_LOG_TYPE_DEFAULT, "Primary home not specified - using first home %@", buf, 0xCu);
      }
    }
  }
  if (v7 != self->_selectedHome)
  {
    long long v19 = [(HMHome *)v7 uniqueIdentifier];
    uint64_t v20 = [(HMHome *)self->_selectedHome uniqueIdentifier];
    char v21 = [v19 isEqual:v20];

    if ((v21 & 1) == 0)
    {
      uint64_t v22 = HFLogForCategory(0x25uLL);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)id buf = 138412290;
        uint64_t v28 = v7;
        _os_log_impl(&dword_20B986000, v22, OS_LOG_TYPE_DEFAULT, "Selected home is now %@", buf, 0xCu);
      }

      objc_storeStrong((id *)&self->_selectedHome, v7);
      if ([(HFHomeKitDispatcher *)self _shouldPersistSelectedHomeToDefaults]
        && !+[HFUtilities isInternalTest])
      {
        uint64_t v23 = HFLogForCategory(0x25uLL);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)id buf = 0;
          _os_log_impl(&dword_20B986000, v23, OS_LOG_TYPE_DEFAULT, "Notifying local clients of selected home change and saving to preferences", buf, 2u);
        }

        uint64_t v24 = dispatch_get_global_queue(-32768, 0);
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __44__HFHomeKitDispatcher__requestSelectedHome___block_invoke;
        block[3] = &unk_26408DDE0;
        id v26 = v7;
        dispatch_async(v24, block);
      }
      [(HFHomeKitDispatcher *)self updateHome];
    }
  }
}

- (NAFuture)locationSensingAvailableFuture
{
  char v3 = [(HFHomeKitDispatcher *)self locationCoordinator];

  if (v3)
  {
    id v4 = [(HFHomeKitDispatcher *)self locationCoordinator];
    uint64_t v5 = [v4 locationSensingAvailableFuture];
  }
  else
  {
    uint64_t v5 = [MEMORY[0x263F58190] futureWithResult:MEMORY[0x263EFFA80]];
  }
  return (NAFuture *)v5;
}

- (HFLocationSensingCoordinator)locationCoordinator
{
  return self->_locationCoordinator;
}

- (BOOL)_shouldPersistSelectedHomeToDefaults
{
  id v2 = [(HFHomeKitDispatcher *)self homeManager];
  char v3 = [v2 currentAccessory];
  id v4 = [v3 home];

  if (v4) {
    return 0;
  }
  uint64_t v6 = objc_opt_class();
  return [v6 allowHomeSensingOverride];
}

+ (BOOL)allowHomeSensingOverride
{
  return byte_26AB2FE79;
}

void __54__HFHomeKitDispatcher__fetchSettingsForLightProfiles___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = HFLogForCategory(0x25uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id buf = 138412290;
      id v25 = v6;
      _os_log_error_impl(&dword_20B986000, v7, OS_LOG_TYPE_ERROR, "Received error trying to fetch settings for light profiles. %@", buf, 0xCu);
    }
  }
  long long v18 = v6;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        long long v14 = [v8 objectForKey:v13];
        long long v15 = *(void **)(a1 + 32);
        long long v16 = [v14 settings];
        long long v17 = [v14 error];
        [v15 dispatchLightProfileUpdate:v13 settings:v16 error:v17];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v10);
  }
}

- (void)dispatchLightProfileUpdate:(id)a3 settings:(id)a4 error:(id)a5
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v9)
  {
    uint64_t v11 = HFLogForCategory(0x25uLL);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id buf = 138412546;
      id v16 = v8;
      __int16 v17 = 2112;
      id v18 = v10;
      _os_log_error_impl(&dword_20B986000, v11, OS_LOG_TYPE_ERROR, "Received error trying to fetch light profile settings. Profile: %@ %@", buf, 0x16u);
    }
    goto LABEL_6;
  }
  if ([v9 supportedFeatures])
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __65__HFHomeKitDispatcher_dispatchLightProfileUpdate_settings_error___block_invoke;
    v12[3] = &unk_26409C3D0;
    uint64_t v13 = v8;
    id v14 = v9;
    [(HFHomeKitDispatcher *)self dispatchLightObserverMessage:v12 sender:0];

    uint64_t v11 = v13;
LABEL_6:
  }
}

void __53__HFHomeKitDispatcher_fetchSettingsForLightProfiles___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _fetchSettingsForLightProfiles:*(void *)(a1 + 32)];
}

- (void)_fetchSettingsForLightProfiles:(id)a3
{
  id v4 = a3;
  id v5 = [(HFHomeKitDispatcher *)self home];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __54__HFHomeKitDispatcher__fetchSettingsForLightProfiles___block_invoke;
  v6[3] = &unk_26409C3A8;
  void v6[4] = self;
  [v5 fetchSettingsForLightProfiles:v4 withCompletion:v6];
}

void __27__HFHomeKitDispatcher_init__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v11 + 1) + 8 * v7);
        id v9 = [*(id *)(a1 + 32) homeObserverDispatcher];
        id v10 = [v9 proxy];
        [v8 setDelegate:v10];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
}

+ (void)setSynchronizesHomeDataModel:(BOOL)a3
{
  _MergedGlobals_325 = a3;
}

+ (void)setOverrideSynchronizesHomeDataModel:(BOOL)a3
{
  byte_26AB2FE7A = a3;
}

+ (void)setAutomaticallySynchronizesHomeDataModel:(BOOL)a3
{
  __automaticallySynchronizesHomeDataModel = a3;
}

+ (HMHomeManagerConfiguration)configuration
{
  return (HMHomeManagerConfiguration *)(id)qword_26AB2FE80;
}

+ (void)setConfiguration:(id)a3
{
  if (a3)
  {
    uint64_t v3 = [a3 copy];
  }
  else
  {
    uint64_t v3 = [MEMORY[0x263F0E3C8] defaultPrivateConfiguration];
  }
  uint64_t v4 = qword_26AB2FE80;
  qword_26AB2FE80 = v3;
  MEMORY[0x270F9A758](v3, v4);
}

+ (void)setAllowHomeSensingOverride:(BOOL)a3
{
  byte_26AB2FE79 = a3;
}

void __27__HFHomeKitDispatcher_init__block_invoke_2(uint64_t a1)
{
  id v2 = HFLogForCategory(0x25uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_20B986000, v2, OS_LOG_TYPE_DEFAULT, "Received HMHomeManagerPreferencesChangedNotification", v4, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _createHomeManagerIfNecessary];
}

- (void)disconnectDataModelDelegatesWithReason:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = HFLogForCategory(0x25uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412290;
    id v17 = v4;
    _os_log_impl(&dword_20B986000, v5, OS_LOG_TYPE_DEFAULT, "Disabling data model delegates with reason: %@", (uint8_t *)&v16, 0xCu);
  }

  uint64_t v6 = [MEMORY[0x263F49240] shared];
  [(HFHomeKitDispatcher *)self removeHomeManagerObserver:v6];

  uint64_t v7 = [MEMORY[0x263F49240] shared];
  [(HFHomeKitDispatcher *)self removeHomeObserver:v7];

  id v8 = [MEMORY[0x263F49240] shared];
  [(HFHomeKitDispatcher *)self removeAccessoryObserver:v8];

  id v9 = [MEMORY[0x263F49240] shared];
  [(HFHomeKitDispatcher *)self removeMediaSessionObserver:v9];

  id v10 = [MEMORY[0x263F49240] shared];
  [(HFHomeKitDispatcher *)self removeMediaObjectObserver:v10];

  long long v11 = [MEMORY[0x263F49240] shared];
  [(HFHomeKitDispatcher *)self removeResidentDeviceObserver:v11];

  long long v12 = [MEMORY[0x263F49240] shared];
  [(HFHomeKitDispatcher *)self removeLightObserver:v12];

  long long v13 = [MEMORY[0x263F49240] shared];
  [(HFHomeKitDispatcher *)self removeSoftwareUpdateObserver:v13];

  long long v14 = [MEMORY[0x263F49240] shared];
  [(HFHomeKitDispatcher *)self removeSoftwareUpdateControllerV2Observer:v14];

  long long v15 = [MEMORY[0x263F49240] shared];
  [(HFHomeKitDispatcher *)self removeSymptomsHandlerObserver:v15];
}

- (void)dealloc
{
  notify_cancel([(HFHomeKitDispatcher *)self homeKitPreferencesChangedNotifyToken]);
  v3.receiver = self;
  v3.super_class = (Class)HFHomeKitDispatcher;
  [(HFHomeKitDispatcher *)&v3 dealloc];
}

id __43__HFHomeKitDispatcher__volatileLogSettings__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (objc_opt_respondsToSelector())
  {
    objc_super v3 = +[HFStateDumpBuilderContext contextWithDetailLevel:0];
    [v3 setIncludeVolatileObjects:1];
    id v4 = objc_msgSend(v2, "hf_stateDumpBuilderWithContext:", v3);
    uint64_t v5 = [v4 buildDescription];
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      objc_msgSend(v2, "hf_prettyDescription");
    }
    else {
    uint64_t v5 = [v2 description];
    }
  }

  return v5;
}

void __48__HFHomeKitDispatcher__setupHomeManagerObserver__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v8 = [MEMORY[0x263F58190] futureWithNoResult];
  id v9 = [v6 objectAtIndexedSubscript:0];

  id v10 = [v9 homes];
  uint64_t v11 = [v10 count];

  if (!v11)
  {
    long long v12 = HFLogForCategory(0x25uLL);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id buf = 0;
      _os_log_impl(&dword_20B986000, v12, OS_LOG_TYPE_DEFAULT, "homeManagerDidUpdatePrimaryHome: No home left. Reset hasSeenWelcomeView flag.", buf, 2u);
    }

    uint64_t v13 = objc_msgSend(v9, "hf_setHasSeenOnboardingWelcomeView:", 0);

    id v8 = (void *)v13;
  }
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __48__HFHomeKitDispatcher__setupHomeManagerObserver__block_invoke_273;
  v16[3] = &unk_26409C250;
  void v16[4] = WeakRetained;
  id v17 = v5;
  id v14 = v5;
  id v15 = (id)[v8 addCompletionBlock:v16];
}

uint64_t __48__HFHomeKitDispatcher__setupHomeManagerObserver__block_invoke_273(uint64_t a1)
{
  [*(id *)(a1 + 32) updateSelectedHome];
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

void __48__HFHomeKitDispatcher__setupHomeManagerObserver__block_invoke_2_276(uint64_t a1, void *a2, void *a3)
{
  id v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  uint64_t v7 = [v6 objectAtIndexedSubscript:1];

  id v8 = [WeakRetained homeObserverDispatcher];
  id v9 = [v8 proxy];
  [v7 setDelegate:v9];

  [WeakRetained _updateRemoteAccessStateForHome:v7 notifyingObservers:0];
  v5[2](v5);
}

void __48__HFHomeKitDispatcher__setupHomeManagerObserver__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v8 = [v6 objectAtIndexedSubscript:1];
  id v9 = [MEMORY[0x263F58190] futureWithNoResult];
  id v10 = [v6 objectAtIndexedSubscript:0];

  uint64_t v11 = [v10 homes];
  uint64_t v12 = [v11 count];

  if (!v12)
  {
    uint64_t v13 = HFLogForCategory(0x25uLL);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id buf = 0;
      _os_log_impl(&dword_20B986000, v13, OS_LOG_TYPE_DEFAULT, "homeManager:didRemoveHome: No home left. Reset hasSeenWelcomeView flag.", buf, 2u);
    }

    uint64_t v14 = objc_msgSend(v10, "hf_setHasSeenOnboardingWelcomeView:", 0);

    id v9 = (void *)v14;
  }
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __48__HFHomeKitDispatcher__setupHomeManagerObserver__block_invoke_278;
  v19[3] = &unk_26409C278;
  id v20 = v8;
  id v21 = WeakRetained;
  uint64_t v15 = *(void *)(a1 + 40);
  id v22 = v5;
  uint64_t v23 = v15;
  id v16 = v5;
  id v17 = v8;
  id v18 = (id)[v9 addCompletionBlock:v19];
}

uint64_t __48__HFHomeKitDispatcher__setupHomeManagerObserver__block_invoke_278(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) uniqueIdentifier];
  objc_super v3 = [*(id *)(a1 + 40) overrideHome];
  id v4 = [v3 uniqueIdentifier];
  int v5 = [v2 isEqual:v4];

  if (v5) {
    [*(id *)(a1 + 40) setOverrideHome:0];
  }
  id v6 = [*(id *)(a1 + 32) uniqueIdentifier];
  uint64_t v7 = [*(id *)(a1 + 40) selectedHome];
  id v8 = [v7 uniqueIdentifier];
  int v9 = [v6 isEqual:v8];

  if (v9) {
    [*(id *)(a1 + 40) setSelectedHome:0 userInitiated:0];
  }
  id v10 = [*(id *)(a1 + 40) remoteAccessStateByHomeID];
  uint64_t v11 = [*(id *)(a1 + 32) uniqueIdentifier];
  [v10 removeObjectForKey:v11];

  uint64_t v12 = [*(id *)(a1 + 32) uniqueIdentifier];
  uint64_t v13 = [*(id *)(a1 + 40) pinCodeManager];
  uint64_t v14 = [v13 home];
  uint64_t v15 = [v14 uniqueIdentifier];
  int v16 = [v12 isEqual:v15];

  if (v16)
  {
    id v17 = HFLogForCategory(0x25uLL);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = *(void *)(a1 + 40);
      uint64_t v19 = NSStringFromSelector(*(SEL *)(a1 + 56));
      id v20 = [*(id *)(a1 + 40) home];
      uint64_t v21 = *(void *)(a1 + 32);
      int v26 = 138413058;
      uint64_t v27 = v18;
      __int16 v28 = 2112;
      uint64_t v29 = v19;
      __int16 v30 = 2112;
      uint64_t v31 = v20;
      __int16 v32 = 2112;
      uint64_t v33 = v21;
      _os_log_impl(&dword_20B986000, v17, OS_LOG_TYPE_DEFAULT, "%@:%@: Reseting HFPinCodeManager to use current home {%@} now that home {%@} was removed.", (uint8_t *)&v26, 0x2Au);
    }
    id v22 = [HFPinCodeManager alloc];
    uint64_t v23 = [*(id *)(a1 + 40) home];
    uint64_t v24 = [(HFPinCodeManager *)v22 initWithHome:v23];
    [*(id *)(a1 + 40) setPinCodeManager:v24];
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __41__HFHomeKitDispatcher__setupHomeObserver__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  int v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v7 = [v11 objectAtIndexedSubscript:0];
  id v8 = [WeakRetained home];
  int v9 = [v7 isEqual:v8];

  if (v9)
  {
    id v10 = [v11 objectAtIndexedSubscript:1];
    [WeakRetained _setDelegationEnabled:1 forAccessoryHierarchy:v10];
  }
  v5[2](v5);
}

void __41__HFHomeKitDispatcher__setupHomeObserver__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v13 = a2;
  int v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v7 = [v13 objectAtIndexedSubscript:0];
  id v8 = [WeakRetained home];
  int v9 = [v7 isEqual:v8];

  if (v9)
  {
    id v10 = [v13 objectAtIndexedSubscript:1];
    id v11 = [WeakRetained residentDeviceObserverDispatcher];
    uint64_t v12 = [v11 proxy];
    [v10 setDelegate:v12];
  }
  v5[2](v5);
  [WeakRetained _updateRemoteAccessStateForHome:v7 notifyingObservers:1];
}

void __41__HFHomeKitDispatcher__setupHomeObserver__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4 = (id *)(a1 + 32);
  int v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  v5[2](v5);

  uint64_t v7 = [v6 objectAtIndexedSubscript:0];

  [WeakRetained _updateRemoteAccessStateForHome:v7 notifyingObservers:1];
}

void __41__HFHomeKitDispatcher__setupHomeObserver__block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  int v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v7 = [v11 objectAtIndexedSubscript:0];
  id v8 = [WeakRetained home];
  int v9 = [v7 isEqual:v8];

  if (v9)
  {
    id v10 = [v11 objectAtIndexedSubscript:1];
    [WeakRetained _setDelegationEnabled:1 forMediaProfileContainer:v10 session:0];
  }
  v5[2](v5);
}

void __41__HFHomeKitDispatcher__setupHomeObserver__block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  int v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v7 = [v11 objectAtIndexedSubscript:0];
  id v8 = [WeakRetained home];
  int v9 = [v7 isEqual:v8];

  if (v9)
  {
    id v10 = [v11 objectAtIndexedSubscript:1];
    objc_msgSend(WeakRetained, "_setHomePersonManagerObservationEnabled:", objc_msgSend(v10, "isFaceClassificationEnabled"));
  }
  v5[2](v5);
}

void __46__HFHomeKitDispatcher__setupAccessoryObserver__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = (id *)(a1 + 32);
  int v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  uint64_t v7 = [v6 objectAtIndexedSubscript:0];

  [WeakRetained _setDelegationEnabled:1 forAccessoryHierarchy:v7];
  v5[2](v5);
}

void __46__HFHomeKitDispatcher__setupAccessoryObserver__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = (id *)(a1 + 32);
  int v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  uint64_t v7 = [v6 objectAtIndexedSubscript:0];

  [WeakRetained _setDelegationEnabled:1 forAccessoryHierarchy:v7];
  id v8 = [v7 lightProfiles];
  [WeakRetained fetchSettingsForLightProfiles:v8];
  v5[2](v5);
}

void __46__HFHomeKitDispatcher__setupAccessoryObserver__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4 = (id *)(a1 + 32);
  int v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  uint64_t v7 = [v6 objectAtIndexedSubscript:0];

  [WeakRetained _setDelegationEnabled:1 forAccessoryHierarchy:v7];
  v5[2](v5);
}

void __51__HFHomeKitDispatcher__setupResidentDeviceObserver__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = (id *)(a1 + 32);
  int v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  uint64_t v7 = [v6 objectAtIndexedSubscript:0];

  v5[2](v5);
  id v8 = [v7 home];
  [WeakRetained _updateRemoteAccessStateForHome:v8 notifyingObservers:1];
}

void __51__HFHomeKitDispatcher__setupResidentDeviceObserver__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = (id *)(a1 + 32);
  int v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  uint64_t v7 = [v6 objectAtIndexedSubscript:0];

  v5[2](v5);
  id v8 = [v7 home];
  [WeakRetained _updateRemoteAccessStateForHome:v8 notifyingObservers:1];
}

uint64_t __51__HFHomeKitDispatcher__setupResidentDeviceObserver__block_invoke_3(uint64_t a1, void *a2)
{
  [a2 unsignedIntegerValue];
  return HMResidentDeviceCapabilitiesDescription();
}

uint64_t __51__HFHomeKitDispatcher__setupResidentDeviceObserver__block_invoke_4(uint64_t a1, void *a2)
{
  [a2 unsignedIntegerValue];
  return HMResidentDeviceStatusDescription();
}

void __48__HFHomeKitDispatcher__setupMediaObjectObserver__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = (id *)(a1 + 32);
  int v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  uint64_t v7 = [v6 objectAtIndexedSubscript:0];

  [WeakRetained _setDelegationEnabled:1 forMediaProfileContainer:v7 session:0];
  v5[2](v5);
}

void __48__HFHomeKitDispatcher__setupMediaObjectObserver__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = (id *)(a1 + 32);
  int v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  uint64_t v7 = [v6 objectAtIndexedSubscript:0];
  id v8 = [v6 objectAtIndexedSubscript:1];

  [WeakRetained _setDelegationEnabled:1 forMediaProfileContainer:v7 session:v8];
  v5[2](v5);
}

__CFString *__49__HFHomeKitDispatcher__setupMediaSessionObserver__block_invoke(uint64_t a1, void *a2)
{
  unint64_t v2 = [a2 unsignedIntegerValue];
  return NSStringFromHMMediaPlaybackState(v2);
}

void __60__HFHomeKitDispatcher__setupSofwareUpdateControllerObserver__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = (id *)(a1 + 32);
  int v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  id v8 = [v6 objectAtIndexedSubscript:0];
  objc_opt_class();
  int v9 = [v6 objectAtIndexedSubscript:1];

  if (objc_opt_isKindOfClass()) {
    id v10 = v9;
  }
  else {
    id v10 = 0;
  }
  id v11 = v10;

  uint64_t v12 = [WeakRetained softwareUpdateObserverDispatcher];
  id v13 = [v12 proxy];
  [v11 setDelegate:v13];

  uint64_t v14 = HFLogForCategory(0x40uLL);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = objc_msgSend(v8, "hf_prettyDescription");
    int v16 = objc_msgSend(v11, "hf_prettyDescription");
    int v17 = 138412546;
    uint64_t v18 = v15;
    __int16 v19 = 2112;
    id v20 = v16;
    _os_log_impl(&dword_20B986000, v14, OS_LOG_TYPE_DEFAULT, "-[HFHomeKitDispatcher softwareUpdateController: (%@) didUpdateAvailableUpdate: (%@)]", (uint8_t *)&v17, 0x16u);
  }
  v5[2](v5);
}

__CFString *__54__HFHomeKitDispatcher__setupSymptomFixSessionObserver__block_invoke(uint64_t a1, void *a2)
{
  unint64_t v2 = [a2 unsignedIntegerValue];
  return NSStringFromHMSymptomFixSessionState(v2);
}

id __46__HFHomeKitDispatcher__setupStateDumpHandlers__block_invoke(uint64_t a1)
{
  unint64_t v2 = +[HFStateDumpBuilderContext contextWithDetailLevel:2];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = [WeakRetained homeManager];
  int v5 = objc_msgSend(v4, "hf_stateDumpBuilderWithContext:", v2);
  id v6 = [v5 buildPropertyListRepresentation];

  return v6;
}

id __46__HFHomeKitDispatcher__setupStateDumpHandlers__block_invoke_2()
{
  void v9[2] = *MEMORY[0x263EF8340];
  if (+[HFUtilities isProxHandOffV2Config])
  {
    v0 = 0;
    v1 = 0;
  }
  else
  {
    unint64_t v2 = +[HFHomeAppInstallStateArbiter sharedInstance];
    v1 = [v2 homeAppBundleURL];

    if (v1)
    {
      v0 = [MEMORY[0x263F086E0] bundleWithURL:v1];
    }
    else
    {
      v0 = 0;
    }
  }
  v8[0] = @"Home.framework";
  objc_super v3 = HFHomeBundle();
  id v4 = __46__HFHomeKitDispatcher__setupStateDumpHandlers__block_invoke_3(v3);
  v8[1] = @"Home.app";
  v9[0] = v4;
  int v5 = __46__HFHomeKitDispatcher__setupStateDumpHandlers__block_invoke_3(v0);
  v9[1] = v5;
  id v6 = [NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:2];

  return v6;
}

__CFString *__46__HFHomeKitDispatcher__setupStateDumpHandlers__block_invoke_3(void *a1)
{
  if (a1)
  {
    v1 = [a1 infoDictionary];
    uint64_t v2 = [v1 objectForKeyedSubscript:*MEMORY[0x263EFFB70]];
    objc_super v3 = (void *)v2;
    id v4 = @"(Unknown)";
    if (v2) {
      id v4 = (__CFString *)v2;
    }
    int v5 = v4;
  }
  else
  {
    int v5 = @"(Bundle not found)";
  }
  return v5;
}

- (void)updateHomeManagerConfiguration:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = +[HFHomeKitDispatcher configuration];
  uint64_t v6 = [v5 options];
  uint64_t v7 = [v4 options];

  if (v6 != v7)
  {
    id v8 = HFLogForCategory(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      [v4 options];
      int v9 = HMHomeManagerOptionsToString();
      int v13 = 138412290;
      uint64_t v14 = v9;
      _os_log_impl(&dword_20B986000, v8, OS_LOG_TYPE_DEFAULT, "Updating Home Manager configuration with options [%@]", (uint8_t *)&v13, 0xCu);
    }
    +[HFHomeKitDispatcher setConfiguration:v4];
    id v10 = [(HFHomeKitDispatcher *)self homeManagerCreator];
    [v10 setConfiguration:v4];

    id v11 = [(HFHomeKitDispatcher *)self homeManagerCreator];
    uint64_t v12 = [v11 createHomeManagerIfNeeded];

    if (v12) {
      [(HFHomeKitDispatcher *)self setHomeManagerAndUpdateDelegate:v12];
    }
  }
}

- (void)homeManagerWasCreated:(id)a3
{
  [(HFHomeKitDispatcher *)self setHomeManagerAndUpdateDelegate:a3];
  id v4 = HFLogForCategory(0x25uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_20B986000, v4, OS_LOG_TYPE_DEFAULT, "Home Manager created on delegate callback", v7, 2u);
  }

  if (self->_homeManager)
  {
    int v5 = [[HFHomeKitAccessorySettingsDataSource alloc] initWithHomeManager:self->_homeManager];
    accessorySettingsDataSource = self->_accessorySettingsDataSource;
    self->_accessorySettingsDataSource = v5;
  }
}

- (void)addMediaProfileObserver:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = HFLogForCategory(0x25uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    uint64_t v7 = NSStringFromSelector(a2);
    int v8 = 138412290;
    int v9 = v7;
    _os_log_error_impl(&dword_20B986000, v6, OS_LOG_TYPE_ERROR, "This selector, %@, has been deprecated! Please move to addMediaObjectObserver: and move to HFMediaObjectObserver away from HFMediaProfileObserver!", (uint8_t *)&v8, 0xCu);
  }
  [(HFHomeKitDispatcher *)self addMediaObjectObserver:v5];
}

- (void)removeMediaProfileObserver:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = HFLogForCategory(0x25uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    uint64_t v7 = NSStringFromSelector(a2);
    int v8 = 138412290;
    int v9 = v7;
    _os_log_error_impl(&dword_20B986000, v6, OS_LOG_TYPE_ERROR, "This selector, %@, has been deprecated! Please move to removeMediaObjectObserver: and move to HFMediaObjectObserver away from HFMediaProfileObserver!", (uint8_t *)&v8, 0xCu);
  }
  [(HFHomeKitDispatcher *)self removeMediaObjectObserver:v5];
}

- (void)removeSoftwareUpdateControllerV2Observer:(id)a3
{
  id v4 = a3;
  id v5 = [(HFHomeKitDispatcher *)self softwareUpdateControllerV2ObserverDispatcher];
  [v5 removeObserver:v4];
}

- (void)removeDiagnosticInfoObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(HFHomeKitDispatcher *)self diagnosticInfoManager];
  [v5 removeObserver:v4];
}

- (void)dispatchHomeManagerObserverMessage:(id)a3 sender:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HFHomeKitDispatcher *)self homeManagerObserverDispatcher];
  [v8 dispatchMessageExcludingSender:v6 usingBlock:v7];
}

- (void)dispatchAccessoryObserverMessage:(id)a3 sender:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HFHomeKitDispatcher *)self accessoryObserverDispatcher];
  [v8 dispatchMessageExcludingSender:v6 usingBlock:v7];
}

- (void)dispatchCameraObserverMessage:(id)a3 sender:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HFHomeKitDispatcher *)self cameraObserverDispatcher];
  [v8 dispatchMessageExcludingSender:v6 usingBlock:v7];
}

- (void)dispatchMediaSessionObserverMessage:(id)a3 sender:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HFHomeKitDispatcher *)self mediaSessionObserverDispatcher];
  [v8 dispatchMessageExcludingSender:v6 usingBlock:v7];
}

- (void)dispatchAudioControlObserverMessage:(id)a3 sender:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HFHomeKitDispatcher *)self audioControlObserverDispatcher];
  [v8 dispatchMessageExcludingSender:v6 usingBlock:v7];
}

- (void)dispatchMediaObjectObserverMessage:(id)a3 sender:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HFHomeKitDispatcher *)self mediaObjectObserverDispatcher];
  [v8 dispatchMessageExcludingSender:v6 usingBlock:v7];
}

- (void)dispatchHomeKitSettingMessage:(id)a3 sender:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HFHomeKitDispatcher *)self homeKitSettingsObserverDispatcher];
  [v8 dispatchMessageExcludingSender:v6 usingBlock:v7];
}

- (void)dispatchSiriEndpointObserverMessage:(id)a3 sender:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HFHomeKitDispatcher *)self siriEndpointProfileObserverDispatcher];
  [v8 dispatchMessageExcludingSender:v6 usingBlock:v7];
}

- (void)dispatchSymptomFixSessionObserverMessage:(id)a3 sender:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HFHomeKitDispatcher *)self symptomFixSessionObserverDispatcher];
  [v8 dispatchMessageExcludingSender:v6 usingBlock:v7];
}

- (void)dispatchSoftwareUpdateControllerMessage:(id)a3 sender:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HFHomeKitDispatcher *)self softwareUpdateControllerObserverDispatcher];
  [v8 dispatchMessageExcludingSender:v6 usingBlock:v7];
}

- (void)dispatchSoftwareUpdateMessage:(id)a3 sender:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HFHomeKitDispatcher *)self softwareUpdateObserverDispatcher];
  [v8 dispatchMessageExcludingSender:v6 usingBlock:v7];
}

- (void)dispatchSymptomsHandlerMessage:(id)a3 sender:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HFHomeKitDispatcher *)self symptomsHandlerObserverDispatcher];
  [v8 dispatchMessageExcludingSender:v6 usingBlock:v7];
}

- (void)dispatchUserObserverMessage:(id)a3 sender:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HFHomeKitDispatcher *)self userObserverDispatcher];
  [v8 dispatchMessageExcludingSender:v6 usingBlock:v7];
}

- (void)dispatchTelevisionObserverMessage:(id)a3 sender:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HFHomeKitDispatcher *)self televisionObserverDispatcher];
  [v8 dispatchMessageExcludingSender:v6 usingBlock:v7];
}

- (void)dispatchLightObserverMessage:(id)a3 sender:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HFHomeKitDispatcher *)self lightObserverDispatcher];
  [v8 dispatchMessageExcludingSender:v6 usingBlock:v7];
}

- (void)dispatchHomeKitSettingsObserverMessage:(id)a3 sender:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HFHomeKitDispatcher *)self homeKitSettingsObserverDispatcher];
  [v8 dispatchMessageExcludingSender:v6 usingBlock:v7];
}

- (void)dispatchNetworkConfigurationObserverMessage:(id)a3 sender:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HFHomeKitDispatcher *)self networkConfigurationObserverDispatcher];
  [v8 dispatchMessageExcludingSender:v6 usingBlock:v7];
}

- (void)dispatchHomePersonManagerObserverMessage:(id)a3 sender:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HFHomeKitDispatcher *)self homePersonManagerDispatcher];
  [v8 dispatchMessageExcludingSender:v6 usingBlock:v7];
}

- (void)dispatchMediaDestinationControllerObserverMessage:(id)a3 sender:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HFHomeKitDispatcher *)self mediaDestinationControllerObserverDispatcher];
  [v8 dispatchMessageExcludingSender:v6 usingBlock:v7];
}

- (void)setSelectedHome:(id)a3
{
}

- (void)setSelectedHome:(id)a3 userInitiated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [(HMHome *)self->_selectedHome uniqueIdentifier];
  [(HFHomeKitDispatcher *)self _requestSelectedHome:v6];
  if (v4)
  {
    if ([(HFHomeKitDispatcher *)self _shouldPersistSelectedHomeToDefaults])
    {
      id v8 = [(HMHome *)self->_selectedHome uniqueIdentifier];
      char v9 = [v7 isEqual:v8];

      if ((v9 & 1) == 0)
      {
        uint64_t v10 = +[HFStateRestorationSettings sharedInstance];
        [v10 syncToNanoPrefs];

        id v11 = HFLogForCategory(0x2BuLL);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v12 = [(HMHome *)self->_selectedHome name];
          int v14 = 138412290;
          uint64_t v15 = v12;
          _os_log_impl(&dword_20B986000, v11, OS_LOG_TYPE_DEFAULT, "User initiated change to home: %@", (uint8_t *)&v14, 0xCu);
        }
        notify_post(HFHomeSelectedHomeChangedNotification);
        if ([(id)objc_opt_class() synchronizesHomeDataModel])
        {
          int v13 = [MEMORY[0x263F49240] shared];
          [v13 setCurrentHome:v6];
        }
      }
    }
  }
}

- (BOOL)setSelectedHomeWithName:(id)a3
{
  id v4 = a3;
  id v5 = [(HFHomeKitDispatcher *)self homeManager];
  id v6 = [v5 homes];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  void v10[2] = __47__HFHomeKitDispatcher_setSelectedHomeWithName___block_invoke;
  v10[3] = &unk_26408FFE0;
  id v11 = v4;
  id v7 = v4;
  id v8 = objc_msgSend(v6, "na_firstObjectPassingTest:", v10);

  if (v8) {
    [(HFHomeKitDispatcher *)self setSelectedHome:v8 userInitiated:0];
  }

  return v8 != 0;
}

uint64_t __47__HFHomeKitDispatcher_setSelectedHomeWithName___block_invoke(uint64_t a1, void *a2)
{
  objc_super v3 = [a2 name];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (void)setOverrideHome:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v4 = (HMHome *)a3;
  id v5 = HFLogForCategory(0x25uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_20B986000, v5, OS_LOG_TYPE_DEFAULT, "Override home is now %@", (uint8_t *)&v7, 0xCu);
  }

  overrideHome = self->_overrideHome;
  self->_overrideHome = v4;

  [(HFHomeKitDispatcher *)self updateHome];
}

- (NAFuture)firstHomeAddedFuture
{
  v10[1] = *MEMORY[0x263EF8340];
  if ([(HFHomeKitDispatcher *)self willAcceptHomeFutures])
  {
    objc_super v3 = [(HFHomeKitDispatcher *)self home];

    id v4 = objc_alloc_init(MEMORY[0x263F581A8]);
    id v5 = v4;
    if (v3)
    {
      v10[0] = v4;
      id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];
      [(HFHomeKitDispatcher *)self _finishFirstHomeAddedPromises:v6];
    }
    else
    {
      id v8 = [(HFHomeKitDispatcher *)self firstHomeAddedPromises];
      [v8 addObject:v5];
    }
    int v7 = [v5 future];
  }
  else
  {
    int v7 = 0;
  }
  return (NAFuture *)v7;
}

- (id)homeFutureWithUser:(id)a3
{
  id v4 = a3;
  id v5 = [(HFHomeKitDispatcher *)self allHomesFuture];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  void v9[2] = __42__HFHomeKitDispatcher_homeFutureWithUser___block_invoke;
  void v9[3] = &unk_26408FAA0;
  id v10 = v4;
  id v6 = v4;
  int v7 = [v5 flatMap:v9];

  return v7;
}

id __42__HFHomeKitDispatcher_homeFutureWithUser___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v3 = a2;
  uint64_t v20 = [v3 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v20)
  {
    uint64_t v4 = *(void *)v27;
    uint64_t v21 = v3;
    uint64_t v19 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v27 != v4) {
          objc_enumerationMutation(v3);
        }
        id v6 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        int v7 = objc_msgSend(v6, "hf_allUsersIncludingCurrentUser");
        uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v30 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v23;
          while (2)
          {
            for (uint64_t j = 0; j != v9; ++j)
            {
              if (*(void *)v23 != v10) {
                objc_enumerationMutation(v7);
              }
              uint64_t v12 = [*(id *)(*((void *)&v22 + 1) + 8 * j) uniqueIdentifier];
              int v13 = [*(id *)(a1 + 32) uniqueIdentifier];
              char v14 = objc_msgSend(v12, "hmf_isEqualToUUID:", v13);

              if (v14)
              {
                int v17 = [MEMORY[0x263F58190] futureWithResult:v6];

                id v3 = v21;
                uint64_t v16 = v21;
                goto LABEL_18;
              }
            }
            uint64_t v9 = [v7 countByEnumeratingWithState:&v22 objects:v30 count:16];
            if (v9) {
              continue;
            }
            break;
          }
        }

        id v3 = v21;
        uint64_t v4 = v19;
      }
      uint64_t v20 = [v21 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v20);
  }

  uint64_t v15 = (void *)MEMORY[0x263F58190];
  uint64_t v16 = objc_msgSend(MEMORY[0x263F087E8], "hf_errorWithCode:", 30);
  int v17 = [v15 futureWithError:v16];
LABEL_18:

  return v17;
}

- (id)userFutureWithUniqueIdentifierStr:(id)a3
{
  id v4 = a3;
  id v5 = [(HFHomeKitDispatcher *)self allHomesFuture];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  void v9[2] = __57__HFHomeKitDispatcher_userFutureWithUniqueIdentifierStr___block_invoke;
  void v9[3] = &unk_26408FAA0;
  id v10 = v4;
  id v6 = v4;
  int v7 = [v5 flatMap:v9];

  return v7;
}

id __57__HFHomeKitDispatcher_userFutureWithUniqueIdentifierStr___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v3 = a2;
  uint64_t v20 = [v3 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v20)
  {
    uint64_t v4 = *(void *)v26;
    uint64_t v19 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v26 != v4) {
          objc_enumerationMutation(v3);
        }
        id v6 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        int v7 = objc_msgSend(v6, "hf_allUsersIncludingCurrentUser", v19);
        uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v22;
          while (2)
          {
            for (uint64_t j = 0; j != v9; ++j)
            {
              if (*(void *)v22 != v10) {
                objc_enumerationMutation(v7);
              }
              uint64_t v12 = *(void **)(*((void *)&v21 + 1) + 8 * j);
              int v13 = [v12 uniqueIdentifier];
              char v14 = objc_msgSend(v13, "hmf_isEqualToUUIDString:", *(void *)(a1 + 32));

              if (v14)
              {
                int v17 = [MEMORY[0x263F58190] futureWithResult:v12];

                uint64_t v16 = v3;
                goto LABEL_18;
              }
            }
            uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v29 count:16];
            if (v9) {
              continue;
            }
            break;
          }
        }

        uint64_t v4 = v19;
      }
      uint64_t v20 = [v3 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v20);
  }

  uint64_t v15 = (void *)MEMORY[0x263F58190];
  uint64_t v16 = objc_msgSend(MEMORY[0x263F087E8], "hf_errorWithCode:", 30);
  int v17 = [v15 futureWithError:v16];
LABEL_18:

  return v17;
}

- (void)setSelectedHomeFollowsLocation:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(HFHomeKitDispatcher *)self selectedHomeFollowsLocation] != a3)
  {
    id v5 = [(HFHomeKitDispatcher *)self locationCoordinator];
    [v5 setHomeSensingEnabled:v3];

    [(HFHomeKitDispatcher *)self updateHomeSensingState];
  }
}

id __55__HFHomeKitDispatcher__setupLocationSensingCoordinator__block_invoke_601(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  char v5 = [v3 BOOLValue];

  id v6 = HFLogForCategory(0x2BuLL);
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      *(_WORD *)id v11 = 0;
      _os_log_impl(&dword_20B986000, v6, OS_LOG_TYPE_DEFAULT, "HomeApp is installed; initializing HFLocationSensingCoordinator",
        v11,
        2u);
    }

    uint64_t v8 = [[HFLocationSensingCoordinator alloc] initWithDelegate:WeakRetained];
    [WeakRetained setLocationCoordinator:v8];

    [WeakRetained updateHomeSensingState];
  }
  else
  {
    if (v7)
    {
      *(_WORD *)id buf = 0;
      _os_log_impl(&dword_20B986000, v6, OS_LOG_TYPE_DEFAULT, "HomeApp is not installed; avoiding initialization of HFLocationSensingCoordinator",
        buf,
        2u);
    }
  }
  uint64_t v9 = [MEMORY[0x263F58190] futureWithNoResult];

  return v9;
}

- (id)pinCodeManagerForHome:(id)a3
{
  id v4 = a3;
  char v5 = [(HFHomeKitDispatcher *)self pinCodeManager];
  id v6 = [v5 home];
  BOOL v7 = [v6 uniqueIdentifier];
  uint64_t v8 = [v4 uniqueIdentifier];
  int v9 = [v7 isEqual:v8];

  if (v9)
  {
    uint64_t v10 = [(HFHomeKitDispatcher *)self pinCodeManager];
  }
  else
  {
    uint64_t v10 = [[HFPinCodeManager alloc] initWithHome:v4];
    id v11 = [(HFHomeKitDispatcher *)self home];
    uint64_t v12 = [v11 uniqueIdentifier];
    int v13 = [v4 uniqueIdentifier];
    int v14 = [v12 isEqual:v13];

    if (v14) {
      [(HFHomeKitDispatcher *)self setPinCodeManager:v10];
    }
  }

  return v10;
}

- (id)activityLogCoordinatorForHome:(id)a3
{
  id v4 = a3;
  char v5 = [(HFHomeKitDispatcher *)self activityLogCoordinator];
  id v6 = [v5 home];
  BOOL v7 = [v6 uniqueIdentifier];
  uint64_t v8 = [v4 uniqueIdentifier];
  int v9 = [v7 isEqual:v8];

  if (v9)
  {
    uint64_t v10 = [(HFHomeKitDispatcher *)self activityLogCoordinator];
  }
  else
  {
    uint64_t v10 = [[HFActivityLogCoordinator alloc] initWithHome:v4];
    id v11 = [(HFHomeKitDispatcher *)self home];
    uint64_t v12 = [v11 uniqueIdentifier];
    int v13 = [v4 uniqueIdentifier];
    int v14 = [v12 isEqual:v13];

    if (v14) {
      [(HFHomeKitDispatcher *)self setActivityLogCoordinator:v10];
    }
  }

  return v10;
}

uint64_t __47__HFHomeKitDispatcher__finishAllHomesPromises___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  char v5 = [a2 name];
  id v6 = [v4 name];

  uint64_t v7 = [v5 caseInsensitiveCompare:v6];
  return v7;
}

- (id)_primaryHome
{
  id v3 = [(HFHomeKitDispatcher *)self homeManager];
  id v4 = [v3 homes];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    id v6 = [(HFHomeKitDispatcher *)self homeManager];
    uint64_t v7 = [v6 primaryHome];
  }
  else
  {
    uint64_t v7 = 0;
  }
  return v7;
}

- (void)addObservationForCameraClipManager:(id)a3
{
  id v6 = a3;
  id v4 = [(HFHomeKitDispatcher *)self cameraObserverDispatcher];
  uint64_t v5 = [v4 proxy];

  if (v5) {
    [v6 addObserver:v5];
  }
}

- (void)removeObservationForCameraClipManager:(id)a3
{
  id v6 = a3;
  id v4 = [(HFHomeKitDispatcher *)self cameraObserverDispatcher];
  uint64_t v5 = [v4 proxy];

  if (v5) {
    [v6 removeObserver:v5];
  }
}

- (void)_setDelegationEnabled:(BOOL)a3 forMediaProfileContainer:(id)a4 session:(id)a5
{
  BOOL v7 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v10;
  if (v7)
  {
    uint64_t v12 = [(HFHomeKitDispatcher *)self mediaSessionObserverDispatcher];
    int v13 = [v12 proxy];
    [v11 setDelegate:v13];

    int v14 = [(HFHomeKitDispatcher *)self mediaObjectObserverDispatcher];
    uint64_t v15 = [v14 proxy];
    [v9 setDelegate:v15];

    uint64_t v5 = [(HFHomeKitDispatcher *)self mediaSessionObserverDispatcher];
    uint64_t v16 = [v5 proxy];
  }
  else
  {
    [v10 setDelegate:0];
    [v9 setDelegate:0];
    uint64_t v16 = 0;
  }
  int v17 = [v9 mediaSession];
  [v17 setDelegate:v16];

  if (v7)
  {

    uint64_t v5 = [(HFHomeKitDispatcher *)self audioControlObserverDispatcher];
    uint64_t v18 = [v5 proxy];
  }
  else
  {
    uint64_t v18 = 0;
  }
  uint64_t v19 = [v9 mediaSession];
  uint64_t v20 = [v19 audioControl];
  [v20 setDelegate:v18];

  if (v7)
  {

    uint64_t v5 = [(HFHomeKitDispatcher *)self homeKitSettingsObserverDispatcher];
    long long v21 = [v5 proxy];
  }
  else
  {
    long long v21 = 0;
  }
  long long v22 = [v9 settings];
  [v22 setDelegate:v21];

  if (v7)
  {
  }
  if (!+[HFExecutionEnvironment isHomeWidgetRelatedProcess])
  {
    objc_opt_class();
    id v23 = v9;
    if (objc_opt_isKindOfClass()) {
      long long v24 = v23;
    }
    else {
      long long v24 = 0;
    }
    id v25 = v24;

    long long v26 = [v25 accessories];
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __78__HFHomeKitDispatcher__setDelegationEnabled_forMediaProfileContainer_session___block_invoke;
    v27[3] = &unk_26409C330;
    BOOL v28 = v7;
    v27[4] = self;
    objc_msgSend(v26, "na_each:", v27);
  }
}

void __78__HFHomeKitDispatcher__setDelegationEnabled_forMediaProfileContainer_session___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  int v3 = *(unsigned __int8 *)(a1 + 40);
  if (*(unsigned char *)(a1 + 40))
  {
    a1 = [*(id *)(a1 + 32) symptomsHandlerObserverDispatcher];
    id v4 = [(id)a1 proxy];
  }
  else
  {
    id v4 = 0;
  }
  uint64_t v5 = [v6 symptomsHandler];
  [v5 setDelegate:v4];

  if (v3)
  {
  }
}

uint64_t __65__HFHomeKitDispatcher_dispatchLightProfileUpdate_settings_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 lightProfile:*(void *)(a1 + 32) didUpdateSettings:*(void *)(a1 + 40)];
}

- (void)installStateArbiter:(id)a3 installStateDidChange:(BOOL)a4
{
  if (a4)
  {
    id v5 = [(HFHomeKitDispatcher *)self _setupLocationSensingCoordinator];
    [(HFHomeKitDispatcher *)self setLocationCoordinatorSetupFuture:v5];
  }
  else
  {
    [(HFHomeKitDispatcher *)self setLocationCoordinator:0];
  }
}

- (void)setHomeManager:(id)a3
{
}

- (HFHomeKitAccessorySettingsDataSource)accessorySettingsDataSource
{
  return self->_accessorySettingsDataSource;
}

- (int)homeKitPreferencesChangedNotifyToken
{
  return self->_homeKitPreferencesChangedNotifyToken;
}

- (void)setHomeKitPreferencesChangedNotifyToken:(int)a3
{
  self->_homeKitPreferencesChangedNotifyToken = a3;
}

- (void)setRemoteAccessStateByHomeID:(id)a3
{
}

- (void)setHomeManagerObserverDispatcher:(id)a3
{
}

- (void)setHomeObserverDispatcher:(id)a3
{
}

- (void)setAccessoryObserverDispatcher:(id)a3
{
}

- (void)setResidentDeviceObserverDispatcher:(id)a3
{
}

- (void)setCameraObserverDispatcher:(id)a3
{
}

- (void)setMediaObjectObserverDispatcher:(id)a3
{
}

- (void)setMediaSessionObserverDispatcher:(id)a3
{
}

- (void)setAudioControlObserverDispatcher:(id)a3
{
}

- (void)setSoftwareUpdateControllerObserverDispatcher:(id)a3
{
}

- (void)setSoftwareUpdateControllerV2ObserverDispatcher:(id)a3
{
}

- (void)setSoftwareUpdateObserverDispatcher:(id)a3
{
}

- (void)setUserObserverDispatcher:(id)a3
{
}

- (void)setSymptomsHandlerObserverDispatcher:(id)a3
{
}

- (void)setMediaDestinationControllerObserverDispatcher:(id)a3
{
}

- (void)setSiriEndpointProfileObserverDispatcher:(id)a3
{
}

- (void)setSymptomFixSessionObserverDispatcher:(id)a3
{
}

- (void)setHomeKitSettingsObserverDispatcher:(id)a3
{
}

- (void)setNetworkConfigurationObserverDispatcher:(id)a3
{
}

- (void)setTelevisionObserverDispatcher:(id)a3
{
}

- (void)setHomePersonManagerDispatcher:(id)a3
{
}

- (void)setLightObserverDispatcher:(id)a3
{
}

- (void)setWalletKeyDeviceStateObserverDispatcher:(id)a3
{
}

- (void)setHomePromises:(id)a3
{
}

- (void)setFirstHomeAddedPromises:(id)a3
{
}

- (void)setAllHomesPromises:(id)a3
{
}

- (HFPinCodeManager)pinCodeManager
{
  return self->_pinCodeManager;
}

- (void)setPinCodeManager:(id)a3
{
}

- (HFActivityLogCoordinator)activityLogCoordinator
{
  return self->_activityLogCoordinator;
}

- (void)setActivityLogCoordinator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityLogCoordinator, 0);
  objc_storeStrong((id *)&self->_pinCodeManager, 0);
  objc_storeStrong((id *)&self->_homeManagerCreator, 0);
  objc_storeStrong((id *)&self->_locationCoordinatorSetupFuture, 0);
  objc_storeStrong((id *)&self->_allHomesPromises, 0);
  objc_storeStrong((id *)&self->_firstHomeAddedPromises, 0);
  objc_storeStrong((id *)&self->_homePromises, 0);
  objc_storeStrong((id *)&self->_walletKeyDeviceStateObserverDispatcher, 0);
  objc_storeStrong((id *)&self->_lightObserverDispatcher, 0);
  objc_storeStrong((id *)&self->_homePersonManagerDispatcher, 0);
  objc_storeStrong((id *)&self->_televisionObserverDispatcher, 0);
  objc_storeStrong((id *)&self->_networkConfigurationObserverDispatcher, 0);
  objc_storeStrong((id *)&self->_homeKitSettingsObserverDispatcher, 0);
  objc_storeStrong((id *)&self->_symptomFixSessionObserverDispatcher, 0);
  objc_storeStrong((id *)&self->_siriEndpointProfileObserverDispatcher, 0);
  objc_storeStrong((id *)&self->_mediaDestinationControllerObserverDispatcher, 0);
  objc_storeStrong((id *)&self->_symptomsHandlerObserverDispatcher, 0);
  objc_storeStrong((id *)&self->_userObserverDispatcher, 0);
  objc_storeStrong((id *)&self->_softwareUpdateObserverDispatcher, 0);
  objc_storeStrong((id *)&self->_softwareUpdateControllerV2ObserverDispatcher, 0);
  objc_storeStrong((id *)&self->_softwareUpdateControllerObserverDispatcher, 0);
  objc_storeStrong((id *)&self->_audioControlObserverDispatcher, 0);
  objc_storeStrong((id *)&self->_mediaSessionObserverDispatcher, 0);
  objc_storeStrong((id *)&self->_mediaObjectObserverDispatcher, 0);
  objc_storeStrong((id *)&self->_cameraObserverDispatcher, 0);
  objc_storeStrong((id *)&self->_residentDeviceObserverDispatcher, 0);
  objc_storeStrong((id *)&self->_accessoryObserverDispatcher, 0);
  objc_storeStrong((id *)&self->_homeObserverDispatcher, 0);
  objc_storeStrong((id *)&self->_homeManagerObserverDispatcher, 0);
  objc_storeStrong((id *)&self->_remoteAccessStateByHomeID, 0);
  objc_storeStrong((id *)&self->_locationCoordinator, 0);
  objc_storeStrong((id *)&self->_selectedHome, 0);
  objc_storeStrong((id *)&self->_overrideHome, 0);
  objc_storeStrong((id *)&self->_diagnosticInfoManager, 0);
  objc_storeStrong((id *)&self->_softwareUpdateManager, 0);
  objc_storeStrong((id *)&self->_accessorySettingsDataSource, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_homeManager, 0);
}

@end