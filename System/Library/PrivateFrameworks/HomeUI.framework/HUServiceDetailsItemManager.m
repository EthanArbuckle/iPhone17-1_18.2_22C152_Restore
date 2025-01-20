@interface HUServiceDetailsItemManager
- (ACAccount)homeMediaAccount;
- (ACAccount)loggedInMediaAccountOnHomePod;
- (BOOL)_areHomePodMediaAccountsMismatched;
- (BOOL)_hasDismissedHomePodHasNonMemberMediaAccountWarning;
- (BOOL)_isGroupedHomePod;
- (BOOL)_isRestartSupportedForGroupedHomePod:(id)a3;
- (BOOL)_isSingleHomePodInGroup;
- (BOOL)_shouldDisableOptionalDataDuringFastInitialUpdate;
- (BOOL)_shouldHideHomePodAnalyticsAndImprovementsSettings;
- (BOOL)_shouldShowAccessoryInfoItems;
- (BOOL)_shouldShowContainedAccessoriesList;
- (BOOL)_shouldShowFirmwareUpdateSection;
- (BOOL)_shouldShowLinkedApplicationSection;
- (BOOL)_shouldShowSplitAccountUI;
- (BOOL)canToggleAccessoryInfoItem:(id)a3;
- (BOOL)controlAndCharacteristicStateItemModule:(id)a3 shouldShowControlPanelItem:(id)a4;
- (BOOL)controlAndCharacteristicStateItemModule:(id)a3 shouldShowSectionTitleForControlPanelItem:(id)a4;
- (BOOL)groupedAccessoryReachableOverRapport;
- (BOOL)isAccessory;
- (BOOL)isAccessoryInfoItem:(id)a3;
- (BOOL)isCharacteristicStateItem:(id)a3;
- (BOOL)isItemGroup;
- (BOOL)isMatterAccessoryLikeItem;
- (BOOL)isRoomItem:(id)a3;
- (BOOL)shouldHideAccessoryItem;
- (BOOL)shouldHideSeparateTileItem;
- (BOOL)shouldShowDeviceOptionsForAccessoryItem:(id)a3;
- (BOOL)shouldShowExportDiagnosticsItem:(id)a3;
- (BOOL)showAssociatedServiceTypeList;
- (BOOL)showRoomsList;
- (BOOL)sourceItemIsHomePod;
- (BOOL)sourceItemIsHomePodConfiguredForMultiUser;
- (BOOL)sourceItemIsService;
- (BOOL)sourceItemIsSingleServiceAccessory;
- (BOOL)supportsWiFiStrengthDisplay:(id)a3;
- (HFAccessoryInfoDetailsItemProvider)accessoryInfoItemProvider;
- (HFAccessorySettingDeviceOptionsAdapter)deviceOptionsAdapter;
- (HFAccessorySettingDeviceOptionsAdapterUtility)deviceOptionsAdapterUtility;
- (HFAssociatedServiceTypeOptionItemProvider)associatedServiceTypeOptionItemProvider;
- (HFHomeKitObject)sourceItemHomeKitObject;
- (HFItem)accessoryItem;
- (HFItem)addGroupItem;
- (HFItem)alarmItem;
- (HFItem)associatedServiceTypeItem;
- (HFItem)audioSettingsItem;
- (HFItem)cameraActivityZonesItem;
- (HFItem)cameraDoorbellChimeMuteItem;
- (HFItem)cameraFaceRecognitionItem;
- (HFItem)cameraRecordingOptionsItem;
- (HFItem)collectDiagnosticsItem;
- (HFItem)createNewRoomItem;
- (HFItem)exportDiagnosticsItem;
- (HFItem)favoriteItem;
- (HFItem)headerItem;
- (HFItem)homeTheaterAudioOutputItem;
- (HFItem)identifyHomePodItem;
- (HFItem)internalDebuggingItem;
- (HFItem)lockAddHomeKeyToWalletItem;
- (HFItem)lockPinCodesItem;
- (HFItem)managedConfigurationProfilesItem;
- (HFItem)pairingModeItem;
- (HFItem)primaryUserItem;
- (HFItem)removeFromGroupItem;
- (HFItem)removeItem;
- (HFItem)resetItem;
- (HFItem)restartItem;
- (HFItem)roomItem;
- (HFItem)roomListItem;
- (HFItem)selectedAssociatedServiceTypeItem;
- (HFItem)selectedRoomItem;
- (HFItem)separateTileItem;
- (HFItem)showContainedItems;
- (HFItem)showInHomeDashboardItem;
- (HFItem)splitMediaAccountSignoutAccountItem;
- (HFItem)splitMediaAccountTitleItem;
- (HFItem)splitMediaAccountUseDefaultAccountItem;
- (HFItem)statusAndNotificationItem;
- (HFItemBuilderItem)builderItem;
- (HFItemProvider)existingRoomItemProvider;
- (HFItemProvider)suggestedRoomItemProvider;
- (HFRemoteControlItemModule)serviceDetailsRemoteControlItemModule;
- (HFSelectedRoomItemProvider)selectedRoomItemProvider;
- (HFServiceLikeBuilder)serviceLikeBuilder;
- (HFStaticItemProvider)accessoryResetAndRemoveItemProvider;
- (HFStaticItemProvider)exportDiagnosticsItemProvider;
- (HFStaticItemProvider)staticItemProvider;
- (HMAccessory)sourceItemAccessory;
- (HMAccessorySettingsController)settingsController;
- (HMHome)overrideHome;
- (HMHomeManager)homeManager;
- (HUAccessoryDebugModule)debugAccessoryItemModule;
- (HUAccessoryRepresentableItemModule)accessoryRepresentableItemModule;
- (HUAccessoryServicesItemModule)accessoryServicesEditorItemModule;
- (HUAccessorySettingsItemModule)accessorySettingsItemModule;
- (HUAssociatedSceneAndTriggerModule)sceneAndTriggerModule;
- (HUAvailableRelatedTriggerItemModule)relatedTriggerItemModule;
- (HUFirmwareUpdateItemProvider)firmwareUpdateItemProvider;
- (HUInputSourceItemModule)inputSourceItemModule;
- (HULinkedApplicationItemProvider)linkedApplicationItemProvider;
- (HUMatterConnectedServicesItemModule)connectedServicesItemModule;
- (HUNameItemModule)nameModule;
- (HUServiceDetailsCameraNightModeItem)cameraNightModeItem;
- (HUServiceDetailsCameraStatusLightItem)cameraStatusLightItem;
- (HUServiceDetailsControlAndCharacteristicStateItemModule)serviceDetailsControlStateAndCharacteristicItemModule;
- (HUServiceDetailsItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4;
- (HUServiceDetailsItemManager)initWithServiceItem:(id)a3 delegate:(id)a4;
- (HUServiceDetailsProgrammableSwitchItemModule)programmableSwitchItemModule;
- (HUSoftwareUpdateItemModule)softwareUpdateItemModule;
- (HUTelevisionSettingsItemModule)televisionSettingsItemModule;
- (HUValveItemModule)valveEditorItemModule;
- (NSArray)accessorySettingsSections;
- (NSArray)advancedCameraSettingsSection;
- (NSArray)cameraActivityZonesSections;
- (NSArray)cameraNightModeSections;
- (NSArray)cameraStatusLightSections;
- (NSArray)characteristicSections;
- (NSArray)collectDiagnosticsSections;
- (NSArray)connectedServicesSections;
- (NSArray)containedAccessoriesSections;
- (NSArray)doorbellMuteSections;
- (NSArray)homeKitAccessorySettingsModules;
- (NSArray)homeKitAccessorySettingsSections;
- (NSArray)homeTheaterAudioSections;
- (NSArray)inputSourceEditorSections;
- (NSArray)lockAddHomeKeyToWalletSections;
- (NSArray)nameAndIconSections;
- (NSArray)orderedRoomSectionItems;
- (NSArray)programmableSwitchSections;
- (NSArray)relatedTriggerSections;
- (NSArray)sceneAndTriggerSections;
- (NSArray)softwareUpdateSections;
- (NSArray)splitMediaAccountSections;
- (NSArray)supportedVoiceRecognitionLanguages;
- (NSArray)televisionSettingsSections;
- (NSArray)valveEditorSections;
- (id)_allItemsForSectionIdentifier:(id)a3;
- (id)_buildItemModulesForHome:(id)a3;
- (id)_buildItemProvidersForHome:(id)a3;
- (id)_buildSectionsWithDisplayedItems:(id)a3;
- (id)_characteristicSectionForIdentifier:(id)a3;
- (id)_homeFuture;
- (id)_itemsToHideInSet:(id)a3;
- (id)_itemsToUpdateForDiagnosticInfoUpdate;
- (id)_itemsToUpdateWhenApplicationDidBecomeActive;
- (id)_resetAccessory;
- (id)_restartAccessory;
- (id)_transformedUpdateOutcomeForItem:(id)a3 proposedOutcome:(id)a4;
- (id)controlAndCharacteristicStateItemModule:(id)a3 childItemsForItem:(id)a4;
- (id)controlAndCharacteristicStateItemModule:(id)a3 sectionFooterForControlPanelItem:(id)a4 forServiceItem:(id)a5;
- (id)controlAndCharacteristicStateItemModule:(id)a3 sectionTitleForControlPanelItem:(id)a4 forServiceItem:(id)a5;
- (id)hf_MediaAccessoryItem;
- (id)matterAccessory;
- (id)selectAssociatedServiceType:(id)a3;
- (id)selectRoom:(id)a3;
- (void)_didFinishUpdateTransactionWithAffectedItems:(id)a3;
- (void)_registerForExternalUpdates;
- (void)_setUpHomeTheaterItem;
- (void)_setUpManagedConfigurationProfilesItem;
- (void)_setupDeviceOptionsAdapterForMediaAccessoryItem:(id)a3;
- (void)_setupDeviceOptionsAdapterUtilityForGroupedAccessories:(id)a3;
- (void)_unregisterForExternalUpdates;
- (void)accessoryReachableOverRapport:(BOOL)a3;
- (void)didUpdateDiagnosticInfo:(id)a3 forAccessory:(id)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)registerKVO;
- (void)resetAccessory;
- (void)resetServiceLikeItemBuilder;
- (void)restartAccessory;
- (void)setAccessoryInfoItemProvider:(id)a3;
- (void)setAccessoryItem:(id)a3;
- (void)setAccessoryRepresentableItemModule:(id)a3;
- (void)setAccessoryResetAndRemoveItemProvider:(id)a3;
- (void)setAccessorySettingsItemModule:(id)a3;
- (void)setAccessorySettingsSections:(id)a3;
- (void)setAddGroupItem:(id)a3;
- (void)setAdvancedCameraSettingsSection:(id)a3;
- (void)setAlarmItem:(id)a3;
- (void)setAssociatedServiceTypeItem:(id)a3;
- (void)setAssociatedServiceTypeOptionItemProvider:(id)a3;
- (void)setAudioSettingsItem:(id)a3;
- (void)setCameraActivityZonesItem:(id)a3;
- (void)setCameraActivityZonesSections:(id)a3;
- (void)setCameraDoorbellChimeMuteItem:(id)a3;
- (void)setCameraFaceRecognitionItem:(id)a3;
- (void)setCameraNightModeItem:(id)a3;
- (void)setCameraNightModeSections:(id)a3;
- (void)setCameraRecordingOptionsItem:(id)a3;
- (void)setCameraStatusLightItem:(id)a3;
- (void)setCameraStatusLightSections:(id)a3;
- (void)setCharacteristicSections:(id)a3;
- (void)setCollectDiagnosticsItem:(id)a3;
- (void)setCollectDiagnosticsSections:(id)a3;
- (void)setConnectedServicesSections:(id)a3;
- (void)setContainedAccessoriesSections:(id)a3;
- (void)setCreateNewRoomItem:(id)a3;
- (void)setDeviceOptionsAdapter:(id)a3;
- (void)setDeviceOptionsAdapterUtility:(id)a3;
- (void)setDoorbellMuteSections:(id)a3;
- (void)setExistingRoomItemProvider:(id)a3;
- (void)setExportDiagnosticsItem:(id)a3;
- (void)setExportDiagnosticsItemProvider:(id)a3;
- (void)setFavoriteItem:(id)a3;
- (void)setFirmwareUpdateItemProvider:(id)a3;
- (void)setGroupedAccessoryReachableOverRapport:(BOOL)a3;
- (void)setHeaderItem:(id)a3;
- (void)setHomeKitAccessorySettingsModules:(id)a3;
- (void)setHomeKitAccessorySettingsSections:(id)a3;
- (void)setHomeManager:(id)a3;
- (void)setHomeMediaAccount:(id)a3;
- (void)setHomeTheaterAudioOutputItem:(id)a3;
- (void)setHomeTheaterAudioSections:(id)a3;
- (void)setIdentifyHomePodItem:(id)a3;
- (void)setInputSourceEditorSections:(id)a3;
- (void)setInputSourceItemModule:(id)a3;
- (void)setInternalDebuggingItem:(id)a3;
- (void)setLinkedApplicationItemProvider:(id)a3;
- (void)setLockAddHomeKeyToWalletItem:(id)a3;
- (void)setLockAddHomeKeyToWalletSections:(id)a3;
- (void)setLockPinCodesItem:(id)a3;
- (void)setManagedConfigurationProfilesItem:(id)a3;
- (void)setNameAndIconSections:(id)a3;
- (void)setNameModule:(id)a3;
- (void)setPairingModeItem:(id)a3;
- (void)setProgrammableSwitchItemModule:(id)a3;
- (void)setProgrammableSwitchSections:(id)a3;
- (void)setRelatedTriggerItemModule:(id)a3;
- (void)setRelatedTriggerSections:(id)a3;
- (void)setRemoveFromGroupItem:(id)a3;
- (void)setRemoveItem:(id)a3;
- (void)setResetItem:(id)a3;
- (void)setRestartItem:(id)a3;
- (void)setRoomItem:(id)a3;
- (void)setRoomListItem:(id)a3;
- (void)setSceneAndTriggerSections:(id)a3;
- (void)setSelectedRoomItemProvider:(id)a3;
- (void)setSeparateTileItem:(id)a3;
- (void)setServiceDetailsControlStateAndCharacteristicItemModule:(id)a3;
- (void)setServiceDetailsDelegate:(id)a3;
- (void)setServiceLikeBuilder:(id)a3;
- (void)setSettingsController:(id)a3;
- (void)setShouldHideAccessoryItem:(BOOL)a3;
- (void)setShouldHideSeparateTileItem:(BOOL)a3;
- (void)setShowAssociatedServiceTypeList:(BOOL)a3;
- (void)setShowContainedItems:(id)a3;
- (void)setShowInHomeDashboardItem:(id)a3;
- (void)setShowRoomsList:(BOOL)a3;
- (void)setSoftwareUpdateItemModule:(id)a3;
- (void)setSoftwareUpdateSections:(id)a3;
- (void)setSplitMediaAccountSections:(id)a3;
- (void)setSplitMediaAccountSignoutAccountItem:(id)a3;
- (void)setSplitMediaAccountTitleItem:(id)a3;
- (void)setSplitMediaAccountUseDefaultAccountItem:(id)a3;
- (void)setStaticItemProvider:(id)a3;
- (void)setStatusAndNotificationItem:(id)a3;
- (void)setSuggestedRoomItemProvider:(id)a3;
- (void)setSupportedVoiceRecognitionLanguages:(id)a3;
- (void)setTelevisionSettingsItemModule:(id)a3;
- (void)setTelevisionSettingsSections:(id)a3;
- (void)setValveEditorItemModule:(id)a3;
- (void)setValveEditorSections:(id)a3;
- (void)tearDown;
- (void)toggleAccessoryInfoItem:(id)a3;
- (void)unregisterKVO;
- (void)updateCameraNightMode:(BOOL)a3;
- (void)updateCameraStatusLight:(BOOL)a3;
- (void)updateDoorbellChimeMuteMode:(BOOL)a3;
@end

@implementation HUServiceDetailsItemManager

- (BOOL)isMatterAccessoryLikeItem
{
  v2 = self;
  v3 = [(HFItemManager *)v2 sourceItem];
  if (v3)
  {
    v4 = v3;
    sub_1BE9C2FD8();
    v5 = (void *)swift_dynamicCastClass();
    if (!v5) {
  }
    }
  else
  {
    v5 = 0;
  }

  return v5 != 0;
}

- (id)matterAccessory
{
  v2 = self;
  v3 = [(HFItemManager *)v2 sourceItem];
  if (v3)
  {
    v4 = (HUServiceDetailsItemManager *)v3;
    sub_1BE9C2FD8();
    if (swift_dynamicCastClass())
    {
      uint64_t v5 = sub_1BE9C2FA8();
      v6 = (void *)sub_1BE9C30D8();

      v2 = v4;
      v4 = (HUServiceDetailsItemManager *)v5;
    }
    else
    {
      v6 = 0;
    }

    v2 = v4;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (HUServiceDetailsItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4
{
  v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  v7 = NSStringFromSelector(sel_initWithServiceItem_delegate_);
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUServiceDetailsItemManager.m", 200, @"%s is unavailable; use %@ instead",
    "-[HUServiceDetailsItemManager initWithDelegate:sourceItem:]",
    v7);

  return 0;
}

- (HUServiceDetailsItemManager)initWithServiceItem:(id)a3 delegate:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = (void *)[v7 copy];
  v36.receiver = self;
  v36.super_class = (Class)HUServiceDetailsItemManager;
  v10 = [(HFItemManager *)&v36 initWithDelegate:v8 sourceItem:v9];

  if (v10)
  {
    objc_opt_class();
    id v11 = v7;
    if (objc_opt_isKindOfClass()) {
      v12 = v11;
    }
    else {
      v12 = 0;
    }
    id v13 = v12;

    if (v13)
    {
      v14 = [MEMORY[0x1E4F691A0] sharedDispatcher];
      [v14 addDiagnosticInfoObserver:v10];

      if ((_os_feature_enabled_impl() & 1) == 0) {
        NSLog(&cfstr_IfCoordination.isa);
      }
      if (([v13 isHomePod] & 1) != 0 || objc_msgSend(v13, "isHomePodMediaSystem")) {
        objc_msgSend(MEMORY[0x1E4F2EAC8], "hf_resetAllowlists");
      }
      v15 = [HUAccessorySettingsItemModule alloc];
      v4 = (void *)[v13 copy];
      v16 = [(HUAccessorySettingsItemModule *)v15 initWithItemUpdater:v10 mediaAccessoryItem:v4];
      [(HUServiceDetailsItemManager *)v10 setAccessorySettingsItemModule:v16];

      v10->_groupedAccessoryReachableOverRapport = 0;
      if ([(HUServiceDetailsItemManager *)v10 _isGroupedHomePod])
      {
        v17 = HFLogForCategory();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1BE345000, v17, OS_LOG_TYPE_DEFAULT, "Grouped HomePod", buf, 2u);
        }

        [(HUServiceDetailsItemManager *)v10 _setupDeviceOptionsAdapterUtilityForGroupedAccessories:v13];
      }
      else if ([(HUServiceDetailsItemManager *)v10 shouldShowDeviceOptionsForAccessoryItem:v13])
      {
        v18 = HFLogForCategory();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1BE345000, v18, OS_LOG_TYPE_DEFAULT, "Solo HomePod", buf, 2u);
        }

        [(HUServiceDetailsItemManager *)v10 _setupDeviceOptionsAdapterForMediaAccessoryItem:v13];
      }
    }
    v19 = [v11 home];
    v20 = v19;
    if (!v19)
    {
      v4 = [MEMORY[0x1E4F691A0] sharedDispatcher];
      v20 = [v4 home];
    }
    objc_storeStrong((id *)&v10->_overrideHome, v20);
    if (!v19)
    {
    }
    v21 = [v11 accessories];
    v22 = [v21 anyObject];

    v23 = objc_msgSend(v22, "hf_siriEndpointProfile");

    if (v23)
    {
      v24 = [MEMORY[0x1E4F691A0] sharedDispatcher];
      uint64_t v25 = [v24 homeManager];
      homeManager = v10->_homeManager;
      v10->_homeManager = (HMHomeManager *)v25;

      v27 = [MEMORY[0x1E4F691A0] sharedDispatcher];
      v28 = [v27 accessorySettingsDataSource];
      [v28 addObserver:v10];

      uint64_t v29 = [(HMHomeManager *)v10->_homeManager hf_accessorySettingsController];
      settingsController = v10->_settingsController;
      v10->_settingsController = (HMAccessorySettingsController *)v29;

      v31 = HFLogForCategory();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      {
        v33 = v10->_homeManager;
        v34 = [MEMORY[0x1E4F691A0] sharedDispatcher];
        v35 = [v34 accessorySettingsDataSource];
        *(_DWORD *)buf = 138412546;
        v38 = v33;
        __int16 v39 = 2112;
        v40 = v35;
        _os_log_debug_impl(&dword_1BE345000, v31, OS_LOG_TYPE_DEBUG, "Created Home Manager = [%@] and DataSource = [%@]", buf, 0x16u);
      }
    }
  }
  return v10;
}

- (id)_homeFuture
{
  v2 = (void *)MEMORY[0x1E4F7A0D8];
  v3 = [(HUServiceDetailsItemManager *)self overrideHome];
  v4 = [v2 futureWithResult:v3];

  return v4;
}

- (void)tearDown
{
  v3 = [MEMORY[0x1E4F691A0] sharedDispatcher];
  v4 = [v3 accessorySettingsDataSource];
  [v4 removeObserver:self];

  id v5 = [MEMORY[0x1E4F691A0] sharedDispatcher];
  [v5 removeDiagnosticInfoObserver:self];
}

- (void)_registerForExternalUpdates
{
  v4.receiver = self;
  v4.super_class = (Class)HUServiceDetailsItemManager;
  [(HFItemManager *)&v4 _registerForExternalUpdates];
  v3 = [(HUServiceDetailsItemManager *)self accessorySettingsItemModule];
  [v3 registerForExternalUpdates];
}

- (void)_unregisterForExternalUpdates
{
  v4.receiver = self;
  v4.super_class = (Class)HUServiceDetailsItemManager;
  [(HFItemManager *)&v4 _unregisterForExternalUpdates];
  v3 = [(HUServiceDetailsItemManager *)self accessorySettingsItemModule];
  [v3 unregisterForExternalUpdates];
}

- (BOOL)isItemGroup
{
  v2 = [(HUServiceDetailsItemManager *)self sourceServiceItem];
  if ([v2 conformsToProtocol:&unk_1F1A3D6E8]) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  id v4 = v3;

  char v5 = [v4 isItemGroup];
  return v5;
}

- (BOOL)isAccessory
{
  if ([(HUServiceDetailsItemManager *)self isItemGroup])
  {
    char isKindOfClass = 0;
  }
  else
  {
    id v4 = [(HUServiceDetailsItemManager *)self sourceServiceItem];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char isKindOfClass = 1;
    }
    else
    {
      char v5 = [(HUServiceDetailsItemManager *)self sourceServiceItem];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        char isKindOfClass = 1;
      }
      else
      {
        v6 = [(HUServiceDetailsItemManager *)self sourceServiceItem];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          char isKindOfClass = 1;
        }
        else
        {
          id v7 = [(HUServiceDetailsItemManager *)self sourceServiceItem];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            char isKindOfClass = 1;
          }
          else
          {
            id v8 = [(HUServiceDetailsItemManager *)self sourceServiceItem];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              char isKindOfClass = 1;
            }
            else
            {
              v9 = [(HUServiceDetailsItemManager *)self sourceServiceItem];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                char isKindOfClass = 1;
              }
              else
              {
                v10 = [(HUServiceDetailsItemManager *)self sourceServiceItem];
                objc_opt_class();
                char isKindOfClass = objc_opt_isKindOfClass();
              }
            }
          }
        }
      }
    }
  }
  return isKindOfClass & 1;
}

- (BOOL)sourceItemIsSingleServiceAccessory
{
  v2 = [(HUServiceDetailsItemManager *)self sourceItemAccessory];
  char v3 = objc_msgSend(v2, "hf_isSingleServiceAccessory");

  return v3;
}

- (BOOL)sourceItemIsService
{
  v2 = [(HUServiceDetailsItemManager *)self sourceServiceItem];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)sourceItemIsHomePod
{
  objc_opt_class();
  char v3 = [(HUServiceDetailsItemManager *)self sourceServiceItem];
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  if (v5)
  {
    if ([v5 isHomePod]) {
      char v6 = 1;
    }
    else {
      char v6 = [v5 isHomePodMediaSystem];
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (BOOL)sourceItemIsHomePodConfiguredForMultiUser
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  id v4 = [(HUServiceDetailsItemManager *)self sourceServiceItem];
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  if (v6
    && (([v6 isHomePod] & 1) != 0 || objc_msgSend(v6, "isHomePodMediaSystem"))
    && [v6 supportsMultiUser])
  {
    id v7 = HFLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v15 = NSStringFromSelector(a2);
      v16 = [(HUServiceDetailsItemManager *)self supportedVoiceRecognitionLanguages];
      v17 = [(HUServiceDetailsItemManager *)self supportedVoiceRecognitionLanguages];
      int v18 = 138413058;
      v19 = self;
      __int16 v20 = 2112;
      v21 = v15;
      __int16 v22 = 2112;
      v23 = v16;
      __int16 v24 = 2048;
      uint64_t v25 = [v17 count];
      _os_log_debug_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEBUG, "%@:%@ supported voice recognition languages %@ (%lu)", (uint8_t *)&v18, 0x2Au);
    }
    id v8 = (void *)MEMORY[0x1E4F692A8];
    v9 = [v6 mediaProfileContainer];
    v10 = [v8 siriLanguageOptionFor:v9];

    if (v10)
    {
      id v11 = [v10 recognitionLanguage];
      v12 = [(HUServiceDetailsItemManager *)self supportedVoiceRecognitionLanguages];
      char v13 = [v12 containsObject:v11];
    }
    else
    {
      char v13 = 0;
    }
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

- (void)setShowRoomsList:(BOOL)a3
{
  v11[4] = *MEMORY[0x1E4F143B8];
  if (self->_showRoomsList != a3)
  {
    self->_showRoomsList = a3;
    id v5 = [(HUServiceDetailsItemManager *)self staticItemProvider];
    v11[0] = v5;
    id v6 = [(HUServiceDetailsItemManager *)self existingRoomItemProvider];
    v11[1] = v6;
    id v7 = [(HUServiceDetailsItemManager *)self suggestedRoomItemProvider];
    v11[2] = v7;
    id v8 = [(HUServiceDetailsItemManager *)self selectedRoomItemProvider];
    v11[3] = v8;
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:4];

    id v10 = [(HFItemManager *)self reloadAndUpdateItemsForProviders:v9 senderSelector:a2];
  }
}

- (NSArray)orderedRoomSectionItems
{
  char v3 = objc_opt_new();
  id v4 = [(HUServiceDetailsItemManager *)self existingRoomItemProvider];
  id v5 = [v4 items];
  id v6 = [v5 allObjects];
  id v7 = [(HFItemManager *)self home];
  uint64_t v8 = objc_msgSend(v7, "hf_dashboardSectionReorderableItemComparator");
  v9 = (void *)v8;
  if (v8) {
    id v10 = (void *)v8;
  }
  else {
    id v10 = &__block_literal_global_256;
  }
  id v11 = [v6 sortedArrayUsingComparator:v10];

  [v3 addObjectsFromArray:v11];
  v12 = [(HUServiceDetailsItemManager *)self suggestedRoomItemProvider];
  char v13 = [v12 items];
  v14 = [v13 allObjects];
  v15 = [v14 sortedArrayUsingComparator:&__block_literal_global_256];

  [v3 addObjectsFromArray:v15];

  return (NSArray *)v3;
}

uint64_t __54__HUServiceDetailsItemManager_orderedRoomSectionItems__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = [v4 latestResults];
  uint64_t v7 = *MEMORY[0x1E4F68B38];
  uint64_t v8 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F68B38]];
  int v9 = [v8 BOOLValue];

  id v10 = [v5 latestResults];
  id v11 = [v10 objectForKeyedSubscript:v7];
  LODWORD(v8) = [v11 BOOLValue];

  if (v9 == v8)
  {
    char v13 = [v4 latestResults];
    uint64_t v14 = *MEMORY[0x1E4F68AB8];
    v15 = [v13 objectForKeyedSubscript:*MEMORY[0x1E4F68AB8]];

    v16 = [v5 latestResults];
    v17 = [v16 objectForKeyedSubscript:v14];

    uint64_t v12 = [v15 compare:v17];
  }
  else if (v9)
  {
    uint64_t v12 = -1;
  }
  else
  {
    uint64_t v12 = 1;
  }

  return v12;
}

