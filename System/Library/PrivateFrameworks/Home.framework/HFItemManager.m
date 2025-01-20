@interface HFItemManager
+ (BOOL)_canReloadDuringUnitTests;
- (BOOL)_isUsingOnlyItemModules;
- (BOOL)_requiresNotificationsForCharacteristic:(id)a3;
- (BOOL)_shouldBuildItemProvidersAndModulesForNilHome;
- (BOOL)_shouldDisableOptionalDataDuringFastInitialUpdate;
- (BOOL)_shouldHideServiceItem:(id)a3 containedInServiceGroupItem:(id)a4;
- (BOOL)_shouldPerformFastInitialUpdates;
- (BOOL)_shouldPerformUpdateOnMainThread;
- (BOOL)diffableDataSourceDisabled;
- (BOOL)disableExternalUpdatesWithReason:(id)a3;
- (BOOL)endDisableExternalUpdatesWithReason:(id)a3;
- (BOOL)hasRequestedFirstUpdate;
- (BOOL)isApplyingSnapshot;
- (BOOL)itemIsBeingDisplayed:(id)a3;
- (BOOL)shouldPerformInitialLoadOnMainThread;
- (BOOL)useCustomDiffableDataSource;
- (HFCharacteristicReadPolicy)readPolicy;
- (HFDiffableDataSource)diffableDataSource;
- (HFItem)sourceItem;
- (HFItemManager)init;
- (HFItemManager)initWithDelegate:(id)a3;
- (HFItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4;
- (HFItemManagerBatchedDelegateAdapter)batchedDelegateAdapterAllowingReads;
- (HFItemManagerBatchedDelegateAdapter)batchedDelegateAdapterDisallowingReads;
- (HFItemManagerDelegate)delegate;
- (HMHome)home;
- (HMHome)lastUpdatedHome;
- (NAFuture)UIDiffableDataInitializationFuture;
- (NAFuture)firstFastUpdateFuture;
- (NAFuture)firstFullUpdateFuture;
- (NAFuture)latestSnapshotGenerationFuture;
- (NAScheduler)diffableDataSourceScheduler;
- (NSArray)itemModules;
- (NSArray)itemProviders;
- (NSArray)sections;
- (NSMapTable)childItemsByParentItem;
- (NSMutableDictionary)suppressedCharacteristicUpdatesByReason;
- (NSMutableSet)disableUpdateReasons;
- (NSSet)allDisplayedItems;
- (NSSet)allItems;
- (NSSet)moduleItemProviderSet;
- (NSSet)subclassItemProviderSet;
- (NSString)identifier;
- (OS_dispatch_group)mainThreadLoadGroup;
- (OS_dispatch_queue)diffableDataSourceQueue;
- (id)_allDisplayedItemsIncludingInternalItems;
- (id)_allItemsIncludingInternalItems;
- (id)_allSuppressedCharacteristics;
- (id)_buildItemModulesForHome:(id)a3;
- (id)_buildItemProvidersForHome:(id)a3;
- (id)_buildItemProvidersWithoutHome;
- (id)_buildSectionsWithDisplayedItems:(id)a3;
- (id)_cameraForCameraControl:(id)a3;
- (id)_cameraForCameraStream:(id)a3;
- (id)_cameraForUserSettings:(id)a3;
- (id)_comparatorForSectionIdentifier:(id)a3;
- (id)_debug_itemDescriptions;
- (id)_debug_itemManagerDescription;
- (id)_debug_itemProviderDescriptions;
- (id)_dependentHomeKitObjectsOfClass:(Class)a3 inHomeKitObjects:(id)a4;
- (id)_directItemDependenciesForHomeKitObjects:(id)a3 class:(Class)a4;
- (id)_displayFilter;
- (id)_footerTitleForSectionWithIdentifier:(id)a3;
- (id)_generateParentChildMappingForSections:(id)a3;
- (id)_homeFuture;
- (id)_identifierForSection:(unint64_t)a3;
- (id)_indexPathForItem:(id)a3 inDisplayedItemsArray:(id)a4;
- (id)_internalItems;
- (id)_invalidationReasonsForAddedOrRemovedAccessory:(id)a3;
- (id)_invalidationReasonsForAddedOrRemovedMediaSystem:(id)a3;
- (id)_itemForSorting;
- (id)_itemsOfClass:(Class)a3 inItems:(id)a4 allowTransformedItems:(BOOL)a5;
- (id)_itemsToHideInSet:(id)a3;
- (id)_itemsToUpdateForAccessorySettingChange:(id)a3;
- (id)_itemsToUpdateForAccessorySettingChanges:(id)a3;
- (id)_itemsToUpdateForAllowAccessWhileLockedSettingChange;
- (id)_itemsToUpdateForApplicationResignActive;
- (id)_itemsToUpdateForCurrentHomeChange;
- (id)_itemsToUpdateForHomeKitKeyPaths:(id)a3 forHomeKitObjectIdentifiers:(id)a4;
- (id)_itemsToUpdateForHomeKitSettingsChange:(id)a3;
- (id)_itemsToUpdateForIncomingInvitation:(id)a3;
- (id)_itemsToUpdateForLightProfiles:(id)a3;
- (id)_itemsToUpdateForMediaObjectChange:(id)a3;
- (id)_itemsToUpdateForMediaProfileContainer:(id)a3;
- (id)_itemsToUpdateForMediaSessionChange:(id)a3;
- (id)_itemsToUpdateForMediaSystemChange:(id)a3;
- (id)_itemsToUpdateForModifiedAccessCodes:(id)a3;
- (id)_itemsToUpdateForModifiedAccessories:(id)a3;
- (id)_itemsToUpdateForModifiedActionSets:(id)a3;
- (id)_itemsToUpdateForModifiedActions:(id)a3;
- (id)_itemsToUpdateForModifiedCameras:(id)a3;
- (id)_itemsToUpdateForModifiedCharacteristics:(id)a3;
- (id)_itemsToUpdateForModifiedCharacteristics:(id)a3 includeSuppressedCharacteristics:(BOOL)a4;
- (id)_itemsToUpdateForModifiedEvents:(id)a3;
- (id)_itemsToUpdateForModifiedHomePersonManagerSettings:(id)a3;
- (id)_itemsToUpdateForModifiedMetadataForHomes:(id)a3;
- (id)_itemsToUpdateForModifiedMetadataForMediaDestinationController:(id)a3;
- (id)_itemsToUpdateForModifiedNetworkConfigurationProfiles:(id)a3;
- (id)_itemsToUpdateForModifiedNetworkProtectionGroups:(id)a3;
- (id)_itemsToUpdateForModifiedPersonManagers:(id)a3;
- (id)_itemsToUpdateForModifiedPersons:(id)a3;
- (id)_itemsToUpdateForModifiedResidentDevices:(id)a3;
- (id)_itemsToUpdateForModifiedRooms:(id)a3;
- (id)_itemsToUpdateForModifiedServiceGroups:(id)a3;
- (id)_itemsToUpdateForModifiedServiceTypes:(id)a3;
- (id)_itemsToUpdateForModifiedServices:(id)a3;
- (id)_itemsToUpdateForModifiedSharingDevices:(id)a3;
- (id)_itemsToUpdateForModifiedSignificantEvents:(id)a3;
- (id)_itemsToUpdateForModifiedSoftwareUpdateControllers:(id)a3;
- (id)_itemsToUpdateForModifiedSoftwareUpdates:(id)a3;
- (id)_itemsToUpdateForModifiedTriggers:(id)a3;
- (id)_itemsToUpdateForModifiedUUIDs:(id)a3;
- (id)_itemsToUpdateForModifiedUsers:(id)a3;
- (id)_itemsToUpdateForModifiedWalletKeyDeviceState:(id)a3;
- (id)_itemsToUpdateForModifiedZones:(id)a3;
- (id)_itemsToUpdateForOutgoingInvitation:(id)a3;
- (id)_itemsToUpdateForRemoteAccessChange;
- (id)_itemsToUpdateForSiriEndpointProfileObjectChange:(id)a3;
- (id)_itemsToUpdateForSoftwareUpdateV2ChangeToAccessory:(id)a3;
- (id)_itemsToUpdateForSoftwareUpdateV2ProgressChangeToAccessory:(id)a3;
- (id)_itemsToUpdateForTelevisionProfiles:(id)a3;
- (id)_itemsToUpdateWhenApplicationDidBecomeActive;
- (id)_itemsWithDependenciesPassingTest:(id)a3 forItems:(id)a4;
- (id)_legacy_buildSectionsWithDisplayedItems:(id)a3;
- (id)_performUpdateForChildItemsOfItem:(id)a3 withContext:(id)a4 isInternal:(BOOL)a5;
- (id)_performUpdateForItem:(id)a3 withContext:(id)a4 isInternal:(BOOL)a5 isChild:(BOOL)a6;
- (id)_processBatchUpdateForFutureWrappers:(id)a3 removedItems:(id)a4 logger:(id)a5;
- (id)_reloadAllItemProvidersFromSenderSelector:(SEL)a3;
- (id)_reloadAndUpdateItemsForProviders:(id)a3 updateItems:(id)a4 senderSelector:(SEL)a5;
- (id)_reloadItemProviders:(id)a3 updateItems:(id)a4 shouldUpdateExistingItems:(BOOL)a5 senderSelector:(SEL)a6 readPolicy:(id)a7;
- (id)_reloadItemProviders:(id)a3 updateItems:(id)a4 shouldUpdateExistingItems:(BOOL)a5 senderSelector:(SEL)a6 readPolicy:(id)a7 fastInitialUpdatePromise:(id)a8;
- (id)_sectionIdentifierForItem:(id)a3;
- (id)_serviceGroupItemForServiceGroup:(id)a3 inItems:(id)a4;
- (id)_serviceItemsToHideInSet:(id)a3 allServiceGroupItems:(id)a4;
- (id)_sortedItems:(id)a3 forSectionIdentifier:(id)a4;
- (id)_titleForSectionWithIdentifier:(id)a3;
- (id)_transformedUpdateOutcomeForItem:(id)a3 proposedOutcome:(id)a4;
- (id)_updateResultsForItems:(id)a3 context:(id)a4;
- (id)_updateResultsForItems:(id)a3 removedItems:(id)a4 context:(id)a5 allowDelaying:(BOOL)a6;
- (id)applySnapshotForUpdatedExternalItems:(id)a3 removedItems:(id)a4 logger:(id)a5;
- (id)attributedFooterTitleForSection:(unint64_t)a3;
- (id)attributedTitleForSection:(unint64_t)a3;
- (id)childItemsForItem:(id)a3;
- (id)childItemsForItem:(id)a3 ofClass:(Class)a4;
- (id)childItemsForItem:(id)a3 ofClass:(Class)a4 conformingToProtocol:(id)a5;
- (id)currentSectionIdentifiersSnapshot;
- (id)diffableDataItemManagerDelegate;
- (id)displayedItemAtIndexPath:(id)a3;
- (id)displayedItemsInSection:(unint64_t)a3;
- (id)displayedItemsInSectionWithIdentifier:(id)a3;
- (id)displayedSectionIdentifierForSectionIndex:(unint64_t)a3;
- (id)footerTitleForSection:(unint64_t)a3;
- (id)generateSnapshotInfo;
- (id)hf_stateDumpBuilderWithContext:(id)a3;
- (id)indexPathForItem:(id)a3;
- (id)itemSectionForSectionIndex:(unint64_t)a3;
- (id)itemsToUpdateForMatterSnapshotChange;
- (id)matchingItemForHomeKitObject:(id)a3;
- (id)matterSnapshotObserverCancelable;
- (id)moveItemFromIndexPath:(id)a3 toIndexPath:(id)a4;
- (id)performItemUpdateRequest:(id)a3;
- (id)reloadAndUpdateAllItemsFromSenderSelector:(SEL)a3;
- (id)reloadAndUpdateItemsForProviders:(id)a3 senderSelector:(SEL)a4;
- (id)titleForSection:(unint64_t)a3;
- (id)updateResultsForItems:(id)a3 senderSelector:(SEL)a4;
- (unint64_t)_loadingStateForItem:(id)a3;
- (unint64_t)_numberOfSections;
- (unint64_t)_sectionForItem:(id)a3;
- (unint64_t)_sectionForItem:(id)a3 assertOnNotFound:(BOOL)a4;
- (unint64_t)numberOfSections;
- (unint64_t)overallLoadingState;
- (unint64_t)sectionIndexForDisplayedSectionIdentifier:(id)a3;
- (void)_applyReloadSnapshot:(id)a3 withAnimation:(BOOL)a4;
- (void)_batchItemUpdateFutureWrappers:(id)a3 removedItems:(id)a4 batchingIntervals:(id)a5 logger:(id)a6;
- (void)_debug_registerForStateDump;
- (void)_didFinishUpdateTransactionWithAffectedItems:(id)a3;
- (void)_notifyDelegateOfChangesFromDiff:(id)a3 logger:(id)a4;
- (void)_notifyDelegateOfItemOperations:(id)a3 logger:(id)a4;
- (void)_notifyDelegateOfSectionOperations:(id)a3 logger:(id)a4;
- (void)_prefetchResourcesIfNeededForItems:(id)a3;
- (void)_registerForExternalUpdates;
- (void)_removeDelegateNotifications;
- (void)_setDisplayFilter:(id)a3 recalculateVisibility:(BOOL)a4;
- (void)_setupDelegateNotifications;
- (void)_unregisterForExternalUpdates;
- (void)_updateExternalUpdatesEnabled:(BOOL)a3 reloadItems:(BOOL)a4;
- (void)_updateLoadingStateAndNotifyDelegateForItems:(id)a3 canFinishTransaction:(BOOL)a4;
- (void)_updateOverallLoadingStateAndNotifyDelegate;
- (void)_updateRepresentationForExternalItemsWithUpdatedOrAddedItems:(id)a3 removedItems:(id)a4 logger:(id)a5;
- (void)_updateRepresentationForInternalItemsWithUpdatedItems:(id)a3;
- (void)_updateRepresentationWithCustomDiffableDataSourceForExternalItemsWithUpdatedOrAddedItems:(id)a3 removedItems:(id)a4 logger:(id)a5;
- (void)accessory:(id)a3 didAddControlTarget:(id)a4;
- (void)accessory:(id)a3 didAddProfile:(id)a4;
- (void)accessory:(id)a3 didAddSymptomsHandler:(id)a4;
- (void)accessory:(id)a3 didRemoveControlTarget:(id)a4;
- (void)accessory:(id)a3 didRemoveProfile:(id)a4;
- (void)accessory:(id)a3 didUpdateApplicationDataForService:(id)a4;
- (void)accessory:(id)a3 didUpdateAssociatedServiceTypeForService:(id)a4;
- (void)accessory:(id)a3 didUpdateBundleID:(id)a4;
- (void)accessory:(id)a3 didUpdateConfigurationStateForService:(id)a4;
- (void)accessory:(id)a3 didUpdateConfiguredNameForService:(id)a4;
- (void)accessory:(id)a3 didUpdateDefaultNameForService:(id)a4;
- (void)accessory:(id)a3 didUpdateFirmwareUpdateAvailable:(BOOL)a4;
- (void)accessory:(id)a3 didUpdateFirmwareVersion:(id)a4;
- (void)accessory:(id)a3 didUpdateHasAuthorizationDataForCharacteristic:(id)a4;
- (void)accessory:(id)a3 didUpdateLastKnownOperatingStateResponseForService:(id)a4;
- (void)accessory:(id)a3 didUpdateLastKnownSleepDiscoveryModeForService:(id)a4;
- (void)accessory:(id)a3 didUpdateLoggedInAccount:(id)a4;
- (void)accessory:(id)a3 didUpdateNameForService:(id)a4;
- (void)accessory:(id)a3 didUpdateServiceSubtypeForService:(id)a4;
- (void)accessory:(id)a3 didUpdateSoftwareVersion:(id)a4;
- (void)accessory:(id)a3 didUpdateStoreID:(id)a4;
- (void)accessory:(id)a3 didUpdateSupportsWalletKey:(BOOL)a4;
- (void)accessory:(id)a3 didUpdateUserNotifiedOfSoftwareUpdate:(BOOL)a4;
- (void)accessory:(id)a3 service:(id)a4 didUpdateValueForCharacteristic:(id)a5;
- (void)accessoryDidRemoveSymptomsHandler:(id)a3;
- (void)accessoryDidUpdateAdditionalSetupRequired:(id)a3;
- (void)accessoryDidUpdateApplicationData:(id)a3;
- (void)accessoryDidUpdateAudioDestination:(id)a3;
- (void)accessoryDidUpdateAudioDestinationController:(id)a3;
- (void)accessoryDidUpdateCalibrationStatus:(id)a3;
- (void)accessoryDidUpdateControllable:(id)a3;
- (void)accessoryDidUpdateDiagnosticsTransferSupport:(id)a3;
- (void)accessoryDidUpdateName:(id)a3;
- (void)accessoryDidUpdatePendingConfigurationIdentifier:(id)a3;
- (void)accessoryDidUpdatePreferredMediaUser:(id)a3;
- (void)accessoryDidUpdateReachability:(id)a3;
- (void)accessoryDidUpdateReachableTransports:(id)a3;
- (void)accessoryDidUpdateServices:(id)a3;
- (void)accessoryDidUpdateTargetControlSupport:(id)a3;
- (void)applyWithBlock:(id)a3;
- (void)audioControl:(id)a3 didUpdateMuted:(BOOL)a4;
- (void)audioControl:(id)a3 didUpdateVolume:(float)a4;
- (void)beginSuppressingUpdatesForCharacteristics:(id)a3 withReason:(id)a4;
- (void)cameraSnapshotControl:(id)a3 didTakeSnapshot:(id)a4 error:(id)a5;
- (void)cameraSnapshotControlDidUpdateMostRecentSnapshot:(id)a3;
- (void)cameraStream:(id)a3 didUpdateAudioStreamSettingWithError:(id)a4;
- (void)cameraStreamControl:(id)a3 didStopStreamWithError:(id)a4;
- (void)cameraStreamControlDidStartStream:(id)a3;
- (void)cameraStreamControlDidUpdateManagerState:(id)a3;
- (void)cameraStreamControlDidUpdateStreamState:(id)a3;
- (void)cameraUserSettingsDidUpdate:(id)a3;
- (void)clipManager:(id)a3 didRemoveSignificantEventsWithUUIDs:(id)a4;
- (void)clipManager:(id)a3 didUpdateSignificantEvents:(id)a4;
- (void)dealloc;
- (void)deregisterMatterDelegates;
- (void)didReceiveSettingsUpdatesForAccessoryWithIdentifier:(id)a3 settings:(id)a4;
- (void)didUpdateDemoModeStateForAccessory:(id)a3;
- (void)endSuppressingUpdatesForCharacteristicsWithReason:(id)a3 updateAffectedItems:(BOOL)a4;
- (void)executionEnvironmentDidBecomeActive:(id)a3;
- (void)executionEnvironmentDidEnterBackground:(id)a3;
- (void)executionEnvironmentWillEnterForeground:(id)a3;
- (void)executionEnvironmentWillResignActive:(id)a3;
- (void)fixSessionDidChangeForAccessory:(id)a3;
- (void)home:(id)a3 didAddAccessory:(id)a4;
- (void)home:(id)a3 didAddAccessoryNetworkProtectionGroup:(id)a4;
- (void)home:(id)a3 didAddActionSet:(id)a4;
- (void)home:(id)a3 didAddMediaSystem:(id)a4;
- (void)home:(id)a3 didAddResidentDevice:(id)a4;
- (void)home:(id)a3 didAddRoom:(id)a4;
- (void)home:(id)a3 didAddRoom:(id)a4 toZone:(id)a5;
- (void)home:(id)a3 didAddService:(id)a4 toServiceGroup:(id)a5;
- (void)home:(id)a3 didAddServiceGroup:(id)a4;
- (void)home:(id)a3 didAddTrigger:(id)a4;
- (void)home:(id)a3 didAddUser:(id)a4;
- (void)home:(id)a3 didAddZone:(id)a4;
- (void)home:(id)a3 didEncounterError:(id)a4 forAccessory:(id)a5;
- (void)home:(id)a3 didExecuteActionSets:(id)a4 failedActionSets:(id)a5;
- (void)home:(id)a3 didReadValuesForCharacteristics:(id)a4 failedCharacteristics:(id)a5;
- (void)home:(id)a3 didRemoveAccessory:(id)a4;
- (void)home:(id)a3 didRemoveAccessoryNetworkProtectionGroup:(id)a4;
- (void)home:(id)a3 didRemoveActionSet:(id)a4;
- (void)home:(id)a3 didRemoveMediaSystem:(id)a4;
- (void)home:(id)a3 didRemoveResidentDevice:(id)a4;
- (void)home:(id)a3 didRemoveRoom:(id)a4;
- (void)home:(id)a3 didRemoveRoom:(id)a4 fromZone:(id)a5;
- (void)home:(id)a3 didRemoveService:(id)a4 fromServiceGroup:(id)a5;
- (void)home:(id)a3 didRemoveServiceGroup:(id)a4;
- (void)home:(id)a3 didRemoveTrigger:(id)a4;
- (void)home:(id)a3 didRemoveUser:(id)a4;
- (void)home:(id)a3 didRemoveZone:(id)a4;
- (void)home:(id)a3 didUnblockAccessory:(id)a4;
- (void)home:(id)a3 didUpdateAccesoryInvitationsForUser:(id)a4;
- (void)home:(id)a3 didUpdateAccessControlForUser:(id)a4;
- (void)home:(id)a3 didUpdateAccessoryNetworkProtectionGroup:(id)a4;
- (void)home:(id)a3 didUpdateActionsForActionSet:(id)a4;
- (void)home:(id)a3 didUpdateApplicationDataForActionSet:(id)a4;
- (void)home:(id)a3 didUpdateApplicationDataForRoom:(id)a4;
- (void)home:(id)a3 didUpdateApplicationDataForServiceGroup:(id)a4;
- (void)home:(id)a3 didUpdateAreBulletinNotificationsSupported:(BOOL)a4;
- (void)home:(id)a3 didUpdateAudioAnalysisClassifierOptions:(unint64_t)a4;
- (void)home:(id)a3 didUpdateMediaSystem:(id)a4;
- (void)home:(id)a3 didUpdateNameForActionSet:(id)a4;
- (void)home:(id)a3 didUpdateNameForRoom:(id)a4;
- (void)home:(id)a3 didUpdateNameForServiceGroup:(id)a4;
- (void)home:(id)a3 didUpdateNameForTrigger:(id)a4;
- (void)home:(id)a3 didUpdateNameForZone:(id)a4;
- (void)home:(id)a3 didUpdateOnboardAudioAnalysis:(BOOL)a4;
- (void)home:(id)a3 didUpdatePersonManagerSettings:(id)a4;
- (void)home:(id)a3 didUpdateReprovisionStateForAccessory:(id)a4;
- (void)home:(id)a3 didUpdateRoom:(id)a4 forAccessory:(id)a5;
- (void)home:(id)a3 didUpdateSiriPhraseOptions:(unint64_t)a4;
- (void)home:(id)a3 didUpdateSiriTriggerPhraseOptions:(unint64_t)a4;
- (void)home:(id)a3 didUpdateStateForOutgoingInvitations:(id)a4;
- (void)home:(id)a3 didUpdateTrigger:(id)a4;
- (void)home:(id)a3 didWriteValuesForCharacteristics:(id)a4 failedCharacteristics:(id)a5;
- (void)home:(id)a3 remoteAccessStateDidChange:(unint64_t)a4;
- (void)home:(id)a3 willExecuteActionSets:(id)a4;
- (void)home:(id)a3 willReadValuesForCharacteristics:(id)a4;
- (void)home:(id)a3 willWriteValuesForCharacteristics:(id)a4;
- (void)homeDidAddWalletKey:(id)a3;
- (void)homeDidRemoveWalletKey:(id)a3;
- (void)homeDidUpdateAccessControlForCurrentUser:(id)a3;
- (void)homeDidUpdateApplicationData:(id)a3;
- (void)homeDidUpdateHomeEnergyManagerEnabled:(id)a3;
- (void)homeDidUpdateHomeLocationStatus:(id)a3;
- (void)homeDidUpdateName:(id)a3;
- (void)homeDidUpdateNetworkRouterSupport:(id)a3;
- (void)homeDidUpdateProtectionMode:(id)a3;
- (void)homeDidUpdateSoundCheck:(id)a3;
- (void)homeDidUpdateToROAR:(id)a3;
- (void)homeKitDispatcher:(id)a3 manager:(id)a4 didChangeHome:(id)a5;
- (void)homeManager:(id)a3 didAddHome:(id)a4;
- (void)homeManager:(id)a3 didRemoveHome:(id)a4;
- (void)homeManager:(id)a3 didUpdateAccessAllowedWhenLocked:(BOOL)a4;
- (void)homeManager:(id)a3 didUpdateHH2State:(BOOL)a4;
- (void)homeManager:(id)a3 didUpdateStateForIncomingInvitations:(id)a4;
- (void)homeManager:(id)a3 residentProvisioningStatusChanged:(unint64_t)a4;
- (void)homeManagerDidEndBatchNotifications:(id)a3;
- (void)homeManagerDidFinishInitialDatabaseLoad:(id)a3;
- (void)homeManagerDidFinishUnknownChange:(id)a3;
- (void)homeManagerDidUpdateCurrentHome:(id)a3;
- (void)homeManagerDidUpdateDataSyncState:(id)a3;
- (void)homeManagerWillStartBatchNotifications:(id)a3;
- (void)lightProfile:(id)a3 didUpdateSettings:(id)a4;
- (void)mediaDestinationController:(id)a3 didUpdateDestination:(id)a4;
- (void)mediaDestinationControllerDidUpdateAvailableDestinations:(id)a3;
- (void)mediaObject:(id)a3 didUpdateMediaSession:(id)a4;
- (void)mediaObject:(id)a3 didUpdateSettings:(id)a4;
- (void)mediaSession:(id)a3 didUpdatePlaybackState:(int64_t)a4;
- (void)mediaSession:(id)a3 failedToUpdatePlaybackStateWithError:(id)a4;
- (void)mediaSession:(id)a3 willUpdatePlaybackState:(int64_t)a4;
- (void)mediaSessionDidUpdate:(id)a3;
- (void)mediaSystem:(id)a3 didUpdateComponents:(id)a4;
- (void)mediaSystem:(id)a3 didUpdateConfiguredName:(id)a4;
- (void)mediaSystem:(id)a3 didUpdateName:(id)a4;
- (void)personManager:(id)a3 didRemoveFaceCropsWithUUIDs:(id)a4;
- (void)personManager:(id)a3 didRemovePersonsWithUUIDs:(id)a4;
- (void)personManager:(id)a3 didUpdatePersonFaceCrops:(id)a4;
- (void)personManager:(id)a3 didUpdatePersons:(id)a4;
- (void)pinCodeManagerDidUpdate:(id)a3 pinCodes:(id)a4;
- (void)profileDidUpdateAccessViolation:(id)a3;
- (void)profileDidUpdateAllowedHosts:(id)a3;
- (void)profileDidUpdateMediaSourceDisplayOrder:(id)a3;
- (void)profileDidUpdateNetworkProtectionMode:(id)a3;
- (void)profileDidUpdateWiFiCredentialType:(id)a3;
- (void)profileDidUpdateWiFiReconfigurationSupport:(id)a3;
- (void)recalculateVisibilityAndSortAllItems;
- (void)reconfigureUIRepresentationForItems:(id)a3 withAnimation:(BOOL)a4;
- (void)registerMatterDelegates;
- (void)reloadUIRepresentationForItems:(id)a3 withAnimation:(BOOL)a4;
- (void)reloadUIRepresentationForSections:(id)a3 withAnimation:(BOOL)a4;
- (void)reloadUIRepresentationWithAnimation:(BOOL)a3;
- (void)resetItemProvidersAndModules;
- (void)residentDevice:(id)a3 didUpdateCapabilities:(unint64_t)a4;
- (void)residentDevice:(id)a3 didUpdateEnabled:(BOOL)a4;
- (void)residentDevice:(id)a3 didUpdateName:(id)a4;
- (void)residentDevice:(id)a3 didUpdateStatus:(unint64_t)a4;
- (void)restrictedGuestAllowedPeriodEnded:(id)a3;
- (void)restrictedGuestAllowedPeriodStarted:(id)a3;
- (void)setBatchedDelegateAdapterAllowingReads:(id)a3;
- (void)setBatchedDelegateAdapterDisallowingReads:(id)a3;
- (void)setChildItemsByParentItem:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDiffableDataSource:(id)a3;
- (void)setDiffableDataSourceDisabled:(BOOL)a3;
- (void)setHasRequestedFirstUpdate:(BOOL)a3;
- (void)setHome:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setIsApplyingSnapshot:(BOOL)a3;
- (void)setItemModules:(id)a3;
- (void)setItemProviders:(id)a3;
- (void)setLastUpdatedHome:(id)a3;
- (void)setLatestSnapshotGenerationFuture:(id)a3;
- (void)setMainThreadLoadGroup:(id)a3;
- (void)setMatterSnapshotObserverCancelable:(id)a3;
- (void)setModuleItemProviderSet:(id)a3;
- (void)setOverallLoadingState:(unint64_t)a3;
- (void)setReadPolicy:(id)a3;
- (void)setSections:(id)a3;
- (void)setSourceItem:(id)a3;
- (void)setSubclassItemProviderSet:(id)a3;
- (void)setSuppressedCharacteristicUpdatesByReason:(id)a3;
- (void)setUIDiffableDataInitializationFuture:(id)a3;
- (void)setUpCustomDiffableDataSource;
- (void)setUseCustomDiffableDataSource:(BOOL)a3;
- (void)set_displayFilter:(id)a3;
- (void)settings:(id)a3 didUpdateForIdentifier:(id)a4 keyPath:(id)a5;
- (void)settings:(id)a3 didWriteValueForSettings:(id)a4 failedSettings:(id)a5 homeKitObjectIdentifiers:(id)a6;
- (void)settings:(id)a3 willWriteValueForSettings:(id)a4;
- (void)settingsInvalidatedForNotificationCenter:(id)a3;
- (void)siriEndpointProfile:(id)a3 didUpdateAssistants:(id)a4;
- (void)siriEndpointProfile:(id)a3 didUpdateCurrentAssistant:(id)a4;
- (void)siriEndpointProfile:(id)a3 didUpdateManuallyDisabled:(BOOL)a4;
- (void)siriEndpointProfile:(id)a3 didUpdateMultifunctionButton:(int64_t)a4;
- (void)siriEndpointProfile:(id)a3 didUpdateNeedsOnboarding:(BOOL)a4;
- (void)siriEndpointProfile:(id)a3 didUpdateSessionHubIdentifier:(id)a4;
- (void)siriEndpointProfile:(id)a3 didUpdateSessionState:(int64_t)a4;
- (void)siriEndpointProfile:(id)a3 didUpdateSiriEngineVersion:(id)a4;
- (void)siriEndpointProfile:(id)a3 didUpdateSupportsOnboarding:(BOOL)a4;
- (void)softwareUpdate:(id)a3 didUpdateDocumentation:(id)a4;
- (void)softwareUpdate:(id)a3 didUpdateDocumentationAvailable:(BOOL)a4;
- (void)softwareUpdate:(id)a3 didUpdateNeedsAttentionReasons:(unint64_t)a4;
- (void)softwareUpdate:(id)a3 didUpdateState:(int64_t)a4;
- (void)softwareUpdateController:(id)a3 didUpdateAvailableUpdate:(id)a4;
- (void)softwareUpdateV2DidUpdateForAccessory:(id)a3;
- (void)softwareUpdateV2DidUpdateProgressForAccessory:(id)a3;
- (void)symptomsHandler:(id)a3 didUpdateSymptoms:(id)a4;
- (void)temperatureUnitObserver:(id)a3 didChangeTemperatureUnit:(BOOL)a4;
- (void)updateSettingValue:(id)a3 forKeyPath:(id)a4 accessoryIdentifier:(id)a5;
- (void)user:(id)a3 didUpdateAssistantAccessControl:(id)a4 forHome:(id)a5;
- (void)user:(id)a3 didUpdateMediaContentProfileAccessControl:(id)a4 forHome:(id)a5;
- (void)user:(id)a3 didUpdatePersonManagerSettings:(id)a4;
- (void)walletKeyDeviceStateUpdated:(id)a3 inHome:(id)a4;
@end

@implementation HFItemManager

uint64_t __66__HFItemManager__dependentHomeKitObjectsOfClass_inHomeKitObjects___block_invoke()
{
  return objc_opt_isKindOfClass() & 1;
}

uint64_t __35__HFItemManager__itemsToHideInSet___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 latestResults];
  v3 = [v2 objectForKeyedSubscript:@"shouldHideForNonAdminUsers"];
  uint64_t v4 = [v3 BOOLValue];

  return v4;
}

uint64_t __64__HFItemManager__directItemDependenciesForHomeKitObjects_class___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = [v3 latestResults];
  v5 = [v4 objectForKeyedSubscript:@"dependentHomeKitObjects"];
  char v6 = [v5 intersectsSet:*(void *)(a1 + 32)];

  if (v6)
  {
    uint64_t v7 = 1;
  }
  else
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v8 = objc_msgSend(v3, "latestResults", 0);
    v9 = [v8 objectForKeyedSubscript:@"dependentHomeKitClasses"];

    uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v16;
      while (2)
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v16 != v12) {
            objc_enumerationMutation(v9);
          }
          if ([*(id *)(a1 + 40) isSubclassOfClass:*(void *)(*((void *)&v15 + 1) + 8 * v13)])
          {
            uint64_t v7 = 1;
            goto LABEL_13;
          }
          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
    uint64_t v7 = 0;
LABEL_13:
  }
  return v7;
}

uint64_t __35__HFItemManager__itemsToHideInSet___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 latestResults];
  if (v3)
  {
    uint64_t v4 = [v2 latestResults];
    v5 = [v4 objectForKeyedSubscript:@"hidden"];
    uint64_t v6 = [v5 BOOLValue];
  }
  else
  {
    uint64_t v6 = 1;
  }

  return v6;
}

uint64_t __35__HFItemManager__itemsToHideInSet___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = [a2 latestResults];
  id v3 = [v2 objectForKeyedSubscript:@"shouldHideForNotOwner"];
  uint64_t v4 = [v3 BOOLValue];

  return v4;
}

void __57__HFItemManager_DiffableDataSource__generateSnapshotInfo__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = *(void **)(a1 + 32);
  v9 = a2;
  uint64_t v4 = (void *)MEMORY[0x263EFF8C0];
  id v5 = a2;
  uint64_t v6 = [v4 arrayWithObjects:&v9 count:1];
  objc_msgSend(v3, "appendSectionsWithIdentifiers:", v6, v9, v10);

  uint64_t v7 = *(void **)(a1 + 32);
  v8 = [v5 items];
  [v7 appendItemsWithIdentifiers:v8 intoSectionWithIdentifier:v5];
}

- (NSSet)allItems
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263EFF9C0] set];
  uint64_t v4 = [(HFItemManager *)self home];
  if (v4)
  {
  }
  else if (![(HFItemManager *)self _shouldBuildItemProvidersAndModulesForNilHome])
  {
    goto LABEL_12;
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = [(HFItemManager *)self itemProviders];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [*(id *)(*((void *)&v12 + 1) + 8 * i) items];
        [v3 unionSet:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

LABEL_12:
  return (NSSet *)v3;
}

- (NSArray)itemProviders
{
  return self->_itemProviders;
}

- (BOOL)_shouldBuildItemProvidersAndModulesForNilHome
{
  return 0;
}

uint64_t __62__HFItemManager__didFinishUpdateTransactionWithAffectedItems___block_invoke(uint64_t a1, void *a2)
{
  return [a2 itemUpdaterDidFinishUpdateTransactionWithAffectedItems:*(void *)(a1 + 32)];
}

id __70__HFItemManager__performUpdateForItem_withContext_isInternal_isChild___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) loadingState];
  uint64_t v5 = objc_msgSend(*(id *)(a1 + 32), "_effectiveLoadingStateForSuggestedLoadingState:", objc_msgSend(*(id *)(a1 + 40), "_loadingStateForItem:", *(void *)(a1 + 32)));
  [*(id *)(a1 + 32) setLoadingState:v5];
  id v6 = *(id *)(a1 + 48);
  if (v4 == v5) {
    int v7 = [v3 BOOLValue];
  }
  else {
    int v7 = 1;
  }
  if (![*(id *)(a1 + 48) outcomeType] || v7)
  {
    uint64_t v8 = (void *)[*(id *)(a1 + 48) mutableCopy];
    if (v7)
    {
      uint64_t v9 = 2;
    }
    else
    {
      uint64_t v10 = [*(id *)(a1 + 48) results];
      int v11 = [v10 isEqualToDictionary:*(void *)(a1 + 56)];

      if (v11) {
        uint64_t v9 = 1;
      }
      else {
        uint64_t v9 = 2;
      }
    }
    [v8 setOutcomeType:v9];
  }
  else
  {
    uint64_t v8 = v6;
  }
  long long v12 = [*(id *)(a1 + 40) _transformedUpdateOutcomeForItem:*(void *)(a1 + 32) proposedOutcome:v8];
  if (v8 != v12)
  {
    long long v13 = [*(id *)(a1 + 64) logger];

    if (v13)
    {
      long long v14 = objc_msgSend(*(id *)(a1 + 64), "logger", 0, 0);
      long long v15 = [v14 loggerActivity];
      os_activity_scope_enter(v15, &v44);

      long long v16 = HFLogForCategory(0x2AuLL);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v17 = *(void **)(a1 + 32);
        long long v18 = *(__CFString **)(a1 + 40);
        *(_DWORD *)buf = 138412546;
        v46 = v17;
        __int16 v47 = 2112;
        v48 = v18;
        _os_log_impl(&dword_20B986000, v16, OS_LOG_TYPE_DEBUG, "Results for item %@ have been transformed by item manager %@", buf, 0x16u);
      }

      os_activity_scope_leave(&v44);
    }
    else
    {
      v37 = HFLogForCategory(0x2AuLL);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
      {
        v38 = *(void **)(a1 + 32);
        v39 = *(__CFString **)(a1 + 40);
        *(_DWORD *)buf = 138412546;
        v46 = v38;
        __int16 v47 = 2112;
        v48 = v39;
        _os_log_impl(&dword_20B986000, v37, OS_LOG_TYPE_DEBUG, "Results for item %@ have been transformed by item manager %@", buf, 0x16u);
      }
    }
  }
  v19 = [v12 results];
  [*(id *)(a1 + 32) setLatestResults:v19];

  if ([v12 outcomeType] == 2)
  {
    if (*(unsigned char *)(a1 + 72)) {
      uint64_t v20 = @"Updated";
    }
    else {
      uint64_t v20 = @"Added";
    }
    v21 = v20;
    if (*(unsigned char *)(a1 + 73)) {
      v22 = @"child item";
    }
    else {
      v22 = @"item";
    }
    v23 = v22;
    v24 = [*(id *)(a1 + 64) logger];

    if (v24)
    {
      v44.opaque[0] = 0;
      v44.opaque[1] = 0;
      v25 = objc_msgSend(*(id *)(a1 + 64), "logger", 0, 0);
      v26 = [v25 loggerActivity];
      os_activity_scope_enter(v26, &v44);

      v27 = HFLogForCategory(0x2AuLL);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v28 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138412802;
        v46 = v21;
        __int16 v47 = 2112;
        v48 = v23;
        __int16 v49 = 2112;
        uint64_t v50 = v28;
        _os_log_impl(&dword_20B986000, v27, OS_LOG_TYPE_DEFAULT, "%@ %@: %@", buf, 0x20u);
      }

      os_activity_scope_leave(&v44);
    }
    else
    {
      v40 = HFLogForCategory(0x2AuLL);
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v41 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138412802;
        v46 = v21;
        __int16 v47 = 2112;
        v48 = v23;
        __int16 v49 = 2112;
        uint64_t v50 = v41;
        _os_log_impl(&dword_20B986000, v40, OS_LOG_TYPE_DEFAULT, "%@ %@: %@", buf, 0x20u);
      }
    }
LABEL_30:

    goto LABEL_38;
  }
  v29 = [*(id *)(a1 + 64) logger];

  if (!v29)
  {
    v21 = HFLogForCategory(0x2AuLL);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v42 = *(__CFString **)(a1 + 32);
      if (*(unsigned char *)(a1 + 73)) {
        v43 = @"child item";
      }
      else {
        v43 = @"item";
      }
      *(_DWORD *)buf = 138412546;
      v46 = v43;
      __int16 v47 = 2112;
      v48 = v42;
      _os_log_impl(&dword_20B986000, v21, OS_LOG_TYPE_DEFAULT, "Updated %@, but results did not change: %@", buf, 0x16u);
    }
    goto LABEL_30;
  }
  v44.opaque[0] = 0;
  v44.opaque[1] = 0;
  v30 = objc_msgSend(*(id *)(a1 + 64), "logger", 0, 0);
  v31 = [v30 loggerActivity];
  os_activity_scope_enter(v31, &v44);

  v32 = HFLogForCategory(0x2AuLL);
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    v33 = *(__CFString **)(a1 + 32);
    if (*(unsigned char *)(a1 + 73)) {
      v34 = @"child item";
    }
    else {
      v34 = @"item";
    }
    *(_DWORD *)buf = 138412546;
    v46 = v34;
    __int16 v47 = 2112;
    v48 = v33;
    _os_log_impl(&dword_20B986000, v32, OS_LOG_TYPE_DEFAULT, "Updated %@, but results did not change: %@", buf, 0x16u);
  }

  os_activity_scope_leave(&v44);
LABEL_38:
  v35 = [MEMORY[0x263F58190] futureWithResult:v12];

  return v35;
}

- (unint64_t)_loadingStateForItem:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 latestResults];
  id v6 = [v5 objectForKeyedSubscript:@"dependentHomeKitObjects"];

  int v7 = [(HFItemManager *)self _dependentHomeKitObjectsOfClass:objc_opt_class() inHomeKitObjects:v6];
  uint64_t v8 = [(HFItemManager *)self _dependentHomeKitObjectsOfClass:objc_opt_class() inHomeKitObjects:v6];
  uint64_t v9 = [(HFItemManager *)self home];
  uint64_t v10 = objc_msgSend(v9, "hf_characteristicValueManager");

  unint64_t v11 = [v10 loadingStateForCharacteristics:v7 actionSets:v8];
  if ([v4 conformsToProtocol:&unk_26C105C88])
  {
    id v12 = v4;
    [v12 latestResults];
    long long v13 = v31 = v7;
    long long v14 = [v13 objectForKey:@"HFResultHomeKitSettingsVendorKey"];

    long long v15 = objc_msgSend(v14, "hf_settingsValueManager");
    long long v16 = [v12 latestResults];

    uint64_t v17 = [v16 objectForKeyedSubscript:@"HFAccessorySettingRepresentitiveObjectKey"];
    long long v18 = [v17 keyPath];

    v19 = [v15 pendingWrites];
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    v33[2] = __38__HFItemManager__loadingStateForItem___block_invoke;
    v33[3] = &unk_26408F918;
    id v34 = v18;
    id v20 = v18;
    LODWORD(v16) = objc_msgSend(v19, "na_any:", v33);

    if (v16) {
      v11 |= 2uLL;
    }

    int v7 = v31;
  }
  else
  {
    v21 = [v4 latestResults];
    v22 = [v21 objectForKey:@"HFMediaAccessoryItemSettingsKey"];

    if (v22)
    {
      v32 = v7;
      v23 = [v4 latestResults];
      v24 = [v23 objectForKey:@"HFResultHomeKitSettingsVendorKey"];

      v25 = objc_msgSend(v24, "hf_settingsValueManager");
      v26 = [v4 latestResults];
      v27 = [v26 objectForKeyedSubscript:@"HFMediaAccessoryItemSettingsKey"];

      if (!v27
        || ([v25 pendingWrites],
            uint64_t v28 = objc_claimAutoreleasedReturnValue(),
            uint64_t v29 = [v28 count],
            v28,
            v29))
      {
        v11 |= 2uLL;
      }

      int v7 = v32;
    }
  }

  return v11;
}

- (HMHome)home
{
  return self->_home;
}

- (id)_dependentHomeKitObjectsOfClass:(Class)a3 inHomeKitObjects:(id)a4
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __66__HFItemManager__dependentHomeKitObjectsOfClass_inHomeKitObjects___block_invoke;
  v6[3] = &__block_descriptor_40_e27_B16__0___HFHomeKitObject__8lu32l8;
  v6[4] = a3;
  id v4 = objc_msgSend(a4, "na_filter:", v6);
  return v4;
}

- (id)_transformedUpdateOutcomeForItem:(id)a3 proposedOutcome:(id)a4
{
  id v4 = a4;
  return v4;
}

uint64_t __74__HFItemManager__performUpdateForChildItemsOfItem_withContext_isInternal___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _performUpdateForItem:a2 withContext:*(void *)(a1 + 40) isInternal:*(unsigned __int8 *)(a1 + 48) isChild:1];
}

uint64_t __94__HFItemManager_DiffableDataSource__applySnapshotForUpdatedExternalItems_removedItems_logger___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishWithNoResult];
}

uint64_t __43__HFItemManager_childItemsForItem_ofClass___block_invoke()
{
  return objc_opt_isKindOfClass() & 1;
}

- (id)titleForSection:(unint64_t)a3
{
  id v4 = [(HFItemManager *)self diffableDataSource];
  uint64_t v5 = [v4 snapshot];
  id v6 = [v5 sectionIdentifiers];
  int v7 = [v6 objectAtIndexedSubscript:a3];
  uint64_t v8 = [v7 headerTitle];

  return v8;
}

- (id)displayedItemsInSectionWithIdentifier:(id)a3
{
  unint64_t v4 = [(HFItemManager *)self sectionIndexForDisplayedSectionIdentifier:a3];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v5 = (void *)MEMORY[0x263EFFA68];
  }
  else
  {
    uint64_t v5 = [(HFItemManager *)self displayedItemsInSection:v4];
  }
  return v5;
}

- (unint64_t)sectionIndexForDisplayedSectionIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HFItemManager *)self diffableDataSource];
  id v6 = [v5 snapshot];
  int v7 = [v6 sectionIdentifiers];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __59__HFItemManager_sectionIndexForDisplayedSectionIdentifier___block_invoke;
  v11[3] = &unk_264095B68;
  id v12 = v4;
  id v8 = v4;
  unint64_t v9 = [v7 indexOfObjectPassingTest:v11];

  return v9;
}

- (NSSet)allDisplayedItems
{
  id v2 = (void *)MEMORY[0x263EFFA08];
  id v3 = [(HFItemManager *)self diffableDataSource];
  id v4 = [v3 snapshot];
  uint64_t v5 = [v4 itemIdentifiers];
  id v6 = [v2 setWithArray:v5];

  return (NSSet *)v6;
}

void __94__HFItemManager_DiffableDataSource__applySnapshotForUpdatedExternalItems_removedItems_logger___block_invoke_2(id *a1, void *a2)
{
  id v9 = a2;
  id v3 = [a1[4] diffableDataSource];
  id v4 = [v3 snapshot];
  uint64_t v5 = [v4 itemIdentifiers];
  int v6 = [v5 containsObject:v9];

  if (v6)
  {
    if (![a1[5] containsObject:v9]) {
      goto LABEL_6;
    }
    id v7 = v9;
    id v8 = a1 + 6;
  }
  else
  {
    id v7 = v9;
    id v8 = a1 + 7;
  }
  [*v8 addObject:v7];
LABEL_6:
}

- (id)displayedItemsInSection:(unint64_t)a3
{
  uint64_t v5 = [(HFItemManager *)self diffableDataSource];
  int v6 = [v5 snapshot];
  id v7 = [v6 sectionIdentifiers];
  unint64_t v8 = [v7 count];

  if (v8 <= a3)
  {
    long long v15 = (void *)MEMORY[0x263EFFA68];
  }
  else
  {
    id v9 = [(HFItemManager *)self diffableDataSource];
    uint64_t v10 = [v9 snapshot];
    unint64_t v11 = [v10 sectionIdentifiers];
    id v12 = [v11 objectAtIndexedSubscript:a3];

    long long v13 = [(HFItemManager *)self diffableDataSource];
    long long v14 = [v13 snapshot];
    long long v15 = [v14 itemIdentifiersInSectionWithIdentifier:v12];
  }
  return v15;
}

- (id)displayedSectionIdentifierForSectionIndex:(unint64_t)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v5 = [(HFItemManager *)self diffableDataSource];
  int v6 = [v5 snapshot];
  id v7 = [v6 sectionIdentifiers];
  unint64_t v8 = [v7 count];

  if (v8 <= a3)
  {
    long long v14 = HFLogForCategory(0x2AuLL);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      long long v16 = [(HFItemManager *)self diffableDataSource];
      uint64_t v17 = [v16 snapshot];
      int v18 = 136315650;
      v19 = "-[HFItemManager displayedSectionIdentifierForSectionIndex:]";
      __int16 v20 = 2112;
      v21 = v17;
      __int16 v22 = 2048;
      unint64_t v23 = a3;
      _os_log_error_impl(&dword_20B986000, v14, OS_LOG_TYPE_ERROR, "(%s) self.diffableDataSource.snapshot = %@. sectionIndex = %lu", (uint8_t *)&v18, 0x20u);
    }
    long long v13 = 0;
  }
  else
  {
    id v9 = [(HFItemManager *)self diffableDataSource];
    uint64_t v10 = [v9 snapshot];
    unint64_t v11 = [v10 sectionIdentifiers];
    id v12 = [v11 objectAtIndexedSubscript:a3];
    long long v13 = [v12 identifier];
  }
  return v13;
}

- (HFDiffableDataSource)diffableDataSource
{
  return self->_diffableDataSource;
}

uint64_t __59__HFItemManager_sectionIndexForDisplayedSectionIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 identifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

uint64_t __127__HFItemManager__reloadItemProviders_updateItems_shouldUpdateExistingItems_senderSelector_readPolicy_fastInitialUpdatePromise___block_invoke_8(uint64_t a1, void *a2)
{
  return [a2 updateModuleIdentifierInItems];
}

id __70__HFItemManager__performUpdateForItem_withContext_isInternal_isChild___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) _performUpdateForChildItemsOfItem:*(void *)(a1 + 40) withContext:*(void *)(a1 + 48) isInternal:*(unsigned __int8 *)(a1 + 64)];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __70__HFItemManager__performUpdateForItem_withContext_isInternal_isChild___block_invoke_2;
  v10[3] = &unk_2640959A8;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v11 = v5;
  uint64_t v12 = v6;
  id v13 = v3;
  id v14 = *(id *)(a1 + 56);
  id v15 = *(id *)(a1 + 48);
  __int16 v16 = *(_WORD *)(a1 + 65);
  id v7 = v3;
  unint64_t v8 = [v4 flatMap:v10];

  return v8;
}

BOOL __60__HFItemManager__itemsWithDependenciesPassingTest_forItems___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))())
  {
    BOOL v4 = 1;
  }
  else
  {
    id v5 = [*(id *)(a1 + 32) childItemsForItem:v3];
    uint64_t v6 = [*(id *)(a1 + 32) _itemsWithDependenciesPassingTest:*(void *)(a1 + 40) forItems:v5];
    BOOL v4 = [v6 count] != 0;
  }
  return v4;
}

- (id)_itemsWithDependenciesPassingTest:(id)a3 forItems:(id)a4
{
  id v6 = a3;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __60__HFItemManager__itemsWithDependenciesPassingTest_forItems___block_invoke;
  v10[3] = &unk_264095B90;
  void v10[4] = self;
  id v11 = v6;
  id v7 = v6;
  unint64_t v8 = objc_msgSend(a4, "na_filter:", v10);

  return v8;
}

uint64_t __51__HFItemManager__itemsToUpdateForCurrentHomeChange__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 latestResults];
  id v3 = [v2 objectForKeyedSubscript:@"currentHomeDependency"];
  uint64_t v4 = [v3 BOOLValue];

  return v4;
}

- (id)_performUpdateForChildItemsOfItem:(id)a3 withContext:(id)a4 isInternal:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = [v9 latestResults];
  uint64_t v12 = [v11 objectForKeyedSubscript:@"childItems"];

  id v13 = [(HFItemManager *)self childItemsByParentItem];
  id v14 = [v13 objectForKey:v9];

  id v15 = v12;
  id v16 = v14;
  if (v15 == v16)
  {
    uint64_t v17 = 0;
  }
  else if (v15)
  {
    uint64_t v17 = [v15 isEqual:v16] ^ 1;
  }
  else
  {
    uint64_t v17 = 1;
  }

  int v18 = [(HFItemManager *)self childItemsByParentItem];
  [v18 setObject:v15 forKey:v9];

  if ([v15 containsObject:v9])
  {
    v37 = [MEMORY[0x263F08690] currentHandler];
    [v37 handleFailureInMethod:a2, self, @"HFItemManager.m", 1465, @"Detected a case where an item is vending itself as a child item. For the love of all that is holy, please don't do this. Item: <%@:%p>", objc_opt_class(), v9 object file lineNumber description];
  }
  v19 = (void *)MEMORY[0x263F58190];
  __int16 v20 = [NSNumber numberWithBool:v17];
  v21 = [v19 futureWithResult:v20];

  if ([v15 count])
  {
    NSStringFromSelector((SEL)[v10 senderSelector]);
    __int16 v22 = v38 = a5;
    v39 = [@"itemManagerUpdate" stringByAppendingFormat:@"-%@-ChildItems-%p", v22, v9];

    unint64_t v23 = [(HFItemManager *)self home];
    objc_msgSend(v23, "hf_characteristicValueManager");
    uint64_t v24 = v40 = v16;
    +[HFStaticReadPolicy policyWithDecision:0];
    v26 = v25 = v10;
    v27 = [v25 logger];
    [v24 beginTransactionWithReason:v39 readPolicy:v26 logger:v27];

    v43[0] = MEMORY[0x263EF8330];
    v43[1] = 3221225472;
    v43[2] = __74__HFItemManager__performUpdateForChildItemsOfItem_withContext_isInternal___block_invoke;
    v43[3] = &unk_2640959F8;
    v43[4] = self;
    id v44 = v25;
    BOOL v45 = v38;
    uint64_t v28 = objc_msgSend(v15, "na_map:", v43);
    uint64_t v29 = (void *)MEMORY[0x263F58190];
    v30 = [v28 allObjects];
    v31 = [MEMORY[0x263F581B8] mainThreadScheduler];
    v32 = [v29 combineAllFutures:v30 ignoringErrors:1 scheduler:v31];
    v41[0] = MEMORY[0x263EF8330];
    v41[1] = 3221225472;
    v41[2] = __74__HFItemManager__performUpdateForChildItemsOfItem_withContext_isInternal___block_invoke_2;
    v41[3] = &__block_descriptor_33_e27___NAFuture_16__0__NSArray_8l;
    char v42 = v17;
    uint64_t v33 = [v32 flatMap:v41];

    id v34 = [(HFItemManager *)self home];
    v35 = objc_msgSend(v34, "hf_characteristicValueManager");
    [v35 commitTransactionWithReason:v39];

    id v10 = v25;
    id v16 = v40;

    v21 = (void *)v33;
  }

  return v21;
}

- (id)childItemsForItem:(id)a3
{
  id v4 = a3;
  id v5 = [(HFItemManager *)self childItemsByParentItem];
  id v6 = [v5 objectForKey:v4];

  return v6;
}

- (NSMapTable)childItemsByParentItem
{
  return self->_childItemsByParentItem;
}

uint64_t __59__HFItemManager__reloadAllItemProvidersFromSenderSelector___block_invoke_2()
{
  return [(id)objc_opt_class() prefersNonBlockingReloads] ^ 1;
}

uint64_t __75__HFItemManager__updateResultsForItems_removedItems_context_allowDelaying___block_invoke_312(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) finishWithResult:a2 error:a3];
}

uint64_t __86__HFItemManager__batchItemUpdateFutureWrappers_removedItems_batchingIntervals_logger___block_invoke_3(uint64_t result)
{
  uint64_t v1 = *(void *)(*(void *)(result + 48) + 8);
  if (!*(unsigned char *)(v1 + 24))
  {
    uint64_t v2 = result;
    *(unsigned char *)(v1 + 24) = 1;
    [*(id *)(result + 32) cancel];
    id v3 = *(uint64_t (**)(void))(*(void *)(v2 + 40) + 16);
    return v3();
  }
  return result;
}

- (void)_updateRepresentationForInternalItemsWithUpdatedItems:(id)a3
{
  id v4 = a3;
  id v5 = [(HFItemManager *)self _internalItems];
  if ((unint64_t)[v5 count] > 1)
  {

    goto LABEL_5;
  }
  unint64_t v6 = [v4 count];

  if (v6 >= 2)
  {
LABEL_5:
    id v7 = [(HFItemManager *)self _internalItems];
    NSLog(&cfstr_ReceivedUnexpe.isa, v7);
  }
  if ([v4 count])
  {
    unint64_t v8 = [v4 anyObject];
    id v9 = [(HFItemManager *)self sourceItem];

    if (v8 != v9)
    {
      id v10 = [(HFItemManager *)self sourceItem];
      NSLog(&cfstr_UnknownSourceI.isa, v8, v10);
    }
    id v11 = [(HFItemManager *)self delegate];
    char v12 = objc_opt_respondsToSelector();

    if (v12)
    {
      id v13 = [MEMORY[0x263F581B8] mainThreadScheduler];
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __71__HFItemManager__updateRepresentationForInternalItemsWithUpdatedItems___block_invoke;
      v17[3] = &unk_26408D450;
      v17[4] = self;
      id v18 = v8;
      [v13 performBlock:v17];
    }
    id v14 = [(HFItemManager *)self _itemForSorting];
    if (v14)
    {
      id v15 = [(HFItemManager *)self _internalItems];
      char v16 = [v15 containsObject:v14];

      if ((v16 & 1) == 0) {
        NSLog(&cfstr_SortingItemIsN.isa, v14);
      }
      if ([v4 containsObject:v14]) {
        [(HFItemManager *)self recalculateVisibilityAndSortAllItems];
      }
    }
  }
}

- (void)_updateLoadingStateAndNotifyDelegateForItems:(id)a3 canFinishTransaction:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  __int16 v22 = [(HFItemManager *)self allDisplayedItems];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (!v8)
  {

    goto LABEL_22;
  }
  uint64_t v9 = v8;
  BOOL v21 = v4;
  char v10 = 0;
  uint64_t v11 = *(void *)v24;
  do
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      if (*(void *)v24 != v11) {
        objc_enumerationMutation(v7);
      }
      id v13 = *(void **)(*((void *)&v23 + 1) + 8 * i);
      uint64_t v14 = objc_msgSend(v13, "_effectiveLoadingStateForSuggestedLoadingState:", -[HFItemManager _loadingStateForItem:](self, "_loadingStateForItem:", v13));
      if ([v13 loadingState] != v14)
      {
        [v13 setLoadingState:v14];
        id v15 = [(HFItemManager *)self _internalItems];
        int v16 = [v15 containsObject:v13];

        uint64_t v17 = [(HFItemManager *)self delegate];
        if (v16)
        {
          char v18 = objc_opt_respondsToSelector();

          if (v18)
          {
            uint64_t v17 = [(HFItemManager *)self delegate];
            [v17 itemManager:self didUpdateResultsForSourceItem:v13];
            goto LABEL_14;
          }
LABEL_15:
          char v10 = 1;
          continue;
        }
        if (objc_opt_respondsToSelector())
        {
          int v19 = [v22 containsObject:v13];

          if (!v19) {
            goto LABEL_15;
          }
          uint64_t v17 = [(HFItemManager *)self indexPathForItem:v13];
          if (v17)
          {
            __int16 v20 = [(HFItemManager *)self delegate];
            [v20 itemManager:self didUpdateResultsForItem:v13 atIndexPath:v17];
          }
        }
LABEL_14:

        goto LABEL_15;
      }
    }
    uint64_t v9 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
  }
  while (v9);

  if (v10)
  {
    [(HFItemManager *)self _updateOverallLoadingStateAndNotifyDelegate];
    if (v21) {
      [(HFItemManager *)self _didFinishUpdateTransactionWithAffectedItems:v7];
    }
  }
LABEL_22:
}

- (id)indexPathForItem:(id)a3
{
  id v4 = a3;
  id v5 = [(HFItemManager *)self diffableDataSource];
  id v6 = [v5 indexPathForItemIdentifier:v4];

  return v6;
}

- (void)_updateOverallLoadingStateAndNotifyDelegate
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  unint64_t v3 = [(HFItemManager *)self overallLoadingState];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = [(HFItemManager *)self _allDisplayedItemsIncludingInternalItems];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v4);
        }
        v7 |= [*(id *)(*((void *)&v13 + 1) + 8 * i) loadingState];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
  else
  {
    uint64_t v7 = 0;
  }

  [(HFItemManager *)self setOverallLoadingState:v7];
  if (v7 != v3)
  {
    char v10 = [(HFItemManager *)self delegate];
    char v11 = objc_opt_respondsToSelector();

    if (v11)
    {
      char v12 = [(HFItemManager *)self delegate];
      [v12 itemManager:self didChangeOverallLoadingState:v7];
    }
  }
}

- (void)setOverallLoadingState:(unint64_t)a3
{
  self->_overallLoadingState = a3;
}

- (unint64_t)overallLoadingState
{
  return self->_overallLoadingState;
}

void __94__HFItemManager_DiffableDataSource__applySnapshotForUpdatedExternalItems_removedItems_logger___block_invoke_8(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  unint64_t v3 = HFLogForCategory(0x32uLL);
  id v4 = HFLogForCategory(0x32uLL);
  os_signpost_id_t v5 = os_signpost_id_make_with_pointer(v4, WeakRetained);

  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    uint64_t v6 = [WeakRetained identifier];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = *(void **)(a1 + 32);
    id v9 = v7;
    char v10 = [v8 clientDescription];
    int v12 = 138412802;
    long long v13 = v6;
    __int16 v14 = 2112;
    long long v15 = v7;
    __int16 v16 = 2112;
    uint64_t v17 = v10;
    _os_signpost_emit_with_name_impl(&dword_20B986000, v3, OS_SIGNPOST_INTERVAL_END, v5, "HFItemManagerSnapshotApply", "%@:%@ | %@", (uint8_t *)&v12, 0x20u);
  }
  [*(id *)(a1 + 40) finishWithResult:*(void *)(a1 + 48)];
  char v11 = [WeakRetained diffableDataItemManagerDelegate];
  [v11 diffableDataItemManager:WeakRetained didUpdateItems:*(void *)(a1 + 56) addItems:*(void *)(a1 + 64) removeItems:*(void *)(a1 + 72)];

  [WeakRetained _updateOverallLoadingStateAndNotifyDelegate];
  [*(id *)(a1 + 80) finishWithNoResult];
}

- (id)applySnapshotForUpdatedExternalItems:(id)a3 removedItems:(id)a4 logger:(id)a5
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  char v11 = [(HFItemManager *)self diffableDataSource];

  if (v11 && ![(HFItemManager *)self isApplyingSnapshot])
  {
    long long v15 = HFLogForCategory(0x32uLL);
    __int16 v16 = HFLogForCategory(0x32uLL);
    os_signpost_id_t v17 = os_signpost_id_make_with_pointer(v16, self);

    if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      uint64_t v18 = [(HFItemManager *)self identifier];
      int v19 = objc_opt_class();
      id v20 = v19;
      BOOL v21 = [v10 clientDescription];
      *(_DWORD *)buf = 138412802;
      char v42 = v18;
      __int16 v43 = 2112;
      id v44 = v19;
      __int16 v45 = 2112;
      v46 = v21;
      _os_signpost_emit_with_name_impl(&dword_20B986000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v17, "HFItemManagerSnapshotApply", "%@:%@ | %@", buf, 0x20u);
    }
    id v22 = objc_alloc_init(MEMORY[0x263F58190]);
    id v23 = objc_alloc_init(MEMORY[0x263F58190]);
    long long v24 = [(HFItemManager *)self generateSnapshotInfo];
    long long v25 = [v24 baseSnapshot];
    objc_initWeak((id *)buf, self);
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __94__HFItemManager_DiffableDataSource__applySnapshotForUpdatedExternalItems_removedItems_logger___block_invoke;
    v32[3] = &unk_26409AA38;
    objc_copyWeak(&v40, (id *)buf);
    id v26 = v25;
    id v33 = v26;
    id v34 = v8;
    id v27 = v24;
    id v35 = v27;
    id v36 = v9;
    id v37 = v10;
    id v28 = v22;
    id v38 = v28;
    id v29 = v23;
    id v39 = v29;
    [(HFItemManager *)self applyWithBlock:v32];
    v30 = v39;
    id v14 = v28;

    objc_destroyWeak(&v40);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    int v12 = (void *)MEMORY[0x263F58190];
    id v13 = objc_alloc_init(MEMORY[0x263F1C328]);
    id v14 = [v12 futureWithResult:v13];
  }
  return v14;
}

- (id)generateSnapshotInfo
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  unint64_t v3 = [(HFItemManager *)self allItems];
  id v27 = [(HFItemManager *)self _itemsToHideInSet:v3];
  uint64_t v4 = objc_msgSend(v3, "hmf_removedObjectsFromSet:");

  id v26 = (void *)v4;
  os_signpost_id_t v5 = [(HFItemManager *)self _buildSectionsWithDisplayedItems:v4];
  id v6 = objc_alloc_init(MEMORY[0x263F1C328]);
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __57__HFItemManager_DiffableDataSource__generateSnapshotInfo__block_invoke;
  v32[3] = &unk_26409AA60;
  id v7 = v6;
  id v33 = v7;
  objc_msgSend(v5, "na_each:", v32);
  long long v24 = v7;
  id v8 = [[HFSnapshotInfo alloc] initWithSnapshot:v7];
  long long v25 = v5;
  id v9 = [(HFItemManager *)self _generateParentChildMappingForSections:v5];
  id v10 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [(HFSnapshotInfo *)v8 setSectionSnapshots:v10];

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v11 = v9;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v28 objects:v35 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v29 != v14) {
          objc_enumerationMutation(v11);
        }
        __int16 v16 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        os_signpost_id_t v17 = [v11 objectForKeyedSubscript:v16];
        if ([v17 count])
        {
          uint64_t v18 = [v16 items];
          int v19 = [v18 firstObject];

          if (v19)
          {
            id v20 = objc_alloc_init(MEMORY[0x263F1C320]);
            id v34 = v19;
            BOOL v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v34 count:1];
            [v20 appendItems:v21];

            [v20 appendItems:v17 intoParentItem:v19];
            id v22 = [(HFSnapshotInfo *)v8 sectionSnapshots];
            [v22 setObject:v20 forKeyedSubscript:v16];
          }
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v28 objects:v35 count:16];
    }
    while (v13);
  }

  return v8;
}

- (void)applyWithBlock:(id)a3
{
  id v3 = (id)(*((uint64_t (**)(id, SEL))a3 + 2))(a3, a2);
}

id __94__HFItemManager_DiffableDataSource__applySnapshotForUpdatedExternalItems_removedItems_logger___block_invoke(id *a1)
{
  uint64_t v2 = a1 + 11;
  id WeakRetained = objc_loadWeakRetained(a1 + 11);
  uint64_t v4 = [WeakRetained diffableDataSource];
  os_signpost_id_t v5 = [v4 snapshot];
  uint64_t v6 = [v5 numberOfItems];

  id v7 = [MEMORY[0x263EFF9C0] set];
  id v8 = [MEMORY[0x263EFF9C0] set];
  id v9 = [a1[4] itemIdentifiers];
  v55[0] = MEMORY[0x263EF8330];
  v55[1] = 3221225472;
  v55[2] = __94__HFItemManager_DiffableDataSource__applySnapshotForUpdatedExternalItems_removedItems_logger___block_invoke_2;
  v55[3] = &unk_26409A998;
  v55[4] = WeakRetained;
  id v56 = a1[5];
  id v10 = v7;
  id v57 = v10;
  id v11 = v8;
  id v58 = v11;
  objc_msgSend(v9, "na_each:", v55);

  uint64_t v12 = [a1[6] sectionSnapshots];
  v51[0] = MEMORY[0x263EF8330];
  v51[1] = 3221225472;
  v51[2] = __94__HFItemManager_DiffableDataSource__applySnapshotForUpdatedExternalItems_removedItems_logger___block_invoke_3;
  v51[3] = &unk_26409A9C0;
  v51[4] = WeakRetained;
  id v52 = a1[5];
  id v13 = v10;
  id v53 = v13;
  id v14 = v11;
  id v54 = v14;
  objc_msgSend(v12, "na_each:", v51);

  long long v15 = [WeakRetained diffableDataItemManagerDelegate];
  [v15 diffableDataItemManager:WeakRetained willUpdateItems:v13 addItems:v14 removeItems:a1[7] isInitialLoad:v6 == 0];

  from = v2;
  BOOL v16 = [v13 count] || objc_msgSend(v14, "count", v2) || objc_msgSend(a1[7], "count") != 0;
  os_signpost_id_t v17 = objc_msgSend(WeakRetained, "diffableDataItemManagerDelegate", from);
  int v18 = [v17 shouldPerformUpdateWithAnimationForDiffableDataItemManager:WeakRetained];
  if (v6) {
    BOOL v19 = v16;
  }
  else {
    BOOL v19 = 0;
  }
  if (v18) {
    BOOL v20 = v19;
  }
  else {
    BOOL v20 = 0;
  }

  [WeakRetained setIsApplyingSnapshot:1];
  BOOL v21 = objc_opt_new();
  id v22 = objc_alloc_init(MEMORY[0x263F58190]);
  [v21 addObject:v22];
  id v23 = [WeakRetained diffableDataSource];
  id v24 = a1[4];
  v49[0] = MEMORY[0x263EF8330];
  v49[1] = 3221225472;
  v49[2] = __94__HFItemManager_DiffableDataSource__applySnapshotForUpdatedExternalItems_removedItems_logger___block_invoke_5;
  v49[3] = &unk_26408DDE0;
  id v25 = v22;
  id v50 = v25;
  [v23 applySnapshot:v24 animatingDifferences:v20 completion:v49];

  id v26 = [a1[6] sectionSnapshots];
  v45[0] = MEMORY[0x263EF8330];
  v45[1] = 3221225472;
  v45[2] = __94__HFItemManager_DiffableDataSource__applySnapshotForUpdatedExternalItems_removedItems_logger___block_invoke_6;
  v45[3] = &unk_26409A9E8;
  id v27 = v21;
  id v46 = v27;
  id v47 = WeakRetained;
  BOOL v48 = v20;
  objc_msgSend(v26, "na_each:", v45);

  long long v28 = [MEMORY[0x263F58190] chainFutures:v27];
  v36[0] = MEMORY[0x263EF8330];
  v36[1] = 3221225472;
  v36[2] = __94__HFItemManager_DiffableDataSource__applySnapshotForUpdatedExternalItems_removedItems_logger___block_invoke_8;
  v36[3] = &unk_26409AA10;
  objc_copyWeak(&v44, froma);
  id v37 = a1[8];
  id v38 = a1[9];
  id v39 = a1[4];
  id v29 = v13;
  id v40 = v29;
  id v30 = v14;
  id v41 = v30;
  id v42 = a1[7];
  id v43 = a1[10];
  id v31 = (id)[v28 addCompletionBlock:v36];

  [WeakRetained setIsApplyingSnapshot:0];
  id v32 = a1[10];

  objc_destroyWeak(&v44);
  return v32;
}

- (void)setIsApplyingSnapshot:(BOOL)a3
{
  self->_isApplyingSnapshot = a3;
}

- (id)_generateParentChildMappingForSections:(id)a3
{
  return 0;
}

- (BOOL)isApplyingSnapshot
{
  return self->_isApplyingSnapshot;
}

void __75__HFItemManager__updateResultsForItems_removedItems_context_allowDelaying___block_invoke_329(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  id v3 = [MEMORY[0x263EFF9C0] set];
  [v3 unionSet:*(void *)(a1 + 32)];
  [v3 unionSet:*(void *)(a1 + 40)];
  [v3 unionSet:*(void *)(a1 + 48)];
  uint64_t v4 = HFLogForCategory(0x32uLL);
  os_signpost_id_t v5 = v4;
  os_signpost_id_t v6 = *(void *)(a1 + 80);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    id v23 = [*(id *)(a1 + 56) updateOptions];
    id v7 = [v23 objectForKeyedSubscript:HFItemUpdateOptionFastInitialUpdate];
    if ([v7 BOOLValue]) {
      id v8 = @"Initial";
    }
    else {
      id v8 = @"Normal";
    }
    id v9 = [WeakRetained identifier];
    id v10 = objc_opt_class();
    id v11 = *(void **)(a1 + 56);
    id v22 = v10;
    uint64_t v12 = NSStringFromSelector((SEL)[v11 senderSelector]);
    *(_DWORD *)buf = 138413058;
    *(void *)&uint8_t buf[4] = v8;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v9;
    __int16 v26 = 2112;
    id v27 = v10;
    __int16 v28 = 2112;
    id v29 = v12;
    _os_signpost_emit_with_name_impl(&dword_20B986000, v5, OS_SIGNPOST_INTERVAL_END, v6, "HFItemManagerUpdate", "%@ Item Update Finished %@:%@ for sender: %@", buf, 0x2Au);
  }
  id v13 = [*(id *)(a1 + 56) logger];

  if (v13)
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = 0;
    id v14 = [*(id *)(a1 + 56) logger];
    long long v15 = [v14 loggerActivity];
    os_activity_scope_enter(v15, (os_activity_scope_state_t)buf);

    BOOL v16 = HFLogForCategory(0x2AuLL);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v24 = 0;
      _os_log_impl(&dword_20B986000, v16, OS_LOG_TYPE_DEFAULT, "All batch item updates complete.", v24, 2u);
    }

    os_activity_scope_leave((os_activity_scope_state_t)buf);
  }
  else
  {
    BOOL v21 = HFLogForCategory(0x2AuLL);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20B986000, v21, OS_LOG_TYPE_DEFAULT, "All batch item updates complete.", buf, 2u);
    }
  }
  [WeakRetained _didFinishUpdateTransactionWithAffectedItems:v3];
  if (*(unsigned char *)(a1 + 88))
  {
    os_signpost_id_t v17 = [*(id *)(a1 + 56) logger];
    [v17 finish];
  }
  int v18 = [WeakRetained delegate];
  char v19 = objc_opt_respondsToSelector();

  if (v19)
  {
    BOOL v20 = [WeakRetained delegate];
    [v20 itemManagerDidFinishUpdate:WeakRetained];
  }
  [*(id *)(a1 + 64) finishWithResult:v3];
}

- (id)diffableDataItemManagerDelegate
{
  id v3 = [(HFItemManager *)self delegate];
  int v4 = [v3 conformsToProtocol:&unk_26C182B10];

  if (v4)
  {
    os_signpost_id_t v5 = [(HFItemManager *)self delegate];
  }
  else
  {
    os_signpost_id_t v5 = 0;
  }
  return v5;
}

- (HFItemManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HFItemManagerDelegate *)WeakRetained;
}

- (id)_updateResultsForItems:(id)a3 removedItems:(id)a4 context:(id)a5 allowDelaying:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v153 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v113 = a4;
  id v12 = a5;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  v114 = v12;
  id v13 = [v12 readPolicy];

  if (!v13)
  {
    v105 = [MEMORY[0x263F08690] currentHandler];
    [v105 handleFailureInMethod:a2, self, @"HFItemManager.m", 1220, @"Invalid parameter not satisfying: %@", @"context.readPolicy != nil" object file lineNumber description];
  }
  long long v142 = 0u;
  long long v143 = 0u;
  long long v140 = 0u;
  long long v141 = 0u;
  id v14 = v11;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v140 objects:v152 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v141;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v141 != v16) {
          objc_enumerationMutation(v14);
        }
        int v18 = *(void **)(*((void *)&v140 + 1) + 8 * i);
        if (objc_msgSend(v18, "_debug_isChildItem")) {
          NSLog(&cfstr_AttemptingToEx.isa, v18);
        }
      }
      uint64_t v15 = [v14 countByEnumeratingWithState:&v140 objects:v152 count:16];
    }
    while (v15);
  }

  char v19 = [(HFItemManager *)self home];
  if (v19)
  {
  }
  else if (![(HFItemManager *)self _shouldBuildItemProvidersAndModulesForNilHome])
  {
    BOOL v21 = (void *)MEMORY[0x263F58190];
    id v22 = objc_msgSend(MEMORY[0x263F087E8], "hf_errorWithCode:", 30);
    id v23 = [v21 futureWithError:v22];

    goto LABEL_45;
  }
  if (![v14 count] && !objc_msgSend(v113, "count"))
  {
    v102 = (void *)MEMORY[0x263F58190];
    v103 = [MEMORY[0x263EFFA08] set];
    id v23 = [v102 futureWithResult:v103];

    goto LABEL_45;
  }
  if (![(HFItemManager *)self hasRequestedFirstUpdate]) {
    goto LABEL_22;
  }
  BOOL v20 = [(HFItemManager *)self firstFastUpdateFuture];
  if ([v20 isFinished])
  {

LABEL_22:
    if (v6
      && [v14 count]
      && ([(HFItemManager *)self delegate],
          id v27 = objc_claimAutoreleasedReturnValue(),
          char v28 = objc_opt_respondsToSelector(),
          v27,
          (v28 & 1) != 0))
    {
      id v29 = HFLogForCategory(0x32uLL);
      os_signpost_id_t v30 = os_signpost_id_generate(v29);

      id v31 = HFLogForCategory(0x32uLL);
      id v32 = v31;
      if (v30 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
      {
        id v33 = [v114 updateOptions];
        id v34 = [v33 objectForKeyedSubscript:HFItemUpdateOptionFastInitialUpdate];
        if ([v34 BOOLValue]) {
          id v35 = @"Initial";
        }
        else {
          id v35 = @"Normal";
        }
        uint64_t v36 = [(HFItemManager *)self identifier];
        id v37 = objc_opt_class();
        id v110 = v37;
        id v38 = NSStringFromSelector((SEL)[v114 senderSelector]);
        *(_DWORD *)buf = 138413058;
        v145 = (HFItemManager *)v35;
        __int16 v146 = 2112;
        id v147 = v36;
        __int16 v148 = 2112;
        v149 = v37;
        __int16 v150 = 2112;
        v151 = v38;
        _os_signpost_emit_with_name_impl(&dword_20B986000, v32, OS_SIGNPOST_INTERVAL_BEGIN, v30, "HFFutureToUpdateItems", "%@ Item Update Delayed %@:%@ for sender: %@", buf, 0x2Au);
      }
      id v39 = [(HFItemManager *)self delegate];
      id v40 = [v114 updateOptions];
      id v41 = [v39 itemManager:self futureToUpdateItems:v14 itemUpdateOptions:v40];

      id v42 = objc_alloc_init(MEMORY[0x263F58190]);
      v134[0] = MEMORY[0x263EF8330];
      v134[1] = 3221225472;
      v134[2] = __75__HFItemManager__updateResultsForItems_removedItems_context_allowDelaying___block_invoke;
      v134[3] = &unk_264095908;
      v134[4] = self;
      id v43 = v114;
      id v135 = v43;
      id v44 = v14;
      id v136 = v44;
      os_signpost_id_t v139 = v30;
      id v45 = v113;
      id v137 = v45;
      id v46 = v42;
      id v138 = v46;
      id v47 = (id)[v41 addFailureBlock:v134];
      v128[0] = MEMORY[0x263EF8330];
      v128[1] = 3221225472;
      v128[2] = __75__HFItemManager__updateResultsForItems_removedItems_context_allowDelaying___block_invoke_2;
      v128[3] = &unk_264095930;
      os_signpost_id_t v133 = v30;
      v128[4] = self;
      id v129 = v44;
      id v130 = v45;
      id v131 = v43;
      id v48 = v46;
      id v132 = v48;
      id v49 = (id)[v41 addSuccessBlock:v128];
      id v50 = v132;
      id v23 = v48;
    }
    else
    {
      uint64_t v51 = [v114 logger];

      if (!v51)
      {
        id v52 = [HFUpdateLogger alloc];
        id v53 = NSString;
        id v54 = NSStringFromSelector((SEL)[v114 senderSelector]);
        v55 = [v53 stringWithFormat:@"[%@ %@]", self, v54];
        id v56 = [(HFUpdateLogger *)v52 initWithTimeout:v55 description:15.0];
        [v114 setLogger:v56];
      }
      id v57 = [v114 logger];
      BOOL v58 = v57 == 0;

      if (v58)
      {
        v106 = HFLogForCategory(0x2AuLL);
        if (os_log_type_enabled(v106, OS_LOG_TYPE_DEFAULT))
        {
          v107 = NSStringFromSelector((SEL)[v114 senderSelector]);
          *(_DWORD *)buf = 138412546;
          v145 = self;
          __int16 v146 = 2112;
          id v147 = v107;
          _os_log_impl(&dword_20B986000, v106, OS_LOG_TYPE_DEFAULT, "%@: Starting update for sender: \"%@\"", buf, 0x16u);
        }
      }
      else
      {
        state.opaque[0] = 0;
        state.opaque[1] = 0;
        v59 = [v114 logger];
        v60 = [v59 loggerActivity];
        os_activity_scope_enter(v60, &state);

        v61 = HFLogForCategory(0x2AuLL);
        if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
        {
          v62 = NSStringFromSelector((SEL)[v114 senderSelector]);
          *(_DWORD *)buf = 138412546;
          v145 = self;
          __int16 v146 = 2112;
          id v147 = v62;
          _os_log_impl(&dword_20B986000, v61, OS_LOG_TYPE_DEFAULT, "%@: Starting update for sender: \"%@\"", buf, 0x16u);
        }
        os_activity_scope_leave(&state);
      }
      v63 = HFLogForCategory(0x32uLL);
      spid = (char *)os_signpost_id_generate(v63);

      v64 = HFLogForCategory(0x32uLL);
      v65 = v64;
      if ((unint64_t)(spid - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v64))
      {
        v66 = [v114 updateOptions];
        v67 = [v66 objectForKeyedSubscript:HFItemUpdateOptionFastInitialUpdate];
        if ([v67 BOOLValue]) {
          v68 = @"Initial";
        }
        else {
          v68 = @"Normal";
        }
        v69 = [(HFItemManager *)self identifier];
        v70 = objc_opt_class();
        id v111 = v70;
        v71 = NSStringFromSelector((SEL)[v114 senderSelector]);
        *(_DWORD *)buf = 138413058;
        v145 = (HFItemManager *)v68;
        __int16 v146 = 2112;
        id v147 = v69;
        __int16 v148 = 2112;
        v149 = v70;
        __int16 v150 = 2112;
        v151 = v71;
        _os_signpost_emit_with_name_impl(&dword_20B986000, v65, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)spid, "HFItemManagerUpdate", "%@ Item Update Started %@:%@ for sender: %@", buf, 0x2Au);
      }
      BOOL v108 = v51 == 0;

      v72 = NSString;
      v73 = NSStringFromSelector((SEL)[v114 senderSelector]);
      v112 = [v72 stringWithFormat:@"%@_%@", @"itemManagerUpdate", v73];

      v74 = [(HFItemManager *)self home];
      v75 = objc_msgSend(v74, "hf_characteristicValueManager");
      v76 = [v114 readPolicy];
      v77 = [v114 logger];
      [v75 beginTransactionWithReason:v112 readPolicy:v76 logger:v77];

      v78 = [(HFItemManager *)self _internalItems];
      v79 = objc_msgSend(v78, "na_setByIntersectingWithSet:", v14);

      v80 = objc_msgSend(v14, "na_setByRemovingObjectsFromSet:", v79);
      v81 = [MEMORY[0x263EFF980] array];
      v82 = [v80 allObjects];
      v125[0] = MEMORY[0x263EF8330];
      v125[1] = 3221225472;
      v125[2] = __75__HFItemManager__updateResultsForItems_removedItems_context_allowDelaying___block_invoke_317;
      v125[3] = &unk_264095958;
      v125[4] = self;
      id v83 = v114;
      id v126 = v83;
      v84 = objc_msgSend(v82, "na_map:", v125);
      [v81 addObjectsFromArray:v84];

      v85 = [v79 allObjects];
      v123[0] = MEMORY[0x263EF8330];
      v123[1] = 3221225472;
      v123[2] = __75__HFItemManager__updateResultsForItems_removedItems_context_allowDelaying___block_invoke_2_320;
      v123[3] = &unk_264095958;
      v123[4] = self;
      id v86 = v83;
      id v124 = v86;
      v87 = objc_msgSend(v85, "na_map:", v123);
      [v81 addObjectsFromArray:v87];

      id v88 = objc_alloc_init(MEMORY[0x263F58190]);
      v89 = [(HFItemManager *)self home];
      v90 = objc_msgSend(v89, "hf_characteristicValueManager");
      [v90 commitTransactionWithReason:v112];

      v91 = [v86 logger];
      [(HFItemManager *)self _batchItemUpdateFutureWrappers:v81 removedItems:v113 batchingIntervals:&unk_26C0F81E8 logger:v91];

      v92 = (void *)MEMORY[0x263F58190];
      v93 = +[_HFItemUpdateFutureWrapper futuresFromWrappers:v81];
      v94 = [MEMORY[0x263F581B8] mainThreadScheduler];
      v95 = [v92 combineAllFutures:v93 ignoringErrors:1 scheduler:v94];

      objc_initWeak((id *)buf, self);
      v115[0] = MEMORY[0x263EF8330];
      v115[1] = 3221225472;
      v115[2] = __75__HFItemManager__updateResultsForItems_removedItems_context_allowDelaying___block_invoke_329;
      v115[3] = &unk_264095980;
      objc_copyWeak(v121, (id *)buf);
      id v96 = v79;
      id v116 = v96;
      id v97 = v80;
      id v117 = v97;
      id v118 = v113;
      v121[1] = spid;
      id v119 = v86;
      BOOL v122 = v108;
      id v98 = v88;
      id v120 = v98;
      id v99 = (id)[v95 addCompletionBlock:v115];
      v100 = v120;
      id v23 = v98;

      objc_destroyWeak(v121);
      objc_destroyWeak((id *)buf);
    }
    goto LABEL_45;
  }
  id v24 = [v114 updateOptions];
  id v25 = [v24 objectForKeyedSubscript:HFItemUpdateOptionFastInitialUpdate];
  char v26 = [v25 BOOLValue];

  if (v26) {
    goto LABEL_22;
  }
  v104 = HFLogForCategory(0x2AuLL);
  if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v145 = self;
    __int16 v146 = 2112;
    id v147 = v14;
    _os_log_impl(&dword_20B986000, v104, OS_LOG_TYPE_DEFAULT, "Request to updateResultsForItems for %@, but we're still performing the fast initial update. Once that is done, we'll reload all items anyway, so ignoring this duplicate request. itemsToUpdate: %@", buf, 0x16u);
  }

  id v23 = [(HFItemManager *)self firstFullUpdateFuture];
LABEL_45:

  return v23;
}

id __75__HFItemManager__updateResultsForItems_removedItems_context_allowDelaying___block_invoke_317(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = a2;
  os_signpost_id_t v5 = [v2 _performUpdateForItem:v4 withContext:v3 isInternal:0 isChild:0];
  BOOL v6 = +[_HFItemUpdateFutureWrapper wrapperWithFuture:v5 item:v4 isInternal:0];

  return v6;
}

- (id)_performUpdateForItem:(id)a3 withContext:(id)a4 isInternal:(BOOL)a5 isChild:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = [v10 latestResults];
  objc_msgSend(v10, "_debug_owningItemManager");
  id v13 = (HFItemManager *)objc_claimAutoreleasedReturnValue();

  uint64_t v14 = objc_msgSend(v10, "_debug_owningItemManager");
  if (v14)
  {
    uint64_t v15 = (void *)v14;
    objc_msgSend(v10, "_debug_owningItemManager");
    uint64_t v16 = (HFItemManager *)objc_claimAutoreleasedReturnValue();

    if (v16 != self)
    {
      os_signpost_id_t v17 = objc_msgSend(v10, "_debug_owningItemManager");
      NSLog(&cfstr_RequestToUpdat.isa, self, v17, v10);
    }
  }
  objc_msgSend(v10, "set_debug_owningItemManager:", self);
  objc_msgSend(v10, "set_debug_isChildItem:", v6);
  int v18 = [v11 updateOptions];
  char v19 = (void *)[v18 mutableCopy];

  [v19 setObject:v12 forKeyedSubscript:HFItemUpdateOptionPreviousResults];
  BOOL v20 = [v11 logger];
  [v19 setObject:v20 forKeyedSubscript:HFItemUpdateOptionLogger];

  BOOL v21 = [v10 updateWithOptions:v19];
  if (!v21)
  {
    NSLog(&cfstr_ProgrammerErro.isa, v10);
    id v22 = [v11 logger];

    if (v22)
    {
      state.opaque[0] = 0;
      state.opaque[1] = 0;
      id v23 = [v11 logger];
      id v24 = [v23 loggerActivity];
      os_activity_scope_enter(v24, &state);

      id v25 = HFLogForCategory(0x2AuLL);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v51 = v10;
        _os_log_impl(&dword_20B986000, v25, OS_LOG_TYPE_ERROR, "Programmer error: Items must always return a valid future from -updateWithOptions, but this item returned nil: %@", buf, 0xCu);
      }

      os_activity_scope_leave(&state);
    }
    else
    {
      id v38 = HFLogForCategory(0x2AuLL);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        LODWORD(state.opaque[0]) = 138412290;
        *(uint64_t *)((char *)state.opaque + 4) = (uint64_t)v10;
        _os_log_impl(&dword_20B986000, v38, OS_LOG_TYPE_ERROR, "Programmer error: Items must always return a valid future from -updateWithOptions, but this item returned nil: %@", (uint8_t *)&state, 0xCu);
      }
    }
    char v26 = (void *)MEMORY[0x263F58190];
    id v27 = +[HFItemUpdateOutcome outcomeWithResults:MEMORY[0x263EFFA78]];
    BOOL v21 = [v26 futureWithResult:v27];
  }
  BOOL v28 = v13 == self;
  v43[0] = MEMORY[0x263EF8330];
  v43[1] = 3221225472;
  v43[2] = __70__HFItemManager__performUpdateForItem_withContext_isInternal_isChild___block_invoke;
  v43[3] = &unk_2640959D0;
  v43[4] = self;
  id v29 = v10;
  id v44 = v29;
  id v30 = v11;
  id v45 = v30;
  BOOL v47 = a5;
  id v31 = v12;
  id v46 = v31;
  BOOL v48 = v28;
  BOOL v49 = v6;
  id v32 = [v21 flatMap:v43];
  v39[0] = MEMORY[0x263EF8330];
  v39[1] = 3221225472;
  v39[2] = __70__HFItemManager__performUpdateForItem_withContext_isInternal_isChild___block_invoke_353;
  v39[3] = &unk_264090508;
  id v40 = v30;
  id v41 = v29;
  id v42 = v31;
  id v33 = v31;
  id v34 = v29;
  id v35 = v30;
  uint64_t v36 = [v32 recover:v39];

  return v36;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NAFuture)firstFastUpdateFuture
{
  return self->_firstFastUpdateFuture;
}

- (void)_batchItemUpdateFutureWrappers:(id)a3 removedItems:(id)a4 batchingIntervals:(id)a5 logger:(id)a6
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (![v12 count]) {
    NSLog(&cfstr_NoBatchingInte.isa);
  }
  if ([v12 count] && (objc_msgSend(v10, "count") || objc_msgSend(v11, "count")))
  {
    if (v13)
    {
      state.opaque[0] = 0;
      state.opaque[1] = 0;
      uint64_t v14 = [v13 loggerActivity];
      os_activity_scope_enter(v14, &state);

      uint64_t v15 = HFLogForCategory(0x2AuLL);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = [v10 count];
        int v17 = [v11 count];
        int v18 = [v12 firstObject];
        [v18 floatValue];
        *(_DWORD *)buf = 67109632;
        *(_DWORD *)&uint8_t buf[4] = v16;
        LOWORD(v54) = 1024;
        *(_DWORD *)((char *)&v54 + 2) = v17;
        HIWORD(v54) = 2048;
        *(double *)&uint64_t v55 = v19;
        _os_log_impl(&dword_20B986000, v15, OS_LOG_TYPE_DEFAULT, "Requested batched update for %d items (+%d removed). Processing in: %.2f sec...", buf, 0x18u);
      }
      os_activity_scope_leave(&state);
    }
    else
    {
      id v34 = HFLogForCategory(0x2AuLL);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        int v35 = [v10 count];
        int v36 = [v11 count];
        id v37 = [v12 firstObject];
        [v37 floatValue];
        *(_DWORD *)buf = 67109632;
        *(_DWORD *)&uint8_t buf[4] = v35;
        LOWORD(v54) = 1024;
        *(_DWORD *)((char *)&v54 + 2) = v36;
        HIWORD(v54) = 2048;
        *(double *)&uint64_t v55 = v38;
        _os_log_impl(&dword_20B986000, v34, OS_LOG_TYPE_DEFAULT, "Requested batched update for %d items (+%d removed). Processing in: %.2f sec...", buf, 0x18u);
      }
    }
    objc_initWeak((id *)&state, self);
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __86__HFItemManager__batchItemUpdateFutureWrappers_removedItems_batchingIntervals_logger___block_invoke;
    aBlock[3] = &unk_264095D18;
    objc_copyWeak(&v51, (id *)&state);
    id v20 = v10;
    id v47 = v20;
    id v48 = v11;
    id v49 = v13;
    id v21 = v12;
    id v50 = v21;
    id v22 = (void (**)(void))_Block_copy(aBlock);
    [(HFItemManager *)self setUpCustomDiffableDataSource];
    id v23 = [MEMORY[0x263F581B8] mainThreadScheduler];
    *(void *)buf = 0;
    id v54 = buf;
    uint64_t v55 = 0x2020000000;
    char v56 = 0;
    id v24 = [v21 firstObject];
    [v24 doubleValue];
    double v26 = v25;

    if (v26 >= 0.00000011920929)
    {
      v43[0] = MEMORY[0x263EF8330];
      v43[1] = 3221225472;
      v43[2] = __86__HFItemManager__batchItemUpdateFutureWrappers_removedItems_batchingIntervals_logger___block_invoke_2;
      v43[3] = &unk_264095D40;
      id v45 = buf;
      id v44 = v22;
      id v27 = [v23 afterDelay:v43 performBlock:v26];
    }
    else
    {
      v54[24] = 1;
      v22[2](v22);
      id v27 = 0;
    }
    BOOL v28 = (void *)MEMORY[0x263F58190];
    id v29 = +[_HFItemUpdateFutureWrapper futuresFromWrappers:v20];
    id v30 = [v28 combineAllFutures:v29 ignoringErrors:1 scheduler:v23];

    v39[0] = MEMORY[0x263EF8330];
    v39[1] = 3221225472;
    v39[2] = __86__HFItemManager__batchItemUpdateFutureWrappers_removedItems_batchingIntervals_logger___block_invoke_3;
    v39[3] = &unk_264095D68;
    id v42 = buf;
    id v31 = v27;
    id v40 = v31;
    id v32 = v22;
    id v41 = v32;
    id v33 = (id)[v30 addCompletionBlock:v39];

    _Block_object_dispose(buf, 8);
    objc_destroyWeak(&v51);
    objc_destroyWeak((id *)&state);
  }
}

- (BOOL)hasRequestedFirstUpdate
{
  return self->_hasRequestedFirstUpdate;
}

- (id)_allDisplayedItemsIncludingInternalItems
{
  uint64_t v3 = [(HFItemManager *)self allDisplayedItems];
  id v4 = [(HFItemManager *)self _internalItems];
  os_signpost_id_t v5 = [v3 setByAddingObjectsFromSet:v4];

  return v5;
}

- (id)_allItemsIncludingInternalItems
{
  uint64_t v3 = [(HFItemManager *)self allItems];
  id v4 = [(HFItemManager *)self _internalItems];
  os_signpost_id_t v5 = [v3 setByAddingObjectsFromSet:v4];

  return v5;
}

- (id)_internalItems
{
  uint64_t v2 = (void *)MEMORY[0x263EFFA08];
  uint64_t v3 = [(HFItemManager *)self sourceItem];
  id v4 = objc_msgSend(v2, "na_setWithSafeObject:", v3);

  return v4;
}

- (HFItem)sourceItem
{
  return self->_sourceItem;
}

- (void)_updateRepresentationForExternalItemsWithUpdatedOrAddedItems:(id)a3 removedItems:(id)a4 logger:(id)a5
{
  id v19 = a3;
  id v8 = a4;
  id v9 = a5;
  [(HFItemManager *)self setUpCustomDiffableDataSource];
  id v10 = [(HFItemManager *)self firstFastUpdateFuture];
  char v11 = [v10 isFinished];

  if ((v11 & 1) == 0) {
    [(HFItemManager *)self _prefetchResourcesIfNeededForItems:v19];
  }
  if ([(HFItemManager *)self useCustomDiffableDataSource])
  {
    [(HFItemManager *)self _updateRepresentationWithCustomDiffableDataSourceForExternalItemsWithUpdatedOrAddedItems:v19 removedItems:v8 logger:v9];
    id v12 = (void *)MEMORY[0x263F58190];
    id v13 = (void *)MEMORY[0x263EFFA08];
    uint64_t v14 = [(HFItemManager *)self diffableDataSource];
    uint64_t v15 = [v14 snapshot];
    int v16 = [v15 itemIdentifiers];
    int v17 = [v13 setWithArray:v16];
    int v18 = [v12 futureWithResult:v17];
    [(HFItemManager *)self setLatestSnapshotGenerationFuture:v18];
  }
  else
  {
    uint64_t v14 = [(HFItemManager *)self _updateRepresentationWithUIDiffableDataSourceForExternalItemsWithUpdatedOrAddedItems:v19 removedItems:v8 logger:v9];
    [(HFItemManager *)self setLatestSnapshotGenerationFuture:v14];
  }
}

- (void)setUpCustomDiffableDataSource
{
  uint64_t v3 = [(HFItemManager *)self diffableDataSource];

  if (v3) {
    return;
  }
  if (![(HFItemManager *)self useCustomDiffableDataSource])
  {
    id v4 = [(HFItemManager *)self delegate];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
    }
    else
    {
      os_signpost_id_t v5 = [(HFItemManager *)self delegate];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
      {
        BOOL diffableDataSourceDisabled = 1;
        goto LABEL_8;
      }
    }
    BOOL diffableDataSourceDisabled = self->_diffableDataSourceDisabled;
LABEL_8:
    [(HFItemManager *)self setUseCustomDiffableDataSource:diffableDataSourceDisabled];
  }
  if ([(HFItemManager *)self useCustomDiffableDataSource])
  {
    self->_diffableDataSource = (HFDiffableDataSource *)objc_alloc_init(HFCustomDiffableDataSource);
    MEMORY[0x270F9A758]();
  }
}

- (BOOL)useCustomDiffableDataSource
{
  return self->_useCustomDiffableDataSource;
}

- (void)setLatestSnapshotGenerationFuture:(id)a3
{
}

- (id)_processBatchUpdateForFutureWrappers:(id)a3 removedItems:(id)a4 logger:(id)a5
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v35 = a4;
  id v34 = a5;
  id v8 = (void *)[v7 mutableCopy];
  id v9 = [MEMORY[0x263EFF9C0] set];
  id v10 = [MEMORY[0x263EFF9C0] set];
  id v37 = [MEMORY[0x263EFF9C0] set];
  int v36 = [MEMORY[0x263EFF9C0] set];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v11 = v7;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v38 objects:v45 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v39 != v14) {
          objc_enumerationMutation(v11);
        }
        int v16 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        int v17 = [v16 future];
        int v18 = [v17 isFinished];

        if (v18)
        {
          id v19 = [v16 isInternal] ? v9 : v10;
          id v20 = [v16 item];
          [v19 addObject:v20];

          [v8 removeObject:v16];
          id v21 = [v16 outcome];
          uint64_t v22 = [v21 outcomeType];

          if (v22 == 2)
          {
            if ([v16 isInternal]) {
              id v23 = v36;
            }
            else {
              id v23 = v37;
            }
            id v24 = [v16 item];
            [v23 addObject:v24];
          }
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v38 objects:v45 count:16];
    }
    while (v13);
  }

  if ([v9 count]) {
    [(HFItemManager *)self _updateRepresentationForInternalItemsWithUpdatedItems:v36];
  }
  if ([v10 count] || objc_msgSend(v35, "count")) {
    [(HFItemManager *)self _updateRepresentationForExternalItemsWithUpdatedOrAddedItems:v37 removedItems:v35 logger:v34];
  }
  if (v34)
  {
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    double v25 = [v34 loggerActivity];
    os_activity_scope_enter(v25, &state);

    double v26 = HFLogForCategory(0x2AuLL);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      int v27 = [v9 count];
      int v28 = [v10 count];
      *(_DWORD *)buf = 67109120;
      int v43 = v28 + v27;
      _os_log_impl(&dword_20B986000, v26, OS_LOG_TYPE_DEFAULT, "Processed batch with %d finished items", buf, 8u);
    }

    os_activity_scope_leave(&state);
  }
  else
  {
    id v30 = HFLogForCategory(0x2AuLL);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      int v31 = [v9 count];
      int v32 = [v10 count];
      LODWORD(state.opaque[0]) = 67109120;
      HIDWORD(state.opaque[0]) = v32 + v31;
      _os_log_impl(&dword_20B986000, v30, OS_LOG_TYPE_DEFAULT, "Processed batch with %d finished items", (uint8_t *)&state, 8u);
    }
  }
  return v8;
}

void __86__HFItemManager__batchItemUpdateFutureWrappers_removedItems_batchingIntervals_logger___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  uint64_t v2 = [WeakRetained _processBatchUpdateForFutureWrappers:*(void *)(a1 + 32) removedItems:*(void *)(a1 + 40) logger:*(void *)(a1 + 48)];
  uint64_t v3 = (void *)[*(id *)(a1 + 56) mutableCopy];
  if ((unint64_t)[v3 count] >= 2) {
    [v3 removeObjectAtIndex:0];
  }
  id v4 = [MEMORY[0x263EFFA08] set];
  [WeakRetained _batchItemUpdateFutureWrappers:v2 removedItems:v4 batchingIntervals:v3 logger:*(void *)(a1 + 48)];
}

- (void)recalculateVisibilityAndSortAllItems
{
  id v4 = [MEMORY[0x263EFFA08] set];
  uint64_t v3 = [MEMORY[0x263EFFA08] set];
  [(HFItemManager *)self _updateRepresentationForExternalItemsWithUpdatedOrAddedItems:v4 removedItems:v3 logger:0];
}

- (void)setUseCustomDiffableDataSource:(BOOL)a3
{
  self->_useCustomDiffableDataSource = a3;
}

uint64_t __45__HFItemManager_resetItemProvidersAndModules__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 itemProviders];
}

uint64_t __45__HFItemManager_resetItemProvidersAndModules__block_invoke(uint64_t a1, void *a2)
{
  return [a2 registerForExternalUpdates];
}

- (BOOL)diffableDataSourceDisabled
{
  return self->_diffableDataSourceDisabled;
}

uint64_t __50__HFItemManager__buildSectionsWithDisplayedItems___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) itemModules];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __50__HFItemManager__buildSectionsWithDisplayedItems___block_invoke_3;
  v8[3] = &unk_264095A88;
  id v9 = v3;
  id v5 = v3;
  uint64_t v6 = objc_msgSend(v4, "na_any:", v8) ^ 1;

  return v6;
}

void __127__HFItemManager__reloadItemProviders_updateItems_shouldUpdateExistingItems_senderSelector_readPolicy_fastInitialUpdatePromise___block_invoke_7(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v8 = a2;
  id v7 = [v5 itemModules];
  objc_msgSend(v7, "na_each:", &__block_literal_global_256_0);

  [*(id *)(a1 + 40) finish];
  [*(id *)(a1 + 48) finishWithResult:v8 error:v6];
}

- (void)resetItemProvidersAndModules
{
  id v3 = [(HFItemManager *)self home];
  if (v3)
  {

    goto LABEL_4;
  }
  if ([(HFItemManager *)self _shouldBuildItemProvidersAndModulesForNilHome])
  {
LABEL_4:
    id v4 = [(HFItemManager *)self home];
    id v5 = [(HFItemManager *)self _buildItemModulesForHome:v4];
    [(HFItemManager *)self setItemModules:v5];

    id v6 = [(HFItemManager *)self disableUpdateReasons];
    uint64_t v7 = [v6 count];

    if (!v7)
    {
      id v8 = [(HFItemManager *)self itemModules];
      objc_msgSend(v8, "na_each:", &__block_literal_global_280);
    }
    id v9 = (void *)MEMORY[0x263EFFA08];
    id v10 = [(HFItemManager *)self itemModules];
    id v11 = [v9 setWithArray:v10];
    uint64_t v12 = objc_msgSend(v11, "na_flatMap:", &__block_literal_global_283);
    [(HFItemManager *)self setModuleItemProviderSet:v12];

    uint64_t v13 = [(HFItemManager *)self home];

    if (v13)
    {
      uint64_t v14 = [(HFItemManager *)self home];
      id v30 = [(HFItemManager *)self _buildItemProvidersForHome:v14];

      uint64_t v15 = (uint64_t)v30;
      if (v30)
      {
LABEL_9:
        id v31 = (id)v15;
        int v16 = [MEMORY[0x263EFFA08] setWithArray:v15];
        [(HFItemManager *)self setSubclassItemProviderSet:v16];

        int v17 = [(HFItemManager *)self subclassItemProviderSet];
        uint64_t v18 = [v17 count];
        uint64_t v19 = [v31 count];

        if (v18 != v19) {
          NSLog(&cfstr_DuplicateItemP.isa, self, v31);
        }
        id v20 = [(HFItemManager *)self moduleItemProviderSet];
        id v21 = [(HFItemManager *)self subclassItemProviderSet];
        int v22 = [v20 intersectsSet:v21];

        if (v22)
        {
          id v23 = [(HFItemManager *)self moduleItemProviderSet];
          id v24 = [(HFItemManager *)self subclassItemProviderSet];
          NSLog(&cfstr_SubclassIsRetu.isa, self, v23, v24);
        }
        double v25 = [(HFItemManager *)self subclassItemProviderSet];
        double v26 = [(HFItemManager *)self moduleItemProviderSet];
        int v27 = [v25 setByAddingObjectsFromSet:v26];
        int v28 = [v27 allObjects];
        [(HFItemManager *)self setItemProviders:v28];

        return;
      }
    }
    else
    {
      uint64_t v15 = [(HFItemManager *)self _buildItemProvidersWithoutHome];
      if (v15) {
        goto LABEL_9;
      }
    }
    NSLog(&cfstr_HfitemmanagerA.isa, self);
    uint64_t v15 = MEMORY[0x263EFFA68];
    goto LABEL_9;
  }
  uint64_t v29 = MEMORY[0x263EFFA68];
  [(HFItemManager *)self setItemModules:MEMORY[0x263EFFA68]];
  [(HFItemManager *)self setItemProviders:v29];
}

- (NSSet)subclassItemProviderSet
{
  return self->_subclassItemProviderSet;
}

- (void)_didFinishUpdateTransactionWithAffectedItems:(id)a3
{
  id v4 = a3;
  id v5 = [(HFItemManager *)self itemModules];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __62__HFItemManager__didFinishUpdateTransactionWithAffectedItems___block_invoke;
  v7[3] = &unk_264095790;
  id v8 = v4;
  id v6 = v4;
  objc_msgSend(v5, "na_each:", v7);
}

- (id)_itemsToHideInSet:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x263EFF9C0] set];
  id v6 = [v4 objectsPassingTest:&__block_literal_global_409];
  [v5 unionSet:v6];
  uint64_t v7 = [(HFItemManager *)self _displayFilter];

  if (v7)
  {
    id v8 = [(HFItemManager *)self _displayFilter];
    id v9 = objc_msgSend(v4, "na_filter:", v8);

    id v10 = objc_msgSend(v4, "na_setByRemovingObjectsFromSet:", v9);
    [v5 unionSet:v10];
  }
  id v11 = [(HFItemManager *)self _itemsOfClass:objc_opt_class() inItems:v4 allowTransformedItems:1];
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = [(HFItemManager *)self allItems];
  uint64_t v14 = [(HFItemManager *)self _itemsOfClass:v12 inItems:v13 allowTransformedItems:1];

  if ([v11 count])
  {
    uint64_t v15 = [(HFItemManager *)self _serviceItemsToHideInSet:v11 allServiceGroupItems:v14];
    if (v15) {
      [v5 unionSet:v15];
    }
  }
  int v16 = [(HFItemManager *)self home];
  char v17 = objc_msgSend(v16, "hf_currentUserIsAdministrator");

  if ((v17 & 1) == 0)
  {
    uint64_t v18 = objc_msgSend(v4, "na_filter:", &__block_literal_global_413);
    [v5 unionSet:v18];
  }
  uint64_t v19 = [(HFItemManager *)self home];
  char v20 = objc_msgSend(v19, "hf_currentUserIsOwner");

  if ((v20 & 1) == 0)
  {
    id v21 = objc_msgSend(v4, "na_filter:", &__block_literal_global_415);
    [v5 unionSet:v21];
  }
  int v22 = [(HFItemManager *)self itemModules];
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __35__HFItemManager__itemsToHideInSet___block_invoke_4;
  v28[3] = &unk_264095B40;
  id v29 = v4;
  id v23 = v5;
  id v30 = v23;
  id v24 = v4;
  objc_msgSend(v22, "na_each:", v28);

  double v25 = v30;
  id v26 = v23;

  return v26;
}

- (NSArray)itemModules
{
  return self->_itemModules;
}

- (id)_itemsOfClass:(Class)a3 inItems:(id)a4 allowTransformedItems:(BOOL)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = [MEMORY[0x263EFF9C0] set];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            continue;
          }
          uint64_t v13 = objc_msgSend(v12, "sourceHomeKitItem", (void)v16);
          char isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) == 0) {
            continue;
          }
        }
        objc_msgSend(v6, "addObject:", v12, (void)v16);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  return v6;
}

- (id)_displayFilter
{
  return self->__displayFilter;
}

- (id)_serviceItemsToHideInSet:(id)a3 allServiceGroupItems:(id)a4
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v23 = [MEMORY[0x263EFF9C0] set];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  obuint64_t j = v6;
  uint64_t v25 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v25)
  {
    uint64_t v24 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v31 != v24) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        objc_opt_class();
        uint64_t v10 = [v9 homeKitObject];
        if (objc_opt_isKindOfClass()) {
          id v11 = v10;
        }
        else {
          id v11 = 0;
        }
        id v12 = v11;

        uint64_t v13 = [(HFItemManager *)self home];
        uint64_t v14 = objc_msgSend(v13, "hf_serviceGroupsForService:", v12);

        long long v28 = 0u;
        long long v29 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        id v15 = v14;
        uint64_t v16 = [v15 countByEnumeratingWithState:&v26 objects:v34 count:16];
        if (v16)
        {
          uint64_t v17 = v16;
          uint64_t v18 = *(void *)v27;
          while (2)
          {
            for (uint64_t j = 0; j != v17; ++j)
            {
              if (*(void *)v27 != v18) {
                objc_enumerationMutation(v15);
              }
              char v20 = [(HFItemManager *)self _serviceGroupItemForServiceGroup:*(void *)(*((void *)&v26 + 1) + 8 * j) inItems:v7];
              if (v20
                && [(HFItemManager *)self _shouldHideServiceItem:v9 containedInServiceGroupItem:v20])
              {

                [v23 addObject:v9];
                goto LABEL_20;
              }
            }
            uint64_t v17 = [v15 countByEnumeratingWithState:&v26 objects:v34 count:16];
            if (v17) {
              continue;
            }
            break;
          }
        }

LABEL_20:
      }
      uint64_t v25 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v25);
  }

  return v23;
}

- (NSSet)moduleItemProviderSet
{
  return self->_moduleItemProviderSet;
}

- (void)setSubclassItemProviderSet:(id)a3
{
}

- (void)setModuleItemProviderSet:(id)a3
{
}

- (void)setItemProviders:(id)a3
{
}

- (void)setItemModules:(id)a3
{
  id v8 = a3;
  if (!-[NSArray isEqualToArray:](self->_itemModules, "isEqualToArray:"))
  {
    objc_storeStrong((id *)&self->_itemModules, a3);
    id v5 = [(HFItemManager *)self delegate];
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      id v7 = [(HFItemManager *)self delegate];
      [v7 itemManager:self didUpdateItemModules:v8];
    }
  }
}

- (id)_buildItemModulesForHome:(id)a3
{
  return (id)MEMORY[0x263EFFA68];
}

- (void)cameraSnapshotControl:(id)a3 didTakeSnapshot:(id)a4 error:(id)a5
{
  -[HFItemManager _cameraForCameraControl:](self, "_cameraForCameraControl:", a3, a4, a5);
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  id v8 = objc_msgSend(MEMORY[0x263EFFA08], "na_setWithSafeObject:", v13);
  uint64_t v9 = [(HFItemManager *)self _itemsToUpdateForModifiedCameras:v8];
  uint64_t v10 = [v13 accessory];
  id v11 = [v10 home];
  id v12 = (id)[v7 requestUpdateForItems:v9 itemProviderInvalidationReasons:MEMORY[0x263EFFA68] modifiedHome:v11 senderSelector:a2];
}

- (id)_cameraForCameraControl:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v5 = [(HFItemManager *)self home];
  char v6 = [v5 accessories];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v30;
    uint64_t v23 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v30 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        id v12 = objc_msgSend(v11, "cameraProfiles", v23);
        uint64_t v13 = [v12 countByEnumeratingWithState:&v25 objects:v33 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v26;
          uint64_t v24 = v8;
          while (2)
          {
            for (uint64_t j = 0; j != v14; ++j)
            {
              if (*(void *)v26 != v15) {
                objc_enumerationMutation(v12);
              }
              uint64_t v17 = *(void **)(*((void *)&v25 + 1) + 8 * j);
              uint64_t v18 = [v17 streamControl];
              if ((id)v18 == v4)
              {

LABEL_20:
                id v21 = v17;

                goto LABEL_21;
              }
              long long v19 = (void *)v18;
              id v20 = [v17 snapshotControl];

              if (v20 == v4) {
                goto LABEL_20;
              }
            }
            uint64_t v14 = [v12 countByEnumeratingWithState:&v25 objects:v33 count:16];
            uint64_t v9 = v23;
            uint64_t v8 = v24;
            if (v14) {
              continue;
            }
            break;
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v29 objects:v34 count:16];
      id v21 = 0;
    }
    while (v8);
  }
  else
  {
    id v21 = 0;
  }
LABEL_21:

  return v21;
}

- (id)_itemsToUpdateForModifiedCameras:(id)a3
{
  id v4 = a3;
  id v5 = [(HFItemManager *)self _directItemDependenciesForHomeKitObjects:v4 class:objc_opt_class()];

  return v5;
}

- (id)displayedItemAtIndexPath:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v9 = [MEMORY[0x263F08690] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"HFItemManager.m", 2457, @"Invalid parameter not satisfying: %@", @"indexPath" object file lineNumber description];
  }
  char v6 = [(HFItemManager *)self diffableDataSource];
  uint64_t v7 = [v6 itemIdentifierForIndexPath:v5];

  return v7;
}

- (void)setDiffableDataSource:(id)a3
{
  id v6 = a3;
  if ((-[HFDiffableDataSource isEqual:](self->_diffableDataSource, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_diffableDataSource, a3);
    id v5 = [(HFItemManager *)self UIDiffableDataInitializationFuture];
    [v5 finishWithNoResult];
  }
}

- (void)homeDidUpdateHomeEnergyManagerEnabled:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = HFLogForCategory(0x24uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = [v5 name];
    *(_DWORD *)buf = 138412802;
    uint64_t v15 = self;
    __int16 v16 = 2080;
    uint64_t v17 = "-[HFItemManager(HomeKitDelegates) homeDidUpdateHomeEnergyManagerEnabled:]";
    __int16 v18 = 2112;
    long long v19 = v7;
    _os_log_impl(&dword_20B986000, v6, OS_LOG_TYPE_DEFAULT, "(%@ %s) HFItemManager Delegates ~~> Dispatching onto onto main. home name: %@", buf, 0x20u);
  }
  uint64_t v8 = [(HFItemManager *)self batchedDelegateAdapterAllowingReads];
  uint64_t v9 = objc_msgSend(MEMORY[0x263EFFA08], "na_setWithSafeObject:", v5);
  uint64_t v10 = [(HFItemManager *)self _itemsToUpdateForModifiedMetadataForHomes:v9];
  uint64_t v13 = @"homeEnergy";
  id v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v13 count:1];
  id v12 = (id)[v8 requestUpdateForItems:v10 itemProviderInvalidationReasons:v11 modifiedHome:v5 senderSelector:a2];
}

- (id)_itemsToUpdateForModifiedMetadataForHomes:(id)a3
{
  id v4 = a3;
  id v5 = [(HFItemManager *)self _directItemDependenciesForHomeKitObjects:v4 class:objc_opt_class()];

  return v5;
}

id __127__HFItemManager__reloadItemProviders_updateItems_shouldUpdateExistingItems_senderSelector_readPolicy_fastInitialUpdatePromise___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v90 = *MEMORY[0x263EF8340];
  id v3 = a2;
  from = (id *)(a1 + 64);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  id v4 = [MEMORY[0x263EFF9C0] set];
  id v5 = [MEMORY[0x263EFF9C0] set];
  id v6 = [MEMORY[0x263EFF9C0] set];
  [v6 unionSet:*(void *)(a1 + 32)];
  long long v82 = 0u;
  long long v83 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  obuint64_t j = v3;
  uint64_t v7 = [obj countByEnumeratingWithState:&v80 objects:v89 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v81;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v81 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v80 + 1) + 8 * i);
        id v11 = [v10 addedItems];
        uint64_t v12 = [v11 count];

        if (v12)
        {
          uint64_t v13 = [v10 addedItems];
          [v4 unionSet:v13];
        }
        uint64_t v14 = [v10 removedItems];
        uint64_t v15 = [v14 count];

        if (v15)
        {
          __int16 v16 = [v10 removedItems];
          [v5 unionSet:v16];

          uint64_t v17 = [v10 removedItems];
          [v6 minusSet:v17];
        }
        __int16 v18 = [v10 existingItems];
        uint64_t v19 = [v18 count];

        if (v19 && *(unsigned char *)(a1 + 80))
        {
          uint64_t v20 = [v10 existingItems];
          [v6 unionSet:v20];
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v80 objects:v89 count:16];
    }
    while (v7);
  }

  v62 = (void *)[v4 mutableCopy];
  id v21 = objc_msgSend(*(id *)(a1 + 32), "na_filter:", &__block_literal_global_245_0);
  [v62 unionSet:v21];

  int v22 = (void *)MEMORY[0x263F58190];
  uint64_t v23 = [MEMORY[0x263EFFA08] set];
  v61 = [v22 futureWithResult:v23];

  uint64_t v24 = (void *)[v4 mutableCopy];
  [v24 unionSet:v6];
  if ([WeakRetained _shouldPerformFastInitialUpdates] && objc_msgSend(v62, "count"))
  {
    long long v25 = *(void **)(a1 + 40);
    if (v25)
    {
      state.opaque[0] = 0;
      state.opaque[1] = 0;
      long long v26 = [v25 loggerActivity];
      os_activity_scope_enter(v26, &state);

      long long v27 = HFLogForCategory(0x2AuLL);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v87 = v62;
        _os_log_impl(&dword_20B986000, v27, OS_LOG_TYPE_DEFAULT, "Starting a fast initial update for items: %@", buf, 0xCu);
      }

      os_activity_scope_leave(&state);
    }
    else
    {
      BOOL v58 = HFLogForCategory(0x2AuLL);
      if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(state.opaque[0]) = 138412290;
        *(uint64_t *)((char *)state.opaque + 4) = (uint64_t)v62;
        _os_log_impl(&dword_20B986000, v58, OS_LOG_TYPE_DEFAULT, "Starting a fast initial update for items: %@", (uint8_t *)&state, 0xCu);
      }
    }
    if ([v5 count])
    {
      long long v28 = *(void **)(a1 + 40);
      if (v28)
      {
        state.opaque[0] = 0;
        state.opaque[1] = 0;
        long long v29 = [v28 loggerActivity];
        os_activity_scope_enter(v29, &state);

        long long v30 = HFLogForCategory(0x2AuLL);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v87 = v5;
          _os_log_impl(&dword_20B986000, v30, OS_LOG_TYPE_DEFAULT, "Processing removed items in this fast update: %@", buf, 0xCu);
        }

        os_activity_scope_leave(&state);
      }
      else
      {
        v59 = HFLogForCategory(0x2AuLL);
        if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(state.opaque[0]) = 138412290;
          *(uint64_t *)((char *)state.opaque + 4) = (uint64_t)v5;
          _os_log_impl(&dword_20B986000, v59, OS_LOG_TYPE_DEFAULT, "Processing removed items in this fast update: %@", (uint8_t *)&state, 0xCu);
        }
      }
    }
    long long v31 = objc_opt_new();
    [v31 setSenderSelector:*(void *)(a1 + 72)];
    [v31 setLogger:*(void *)(a1 + 40)];
    v84[0] = HFItemUpdateOptionFastInitialUpdate;
    v84[1] = HFItemUpdateOptionDisableOptionalData;
    v85[0] = MEMORY[0x263EFFA88];
    long long v32 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(WeakRetained, "_shouldDisableOptionalDataDuringFastInitialUpdate"));
    v85[1] = v32;
    long long v33 = [NSDictionary dictionaryWithObjects:v85 forKeys:v84 count:2];
    [v31 setUpdateOptions:v33];

    id v34 = +[HFStaticReadPolicy policyWithDecision:0];
    [v31 setReadPolicy:v34];

    uint64_t v35 = [WeakRetained _updateResultsForItems:v62 removedItems:v5 context:v31 allowDelaying:1];

    char v36 = 1;
    v61 = (void *)v35;
  }
  else
  {
    if ([v4 count])
    {
      id v37 = *(void **)(a1 + 40);
      if (v37)
      {
        state.opaque[0] = 0;
        state.opaque[1] = 0;
        long long v38 = [v37 loggerActivity];
        os_activity_scope_enter(v38, &state);

        long long v39 = HFLogForCategory(0x2AuLL);
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v87 = v4;
          _os_log_impl(&dword_20B986000, v39, OS_LOG_TYPE_DEFAULT, "Item providers asked to add items: %@", buf, 0xCu);
        }

        os_activity_scope_leave(&state);
      }
      else
      {
        char v56 = HFLogForCategory(0x2AuLL);
        if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(state.opaque[0]) = 138412290;
          *(uint64_t *)((char *)state.opaque + 4) = (uint64_t)v4;
          _os_log_impl(&dword_20B986000, v56, OS_LOG_TYPE_DEFAULT, "Item providers asked to add items: %@", (uint8_t *)&state, 0xCu);
        }
      }
    }
    if ([v5 count])
    {
      long long v40 = *(void **)(a1 + 40);
      if (v40)
      {
        state.opaque[0] = 0;
        state.opaque[1] = 0;
        long long v41 = [v40 loggerActivity];
        os_activity_scope_enter(v41, &state);

        id v42 = HFLogForCategory(0x2AuLL);
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v87 = v5;
          _os_log_impl(&dword_20B986000, v42, OS_LOG_TYPE_DEFAULT, "Item providers asked to remove items: %@", buf, 0xCu);
        }

        os_activity_scope_leave(&state);
      }
      else
      {
        uint64_t v57 = HFLogForCategory(0x2AuLL);
        if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(state.opaque[0]) = 138412290;
          *(uint64_t *)((char *)state.opaque + 4) = (uint64_t)v5;
          _os_log_impl(&dword_20B986000, v57, OS_LOG_TYPE_DEFAULT, "Item providers asked to remove items: %@", (uint8_t *)&state, 0xCu);
        }
      }
    }
    int v43 = *(void **)(a1 + 48);
    long long v31 = [MEMORY[0x263EFFA08] set];
    [v43 finishWithResult:v31];
    char v36 = 0;
  }

  v78[0] = MEMORY[0x263EF8330];
  v78[1] = 3221225472;
  v78[2] = __127__HFItemManager__reloadItemProviders_updateItems_shouldUpdateExistingItems_senderSelector_readPolicy_fastInitialUpdatePromise___block_invoke_248;
  v78[3] = &unk_264095820;
  objc_copyWeak(&v79, from);
  id v44 = [v61 flatMap:v78];
  id v45 = objc_alloc_init(MEMORY[0x263F58190]);
  v68[0] = MEMORY[0x263EF8330];
  v68[1] = 3221225472;
  v68[2] = __127__HFItemManager__reloadItemProviders_updateItems_shouldUpdateExistingItems_senderSelector_readPolicy_fastInitialUpdatePromise___block_invoke_3_252;
  v68[3] = &unk_264095898;
  objc_copyWeak(v75, from);
  id v69 = *(id *)(a1 + 48);
  char v76 = v36;
  uint64_t v46 = v24;
  id v47 = v5;
  char v77 = v36;
  id v48 = *(void **)(a1 + 72);
  id v70 = v47;
  v75[1] = v48;
  id v71 = *(id *)(a1 + 40);
  id v72 = *(id *)(a1 + 56);
  id v73 = *(id *)(a1 + 32);
  id v49 = v46;
  id v74 = v49;
  id v50 = [v44 flatMap:v68];
  v65[0] = MEMORY[0x263EF8330];
  v65[1] = 3221225472;
  v65[2] = __127__HFItemManager__reloadItemProviders_updateItems_shouldUpdateExistingItems_senderSelector_readPolicy_fastInitialUpdatePromise___block_invoke_7;
  v65[3] = &unk_26408D260;
  v65[4] = WeakRetained;
  id v66 = *(id *)(a1 + 40);
  id v51 = v45;
  id v67 = v51;
  id v52 = (id)[v50 addCompletionBlock:v65];
  uint64_t v53 = v67;
  id v54 = v51;

  objc_destroyWeak(v75);
  objc_destroyWeak(&v79);

  return v54;
}

- (BOOL)_shouldPerformFastInitialUpdates
{
  return 1;
}

- (BOOL)_shouldDisableOptionalDataDuringFastInitialUpdate
{
  if (+[HFExecutionEnvironment isHomeApp]
    || +[HFExecutionEnvironment isHomeControlService])
  {
    return 1;
  }
  return +[HFExecutionEnvironment isSpringBoard];
}

void __127__HFItemManager__reloadItemProviders_updateItems_shouldUpdateExistingItems_senderSelector_readPolicy_fastInitialUpdatePromise___block_invoke_5(uint64_t a1)
{
  v9[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = objc_opt_new();
  [v2 setSenderSelector:*(void *)(a1 + 88)];
  [v2 setLogger:*(void *)(a1 + 32)];
  [v2 setReadPolicy:*(void *)(a1 + 40)];
  if ([*(id *)(a1 + 48) count])
  {
    uint64_t v8 = HFItemUpdateOptionFullUpdateIndicated;
    v9[0] = MEMORY[0x263EFFA88];
    id v3 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
    [v2 setUpdateOptions:v3];
  }
  id v4 = [*(id *)(a1 + 56) _updateResultsForItems:*(void *)(a1 + 64) removedItems:*(void *)(a1 + 72) context:v2 allowDelaying:1];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __127__HFItemManager__reloadItemProviders_updateItems_shouldUpdateExistingItems_senderSelector_readPolicy_fastInitialUpdatePromise___block_invoke_6;
  v6[3] = &unk_26408F170;
  id v7 = *(id *)(a1 + 80);
  id v5 = (id)[v4 addCompletionBlock:v6];
}

- (void)home:(id)a3 willReadValuesForCharacteristics:(id)a4
{
  id v5 = [(HFItemManager *)self _itemsToUpdateForModifiedCharacteristics:a4];
  [(HFItemManager *)self _updateLoadingStateAndNotifyDelegateForItems:v5 canFinishTransaction:1];
}

- (id)updateResultsForItems:(id)a3 senderSelector:(SEL)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = objc_opt_new();
  [v7 setSenderSelector:a4];
  uint64_t v8 = [(HFItemManager *)self readPolicy];
  [v7 setReadPolicy:v8];

  uint64_t v12 = HFItemUpdateOptionFullUpdateIndicated;
  v13[0] = MEMORY[0x263EFFA88];
  uint64_t v9 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];
  [v7 setUpdateOptions:v9];

  uint64_t v10 = [(HFItemManager *)self _updateResultsForItems:v6 context:v7];

  return v10;
}

- (HFCharacteristicReadPolicy)readPolicy
{
  return self->_readPolicy;
}

- (void)walletKeyDeviceStateUpdated:(id)a3 inHome:(id)a4
{
  id v11 = a4;
  id v7 = a3;
  uint64_t v8 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  uint64_t v9 = [(HFItemManager *)self _itemsToUpdateForModifiedWalletKeyDeviceState:v7];

  id v10 = (id)[v8 requestUpdateForItems:v9 itemProviderInvalidationReasons:MEMORY[0x263EFFA68] modifiedHome:v11 senderSelector:a2];
}

- (id)_itemsToUpdateForModifiedWalletKeyDeviceState:(id)a3
{
  id v4 = objc_msgSend(MEMORY[0x263EFFA08], "set", a3);
  id v5 = [(HFItemManager *)self _directItemDependenciesForHomeKitObjects:v4 class:objc_opt_class()];
  id v6 = (void *)[v5 mutableCopy];

  return v6;
}

- (void)home:(id)a3 didReadValuesForCharacteristics:(id)a4 failedCharacteristics:(id)a5
{
  id v15 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v9)
  {
    id v9 = [MEMORY[0x263EFFA08] set];
  }
  id v11 = [v9 setByAddingObjectsFromSet:v10];
  uint64_t v12 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  uint64_t v13 = [(HFItemManager *)self _itemsToUpdateForModifiedCharacteristics:v11];
  id v14 = (id)[v12 requestUpdateForItems:v13 itemProviderInvalidationReasons:MEMORY[0x263EFFA68] modifiedHome:v15 senderSelector:a2];
}

- (id)_itemsToUpdateForModifiedCharacteristics:(id)a3
{
  return [(HFItemManager *)self _itemsToUpdateForModifiedCharacteristics:a3 includeSuppressedCharacteristics:0];
}

- (void)homeManagerDidEndBatchNotifications:(id)a3
{
  id v5 = [(HFItemManager *)self batchedDelegateAdapterAllowingReads];
  id v6 = (id)[v5 commitBatchWithReason:@"HFItemManagerBatchingDelegateReasonHomeManagerRequest" senderSelector:a2];

  id v8 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  id v7 = (id)[v8 commitBatchWithReason:@"HFItemManagerBatchingDelegateReasonHomeManagerRequest" senderSelector:a2];
}

- (HFItemManagerBatchedDelegateAdapter)batchedDelegateAdapterDisallowingReads
{
  return self->_batchedDelegateAdapterDisallowingReads;
}

- (void)homeManagerWillStartBatchNotifications:(id)a3
{
  id v4 = [(HFItemManager *)self batchedDelegateAdapterAllowingReads];
  [v4 beginBatchWithReason:@"HFItemManagerBatchingDelegateReasonHomeManagerRequest"];

  id v5 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  [v5 beginBatchWithReason:@"HFItemManagerBatchingDelegateReasonHomeManagerRequest"];
}

- (HFItemManagerBatchedDelegateAdapter)batchedDelegateAdapterAllowingReads
{
  return self->_batchedDelegateAdapterAllowingReads;
}

- (void)homeManagerDidUpdateCurrentHome:(id)a3
{
  id v5 = a3;
  if (+[HFUtilities isInternalTest]
    && ([v5 homes],
        id v6 = objc_claimAutoreleasedReturnValue(),
        uint64_t v7 = [v6 count],
        v6,
        !v7))
  {
    id v11 = HFLogForCategory(0x25uLL);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl(&dword_20B986000, v11, OS_LOG_TYPE_DEFAULT, "Skipping reload (for -homeManagerDidUpdateCurrentHome:) as this is an internal unit test -tearDown", v12, 2u);
    }
  }
  else
  {
    id v8 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
    id v9 = [(HFItemManager *)self _itemsToUpdateForCurrentHomeChange];
    id v10 = (id)[v8 requestUpdateForItems:v9 itemProviderInvalidationReasons:MEMORY[0x263EFFA68] modifiedHome:0 senderSelector:a2];
  }
}

- (id)_updateResultsForItems:(id)a3 context:(id)a4
{
  id v6 = (void *)MEMORY[0x263EFFA08];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 set];
  id v10 = [(HFItemManager *)self _updateResultsForItems:v8 removedItems:v9 context:v7 allowDelaying:1];

  return v10;
}

void __75__HFItemManager__updateResultsForItems_removedItems_context_allowDelaying___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = HFLogForCategory(0x32uLL);
  id v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 72);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_20B986000, v3, OS_SIGNPOST_INTERVAL_END, v4, "HFFutureToUpdateItems", "Starting update", buf, 2u);
  }

  id v5 = [*(id *)(a1 + 32) _updateResultsForItems:*(void *)(a1 + 40) removedItems:*(void *)(a1 + 48) context:*(void *)(a1 + 56) allowDelaying:0];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __75__HFItemManager__updateResultsForItems_removedItems_context_allowDelaying___block_invoke_312;
  v7[3] = &unk_26408F170;
  id v8 = *(id *)(a1 + 64);
  id v6 = (id)[v5 addCompletionBlock:v7];
}

- (id)_itemsToUpdateForCurrentHomeChange
{
  id v3 = [(HFItemManager *)self _allItemsIncludingInternalItems];
  os_signpost_id_t v4 = [(HFItemManager *)self _itemsWithDependenciesPassingTest:&__block_literal_global_474 forItems:v3];

  return v4;
}

- (id)_itemsToUpdateForModifiedCharacteristics:(id)a3 includeSuppressedCharacteristics:(BOOL)a4
{
  id v6 = (void *)[a3 mutableCopy];
  if (!a4)
  {
    id v7 = [(HFItemManager *)self _allSuppressedCharacteristics];
    [v6 minusSet:v7];
  }
  id v8 = [(HFItemManager *)self _directItemDependenciesForHomeKitObjects:v6 class:objc_opt_class()];
  id v9 = (void *)[v8 mutableCopy];

  return v9;
}

- (id)_directItemDependenciesForHomeKitObjects:(id)a3 class:(Class)a4
{
  id v6 = a3;
  uint64_t v11 = MEMORY[0x263EF8330];
  id v12 = v6;
  Class v13 = a4;
  id v7 = v6;
  id v8 = [(HFItemManager *)self _allItemsIncludingInternalItems];
  id v9 = [(HFItemManager *)self _itemsWithDependenciesPassingTest:&v11 forItems:v8];

  return v9;
}

- (id)_allSuppressedCharacteristics
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263EFF9C0] set];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  os_signpost_id_t v4 = [(HFItemManager *)self suppressedCharacteristicUpdatesByReason];
  id v5 = [v4 allValues];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        [v3 unionSet:*(void *)(*((void *)&v11 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  return v3;
}

- (NSMutableDictionary)suppressedCharacteristicUpdatesByReason
{
  return self->_suppressedCharacteristicUpdatesByReason;
}

id __74__HFItemManager__performUpdateForChildItemsOfItem_withContext_isInternal___block_invoke_2(uint64_t a1, void *a2)
{
  if (*(unsigned char *)(a1 + 32)) {
    uint64_t v2 = 1;
  }
  else {
    uint64_t v2 = objc_msgSend(a2, "na_any:", &__block_literal_global_369);
  }
  id v3 = (void *)MEMORY[0x263F58190];
  os_signpost_id_t v4 = [NSNumber numberWithBool:v2];
  id v5 = [v3 futureWithResult:v4];

  return v5;
}

uint64_t __127__HFItemManager__reloadItemProviders_updateItems_shouldUpdateExistingItems_senderSelector_readPolicy_fastInitialUpdatePromise___block_invoke_2_249(uint64_t a1)
{
  return [MEMORY[0x263F58190] futureWithResult:*(void *)(a1 + 32)];
}

- (id)childItemsForItem:(id)a3 ofClass:(Class)a4
{
  id v5 = [(HFItemManager *)self childItemsForItem:a3];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __43__HFItemManager_childItemsForItem_ofClass___block_invoke;
  v8[3] = &__block_descriptor_40_e16_B16__0__HFItem_8lu32l8;
  void v8[4] = a4;
  uint64_t v6 = objc_msgSend(v5, "na_filter:", v8);

  return v6;
}

uint64_t __127__HFItemManager__reloadItemProviders_updateItems_shouldUpdateExistingItems_senderSelector_readPolicy_fastInitialUpdatePromise___block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) finishWithResult:a2 error:a3];
}

uint64_t __57__HFItemManager__legacy_buildSectionsWithDisplayedItems___block_invoke()
{
  return [MEMORY[0x263EFF980] array];
}

- (void)setDelegate:(id)a3
{
}

- (void)_unregisterForExternalUpdates
{
  id v6 = +[HFHomeKitDispatcher sharedDispatcher];
  [v6 removeHomeManagerObserver:self];
  [v6 removeHomeObserver:self];
  [v6 removeAccessoryObserver:self];
  [v6 removeResidentDeviceObserver:self];
  [v6 removeCameraObserver:self];
  [(HFItemManager *)self _removeDelegateNotifications];
  [(HFItemManager *)self deregisterMatterDelegates];
  id v3 = +[HFTemperatureUnitCoordinator sharedCoordinator];
  [v3 unregisterObserver:self];

  os_signpost_id_t v4 = +[HFUserNotificationCenter sharedInstance];
  [v4 removeObserver:self];

  [v6 removeMediaSessionObserver:self];
  [v6 removeAudioControlObserver:self];
  [v6 removeMediaObjectObserver:self];
  [v6 removeHomeKitSettingsObserver:self];
  [v6 removeNetworkConfigurationObserver:self];
  [v6 removeSoftwareUpdateObserver:self];
  [v6 removeSoftwareUpdateControllerObserver:self];
  [v6 removeSymptomsHandlerObserver:self];
  [v6 removeTelevisionObserver:self];
  [v6 removeUserObserver:self];
  [v6 removeMediaDestinationControllerObserver:self];
  [v6 removeSiriEndpointProfileObserver:self];
  [v6 removeSymptomFixSessionObserver:self];
  [v6 removeHomePersonManagerObserver:self];
  [v6 removeLightObserver:self];
  [v6 removeWalletKeyDeviceStateObserver:self];
  id v5 = [(HFItemManager *)self itemModules];
  objc_msgSend(v5, "na_each:", &__block_literal_global_221);
}

- (void)_registerForExternalUpdates
{
  id v6 = +[HFHomeKitDispatcher sharedDispatcher];
  [v6 addHomeManagerObserver:self];
  [v6 addHomeObserver:self];
  [v6 addAccessoryObserver:self];
  [v6 addResidentDeviceObserver:self];
  [v6 addCameraObserver:self];
  [(HFItemManager *)self _setupDelegateNotifications];
  [(HFItemManager *)self registerMatterDelegates];
  id v3 = +[HFTemperatureUnitCoordinator sharedCoordinator];
  [v3 registerObserver:self];

  os_signpost_id_t v4 = +[HFUserNotificationCenter sharedInstance];
  [v4 addObserver:self];

  [v6 addMediaSessionObserver:self];
  [v6 addAudioControlObserver:self];
  [v6 addMediaObjectObserver:self];
  [v6 addHomeKitSettingsObserver:self];
  [v6 addNetworkConfigurationObserver:self];
  [v6 addSoftwareUpdateObserver:self];
  [v6 addSoftwareUpdateControllerObserver:self];
  [v6 addSymptomsHandlerObserver:self];
  [v6 addTelevisionObserver:self];
  [v6 addUserObserver:self];
  [v6 addMediaDestinationControllerObserver:self];
  [v6 addSiriEndpointProfileObserver:self];
  [v6 addSymptomFixSessionObserver:self];
  [v6 addHomePersonManagerObserver:self];
  [v6 addLightObserver:self];
  [v6 addWalletKeyDeviceStateObserver:self];
  id v5 = [(HFItemManager *)self itemModules];
  objc_msgSend(v5, "na_each:", &__block_literal_global_219_0);
}

- (void)_setupDelegateNotifications
{
  id v3 = +[HFExecutionEnvironment sharedInstance];
  [v3 addObserver:self];
}

- (void)_removeDelegateNotifications
{
  id v3 = +[HFExecutionEnvironment sharedInstance];
  [v3 removeObserver:self];
}

- (void)executionEnvironmentDidBecomeActive:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = HFLogForCategory(0x25uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = self;
    _os_log_impl(&dword_20B986000, v5, OS_LOG_TYPE_DEFAULT, "(%@) executionEnvironmentDidBecomeActive", (uint8_t *)&v8, 0xCu);
  }

  id v6 = [(HFItemManager *)self _itemsToUpdateWhenApplicationDidBecomeActive];
  id v7 = [(HFItemManager *)self updateResultsForItems:v6 senderSelector:a2];
}

- (id)_itemsToUpdateWhenApplicationDidBecomeActive
{
  return (id)[MEMORY[0x263EFFA08] set];
}

void __127__HFItemManager__reloadItemProviders_updateItems_shouldUpdateExistingItems_senderSelector_readPolicy_fastInitialUpdatePromise___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  os_signpost_id_t v4 = [MEMORY[0x263F581B8] mainThreadScheduler];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  void v9[2] = __127__HFItemManager__reloadItemProviders_updateItems_shouldUpdateExistingItems_senderSelector_readPolicy_fastInitialUpdatePromise___block_invoke_5;
  v9[3] = &unk_264095848;
  uint64_t v17 = *(void *)(a1 + 80);
  id v10 = *(id *)(a1 + 32);
  id v11 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 56);
  id v7 = *(void **)(a1 + 64);
  id v12 = v5;
  uint64_t v13 = v6;
  id v14 = v7;
  id v15 = *(id *)(a1 + 72);
  id v16 = v3;
  id v8 = v3;
  [v4 performBlock:v9];
}

BOOL __74__HFItemManager__performUpdateForChildItemsOfItem_withContext_isInternal___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  id v3 = v2;
  if (objc_opt_isKindOfClass()) {
    os_signpost_id_t v4 = v3;
  }
  else {
    os_signpost_id_t v4 = 0;
  }
  id v5 = v4;

  if (v5) {
    BOOL v6 = [v5 outcomeType] == 2;
  }
  else {
    BOOL v6 = 0;
  }

  return v6;
}

- (HFItemManager)initWithDelegate:(id)a3
{
  return [(HFItemManager *)self initWithDelegate:a3 sourceItem:0];
}

- (void)_updateRepresentationWithCustomDiffableDataSourceForExternalItemsWithUpdatedOrAddedItems:(id)a3 removedItems:(id)a4 logger:(id)a5
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a5;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  id v9 = [(HFItemManager *)self allItems];
  if ([v9 count])
  {
    id v10 = [(HFItemManager *)self _itemsToHideInSet:v9];
    uint64_t v11 = objc_msgSend(v9, "na_setByRemovingObjectsFromSet:", v10);

    id v9 = (void *)v11;
  }
  id v12 = [(HFItemManager *)self sections];

  uint64_t v13 = [(HFItemManager *)self sections];
  id v14 = (void *)[v13 copy];
  id v15 = v14;
  if (v14)
  {
    id v16 = v14;
  }
  else
  {
    uint64_t v17 = [MEMORY[0x263EFFA08] set];
    id v16 = [(HFItemManager *)self _buildSectionsWithDisplayedItems:v17];
  }
  __int16 v18 = [(HFItemManager *)self _buildSectionsWithDisplayedItems:v9];
  v47[0] = MEMORY[0x263EF8330];
  v47[1] = 3221225472;
  v47[2] = __126__HFItemManager__updateRepresentationWithCustomDiffableDataSourceForExternalItemsWithUpdatedOrAddedItems_removedItems_logger___block_invoke;
  v47[3] = &unk_264095DB8;
  id v39 = v7;
  long long v40 = v16;
  id v48 = v39;
  uint64_t v19 = +[HFGroupedItemDiff diffFromGroups:v16 toGroups:v18 changeTest:v47];
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __126__HFItemManager__updateRepresentationWithCustomDiffableDataSourceForExternalItemsWithUpdatedOrAddedItems_removedItems_logger___block_invoke_2;
  aBlock[3] = &unk_26408D450;
  void aBlock[4] = self;
  id v20 = v18;
  id v46 = v20;
  id v21 = (void (**)(void))_Block_copy(aBlock);
  v42[0] = MEMORY[0x263EF8330];
  v42[1] = 3221225472;
  v42[2] = __126__HFItemManager__updateRepresentationWithCustomDiffableDataSourceForExternalItemsWithUpdatedOrAddedItems_removedItems_logger___block_invoke_3;
  v42[3] = &unk_26408D388;
  v42[4] = self;
  id v22 = v19;
  id v43 = v22;
  id v23 = v8;
  id v44 = v23;
  uint64_t v24 = _Block_copy(v42);
  long long v25 = [v22 allOperations];
  uint64_t v26 = [v25 count];

  if (v26)
  {
    if (v23)
    {
      state.opaque[0] = 0;
      state.opaque[1] = 0;
      long long v27 = [v23 loggerActivity];
      os_activity_scope_enter(v27, &state);

      long long v28 = HFLogForCategory(0x2AuLL);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        id v50 = self;
        __int16 v51 = 2112;
        id v52 = v22;
        __int16 v53 = 1024;
        BOOL v54 = v12 == 0;
        _os_log_impl(&dword_20B986000, v28, OS_LOG_TYPE_DEFAULT, "%@ processing item diff %@ (initial update: %d)", buf, 0x1Cu);
      }

      os_activity_scope_leave(&state);
    }
    else
    {
      id v37 = HFLogForCategory(0x2AuLL);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        id v50 = self;
        __int16 v51 = 2112;
        id v52 = v22;
        __int16 v53 = 1024;
        BOOL v54 = v12 == 0;
        _os_log_impl(&dword_20B986000, v37, OS_LOG_TYPE_DEFAULT, "%@ processing item diff %@ (initial update: %d)", buf, 0x1Cu);
      }
    }
    long long v29 = [[HFItemManagerDelegateUpdateRequest alloc] initWithChanges:v22 isInitialUpdate:v12 == 0 applyChangesBlock:v21 issueDelegateMessagesBlock:v24];
    long long v30 = [(HFItemManager *)self delegate];
    char v31 = objc_opt_respondsToSelector();

    if (v31)
    {
      long long v32 = [(HFItemManager *)self delegate];
      [v32 itemManager:self performUpdateRequest:v29];

      if (![(HFItemManagerDelegateUpdateRequest *)v29 debug_wasPerformed])
      {
        long long v33 = [(HFItemManager *)self delegate];
        NSLog(&cfstr_TheHfitemmanag.isa, self, v33);
      }
    }
    else
    {
      [(HFItemManagerDelegateUpdateRequest *)v29 performWithOptions:0];
    }

    char v36 = v39;
  }
  else
  {
    if (v23)
    {
      state.opaque[0] = 0;
      state.opaque[1] = 0;
      id v34 = [v23 loggerActivity];
      os_activity_scope_enter(v34, &state);

      uint64_t v35 = HFLogForCategory(0x2AuLL);
      char v36 = v39;
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v50 = self;
        __int16 v51 = 1024;
        LODWORD(v52) = v12 == 0;
        _os_log_impl(&dword_20B986000, v35, OS_LOG_TYPE_DEFAULT, "%@ processed item diff, but there are no changes (initial update: %d)", buf, 0x12u);
      }

      os_activity_scope_leave(&state);
    }
    else
    {
      long long v38 = HFLogForCategory(0x2AuLL);
      char v36 = v39;
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v50 = self;
        __int16 v51 = 1024;
        LODWORD(v52) = v12 == 0;
        _os_log_impl(&dword_20B986000, v38, OS_LOG_TYPE_DEFAULT, "%@ processed item diff, but there are no changes (initial update: %d)", buf, 0x12u);
      }
    }
    v21[2](v21);
  }
  [(HFItemManager *)self _updateOverallLoadingStateAndNotifyDelegate];
}

- (NSArray)sections
{
  return self->_sections;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  BOOL v6 = [(HFItemManager *)self itemModules];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  void v13[2] = __50__HFItemManager__buildSectionsWithDisplayedItems___block_invoke;
  v13[3] = &unk_264095A60;
  id v7 = v4;
  id v14 = v7;
  id v8 = objc_msgSend(v6, "na_flatMap:", v13);
  [v5 addObjectsFromArray:v8];

  if (![(HFItemManager *)self _isUsingOnlyItemModules])
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __50__HFItemManager__buildSectionsWithDisplayedItems___block_invoke_2;
    v12[3] = &unk_26408EC60;
    v12[4] = self;
    id v9 = objc_msgSend(v7, "na_filter:", v12);
    id v10 = [(HFItemManager *)self _legacy_buildSectionsWithDisplayedItems:v9];
    [v5 addObjectsFromArray:v10];
  }
  return v5;
}

- (unint64_t)_numberOfSections
{
  return [(HFItemManager *)self _isUsingOnlyItemModules] ^ 1;
}

- (BOOL)_isUsingOnlyItemModules
{
  id v3 = [(HFItemManager *)self subclassItemProviderSet];
  if ([v3 count])
  {
    BOOL v4 = 0;
  }
  else
  {
    id v5 = [(HFItemManager *)self moduleItemProviderSet];
    BOOL v4 = v5 != 0;
  }
  return v4;
}

- (id)_legacy_buildSectionsWithDisplayedItems:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(HFItemManager *)self _willUpdateSections];
  id v5 = [(HFItemManager *)self currentSectionIdentifiersSnapshot];
  uint64_t v6 = [v5 count];
  if (!v6) {
    uint64_t v6 = [(HFItemManager *)self _numberOfSections];
  }
  id v7 = [MEMORY[0x263EFF980] arrayWithCapacity:v6];
  if (v6)
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      if (v5) {
        [v5 objectAtIndexedSubscript:i];
      }
      else {
      id v9 = [(HFItemManager *)self _identifierForSection:i];
      }
      id v10 = [(HFItemSection *)[HFMutableItemSection alloc] initWithIdentifier:v9];
      uint64_t v11 = [(HFItemManager *)self _titleForSectionWithIdentifier:v9];
      [(HFItemSection *)v10 setHeaderTitle:v11];

      id v12 = [(HFItemManager *)self _footerTitleForSectionWithIdentifier:v9];
      [(HFItemSection *)v10 setFooterTitle:v12];

      [v7 addObject:v10];
    }
  }
  uint64_t v26 = v5;
  uint64_t v13 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", v7);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v14 = v4;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v31;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v31 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void *)(*((void *)&v30 + 1) + 8 * j);
        id v20 = [(HFItemManager *)self _sectionIdentifierForItem:v19];
        id v21 = objc_msgSend(v13, "na_objectForKey:withDefaultValue:", v20, &__block_literal_global_385);
        [v21 addObject:v19];
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v16);
  }

  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __57__HFItemManager__legacy_buildSectionsWithDisplayedItems___block_invoke_2;
  v27[3] = &unk_264095AF8;
  id v22 = v25;
  id v28 = v22;
  long long v29 = self;
  [v13 enumerateKeysAndObjectsUsingBlock:v27];
  id v23 = v22;

  return v23;
}

- (id)_identifierForSection:(unint64_t)a3
{
  return (id)[NSString stringWithFormat:@"%@-%lu", @"HFItemManagerDefaultSectionIdentifier", a3];
}

- (id)currentSectionIdentifiersSnapshot
{
  return 0;
}

- (id)_titleForSectionWithIdentifier:(id)a3
{
  return 0;
}

- (id)_footerTitleForSectionWithIdentifier:(id)a3
{
  return 0;
}

- (id)_sectionIdentifierForItem:(id)a3
{
  return [(HFItemManager *)self _identifierForSection:0];
}

uint64_t __126__HFItemManager__updateRepresentationWithCustomDiffableDataSourceForExternalItemsWithUpdatedOrAddedItems_removedItems_logger___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _notifyDelegateOfChangesFromDiff:*(void *)(a1 + 40) logger:*(void *)(a1 + 48)];
}

void __126__HFItemManager__updateRepresentationWithCustomDiffableDataSourceForExternalItemsWithUpdatedOrAddedItems_removedItems_logger___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setSections:*(void *)(a1 + 40)];
  objc_opt_class();
  id v2 = [*(id *)(a1 + 32) diffableDataSource];
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  [v4 setSections:*(void *)(a1 + 40)];
}

- (void)setSections:(id)a3
{
}

- (void)_notifyDelegateOfChangesFromDiff:(id)a3 logger:(id)a4
{
  id v10 = a3;
  uint64_t v6 = (HFUpdateLogger *)a4;
  id v7 = v6;
  if (!v6) {
    id v7 = [[HFUpdateLogger alloc] initWithTimeout:@"HFItemManager diff update" description:1.0];
  }
  id v8 = [v10 groupOperations];
  [(HFItemManager *)self _notifyDelegateOfSectionOperations:v8 logger:v7];

  id v9 = [v10 itemOperations];
  [(HFItemManager *)self _notifyDelegateOfItemOperations:v9 logger:v7];

  if (!v6) {
    [(HFUpdateLogger *)v7 finish];
  }
}

- (void)_notifyDelegateOfSectionOperations:(id)a3 logger:(id)a4
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  uint64_t v8 = [v6 countByEnumeratingWithState:&v42 objects:v49 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v43;
    uint64_t v11 = &dword_20B986000;
    id v41 = v7;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v43 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v13 = *(void **)(*((void *)&v42 + 1) + 8 * v12);
        if (v7)
        {
          state.opaque[0] = 0;
          state.opaque[1] = 0;
          id v14 = [v7 loggerActivity];
          os_activity_scope_enter(v14, &state);

          uint64_t v15 = HFLogForCategory(0x2AuLL);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v16 = [v13 operationDescription];
            *(_DWORD *)buf = 138412290;
            id v47 = v16;
            _os_log_impl(v11, v15, OS_LOG_TYPE_DEFAULT, "Issuing section update: %@", buf, 0xCu);
          }
          os_activity_scope_leave(&state);
        }
        else
        {
          long long v38 = HFLogForCategory(0x2AuLL);
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
          {
            id v39 = [v13 operationDescription];
            LODWORD(state.opaque[0]) = 138412290;
            *(uint64_t *)((char *)state.opaque + 4) = (uint64_t)v39;
            _os_log_impl(v11, v38, OS_LOG_TYPE_DEFAULT, "Issuing section update: %@", (uint8_t *)&state, 0xCu);
          }
        }
        switch(objc_msgSend(v13, "type", v41))
        {
          case 0:
            NSLog(&cfstr_SectionReloads.isa);
            break;
          case 1:
            id v23 = [(HFItemManager *)self delegate];
            char v24 = objc_opt_respondsToSelector();

            if (v24)
            {
              long long v25 = (void *)MEMORY[0x263F088D0];
              uint64_t v26 = [v13 toIndex];
              id v21 = objc_msgSend(v25, "indexSetWithIndex:", objc_msgSend(v26, "unsignedIntegerValue"));

              id v22 = [(HFItemManager *)self delegate];
              [v22 itemManager:self didInsertSections:v21];
              goto LABEL_16;
            }
            break;
          case 2:
            uint64_t v17 = [(HFItemManager *)self delegate];
            char v18 = objc_opt_respondsToSelector();

            if (v18)
            {
              uint64_t v19 = (void *)MEMORY[0x263F088D0];
              id v20 = [v13 fromIndex];
              id v21 = objc_msgSend(v19, "indexSetWithIndex:", objc_msgSend(v20, "unsignedIntegerValue"));

              id v22 = [(HFItemManager *)self delegate];
              [v22 itemManager:self didRemoveSections:v21];
LABEL_16:

              goto LABEL_19;
            }
            break;
          case 3:
            long long v27 = [(HFItemManager *)self delegate];
            char v28 = objc_opt_respondsToSelector();

            if (v28)
            {
              id v21 = [(HFItemManager *)self delegate];
              long long v29 = [v13 fromIndex];
              uint64_t v30 = v9;
              uint64_t v31 = v10;
              id v32 = v6;
              long long v33 = v11;
              uint64_t v34 = [v29 integerValue];
              uint64_t v35 = [v13 toIndex];
              uint64_t v36 = [v35 integerValue];
              uint64_t v37 = v34;
              uint64_t v11 = v33;
              id v6 = v32;
              uint64_t v10 = v31;
              uint64_t v9 = v30;
              id v7 = v41;
              [v21 itemManager:self didMoveSection:v37 toSection:v36];

LABEL_19:
            }
            break;
          default:
            break;
        }
        ++v12;
      }
      while (v9 != v12);
      uint64_t v40 = [v6 countByEnumeratingWithState:&v42 objects:v49 count:16];
      uint64_t v9 = v40;
    }
    while (v40);
  }
}

uint64_t __126__HFItemManager__updateRepresentationWithCustomDiffableDataSourceForExternalItemsWithUpdatedOrAddedItems_removedItems_logger___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:");
}

- (void)_prefetchResourcesIfNeededForItems:(id)a3
{
  id v4 = a3;
  id v5 = [(HFItemManager *)self allItems];
  id v10 = [v5 setByAddingObjectsFromSet:v4];

  if ([v10 count])
  {
    id v6 = [(HFItemManager *)self _itemsToHideInSet:v10];
    uint64_t v7 = objc_msgSend(v10, "hmf_removedObjectsFromSet:", v6);

    uint64_t v8 = [(HFItemManager *)self diffableDataItemManagerDelegate];
    [v8 diffableDataItemManager:self prefetchResourcesForItems:v7];

    uint64_t v9 = (void *)v7;
  }
  else
  {
    uint64_t v9 = v10;
  }
}

void __35__HFItemManager__itemsToHideInSet___block_invoke_4(uint64_t a1, void *a2)
{
  id v10 = a2;
  if ([v10 conformsToProtocol:&unk_26C1827A0]) {
    id v3 = v10;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 allItems];
    uint64_t v7 = objc_msgSend(v6, "na_setByIntersectingWithSet:", *(void *)(a1 + 32));

    uint64_t v8 = *(void **)(a1 + 40);
    uint64_t v9 = [v5 _itemsToHideInSet:v7];
    [v8 unionSet:v9];
  }
}

id __127__HFItemManager__reloadItemProviders_updateItems_shouldUpdateExistingItems_senderSelector_readPolicy_fastInitialUpdatePromise___block_invoke_248(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = [WeakRetained latestSnapshotGenerationFuture];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  void v9[2] = __127__HFItemManager__reloadItemProviders_updateItems_shouldUpdateExistingItems_senderSelector_readPolicy_fastInitialUpdatePromise___block_invoke_2_249;
  v9[3] = &unk_26408CDC8;
  id v10 = v3;
  id v6 = v3;
  uint64_t v7 = [v5 flatMap:v9];

  return v7;
}

- (NAFuture)latestSnapshotGenerationFuture
{
  return self->_latestSnapshotGenerationFuture;
}

BOOL __127__HFItemManager__reloadItemProviders_updateItems_shouldUpdateExistingItems_senderSelector_readPolicy_fastInitialUpdatePromise___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = [a2 latestResults];
  BOOL v3 = v2 == 0;

  return v3;
}

id __70__HFItemManager__performUpdateForItem_withContext_isInternal_isChild___block_invoke_353(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if ((objc_msgSend(v3, "na_isCancelledError") & 1) == 0)
  {
    id v4 = [*(id *)(a1 + 32) logger];

    if (v4)
    {
      state.opaque[0] = 0;
      state.opaque[1] = 0;
      id v5 = [*(id *)(a1 + 32) logger];
      id v6 = [v5 loggerActivity];
      os_activity_scope_enter(v6, &state);

      uint64_t v7 = HFLogForCategory(0x2AuLL);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        uint64_t v8 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138412546;
        uint64_t v22 = v8;
        __int16 v23 = 2112;
        id v24 = v3;
        _os_log_impl(&dword_20B986000, v7, OS_LOG_TYPE_ERROR, "Update for item %@ failed with error %@. This is a programmer error, as item updates should never fail.", buf, 0x16u);
      }

      os_activity_scope_leave(&state);
    }
    else
    {
      char v18 = HFLogForCategory(0x2AuLL);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        uint64_t v19 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138412546;
        uint64_t v22 = v19;
        __int16 v23 = 2112;
        id v24 = v3;
        _os_log_impl(&dword_20B986000, v18, OS_LOG_TYPE_ERROR, "Update for item %@ failed with error %@. This is a programmer error, as item updates should never fail.", buf, 0x16u);
      }
    }
    NSLog(&cfstr_UpdateForItemF.isa, *(void *)(a1 + 40), v3);
  }
  uint64_t v9 = [*(id *)(a1 + 40) latestResults];
  if (v9)
  {
    id v10 = (void *)v9;
    uint64_t v11 = [*(id *)(a1 + 40) latestResults];
    char v12 = [v11 isEqualToDictionary:*(void *)(a1 + 48)];

    if ((v12 & 1) == 0)
    {
      uint64_t v13 = *(void **)(a1 + 40);
      uint64_t v14 = *(void *)(a1 + 48);
      uint64_t v15 = [v13 latestResults];
      NSLog(&cfstr_AnItemSUpdateW.isa, v13, v14, v15);
    }
  }
  uint64_t v16 = [MEMORY[0x263F58190] futureWithError:v3];

  return v16;
}

uint64_t __57__HFItemManager__legacy_buildSectionsWithDisplayedItems___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = [a2 identifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

void __57__HFItemManager__legacy_buildSectionsWithDisplayedItems___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = *(void **)(a1 + 32);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __57__HFItemManager__legacy_buildSectionsWithDisplayedItems___block_invoke_3;
  v11[3] = &unk_264095AD0;
  id v12 = v5;
  id v7 = v5;
  id v8 = a3;
  uint64_t v9 = objc_msgSend(v6, "na_firstObjectPassingTest:", v11);
  id v10 = [*(id *)(a1 + 40) _sortedItems:v8 forSectionIdentifier:v7];

  [v9 setItems:v10];
}

- (id)_sortedItems:(id)a3 forSectionIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = [(HFItemManager *)self _comparatorForSectionIdentifier:a4];
  id v8 = [v6 sortedArrayUsingComparator:v7];

  return v8;
}

- (BOOL)endDisableExternalUpdatesWithReason:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = HFLogForCategory(0x2AuLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(HFItemManager *)self disableUpdateReasons];
    id v7 = [(HFItemManager *)self disableUpdateReasons];
    int v21 = 138413058;
    uint64_t v22 = self;
    __int16 v23 = 2112;
    id v24 = v4;
    __int16 v25 = 2048;
    uint64_t v26 = v6;
    __int16 v27 = 2112;
    char v28 = v7;
    _os_log_impl(&dword_20B986000, v5, OS_LOG_TYPE_DEFAULT, "%@:(DU-R1) Removing reason (%@) to disable updates - all reasons BEFORE (%p): %@", (uint8_t *)&v21, 0x2Au);
  }
  id v8 = [(HFItemManager *)self disableUpdateReasons];
  char v9 = [v8 containsObject:v4];

  if ((v9 & 1) == 0)
  {
    uint64_t v17 = HFLogForCategory(0x2AuLL);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      char v18 = [(HFItemManager *)self disableUpdateReasons];
      uint64_t v19 = [(HFItemManager *)self disableUpdateReasons];
      int v21 = 138413058;
      uint64_t v22 = self;
      __int16 v23 = 2112;
      id v24 = v4;
      __int16 v25 = 2048;
      uint64_t v26 = v18;
      __int16 v27 = 2112;
      char v28 = v19;
      _os_log_impl(&dword_20B986000, v17, OS_LOG_TYPE_DEFAULT, "%@:(DU-R1.1) Removing reason (%@) to disable updates NOT FOUND in all reasons BEFORE (%p): %@. Are multiple items being removed? Is a bridge being removed?", (uint8_t *)&v21, 0x2Au);
    }
    goto LABEL_11;
  }
  id v10 = [(HFItemManager *)self disableUpdateReasons];
  [v10 removeObject:v4];

  uint64_t v11 = HFLogForCategory(0x2AuLL);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = [(HFItemManager *)self disableUpdateReasons];
    uint64_t v13 = [(HFItemManager *)self disableUpdateReasons];
    int v21 = 138412802;
    uint64_t v22 = self;
    __int16 v23 = 2048;
    id v24 = v12;
    __int16 v25 = 2112;
    uint64_t v26 = v13;
    _os_log_impl(&dword_20B986000, v11, OS_LOG_TYPE_DEFAULT, "%@:(DU-R2) Removed reason to disable updates - all reasons AFTER (%p): %@", (uint8_t *)&v21, 0x20u);
  }
  uint64_t v14 = [(HFItemManager *)self disableUpdateReasons];
  uint64_t v15 = [v14 count];

  if (v15)
  {
LABEL_11:
    BOOL v16 = 0;
    goto LABEL_12;
  }
  BOOL v16 = 1;
  [(HFItemManager *)self _updateExternalUpdatesEnabled:1 reloadItems:1];
LABEL_12:

  return v16;
}

- (BOOL)disableExternalUpdatesWithReason:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = HFLogForCategory(0x2AuLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(HFItemManager *)self disableUpdateReasons];
    id v7 = [(HFItemManager *)self disableUpdateReasons];
    int v18 = 138413058;
    uint64_t v19 = self;
    __int16 v20 = 2112;
    id v21 = v4;
    __int16 v22 = 2048;
    __int16 v23 = v6;
    __int16 v24 = 2112;
    __int16 v25 = v7;
    _os_log_impl(&dword_20B986000, v5, OS_LOG_TYPE_DEFAULT, "%@:(DU-D1) Adding reason (%@) to disable updates - all reasons BEFORE (%p): %@", (uint8_t *)&v18, 0x2Au);
  }
  id v8 = [(HFItemManager *)self disableUpdateReasons];
  int v9 = [v8 containsObject:v4];

  if (v9)
  {
    id v10 = HFLogForCategory(0x2AuLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138412546;
      uint64_t v19 = self;
      __int16 v20 = 2112;
      id v21 = v4;
      _os_log_impl(&dword_20B986000, v10, OS_LOG_TYPE_DEFAULT, "%@:(DU-D1.1) Duplicate request to disable updates for reason \"%@\"", (uint8_t *)&v18, 0x16u);
    }
    BOOL v11 = 0;
  }
  else
  {
    id v12 = [(HFItemManager *)self disableUpdateReasons];
    uint64_t v13 = [v12 count];
    BOOL v11 = v13 == 0;

    if (!v13) {
      [(HFItemManager *)self _updateExternalUpdatesEnabled:0 reloadItems:1];
    }
    uint64_t v14 = [(HFItemManager *)self disableUpdateReasons];
    [v14 addObject:v4];

    id v10 = HFLogForCategory(0x2AuLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = [(HFItemManager *)self disableUpdateReasons];
      BOOL v16 = [(HFItemManager *)self disableUpdateReasons];
      int v18 = 138412802;
      uint64_t v19 = self;
      __int16 v20 = 2048;
      id v21 = v15;
      __int16 v22 = 2112;
      __int16 v23 = v16;
      _os_log_impl(&dword_20B986000, v10, OS_LOG_TYPE_DEFAULT, "%@:(DU-D2) Added reason to disable updates - all reasons AFTER (%p): %@", (uint8_t *)&v18, 0x20u);
    }
  }

  return v11;
}

- (NSMutableSet)disableUpdateReasons
{
  return self->_disableUpdateReasons;
}

- (HFItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v50.receiver = self;
  v50.super_class = (Class)HFItemManager;
  id v8 = [(HFItemManager *)&v50 init];
  int v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    objc_storeStrong((id *)&v9->_sourceItem, a4);
    itemModules = v9->_itemModules;
    BOOL v11 = (NSArray *)MEMORY[0x263EFFA68];
    v9->_itemModules = (NSArray *)MEMORY[0x263EFFA68];

    itemProviders = v9->_itemProviders;
    v9->_itemProviders = v11;

    identifier = v9->_identifier;
    v9->_identifier = (NSString *)@"--";

    v9->_BOOL diffableDataSourceDisabled = _os_feature_enabled_impl() ^ 1;
    uint64_t v14 = [MEMORY[0x263F08968] mapTableWithKeyOptions:512 valueOptions:0];
    childItemsByParentItem = v9->_childItemsByParentItem;
    v9->_childItemsByParentItem = (NSMapTable *)v14;

    BOOL v16 = objc_alloc_init(HFStandardReadPolicy);
    readPolicy = v9->_readPolicy;
    v9->_readPolicy = (HFCharacteristicReadPolicy *)v16;

    uint64_t v18 = [MEMORY[0x263EFF9C0] set];
    disableUpdateReasons = v9->_disableUpdateReasons;
    v9->_disableUpdateReasons = (NSMutableSet *)v18;

    uint64_t v20 = [MEMORY[0x263EFF9A0] dictionary];
    suppressedCharacteristicUpdatesByReason = v9->_suppressedCharacteristicUpdatesByReason;
    v9->_suppressedCharacteristicUpdatesByReason = (NSMutableDictionary *)v20;

    __int16 v22 = (NAFuture *)objc_alloc_init(MEMORY[0x263F58190]);
    firstFastUpdateFuture = v9->_firstFastUpdateFuture;
    v9->_firstFastUpdateFuture = v22;

    __int16 v24 = (NAFuture *)objc_alloc_init(MEMORY[0x263F58190]);
    firstFullUpdateFuture = v9->_firstFullUpdateFuture;
    v9->_firstFullUpdateFuture = v24;

    uint64_t v26 = (NAFuture *)objc_alloc_init(MEMORY[0x263F58190]);
    UIDiffableDataInitializationFuture = v9->_UIDiffableDataInitializationFuture;
    v9->_UIDiffableDataInitializationFuture = v26;

    uint64_t v28 = [MEMORY[0x263F58190] futureWithNoResult];
    latestSnapshotGenerationFuture = v9->_latestSnapshotGenerationFuture;
    v9->_latestSnapshotGenerationFuture = (NAFuture *)v28;

    uint64_t v30 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v31 = dispatch_queue_create("com.apple.Home.DiffableDataSourceItemManager", v30);
    diffableDataSourceQueue = v9->_diffableDataSourceQueue;
    v9->_diffableDataSourceQueue = (OS_dispatch_queue *)v31;

    uint64_t v33 = [MEMORY[0x263F581B8] schedulerWithDispatchQueue:v9->_diffableDataSourceQueue];
    diffableDataSourceScheduler = v9->_diffableDataSourceScheduler;
    v9->_diffableDataSourceScheduler = (NAScheduler *)v33;

    uint64_t v35 = [HFItemManagerBatchedDelegateAdapter alloc];
    uint64_t v36 = [(HFItemManager *)v9 readPolicy];
    uint64_t v37 = [(HFItemManagerBatchedDelegateAdapter *)v35 initWithItemManager:v9 readPolicy:v36];
    batchedDelegateAdapterAllowingReads = v9->_batchedDelegateAdapterAllowingReads;
    v9->_batchedDelegateAdapterAllowingReads = (HFItemManagerBatchedDelegateAdapter *)v37;

    id v39 = [HFItemManagerBatchedDelegateAdapter alloc];
    uint64_t v40 = +[HFStaticReadPolicy policyWithDecision:0];
    uint64_t v41 = [(HFItemManagerBatchedDelegateAdapter *)v39 initWithItemManager:v9 readPolicy:v40];
    batchedDelegateAdapterDisallowingReads = v9->_batchedDelegateAdapterDisallowingReads;
    v9->_batchedDelegateAdapterDisallowingReads = (HFItemManagerBatchedDelegateAdapter *)v41;

    [(HFItemManager *)v9 _updateExternalUpdatesEnabled:1 reloadItems:0];
    objc_initWeak(&location, v9);
    uint64_t v44 = MEMORY[0x263EF8330];
    uint64_t v45 = 3221225472;
    id v46 = __45__HFItemManager_initWithDelegate_sourceItem___block_invoke;
    id v47 = &unk_26408E550;
    objc_copyWeak(&v48, &location);
    dispatch_async(MEMORY[0x263EF83A0], &v44);
    [(HFItemManager *)v9 _debug_registerForStateDump];
    objc_destroyWeak(&v48);
    objc_destroyWeak(&location);
  }

  return v9;
}

- (void)_updateExternalUpdatesEnabled:(BOOL)a3 reloadItems:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v20 = *MEMORY[0x263EF8340];
  if (a3 && a4)
  {
    id v8 = [(HFItemManager *)self UIDiffableDataInitializationFuture];
    char v9 = [v8 isFinished];

    if ((v9 & 1) == 0)
    {
      objc_initWeak((id *)location, self);
      id v10 = [(HFItemManager *)self UIDiffableDataInitializationFuture];
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __59__HFItemManager__updateExternalUpdatesEnabled_reloadItems___block_invoke;
      v15[3] = &unk_264095D90;
      objc_copyWeak(&v16, (id *)location);
      id v11 = (id)[v10 addCompletionBlock:v15];

      objc_destroyWeak(&v16);
      objc_destroyWeak((id *)location);
    }
  }
  id v12 = HFLogForCategory(0x2AuLL);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = "Disabling";
    if (v5) {
      uint64_t v13 = "Enabling";
    }
    *(_DWORD *)id location = 138412546;
    *(void *)&location[4] = self;
    __int16 v18 = 2080;
    uint64_t v19 = v13;
    _os_log_impl(&dword_20B986000, v12, OS_LOG_TYPE_DEFAULT, "%@: %s updates", location, 0x16u);
  }

  if (v5)
  {
    [(HFItemManager *)self _registerForExternalUpdates];
    if (v4) {
      id v14 = [(HFItemManager *)self reloadAndUpdateAllItemsFromSenderSelector:a2];
    }
  }
  else
  {
    [(HFItemManager *)self _unregisterForExternalUpdates];
  }
}

- (NAFuture)UIDiffableDataInitializationFuture
{
  return self->_UIDiffableDataInitializationFuture;
}

- (void)_debug_registerForStateDump
{
  id v3 = +[_HFItemManagerDebugStateDumpController sharedInstance];
  [v3 registerItemManager:self];
}

- (id)reloadAndUpdateAllItemsFromSenderSelector:(SEL)a3
{
  location[3] = *(id *)MEMORY[0x263EF8340];
  if ([(HFItemManager *)self hasRequestedFirstUpdate]
    && ([(HFItemManager *)self firstFastUpdateFuture],
        BOOL v5 = objc_claimAutoreleasedReturnValue(),
        char v6 = [v5 isFinished],
        v5,
        (v6 & 1) == 0))
  {
    id v10 = HFLogForCategory(0x2AuLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = self;
      _os_log_impl(&dword_20B986000, v10, OS_LOG_TYPE_DEFAULT, "Request to reloadAndUpdateAllItems for %@, but we're still performing the fast initial update. Once that is done, we'll reload all items anyway, so ignoring this duplicate request", (uint8_t *)location, 0xCu);
    }

    char v9 = [(HFItemManager *)self firstFullUpdateFuture];
  }
  else
  {
    objc_initWeak(location, self);
    id v7 = [(HFItemManager *)self _homeFuture];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __59__HFItemManager_reloadAndUpdateAllItemsFromSenderSelector___block_invoke;
    v14[3] = &unk_2640957D8;
    objc_copyWeak(v15, location);
    v15[1] = (id)a3;
    id v8 = [v7 flatMap:v14];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __59__HFItemManager_reloadAndUpdateAllItemsFromSenderSelector___block_invoke_2;
    v12[3] = &unk_26408F4B8;
    objc_copyWeak(&v13, location);
    char v9 = [v8 recover:v12];
    objc_destroyWeak(&v13);

    objc_destroyWeak(v15);
    objc_destroyWeak(location);
  }
  return v9;
}

void __45__HFItemManager_initWithDelegate_sourceItem___block_invoke(uint64_t a1)
{
  uint64_t v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = [WeakRetained _homeFuture];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __45__HFItemManager_initWithDelegate_sourceItem___block_invoke_2;
  v5[3] = &unk_264095720;
  objc_copyWeak(&v6, v1);
  id v4 = (id)[v3 addSuccessBlock:v5];

  objc_destroyWeak(&v6);
}

- (id)_homeFuture
{
  id v2 = +[HFHomeKitDispatcher sharedDispatcher];
  id v3 = [v2 homeFuture];

  return v3;
}

- (id)performItemUpdateRequest:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 itemsProvidersToReload];
  id v6 = [v5 allObjects];
  id v7 = [v4 itemsToUpdate];
  uint64_t v8 = [v4 senderSelector];

  char v9 = [(HFItemManager *)self _reloadAndUpdateItemsForProviders:v6 updateItems:v7 senderSelector:v8];

  return v9;
}

- (id)_reloadAndUpdateItemsForProviders:(id)a3 updateItems:(id)a4 senderSelector:(SEL)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [(HFItemManager *)self readPolicy];
  id v11 = [(HFItemManager *)self _reloadItemProviders:v9 updateItems:v8 shouldUpdateExistingItems:1 senderSelector:a5 readPolicy:v10];

  return v11;
}

- (id)_reloadItemProviders:(id)a3 updateItems:(id)a4 shouldUpdateExistingItems:(BOOL)a5 senderSelector:(SEL)a6 readPolicy:(id)a7
{
  BOOL v8 = a5;
  id v12 = a7;
  id v13 = a4;
  id v14 = a3;
  uint64_t v15 = objc_opt_new();
  id v16 = [(HFItemManager *)self _reloadItemProviders:v14 updateItems:v13 shouldUpdateExistingItems:v8 senderSelector:a6 readPolicy:v12 fastInitialUpdatePromise:v15];

  return v16;
}

id __59__HFItemManager_reloadAndUpdateAllItemsFromSenderSelector___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  BOOL v5 = [WeakRetained lastUpdatedHome];
  char v6 = [v3 isEqual:v5];

  if (v6)
  {
    id v7 = [WeakRetained home];
    char v8 = [v3 isEqual:v7];

    if ((v8 & 1) == 0) {
      [WeakRetained setHome:v3];
    }
  }
  else
  {
    id v9 = [WeakRetained lastUpdatedHome];

    if (v9)
    {
      [WeakRetained setHome:0];
      id v10 = [MEMORY[0x263EFFA08] set];
      id v11 = [MEMORY[0x263EFFA08] set];
      [WeakRetained _updateRepresentationForExternalItemsWithUpdatedOrAddedItems:v10 removedItems:v11 logger:0];
    }
    [WeakRetained setHome:v3];
    [WeakRetained setLastUpdatedHome:v3];
  }
  id v12 = [WeakRetained _reloadAllItemProvidersFromSenderSelector:*(void *)(a1 + 40)];

  return v12;
}

- (HMHome)lastUpdatedHome
{
  return self->_lastUpdatedHome;
}

void __45__HFItemManager_initWithDelegate_sourceItem___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained setHome:v3];
}

- (void)setHome:(id)a3
{
  BOOL v5 = (HMHome *)a3;
  p_home = &self->_home;
  if (self->_home != v5)
  {
    id v10 = v5;
    objc_storeStrong((id *)p_home, a3);
    id v7 = [(HFItemManager *)self delegate];
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      id v9 = [(HFItemManager *)self delegate];
      [v9 itemManager:self didChangeHome:self->_home];
    }
    p_home = (HMHome **)[(HFItemManager *)self resetItemProvidersAndModules];
    BOOL v5 = v10;
  }
  MEMORY[0x270F9A758](p_home, v5);
}

- (void)setLastUpdatedHome:(id)a3
{
}

- (id)_reloadAllItemProvidersFromSenderSelector:(SEL)a3
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __59__HFItemManager__reloadAllItemProvidersFromSenderSelector___block_invoke;
  aBlock[3] = &unk_26408DDE0;
  void aBlock[4] = self;
  id v33 = _Block_copy(aBlock);
  id v3 = [(HFItemManager *)self itemProviders];
  uint64_t v36 = objc_msgSend(v3, "na_filter:", &__block_literal_global_226_0);

  id v4 = objc_alloc_init(MEMORY[0x263F581A8]);
  BOOL v5 = [v4 future];
  char v6 = [(HFItemManager *)self firstFastUpdateFuture];
  id v7 = [v6 completionHandlerAdapter];
  id v8 = (id)[v5 addCompletionBlock:v7];
  uint64_t v34 = v4;

  id v9 = [(HFItemManager *)self _internalItems];
  id v10 = [(HFItemManager *)self readPolicy];
  uint64_t v35 = [(HFItemManager *)self _reloadItemProviders:v36 updateItems:v9 shouldUpdateExistingItems:1 senderSelector:a3 readPolicy:v10 fastInitialUpdatePromise:v4];

  id v11 = [(HFItemManager *)self firstFullUpdateFuture];
  id v12 = [v11 completionHandlerAdapter];
  id v13 = (id)[v35 addCompletionBlock:v12];

  uint64_t v14 = [v36 count];
  uint64_t v15 = [(HFItemManager *)self itemProviders];
  LODWORD(v14) = v14 == [v15 count];

  if (v14)
  {
    id v16 = v35;
    id v17 = v35;
  }
  else
  {
    __int16 v18 = [MEMORY[0x263EFF980] arrayWithObject:v35];
    uint64_t v19 = [(HFItemManager *)self itemProviders];
    uint64_t v20 = (void *)[v19 mutableCopy];

    [v20 removeObjectsInArray:v36];
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v21 = v20;
    uint64_t v22 = [v21 countByEnumeratingWithState:&v39 objects:v45 count:16];
    if (v22)
    {
      uint64_t v23 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v40 != v23) {
            objc_enumerationMutation(v21);
          }
          uint64_t v44 = *(void *)(*((void *)&v39 + 1) + 8 * i);
          __int16 v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v44 count:1];
          uint64_t v26 = [MEMORY[0x263EFFA08] set];
          __int16 v27 = [(HFItemManager *)self _reloadAndUpdateItemsForProviders:v25 updateItems:v26 senderSelector:a3];
          [v18 addObject:v27];
        }
        uint64_t v22 = [v21 countByEnumeratingWithState:&v39 objects:v45 count:16];
      }
      while (v22);
    }

    uint64_t v28 = (void *)MEMORY[0x263F58190];
    uint64_t v29 = [MEMORY[0x263F581B8] mainThreadScheduler];
    uint64_t v30 = [v28 combineAllFutures:v18 ignoringErrors:1 scheduler:v29];
    id v17 = [v30 flatMap:&__block_literal_global_231_0];

    id v16 = v35;
  }

  dispatch_queue_t v31 = v33;
  if (v33)
  {
    (*((void (**)(void))v33 + 2))();
    dispatch_queue_t v31 = v33;
  }

  return v17;
}

- (NAFuture)firstFullUpdateFuture
{
  return self->_firstFullUpdateFuture;
}

- (id)_reloadItemProviders:(id)a3 updateItems:(id)a4 shouldUpdateExistingItems:(BOOL)a5 senderSelector:(SEL)a6 readPolicy:(id)a7 fastInitialUpdatePromise:(id)a8
{
  uint64_t v68 = *MEMORY[0x263EF8340];
  id v48 = a3;
  id v47 = a4;
  id v45 = a7;
  id v46 = a8;
  id v12 = [(HFItemManager *)self home];
  if (v12)
  {
  }
  else if (![(HFItemManager *)self _shouldBuildItemProvidersAndModulesForNilHome])
  {
    NSLog(&cfstr_RequestToReloa.isa);
  }
  id v13 = [(HFItemManager *)self home];
  if (!v13
    && ![(HFItemManager *)self _shouldBuildItemProvidersAndModulesForNilHome])
  {
    goto LABEL_28;
  }
  if (![v48 count])
  {
    uint64_t v14 = [v47 count];

    if (v14) {
      goto LABEL_10;
    }
LABEL_28:
    uint64_t v35 = (void *)MEMORY[0x263F58190];
    uint64_t v36 = objc_msgSend(MEMORY[0x263F087E8], "hf_errorWithCode:", 30);
    uint64_t v34 = [v35 futureWithError:v36];

    goto LABEL_30;
  }

LABEL_10:
  if (+[HFUtilities isInternalTest]
    && ([(id)objc_opt_class() _canReloadDuringUnitTests] & 1) == 0)
  {
    uint64_t v37 = (void *)MEMORY[0x263F58190];
    long long v38 = [MEMORY[0x263EFFA08] set];
    uint64_t v34 = [v37 futureWithResult:v38];
  }
  else
  {
    uint64_t v15 = NSString;
    id v16 = NSStringFromSelector(a6);
    long long v43 = [v15 stringWithFormat:@"[%@ %@]", self, v16];

    id v17 = [[HFUpdateLogger alloc] initWithTimeout:v43 description:15.0];
    __int16 v18 = v17;
    if (v17)
    {
      state.opaque[0] = 0;
      state.opaque[1] = 0;
      uint64_t v19 = [(HFUpdateLogger *)v17 loggerActivity];
      os_activity_scope_enter(v19, &state);

      uint64_t v20 = HFLogForCategory(0x2AuLL);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        id v21 = NSStringFromSelector(a6);
        *(_DWORD *)buf = 138412802;
        v63 = self;
        __int16 v64 = 2112;
        v65 = v21;
        __int16 v66 = 2112;
        id v67 = v48;
        _os_log_impl(&dword_20B986000, v20, OS_LOG_TYPE_DEFAULT, "%@: Starting reload for sender: \"%@\". Item providers: %@", buf, 0x20u);
      }
      os_activity_scope_leave(&state);
    }
    else
    {
      long long v40 = HFLogForCategory(0x2AuLL);
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        long long v41 = NSStringFromSelector(a6);
        *(_DWORD *)buf = 138412802;
        v63 = self;
        __int16 v64 = 2112;
        v65 = v41;
        __int16 v66 = 2112;
        id v67 = v48;
        _os_log_impl(&dword_20B986000, v40, OS_LOG_TYPE_DEFAULT, "%@: Starting reload for sender: \"%@\". Item providers: %@", buf, 0x20u);
      }
    }
    uint64_t v22 = [MEMORY[0x263EFF980] array];
    long long v59 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v56 = 0u;
    id v23 = v48;
    uint64_t v24 = [v23 countByEnumeratingWithState:&v56 objects:v61 count:16];
    if (v24)
    {
      uint64_t v25 = *(void *)v57;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v57 != v25) {
            objc_enumerationMutation(v23);
          }
          __int16 v27 = [*(id *)(*((void *)&v56 + 1) + 8 * i) reloadItems];
          uint64_t v28 = [v27 recover:&__block_literal_global_242_0];

          if (v28) {
            [v22 addObject:v28];
          }
        }
        uint64_t v24 = [v23 countByEnumeratingWithState:&v56 objects:v61 count:16];
      }
      while (v24);
    }

    uint64_t v29 = [MEMORY[0x263F58190] futureWithResult:MEMORY[0x263EFFA68]];
    if ([v22 count])
    {
      uint64_t v30 = (void *)MEMORY[0x263F58190];
      dispatch_queue_t v31 = [MEMORY[0x263F581B8] mainThreadScheduler];
      uint64_t v32 = [v30 combineAllFutures:v22 ignoringErrors:0 scheduler:v31];

      uint64_t v29 = (void *)v32;
    }
    objc_initWeak((id *)buf, self);
    v49[0] = MEMORY[0x263EF8330];
    v49[1] = 3221225472;
    v49[2] = __127__HFItemManager__reloadItemProviders_updateItems_shouldUpdateExistingItems_senderSelector_readPolicy_fastInitialUpdatePromise___block_invoke_2;
    v49[3] = &unk_2640958C0;
    objc_copyWeak(v54, (id *)buf);
    id v50 = v47;
    BOOL v55 = a5;
    id v33 = v18;
    __int16 v51 = v33;
    v54[1] = (id)a6;
    id v52 = v46;
    id v53 = v45;
    uint64_t v34 = [v29 flatMap:v49];

    objc_destroyWeak(v54);
    objc_destroyWeak((id *)buf);
  }
LABEL_30:

  return v34;
}

uint64_t __59__HFItemManager__reloadAllItemProvidersFromSenderSelector___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setHasRequestedFirstUpdate:1];
}

- (void)setHasRequestedFirstUpdate:(BOOL)a3
{
  self->_hasRequestedFirstUpdate = a3;
}

id __75__HFItemManager__updateResultsForItems_removedItems_context_allowDelaying___block_invoke_2_320(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = a2;
  BOOL v5 = [v2 _performUpdateForItem:v4 withContext:v3 isInternal:1 isChild:0];
  char v6 = +[_HFItemUpdateFutureWrapper wrapperWithFuture:v5 item:v4 isInternal:1];

  return v6;
}

- (void)_notifyDelegateOfItemOperations:(id)a3 logger:(id)a4
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v8 = [v6 countByEnumeratingWithState:&v32 objects:v39 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v33;
    do
    {
      uint64_t v11 = 0;
      dispatch_queue_t v31 = sel_itemManager_didRemoveItem_atIndexPath_;
      do
      {
        if (*(void *)v33 != v10) {
          objc_enumerationMutation(v6);
        }
        id v12 = *(void **)(*((void *)&v32 + 1) + 8 * v11);
        if (v7)
        {
          state.opaque[0] = 0;
          state.opaque[1] = 0;
          id v13 = [v7 loggerActivity];
          os_activity_scope_enter(v13, &state);

          uint64_t v14 = HFLogForCategory(0x2AuLL);
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v15 = [v12 operationDescription];
            *(_DWORD *)buf = 138412290;
            uint64_t v37 = v15;
            _os_log_impl(&dword_20B986000, v14, OS_LOG_TYPE_DEFAULT, "Issuing item update: %@", buf, 0xCu);
          }
          os_activity_scope_leave(&state);
        }
        else
        {
          uint64_t v28 = HFLogForCategory(0x2AuLL);
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v29 = [v12 operationDescription];
            LODWORD(state.opaque[0]) = 138412290;
            *(uint64_t *)((char *)state.opaque + 4) = (uint64_t)v29;
            _os_log_impl(&dword_20B986000, v28, OS_LOG_TYPE_DEFAULT, "Issuing item update: %@", (uint8_t *)&state, 0xCu);
          }
        }
        switch(objc_msgSend(v12, "type", v31))
        {
          case 0:
            id v16 = [(HFItemManager *)self delegate];
            char v17 = objc_opt_respondsToSelector();

            if (v17)
            {
              __int16 v18 = [(HFItemManager *)self delegate];
              uint64_t v19 = [v12 item];
              uint64_t v20 = [v12 toIndexPath];
              [v18 itemManager:self didUpdateResultsForItem:v19 atIndexPath:v20];
              goto LABEL_19;
            }
            break;
          case 1:
            id v23 = [(HFItemManager *)self delegate];
            char v24 = objc_opt_respondsToSelector();

            if (v24)
            {
              __int16 v18 = [(HFItemManager *)self delegate];
              uint64_t v19 = [v12 item];
              uint64_t v20 = [v12 toIndexPath];
              [v18 itemManager:self didInsertItem:v19 atIndexPath:v20];
              goto LABEL_19;
            }
            break;
          case 2:
            id v21 = [(HFItemManager *)self delegate];
            char v22 = objc_opt_respondsToSelector();

            if (v22)
            {
              __int16 v18 = [(HFItemManager *)self delegate];
              uint64_t v19 = [v12 item];
              uint64_t v20 = [v12 fromIndexPath];
              [v18 itemManager:self didRemoveItem:v19 atIndexPath:v20];
              goto LABEL_19;
            }
            break;
          case 3:
            uint64_t v25 = [(HFItemManager *)self delegate];
            char v26 = objc_opt_respondsToSelector();

            if (v26)
            {
              __int16 v18 = [(HFItemManager *)self delegate];
              uint64_t v19 = [v12 item];
              uint64_t v20 = [v12 fromIndexPath];
              __int16 v27 = [v12 toIndexPath];
              [v18 itemManager:self didMoveItem:v19 fromIndexPath:v20 toIndexPath:v27];

LABEL_19:
            }
            break;
          default:
            break;
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v30 = [v6 countByEnumeratingWithState:&v32 objects:v39 count:16];
      uint64_t v9 = v30;
    }
    while (v30);
  }
}

void __71__HFItemManager__updateRepresentationForInternalItemsWithUpdatedItems___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 itemManager:*(void *)(a1 + 32) didUpdateResultsForSourceItem:*(void *)(a1 + 40)];
}

id __127__HFItemManager__reloadItemProviders_updateItems_shouldUpdateExistingItems_senderSelector_readPolicy_fastInitialUpdatePromise___block_invoke_3_252(uint64_t a1, void *a2)
{
  uint64_t v3 = (id *)(a1 + 80);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [*(id *)(a1 + 32) finishWithResult:v4];

  if (*(unsigned char *)(a1 + 96))
  {
    id v6 = [MEMORY[0x263EFFA08] set];
  }
  else
  {
    id v6 = *(id *)(a1 + 40);
  }
  id v7 = v6;
  uint64_t v8 = (void *)MEMORY[0x263F581B8];
  if (*(unsigned char *)(a1 + 97))
  {
    uint64_t v9 = dispatch_get_global_queue(0, 0);
    uint64_t v10 = [v8 schedulerWithDispatchQueue:v9];
  }
  else
  {
    uint64_t v10 = [MEMORY[0x263F581B8] mainThreadScheduler];
  }
  uint64_t v11 = (void *)MEMORY[0x263F58190];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  id v15[2] = __127__HFItemManager__reloadItemProviders_updateItems_shouldUpdateExistingItems_senderSelector_readPolicy_fastInitialUpdatePromise___block_invoke_4;
  v15[3] = &unk_264095870;
  uint64_t v22 = *(void *)(a1 + 88);
  id v16 = *(id *)(a1 + 48);
  id v17 = *(id *)(a1 + 56);
  id v18 = *(id *)(a1 + 64);
  id v19 = WeakRetained;
  id v20 = *(id *)(a1 + 72);
  id v21 = v7;
  id v12 = v7;
  id v13 = [v11 futureWithBlock:v15 scheduler:v10];

  return v13;
}

- (void)setSourceItem:(id)a3
{
  BOOL v5 = (HFItem *)a3;
  p_sourceItem = &self->_sourceItem;
  if (self->_sourceItem != v5)
  {
    uint64_t v10 = v5;
    objc_storeStrong((id *)p_sourceItem, a3);
    id v7 = [(HFItemManager *)self delegate];
    char v8 = objc_opt_respondsToSelector();

    BOOL v5 = v10;
    if (v8)
    {
      uint64_t v9 = [(HFItemManager *)self delegate];
      [v9 itemManager:self didChangeSourceItem:self->_sourceItem];

      BOOL v5 = v10;
    }
  }
  MEMORY[0x270F9A758](p_sourceItem, v5);
}

- (void)registerMatterDelegates
{
  id v2 = self;
  HFItemManager.registerMatterDelegates()();
}

- (void)deregisterMatterDelegates
{
  id v2 = self;
  HFItemManager.deregisterMatterDelegates()();
}

- (id)itemsToUpdateForMatterSnapshotChange
{
  id v2 = self;
  sub_20BA90170();

  sub_20BA8E684();
  sub_20BA90F74((unint64_t *)&qword_2676AE460, (void (*)(uint64_t))sub_20BA8E684);
  uint64_t v3 = (void *)sub_20BCE7920();
  swift_bridgeObjectRelease();
  return v3;
}

- (id)_debug_itemProviderDescriptions
{
  id v2 = [(HFItemManager *)self itemProviders];
  uint64_t v3 = objc_msgSend(v2, "na_map:", &__block_literal_global_7);

  return v3;
}

uint64_t __61__HFItemManager_HFDebugging___debug_itemProviderDescriptions__block_invoke(uint64_t a1, void *a2)
{
  return [a2 debugDescription];
}

- (id)_debug_itemDescriptions
{
  uint64_t v3 = objc_opt_new();
  if ([(HFItemManager *)self numberOfSections])
  {
    unint64_t v4 = 0;
    do
    {
      BOOL v5 = [(HFItemManager *)self displayedItemsInSection:v4];
      v7[0] = MEMORY[0x263EF8330];
      v7[1] = 3221225472;
      v7[2] = __53__HFItemManager_HFDebugging___debug_itemDescriptions__block_invoke;
      v7[3] = &unk_26408D720;
      unint64_t v9 = v4;
      id v8 = v3;
      [v5 enumerateObjectsUsingBlock:v7];

      ++v4;
    }
    while (v4 < [(HFItemManager *)self numberOfSections]);
  }
  return v3;
}

void __53__HFItemManager_HFDebugging___debug_itemDescriptions__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  BOOL v5 = NSString;
  id v6 = NSNumber;
  uint64_t v7 = *(void *)(a1 + 40);
  id v8 = a2;
  unint64_t v9 = [v6 numberWithUnsignedInteger:v7];
  uint64_t v10 = [NSNumber numberWithUnsignedInteger:a3];
  id v12 = [v5 stringWithFormat:@"[%@,%@]", v9, v10];

  uint64_t v11 = [v8 debugDescription];

  [*(id *)(a1 + 32) setObject:v11 forKeyedSubscript:v12];
}

- (id)hf_stateDumpBuilderWithContext:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[HFStateDumpBuilder builderWithObject:self context:v4];
  id v6 = [(HFItemManager *)self _debug_itemManagerDescription];
  [v5 setObject:v6 forKeyedSubscript:@"itemManager"];

  uint64_t v7 = [v4 detailLevel];
  if (v7 == 2)
  {
    id v8 = [(HFItemManager *)self _debug_itemProviderDescriptions];
    [v5 setObject:v8 forKeyedSubscript:@"itemProviders"];

    unint64_t v9 = [(HFItemManager *)self _debug_itemDescriptions];
    [v5 setObject:v9 forKeyedSubscript:@"items"];
  }
  return v5;
}

- (void)executionEnvironmentWillEnterForeground:(id)a3
{
  BOOL v5 = HFLogForCategory(0x25uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_20B986000, v5, OS_LOG_TYPE_DEFAULT, "executionEnvironmentWillEnterForeground", v8, 2u);
  }

  id v6 = [(HFItemManager *)self allItems];
  id v7 = [(HFItemManager *)self updateResultsForItems:v6 senderSelector:a2];
}

- (void)executionEnvironmentDidEnterBackground:(id)a3
{
  id v4 = HFLogForCategory(0x25uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_20B986000, v4, OS_LOG_TYPE_DEFAULT, "executionEnvironmentDidEnterBackground", v7, 2u);
  }

  BOOL v5 = [(HFItemManager *)self home];
  id v6 = objc_msgSend(v5, "hf_characteristicValueManager");
  [v6 invalidateAllCachedErrors];
}

- (void)executionEnvironmentWillResignActive:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  BOOL v5 = HFLogForCategory(0x25uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    unint64_t v9 = self;
    _os_log_impl(&dword_20B986000, v5, OS_LOG_TYPE_DEFAULT, "(%@) executionEnvironmentWillResignActive", (uint8_t *)&v8, 0xCu);
  }

  id v6 = [(HFItemManager *)self _itemsToUpdateForApplicationResignActive];
  id v7 = [(HFItemManager *)self updateResultsForItems:v6 senderSelector:a2];
}

- (id)_cameraForCameraStream:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  BOOL v5 = [(HFItemManager *)self home];
  id v6 = [v5 accessories];

  uint64_t v21 = [v6 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v21)
  {
    uint64_t v7 = *(void *)v27;
    uint64_t v20 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v27 != v7) {
          objc_enumerationMutation(v6);
        }
        unint64_t v9 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        uint64_t v10 = objc_msgSend(v9, "cameraProfiles", v20);
        uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v30 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v23;
          while (2)
          {
            for (uint64_t j = 0; j != v12; ++j)
            {
              if (*(void *)v23 != v13) {
                objc_enumerationMutation(v10);
              }
              uint64_t v15 = *(void **)(*((void *)&v22 + 1) + 8 * j);
              id v16 = [v15 streamControl];
              id v17 = [v16 cameraStream];

              if (v17 == v4)
              {
                id v18 = v15;

                goto LABEL_19;
              }
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v22 objects:v30 count:16];
            if (v12) {
              continue;
            }
            break;
          }
        }

        uint64_t v7 = v20;
      }
      id v18 = 0;
      uint64_t v21 = [v6 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v21);
  }
  else
  {
    id v18 = 0;
  }
LABEL_19:

  return v18;
}

- (id)_cameraForUserSettings:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  BOOL v5 = [(HFItemManager *)self home];
  id v6 = [v5 accessories];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v27;
    uint64_t v21 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v27 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        uint64_t v12 = [v11 cameraProfiles];
        uint64_t v13 = [v12 countByEnumeratingWithState:&v22 objects:v30 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v23;
          while (2)
          {
            for (uint64_t j = 0; j != v14; ++j)
            {
              if (*(void *)v23 != v15) {
                objc_enumerationMutation(v12);
              }
              id v17 = *(void **)(*((void *)&v22 + 1) + 8 * j);
              id v18 = [v17 userSettings];

              if (v18 == v4)
              {
                id v19 = v17;

                goto LABEL_19;
              }
            }
            uint64_t v14 = [v12 countByEnumeratingWithState:&v22 objects:v30 count:16];
            if (v14) {
              continue;
            }
            break;
          }
        }

        uint64_t v9 = v21;
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v26 objects:v31 count:16];
      id v19 = 0;
    }
    while (v8);
  }
  else
  {
    id v19 = 0;
  }
LABEL_19:

  return v19;
}

- (void)homeKitDispatcher:(id)a3 manager:(id)a4 didChangeHome:(id)a5
{
  id v7 = a4;
  if (+[HFUtilities isInternalTest]
    && ([v7 homes],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        uint64_t v9 = [v8 count],
        v8,
        !v9))
  {
    uint64_t v11 = HFLogForCategory(0x25uLL);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl(&dword_20B986000, v11, OS_LOG_TYPE_DEFAULT, "Skipping reload (for -homeKitDispatcher:manager:didChangeHome:) as this is an internal unit test -tearDown", v12, 2u);
    }
  }
  else
  {
    id v10 = [(HFItemManager *)self reloadAndUpdateAllItemsFromSenderSelector:a2];
  }
}

- (void)homeManagerDidFinishInitialDatabaseLoad:(id)a3
{
  id v5 = +[HFHomeKitDispatcher sharedDispatcher];
  id v4 = [v5 home];
  [(HFItemManager *)self setHome:v4];
}

- (void)homeManagerDidFinishUnknownChange:(id)a3
{
  id v5 = a3;
  if (+[HFUtilities isInternalTest]
    && ([v5 homes],
        id v6 = objc_claimAutoreleasedReturnValue(),
        uint64_t v7 = [v6 count],
        v6,
        !v7))
  {
    uint64_t v9 = HFLogForCategory(0x25uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl(&dword_20B986000, v9, OS_LOG_TYPE_DEFAULT, "Skipping reload (for -homeManagerDidFinishUnknownChange:) as this is an internal unit test -tearDown", v10, 2u);
    }
  }
  else
  {
    id v8 = [(HFItemManager *)self reloadAndUpdateAllItemsFromSenderSelector:a2];
  }
}

- (void)homeManager:(id)a3 didAddHome:(id)a4
{
  v12[1] = *MEMORY[0x263EF8340];
  id v6 = a4;
  uint64_t v7 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  id v8 = [MEMORY[0x263EFFA08] setWithObject:v6];

  uint64_t v9 = [(HFItemManager *)self _itemsToUpdateForModifiedMetadataForHomes:v8];
  v12[0] = @"home";
  id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
  id v11 = (id)[v7 requestUpdateForItems:v9 itemProviderInvalidationReasons:v10 modifiedHome:0 senderSelector:a2];
}

- (void)homeManager:(id)a3 didRemoveHome:(id)a4
{
  v17[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  if (+[HFUtilities isInternalTest]
    && ([v7 homes],
        uint64_t v9 = objc_claimAutoreleasedReturnValue(),
        uint64_t v10 = [v9 count],
        v9,
        !v10))
  {
    id v11 = HFLogForCategory(0x25uLL);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v16 = 0;
      _os_log_impl(&dword_20B986000, v11, OS_LOG_TYPE_DEFAULT, "Skipping reload (for -homeManager:didRemoveHome:) as this is an internal unit test -tearDown", v16, 2u);
    }
  }
  else
  {
    id v11 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
    uint64_t v12 = [MEMORY[0x263EFFA08] setWithObject:v8];
    uint64_t v13 = [(HFItemManager *)self _itemsToUpdateForModifiedMetadataForHomes:v12];
    v17[0] = @"home";
    uint64_t v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:1];
    id v15 = (id)[v11 requestUpdateForItems:v13 itemProviderInvalidationReasons:v14 modifiedHome:0 senderSelector:a2];
  }
}

- (void)homeManager:(id)a3 residentProvisioningStatusChanged:(unint64_t)a4
{
  id v8 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  id v6 = [(HFItemManager *)self _itemsToUpdateForRemoteAccessChange];
  id v7 = (id)[v8 requestUpdateForItems:v6 itemProviderInvalidationReasons:MEMORY[0x263EFFA68] modifiedHome:0 senderSelector:a2];
}

- (void)homeManager:(id)a3 didUpdateAccessAllowedWhenLocked:(BOOL)a4
{
  id v8 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  id v6 = [(HFItemManager *)self _itemsToUpdateForAllowAccessWhileLockedSettingChange];
  id v7 = (id)[v8 requestUpdateForItems:v6 itemProviderInvalidationReasons:MEMORY[0x263EFFA68] modifiedHome:0 senderSelector:a2];
}

- (void)homeManagerDidUpdateDataSyncState:(id)a3
{
  v15[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  if ([v5 dataSyncState] == 1)
  {
    id v6 = [(HFItemManager *)self home];
    id v7 = objc_msgSend(v6, "hf_characteristicValueManager");
    [v7 invalidateAllCachedErrors];

    id v8 = [(HFItemManager *)self batchedDelegateAdapterAllowingReads];
    uint64_t v9 = (void *)MEMORY[0x263EFFA08];
    uint64_t v10 = [v5 homes];
    id v11 = [v9 setWithArray:v10];
    uint64_t v12 = [(HFItemManager *)self _itemsToUpdateForModifiedMetadataForHomes:v11];
    v15[0] = @"home";
    uint64_t v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
    id v14 = (id)[v8 requestUpdateForItems:v12 itemProviderInvalidationReasons:v13 modifiedHome:0 senderSelector:a2];
  }
}

- (void)homeManager:(id)a3 didUpdateHH2State:(BOOL)a4
{
  v14[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  id v8 = (void *)MEMORY[0x263EFFA08];
  uint64_t v9 = [v6 homes];

  uint64_t v10 = [v8 setWithArray:v9];
  id v11 = [(HFItemManager *)self _itemsToUpdateForModifiedMetadataForHomes:v10];
  v14[0] = @"home";
  uint64_t v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];
  id v13 = (id)[v7 requestUpdateForItems:v11 itemProviderInvalidationReasons:v12 modifiedHome:0 senderSelector:a2];
}

- (void)homeDidUpdateName:(id)a3
{
  v11[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  id v7 = objc_msgSend(MEMORY[0x263EFFA08], "na_setWithSafeObject:", v5);
  id v8 = [(HFItemManager *)self _itemsToUpdateForModifiedMetadataForHomes:v7];
  v11[0] = @"home";
  uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
  id v10 = (id)[v6 requestUpdateForItems:v8 itemProviderInvalidationReasons:v9 modifiedHome:v5 senderSelector:a2];
}

- (void)home:(id)a3 didAddAccessory:(id)a4
{
  id v14 = a3;
  id v7 = a4;
  id v8 = objc_msgSend(v14, "hf_characteristicValueManager");
  [v8 invalidateCachedValuesForAccessory:v7];

  uint64_t v9 = [(HFItemManager *)self batchedDelegateAdapterAllowingReads];
  id v10 = objc_msgSend(MEMORY[0x263EFFA08], "na_setWithSafeObject:", v7);
  id v11 = [(HFItemManager *)self _itemsToUpdateForModifiedAccessories:v10];
  uint64_t v12 = [(HFItemManager *)self _invalidationReasonsForAddedOrRemovedAccessory:v7];

  id v13 = (id)[v9 requestUpdateForItems:v11 itemProviderInvalidationReasons:v12 modifiedHome:v14 senderSelector:a2];
}

- (void)home:(id)a3 didRemoveAccessory:(id)a4
{
  id v13 = a3;
  id v7 = a4;
  id v8 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  uint64_t v9 = objc_msgSend(MEMORY[0x263EFFA08], "na_setWithSafeObject:", v7);
  id v10 = [(HFItemManager *)self _itemsToUpdateForModifiedAccessories:v9];
  id v11 = [(HFItemManager *)self _invalidationReasonsForAddedOrRemovedAccessory:v7];

  id v12 = (id)[v8 requestUpdateForItems:v10 itemProviderInvalidationReasons:v11 modifiedHome:v13 senderSelector:a2];
}

- (void)home:(id)a3 didAddUser:(id)a4
{
  v14[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  id v10 = objc_msgSend(MEMORY[0x263EFFA08], "na_setWithSafeObject:", v8);

  id v11 = [(HFItemManager *)self _itemsToUpdateForModifiedUsers:v10];
  v14[0] = @"user";
  id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];
  id v13 = (id)[v9 requestUpdateForItems:v11 itemProviderInvalidationReasons:v12 modifiedHome:v7 senderSelector:a2];
}

- (void)home:(id)a3 didRemoveUser:(id)a4
{
  v14[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  id v10 = objc_msgSend(MEMORY[0x263EFFA08], "na_setWithSafeObject:", v8);

  id v11 = [(HFItemManager *)self _itemsToUpdateForModifiedUsers:v10];
  v14[0] = @"user";
  id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];
  id v13 = (id)[v9 requestUpdateForItems:v11 itemProviderInvalidationReasons:v12 modifiedHome:v7 senderSelector:a2];
}

- (void)homeDidUpdateHomeLocationStatus:(id)a3
{
  v11[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  id v7 = [MEMORY[0x263EFFA08] setWithObject:v5];

  id v8 = [(HFItemManager *)self _itemsToUpdateForModifiedMetadataForHomes:v7];
  v11[0] = @"home";
  uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
  id v10 = (id)[v6 requestUpdateForItems:v8 itemProviderInvalidationReasons:v9 modifiedHome:0 senderSelector:a2];
}

- (void)homeDidUpdateAccessControlForCurrentUser:(id)a3
{
  v16[2] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = objc_msgSend(MEMORY[0x263EFFA08], "na_setWithSafeObject:", v5);
  id v7 = [(HFItemManager *)self _itemsToUpdateForModifiedMetadataForHomes:v6];
  id v8 = (void *)[v7 mutableCopy];

  uint64_t v9 = (void *)MEMORY[0x263EFFA08];
  id v10 = [v5 currentUser];
  id v11 = objc_msgSend(v9, "na_setWithSafeObject:", v10);
  id v12 = [(HFItemManager *)self _itemsToUpdateForModifiedUsers:v11];
  [v8 unionSet:v12];

  id v13 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  v16[0] = @"home";
  v16[1] = @"user";
  id v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:2];
  id v15 = (id)[v13 requestUpdateForItems:v8 itemProviderInvalidationReasons:v14 modifiedHome:v5 senderSelector:a2];
}

- (void)home:(id)a3 didUpdateRoom:(id)a4 forAccessory:(id)a5
{
  v20[2] = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = (void *)MEMORY[0x263EFFA08];
  id v11 = a5;
  id v12 = objc_msgSend(v10, "na_setWithSafeObject:", a4);
  id v13 = [(HFItemManager *)self _itemsToUpdateForModifiedRooms:v12];
  id v14 = (void *)[v13 mutableCopy];

  id v15 = objc_msgSend(MEMORY[0x263EFFA08], "na_setWithSafeObject:", v11);

  id v16 = [(HFItemManager *)self _itemsToUpdateForModifiedAccessories:v15];
  [v14 unionSet:v16];

  id v17 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  v20[0] = @"room";
  v20[1] = @"accessory";
  id v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:2];
  id v19 = (id)[v17 requestUpdateForItems:v14 itemProviderInvalidationReasons:v18 modifiedHome:v9 senderSelector:a2];
}

- (void)home:(id)a3 didAddRoom:(id)a4
{
  v14[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  id v10 = objc_msgSend(MEMORY[0x263EFFA08], "na_setWithSafeObject:", v8);

  id v11 = [(HFItemManager *)self _itemsToUpdateForModifiedRooms:v10];
  v14[0] = @"room";
  id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];
  id v13 = (id)[v9 requestUpdateForItems:v11 itemProviderInvalidationReasons:v12 modifiedHome:v7 senderSelector:a2];
}

- (void)home:(id)a3 didRemoveRoom:(id)a4
{
  v14[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  id v10 = objc_msgSend(MEMORY[0x263EFFA08], "na_setWithSafeObject:", v8);

  id v11 = [(HFItemManager *)self _itemsToUpdateForModifiedRooms:v10];
  v14[0] = @"room";
  id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];
  id v13 = (id)[v9 requestUpdateForItems:v11 itemProviderInvalidationReasons:v12 modifiedHome:v7 senderSelector:a2];
}

- (void)home:(id)a3 didUpdateNameForRoom:(id)a4
{
  v14[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  id v10 = objc_msgSend(MEMORY[0x263EFFA08], "na_setWithSafeObject:", v8);

  id v11 = [(HFItemManager *)self _itemsToUpdateForModifiedRooms:v10];
  v14[0] = @"room";
  id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];
  id v13 = (id)[v9 requestUpdateForItems:v11 itemProviderInvalidationReasons:v12 modifiedHome:v7 senderSelector:a2];
}

- (void)home:(id)a3 didAddZone:(id)a4
{
  v14[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  id v10 = objc_msgSend(MEMORY[0x263EFFA08], "na_setWithSafeObject:", v8);

  id v11 = [(HFItemManager *)self _itemsToUpdateForModifiedZones:v10];
  v14[0] = @"zone";
  id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];
  id v13 = (id)[v9 requestUpdateForItems:v11 itemProviderInvalidationReasons:v12 modifiedHome:v7 senderSelector:a2];
}

- (void)home:(id)a3 didRemoveZone:(id)a4
{
  v14[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  id v10 = objc_msgSend(MEMORY[0x263EFFA08], "na_setWithSafeObject:", v8);

  id v11 = [(HFItemManager *)self _itemsToUpdateForModifiedZones:v10];
  v14[0] = @"zone";
  id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];
  id v13 = (id)[v9 requestUpdateForItems:v11 itemProviderInvalidationReasons:v12 modifiedHome:v7 senderSelector:a2];
}

- (void)home:(id)a3 didUpdateNameForZone:(id)a4
{
  v14[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  id v10 = objc_msgSend(MEMORY[0x263EFFA08], "na_setWithSafeObject:", v8);

  id v11 = [(HFItemManager *)self _itemsToUpdateForModifiedZones:v10];
  v14[0] = @"zone";
  id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];
  id v13 = (id)[v9 requestUpdateForItems:v11 itemProviderInvalidationReasons:v12 modifiedHome:v7 senderSelector:a2];
}

- (void)home:(id)a3 didAddRoom:(id)a4 toZone:(id)a5
{
  v20[2] = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = (void *)MEMORY[0x263EFFA08];
  id v11 = a5;
  id v12 = objc_msgSend(v10, "na_setWithSafeObject:", a4);
  id v13 = [(HFItemManager *)self _itemsToUpdateForModifiedRooms:v12];
  id v14 = (void *)[v13 mutableCopy];

  id v15 = objc_msgSend(MEMORY[0x263EFFA08], "na_setWithSafeObject:", v11);

  id v16 = [(HFItemManager *)self _itemsToUpdateForModifiedZones:v15];
  [v14 unionSet:v16];

  id v17 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  v20[0] = @"room";
  v20[1] = @"zone";
  id v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:2];
  id v19 = (id)[v17 requestUpdateForItems:v14 itemProviderInvalidationReasons:v18 modifiedHome:v9 senderSelector:a2];
}

- (void)home:(id)a3 didRemoveRoom:(id)a4 fromZone:(id)a5
{
  v20[2] = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = (void *)MEMORY[0x263EFFA08];
  id v11 = a5;
  id v12 = objc_msgSend(v10, "na_setWithSafeObject:", a4);
  id v13 = [(HFItemManager *)self _itemsToUpdateForModifiedRooms:v12];
  id v14 = (void *)[v13 mutableCopy];

  id v15 = objc_msgSend(MEMORY[0x263EFFA08], "na_setWithSafeObject:", v11);

  id v16 = [(HFItemManager *)self _itemsToUpdateForModifiedZones:v15];
  [v14 unionSet:v16];

  id v17 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  v20[0] = @"room";
  v20[1] = @"zone";
  id v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:2];
  id v19 = (id)[v17 requestUpdateForItems:v14 itemProviderInvalidationReasons:v18 modifiedHome:v9 senderSelector:a2];
}

- (void)home:(id)a3 didAddServiceGroup:(id)a4
{
  v14[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  id v10 = objc_msgSend(MEMORY[0x263EFFA08], "na_setWithSafeObject:", v8);

  id v11 = [(HFItemManager *)self _itemsToUpdateForModifiedServiceGroups:v10];
  v14[0] = @"serviceGroup";
  id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];
  id v13 = (id)[v9 requestUpdateForItems:v11 itemProviderInvalidationReasons:v12 modifiedHome:v7 senderSelector:a2];
}

- (void)home:(id)a3 didRemoveServiceGroup:(id)a4
{
  v14[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  id v10 = objc_msgSend(MEMORY[0x263EFFA08], "na_setWithSafeObject:", v8);

  id v11 = [(HFItemManager *)self _itemsToUpdateForModifiedServiceGroups:v10];
  v14[0] = @"serviceGroup";
  id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];
  id v13 = (id)[v9 requestUpdateForItems:v11 itemProviderInvalidationReasons:v12 modifiedHome:v7 senderSelector:a2];
}

- (void)home:(id)a3 didUpdateNameForServiceGroup:(id)a4
{
  v14[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  id v10 = objc_msgSend(MEMORY[0x263EFFA08], "na_setWithSafeObject:", v8);

  id v11 = [(HFItemManager *)self _itemsToUpdateForModifiedServiceGroups:v10];
  v14[0] = @"serviceGroup";
  id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];
  id v13 = (id)[v9 requestUpdateForItems:v11 itemProviderInvalidationReasons:v12 modifiedHome:v7 senderSelector:a2];
}

- (void)home:(id)a3 didAddService:(id)a4 toServiceGroup:(id)a5
{
  v20[2] = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = (void *)MEMORY[0x263EFFA08];
  id v11 = a5;
  id v12 = objc_msgSend(v10, "na_setWithSafeObject:", a4);
  id v13 = [(HFItemManager *)self _itemsToUpdateForModifiedServices:v12];
  id v14 = (void *)[v13 mutableCopy];

  id v15 = objc_msgSend(MEMORY[0x263EFFA08], "na_setWithSafeObject:", v11);

  id v16 = [(HFItemManager *)self _itemsToUpdateForModifiedServiceGroups:v15];
  [v14 unionSet:v16];

  id v17 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  v20[0] = @"service";
  v20[1] = @"serviceGroup";
  id v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:2];
  id v19 = (id)[v17 requestUpdateForItems:v14 itemProviderInvalidationReasons:v18 modifiedHome:v9 senderSelector:a2];
}

- (void)home:(id)a3 didRemoveService:(id)a4 fromServiceGroup:(id)a5
{
  v20[2] = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = (void *)MEMORY[0x263EFFA08];
  id v11 = a5;
  id v12 = objc_msgSend(v10, "na_setWithSafeObject:", a4);
  id v13 = [(HFItemManager *)self _itemsToUpdateForModifiedServices:v12];
  id v14 = (void *)[v13 mutableCopy];

  id v15 = objc_msgSend(MEMORY[0x263EFFA08], "na_setWithSafeObject:", v11);

  id v16 = [(HFItemManager *)self _itemsToUpdateForModifiedServiceGroups:v15];
  [v14 unionSet:v16];

  id v17 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  v20[0] = @"service";
  v20[1] = @"serviceGroup";
  id v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:2];
  id v19 = (id)[v17 requestUpdateForItems:v14 itemProviderInvalidationReasons:v18 modifiedHome:v9 senderSelector:a2];
}

- (void)home:(id)a3 didUnblockAccessory:(id)a4
{
  v15[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = objc_msgSend(v7, "hf_characteristicValueManager");
  [v9 invalidateCachedValuesForAccessory:v8];

  id v10 = [(HFItemManager *)self batchedDelegateAdapterAllowingReads];
  id v11 = objc_msgSend(MEMORY[0x263EFFA08], "na_setWithSafeObject:", v8);

  id v12 = [(HFItemManager *)self _itemsToUpdateForModifiedAccessories:v11];
  v15[0] = @"accessory";
  id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
  id v14 = (id)[v10 requestUpdateForItems:v12 itemProviderInvalidationReasons:v13 modifiedHome:v7 senderSelector:a2];
}

- (void)home:(id)a3 didEncounterError:(id)a4 forAccessory:(id)a5
{
  id v14 = a3;
  id v8 = a5;
  id v9 = [(HFItemManager *)self home];

  if (v9 == v14)
  {
    id v10 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
    id v11 = objc_msgSend(MEMORY[0x263EFFA08], "na_setWithSafeObject:", v8);
    id v12 = [(HFItemManager *)self _itemsToUpdateForModifiedAccessories:v11];
    id v13 = (id)[v10 requestUpdateForItems:v12 itemProviderInvalidationReasons:MEMORY[0x263EFFA68] modifiedHome:v14 senderSelector:a2];
  }
}

- (void)home:(id)a3 didAddActionSet:(id)a4
{
  v14[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  id v10 = objc_msgSend(MEMORY[0x263EFFA08], "na_setWithSafeObject:", v8);

  id v11 = [(HFItemManager *)self _itemsToUpdateForModifiedActionSets:v10];
  v14[0] = @"actionSet";
  id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];
  id v13 = (id)[v9 requestUpdateForItems:v11 itemProviderInvalidationReasons:v12 modifiedHome:v7 senderSelector:a2];
}

- (void)home:(id)a3 didRemoveActionSet:(id)a4
{
  v16[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = [(HFItemManager *)self home];
  id v10 = objc_msgSend(v9, "hf_characteristicValueManager");
  [v10 invalidateCachedErrorForExecutionOfActionSet:v8];

  id v11 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  id v12 = objc_msgSend(MEMORY[0x263EFFA08], "na_setWithSafeObject:", v8);

  id v13 = [(HFItemManager *)self _itemsToUpdateForModifiedActionSets:v12];
  v16[0] = @"actionSet";
  id v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:1];
  id v15 = (id)[v11 requestUpdateForItems:v13 itemProviderInvalidationReasons:v14 modifiedHome:v7 senderSelector:a2];
}

- (void)home:(id)a3 didUpdateNameForActionSet:(id)a4
{
  v14[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  id v10 = objc_msgSend(MEMORY[0x263EFFA08], "na_setWithSafeObject:", v8);

  id v11 = [(HFItemManager *)self _itemsToUpdateForModifiedActionSets:v10];
  v14[0] = @"actionSet";
  id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];
  id v13 = (id)[v9 requestUpdateForItems:v11 itemProviderInvalidationReasons:v12 modifiedHome:v7 senderSelector:a2];
}

- (void)home:(id)a3 didUpdateActionsForActionSet:(id)a4
{
  v16[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = [(HFItemManager *)self home];
  id v10 = objc_msgSend(v9, "hf_characteristicValueManager");
  [v10 invalidateCachedErrorForExecutionOfActionSet:v8];

  id v11 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  id v12 = objc_msgSend(MEMORY[0x263EFFA08], "na_setWithSafeObject:", v8);

  id v13 = [(HFItemManager *)self _itemsToUpdateForModifiedActionSets:v12];
  v16[0] = @"actionSet";
  id v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:1];
  id v15 = (id)[v11 requestUpdateForItems:v13 itemProviderInvalidationReasons:v14 modifiedHome:v7 senderSelector:a2];
}

- (void)home:(id)a3 didAddTrigger:(id)a4
{
  v14[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  id v10 = objc_msgSend(MEMORY[0x263EFFA08], "na_setWithSafeObject:", v8);

  id v11 = [(HFItemManager *)self _itemsToUpdateForModifiedTriggers:v10];
  v14[0] = @"trigger";
  id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];
  id v13 = (id)[v9 requestUpdateForItems:v11 itemProviderInvalidationReasons:v12 modifiedHome:v7 senderSelector:a2];
}

- (void)home:(id)a3 didRemoveTrigger:(id)a4
{
  v14[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  id v10 = objc_msgSend(MEMORY[0x263EFFA08], "na_setWithSafeObject:", v8);

  id v11 = [(HFItemManager *)self _itemsToUpdateForModifiedTriggers:v10];
  v14[0] = @"trigger";
  id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];
  id v13 = (id)[v9 requestUpdateForItems:v11 itemProviderInvalidationReasons:v12 modifiedHome:v7 senderSelector:a2];
}

- (void)home:(id)a3 didUpdateNameForTrigger:(id)a4
{
  v14[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  id v10 = objc_msgSend(MEMORY[0x263EFFA08], "na_setWithSafeObject:", v8);

  id v11 = [(HFItemManager *)self _itemsToUpdateForModifiedTriggers:v10];
  v14[0] = @"trigger";
  id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];
  id v13 = (id)[v9 requestUpdateForItems:v11 itemProviderInvalidationReasons:v12 modifiedHome:v7 senderSelector:a2];
}

- (void)home:(id)a3 didUpdateTrigger:(id)a4
{
  v14[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  id v10 = objc_msgSend(MEMORY[0x263EFFA08], "na_setWithSafeObject:", v8);

  id v11 = [(HFItemManager *)self _itemsToUpdateForModifiedTriggers:v10];
  v14[0] = @"trigger";
  id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];
  id v13 = (id)[v9 requestUpdateForItems:v11 itemProviderInvalidationReasons:v12 modifiedHome:v7 senderSelector:a2];
}

- (void)homeDidUpdateApplicationData:(id)a3
{
  v11[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  id v7 = objc_msgSend(MEMORY[0x263EFFA08], "na_setWithSafeObject:", v5);
  id v8 = [(HFItemManager *)self _itemsToUpdateForModifiedMetadataForHomes:v7];
  v11[0] = @"home";
  id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
  id v10 = (id)[v6 requestUpdateForItems:v8 itemProviderInvalidationReasons:v9 modifiedHome:v5 senderSelector:a2];
}

- (void)home:(id)a3 didUpdateApplicationDataForRoom:(id)a4
{
  v14[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  id v10 = objc_msgSend(MEMORY[0x263EFFA08], "na_setWithSafeObject:", v8);

  id v11 = [(HFItemManager *)self _itemsToUpdateForModifiedRooms:v10];
  v14[0] = @"room";
  id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];
  id v13 = (id)[v9 requestUpdateForItems:v11 itemProviderInvalidationReasons:v12 modifiedHome:v7 senderSelector:a2];
}

- (void)home:(id)a3 didUpdateApplicationDataForActionSet:(id)a4
{
  v14[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  id v10 = objc_msgSend(MEMORY[0x263EFFA08], "na_setWithSafeObject:", v8);

  id v11 = [(HFItemManager *)self _itemsToUpdateForModifiedActionSets:v10];
  v14[0] = @"actionSet";
  id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];
  id v13 = (id)[v9 requestUpdateForItems:v11 itemProviderInvalidationReasons:v12 modifiedHome:v7 senderSelector:a2];
}

- (void)home:(id)a3 didUpdateApplicationDataForServiceGroup:(id)a4
{
  v14[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  id v10 = objc_msgSend(MEMORY[0x263EFFA08], "na_setWithSafeObject:", v8);

  id v11 = [(HFItemManager *)self _itemsToUpdateForModifiedServiceGroups:v10];
  v14[0] = @"serviceGroup";
  id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];
  id v13 = (id)[v9 requestUpdateForItems:v11 itemProviderInvalidationReasons:v12 modifiedHome:v7 senderSelector:a2];
}

- (void)home:(id)a3 didUpdateStateForOutgoingInvitations:(id)a4
{
  v14[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  id v10 = [MEMORY[0x263EFFA08] setWithArray:v8];

  id v11 = [(HFItemManager *)self _itemsToUpdateForOutgoingInvitation:v10];
  v14[0] = @"outgoinginvitations";
  id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];
  id v13 = (id)[v9 requestUpdateForItems:v11 itemProviderInvalidationReasons:v12 modifiedHome:v7 senderSelector:a2];
}

- (void)home:(id)a3 didUpdateAccesoryInvitationsForUser:(id)a4
{
  v14[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  id v10 = objc_msgSend(MEMORY[0x263EFFA08], "na_setWithSafeObject:", v8);

  id v11 = [(HFItemManager *)self _itemsToUpdateForModifiedUsers:v10];
  v14[0] = @"pendingAccessories";
  id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];
  id v13 = (id)[v9 requestUpdateForItems:v11 itemProviderInvalidationReasons:v12 modifiedHome:v7 senderSelector:a2];
}

- (void)homeManager:(id)a3 didUpdateStateForIncomingInvitations:(id)a4
{
  v12[1] = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  id v8 = [MEMORY[0x263EFFA08] setWithArray:v6];

  id v9 = [(HFItemManager *)self _itemsToUpdateForIncomingInvitation:v8];
  v12[0] = @"incominginvitations";
  id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
  id v11 = (id)[v7 requestUpdateForItems:v9 itemProviderInvalidationReasons:v10 modifiedHome:0 senderSelector:a2];
}

- (void)home:(id)a3 didUpdateAccessControlForUser:(id)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = [MEMORY[0x263EFFA08] setWithObject:v8];
  id v10 = [(HFItemManager *)self _itemsToUpdateForModifiedUsers:v9];

  id v11 = [v7 currentUser];
  int v12 = [v8 isEqual:v11];

  if (v12)
  {
    id v13 = [MEMORY[0x263EFFA08] setWithObject:v7];
    id v14 = [(HFItemManager *)self _itemsToUpdateForModifiedMetadataForHomes:v13];
    uint64_t v15 = [v10 setByAddingObjectsFromSet:v14];

    id v10 = (void *)v15;
  }
  id v16 = [v7 currentUser];
  if (v16 == v8)
  {
    id v17 = [v7 homeAccessControlForUser:v8];
    char v18 = [v17 isRemoteAccessAllowed];

    if ((v18 & 1) == 0)
    {
      id v19 = [v8 announceUserSettings];
      if ([v19 deviceNotificationMode] == 3)
      {
        uint64_t v20 = HFLogForCategory(0x25uLL);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v21 = [NSNumber numberWithUnsignedInteger:3];
          long long v22 = NSNumber;
          long long v23 = [v7 homeAccessControlForUser:v8];
          long long v24 = objc_msgSend(v22, "numberWithBool:", objc_msgSend(v23, "isRemoteAccessAllowed"));
          *(_DWORD *)buf = 138412546;
          uint64_t v32 = v21;
          __int16 v33 = 2112;
          long long v34 = v24;
          _os_log_impl(&dword_20B986000, v20, OS_LOG_TYPE_DEFAULT, "Now Updating Announce notification setting to HMAnnounceDeviceNotificationModeAtHome -  currentNotificationMode = [%@] isRemoteAccessAllowed = [%@]", buf, 0x16u);
        }
        long long v25 = (void *)[objc_alloc(MEMORY[0x263F0E0D8]) initWithDeviceNotificationMode:2];
        long long v26 = [v7 currentUser];
        [v26 updateAnnounceUserSettings:v25 forHome:v7 completionHandler:&__block_literal_global_56];
      }
    }
  }
  else
  {
  }
  long long v27 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  uint64_t v30 = @"user";
  long long v28 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v30 count:1];
  id v29 = (id)[v27 requestUpdateForItems:v10 itemProviderInvalidationReasons:v28 modifiedHome:v7 senderSelector:a2];
}

void __70__HFItemManager_HomeKitDelegates__home_didUpdateAccessControlForUser___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = a2;
  if (v2)
  {
    uint64_t v3 = HFLogForCategory(0x25uLL);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 138412290;
      id v5 = v2;
      _os_log_impl(&dword_20B986000, v3, OS_LOG_TYPE_DEFAULT, "Error updating Announce notification setting - [%@]", (uint8_t *)&v4, 0xCu);
    }
  }
}

- (void)home:(id)a3 didAddResidentDevice:(id)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = objc_msgSend(MEMORY[0x263EFFA08], "na_setWithSafeObject:", a4);
  id v9 = [(HFItemManager *)self _itemsToUpdateForModifiedResidentDevices:v8];

  id v10 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  v13[0] = @"residentDevice";
  id v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
  id v12 = (id)[v10 requestUpdateForItems:v9 itemProviderInvalidationReasons:v11 modifiedHome:v7 senderSelector:a2];
}

- (void)home:(id)a3 didRemoveResidentDevice:(id)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = objc_msgSend(MEMORY[0x263EFFA08], "na_setWithSafeObject:", a4);
  id v9 = [(HFItemManager *)self _itemsToUpdateForModifiedResidentDevices:v8];

  id v10 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  v13[0] = @"residentDevice";
  id v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
  id v12 = (id)[v10 requestUpdateForItems:v9 itemProviderInvalidationReasons:v11 modifiedHome:v7 senderSelector:a2];
}

- (void)home:(id)a3 remoteAccessStateDidChange:(unint64_t)a4
{
  id v9 = a3;
  uint64_t v6 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  id v7 = [(HFItemManager *)self _itemsToUpdateForRemoteAccessChange];
  id v8 = (id)[v6 requestUpdateForItems:v7 itemProviderInvalidationReasons:MEMORY[0x263EFFA68] modifiedHome:v9 senderSelector:a2];
}

- (void)homeDidUpdateProtectionMode:(id)a3
{
  id v9 = a3;
  id v5 = [(HFItemManager *)self batchedDelegateAdapterAllowingReads];
  uint64_t v6 = [MEMORY[0x263EFFA08] setWithObject:v9];
  id v7 = [(HFItemManager *)self _itemsToUpdateForModifiedMetadataForHomes:v6];
  id v8 = (id)[v5 requestUpdateForItems:v7 itemProviderInvalidationReasons:MEMORY[0x263EFFA68] modifiedHome:v9 senderSelector:a2];
}

- (void)homeDidUpdateNetworkRouterSupport:(id)a3
{
  id v9 = a3;
  id v5 = [(HFItemManager *)self batchedDelegateAdapterAllowingReads];
  uint64_t v6 = [MEMORY[0x263EFFA08] setWithObject:v9];
  id v7 = [(HFItemManager *)self _itemsToUpdateForModifiedMetadataForHomes:v6];
  id v8 = (id)[v5 requestUpdateForItems:v7 itemProviderInvalidationReasons:MEMORY[0x263EFFA68] modifiedHome:v9 senderSelector:a2];
}

- (void)home:(id)a3 didAddAccessoryNetworkProtectionGroup:(id)a4
{
  v12[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [(HFItemManager *)self batchedDelegateAdapterAllowingReads];
  id v8 = [MEMORY[0x263EFFA08] setWithObject:v6];
  id v9 = [(HFItemManager *)self _itemsToUpdateForModifiedMetadataForHomes:v8];
  v12[0] = @"accessory";
  id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
  id v11 = (id)[v7 requestUpdateForItems:v9 itemProviderInvalidationReasons:v10 modifiedHome:v6 senderSelector:a2];
}

- (void)home:(id)a3 didRemoveAccessoryNetworkProtectionGroup:(id)a4
{
  v12[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [(HFItemManager *)self batchedDelegateAdapterAllowingReads];
  id v8 = [MEMORY[0x263EFFA08] setWithObject:v6];
  id v9 = [(HFItemManager *)self _itemsToUpdateForModifiedMetadataForHomes:v8];
  v12[0] = @"accessory";
  id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
  id v11 = (id)[v7 requestUpdateForItems:v9 itemProviderInvalidationReasons:v10 modifiedHome:v6 senderSelector:a2];
}

- (void)home:(id)a3 didUpdateAccessoryNetworkProtectionGroup:(id)a4
{
  id v12 = a3;
  id v7 = a4;
  id v8 = [(HFItemManager *)self batchedDelegateAdapterAllowingReads];
  id v9 = [MEMORY[0x263EFFA08] setWithObject:v7];

  id v10 = [(HFItemManager *)self _itemsToUpdateForModifiedNetworkProtectionGroups:v9];
  id v11 = (id)[v8 requestUpdateForItems:v10 itemProviderInvalidationReasons:MEMORY[0x263EFFA68] modifiedHome:v12 senderSelector:a2];
}

- (void)home:(id)a3 didUpdatePersonManagerSettings:(id)a4
{
  id v6 = [MEMORY[0x263EFFA08] setWithObject:a4];
  id v9 = [(HFItemManager *)self _itemsToUpdateForModifiedHomePersonManagerSettings:v6];

  id v7 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  id v8 = (id)[v7 requestUpdateForItems:v9 itemProviderInvalidationReasons:MEMORY[0x263EFFA68] modifiedHome:0 senderSelector:a2];
}

- (void)homeDidAddWalletKey:(id)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = (id)objc_msgSend(v5, "hf_fetchWalletKeyDeviceStateForCurrentDevice");
  id v7 = [(HFItemManager *)self batchedDelegateAdapterAllowingReads];
  id v8 = objc_msgSend(MEMORY[0x263EFFA08], "na_setWithSafeObject:", v5);
  id v9 = [(HFItemManager *)self _itemsToUpdateForModifiedMetadataForHomes:v8];
  v12[0] = @"accessory";
  id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
  id v11 = (id)[v7 requestUpdateForItems:v9 itemProviderInvalidationReasons:v10 modifiedHome:v5 senderSelector:a2];
}

- (void)homeDidRemoveWalletKey:(id)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = (id)objc_msgSend(v5, "hf_fetchWalletKeyDeviceStateForCurrentDevice");
  id v7 = [(HFItemManager *)self batchedDelegateAdapterAllowingReads];
  id v8 = [MEMORY[0x263EFFA08] setWithObject:v5];
  id v9 = [(HFItemManager *)self _itemsToUpdateForModifiedMetadataForHomes:v8];
  v12[0] = @"accessory";
  id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
  id v11 = (id)[v7 requestUpdateForItems:v9 itemProviderInvalidationReasons:v10 modifiedHome:v5 senderSelector:a2];
}

- (void)homeDidUpdateToROAR:(id)a3
{
  v11[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  id v7 = objc_msgSend(MEMORY[0x263EFFA08], "na_setWithSafeObject:", v5);
  id v8 = [(HFItemManager *)self _itemsToUpdateForModifiedMetadataForHomes:v7];
  v11[0] = @"home";
  id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
  id v10 = (id)[v6 requestUpdateForItems:v8 itemProviderInvalidationReasons:v9 modifiedHome:v5 senderSelector:a2];
}

- (void)homeDidUpdateSoundCheck:(id)a3
{
  id v9 = a3;
  id v5 = [(HFItemManager *)self batchedDelegateAdapterAllowingReads];
  id v6 = [MEMORY[0x263EFFA08] setWithObject:v9];
  id v7 = [(HFItemManager *)self _itemsToUpdateForModifiedMetadataForHomes:v6];
  id v8 = (id)[v5 requestUpdateForItems:v7 itemProviderInvalidationReasons:MEMORY[0x263EFFA68] modifiedHome:v9 senderSelector:a2];
}

- (void)home:(id)a3 didUpdateAudioAnalysisClassifierOptions:(unint64_t)a4
{
  id v10 = a3;
  id v6 = [(HFItemManager *)self batchedDelegateAdapterAllowingReads];
  id v7 = [MEMORY[0x263EFFA08] setWithObject:v10];
  id v8 = [(HFItemManager *)self _itemsToUpdateForModifiedMetadataForHomes:v7];
  id v9 = (id)[v6 requestUpdateForItems:v8 itemProviderInvalidationReasons:MEMORY[0x263EFFA68] modifiedHome:v10 senderSelector:a2];
}

- (void)home:(id)a3 didUpdateOnboardAudioAnalysis:(BOOL)a4
{
  id v10 = a3;
  id v6 = [(HFItemManager *)self batchedDelegateAdapterAllowingReads];
  id v7 = [MEMORY[0x263EFFA08] setWithObject:v10];
  id v8 = [(HFItemManager *)self _itemsToUpdateForModifiedMetadataForHomes:v7];
  id v9 = (id)[v6 requestUpdateForItems:v8 itemProviderInvalidationReasons:MEMORY[0x263EFFA68] modifiedHome:v10 senderSelector:a2];
}

- (void)home:(id)a3 didUpdateAreBulletinNotificationsSupported:(BOOL)a4
{
  id v10 = a3;
  id v6 = [(HFItemManager *)self batchedDelegateAdapterAllowingReads];
  id v7 = objc_msgSend(MEMORY[0x263EFFA08], "na_setWithSafeObject:", v10);
  id v8 = [(HFItemManager *)self _itemsToUpdateForModifiedMetadataForHomes:v7];
  id v9 = (id)[v6 requestUpdateForItems:v8 itemProviderInvalidationReasons:MEMORY[0x263EFFA68] modifiedHome:v10 senderSelector:a2];
}

- (void)home:(id)a3 didUpdateSiriTriggerPhraseOptions:(unint64_t)a4
{
  v12[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [(HFItemManager *)self batchedDelegateAdapterAllowingReads];
  id v8 = [MEMORY[0x263EFFA08] setWithObject:v6];
  id v9 = [(HFItemManager *)self _itemsToUpdateForModifiedMetadataForHomes:v8];
  v12[0] = @"home";
  id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
  id v11 = (id)[v7 requestUpdateForItems:v9 itemProviderInvalidationReasons:v10 modifiedHome:v6 senderSelector:a2];
}

- (void)home:(id)a3 didUpdateSiriPhraseOptions:(unint64_t)a4
{
  id v10 = a3;
  id v6 = [(HFItemManager *)self batchedDelegateAdapterAllowingReads];
  id v7 = [MEMORY[0x263EFFA08] setWithObject:v10];
  id v8 = [(HFItemManager *)self _itemsToUpdateForModifiedMetadataForHomes:v7];
  id v9 = (id)[v6 requestUpdateForItems:v8 itemProviderInvalidationReasons:MEMORY[0x263EFFA68] modifiedHome:v10 senderSelector:a2];
}

- (void)accessoryDidUpdateName:(id)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  id v7 = objc_msgSend(MEMORY[0x263EFFA08], "na_setWithSafeObject:", v5);
  id v8 = [(HFItemManager *)self _itemsToUpdateForModifiedAccessories:v7];
  v12[0] = @"accessory";
  id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
  id v10 = [v5 home];

  id v11 = (id)[v6 requestUpdateForItems:v8 itemProviderInvalidationReasons:v9 modifiedHome:v10 senderSelector:a2];
}

- (void)accessory:(id)a3 didUpdateNameForService:(id)a4
{
  v15[1] = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a3;
  id v9 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  id v10 = objc_msgSend(MEMORY[0x263EFFA08], "na_setWithSafeObject:", v7);

  id v11 = [(HFItemManager *)self _itemsToUpdateForModifiedServices:v10];
  v15[0] = @"service";
  id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
  id v13 = [v8 home];

  id v14 = (id)[v9 requestUpdateForItems:v11 itemProviderInvalidationReasons:v12 modifiedHome:v13 senderSelector:a2];
}

- (void)accessory:(id)a3 didUpdateAssociatedServiceTypeForService:(id)a4
{
  v15[1] = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a3;
  id v9 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  id v10 = objc_msgSend(MEMORY[0x263EFFA08], "na_setWithSafeObject:", v7);

  id v11 = [(HFItemManager *)self _itemsToUpdateForModifiedServices:v10];
  v15[0] = @"service";
  id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
  id v13 = [v8 home];

  id v14 = (id)[v9 requestUpdateForItems:v11 itemProviderInvalidationReasons:v12 modifiedHome:v13 senderSelector:a2];
}

- (void)accessoryDidUpdateServices:(id)a3
{
  void v14[2] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = [v5 home];
  id v7 = objc_msgSend(v6, "hf_characteristicValueManager");
  [v7 invalidateCachedValuesForAccessory:v5];

  id v8 = [(HFItemManager *)self batchedDelegateAdapterAllowingReads];
  id v9 = objc_msgSend(MEMORY[0x263EFFA08], "na_setWithSafeObject:", v5);
  id v10 = [(HFItemManager *)self _itemsToUpdateForModifiedAccessories:v9];
  v14[0] = @"service";
  v14[1] = @"accessory";
  id v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:2];
  id v12 = [v5 home];

  id v13 = (id)[v8 requestUpdateForItems:v10 itemProviderInvalidationReasons:v11 modifiedHome:v12 senderSelector:a2];
}

- (void)accessoryDidUpdateReachability:(id)a3
{
  id v14 = a3;
  id v5 = [v14 home];
  id v6 = [(HFItemManager *)self home];

  if (v5 == v6)
  {
    if (!objc_msgSend(v14, "hf_supportsSuspendedState") || (objc_msgSend(v14, "isReachable") & 1) == 0)
    {
      id v7 = [v14 home];
      id v8 = objc_msgSend(v7, "hf_characteristicValueManager");
      [v8 invalidateCachedValuesForAccessory:v14];
    }
    id v9 = [(HFItemManager *)self batchedDelegateAdapterAllowingReads];
    id v10 = objc_msgSend(MEMORY[0x263EFFA08], "na_setWithSafeObject:", v14);
    id v11 = [(HFItemManager *)self _itemsToUpdateForModifiedAccessories:v10];
    id v12 = [v14 home];
    id v13 = (id)[v9 requestUpdateForItems:v11 itemProviderInvalidationReasons:MEMORY[0x263EFFA68] modifiedHome:v12 senderSelector:a2];
  }
}

- (void)accessoryDidUpdateReachableTransports:(id)a3
{
  id v12 = a3;
  id v5 = [v12 home];
  id v6 = [(HFItemManager *)self home];

  if (v5 == v6)
  {
    id v7 = [(HFItemManager *)self batchedDelegateAdapterAllowingReads];
    id v8 = objc_msgSend(MEMORY[0x263EFFA08], "na_setWithSafeObject:", v12);
    id v9 = [(HFItemManager *)self _itemsToUpdateForModifiedAccessories:v8];
    id v10 = [v12 home];
    id v11 = (id)[v7 requestUpdateForItems:v9 itemProviderInvalidationReasons:MEMORY[0x263EFFA68] modifiedHome:v10 senderSelector:a2];
  }
}

- (void)accessory:(id)a3 service:(id)a4 didUpdateValueForCharacteristic:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __85__HFItemManager_HomeKitDelegates__accessory_service_didUpdateValueForCharacteristic___block_invoke;
  aBlock[3] = &unk_264091880;
  objc_copyWeak(v25, &location);
  v25[1] = (id)a2;
  id v12 = (void (**)(void *, HFMessageBatcher *))_Block_copy(aBlock);
  id v13 = [v11 value];

  if (v13)
  {
    id v14 = [v9 home];
    uint64_t v15 = objc_msgSend(v14, "hf_characteristicValueManager");
    [v15 invalidateCachedErrorForCharacteristic:v11];
  }
  id v16 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  int v17 = [v16 hasUncommittedBatchingReasons];

  if (v17)
  {
    objc_msgSend(MEMORY[0x263EFFA08], "na_setWithSafeObject:", v11);
    char v18 = (HFMessageBatcher *)objc_claimAutoreleasedReturnValue();
    v12[2](v12, v18);
  }
  else
  {
    objc_getAssociatedObject(self, "accessory:service:didUpdateValueForCharacteristic:-batcher");
    char v18 = (HFMessageBatcher *)objc_claimAutoreleasedReturnValue();
    if (!v18)
    {
      id v19 = NSString;
      uint64_t v20 = (objc_class *)objc_opt_class();
      uint64_t v21 = NSStringFromClass(v20);
      long long v22 = NSStringFromSelector(a2);
      long long v23 = [v19 stringWithFormat:@"%@.%@", v21, v22];

      char v18 = [[HFMessageBatcher alloc] initWithIdentifier:v23 batchingInterval:v12 block:0.05];
      objc_setAssociatedObject(self, "accessory:service:didUpdateValueForCharacteristic:-batcher", v18, (void *)1);
    }
    [(HFMessageBatcher *)v18 batchObject:v11];
  }

  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
}

void __85__HFItemManager_HomeKitDelegates__accessory_service_didUpdateValueForCharacteristic___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = [WeakRetained _itemsToUpdateForModifiedCharacteristics:v3];
  id v6 = objc_msgSend(v3, "na_map:", &__block_literal_global_10_1);
  if ([v6 count] != 1)
  {
    id v7 = NSStringFromSelector(*(SEL *)(a1 + 40));
    NSLog(&cfstr_ExpectedExactl.isa, v7, v3);
  }
  id v8 = [v6 anyObject];
  if (+[HFUtilities hasInternalDiagnostics])
  {
    id v9 = HFLogForCategory(0x2AuLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = objc_msgSend(v8, "hf_prettyDescription");
      *(_DWORD *)buf = 138413058;
      id v14 = WeakRetained;
      __int16 v15 = 2112;
      id v16 = v5;
      __int16 v17 = 2112;
      id v18 = v3;
      __int16 v19 = 2112;
      uint64_t v20 = v10;
      _os_log_impl(&dword_20B986000, v9, OS_LOG_TYPE_DEFAULT, "Requesting %@ to update items %@ for characteristic updates %@ for home: %@", buf, 0x2Au);
    }
  }
  id v11 = [WeakRetained batchedDelegateAdapterDisallowingReads];
  id v12 = (id)[v11 requestUpdateForItems:v5 itemProviderInvalidationReasons:MEMORY[0x263EFFA68] modifiedHome:v8 senderSelector:*(void *)(a1 + 40)];
}

id __85__HFItemManager_HomeKitDelegates__accessory_service_didUpdateValueForCharacteristic___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = [a2 service];
  id v3 = [v2 home];

  return v3;
}

- (void)accessoryDidUpdateApplicationData:(id)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  id v7 = objc_msgSend(MEMORY[0x263EFFA08], "na_setWithSafeObject:", v5);
  id v8 = [(HFItemManager *)self _itemsToUpdateForModifiedAccessories:v7];
  v12[0] = @"accessory";
  id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
  id v10 = [v5 home];

  id v11 = (id)[v6 requestUpdateForItems:v8 itemProviderInvalidationReasons:v9 modifiedHome:v10 senderSelector:a2];
}

- (void)accessoryDidUpdateCalibrationStatus:(id)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  id v7 = objc_msgSend(MEMORY[0x263EFFA08], "na_setWithSafeObject:", v5);
  id v8 = [(HFItemManager *)self _itemsToUpdateForModifiedAccessories:v7];
  v12[0] = @"accessory";
  id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
  id v10 = [v5 home];

  id v11 = (id)[v6 requestUpdateForItems:v8 itemProviderInvalidationReasons:v9 modifiedHome:v10 senderSelector:a2];
}

- (void)accessory:(id)a3 didUpdateApplicationDataForService:(id)a4
{
  v15[1] = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a3;
  id v9 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  id v10 = objc_msgSend(MEMORY[0x263EFFA08], "na_setWithSafeObject:", v7);

  id v11 = [(HFItemManager *)self _itemsToUpdateForModifiedServices:v10];
  v15[0] = @"service";
  id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
  id v13 = [v8 home];

  id v14 = (id)[v9 requestUpdateForItems:v11 itemProviderInvalidationReasons:v12 modifiedHome:v13 senderSelector:a2];
}

- (void)accessoryDidUpdateAdditionalSetupRequired:(id)a3
{
  v14[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = [v5 home];
  id v7 = objc_msgSend(v6, "hf_characteristicValueManager");
  [v7 invalidateCachedValuesForAccessory:v5];

  id v8 = [(HFItemManager *)self batchedDelegateAdapterAllowingReads];
  id v9 = objc_msgSend(MEMORY[0x263EFFA08], "na_setWithSafeObject:", v5);
  id v10 = [(HFItemManager *)self _itemsToUpdateForModifiedAccessories:v9];
  v14[0] = @"accessory";
  id v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];
  id v12 = [v5 home];

  id v13 = (id)[v8 requestUpdateForItems:v10 itemProviderInvalidationReasons:v11 modifiedHome:v12 senderSelector:a2];
}

- (void)accessory:(id)a3 didUpdateHasAuthorizationDataForCharacteristic:(id)a4
{
  v17[1] = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v8 home];
  id v10 = objc_msgSend(v9, "hf_characteristicValueManager");
  [v10 invalidateCachedValuesForAccessory:v8];

  id v11 = [(HFItemManager *)self batchedDelegateAdapterAllowingReads];
  id v12 = objc_msgSend(MEMORY[0x263EFFA08], "na_setWithSafeObject:", v7);

  id v13 = [(HFItemManager *)self _itemsToUpdateForModifiedCharacteristics:v12];
  v17[0] = @"accessory";
  id v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:1];
  __int16 v15 = [v8 home];

  id v16 = (id)[v11 requestUpdateForItems:v13 itemProviderInvalidationReasons:v14 modifiedHome:v15 senderSelector:a2];
}

- (void)accessory:(id)a3 didUpdateBundleID:(id)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  id v8 = objc_msgSend(MEMORY[0x263EFFA08], "na_setWithSafeObject:", v6);
  id v9 = [(HFItemManager *)self _itemsToUpdateForModifiedAccessories:v8];
  v13[0] = @"accessory";
  id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
  id v11 = [v6 home];

  id v12 = (id)[v7 requestUpdateForItems:v9 itemProviderInvalidationReasons:v10 modifiedHome:v11 senderSelector:a2];
}

- (void)accessory:(id)a3 didUpdateStoreID:(id)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  id v8 = objc_msgSend(MEMORY[0x263EFFA08], "na_setWithSafeObject:", v6);
  id v9 = [(HFItemManager *)self _itemsToUpdateForModifiedAccessories:v8];
  v13[0] = @"accessory";
  id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
  id v11 = [v6 home];

  id v12 = (id)[v7 requestUpdateForItems:v9 itemProviderInvalidationReasons:v10 modifiedHome:v11 senderSelector:a2];
}

- (void)accessory:(id)a3 didUpdateFirmwareUpdateAvailable:(BOOL)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  id v8 = objc_msgSend(MEMORY[0x263EFFA08], "na_setWithSafeObject:", v6);
  id v9 = [(HFItemManager *)self _itemsToUpdateForModifiedAccessories:v8];
  v13[0] = @"accessory";
  id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
  id v11 = [v6 home];

  id v12 = (id)[v7 requestUpdateForItems:v9 itemProviderInvalidationReasons:v10 modifiedHome:v11 senderSelector:a2];
}

- (void)accessory:(id)a3 didUpdateFirmwareVersion:(id)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  id v8 = objc_msgSend(MEMORY[0x263EFFA08], "na_setWithSafeObject:", v6);
  id v9 = [(HFItemManager *)self _itemsToUpdateForModifiedAccessories:v8];
  v13[0] = @"accessory";
  id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
  id v11 = [v6 home];

  id v12 = (id)[v7 requestUpdateForItems:v9 itemProviderInvalidationReasons:v10 modifiedHome:v11 senderSelector:a2];
}

- (void)accessory:(id)a3 didUpdateSoftwareVersion:(id)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  id v8 = objc_msgSend(MEMORY[0x263EFFA08], "na_setWithSafeObject:", v6);
  id v9 = [(HFItemManager *)self _itemsToUpdateForModifiedAccessories:v8];
  v13[0] = @"accessory";
  id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
  id v11 = [v6 home];

  id v12 = (id)[v7 requestUpdateForItems:v9 itemProviderInvalidationReasons:v10 modifiedHome:v11 senderSelector:a2];
}

- (void)accessory:(id)a3 didUpdateLoggedInAccount:(id)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  id v8 = objc_msgSend(MEMORY[0x263EFFA08], "na_setWithSafeObject:", v6);
  id v9 = [(HFItemManager *)self _itemsToUpdateForModifiedAccessories:v8];
  v13[0] = @"accessory";
  id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
  id v11 = [v6 home];

  id v12 = (id)[v7 requestUpdateForItems:v9 itemProviderInvalidationReasons:v10 modifiedHome:v11 senderSelector:a2];
}

- (void)accessory:(id)a3 didAddProfile:(id)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  id v8 = objc_msgSend(MEMORY[0x263EFFA08], "na_setWithSafeObject:", v6);
  id v9 = [(HFItemManager *)self _itemsToUpdateForModifiedAccessories:v8];
  v13[0] = @"accessory";
  id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
  id v11 = [v6 home];

  id v12 = (id)[v7 requestUpdateForItems:v9 itemProviderInvalidationReasons:v10 modifiedHome:v11 senderSelector:a2];
}

- (void)accessory:(id)a3 didRemoveProfile:(id)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  id v8 = objc_msgSend(MEMORY[0x263EFFA08], "na_setWithSafeObject:", v6);
  id v9 = [(HFItemManager *)self _itemsToUpdateForModifiedAccessories:v8];
  v13[0] = @"accessory";
  id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
  id v11 = [v6 home];

  id v12 = (id)[v7 requestUpdateForItems:v9 itemProviderInvalidationReasons:v10 modifiedHome:v11 senderSelector:a2];
}

- (void)accessoryDidUpdateControllable:(id)a3
{
  id v5 = a3;
  objc_getAssociatedObject(self, "accessoryDidUpdateControllable-batcher");
  id v6 = (HFMessageBatcher *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_initWeak(&location, self);
    id v7 = NSString;
    id v8 = (objc_class *)objc_opt_class();
    id v9 = NSStringFromClass(v8);
    id v10 = NSStringFromSelector(a2);
    id v11 = [v7 stringWithFormat:@"%@.%@", v9, v10];

    id v12 = [HFMessageBatcher alloc];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    void v13[2] = __66__HFItemManager_HomeKitDelegates__accessoryDidUpdateControllable___block_invoke;
    v13[3] = &unk_264091880;
    objc_copyWeak(v14, &location);
    v14[1] = (id)a2;
    id v6 = [(HFMessageBatcher *)v12 initWithIdentifier:v11 batchingInterval:v13 block:0.05];
    objc_setAssociatedObject(self, "accessoryDidUpdateControllable-batcher", v6, (void *)1);
    objc_destroyWeak(v14);

    objc_destroyWeak(&location);
  }
  [(HFMessageBatcher *)v6 batchObject:v5];
}

void __66__HFItemManager_HomeKitDelegates__accessoryDidUpdateControllable___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 32);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  id v5 = [WeakRetained batchedDelegateAdapterDisallowingReads];
  id v6 = [WeakRetained _itemsToUpdateForModifiedAccessories:v4];
  id v7 = [v4 anyObject];

  id v8 = [v7 home];
  id v9 = (id)[v5 requestUpdateForItems:v6 itemProviderInvalidationReasons:MEMORY[0x263EFFA68] modifiedHome:v8 senderSelector:*(void *)(a1 + 40)];
}

- (void)accessory:(id)a3 didUpdateConfiguredNameForService:(id)a4
{
  v15[1] = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a3;
  id v9 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  id v10 = objc_msgSend(MEMORY[0x263EFFA08], "na_setWithSafeObject:", v7);

  id v11 = [(HFItemManager *)self _itemsToUpdateForModifiedServices:v10];
  v15[0] = @"service";
  id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
  id v13 = [v8 home];

  id v14 = (id)[v9 requestUpdateForItems:v11 itemProviderInvalidationReasons:v12 modifiedHome:v13 senderSelector:a2];
}

- (void)accessory:(id)a3 didUpdateDefaultNameForService:(id)a4
{
  v15[1] = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a3;
  id v9 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  id v10 = objc_msgSend(MEMORY[0x263EFFA08], "na_setWithSafeObject:", v7);

  id v11 = [(HFItemManager *)self _itemsToUpdateForModifiedServices:v10];
  v15[0] = @"service";
  id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
  id v13 = [v8 home];

  id v14 = (id)[v9 requestUpdateForItems:v11 itemProviderInvalidationReasons:v12 modifiedHome:v13 senderSelector:a2];
}

- (void)accessory:(id)a3 didUpdateServiceSubtypeForService:(id)a4
{
  v15[1] = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a3;
  id v9 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  id v10 = objc_msgSend(MEMORY[0x263EFFA08], "na_setWithSafeObject:", v7);

  id v11 = [(HFItemManager *)self _itemsToUpdateForModifiedServices:v10];
  v15[0] = @"service";
  id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
  id v13 = [v8 home];

  id v14 = (id)[v9 requestUpdateForItems:v11 itemProviderInvalidationReasons:v12 modifiedHome:v13 senderSelector:a2];
}

- (void)accessory:(id)a3 didUpdateConfigurationStateForService:(id)a4
{
  v15[1] = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a3;
  id v9 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  id v10 = objc_msgSend(MEMORY[0x263EFFA08], "na_setWithSafeObject:", v7);

  id v11 = [(HFItemManager *)self _itemsToUpdateForModifiedServices:v10];
  v15[0] = @"service";
  id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
  id v13 = [v8 home];

  id v14 = (id)[v9 requestUpdateForItems:v11 itemProviderInvalidationReasons:v12 modifiedHome:v13 senderSelector:a2];
}

- (void)accessory:(id)a3 didAddSymptomsHandler:(id)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  id v8 = objc_msgSend(MEMORY[0x263EFFA08], "na_setWithSafeObject:", v6);
  id v9 = [(HFItemManager *)self _itemsToUpdateForModifiedAccessories:v8];
  v13[0] = @"accessory";
  id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
  id v11 = [v6 home];

  id v12 = (id)[v7 requestUpdateForItems:v9 itemProviderInvalidationReasons:v10 modifiedHome:v11 senderSelector:a2];
}

- (void)accessoryDidRemoveSymptomsHandler:(id)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  id v7 = objc_msgSend(MEMORY[0x263EFFA08], "na_setWithSafeObject:", v5);
  id v8 = [(HFItemManager *)self _itemsToUpdateForModifiedAccessories:v7];
  v12[0] = @"accessory";
  id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
  id v10 = [v5 home];

  id v11 = (id)[v6 requestUpdateForItems:v8 itemProviderInvalidationReasons:v9 modifiedHome:v10 senderSelector:a2];
}

- (void)accessoryDidUpdateTargetControlSupport:(id)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  id v7 = objc_msgSend(MEMORY[0x263EFFA08], "na_setWithSafeObject:", v5);
  id v8 = [(HFItemManager *)self _itemsToUpdateForModifiedAccessories:v7];
  v12[0] = @"accessory";
  id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
  id v10 = [v5 home];

  id v11 = (id)[v6 requestUpdateForItems:v8 itemProviderInvalidationReasons:v9 modifiedHome:v10 senderSelector:a2];
}

- (void)accessory:(id)a3 didAddControlTarget:(id)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  id v8 = objc_msgSend(MEMORY[0x263EFFA08], "na_setWithSafeObject:", v6);
  id v9 = [(HFItemManager *)self _itemsToUpdateForModifiedAccessories:v8];
  v13[0] = @"accessory";
  id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
  id v11 = [v6 home];

  id v12 = (id)[v7 requestUpdateForItems:v9 itemProviderInvalidationReasons:v10 modifiedHome:v11 senderSelector:a2];
}

- (void)accessory:(id)a3 didRemoveControlTarget:(id)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  id v8 = objc_msgSend(MEMORY[0x263EFFA08], "na_setWithSafeObject:", v6);
  id v9 = [(HFItemManager *)self _itemsToUpdateForModifiedAccessories:v8];
  v13[0] = @"accessory";
  id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
  id v11 = [v6 home];

  id v12 = (id)[v7 requestUpdateForItems:v9 itemProviderInvalidationReasons:v10 modifiedHome:v11 senderSelector:a2];
}

- (void)home:(id)a3 didUpdateReprovisionStateForAccessory:(id)a4
{
  v16[1] = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = [v6 home];
  id v8 = [(HFItemManager *)self home];
  int v9 = [v7 isEqual:v8];

  if (v9)
  {
    id v10 = [(HFItemManager *)self batchedDelegateAdapterAllowingReads];
    id v11 = objc_msgSend(MEMORY[0x263EFFA08], "na_setWithSafeObject:", v6);
    id v12 = [(HFItemManager *)self _itemsToUpdateForModifiedAccessories:v11];
    v16[0] = @"accessory";
    id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:1];
    id v14 = [v6 home];
    id v15 = (id)[v10 requestUpdateForItems:v12 itemProviderInvalidationReasons:v13 modifiedHome:v14 senderSelector:a2];
  }
}

- (void)accessory:(id)a3 didUpdateLastKnownSleepDiscoveryModeForService:(id)a4
{
  v15[1] = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a3;
  int v9 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  id v10 = objc_msgSend(MEMORY[0x263EFFA08], "na_setWithSafeObject:", v7);

  id v11 = [(HFItemManager *)self _itemsToUpdateForModifiedServices:v10];
  v15[0] = @"service";
  id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
  id v13 = [v8 home];

  id v14 = (id)[v9 requestUpdateForItems:v11 itemProviderInvalidationReasons:v12 modifiedHome:v13 senderSelector:a2];
}

- (void)accessoryDidUpdateAudioDestinationController:(id)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  id v7 = objc_msgSend(MEMORY[0x263EFFA08], "na_setWithSafeObject:", v5);
  id v8 = [(HFItemManager *)self _itemsToUpdateForModifiedAccessories:v7];
  v12[0] = @"accessory";
  int v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
  id v10 = [v5 home];

  id v11 = (id)[v6 requestUpdateForItems:v8 itemProviderInvalidationReasons:v9 modifiedHome:v10 senderSelector:a2];
}

- (void)accessoryDidUpdateAudioDestination:(id)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  id v7 = objc_msgSend(MEMORY[0x263EFFA08], "na_setWithSafeObject:", v5);
  id v8 = [(HFItemManager *)self _itemsToUpdateForModifiedAccessories:v7];
  v12[0] = @"accessory";
  int v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
  id v10 = [v5 home];

  id v11 = (id)[v6 requestUpdateForItems:v8 itemProviderInvalidationReasons:v9 modifiedHome:v10 senderSelector:a2];
}

- (void)accessory:(id)a3 didUpdateLastKnownOperatingStateResponseForService:(id)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  id v8 = objc_msgSend(MEMORY[0x263EFFA08], "na_setWithSafeObject:", v6);
  int v9 = [(HFItemManager *)self _itemsToUpdateForModifiedAccessories:v8];
  v13[0] = @"accessory";
  id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
  id v11 = [v6 home];

  id v12 = (id)[v7 requestUpdateForItems:v9 itemProviderInvalidationReasons:v10 modifiedHome:v11 senderSelector:a2];
}

- (void)accessoryDidUpdatePreferredMediaUser:(id)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  id v7 = objc_msgSend(MEMORY[0x263EFFA08], "na_setWithSafeObject:", v5);
  id v8 = [(HFItemManager *)self _itemsToUpdateForModifiedAccessories:v7];
  v12[0] = @"accessory";
  int v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
  id v10 = [v5 home];

  id v11 = (id)[v6 requestUpdateForItems:v8 itemProviderInvalidationReasons:v9 modifiedHome:v10 senderSelector:a2];
}

- (void)accessory:(id)a3 didUpdateUserNotifiedOfSoftwareUpdate:(BOOL)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  id v8 = objc_msgSend(MEMORY[0x263EFFA08], "na_setWithSafeObject:", v6);
  int v9 = [(HFItemManager *)self _itemsToUpdateForModifiedAccessories:v8];
  v13[0] = @"accessory";
  id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
  id v11 = [v6 home];

  id v12 = (id)[v7 requestUpdateForItems:v9 itemProviderInvalidationReasons:v10 modifiedHome:v11 senderSelector:a2];
}

- (void)accessory:(id)a3 didUpdateSupportsWalletKey:(BOOL)a4
{
  id v6 = a3;
  id v11 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  id v7 = objc_msgSend(MEMORY[0x263EFFA08], "na_setWithSafeObject:", v6);
  id v8 = [(HFItemManager *)self _itemsToUpdateForModifiedAccessories:v7];
  int v9 = [v6 home];

  id v10 = (id)[v11 requestUpdateForItems:v8 itemProviderInvalidationReasons:MEMORY[0x263EFFA68] modifiedHome:v9 senderSelector:a2];
}

- (void)accessoryDidUpdatePendingConfigurationIdentifier:(id)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  id v7 = objc_msgSend(MEMORY[0x263EFFA08], "na_setWithSafeObject:", v5);
  id v8 = [(HFItemManager *)self _itemsToUpdateForModifiedAccessories:v7];
  v12[0] = @"accessory";
  int v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
  id v10 = [v5 home];

  id v11 = (id)[v6 requestUpdateForItems:v8 itemProviderInvalidationReasons:v9 modifiedHome:v10 senderSelector:a2];
}

- (void)accessoryDidUpdateDiagnosticsTransferSupport:(id)a3
{
  id v5 = a3;
  id v10 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  id v6 = objc_msgSend(MEMORY[0x263EFFA08], "na_setWithSafeObject:", v5);
  id v7 = [(HFItemManager *)self _itemsToUpdateForModifiedAccessories:v6];
  id v8 = [v5 home];

  id v9 = (id)[v10 requestUpdateForItems:v7 itemProviderInvalidationReasons:MEMORY[0x263EFFA68] modifiedHome:v8 senderSelector:a2];
}

- (void)residentDevice:(id)a3 didUpdateName:(id)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  id v8 = objc_msgSend(MEMORY[0x263EFFA08], "na_setWithSafeObject:", v6);
  id v9 = [(HFItemManager *)self _itemsToUpdateForModifiedResidentDevices:v8];
  v13[0] = @"residentDevice";
  id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
  id v11 = [v6 home];

  id v12 = (id)[v7 requestUpdateForItems:v9 itemProviderInvalidationReasons:v10 modifiedHome:v11 senderSelector:a2];
}

- (void)residentDevice:(id)a3 didUpdateCapabilities:(unint64_t)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  id v8 = objc_msgSend(MEMORY[0x263EFFA08], "na_setWithSafeObject:", v6);
  id v9 = [(HFItemManager *)self _itemsToUpdateForModifiedResidentDevices:v8];
  v13[0] = @"residentDevice";
  id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
  id v11 = [v6 home];

  id v12 = (id)[v7 requestUpdateForItems:v9 itemProviderInvalidationReasons:v10 modifiedHome:v11 senderSelector:a2];
}

- (void)residentDevice:(id)a3 didUpdateEnabled:(BOOL)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  id v8 = objc_msgSend(MEMORY[0x263EFFA08], "na_setWithSafeObject:", v6);
  id v9 = [(HFItemManager *)self _itemsToUpdateForModifiedResidentDevices:v8];
  v13[0] = @"residentDevice";
  id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
  id v11 = [v6 home];

  id v12 = (id)[v7 requestUpdateForItems:v9 itemProviderInvalidationReasons:v10 modifiedHome:v11 senderSelector:a2];
}

- (void)residentDevice:(id)a3 didUpdateStatus:(unint64_t)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  id v8 = objc_msgSend(MEMORY[0x263EFFA08], "na_setWithSafeObject:", v6);
  id v9 = [(HFItemManager *)self _itemsToUpdateForModifiedResidentDevices:v8];
  v13[0] = @"residentDevice";
  id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
  id v11 = [v6 home];

  id v12 = (id)[v7 requestUpdateForItems:v9 itemProviderInvalidationReasons:v10 modifiedHome:v11 senderSelector:a2];
}

- (void)cameraSnapshotControlDidUpdateMostRecentSnapshot:(id)a3
{
  id v11 = [(HFItemManager *)self _cameraForCameraControl:a3];
  id v5 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  id v6 = objc_msgSend(MEMORY[0x263EFFA08], "na_setWithSafeObject:", v11);
  id v7 = [(HFItemManager *)self _itemsToUpdateForModifiedCameras:v6];
  id v8 = [v11 accessory];
  id v9 = [v8 home];
  id v10 = (id)[v5 requestUpdateForItems:v7 itemProviderInvalidationReasons:MEMORY[0x263EFFA68] modifiedHome:v9 senderSelector:a2];
}

- (void)cameraStreamControlDidStartStream:(id)a3
{
  id v11 = [(HFItemManager *)self _cameraForCameraControl:a3];
  id v5 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  id v6 = objc_msgSend(MEMORY[0x263EFFA08], "na_setWithSafeObject:", v11);
  id v7 = [(HFItemManager *)self _itemsToUpdateForModifiedCameras:v6];
  id v8 = [v11 accessory];
  id v9 = [v8 home];
  id v10 = (id)[v5 requestUpdateForItems:v7 itemProviderInvalidationReasons:MEMORY[0x263EFFA68] modifiedHome:v9 senderSelector:a2];
}

- (void)cameraStreamControl:(id)a3 didStopStreamWithError:(id)a4
{
  -[HFItemManager _cameraForCameraControl:](self, "_cameraForCameraControl:", a3, a4);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  id v7 = objc_msgSend(MEMORY[0x263EFFA08], "na_setWithSafeObject:", v12);
  id v8 = [(HFItemManager *)self _itemsToUpdateForModifiedCameras:v7];
  id v9 = [v12 accessory];
  id v10 = [v9 home];
  id v11 = (id)[v6 requestUpdateForItems:v8 itemProviderInvalidationReasons:MEMORY[0x263EFFA68] modifiedHome:v10 senderSelector:a2];
}

- (void)cameraStreamControlDidUpdateStreamState:(id)a3
{
  id v11 = [(HFItemManager *)self _cameraForCameraControl:a3];
  id v5 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  id v6 = objc_msgSend(MEMORY[0x263EFFA08], "na_setWithSafeObject:", v11);
  id v7 = [(HFItemManager *)self _itemsToUpdateForModifiedCameras:v6];
  id v8 = [v11 accessory];
  id v9 = [v8 home];
  id v10 = (id)[v5 requestUpdateForItems:v7 itemProviderInvalidationReasons:MEMORY[0x263EFFA68] modifiedHome:v9 senderSelector:a2];
}

- (void)cameraStreamControlDidUpdateManagerState:(id)a3
{
  id v11 = [(HFItemManager *)self _cameraForCameraControl:a3];
  id v5 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  id v6 = objc_msgSend(MEMORY[0x263EFFA08], "na_setWithSafeObject:", v11);
  id v7 = [(HFItemManager *)self _itemsToUpdateForModifiedCameras:v6];
  id v8 = [v11 accessory];
  id v9 = [v8 home];
  id v10 = (id)[v5 requestUpdateForItems:v7 itemProviderInvalidationReasons:MEMORY[0x263EFFA68] modifiedHome:v9 senderSelector:a2];
}

- (void)cameraStream:(id)a3 didUpdateAudioStreamSettingWithError:(id)a4
{
  -[HFItemManager _cameraForCameraStream:](self, "_cameraForCameraStream:", a3, a4);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  id v7 = objc_msgSend(MEMORY[0x263EFFA08], "na_setWithSafeObject:", v12);
  id v8 = [(HFItemManager *)self _itemsToUpdateForModifiedCameras:v7];
  id v9 = [v12 accessory];
  id v10 = [v9 home];
  id v11 = (id)[v6 requestUpdateForItems:v8 itemProviderInvalidationReasons:MEMORY[0x263EFFA68] modifiedHome:v10 senderSelector:a2];
}

- (void)cameraUserSettingsDidUpdate:(id)a3
{
  id v11 = [(HFItemManager *)self _cameraForUserSettings:a3];
  id v5 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  id v6 = objc_msgSend(MEMORY[0x263EFFA08], "na_setWithSafeObject:", v11);
  id v7 = [(HFItemManager *)self _itemsToUpdateForModifiedCameras:v6];
  id v8 = [v11 accessory];
  id v9 = [v8 home];
  id v10 = (id)[v5 requestUpdateForItems:v7 itemProviderInvalidationReasons:MEMORY[0x263EFFA68] modifiedHome:v9 senderSelector:a2];
}

- (void)clipManager:(id)a3 didUpdateSignificantEvents:(id)a4
{
  id v6 = a4;
  id v9 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  id v7 = [(HFItemManager *)self _itemsToUpdateForModifiedSignificantEvents:v6];

  id v8 = (id)[v9 requestUpdateForItems:v7 itemProviderInvalidationReasons:MEMORY[0x263EFFA68] modifiedHome:0 senderSelector:a2];
}

- (void)clipManager:(id)a3 didRemoveSignificantEventsWithUUIDs:(id)a4
{
  id v8 = [(HFItemManager *)self _itemsToUpdateForModifiedUUIDs:a4];
  id v6 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  id v7 = (id)[v6 requestUpdateForItems:v8 itemProviderInvalidationReasons:MEMORY[0x263EFFA68] modifiedHome:0 senderSelector:a2];
}

- (void)softwareUpdateController:(id)a3 didUpdateAvailableUpdate:(id)a4
{
  v17[1] = *MEMORY[0x263EF8340];
  id v7 = (void *)MEMORY[0x263EFFA08];
  id v8 = a4;
  id v9 = objc_msgSend(v7, "na_setWithSafeObject:", a3);
  id v10 = [(HFItemManager *)self _itemsToUpdateForModifiedSoftwareUpdateControllers:v9];
  id v11 = (void *)[v10 mutableCopy];

  id v12 = objc_msgSend(MEMORY[0x263EFFA08], "na_setWithSafeObject:", v8);

  id v13 = [(HFItemManager *)self _itemsToUpdateForModifiedSoftwareUpdates:v12];
  [v11 unionSet:v13];

  id v14 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  v17[0] = @"softwareUpdate";
  id v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:1];
  id v16 = (id)[v14 requestUpdateForItems:v11 itemProviderInvalidationReasons:v15 modifiedHome:0 senderSelector:a2];
}

- (void)softwareUpdate:(id)a3 didUpdateState:(int64_t)a4
{
  v12[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  id v8 = objc_msgSend(MEMORY[0x263EFFA08], "na_setWithSafeObject:", v6);

  id v9 = [(HFItemManager *)self _itemsToUpdateForModifiedSoftwareUpdates:v8];
  v12[0] = @"softwareUpdate";
  id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
  id v11 = (id)[v7 requestUpdateForItems:v9 itemProviderInvalidationReasons:v10 modifiedHome:0 senderSelector:a2];
}

- (void)softwareUpdate:(id)a3 didUpdateDocumentation:(id)a4
{
  v12[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  id v8 = objc_msgSend(MEMORY[0x263EFFA08], "na_setWithSafeObject:", v6);

  id v9 = [(HFItemManager *)self _itemsToUpdateForModifiedSoftwareUpdates:v8];
  v12[0] = @"softwareUpdate";
  id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
  id v11 = (id)[v7 requestUpdateForItems:v9 itemProviderInvalidationReasons:v10 modifiedHome:0 senderSelector:a2];
}

- (void)softwareUpdate:(id)a3 didUpdateDocumentationAvailable:(BOOL)a4
{
  v12[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  id v8 = objc_msgSend(MEMORY[0x263EFFA08], "na_setWithSafeObject:", v6);

  id v9 = [(HFItemManager *)self _itemsToUpdateForModifiedSoftwareUpdates:v8];
  v12[0] = @"softwareUpdate";
  id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
  id v11 = (id)[v7 requestUpdateForItems:v9 itemProviderInvalidationReasons:v10 modifiedHome:0 senderSelector:a2];
}

- (void)softwareUpdate:(id)a3 didUpdateNeedsAttentionReasons:(unint64_t)a4
{
  v12[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  id v8 = objc_msgSend(MEMORY[0x263EFFA08], "na_setWithSafeObject:", v6);

  id v9 = [(HFItemManager *)self _itemsToUpdateForModifiedSoftwareUpdates:v8];
  v12[0] = @"softwareUpdate";
  id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
  id v11 = (id)[v7 requestUpdateForItems:v9 itemProviderInvalidationReasons:v10 modifiedHome:0 senderSelector:a2];
}

- (void)softwareUpdateV2DidUpdateForAccessory:(id)a3
{
  v9[1] = *MEMORY[0x263EF8340];
  id v5 = [(HFItemManager *)self _itemsToUpdateForSoftwareUpdateV2ChangeToAccessory:a3];
  id v6 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  v9[0] = @"softwareUpdate";
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];
  id v8 = (id)[v6 requestUpdateForItems:v5 itemProviderInvalidationReasons:v7 modifiedHome:0 senderSelector:a2];
}

- (void)softwareUpdateV2DidUpdateProgressForAccessory:(id)a3
{
  v9[1] = *MEMORY[0x263EF8340];
  id v5 = [(HFItemManager *)self _itemsToUpdateForSoftwareUpdateV2ProgressChangeToAccessory:a3];
  id v6 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  v9[0] = @"softwareUpdate";
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];
  id v8 = (id)[v6 requestUpdateForItems:v5 itemProviderInvalidationReasons:v7 modifiedHome:0 senderSelector:a2];
}

- (void)user:(id)a3 didUpdateAssistantAccessControl:(id)a4 forHome:(id)a5
{
  v15[1] = *MEMORY[0x263EF8340];
  id v8 = a5;
  id v9 = a3;
  id v10 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  id v11 = objc_msgSend(MEMORY[0x263EFFA08], "na_setWithSafeObject:", v9);

  id v12 = [(HFItemManager *)self _itemsToUpdateForModifiedUsers:v11];
  v15[0] = @"user";
  id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
  id v14 = (id)[v10 requestUpdateForItems:v12 itemProviderInvalidationReasons:v13 modifiedHome:v8 senderSelector:a2];
}

- (void)user:(id)a3 didUpdateMediaContentProfileAccessControl:(id)a4 forHome:(id)a5
{
  v15[1] = *MEMORY[0x263EF8340];
  id v8 = a5;
  id v9 = a3;
  id v10 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  id v11 = objc_msgSend(MEMORY[0x263EFFA08], "na_setWithSafeObject:", v9);

  id v12 = [(HFItemManager *)self _itemsToUpdateForModifiedUsers:v11];
  v15[0] = @"user";
  id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
  id v14 = (id)[v10 requestUpdateForItems:v12 itemProviderInvalidationReasons:v13 modifiedHome:v8 senderSelector:a2];
}

- (void)user:(id)a3 didUpdatePersonManagerSettings:(id)a4
{
  v11[1] = *MEMORY[0x263EF8340];
  id v6 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObject:", a3, a4);
  id v7 = [(HFItemManager *)self _itemsToUpdateForModifiedUsers:v6];

  id v8 = [(HFItemManager *)self batchedDelegateAdapterAllowingReads];
  v11[0] = @"user";
  id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
  id v10 = (id)[v8 requestUpdateForItems:v7 itemProviderInvalidationReasons:v9 modifiedHome:0 senderSelector:a2];
}

- (void)restrictedGuestAllowedPeriodStarted:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = HFLogForCategory(0x25uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = NSStringFromSelector(a2);
    id v8 = objc_msgSend(v5, "hf_prettyDescription");
    *(_DWORD *)buf = 138412802;
    id v16 = self;
    __int16 v17 = 2112;
    id v18 = v7;
    __int16 v19 = 2112;
    uint64_t v20 = v8;
    _os_log_impl(&dword_20B986000, v6, OS_LOG_TYPE_DEFAULT, "%@: %@ Restricted Guest allowed period started for user: %@.", buf, 0x20u);
  }
  id v9 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  id v10 = objc_msgSend(MEMORY[0x263EFFA08], "na_setWithSafeObject:", v5);
  id v11 = [(HFItemManager *)self _itemsToUpdateForModifiedUsers:v10];
  id v14 = @"user";
  id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v14 count:1];
  id v13 = (id)[v9 requestUpdateForItems:v11 itemProviderInvalidationReasons:v12 modifiedHome:0 senderSelector:a2];
}

- (void)restrictedGuestAllowedPeriodEnded:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = HFLogForCategory(0x25uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = NSStringFromSelector(a2);
    id v8 = objc_msgSend(v5, "hf_prettyDescription");
    *(_DWORD *)buf = 138412802;
    id v16 = self;
    __int16 v17 = 2112;
    id v18 = v7;
    __int16 v19 = 2112;
    uint64_t v20 = v8;
    _os_log_impl(&dword_20B986000, v6, OS_LOG_TYPE_DEFAULT, "%@: %@ Restricted Guest allowed period ended for user: %@.", buf, 0x20u);
  }
  id v9 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  id v10 = objc_msgSend(MEMORY[0x263EFFA08], "na_setWithSafeObject:", v5);
  id v11 = [(HFItemManager *)self _itemsToUpdateForModifiedUsers:v10];
  id v14 = @"user";
  id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v14 count:1];
  id v13 = (id)[v9 requestUpdateForItems:v11 itemProviderInvalidationReasons:v12 modifiedHome:0 senderSelector:a2];
}

- (void)settings:(id)a3 willWriteValueForSettings:(id)a4
{
  id v6 = a4;
  id v9 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  id v7 = [(HFItemManager *)self _itemsToUpdateForAccessorySettingChanges:v6];

  id v8 = (id)[v9 requestUpdateForItems:v7 itemProviderInvalidationReasons:MEMORY[0x263EFFA68] modifiedHome:0 senderSelector:a2];
}

- (void)settings:(id)a3 didWriteValueForSettings:(id)a4 failedSettings:(id)a5 homeKitObjectIdentifiers:(id)a6
{
  id v18 = a4;
  id v10 = a5;
  id v11 = a6;
  id v12 = v18;
  if (!v18)
  {
    id v12 = [MEMORY[0x263EFFA08] set];
  }
  id v19 = v12;
  id v13 = [v12 setByAddingObjectsFromSet:v10];
  id v14 = objc_msgSend(v13, "na_map:", &__block_literal_global_24_1);
  id v15 = [(HFItemManager *)self _itemsToUpdateForHomeKitKeyPaths:v14 forHomeKitObjectIdentifiers:v11];
  id v16 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  id v17 = (id)[v16 requestUpdateForItems:v15 itemProviderInvalidationReasons:MEMORY[0x263EFFA68] modifiedHome:0 senderSelector:a2];
}

uint64_t __109__HFItemManager_HomeKitDelegates__settings_didWriteValueForSettings_failedSettings_homeKitObjectIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  return [a2 keyPath];
}

- (void)symptomsHandler:(id)a3 didUpdateSymptoms:(id)a4
{
  void v15[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [(HFItemManager *)self home];
  id v8 = objc_msgSend(v7, "hf_accessoryForSymptomsHandler:", v6);

  id v9 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  id v10 = objc_msgSend(MEMORY[0x263EFFA08], "na_setWithSafeObject:", v8);
  id v11 = [(HFItemManager *)self _itemsToUpdateForModifiedAccessories:v10];
  v15[0] = @"mediaSystem";
  v15[1] = @"accessory";
  id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:2];
  id v13 = [v8 home];
  id v14 = (id)[v9 requestUpdateForItems:v11 itemProviderInvalidationReasons:v12 modifiedHome:v13 senderSelector:a2];
}

- (void)fixSessionDidChangeForAccessory:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = HFLogForCategory(0);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    id v13 = v5;
    _os_log_impl(&dword_20B986000, v6, OS_LOG_TYPE_DEFAULT, "HFItemManager accessory: %@", (uint8_t *)&v12, 0xCu);
  }

  id v7 = [MEMORY[0x263EFFA08] setWithObject:v5];
  id v8 = [(HFItemManager *)self _itemsToUpdateForModifiedAccessories:v7];

  id v9 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  id v10 = [v5 home];
  id v11 = (id)[v9 requestUpdateForItems:v8 itemProviderInvalidationReasons:MEMORY[0x263EFFA68] modifiedHome:v10 senderSelector:a2];
}

- (void)profileDidUpdateNetworkProtectionMode:(id)a3
{
  id v5 = a3;
  id v11 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  id v6 = objc_msgSend(MEMORY[0x263EFFA08], "na_setWithSafeObject:", v5);
  id v7 = [(HFItemManager *)self _itemsToUpdateForModifiedNetworkConfigurationProfiles:v6];
  id v8 = [v5 accessory];

  id v9 = [v8 home];
  id v10 = (id)[v11 requestUpdateForItems:v7 itemProviderInvalidationReasons:MEMORY[0x263EFFA68] modifiedHome:v9 senderSelector:a2];
}

- (void)profileDidUpdateAllowedHosts:(id)a3
{
  id v5 = a3;
  id v11 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  id v6 = objc_msgSend(MEMORY[0x263EFFA08], "na_setWithSafeObject:", v5);
  id v7 = [(HFItemManager *)self _itemsToUpdateForModifiedNetworkConfigurationProfiles:v6];
  id v8 = [v5 accessory];

  id v9 = [v8 home];
  id v10 = (id)[v11 requestUpdateForItems:v7 itemProviderInvalidationReasons:MEMORY[0x263EFFA68] modifiedHome:v9 senderSelector:a2];
}

- (void)profileDidUpdateAccessViolation:(id)a3
{
  id v5 = a3;
  id v11 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  id v6 = objc_msgSend(MEMORY[0x263EFFA08], "na_setWithSafeObject:", v5);
  id v7 = [(HFItemManager *)self _itemsToUpdateForModifiedNetworkConfigurationProfiles:v6];
  id v8 = [v5 accessory];

  id v9 = [v8 home];
  id v10 = (id)[v11 requestUpdateForItems:v7 itemProviderInvalidationReasons:MEMORY[0x263EFFA68] modifiedHome:v9 senderSelector:a2];
}

- (void)profileDidUpdateWiFiReconfigurationSupport:(id)a3
{
  id v5 = a3;
  id v11 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  id v6 = objc_msgSend(MEMORY[0x263EFFA08], "na_setWithSafeObject:", v5);
  id v7 = [(HFItemManager *)self _itemsToUpdateForModifiedNetworkConfigurationProfiles:v6];
  id v8 = [v5 accessory];

  id v9 = [v8 home];
  id v10 = (id)[v11 requestUpdateForItems:v7 itemProviderInvalidationReasons:MEMORY[0x263EFFA68] modifiedHome:v9 senderSelector:a2];
}

- (void)profileDidUpdateWiFiCredentialType:(id)a3
{
  id v5 = a3;
  id v11 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  id v6 = objc_msgSend(MEMORY[0x263EFFA08], "na_setWithSafeObject:", v5);
  id v7 = [(HFItemManager *)self _itemsToUpdateForModifiedNetworkConfigurationProfiles:v6];
  id v8 = [v5 accessory];

  id v9 = [v8 home];
  id v10 = (id)[v11 requestUpdateForItems:v7 itemProviderInvalidationReasons:MEMORY[0x263EFFA68] modifiedHome:v9 senderSelector:a2];
}

- (void)profileDidUpdateMediaSourceDisplayOrder:(id)a3
{
  id v5 = a3;
  id v11 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  id v6 = objc_msgSend(MEMORY[0x263EFFA08], "na_setWithSafeObject:", v5);
  id v7 = [(HFItemManager *)self _itemsToUpdateForTelevisionProfiles:v6];
  id v8 = [v5 accessory];

  id v9 = [v8 home];
  id v10 = (id)[v11 requestUpdateForItems:v7 itemProviderInvalidationReasons:MEMORY[0x263EFFA68] modifiedHome:v9 senderSelector:a2];
}

- (void)mediaDestinationController:(id)a3 didUpdateDestination:(id)a4
{
  id v6 = a3;
  id v10 = [(HFItemManager *)self batchedDelegateAdapterAllowingReads];
  id v7 = [MEMORY[0x263EFFA08] setWithObject:v6];

  id v8 = [(HFItemManager *)self _itemsToUpdateForModifiedMetadataForMediaDestinationController:v7];
  id v9 = (id)[v10 requestUpdateForItems:v8 itemProviderInvalidationReasons:MEMORY[0x263EFFA68] modifiedHome:0 senderSelector:a2];
}

- (void)mediaDestinationControllerDidUpdateAvailableDestinations:(id)a3
{
  id v5 = a3;
  id v9 = [(HFItemManager *)self batchedDelegateAdapterAllowingReads];
  id v6 = [MEMORY[0x263EFFA08] setWithObject:v5];

  id v7 = [(HFItemManager *)self _itemsToUpdateForModifiedMetadataForMediaDestinationController:v6];
  id v8 = (id)[v9 requestUpdateForItems:v7 itemProviderInvalidationReasons:MEMORY[0x263EFFA68] modifiedHome:0 senderSelector:a2];
}

- (void)lightProfile:(id)a3 didUpdateSettings:(id)a4
{
  id v6 = a3;
  id v12 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  id v7 = objc_msgSend(MEMORY[0x263EFFA08], "na_setWithSafeObject:", v6);
  id v8 = [(HFItemManager *)self _itemsToUpdateForLightProfiles:v7];
  id v9 = [v6 accessory];

  id v10 = [v9 home];
  id v11 = (id)[v12 requestUpdateForItems:v8 itemProviderInvalidationReasons:MEMORY[0x263EFFA68] modifiedHome:v10 senderSelector:a2];
}

- (void)home:(id)a3 willWriteValuesForCharacteristics:(id)a4
{
  id v11 = a3;
  id v7 = a4;
  id v8 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  id v9 = [(HFItemManager *)self _itemsToUpdateForModifiedCharacteristics:v7];

  id v10 = (id)[v8 requestUpdateForItems:v9 itemProviderInvalidationReasons:MEMORY[0x263EFFA68] modifiedHome:v11 senderSelector:a2];
}

- (void)home:(id)a3 willExecuteActionSets:(id)a4
{
  id v5 = [(HFItemManager *)self _itemsToUpdateForModifiedActionSets:a4];
  [(HFItemManager *)self _updateLoadingStateAndNotifyDelegateForItems:v5 canFinishTransaction:1];
}

- (void)home:(id)a3 didWriteValuesForCharacteristics:(id)a4 failedCharacteristics:(id)a5
{
  id v15 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v9)
  {
    id v9 = [MEMORY[0x263EFFA08] set];
  }
  id v11 = [v9 setByAddingObjectsFromSet:v10];
  id v12 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  id v13 = [(HFItemManager *)self _itemsToUpdateForModifiedCharacteristics:v11];
  id v14 = (id)[v12 requestUpdateForItems:v13 itemProviderInvalidationReasons:MEMORY[0x263EFFA68] modifiedHome:v15 senderSelector:a2];
}

- (void)home:(id)a3 didExecuteActionSets:(id)a4 failedActionSets:(id)a5
{
  id v15 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v9)
  {
    id v9 = [MEMORY[0x263EFFA08] set];
  }
  id v11 = [v9 setByAddingObjectsFromSet:v10];
  id v12 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  id v13 = [(HFItemManager *)self _itemsToUpdateForModifiedActionSets:v11];
  id v14 = (id)[v12 requestUpdateForItems:v13 itemProviderInvalidationReasons:MEMORY[0x263EFFA68] modifiedHome:v15 senderSelector:a2];
}

- (void)mediaSession:(id)a3 willUpdatePlaybackState:(int64_t)a4
{
  -[HFItemManager _itemsToUpdateForMediaSessionChange:](self, "_itemsToUpdateForMediaSessionChange:", a3, a4);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  id v7 = (id)[v6 requestUpdateForItems:v8 itemProviderInvalidationReasons:MEMORY[0x263EFFA68] modifiedHome:0 senderSelector:a2];
}

- (void)mediaSession:(id)a3 didUpdatePlaybackState:(int64_t)a4
{
  -[HFItemManager _itemsToUpdateForMediaSessionChange:](self, "_itemsToUpdateForMediaSessionChange:", a3, a4);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  id v7 = (id)[v6 requestUpdateForItems:v8 itemProviderInvalidationReasons:MEMORY[0x263EFFA68] modifiedHome:0 senderSelector:a2];
}

- (void)mediaSession:(id)a3 failedToUpdatePlaybackStateWithError:(id)a4
{
  -[HFItemManager _itemsToUpdateForMediaSessionChange:](self, "_itemsToUpdateForMediaSessionChange:", a3, a4);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  id v7 = (id)[v6 requestUpdateForItems:v8 itemProviderInvalidationReasons:MEMORY[0x263EFFA68] modifiedHome:0 senderSelector:a2];
}

- (void)mediaSessionDidUpdate:(id)a3
{
  id v7 = [(HFItemManager *)self _itemsToUpdateForMediaSessionChange:a3];
  id v5 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  id v6 = (id)[v5 requestUpdateForItems:v7 itemProviderInvalidationReasons:MEMORY[0x263EFFA68] modifiedHome:0 senderSelector:a2];
}

- (void)mediaObject:(id)a3 didUpdateMediaSession:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  id v9 = [(HFItemManager *)self _itemsToUpdateForMediaObjectChange:v8];
  id v10 = [(HFItemManager *)self _itemsToUpdateForMediaSessionChange:v7];

  id v14 = [v9 setByAddingObjectsFromSet:v10];

  id v11 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  id v12 = objc_msgSend(v8, "hf_home");

  id v13 = (id)[v11 requestUpdateForItems:v14 itemProviderInvalidationReasons:MEMORY[0x263EFFA68] modifiedHome:v12 senderSelector:a2];
}

- (void)mediaObject:(id)a3 didUpdateSettings:(id)a4
{
  id v7 = a3;
  id v8 = [(HFItemManager *)self _itemsToUpdateForHomeKitSettingsChange:a4];
  id v9 = [(HFItemManager *)self _itemsToUpdateForMediaObjectChange:v7];
  id v13 = [v8 setByAddingObjectsFromSet:v9];

  id v10 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  id v11 = objc_msgSend(v7, "hf_home");

  id v12 = (id)[v10 requestUpdateForItems:v13 itemProviderInvalidationReasons:MEMORY[0x263EFFA68] modifiedHome:v11 senderSelector:a2];
}

- (void)settings:(id)a3 didUpdateForIdentifier:(id)a4 keyPath:(id)a5
{
  if (a4)
  {
    id v8 = (void *)MEMORY[0x263EFFA08];
    id v9 = a4;
    id v10 = [v8 setWithObject:a5];
    id v11 = [MEMORY[0x263EFFA08] setWithObject:v9];

    id v14 = [(HFItemManager *)self _itemsToUpdateForHomeKitKeyPaths:v10 forHomeKitObjectIdentifiers:v11];

    id v12 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
    id v13 = (id)[v12 requestUpdateForItems:v14 itemProviderInvalidationReasons:MEMORY[0x263EFFA68] modifiedHome:0 senderSelector:a2];
  }
}

- (void)didReceiveSettingsUpdatesForAccessoryWithIdentifier:(id)a3 settings:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  objc_initWeak(&location, self);
  id v9 = [(HFItemManager *)self firstFastUpdateFuture];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  void v13[2] = __96__HFItemManager_HomeKitDelegates__didReceiveSettingsUpdatesForAccessoryWithIdentifier_settings___block_invoke;
  v13[3] = &unk_264091910;
  objc_copyWeak(v16, &location);
  id v10 = v8;
  id v14 = v10;
  id v11 = v7;
  id v15 = v11;
  v16[1] = (id)a2;
  id v12 = (id)[v9 addCompletionBlock:v13];

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
}

void __96__HFItemManager_HomeKitDelegates__didReceiveSettingsUpdatesForAccessoryWithIdentifier_settings___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v8 = objc_msgSend(*(id *)(a1 + 32), "na_map:", &__block_literal_global_27_1);
  uint64_t v25 = 0;
  long long v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  id v9 = [WeakRetained itemProviders];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __96__HFItemManager_HomeKitDelegates__didReceiveSettingsUpdatesForAccessoryWithIdentifier_settings___block_invoke_3;
  v21[3] = &unk_2640918E8;
  id v10 = v8;
  id v22 = v10;
  long long v24 = &v25;
  id v23 = *(id *)(a1 + 32);
  objc_msgSend(v9, "na_each:", v21);

  if (*((unsigned char *)v26 + 24))
  {
    id v11 = [MEMORY[0x263EFFA08] setWithArray:v10];
    id v12 = [MEMORY[0x263EFFA08] setWithObject:*(void *)(a1 + 40)];
    id v13 = [WeakRetained _itemsToUpdateForHomeKitKeyPaths:v11 forHomeKitObjectIdentifiers:v12];

    id v14 = HFLogForCategory(0x26uLL);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = *(void *)(a1 + 32);
      uint64_t v15 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138413058;
      uint64_t v30 = v15;
      __int16 v31 = 2112;
      uint64_t v32 = v16;
      __int16 v33 = 2112;
      id v34 = v10;
      __int16 v35 = 2112;
      uint64_t v36 = v13;
      _os_log_impl(&dword_20B986000, v14, OS_LOG_TYPE_DEFAULT, "didReceiveSettingsUpdatesForAccessoryWithIdentifier = [%@] settings = [%@] keyPaths = [%@]. Now reloading items: %@", buf, 0x2Au);
    }

    if ([v13 count])
    {
      id v17 = [WeakRetained batchedDelegateAdapterDisallowingReads];
      id v18 = (id)[v17 requestUpdateForItems:v13 itemProviderInvalidationReasons:MEMORY[0x263EFFA68] modifiedHome:0 senderSelector:*(void *)(a1 + 56)];
    }
  }
  else
  {
    id v13 = HFLogForCategory(0x26uLL);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v20 = *(void *)(a1 + 32);
      uint64_t v19 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412802;
      uint64_t v30 = v19;
      __int16 v31 = 2112;
      uint64_t v32 = v20;
      __int16 v33 = 2112;
      id v34 = v10;
      _os_log_impl(&dword_20B986000, v13, OS_LOG_TYPE_DEFAULT, "didReceiveSettingsUpdatesForAccessoryWithIdentifier = [%@] settings = [%@] keyPaths = [%@]. Not reloading items since no new data", buf, 0x20u);
    }
  }

  _Block_object_dispose(&v25, 8);
}

uint64_t __96__HFItemManager_HomeKitDelegates__didReceiveSettingsUpdatesForAccessoryWithIdentifier_settings___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 keyPath];
}

void __96__HFItemManager_HomeKitDelegates__didReceiveSettingsUpdatesForAccessoryWithIdentifier_settings___block_invoke_3(void *a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if ([v3 conformsToProtocol:&unk_26C100598]) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;
  id v6 = v5;
  if (v5 && [v5 shouldUpdateForKeyPaths:a1[4]])
  {
    id v7 = HFLogForCategory(0x26uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = a1[4];
      int v9 = 138412290;
      uint64_t v10 = v8;
      _os_log_impl(&dword_20B986000, v7, OS_LOG_TYPE_DEFAULT, "Calling HFHomeKitSettingItemProviderProtocol to check if a update is needed for [%@]", (uint8_t *)&v9, 0xCu);
    }

    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = [v3 updateSettings:a1[5]];
  }
}

- (void)updateSettingValue:(id)a3 forKeyPath:(id)a4 accessoryIdentifier:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = (void *)MEMORY[0x263EFFA08];
  id v12 = a5;
  id v13 = [v11 setWithObject:v10];
  id v14 = [MEMORY[0x263EFFA08] setWithObject:v12];

  uint64_t v15 = [(HFItemManager *)self _itemsToUpdateForHomeKitKeyPaths:v13 forHomeKitObjectIdentifiers:v14];

  if ([v15 count])
  {
    uint64_t v16 = [(HFItemManager *)self itemProviders];
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __85__HFItemManager_HomeKitDelegates__updateSettingValue_forKeyPath_accessoryIdentifier___block_invoke;
    v22[3] = &unk_264091938;
    id v17 = v15;
    id v23 = v17;
    id v24 = v9;
    id v25 = v10;
    objc_msgSend(v16, "na_each:", v22);

    id v18 = [MEMORY[0x263F581B8] mainThreadScheduler];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __85__HFItemManager_HomeKitDelegates__updateSettingValue_forKeyPath_accessoryIdentifier___block_invoke_2;
    v19[3] = &unk_26408D8A0;
    v19[4] = self;
    id v20 = v17;
    SEL v21 = a2;
    [v18 performBlock:v19];
  }
}

void __85__HFItemManager_HomeKitDelegates__updateSettingValue_forKeyPath_accessoryIdentifier___block_invoke(void *a1, void *a2)
{
  id v5 = a2;
  if ([v5 conformsToProtocol:&unk_26C100598])
  {
    id v3 = [v5 items];
    int v4 = [v3 intersectsSet:a1[4]];

    if (v4) {
      [v5 updateSettingValue:a1[5] forKeyPath:a1[6]];
    }
  }
}

void __85__HFItemManager_HomeKitDelegates__updateSettingValue_forKeyPath_accessoryIdentifier___block_invoke_2(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) batchedDelegateAdapterDisallowingReads];
  id v2 = (id)[v3 requestUpdateForItems:*(void *)(a1 + 40) itemProviderInvalidationReasons:MEMORY[0x263EFFA68] modifiedHome:0 senderSelector:*(void *)(a1 + 48)];
}

- (void)home:(id)a3 didAddMediaSystem:(id)a4
{
  id v12 = a3;
  id v7 = a4;
  uint64_t v8 = [(HFItemManager *)self _itemsToUpdateForMediaSystemChange:v7];
  id v9 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  id v10 = [(HFItemManager *)self _invalidationReasonsForAddedOrRemovedMediaSystem:v7];

  id v11 = (id)[v9 requestUpdateForItems:v8 itemProviderInvalidationReasons:v10 modifiedHome:v12 senderSelector:a2];
}

- (void)home:(id)a3 didRemoveMediaSystem:(id)a4
{
  id v12 = a3;
  id v7 = a4;
  uint64_t v8 = [(HFItemManager *)self _itemsToUpdateForMediaSystemChange:v7];
  id v9 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  id v10 = [(HFItemManager *)self _invalidationReasonsForAddedOrRemovedMediaSystem:v7];

  id v11 = (id)[v9 requestUpdateForItems:v8 itemProviderInvalidationReasons:v10 modifiedHome:v12 senderSelector:a2];
}

- (void)home:(id)a3 didUpdateMediaSystem:(id)a4
{
  id v10 = a3;
  id v7 = [(HFItemManager *)self _itemsToUpdateForMediaSystemChange:a4];
  uint64_t v8 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  id v9 = (id)[v8 requestUpdateForItems:v7 itemProviderInvalidationReasons:MEMORY[0x263EFFA68] modifiedHome:v10 senderSelector:a2];
}

- (void)mediaSystem:(id)a3 didUpdateComponents:(id)a4
{
  id v6 = a3;
  id v10 = [(HFItemManager *)self _itemsToUpdateForMediaSystemChange:v6];
  id v7 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  uint64_t v8 = objc_msgSend(v6, "hf_home");

  id v9 = (id)[v7 requestUpdateForItems:v10 itemProviderInvalidationReasons:MEMORY[0x263EFFA68] modifiedHome:v8 senderSelector:a2];
}

- (void)mediaSystem:(id)a3 didUpdateName:(id)a4
{
  id v6 = a3;
  id v10 = [(HFItemManager *)self _itemsToUpdateForMediaSystemChange:v6];
  id v7 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  uint64_t v8 = objc_msgSend(v6, "hf_home");

  id v9 = (id)[v7 requestUpdateForItems:v10 itemProviderInvalidationReasons:MEMORY[0x263EFFA68] modifiedHome:v8 senderSelector:a2];
}

- (void)mediaSystem:(id)a3 didUpdateConfiguredName:(id)a4
{
  id v6 = a3;
  id v10 = [(HFItemManager *)self _itemsToUpdateForMediaSystemChange:v6];
  id v7 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  uint64_t v8 = objc_msgSend(v6, "hf_home");

  id v9 = (id)[v7 requestUpdateForItems:v10 itemProviderInvalidationReasons:MEMORY[0x263EFFA68] modifiedHome:v8 senderSelector:a2];
}

- (void)audioControl:(id)a3 didUpdateVolume:(float)a4
{
  id v6 = [a3 mediaSession];
  id v9 = [(HFItemManager *)self _itemsToUpdateForMediaSessionChange:v6];

  id v7 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  id v8 = (id)[v7 requestUpdateForItems:v9 itemProviderInvalidationReasons:MEMORY[0x263EFFA68] modifiedHome:0 senderSelector:a2];
}

- (void)audioControl:(id)a3 didUpdateMuted:(BOOL)a4
{
  id v6 = [a3 mediaSession];
  id v9 = [(HFItemManager *)self _itemsToUpdateForMediaSessionChange:v6];

  id v7 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  id v8 = (id)[v7 requestUpdateForItems:v9 itemProviderInvalidationReasons:MEMORY[0x263EFFA68] modifiedHome:0 senderSelector:a2];
}

- (void)siriEndpointProfile:(id)a3 didUpdateSessionState:(int64_t)a4
{
  -[HFItemManager _itemsToUpdateForSiriEndpointProfileObjectChange:](self, "_itemsToUpdateForSiriEndpointProfileObjectChange:", a3, a4);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  id v7 = (id)[v6 requestUpdateForItems:v8 itemProviderInvalidationReasons:MEMORY[0x263EFFA68] modifiedHome:0 senderSelector:a2];
}

- (void)siriEndpointProfile:(id)a3 didUpdateSessionHubIdentifier:(id)a4
{
  -[HFItemManager _itemsToUpdateForSiriEndpointProfileObjectChange:](self, "_itemsToUpdateForSiriEndpointProfileObjectChange:", a3, a4);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  id v7 = (id)[v6 requestUpdateForItems:v8 itemProviderInvalidationReasons:MEMORY[0x263EFFA68] modifiedHome:0 senderSelector:a2];
}

- (void)siriEndpointProfile:(id)a3 didUpdateSiriEngineVersion:(id)a4
{
  -[HFItemManager _itemsToUpdateForSiriEndpointProfileObjectChange:](self, "_itemsToUpdateForSiriEndpointProfileObjectChange:", a3, a4);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  id v7 = (id)[v6 requestUpdateForItems:v8 itemProviderInvalidationReasons:MEMORY[0x263EFFA68] modifiedHome:0 senderSelector:a2];
}

- (void)siriEndpointProfile:(id)a3 didUpdateNeedsOnboarding:(BOOL)a4
{
  -[HFItemManager _itemsToUpdateForSiriEndpointProfileObjectChange:](self, "_itemsToUpdateForSiriEndpointProfileObjectChange:", a3, a4);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  id v7 = (id)[v6 requestUpdateForItems:v8 itemProviderInvalidationReasons:MEMORY[0x263EFFA68] modifiedHome:0 senderSelector:a2];
}

- (void)siriEndpointProfile:(id)a3 didUpdateSupportsOnboarding:(BOOL)a4
{
  id v6 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  id v5 = (id)[v6 requestUpdateForItems:0 itemProviderInvalidationReasons:MEMORY[0x263EFFA68] modifiedHome:0 senderSelector:a2];
}

- (void)siriEndpointProfile:(id)a3 didUpdateManuallyDisabled:(BOOL)a4
{
  -[HFItemManager _itemsToUpdateForSiriEndpointProfileObjectChange:](self, "_itemsToUpdateForSiriEndpointProfileObjectChange:", a3, a4);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  id v7 = (id)[v6 requestUpdateForItems:v8 itemProviderInvalidationReasons:MEMORY[0x263EFFA68] modifiedHome:0 senderSelector:a2];
}

- (void)siriEndpointProfile:(id)a3 didUpdateMultifunctionButton:(int64_t)a4
{
  -[HFItemManager _itemsToUpdateForSiriEndpointProfileObjectChange:](self, "_itemsToUpdateForSiriEndpointProfileObjectChange:", a3, a4);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  id v7 = (id)[v6 requestUpdateForItems:v8 itemProviderInvalidationReasons:MEMORY[0x263EFFA68] modifiedHome:0 senderSelector:a2];
}

- (void)siriEndpointProfile:(id)a3 didUpdateCurrentAssistant:(id)a4
{
  -[HFItemManager _itemsToUpdateForSiriEndpointProfileObjectChange:](self, "_itemsToUpdateForSiriEndpointProfileObjectChange:", a3, a4);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  id v7 = (id)[v6 requestUpdateForItems:v8 itemProviderInvalidationReasons:MEMORY[0x263EFFA68] modifiedHome:0 senderSelector:a2];
}

- (void)siriEndpointProfile:(id)a3 didUpdateAssistants:(id)a4
{
  -[HFItemManager _itemsToUpdateForSiriEndpointProfileObjectChange:](self, "_itemsToUpdateForSiriEndpointProfileObjectChange:", a3, a4);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  id v7 = (id)[v6 requestUpdateForItems:v8 itemProviderInvalidationReasons:MEMORY[0x263EFFA68] modifiedHome:0 senderSelector:a2];
}

- (void)personManager:(id)a3 didUpdatePersons:(id)a4
{
  v10[1] = *MEMORY[0x263EF8340];
  id v6 = [(HFItemManager *)self _itemsToUpdateForModifiedPersons:a4];
  id v7 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  v10[0] = @"person";
  id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];
  id v9 = (id)[v7 requestUpdateForItems:v6 itemProviderInvalidationReasons:v8 modifiedHome:0 senderSelector:a2];
}

- (void)personManager:(id)a3 didRemovePersonsWithUUIDs:(id)a4
{
  v10[1] = *MEMORY[0x263EF8340];
  id v6 = [(HFItemManager *)self _itemsToUpdateForModifiedUUIDs:a4];
  id v7 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  v10[0] = @"person";
  id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];
  id v9 = (id)[v7 requestUpdateForItems:v6 itemProviderInvalidationReasons:v8 modifiedHome:0 senderSelector:a2];
}

- (void)personManager:(id)a3 didUpdatePersonFaceCrops:(id)a4
{
  id v6 = a4;
  objc_msgSend(v6, "na_map:", &__block_literal_global_39_0);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = objc_msgSend(v6, "na_map:", &__block_literal_global_41_2);

  id v8 = [v12 setByAddingObjectsFromSet:v7];
  id v9 = [(HFItemManager *)self _itemsToUpdateForModifiedUUIDs:v8];
  id v10 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  id v11 = (id)[v10 requestUpdateForItems:v9 itemProviderInvalidationReasons:MEMORY[0x263EFFA68] modifiedHome:0 senderSelector:a2];
}

uint64_t __74__HFItemManager_HomeKitDelegates__personManager_didUpdatePersonFaceCrops___block_invoke(uint64_t a1, void *a2)
{
  return [a2 personUUID];
}

uint64_t __74__HFItemManager_HomeKitDelegates__personManager_didUpdatePersonFaceCrops___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 UUID];
}

- (void)personManager:(id)a3 didRemoveFaceCropsWithUUIDs:(id)a4
{
  id v8 = [(HFItemManager *)self _itemsToUpdateForModifiedUUIDs:a4];
  id v6 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  id v7 = (id)[v6 requestUpdateForItems:v8 itemProviderInvalidationReasons:MEMORY[0x263EFFA68] modifiedHome:0 senderSelector:a2];
}

- (void)didUpdateDemoModeStateForAccessory:(id)a3
{
  v11[1] = *MEMORY[0x263EF8340];
  id v5 = objc_msgSend(MEMORY[0x263EFFA08], "na_setWithSafeObject:", a3);
  id v6 = [(HFItemManager *)self _itemsToUpdateForModifiedAccessories:v5];
  id v7 = (void *)[v6 mutableCopy];

  id v8 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  v11[0] = @"accessory";
  id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
  id v10 = (id)[v8 requestUpdateForItems:v7 itemProviderInvalidationReasons:v9 modifiedHome:0 senderSelector:a2];
}

- (void)pinCodeManagerDidUpdate:(id)a3 pinCodes:(id)a4
{
  v11[1] = *MEMORY[0x263EF8340];
  id v6 = [(HFItemManager *)self _itemsToUpdateForModifiedAccessCodes:a4];
  id v7 = (void *)[v6 mutableCopy];

  id v8 = [(HFItemManager *)self batchedDelegateAdapterDisallowingReads];
  v11[0] = @"user";
  id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
  id v10 = (id)[v8 requestUpdateForItems:v7 itemProviderInvalidationReasons:v9 modifiedHome:0 senderSelector:a2];
}

- (HFItemManager)init
{
  int v4 = [MEMORY[0x263F08690] currentHandler];
  id v5 = NSStringFromSelector(sel_initWithDelegate_sourceItem_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFItemManager.m", 199, @"%s is unavailable; use %@ instead",
    "-[HFItemManager init]",
    v5);

  return 0;
}

- (void)dealloc
{
  id v3 = [(HFItemManager *)self firstFastUpdateFuture];
  char v4 = [v3 isFinished];

  if ((v4 & 1) == 0)
  {
    id v5 = [(HFItemManager *)self firstFastUpdateFuture];
    [v5 cancel];
  }
  id v6 = [(HFItemManager *)self firstFullUpdateFuture];
  char v7 = [v6 isFinished];

  if ((v7 & 1) == 0)
  {
    id v8 = [(HFItemManager *)self firstFullUpdateFuture];
    [v8 cancel];
  }
  [(HFItemManager *)self _removeDelegateNotifications];
  [(HFItemManager *)self deregisterMatterDelegates];
  v9.receiver = self;
  v9.super_class = (Class)HFItemManager;
  [(HFItemManager *)&v9 dealloc];
}

- (id)childItemsForItem:(id)a3 ofClass:(Class)a4 conformingToProtocol:(id)a5
{
  id v8 = a5;
  objc_super v9 = [(HFItemManager *)self childItemsForItem:a3];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  void v13[2] = __64__HFItemManager_childItemsForItem_ofClass_conformingToProtocol___block_invoke;
  v13[3] = &unk_264095768;
  id v14 = v8;
  Class v15 = a4;
  id v10 = v8;
  id v11 = objc_msgSend(v9, "na_filter:", v13);

  return v11;
}

uint64_t __64__HFItemManager_childItemsForItem_ofClass_conformingToProtocol___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(void *)(a1 + 40) && (objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v4 = 0;
  }
  else if (*(void *)(a1 + 32))
  {
    uint64_t v4 = objc_msgSend(v3, "conformsToProtocol:");
  }
  else
  {
    uint64_t v4 = 1;
  }

  return v4;
}

- (id)matchingItemForHomeKitObject:(id)a3
{
  id v4 = a3;
  id v5 = [(HFItemManager *)self allDisplayedItems];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  void v9[2] = __46__HFItemManager_matchingItemForHomeKitObject___block_invoke;
  v9[3] = &unk_26408EC60;
  id v10 = v4;
  id v6 = v4;
  char v7 = objc_msgSend(v5, "na_firstObjectPassingTest:", v9);

  return v7;
}

uint64_t __46__HFItemManager_matchingItemForHomeKitObject___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 conformsToProtocol:&unk_26C0FBAD0]) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;
  id v6 = [v5 homeKitObject];

  if (v5)
  {
    if ([v6 isEqual:*(void *)(a1 + 32)])
    {
      uint64_t v7 = 1;
    }
    else
    {
      id v8 = [v6 uniqueIdentifier];
      objc_super v9 = [*(id *)(a1 + 32) uniqueIdentifier];
      uint64_t v7 = [v8 isEqual:v9];
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (void)beginSuppressingUpdatesForCharacteristics:(id)a3 withReason:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = HFLogForCategory(0x2AuLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412802;
    id v12 = self;
    __int16 v13 = 2112;
    id v14 = v6;
    __int16 v15 = 2112;
    id v16 = v7;
    _os_log_impl(&dword_20B986000, v8, OS_LOG_TYPE_DEFAULT, "Suppressing updates in %@ for characteristics %@ with reason %@", (uint8_t *)&v11, 0x20u);
  }

  objc_super v9 = [(HFItemManager *)self suppressedCharacteristicUpdatesByReason];
  id v10 = objc_msgSend(v9, "na_objectForKey:withDefaultValue:", v7, &__block_literal_global_193_0);

  [v10 unionSet:v6];
}

uint64_t __70__HFItemManager_beginSuppressingUpdatesForCharacteristics_withReason___block_invoke()
{
  return [MEMORY[0x263EFF9C0] set];
}

- (void)endSuppressingUpdatesForCharacteristicsWithReason:(id)a3 updateAffectedItems:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = [(HFItemManager *)self suppressedCharacteristicUpdatesByReason];
  objc_super v9 = [v8 objectForKeyedSubscript:v7];

  if (!v9)
  {
    id v10 = [(HFItemManager *)self suppressedCharacteristicUpdatesByReason];
    int v11 = [v10 allKeys];
    NSLog(&cfstr_RequestToEndSu.isa, self, v7, v11);
  }
  id v12 = HFLogForCategory(0x2AuLL);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v23 = self;
    __int16 v24 = 2112;
    id v25 = v7;
    _os_log_impl(&dword_20B986000, v12, OS_LOG_TYPE_DEFAULT, "End suppressing updates in %@ for characteristics with reason %@", buf, 0x16u);
  }

  __int16 v13 = [(HFItemManager *)self suppressedCharacteristicUpdatesByReason];
  id v14 = [v13 objectForKeyedSubscript:v7];
  __int16 v15 = (void *)[v14 mutableCopy];

  id v16 = [(HFItemManager *)self suppressedCharacteristicUpdatesByReason];
  [v16 removeObjectForKey:v7];

  if (v4)
  {
    uint64_t v17 = [(HFItemManager *)self _allSuppressedCharacteristics];
    [v15 minusSet:v17];

    if ([v15 count])
    {
      id v18 = objc_opt_new();
      [v18 setSenderSelector:a2];
      uint64_t v19 = +[HFStaticReadPolicy policyWithDecision:0];
      [v18 setReadPolicy:v19];

      id v20 = [(HFItemManager *)self _itemsToUpdateForModifiedCharacteristics:v15];
      id v21 = [(HFItemManager *)self _updateResultsForItems:v20 context:v18];
    }
  }
}

- (void)setReadPolicy:(id)a3
{
  objc_storeStrong((id *)&self->_readPolicy, a3);
  id v5 = a3;
  id v6 = [(HFItemManager *)self batchedDelegateAdapterAllowingReads];
  [v6 setReadPolicy:v5];
}

+ (BOOL)_canReloadDuringUnitTests
{
  return 0;
}

- (id)_buildItemProvidersForHome:(id)a3
{
  id v5 = [(HFItemManager *)self itemModules];
  uint64_t v6 = [v5 count];

  if (!v6)
  {
    id v7 = [MEMORY[0x263F08690] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"HFItemManager.m", 499, @"%s is an abstract method that must be overriden by subclass %@", "-[HFItemManager _buildItemProvidersForHome:]", objc_opt_class() object file lineNumber description];
  }
  return (id)MEMORY[0x263EFFA68];
}

- (id)_buildItemProvidersWithoutHome
{
  return (id)MEMORY[0x263EFFA68];
}

- (id)_comparatorForSectionIdentifier:(id)a3
{
  return +[HFItemSection defaultItemComparator];
}

- (id)_itemForSorting
{
  return 0;
}

- (BOOL)_requiresNotificationsForCharacteristic:(id)a3
{
  void v17[2] = *MEMORY[0x263EF8340];
  id v3 = a3;
  BOOL v4 = [v3 characteristicType];
  char v5 = [v4 isEqualToString:*MEMORY[0x263F0C228]];

  if (v5) {
    goto LABEL_4;
  }
  uint64_t v6 = [v3 characteristicType];
  char v7 = [v6 isEqualToString:*MEMORY[0x263F0C220]];

  if ((v7 & 1) != 0
    || ([v3 service],
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v8 serviceType],
        objc_super v9 = objc_claimAutoreleasedReturnValue(),
        char v10 = [v9 isEqualToString:*MEMORY[0x263F0D610]],
        v9,
        v8,
        (v10 & 1) != 0))
  {
LABEL_4:
    char v11 = 0;
  }
  else
  {
    uint64_t v13 = *MEMORY[0x263F0BFE8];
    v17[0] = *MEMORY[0x263F0BF58];
    v17[1] = v13;
    id v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:2];
    __int16 v15 = [v3 characteristicType];
    char v16 = [v14 containsObject:v15];

    char v11 = v16 ^ 1;
  }

  return v11;
}

uint64_t __44__HFItemManager__registerForExternalUpdates__block_invoke(uint64_t a1, void *a2)
{
  return [a2 registerForExternalUpdates];
}

uint64_t __46__HFItemManager__unregisterForExternalUpdates__block_invoke(uint64_t a1, void *a2)
{
  return [a2 unregisterForExternalUpdates];
}

- (BOOL)itemIsBeingDisplayed:(id)a3
{
  id v4 = a3;
  char v5 = [(HFItemManager *)self allDisplayedItems];
  char v6 = [v5 containsObject:v4];

  return v6;
}

id __59__HFItemManager_reloadAndUpdateAllItemsFromSenderSelector___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [MEMORY[0x263EFFA08] set];
  id v3 = [MEMORY[0x263EFFA08] set];
  [WeakRetained _updateRepresentationForExternalItemsWithUpdatedOrAddedItems:v2 removedItems:v3 logger:0];

  [WeakRetained setHome:0];
  [WeakRetained setLastUpdatedHome:0];
  id v4 = (void *)MEMORY[0x263F58190];
  char v5 = [MEMORY[0x263EFFA08] set];
  char v6 = [v4 futureWithResult:v5];

  return v6;
}

id __59__HFItemManager__reloadAllItemProvidersFromSenderSelector___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = [MEMORY[0x263EFF9C0] set];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          objc_msgSend(v3, "unionSet:", v9, (void)v12);
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  char v10 = [MEMORY[0x263F58190] futureWithResult:v3];

  return v10;
}

- (id)reloadAndUpdateItemsForProviders:(id)a3 senderSelector:(SEL)a4
{
  uint64_t v6 = (void *)MEMORY[0x263EFFA08];
  id v7 = a3;
  id v8 = [v6 set];
  uint64_t v9 = [(HFItemManager *)self _reloadAndUpdateItemsForProviders:v7 updateItems:v8 senderSelector:a4];

  return v9;
}

id __127__HFItemManager__reloadItemProviders_updateItems_shouldUpdateExistingItems_senderSelector_readPolicy_fastInitialUpdatePromise___block_invoke()
{
  v0 = (void *)MEMORY[0x263F58190];
  uint64_t v1 = [[HFItemProviderReloadResults alloc] initWithAddedItems:0 removedItems:0 existingItems:0];
  id v2 = [v0 futureWithResult:v1];

  return v2;
}

uint64_t __38__HFItemManager__loadingStateForItem___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 keyPath];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

void __75__HFItemManager__updateResultsForItems_removedItems_context_allowDelaying___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = HFLogForCategory(0x2AuLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void **)(a1 + 32);
    uint64_t v6 = [*(id *)(a1 + 40) updateOptions];
    uint64_t v7 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 138412802;
    id v18 = v5;
    __int16 v19 = 2112;
    id v20 = v6;
    __int16 v21 = 2112;
    uint64_t v22 = v7;
    _os_log_impl(&dword_20B986000, v4, OS_LOG_TYPE_DEFAULT, "Delegate for %@ has failed its future to update with options: %@ for items: %@; canceling update",
      buf,
      0x20u);
  }
  id v8 = HFLogForCategory(0x32uLL);
  uint64_t v9 = v8;
  os_signpost_id_t v10 = *(void *)(a1 + 72);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v3;
    _os_signpost_emit_with_name_impl(&dword_20B986000, v9, OS_SIGNPOST_INTERVAL_END, v10, "HFFutureToUpdateItems", "Failed with error %@, canceling", buf, 0xCu);
  }

  char v11 = *(void **)(a1 + 32);
  long long v12 = [MEMORY[0x263EFFA08] set];
  long long v13 = [v11 _updateResultsForItems:v12 removedItems:*(void *)(a1 + 56) context:*(void *)(a1 + 40) allowDelaying:0];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  void v15[2] = __75__HFItemManager__updateResultsForItems_removedItems_context_allowDelaying___block_invoke_310;
  void v15[3] = &unk_26408F170;
  id v16 = *(id *)(a1 + 64);
  id v14 = (id)[v13 addCompletionBlock:v15];
}

uint64_t __75__HFItemManager__updateResultsForItems_removedItems_context_allowDelaying___block_invoke_310(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) finishWithResult:a2 error:a3];
}

uint64_t __50__HFItemManager__buildSectionsWithDisplayedItems___block_invoke(uint64_t a1, void *a2)
{
  return [a2 buildSectionsWithDisplayedItems:*(void *)(a1 + 32)];
}

uint64_t __50__HFItemManager__buildSectionsWithDisplayedItems___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = [a2 allItems];
  uint64_t v4 = [v3 containsObject:*(void *)(a1 + 32)];

  return v4;
}

- (BOOL)_shouldHideServiceItem:(id)a3 containedInServiceGroupItem:(id)a4
{
  if (!a4) {
    return 0;
  }
  uint64_t v5 = (void *)MEMORY[0x263EFFA08];
  id v6 = a4;
  uint64_t v7 = [v5 setWithObject:v6];
  id v8 = [(HFItemManager *)self _itemsToHideInSet:v7];
  LOBYTE(self) = [v8 containsObject:v6];

  char v9 = self ^ 1;
  return v9;
}

- (void)_setDisplayFilter:(id)a3 recalculateVisibility:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = _Block_copy(a3);
  id displayFilter = self->__displayFilter;
  self->__id displayFilter = v6;

  if (v4)
  {
    [(HFItemManager *)self recalculateVisibilityAndSortAllItems];
  }
}

- (id)_serviceGroupItemForServiceGroup:(id)a3 inItems:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a4;
  uint64_t v7 = [a3 uniqueIdentifier];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = -[HFItemManager _itemsOfClass:inItems:allowTransformedItems:](self, "_itemsOfClass:inItems:allowTransformedItems:", objc_opt_class(), v6, 1, 0);
  id v9 = (id)[v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v9; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v8);
        }
        long long v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        long long v13 = [v12 homeKitObject];
        id v14 = [v13 uniqueIdentifier];
        char v15 = [v14 isEqual:v7];

        if (v15)
        {
          id v9 = v12;
          goto LABEL_11;
        }
      }
      id v9 = (id)[v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v9;
}

- (unint64_t)_sectionForItem:(id)a3
{
  return [(HFItemManager *)self _sectionForItem:a3 assertOnNotFound:1];
}

- (unint64_t)_sectionForItem:(id)a3 assertOnNotFound:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  id v8 = [(HFItemManager *)self sections];
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 3221225472;
  char v15 = __50__HFItemManager__sectionForItem_assertOnNotFound___block_invoke;
  id v16 = &unk_264095B68;
  id v9 = v7;
  id v17 = v9;
  unint64_t v10 = [v8 indexOfObjectPassingTest:&v13];

  if (v4 && v10 == 0x7FFFFFFFFFFFFFFFLL)
  {
    long long v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"HFItemManager.m", 1836, @"Could not find section for item: %@", v9, v13, v14, v15, v16 object file lineNumber description];
  }
  return v10;
}

uint64_t __50__HFItemManager__sectionForItem_assertOnNotFound___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 items];
  uint64_t v4 = [v3 containsObject:*(void *)(a1 + 32)];

  return v4;
}

- (id)_itemsToUpdateForModifiedActionSets:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HFItemManager *)self _directItemDependenciesForHomeKitObjects:v4 class:objc_opt_class()];
  id v6 = (void *)[v5 mutableCopy];

  id v7 = objc_msgSend(v4, "na_map:", &__block_literal_global_431);

  id v8 = objc_msgSend(v7, "na_setByFlattening");

  id v9 = [(HFItemManager *)self _itemsToUpdateForModifiedActions:v8];
  [v6 unionSet:v9];

  return v6;
}

uint64_t __53__HFItemManager__itemsToUpdateForModifiedActionSets___block_invoke(uint64_t a1, void *a2)
{
  return [a2 actions];
}

- (id)_itemsToUpdateForModifiedActions:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HFItemManager *)self _directItemDependenciesForHomeKitObjects:v4 class:objc_opt_class()];

  return v5;
}

- (id)_itemsToUpdateForModifiedServiceGroups:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HFItemManager *)self _directItemDependenciesForHomeKitObjects:v4 class:objc_opt_class()];
  id v6 = (void *)[v5 mutableCopy];

  id v7 = objc_msgSend(v4, "na_map:", &__block_literal_global_436);

  id v8 = objc_msgSend(v7, "na_setByFlattening");

  id v9 = [(HFItemManager *)self _itemsToUpdateForModifiedServices:v8];
  [v6 unionSet:v9];

  unint64_t v10 = objc_msgSend(v8, "na_map:", &__block_literal_global_439);
  char v11 = [(HFItemManager *)self _itemsToUpdateForModifiedAccessories:v10];
  [v6 unionSet:v11];

  return v6;
}

id __56__HFItemManager__itemsToUpdateForModifiedServiceGroups___block_invoke(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x263EFFA08];
  id v3 = [a2 services];
  id v4 = [v2 setWithArray:v3];

  return v4;
}

uint64_t __56__HFItemManager__itemsToUpdateForModifiedServiceGroups___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 accessory];
}

- (id)_itemsToUpdateForModifiedZones:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HFItemManager *)self _directItemDependenciesForHomeKitObjects:v4 class:objc_opt_class()];
  id v6 = (void *)[v5 mutableCopy];

  id v7 = objc_msgSend(v4, "na_map:", &__block_literal_global_443);

  id v8 = objc_msgSend(v7, "na_setByFlattening");

  id v9 = [(HFItemManager *)self _itemsToUpdateForModifiedRooms:v8];
  [v6 unionSet:v9];

  return v6;
}

id __48__HFItemManager__itemsToUpdateForModifiedZones___block_invoke(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x263EFFA08];
  id v3 = [a2 rooms];
  id v4 = [v2 setWithArray:v3];

  return v4;
}

- (id)_itemsToUpdateForModifiedRooms:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HFItemManager *)self _directItemDependenciesForHomeKitObjects:v4 class:objc_opt_class()];
  id v6 = (void *)[v5 mutableCopy];

  id v7 = objc_msgSend(v4, "na_map:", &__block_literal_global_447);

  id v8 = objc_msgSend(v7, "na_setByFlattening");

  id v9 = [(HFItemManager *)self _itemsToUpdateForModifiedAccessories:v8];
  [v6 unionSet:v9];

  return v6;
}

id __48__HFItemManager__itemsToUpdateForModifiedRooms___block_invoke(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x263EFFA08];
  id v3 = [a2 accessories];
  id v4 = [v2 setWithArray:v3];

  return v4;
}

- (id)_itemsToUpdateForOutgoingInvitation:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HFItemManager *)self _directItemDependenciesForHomeKitObjects:v4 class:objc_opt_class()];

  return v5;
}

- (id)_itemsToUpdateForIncomingInvitation:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HFItemManager *)self _directItemDependenciesForHomeKitObjects:v4 class:objc_opt_class()];

  return v5;
}

- (id)_itemsToUpdateForModifiedUsers:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HFItemManager *)self _directItemDependenciesForHomeKitObjects:v4 class:objc_opt_class()];

  return v5;
}

- (id)_itemsToUpdateForModifiedTriggers:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HFItemManager *)self _directItemDependenciesForHomeKitObjects:v4 class:objc_opt_class()];
  id v6 = (void *)[v5 mutableCopy];

  id v7 = objc_msgSend(v4, "na_map:", &__block_literal_global_454_0);
  id v8 = objc_msgSend(v7, "na_setByFlattening");

  id v9 = [(HFItemManager *)self _itemsToUpdateForModifiedActionSets:v8];
  [v6 unionSet:v9];

  unint64_t v10 = objc_msgSend(v4, "na_map:", &__block_literal_global_456_0);

  char v11 = objc_msgSend(v10, "na_setByFlattening");

  long long v12 = [(HFItemManager *)self _itemsToUpdateForModifiedEvents:v11];
  [v6 unionSet:v12];

  return v6;
}

id __51__HFItemManager__itemsToUpdateForModifiedTriggers___block_invoke(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x263EFFA08];
  id v3 = [a2 actionSets];
  id v4 = [v2 setWithArray:v3];

  return v4;
}

id __51__HFItemManager__itemsToUpdateForModifiedTriggers___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = (void *)MEMORY[0x263EFFA08];
    id v4 = [v2 events];
    uint64_t v5 = [v3 setWithArray:v4];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)_itemsToUpdateForModifiedEvents:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HFItemManager *)self _directItemDependenciesForHomeKitObjects:v4 class:objc_opt_class()];

  return v5;
}

- (id)_itemsToUpdateForModifiedAccessories:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HFItemManager *)self _directItemDependenciesForHomeKitObjects:v4 class:objc_opt_class()];
  id v6 = (void *)[v5 mutableCopy];

  id v7 = objc_msgSend(v4, "na_map:", &__block_literal_global_462);

  id v8 = objc_msgSend(v7, "na_setByFlattening");

  id v9 = [(HFItemManager *)self _itemsToUpdateForModifiedServices:v8];
  [v6 unionSet:v9];

  return v6;
}

id __54__HFItemManager__itemsToUpdateForModifiedAccessories___block_invoke(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x263EFFA08];
  id v3 = [a2 services];
  id v4 = [v2 setWithArray:v3];

  return v4;
}

- (id)_itemsToUpdateForModifiedServices:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HFItemManager *)self _directItemDependenciesForHomeKitObjects:v4 class:objc_opt_class()];
  id v6 = (void *)[v5 mutableCopy];

  id v7 = objc_msgSend(v4, "na_map:", &__block_literal_global_464);
  id v8 = objc_msgSend(v7, "na_setByFlattening");

  id v9 = [(HFItemManager *)self _itemsToUpdateForModifiedCharacteristics:v8];
  [v6 unionSet:v9];

  unint64_t v10 = objc_msgSend(v4, "na_map:", &__block_literal_global_466_0);

  char v11 = [(HFItemManager *)self _itemsToUpdateForModifiedServiceTypes:v10];
  [v6 unionSet:v11];

  return v6;
}

id __51__HFItemManager__itemsToUpdateForModifiedServices___block_invoke(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x263EFFA08];
  id v3 = [a2 characteristics];
  id v4 = [v2 setWithArray:v3];

  return v4;
}

uint64_t __51__HFItemManager__itemsToUpdateForModifiedServices___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 serviceType];
}

- (id)_itemsToUpdateForModifiedServiceTypes:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v15 = [MEMORY[0x263EFF9C0] set];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v5 = [(HFItemManager *)self _allItemsIncludingInternalItems];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        unint64_t v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        char v11 = [v10 latestResults];
        long long v12 = [v11 objectForKeyedSubscript:@"dependentServiceTypes"];
        int v13 = [v12 intersectsSet:v4];

        if (v13) {
          [v15 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  return v15;
}

- (id)_itemsToUpdateForModifiedResidentDevices:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HFItemManager *)self _directItemDependenciesForHomeKitObjects:v4 class:objc_opt_class()];

  return v5;
}

- (id)_itemsToUpdateForModifiedSignificantEvents:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HFItemManager *)self _directItemDependenciesForHomeKitObjects:v4 class:objc_opt_class()];

  return v5;
}

- (id)_itemsToUpdateForModifiedSharingDevices:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HFItemManager *)self _directItemDependenciesForHomeKitObjects:v4 class:objc_opt_class()];

  return v5;
}

- (id)_itemsToUpdateForRemoteAccessChange
{
  id v3 = [(HFItemManager *)self _allItemsIncludingInternalItems];
  id v4 = [(HFItemManager *)self _itemsWithDependenciesPassingTest:&__block_literal_global_472 forItems:v3];

  return v4;
}

uint64_t __52__HFItemManager__itemsToUpdateForRemoteAccessChange__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 latestResults];
  id v3 = [v2 objectForKeyedSubscript:@"remoteAccessDependency"];
  uint64_t v4 = [v3 BOOLValue];

  return v4;
}

- (id)_itemsToUpdateForAllowAccessWhileLockedSettingChange
{
  id v2 = [(HFItemManager *)self _allItemsIncludingInternalItems];
  id v3 = objc_msgSend(v2, "na_filter:", &__block_literal_global_476);

  return v3;
}

uint64_t __69__HFItemManager__itemsToUpdateForAllowAccessWhileLockedSettingChange__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 latestResults];
  id v3 = [v2 objectForKeyedSubscript:@"accessWhileLockedSettingDependency"];
  uint64_t v4 = [v3 BOOLValue];

  return v4;
}

- (id)_itemsToUpdateForMediaSessionChange:(id)a3
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = objc_msgSend(MEMORY[0x263EFFA08], "na_setWithSafeObject:", v4);
  uint64_t v6 = [(HFItemManager *)self _directItemDependenciesForHomeKitObjects:v5 class:objc_opt_class()];
  uint64_t v7 = (void *)[v6 mutableCopy];

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v8 = [(HFItemManager *)self home];
  id v9 = objc_msgSend(v8, "hf_mediaAccessories");

  uint64_t v10 = [v9 countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v34 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        id v15 = [v14 mediaProfile];
        id v16 = [v15 mediaSession];

        if (v16 == v4)
        {
          long long v17 = [MEMORY[0x263EFFA08] setWithObject:v14];
          long long v18 = [(HFItemManager *)self _itemsToUpdateForModifiedAccessories:v17];
          [v7 unionSet:v18];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v11);
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v19 = [(HFItemManager *)self home];
  long long v20 = [v19 mediaSystems];

  uint64_t v21 = [v20 countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v30;
    do
    {
      for (uint64_t j = 0; j != v22; ++j)
      {
        if (*(void *)v30 != v23) {
          objc_enumerationMutation(v20);
        }
        id v25 = *(void **)(*((void *)&v29 + 1) + 8 * j);
        id v26 = [v25 mediaSession];

        if (v26 == v4)
        {
          uint64_t v27 = [(HFItemManager *)self _itemsToUpdateForMediaSystemChange:v25];
          [v7 unionSet:v27];
        }
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v29 objects:v37 count:16];
    }
    while (v22);
  }

  return v7;
}

- (id)_itemsToUpdateForMediaObjectChange:(id)a3
{
  id v4 = objc_msgSend(MEMORY[0x263EFFA08], "na_setWithSafeObject:", a3);
  uint64_t v5 = [(HFItemManager *)self _directItemDependenciesForHomeKitObjects:v4 class:objc_opt_class()];

  uint64_t v6 = [MEMORY[0x263EFFA08] set];
  uint64_t v7 = [(HFItemManager *)self _directItemDependenciesForHomeKitObjects:v6 class:objc_opt_class()];
  uint64_t v8 = [v5 setByAddingObjectsFromSet:v7];

  return v8;
}

- (id)_itemsToUpdateForSiriEndpointProfileObjectChange:(id)a3
{
  id v4 = objc_msgSend(MEMORY[0x263EFFA08], "na_setWithSafeObject:", a3);
  uint64_t v5 = [(HFItemManager *)self _directItemDependenciesForHomeKitObjects:v4 class:objc_opt_class()];

  return v5;
}

- (id)_itemsToUpdateForHomeKitSettingsChange:(id)a3
{
  id v4 = objc_msgSend(MEMORY[0x263EFFA08], "na_setWithSafeObject:", a3);
  uint64_t v5 = [(HFItemManager *)self _directItemDependenciesForHomeKitObjects:v4 class:objc_opt_class()];

  return v5;
}

- (id)_itemsToUpdateForAccessorySettingChanges:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  void v9[2] = __58__HFItemManager__itemsToUpdateForAccessorySettingChanges___block_invoke;
  v9[3] = &unk_264095CA0;
  id v6 = v5;
  id v10 = v6;
  uint64_t v11 = self;
  objc_msgSend(v4, "na_each:", v9);

  id v7 = v6;
  return v7;
}

void __58__HFItemManager__itemsToUpdateForAccessorySettingChanges___block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) _itemsToUpdateForAccessorySettingChange:a2];
  [v2 unionSet:v3];
}

- (id)_itemsToUpdateForAccessorySettingChange:(id)a3
{
  id v4 = objc_msgSend(MEMORY[0x263EFFA08], "na_setWithSafeObject:", a3);
  uint64_t v5 = [(HFItemManager *)self _directItemDependenciesForHomeKitObjects:v4 class:objc_opt_class()];

  return v5;
}

- (id)_itemsToUpdateForModifiedSoftwareUpdateControllers:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HFItemManager *)self _directItemDependenciesForHomeKitObjects:v4 class:objc_opt_class()];

  return v5;
}

- (id)_itemsToUpdateForModifiedSoftwareUpdates:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HFItemManager *)self _directItemDependenciesForHomeKitObjects:v4 class:objc_opt_class()];

  return v5;
}

- (id)_itemsToUpdateForSoftwareUpdateV2ChangeToAccessory:(id)a3
{
  id v4 = objc_msgSend(MEMORY[0x263EFFA08], "na_setWithSafeObject:", a3);
  uint64_t v5 = [(HFItemManager *)self _itemsToUpdateForModifiedAccessories:v4];
  id v6 = objc_msgSend(v5, "na_filter:", &__block_literal_global_487);

  return v6;
}

uint64_t __68__HFItemManager__itemsToUpdateForSoftwareUpdateV2ChangeToAccessory___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 latestResults];
  id v3 = [v2 objectForKeyedSubscript:@"hasSoftwareUpdateV2Dependency"];
  uint64_t v4 = [v3 BOOLValue];

  return v4;
}

- (id)_itemsToUpdateForSoftwareUpdateV2ProgressChangeToAccessory:(id)a3
{
  uint64_t v4 = objc_msgSend(MEMORY[0x263EFFA08], "na_setWithSafeObject:", a3);
  uint64_t v5 = [(HFItemManager *)self _itemsToUpdateForModifiedAccessories:v4];
  id v6 = objc_msgSend(v5, "na_filter:", &__block_literal_global_489);

  return v6;
}

uint64_t __76__HFItemManager__itemsToUpdateForSoftwareUpdateV2ProgressChangeToAccessory___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 latestResults];
  id v3 = [v2 objectForKeyedSubscript:@"hasSoftwareUpdateProgressV2Dependency"];
  uint64_t v4 = [v3 BOOLValue];

  return v4;
}

- (id)_itemsToUpdateForModifiedNetworkConfigurationProfiles:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HFItemManager *)self _directItemDependenciesForHomeKitObjects:v4 class:objc_opt_class()];

  return v5;
}

- (id)_itemsToUpdateForModifiedNetworkProtectionGroups:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HFItemManager *)self _directItemDependenciesForHomeKitObjects:v4 class:objc_opt_class()];

  return v5;
}

- (id)_itemsToUpdateForTelevisionProfiles:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HFItemManager *)self _directItemDependenciesForHomeKitObjects:v4 class:objc_opt_class()];
  id v6 = (void *)[v5 mutableCopy];

  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  void v10[2] = __53__HFItemManager__itemsToUpdateForTelevisionProfiles___block_invoke;
  v10[3] = &unk_264095CC8;
  id v7 = v6;
  id v11 = v7;
  uint64_t v12 = self;
  objc_msgSend(v4, "na_each:", v10);

  id v8 = v7;
  return v8;
}

void __53__HFItemManager__itemsToUpdateForTelevisionProfiles___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  id v4 = (void *)MEMORY[0x263EFFA08];
  id v7 = [a2 accessory];
  uint64_t v5 = objc_msgSend(v4, "na_setWithSafeObject:", v7);
  id v6 = [v3 _itemsToUpdateForModifiedAccessories:v5];
  [v2 unionSet:v6];
}

- (id)_itemsToUpdateForLightProfiles:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HFItemManager *)self _directItemDependenciesForHomeKitObjects:v4 class:objc_opt_class()];

  id v6 = (void *)[v5 mutableCopy];
  return v6;
}

- (id)_itemsToUpdateForModifiedAccessCodes:(id)a3
{
  id v4 = objc_msgSend(MEMORY[0x263EFFA08], "set", a3);
  uint64_t v5 = [(HFItemManager *)self _directItemDependenciesForHomeKitObjects:v4 class:objc_opt_class()];
  id v6 = (void *)[v5 mutableCopy];

  return v6;
}

- (id)_itemsToUpdateForModifiedMetadataForMediaDestinationController:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HFItemManager *)self _directItemDependenciesForHomeKitObjects:v4 class:objc_opt_class()];

  id v6 = objc_msgSend(v5, "na_filter:", &__block_literal_global_499);

  return v6;
}

BOOL __80__HFItemManager__itemsToUpdateForModifiedMetadataForMediaDestinationController___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 latestResults];
  id v3 = [v2 objectForKey:@"mediaDestinationIdentifier"];
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)_itemsToUpdateForModifiedPersonManagers:(id)a3
{
  BOOL v4 = objc_msgSend(MEMORY[0x263EFFA08], "set", a3);
  uint64_t v5 = [(HFItemManager *)self _directItemDependenciesForHomeKitObjects:v4 class:objc_opt_class()];
  id v6 = (void *)[v5 mutableCopy];

  return v6;
}

- (id)_itemsToUpdateForModifiedHomePersonManagerSettings:(id)a3
{
  BOOL v4 = objc_msgSend(MEMORY[0x263EFFA08], "set", a3);
  uint64_t v5 = [(HFItemManager *)self _directItemDependenciesForHomeKitObjects:v4 class:objc_opt_class()];
  id v6 = (void *)[v5 mutableCopy];

  return v6;
}

- (id)_itemsToUpdateForModifiedPersons:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HFItemManager *)self _directItemDependenciesForHomeKitObjects:v4 class:objc_opt_class()];
  id v6 = (void *)[v5 mutableCopy];

  id v7 = objc_msgSend(v4, "na_map:", &__block_literal_global_505);

  id v8 = [(HFItemManager *)self _itemsToUpdateForModifiedUUIDs:v7];
  [v6 unionSet:v8];

  return v6;
}

uint64_t __50__HFItemManager__itemsToUpdateForModifiedPersons___block_invoke(uint64_t a1, void *a2)
{
  return [a2 UUID];
}

- (id)_itemsToUpdateForModifiedUUIDs:(id)a3
{
  id v4 = a3;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  void v9[2] = __48__HFItemManager__itemsToUpdateForModifiedUUIDs___block_invoke;
  v9[3] = &unk_26408EC60;
  id v10 = v4;
  id v5 = v4;
  id v6 = [(HFItemManager *)self _allItemsIncludingInternalItems];
  id v7 = [(HFItemManager *)self _itemsWithDependenciesPassingTest:v9 forItems:v6];

  return v7;
}

uint64_t __48__HFItemManager__itemsToUpdateForModifiedUUIDs___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 latestResults];
  id v4 = [v3 objectForKeyedSubscript:@"dependentHomeKitObjects"];

  id v5 = objc_msgSend(v4, "na_map:", &__block_literal_global_508);
  uint64_t v6 = [*(id *)(a1 + 32) intersectsSet:v5];

  return v6;
}

id __48__HFItemManager__itemsToUpdateForModifiedUUIDs___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    id v3 = v2;
    if (objc_opt_isKindOfClass()) {
      id v4 = v3;
    }
    else {
      id v4 = 0;
    }
    id v5 = v4;

    objc_msgSend(v5, "hf_linkedAccessory");
    id v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  char v6 = [v2 conformsToProtocol:&unk_26C1141D8];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if ((v6 & 1) != 0 || (isKindOfClass) && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    id v8 = [v2 uniqueIdentifier];
  }
  else
  {
    NSLog(&cfstr_ObjectIsListed.isa, v2);
    id v8 = 0;
  }

  return v8;
}

- (id)_invalidationReasonsForAddedOrRemovedAccessory:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  int v13 = @"accessory";
  id v4 = (void *)MEMORY[0x263EFF8C0];
  id v5 = a3;
  char v6 = [v4 arrayWithObjects:&v13 count:1];
  id v7 = objc_msgSend(v5, "room", v13, v14);

  id v8 = [(HFItemManager *)self home];
  id v9 = [v8 roomForEntireHome];
  int v10 = [v7 isEqual:v9];

  if (v10)
  {
    uint64_t v11 = [v6 arrayByAddingObject:@"room"];

    char v6 = (void *)v11;
  }
  return v6;
}

- (id)_invalidationReasonsForAddedOrRemovedMediaSystem:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  int v13 = @"mediaSystem";
  id v4 = (void *)MEMORY[0x263EFF8C0];
  id v5 = a3;
  char v6 = [v4 arrayWithObjects:&v13 count:1];
  id v7 = objc_msgSend(v5, "hf_parentRoom", v13, v14);

  id v8 = [(HFItemManager *)self home];
  id v9 = [v8 roomForEntireHome];
  int v10 = [v7 isEqual:v9];

  if (v10)
  {
    uint64_t v11 = [v6 arrayByAddingObject:@"room"];

    char v6 = (void *)v11;
  }
  return v6;
}

- (id)_itemsToUpdateForMediaSystemChange:(id)a3
{
  id v4 = a3;
  id v5 = [v4 accessories];
  char v6 = [(HFItemManager *)self _itemsToUpdateForModifiedAccessories:v5];

  id v7 = [MEMORY[0x263EFFA08] setWithObject:v4];

  id v8 = [(HFItemManager *)self _directItemDependenciesForHomeKitObjects:v7 class:objc_opt_class()];
  id v9 = [v6 setByAddingObjectsFromSet:v8];

  return v9;
}

- (id)_itemsToUpdateForMediaProfileContainer:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [(HFItemManager *)self _itemsToUpdateForMediaSystemChange:v4];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v6 = [v4 accessories];
      id v7 = [(HFItemManager *)self _itemsToUpdateForModifiedAccessories:v6];

      goto LABEL_7;
    }
    NSLog(&cfstr_Mediaprofileco_1.isa, v4);
    uint64_t v5 = [MEMORY[0x263EFFA08] set];
  }
  id v7 = (void *)v5;
LABEL_7:

  return v7;
}

- (id)_itemsToUpdateForHomeKitKeyPaths:(id)a3 forHomeKitObjectIdentifiers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v13 = MEMORY[0x263EF8330];
  id v14 = v7;
  id v15 = v6;
  id v8 = v6;
  id v9 = v7;
  int v10 = [(HFItemManager *)self _allItemsIncludingInternalItems];
  uint64_t v11 = [(HFItemManager *)self _itemsWithDependenciesPassingTest:&v13 forItems:v10];

  return v11;
}

uint64_t __78__HFItemManager__itemsToUpdateForHomeKitKeyPaths_forHomeKitObjectIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 latestResults];
  uint64_t v5 = [v4 objectForKeyedSubscript:@"HFResultSettingParentIdentifiersDependenciesKey"];
  int v6 = [v5 intersectsSet:*(void *)(a1 + 32)];

  if (v6)
  {
    objc_opt_class();
    id v7 = [v3 latestResults];
    id v8 = [v7 objectForKeyedSubscript:@"HFResultSettingKeyPathsDependenciesKey"];
    if (objc_opt_isKindOfClass()) {
      id v9 = v8;
    }
    else {
      id v9 = 0;
    }
    id v10 = v9;

    uint64_t v11 = [*(id *)(a1 + 40) intersectsSet:v10];
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (id)_indexPathForItem:(id)a3 inDisplayedItemsArray:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7
    && (unint64_t v8 = [(HFItemManager *)self _sectionForItem:v6],
        uint64_t v9 = [v7 indexOfObjectIdenticalTo:v6],
        v9 != 0x7FFFFFFFFFFFFFFFLL))
  {
    id v10 = [MEMORY[0x263F088C8] indexPathForItem:v9 inSection:v8];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (id)_itemsToUpdateForApplicationResignActive
{
  return (id)[MEMORY[0x263EFFA08] set];
}

- (void)temperatureUnitObserver:(id)a3 didChangeTemperatureUnit:(BOOL)a4
{
  id v6 = [(HFItemManager *)self _allItemsIncludingInternalItems];
  id v8 = [(HFItemManager *)self _itemsWithDependenciesPassingTest:&__block_literal_global_525 forItems:v6];

  id v7 = [(HFItemManager *)self updateResultsForItems:v8 senderSelector:a2];
}

uint64_t __66__HFItemManager_temperatureUnitObserver_didChangeTemperatureUnit___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 latestResults];
  id v3 = [v2 objectForKeyedSubscript:@"tempreatureUnitDependency"];
  uint64_t v4 = [v3 BOOLValue];

  return v4;
}

- (void)settingsInvalidatedForNotificationCenter:(id)a3
{
  uint64_t v5 = [(HFItemManager *)self _allItemsIncludingInternalItems];
  objc_msgSend(v5, "na_filter:", &__block_literal_global_527);
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  id v6 = [(HFItemManager *)self updateResultsForItems:v7 senderSelector:a2];
}

uint64_t __58__HFItemManager_settingsInvalidatedForNotificationCenter___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 latestResults];
  id v3 = [v2 objectForKeyedSubscript:@"userNotificationSettingsDependency"];
  uint64_t v4 = [v3 BOOLValue];

  return v4;
}

- (id)_debug_itemManagerDescription
{
  id v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  id v6 = [(HFItemManager *)self delegate];
  id v7 = (objc_class *)objc_opt_class();
  id v8 = NSStringFromClass(v7);
  uint64_t v9 = [(HFItemManager *)self delegate];
  id v10 = [(HFItemManager *)self home];
  uint64_t v11 = objc_msgSend(v10, "hf_prettyDescription");
  uint64_t v12 = [(HFItemManager *)self disableUpdateReasons];
  uint64_t v13 = [v3 stringWithFormat:@"<%@:%p> delegate: <%@:%p> home: %@ disableUpdateReasons: {%@}", v5, self, v8, v9, v11, v12];

  return v13;
}

- (unint64_t)numberOfSections
{
  id v2 = [(HFItemManager *)self diffableDataSource];
  id v3 = [v2 snapshot];
  unint64_t v4 = [v3 numberOfSections];

  return v4;
}

- (id)attributedTitleForSection:(unint64_t)a3
{
  unint64_t v4 = [(HFItemManager *)self diffableDataSource];
  uint64_t v5 = [v4 snapshot];
  id v6 = [v5 sectionIdentifiers];
  id v7 = [v6 objectAtIndexedSubscript:a3];
  id v8 = [v7 attributedHeaderTitle];

  return v8;
}

- (id)footerTitleForSection:(unint64_t)a3
{
  unint64_t v4 = [(HFItemManager *)self diffableDataSource];
  uint64_t v5 = [v4 snapshot];
  id v6 = [v5 sectionIdentifiers];
  id v7 = [v6 objectAtIndexedSubscript:a3];
  id v8 = [v7 footerTitle];

  return v8;
}

- (id)attributedFooterTitleForSection:(unint64_t)a3
{
  unint64_t v4 = [(HFItemManager *)self diffableDataSource];
  uint64_t v5 = [v4 snapshot];
  id v6 = [v5 sectionIdentifiers];
  id v7 = [v6 objectAtIndexedSubscript:a3];
  id v8 = [v7 attributedFooterTitle];

  return v8;
}

- (id)itemSectionForSectionIndex:(unint64_t)a3
{
  unint64_t v4 = [(HFItemManager *)self diffableDataSource];
  uint64_t v5 = [v4 snapshot];
  id v6 = [v5 sectionIdentifiers];
  id v7 = [v6 objectAtIndexedSubscript:a3];

  return v7;
}

uint64_t __86__HFItemManager__batchItemUpdateFutureWrappers_removedItems_batchingIntervals_logger___block_invoke_2(uint64_t result)
{
  uint64_t v1 = *(void *)(*(void *)(result + 40) + 8);
  if (!*(unsigned char *)(v1 + 24))
  {
    *(unsigned char *)(v1 + 24) = 1;
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

void __59__HFItemManager__updateExternalUpdatesEnabled_reloadItems___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained recalculateVisibilityAndSortAllItems];
}

- (void)reloadUIRepresentationForItems:(id)a3 withAnimation:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(HFItemManager *)self diffableDataSource];
  id v8 = [v7 snapshot];

  [v8 reloadItemsWithIdentifiers:v6];
  [(HFItemManager *)self _applyReloadSnapshot:v8 withAnimation:v4];
}

- (void)reconfigureUIRepresentationForItems:(id)a3 withAnimation:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(HFItemManager *)self diffableDataSource];
  id v8 = [v7 snapshot];

  [v8 reconfigureItemsWithIdentifiers:v6];
  [(HFItemManager *)self _applyReloadSnapshot:v8 withAnimation:v4];
}

- (void)reloadUIRepresentationForSections:(id)a3 withAnimation:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(HFItemManager *)self diffableDataSource];
  id v8 = [v7 snapshot];

  [v8 reloadSectionsWithIdentifiers:v6];
  [(HFItemManager *)self _applyReloadSnapshot:v8 withAnimation:v4];
}

- (void)reloadUIRepresentationWithAnimation:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(HFItemManager *)self diffableDataSource];
  id v6 = [v5 snapshot];

  [(HFItemManager *)self _applyReloadSnapshot:v6 withAnimation:v3];
}

- (void)setIdentifier:(id)a3
{
}

- (void)setDiffableDataSourceDisabled:(BOOL)a3
{
  self->_BOOL diffableDataSourceDisabled = a3;
}

- (void)setChildItemsByParentItem:(id)a3
{
}

- (void)set_displayFilter:(id)a3
{
}

- (void)setSuppressedCharacteristicUpdatesByReason:(id)a3
{
}

- (void)setBatchedDelegateAdapterAllowingReads:(id)a3
{
}

- (void)setBatchedDelegateAdapterDisallowingReads:(id)a3
{
}

- (void)setUIDiffableDataInitializationFuture:(id)a3
{
}

- (OS_dispatch_queue)diffableDataSourceQueue
{
  return self->_diffableDataSourceQueue;
}

- (NAScheduler)diffableDataSourceScheduler
{
  return self->_diffableDataSourceScheduler;
}

- (OS_dispatch_group)mainThreadLoadGroup
{
  return self->_mainThreadLoadGroup;
}

- (void)setMainThreadLoadGroup:(id)a3
{
}

- (id)matterSnapshotObserverCancelable
{
  return self->_matterSnapshotObserverCancelable;
}

- (void)setMatterSnapshotObserverCancelable:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_matterSnapshotObserverCancelable, 0);
  objc_storeStrong((id *)&self->_latestSnapshotGenerationFuture, 0);
  objc_storeStrong((id *)&self->_mainThreadLoadGroup, 0);
  objc_storeStrong((id *)&self->_diffableDataSourceScheduler, 0);
  objc_storeStrong((id *)&self->_diffableDataSourceQueue, 0);
  objc_storeStrong((id *)&self->_UIDiffableDataInitializationFuture, 0);
  objc_storeStrong((id *)&self->_firstFullUpdateFuture, 0);
  objc_storeStrong((id *)&self->_batchedDelegateAdapterDisallowingReads, 0);
  objc_storeStrong((id *)&self->_batchedDelegateAdapterAllowingReads, 0);
  objc_storeStrong((id *)&self->_disableUpdateReasons, 0);
  objc_storeStrong((id *)&self->_suppressedCharacteristicUpdatesByReason, 0);
  objc_storeStrong(&self->__displayFilter, 0);
  objc_storeStrong((id *)&self->_childItemsByParentItem, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_lastUpdatedHome, 0);
  objc_storeStrong((id *)&self->_moduleItemProviderSet, 0);
  objc_storeStrong((id *)&self->_subclassItemProviderSet, 0);
  objc_storeStrong((id *)&self->_diffableDataSource, 0);
  objc_storeStrong((id *)&self->_firstFastUpdateFuture, 0);
  objc_storeStrong((id *)&self->_readPolicy, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_itemModules, 0);
  objc_storeStrong((id *)&self->_itemProviders, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_sourceItem, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (id)moveItemFromIndexPath:(id)a3 toIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 section];
  if (v8 == [v7 section])
  {
    uint64_t v9 = [(HFItemManager *)self displayedItemAtIndexPath:v6];
    id v10 = [(HFItemManager *)self displayedItemAtIndexPath:v7];
    uint64_t v11 = [v6 section];
    uint64_t v12 = [(HFItemManager *)self diffableDataSource];
    uint64_t v13 = [v12 snapshot];

    uint64_t v14 = [v6 row];
    if (v14 < [v7 row]) {
      [v13 moveItemWithIdentifier:v9 afterItemWithIdentifier:v10];
    }
    uint64_t v15 = [v6 row];
    if (v15 > [v7 row]) {
      [v13 moveItemWithIdentifier:v9 beforeItemWithIdentifier:v10];
    }
    id v16 = (void *)MEMORY[0x263F58190];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __71__HFItemManager_DiffableDataSource__moveItemFromIndexPath_toIndexPath___block_invoke;
    void v20[3] = &unk_26408C8F0;
    id v21 = v13;
    uint64_t v22 = v11;
    id v17 = v13;
    long long v18 = [v16 futureWithBlock:v20];
  }
  else
  {
    long long v18 = [MEMORY[0x263F58190] futureWithNoResult];
  }

  return v18;
}

void __71__HFItemManager_DiffableDataSource__moveItemFromIndexPath_toIndexPath___block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 sectionIdentifiers];
  id v7 = [v5 objectAtIndexedSubscript:*(void *)(a1 + 40)];

  id v6 = [*(id *)(a1 + 32) itemIdentifiersInSectionWithIdentifier:v7];
  [v4 finishWithResult:v6];
}

- (void)_applyReloadSnapshot:(id)a3 withAnimation:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __72__HFItemManager_DiffableDataSource___applyReloadSnapshot_withAnimation___block_invoke;
  aBlock[3] = &unk_26408D450;
  void aBlock[4] = self;
  id v7 = v6;
  id v14 = v7;
  uint64_t v8 = (void (**)(void))_Block_copy(aBlock);
  uint64_t v9 = v8;
  if (v4)
  {
    v8[2](v8);
  }
  else
  {
    id v10 = (void *)MEMORY[0x263F1CB60];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    void v11[2] = __72__HFItemManager_DiffableDataSource___applyReloadSnapshot_withAnimation___block_invoke_4;
    v11[3] = &unk_264098FC0;
    uint64_t v12 = v8;
    [v10 performWithoutAnimation:v11];
  }
}

void __72__HFItemManager_DiffableDataSource___applyReloadSnapshot_withAnimation___block_invoke(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  id v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __72__HFItemManager_DiffableDataSource___applyReloadSnapshot_withAnimation___block_invoke_2;
  v3[3] = &unk_264094858;
  objc_copyWeak(&v5, &location);
  id v4 = *(id *)(a1 + 40);
  [v2 applyWithBlock:v3];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

id __72__HFItemManager_DiffableDataSource___applyReloadSnapshot_withAnimation___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = objc_alloc_init(MEMORY[0x263F58190]);
  id v4 = [WeakRetained diffableDataSource];
  uint64_t v5 = *(void *)(a1 + 32);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __72__HFItemManager_DiffableDataSource___applyReloadSnapshot_withAnimation___block_invoke_3;
  v8[3] = &unk_26408DDE0;
  id v6 = v3;
  id v9 = v6;
  [v4 applySnapshot:v5 animatingDifferences:1 completion:v8];

  return v6;
}

uint64_t __72__HFItemManager_DiffableDataSource___applyReloadSnapshot_withAnimation___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishWithNoResult];
}

uint64_t __72__HFItemManager_DiffableDataSource___applyReloadSnapshot_withAnimation___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)shouldPerformInitialLoadOnMainThread
{
  return 0;
}

void __94__HFItemManager_DiffableDataSource__applySnapshotForUpdatedExternalItems_removedItems_logger___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = [a3 items];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __94__HFItemManager_DiffableDataSource__applySnapshotForUpdatedExternalItems_removedItems_logger___block_invoke_4;
  v6[3] = &unk_26409A998;
  uint64_t v5 = *(void **)(a1 + 40);
  void v6[4] = *(void *)(a1 + 32);
  id v7 = v5;
  id v8 = *(id *)(a1 + 48);
  id v9 = *(id *)(a1 + 56);
  objc_msgSend(v4, "na_each:", v6);
}

void __94__HFItemManager_DiffableDataSource__applySnapshotForUpdatedExternalItems_removedItems_logger___block_invoke_4(id *a1, void *a2)
{
  id v9 = a2;
  id v3 = [a1[4] diffableDataSource];
  id v4 = [v3 snapshot];
  uint64_t v5 = [v4 itemIdentifiers];
  int v6 = [v5 containsObject:v9];

  if (v6)
  {
    if (![a1[5] containsObject:v9]) {
      goto LABEL_6;
    }
    id v7 = v9;
    id v8 = a1 + 6;
  }
  else
  {
    id v7 = v9;
    id v8 = a1 + 7;
  }
  [*v8 addObject:v7];
LABEL_6:
}

void __94__HFItemManager_DiffableDataSource__applySnapshotForUpdatedExternalItems_removedItems_logger___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = (objc_class *)MEMORY[0x263F58190];
  id v6 = a3;
  id v7 = a2;
  id v8 = objc_alloc_init(v5);
  [*(id *)(a1 + 32) addObject:v8];
  id v9 = [*(id *)(a1 + 40) diffableDataSource];
  uint64_t v10 = *(unsigned __int8 *)(a1 + 48);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  void v12[2] = __94__HFItemManager_DiffableDataSource__applySnapshotForUpdatedExternalItems_removedItems_logger___block_invoke_7;
  v12[3] = &unk_26408DDE0;
  id v13 = v8;
  id v11 = v8;
  [v9 applySnapshot:v6 toSection:v7 animatingDifferences:v10 completion:v12];
}

uint64_t __94__HFItemManager_DiffableDataSource__applySnapshotForUpdatedExternalItems_removedItems_logger___block_invoke_7(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishWithNoResult];
}

- (BOOL)_shouldPerformUpdateOnMainThread
{
  BOOL v3 = [(HFItemManager *)self useCustomDiffableDataSource]
    || [(HFItemManager *)self diffableDataSourceDisabled];
  id v4 = [(HFItemManager *)self mainThreadLoadGroup];
  if (v4)
  {
    uint64_t v5 = [(HFItemManager *)self mainThreadLoadGroup];
    BOOL v6 = dispatch_group_wait(v5, 0) != 0;
  }
  else
  {
    BOOL v6 = 1;
  }

  return v3 | ([(HFItemManager *)self shouldPerformInitialLoadOnMainThread] && v6);
}

@end