- (void)setShowAssociatedServiceTypeList:(BOOL)a3
{
  v11[4] = *MEMORY[0x1E4F143B8];
  if (self->_showAssociatedServiceTypeList != a3)
  {
    self->_showAssociatedServiceTypeList = a3;
    id v5 = [(HUServiceDetailsItemManager *)self staticItemProvider];
    v11[0] = v5;
    id v6 = [(HUServiceDetailsItemManager *)self existingRoomItemProvider];
    v11[1] = v6;
    uint64_t v7 = [(HUServiceDetailsItemManager *)self suggestedRoomItemProvider];
    v11[2] = v7;
    uint64_t v8 = [(HUServiceDetailsItemManager *)self associatedServiceTypeOptionItemProvider];
    v11[3] = v8;
    int v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:4];
    id v10 = [(HFItemManager *)self reloadAndUpdateItemsForProviders:v9 senderSelector:a2];
  }
}

- (HFItem)selectedAssociatedServiceTypeItem
{
  id v4 = [(HUServiceDetailsItemManager *)self sourceServiceItem];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"HUServiceDetailsItemManager.m", 425, @"Invalid parameter not satisfying: %@", @"[self.sourceServiceItem isKindOfClass:[HFServiceItem class]]" object file lineNumber description];
  }
  id v6 = [(HUServiceDetailsItemManager *)self sourceServiceItem];
  uint64_t v7 = [v6 service];
  uint64_t v8 = [v7 associatedServiceType];
  int v9 = [v7 serviceType];
  id v10 = [(HUServiceDetailsItemManager *)self associatedServiceTypeOptionItemProvider];
  id v11 = [v10 items];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __64__HUServiceDetailsItemManager_selectedAssociatedServiceTypeItem__block_invoke;
  v17[3] = &unk_1E6387098;
  id v18 = v8;
  id v19 = v9;
  id v12 = v9;
  id v13 = v8;
  uint64_t v14 = objc_msgSend(v11, "na_firstObjectPassingTest:", v17);

  return (HFItem *)v14;
}

BOOL __64__HUServiceDetailsItemManager_selectedAssociatedServiceTypeItem__block_invoke(uint64_t a1, void *a2)
{
  char v3 = [a2 latestResults];
  id v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F68318]];

  BOOL v5 = ([v4 isEqualToString:*(void *)(a1 + 32)] & 1) != 0
    || !*(void *)(a1 + 32) && ([v4 isEqualToString:*(void *)(a1 + 40)] & 1) != 0;

  return v5;
}

- (void)setShouldHideAccessoryItem:(BOOL)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  self->_shouldHideAccessoryItem = a3;
  BOOL v5 = [(HUServiceDetailsItemManager *)self staticItemProvider];

  if (v5)
  {
    id v6 = [(HUServiceDetailsItemManager *)self staticItemProvider];
    v9[0] = v6;
    uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
    id v8 = [(HFItemManager *)self reloadAndUpdateItemsForProviders:v7 senderSelector:a2];
  }
}

- (HMAccessory)sourceItemAccessory
{
  char v3 = [(HFItemManager *)self sourceItem];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  id v5 = [(HFItemManager *)self sourceItem];
  if ((isKindOfClass & 1) != 0
    || (objc_opt_class(),
        char v6 = objc_opt_isKindOfClass(),
        v5,
        [(HFItemManager *)self sourceItem],
        id v5 = (id)objc_claimAutoreleasedReturnValue(),
        (v6 & 1) != 0))
  {
LABEL_17:
    __int16 v22 = v5;
LABEL_18:
    id v14 = [v22 accessory];
    goto LABEL_19;
  }
  objc_opt_class();
  char v7 = objc_opt_isKindOfClass();

  if (v7)
  {
    objc_opt_class();
    id v8 = [(HFItemManager *)self sourceItem];
    int v9 = [v8 homeKitObject];
    if (objc_opt_isKindOfClass()) {
      id v10 = v9;
    }
    else {
      id v10 = 0;
    }
    id v5 = v10;

    if (!v5)
    {
      objc_opt_class();
      id v11 = [(HFItemManager *)self sourceItem];
      id v12 = [v11 homeKitObject];
      if (objc_opt_isKindOfClass()) {
        id v13 = v12;
      }
      else {
        id v13 = 0;
      }
      id v14 = v13;

      goto LABEL_19;
    }
    goto LABEL_17;
  }
  v15 = [(HFItemManager *)self sourceItem];
  objc_opt_class();
  char v16 = objc_opt_isKindOfClass();

  id v5 = [(HFItemManager *)self sourceItem];
  if (v16) {
    goto LABEL_17;
  }
  objc_opt_class();
  char v17 = objc_opt_isKindOfClass();

  id v5 = [(HFItemManager *)self sourceItem];
  if (v17) {
    goto LABEL_17;
  }
  objc_opt_class();
  char v18 = objc_opt_isKindOfClass();

  id v19 = [(HFItemManager *)self sourceItem];
  id v5 = v19;
  if (v18)
  {
    __int16 v20 = [v19 service];
    id v14 = [v20 accessory];

LABEL_19:
    goto LABEL_20;
  }
  objc_opt_class();
  char v21 = objc_opt_isKindOfClass();

  id v5 = [(HFItemManager *)self sourceItem];
  if (v21) {
    goto LABEL_17;
  }
  objc_opt_class();
  char v24 = objc_opt_isKindOfClass();

  if (v24)
  {
    __int16 v22 = [(HFItemManager *)self sourceItem];
    id v5 = v22;
    goto LABEL_18;
  }
  if ([(HUServiceDetailsItemManager *)self isMatterAccessoryLikeItem])
  {
    id v14 = [(HUServiceDetailsItemManager *)self matterAccessory];
  }
  else
  {
    id v14 = 0;
  }
LABEL_20:

  return (HMAccessory *)v14;
}

- (HFHomeKitObject)sourceItemHomeKitObject
{
  char v3 = [(HUServiceDetailsItemManager *)self sourceItemAccessory];

  if (v3)
  {
    id v4 = [(HUServiceDetailsItemManager *)self sourceItemAccessory];
    goto LABEL_8;
  }
  id v5 = [(HFItemManager *)self sourceItem];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  char v7 = [(HFItemManager *)self sourceItem];
  id v8 = v7;
  if (isKindOfClass) {
    goto LABEL_6;
  }
  objc_opt_class();
  char v9 = objc_opt_isKindOfClass();

  if (v9)
  {
    char v7 = [(HFItemManager *)self sourceItem];
    id v8 = v7;
LABEL_6:
    id v4 = [v7 homeKitObject];

    goto LABEL_8;
  }
  id v4 = 0;
LABEL_8:

  return (HFHomeKitObject *)v4;
}

- (id)selectRoom:(id)a3
{
  id v5 = a3;
  char v6 = [(HUServiceDetailsItemManager *)self serviceLikeBuilder];
  [v6 setRoom:v5];

  char v7 = (void *)MEMORY[0x1E4F1CAD0];
  id v8 = [(HUServiceDetailsItemManager *)self roomItem];
  char v9 = [v7 setWithObject:v8];
  id v10 = [(HFItemManager *)self updateResultsForItems:v9 senderSelector:a2];

  id v11 = (void *)MEMORY[0x1E4F7A0D8];

  return (id)[v11 futureWithNoResult];
}

- (id)selectAssociatedServiceType:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = [(HUServiceDetailsItemManager *)self serviceLikeBuilder];
  if (v6)
  {
    if (objc_opt_isKindOfClass()) {
      char v7 = v6;
    }
    else {
      char v7 = 0;
    }
    id v8 = v6;
    if (v7) {
      goto LABEL_8;
    }
    char v9 = [MEMORY[0x1E4F28B00] currentHandler];
    id v10 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    [v9 handleFailureInFunction:v10, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v5, objc_opt_class() file lineNumber description];
  }
  id v8 = 0;
LABEL_8:

  [v8 setAssociatedServiceType:v4];
  id v11 = [v8 commitItem];

  return v11;
}

- (BOOL)isRoomItem:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CA80];
  id v5 = a3;
  id v6 = [v4 set];
  char v7 = [(HUServiceDetailsItemManager *)self existingRoomItemProvider];
  id v8 = [v7 items];
  [v6 unionSet:v8];

  char v9 = [(HUServiceDetailsItemManager *)self suggestedRoomItemProvider];
  id v10 = [v9 items];
  [v6 unionSet:v10];

  LOBYTE(v9) = [v6 containsObject:v5];
  return (char)v9;
}

- (BOOL)isCharacteristicStateItem:(id)a3
{
  id v4 = a3;
  id v5 = [(HUServiceDetailsItemManager *)self serviceDetailsControlStateAndCharacteristicItemModule];
  id v6 = [v5 characteristicStateItemProvider];
  char v7 = [v6 items];
  char v8 = [v7 containsObject:v4];

  return v8;
}

- (BOOL)isAccessoryInfoItem:(id)a3
{
  id v4 = a3;
  id v5 = [(HUServiceDetailsItemManager *)self accessoryInfoItemProvider];
  id v6 = [v5 items];
  char v7 = [v6 containsObject:v4];

  return v7;
}

- (BOOL)supportsWiFiStrengthDisplay:(id)a3
{
  id v4 = a3;
  id v5 = [(HUServiceDetailsItemManager *)self accessoryInfoItemProvider];
  char v6 = [v5 supportsWiFiStrengthDisplay:v4];

  return v6;
}

- (BOOL)canToggleAccessoryInfoItem:(id)a3
{
  id v4 = a3;
  id v5 = [(HUServiceDetailsItemManager *)self accessoryInfoItemProvider];
  char v6 = [v5 canToggleAccessoryInfoItem:v4];

  return v6;
}

- (void)toggleAccessoryInfoItem:(id)a3
{
  id v5 = a3;
  char v6 = [(HUServiceDetailsItemManager *)self accessoryInfoItemProvider];
  [v6 toggleAccessoryInfoItem:v5];

  char v7 = (void *)MEMORY[0x1E4F69230];
  char v8 = (void *)MEMORY[0x1E4F1CAD0];
  id v12 = [(HUServiceDetailsItemManager *)self accessoryInfoItemProvider];
  char v9 = [v8 setWithObject:v12];
  id v10 = [v7 requestToReloadItemProviders:v9 senderSelector:a2];
  id v11 = [(HFItemManager *)self performItemUpdateRequest:v10];
}

- (void)updateCameraStatusLight:(BOOL)a3
{
  BOOL v3 = a3;
  objc_opt_class();
  char v6 = [(HFItemManager *)self sourceItem];
  if (objc_opt_isKindOfClass()) {
    char v7 = v6;
  }
  else {
    char v7 = 0;
  }
  id v8 = v7;

  if (v8)
  {
    char v9 = [(HUServiceDetailsItemManager *)self cameraStatusLightItem];
    id v10 = [v9 updateUserSettingsWithValue:v3];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __55__HUServiceDetailsItemManager_updateCameraStatusLight___block_invoke;
    v12[3] = &unk_1E6391068;
    id v13 = v8;
    id v14 = self;
    SEL v15 = a2;
    id v11 = (id)[v10 addCompletionBlock:v12];
  }
}

void __55__HUServiceDetailsItemManager_updateCameraStatusLight___block_invoke(void *a1, uint64_t a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = HFLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = a1[4];
      int v14 = 138412546;
      uint64_t v15 = v6;
      __int16 v16 = 2112;
      id v17 = v4;
      _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "Failed to update camera status light for camera: '%@' error:%@", (uint8_t *)&v14, 0x16u);
    }
  }
  char v7 = (void *)a1[5];
  id v8 = (void *)MEMORY[0x1E4F69230];
  char v9 = (void *)MEMORY[0x1E4F1CAD0];
  id v10 = [v7 staticItemProvider];
  id v11 = [v9 setWithObject:v10];
  id v12 = [v8 requestToReloadItemProviders:v11 senderSelector:a1[6]];
  id v13 = (id)[v7 performItemUpdateRequest:v12];
}

- (void)updateCameraNightMode:(BOOL)a3
{
  BOOL v3 = a3;
  objc_opt_class();
  uint64_t v6 = [(HFItemManager *)self sourceItem];
  if (objc_opt_isKindOfClass()) {
    char v7 = v6;
  }
  else {
    char v7 = 0;
  }
  id v8 = v7;

  if (v8)
  {
    char v9 = [(HUServiceDetailsItemManager *)self cameraNightModeItem];
    id v10 = [v9 updateUserSettingsWithValue:v3];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __53__HUServiceDetailsItemManager_updateCameraNightMode___block_invoke;
    v12[3] = &unk_1E6391068;
    id v13 = v8;
    int v14 = self;
    SEL v15 = a2;
    id v11 = (id)[v10 addCompletionBlock:v12];
  }
}

void __53__HUServiceDetailsItemManager_updateCameraNightMode___block_invoke(void *a1, uint64_t a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = HFLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = a1[4];
      int v14 = 138412546;
      uint64_t v15 = v6;
      __int16 v16 = 2112;
      id v17 = v4;
      _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "Failed to update night mode for camera: '%@' error:%@", (uint8_t *)&v14, 0x16u);
    }
  }
  char v7 = (void *)a1[5];
  id v8 = (void *)MEMORY[0x1E4F69230];
  char v9 = (void *)MEMORY[0x1E4F1CAD0];
  id v10 = [v7 staticItemProvider];
  id v11 = [v9 setWithObject:v10];
  id v12 = [v8 requestToReloadItemProviders:v11 senderSelector:a1[6]];
  id v13 = (id)[v7 performItemUpdateRequest:v12];
}

- (void)updateDoorbellChimeMuteMode:(BOOL)a3
{
  BOOL v3 = a3;
  objc_opt_class();
  id v5 = [(HUServiceDetailsItemManager *)self sourceServiceItem];
  if (objc_opt_isKindOfClass()) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = v6;

  id v8 = [v7 profile];

  objc_msgSend(v8, "hf_updateDoorbellChime:", v3);
}

- (id)_buildItemModulesForHome:(id)a3
{
  v88[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_opt_new();
  uint64_t v6 = [(HFItemManager *)self sourceItem];
  if ([v6 conformsToProtocol:&unk_1F1A3D5D8])
  {
    id v7 = [(HUServiceDetailsItemManager *)self sourceItemHomeKitObject];

    if (v7)
    {
      id v8 = [(HFItemManager *)self sourceItem];
      char v9 = [v8 serviceLikeBuilderInHome:v4];
      [(HUServiceDetailsItemManager *)self setServiceLikeBuilder:v9];

      id v10 = [HUNameItemModule alloc];
      id v11 = [(HFItemManager *)self sourceItem];
      id v12 = [(HUServiceDetailsItemManager *)self serviceLikeBuilder];
      id v13 = [(HUNameItemModule *)v10 initWithItemUpdater:self sourceServiceLikeItem:v11 itemBuilder:v12];
      [(HUServiceDetailsItemManager *)self setNameModule:v13];

      int v14 = [(HUServiceDetailsItemManager *)self nameModule];
      [v5 addObject:v14];

      if ([(HUServiceDetailsItemManager *)self _shouldShowContainedAccessoriesList])
      {
        uint64_t v15 = [(HUServiceDetailsItemManager *)self sourceServiceItem];
        __int16 v16 = &unk_1F1A3D3B8;
        if ([v15 conformsToProtocol:v16]) {
          id v17 = v15;
        }
        else {
          id v17 = 0;
        }
        id v18 = v17;

        id v19 = objc_alloc_init(HUAccessoryRepresentableItemModuleContext);
        [(HUAccessoryRepresentableItemModuleContext *)v19 setObjectLevel:4];
        [(HUAccessoryRepresentableItemModuleContext *)v19 setSectionGroupingType:0];
        v81[0] = MEMORY[0x1E4F143A8];
        v81[1] = 3221225472;
        v81[2] = __56__HUServiceDetailsItemManager__buildItemModulesForHome___block_invoke;
        v81[3] = &unk_1E63871B0;
        id v82 = v18;
        id v20 = v18;
        [(HUAccessoryRepresentableItemModuleContext *)v19 setFilter:v81];
        char v21 = [[HUAccessoryRepresentableItemModule alloc] initWithContext:v19 in:v4 itemUpdater:self];
        [(HUServiceDetailsItemManager *)self setAccessoryRepresentableItemModule:v21];

        __int16 v22 = [(HUServiceDetailsItemManager *)self accessoryRepresentableItemModule];
        [v5 addObject:v22];
      }
      objc_opt_class();
      v23 = [(HUServiceDetailsItemManager *)self sourceServiceItem];
      if (objc_opt_isKindOfClass()) {
        char v24 = v23;
      }
      else {
        char v24 = 0;
      }
      uint64_t v25 = v24;

      if (![(HUServiceDetailsItemManager *)self sourceItemIsService]
        || ([v25 service],
            uint64_t v26 = objc_claimAutoreleasedReturnValue(),
            [v26 accessory],
            v27 = objc_claimAutoreleasedReturnValue(),
            int v28 = objc_msgSend(v27, "hf_isSingleServiceAccessory"),
            v27,
            v26,
            v28))
      {
        uint64_t v29 = [HUAssociatedSceneAndTriggerModule alloc];
        v30 = [(HUServiceDetailsItemManager *)self sourceServiceItem];
        v31 = [(HUAssociatedSceneAndTriggerModule *)v29 initWithItemUpdater:self home:v4 serviceLikeItem:v30 context:1];
        sceneAndTriggerModule = self->_sceneAndTriggerModule;
        self->_sceneAndTriggerModule = v31;

        v33 = [(HUServiceDetailsItemManager *)self sceneAndTriggerModule];
        [v5 addObject:v33];
      }
      v34 = [(HUServiceDetailsItemManager *)self sourceItemAccessory];
      int v35 = [v34 supportsCHIP];

      if (v35)
      {
        objc_super v36 = [HUMatterConnectedServicesItemModule alloc];
        v37 = [(HUServiceDetailsItemManager *)self sourceItemAccessory];
        v38 = [(HUMatterConnectedServicesItemModule *)v36 initWithItemUpdater:self accessory:v37];
        connectedServicesItemModule = self->_connectedServicesItemModule;
        self->_connectedServicesItemModule = v38;

        v40 = [(HUServiceDetailsItemManager *)self connectedServicesItemModule];
        [v5 addObject:v40];
      }
      uint64_t v41 = [(HUServiceDetailsItemManager *)self sourceServiceItem];

      if (v41)
      {
        v42 = [(HUServiceDetailsItemManager *)self sourceServiceItem];
        v88[0] = v42;
        v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:v88 count:1];

        v44 = +[HUAvailableRelatedTriggerItemModule defaultContext];
        [v44 setAnalyticsPresentationContext:@"serviceDetails"];
        v45 = [[HUAvailableRelatedTriggerItemModule alloc] initWithItems:v43 itemUpdater:self home:v4 context:v44];
        relatedTriggerItemModule = self->_relatedTriggerItemModule;
        self->_relatedTriggerItemModule = v45;

        v47 = [(HUServiceDetailsItemManager *)self relatedTriggerItemModule];
        [v5 addObject:v47];
      }
      v48 = HFLogForCategory();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
      {
        v78 = [(HUServiceDetailsItemManager *)self sourceItemAccessory];
        objc_msgSend(v78, "hf_siriEndpointProfile");
        v49 = (char *)objc_claimAutoreleasedReturnValue();
        v50 = [(HUServiceDetailsItemManager *)self sourceItemAccessory];
        v51 = v25;
        v52 = v5;
        id v53 = v4;
        int v54 = objc_msgSend(v50, "hf_needsOnboarding");
        v55 = [(HUServiceDetailsItemManager *)self sourceItemAccessory];
        v56 = objc_msgSend(v55, "hf_siriEndpointProfile");
        int v57 = [v56 supportsOnboarding];
        *(_DWORD *)buf = 138412802;
        v84 = v49;
        __int16 v85 = 1024;
        *(_DWORD *)v86 = v54;
        id v4 = v53;
        id v5 = v52;
        uint64_t v25 = v51;
        *(_WORD *)&v86[4] = 1024;
        *(_DWORD *)&v86[6] = v57;
        _os_log_impl(&dword_1BE345000, v48, OS_LOG_TYPE_DEFAULT, "SiriEndPoint Profile:[%@] needsOnboarding:[%{BOOL}d] supportsOnboarding:[%{BOOL}d]", buf, 0x18u);
      }
      v58 = [(HUServiceDetailsItemManager *)self sourceItemAccessory];
      uint64_t v59 = objc_msgSend(v58, "hf_siriEndpointProfile");
      if (v59)
      {
        v60 = (void *)v59;
        v61 = [(HUServiceDetailsItemManager *)self sourceItemAccessory];
        v62 = objc_msgSend(v61, "hf_siriEndpointProfile");
        int v63 = [v62 supportsOnboarding];

        if (!v63)
        {
LABEL_26:
          id v72 = v5;
          goto LABEL_31;
        }
        v58 = objc_msgSend(MEMORY[0x1E4F68E90], "hf_accessorySettingsDictionary");
        v64 = objc_msgSend(MEMORY[0x1E4F68E90], "hf_groupKeyPaths");
        v65 = [(HFItemManager *)self sourceItem];
        v66 = [(HUServiceDetailsItemManager *)self settingsController];
        v67 = +[HUAccessorySettingsUtilities generateModulesFromSettingsDictionary:v58 itemUpdater:self home:v4 sourceItem:v65 usageOptions:0 settingsController:v66];
        [(HUServiceDetailsItemManager *)self setHomeKitAccessorySettingsModules:v67];

        v68 = [(HUServiceDetailsItemManager *)self homeKitAccessorySettingsModules];
        v79[0] = MEMORY[0x1E4F143A8];
        v79[1] = 3221225472;
        v79[2] = __56__HUServiceDetailsItemManager__buildItemModulesForHome___block_invoke_203;
        v79[3] = &unk_1E638E5C8;
        id v80 = v64;
        id v69 = v64;
        v70 = [v68 sortedArrayUsingComparator:v79];
        [(HUServiceDetailsItemManager *)self setHomeKitAccessorySettingsModules:v70];

        v71 = HFLogForCategory();
        if (os_log_type_enabled(v71, OS_LOG_TYPE_DEBUG))
        {
          v75 = [(HUServiceDetailsItemManager *)self sourceItemAccessory];
          objc_msgSend(v75, "hf_siriEndpointProfile");
          v76 = (char *)objc_claimAutoreleasedReturnValue();
          v77 = [(HUServiceDetailsItemManager *)self homeKitAccessorySettingsModules];
          *(_DWORD *)buf = 138412802;
          v84 = v76;
          __int16 v85 = 2112;
          *(void *)v86 = v58;
          *(_WORD *)&v86[8] = 2112;
          v87 = v77;
          _os_log_debug_impl(&dword_1BE345000, v71, OS_LOG_TYPE_DEBUG, "Found Siri EndPoint Profile [%@]. settingsDict = [%@] Generated homeKitAccessorySettingsModules = [%@]", buf, 0x20u);
        }
      }

      goto LABEL_26;
    }
  }
  else
  {
  }
  uint64_t v25 = HFLogForCategory();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    v73 = [(HFItemManager *)self sourceItem];
    *(_DWORD *)buf = 136315394;
    v84 = "-[HUServiceDetailsItemManager _buildItemModulesForHome:]";
    __int16 v85 = 2112;
    *(void *)v86 = v73;
    _os_log_impl(&dword_1BE345000, v25, OS_LOG_TYPE_DEFAULT, "%s: Unexpected sourceItem: %@", buf, 0x16u);
  }
  id v72 = (id)MEMORY[0x1E4F1CBF0];
LABEL_31:

  return v72;
}

uint64_t __56__HUServiceDetailsItemManager__buildItemModulesForHome___block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = objc_msgSend(a2, "hf_containedProfiles");
  id v4 = objc_msgSend(v3, "na_map:", &__block_literal_global_195_0);

  id v5 = [*(id *)(a1 + 32) accessories];
  uint64_t v6 = [v4 intersectsSet:v5];

  return v6;
}

uint64_t __56__HUServiceDetailsItemManager__buildItemModulesForHome___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 accessory];
}

uint64_t __56__HUServiceDetailsItemManager__buildItemModulesForHome___block_invoke_203(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = [a2 settingGroupKeyPath];
  unint64_t v8 = [v5 indexOfObject:v7];

  char v9 = *(void **)(a1 + 32);
  id v10 = [v6 settingGroupKeyPath];

  unint64_t v11 = [v9 indexOfObject:v10];
  if (v8 > v11) {
    return 1;
  }
  else {
    return -1;
  }
}

- (void)resetServiceLikeItemBuilder
{
  id v4 = [(HFItemManager *)self sourceItem];
  int v5 = [v4 conformsToProtocol:&unk_1F1A3D5D8];

  if (v5)
  {
    id v6 = [(HFItemManager *)self sourceItem];
    id v7 = [(HFItemManager *)self home];
    unint64_t v8 = [v6 serviceLikeBuilderInHome:v7];
    [(HUServiceDetailsItemManager *)self setServiceLikeBuilder:v8];

    [(HFItemManager *)self resetItemProvidersAndModules];
    id v9 = [(HFItemManager *)self reloadAndUpdateAllItemsFromSenderSelector:a2];
  }
}

- (id)_buildItemProvidersForHome:(id)a3
{
  v345[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v304 = [MEMORY[0x1E4F1CA48] array];
  v302 = [MEMORY[0x1E4F1CA48] array];
  objc_initWeak(&location, self);
  int v5 = [(HFItemManager *)self sourceItem];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v7 = [HUServiceDetailsProgrammableSwitchItemModule alloc];
    unint64_t v8 = [(HUServiceDetailsItemManager *)self sourceServiceItem];
    id v9 = [(HUServiceDetailsItemModule *)v7 initWithItemUpdater:self home:v4 sourceItem:v8];
    [(HUServiceDetailsItemManager *)self setProgrammableSwitchItemModule:v9];
  }
  id v10 = [(HFItemManager *)self sourceItem];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
  }
  else
  {
    unint64_t v11 = [(HFItemManager *)self sourceItem];
    objc_opt_class();
    char v12 = objc_opt_isKindOfClass();

    if ((v12 & 1) == 0) {
      goto LABEL_7;
    }
  }
  id v13 = [HUValveItemModule alloc];
  int v14 = [(HUServiceDetailsItemManager *)self sourceServiceItem];
  uint64_t v15 = [(HUChildServiceEditorItemModule *)v13 initWithItemUpdater:self home:v4 sourceItem:v14 mode:1];
  [(HUServiceDetailsItemManager *)self setValveEditorItemModule:v15];

LABEL_7:
  __int16 v16 = [(HFItemManager *)self sourceItem];
  objc_opt_class();
  char v17 = objc_opt_isKindOfClass();

  if (v17)
  {
    id v18 = [HUInputSourceItemModule alloc];
    id v19 = [(HUServiceDetailsItemManager *)self sourceServiceItem];
    id v20 = [(HUChildServiceEditorItemModule *)v18 initWithItemUpdater:self home:v4 sourceItem:v19 mode:0];
    [(HUServiceDetailsItemManager *)self setInputSourceItemModule:v20];

    char v21 = [HUTelevisionSettingsItemModule alloc];
    __int16 v22 = [(HUServiceDetailsItemManager *)self sourceItemAccessory];
    v23 = [(HUTelevisionSettingsItemModule *)v21 initWithItemUpdater:self home:v4 accessory:v22];
    [(HUServiceDetailsItemManager *)self setTelevisionSettingsItemModule:v23];
  }
  if ([(HUServiceDetailsItemManager *)self _shouldShowAccessoryInfoItems])
  {
    id v24 = objc_alloc(MEMORY[0x1E4F68E00]);
    uint64_t v25 = [(HFItemManager *)self home];
    uint64_t v26 = [(HUServiceDetailsItemManager *)self sourceItemAccessory];
    v27 = (void *)[v24 initWithHome:v25 accessory:v26];
    [(HUServiceDetailsItemManager *)self setAccessoryInfoItemProvider:v27];
  }
  int v28 = [(HUServiceDetailsItemManager *)self sourceItemHomeKitObject];
  uint64_t v29 = (uint64_t *)MEMORY[0x1E4F68AB8];
  if (v28)
  {
    int v30 = HFPreferencesInternalDebuggingEnabled();

    if (v30)
    {
      id v31 = objc_alloc(MEMORY[0x1E4F695C0]);
      uint64_t v344 = *v29;
      v345[0] = @"Internal Debugging";
      v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v345 forKeys:&v344 count:1];
      v33 = (void *)[v31 initWithResults:v32];
      [(HUServiceDetailsItemManager *)self setInternalDebuggingItem:v33];
    }
  }
  [(HUServiceDetailsItemManager *)self _setUpHomeTheaterItem];
  [(HUServiceDetailsItemManager *)self _setUpManagedConfigurationProfilesItem];
  objc_opt_class();
  id v34 = [(HUServiceDetailsItemManager *)self serviceLikeBuilder];
  if (objc_opt_isKindOfClass()) {
    int v35 = v34;
  }
  else {
    int v35 = 0;
  }
  id v301 = v35;

  objc_opt_class();
  id v36 = [(HUServiceDetailsItemManager *)self serviceLikeBuilder];
  if (objc_opt_isKindOfClass()) {
    v37 = v36;
  }
  else {
    v37 = 0;
  }
  id v283 = v37;

  if (!v301)
  {
    if (v283)
    {
      v38 = [v283 accessory];
      __int16 v39 = objc_msgSend(v38, "hf_categoryOrPrimaryServiceType");
      if ([v39 isEqualToString:*MEMORY[0x1E4F2C1D0]])
      {
      }
      else
      {
        v40 = [v283 accessory];
        char v41 = objc_msgSend(v40, "hf_isSiriEndpoint");

        if ((v41 & 1) == 0)
        {
          id v280 = objc_alloc(MEMORY[0x1E4F68DB0]);
          v42 = objc_msgSend(v4, "hf_characteristicValueManager");
          v287 = (void *)[v280 initWithAccessoryBuilder:v283 valueSource:v42];
          goto LABEL_27;
        }
      }
    }
    v42 = [(HFItemManager *)self sourceItem];
    v287 = (void *)[v42 copy];
LABEL_27:

    goto LABEL_28;
  }
  v287 = (void *)[objc_alloc(MEMORY[0x1E4F69528]) initWithServiceBuilder:v301];
LABEL_28:
  v43 = (void *)[objc_alloc(MEMORY[0x1E4F696A8]) initWithSourceItem:v287 transformationBlock:&__block_literal_global_224];
  [(HUServiceDetailsItemManager *)self setHeaderItem:v43];

  v44 = [(HUServiceDetailsItemManager *)self loggedInMediaAccountOnHomePod];
  v45 = [v44 username];
  v286 = HULocalizedStringWithFormat(@"HUServiceDetailsSplitAccountDescription", @"%@", v46, v47, v48, v49, v50, v51, (uint64_t)v45);

  id v52 = objc_alloc(MEMORY[0x1E4F695C0]);
  uint64_t v53 = *v29;
  v342[0] = v53;
  int v54 = _HULocalizedStringWithDefaultValue(@"HUServiceDetailsSplitAccountTitle", @"HUServiceDetailsSplitAccountTitle", 1);
  v342[1] = *MEMORY[0x1E4F68980];
  v343[0] = v54;
  v343[1] = v286;
  v55 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v343 forKeys:v342 count:2];
  v56 = (void *)[v52 initWithResults:v55];
  [(HUServiceDetailsItemManager *)self setSplitMediaAccountTitleItem:v56];

  id v57 = objc_alloc(MEMORY[0x1E4F695C0]);
  uint64_t v340 = v53;
  v58 = _HULocalizedStringWithDefaultValue(@"HUServiceDetailsSplitAccountUseAsDefaultAccount_Button_Title", @"HUServiceDetailsSplitAccountUseAsDefaultAccount_Button_Title", 1);
  v341 = v58;
  uint64_t v59 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v341 forKeys:&v340 count:1];
  v60 = (void *)[v57 initWithResults:v59];
  [(HUServiceDetailsItemManager *)self setSplitMediaAccountUseDefaultAccountItem:v60];

  id v61 = objc_alloc(MEMORY[0x1E4F695C0]);
  uint64_t v338 = v53;
  v62 = _HULocalizedStringWithDefaultValue(@"HUServiceDetailsSplitAccountSignOut_Button_Title", @"HUServiceDetailsSplitAccountSignOut_Button_Title", 1);
  v339 = v62;
  int v63 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v339 forKeys:&v338 count:1];
  v64 = (void *)[v61 initWithResults:v63];
  [(HUServiceDetailsItemManager *)self setSplitMediaAccountSignoutAccountItem:v64];

  id v65 = objc_alloc(MEMORY[0x1E4F695C0]);
  uint64_t v336 = v53;
  v66 = _HULocalizedStringWithDefaultValue(@"HUServiceDetailsCreateNewRoomTitle", @"HUServiceDetailsCreateNewRoomTitle", 1);
  v337 = v66;
  v67 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v337 forKeys:&v336 count:1];
  v68 = (void *)[v65 initWithResults:v67];
  [(HUServiceDetailsItemManager *)self setCreateNewRoomItem:v68];

  id v69 = objc_alloc_init(MEMORY[0x1E4F695C0]);
  [(HUServiceDetailsItemManager *)self setRoomListItem:v69];

  v70 = [HUServiceDetailsShowContainedItemsInGroupItem alloc];
  v71 = [(HUServiceDetailsItemManager *)self sourceServiceItem];
  id v72 = [(HUServiceDetailsAbstractItem *)v70 initWithSourceServiceItem:v71 home:v4];
  [(HUServiceDetailsItemManager *)self setShowContainedItems:v72];

  v73 = [HUServiceDetailsAddGroupItem alloc];
  v74 = [(HUServiceDetailsItemManager *)self sourceServiceItem];
  v75 = [(HUServiceDetailsAbstractItem *)v73 initWithSourceServiceItem:v74 home:v4];
  [(HUServiceDetailsItemManager *)self setAddGroupItem:v75];

  v76 = [HUServiceDetailsIdentifyHomePodItem alloc];
  v77 = [(HUServiceDetailsItemManager *)self sourceServiceItem];
  v78 = [(HUServiceDetailsAbstractItem *)v76 initWithSourceServiceItem:v77 home:v4];
  [(HUServiceDetailsItemManager *)self setIdentifyHomePodItem:v78];

  if (![(HUServiceDetailsItemManager *)self isItemGroup]
    && ![(HUServiceDetailsItemManager *)self isAccessory])
  {
    objc_opt_class();
    v79 = [(HUServiceDetailsItemManager *)self sourceServiceItem];
    id v80 = [v79 homeKitObject];
    if (objc_opt_isKindOfClass()) {
      v81 = v80;
    }
    else {
      v81 = 0;
    }
    id v82 = v81;

    id v83 = objc_alloc(MEMORY[0x1E4F68F10]);
    v84 = [v82 serviceType];
    __int16 v85 = [(HFItemManager *)self home];
    v86 = (void *)[v83 initWithService:v82 serviceType:v84 home:v85];
    [(HUServiceDetailsItemManager *)self setAssociatedServiceTypeOptionItemProvider:v86];
  }
  v87 = [HUServiceDetailsSeparateTileItem alloc];
  v88 = [(HUServiceDetailsItemManager *)self sourceServiceItem];
  v89 = [(HUServiceDetailsAbstractItem *)v87 initWithSourceServiceItem:v88 home:v4];
  [(HUServiceDetailsItemManager *)self setSeparateTileItem:v89];

  v90 = [(HUServiceDetailsItemManager *)self serviceLikeBuilder];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __58__HUServiceDetailsItemManager__buildItemProvidersForHome___block_invoke_2;
  aBlock[3] = &unk_1E638A188;
  id v282 = v90;
  id v325 = v282;
  v91 = _Block_copy(aBlock);
  v322[0] = MEMORY[0x1E4F143A8];
  v322[1] = 3221225472;
  v322[2] = __58__HUServiceDetailsItemManager__buildItemProvidersForHome___block_invoke_3;
  v322[3] = &unk_1E6385F78;
  id v92 = v4;
  id v323 = v92;
  v93 = _Block_copy(v322);
  id v94 = objc_alloc(MEMORY[0x1E4F694F0]);
  v95 = [(HUServiceDetailsItemManager *)self serviceLikeBuilder];
  v96 = (void *)[v94 initWithHome:v92 serviceLikeBuilder:v95];
  [(HUServiceDetailsItemManager *)self setSelectedRoomItemProvider:v96];

  v320[0] = MEMORY[0x1E4F143A8];
  v320[1] = 3221225472;
  v320[2] = __58__HUServiceDetailsItemManager__buildItemProvidersForHome___block_invoke_4;
  v320[3] = &unk_1E63910B0;
  id v285 = v93;
  id v321 = v285;
  v97 = [(HUServiceDetailsItemManager *)self selectedRoomItemProvider];
  [v97 setFilter:v320];

  v303 = (void *)[objc_alloc(MEMORY[0x1E4F69488]) initWithHome:v92];
  [v303 setFilter:v285];
  id v98 = objc_alloc(MEMORY[0x1E4F696B0]);
  v316[0] = MEMORY[0x1E4F143A8];
  v316[1] = 3221225472;
  v316[2] = __58__HUServiceDetailsItemManager__buildItemProvidersForHome___block_invoke_5;
  v316[3] = &unk_1E6391100;
  objc_copyWeak(&v319, &location);
  id v281 = v91;
  id v318 = v281;
  id v305 = v92;
  id v317 = v305;
  v99 = (void *)[v98 initWithSourceProvider:v303 transformationBlock:v316];
  [(HUServiceDetailsItemManager *)self setExistingRoomItemProvider:v99];

  v284 = (void *)[objc_alloc(MEMORY[0x1E4F69498]) initWithHome:v305];
  id v100 = objc_alloc(MEMORY[0x1E4F696B0]);
  v314[0] = MEMORY[0x1E4F143A8];
  v314[1] = 3221225472;
  v314[2] = __58__HUServiceDetailsItemManager__buildItemProvidersForHome___block_invoke_7;
  v314[3] = &unk_1E6391150;
  objc_copyWeak(&v315, &location);
  v101 = (void *)[v100 initWithSourceProvider:v284 transformationBlock:v314];
  [(HUServiceDetailsItemManager *)self setSuggestedRoomItemProvider:v101];

  v102 = [HUServiceDetailsRoomItem alloc];
  v103 = [(HUServiceDetailsItemManager *)self sourceServiceItem];
  v104 = [(HUServiceDetailsItemManager *)self serviceLikeBuilder];
  v105 = [(HUServiceDetailsRoomItem *)v102 initWithSourceServiceItem:v103 home:v305 serviceLikeBuilder:v104];
  [(HUServiceDetailsItemManager *)self setRoomItem:v105];

  v106 = [HUServiceDetailsAssociatedServiceTypeItem alloc];
  v107 = [(HUServiceDetailsItemManager *)self sourceServiceItem];
  v108 = [(HUServiceDetailsAbstractItem *)v106 initWithSourceServiceItem:v107 home:v305];
  [(HUServiceDetailsItemManager *)self setAssociatedServiceTypeItem:v108];

  v109 = [HUIncludedContextItem alloc];
  v110 = [(HUServiceDetailsItemManager *)self sourceServiceItem];
  v111 = [v110 homeKitObject];
  v112 = [(HUIncludedContextItem *)v109 initWithHomeKitObject:v111 contextType:3 home:v305];
  [(HUServiceDetailsItemManager *)self setShowInHomeDashboardItem:v112];

  v113 = [HUIncludedContextItem alloc];
  v114 = [(HUServiceDetailsItemManager *)self sourceServiceItem];
  v115 = [v114 homeKitObject];
  v116 = [(HUIncludedContextItem *)v113 initWithHomeKitObject:v115 contextType:2 home:v305];
  [(HUServiceDetailsItemManager *)self setFavoriteItem:v116];

  v117 = [HUServiceDetailsPairingModeItem alloc];
  v118 = [(HUServiceDetailsItemManager *)self sourceServiceItem];
  v119 = [(HUServiceDetailsAbstractItem *)v117 initWithSourceServiceItem:v118 home:v305];
  [(HUServiceDetailsItemManager *)self setPairingModeItem:v119];

  v120 = [HUServiceDetailsExportDiagnosticsItem alloc];
  v121 = [(HUServiceDetailsItemManager *)self sourceServiceItem];
  v122 = [(HUServiceDetailsAbstractItem *)v120 initWithSourceServiceItem:v121 home:v305];
  [(HUServiceDetailsItemManager *)self setExportDiagnosticsItem:v122];

  v123 = [HUServiceDetailsRemoveItem alloc];
  v124 = [(HUServiceDetailsItemManager *)self sourceServiceItem];
  v125 = [(HUServiceDetailsAbstractItem *)v123 initWithSourceServiceItem:v124 home:v305];
  [(HUServiceDetailsItemManager *)self setRemoveItem:v125];

  v126 = [HUServiceDetailsRemoveFromGroupItem alloc];
  v127 = [(HUServiceDetailsItemManager *)self sourceServiceItem];
  v128 = [(HUServiceDetailsAbstractItem *)v126 initWithSourceServiceItem:v127 home:v305];
  [(HUServiceDetailsItemManager *)self setRemoveFromGroupItem:v128];

  v129 = [HUServiceDetailsResetAccessoryItem alloc];
  v130 = [(HUServiceDetailsItemManager *)self sourceServiceItem];
  v131 = [(HUServiceDetailsAbstractItem *)v129 initWithSourceServiceItem:v130 home:v305];
  [(HUServiceDetailsItemManager *)self setResetItem:v131];

  v132 = [HUServiceDetailsRestartAccessoriesItem alloc];
  v133 = [(HUServiceDetailsItemManager *)self sourceServiceItem];
  v134 = [(HUServiceDetailsAbstractItem *)v132 initWithSourceServiceItem:v133 home:v305];
  [(HUServiceDetailsItemManager *)self setRestartItem:v134];

  v135 = [HUServiceDetailsAudioSettingsItem alloc];
  v136 = [(HUServiceDetailsItemManager *)self sourceServiceItem];
  v137 = [(HUServiceDetailsAbstractItem *)v135 initWithSourceServiceItem:v136 home:v305];
  [(HUServiceDetailsItemManager *)self setAudioSettingsItem:v137];

  v138 = [(HUServiceDetailsItemManager *)self sourceItemAccessory];
  if (objc_msgSend(v138, "hf_isVisibleAsBridgedAccessory"))
  {

    goto LABEL_36;
  }
  v143 = [(HUServiceDetailsItemManager *)self sourceItemAccessory];
  if ((objc_msgSend(v143, "hf_isVisibleAsBridge") & 1) == 0)
  {

    goto LABEL_41;
  }
  v144 = [(HUServiceDetailsItemManager *)self sourceItemAccessory];
  char v145 = objc_msgSend(v144, "hf_isPureBridge");

  if ((v145 & 1) == 0)
  {
LABEL_36:
    id v139 = objc_alloc(MEMORY[0x1E4F695C0]);
    uint64_t v334 = v53;
    v140 = _HULocalizedStringWithDefaultValue(@"HUServiceDetailsBridgeTitle", @"HUServiceDetailsBridgeTitle", 1);
    v335 = v140;
    v141 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v335 forKeys:&v334 count:1];
    v142 = (void *)[v139 initWithResults:v141];
    [(HUServiceDetailsItemManager *)self setAccessoryItem:v142];

    v138 = [(HUServiceDetailsItemManager *)self accessoryItem];
    [v304 addObject:v138];
LABEL_41:
  }
  v146 = [HUServiceDetailsLockPinCodesItem alloc];
  v147 = [(HUServiceDetailsItemManager *)self sourceServiceItem];
  v148 = [(HUServiceDetailsAbstractItem *)v146 initWithSourceServiceItem:v147 home:v305];
  [(HUServiceDetailsItemManager *)self setLockPinCodesItem:v148];

  v149 = [HUServiceDetailsLockAddHomeKeyToWalletItem alloc];
  v150 = [(HUServiceDetailsItemManager *)self sourceServiceItem];
  v151 = [(HUServiceDetailsAbstractItem *)v149 initWithSourceServiceItem:v150 home:v305];
  [(HUServiceDetailsItemManager *)self setLockAddHomeKeyToWalletItem:v151];

  v152 = [HUServiceDetailsStatusAndNotificationItem alloc];
  v153 = [(HUServiceDetailsItemManager *)self sourceServiceItem];
  v154 = [(HUServiceDetailsAbstractItem *)v152 initWithSourceServiceItem:v153 home:v305];
  [(HUServiceDetailsItemManager *)self setStatusAndNotificationItem:v154];

  v155 = [HUServiceDetailsCameraActivityZonesItem alloc];
  v156 = [(HUServiceDetailsItemManager *)self sourceServiceItem];
  v157 = [(HUServiceDetailsAbstractItem *)v155 initWithSourceServiceItem:v156 home:v305];
  [(HUServiceDetailsItemManager *)self setCameraActivityZonesItem:v157];

  v158 = [HUServiceDetailsCameraStatusLightItem alloc];
  v159 = [(HUServiceDetailsItemManager *)self sourceServiceItem];
  v160 = [(HUServiceDetailsAbstractItem *)v158 initWithSourceServiceItem:v159 home:v305];
  [(HUServiceDetailsItemManager *)self setCameraStatusLightItem:v160];

  v161 = [HUServiceDetailsCameraNightModeItem alloc];
  v162 = [(HUServiceDetailsItemManager *)self sourceServiceItem];
  v163 = [(HUServiceDetailsAbstractItem *)v161 initWithSourceServiceItem:v162 home:v305];
  [(HUServiceDetailsItemManager *)self setCameraNightModeItem:v163];

  v164 = [HUServiceDetailsCameraDoorbellChimeMuteItem alloc];
  v165 = [(HUServiceDetailsItemManager *)self sourceServiceItem];
  v166 = [(HUServiceDetailsAbstractItem *)v164 initWithSourceServiceItem:v165 home:v305];
  [(HUServiceDetailsItemManager *)self setCameraDoorbellChimeMuteItem:v166];

  objc_opt_class();
  id v167 = [(HUServiceDetailsItemManager *)self sourceServiceItem];
  if (objc_opt_isKindOfClass()) {
    v168 = v167;
  }
  else {
    v168 = 0;
  }
  id v300 = v168;

  v169 = [v300 profile];
  int v170 = objc_msgSend(v169, "hf_supportsRecordingEvents");

  if (objc_msgSend(v305, "hf_currentUserIsAdministrator")) {
    int v171 = objc_msgSend(v305, "hf_currentUserIsOwner") ^ 1;
  }
  else {
    int v171 = 0;
  }
  int v172 = objc_msgSend(v305, "hf_hasResidentDeviceCapableOfSupportingEnhancedDetectionModes");
  id v173 = objc_alloc(MEMORY[0x1E4F695C0]);
  v332[0] = v53;
  v174 = _HULocalizedStringWithDefaultValue(@"HUServiceDetailsRecordingOptionsDisplayTitle", @"HUServiceDetailsRecordingOptionsDisplayTitle", 1);
  v333[0] = v174;
  uint64_t v175 = *MEMORY[0x1E4F68B10];
  v332[1] = *MEMORY[0x1E4F68B10];
  v176 = [NSNumber numberWithBool:v170 ^ 1u];
  v333[1] = v176;
  v332[2] = *MEMORY[0x1E4F68A08];
  v177 = [NSNumber numberWithBool:v171 & (v172 ^ 1u)];
  v332[3] = *MEMORY[0x1E4F68928];
  v333[2] = v177;
  v333[3] = @"AccessoryDetails.RecordingOptions";
  v178 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v333 forKeys:v332 count:4];
  v179 = (void *)[v173 initWithResults:v178];
  [(HUServiceDetailsItemManager *)self setCameraRecordingOptionsItem:v179];

  v180 = [v305 currentUser];
  v181 = [v305 homeAccessControlForUser:v180];
  uint64_t v182 = [v181 camerasAccessLevel];

  if ([MEMORY[0x1E4F69758] isPressDemoModeEnabled]) {
    int v183 = 1;
  }
  else {
    int v183 = [MEMORY[0x1E4F69758] isRunningInStoreDemoMode];
  }
  if (objc_msgSend(v305, "hf_isFaceRecognitionAvailable"))
  {
    v184 = [v300 profile];
    int v185 = objc_msgSend(v184, "hf_supportsRecordingEvents");

    uint64_t v186 = ((v182 != 2) | ~v185) & (v183 ^ 1u);
  }
  else
  {
    uint64_t v186 = v183 ^ 1u;
  }
  id v187 = objc_alloc(MEMORY[0x1E4F695C0]);
  v330[0] = v53;
  v188 = _HULocalizedStringWithDefaultValue(@"HUServiceDetailsCameraFaceRecognitionDisplayTitle", @"HUServiceDetailsCameraFaceRecognitionDisplayTitle", 1);
  uint64_t v189 = *MEMORY[0x1E4F68AC0];
  v331[0] = v188;
  v331[1] = @"HUServiceDetailsCameraFaceRecognitionDisplayTitle";
  v330[1] = v189;
  v330[2] = v175;
  v190 = [NSNumber numberWithBool:v186];
  v331[2] = v190;
  v330[3] = *MEMORY[0x1E4F68A70];
  v191 = [NSNumber numberWithInt:v183 ^ 1u];
  v331[3] = v191;
  v192 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v331 forKeys:v330 count:4];
  v193 = (void *)[v187 initWithResults:v192];
  [(HUServiceDetailsItemManager *)self setCameraFaceRecognitionItem:v193];

  v194 = [(HFItemManager *)self home];
  LODWORD(v191) = objc_msgSend(v194, "hf_currentUserIsAdministrator");

  if (v191)
  {
    v195 = [HUServiceDetailsCollectDiagnosticsItem alloc];
    v196 = [(HUServiceDetailsItemManager *)self sourceServiceItem];
    v197 = [(HUServiceDetailsAbstractItem *)v195 initWithSourceServiceItem:v196 home:v305];
    [(HUServiceDetailsItemManager *)self setCollectDiagnosticsItem:v197];
  }
  v299 = [(HUServiceDetailsItemManager *)self headerItem];
  v329[0] = v299;
  v298 = [(HUServiceDetailsItemManager *)self splitMediaAccountTitleItem];
  v329[1] = v298;
  v297 = [(HUServiceDetailsItemManager *)self splitMediaAccountUseDefaultAccountItem];
  v329[2] = v297;
  v296 = [(HUServiceDetailsItemManager *)self splitMediaAccountSignoutAccountItem];
  v329[3] = v296;
  v295 = [(HUServiceDetailsItemManager *)self createNewRoomItem];
  v329[4] = v295;
  v294 = [(HUServiceDetailsItemManager *)self showContainedItems];
  v329[5] = v294;
  v293 = [(HUServiceDetailsItemManager *)self addGroupItem];
  v329[6] = v293;
  v292 = [(HUServiceDetailsItemManager *)self identifyHomePodItem];
  v329[7] = v292;
  v291 = [(HUServiceDetailsItemManager *)self separateTileItem];
  v329[8] = v291;
  v290 = [(HUServiceDetailsItemManager *)self roomItem];
  v329[9] = v290;
  v289 = [(HUServiceDetailsItemManager *)self roomListItem];
  v329[10] = v289;
  v288 = [(HUServiceDetailsItemManager *)self associatedServiceTypeItem];
  v329[11] = v288;
  v198 = [(HUServiceDetailsItemManager *)self statusAndNotificationItem];
  v329[12] = v198;
  v199 = [(HUServiceDetailsItemManager *)self audioSettingsItem];
  v329[13] = v199;
  v200 = [(HUServiceDetailsItemManager *)self cameraStatusLightItem];
  v329[14] = v200;
  v201 = [(HUServiceDetailsItemManager *)self cameraNightModeItem];
  v329[15] = v201;
  v202 = [(HUServiceDetailsItemManager *)self cameraDoorbellChimeMuteItem];
  v329[16] = v202;
  v203 = [(HUServiceDetailsItemManager *)self cameraRecordingOptionsItem];
  v329[17] = v203;
  v204 = [(HUServiceDetailsItemManager *)self cameraFaceRecognitionItem];
  v329[18] = v204;
  v205 = [(HUServiceDetailsItemManager *)self cameraActivityZonesItem];
  v329[19] = v205;
  v206 = [MEMORY[0x1E4F1C978] arrayWithObjects:v329 count:20];
  [v304 addObjectsFromArray:v206];

  v207 = [(HUServiceDetailsItemManager *)self removeFromGroupItem];
  v328[0] = v207;
  v208 = [(HUServiceDetailsItemManager *)self removeItem];
  v328[1] = v208;
  v209 = [(HUServiceDetailsItemManager *)self resetItem];
  v328[2] = v209;
  v210 = [(HUServiceDetailsItemManager *)self restartItem];
  v328[3] = v210;
  v211 = [MEMORY[0x1E4F1C978] arrayWithObjects:v328 count:4];
  [v302 addObjectsFromArray:v211];

  v212 = [(HUServiceDetailsItemManager *)self alarmItem];
  objc_msgSend(v304, "na_safeAddObject:", v212);

  v213 = [(HUServiceDetailsItemManager *)self homeTheaterAudioOutputItem];
  objc_msgSend(v304, "na_safeAddObject:", v213);

  v214 = [(HUServiceDetailsItemManager *)self showInHomeDashboardItem];
  objc_msgSend(v304, "na_safeAddObject:", v214);

  v215 = [(HUServiceDetailsItemManager *)self favoriteItem];
  objc_msgSend(v304, "na_safeAddObject:", v215);

  v216 = [(HUServiceDetailsItemManager *)self managedConfigurationProfilesItem];
  objc_msgSend(v304, "na_safeAddObject:", v216);

  v217 = [(HUServiceDetailsItemManager *)self lockPinCodesItem];
  objc_msgSend(v304, "na_safeAddObject:", v217);

  v218 = [(HUServiceDetailsItemManager *)self lockAddHomeKeyToWalletItem];
  objc_msgSend(v304, "na_safeAddObject:", v218);

  v219 = [(HUServiceDetailsItemManager *)self pairingModeItem];
  objc_msgSend(v304, "na_safeAddObject:", v219);

  v220 = [(HUServiceDetailsItemManager *)self collectDiagnosticsItem];
  objc_msgSend(v304, "na_safeAddObject:", v220);

  v221 = [(HUServiceDetailsItemManager *)self internalDebuggingItem];
  objc_msgSend(v304, "na_safeAddObject:", v221);

  id v222 = objc_alloc(MEMORY[0x1E4F695C8]);
  v223 = [MEMORY[0x1E4F1CAD0] setWithArray:v304];
  v224 = (void *)[v222 initWithItems:v223];
  [(HUServiceDetailsItemManager *)self setStaticItemProvider:v224];

  id v225 = objc_alloc(MEMORY[0x1E4F695C8]);
  v226 = [MEMORY[0x1E4F1CAD0] setWithArray:v302];
  v227 = (void *)[v225 initWithItems:v226];
  [(HUServiceDetailsItemManager *)self setAccessoryResetAndRemoveItemProvider:v227];

  id v228 = objc_alloc(MEMORY[0x1E4F695C8]);
  v229 = (void *)MEMORY[0x1E4F1CAD0];
  v230 = [(HUServiceDetailsItemManager *)self exportDiagnosticsItem];
  v231 = [v229 setWithObject:v230];
  v232 = (void *)[v228 initWithItems:v231];
  [(HUServiceDetailsItemManager *)self setExportDiagnosticsItemProvider:v232];

  v233 = [HUServiceDetailsControlAndCharacteristicStateItemModule alloc];
  v234 = [(HFItemManager *)self sourceItem];
  v235 = [(HUServiceDetailsControlAndCharacteristicStateItemModule *)v233 initWithItemUpdater:self home:v305 sourceItem:v234 delegate:self];
  [(HUServiceDetailsItemManager *)self setServiceDetailsControlStateAndCharacteristicItemModule:v235];

  v236 = [(HFItemManager *)self sourceItem];
  LODWORD(v235) = [v236 conformsToProtocol:&unk_1F1A3D3B8];

  if (v235)
  {
    v237 = [HUSoftwareUpdateItemModule alloc];
    v238 = [(HFItemManager *)self sourceItem];
    v239 = [(HUSoftwareUpdateItemModule *)v237 initWithItemUpdater:self home:v305 sourceItem:v238];
    [(HUServiceDetailsItemManager *)self setSoftwareUpdateItemModule:v239];
  }
  v240 = [[HULinkedApplicationItemProvider alloc] initWithHome:v305];
  [(HUServiceDetailsItemManager *)self setLinkedApplicationItemProvider:v240];

  v312[0] = MEMORY[0x1E4F143A8];
  v312[1] = 3221225472;
  v312[2] = __58__HUServiceDetailsItemManager__buildItemProvidersForHome___block_invoke_9;
  v312[3] = &unk_1E6391178;
  objc_copyWeak(&v313, &location);
  v241 = [(HUServiceDetailsItemManager *)self linkedApplicationItemProvider];
  [v241 setFilter:v312];

  v242 = [[HUFirmwareUpdateItemProvider alloc] initWithHome:v305 style:1];
  [(HUServiceDetailsItemManager *)self setFirmwareUpdateItemProvider:v242];

  v310[0] = MEMORY[0x1E4F143A8];
  v310[1] = 3221225472;
  v310[2] = __58__HUServiceDetailsItemManager__buildItemProvidersForHome___block_invoke_10;
  v310[3] = &unk_1E6391178;
  objc_copyWeak(&v311, &location);
  v243 = [(HUServiceDetailsItemManager *)self firmwareUpdateItemProvider];
  [v243 setFilter:v310];

  v244 = (void *)MEMORY[0x1E4F1CA80];
  v245 = [(HUServiceDetailsItemManager *)self staticItemProvider];
  v246 = [v244 setWithObject:v245];

  v247 = [(HUServiceDetailsItemManager *)self exportDiagnosticsItemProvider];
  objc_msgSend(v246, "na_safeAddObject:", v247);

  v248 = [(HUServiceDetailsItemManager *)self accessoryResetAndRemoveItemProvider];
  objc_msgSend(v246, "na_safeAddObject:", v248);

  v249 = [(HUServiceDetailsItemManager *)self accessoryInfoItemProvider];
  objc_msgSend(v246, "na_safeAddObject:", v249);

  v250 = [(HUServiceDetailsItemManager *)self associatedServiceTypeOptionItemProvider];
  objc_msgSend(v246, "na_safeAddObject:", v250);

  v251 = [(HUServiceDetailsItemManager *)self existingRoomItemProvider];
  objc_msgSend(v246, "na_safeAddObject:", v251);

  v252 = [(HUServiceDetailsItemManager *)self suggestedRoomItemProvider];
  objc_msgSend(v246, "na_safeAddObject:", v252);

  v253 = [(HUServiceDetailsItemManager *)self linkedApplicationItemProvider];
  objc_msgSend(v246, "na_safeAddObject:", v253);

  v254 = [(HUServiceDetailsItemManager *)self firmwareUpdateItemProvider];
  objc_msgSend(v246, "na_safeAddObject:", v254);

  v255 = [MEMORY[0x1E4F1CA80] set];
  v256 = [(HUServiceDetailsItemManager *)self programmableSwitchItemModule];
  v257 = [v256 itemProviders];
  [v255 unionSet:v257];

  v258 = [(HUServiceDetailsItemManager *)self serviceDetailsControlStateAndCharacteristicItemModule];
  v259 = [v258 itemProviders];
  [v255 unionSet:v259];

  v260 = [(HUServiceDetailsItemManager *)self accessorySettingsItemModule];
  v261 = [v260 itemProviders];
  [v255 unionSet:v261];

  long long v308 = 0u;
  long long v309 = 0u;
  long long v306 = 0u;
  long long v307 = 0u;
  v262 = [(HUServiceDetailsItemManager *)self homeKitAccessorySettingsModules];
  uint64_t v263 = [v262 countByEnumeratingWithState:&v306 objects:v327 count:16];
  if (v263)
  {
    uint64_t v264 = *(void *)v307;
    do
    {
      for (uint64_t i = 0; i != v263; ++i)
      {
        if (*(void *)v307 != v264) {
          objc_enumerationMutation(v262);
        }
        v266 = [*(id *)(*((void *)&v306 + 1) + 8 * i) itemProviders];
        [v255 unionSet:v266];
      }
      uint64_t v263 = [v262 countByEnumeratingWithState:&v306 objects:v327 count:16];
    }
    while (v263);
  }

  v267 = [(HUServiceDetailsItemManager *)self softwareUpdateItemModule];

  if (v267)
  {
    v268 = [(HUServiceDetailsItemManager *)self softwareUpdateItemModule];
    v269 = [v268 itemProviders];
    [v255 unionSet:v269];
  }
  v270 = [(HUServiceDetailsItemManager *)self valveEditorItemModule];
  v271 = [v270 itemProviders];
  [v255 unionSet:v271];

  v272 = [(HUServiceDetailsItemManager *)self televisionSettingsItemModule];
  v273 = [v272 itemProviders];
  [v255 unionSet:v273];

  v274 = [(HUServiceDetailsItemManager *)self inputSourceItemModule];
  v275 = [v274 itemProviders];
  [v255 unionSet:v275];

  v276 = [(HUServiceDetailsItemManager *)self debugAccessoryItemModule];
  v277 = [v276 itemProviders];
  [v255 unionSet:v277];

  [v246 unionSet:v255];
  v278 = [v246 allObjects];

  objc_destroyWeak(&v311);
  objc_destroyWeak(&v313);

  objc_destroyWeak(&v315);
  objc_destroyWeak(&v319);

  objc_destroyWeak(&location);

  return v278;
}

id __58__HUServiceDetailsItemManager__buildItemProvidersForHome___block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)[a2 mutableCopy];
  [v2 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:*MEMORY[0x1E4F68B10]];
  BOOL v3 = (void *)[v2 copy];

  return v3;
}

uint64_t __58__HUServiceDetailsItemManager__buildItemProvidersForHome___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) room];
  int v5 = [v4 room];
  id v6 = [v5 uniqueIdentifier];

  if (v6) {
    uint64_t v7 = [v3 isEqual:v6];
  }
  else {
    uint64_t v7 = 0;
  }

  return v7;
}

BOOL __58__HUServiceDetailsItemManager__buildItemProvidersForHome___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    int v5 = v4;
  }
  else {
    int v5 = 0;
  }
  id v6 = v5;

  uint64_t v7 = [v6 uniqueIdentifier];
  unint64_t v8 = [*(id *)(a1 + 32) roomForEntireHome];
  id v9 = [v8 uniqueIdentifier];
  int v10 = [v7 isEqual:v9];

  if (v10)
  {
    unint64_t v11 = [v6 accessories];
    BOOL v12 = [v11 count] != 0;
  }
  else
  {
    BOOL v12 = 1;
  }

  return v12;
}

uint64_t __58__HUServiceDetailsItemManager__buildItemProvidersForHome___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 room];
  if (v4)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = [v3 room];
    uint64_t v7 = (*(uint64_t (**)(uint64_t, void *))(v5 + 16))(v5, v6);
  }
  else
  {
    uint64_t v7 = 1;
  }

  return v7;
}

id __58__HUServiceDetailsItemManager__buildItemProvidersForHome___block_invoke_5(id *a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc(MEMORY[0x1E4F696A8]);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __58__HUServiceDetailsItemManager__buildItemProvidersForHome___block_invoke_6;
  v8[3] = &unk_1E63910D8;
  objc_copyWeak(&v12, a1 + 6);
  id v5 = v3;
  id v9 = v5;
  id v11 = a1[5];
  id v10 = a1[4];
  id v6 = (void *)[v4 initWithSourceItem:v5 transformationBlock:v8];

  objc_destroyWeak(&v12);

  return v6;
}

id __58__HUServiceDetailsItemManager__buildItemProvidersForHome___block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 56);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  id v6 = (void *)[v4 mutableCopy];
  uint64_t v7 = NSNumber;
  unint64_t v8 = [*(id *)(a1 + 32) room];
  id v9 = [v8 uniqueIdentifier];
  id v10 = [WeakRetained home];
  id v11 = [v10 roomForEntireHome];
  id v12 = [v11 uniqueIdentifier];
  id v13 = objc_msgSend(v7, "numberWithBool:", objc_msgSend(v9, "isEqual:", v12));
  [v6 setObject:v13 forKeyedSubscript:*MEMORY[0x1E4F68B38]];

  int v14 = NSNumber;
  uint64_t v15 = *(void *)(a1 + 48);
  __int16 v16 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F68BE8]];

  char v17 = objc_msgSend(v14, "numberWithBool:", (*(uint64_t (**)(uint64_t, void *))(v15 + 16))(v15, v16));
  [v6 setObject:v17 forKeyedSubscript:*MEMORY[0x1E4F68B40]];

  id v18 = objc_alloc(MEMORY[0x1E4F69478]);
  id v19 = [*(id *)(a1 + 32) room];
  id v20 = (void *)[v18 initWithExistingObject:v19 inHome:*(void *)(a1 + 40)];
  [v6 setObject:v20 forKeyedSubscript:*MEMORY[0x1E4F68BE0]];

  return v6;
}

id __58__HUServiceDetailsItemManager__buildItemProvidersForHome___block_invoke_7(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc(MEMORY[0x1E4F696A8]);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__HUServiceDetailsItemManager__buildItemProvidersForHome___block_invoke_8;
  v7[3] = &unk_1E6391128;
  objc_copyWeak(&v8, (id *)(a1 + 32));
  id v5 = (void *)[v4 initWithSourceItem:v3 transformationBlock:v7];
  objc_destroyWeak(&v8);

  return v5;
}

id __58__HUServiceDetailsItemManager__buildItemProvidersForHome___block_invoke_8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)[v3 mutableCopy];
  id v5 = NSNumber;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v7 = [WeakRetained serviceLikeBuilder];
  id v8 = [v7 room];
  id v9 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F68BE0]];

  id v10 = objc_msgSend(v5, "numberWithBool:", objc_msgSend(v8, "isEqual:", v9));
  [v4 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4F68B40]];

  return v4;
}

uint64_t __58__HUServiceDetailsItemManager__buildItemProvidersForHome___block_invoke_9(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained isItemGroup])
  {
    uint64_t v5 = 0;
  }
  else
  {
    objc_opt_class();
    id v6 = [WeakRetained sourceServiceItem];
    if (objc_opt_isKindOfClass()) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = 0;
    }
    id v8 = v7;

    if (v8
      && ([v8 accessory],
          id v9 = objc_claimAutoreleasedReturnValue(),
          char v10 = objc_msgSend(v9, "hf_isBridge"),
          int v11 = [v9 isEqual:v3],
          v9,
          v11)
      && (v10 & 1) != 0)
    {
      uint64_t v5 = 1;
    }
    else
    {
      id v12 = [WeakRetained sourceServiceItem];
      id v13 = [v12 accessories];

      uint64_t v5 = [v13 containsObject:v3];
    }
  }
  return v5;
}

uint64_t __58__HUServiceDetailsItemManager__buildItemProvidersForHome___block_invoke_10(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  uint64_t v5 = [WeakRetained sourceServiceItem];
  id v6 = [v5 accessories];
  uint64_t v7 = [v6 containsObject:v3];

  return v7;
}

- (void)_setUpHomeTheaterItem
{
  objc_initWeak(&location, self);
  id v3 = objc_alloc(MEMORY[0x1E4F695C0]);
  uint64_t v5 = MEMORY[0x1E4F143A8];
  uint64_t v6 = 3221225472;
  uint64_t v7 = __52__HUServiceDetailsItemManager__setUpHomeTheaterItem__block_invoke;
  id v8 = &unk_1E6384FD0;
  objc_copyWeak(&v9, &location);
  id v4 = (void *)[v3 initWithResultsBlock:&v5];
  -[HUServiceDetailsItemManager setHomeTheaterAudioOutputItem:](self, "setHomeTheaterAudioOutputItem:", v4, v5, v6, v7, v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

id __52__HUServiceDetailsItemManager__setUpHomeTheaterItem__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_msgSend(WeakRetained, "hf_MediaAccessoryItem");
  id v3 = v2;
  if (v2
    && [v2 mediaAccessoryItemType] == 1
    && ([v3 mediaProfileContainer],
        id v4 = objc_claimAutoreleasedReturnValue(),
        int v5 = objc_msgSend(v4, "hf_supportsHomeTheater"),
        v4,
        v5))
  {
    uint64_t v6 = [v3 mediaProfileContainer];
    uint64_t v7 = objc_msgSend(v6, "hf_backingAccessory");

    if (v7)
    {
      _HULocalizedStringWithDefaultValue(@"HUServiceDetailsAudioOutputTitle", @"HUServiceDetailsAudioOutputTitle", 1);
      id v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      id v9 = [v7 audioDestinationController];
      char v10 = [v9 destination];
      int v11 = [v10 audioDestinationName];

      if (v11)
      {
        id v12 = [v9 destination];
        id v13 = [v12 audioDestinationName];
      }
      else
      {
        _HULocalizedStringWithDefaultValue(@"HUHomeTheaterSettings_DefaultOutput", @"HUHomeTheaterSettings_DefaultOutput", 1);
        id v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }

      uint64_t v14 = 0;
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v13 = &stru_1F18F92B8;
  uint64_t v14 = 1;
  id v8 = &stru_1F18F92B8;
LABEL_9:
  uint64_t v15 = [MEMORY[0x1E4F1CA60] dictionary];
  [v15 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];
  [v15 setObject:v13 forKeyedSubscript:*MEMORY[0x1E4F68980]];
  __int16 v16 = [NSNumber numberWithBool:v14];
  [v15 setObject:v16 forKeyedSubscript:*MEMORY[0x1E4F68B10]];

  char v17 = objc_msgSend(MEMORY[0x1E4F1CAD0], "na_setWithSafeObject:", v7);
  [v15 setObject:v17 forKeyedSubscript:*MEMORY[0x1E4F68908]];

  id v18 = [MEMORY[0x1E4F7A0D8] futureWithResult:v15];

  return v18;
}

- (void)_setUpManagedConfigurationProfilesItem
{
  objc_initWeak(&location, self);
  id v3 = objc_alloc(MEMORY[0x1E4F695C0]);
  uint64_t v5 = MEMORY[0x1E4F143A8];
  uint64_t v6 = 3221225472;
  uint64_t v7 = __69__HUServiceDetailsItemManager__setUpManagedConfigurationProfilesItem__block_invoke;
  id v8 = &unk_1E6384FD0;
  objc_copyWeak(&v9, &location);
  id v4 = (void *)[v3 initWithResultsBlock:&v5];
  -[HUServiceDetailsItemManager setManagedConfigurationProfilesItem:](self, "setManagedConfigurationProfilesItem:", v4, v5, v6, v7, v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

id __69__HUServiceDetailsItemManager__setUpManagedConfigurationProfilesItem__block_invoke(uint64_t a1)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained sourceItemAccessory];
  int v3 = [v2 supportsManagedConfigurationProfile];

  id v4 = (void *)MEMORY[0x1E4F7A0D8];
  if (v3)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __69__HUServiceDetailsItemManager__setUpManagedConfigurationProfilesItem__block_invoke_2;
    v10[3] = &unk_1E6388BE0;
    v10[4] = WeakRetained;
    uint64_t v5 = [MEMORY[0x1E4F7A0D8] futureWithCompletionHandlerAdapterBlock:v10];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    void v9[2] = __69__HUServiceDetailsItemManager__setUpManagedConfigurationProfilesItem__block_invoke_3;
    v9[3] = &unk_1E6385620;
    v9[4] = WeakRetained;
    uint64_t v6 = [v5 flatMap:v9];
    uint64_t v7 = [v6 recover:&__block_literal_global_320];
  }
  else
  {
    uint64_t v11 = *MEMORY[0x1E4F68B10];
    v12[0] = MEMORY[0x1E4F1CC38];
    uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
    uint64_t v7 = [v4 futureWithResult:v5];
  }

  return v7;
}

void __69__HUServiceDetailsItemManager__setUpManagedConfigurationProfilesItem__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 sourceItemAccessory];
  [v4 fetchManagedConfigurationProfilesWithCompletionHandler:v3];
}

id __69__HUServiceDetailsItemManager__setUpManagedConfigurationProfilesItem__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = (void *)MEMORY[0x1E4F1CA60];
  id v4 = a2;
  uint64_t v5 = [v3 dictionary];
  uint64_t v6 = _HULocalizedStringWithDefaultValue(@"HUManagedConfigurationProfilesTitle", @"HUManagedConfigurationProfilesTitle", 1);
  [v5 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];

  uint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", objc_msgSend(v4, "count"));
  [v5 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F68980]];

  id v8 = NSNumber;
  uint64_t v9 = [v4 count];

  char v10 = [v8 numberWithInt:v9 == 0];
  [v5 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4F68B10]];

  uint64_t v11 = (void *)MEMORY[0x1E4F1CAD0];
  id v12 = [*(id *)(a1 + 32) sourceItemAccessory];
  id v13 = objc_msgSend(v11, "na_setWithSafeObject:", v12);
  [v5 setObject:v13 forKeyedSubscript:*MEMORY[0x1E4F68908]];

  uint64_t v14 = [MEMORY[0x1E4F7A0D8] futureWithResult:v5];

  return v14;
}

id __69__HUServiceDetailsItemManager__setUpManagedConfigurationProfilesItem__block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = HFLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v2;
    _os_log_error_impl(&dword_1BE345000, v3, OS_LOG_TYPE_ERROR, "Error fetching profiles %@]", buf, 0xCu);
  }

  id v4 = (void *)MEMORY[0x1E4F7A0D8];
  uint64_t v8 = *MEMORY[0x1E4F68B10];
  uint64_t v9 = MEMORY[0x1E4F1CC38];
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  uint64_t v6 = [v4 futureWithResult:v5];

  return v6;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  v278[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (![v5 count])
  {
    id v195 = (id)MEMORY[0x1E4F1CBF0];
    goto LABEL_111;
  }
  aSelector = a2;
  uint64_t v6 = [(HUServiceDetailsItemManager *)self serviceDetailsControlStateAndCharacteristicItemModule];
  uint64_t v7 = [v6 buildSectionsWithDisplayedItems:v5];

  uint64_t v8 = +[HUServiceDetailsItemModule serviceDetailsItemSectionComparatorForSortStrategy:@"HUServiceDetailsItemModuleSortStrategyDefault"];
  v235 = v7;
  uint64_t v9 = [v7 sortedArrayUsingComparator:v8];
  [(HUServiceDetailsItemManager *)self setCharacteristicSections:v9];

  char v10 = [(HUServiceDetailsItemManager *)self programmableSwitchItemModule];
  id v11 = [v10 buildSectionsWithDisplayedItems:v5];

  uint64_t v12 = +[HUServiceDetailsItemModule serviceDetailsItemSectionComparatorForSortStrategy:@"HUServiceDetailsItemModuleSortStrategyProgrammableSwitch"];
  v234 = v11;
  id v13 = [v11 sortedArrayUsingComparator:v12];
  [(HUServiceDetailsItemManager *)self setProgrammableSwitchSections:v13];

  uint64_t v14 = [(HUServiceDetailsItemManager *)self accessorySettingsItemModule];
  id v238 = v5;
  uint64_t v15 = [v14 buildSectionsWithDisplayedItems:v5];

  __int16 v16 = [(HUServiceDetailsItemManager *)self managedConfigurationProfilesItem];
  v278[0] = *MEMORY[0x1E4F68908];
  char v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v278 count:1];
  int v18 = [v16 resultsContainRequiredProperties:v17];
  id v19 = (void *)MEMORY[0x1E4F68B10];
  v236 = self;
  if (!v18) {
    goto LABEL_5;
  }
  id v20 = [(HUServiceDetailsItemManager *)self managedConfigurationProfilesItem];
  [v20 latestResults];
  __int16 v22 = v21 = v15;
  v23 = [v22 objectForKeyedSubscript:*v19];
  char v24 = [v23 BOOLValue];

  uint64_t v15 = v21;
  if ((v24 & 1) == 0)
  {
    __int16 v16 = objc_msgSend(v21, "na_firstObjectPassingTest:", &__block_literal_global_324);
    uint64_t v25 = [v16 items];
    char v17 = (void *)[v25 mutableCopy];

    uint64_t v26 = [(HUServiceDetailsItemManager *)self managedConfigurationProfilesItem];
    objc_msgSend(v17, "na_safeAddObject:", v26);

    [v16 setItems:v17];
LABEL_5:
  }
  v233 = v15;
  v27 = [v15 sortedArrayUsingComparator:&__block_literal_global_327];
  [(HUServiceDetailsItemManager *)self setAccessorySettingsSections:v27];

  v237 = objc_opt_new();
  uint64_t v28 = objc_opt_new();
  long long v251 = 0u;
  long long v252 = 0u;
  long long v253 = 0u;
  long long v254 = 0u;
  uint64_t v29 = self;
  int v30 = (void *)v28;
  id obj = [(HUServiceDetailsItemManager *)v29 homeKitAccessorySettingsModules];
  uint64_t v31 = [obj countByEnumeratingWithState:&v251 objects:v277 count:16];
  v239 = v30;
  if (!v31) {
    goto LABEL_29;
  }
  uint64_t v32 = v31;
  uint64_t v33 = *(void *)v252;
  id v34 = (void *)MEMORY[0x1E4F68CC8];
  do
  {
    uint64_t v35 = 0;
    do
    {
      if (*(void *)v252 != v33) {
        objc_enumerationMutation(obj);
      }
      id v36 = *(void **)(*((void *)&v251 + 1) + 8 * v35);
      objc_opt_class();
      id v37 = v36;
      if (objc_opt_isKindOfClass()) {
        v38 = v37;
      }
      else {
        v38 = 0;
      }
      id v39 = v38;

      v40 = [v39 settingGroupKeyPath];
      if ([v40 isEqualToString:*v34]) {
        goto LABEL_21;
      }
      uint64_t v41 = v32;
      uint64_t v42 = v33;
      v43 = v34;
      v44 = [v39 settingGroupKeyPath];
      if ([v44 isEqualToString:*MEMORY[0x1E4F68030]]) {
        goto LABEL_20;
      }
      v45 = [v39 settingGroupKeyPath];
      if ([v45 isEqualToString:*MEMORY[0x1E4F68308]]) {
        goto LABEL_19;
      }
      v242 = [v39 settingGroupKeyPath];
      if ([v242 isEqualToString:*MEMORY[0x1E4F68320]])
      {

LABEL_19:
LABEL_20:

        id v34 = v43;
        uint64_t v33 = v42;
        uint64_t v32 = v41;
LABEL_21:

LABEL_22:
        uint64_t v46 = [v39 accessorySettingsItemProvider];
        uint64_t v47 = [(HUServiceDetailsItemManager *)v46 items];
        uint64_t v48 = [v47 allObjects];
        [v30 addObjectsFromArray:v48];

        goto LABEL_23;
      }
      uint64_t v49 = [v39 settingGroupKeyPath];
      char v240 = [v49 isEqualToString:*MEMORY[0x1E4F68408]];

      int v30 = v239;
      id v34 = v43;
      uint64_t v33 = v42;
      uint64_t v32 = v41;
      if (v240) {
        goto LABEL_22;
      }
      uint64_t v46 = [v37 buildSectionsWithDisplayedItems:v238];
      [v237 addObjectsFromArray:v46];
      uint64_t v47 = HFLogForCategory();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        v270 = v46;
        __int16 v271 = 2112;
        id v272 = v37;
        _os_log_debug_impl(&dword_1BE345000, v47, OS_LOG_TYPE_DEBUG, "Built Setting Sections = [%@] for module = [%@]", buf, 0x16u);
      }
LABEL_23:

      ++v35;
    }
    while (v32 != v35);
    uint64_t v50 = [obj countByEnumeratingWithState:&v251 objects:v277 count:16];
    uint64_t v32 = v50;
  }
  while (v50);
LABEL_29:

  uint64_t v51 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"groupedHomeKitAccessorySettingsSection"];
  if ([v30 count])
  {
    [v51 setItems:v30];
    [v237 insertObject:v51 atIndex:0];
  }
  id obja = v51;
  id v52 = v236;
  [(HUServiceDetailsItemManager *)v236 setHomeKitAccessorySettingsSections:v237];
  uint64_t v53 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"splitAccount"];
  int v54 = [(HUServiceDetailsItemManager *)v236 splitMediaAccountTitleItem];
  v276[0] = v54;
  v55 = [(HUServiceDetailsItemManager *)v236 splitMediaAccountUseDefaultAccountItem];
  v276[1] = v55;
  v56 = [(HUServiceDetailsItemManager *)v236 splitMediaAccountSignoutAccountItem];
  v276[2] = v56;
  id v57 = [MEMORY[0x1E4F1C978] arrayWithObjects:v276 count:3];
  [v53 setItems:v57];

  v58 = (void *)MEMORY[0x1E4F69220];
  v243 = v53;
  v275 = v53;
  uint64_t v59 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v275 count:1];
  v60 = [v58 filterSections:v59 toDisplayedItems:v238];
  [(HUServiceDetailsItemManager *)v236 setSplitMediaAccountSections:v60];

  id v61 = [(HUServiceDetailsItemManager *)v236 nameModule];
  v62 = [v61 buildSectionsWithDisplayedItems:v238];
  [(HUServiceDetailsItemManager *)v236 setNameAndIconSections:v62];

  int v63 = [(HUServiceDetailsItemManager *)v236 accessoryRepresentableItemModule];

  if (v63)
  {
    v64 = [(HUServiceDetailsItemManager *)v236 accessoryRepresentableItemModule];
    id v65 = [v64 buildSectionsWithDisplayedItems:v238];
    v66 = objc_msgSend(v65, "na_map:", &__block_literal_global_340_0);

    v67 = [(HUServiceDetailsItemManager *)v236 hf_MediaAccessoryItem];
    LODWORD(v65) = [v67 isContainedWithinItemGroup];

    if (v65)
    {
      v68 = _HULocalizedStringWithDefaultValue(@"HUServiceDetailsContainedSpeakersLabel", @"HUServiceDetailsContainedSpeakersLabel", 1);
      id v69 = [v66 firstObject];
      [v69 setHeaderTitle:v68];
    }
    [(HUServiceDetailsItemManager *)v236 setContainedAccessoriesSections:v66];
  }
  if ([(HUServiceDetailsItemManager *)v236 sourceItemIsService]
    && ([(HUServiceDetailsItemManager *)v236 sourceItemAccessory],
        v70 = objc_claimAutoreleasedReturnValue(),
        int v71 = objc_msgSend(v70, "hf_isHomePod"),
        v70,
        v71))
  {
    id v72 = HFLogForCategory();
    if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(aSelector);
      id v73 = (id)objc_claimAutoreleasedReturnValue();
      v74 = [(HFItemManager *)v236 sourceItem];
      *(_DWORD *)buf = 138412802;
      v270 = v236;
      __int16 v271 = 2112;
      id v272 = v73;
      __int16 v273 = 2112;
      v274 = v74;
      _os_log_impl(&dword_1BE345000, v72, OS_LOG_TYPE_INFO, "%@:%@ Skip adding softwareUpdateSections for HomePod service: %@", buf, 0x20u);

      goto LABEL_40;
    }
  }
  else
  {
    id v72 = [(HUServiceDetailsItemManager *)v236 softwareUpdateItemModule];
    id v73 = [v72 buildSectionsWithDisplayedItems:v238];
    [(HUServiceDetailsItemManager *)v236 setSoftwareUpdateSections:v73];
LABEL_40:
  }
  v75 = [(HUServiceDetailsItemManager *)v236 relatedTriggerItemModule];

  if (v75)
  {
    v76 = [(HUServiceDetailsItemManager *)v236 relatedTriggerItemModule];
    v77 = [v76 buildSectionsWithDisplayedItems:v238];
    [(HUServiceDetailsItemManager *)v236 setRelatedTriggerSections:v77];
  }
  v78 = [(HUServiceDetailsItemManager *)v236 valveEditorItemModule];
  v79 = [v78 buildSectionsWithDisplayedItems:v238];
  [(HUServiceDetailsItemManager *)v236 setValveEditorSections:v79];

  id v80 = [(HUServiceDetailsItemManager *)v236 sceneAndTriggerModule];
  v81 = [v80 buildSectionsWithDisplayedItems:v238];
  [(HUServiceDetailsItemManager *)v236 setSceneAndTriggerSections:v81];

  id v82 = [(HUServiceDetailsItemManager *)v236 connectedServicesItemModule];
  id v83 = [v82 buildSectionsWithDisplayedItems:v238];
  [(HUServiceDetailsItemManager *)v236 setConnectedServicesSections:v83];

  v84 = [(HUServiceDetailsItemManager *)v236 inputSourceItemModule];
  __int16 v85 = [v84 buildSectionsWithDisplayedItems:v238];
  [(HUServiceDetailsItemManager *)v236 setInputSourceEditorSections:v85];

  v86 = [(HUServiceDetailsItemManager *)v236 televisionSettingsItemModule];
  v87 = [v86 buildSectionsWithDisplayedItems:v238];
  [(HUServiceDetailsItemManager *)v236 setTelevisionSettingsSections:v87];

  v88 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"AdvancedCameraSettings"];
  v89 = [(HUServiceDetailsItemManager *)v236 cameraRecordingOptionsItem];
  v268[0] = v89;
  v90 = [(HUServiceDetailsItemManager *)v236 cameraFaceRecognitionItem];
  v268[1] = v90;
  v91 = [MEMORY[0x1E4F1C978] arrayWithObjects:v268 count:2];
  [v88 setItems:v91];

  id v92 = (void *)MEMORY[0x1E4F69220];
  v241 = v88;
  v267 = v88;
  v93 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v267 count:1];
  id v94 = [v92 filterSections:v93 toDisplayedItems:v238];
  [(HUServiceDetailsItemManager *)v236 setAdvancedCameraSettingsSection:v94];

  v95 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"AudioOutput"];
  v96 = [(HUServiceDetailsItemManager *)v236 homeTheaterAudioOutputItem];
  v266 = v96;
  v97 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v266 count:1];
  [v95 setItems:v97];

  id v98 = (void *)MEMORY[0x1E4F69220];
  v232 = v95;
  v265 = v95;
  v99 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v265 count:1];
  id v100 = [v98 filterSections:v99 toDisplayedItems:v238];
  [(HUServiceDetailsItemManager *)v236 setHomeTheaterAudioSections:v100];

  v101 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"cameraActivityZones"];
  v102 = [(HUServiceDetailsItemManager *)v236 cameraActivityZonesItem];
  uint64_t v264 = v102;
  v103 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v264 count:1];
  [v101 setItems:v103];

  v104 = (void *)MEMORY[0x1E4F69220];
  aSelectora = (char *)v101;
  uint64_t v263 = v101;
  v105 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v263 count:1];
  v106 = [v104 filterSections:v105 toDisplayedItems:v238];
  [(HUServiceDetailsItemManager *)v236 setCameraActivityZonesSections:v106];

  v107 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"cameraStatusLight"];
  v108 = [(HUServiceDetailsItemManager *)v236 cameraStatusLightItem];
  v262 = v108;
  v109 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v262 count:1];
  [v107 setItems:v109];

  v110 = (void *)MEMORY[0x1E4F69220];
  v229 = v107;
  v261 = v107;
  v111 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v261 count:1];
  v112 = [v110 filterSections:v111 toDisplayedItems:v238];
  [(HUServiceDetailsItemManager *)v236 setCameraStatusLightSections:v112];

  v113 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"cameraNightMode"];
  v114 = _HULocalizedStringWithDefaultValue(@"HUCameraNightModeFooterTitle", @"HUCameraNightModeFooterTitle", 1);
  [v113 setFooterTitle:v114];

  v115 = [(HUServiceDetailsItemManager *)v236 cameraNightModeItem];
  v260 = v115;
  v116 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v260 count:1];
  [v113 setItems:v116];

  v117 = (void *)MEMORY[0x1E4F69220];
  v259 = v113;
  v118 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v259 count:1];
  v119 = [v117 filterSections:v118 toDisplayedItems:v238];
  [(HUServiceDetailsItemManager *)v236 setCameraNightModeSections:v119];

  v120 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"doorbellChimeMute"];
  v121 = _HULocalizedStringWithDefaultValue(@"HUCameraDoorbellChimeMuteSwitchFooter", @"HUCameraDoorbellChimeMuteSwitchFooter", 1);
  [v120 setFooterTitle:v121];

  v122 = [(HUServiceDetailsItemManager *)v236 cameraDoorbellChimeMuteItem];
  v258 = v122;
  v123 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v258 count:1];
  [v120 setItems:v123];

  v124 = (void *)MEMORY[0x1E4F69220];
  v257 = v120;
  v125 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v257 count:1];
  v126 = [v124 filterSections:v125 toDisplayedItems:v238];
  [(HUServiceDetailsItemManager *)v236 setDoorbellMuteSections:v126];

  v127 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"collectDiagnostics"];
  v128 = (void *)MEMORY[0x1E4F1C978];
  v129 = [(HUServiceDetailsItemManager *)v236 collectDiagnosticsItem];
  v130 = objc_msgSend(v128, "na_arrayWithSafeObject:", v129);
  [v127 setItems:v130];

  v131 = (void *)MEMORY[0x1E4F69220];
  id v228 = v127;
  v256 = v127;
  v132 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v256 count:1];
  v133 = [v131 filterSections:v132 toDisplayedItems:v238];
  [(HUServiceDetailsItemManager *)v236 setCollectDiagnosticsSections:v133];

  v134 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"lockAddHomeKeyToWalletItem"];
  v135 = (void *)MEMORY[0x1E4F1C978];
  v136 = [(HUServiceDetailsItemManager *)v236 lockAddHomeKeyToWalletItem];
  v137 = objc_msgSend(v135, "na_arrayWithSafeObject:", v136);
  [v134 setItems:v137];

  v138 = (void *)MEMORY[0x1E4F69220];
  v227 = v134;
  v255 = v134;
  id v139 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v255 count:1];
  v140 = [v138 filterSections:v139 toDisplayedItems:v238];
  [(HUServiceDetailsItemManager *)v236 setLockAddHomeKeyToWalletSections:v140];

  v141 = [MEMORY[0x1E4F1CA70] orderedSet];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __64__HUServiceDetailsItemManager__buildSectionsWithDisplayedItems___block_invoke_375;
  aBlock[3] = &unk_1E6388098;
  id v142 = v141;
  id v250 = v142;
  v143 = (void (**)(void *, void *))_Block_copy(aBlock);
  if ([(HUServiceDetailsItemManager *)v236 _shouldShowFirmwareUpdateSection])
  {
    [v142 addObject:@"HUServiceDetailsFirmwareUpdateSectionPromptIdentifier"];
    [v142 addObject:@"HUServiceDetailsFirmwareUpdateAppStoreSectionIdentifier"];
  }
  [v142 addObject:@"HUServiceDetailsHeaderSectionIdentifier"];
  v144 = [(HUServiceDetailsItemManager *)v236 softwareUpdateSections];
  v143[2](v143, v144);

  char v145 = [(HUServiceDetailsItemManager *)v236 splitMediaAccountSections];
  v143[2](v143, v145);

  v146 = [(HUServiceDetailsItemManager *)v236 nameAndIconSections];
  v143[2](v143, v146);

  v147 = [(HUServiceDetailsItemManager *)v236 characteristicSections];
  v143[2](v143, v147);

  [v142 addObject:@"HUServiceDetailsPrimaryInfoSectionIdentifier"];
  v148 = [(HUServiceDetailsItemManager *)v236 containedAccessoriesSections];
  v143[2](v143, v148);

  uint64_t v149 = [(HUServiceDetailsItemManager *)v236 addGroupItem];
  if (v149)
  {
    v150 = (void *)v149;
    v151 = [(HUServiceDetailsItemManager *)v236 addGroupItem];
    v152 = [v151 latestResults];
    v153 = [v152 objectForKeyedSubscript:*MEMORY[0x1E4F68B10]];
    int v154 = [v153 BOOLValue];

    id v52 = v236;
    if (!v154) {
      goto LABEL_49;
    }
  }
  uint64_t v155 = [(HUServiceDetailsItemManager *)v52 separateTileItem];
  if (v155)
  {
    v156 = (void *)v155;
    v157 = [(HUServiceDetailsItemManager *)v52 separateTileItem];
    v158 = [v157 latestResults];
    v159 = [v158 objectForKeyedSubscript:*MEMORY[0x1E4F68B10]];
    char v160 = [v159 BOOLValue];

    id v52 = v236;
    if ((v160 & 1) == 0) {
LABEL_49:
    }
      [v142 addObject:@"HUServiceDetailsGroupSectionIdentifier"];
  }
  if ((![(HUServiceDetailsItemManager *)v52 _isGroupedHomePod]
     || [(HUServiceDetailsItemManager *)v52 _isSingleHomePodInGroup])
    && HFPreferenceIdentifyHomePodButtonEnabled())
  {
    [v142 addObject:@"HUServiceDetailsIdentifyHomePodSectionIdentifier"];
  }
  uint64_t v161 = [(HUServiceDetailsItemManager *)v52 lockPinCodesItem];
  if (v161)
  {
    v162 = (void *)v161;
    v163 = [(HUServiceDetailsItemManager *)v52 lockPinCodesItem];
    v164 = [v163 latestResults];
    v165 = [v164 objectForKeyedSubscript:*MEMORY[0x1E4F68B10]];
    char v166 = [v165 BOOLValue];

    id v52 = v236;
    if ((v166 & 1) == 0) {
      [v142 addObject:@"HUServiceDetailsLockPinCodeSectionIdentifier"];
    }
  }
  id v167 = [(HUServiceDetailsItemManager *)v52 lockAddHomeKeyToWalletSections];
  v143[2](v143, v167);

  v168 = [(HUServiceDetailsItemManager *)v52 relatedTriggerSections];

  if (v168)
  {
    v169 = [(HUServiceDetailsItemManager *)v52 relatedTriggerSections];
    v143[2](v143, v169);
  }
  int v170 = [(HUServiceDetailsItemManager *)v52 sceneAndTriggerSections];
  v143[2](v143, v170);

  int v171 = [(HUServiceDetailsItemManager *)v52 programmableSwitchSections];
  v143[2](v143, v171);

  int v172 = [(HUServiceDetailsItemManager *)v52 valveEditorSections];
  v143[2](v143, v172);

  uint64_t v173 = [(HUServiceDetailsItemManager *)v52 alarmItem];
  if (v173)
  {
    v174 = (void *)v173;
    uint64_t v175 = [(HUServiceDetailsItemManager *)v52 alarmItem];
    v176 = [v175 latestResults];
    v177 = [v176 objectForKeyedSubscript:*MEMORY[0x1E4F68B10]];
    char v178 = [v177 BOOLValue];

    id v52 = v236;
    if ((v178 & 1) == 0) {
      [v142 addObject:@"HUServiceDetailsAlarmSectionIdentifier"];
    }
  }
  uint64_t v179 = [(HUServiceDetailsItemManager *)v52 statusAndNotificationItem];
  if (v179)
  {
    v180 = (void *)v179;
    v181 = [(HUServiceDetailsItemManager *)v52 statusAndNotificationItem];
    uint64_t v182 = [v181 latestResults];
    int v183 = [v182 objectForKeyedSubscript:*MEMORY[0x1E4F68B10]];
    char v184 = [v183 BOOLValue];

    id v52 = v236;
    if ((v184 & 1) == 0) {
      [v142 addObject:@"HUServiceDetailsStatusAndNotificationSectionIdentifier"];
    }
  }
  int v185 = [(HUServiceDetailsItemManager *)v52 connectedServicesSections];
  v143[2](v143, v185);

  uint64_t v186 = [(HUServiceDetailsItemManager *)v52 inputSourceEditorSections];
  v143[2](v143, v186);

  id v187 = [(HUServiceDetailsItemManager *)v52 televisionSettingsSections];
  v143[2](v143, v187);

  v188 = [(HUServiceDetailsItemManager *)v52 doorbellMuteSections];
  v143[2](v143, v188);

  [v142 addObject:@"HUServiceDetailsAdvancedCameraSettingsSectionIdentifier"];
  uint64_t v189 = [(HUServiceDetailsItemManager *)v52 cameraActivityZonesSections];
  v143[2](v143, v189);

  v190 = [(HUServiceDetailsItemManager *)v52 cameraStatusLightSections];
  v143[2](v143, v190);

  v191 = [(HUServiceDetailsItemManager *)v52 cameraNightModeSections];
  v143[2](v143, v191);

  v192 = [(HUServiceDetailsItemManager *)v52 homeTheaterAudioSections];
  v143[2](v143, v192);

  v193 = [(HUServiceDetailsItemManager *)v52 sourceItemAccessory];
  if (objc_msgSend(v193, "hf_isVisibleAsBridgedAccessory"))
  {
    BOOL v194 = [(HUServiceDetailsItemManager *)v52 shouldHideAccessoryItem];

    if (!v194) {
      goto LABEL_67;
    }
    goto LABEL_76;
  }
  v196 = [(HUServiceDetailsItemManager *)v52 sourceItemAccessory];
  if ((objc_msgSend(v196, "hf_isVisibleAsBridge") & 1) == 0)
  {
LABEL_75:

    goto LABEL_76;
  }
  v197 = [(HUServiceDetailsItemManager *)v52 sourceItemAccessory];
  if ((objc_msgSend(v197, "hf_isPureBridge") & 1) != 0
    || ![(HUServiceDetailsItemManager *)v52 sourceItemIsService])
  {

    goto LABEL_75;
  }
  BOOL v198 = [(HUServiceDetailsItemManager *)v52 shouldHideAccessoryItem];

  if (!v198) {
LABEL_67:
  }
    [v142 addObject:@"HUServiceDetailsBridgeSectionIdentifier"];
LABEL_76:
  v199 = [(HUServiceDetailsItemManager *)v52 accessorySettingsSections];
  v200 = objc_msgSend(v199, "na_map:", &__block_literal_global_382);
  [v142 addObjectsFromArray:v200];

  v201 = [(HUServiceDetailsItemManager *)v52 homeKitAccessorySettingsSections];
  v202 = objc_msgSend(v201, "na_map:", &__block_literal_global_384);
  [v142 addObjectsFromArray:v202];

  if (![(HUServiceDetailsItemManager *)v52 isItemGroup]
    && [(HUServiceDetailsItemManager *)v52 _shouldShowLinkedApplicationSection])
  {
    [v142 addObject:@"HUServiceDetailsLinkedApplicationSectionIdentifier"];
  }
  if (![(HUServiceDetailsItemManager *)v52 isItemGroup]) {
    [v142 addObject:@"HUServiceDetailsAccessoryInfoSectionIdentifier"];
  }
  v203 = [(HUServiceDetailsItemManager *)v52 collectDiagnosticsSections];
  v143[2](v143, v203);

  v204 = [(HFItemManager *)v52 home];
  if ((objc_msgSend(v204, "hf_currentUserIsAdministrator") & 1) == 0) {
    goto LABEL_87;
  }
  uint64_t v205 = [(HUServiceDetailsItemManager *)v52 resetItem];
  if (!v205) {
    goto LABEL_87;
  }
  v206 = (void *)v205;
  v207 = [(HUServiceDetailsItemManager *)v52 deviceOptionsAdapter];
  if (([v207 isAccessoryReachableOverRapport] & 1) == 0)
  {

LABEL_87:
    goto LABEL_88;
  }
  v208 = [(HUServiceDetailsItemManager *)v52 hf_MediaAccessoryItem];
  BOOL v209 = [(HUServiceDetailsItemManager *)v52 shouldShowExportDiagnosticsItem:v208];

  if (v209) {
    [v142 addObject:@"HUServiceDetailsExportDiagnosticsSectionIdentifier"];
  }
LABEL_88:
  v210 = [(HFItemManager *)v236 home];
  if ((objc_msgSend(v210, "hf_currentUserIsAdministrator") & 1) == 0) {
    goto LABEL_94;
  }
  v211 = [(HUServiceDetailsItemManager *)v236 restartItem];
  if (!v211 || ![(HUServiceDetailsItemManager *)v236 _isGroupedHomePod])
  {

LABEL_94:
    goto LABEL_95;
  }
  BOOL v212 = [(HUServiceDetailsItemManager *)v236 groupedAccessoryReachableOverRapport];

  if (v212) {
    [v142 addObject:@"HUServiceDetailsRestartSectionIdentifier"];
  }
LABEL_95:
  v213 = [(HFItemManager *)v236 home];
  if (objc_msgSend(v213, "hf_currentUserIsAdministrator"))
  {
    v214 = [(HUServiceDetailsItemManager *)v236 removeFromGroupItem];

    if (v214) {
      [v142 addObject:@"HUServiceDetailsRemoveFromGroupSectionIdentifier"];
    }
  }
  else
  {
  }
  v215 = [(HFItemManager *)v236 home];
  if (objc_msgSend(v215, "hf_currentUserIsAdministrator"))
  {
    v216 = [(HUServiceDetailsItemManager *)v236 deviceOptionsAdapter];
    char v217 = [v216 isAccessoryReachableOverRapport];

    if ((v217 & 1) == 0) {
      [v142 addObject:@"HUServiceDetailsRemoveSectionIdentifier"];
    }
  }
  else
  {
  }
  v218 = [(HFItemManager *)v236 home];
  if ((objc_msgSend(v218, "hf_currentUserIsAdministrator") & 1) == 0) {
    goto LABEL_109;
  }
  uint64_t v219 = [(HUServiceDetailsItemManager *)v236 resetItem];
  if (!v219) {
    goto LABEL_109;
  }
  v220 = (void *)v219;
  v221 = [(HUServiceDetailsItemManager *)v236 deviceOptionsAdapter];
  if (([v221 isAccessoryReachableOverRapport] & 1) == 0)
  {

LABEL_109:
    id v5 = v238;
    goto LABEL_110;
  }
  id v222 = [(HUServiceDetailsItemManager *)v236 hf_MediaAccessoryItem];
  BOOL v223 = [(HUServiceDetailsItemManager *)v236 shouldShowDeviceOptionsForAccessoryItem:v222];

  id v5 = v238;
  if (v223) {
    [v142 addObject:@"HUServiceDetailsResetSectionIdentifier"];
  }
LABEL_110:
  v224 = objc_opt_new();
  v246[0] = MEMORY[0x1E4F143A8];
  v246[1] = 3221225472;
  v246[2] = __64__HUServiceDetailsItemManager__buildSectionsWithDisplayedItems___block_invoke_5;
  v246[3] = &unk_1E63911C0;
  v246[4] = v236;
  id v225 = v224;
  id v247 = v225;
  id v248 = v5;
  [v142 enumerateObjectsUsingBlock:v246];
  id v195 = v225;

LABEL_111:

  return v195;
}

uint64_t __64__HUServiceDetailsItemManager__buildSectionsWithDisplayedItems___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 identifier];
  uint64_t v3 = [v2 isEqual:*MEMORY[0x1E4F68568]];

  return v3;
}

uint64_t __64__HUServiceDetailsItemManager__buildSectionsWithDisplayedItems___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 userInfo];
  uint64_t v6 = [v5 objectForKeyedSubscript:@"HUAccessorySettingsItemModuleSortKey"];
  uint64_t v7 = [v4 userInfo];

  uint64_t v8 = [v7 objectForKeyedSubscript:@"HUAccessorySettingsItemModuleSortKey"];
  uint64_t v9 = [v6 compare:v8];

  return v9;
}

id __64__HUServiceDetailsItemManager__buildSectionsWithDisplayedItems___block_invoke_337(uint64_t a1, void *a2)
{
  id v2 = (void *)[a2 mutableCopy];

  return v2;
}

void __64__HUServiceDetailsItemManager__buildSectionsWithDisplayedItems___block_invoke_375(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "na_map:", &__block_literal_global_379);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 addObjectsFromArray:v3];
}

uint64_t __64__HUServiceDetailsItemManager__buildSectionsWithDisplayedItems___block_invoke_2_376(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

uint64_t __64__HUServiceDetailsItemManager__buildSectionsWithDisplayedItems___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

uint64_t __64__HUServiceDetailsItemManager__buildSectionsWithDisplayedItems___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

void __64__HUServiceDetailsItemManager__buildSectionsWithDisplayedItems___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) _characteristicSectionForIdentifier:v3];
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 40), "na_safeAddObject:", v4);
  }
  else
  {
    id v5 = [*(id *)(a1 + 32) _allItemsForSectionIdentifier:v3];
    uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithArray:v5];
    [v6 intersectSet:*(void *)(a1 + 48)];
    if ([v6 count])
    {
      uint64_t v7 = objc_alloc_init(HUServiceDetailsSectionFactory);
      if (_MergedGlobals_4_7 != -1) {
        dispatch_once(&_MergedGlobals_4_7, &__block_literal_global_391);
      }
      id v8 = (id)qword_1EA12E180;
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __64__HUServiceDetailsItemManager__buildSectionsWithDisplayedItems___block_invoke_8;
      v13[3] = &unk_1E6386608;
      id v9 = v3;
      id v14 = v9;
      if (objc_msgSend(v8, "na_any:", v13))
      {
        char v10 = [MEMORY[0x1E4F69758] comparatorWithSortedObjects:v5];
        [(HUServiceDetailsSectionFactory *)v7 setCustomComparator:v10];
      }
      id v11 = [*(id *)(a1 + 32) sourceItem];
      uint64_t v12 = [(HUServiceDetailsSectionFactory *)v7 buildServiceDetailsItemSectionForSourceItem:v11 sectionIdentifier:v9 items:v6];

      objc_msgSend(*(id *)(a1 + 40), "na_safeAddObject:", v12);
    }
  }
}

void __64__HUServiceDetailsItemManager__buildSectionsWithDisplayedItems___block_invoke_7()
{
  v2[5] = *MEMORY[0x1E4F143B8];
  v2[0] = @"HUServiceDetailsPrimaryInfoSectionIdentifier";
  v2[1] = @"HUServiceDetailsStatusAndNotificationSectionIdentifier";
  v2[2] = @"HUServiceDetailsAdvancedCameraSettingsSectionIdentifier";
  v2[3] = @"HUServiceDetailsRemoveFromGroupSectionIdentifier";
  v2[4] = @"HUServiceDetailsRemoveSectionIdentifier";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:5];
  v1 = (void *)qword_1EA12E180;
  qword_1EA12E180 = v0;
}

uint64_t __64__HUServiceDetailsItemManager__buildSectionsWithDisplayedItems___block_invoke_8(uint64_t a1, void *a2)
{
  return [a2 isEqualToString:*(void *)(a1 + 32)];
}

- (id)_itemsToHideInSet:(id)a3
{
  id v4 = a3;
  v60.receiver = self;
  v60.super_class = (Class)HUServiceDetailsItemManager;
  id v5 = [(HFItemManager *)&v60 _itemsToHideInSet:v4];
  uint64_t v6 = (void *)[v5 mutableCopy];

  uint64_t v7 = [MEMORY[0x1E4F1CA80] set];
  id v8 = [(HUServiceDetailsItemManager *)self existingRoomItemProvider];
  id v9 = [v8 items];
  [v7 unionSet:v9];

  char v10 = [(HUServiceDetailsItemManager *)self suggestedRoomItemProvider];
  id v11 = [v10 items];
  [v7 unionSet:v11];

  if ([(HUServiceDetailsItemManager *)self showRoomsList])
  {
    uint64_t v12 = [(HUServiceDetailsItemManager *)self selectedRoomItemProvider];
    id v13 = [v12 items];
    [v7 unionSet:v13];
  }
  else
  {
    id v14 = [(HUServiceDetailsItemManager *)self roomListItem];
    objc_msgSend(v7, "na_safeAddObject:", v14);

    uint64_t v12 = [(HUServiceDetailsItemManager *)self createNewRoomItem];
    objc_msgSend(v7, "na_safeAddObject:", v12);
  }

  uint64_t v15 = objc_msgSend(v4, "na_setByIntersectingWithSet:", v7);
  [v6 unionSet:v15];

  __int16 v16 = [(HUServiceDetailsItemManager *)self relatedTriggerItemModule];

  if (v16)
  {
    char v17 = [(HUServiceDetailsItemManager *)self relatedTriggerItemModule];
    int v18 = [v17 allItems];
    id v19 = objc_msgSend(v4, "na_setByIntersectingWithSet:", v18);

    id v20 = [(HUServiceDetailsItemManager *)self relatedTriggerItemModule];
    char v21 = [v20 itemsToHideInSet:v19];
    [v6 unionSet:v21];
  }
  __int16 v22 = [(HUServiceDetailsItemManager *)self associatedServiceTypeItem];
  if (![v4 containsObject:v22]) {
    goto LABEL_9;
  }
  v23 = [(HUServiceDetailsItemManager *)self associatedServiceTypeOptionItemProvider];
  char v24 = [v23 items];
  uint64_t v25 = [v24 count];

  if (!v25)
  {
    __int16 v22 = [(HUServiceDetailsItemManager *)self associatedServiceTypeItem];
    [v6 addObject:v22];
LABEL_9:
  }
  if ([(HUServiceDetailsItemManager *)self showAssociatedServiceTypeList])
  {
    uint64_t v26 = [(HUServiceDetailsItemManager *)self associatedServiceTypeItem];
    int v27 = [v4 containsObject:v26];

    if (v27)
    {
      uint64_t v28 = [(HUServiceDetailsItemManager *)self associatedServiceTypeItem];
      [v6 addObject:v28];
    }
  }
  if (![(HUServiceDetailsItemManager *)self showAssociatedServiceTypeList])
  {
    uint64_t v29 = [(HUServiceDetailsItemManager *)self associatedServiceTypeOptionItemProvider];
    int v30 = [v29 items];
    [v6 unionSet:v30];
  }
  uint64_t v31 = [(HFItemManager *)self home];
  uint64_t v32 = objc_msgSend(v31, "hf_currentUserIsAdministrator");

  if ((v32 & 1) == 0)
  {
    uint64_t v33 = [(HUServiceDetailsItemManager *)self collectDiagnosticsItem];
    objc_msgSend(v6, "na_safeAddObject:", v33);
  }
  if ([(HUServiceDetailsItemManager *)self shouldHideAccessoryItem])
  {
    id v34 = [(HUServiceDetailsItemManager *)self accessoryItem];
    objc_msgSend(v6, "na_safeAddObject:", v34);
  }
  if ([(HUServiceDetailsItemManager *)self shouldHideSeparateTileItem])
  {
    uint64_t v35 = [(HUServiceDetailsItemManager *)self separateTileItem];
    objc_msgSend(v6, "na_safeAddObject:", v35);
  }
  id v36 = [(HFItemManager *)self home];
  int v37 = objc_msgSend(v36, "hf_currentUserIsAdministrator");
  if (v37)
  {
    uint64_t v32 = [(HUServiceDetailsItemManager *)self sourceItemAccessory];
    if (([(id)v32 isBridged] & 1) == 0) {
      goto LABEL_29;
    }
  }
  v38 = [(HUServiceDetailsItemManager *)self removeItem];
  if (![v4 containsObject:v38])
  {

    if (!v37) {
      goto LABEL_30;
    }
LABEL_29:

    goto LABEL_30;
  }
  id v39 = [(HUServiceDetailsItemManager *)self deviceOptionsAdapter];
  char v40 = [v39 isAccessoryReachableOverRapport];

  if (v37) {
  if ((v40 & 1) == 0)
  }
  {
    id v36 = [(HUServiceDetailsItemManager *)self removeItem];
    [v6 addObject:v36];
LABEL_30:
  }
  uint64_t v41 = [(HFItemManager *)self home];
  if (objc_msgSend(v41, "hf_currentUserIsAdministrator"))
  {
LABEL_36:

    goto LABEL_37;
  }
  uint64_t v42 = [(HUServiceDetailsItemManager *)self deviceOptionsAdapter];
  if (([v42 isAccessoryReachableOverRapport] & 1) == 0)
  {

    goto LABEL_36;
  }
  v43 = [(HUServiceDetailsItemManager *)self hf_MediaAccessoryItem];
  BOOL v44 = [(HUServiceDetailsItemManager *)self shouldShowDeviceOptionsForAccessoryItem:v43];

  if (v44)
  {
    uint64_t v41 = [(HUServiceDetailsItemManager *)self resetItem];
    [v6 addObject:v41];
    goto LABEL_36;
  }
LABEL_37:
  v45 = [(HFItemManager *)self home];
  if ((objc_msgSend(v45, "hf_currentUserIsAdministrator") & 1) == 0
    && [(HUServiceDetailsItemManager *)self _isGroupedHomePod])
  {
    BOOL v46 = [(HUServiceDetailsItemManager *)self groupedAccessoryReachableOverRapport];

    if (!v46) {
      goto LABEL_42;
    }
    v45 = [(HUServiceDetailsItemManager *)self restartItem];
    [v6 addObject:v45];
  }

LABEL_42:
  uint64_t v47 = [(HFItemManager *)self home];
  if (!objc_msgSend(v47, "hf_currentUserIsAdministrator"))
  {
LABEL_47:

    goto LABEL_48;
  }
  uint64_t v48 = [(HUServiceDetailsItemManager *)self deviceOptionsAdapter];
  if (([v48 isAccessoryReachableOverRapport] & 1) == 0)
  {

    goto LABEL_47;
  }
  uint64_t v49 = [(HUServiceDetailsItemManager *)self hf_MediaAccessoryItem];
  BOOL v50 = [(HUServiceDetailsItemManager *)self shouldShowDeviceOptionsForAccessoryItem:v49];

  if (!v50)
  {
LABEL_48:
    uint64_t v51 = [(HUServiceDetailsItemManager *)self exportDiagnosticsItem];
    [v6 addObject:v51];
  }
  if (![(HUServiceDetailsItemManager *)self _shouldShowSplitAccountUI])
  {
    id v52 = [(HUServiceDetailsItemManager *)self splitMediaAccountTitleItem];
    [v6 addObject:v52];

    uint64_t v53 = [(HUServiceDetailsItemManager *)self splitMediaAccountUseDefaultAccountItem];
    [v6 addObject:v53];

    int v54 = [(HUServiceDetailsItemManager *)self splitMediaAccountSignoutAccountItem];
    [v6 addObject:v54];
  }
  v55 = [(HFItemManager *)self sourceItem];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v57 = [(HUServiceDetailsItemManager *)self removeItem];
    [v6 addObject:v57];
  }
  if ([MEMORY[0x1E4F69758] isPressDemoModeEnabled])
  {
    v58 = [(HUServiceDetailsItemManager *)self removeItem];
    [v6 addObject:v58];
  }

  return v6;
}

- (id)_transformedUpdateOutcomeForItem:(id)a3 proposedOutcome:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0
    && ([v5 objectForKeyedSubscript:*MEMORY[0x1E4F68C58]],
        id v8 = objc_claimAutoreleasedReturnValue(),
        int v9 = [v8 BOOLValue],
        v8,
        v9))
  {
    id v10 = (id)[v5 mutableCopy];
    [v10 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F68B10]];
  }
  else
  {
    id v10 = v5;
  }

  return v10;
}

- (id)_allItemsForSectionIdentifier:(id)a3
{
  v36[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 isEqualToString:@"HUServiceDetailsHeaderSectionIdentifier"])
  {
    id v5 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v6 = [(HUServiceDetailsItemManager *)self headerItem];
LABEL_16:
    int v27 = (void *)v6;
    uint64_t v7 = objc_msgSend(v5, "na_arrayWithSafeObject:", v6);
    goto LABEL_17;
  }
  if ([v4 isEqualToString:@"HUServiceDetailsPrimaryInfoSectionIdentifier"])
  {
    uint64_t v7 = objc_opt_new();
    id v8 = [(HUServiceDetailsItemManager *)self roomItem];
    objc_msgSend(v7, "na_safeAddObject:", v8);

    int v9 = [(HUServiceDetailsItemManager *)self existingRoomItemProvider];
    id v10 = [v9 items];
    id v11 = [v10 allObjects];
    [v7 addObjectsFromArray:v11];

    uint64_t v12 = [(HUServiceDetailsItemManager *)self suggestedRoomItemProvider];
    id v13 = [v12 items];
    id v14 = [v13 allObjects];
    [v7 addObjectsFromArray:v14];

    uint64_t v15 = [(HUServiceDetailsItemManager *)self roomListItem];
    objc_msgSend(v7, "na_safeAddObject:", v15);

    __int16 v16 = [(HUServiceDetailsItemManager *)self createNewRoomItem];
    objc_msgSend(v7, "na_safeAddObject:", v16);

    char v17 = [(HUServiceDetailsItemManager *)self associatedServiceTypeItem];
    objc_msgSend(v7, "na_safeAddObject:", v17);

    int v18 = [(HUServiceDetailsItemManager *)self associatedServiceTypeOptionItemProvider];
    id v19 = [v18 items];
    id v20 = [v19 allObjects];
    char v21 = [v20 sortedArrayUsingComparator:&__block_literal_global_399_0];
    [v7 addObjectsFromArray:v21];

    __int16 v22 = [(HUServiceDetailsItemManager *)self showContainedItems];
    objc_msgSend(v7, "na_safeAddObject:", v22);

    v23 = [(HUServiceDetailsItemManager *)self audioSettingsItem];
    [v7 addObject:v23];

    char v24 = [(HUServiceDetailsItemManager *)self internalDebuggingItem];
    objc_msgSend(v7, "na_safeAddObject:", v24);

    uint64_t v25 = [(HUServiceDetailsItemManager *)self showInHomeDashboardItem];
    objc_msgSend(v7, "na_safeAddObject:", v25);

    uint64_t v26 = [(HUServiceDetailsItemManager *)self favoriteItem];
LABEL_5:
    int v27 = (void *)v26;
    objc_msgSend(v7, "na_safeAddObject:", v26);
LABEL_17:

    goto LABEL_18;
  }
  if ([v4 isEqualToString:@"HUServiceDetailsExportDiagnosticsSectionIdentifier"])
  {
    id v5 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v6 = [(HUServiceDetailsItemManager *)self exportDiagnosticsItem];
    goto LABEL_16;
  }
  if ([v4 isEqualToString:@"HUServiceDetailsRemoveFromGroupSectionIdentifier"])
  {
    id v5 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v6 = [(HUServiceDetailsItemManager *)self removeFromGroupItem];
    goto LABEL_16;
  }
  if ([v4 isEqualToString:@"HUServiceDetailsRemoveSectionIdentifier"])
  {
    uint64_t v7 = objc_opt_new();
    uint64_t v28 = [(HUServiceDetailsItemManager *)self pairingModeItem];
    objc_msgSend(v7, "na_safeAddObject:", v28);

    uint64_t v26 = [(HUServiceDetailsItemManager *)self removeItem];
    goto LABEL_5;
  }
  if ([v4 isEqualToString:@"HUServiceDetailsResetSectionIdentifier"])
  {
    id v5 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v6 = [(HUServiceDetailsItemManager *)self resetItem];
    goto LABEL_16;
  }
  if ([v4 isEqualToString:@"HUServiceDetailsRestartSectionIdentifier"])
  {
    id v5 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v6 = [(HUServiceDetailsItemManager *)self restartItem];
    goto LABEL_16;
  }
  if ([v4 isEqualToString:@"HUServiceDetailsLinkedApplicationSectionIdentifier"])
  {
    int v30 = [(HUServiceDetailsItemManager *)self linkedApplicationItemProvider];
LABEL_25:
    int v27 = v30;
    uint64_t v31 = [v30 items];
LABEL_26:
    uint64_t v32 = v31;
    uint64_t v33 = [v31 allObjects];
LABEL_27:
    uint64_t v7 = (void *)v33;

    goto LABEL_17;
  }
  if ([v4 isEqualToString:@"HUServiceDetailsAccessoryInfoSectionIdentifier"])
  {
    int v30 = [(HUServiceDetailsItemManager *)self accessoryInfoItemProvider];
    goto LABEL_25;
  }
  if ([v4 isEqualToString:@"HUServiceDetailsGroupSectionIdentifier"])
  {
    uint64_t v7 = objc_opt_new();
    id v34 = [(HUServiceDetailsItemManager *)self addGroupItem];
    objc_msgSend(v7, "na_safeAddObject:", v34);

    uint64_t v26 = [(HUServiceDetailsItemManager *)self separateTileItem];
    goto LABEL_5;
  }
  if ([v4 isEqualToString:@"HUServiceDetailsIdentifyHomePodSectionIdentifier"])
  {
    id v5 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v6 = [(HUServiceDetailsItemManager *)self identifyHomePodItem];
    goto LABEL_16;
  }
  if ([v4 isEqualToString:@"HUServiceDetailsFirmwareUpdateSectionPromptIdentifier"])
  {
    int v27 = [(HUServiceDetailsItemManager *)self firmwareUpdateItemProvider];
    uint64_t v32 = [v27 instructionsItem];
    v36[0] = v32;
    uint64_t v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:1];
    goto LABEL_27;
  }
  if ([v4 isEqualToString:@"HUServiceDetailsFirmwareUpdateAppStoreSectionIdentifier"])
  {
    int v27 = [(HUServiceDetailsItemManager *)self firmwareUpdateItemProvider];
    uint64_t v31 = [v27 linkedApplicationItems];
    goto LABEL_26;
  }
  if ([v4 isEqualToString:@"HUServiceDetailsBridgeSectionIdentifier"])
  {
    id v5 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v6 = [(HUServiceDetailsItemManager *)self accessoryItem];
    goto LABEL_16;
  }
  if ([v4 isEqualToString:@"HUServiceDetailsAlarmSectionIdentifier"])
  {
    id v5 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v6 = [(HUServiceDetailsItemManager *)self alarmItem];
    goto LABEL_16;
  }
  if ([v4 isEqualToString:@"HUServiceDetailsStatusAndNotificationSectionIdentifier"])
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v26 = [(HUServiceDetailsItemManager *)self statusAndNotificationItem];
    goto LABEL_5;
  }
  if ([v4 isEqualToString:@"HUServiceDetailsAdvancedCameraSettingsSectionIdentifier"])
  {
    uint64_t v7 = objc_opt_new();
    uint64_t v35 = [(HUServiceDetailsItemManager *)self cameraRecordingOptionsItem];
    objc_msgSend(v7, "na_safeAddObject:", v35);

    uint64_t v26 = [(HUServiceDetailsItemManager *)self cameraFaceRecognitionItem];
    goto LABEL_5;
  }
  if ([v4 isEqualToString:@"HUServiceDetailsLockPinCodeSectionIdentifier"])
  {
    id v5 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v6 = [(HUServiceDetailsItemManager *)self lockPinCodesItem];
    goto LABEL_16;
  }
  uint64_t v7 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_18:

  return v7;
}

uint64_t __61__HUServiceDetailsItemManager__allItemsForSectionIdentifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 latestResults];
  uint64_t v6 = *MEMORY[0x1E4F68AB8];
  uint64_t v7 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F68AB8]];

  id v8 = [v4 latestResults];

  int v9 = [v8 objectForKeyedSubscript:v6];

  uint64_t v10 = [v7 localizedStandardCompare:v9];
  return v10;
}

- (void)_didFinishUpdateTransactionWithAffectedItems:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)HUServiceDetailsItemManager;
  id v4 = a3;
  [(HFItemManager *)&v8 _didFinishUpdateTransactionWithAffectedItems:v4];
  id v5 = [(HUServiceDetailsItemManager *)self firmwareUpdateItemProvider];
  uint64_t v6 = [v5 items];
  int v7 = [v6 intersectsSet:v4];

  if (v7) {
    [(HFItemManager *)self recalculateVisibilityAndSortAllItems];
  }
}

- (BOOL)_shouldDisableOptionalDataDuringFastInitialUpdate
{
  return 0;
}

- (BOOL)controlAndCharacteristicStateItemModule:(id)a3 shouldShowControlPanelItem:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(HUServiceDetailsItemManager *)self serviceDetailsDelegate];
  LOBYTE(self) = [v6 itemManager:self shouldShowControlPanelItem:v5];

  return (char)self;
}

- (BOOL)controlAndCharacteristicStateItemModule:(id)a3 shouldShowSectionTitleForControlPanelItem:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(HUServiceDetailsItemManager *)self serviceDetailsDelegate];
  LOBYTE(self) = [v6 itemManager:self shouldShowSectionTitleForControlPanelItem:v5];

  return (char)self;
}

- (id)controlAndCharacteristicStateItemModule:(id)a3 childItemsForItem:(id)a4
{
  return [(HFItemManager *)self childItemsForItem:a4];
}

- (id)controlAndCharacteristicStateItemModule:(id)a3 sectionTitleForControlPanelItem:(id)a4 forServiceItem:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  int v9 = [(HUServiceDetailsItemManager *)self serviceDetailsDelegate];
  uint64_t v10 = [v9 itemManager:self sectionTitleForControlPanelItem:v8 forServiceItem:v7];

  return v10;
}

- (id)controlAndCharacteristicStateItemModule:(id)a3 sectionFooterForControlPanelItem:(id)a4 forServiceItem:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  int v9 = [(HUServiceDetailsItemManager *)self serviceDetailsDelegate];
  uint64_t v10 = [v9 itemManager:self sectionFooterForControlPanelItem:v8 forServiceItem:v7];

  return v10;
}

- (void)didUpdateDiagnosticInfo:(id)a3 forAccessory:(id)a4
{
  id v6 = a4;
  id v7 = [(HUServiceDetailsItemManager *)self sourceItemAccessory];
  int v8 = [v7 isEqual:v6];

  if (v8)
  {
    id v10 = [(HUServiceDetailsItemManager *)self _itemsToUpdateForDiagnosticInfoUpdate];
    id v9 = [(HFItemManager *)self updateResultsForItems:v10 senderSelector:a2];
  }
}

- (id)_characteristicSectionForIdentifier:(id)a3
{
  v79[22] = *MEMORY[0x1E4F143B8];
  id v76 = a3;
  uint64_t v4 = [(HUServiceDetailsItemManager *)self splitMediaAccountSections];
  v75 = (void *)v4;
  uint64_t v5 = MEMORY[0x1E4F1CBF0];
  if (v4) {
    uint64_t v6 = v4;
  }
  else {
    uint64_t v6 = MEMORY[0x1E4F1CBF0];
  }
  v79[0] = v6;
  uint64_t v7 = [(HUServiceDetailsItemManager *)self nameAndIconSections];
  v74 = (void *)v7;
  if (v7) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = v5;
  }
  v79[1] = v8;
  uint64_t v9 = [(HUServiceDetailsItemManager *)self characteristicSections];
  id v73 = (void *)v9;
  if (v9) {
    uint64_t v10 = v9;
  }
  else {
    uint64_t v10 = v5;
  }
  v79[2] = v10;
  uint64_t v11 = [(HUServiceDetailsItemManager *)self containedAccessoriesSections];
  id v72 = (void *)v11;
  if (v11) {
    uint64_t v12 = v11;
  }
  else {
    uint64_t v12 = v5;
  }
  v79[3] = v12;
  uint64_t v13 = [(HUServiceDetailsItemManager *)self homeKitAccessorySettingsSections];
  int v71 = (void *)v13;
  if (v13) {
    uint64_t v14 = v13;
  }
  else {
    uint64_t v14 = v5;
  }
  void v79[4] = v14;
  uint64_t v15 = [(HUServiceDetailsItemManager *)self accessorySettingsSections];
  v70 = (void *)v15;
  if (v15) {
    uint64_t v16 = v15;
  }
  else {
    uint64_t v16 = v5;
  }
  v79[5] = v16;
  uint64_t v17 = [(HUServiceDetailsItemManager *)self relatedTriggerSections];
  id v69 = (void *)v17;
  if (v17) {
    uint64_t v18 = v17;
  }
  else {
    uint64_t v18 = v5;
  }
  v79[6] = v18;
  uint64_t v19 = [(HUServiceDetailsItemManager *)self programmableSwitchSections];
  v68 = (void *)v19;
  if (v19) {
    uint64_t v20 = v19;
  }
  else {
    uint64_t v20 = v5;
  }
  v79[7] = v20;
  uint64_t v21 = [(HUServiceDetailsItemManager *)self softwareUpdateSections];
  v67 = (void *)v21;
  if (v21) {
    uint64_t v22 = v21;
  }
  else {
    uint64_t v22 = v5;
  }
  v79[8] = v22;
  uint64_t v23 = [(HUServiceDetailsItemManager *)self valveEditorSections];
  v66 = (void *)v23;
  if (v23) {
    uint64_t v24 = v23;
  }
  else {
    uint64_t v24 = v5;
  }
  v79[9] = v24;
  uint64_t v25 = [(HUServiceDetailsItemManager *)self sceneAndTriggerSections];
  id v65 = (void *)v25;
  if (v25) {
    uint64_t v26 = v25;
  }
  else {
    uint64_t v26 = v5;
  }
  v79[10] = v26;
  uint64_t v27 = [(HUServiceDetailsItemManager *)self connectedServicesSections];
  v64 = (void *)v27;
  if (v27) {
    uint64_t v28 = v27;
  }
  else {
    uint64_t v28 = v5;
  }
  v79[11] = v28;
  uint64_t v29 = [(HUServiceDetailsItemManager *)self inputSourceEditorSections];
  int v63 = (void *)v29;
  if (v29) {
    uint64_t v30 = v29;
  }
  else {
    uint64_t v30 = v5;
  }
  v79[12] = v30;
  uint64_t v31 = [(HUServiceDetailsItemManager *)self televisionSettingsSections];
  uint64_t v32 = (void *)v31;
  if (v31) {
    uint64_t v33 = v31;
  }
  else {
    uint64_t v33 = v5;
  }
  v79[13] = v33;
  uint64_t v34 = [(HUServiceDetailsItemManager *)self advancedCameraSettingsSection];
  uint64_t v35 = (void *)v34;
  if (v34) {
    uint64_t v36 = v34;
  }
  else {
    uint64_t v36 = v5;
  }
  v79[14] = v36;
  uint64_t v37 = [(HUServiceDetailsItemManager *)self cameraActivityZonesSections];
  v38 = (void *)v37;
  if (v37) {
    uint64_t v39 = v37;
  }
  else {
    uint64_t v39 = v5;
  }
  v79[15] = v39;
  uint64_t v40 = [(HUServiceDetailsItemManager *)self cameraStatusLightSections];
  uint64_t v41 = (void *)v40;
  if (v40) {
    uint64_t v42 = v40;
  }
  else {
    uint64_t v42 = v5;
  }
  v79[16] = v42;
  uint64_t v43 = [(HUServiceDetailsItemManager *)self cameraNightModeSections];
  BOOL v44 = (void *)v43;
  if (v43) {
    uint64_t v45 = v43;
  }
  else {
    uint64_t v45 = v5;
  }
  v79[17] = v45;
  uint64_t v46 = [(HUServiceDetailsItemManager *)self doorbellMuteSections];
  uint64_t v47 = (void *)v46;
  if (v46) {
    uint64_t v48 = v46;
  }
  else {
    uint64_t v48 = v5;
  }
  v79[18] = v48;
  uint64_t v49 = [(HUServiceDetailsItemManager *)self collectDiagnosticsSections];
  BOOL v50 = (void *)v49;
  if (v49) {
    uint64_t v51 = v49;
  }
  else {
    uint64_t v51 = v5;
  }
  v79[19] = v51;
  uint64_t v52 = [(HUServiceDetailsItemManager *)self lockAddHomeKeyToWalletSections];
  uint64_t v53 = (void *)v52;
  if (v52) {
    uint64_t v54 = v52;
  }
  else {
    uint64_t v54 = v5;
  }
  v79[20] = v54;
  uint64_t v55 = [(HUServiceDetailsItemManager *)self homeTheaterAudioSections];
  v56 = (void *)v55;
  if (v55) {
    uint64_t v57 = v55;
  }
  else {
    uint64_t v57 = v5;
  }
  v79[21] = v57;
  v58 = [MEMORY[0x1E4F1C978] arrayWithObjects:v79 count:22];
  v62 = objc_msgSend(v58, "na_arrayByFlattening");

  v77[0] = MEMORY[0x1E4F143A8];
  v77[1] = 3221225472;
  v77[2] = __67__HUServiceDetailsItemManager__characteristicSectionForIdentifier___block_invoke;
  v77[3] = &unk_1E638BEA0;
  id v78 = v76;
  id v59 = v76;
  objc_super v60 = objc_msgSend(v62, "na_firstObjectPassingTest:", v77);

  return v60;
}

uint64_t __67__HUServiceDetailsItemManager__characteristicSectionForIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 identifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (BOOL)_shouldShowFirmwareUpdateSection
{
  id v2 = [(HUServiceDetailsItemManager *)self firmwareUpdateItemProvider];
  id v3 = [v2 items];
  char v4 = objc_msgSend(v3, "na_any:", &__block_literal_global_403_0);

  return v4;
}

uint64_t __63__HUServiceDetailsItemManager__shouldShowFirmwareUpdateSection__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 latestResults];
  id v3 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F68B10]];
  uint64_t v4 = [v3 BOOLValue] ^ 1;

  return v4;
}

- (BOOL)_shouldShowLinkedApplicationSection
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ([(HUServiceDetailsItemManager *)self _shouldShowFirmwareUpdateSection]) {
    return 0;
  }
  id v3 = [(HFItemManager *)self home];
  int v4 = objc_msgSend(v3, "hf_currentUserIsRestrictedGuest");

  if (v4)
  {
    uint64_t v5 = HFLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = [(HFItemManager *)self home];
      uint64_t v7 = [v6 currentUser];
      uint64_t v8 = objc_msgSend(v7, "hf_prettyDescription");
      int v13 = 136315394;
      uint64_t v14 = "-[HUServiceDetailsItemManager _shouldShowLinkedApplicationSection]";
      __int16 v15 = 2112;
      uint64_t v16 = v8;
      _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "(%s) Hiding linked application section because current user is a restricted guest: %@", (uint8_t *)&v13, 0x16u);
    }
    return 0;
  }
  uint64_t v10 = [(HUServiceDetailsItemManager *)self linkedApplicationItemProvider];
  uint64_t v11 = [v10 items];
  char v12 = objc_msgSend(v11, "na_any:", &__block_literal_global_405_0);

  return v12;
}

uint64_t __66__HUServiceDetailsItemManager__shouldShowLinkedApplicationSection__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 latestResults];
  id v3 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F68B10]];
  uint64_t v4 = [v3 BOOLValue] ^ 1;

  return v4;
}

- (BOOL)_isGroupedHomePod
{
  id v3 = [(HUServiceDetailsItemManager *)self sourceServiceItem];
  if ([v3 conformsToProtocol:&unk_1F1A3D6E8]) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  id v5 = v4;

  objc_opt_class();
  uint64_t v6 = [(HUServiceDetailsItemManager *)self sourceServiceItem];
  if (objc_opt_isKindOfClass()) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }
  id v8 = v7;

  BOOL v9 = (unint64_t)[v5 numberOfItemsContainedWithinGroup] >= 2
    && [v5 isItemGroup]
    && [(HUServiceDetailsItemManager *)self _isRestartSupportedForGroupedHomePod:v8];

  return v9;
}

- (BOOL)_isSingleHomePodInGroup
{
  id v3 = [(HUServiceDetailsItemManager *)self sourceServiceItem];
  if ([v3 conformsToProtocol:&unk_1F1A3D6E8]) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  id v5 = v4;

  objc_opt_class();
  uint64_t v6 = [(HUServiceDetailsItemManager *)self sourceServiceItem];
  if (objc_opt_isKindOfClass()) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }
  id v8 = v7;

  uint64_t v9 = [v5 numberOfItemsContainedWithinGroup];
  if (v9 == 1) {
    char v10 = [v8 isContainedWithinItemGroup];
  }
  else {
    char v10 = 0;
  }

  return v10;
}

- (BOOL)_isRestartSupportedForGroupedHomePod:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = [a3 mediaProfileContainer];
  uint64_t v4 = [v3 accessories];

  int v5 = objc_msgSend(v4, "na_all:", &__block_literal_global_407);
  uint64_t v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = @"NO";
    if (v5) {
      uint64_t v7 = @"YES";
    }
    int v9 = 136315394;
    char v10 = "-[HUServiceDetailsItemManager _isRestartSupportedForGroupedHomePod:]";
    __int16 v11 = 2112;
    char v12 = v7;
    _os_log_impl(&dword_1BE345000, v6, OS_LOG_TYPE_DEFAULT, "%s Restart Option Supported for Grouped HomePod %@", (uint8_t *)&v9, 0x16u);
  }

  return v5;
}

uint64_t __68__HUServiceDetailsItemManager__isRestartSupportedForGroupedHomePod___block_invoke(uint64_t a1, void *a2)
{
  return [a2 supportsCompanionInitiatedRestart];
}

- (BOOL)_areHomePodMediaAccountsMismatched
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ([(HUServiceDetailsItemManager *)self sourceItemIsHomePod])
  {
    id v3 = [(HUServiceDetailsItemManager *)self loggedInMediaAccountOnHomePod];
    objc_opt_class();
    uint64_t v4 = [(HUServiceDetailsItemManager *)self homeMediaAccount];
    if (objc_opt_isKindOfClass()) {
      int v5 = v4;
    }
    else {
      int v5 = 0;
    }
    id v6 = v5;

    uint64_t v7 = HFLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412546;
      uint64_t v13 = v3;
      __int16 v14 = 2112;
      id v15 = v6;
      _os_log_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEFAULT, "HomePod logged in account = [%@], appleMusicAccountForCurrentHome = [%@]", (uint8_t *)&v12, 0x16u);
    }

    if (v3)
    {
      id v8 = objc_msgSend(v3, "ams_altDSID");
      int v9 = objc_msgSend(v6, "ams_altDSID");
      int v10 = [v8 isEqualToString:v9] ^ 1;
    }
    else
    {
      LOBYTE(v10) = 0;
    }
  }
  else
  {
    LOBYTE(v10) = 0;
  }
  return v10;
}

- (BOOL)_hasDismissedHomePodHasNonMemberMediaAccountWarning
{
  objc_opt_class();
  id v3 = [(HUServiceDetailsItemManager *)self sourceServiceItem];
  if (objc_opt_isKindOfClass()) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  id v5 = v4;

  id v6 = [v5 mediaProfileContainer];

  uint64_t v7 = objc_msgSend(v6, "hf_settingsValueManager");

  id v8 = [v7 valueForSettingAtKeyPath:*MEMORY[0x1E4F684A8]];
  char v9 = [v8 BOOLValue];

  return v9;
}

- (ACAccount)loggedInMediaAccountOnHomePod
{
  if ([(HUServiceDetailsItemManager *)self sourceItemIsHomePod])
  {
    objc_opt_class();
    id v3 = [(HUServiceDetailsItemManager *)self sourceServiceItem];
    if (objc_opt_isKindOfClass()) {
      uint64_t v4 = v3;
    }
    else {
      uint64_t v4 = 0;
    }
    id v5 = v4;

    id v6 = [v5 mediaProfileContainer];

    uint64_t v7 = objc_msgSend(v6, "hf_appleMusicCurrentLoggedInAccount");
  }
  else
  {
    uint64_t v7 = 0;
  }

  return (ACAccount *)v7;
}

- (BOOL)shouldShowDeviceOptionsForAccessoryItem:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (!v4)
  {
    uint64_t v7 = HFLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 136315138;
      uint64_t v16 = "-[HUServiceDetailsItemManager shouldShowDeviceOptionsForAccessoryItem:]";
      id v8 = "%s mediaAccessoryItem is NIL, hence NOT showing Reset HomePod";
      goto LABEL_16;
    }
LABEL_17:
    LOBYTE(v6) = 0;
    goto LABEL_18;
  }
  id v6 = [v4 mediaProfileContainer];

  if (v6)
  {
    if ([(HUServiceDetailsItemManager *)self isItemGroup])
    {
      uint64_t v7 = HFLogForCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 136315138;
        uint64_t v16 = "-[HUServiceDetailsItemManager shouldShowDeviceOptionsForAccessoryItem:]";
        id v8 = "%s HomePod is a Grouped item part of Stereo Setup or PSG, hence NOT showing Reset HomePod";
LABEL_16:
        _os_log_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v15, 0xCu);
        goto LABEL_17;
      }
      goto LABEL_17;
    }
    char v9 = [v5 mediaProfileContainer];
    int v10 = objc_msgSend(v9, "hf_backingAccessory");
    char v11 = [v10 supportsCompanionInitiatedRestart];

    if ((v11 & 1) == 0)
    {
      uint64_t v7 = HFLogForCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 136315138;
        uint64_t v16 = "-[HUServiceDetailsItemManager shouldShowDeviceOptionsForAccessoryItem:]";
        id v8 = "%s HomePod doesn't support restart functionality, hence NOT showing Reset HomePod";
        goto LABEL_16;
      }
      goto LABEL_17;
    }
    if ([v5 isHomePodMediaSystem])
    {
      uint64_t v7 = HFLogForCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 136315138;
        uint64_t v16 = "-[HUServiceDetailsItemManager shouldShowDeviceOptionsForAccessoryItem:]";
        id v8 = "%s HomePod is part of Stereo Setup, hence NOT showing Reset HomePod";
        goto LABEL_16;
      }
      goto LABEL_17;
    }
    char v13 = [v5 isHomePod];
    uint64_t v7 = HFLogForCategory();
    BOOL v14 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if ((v13 & 1) == 0)
    {
      if (!v14) {
        goto LABEL_17;
      }
      int v15 = 136315138;
      uint64_t v16 = "-[HUServiceDetailsItemManager shouldShowDeviceOptionsForAccessoryItem:]";
      id v8 = "%s Accessory is not of type HomePod, hence NOT showing Reset HomePod";
      goto LABEL_16;
    }
    if (v14)
    {
      int v15 = 136315138;
      uint64_t v16 = "-[HUServiceDetailsItemManager shouldShowDeviceOptionsForAccessoryItem:]";
      _os_log_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEFAULT, "%s All set, show Reset HomePod", (uint8_t *)&v15, 0xCu);
    }
    LOBYTE(v6) = 1;
  }
  else
  {
    uint64_t v7 = HFLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 136315138;
      uint64_t v16 = "-[HUServiceDetailsItemManager shouldShowDeviceOptionsForAccessoryItem:]";
      id v8 = "%s mediaProfileContainer is NIL, hence NOT showing Reset HomePod";
      goto LABEL_16;
    }
  }
LABEL_18:

  return (char)v6;
}

- (BOOL)shouldShowExportDiagnosticsItem:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (!v4)
  {
    uint64_t v7 = HFLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136315138;
      char v13 = "-[HUServiceDetailsItemManager shouldShowExportDiagnosticsItem:]";
      id v8 = "%s mediaAccessoryItem is NIL, hence NOT showing Export Diagnostics";
      goto LABEL_19;
    }
LABEL_20:
    LOBYTE(v6) = 0;
    goto LABEL_21;
  }
  id v6 = [v4 mediaProfileContainer];

  if (v6)
  {
    if ([(HUServiceDetailsItemManager *)self isItemGroup])
    {
      uint64_t v7 = HFLogForCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 136315138;
        char v13 = "-[HUServiceDetailsItemManager shouldShowExportDiagnosticsItem:]";
        id v8 = "%s HomePod is a Grouped item part of Stereo Setup or PSG, hence NOT showing Export Diagnostics";
LABEL_19:
        _os_log_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v12, 0xCu);
        goto LABEL_20;
      }
      goto LABEL_20;
    }
    if ([v5 isHomePodMediaSystem])
    {
      uint64_t v7 = HFLogForCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 136315138;
        char v13 = "-[HUServiceDetailsItemManager shouldShowExportDiagnosticsItem:]";
        id v8 = "%s HomePod is part of Stereo Setup, hence NOT showing Export Diagnostics";
        goto LABEL_19;
      }
      goto LABEL_20;
    }
    char v9 = [v5 isHomePod];
    uint64_t v7 = HFLogForCategory();
    BOOL v10 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if ((v9 & 1) == 0)
    {
      if (v10)
      {
        int v12 = 136315138;
        char v13 = "-[HUServiceDetailsItemManager shouldShowExportDiagnosticsItem:]";
        id v8 = "%s Accessory is not of type HomePod, hence NOT showing Export Diagnostics";
        goto LABEL_19;
      }
      goto LABEL_20;
    }
    if (v10)
    {
      int v12 = 136315138;
      char v13 = "-[HUServiceDetailsItemManager shouldShowExportDiagnosticsItem:]";
      _os_log_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEFAULT, "%s All set, show Export Diagnostics", (uint8_t *)&v12, 0xCu);
    }
    LOBYTE(v6) = 1;
  }
  else
  {
    uint64_t v7 = HFLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136315138;
      char v13 = "-[HUServiceDetailsItemManager shouldShowExportDiagnosticsItem:]";
      id v8 = "%s mediaProfileContainer is NIL, hence NOT showing Export Diagnostics";
      goto LABEL_19;
    }
  }
LABEL_21:

  return (char)v6;
}

- (id)hf_MediaAccessoryItem
{
  objc_opt_class();
  id v3 = [(HUServiceDetailsItemManager *)self sourceServiceItem];
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (void)_setupDeviceOptionsAdapterForMediaAccessoryItem:(id)a3
{
  id v6 = [a3 mediaProfileContainer];
  id v4 = objc_msgSend(v6, "hf_settingsAdapterManager");
  id v5 = [v4 adapterForIdentifier:*MEMORY[0x1E4F67FA8]];
  [(HUServiceDetailsItemManager *)self setDeviceOptionsAdapter:v5];
}

- (void)registerKVO
{
  id v3 = [(HUServiceDetailsItemManager *)self deviceOptionsAdapter];
  [v3 addObserver:self forKeyPath:@"isAccessoryReachableOverRapport" options:1 context:0];
}

- (void)unregisterKVO
{
  id v3 = [(HUServiceDetailsItemManager *)self deviceOptionsAdapter];
  [v3 removeObserver:self forKeyPath:@"isAccessoryReachableOverRapport"];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && [v11 isEqualToString:@"isAccessoryReachableOverRapport"])
  {
    SEL v48 = a2;
    uint64_t v14 = objc_opt_new();
    int v15 = [(HUServiceDetailsItemManager *)self accessoryResetAndRemoveItemProvider];

    if (v15)
    {
      uint64_t v16 = [(HUServiceDetailsItemManager *)self accessoryResetAndRemoveItemProvider];
      [v14 addObject:v16];
    }
    uint64_t v17 = [(HUServiceDetailsItemManager *)self exportDiagnosticsItemProvider];

    if (v17)
    {
      uint64_t v18 = [(HUServiceDetailsItemManager *)self exportDiagnosticsItemProvider];
      [v14 addObject:v18];
    }
    BOOL v50 = v14;
    uint64_t v19 = [(HUServiceDetailsItemManager *)self hf_MediaAccessoryItem];
    uint64_t v20 = [(HUServiceDetailsItemManager *)self deviceOptionsAdapter];
    int v21 = [v20 isAccessoryReachableOverRapport];

    uint64_t v22 = HFLogForCategory();
    BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
    if (v21)
    {
      if (v23)
      {
        uint64_t v24 = [v19 mediaProfileContainer];
        uint64_t v25 = [v24 uniqueIdentifier];
        uint64_t v26 = [v25 UUIDString];
        *(_DWORD *)buf = 138412290;
        uint64_t v53 = v26;
        _os_log_impl(&dword_1BE345000, v22, OS_LOG_TYPE_DEFAULT, "Solo Accessory is reachable over Rapport..%@", buf, 0xCu);
      }
      uint64_t v27 = [MEMORY[0x1E4F69290] sharedInstance];
      uint64_t v28 = [v19 mediaProfileContainer];
      uint64_t v29 = objc_msgSend(v28, "hf_backingAccessory");
      uint64_t v30 = [v29 uniqueIdentifier];
      uint64_t v31 = [v30 UUIDString];
      [v27 markUUIDReachableViaRapport:v31];

      uint64_t v32 = [MEMORY[0x1E4F69290] sharedInstance];
      uint64_t v33 = [v19 mediaProfileContainer];
      uint64_t v34 = objc_msgSend(v33, "hf_backingAccessory");
      uint64_t v35 = [v34 uniqueIdentifier];
      uint64_t v36 = [v35 UUIDString];
      uint64_t v37 = v32;
      uint64_t v38 = 3;
    }
    else
    {
      if (v23)
      {
        uint64_t v39 = [v19 mediaProfileContainer];
        uint64_t v40 = [v39 uniqueIdentifier];
        uint64_t v41 = [v40 UUIDString];
        *(_DWORD *)buf = 138412290;
        uint64_t v53 = v41;
        _os_log_impl(&dword_1BE345000, v22, OS_LOG_TYPE_DEFAULT, "Solo Accessory is NOT reachable over Rapport..%@", buf, 0xCu);
      }
      uint64_t v42 = [MEMORY[0x1E4F69290] sharedInstance];
      uint64_t v43 = [v19 mediaProfileContainer];
      BOOL v44 = objc_msgSend(v43, "hf_backingAccessory");
      uint64_t v45 = [v44 uniqueIdentifier];
      uint64_t v46 = [v45 UUIDString];
      [v42 markUUIDUnreachableViaRapport:v46];

      uint64_t v32 = [MEMORY[0x1E4F69290] sharedInstance];
      uint64_t v33 = [v19 mediaProfileContainer];
      uint64_t v34 = objc_msgSend(v33, "hf_backingAccessory");
      uint64_t v35 = [v34 uniqueIdentifier];
      uint64_t v36 = [v35 UUIDString];
      uint64_t v37 = v32;
      uint64_t v38 = 2;
    }
    [v37 updateHomePodAccessoryRestartState:v38 with:v36];

    if (v50) {
      id v47 = [(HFItemManager *)self reloadAndUpdateItemsForProviders:v50 senderSelector:v49];
    }
  }
  else
  {
    v51.receiver = self;
    v51.super_class = (Class)HUServiceDetailsItemManager;
    [(HUServiceDetailsItemManager *)&v51 observeValueForKeyPath:v11 ofObject:v12 change:v13 context:a6];
  }
}

- (void)restartAccessory
{
  id v2 = [(HUServiceDetailsItemManager *)self _restartAccessory];
}

- (id)_restartAccessory
{
  BOOL v3 = [(HUServiceDetailsItemManager *)self _isGroupedHomePod];
  uint64_t v4 = HFLogForCategory();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "Sending restart message to grouped homepod accessory", buf, 2u);
    }

    id v6 = [(HUServiceDetailsItemManager *)self deviceOptionsAdapterUtility];

    if (v6)
    {
      uint64_t v7 = [(HUServiceDetailsItemManager *)self deviceOptionsAdapterUtility];
      id v8 = [v7 restartAccessories];
      char v9 = v8;
      uint64_t v22 = MEMORY[0x1E4F143A8];
      uint64_t v23 = 3221225472;
      uint64_t v24 = __48__HUServiceDetailsItemManager__restartAccessory__block_invoke;
      uint64_t v25 = &unk_1E63850B8;
      uint64_t v26 = self;
      BOOL v10 = &v22;
LABEL_10:
      id v12 = objc_msgSend(v8, "addCompletionBlock:", v10, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26);

      goto LABEL_15;
    }
    id v13 = HFLogForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      uint64_t v14 = "deviceOptionsAdapterUtility is nil";
LABEL_19:
      _os_log_error_impl(&dword_1BE345000, v13, OS_LOG_TYPE_ERROR, v14, buf, 2u);
    }
  }
  else
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "Sending restart message to solo homepod accessory", buf, 2u);
    }

    id v11 = [(HUServiceDetailsItemManager *)self deviceOptionsAdapter];

    if (v11)
    {
      uint64_t v7 = [(HUServiceDetailsItemManager *)self deviceOptionsAdapter];
      id v8 = [v7 restartAccessory];
      char v9 = v8;
      uint64_t v17 = MEMORY[0x1E4F143A8];
      uint64_t v18 = 3221225472;
      uint64_t v19 = __48__HUServiceDetailsItemManager__restartAccessory__block_invoke_421;
      uint64_t v20 = &unk_1E63850B8;
      int v21 = self;
      BOOL v10 = &v17;
      goto LABEL_10;
    }
    id v13 = HFLogForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      uint64_t v14 = "deviceOptionsAdapter is nil";
      goto LABEL_19;
    }
  }

  int v15 = (void *)MEMORY[0x1E4F7A0D8];
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F28C58], "hf_errorWithCode:", 25);
  id v12 = [v15 futureWithError:v7];
LABEL_15:

  return v12;
}

void __48__HUServiceDetailsItemManager__restartAccessory__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    uint64_t v4 = HFLogForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "Error sending restart message to group accessory", buf, 2u);
    }

    objc_opt_class();
    BOOL v5 = [*(id *)(a1 + 32) sourceServiceItem];
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
    id v7 = v6;

    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v8 = [v7 accessories];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v31 objects:v37 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v32 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          uint64_t v14 = [MEMORY[0x1E4F69290] sharedInstance];
          int v15 = [v13 uniqueIdentifier];
          uint64_t v16 = [v15 UUIDString];
          [v14 updateHomePodAccessoryRestartState:3 with:v16];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v31 objects:v37 count:16];
      }
      while (v10);
    }
  }
  else
  {
    objc_opt_class();
    uint64_t v17 = [*(id *)(a1 + 32) sourceServiceItem];
    if (objc_opt_isKindOfClass()) {
      uint64_t v18 = v17;
    }
    else {
      uint64_t v18 = 0;
    }
    id v7 = v18;

    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v8 = objc_msgSend(v7, "accessories", 0);
    uint64_t v19 = [v8 countByEnumeratingWithState:&v27 objects:v36 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v28;
      do
      {
        for (uint64_t j = 0; j != v20; ++j)
        {
          if (*(void *)v28 != v21) {
            objc_enumerationMutation(v8);
          }
          uint64_t v23 = *(void **)(*((void *)&v27 + 1) + 8 * j);
          uint64_t v24 = [MEMORY[0x1E4F69290] sharedInstance];
          uint64_t v25 = [v23 uniqueIdentifier];
          uint64_t v26 = [v25 UUIDString];
          [v24 updateHomePodAccessoryRestartState:1 with:v26];
        }
        uint64_t v20 = [v8 countByEnumeratingWithState:&v27 objects:v36 count:16];
      }
      while (v20);
    }
  }
}

void __48__HUServiceDetailsItemManager__restartAccessory__block_invoke_421(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    uint64_t v4 = HFLogForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "Error sending restart message to accessory", buf, 2u);
    }

    BOOL v5 = objc_msgSend(*(id *)(a1 + 32), "hf_MediaAccessoryItem");
    id v6 = [MEMORY[0x1E4F69290] sharedInstance];
    id v7 = [v5 mediaProfileContainer];
    id v8 = objc_msgSend(v7, "hf_backingAccessory");
    uint64_t v9 = [v8 uniqueIdentifier];
    uint64_t v10 = [v9 UUIDString];
    [v6 updateHomePodAccessoryRestartState:3 with:v10];

    id v11 = (id)[v5 updateWithOptions:MEMORY[0x1E4F1CC08]];
  }
  else
  {
    BOOL v5 = objc_msgSend(*(id *)(a1 + 32), "hf_MediaAccessoryItem");
    id v12 = [MEMORY[0x1E4F69290] sharedInstance];
    id v13 = [v5 mediaProfileContainer];
    uint64_t v14 = objc_msgSend(v13, "hf_backingAccessory");
    int v15 = [v14 uniqueIdentifier];
    uint64_t v16 = [v15 UUIDString];
    [v12 updateHomePodAccessoryRestartState:1 with:v16];

    uint64_t v17 = HFLogForCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v18 = 0;
      _os_log_impl(&dword_1BE345000, v17, OS_LOG_TYPE_DEFAULT, "Successfully sent restart message to accessory", v18, 2u);
    }
  }
}

- (void)resetAccessory
{
  id v2 = [(HUServiceDetailsItemManager *)self _resetAccessory];
}

- (id)_resetAccessory
{
  if ([(HUServiceDetailsItemManager *)self _isGroupedHomePod]) {
    NSLog(&cfstr_SendingObliter.isa);
  }
  BOOL v3 = HFLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE345000, v3, OS_LOG_TYPE_DEFAULT, "Sending obliterate message to solo HomePod", buf, 2u);
  }

  uint64_t v4 = [(HUServiceDetailsItemManager *)self deviceOptionsAdapter];

  if (v4)
  {
    BOOL v5 = [(HUServiceDetailsItemManager *)self deviceOptionsAdapter];
    id v6 = [v5 resetAccessory];
    id v7 = [v6 addCompletionBlock:&__block_literal_global_426];
  }
  else
  {
    id v8 = HFLogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v11 = 0;
      _os_log_error_impl(&dword_1BE345000, v8, OS_LOG_TYPE_ERROR, "deviceOptionsAdapter is nil", v11, 2u);
    }

    uint64_t v9 = (void *)MEMORY[0x1E4F7A0D8];
    BOOL v5 = objc_msgSend(MEMORY[0x1E4F28C58], "hf_errorWithCode:", 25);
    id v7 = [v9 futureWithError:v5];
  }

  return v7;
}

void __46__HUServiceDetailsItemManager__resetAccessory__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  id v6 = objc_opt_new();
  id v7 = HFLogForCategory();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v8)
    {
      int v17 = 138412290;
      id v18 = v5;
      _os_log_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEFAULT, "Error sending obliterate message: %@", (uint8_t *)&v17, 0xCu);
    }

    [v6 setObject:v5 forKey:*MEMORY[0x1E4F68228]];
  }
  else
  {
    if (v8)
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEFAULT, "Successfully sent obliterate message", (uint8_t *)&v17, 2u);
    }

    objc_opt_class();
    id v9 = v4;
    if (objc_opt_isKindOfClass()) {
      uint64_t v10 = v9;
    }
    else {
      uint64_t v10 = 0;
    }
    id v11 = v10;

    objc_opt_class();
    id v12 = [v11 objectForKeyedSubscript:@"dp"];
    if (objc_opt_isKindOfClass()) {
      id v13 = v12;
    }
    else {
      id v13 = 0;
    }
    id v14 = v13;

    if (v14) {
      [v6 setObject:v14 forKey:*MEMORY[0x1E4F68230]];
    }
  }
  int v15 = (void *)MEMORY[0x1E4F68EE0];
  uint64_t v16 = (void *)[v6 copy];
  [v15 sendEvent:56 withData:v16];
}

- (void)_setupDeviceOptionsAdapterUtilityForGroupedAccessories:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F68E58];
  id v5 = a3;
  id v6 = [v4 alloc];
  id v8 = [v5 mediaProfileContainer];

  id v7 = (void *)[v6 initWithHomeKitSettingsVendor:v8 mode:0 groupedAccessory:1 delegate:self];
  [(HUServiceDetailsItemManager *)self setDeviceOptionsAdapterUtility:v7];
}

- (void)accessoryReachableOverRapport:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = @"NO";
    if (v3) {
      id v7 = @"YES";
    }
    *(_DWORD *)buf = 136315394;
    uint64_t v41 = "-[HUServiceDetailsItemManager accessoryReachableOverRapport:]";
    __int16 v42 = 2112;
    uint64_t v43 = v7;
    _os_log_impl(&dword_1BE345000, v6, OS_LOG_TYPE_DEFAULT, "%s HomePod Stereo Setup Restart Button Available %@", buf, 0x16u);
  }

  [(HUServiceDetailsItemManager *)self setGroupedAccessoryReachableOverRapport:v3];
  id v8 = objc_opt_new();
  id v9 = [(HUServiceDetailsItemManager *)self accessoryResetAndRemoveItemProvider];

  if (v9)
  {
    uint64_t v10 = [(HUServiceDetailsItemManager *)self accessoryResetAndRemoveItemProvider];
    [v8 addObject:v10];
  }
  id v11 = [(HUServiceDetailsItemManager *)self exportDiagnosticsItemProvider];

  if (v11)
  {
    id v12 = [(HUServiceDetailsItemManager *)self exportDiagnosticsItemProvider];
    [v8 addObject:v12];
  }
  id v13 = [(HUServiceDetailsItemManager *)self hf_MediaAccessoryItem];
  if ([(HUServiceDetailsItemManager *)self _isGroupedHomePod])
  {
    BOOL v14 = [(HUServiceDetailsItemManager *)self groupedAccessoryReachableOverRapport];
    int v15 = HFLogForCategory();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
    if (v14)
    {
      if (v16)
      {
        int v17 = [v13 mediaProfileContainer];
        id v18 = [v17 uniqueIdentifier];
        uint64_t v19 = [v18 UUIDString];
        *(_DWORD *)buf = 138412290;
        uint64_t v41 = v19;
        _os_log_impl(&dword_1BE345000, v15, OS_LOG_TYPE_DEFAULT, "Grouped Accessory is reachable over Rapport..%@", buf, 0xCu);
      }
      uint64_t v20 = [MEMORY[0x1E4F69290] sharedInstance];
      uint64_t v21 = [v13 mediaProfileContainer];
      uint64_t v22 = [v21 uniqueIdentifier];
      uint64_t v23 = [v22 UUIDString];
      [v20 markUUIDReachableViaRapport:v23];

      uint64_t v24 = [MEMORY[0x1E4F69290] sharedInstance];
      uint64_t v25 = [v13 mediaProfileContainer];
      uint64_t v26 = [v25 uniqueIdentifier];
      long long v27 = [v26 UUIDString];
      long long v28 = v24;
      uint64_t v29 = 3;
    }
    else
    {
      if (v16)
      {
        long long v30 = [v13 mediaProfileContainer];
        long long v31 = [v30 uniqueIdentifier];
        long long v32 = [v31 UUIDString];
        *(_DWORD *)buf = 138412290;
        uint64_t v41 = v32;
        _os_log_impl(&dword_1BE345000, v15, OS_LOG_TYPE_DEFAULT, "Grouped Accessory is NOT reachable over Rapport..%@", buf, 0xCu);
      }
      long long v33 = [MEMORY[0x1E4F69290] sharedInstance];
      long long v34 = [v13 mediaProfileContainer];
      uint64_t v35 = [v34 uniqueIdentifier];
      uint64_t v36 = [v35 UUIDString];
      [v33 markUUIDUnreachableViaRapport:v36];

      uint64_t v24 = [MEMORY[0x1E4F69290] sharedInstance];
      uint64_t v25 = [v13 mediaProfileContainer];
      uint64_t v26 = [v25 uniqueIdentifier];
      long long v27 = [v26 UUIDString];
      long long v28 = v24;
      uint64_t v29 = 2;
    }
    [v28 updateHomePodAccessoryRestartState:v29 with:v27];
  }
  if (v8)
  {
    uint64_t v37 = [(HFItemManager *)self reloadAndUpdateItemsForProviders:v8 senderSelector:a2];
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __61__HUServiceDetailsItemManager_accessoryReachableOverRapport___block_invoke;
    v39[3] = &unk_1E6389828;
    v39[4] = self;
    id v38 = (id)[v37 addCompletionBlock:v39];
  }
}

void __61__HUServiceDetailsItemManager_accessoryReachableOverRapport___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) sourceItem];
  id v1 = (id)[v2 updateWithOptions:MEMORY[0x1E4F1CC08]];
}

- (BOOL)_shouldShowAccessoryInfoItems
{
  BOOL v3 = [(HUServiceDetailsItemManager *)self sourceItemAccessory];

  if (!v3) {
    goto LABEL_8;
  }
  if ([(HUServiceDetailsItemManager *)self isAccessory])
  {
    char isKindOfClass = 1;
    return isKindOfClass & 1;
  }
  if (![(HUServiceDetailsItemManager *)self sourceItemIsService])
  {
LABEL_8:
    char isKindOfClass = 0;
    return isKindOfClass & 1;
  }
  id v5 = [(HUServiceDetailsItemManager *)self sourceItemAccessory];
  if (objc_msgSend(v5, "hf_isMultiServiceAccessory"))
  {
    id v6 = [(HUServiceDetailsItemManager *)self sourceItemAccessory];
    if (objc_msgSend(v6, "hf_showAsIndividualServices"))
    {
      char isKindOfClass = 1;
    }
    else
    {
      id v7 = [(HUServiceDetailsItemManager *)self sourceItemAccessory];
      if (objc_msgSend(v7, "hf_canShowAsIndividualServices"))
      {
        id v8 = [(HFItemManager *)self sourceItem];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();
      }
      else
      {
        char isKindOfClass = 1;
      }
    }
  }
  else
  {
    char isKindOfClass = 1;
  }

  return isKindOfClass & 1;
}

- (BOOL)_shouldShowSplitAccountUI
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  BOOL v3 = [(HUServiceDetailsItemManager *)self sourceServiceItem];
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  uint64_t v6 = [(HUServiceDetailsItemManager *)self homeMediaAccount];
  if (v6
    && (id v7 = (void *)v6,
        [v5 mediaProfileContainer],
        id v8 = objc_claimAutoreleasedReturnValue(),
        int v9 = objc_msgSend(v8, "hf_homePodIsCapableOfShowingSplitAccountError"),
        v8,
        v7,
        v9))
  {
    uint64_t v10 = [v5 mediaProfileContainer];
    int v11 = objc_msgSend(v10, "hf_supportsPreferredMediaUser");
  }
  else
  {
    int v11 = 1;
  }
  BOOL v12 = [(HUServiceDetailsItemManager *)self _hasDismissedHomePodHasNonMemberMediaAccountWarning];
  id v13 = HFLogForCategory();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v20 = [(HUServiceDetailsItemManager *)self homeMediaAccount];
    uint64_t v21 = (void *)v20;
    uint64_t v22 = @"NO";
    if (v12) {
      uint64_t v22 = @"YES";
    }
    int v24 = 138412546;
    uint64_t v25 = v20;
    __int16 v26 = 2112;
    long long v27 = v22;
    _os_log_debug_impl(&dword_1BE345000, v13, OS_LOG_TYPE_DEBUG, "Home Media Account = [%@], hasDismissedHomePodHasNonMemberMediaAccountWarning = [%@]", (uint8_t *)&v24, 0x16u);
  }
  if ((v11 | v12))
  {
    BOOL v14 = 0;
  }
  else
  {
    BOOL v15 = [(HUServiceDetailsItemManager *)self sourceItemIsHomePodConfiguredForMultiUser];
    BOOL v16 = HFLogForCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      int v24 = 67109120;
      LODWORD(v25) = v15;
      _os_log_debug_impl(&dword_1BE345000, v16, OS_LOG_TYPE_DEBUG, "Accessory IS HomePod and Supports MU = %d", (uint8_t *)&v24, 8u);
    }

    BOOL v17 = [(HUServiceDetailsItemManager *)self _areHomePodMediaAccountsMismatched];
    id v18 = HFLogForCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v23 = @"NO";
      if (v17) {
        uint64_t v23 = @"YES";
      }
      int v24 = 138412290;
      uint64_t v25 = (uint64_t)v23;
      _os_log_debug_impl(&dword_1BE345000, v18, OS_LOG_TYPE_DEBUG, "Media Accounts Mismatched = [%@]", (uint8_t *)&v24, 0xCu);
    }

    BOOL v14 = v15 && v17;
  }

  return v14;
}

- (id)_itemsToUpdateWhenApplicationDidBecomeActive
{
  id v2 = (void *)MEMORY[0x1E4F1CAD0];
  BOOL v3 = [(HUServiceDetailsItemManager *)self lockAddHomeKeyToWalletItem];
  id v4 = objc_msgSend(v2, "na_setWithSafeObject:", v3);

  return v4;
}

- (id)_itemsToUpdateForDiagnosticInfoUpdate
{
  BOOL v3 = (void *)MEMORY[0x1E4F1CAD0];
  id v4 = [(HUServiceDetailsItemManager *)self headerItem];
  id v5 = [(HUServiceDetailsItemManager *)self accessoryInfoItemProvider];
  uint64_t v6 = [v5 items];
  id v7 = objc_msgSend(v3, "setWithObjects:", v4, v6, 0);
  id v8 = objc_msgSend(v7, "na_setByFlattening");

  return v8;
}

- (BOOL)_shouldHideHomePodAnalyticsAndImprovementsSettings
{
  return 0;
}

- (BOOL)_shouldShowContainedAccessoriesList
{
  return 0;
}

- (HFItemBuilderItem)builderItem
{
  return self->_builderItem;
}

- (HFServiceLikeBuilder)serviceLikeBuilder
{
  return self->_serviceLikeBuilder;
}

- (void)setServiceLikeBuilder:(id)a3
{
}

- (HFItemProvider)existingRoomItemProvider
{
  return self->_existingRoomItemProvider;
}

- (void)setExistingRoomItemProvider:(id)a3
{
}

- (HFItemProvider)suggestedRoomItemProvider
{
  return self->_suggestedRoomItemProvider;
}

- (void)setSuggestedRoomItemProvider:(id)a3
{
}

- (HFSelectedRoomItemProvider)selectedRoomItemProvider
{
  return self->_selectedRoomItemProvider;
}

- (void)setSelectedRoomItemProvider:(id)a3
{
}

- (HFAccessoryInfoDetailsItemProvider)accessoryInfoItemProvider
{
  return self->_accessoryInfoItemProvider;
}

- (void)setAccessoryInfoItemProvider:(id)a3
{
}

- (HUNameItemModule)nameModule
{
  return self->_nameModule;
}

- (void)setNameModule:(id)a3
{
}

- (HUAccessoryRepresentableItemModule)accessoryRepresentableItemModule
{
  return self->_accessoryRepresentableItemModule;
}

- (void)setAccessoryRepresentableItemModule:(id)a3
{
}

- (HUAccessorySettingsItemModule)accessorySettingsItemModule
{
  return self->_accessorySettingsItemModule;
}

- (void)setAccessorySettingsItemModule:(id)a3
{
}

- (HUSoftwareUpdateItemModule)softwareUpdateItemModule
{
  return self->_softwareUpdateItemModule;
}

- (void)setSoftwareUpdateItemModule:(id)a3
{
}

- (HUAvailableRelatedTriggerItemModule)relatedTriggerItemModule
{
  return self->_relatedTriggerItemModule;
}

- (void)setRelatedTriggerItemModule:(id)a3
{
}

- (HFRemoteControlItemModule)serviceDetailsRemoteControlItemModule
{
  return self->_serviceDetailsRemoteControlItemModule;
}

- (HUTelevisionSettingsItemModule)televisionSettingsItemModule
{
  return self->_televisionSettingsItemModule;
}

- (void)setTelevisionSettingsItemModule:(id)a3
{
}

- (HUInputSourceItemModule)inputSourceItemModule
{
  return self->_inputSourceItemModule;
}

- (void)setInputSourceItemModule:(id)a3
{
}

- (HUValveItemModule)valveEditorItemModule
{
  return self->_valveEditorItemModule;
}

- (void)setValveEditorItemModule:(id)a3
{
}

- (HUAccessoryServicesItemModule)accessoryServicesEditorItemModule
{
  return self->_accessoryServicesEditorItemModule;
}

- (HUAssociatedSceneAndTriggerModule)sceneAndTriggerModule
{
  return self->_sceneAndTriggerModule;
}

- (HUMatterConnectedServicesItemModule)connectedServicesItemModule
{
  return self->_connectedServicesItemModule;
}

- (HUAccessoryDebugModule)debugAccessoryItemModule
{
  return self->_debugAccessoryItemModule;
}

- (HFItem)selectedRoomItem
{
  return self->_selectedRoomItem;
}

- (HFItem)headerItem
{
  return self->_headerItem;
}

- (void)setHeaderItem:(id)a3
{
}

- (HFItem)splitMediaAccountTitleItem
{
  return self->_splitMediaAccountTitleItem;
}

- (void)setSplitMediaAccountTitleItem:(id)a3
{
}

- (HFItem)splitMediaAccountUseDefaultAccountItem
{
  return self->_splitMediaAccountUseDefaultAccountItem;
}

- (void)setSplitMediaAccountUseDefaultAccountItem:(id)a3
{
}

- (HFItem)splitMediaAccountSignoutAccountItem
{
  return self->_splitMediaAccountSignoutAccountItem;
}

- (void)setSplitMediaAccountSignoutAccountItem:(id)a3
{
}

- (HFItem)createNewRoomItem
{
  return self->_createNewRoomItem;
}

- (void)setCreateNewRoomItem:(id)a3
{
}

- (HFItem)roomListItem
{
  return self->_roomListItem;
}

- (void)setRoomListItem:(id)a3
{
}

- (HFItem)addGroupItem
{
  return self->_addGroupItem;
}

- (void)setAddGroupItem:(id)a3
{
}

- (HFItem)identifyHomePodItem
{
  return self->_identifyHomePodItem;
}

- (void)setIdentifyHomePodItem:(id)a3
{
}

- (HFItem)showContainedItems
{
  return self->_showContainedItems;
}

- (void)setShowContainedItems:(id)a3
{
}

- (HFItem)roomItem
{
  return self->_roomItem;
}

- (void)setRoomItem:(id)a3
{
}

- (HFItem)associatedServiceTypeItem
{
  return self->_associatedServiceTypeItem;
}

- (void)setAssociatedServiceTypeItem:(id)a3
{
}

- (HFItem)favoriteItem
{
  return self->_favoriteItem;
}

- (void)setFavoriteItem:(id)a3
{
}

- (HFItem)showInHomeDashboardItem
{
  return self->_showInHomeDashboardItem;
}

- (void)setShowInHomeDashboardItem:(id)a3
{
}

- (HFItem)alarmItem
{
  return self->_alarmItem;
}

- (void)setAlarmItem:(id)a3
{
}

- (HFItem)statusAndNotificationItem
{
  return self->_statusAndNotificationItem;
}

- (void)setStatusAndNotificationItem:(id)a3
{
}

- (HFItem)separateTileItem
{
  return self->_separateTileItem;
}

- (void)setSeparateTileItem:(id)a3
{
}

- (HFItem)homeTheaterAudioOutputItem
{
  return self->_homeTheaterAudioOutputItem;
}

- (void)setHomeTheaterAudioOutputItem:(id)a3
{
}

- (HFItem)managedConfigurationProfilesItem
{
  return self->_managedConfigurationProfilesItem;
}

- (void)setManagedConfigurationProfilesItem:(id)a3
{
}

- (NSArray)homeKitAccessorySettingsModules
{
  return self->_homeKitAccessorySettingsModules;
}

- (void)setHomeKitAccessorySettingsModules:(id)a3
{
}

- (NSArray)supportedVoiceRecognitionLanguages
{
  return self->_supportedVoiceRecognitionLanguages;
}

- (void)setSupportedVoiceRecognitionLanguages:(id)a3
{
}

- (ACAccount)homeMediaAccount
{
  return self->_homeMediaAccount;
}

- (void)setHomeMediaAccount:(id)a3
{
}

- (HFItem)pairingModeItem
{
  return self->_pairingModeItem;
}

- (void)setPairingModeItem:(id)a3
{
}

- (HFItem)removeItem
{
  return self->_removeItem;
}

- (void)setRemoveItem:(id)a3
{
}

- (HFItem)removeFromGroupItem
{
  return self->_removeFromGroupItem;
}

- (void)setRemoveFromGroupItem:(id)a3
{
}

- (HFItem)primaryUserItem
{
  return self->_primaryUserItem;
}

- (HFItem)resetItem
{
  return self->_resetItem;
}

- (void)setResetItem:(id)a3
{
}

- (HFItem)accessoryItem
{
  return self->_accessoryItem;
}

- (void)setAccessoryItem:(id)a3
{
}

- (HFItem)audioSettingsItem
{
  return self->_audioSettingsItem;
}

- (void)setAudioSettingsItem:(id)a3
{
}

- (HFItem)cameraActivityZonesItem
{
  return self->_cameraActivityZonesItem;
}

- (void)setCameraActivityZonesItem:(id)a3
{
}

- (HUServiceDetailsCameraStatusLightItem)cameraStatusLightItem
{
  return self->_cameraStatusLightItem;
}

- (void)setCameraStatusLightItem:(id)a3
{
}

- (HUServiceDetailsCameraNightModeItem)cameraNightModeItem
{
  return self->_cameraNightModeItem;
}

- (void)setCameraNightModeItem:(id)a3
{
}

- (HFItem)cameraRecordingOptionsItem
{
  return self->_cameraRecordingOptionsItem;
}

- (void)setCameraRecordingOptionsItem:(id)a3
{
}

- (HFItem)cameraFaceRecognitionItem
{
  return self->_cameraFaceRecognitionItem;
}

- (void)setCameraFaceRecognitionItem:(id)a3
{
}

- (HFItem)cameraDoorbellChimeMuteItem
{
  return self->_cameraDoorbellChimeMuteItem;
}

- (void)setCameraDoorbellChimeMuteItem:(id)a3
{
}

- (HFItem)collectDiagnosticsItem
{
  return self->_collectDiagnosticsItem;
}

- (void)setCollectDiagnosticsItem:(id)a3
{
}

- (HFItem)internalDebuggingItem
{
  return self->_internalDebuggingItem;
}

- (void)setInternalDebuggingItem:(id)a3
{
}

- (HFItem)exportDiagnosticsItem
{
  return self->_exportDiagnosticsItem;
}

- (void)setExportDiagnosticsItem:(id)a3
{
}

- (HFItem)restartItem
{
  return self->_restartItem;
}

- (void)setRestartItem:(id)a3
{
}

- (BOOL)shouldHideAccessoryItem
{
  return self->_shouldHideAccessoryItem;
}

- (BOOL)shouldHideSeparateTileItem
{
  return self->_shouldHideSeparateTileItem;
}

- (void)setShouldHideSeparateTileItem:(BOOL)a3
{
  self->_shouldHideSeparateTileItem = a3;
}

- (BOOL)showRoomsList
{
  return self->_showRoomsList;
}

- (BOOL)showAssociatedServiceTypeList
{
  return self->_showAssociatedServiceTypeList;
}

- (HFItem)lockPinCodesItem
{
  return self->_lockPinCodesItem;
}

- (void)setLockPinCodesItem:(id)a3
{
}

- (HFItem)lockAddHomeKeyToWalletItem
{
  return self->_lockAddHomeKeyToWalletItem;
}

- (void)setLockAddHomeKeyToWalletItem:(id)a3
{
}

- (HMHome)overrideHome
{
  return self->_overrideHome;
}

- (HUServiceDetailsProgrammableSwitchItemModule)programmableSwitchItemModule
{
  return self->_programmableSwitchItemModule;
}

- (void)setProgrammableSwitchItemModule:(id)a3
{
}

- (HUServiceDetailsControlAndCharacteristicStateItemModule)serviceDetailsControlStateAndCharacteristicItemModule
{
  return self->_serviceDetailsControlStateAndCharacteristicItemModule;
}

- (void)setServiceDetailsControlStateAndCharacteristicItemModule:(id)a3
{
}

- (NSArray)splitMediaAccountSections
{
  return self->_splitMediaAccountSections;
}

- (void)setSplitMediaAccountSections:(id)a3
{
}

- (NSArray)nameAndIconSections
{
  return self->_nameAndIconSections;
}

- (void)setNameAndIconSections:(id)a3
{
}

- (NSArray)characteristicSections
{
  return self->_characteristicSections;
}

- (void)setCharacteristicSections:(id)a3
{
}

- (NSArray)containedAccessoriesSections
{
  return self->_containedAccessoriesSections;
}

- (void)setContainedAccessoriesSections:(id)a3
{
}

- (NSArray)relatedTriggerSections
{
  return self->_relatedTriggerSections;
}

- (void)setRelatedTriggerSections:(id)a3
{
}

- (NSArray)programmableSwitchSections
{
  return self->_programmableSwitchSections;
}

- (void)setProgrammableSwitchSections:(id)a3
{
}

- (NSArray)accessorySettingsSections
{
  return self->_accessorySettingsSections;
}

- (void)setAccessorySettingsSections:(id)a3
{
}

- (NSArray)homeKitAccessorySettingsSections
{
  return self->_homeKitAccessorySettingsSections;
}

- (void)setHomeKitAccessorySettingsSections:(id)a3
{
}

- (NSArray)softwareUpdateSections
{
  return self->_softwareUpdateSections;
}

- (void)setSoftwareUpdateSections:(id)a3
{
}

- (NSArray)valveEditorSections
{
  return self->_valveEditorSections;
}

- (void)setValveEditorSections:(id)a3
{
}

- (NSArray)sceneAndTriggerSections
{
  return self->_sceneAndTriggerSections;
}

- (void)setSceneAndTriggerSections:(id)a3
{
}

- (NSArray)connectedServicesSections
{
  return self->_connectedServicesSections;
}

- (void)setConnectedServicesSections:(id)a3
{
}

- (NSArray)inputSourceEditorSections
{
  return self->_inputSourceEditorSections;
}

- (void)setInputSourceEditorSections:(id)a3
{
}

- (NSArray)televisionSettingsSections
{
  return self->_televisionSettingsSections;
}

- (void)setTelevisionSettingsSections:(id)a3
{
}

- (NSArray)advancedCameraSettingsSection
{
  return self->_advancedCameraSettingsSection;
}

- (void)setAdvancedCameraSettingsSection:(id)a3
{
}

- (NSArray)cameraStatusLightSections
{
  return self->_cameraStatusLightSections;
}

- (void)setCameraStatusLightSections:(id)a3
{
}

- (NSArray)cameraNightModeSections
{
  return self->_cameraNightModeSections;
}

- (void)setCameraNightModeSections:(id)a3
{
}

- (NSArray)cameraActivityZonesSections
{
  return self->_cameraActivityZonesSections;
}

- (void)setCameraActivityZonesSections:(id)a3
{
}

- (NSArray)doorbellMuteSections
{
  return self->_doorbellMuteSections;
}

- (void)setDoorbellMuteSections:(id)a3
{
}

- (NSArray)collectDiagnosticsSections
{
  return self->_collectDiagnosticsSections;
}

- (void)setCollectDiagnosticsSections:(id)a3
{
}

- (NSArray)lockAddHomeKeyToWalletSections
{
  return self->_lockAddHomeKeyToWalletSections;
}

- (void)setLockAddHomeKeyToWalletSections:(id)a3
{
}

- (NSArray)homeTheaterAudioSections
{
  return self->_homeTheaterAudioSections;
}

- (void)setHomeTheaterAudioSections:(id)a3
{
}

- (HFAssociatedServiceTypeOptionItemProvider)associatedServiceTypeOptionItemProvider
{
  return self->_associatedServiceTypeOptionItemProvider;
}

- (void)setAssociatedServiceTypeOptionItemProvider:(id)a3
{
}

- (HFStaticItemProvider)staticItemProvider
{
  return self->_staticItemProvider;
}

- (void)setStaticItemProvider:(id)a3
{
}

- (HFStaticItemProvider)accessoryResetAndRemoveItemProvider
{
  return self->_accessoryResetAndRemoveItemProvider;
}

- (void)setAccessoryResetAndRemoveItemProvider:(id)a3
{
}

- (HFStaticItemProvider)exportDiagnosticsItemProvider
{
  return self->_exportDiagnosticsItemProvider;
}

- (void)setExportDiagnosticsItemProvider:(id)a3
{
}

- (HULinkedApplicationItemProvider)linkedApplicationItemProvider
{
  return self->_linkedApplicationItemProvider;
}

- (void)setLinkedApplicationItemProvider:(id)a3
{
}

- (HUFirmwareUpdateItemProvider)firmwareUpdateItemProvider
{
  return self->_firmwareUpdateItemProvider;
}

- (void)setFirmwareUpdateItemProvider:(id)a3
{
}

- (HFAccessorySettingDeviceOptionsAdapter)deviceOptionsAdapter
{
  return self->_deviceOptionsAdapter;
}

- (void)setDeviceOptionsAdapter:(id)a3
{
}

- (HFAccessorySettingDeviceOptionsAdapterUtility)deviceOptionsAdapterUtility
{
  return self->_deviceOptionsAdapterUtility;
}

- (void)setDeviceOptionsAdapterUtility:(id)a3
{
}

- (BOOL)groupedAccessoryReachableOverRapport
{
  return self->_groupedAccessoryReachableOverRapport;
}

- (void)setGroupedAccessoryReachableOverRapport:(BOOL)a3
{
  self->_groupedAccessoryReachableOverRapport = a3;
}

- (HMHomeManager)homeManager
{
  return self->_homeManager;
}

- (void)setHomeManager:(id)a3
{
}

- (HMAccessorySettingsController)settingsController
{
  return self->_settingsController;
}

- (void)setSettingsController:(id)a3
{
}

- (void)setServiceDetailsDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_serviceDetailsDelegate);
  objc_storeStrong((id *)&self->_settingsController, 0);
  objc_storeStrong((id *)&self->_homeManager, 0);
  objc_storeStrong((id *)&self->_deviceOptionsAdapterUtility, 0);
  objc_storeStrong((id *)&self->_deviceOptionsAdapter, 0);
  objc_storeStrong((id *)&self->_firmwareUpdateItemProvider, 0);
  objc_storeStrong((id *)&self->_linkedApplicationItemProvider, 0);
  objc_storeStrong((id *)&self->_exportDiagnosticsItemProvider, 0);
  objc_storeStrong((id *)&self->_accessoryResetAndRemoveItemProvider, 0);
  objc_storeStrong((id *)&self->_staticItemProvider, 0);
  objc_storeStrong((id *)&self->_associatedServiceTypeOptionItemProvider, 0);
  objc_storeStrong((id *)&self->_homeTheaterAudioSections, 0);
  objc_storeStrong((id *)&self->_lockAddHomeKeyToWalletSections, 0);
  objc_storeStrong((id *)&self->_collectDiagnosticsSections, 0);
  objc_storeStrong((id *)&self->_doorbellMuteSections, 0);
  objc_storeStrong((id *)&self->_cameraActivityZonesSections, 0);
  objc_storeStrong((id *)&self->_cameraNightModeSections, 0);
  objc_storeStrong((id *)&self->_cameraStatusLightSections, 0);
  objc_storeStrong((id *)&self->_advancedCameraSettingsSection, 0);
  objc_storeStrong((id *)&self->_televisionSettingsSections, 0);
  objc_storeStrong((id *)&self->_inputSourceEditorSections, 0);
  objc_storeStrong((id *)&self->_connectedServicesSections, 0);
  objc_storeStrong((id *)&self->_sceneAndTriggerSections, 0);
  objc_storeStrong((id *)&self->_valveEditorSections, 0);
  objc_storeStrong((id *)&self->_softwareUpdateSections, 0);
  objc_storeStrong((id *)&self->_homeKitAccessorySettingsSections, 0);
  objc_storeStrong((id *)&self->_accessorySettingsSections, 0);
  objc_storeStrong((id *)&self->_programmableSwitchSections, 0);
  objc_storeStrong((id *)&self->_relatedTriggerSections, 0);
  objc_storeStrong((id *)&self->_containedAccessoriesSections, 0);
  objc_storeStrong((id *)&self->_characteristicSections, 0);
  objc_storeStrong((id *)&self->_nameAndIconSections, 0);
  objc_storeStrong((id *)&self->_splitMediaAccountSections, 0);
  objc_storeStrong((id *)&self->_serviceDetailsControlStateAndCharacteristicItemModule, 0);
  objc_storeStrong((id *)&self->_programmableSwitchItemModule, 0);
  objc_storeStrong((id *)&self->_overrideHome, 0);
  objc_storeStrong((id *)&self->_lockAddHomeKeyToWalletItem, 0);
  objc_storeStrong((id *)&self->_lockPinCodesItem, 0);
  objc_storeStrong((id *)&self->_restartItem, 0);
  objc_storeStrong((id *)&self->_exportDiagnosticsItem, 0);
  objc_storeStrong((id *)&self->_internalDebuggingItem, 0);
  objc_storeStrong((id *)&self->_collectDiagnosticsItem, 0);
  objc_storeStrong((id *)&self->_cameraDoorbellChimeMuteItem, 0);
  objc_storeStrong((id *)&self->_cameraFaceRecognitionItem, 0);
  objc_storeStrong((id *)&self->_cameraRecordingOptionsItem, 0);
  objc_storeStrong((id *)&self->_cameraNightModeItem, 0);
  objc_storeStrong((id *)&self->_cameraStatusLightItem, 0);
  objc_storeStrong((id *)&self->_cameraActivityZonesItem, 0);
  objc_storeStrong((id *)&self->_audioSettingsItem, 0);
  objc_storeStrong((id *)&self->_accessoryItem, 0);
  objc_storeStrong((id *)&self->_resetItem, 0);
  objc_storeStrong((id *)&self->_primaryUserItem, 0);
  objc_storeStrong((id *)&self->_removeFromGroupItem, 0);
  objc_storeStrong((id *)&self->_removeItem, 0);
  objc_storeStrong((id *)&self->_pairingModeItem, 0);
  objc_storeStrong((id *)&self->_homeMediaAccount, 0);
  objc_storeStrong((id *)&self->_supportedVoiceRecognitionLanguages, 0);
  objc_storeStrong((id *)&self->_homeKitAccessorySettingsModules, 0);
  objc_storeStrong((id *)&self->_managedConfigurationProfilesItem, 0);
  objc_storeStrong((id *)&self->_homeTheaterAudioOutputItem, 0);
  objc_storeStrong((id *)&self->_separateTileItem, 0);
  objc_storeStrong((id *)&self->_statusAndNotificationItem, 0);
  objc_storeStrong((id *)&self->_alarmItem, 0);
  objc_storeStrong((id *)&self->_showInHomeDashboardItem, 0);
  objc_storeStrong((id *)&self->_favoriteItem, 0);
  objc_storeStrong((id *)&self->_associatedServiceTypeItem, 0);
  objc_storeStrong((id *)&self->_roomItem, 0);
  objc_storeStrong((id *)&self->_showContainedItems, 0);
  objc_storeStrong((id *)&self->_identifyHomePodItem, 0);
  objc_storeStrong((id *)&self->_addGroupItem, 0);
  objc_storeStrong((id *)&self->_roomListItem, 0);
  objc_storeStrong((id *)&self->_createNewRoomItem, 0);
  objc_storeStrong((id *)&self->_splitMediaAccountSignoutAccountItem, 0);
  objc_storeStrong((id *)&self->_splitMediaAccountUseDefaultAccountItem, 0);
  objc_storeStrong((id *)&self->_splitMediaAccountTitleItem, 0);
  objc_storeStrong((id *)&self->_headerItem, 0);
  objc_storeStrong((id *)&self->_selectedRoomItem, 0);
  objc_storeStrong((id *)&self->_debugAccessoryItemModule, 0);
  objc_storeStrong((id *)&self->_connectedServicesItemModule, 0);
  objc_storeStrong((id *)&self->_sceneAndTriggerModule, 0);
  objc_storeStrong((id *)&self->_accessoryServicesEditorItemModule, 0);
  objc_storeStrong((id *)&self->_valveEditorItemModule, 0);
  objc_storeStrong((id *)&self->_inputSourceItemModule, 0);
  objc_storeStrong((id *)&self->_televisionSettingsItemModule, 0);
  objc_storeStrong((id *)&self->_serviceDetailsRemoteControlItemModule, 0);
  objc_storeStrong((id *)&self->_relatedTriggerItemModule, 0);
  objc_storeStrong((id *)&self->_softwareUpdateItemModule, 0);
  objc_storeStrong((id *)&self->_accessorySettingsItemModule, 0);
  objc_storeStrong((id *)&self->_accessoryRepresentableItemModule, 0);
  objc_storeStrong((id *)&self->_nameModule, 0);
  objc_storeStrong((id *)&self->_accessoryInfoItemProvider, 0);
  objc_storeStrong((id *)&self->_selectedRoomItemProvider, 0);
  objc_storeStrong((id *)&self->_suggestedRoomItemProvider, 0);
  objc_storeStrong((id *)&self->_existingRoomItemProvider, 0);
  objc_storeStrong((id *)&self->_serviceLikeBuilder, 0);

  objc_storeStrong((id *)&self->_builderItem, 0);
}

@end