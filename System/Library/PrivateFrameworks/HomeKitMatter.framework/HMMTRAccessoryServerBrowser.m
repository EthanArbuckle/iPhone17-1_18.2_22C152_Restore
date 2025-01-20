@interface HMMTRAccessoryServerBrowser
+ (id)logCategory;
- (BOOL)_createFabricKeyPairsIfAbsent;
- (BOOL)_createOperationalKeyPairIfAbsent;
- (BOOL)_delegateRespondsToSelector:(SEL)a3;
- (BOOL)_isDeviceIDPaired:(id)a3 nodeID:(id *)a4 fabricID:(id *)a5;
- (BOOL)_isDevicePaired:(unint64_t)a3;
- (BOOL)_isNodeIDPaired:(id)a3 fabricID:(id *)a4;
- (BOOL)_isPerControllerStorageEnabled;
- (BOOL)_isSystemCommissionerFeaturePreferenceEnabled;
- (BOOL)_loadFabricKeyPairs;
- (BOOL)_tryAddAccessoryConnectionRequestToExistingFabric:(id)a3;
- (BOOL)bleScanActive;
- (BOOL)canEstablishConnectionForNodeID:(id)a3;
- (BOOL)connectionRequestSuspended;
- (BOOL)isCurrentDeviceAllowedAccessoryControlDespiteReachableResident;
- (BOOL)isCurrentDeviceAllowedAccessoryControlDespiteReachableResidentForFabric:(id)a3;
- (BOOL)isCurrentDeviceAllowedAccessoryControlPerExplicitRequestDespiteReachableResidentForFabric:(id)a3;
- (BOOL)isCurrentDeviceMobileAndAllowedAccessoryControl;
- (BOOL)isCurrentDeviceMobileAndResidentReachable;
- (BOOL)isCurrentDeviceMobileAndResidentReachableAndThreadCapableForFabric:(id)a3;
- (BOOL)isCurrentDevicePrimaryResident;
- (BOOL)isOperationAllowedForAccessoryServer:(id)a3;
- (BOOL)isOwnerForHomeWithFabric:(id)a3;
- (BOOL)isSystemCommissionerFeatureEnabled;
- (BOOL)isSystemCommissionerMode;
- (BOOL)lockStateNotificationRegistered;
- (BOOL)pendingMatterStackRestart;
- (BOOL)preWarmTargetIsSystemCommissionerFabric;
- (BOOL)preventThreadStopDuringStackRestart;
- (BOOL)requestedBLEScan;
- (BOOL)supportsCommissioningCertificateRetrievalForCurrentlyPairingAccessory;
- (BOOL)supportsCommissioningCertificateRetrievalForHomeUUID:(id)a3;
- (BOOL)systemCommissionerMode;
- (BOOL)userOwnsConfiguredPreWarmTargetFabric;
- (CBCentralManager)cbCentral;
- (HAPAccessoryServerBrowserDelegate)delegate;
- (HAPPowerManager)powerManager;
- (HMFTimer)diagnosticsTimer;
- (HMMTRAccessoryServer)commissioneeAccessoryServer;
- (HMMTRAccessoryServerBrowser)initWithQueue:(id)a3 storeDirectoryURL:(id)a4;
- (HMMTRAccessoryServerBrowserDelegate)accessoryServerBrowserDelegate;
- (HMMTRAttestationDataStore)attestationDataStore;
- (HMMTRAttestationStatus)attestationStatus;
- (HMMTRControllerFactory)controllerFactory;
- (HMMTRControllerWrapper)systemCommissionerControllerWrapper;
- (HMMTRFabricControllerStore)homeFabricControllers;
- (HMMTRMatterKeypair)nocSigner;
- (HMMTRMatterKeypair)ownerLocalOperationalKeyPair;
- (HMMTRMatterKeypair)ownerSharedOperationalKeyPair;
- (HMMTRMatterKeypair)systemCommissionerNocSigner;
- (HMMTROTAProviderDelegate)otaProviderDelegate;
- (HMMTRPairingWindowInfoTable)pairingWindowInfoTable;
- (HMMTRRegulatoryInfo)regulatoryInfo;
- (HMMTRResidentStateManager)residentStateManager;
- (HMMTRSoftwareUpdateProvider)softwareUpdateProvider;
- (HMMTRStorage)storage;
- (HMMTRSystemCommissionerControllerParams)systemCommissionerControllerParams;
- (HMMTRSystemCommissionerPairingManager)systemCommissionerPairingManager;
- (HMMTRThreadRadioManager)threadRadioManager;
- (HMMTRThreadSoftwareUpdateController)threadSoftwareUpdateController;
- (HMMTRUIDialogPresenter)uiDialogPresenter;
- (HMMTRUserAuthorizationForPairing)userAuthorizationForPairing;
- (HMMTRVendorMetadataStore)vendorMetadataStore;
- (MTRDeviceController)deviceController;
- (NSData)appleHomeFabricRootPublicKey;
- (NSData)systemCommissionerFabricRootPublicKey;
- (NSDate)diagnosticTimerStart;
- (NSDictionary)matterStorageItems;
- (NSMutableArray)bonjourBrowserChanges;
- (NSMutableArray)deviceControllerHandlers;
- (NSMutableSet)allowedNodeIDsForConnectionRequests;
- (NSMutableSet)nodesAddedToHome;
- (NSMutableSet)nodesWithPendingACLOverwrite;
- (NSMutableSet)stagedAccessoryServers;
- (NSNumber)configuredPreWarmTargetFabricID;
- (NSNumber)currentFabricID;
- (NSNumber)preWarmedFabricID;
- (NSNumber)systemCommissionerFabricID;
- (NSSet)fabricsWithActiveClients;
- (NSSet)fabricsWithActiveSecondaryClients;
- (OS_dispatch_group)configureDispatchGroup;
- (OS_dispatch_queue)delegateQueue;
- (OS_nw_browser)bonjourBrowser;
- (id)_allServers;
- (id)_createCHIPAccessoryForNodeID:(unint64_t)a3;
- (id)_createCHIPAccessoryForNodeID:(unint64_t)a3 ifPaired:(BOOL)a4 fatalError:(id *)a5;
- (id)_currentHomeFabricDeviceController;
- (id)_currentHomeFabricDeviceControllerStartupParams;
- (id)_currentHomeFabricDeviceControllerStartupParams1;
- (id)_currentHomeFabricDeviceControllerStartupParams2;
- (id)_discoveredServerWithDiscriminator:(id)a3 vendorID:(id)a4 productID:(id)a5;
- (id)_getSystemCommissionerFabricRootCertificateWithIndex:(id)a3 ipk:(id *)a4 controllerNodeID:(id *)a5;
- (id)_populateControllerFactoryParams;
- (id)_serverFromMTSDevicePairing:(id)a3;
- (id)accessoryServerWithNodeID:(id)a3;
- (id)appleHomeFabricWithID:(id)a3;
- (id)appleHomeFabricWithUUID:(id)a3;
- (id)appleHomeTargetFabricUUIDWithID:(id)a3;
- (id)controllerFactoryEnablePerPrimaryResidentConfirmationToken;
- (id)createSystemCommissionerFabricNOCWithSigningCertificate:(id)a3 operationalPublicKey:(__SecKey *)a4 fabricID:(id)a5 nodeID:(id)a6 caseAuthenticatedTags:(id)a7 error:(id *)a8;
- (id)currentFabric;
- (id)currentHomeFabricDeviceControllerWrapper;
- (id)discoveredAccessoryServers;
- (id)fabricsWithActiveConnections;
- (id)fabricsWithPendingConnections;
- (id)logIdentifier;
- (id)nodeIDForFabricID:(id)a3 deviceIdentifier:(id)a4;
- (id)stagedAccessoryServerWithIdentifier:(id)a3;
- (int)_discriminator:(id *)a3 vendorID:(id *)a4 productID:(id *)a5 CM:(id *)a6 fromTXTRecord:(id)a7;
- (int)_initializeAndStartBonjourBrowser;
- (int)homeKeychainReadyNotificationToken;
- (int)lockStateNotificationRegistrationToken;
- (int)mtsKeychainReadyNotificationToken;
- (int64_t)linkType;
- (unint64_t)_generateNodeID;
- (unint64_t)_getRandomFabricId;
- (unint64_t)browserState;
- (unint64_t)restartCount;
- (void)_abortAllOperationsForFabricID:(id)a3 reason:(id)a4;
- (void)_accessoryServerForSystemCommissionerDeviceWithNodeID:(id)a3 completionHandler:(id)a4;
- (void)_addToActiveFabrics:(id)a3;
- (void)_addToPendingFabrics:(id)a3;
- (void)_cleanupDisappearedServersOverBLE;
- (void)_cleanupDiscoveredServers;
- (void)_cleanupDiscoveredServersWithReason:(id)a3 completion:(id)a4;
- (void)_cleanupLocallyDiscoveredServers;
- (void)_cleanupStagedServers;
- (void)_clearLocallyDiscoveredFlags;
- (void)_connectPendingFabricConnections;
- (void)_connectPendingFabricConnectionsForFabricID:(id)a3;
- (void)_deleteOldPairings;
- (void)_disconnectFromIdleFabric:(id)a3 reason:(id)a4;
- (void)_establishConnectionWhenAllowedWithAccessoryConnectionRequest:(id)a3;
- (void)_establishConnectionWhenAllowedWithFabricConnectionRequest:(id)a3;
- (void)_fetchDevicePairingsForSystemCommissionerDeviceWithNodeID:(id)a3 completionHandler:(id)a4;
- (void)_handleAddOrUpdateWithDiscriminator:(id)a3 vendorID:(id)a4 productID:(id)a5 overBLE:(BOOL)a6;
- (void)_handleBLEAddOrUpdateWithDiscriminator:(id)a3 vendorID:(id)a4 productID:(id)a5;
- (void)_handleBonjourAddOrUpdateWithDiscriminator:(id)a3 vendorID:(id)a4 productID:(id)a5;
- (void)_handleBonjourBrowserBatchResults;
- (void)_handleBonjourRemoveWithDiscriminator:(id)a3 vendorID:(id)a4 productID:(id)a5 txtRecordRemove:(BOOL)a6;
- (void)_handleClientsRemovedWithFabricID:(id)a3 updateConnectionIdleTimeout:(BOOL)a4 reason:(id)a5;
- (void)_handleLockStateNotification;
- (void)_invalidateAccessoryServer:(id)a3 reason:(id)a4 withCompletion:(id)a5;
- (void)_logHMMTRFeatures;
- (void)_notifyDelegateOfPairingStep:(unint64_t)a3;
- (void)_operationsCompletedForFabricConnectionRequest:(id)a3 reason:(id)a4;
- (void)_preWarmCommissioningSession;
- (void)_prepareForPairingWithSetupPayload:(id)a3 fabricID:(id)a4 controllerWrapper:(id)a5 hasPriorSuccessfulPairing:(BOOL)a6 category:(id)a7 completionHandler:(id)a8;
- (void)_prepareServerForBLEDiscovery;
- (void)_queueBonjourBrowserOldResult:(id)a3 newResult:(id)a4;
- (void)_reenumeratePairedDevices;
- (void)_removeFromActiveFabrics:(id)a3;
- (void)_removeFromPendingFabrics:(id)a3;
- (void)_reportAccessoriesKnownToSystemCommissioner;
- (void)_restartDiscovery;
- (void)_setReachability:(BOOL)a3 forServer:(id)a4;
- (void)_setupAndPersistStorageStateForHomeFabricID:(id)a3 completion:(id)a4;
- (void)_setupPairedDevices;
- (void)_setupStorageStateAfterCertFetchForHomeFabricID:(id)a3 completion:(id)a4;
- (void)_setupStorageStateForHomeFabricID:(id)a3;
- (void)_setupStorageStateForUpdatedHomeFabricID:(id)a3;
- (void)_setupStorageStateForUpdatedHomeFabricID:(id)a3 rediscoverAccessories:(BOOL)a4;
- (void)_setupStorageStateForUpdatedHomeFabricID:(id)a3 rediscoverAccessories:(BOOL)a4 overrideAccessoryControlAllowed:(BOOL)a5;
- (void)_setupStorageStateIfNotFabricID:(id)a3 rediscoverAccessories:(BOOL)a4;
- (void)_stageAccessoryServerWithSetupPayload:(id)a3 deviceCredentialHandler:(id)a4 wifiScanResultsHandler:(id)a5 threadScanResultsHandler:(id)a6 readyToCancelHandler:(id)a7 progressUpdateHandler:(id)a8 scanningNetworks:(BOOL)a9 hasPriorSuccessfulPairing:(BOOL)a10 category:(id)a11 completionHandler:(id)a12;
- (void)_stopMatterStackWithReason:(id)a3;
- (void)_stopSystemCommissionerFabricID:(id)a3 reason:(id)a4;
- (void)_suspendOperationsForFabricID:(id)a3;
- (void)_updateACLOnPairedAccessories;
- (void)_updateAccessoryControlListForServer:(id)a3 completion:(id)a4;
- (void)_updateCentralManager;
- (void)_updateLocallyDiscoveredServerPairedStates;
- (void)abortAndSuspendAllOperationsWithReason:(id)a3;
- (void)abortOperationsForAccessoryServer:(id)a3 reason:(id)a4;
- (void)accessoryServerForSystemCommissionerDeviceWithNodeID:(id)a3 completionHandler:(id)a4;
- (void)addFabricWithActiveClientForFabricID:(id)a3;
- (void)addFabricWithActiveClients:(id)a3;
- (void)addFabricWithActiveSecondaryClients:(id)a3;
- (void)announceOtaProviderForNodeID:(id)a3;
- (void)cacheOperationalCertificate:(id)a3 fabricID:(id)a4;
- (void)centralManager:(id)a3 didDiscoverPeripheral:(id)a4 advertisementData:(id)a5 RSSI:(id)a6;
- (void)centralManagerDidUpdateState:(id)a3;
- (void)cleanUpStaleSystemCommissionerPairingsWithNewlyPairedUUID:(id)a3 vendorID:(id)a4 productID:(id)a5 serialNumber:(id)a6 setupPayload:(id)a7;
- (void)clearPreWarmTarget;
- (void)commitStagedAccessoryServer:(id)a3;
- (void)configure;
- (void)configureControllerForFabric:(id)a3;
- (void)connectToAccessoryWhenAllowed:(id)a3 highPriority:(BOOL)a4 completion:(id)a5;
- (void)createMatterOperationalKeyPairIfAbsentWithCompletion:(id)a3;
- (void)createNewFabricDataForFabric:(id)a3 completion:(id)a4;
- (void)createNewFabricDataForFabricID:(id)a3 completion:(id)a4;
- (void)createNewFabricIDWithCompletion:(id)a3;
- (void)createNewSystemCommissionerFabricNodeIDWithCompletion:(id)a3;
- (void)dealloc;
- (void)didFinishPairingAccessoryServer:(id)a3 operationDisabled:(BOOL)a4;
- (void)disableUnrestrictedOperationsForAccessoryServer:(id)a3;
- (void)discardStagedAccessoryServerWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)discoverAccessoryServerWithIdentifier:(id)a3;
- (void)discoverAccessoryServerWithNodeID:(id)a3 completion:(id)a4;
- (void)dispatchAfter:(unint64_t)a3 block:(id)a4;
- (void)dispatchAfterConfiguration:(id)a3;
- (void)dispatchBlock:(id)a3;
- (void)enableUnrestrictedOperationsForAccessoryServer:(id)a3;
- (void)fetchAllDevicePairingsForSystemCommissionerDeviceWithNodeID:(id)a3 completionHandler:(id)a4;
- (void)fetchCachedOperationalCertificateForFabricID:(id)a3 completionHandler:(id)a4;
- (void)fetchCertificatesForMatterNodeWithCommissionerNodeID:(id)a3 commissioneeNodeID:(id)a4 forOwner:(BOOL)a5 publicKey:(id)a6 fabricID:(id)a7 completionHandler:(id)a8;
- (void)fetchCommissioningCertificatesForAccessoryWithOperationalPublicKey:(id)a3 rootCertificate:(id)a4 completionHandler:(id)a5;
- (void)fetchCommissioningCertificatesForSharedAdminWithDeviceNodeID:(id)a3 forOwner:(BOOL)a4 publicKey:(id)a5 fabricID:(id)a6 completionHandler:(id)a7;
- (void)fetchCommissioningCertificatesFromOwnerForPublicKey:(id)a3 fabricID:(id)a4 completionHandler:(id)a5;
- (void)fetchPreferredThreadCredentialsForServer:(id)a3 withCompletion:(id)a4;
- (void)fetchSystemCommissionerRootCertificateWithCompletion:(id)a3;
- (void)finishSystemCommissionerFabricCommissioningWithFabricID:(id)a3 rootCACert:(id)a4 ipk:(id)a5 controllerNodeID:(id)a6 commissioneeNodeID:(id)a7 queue:(id)a8 completion:(id)a9;
- (void)getNOCFromResidentForSharedUserForFabric:(id)a3;
- (void)handleDeviceNoLongerPrimaryResidentWithCompletion:(id)a3;
- (void)handleHomeAddedAccessoryWithNodeID:(id)a3 fabric:(id)a4;
- (void)handleHomeDeletionWithFabric:(id)a3;
- (void)handleHomeRemovedAccessoryWithNodeID:(id)a3;
- (void)handlePairingCompletionForAccessoryWithNodeID:(id)a3 fabricID:(id)a4 vendorID:(id)a5 productID:(id)a6 configNumber:(id)a7 category:(id)a8 topology:(id)a9;
- (void)handlePairingForThreadAccessoryWithFabricID:(id)a3 nodeID:(id)a4;
- (void)handlePrimaryResidentDataReady;
- (void)handleResidentReachabilityChangeForFabric:(id)a3;
- (void)handleSystemKeychainStoreUpdatedNotification:(id)a3;
- (void)handleThreadNetworkStateChangedNotification:(id)a3;
- (void)handleThreadRadioStateChanged;
- (void)handleUpdateNotificationsEnabled:(BOOL)a3 forFabric:(id)a4 keepAliveOnly:(BOOL)a5;
- (void)indicateNotificationFromServer:(id)a3 notifyType:(unint64_t)a4 withDictionary:(id)a5;
- (void)invalidateAccessoryServer:(id)a3 reason:(id)a4;
- (void)invalidateAccessoryServer:(id)a3 reason:(id)a4 withCompletion:(id)a5;
- (void)invalidateAllDiscoveredServersWithReason:(id)a3 completion:(id)a4;
- (void)matchAccessoryServerWithSetupID:(id)a3 serverIdentifier:(id)a4 completionHandler:(id)a5;
- (void)notifyPairingCompletionForAccessoryServer:(id)a3;
- (void)openCommissioningWindowForSystemCommissionerDeviceWithNodeID:(id)a3 duration:(double)a4 completionHandler:(id)a5;
- (void)operationsStartedForFabricConnectionRequest:(id)a3;
- (void)prepareForPairingWithSetupPayload:(id)a3 fabric:(id)a4 targetFabricUUID:(id)a5 fabricID:(id)a6 owner:(BOOL)a7 ownerCertFetchSupported:(BOOL)a8 completionHandler:(id)a9;
- (void)readCommissioningWindowStatusForSystemCommissionerDeviceWithNodeID:(id)a3 completionHandler:(id)a4;
- (void)registerPairingWindowWithSetupPayload:(id)a3 duration:(double)a4 accessoryServer:(id)a5;
- (void)removeActiveClientWithFabricID:(id)a3 updateConnectionIdleTimeout:(BOOL)a4 reason:(id)a5;
- (void)removeActiveSecondaryClientWithFabricID:(id)a3 updateConnectionIdleTimeout:(BOOL)a4 reason:(id)a5;
- (void)removeAllDevicePairingsForSystemCommissionerDeviceWithNodeID:(id)a3 completionHandler:(id)a4;
- (void)removeDevicePairingFabricForSystemCommissionerDeviceWithNodeID:(id)a3 fabric:(id)a4 completionHandler:(id)a5;
- (void)removeFabricWithActiveClients:(id)a3;
- (void)removeFabricWithActiveSecondaryClients:(id)a3;
- (void)removeSystemCommissionerFabricAccessoryWithNodeID:(id)a3 completionHandler:(id)a4;
- (void)restartDiscovery;
- (void)resumeAllOperations;
- (void)setAccessoryServerBrowserDelegate:(id)a3;
- (void)setBleScanActive:(BOOL)a3;
- (void)setBonjourBrowser:(id)a3;
- (void)setBonjourBrowserChanges:(id)a3;
- (void)setBrowserState:(unint64_t)a3;
- (void)setCbCentral:(id)a3;
- (void)setCommissioneeAccessoryServer:(id)a3;
- (void)setConfiguredPreWarmTargetFabricID:(id)a3;
- (void)setConnectionRequestSuspended:(BOOL)a3;
- (void)setControllerFactoryEnablePerPrimaryResidentConfirmationToken:(id)a3;
- (void)setCurrentFabricID:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDelegate:(id)a3 queue:(id)a4;
- (void)setDelegateQueue:(id)a3;
- (void)setDiagnosticTimerStart:(id)a3;
- (void)setDiagnosticsTimer:(id)a3;
- (void)setHomeKeychainReadyNotificationToken:(int)a3;
- (void)setLockStateNotificationRegistered:(BOOL)a3;
- (void)setLockStateNotificationRegistrationToken:(int)a3;
- (void)setMatterStorageItems:(id)a3;
- (void)setMtsKeychainReadyNotificationToken:(int)a3;
- (void)setNocSigner:(id)a3;
- (void)setNodesAddedToHome:(id)a3;
- (void)setNodesWithPendingACLOverwrite:(id)a3;
- (void)setOwnerLocalOperationalKeyPair:(id)a3;
- (void)setOwnerSharedOperationalKeyPair:(id)a3;
- (void)setPendingMatterStackRestart:(BOOL)a3;
- (void)setPowerManager:(id)a3;
- (void)setPreWarmTargetIsSystemCommissionerFabric:(BOOL)a3;
- (void)setPreWarmTargetToFabricWithID:(id)a3 isOwner:(BOOL)a4;
- (void)setPreWarmTargetToSystemCommissionerFabric;
- (void)setPreWarmedFabricID:(id)a3;
- (void)setPreventThreadStopDuringStackRestart:(BOOL)a3;
- (void)setRequestedBLEScan:(BOOL)a3;
- (void)setRestartCount:(unint64_t)a3;
- (void)setSystemCommissionerMode:(BOOL)a3;
- (void)setSystemCommissionerPairingManager:(id)a3;
- (void)setUserOwnsConfiguredPreWarmTargetFabric:(BOOL)a3;
- (void)setupPairedDevices;
- (void)setupStorageStateAfterCertFetchForHomeFabricID:(id)a3 completion:(id)a4;
- (void)setupStorageStateAndRediscoverAccessoriesForHomeFabricID:(id)a3;
- (void)setupStorageStateForHomeFabricID:(id)a3;
- (void)setupStorageStateForHomeFabricID:(id)a3 completion:(id)a4;
- (void)setupStorageStateWithoutRediscoveringAccessoriesForHomeFabricID:(id)a3;
- (void)stageAccessoryServerWithSetupPayload:(id)a3 fabricID:(id)a4 completionHandler:(id)a5;
- (void)stageAccessoryServerWithSetupPayload:(id)a3 fabricID:(id)a4 deviceCredentialHandler:(id)a5 wifiScanResultsHandler:(id)a6 threadScanResultsHandler:(id)a7 readyToCancelHandler:(id)a8 progressUpdateHandler:(id)a9 scanningNetworks:(BOOL)a10 completionHandler:(id)a11;
- (void)stageAccessoryServerWithSetupPayload:(id)a3 hasPriorSuccessfulPairing:(BOOL)a4 category:(id)a5 completionHandler:(id)a6;
- (void)startBluetoothScan;
- (void)startDiscoveringAccessoryServers;
- (void)stopBluetoothScan;
- (void)stopDiscoveringAccessoryServers;
- (void)storageDidBecomeAvailable:(id)a3;
- (void)storageDidUpdateData:(id)a3 isLocalChange:(BOOL)a4;
- (void)updateAccessoryACLAndGetNOCFromResidentForSharedUserForFabric:(id)a3;
- (void)waitForDeviceControllerWithCompletion:(id)a3;
@end

@implementation HMMTRAccessoryServerBrowser

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nodesAddedToHome, 0);
  objc_storeStrong((id *)&self->_homeFabricControllers, 0);
  objc_storeStrong((id *)&self->_systemCommissionerControllerParams, 0);
  objc_storeStrong((id *)&self->_controllerFactory, 0);
  objc_storeStrong((id *)&self->_pairingWindowInfoTable, 0);
  objc_storeStrong((id *)&self->_commissioneeAccessoryServer, 0);
  objc_storeStrong((id *)&self->_regulatoryInfo, 0);
  objc_storeStrong((id *)&self->_ownerLocalOperationalKeyPair, 0);
  objc_storeStrong((id *)&self->_ownerSharedOperationalKeyPair, 0);
  objc_storeStrong((id *)&self->_nocSigner, 0);
  objc_storeStrong((id *)&self->_configureDispatchGroup, 0);
  objc_storeStrong((id *)&self->_deviceControllerHandlers, 0);
  objc_storeStrong((id *)&self->_nodesWithPendingACLOverwrite, 0);
  objc_storeStrong(&self->_controllerFactoryEnablePerPrimaryResidentConfirmationToken, 0);
  objc_storeStrong((id *)&self->_preWarmedFabricID, 0);
  objc_storeStrong((id *)&self->_configuredPreWarmTargetFabricID, 0);
  objc_storeStrong((id *)&self->_matterStorageItems, 0);
  objc_storeStrong((id *)&self->_diagnosticTimerStart, 0);
  objc_storeStrong((id *)&self->_diagnosticsTimer, 0);
  objc_storeStrong((id *)&self->_cbCentral, 0);
  objc_storeStrong((id *)&self->_bonjourBrowserChanges, 0);
  objc_storeStrong((id *)&self->_bonjourBrowser, 0);
  objc_storeStrong((id *)&self->_powerManager, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_otaProviderDelegate, 0);
  objc_storeStrong((id *)&self->_stagedAccessoryServers, 0);
  objc_storeStrong((id *)&self->_currentFabricID, 0);
  objc_storeStrong((id *)&self->_threadSoftwareUpdateController, 0);
  objc_storeStrong((id *)&self->_softwareUpdateProvider, 0);
  objc_storeStrong((id *)&self->_threadRadioManager, 0);
  objc_destroyWeak((id *)&self->_accessoryServerBrowserDelegate);
  objc_storeStrong((id *)&self->_systemCommissionerPairingManager, 0);
  objc_storeStrong((id *)&self->_uiDialogPresenter, 0);
  objc_storeStrong((id *)&self->_userAuthorizationForPairing, 0);
  objc_storeStrong((id *)&self->_attestationStatus, 0);
  objc_storeStrong((id *)&self->_attestationDataStore, 0);
  objc_storeStrong((id *)&self->_vendorMetadataStore, 0);
  objc_storeStrong((id *)&self->_residentStateManager, 0);
  objc_storeStrong((id *)&self->_storage, 0);
  objc_storeStrong((id *)&self->_allowedNodeIDsForConnectionRequests, 0);
  objc_storeStrong((id *)&self->_fabricsWithPendingConnections, 0);
  objc_storeStrong((id *)&self->_fabricsWithActiveConnections, 0);
  objc_storeStrong((id *)&self->_fabricsWithActiveSecondaryClients, 0);
  objc_storeStrong((id *)&self->_fabricsWithActiveClients, 0);
  objc_storeStrong((id *)&self->_discoveredAccessoryServers, 0);
}

- (void)setNodesAddedToHome:(id)a3
{
}

- (NSMutableSet)nodesAddedToHome
{
  return self->_nodesAddedToHome;
}

- (HMMTRFabricControllerStore)homeFabricControllers
{
  return (HMMTRFabricControllerStore *)objc_getProperty(self, a2, 456, 1);
}

- (HMMTRSystemCommissionerControllerParams)systemCommissionerControllerParams
{
  return self->_systemCommissionerControllerParams;
}

- (HMMTRControllerFactory)controllerFactory
{
  return self->_controllerFactory;
}

- (HMMTRPairingWindowInfoTable)pairingWindowInfoTable
{
  return (HMMTRPairingWindowInfoTable *)objc_getProperty(self, a2, 432, 1);
}

- (void)setCommissioneeAccessoryServer:(id)a3
{
}

- (HMMTRAccessoryServer)commissioneeAccessoryServer
{
  return self->_commissioneeAccessoryServer;
}

- (HMMTRRegulatoryInfo)regulatoryInfo
{
  return self->_regulatoryInfo;
}

- (void)setOwnerLocalOperationalKeyPair:(id)a3
{
}

- (HMMTRMatterKeypair)ownerLocalOperationalKeyPair
{
  return self->_ownerLocalOperationalKeyPair;
}

- (void)setOwnerSharedOperationalKeyPair:(id)a3
{
}

- (HMMTRMatterKeypair)ownerSharedOperationalKeyPair
{
  return self->_ownerSharedOperationalKeyPair;
}

- (void)setNocSigner:(id)a3
{
}

- (HMMTRMatterKeypair)nocSigner
{
  return self->_nocSigner;
}

- (OS_dispatch_group)configureDispatchGroup
{
  return (OS_dispatch_group *)objc_getProperty(self, a2, 384, 1);
}

- (void)setLockStateNotificationRegistered:(BOOL)a3
{
  self->_lockStateNotificationRegistered = a3;
}

- (BOOL)lockStateNotificationRegistered
{
  return self->_lockStateNotificationRegistered;
}

- (void)setLockStateNotificationRegistrationToken:(int)a3
{
  self->_lockStateNotificationRegistrationToken = a3;
}

- (int)lockStateNotificationRegistrationToken
{
  return self->_lockStateNotificationRegistrationToken;
}

- (NSMutableArray)deviceControllerHandlers
{
  return self->_deviceControllerHandlers;
}

- (void)setNodesWithPendingACLOverwrite:(id)a3
{
}

- (NSMutableSet)nodesWithPendingACLOverwrite
{
  return (NSMutableSet *)objc_getProperty(self, a2, 368, 1);
}

- (void)setControllerFactoryEnablePerPrimaryResidentConfirmationToken:(id)a3
{
}

- (id)controllerFactoryEnablePerPrimaryResidentConfirmationToken
{
  return self->_controllerFactoryEnablePerPrimaryResidentConfirmationToken;
}

- (void)setMtsKeychainReadyNotificationToken:(int)a3
{
  self->_mtsKeychainReadyNotificationToken = a3;
}

- (int)mtsKeychainReadyNotificationToken
{
  return self->_mtsKeychainReadyNotificationToken;
}

- (void)setHomeKeychainReadyNotificationToken:(int)a3
{
  self->_homeKeychainReadyNotificationToken = a3;
}

- (int)homeKeychainReadyNotificationToken
{
  return self->_homeKeychainReadyNotificationToken;
}

- (void)setPreWarmTargetIsSystemCommissionerFabric:(BOOL)a3
{
  self->_preWarmTargetIsSystemCommissionerFabric = a3;
}

- (BOOL)preWarmTargetIsSystemCommissionerFabric
{
  return self->_preWarmTargetIsSystemCommissionerFabric;
}

- (void)setPreWarmedFabricID:(id)a3
{
}

- (NSNumber)preWarmedFabricID
{
  return self->_preWarmedFabricID;
}

- (void)setUserOwnsConfiguredPreWarmTargetFabric:(BOOL)a3
{
  self->_userOwnsConfiguredPreWarmTargetFabric = a3;
}

- (BOOL)userOwnsConfiguredPreWarmTargetFabric
{
  return self->_userOwnsConfiguredPreWarmTargetFabric;
}

- (void)setConfiguredPreWarmTargetFabricID:(id)a3
{
}

- (NSNumber)configuredPreWarmTargetFabricID
{
  return self->_configuredPreWarmTargetFabricID;
}

- (void)setMatterStorageItems:(id)a3
{
}

- (NSDictionary)matterStorageItems
{
  return (NSDictionary *)objc_getProperty(self, a2, 336, 1);
}

- (void)setPreventThreadStopDuringStackRestart:(BOOL)a3
{
  self->_preventThreadStopDuringStackRestart = a3;
}

- (BOOL)preventThreadStopDuringStackRestart
{
  return self->_preventThreadStopDuringStackRestart;
}

- (void)setBrowserState:(unint64_t)a3
{
  self->_browserState = a3;
}

- (unint64_t)browserState
{
  return self->_browserState;
}

- (void)setDiagnosticTimerStart:(id)a3
{
}

- (NSDate)diagnosticTimerStart
{
  return self->_diagnosticTimerStart;
}

- (void)setDiagnosticsTimer:(id)a3
{
}

- (HMFTimer)diagnosticsTimer
{
  return self->_diagnosticsTimer;
}

- (void)setRequestedBLEScan:(BOOL)a3
{
  self->_requestedBLEScan = a3;
}

- (BOOL)requestedBLEScan
{
  return self->_requestedBLEScan;
}

- (void)setBleScanActive:(BOOL)a3
{
  self->_bleScanActive = a3;
}

- (BOOL)bleScanActive
{
  return self->_bleScanActive;
}

- (void)setCbCentral:(id)a3
{
}

- (CBCentralManager)cbCentral
{
  return self->_cbCentral;
}

- (void)setBonjourBrowserChanges:(id)a3
{
}

- (NSMutableArray)bonjourBrowserChanges
{
  return self->_bonjourBrowserChanges;
}

- (void)setBonjourBrowser:(id)a3
{
}

- (OS_nw_browser)bonjourBrowser
{
  return self->_bonjourBrowser;
}

- (void)setPowerManager:(id)a3
{
}

- (HAPPowerManager)powerManager
{
  return self->_powerManager;
}

- (void)setPendingMatterStackRestart:(BOOL)a3
{
  self->_pendingMatterStackRestart = a3;
}

- (BOOL)pendingMatterStackRestart
{
  return self->_pendingMatterStackRestart;
}

- (void)setRestartCount:(unint64_t)a3
{
  self->_restartCount = a3;
}

- (unint64_t)restartCount
{
  return self->_restartCount;
}

- (void)setDelegateQueue:(id)a3
{
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void)setDelegate:(id)a3
{
}

- (HAPAccessoryServerBrowserDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HAPAccessoryServerBrowserDelegate *)WeakRetained;
}

- (HMMTROTAProviderDelegate)otaProviderDelegate
{
  return self->_otaProviderDelegate;
}

- (NSMutableSet)stagedAccessoryServers
{
  return self->_stagedAccessoryServers;
}

- (void)setCurrentFabricID:(id)a3
{
}

- (NSNumber)currentFabricID
{
  return self->_currentFabricID;
}

- (HMMTRThreadSoftwareUpdateController)threadSoftwareUpdateController
{
  return self->_threadSoftwareUpdateController;
}

- (HMMTRSoftwareUpdateProvider)softwareUpdateProvider
{
  return self->_softwareUpdateProvider;
}

- (HMMTRThreadRadioManager)threadRadioManager
{
  return self->_threadRadioManager;
}

- (void)setAccessoryServerBrowserDelegate:(id)a3
{
}

- (HMMTRAccessoryServerBrowserDelegate)accessoryServerBrowserDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessoryServerBrowserDelegate);
  return (HMMTRAccessoryServerBrowserDelegate *)WeakRetained;
}

- (HMMTRSystemCommissionerPairingManager)systemCommissionerPairingManager
{
  return self->_systemCommissionerPairingManager;
}

- (HMMTRUIDialogPresenter)uiDialogPresenter
{
  return self->_uiDialogPresenter;
}

- (HMMTRUserAuthorizationForPairing)userAuthorizationForPairing
{
  return self->_userAuthorizationForPairing;
}

- (HMMTRAttestationStatus)attestationStatus
{
  return self->_attestationStatus;
}

- (HMMTRAttestationDataStore)attestationDataStore
{
  return self->_attestationDataStore;
}

- (HMMTRVendorMetadataStore)vendorMetadataStore
{
  return self->_vendorMetadataStore;
}

- (HMMTRResidentStateManager)residentStateManager
{
  return self->_residentStateManager;
}

- (HMMTRStorage)storage
{
  return self->_storage;
}

- (BOOL)isSystemCommissionerFeatureEnabled
{
  return self->_systemCommissionerFeatureEnabled;
}

- (BOOL)isSystemCommissionerMode
{
  return self->_systemCommissionerMode;
}

- (NSMutableSet)allowedNodeIDsForConnectionRequests
{
  return (NSMutableSet *)objc_getProperty(self, a2, 128, 1);
}

- (BOOL)connectionRequestSuspended
{
  return self->_connectionRequestSuspended;
}

- (id)logIdentifier
{
  return @"HMMTRAccessoryServerBrowser";
}

- (void)dispatchAfter:(unint64_t)a3 block:(id)a4
{
  id v6 = a4;
  v7 = [(HAPAccessoryServerBrowser *)self workQueue];
  dispatch_after(a3, v7, v6);
}

- (void)dispatchBlock:(id)a3
{
  id v4 = a3;
  v5 = [(HAPAccessoryServerBrowser *)self workQueue];
  dispatch_async(v5, v4);
}

- (void)centralManager:(id)a3 didDiscoverPeripheral:(id)a4 advertisementData:(id)a5 RSSI:(id)a6
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v7 = a5;
  v32 = self;
  v8 = [(HAPAccessoryServerBrowser *)self workQueue];
  dispatch_assert_queue_V2(v8);

  v9 = [v7 objectForKeyedSubscript:*MEMORY[0x263EFEC98]];
  if ([v9 BOOLValue])
  {
    v30 = v9;
    id v31 = v7;
    v10 = [v7 objectForKeyedSubscript:*MEMORY[0x263EFECD0]];
    v11 = v10;
    if (v10)
    {
      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      uint64_t v12 = [v10 countByEnumeratingWithState:&v33 objects:v37 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v34;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v34 != v14) {
              objc_enumerationMutation(v11);
            }
            v16 = *(void **)(*((void *)&v33 + 1) + 8 * i);
            v17 = [v16 data];
            v18 = [MEMORY[0x263EFEF88] UUIDWithString:@"FFF6"];
            v19 = [v18 data];
            int v20 = [v17 isEqual:v19];

            if (v20)
            {
              v21 = [v11 objectForKey:v16];
              if ([v21 length] == 8)
              {
                v22 = (unsigned __int8 *)[v21 bytes];
                uint64_t v23 = *(unsigned __int16 *)(v22 + 3);
                uint64_t v24 = *(unsigned __int16 *)(v22 + 5);
                if (*v22 <= 1u && v23 != 0 && v24 != 0)
                {
                  v27 = [NSNumber numberWithUnsignedInt:v22[1] | ((v22[2] & 0xF) << 8)];
                  v28 = [NSNumber numberWithUnsignedInt:v23];
                  v29 = [NSNumber numberWithUnsignedInt:v24];
                  [(HMMTRAccessoryServerBrowser *)v32 _handleBLEAddOrUpdateWithDiscriminator:v27 vendorID:v28 productID:v29];
                }
              }
            }
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v33 objects:v37 count:16];
        }
        while (v13);
      }
    }

    v9 = v30;
    id v7 = v31;
  }
}

- (void)centralManagerDidUpdateState:(id)a3
{
  id v4 = [(HAPAccessoryServerBrowser *)self workQueue];
  dispatch_assert_queue_V2(v4);

  [(HMMTRAccessoryServerBrowser *)self _updateCentralManager];
}

- (void)_updateCentralManager
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x2533B64D0](self, a2);
  id v4 = self;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    id v7 = [(HMMTRAccessoryServerBrowser *)v4 cbCentral];
    *(_DWORD *)buf = 138543618;
    long long v36 = v6;
    __int16 v37 = 2048;
    uint64_t v38 = [v7 state];
    _os_log_impl(&dword_252495000, v5, OS_LOG_TYPE_INFO, "%{public}@CBCentralManager state: %ld", buf, 0x16u);
  }
  v8 = [(HMMTRAccessoryServerBrowser *)v4 cbCentral];
  BOOL v9 = [v8 state] == 5;

  if (v9)
  {
    BOOL v10 = [(HMMTRAccessoryServerBrowser *)v4 bleScanActive];
    BOOL v11 = [(HMMTRAccessoryServerBrowser *)v4 requestedBLEScan];
    if (v10)
    {
      if (v11)
      {
        objc_initWeak((id *)buf, v4);
        dispatch_time_t v12 = dispatch_time(0, 60000000000);
        uint64_t v13 = [(HAPAccessoryServerBrowser *)v4 workQueue];
        v30[0] = MEMORY[0x263EF8330];
        v30[1] = 3221225472;
        v30[2] = __52__HMMTRAccessoryServerBrowser__updateCentralManager__block_invoke;
        v30[3] = &unk_265376E28;
        objc_copyWeak(&v31, (id *)buf);
        dispatch_after(v12, v13, v30);

        objc_destroyWeak(&v31);
        objc_destroyWeak((id *)buf);
      }
      else
      {
        uint64_t v24 = (void *)MEMORY[0x2533B64D0]();
        v25 = v4;
        v26 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          v27 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          long long v36 = v27;
          _os_log_impl(&dword_252495000, v26, OS_LOG_TYPE_INFO, "%{public}@Stopping BLE scan", buf, 0xCu);
        }
        v28 = [(HMMTRAccessoryServerBrowser *)v25 cbCentral];
        [v28 stopScan];

        v29 = [(HMMTRAccessoryServerBrowser *)v25 cbCentral];
        [v29 setDelegate:0];

        [(HMMTRAccessoryServerBrowser *)v25 setCbCentral:0];
        [(HMMTRAccessoryServerBrowser *)v25 setBleScanActive:0];
        [(HMMTRAccessoryServerBrowser *)v25 _cleanupDisappearedServersOverBLE];
      }
    }
    else if (v11)
    {
      uint64_t v14 = (void *)MEMORY[0x2533B64D0]();
      v15 = v4;
      v16 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        v17 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        long long v36 = v17;
        _os_log_impl(&dword_252495000, v16, OS_LOG_TYPE_INFO, "%{public}@Starting BLE scan", buf, 0xCu);
      }
      [(HMMTRAccessoryServerBrowser *)v15 _prepareServerForBLEDiscovery];
      [(HMMTRAccessoryServerBrowser *)v15 setBleScanActive:1];
      v18 = [(HMMTRAccessoryServerBrowser *)v15 cbCentral];
      v19 = [MEMORY[0x263EFEF88] UUIDWithString:@"FFF6"];
      long long v34 = v19;
      int v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v34 count:1];
      uint64_t v21 = *MEMORY[0x263EFED48];
      v32[0] = *MEMORY[0x263EFED50];
      v32[1] = v21;
      v33[0] = MEMORY[0x263EFFA88];
      v33[1] = MEMORY[0x263EFFA80];
      uint64_t v22 = *MEMORY[0x263EFEDC8];
      v32[2] = *MEMORY[0x263EFEDD8];
      v32[3] = v22;
      v33[2] = &unk_2702B5868;
      v33[3] = &unk_2702B5880;
      uint64_t v23 = [NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:4];
      [v18 scanForPeripheralsWithServices:v20 options:v23];

      [(HMMTRAccessoryServerBrowser *)v15 _updateCentralManager];
    }
  }
}

void __52__HMMTRAccessoryServerBrowser__updateCentralManager__block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)MEMORY[0x2533B64D0]();
  id v3 = WeakRetained;
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = HMFGetLogIdentifier();
    int v6 = 138543362;
    id v7 = v5;
    _os_log_impl(&dword_252495000, v4, OS_LOG_TYPE_INFO, "%{public}@Refreshing BLE discovered servers", (uint8_t *)&v6, 0xCu);
  }
  [v3 _cleanupDisappearedServersOverBLE];
  [v3 _prepareServerForBLEDiscovery];
  [v3 _updateCentralManager];
}

- (void)stopBluetoothScan
{
  id v3 = [(HAPAccessoryServerBrowser *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__HMMTRAccessoryServerBrowser_stopBluetoothScan__block_invoke;
  block[3] = &unk_265378638;
  block[4] = self;
  dispatch_async(v3, block);
}

void __48__HMMTRAccessoryServerBrowser_stopBluetoothScan__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) setRequestedBLEScan:0];
  [*(id *)(a1 + 32) _updateCentralManager];
  v2 = [*(id *)(a1 + 32) bonjourBrowser];

  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) bonjourBrowser];
    nw_browser_cancel(v3);

    id v4 = [*(id *)(a1 + 32) powerManager];
    [v4 deRegisterFromSleepWake:*(void *)(a1 + 32)];
  }
  [*(id *)(a1 + 32) _cleanupLocallyDiscoveredServers];
  [*(id *)(a1 + 32) _clearLocallyDiscoveredFlags];
  v5 = [MEMORY[0x263F42620] productInfo];
  uint64_t v6 = [v5 productPlatform];

  if ((unint64_t)(v6 - 1) <= 1 && isFeatureMatteriPhoneOnlyPairingControlForThreadEnabled())
  {
    id v7 = (void *)MEMORY[0x2533B64D0]();
    id v8 = *(id *)(a1 + 32);
    BOOL v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      BOOL v10 = HMFGetLogIdentifier();
      int v11 = 138543362;
      dispatch_time_t v12 = v10;
      _os_log_impl(&dword_252495000, v9, OS_LOG_TYPE_INFO, "%{public}@Resume all thread connection requests due to BLE scan end", (uint8_t *)&v11, 0xCu);
    }
    [*(id *)(a1 + 32) resumeAllOperations];
  }
}

- (void)startBluetoothScan
{
  objc_initWeak(&location, self);
  id v3 = [(HAPAccessoryServerBrowser *)self workQueue];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __49__HMMTRAccessoryServerBrowser_startBluetoothScan__block_invoke;
  v4[3] = &unk_265376E28;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __49__HMMTRAccessoryServerBrowser_startBluetoothScan__block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [MEMORY[0x263F42620] productInfo];
  uint64_t v3 = [v2 productPlatform];

  if ((unint64_t)(v3 - 1) <= 1)
  {
    if (isFeatureMatteriPhoneOnlyPairingControlForThreadEnabled())
    {
      id v4 = (void *)MEMORY[0x2533B64D0]();
      id v5 = WeakRetained;
      uint64_t v6 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        id v7 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        uint64_t v21 = v7;
        _os_log_impl(&dword_252495000, v6, OS_LOG_TYPE_INFO, "%{public}@Aborting all thread connection requests due to BLE scan", buf, 0xCu);
      }
      id v8 = [MEMORY[0x263F087E8] hmmtrErrorWithCode:6];
      [v5 abortAndSuspendAllOperationsWithReason:v8];
    }
    [WeakRetained _preWarmCommissioningSession];
    [WeakRetained _cleanupLocallyDiscoveredServers];
    [WeakRetained setRequestedBLEScan:1];
    BOOL v9 = [WeakRetained cbCentral];

    if (!v9)
    {
      id v10 = objc_alloc(MEMORY[0x263EFEF00]);
      int v11 = [WeakRetained workQueue];
      dispatch_time_t v12 = (void *)[v10 initWithDelegate:WeakRetained queue:v11];
      [WeakRetained setCbCentral:v12];
    }
    [WeakRetained _updateCentralManager];
    int v13 = [WeakRetained _initializeAndStartBonjourBrowser];
    if ([WeakRetained _delegateRespondsToSelector:sel_accessoryServerBrowser_didStartDiscoveringWithError_])
    {
      uint64_t v14 = [WeakRetained delegateQueue];
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __49__HMMTRAccessoryServerBrowser_startBluetoothScan__block_invoke_382;
      v18[3] = &unk_265376C08;
      v18[4] = WeakRetained;
      int v19 = v13;
      dispatch_async(v14, v18);
    }
    v15 = [MEMORY[0x263F35A80] sharedInstance];
    [WeakRetained setPowerManager:v15];

    v16 = [WeakRetained powerManager];
    v17 = [WeakRetained workQueue];
    [v16 registerForSleepWake:WeakRetained queue:v17];

    [WeakRetained _reportAccessoriesKnownToSystemCommissioner];
  }
}

void __49__HMMTRAccessoryServerBrowser_startBluetoothScan__block_invoke_382(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) delegate];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = HMErrorFromOSStatus();
  [v4 accessoryServerBrowser:v2 didStartDiscoveringWithError:v3];
}

- (void)_preWarmCommissioningSession
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(HMMTRAccessoryServerBrowser *)self preWarmedFabricID];

  if (v3)
  {
    id v4 = (void *)MEMORY[0x2533B64D0]();
    id v5 = self;
    uint64_t v6 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
LABEL_5:

      return;
    }
    id v7 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v40 = v7;
    id v8 = "%{public}@Commissioning session was already pre-warmed";
LABEL_4:
    _os_log_impl(&dword_252495000, v6, OS_LOG_TYPE_INFO, v8, buf, 0xCu);

    goto LABEL_5;
  }
  BOOL v9 = [(HMMTRAccessoryServerBrowser *)self configuredPreWarmTargetFabricID];
  if (v9)
  {
  }
  else if (![(HMMTRAccessoryServerBrowser *)self preWarmTargetIsSystemCommissionerFabric])
  {
    return;
  }
  id v10 = [(HMMTRAccessoryServerBrowser *)self controllerFactoryEnablePerPrimaryResidentConfirmationToken];

  if (v10)
  {
    int v11 = [(HMMTRAccessoryServerBrowser *)self controllerFactory];
    dispatch_time_t v12 = [(HMMTRAccessoryServerBrowser *)self controllerFactoryEnablePerPrimaryResidentConfirmationToken];
    [v11 enableNormalOperationWithToken:v12];

    [(HMMTRAccessoryServerBrowser *)self setControllerFactoryEnablePerPrimaryResidentConfirmationToken:0];
  }
  if ([(HMMTRAccessoryServerBrowser *)self preWarmTargetIsSystemCommissionerFabric])
  {
    goto LABEL_13;
  }
  int v13 = [(HMMTRAccessoryServerBrowser *)self storage];
  uint64_t v14 = [v13 fabricID];
  v15 = [(HMMTRAccessoryServerBrowser *)self configuredPreWarmTargetFabricID];
  int v16 = [v14 isEqual:v15];

  if (v16)
  {
LABEL_13:
    v17 = (void *)MEMORY[0x2533B64D0]();
    v18 = self;
    int v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      int v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v40 = v20;
      _os_log_impl(&dword_252495000, v19, OS_LOG_TYPE_INFO, "%{public}@Storage is already configured. Prewarming Matter device controller.", buf, 0xCu);
    }
    uint64_t v21 = [(HMMTRAccessoryServerBrowser *)v18 deviceController];
    [v21 preWarmCommissioningSession];
LABEL_16:

    return;
  }
  if ([(HMMTRAccessoryServerBrowser *)self preWarmTargetIsSystemCommissionerFabric])
  {
    uint64_t v22 = [(HMMTRAccessoryServerBrowser *)self systemCommissionerFabricID];

    if (v22)
    {
      uint64_t v23 = (void *)MEMORY[0x2533B64D0]();
      uint64_t v24 = self;
      v25 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        v26 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v40 = v26;
        _os_log_impl(&dword_252495000, v25, OS_LOG_TYPE_INFO, "%{public}@Pre-warming system commissioning device controller", buf, 0xCu);
      }
      uint64_t v21 = [(HMMTRAccessoryServerBrowser *)v24 systemCommissionerControllerWrapper];
      v27 = [v21 controller];
      [v27 preWarmCommissioningSession];

      goto LABEL_16;
    }
  }
  BOOL v28 = [(HMMTRAccessoryServerBrowser *)self preWarmTargetIsSystemCommissionerFabric];
  id v4 = (void *)MEMORY[0x2533B64D0]();
  id v5 = self;
  uint64_t v6 = HMFGetOSLogHandle();
  BOOL v29 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v28)
  {
    if (!v29) {
      goto LABEL_5;
    }
    id v7 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v40 = v7;
    id v8 = "%{public}@Could not pre-warm commissioning session when fabric was never created";
    goto LABEL_4;
  }
  if (v29)
  {
    v30 = HMFGetLogIdentifier();
    id v31 = [(HMMTRAccessoryServerBrowser *)v5 configuredPreWarmTargetFabricID];
    *(_DWORD *)buf = 138543618;
    v40 = v30;
    __int16 v41 = 2112;
    v42 = v31;
    _os_log_impl(&dword_252495000, v6, OS_LOG_TYPE_INFO, "%{public}@Setting up controller for Home fabric %@ in order to pre-warm commissioning session", buf, 0x16u);
  }
  if (isFeatureMatterLocalFabricConfigEnabled())
  {
    v32 = [(HMMTRAccessoryServerBrowser *)v5 configuredPreWarmTargetFabricID];
    long long v33 = [(HMMTRAccessoryServerBrowser *)v5 appleHomeFabricWithID:v32];

    v38[0] = MEMORY[0x263EF8330];
    v38[1] = 3221225472;
    v38[2] = __59__HMMTRAccessoryServerBrowser__preWarmCommissioningSession__block_invoke;
    v38[3] = &unk_265376E00;
    v38[4] = v5;
    [v33 loadFabricAndControllerDataForPairing:0 fetchFromResident:0 completion:v38];
  }
  else
  {
    long long v34 = [(HMMTRAccessoryServerBrowser *)v5 storage];
    long long v35 = [(HMMTRAccessoryServerBrowser *)v5 configuredPreWarmTargetFabricID];
    uint64_t v36 = [(HMMTRAccessoryServerBrowser *)v5 userOwnsConfiguredPreWarmTargetFabric];
    v37[0] = MEMORY[0x263EF8330];
    v37[1] = 3221225472;
    v37[2] = __59__HMMTRAccessoryServerBrowser__preWarmCommissioningSession__block_invoke_379;
    v37[3] = &unk_265376E00;
    v37[4] = v5;
    [v34 fetchCertForFabricWithID:v35 isOwner:v36 forPairing:0 forceFetchFromResident:0 completion:v37];
  }
}

void __59__HMMTRAccessoryServerBrowser__preWarmCommissioningSession__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = (void *)MEMORY[0x2533B64D0]();
    id v5 = *(id *)(a1 + 32);
    uint64_t v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = HMFGetLogIdentifier();
      id v8 = [*(id *)(a1 + 32) configuredPreWarmTargetFabricID];
      int v18 = 138543618;
      int v19 = v7;
      __int16 v20 = 2112;
      uint64_t v21 = v8;
      _os_log_impl(&dword_252495000, v6, OS_LOG_TYPE_ERROR, "%{public}@Could not pre-warm due to failure to fetch root cert for fabricID %@", (uint8_t *)&v18, 0x16u);
    }
  }
  else
  {
    [*(id *)(a1 + 32) setSystemCommissionerMode:0];
    BOOL v9 = [*(id *)(a1 + 32) storage];
    id v10 = [*(id *)(a1 + 32) configuredPreWarmTargetFabricID];
    [v9 prepareStorageForFabricID:v10];

    int v11 = [*(id *)(a1 + 32) deviceController];
    LODWORD(v10) = [v11 isRunning];

    if (v10)
    {
      dispatch_time_t v12 = [*(id *)(a1 + 32) configuredPreWarmTargetFabricID];
      [*(id *)(a1 + 32) setPreWarmedFabricID:v12];

      int v13 = (void *)MEMORY[0x2533B64D0]();
      id v14 = *(id *)(a1 + 32);
      v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        int v16 = HMFGetLogIdentifier();
        int v18 = 138543362;
        int v19 = v16;
        _os_log_impl(&dword_252495000, v15, OS_LOG_TYPE_INFO, "%{public}@Prewarming Matter device controller", (uint8_t *)&v18, 0xCu);
      }
      v17 = [*(id *)(a1 + 32) deviceController];
      [v17 preWarmCommissioningSession];
    }
  }
}

void __59__HMMTRAccessoryServerBrowser__preWarmCommissioningSession__block_invoke_379(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = (void *)MEMORY[0x2533B64D0]();
    id v5 = *(id *)(a1 + 32);
    uint64_t v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = HMFGetLogIdentifier();
      id v8 = [*(id *)(a1 + 32) configuredPreWarmTargetFabricID];
      int v18 = 138543618;
      int v19 = v7;
      __int16 v20 = 2112;
      uint64_t v21 = v8;
      _os_log_impl(&dword_252495000, v6, OS_LOG_TYPE_ERROR, "%{public}@Could not pre-warm due to failure to fetch root cert for fabricID %@", (uint8_t *)&v18, 0x16u);
    }
  }
  else
  {
    [*(id *)(a1 + 32) setSystemCommissionerMode:0];
    BOOL v9 = [*(id *)(a1 + 32) storage];
    id v10 = [*(id *)(a1 + 32) configuredPreWarmTargetFabricID];
    [v9 prepareStorageForFabricID:v10];

    int v11 = [*(id *)(a1 + 32) deviceController];
    LODWORD(v10) = [v11 isRunning];

    if (v10)
    {
      dispatch_time_t v12 = [*(id *)(a1 + 32) configuredPreWarmTargetFabricID];
      [*(id *)(a1 + 32) setPreWarmedFabricID:v12];

      int v13 = (void *)MEMORY[0x2533B64D0]();
      id v14 = *(id *)(a1 + 32);
      v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        int v16 = HMFGetLogIdentifier();
        int v18 = 138543362;
        int v19 = v16;
        _os_log_impl(&dword_252495000, v15, OS_LOG_TYPE_INFO, "%{public}@Prewarming Matter device controller", (uint8_t *)&v18, 0xCu);
      }
      v17 = [*(id *)(a1 + 32) deviceController];
      [v17 preWarmCommissioningSession];
    }
  }
}

- (void)clearPreWarmTarget
{
  id v3 = [(HAPAccessoryServerBrowser *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__HMMTRAccessoryServerBrowser_clearPreWarmTarget__block_invoke;
  block[3] = &unk_265378638;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __49__HMMTRAccessoryServerBrowser_clearPreWarmTarget__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setConfiguredPreWarmTargetFabricID:0];
  [*(id *)(a1 + 32) setPreWarmedFabricID:0];
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 setPreWarmTargetIsSystemCommissionerFabric:0];
}

- (void)setPreWarmTargetToSystemCommissionerFabric
{
  id v3 = [(HAPAccessoryServerBrowser *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __73__HMMTRAccessoryServerBrowser_setPreWarmTargetToSystemCommissionerFabric__block_invoke;
  block[3] = &unk_265378638;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __73__HMMTRAccessoryServerBrowser_setPreWarmTargetToSystemCommissionerFabric__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setConfiguredPreWarmTargetFabricID:0];
  [*(id *)(a1 + 32) setPreWarmedFabricID:0];
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 setPreWarmTargetIsSystemCommissionerFabric:1];
}

- (void)setPreWarmTargetToFabricWithID:(id)a3 isOwner:(BOOL)a4
{
  id v6 = a3;
  id v7 = [(HAPAccessoryServerBrowser *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __70__HMMTRAccessoryServerBrowser_setPreWarmTargetToFabricWithID_isOwner___block_invoke;
  block[3] = &unk_265377ED8;
  block[4] = self;
  id v10 = v6;
  BOOL v11 = a4;
  id v8 = v6;
  dispatch_async(v7, block);
}

uint64_t __70__HMMTRAccessoryServerBrowser_setPreWarmTargetToFabricWithID_isOwner___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setConfiguredPreWarmTargetFabricID:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setUserOwnsConfiguredPreWarmTargetFabric:*(unsigned __int8 *)(a1 + 48)];
  [*(id *)(a1 + 32) setPreWarmedFabricID:0];
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 setPreWarmTargetIsSystemCommissionerFabric:0];
}

- (void)fetchPreferredThreadCredentialsForServer:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMMTRAccessoryServerBrowser *)self delegateQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __87__HMMTRAccessoryServerBrowser_fetchPreferredThreadCredentialsForServer_withCompletion___block_invoke;
  block[3] = &unk_265378900;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __87__HMMTRAccessoryServerBrowser_fetchPreferredThreadCredentialsForServer_withCompletion___block_invoke(id *a1)
{
  uint64_t v2 = [a1[4] delegate];
  id v3 = a1[4];
  id v4 = [a1[5] identifier];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __87__HMMTRAccessoryServerBrowser_fetchPreferredThreadCredentialsForServer_withCompletion___block_invoke_2;
  v5[3] = &unk_265376BE0;
  v5[4] = a1[4];
  id v6 = a1[6];
  [v2 accessoryServerBrowser:v3 getThreadNetworkCredentialsForAccessoryWithIdentifier:v4 withCompletion:v5];
}

void __87__HMMTRAccessoryServerBrowser_fetchPreferredThreadCredentialsForServer_withCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x2533B64D0]();
  id v8 = *(id *)(a1 + 32);
  id v9 = HMFGetOSLogHandle();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
  if (v5 && !v6)
  {
    if (v10)
    {
      BOOL v11 = HMFGetLogIdentifier();
      int v22 = 138543362;
      uint64_t v23 = v11;
      _os_log_impl(&dword_252495000, v9, OS_LOG_TYPE_INFO, "%{public}@Successfully fetched Preferred Thread Credentials from owner.", (uint8_t *)&v22, 0xCu);
    }
    id v12 = *(void **)(a1 + 32);
    id v13 = [v12 currentFabric];
    LODWORD(v12) = [v12 isCurrentDeviceAllowedAccessoryControlDespiteReachableResidentForFabric:v13];

    if (!v12) {
      goto LABEL_14;
    }
    id v14 = [*(id *)(a1 + 32) threadRadioManager];
    v15 = [*(id *)(a1 + 32) currentFabricID];
    [v14 overrideLocationCheckForPairingForFabricID:v15];

    int v16 = [*(id *)(a1 + 32) isSystemCommissionerMode];
    v17 = [*(id *)(a1 + 32) threadRadioManager];
    int v18 = [*(id *)(a1 + 32) currentFabricID];
    if (v16)
    {
      [v17 startThreadRadioForSystemCommissionerFabricID:v18];
    }
    else
    {
      int v21 = [v17 hasMatterThreadAccessoryInHomeWithFabricID:v18];

      if (!v21)
      {
LABEL_14:
        __int16 v20 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
        goto LABEL_15;
      }
      v17 = [*(id *)(a1 + 32) threadRadioManager];
      int v18 = [*(id *)(a1 + 32) currentFabricID];
      [v17 startThreadRadioForHomeWithFabricID:v18];
    }

    goto LABEL_14;
  }
  if (v10)
  {
    int v19 = HMFGetLogIdentifier();
    int v22 = 138543618;
    uint64_t v23 = v19;
    __int16 v24 = 2112;
    id v25 = v6;
    _os_log_impl(&dword_252495000, v9, OS_LOG_TYPE_INFO, "%{public}@Failed to fetch Preferred Thread Credentials from owner with error %@", (uint8_t *)&v22, 0x16u);
  }
  __int16 v20 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
LABEL_15:
  v20();
}

- (void)fetchCachedOperationalCertificateForFabricID:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HMMTRAccessoryServerBrowser *)self delegate];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __94__HMMTRAccessoryServerBrowser_fetchCachedOperationalCertificateForFabricID_completionHandler___block_invoke;
  v10[3] = &unk_265376BB8;
  id v11 = v6;
  id v9 = v6;
  [v8 accessoryServerBrowser:self getCachedOperationalCertificateDataForFabricID:v7 completion:v10];
}

uint64_t __94__HMMTRAccessoryServerBrowser_fetchCachedOperationalCertificateForFabricID_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)cacheOperationalCertificate:(id)a3 fabricID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMMTRAccessoryServerBrowser *)self delegateQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __68__HMMTRAccessoryServerBrowser_cacheOperationalCertificate_fabricID___block_invoke;
  block[3] = &unk_265376F38;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __68__HMMTRAccessoryServerBrowser_cacheOperationalCertificate_fabricID___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 accessoryServerBrowser:*(void *)(a1 + 32) cacheOperationalCertData:*(void *)(a1 + 40) forFabricID:*(void *)(a1 + 48)];
}

- (void)fetchCommissioningCertificatesFromOwnerForPublicKey:(id)a3 fabricID:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(HMMTRAccessoryServerBrowser *)self delegateQueue];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __110__HMMTRAccessoryServerBrowser_fetchCommissioningCertificatesFromOwnerForPublicKey_fabricID_completionHandler___block_invoke;
  v15[3] = &unk_2653775F0;
  v15[4] = self;
  id v16 = v9;
  id v17 = v8;
  id v18 = v10;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  dispatch_async(v11, v15);
}

void __110__HMMTRAccessoryServerBrowser_fetchCommissioningCertificatesFromOwnerForPublicKey_fabricID_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __110__HMMTRAccessoryServerBrowser_fetchCommissioningCertificatesFromOwnerForPublicKey_fabricID_completionHandler___block_invoke_2;
  v6[3] = &unk_265376B18;
  v6[4] = v3;
  uint64_t v5 = *(void *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  [v2 accessoryServerBrowser:v3 getCommissioningCertificatesForNodeID:0 fabricID:v4 publicKey:v5 completion:v6];
}

void __110__HMMTRAccessoryServerBrowser_fetchCommissioningCertificatesFromOwnerForPublicKey_fabricID_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = (void *)MEMORY[0x2533B64D0]();
  id v17 = *(id *)(a1 + 32);
  id v18 = HMFGetOSLogHandle();
  BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_INFO);
  if (v15)
  {
    if (v19)
    {
      __int16 v20 = HMFGetLogIdentifier();
      int v22 = 138543618;
      uint64_t v23 = v20;
      __int16 v24 = 2112;
      id v25 = v15;
      _os_log_impl(&dword_252495000, v18, OS_LOG_TYPE_INFO, "%{public}@Failed to fetch commissioning certificates from owner with error %@", (uint8_t *)&v22, 0x16u);
    }
  }
  else if (v19)
  {
    int v21 = HMFGetLogIdentifier();
    int v22 = 138544130;
    uint64_t v23 = v21;
    __int16 v24 = 2112;
    id v25 = v11;
    __int16 v26 = 2112;
    id v27 = v12;
    __int16 v28 = 2112;
    id v29 = v13;
    _os_log_impl(&dword_252495000, v18, OS_LOG_TYPE_INFO, "%{public}@Successfully fetched commissioning certificates from owner. Root Certificate %@, Operational certificate %@, Owner NodeID %@", (uint8_t *)&v22, 0x2Au);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)handleHomeDeletionWithFabric:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x2533B64D0]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v14 = v8;
    __int16 v15 = 2112;
    id v16 = v4;
    _os_log_impl(&dword_252495000, v7, OS_LOG_TYPE_INFO, "%{public}@Home with fabric %@ has been deleted, cleaning up state", buf, 0x16u);
  }
  id v9 = [v4 fabricID];

  if (v9)
  {
    id v10 = [(HAPAccessoryServerBrowser *)v6 workQueue];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __60__HMMTRAccessoryServerBrowser_handleHomeDeletionWithFabric___block_invoke;
    v11[3] = &unk_265376E98;
    v11[4] = v6;
    id v12 = v4;
    dispatch_async(v10, v11);
  }
}

void __60__HMMTRAccessoryServerBrowser_handleHomeDeletionWithFabric___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) fabricID];
  [v2 removeFabricWithActiveClients:v3];

  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = [*(id *)(a1 + 40) fabricID];
  [v4 removeFabricWithActiveSecondaryClients:v5];

  id v6 = *(void **)(a1 + 32);
  id v8 = [*(id *)(a1 + 40) fabricID];
  id v7 = [MEMORY[0x263F087E8] hmmtrErrorWithCode:4];
  [v6 _abortAllOperationsForFabricID:v8 reason:v7];
}

- (void)_handleLockStateNotification
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  unsigned __int8 v16 = 0;
  if ([(HMMTRAccessoryServerBrowser *)self _delegateRespondsToSelector:sel_accessoryServerBrowser_getLockedState_])
  {
    uint64_t v3 = [(HMMTRAccessoryServerBrowser *)self delegate];
    [v3 accessoryServerBrowser:self getLockedState:&v16];
  }
  id v4 = (void *)MEMORY[0x2533B64D0]();
  uint64_t v5 = self;
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    id v8 = HMFBooleanToString();
    *(_DWORD *)buf = 138543618;
    id v18 = v7;
    __int16 v19 = 2112;
    __int16 v20 = v8;
    _os_log_impl(&dword_252495000, v6, OS_LOG_TYPE_INFO, "%{public}@Lock state changed: %@", buf, 0x16u);
  }
  if (isFeatureMatteriPhoneOnlyPairingControlEnabled())
  {
    if (v16)
    {
      id v9 = [(HMMTRAccessoryServerBrowser *)v5 currentFabricID];
      id v10 = (void *)MEMORY[0x2533B64D0]();
      id v11 = v5;
      id v12 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        id v13 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        id v18 = v13;
        __int16 v19 = 2112;
        __int16 v20 = v9;
        _os_log_impl(&dword_252495000, v12, OS_LOG_TYPE_INFO, "%{public}@Removing fabricID %@ from active clients and aborting operations", buf, 0x16u);
      }
      id v14 = [MEMORY[0x263F087E8] hmmtrErrorWithCode:8];
      [(HMMTRAccessoryServerBrowser *)v11 removeActiveClientWithFabricID:v9 updateConnectionIdleTimeout:1 reason:v14];
    }
    if (isFeatureMatteriPhoneOnlyPairingControlForThreadEnabled())
    {
      if (CFPreferencesGetAppBooleanValue(@"StartThreadOnWake", @"/Library/Managed Preferences/mobile/com.apple.homed.plist", 0))
      {
        __int16 v15 = [(HMMTRAccessoryServerBrowser *)v5 threadRadioManager];
        [v15 handleDeviceLockStateChange:v16];
      }
    }
  }
}

- (void)_handleClientsRemovedWithFabricID:(id)a3 updateConnectionIdleTimeout:(BOOL)a4 reason:(id)a5
{
  BOOL v6 = a4;
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  if (v8)
  {
    id v10 = [(HMMTRAccessoryServerBrowser *)self fabricsWithActiveClients];
    int v11 = [v10 containsObject:v8];

    if (v11)
    {
      id v12 = (void *)MEMORY[0x2533B64D0]();
      id v13 = self;
      id v14 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        __int16 v15 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v48 = v15;
        __int16 v49 = 2112;
        id v50 = v8;
        unsigned __int8 v16 = "%{public}@Not shutting down stack for fabricID %@ because there is an active client";
LABEL_8:
        _os_log_impl(&dword_252495000, v14, OS_LOG_TYPE_INFO, v16, buf, 0x16u);

        goto LABEL_9;
      }
      goto LABEL_9;
    }
    uint64_t v17 = [(HMMTRAccessoryServerBrowser *)self fabricsWithActiveSecondaryClients];
    int v18 = [v17 containsObject:v8];

    if (v18)
    {
      id v12 = (void *)MEMORY[0x2533B64D0]();
      id v13 = self;
      id v14 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        __int16 v15 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v48 = v15;
        __int16 v49 = 2112;
        id v50 = v8;
        unsigned __int8 v16 = "%{public}@Not shutting down stack for fabricID %@ because there is an active secondary client";
        goto LABEL_8;
      }
LABEL_9:

      goto LABEL_10;
    }
    __int16 v19 = [(HMMTRAccessoryServerBrowser *)self currentFabricID];
    int v20 = [v19 isEqualToNumber:v8];

    if (v20)
    {
      uint64_t v39 = v9;
      long long v44 = 0u;
      long long v45 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      uint64_t v21 = [(HMMTRAccessoryServerBrowser *)self fabricsWithActiveConnections];
      uint64_t v22 = [v21 countByEnumeratingWithState:&v42 objects:v46 count:16];
      if (v22)
      {
        uint64_t v23 = v22;
        uint64_t v24 = *(void *)v43;
        while (2)
        {
          for (uint64_t i = 0; i != v23; ++i)
          {
            if (*(void *)v43 != v24) {
              objc_enumerationMutation(v21);
            }
            __int16 v26 = *(void **)(*((void *)&v42 + 1) + 8 * i);
            id v27 = [v26 fabricID];
            int v28 = HMFEqualObjects();

            if (v28)
            {
              if (v6) {
                uint64_t v29 = [v26 updateAllConnectionIdleTimeoutsToMinimum];
              }
              long long v35 = (void *)MEMORY[0x2533B64D0](v29);
              uint64_t v36 = self;
              __int16 v37 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
              {
                uint64_t v38 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138543618;
                v48 = v38;
                __int16 v49 = 2112;
                id v50 = v8;
                _os_log_impl(&dword_252495000, v37, OS_LOG_TYPE_INFO, "%{public}@Not shutting down stack for fabricID %@ because there is an active connection", buf, 0x16u);
              }

              id v9 = v39;
              goto LABEL_10;
            }
          }
          uint64_t v23 = [v21 countByEnumeratingWithState:&v42 objects:v46 count:16];
          if (v23) {
            continue;
          }
          break;
        }
      }

      uint64_t v30 = (void *)MEMORY[0x2533B64D0]();
      id v31 = self;
      v32 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        long long v33 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v48 = v33;
        __int16 v49 = 2112;
        id v50 = v8;
        _os_log_impl(&dword_252495000, v32, OS_LOG_TYPE_INFO, "%{public}@Shutting down stack for fabricID %@ because there are no active clients", buf, 0x16u);
      }
      long long v34 = [(HAPAccessoryServerBrowser *)v31 workQueue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __100__HMMTRAccessoryServerBrowser__handleClientsRemovedWithFabricID_updateConnectionIdleTimeout_reason___block_invoke;
      block[3] = &unk_265376E98;
      block[4] = v31;
      id v9 = v39;
      id v41 = v39;
      dispatch_async(v34, block);
    }
  }
LABEL_10:
}

void __100__HMMTRAccessoryServerBrowser__handleClientsRemovedWithFabricID_updateConnectionIdleTimeout_reason___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [v2 currentFabricID];
  [v2 _disconnectFromIdleFabric:v3 reason:*(void *)(a1 + 40)];
}

- (void)removeActiveSecondaryClientWithFabricID:(id)a3 updateConnectionIdleTimeout:(BOOL)a4 reason:(id)a5
{
  if (a3)
  {
    BOOL v5 = a4;
    id v8 = a5;
    id v9 = a3;
    [(HMMTRAccessoryServerBrowser *)self removeFabricWithActiveSecondaryClients:v9];
    [(HMMTRAccessoryServerBrowser *)self _handleClientsRemovedWithFabricID:v9 updateConnectionIdleTimeout:v5 reason:v8];
  }
}

- (void)removeActiveClientWithFabricID:(id)a3 updateConnectionIdleTimeout:(BOOL)a4 reason:(id)a5
{
  if (a3)
  {
    BOOL v5 = a4;
    id v8 = a5;
    id v9 = a3;
    [(HMMTRAccessoryServerBrowser *)self removeFabricWithActiveClients:v9];
    [(HMMTRAccessoryServerBrowser *)self _handleClientsRemovedWithFabricID:v9 updateConnectionIdleTimeout:v5 reason:v8];
  }
}

- (void)handleUpdateNotificationsEnabled:(BOOL)a3 forFabric:(id)a4 keepAliveOnly:(BOOL)a5
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = [v8 fabricID];
  if (isFeatureMatterLocalFabricConfigEnabled())
  {
    id v10 = (void *)MEMORY[0x2533B64D0]();
    int v11 = self;
    id v12 = HMFGetOSLogHandle();
    id v13 = v12;
    if (v9)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v21 = HMFGetLogIdentifier();
        int v20 = HMFBooleanToString();
        id v14 = HMFBooleanToString();
        [(HMMTRAccessoryServerBrowser *)v11 currentFabricID];
        v15 = BOOL v22 = a5;
        uint64_t v19 = [(HMMTRAccessoryServerBrowser *)v11 browserState];
        [(HMMTRAccessoryServerBrowser *)v11 fabricsWithActiveClients];
        v16 = uint64_t v23 = v10;
        uint64_t v17 = [(HMMTRAccessoryServerBrowser *)v11 fabricsWithActiveSecondaryClients];
        *(_DWORD *)buf = 138545154;
        id v31 = v21;
        __int16 v32 = 2112;
        id v33 = v9;
        __int16 v34 = 2112;
        long long v35 = v20;
        __int16 v36 = 2112;
        __int16 v37 = v14;
        __int16 v38 = 2112;
        uint64_t v39 = v15;
        __int16 v40 = 2048;
        uint64_t v41 = v19;
        __int16 v42 = 2112;
        long long v43 = v16;
        __int16 v44 = 2112;
        long long v45 = v17;
        _os_log_impl(&dword_252495000, v13, OS_LOG_TYPE_DEBUG, "%{public}@UpdateNotifications received for fabricID:%@ enabled:%@ keepAliveOnly:%@. currentFabricID %@, browserState = %lu, fabricsWithActiveClients = %@, fabricWithActiveSecondaryClients = %@", buf, 0x52u);

        id v10 = v23;
        a5 = v22;
      }
      v24[0] = MEMORY[0x263EF8330];
      v24[1] = 3221225472;
      v24[2] = __88__HMMTRAccessoryServerBrowser_handleUpdateNotificationsEnabled_forFabric_keepAliveOnly___block_invoke;
      v24[3] = &unk_265376B90;
      BOOL v28 = a5;
      BOOL v29 = a3;
      id v25 = v8;
      __int16 v26 = v11;
      id v27 = v9;
      [(HMMTRAccessoryServerBrowser *)v11 dispatchAfterConfiguration:v24];
    }
    else
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        int v18 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        id v31 = v18;
        __int16 v32 = 2112;
        id v33 = v8;
        _os_log_impl(&dword_252495000, v13, OS_LOG_TYPE_ERROR, "%{public}@UpdateNotifications received nil fabricID for fabric: %@. Ignoring request", buf, 0x16u);
      }
    }
  }
}

void __88__HMMTRAccessoryServerBrowser_handleUpdateNotificationsEnabled_forFabric_keepAliveOnly___block_invoke(uint64_t a1)
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __88__HMMTRAccessoryServerBrowser_handleUpdateNotificationsEnabled_forFabric_keepAliveOnly___block_invoke_2;
  v4[3] = &unk_265376B68;
  __int16 v7 = *(_WORD *)(a1 + 56);
  id v2 = *(void **)(a1 + 32);
  id v3 = *(void **)(a1 + 48);
  void v4[4] = *(void *)(a1 + 40);
  id v5 = v3;
  id v6 = *(id *)(a1 + 32);
  [v2 loadFabricAndControllerDataForPairing:0 fetchFromResident:0 completion:v4];
}

void __88__HMMTRAccessoryServerBrowser_handleUpdateNotificationsEnabled_forFabric_keepAliveOnly___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  unint64_t v3 = a2;
  id v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  if (*(unsigned char *)(a1 + 56))
  {
    if (*(unsigned char *)(a1 + 57))
    {
      [*(id *)(a1 + 32) addFabricWithActiveSecondaryClients:*(void *)(a1 + 40)];
      goto LABEL_25;
    }
    unsigned __int8 v16 = [MEMORY[0x263F087E8] hmmtrErrorWithCode:7];
    [v5 removeActiveSecondaryClientWithFabricID:v4 updateConnectionIdleTimeout:0 reason:v16];
LABEL_11:

    goto LABEL_25;
  }
  if (!*(unsigned char *)(a1 + 57))
  {
    unsigned __int8 v16 = [MEMORY[0x263F087E8] hmmtrErrorWithCode:7];
    [v5 removeActiveClientWithFabricID:v4 updateConnectionIdleTimeout:0 reason:v16];
    goto LABEL_11;
  }
  [*(id *)(a1 + 32) addFabricWithActiveClients:*(void *)(a1 + 40)];
  uint64_t v6 = [*(id *)(a1 + 32) currentFabricID];
  unint64_t v7 = v3 | v6;

  if (!v7)
  {
    id v8 = (void *)MEMORY[0x2533B64D0]();
    id v9 = *(id *)(a1 + 32);
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v11 = HMFGetLogIdentifier();
      id v12 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      uint64_t v41 = v11;
      __int16 v42 = 2112;
      long long v43 = v12;
      _os_log_impl(&dword_252495000, v10, OS_LOG_TYPE_INFO, "%{public}@Starting stack for fabricID %@ because there are active clients and local stack is unconfigured", buf, 0x16u);
    }
    id v13 = [*(id *)(a1 + 32) workQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __88__HMMTRAccessoryServerBrowser_handleUpdateNotificationsEnabled_forFabric_keepAliveOnly___block_invoke_373;
    block[3] = &unk_265376E98;
    id v14 = *(void **)(a1 + 40);
    block[4] = *(void *)(a1 + 32);
    id v39 = v14;
    dispatch_async(v13, block);

    __int16 v15 = v39;
LABEL_24:

    goto LABEL_25;
  }
  uint64_t v17 = [*(id *)(a1 + 32) currentFabricID];
  int v18 = [v17 isEqualToNumber:*(void *)(a1 + 40)];

  if (!v18)
  {
    id v25 = [*(id *)(a1 + 48) delegate];
    if ([v25 isPrimaryResidentNodeReachable] && (_os_feature_enabled_impl() & 1) == 0)
    {
      int v34 = HM_FEATURE_RVC_DEFAULTS_ENABLED();

      if (!v34) {
        goto LABEL_25;
      }
    }
    else
    {
    }
    __int16 v26 = (void *)MEMORY[0x2533B64D0]();
    id v27 = *(id *)(a1 + 32);
    BOOL v28 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      BOOL v29 = HMFGetLogIdentifier();
      uint64_t v30 = [*(id *)(a1 + 32) currentFabricID];
      uint64_t v31 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      uint64_t v41 = v29;
      __int16 v42 = 2112;
      long long v43 = v30;
      __int16 v44 = 2112;
      uint64_t v45 = v31;
      _os_log_impl(&dword_252495000, v28, OS_LOG_TYPE_INFO, "%{public}@Shutting down active fabric %@ to start new fabric %@", buf, 0x20u);
    }
    __int16 v32 = [*(id *)(a1 + 32) workQueue];
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = __88__HMMTRAccessoryServerBrowser_handleUpdateNotificationsEnabled_forFabric_keepAliveOnly___block_invoke_375;
    v35[3] = &unk_265376E98;
    id v33 = *(void **)(a1 + 40);
    v35[4] = *(void *)(a1 + 32);
    id v36 = v33;
    dispatch_async(v32, v35);

    __int16 v15 = v36;
    goto LABEL_24;
  }
  if ([*(id *)(a1 + 32) isCurrentDeviceAllowedAccessoryControlDespiteReachableResidentForFabric:*(void *)(a1 + 48)]&& objc_msgSend(*(id *)(a1 + 32), "browserState") != 2)
  {
    uint64_t v19 = (void *)MEMORY[0x2533B64D0]();
    id v20 = *(id *)(a1 + 32);
    uint64_t v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      BOOL v22 = HMFGetLogIdentifier();
      uint64_t v23 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      uint64_t v41 = v22;
      __int16 v42 = 2112;
      long long v43 = v23;
      _os_log_impl(&dword_252495000, v21, OS_LOG_TYPE_INFO, "%{public}@Starting discovery stack for fabricID %@ because there are active clients", buf, 0x16u);
    }
    uint64_t v24 = [*(id *)(a1 + 32) workQueue];
    v37[0] = MEMORY[0x263EF8330];
    v37[1] = 3221225472;
    v37[2] = __88__HMMTRAccessoryServerBrowser_handleUpdateNotificationsEnabled_forFabric_keepAliveOnly___block_invoke_374;
    v37[3] = &unk_265378638;
    v37[4] = *(void *)(a1 + 32);
    dispatch_async(v24, v37);
  }
LABEL_25:
}

uint64_t __88__HMMTRAccessoryServerBrowser_handleUpdateNotificationsEnabled_forFabric_keepAliveOnly___block_invoke_373(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setupStorageStateForUpdatedHomeFabricID:*(void *)(a1 + 40)];
}

uint64_t __88__HMMTRAccessoryServerBrowser_handleUpdateNotificationsEnabled_forFabric_keepAliveOnly___block_invoke_374(uint64_t a1)
{
  return [*(id *)(a1 + 32) _restartDiscovery];
}

uint64_t __88__HMMTRAccessoryServerBrowser_handleUpdateNotificationsEnabled_forFabric_keepAliveOnly___block_invoke_375(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  unint64_t v3 = [MEMORY[0x263F087E8] hmmtrErrorWithCode:5];
  [v2 _stopMatterStackWithReason:v3];

  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  return [v4 _setupStorageStateForUpdatedHomeFabricID:v5];
}

- (void)handleResidentReachabilityChangeForFabric:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 fabricID];
  if (isFeatureMatteriPhoneOnlyPairingControlEnabled())
  {
    if ([(HMMTRAccessoryServerBrowser *)self isOwnerForHomeWithFabric:v4])
    {
      uint64_t v6 = (void *)MEMORY[0x2533B64D0]();
      unint64_t v7 = self;
      id v8 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        id v9 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        id v13 = v9;
        _os_log_impl(&dword_252495000, v8, OS_LOG_TYPE_DEBUG, "%{public}@Owner user - No need to request NOC", buf, 0xCu);
      }
    }
    else
    {
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __73__HMMTRAccessoryServerBrowser_handleResidentReachabilityChangeForFabric___block_invoke;
      v10[3] = &unk_265378660;
      void v10[4] = self;
      id v11 = v5;
      [v4 loadFabricAndControllerDataForPairing:0 fetchFromResident:0 completion:v10];
    }
  }
}

void __73__HMMTRAccessoryServerBrowser_handleResidentReachabilityChangeForFabric___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) currentFabricID];

  uint64_t v5 = *(void **)(a1 + 32);
  if (v4)
  {
    uint64_t v6 = [v5 currentFabricID];
    char v7 = [v6 isEqualToNumber:*(void *)(a1 + 40)];

    if (v7)
    {
      if (![*(id *)(a1 + 32) isCurrentDeviceMobileAndAllowedAccessoryControl]
        || [*(id *)(a1 + 32) browserState] == 2)
      {
        goto LABEL_17;
      }
      id v8 = [*(id *)(a1 + 32) fabricsWithActiveClients];
      if ([v8 containsObject:*(void *)(a1 + 40)])
      {

LABEL_19:
        uint64_t v24 = (void *)MEMORY[0x2533B64D0]();
        id v25 = *(id *)(a1 + 32);
        __int16 v26 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          id v27 = HMFGetLogIdentifier();
          uint64_t v28 = *(void *)(a1 + 40);
          *(_DWORD *)buf = 138543618;
          int v34 = v27;
          __int16 v35 = 2112;
          uint64_t v36 = v28;
          _os_log_impl(&dword_252495000, v26, OS_LOG_TYPE_INFO, "%{public}@No resident reachable for fabricID %@ and there are active clients, start local stack", buf, 0x16u);
        }
        BOOL v29 = [*(id *)(a1 + 32) delegateQueue];
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __73__HMMTRAccessoryServerBrowser_handleResidentReachabilityChangeForFabric___block_invoke_372;
        block[3] = &unk_265378638;
        block[4] = *(void *)(a1 + 32);
        dispatch_async(v29, block);

        goto LABEL_17;
      }
      BOOL v22 = [*(id *)(a1 + 32) fabricsWithActiveSecondaryClients];
      int v23 = [v22 containsObject:*(void *)(a1 + 40)];

      if (v23) {
        goto LABEL_19;
      }
      id v10 = (void *)MEMORY[0x2533B64D0]();
      id v11 = *(id *)(a1 + 32);
      id v12 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        id v13 = HMFGetLogIdentifier();
        uint64_t v30 = *(void *)(a1 + 40);
        uint64_t v31 = [*(id *)(a1 + 32) fabricsWithActiveClients];
        *(_DWORD *)buf = 138543874;
        int v34 = v13;
        __int16 v35 = 2112;
        uint64_t v36 = v30;
        __int16 v37 = 2112;
        __int16 v38 = v31;
        _os_log_impl(&dword_252495000, v12, OS_LOG_TYPE_INFO, "%{public}@Fabric %@ does not have active clients, fabricsWithActiveClients - %@", buf, 0x20u);

        goto LABEL_11;
      }
    }
    else
    {
      id v10 = (void *)MEMORY[0x2533B64D0]();
      id v11 = *(id *)(a1 + 32);
      id v12 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        id v13 = HMFGetLogIdentifier();
        uint64_t v14 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        int v34 = v13;
        __int16 v35 = 2112;
        uint64_t v36 = v14;
        _os_log_impl(&dword_252495000, v12, OS_LOG_TYPE_INFO, "%{public}@Resident reachability changed for non-current fabricID %@, ignoring", buf, 0x16u);
LABEL_11:
      }
    }

    goto LABEL_17;
  }
  id v9 = [v5 fabricsWithActiveClients];
  if ([v9 containsObject:*(void *)(a1 + 40)])
  {
  }
  else
  {
    __int16 v15 = [*(id *)(a1 + 32) fabricsWithActiveSecondaryClients];
    int v16 = [v15 containsObject:*(void *)(a1 + 40)];

    if (!v16) {
      goto LABEL_17;
    }
  }
  uint64_t v17 = (void *)MEMORY[0x2533B64D0]();
  id v18 = *(id *)(a1 + 32);
  uint64_t v19 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    id v20 = HMFGetLogIdentifier();
    uint64_t v21 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    int v34 = v20;
    __int16 v35 = 2112;
    uint64_t v36 = v21;
    _os_log_impl(&dword_252495000, v19, OS_LOG_TYPE_INFO, "%{public}@Starting stack for fabricID %@ because there are active clients and local stack is unconfigured", buf, 0x16u);
  }
  [*(id *)(a1 + 32) _setupStorageStateForUpdatedHomeFabricID:*(void *)(a1 + 40)];
LABEL_17:
}

void __73__HMMTRAccessoryServerBrowser_handleResidentReachabilityChangeForFabric___block_invoke_372(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [v1 currentFabricID];
  [v1 _setupStorageStateForUpdatedHomeFabricID:v2];
}

- (void)getNOCFromResidentForSharedUserForFabric:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(HMMTRAccessoryServerBrowser *)self isOwnerForHomeWithFabric:v4])
  {
    uint64_t v5 = (void *)MEMORY[0x2533B64D0]();
    uint64_t v6 = self;
    char v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      id v8 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v15 = v8;
      _os_log_impl(&dword_252495000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Owner user - No need to request NOC", buf, 0xCu);
    }
  }
  else
  {
    if (![(HMMTRAccessoryServerBrowser *)self isCurrentDeviceMobileAndResidentReachable])
    {
      id v9 = (void *)MEMORY[0x2533B64D0]();
      id v10 = self;
      id v11 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        id v12 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        __int16 v15 = v12;
        _os_log_impl(&dword_252495000, v11, OS_LOG_TYPE_INFO, "%{public}@Resident is not yet reachable to get NOC", buf, 0xCu);
      }
    }
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __72__HMMTRAccessoryServerBrowser_getNOCFromResidentForSharedUserForFabric___block_invoke;
    v13[3] = &unk_265376E00;
    v13[4] = self;
    [v4 loadFabricAndControllerDataForPairing:0 fetchFromResident:0 completion:v13];
  }
}

void __72__HMMTRAccessoryServerBrowser_getNOCFromResidentForSharedUserForFabric___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = (void *)MEMORY[0x2533B64D0]();
    id v5 = *(id *)(a1 + 32);
    uint64_t v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      char v7 = HMFGetLogIdentifier();
      int v8 = 138543618;
      id v9 = v7;
      __int16 v10 = 2112;
      id v11 = v3;
      _os_log_impl(&dword_252495000, v6, OS_LOG_TYPE_INFO, "%{public}@#### Failed fetching NOC for shared user with error %@", (uint8_t *)&v8, 0x16u);
    }
  }
}

- (void)_updateACLOnPairedAccessories
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = [(HMMTRAccessoryServerBrowser *)self discoveredAccessoryServers];
  id v4 = (void *)[v3 copy];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (([v9 removalInProgress] & 1) == 0)
        {
          v10[0] = MEMORY[0x263EF8330];
          v10[1] = 3221225472;
          v10[2] = __60__HMMTRAccessoryServerBrowser__updateACLOnPairedAccessories__block_invoke;
          v10[3] = &unk_265378660;
          void v10[4] = self;
          void v10[5] = v9;
          [(HMMTRAccessoryServerBrowser *)self _updateAccessoryControlListForServer:v9 completion:v10];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

void __60__HMMTRAccessoryServerBrowser__updateACLOnPairedAccessories__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x2533B64D0]();
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = HMFGetLogIdentifier();
    uint64_t v8 = *(void *)(a1 + 40);
    int v9 = 138543618;
    __int16 v10 = v7;
    __int16 v11 = 2112;
    uint64_t v12 = v8;
    _os_log_impl(&dword_252495000, v6, OS_LOG_TYPE_INFO, "%{public}@Updated ACL after user CAT update on server %@", (uint8_t *)&v9, 0x16u);
  }
}

- (void)updateAccessoryACLAndGetNOCFromResidentForSharedUserForFabric:(id)a3
{
  id v4 = a3;
  id v5 = [(HAPAccessoryServerBrowser *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __93__HMMTRAccessoryServerBrowser_updateAccessoryACLAndGetNOCFromResidentForSharedUserForFabric___block_invoke;
  v7[3] = &unk_265376E98;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __93__HMMTRAccessoryServerBrowser_updateAccessoryACLAndGetNOCFromResidentForSharedUserForFabric___block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) isOwnerForHomeWithFabric:*(void *)(a1 + 40)])
  {
    id v2 = (void *)MEMORY[0x2533B64D0]();
    id v3 = *(id *)(a1 + 32);
    id v4 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      id v5 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v26 = v5;
      _os_log_impl(&dword_252495000, v4, OS_LOG_TYPE_DEBUG, "%{public}@Owner user - No need to request NOC", buf, 0xCu);
    }
    if ([*(id *)(a1 + 32) isCurrentDevicePrimaryResident]) {
      [*(id *)(a1 + 32) _updateACLOnPairedAccessories];
    }
  }
  else
  {
    id v6 = [*(id *)(a1 + 40) currentDeviceNodeData];
    uint64_t v7 = [v6 operationalCertificate];

    if (v7)
    {
      id v8 = [MEMORY[0x263F10CC0] convertX509Certificate:v7];
      if (v8) {
        int v9 = (void *)[objc_alloc(MEMORY[0x263F10CB8]) initWithTLVBytes:v8];
      }
      else {
        int v9 = 0;
      }
    }
    else
    {
      int v9 = 0;
      id v8 = 0;
    }
    __int16 v10 = [v9 subject];
    __int16 v11 = [v10 caseAuthenticatedTags];

    uint64_t v12 = [*(id *)(a1 + 40) delegate];
    uint64_t v13 = [v12 accessoryOperatePrivilegeCATID:0];

    if (v13 && ![v11 containsObject:v13])
    {
      id v18 = (void *)MEMORY[0x2533B64D0]();
      id v19 = *(id *)(a1 + 32);
      id v20 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        uint64_t v21 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        __int16 v26 = v21;
        __int16 v27 = 2112;
        uint64_t v28 = v13;
        __int16 v29 = 2112;
        uint64_t v30 = v11;
        _os_log_impl(&dword_252495000, v20, OS_LOG_TYPE_INFO, "%{public}@New operation privilege CAT %@ missing from current NOC: %@, fetching a new NOC.", buf, 0x20u);
      }
      [*(id *)(a1 + 40) invalidateCachedData];
      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      v23[2] = __93__HMMTRAccessoryServerBrowser_updateAccessoryACLAndGetNOCFromResidentForSharedUserForFabric___block_invoke_371;
      v23[3] = &unk_265378660;
      BOOL v22 = *(void **)(a1 + 40);
      v23[4] = *(void *)(a1 + 32);
      id v24 = v22;
      [v24 loadFabricAndControllerDataForPairing:0 fetchFromResident:0 completion:v23];
    }
    else
    {
      long long v14 = (void *)MEMORY[0x2533B64D0]();
      id v15 = *(id *)(a1 + 32);
      uint64_t v16 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        uint64_t v17 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        __int16 v26 = v17;
        __int16 v27 = 2112;
        uint64_t v28 = v13;
        __int16 v29 = 2112;
        uint64_t v30 = v11;
        _os_log_impl(&dword_252495000, v16, OS_LOG_TYPE_INFO, "%{public}@No need to fetch NOC again for updated operate privilege CAT: %@ as current NOC contains %@", buf, 0x20u);
      }
    }
  }
}

void __93__HMMTRAccessoryServerBrowser_updateAccessoryACLAndGetNOCFromResidentForSharedUserForFabric___block_invoke_371(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = (void *)MEMORY[0x2533B64D0]();
    id v5 = *(id *)(a1 + 32);
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = HMFGetLogIdentifier();
      int v13 = 138543618;
      long long v14 = v7;
      __int16 v15 = 2112;
      id v16 = v3;
      _os_log_impl(&dword_252495000, v6, OS_LOG_TYPE_INFO, "%{public}@Failed to load NOC for shared user with error %@", (uint8_t *)&v13, 0x16u);
    }
  }
  else
  {
    id v8 = [*(id *)(a1 + 32) currentFabricID];
    int v9 = [*(id *)(a1 + 40) fabricID];
    int v10 = [v8 isEqualToNumber:v9];

    if (v10)
    {
      __int16 v11 = *(void **)(a1 + 32);
      uint64_t v12 = [*(id *)(a1 + 40) fabricID];
      [v11 _setupStorageStateForHomeFabricID:v12];
    }
  }
}

- (BOOL)isOwnerForHomeWithFabric:(id)a3
{
  id v3 = [a3 delegate];
  char v4 = [v3 isCurrentUserOwner];

  return v4;
}

- (BOOL)canEstablishConnectionForNodeID:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!isFeatureMatteriPhoneOnlyPairingControlForThreadEnabled()) {
    goto LABEL_7;
  }
  id v5 = [(HMMTRAccessoryServerBrowser *)self threadRadioManager];
  int v6 = [v5 deviceSupportsThreadService];

  if (!v6
    || ![(HMMTRAccessoryServerBrowser *)self isCurrentDeviceAllowedAccessoryControlDespiteReachableResident])
  {
    goto LABEL_7;
  }
  uint64_t v7 = [(HMMTRAccessoryServerBrowser *)self accessoryServerWithNodeID:v4];
  id v8 = v7;
  BOOL v9 = v7 != 0;
  if (!v7)
  {
    __int16 v11 = (void *)MEMORY[0x2533B64D0]();
    uint64_t v12 = self;
    int v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      long long v14 = HMFGetLogIdentifier();
      int v15 = 138543618;
      id v16 = v14;
      __int16 v17 = 2112;
      id v18 = v4;
      _os_log_impl(&dword_252495000, v13, OS_LOG_TYPE_ERROR, "%{public}@Could not associate with a paired accessory for canEstablishConnectionForNodeID:%@", (uint8_t *)&v15, 0x16u);
    }
    goto LABEL_12;
  }
  if (([v7 linkLayerType] & 0xFFFFFFFFFFFFFFFBLL) == 0)
  {
LABEL_12:

    goto LABEL_8;
  }

LABEL_7:
  BOOL v9 = 0;
LABEL_8:

  return v9;
}

- (BOOL)isCurrentDeviceMobileAndResidentReachableAndThreadCapableForFabric:(id)a3
{
  id v3 = a3;
  int v4 = isFeatureMatteriPhoneOnlyPairingControlEnabled();
  char v5 = 0;
  if (v3 && v4)
  {
    int v6 = [v3 delegate];
    char v5 = [v6 isPrimaryResidentNodeReachableAndThreadCapable];
  }
  return v5;
}

- (BOOL)isCurrentDeviceMobileAndResidentReachable
{
  id v2 = [(HMMTRAccessoryServerBrowser *)self currentFabric];
  if (isFeatureMatteriPhoneOnlyPairingControlEnabled())
  {
    id v3 = [v2 delegate];
    char v4 = [v3 isPrimaryResidentNodeReachable];
  }
  else
  {
    char v4 = 0;
  }

  return v4;
}

- (BOOL)isCurrentDeviceAllowedAccessoryControlDespiteReachableResident
{
  id v2 = self;
  id v3 = [(HMMTRAccessoryServerBrowser *)self currentFabric];
  LOBYTE(v2) = [(HMMTRAccessoryServerBrowser *)v2 isCurrentDeviceAllowedAccessoryControlDespiteReachableResidentForFabric:v3];

  return (char)v2;
}

- (BOOL)isCurrentDeviceAllowedAccessoryControlPerExplicitRequestDespiteReachableResidentForFabric:(id)a3
{
  BOOL result = isFeatureMatteriPhoneOnlyPairingControlEnabled();
  if (!a3) {
    return 0;
  }
  return result;
}

- (BOOL)isCurrentDeviceAllowedAccessoryControlDespiteReachableResidentForFabric:(id)a3
{
  id v3 = a3;
  int v4 = isFeatureMatteriPhoneOnlyPairingControlEnabled();
  LOBYTE(v5) = 0;
  if (v3 && v4)
  {
    int v6 = [v3 delegate];
    int v5 = [v6 isPrimaryResidentNodeReachableAndThreadCapable] ^ 1;
  }
  return v5;
}

- (BOOL)isCurrentDeviceMobileAndAllowedAccessoryControl
{
  id v2 = self;
  id v3 = [(HMMTRAccessoryServerBrowser *)self currentFabric];
  if (isFeatureMatteriPhoneOnlyPairingControlEnabled())
  {
    int v4 = [(HMMTRAccessoryServerBrowser *)v2 currentFabricID];

    LOBYTE(v2) = 0;
    if (v4 && v3)
    {
      int v5 = [v3 delegate];
      LODWORD(v2) = [v5 isPrimaryResidentNodeReachable] ^ 1;
    }
  }
  else
  {
    LOBYTE(v2) = 0;
  }

  return (char)v2;
}

- (BOOL)isCurrentDevicePrimaryResident
{
  return 0;
}

- (void)handlePrimaryResidentDataReady
{
  id v3 = [(HAPAccessoryServerBrowser *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __61__HMMTRAccessoryServerBrowser_handlePrimaryResidentDataReady__block_invoke;
  block[3] = &unk_265378638;
  block[4] = self;
  dispatch_async(v3, block);
}

void __61__HMMTRAccessoryServerBrowser_handlePrimaryResidentDataReady__block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (([*(id *)(a1 + 32) isCurrentDevicePrimaryResident] & 1) != 0
    || [*(id *)(a1 + 32) isCurrentDeviceMobileAndAllowedAccessoryControl])
  {
    id v2 = [*(id *)(a1 + 32) controllerFactoryEnablePerPrimaryResidentConfirmationToken];

    if (v2)
    {
      int v4 = [*(id *)(a1 + 32) controllerFactory];
      int v5 = [*(id *)(a1 + 32) controllerFactoryEnablePerPrimaryResidentConfirmationToken];
      [v4 enableNormalOperationWithToken:v5];

      uint64_t v3 = [*(id *)(a1 + 32) setControllerFactoryEnablePerPrimaryResidentConfirmationToken:0];
    }
    int v6 = (void *)MEMORY[0x2533B64D0](v3);
    id v7 = *(id *)(a1 + 32);
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      BOOL v9 = HMFGetLogIdentifier();
      int v14 = 138543362;
      int v15 = v9;
      _os_log_impl(&dword_252495000, v8, OS_LOG_TYPE_INFO, "%{public}@Primary resident data is ready. Re-enumerating accessories from storage", (uint8_t *)&v14, 0xCu);
    }
    if ([*(id *)(a1 + 32) pendingMatterStackRestart])
    {
      int v10 = (void *)MEMORY[0x2533B64D0]();
      id v11 = *(id *)(a1 + 32);
      uint64_t v12 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        int v13 = HMFGetLogIdentifier();
        int v14 = 138543362;
        int v15 = v13;
        _os_log_impl(&dword_252495000, v12, OS_LOG_TYPE_INFO, "%{public}@Matter stack restart is pending. Deferring re-enumeration", (uint8_t *)&v14, 0xCu);
      }
    }
    else
    {
      [*(id *)(a1 + 32) _reenumeratePairedDevices];
    }
  }
}

- (void)handleDeviceNoLongerPrimaryResidentWithCompletion:(id)a3
{
  id v4 = a3;
  int v5 = [MEMORY[0x263F087E8] hmmtrErrorWithCode:10];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __81__HMMTRAccessoryServerBrowser_handleDeviceNoLongerPrimaryResidentWithCompletion___block_invoke;
  v7[3] = &unk_2653770F0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(HMMTRAccessoryServerBrowser *)self invalidateAllDiscoveredServersWithReason:v5 completion:v7];
}

void __81__HMMTRAccessoryServerBrowser_handleDeviceNoLongerPrimaryResidentWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  uint64_t v3 = [*(id *)(a1 + 32) controllerFactoryEnablePerPrimaryResidentConfirmationToken];

  if (!v3)
  {
    id v4 = [*(id *)(a1 + 32) homeFabricControllers];
    [v4 removeAllGetters];

    id v6 = [*(id *)(a1 + 32) controllerFactory];
    int v5 = [v6 disableNormalOperation];
    [*(id *)(a1 + 32) setControllerFactoryEnablePerPrimaryResidentConfirmationToken:v5];
  }
}

- (void)storageDidUpdateData:(id)a3 isLocalChange:(BOOL)a4
{
  BOOL v61 = a4;
  uint64_t v76 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = [v5 fabricID];

  if (!v6)
  {
    __int16 v32 = (void *)MEMORY[0x2533B64D0]();
    id v33 = self;
    int v34 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      __int16 v35 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v71 = v35;
      _os_log_impl(&dword_252495000, v34, OS_LOG_TYPE_INFO, "%{public}@Updated storage doesn't contain fabric ID; ignoring the update",
        buf,
        0xCu);
    }
    goto LABEL_23;
  }
  id v7 = [(HMMTRAccessoryServerBrowser *)self storage];
  id v8 = [v7 fabricDataSource];

  if (!v8)
  {
    __int16 v32 = (void *)MEMORY[0x2533B64D0]();
    id v33 = self;
    int v34 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      uint64_t v36 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v71 = v36;
      _os_log_impl(&dword_252495000, v34, OS_LOG_TYPE_INFO, "%{public}@CHIP Storage updated for other fabric; ignoring the update",
        buf,
        0xCu);
    }
LABEL_23:

    goto LABEL_45;
  }
  if (!v61)
  {
    context = (void *)MEMORY[0x2533B64D0]();
    BOOL v9 = self;
    int v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v59 = HMFGetLogIdentifier();
      id v11 = [v5 fabricID];
      uint64_t v12 = [(HMMTRAccessoryServerBrowser *)v9 storage];
      int v13 = [v12 fabricDataSource];
      int v14 = [v13 keyValueStore];
      int v15 = [v14 allKeys];
      uint64_t v16 = [v15 sortedArrayUsingSelector:sel_caseInsensitiveCompare_];
      *(_DWORD *)buf = 138543874;
      v71 = v59;
      __int16 v72 = 2112;
      v73 = v11;
      __int16 v74 = 2112;
      v75 = v16;
      _os_log_impl(&dword_252495000, v10, OS_LOG_TYPE_INFO, "%{public}@CHIP Storage updated for fabric ID = %@. Currently contains %@", buf, 0x20u);
    }
  }
  __int16 v17 = (void *)MEMORY[0x2533B64D0]();
  id v18 = self;
  uint64_t v19 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    id v20 = HMFGetLogIdentifier();
    uint64_t v21 = [(HMMTRAccessoryServerBrowser *)v18 storage];
    BOOL v22 = [v21 pairedNodeIDs];
    *(_DWORD *)buf = 138543618;
    v71 = v20;
    __int16 v72 = 2112;
    v73 = v22;
    _os_log_impl(&dword_252495000, v19, OS_LOG_TYPE_INFO, "%{public}@Currently paired nodes %@", buf, 0x16u);
  }
  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  int v23 = [(HMMTRAccessoryServerBrowser *)v18 storage];
  id v24 = [v23 fabricDataSource];
  id v25 = [v24 allNodeIDs];

  uint64_t v26 = [v25 countByEnumeratingWithState:&v65 objects:v69 count:16];
  if (v26)
  {
    uint64_t v27 = *(void *)v66;
    while (2)
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v66 != v27) {
          objc_enumerationMutation(v25);
        }
        __int16 v29 = *(void **)(*((void *)&v65 + 1) + 8 * i);
        if (v29 && ([*(id *)(*((void *)&v65 + 1) + 8 * i) isEqual:&unk_2702B5820] & 1) == 0)
        {
          uint64_t v30 = [(HMMTRAccessoryServerBrowser *)v18 accessoryServerWithNodeID:v29];
          if (!v30)
          {
            __int16 v37 = (void *)MEMORY[0x2533B64D0]();
            __int16 v38 = v18;
            uint64_t v39 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
            {
              __int16 v40 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543618;
              v71 = v40;
              __int16 v72 = 2112;
              v73 = v29;
              _os_log_impl(&dword_252495000, v39, OS_LOG_TYPE_INFO, "%{public}@Storage has a node that is not yet discovered: %@", buf, 0x16u);
            }
            int v31 = 1;
            goto LABEL_30;
          }
        }
      }
      uint64_t v26 = [v25 countByEnumeratingWithState:&v65 objects:v69 count:16];
      if (v26) {
        continue;
      }
      break;
    }
  }
  int v31 = 0;
LABEL_30:

  if (([(HMMTRAccessoryServerBrowser *)v18 isCurrentDevicePrimaryResident]
     || -[HMMTRAccessoryServerBrowser isCurrentDeviceMobileAndAllowedAccessoryControl](v18, "isCurrentDeviceMobileAndAllowedAccessoryControl"))&& (((v31 | !v61) & 1) != 0 || [v5 caseAuthenticatedTagsUpdated]))
  {
    if (isFeatureMatterLocalFabricConfigEnabled()
      && [v5 caseAuthenticatedTagsUpdated])
    {
      [(HMMTRAccessoryServerBrowser *)v18 setPendingMatterStackRestart:1];
      [v5 setCaseAuthenticatedTagsUpdated:0];
    }
    uint64_t v41 = [(HMMTRAccessoryServerBrowser *)v18 matterStorageItems];
    __int16 v42 = [(HMMTRAccessoryServerBrowser *)v18 storage];
    long long v43 = [v42 fabricDataSource];
    __int16 v44 = [v43 keyValueStore];

    uint64_t v45 = +[HMMTRStorage matterItemsFromDictionary:v44];
    [(HMMTRAccessoryServerBrowser *)v18 setMatterStorageItems:v45];

    BOOL v46 = [(HMMTRAccessoryServerBrowser *)v18 pendingMatterStackRestart]
       || +[HMMTRStorage didUpdateMatterItems:v44 oldStorage:v41];
    [(HMMTRAccessoryServerBrowser *)v18 setPendingMatterStackRestart:v46];
    [(HMMTRAccessoryServerBrowser *)v18 setRestartCount:[(HMMTRAccessoryServerBrowser *)v18 restartCount] + 1];
    objc_initWeak((id *)buf, v18);
    dispatch_time_t v57 = dispatch_time(0, 500000000);
    v58 = [(HAPAccessoryServerBrowser *)v18 workQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __66__HMMTRAccessoryServerBrowser_storageDidUpdateData_isLocalChange___block_invoke;
    block[3] = &unk_2653765D0;
    objc_copyWeak(&v64, (id *)buf);
    id v63 = v5;
    dispatch_after(v57, v58, block);

    objc_destroyWeak(&v64);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v47 = (void *)MEMORY[0x2533B64D0]();
    v48 = v18;
    __int16 v49 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
    {
      id v50 = HMFGetLogIdentifier();
      [(HMMTRAccessoryServerBrowser *)v48 isCurrentDevicePrimaryResident];
      uint64_t v51 = HMFBooleanToString();
      v52 = HMFBooleanToString();
      *(_DWORD *)buf = 138543874;
      v71 = v50;
      __int16 v72 = 2112;
      v73 = v51;
      __int16 v74 = 2112;
      v75 = v52;
      _os_log_impl(&dword_252495000, v49, OS_LOG_TYPE_INFO, "%{public}@Partially handling data storage update as isPrimaryResident = %@, isLocalChange = %@", buf, 0x20u);
    }
    v53 = [(HMMTRAccessoryServerBrowser *)v48 storage];
    v54 = [v53 fabricDataSource];
    v55 = [v54 keyValueStore];
    v56 = +[HMMTRStorage matterItemsFromDictionary:v55];
    [(HMMTRAccessoryServerBrowser *)v48 setMatterStorageItems:v56];

    if (!v61) {
      [(HMMTRAccessoryServerBrowser *)v48 _updateLocallyDiscoveredServerPairedStates];
    }
  }
LABEL_45:
}

void __66__HMMTRAccessoryServerBrowser_storageDidUpdateData_isLocalChange___block_invoke(uint64_t a1)
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setRestartCount:", objc_msgSend(WeakRetained, "restartCount") - 1);
  if ([WeakRetained restartCount])
  {
    uint64_t v3 = (void *)MEMORY[0x2533B64D0]();
    id v4 = WeakRetained;
    id v5 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
LABEL_5:

      goto LABEL_30;
    }
    id v6 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v50 = v6;
    __int16 v51 = 2048;
    uint64_t v52 = [v4 restartCount];
    id v7 = "%{public}@Storage update handling was deferred - count down %lu";
    id v8 = v5;
    uint32_t v9 = 22;
LABEL_4:
    _os_log_impl(&dword_252495000, v8, OS_LOG_TYPE_INFO, v7, buf, v9);

    goto LABEL_5;
  }
  if ([WeakRetained pendingMatterStackRestart])
  {
    int v10 = (void *)MEMORY[0x2533B64D0]([WeakRetained setPendingMatterStackRestart:0]);
    id v11 = WeakRetained;
    uint64_t v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v50 = v13;
      _os_log_impl(&dword_252495000, v12, OS_LOG_TYPE_INFO, "%{public}@Some Matter Items updated in storage, reload the matter stack...", buf, 0xCu);
    }
    int v14 = (void *)MEMORY[0x2533B64D0]();
    id v15 = v11;
    uint64_t v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      __int16 v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v50 = v17;
      _os_log_impl(&dword_252495000, v16, OS_LOG_TYPE_INFO, "%{public}@Invalidating all local servers to force reload them...", buf, 0xCu);
    }
    id v18 = [MEMORY[0x263F087E8] hmmtrErrorWithCode:11];
    v47[0] = MEMORY[0x263EF8330];
    v47[1] = 3221225472;
    v47[2] = __66__HMMTRAccessoryServerBrowser_storageDidUpdateData_isLocalChange___block_invoke_370;
    v47[3] = &unk_265376E98;
    v47[4] = v15;
    id v48 = *(id *)(a1 + 32);
    [v15 invalidateAllDiscoveredServersWithReason:v18 completion:v47];
  }
  else
  {
    uint64_t v19 = [WeakRetained storage];
    id v20 = [v19 fabricDataSource];
    uint64_t v21 = [v20 allNodeIDs];
    uint64_t v22 = [v21 count];

    if (!v22)
    {
      uint64_t v3 = (void *)MEMORY[0x2533B64D0]();
      id v4 = WeakRetained;
      id v5 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO)) {
        goto LABEL_5;
      }
      id v6 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v50 = v6;
      id v7 = "%{public}@No paired devices found. Not restarting matter stack";
      id v8 = v5;
      uint32_t v9 = 12;
      goto LABEL_4;
    }
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    int v23 = objc_msgSend(WeakRetained, "storage", 0);
    id v24 = [v23 fabricDataSource];
    id v25 = [v24 allNodeIDs];

    uint64_t v26 = [v25 countByEnumeratingWithState:&v43 objects:v53 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v44;
      do
      {
        for (uint64_t i = 0; i != v27; ++i)
        {
          if (*(void *)v44 != v28) {
            objc_enumerationMutation(v25);
          }
          uint64_t v30 = *(void *)(*((void *)&v43 + 1) + 8 * i);
          if (v30 && ([*(id *)(*((void *)&v43 + 1) + 8 * i) isEqual:&unk_2702B5820] & 1) == 0)
          {
            int v31 = [WeakRetained nodesAddedToHome];
            [v31 addObject:v30];
          }
        }
        uint64_t v27 = [v25 countByEnumeratingWithState:&v43 objects:v53 count:16];
      }
      while (v27);
    }

    __int16 v32 = (void *)MEMORY[0x2533B64D0]();
    id v33 = WeakRetained;
    int v34 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      __int16 v35 = HMFGetLogIdentifier();
      uint64_t v36 = [v33 nodesAddedToHome];
      *(_DWORD *)buf = 138543618;
      id v50 = v35;
      __int16 v51 = 2112;
      uint64_t v52 = (uint64_t)v36;
      _os_log_impl(&dword_252495000, v34, OS_LOG_TYPE_INFO, "%{public}@CHIP Storage updated. All nodes to add: %@", buf, 0x16u);
    }
    __int16 v37 = [v33 deviceController];
    char v38 = [v37 isRunning];

    if ((v38 & 1) == 0)
    {
      uint64_t v39 = (void *)MEMORY[0x2533B64D0]();
      id v40 = v33;
      uint64_t v41 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        __int16 v42 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        id v50 = v42;
        _os_log_impl(&dword_252495000, v41, OS_LOG_TYPE_ERROR, "%{public}@Matter device controller is unexpectedly inactive when storage is updated", buf, 0xCu);
      }
    }
    [v33 setupPairedDevices];
    [v33 startDiscoveringAccessoryServers];
  }
LABEL_30:
}

void __66__HMMTRAccessoryServerBrowser_storageDidUpdateData_isLocalChange___block_invoke_370(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "storage", 0);
  uint64_t v3 = [v2 fabricDataSource];
  id v4 = [v3 allNodeIDs];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v30 objects:v38 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v31;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v31 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v30 + 1) + 8 * v8);
        if (v9 && ([*(id *)(*((void *)&v30 + 1) + 8 * v8) isEqual:&unk_2702B5820] & 1) == 0)
        {
          int v10 = [*(id *)(a1 + 32) nodesAddedToHome];
          [v10 addObject:v9];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v30 objects:v38 count:16];
    }
    while (v6);
  }

  id v11 = (void *)MEMORY[0x2533B64D0]();
  id v12 = *(id *)(a1 + 32);
  int v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    int v14 = HMFGetLogIdentifier();
    id v15 = [*(id *)(a1 + 32) nodesAddedToHome];
    *(_DWORD *)buf = 138543618;
    __int16 v35 = v14;
    __int16 v36 = 2112;
    __int16 v37 = v15;
    _os_log_impl(&dword_252495000, v13, OS_LOG_TYPE_INFO, "%{public}@All nodes to add back after reloading Matter stack: %@", buf, 0x16u);
  }
  uint64_t v16 = [*(id *)(a1 + 32) nodesAddedToHome];
  uint64_t v17 = [v16 count];

  if (v17)
  {
    id v18 = [*(id *)(a1 + 32) homeFabricControllers];
    [v18 removeAllGetters];

    uint64_t v19 = [*(id *)(a1 + 32) controllerFactory];
    id v20 = [v19 disableNormalOperation];

    uint64_t v21 = [*(id *)(a1 + 32) controllerFactory];
    [v21 enableNormalOperationWithToken:v20];

    uint64_t v22 = *(void **)(a1 + 32);
    int v23 = [*(id *)(a1 + 40) fabricID];
    [v22 _setupStorageStateForUpdatedHomeFabricID:v23];

    [*(id *)(a1 + 32) setupPairedDevices];
    [*(id *)(a1 + 32) startDiscoveringAccessoryServers];
LABEL_15:

    return;
  }
  id v24 = (void *)MEMORY[0x2533B64D0]();
  id v25 = *(id *)(a1 + 32);
  uint64_t v26 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    uint64_t v27 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    __int16 v35 = v27;
    _os_log_impl(&dword_252495000, v26, OS_LOG_TYPE_INFO, "%{public}@Shutting down the stack", buf, 0xCu);
  }
  uint64_t v28 = [*(id *)(a1 + 32) controllerFactoryEnablePerPrimaryResidentConfirmationToken];

  if (!v28)
  {
    id v20 = [*(id *)(a1 + 32) controllerFactory];
    __int16 v29 = [v20 disableNormalOperation];
    [*(id *)(a1 + 32) setControllerFactoryEnablePerPrimaryResidentConfirmationToken:v29];

    goto LABEL_15;
  }
}

- (void)_stopSystemCommissionerFabricID:(id)a3 reason:(id)a4
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)MEMORY[0x2533B64D0]();
  uint64_t v9 = self;
  int v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    char v38 = v11;
    __int16 v39 = 2112;
    id v40 = v6;
    _os_log_impl(&dword_252495000, v10, OS_LOG_TYPE_INFO, "%{public}@Stopping operation with system commissioner fabric ID %@", buf, 0x16u);
  }
  id v12 = [MEMORY[0x263EFF980] array];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  int v13 = v9->_discoveredAccessoryServers;
  uint64_t v14 = [(NSMutableSet *)v13 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v32 != v16) {
          objc_enumerationMutation(v13);
        }
        id v18 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        id v19 = [v18 fabricID];

        if (v19 == v6) {
          [v12 addObject:v18];
        }
      }
      uint64_t v15 = [(NSMutableSet *)v13 countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v15);
  }

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v20 = v12;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v28;
    do
    {
      for (uint64_t j = 0; j != v22; ++j)
      {
        if (*(void *)v28 != v23) {
          objc_enumerationMutation(v20);
        }
        id v25 = *(void **)(*((void *)&v27 + 1) + 8 * j);
        objc_msgSend(v25, "disable", (void)v27);
        [(HMMTRAccessoryServerBrowser *)v9 _invalidateAccessoryServer:v25 reason:v7 withCompletion:0];
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v27 objects:v35 count:16];
    }
    while (v22);
  }

  [(HMMTRAccessoryServerBrowser *)v9 _suspendOperationsForFabricID:v6];
  uint64_t v26 = [(HMMTRAccessoryServerBrowser *)v9 threadRadioManager];
  [v26 stopThreadRadioForSystemCommissionerFabricID:v6];
}

- (void)_disconnectFromIdleFabric:(id)a3 reason:(id)a4
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HMMTRAccessoryServerBrowser *)self currentFabricID];
  char v9 = HMFEqualObjects();

  if (v9)
  {
    int v10 = [(HMMTRAccessoryServerBrowser *)self fabricsWithActiveClients];
    id v11 = [(HMMTRAccessoryServerBrowser *)self currentFabricID];
    if ([v10 containsObject:v11])
    {

LABEL_8:
      id v18 = (void *)MEMORY[0x2533B64D0]();
      id v19 = self;
      id v20 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
LABEL_11:

        goto LABEL_16;
      }
      uint64_t v21 = HMFGetLogIdentifier();
      uint64_t v22 = [(HMMTRAccessoryServerBrowser *)v19 currentFabricID];
      uint64_t v23 = [(HMMTRAccessoryServerBrowser *)v19 fabricsWithActiveClients];
      id v24 = [(HMMTRAccessoryServerBrowser *)v19 fabricsWithActiveSecondaryClients];
      int v41 = 138544130;
      __int16 v42 = v21;
      __int16 v43 = 2112;
      id v44 = v22;
      __int16 v45 = 2112;
      long long v46 = v23;
      __int16 v47 = 2112;
      id v48 = v24;
      id v25 = "%{public}@Connection has become idle but there are still active clients, keeping matter stack active for fab"
            "ricID %@. Fabrics with active clients: %@, secondary clients: %@";
LABEL_10:
      _os_log_impl(&dword_252495000, v20, OS_LOG_TYPE_INFO, v25, (uint8_t *)&v41, 0x2Au);

      goto LABEL_11;
    }
    uint64_t v15 = [(HMMTRAccessoryServerBrowser *)self fabricsWithActiveSecondaryClients];
    uint64_t v16 = [(HMMTRAccessoryServerBrowser *)self currentFabricID];
    char v17 = [v15 containsObject:v16];

    if (v17) {
      goto LABEL_8;
    }
    long long v34 = [(HMMTRAccessoryServerBrowser *)self threadSoftwareUpdateController];
    __int16 v35 = [(HMMTRAccessoryServerBrowser *)self currentFabricID];
    int v36 = [v34 isFirmwareUpdateInProgressForFabricID:v35];

    id v18 = (void *)MEMORY[0x2533B64D0]();
    id v19 = self;
    id v20 = HMFGetOSLogHandle();
    BOOL v37 = os_log_type_enabled(v20, OS_LOG_TYPE_INFO);
    if (v36)
    {
      if (!v37) {
        goto LABEL_11;
      }
      uint64_t v21 = HMFGetLogIdentifier();
      uint64_t v22 = [(HMMTRAccessoryServerBrowser *)v19 currentFabricID];
      uint64_t v23 = [(HMMTRAccessoryServerBrowser *)v19 fabricsWithActiveClients];
      id v24 = [(HMMTRAccessoryServerBrowser *)v19 fabricsWithActiveSecondaryClients];
      int v41 = 138544130;
      __int16 v42 = v21;
      __int16 v43 = 2112;
      id v44 = v22;
      __int16 v45 = 2112;
      long long v46 = v23;
      __int16 v47 = 2112;
      id v48 = v24;
      id v25 = "%{public}@Connection has become idle, but FW update is active, keeping matter stack active for fabricID %@. "
            "Fabrics with active clients: %@, secondary clients: %@";
      goto LABEL_10;
    }
    if (v37)
    {
      char v38 = HMFGetLogIdentifier();
      __int16 v39 = [(HMMTRAccessoryServerBrowser *)v19 currentFabricID];
      id v40 = [(HMMTRAccessoryServerBrowser *)v19 fabricsWithActiveClients];
      int v41 = 138543874;
      __int16 v42 = v38;
      __int16 v43 = 2112;
      id v44 = v39;
      __int16 v45 = 2112;
      long long v46 = v40;
      _os_log_impl(&dword_252495000, v20, OS_LOG_TYPE_INFO, "%{public}@Connection has become idle, shutting down matter stack for fabricID %@. Fabrics with active clients: %@", (uint8_t *)&v41, 0x20u);
    }
    [(HMMTRAccessoryServerBrowser *)v19 _stopMatterStackWithReason:v7];
  }
  else
  {
    id v12 = [(HMMTRAccessoryServerBrowser *)self systemCommissionerFabricID];
    if ([v6 isEqual:v12])
    {
      int v13 = [(HMMTRAccessoryServerBrowser *)self fabricsWithActiveClients];
      char v14 = [v13 containsObject:v6];

      if ((v14 & 1) == 0)
      {
        [(HMMTRAccessoryServerBrowser *)self _stopSystemCommissionerFabricID:v6 reason:v7];
        goto LABEL_16;
      }
    }
    else
    {
    }
    uint64_t v26 = (void *)MEMORY[0x2533B64D0]();
    long long v27 = self;
    long long v28 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      long long v29 = HMFGetLogIdentifier();
      long long v30 = [(HMMTRAccessoryServerBrowser *)v27 currentFabricID];
      long long v31 = [(HMMTRAccessoryServerBrowser *)v27 fabricsWithActiveClients];
      int v41 = 138544130;
      __int16 v42 = v29;
      __int16 v43 = 2112;
      id v44 = v6;
      __int16 v45 = 2112;
      long long v46 = v30;
      __int16 v47 = 2112;
      id v48 = v31;
      _os_log_impl(&dword_252495000, v28, OS_LOG_TYPE_ERROR, "%{public}@Fabric %@ has become idle, but current FabricID is %@, not stopping current matter stack. fabrics with active clients:%@", (uint8_t *)&v41, 0x2Au);
    }
    long long v32 = [(HMMTRAccessoryServerBrowser *)v27 homeFabricControllers];
    long long v33 = [v32 cachedWrapperWithFabricID:v6];
    [v33 suspendOrShutdown];
  }
LABEL_16:
}

- (void)storageDidBecomeAvailable:(id)a3
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 fabricID];

  if (!v5)
  {
    uint64_t v8 = (void *)MEMORY[0x2533B64D0]();
    char v9 = self;
    int v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v41 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v49 = v41;
      __int16 v42 = "%{public}@Updated storage doesn't contain fabric ID; ignoring the update";
LABEL_26:
      _os_log_impl(&dword_252495000, v10, OS_LOG_TYPE_INFO, v42, buf, 0xCu);
    }
LABEL_27:

    goto LABEL_28;
  }
  id v6 = [(HMMTRAccessoryServerBrowser *)self storage];
  id v7 = [v6 fabricDataSource];

  uint64_t v8 = (void *)MEMORY[0x2533B64D0]();
  char v9 = self;
  int v10 = HMFGetOSLogHandle();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
  if (!v7)
  {
    if (v11)
    {
      int v41 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v49 = v41;
      __int16 v42 = "%{public}@CHIP Storage updated for other fabric; ignoring";
      goto LABEL_26;
    }
    goto LABEL_27;
  }
  if (v11)
  {
    id v12 = HMFGetLogIdentifier();
    int v13 = [(HMMTRAccessoryServerBrowser *)v9 storage];
    char v14 = [v13 fabricDataSource];
    uint64_t v15 = [v14 keyValueStore];
    *(_DWORD *)buf = 138543618;
    uint64_t v49 = v12;
    __int16 v50 = 2112;
    __int16 v51 = v15;
    _os_log_impl(&dword_252495000, v10, OS_LOG_TYPE_INFO, "%{public}@CHIP Storage is available. Currently contains %@", buf, 0x16u);
  }
  uint64_t v16 = (void *)MEMORY[0x2533B64D0]();
  char v17 = v9;
  id v18 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    id v19 = HMFGetLogIdentifier();
    id v20 = [(HMMTRAccessoryServerBrowser *)v17 storage];
    uint64_t v21 = [v20 pairedNodeIDs];
    *(_DWORD *)buf = 138543618;
    uint64_t v49 = v19;
    __int16 v50 = 2112;
    __int16 v51 = v21;
    _os_log_impl(&dword_252495000, v18, OS_LOG_TYPE_INFO, "%{public}@Currently paired nodes %@", buf, 0x16u);
  }
  if ([(HMMTRAccessoryServerBrowser *)v17 isCurrentDevicePrimaryResident]
    || [(HMMTRAccessoryServerBrowser *)v17 isCurrentDeviceMobileAndAllowedAccessoryControl])
  {
    uint64_t v22 = [v4 fabricID];
    [(HMMTRAccessoryServerBrowser *)v17 _setupStorageStateForHomeFabricID:v22];

    uint64_t v23 = [(HMMTRAccessoryServerBrowser *)v17 storage];
    id v24 = [v23 fabricDataSource];
    id v25 = [v24 keyValueStore];
    uint64_t v26 = +[HMMTRStorage matterItemsFromDictionary:v25];
    [(HMMTRAccessoryServerBrowser *)v17 setMatterStorageItems:v26];

    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v27 = [(HMMTRAccessoryServerBrowser *)v17 storage];
    long long v28 = [v27 fabricDataSource];
    long long v29 = [v28 allNodeIDs];

    uint64_t v30 = [v29 countByEnumeratingWithState:&v43 objects:v47 count:16];
    if (v30)
    {
      uint64_t v31 = v30;
      uint64_t v32 = *(void *)v44;
      do
      {
        for (uint64_t i = 0; i != v31; ++i)
        {
          if (*(void *)v44 != v32) {
            objc_enumerationMutation(v29);
          }
          uint64_t v34 = *(void *)(*((void *)&v43 + 1) + 8 * i);
          if (v34 && ([*(id *)(*((void *)&v43 + 1) + 8 * i) isEqual:&unk_2702B5820] & 1) == 0)
          {
            __int16 v35 = [(HMMTRAccessoryServerBrowser *)v17 nodesAddedToHome];
            [v35 addObject:v34];
          }
        }
        uint64_t v31 = [v29 countByEnumeratingWithState:&v43 objects:v47 count:16];
      }
      while (v31);
    }

    int v36 = (void *)MEMORY[0x2533B64D0]();
    BOOL v37 = v17;
    char v38 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    {
      __int16 v39 = HMFGetLogIdentifier();
      id v40 = [(HMMTRAccessoryServerBrowser *)v37 nodesAddedToHome];
      *(_DWORD *)buf = 138543618;
      uint64_t v49 = v39;
      __int16 v50 = 2112;
      __int16 v51 = v40;
      _os_log_impl(&dword_252495000, v38, OS_LOG_TYPE_INFO, "%{public}@All nodes to add when storage became available: %@", buf, 0x16u);
    }
    [(HMMTRAccessoryServerBrowser *)v37 setupPairedDevices];
    [(HMMTRAccessoryServerBrowser *)v37 startDiscoveringAccessoryServers];
  }
  else
  {
    [(HMMTRAccessoryServerBrowser *)v17 _cleanupStagedServers];
  }
LABEL_28:
}

- (void)_notifyDelegateOfPairingStep:(unint64_t)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v5 = (void *)MEMORY[0x2533B64D0](self, a2);
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    char v9 = HMMTRAccessoryPairingStepAsString(a3);
    int v13 = 138543618;
    char v14 = v8;
    __int16 v15 = 2112;
    uint64_t v16 = v9;
    _os_log_impl(&dword_252495000, v7, OS_LOG_TYPE_INFO, "%{public}@Notifying matter petric pairing step %@", (uint8_t *)&v13, 0x16u);
  }
  int v10 = [(HMMTRAccessoryServerBrowser *)v6 delegate];
  if ([v10 conformsToProtocol:&unk_2702F5170]) {
    BOOL v11 = v10;
  }
  else {
    BOOL v11 = 0;
  }
  id v12 = v11;

  [v12 notifyMatterAccessoryPairingStep:a3];
}

- (id)createSystemCommissionerFabricNOCWithSigningCertificate:(id)a3 operationalPublicKey:(__SecKey *)a4 fabricID:(id)a5 nodeID:(id)a6 caseAuthenticatedTags:(id)a7 error:(id *)a8
{
  char v14 = (void *)MEMORY[0x263F10CC0];
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a3;
  id v19 = [(HMMTRAccessoryServerBrowser *)self systemCommissionerNocSigner];
  id v20 = [v14 createOperationalCertificate:v19 signingCertificate:v18 operationalPublicKey:a4 fabricID:v17 nodeID:v16 caseAuthenticatedTags:v15 error:a8];

  return v20;
}

- (void)createNewSystemCommissionerFabricNodeIDWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HAPAccessoryServerBrowser *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __85__HMMTRAccessoryServerBrowser_createNewSystemCommissionerFabricNodeIDWithCompletion___block_invoke;
  v7[3] = &unk_2653770F0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __85__HMMTRAccessoryServerBrowser_createNewSystemCommissionerFabricNodeIDWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) systemCommissionerFabricID];

  if (v2)
  {
    uint64_t v3 = [*(id *)(a1 + 32) storage];
    id v4 = [v3 dataSource];
    uint64_t v5 = [*(id *)(a1 + 32) systemCommissionerFabricID];
    id v13 = [v4 storageDataSourceForFabricWithID:v5];

    id v6 = [v13 allNodeIDs];
    do
    {
      unint64_t v7 = +[HMMTRUtilities randomNodeID];
      id v8 = [NSNumber numberWithUnsignedLongLong:v7];
      char v9 = [v6 containsObject:v8];
    }
    while ((v9 & 1) != 0);
    uint64_t v10 = *(void *)(a1 + 40);
    BOOL v11 = [NSNumber numberWithUnsignedLongLong:v7];
    (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v11);
  }
  else
  {
    uint64_t v12 = *(void *)(a1 + 40);
    objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", +[HMMTRUtilities randomNodeID](HMMTRUtilities, "randomNodeID"));
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v12 + 16))(v12, v13);
  }
}

- (void)fetchSystemCommissionerRootCertificateWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HAPAccessoryServerBrowser *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __84__HMMTRAccessoryServerBrowser_fetchSystemCommissionerRootCertificateWithCompletion___block_invoke;
  v7[3] = &unk_2653770F0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __84__HMMTRAccessoryServerBrowser_fetchSystemCommissionerRootCertificateWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) systemCommissionerControllerParams];
  id v44 = 0;
  id v45 = 0;
  char v3 = [v2 fetchControllerParamsAllowingNew:1 nocSigner:&v45 controllerWrapper:&v44];
  id v4 = v45;
  id v5 = v44;

  if ((v3 & 1) == 0)
  {
    id v6 = (void *)MEMORY[0x2533B64D0]();
    id v7 = *(id *)(a1 + 32);
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      char v9 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v47 = v9;
      _os_log_impl(&dword_252495000, v8, OS_LOG_TYPE_ERROR, "%{public}@System commissioner controller parameters could not be fetched. No certs are fetched.", buf, 0xCu);
    }
    uint64_t v10 = *(void *)(a1 + 40);
    BOOL v11 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F10BB0] code:6 userInfo:0];
    (*(void (**)(uint64_t, void, void, void, void, void *))(v10 + 16))(v10, 0, 0, 0, 0, v11);
  }
  uint64_t v12 = [*(id *)(a1 + 32) storage];
  [v12 setSystemCommissionerNocSigner:v4];

  id v13 = [v5 startupParams];
  if (v13)
  {
    id v14 = objc_alloc(MEMORY[0x263F10CB8]);
    id v15 = (void *)MEMORY[0x263F10CC0];
    id v16 = [v13 operationalCertificate];
    id v17 = [v15 convertX509Certificate:v16];
    id v18 = (void *)[v14 initWithTLVBytes:v17];

    id v19 = [v18 subject];
    id v20 = [v19 nodeID];

    uint64_t v21 = (void *)MEMORY[0x2533B64D0]();
    id v22 = *(id *)(a1 + 32);
    uint64_t v23 = HMFGetOSLogHandle();
    id v24 = v23;
    if (v20)
    {
      id v43 = v5;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        id v25 = HMFGetLogIdentifier();
        [v13 fabricID];
        uint64_t v26 = v42 = v4;
        long long v27 = [v18 subject];
        long long v28 = [v27 nodeID];
        *(_DWORD *)buf = 138543874;
        __int16 v47 = v25;
        __int16 v48 = 2112;
        uint64_t v49 = v26;
        __int16 v50 = 2112;
        __int16 v51 = v28;
        _os_log_impl(&dword_252495000, v24, OS_LOG_TYPE_INFO, "%{public}@Fetching system commissioner certs for fabric ID %@ and controller node ID %@", buf, 0x20u);

        id v4 = v42;
      }

      uint64_t v29 = *(void *)(a1 + 40);
      uint64_t v30 = [v13 rootCertificate];
      uint64_t v31 = [v13 fabricID];
      uint64_t v32 = [v13 ipk];
      long long v33 = [v18 subject];
      uint64_t v34 = [v33 nodeID];
      (*(void (**)(uint64_t, void *, void *, void *, void *, void))(v29 + 16))(v29, v30, v31, v32, v34, 0);

      id v5 = v43;
    }
    else
    {
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        id v40 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        __int16 v47 = v40;
        _os_log_impl(&dword_252495000, v24, OS_LOG_TYPE_ERROR, "%{public}@System commissioner operational cert missing controller node ID. No certs are fetched.", buf, 0xCu);
      }
      uint64_t v41 = *(void *)(a1 + 40);
      uint64_t v30 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F10BB0] code:6 userInfo:0];
      (*(void (**)(uint64_t, void, void, void, void, void *))(v41 + 16))(v41, 0, 0, 0, 0, v30);
    }
  }
  else
  {
    __int16 v35 = (void *)MEMORY[0x2533B64D0]();
    id v36 = *(id *)(a1 + 32);
    BOOL v37 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      char v38 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v47 = v38;
      _os_log_impl(&dword_252495000, v37, OS_LOG_TYPE_ERROR, "%{public}@System commissioner controller parameters are not available. No certs are fetched.", buf, 0xCu);
    }
    uint64_t v39 = *(void *)(a1 + 40);
    id v18 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F10BB0] code:6 userInfo:0];
    (*(void (**)(uint64_t, void, void, void, void, void *))(v39 + 16))(v39, 0, 0, 0, 0, v18);
  }
}

- (id)_getSystemCommissionerFabricRootCertificateWithIndex:(id)a3 ipk:(id *)a4 controllerNodeID:(id *)a5
{
  uint64_t v105 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = objc_alloc_init(MEMORY[0x263F11058]);
  uint64_t v10 = v9;
  if (v9)
  {
    BOOL v11 = [v9 storedValueForKey:@"IPK"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v12 = v11;
    }
    else {
      uint64_t v12 = 0;
    }
    id v13 = v12;

    if (v13)
    {
      id v14 = (id) [objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedString:v13 options:0];
      *a4 = v14;

      if (*a4)
      {
        id v15 = (void *)MEMORY[0x2533B64D0]();
        id v16 = self;
        id v17 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          id v18 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v100 = v18;
          id v19 = "%{public}@IPK retrieved from MatterSupport storage";
          id v20 = v17;
          os_log_type_t v21 = OS_LOG_TYPE_DEBUG;
LABEL_15:
          _os_log_impl(&dword_252495000, v20, v21, v19, buf, 0xCu);

          goto LABEL_16;
        }
        goto LABEL_16;
      }
    }
    else
    {
      *a4 = 0;
    }
    id v15 = (void *)MEMORY[0x2533B64D0]();
    long long v27 = self;
    id v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      id v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v100 = v18;
      id v19 = "%{public}@No IPK in MatterSupport storage";
      id v20 = v17;
      os_log_type_t v21 = OS_LOG_TYPE_INFO;
      goto LABEL_15;
    }
LABEL_16:

    if (v8)
    {
      uint64_t v28 = objc_msgSend(NSString, "stringWithFormat:", @"f/%x/r", objc_msgSend(v8, "unsignedIntValue"));
      uint64_t v29 = objc_msgSend(NSString, "stringWithFormat:", @"f/%x/n", objc_msgSend(v8, "unsignedIntValue"));
      v98 = (void *)v28;
      uint64_t v30 = [v10 storedValueForKey:v28];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v31 = v30;
      }
      else {
        uint64_t v31 = 0;
      }
      id v32 = v31;

      if (v32
        && (uint64_t v33 = [objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedString:v32 options:0]) != 0)
      {
        uint64_t v34 = (void *)v33;
        v93 = a5;
        v97 = v29;
        uint64_t v35 = [MEMORY[0x263F10CC0] convertMatterCertificate:v33];
        id v36 = (void *)MEMORY[0x263F10CC0];
        BOOL v37 = [(HMMTRAccessoryServerBrowser *)self systemCommissionerNocSigner];
        v96 = (void *)v35;
        LOBYTE(v36) = [v36 keypair:v37 matchesCertificate:v35];

        if (v36)
        {
          char v38 = [v10 storedValueForKey:v97];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            uint64_t v39 = v38;
          }
          else {
            uint64_t v39 = 0;
          }
          id v40 = v39;

          if (v40
            && (uint64_t v41 = [objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedString:v40 options:0]) != 0)
          {
            id v42 = (void *)v41;
            v89 = v34;
            id v43 = (void *)[objc_alloc(MEMORY[0x263F10CB8]) initWithTLVBytes:v41];
            id v44 = [v43 subject];
            uint64_t v45 = [v44 fabricID];

            long long v46 = [(HMMTRAccessoryServerBrowser *)self systemCommissionerFabricID];
            v90 = (void *)v45;
            LOBYTE(v45) = [(id)v45 isEqual:v46];

            v87 = v43;
            v88 = v42;
            if (v45)
            {
              id v91 = v40;
              __int16 v47 = [v43 subject];
              __int16 v48 = [v47 nodeID];

              uint64_t v49 = (void *)MEMORY[0x2533B64D0]();
              __int16 v50 = self;
              __int16 v51 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
              {
                uint64_t v52 = HMFGetLogIdentifier();
                int v53 = [v8 unsignedIntValue];
                *(_DWORD *)buf = 138544130;
                v100 = v52;
                __int16 v101 = 2112;
                *(void *)v102 = v90;
                *(_WORD *)&v102[8] = 1024;
                *(_DWORD *)&v102[10] = v53;
                __int16 v103 = 2112;
                v104 = v48;
                _os_log_impl(&dword_252495000, v51, OS_LOG_TYPE_DEBUG, "%{public}@Retrieved root cert for fabric ID %@ with fabric index 0x%x. Controller node ID is %@.", buf, 0x26u);
              }
              id v54 = v48;
              v55 = v96;
              id *v93 = v54;
              id v26 = v96;

              uint64_t v34 = v89;
              id v40 = v91;
            }
            else
            {
              v79 = (void *)MEMORY[0x2533B64D0]();
              v80 = self;
              v81 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v81, OS_LOG_TYPE_DEBUG))
              {
                v82 = HMFGetLogIdentifier();
                int v83 = [v8 unsignedIntValue];
                [(HMMTRAccessoryServerBrowser *)v80 systemCommissionerFabricID];
                v95 = v79;
                v85 = id v84 = v40;
                *(_DWORD *)buf = 138544130;
                v100 = v82;
                __int16 v101 = 1024;
                *(_DWORD *)v102 = v83;
                *(_WORD *)&v102[4] = 2112;
                *(void *)&v102[6] = v90;
                __int16 v103 = 2112;
                v104 = v85;
                _os_log_impl(&dword_252495000, v81, OS_LOG_TYPE_DEBUG, "%{public}@f/%x/n fabric ID %@ doesn't match system commissioner fabric ID %@", buf, 0x26u);

                id v40 = v84;
                v79 = v95;
              }
              id v26 = 0;
              uint64_t v34 = v89;
              v55 = v96;
            }

            uint64_t v29 = v97;
          }
          else
          {
            id v92 = v40;
            __int16 v72 = (void *)MEMORY[0x2533B64D0]();
            v73 = self;
            __int16 v74 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
            {
              v75 = HMFGetLogIdentifier();
              uint64_t v76 = v34;
              int v77 = [v8 unsignedIntValue];
              int v78 = [v8 unsignedIntValue];
              *(_DWORD *)buf = 138543874;
              v100 = v75;
              __int16 v101 = 1024;
              *(_DWORD *)v102 = v77;
              uint64_t v34 = v76;
              *(_WORD *)&v102[4] = 1024;
              *(_DWORD *)&v102[6] = v78;
              _os_log_impl(&dword_252495000, v74, OS_LOG_TYPE_ERROR, "%{public}@f/%x/r doesn't have matching f/%x/n", buf, 0x18u);
            }
            id v26 = 0;
            v55 = v96;
            uint64_t v29 = v97;
            id v40 = v92;
          }
        }
        else
        {
          long long v65 = (void *)MEMORY[0x2533B64D0]();
          long long v66 = self;
          long long v67 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
          {
            long long v68 = HMFGetLogIdentifier();
            v94 = v65;
            v69 = v34;
            int v70 = [v8 unsignedIntValue];
            v71 = [(HMMTRAccessoryServerBrowser *)v66 systemCommissionerNocSigner];
            *(_DWORD *)buf = 138543874;
            v100 = v68;
            __int16 v101 = 1024;
            *(_DWORD *)v102 = v70;
            uint64_t v34 = v69;
            long long v65 = v94;
            *(_WORD *)&v102[4] = 2112;
            *(void *)&v102[6] = v71;
            _os_log_impl(&dword_252495000, v67, OS_LOG_TYPE_ERROR, "%{public}@f/%x/r doesn't match system commissioner keypair %@", buf, 0x1Cu);
          }
          id v26 = 0;
          v55 = v96;
          uint64_t v29 = v97;
        }
      }
      else
      {
        v56 = (void *)MEMORY[0x2533B64D0]();
        dispatch_time_t v57 = self;
        v58 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
        {
          v59 = HMFGetLogIdentifier();
          int v60 = [v8 unsignedIntValue];
          *(_DWORD *)buf = 138543618;
          v100 = v59;
          __int16 v101 = 1024;
          *(_DWORD *)v102 = v60;
          _os_log_impl(&dword_252495000, v58, OS_LOG_TYPE_ERROR, "%{public}@f/%x/r isn't base64 encoded", buf, 0x12u);
        }
        id v26 = 0;
      }
    }
    else
    {
      BOOL v61 = (void *)MEMORY[0x2533B64D0]();
      v62 = self;
      id v63 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
      {
        id v64 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v100 = v64;
        _os_log_impl(&dword_252495000, v63, OS_LOG_TYPE_DEBUG, "%{public}@Not fetching root cert since fabric index is unknown", buf, 0xCu);
      }
      id v26 = 0;
    }

    goto LABEL_52;
  }
  id v22 = (void *)MEMORY[0x2533B64D0]();
  uint64_t v23 = self;
  id v24 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    id v25 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v100 = v25;
    _os_log_impl(&dword_252495000, v24, OS_LOG_TYPE_ERROR, "%{public}@Couldn't access MatterSupport key store", buf, 0xCu);
  }
  id v26 = 0;
LABEL_52:

  return v26;
}

- (id)_serverFromMTSDevicePairing:(id)a3
{
  v37[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [HMMTRAccessoryServerFactory alloc];
  id v6 = [(HAPAccessoryServerBrowser *)self keyStore];
  id v7 = [(HMMTRAccessoryServerFactory *)v5 initWithKeystore:v6 browser:self];

  id v8 = [v4 deviceType];
  v37[0] = v8;
  uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v37 count:1];

  if (v9) {
    uint64_t v10 = (void *)v9;
  }
  else {
    uint64_t v10 = &unk_2702B6228;
  }
  BOOL v11 = [v4 nodeID];
  uint64_t v12 = [v10 firstObject];
  id v13 = [v4 vendorID];
  id v14 = [v4 productID];
  id v15 = [v4 serialNumber];
  uint64_t v34 = v7;
  id v16 = [(HMMTRAccessoryServerFactory *)v7 vendAccessoryServerWithNodeID:v11 setupCode:0 discriminator:0 category:v12 vendorID:v13 productID:v14 serialNumber:v15 firmwareRevision:0];

  id v17 = [(HMMTRAccessoryServerBrowser *)self storage];
  id v18 = [v17 fabricDataSource];
  id v19 = [v4 nodeID];
  id v20 = [v18 storageDataSourceForDeviceWithNodeID:v19];
  os_log_type_t v21 = [v4 vendorID];
  id v22 = [v4 productID];
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = __59__HMMTRAccessoryServerBrowser__serverFromMTSDevicePairing___block_invoke;
  v35[3] = &unk_265378660;
  v35[4] = self;
  id v23 = v4;
  id v36 = v23;
  [v20 updateVendorID:v21 productID:v22 completion:v35];

  [v16 setPairedState:3];
  [v16 setKnownToSystemCommissioner:1];
  id v24 = [(HMMTRAccessoryServerBrowser *)self systemCommissionerFabricID];
  [v16 setFabricID:v24];

  id v25 = [v23 uuid];
  [v16 setCommissioningID:v25];

  id v26 = [(HMMTRAccessoryServerBrowser *)self systemCommissionerControllerWrapper];
  [v16 setControllerWrapper:v26];

  if (isFeatureMatteriPhoneOnlyPairingControlEnabled())
  {
    long long v27 = [(HMMTRAccessoryServerBrowser *)self storage];
    uint64_t v28 = [v23 nodeID];
    objc_msgSend(v16, "setWedDevice:", objc_msgSend(v27, "wedSupportedForSystemCommissionerFabricNode:", v28));

    uint64_t v29 = [(HMMTRAccessoryServerBrowser *)self storage];
    uint64_t v30 = [v23 nodeID];
    uint64_t v31 = [v29 extendedMACAddressForSystemCommissionerFabricNode:v30];
    [v16 setEMACAddress:v31];
  }
  id v32 = [(HMMTRAccessoryServerBrowser *)self discoveredAccessoryServers];
  [v32 addObject:v16];

  return v16;
}

void __59__HMMTRAccessoryServerBrowser__serverFromMTSDevicePairing___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = (void *)MEMORY[0x2533B64D0]();
    id v5 = *(id *)(a1 + 32);
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = HMFGetLogIdentifier();
      id v8 = [*(id *)(a1 + 40) vendorID];
      uint64_t v9 = [*(id *)(a1 + 40) productID];
      int v10 = 138544386;
      BOOL v11 = v7;
      __int16 v12 = 2080;
      id v13 = "-[HMMTRAccessoryServerBrowser _serverFromMTSDevicePairing:]_block_invoke";
      __int16 v14 = 2112;
      id v15 = v8;
      __int16 v16 = 2112;
      id v17 = v9;
      __int16 v18 = 2112;
      id v19 = v3;
      _os_log_impl(&dword_252495000, v6, OS_LOG_TYPE_ERROR, "%{public}@%s: Failed to update vendorID to %@ and productID to %@ with error: %@", (uint8_t *)&v10, 0x34u);
    }
  }
}

- (id)accessoryServerWithNodeID:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = self->_discoveredAccessoryServers;
  id v6 = (id)[(NSMutableSet *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        int v10 = objc_msgSend(v9, "nodeID", (void)v13);
        char v11 = [v4 isEqualToNumber:v10];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[(NSMutableSet *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)handlePairingCompletionForAccessoryWithNodeID:(id)a3 fabricID:(id)a4 vendorID:(id)a5 productID:(id)a6 configNumber:(id)a7 category:(id)a8 topology:(id)a9
{
  uint64_t v80 = *MEMORY[0x263EF8340];
  id v15 = a3;
  id v16 = a4;
  id v57 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v55 = a9;
  uint64_t v20 = (void *)MEMORY[0x2533B64D0]();
  os_log_type_t v21 = self;
  id v22 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    id v23 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138544898;
    long long v67 = v23;
    __int16 v68 = 2112;
    id v69 = v15;
    __int16 v70 = 2112;
    id v71 = v16;
    __int16 v72 = 2112;
    id v73 = v57;
    __int16 v74 = 2112;
    id v75 = v17;
    __int16 v76 = 2112;
    id v77 = v18;
    __int16 v78 = 2112;
    id v79 = v19;
    _os_log_impl(&dword_252495000, v22, OS_LOG_TYPE_INFO, "%{public}@Handling pairing completion for Accessory with Node ID %@, Fabric ID %@, Vendor ID %@, Product ID %@, Config Number %@, Category %@", buf, 0x48u);
  }
  v56 = v18;
  id v24 = v17;

  id v25 = [(HMMTRAccessoryServerBrowser *)v21 storage];
  uint64_t v26 = [v25 fabricID];
  if (!v26)
  {

    goto LABEL_7;
  }
  long long v27 = (void *)v26;
  uint64_t v28 = [(HMMTRAccessoryServerBrowser *)v21 storage];
  uint64_t v29 = [v28 fabricID];
  int v30 = [v29 isEqual:&unk_2702B5820];

  if (v30)
  {
LABEL_7:
    uint64_t v31 = [(HMMTRAccessoryServerBrowser *)v21 storage];
    [v31 prepareStorageForFabricID:v16];
  }
  id v32 = [(HMMTRAccessoryServerBrowser *)v21 storage];
  uint64_t v33 = [v32 fabricID];
  if (v33)
  {
    uint64_t v34 = (void *)v33;
    uint64_t v35 = [(HMMTRAccessoryServerBrowser *)v21 storage];
    id v36 = [v35 fabricID];
    char v37 = HMFEqualObjects();

    char v38 = v24;
    if ((v37 & 1) == 0)
    {
      uint64_t v39 = (void *)MEMORY[0x2533B64D0]();
      id v40 = v21;
      uint64_t v41 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        id v42 = HMFGetLogIdentifier();
        id v43 = [(HMMTRAccessoryServerBrowser *)v40 storage];
        id v44 = [v43 fabricID];
        *(_DWORD *)buf = 138543874;
        long long v67 = v42;
        __int16 v68 = 2112;
        id v69 = v44;
        __int16 v70 = 2112;
        id v71 = v16;
        _os_log_impl(&dword_252495000, v41, OS_LOG_TYPE_ERROR, "%{public}@Current Matter stack is running for fabric Index %@ and therefore request to handle pairing on fabric ID %@ cannot be processed", buf, 0x20u);

        char v38 = v24;
      }

      long long v46 = v56;
      uint64_t v45 = v57;
      __int16 v47 = v55;
      goto LABEL_17;
    }
  }
  else
  {

    char v38 = v24;
  }
  __int16 v48 = [(HMMTRAccessoryServerBrowser *)v21 nodesWithPendingACLOverwrite];
  [v48 addObject:v15];

  uint64_t v49 = (void *)MEMORY[0x2533B64D0]();
  __int16 v50 = v21;
  __int16 v51 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
  {
    uint64_t v52 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    long long v67 = v52;
    _os_log_impl(&dword_252495000, v51, OS_LOG_TYPE_INFO, "%{public}@Updating storage with information for newly paired accessory", buf, 0xCu);
  }
  int v53 = [(HMMTRAccessoryServerBrowser *)v50 storage];
  id v54 = [v53 workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __136__HMMTRAccessoryServerBrowser_handlePairingCompletionForAccessoryWithNodeID_fabricID_vendorID_productID_configNumber_category_topology___block_invoke;
  block[3] = &unk_265376B40;
  void block[4] = v50;
  id v59 = v15;
  uint64_t v45 = v57;
  id v60 = v57;
  id v61 = v16;
  id v62 = v38;
  id v63 = v19;
  long long v46 = v56;
  id v64 = v56;
  __int16 v47 = v55;
  id v65 = v55;
  dispatch_async(v54, block);

LABEL_17:
}

void __136__HMMTRAccessoryServerBrowser_handlePairingCompletionForAccessoryWithNodeID_fabricID_vendorID_productID_configNumber_category_topology___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) storage];
  [v2 startLocalStorageMode];

  id v3 = [*(id *)(a1 + 32) storage];
  [v3 addPairedNodeID:*(void *)(a1 + 40)];

  id v4 = [*(id *)(a1 + 32) storage];
  [v4 setVendorID:*(void *)(a1 + 48) forNode:*(void *)(a1 + 40)];

  id v5 = [*(id *)(a1 + 32) storage];
  [v5 setFabricID:*(void *)(a1 + 56) forNode:*(void *)(a1 + 40)];

  id v6 = [*(id *)(a1 + 32) storage];
  [v6 setProductID:*(void *)(a1 + 64) forNode:*(void *)(a1 + 40)];

  uint64_t v7 = [*(id *)(a1 + 32) storage];
  [v7 setCategory:*(void *)(a1 + 72) forNode:*(void *)(a1 + 40)];

  id v8 = [*(id *)(a1 + 32) storage];
  [v8 setConfigNumber:*(void *)(a1 + 80) forNode:*(void *)(a1 + 40)];

  uint64_t v9 = [*(id *)(a1 + 32) storage];
  [v9 setStaged:0 forNode:*(void *)(a1 + 40)];

  int v10 = [*(id *)(a1 + 32) storage];
  [v10 setTopology:*(void *)(a1 + 88) forNode:*(void *)(a1 + 40)];

  id v11 = [*(id *)(a1 + 32) storage];
  [v11 endLocalStorageModeBySyncingToRemote:1];
}

- (void)notifyPairingCompletionForAccessoryServer:(id)a3
{
  id v4 = a3;
  id v5 = [(HMMTRAccessoryServerBrowser *)self delegate];
  [v5 accessoryServerBrowser:self didFinishPairingForAccessoryServer:v4];
}

- (void)fetchCommissioningCertificatesForAccessoryWithOperationalPublicKey:(id)a3 rootCertificate:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(HAPAccessoryServerBrowser *)self workQueue];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __132__HMMTRAccessoryServerBrowser_fetchCommissioningCertificatesForAccessoryWithOperationalPublicKey_rootCertificate_completionHandler___block_invoke;
  v15[3] = &unk_2653775F0;
  id v16 = v8;
  id v17 = self;
  id v18 = v9;
  id v19 = v10;
  id v12 = v9;
  id v13 = v10;
  id v14 = v8;
  dispatch_async(v11, v15);
}

void __132__HMMTRAccessoryServerBrowser_fetchCommissioningCertificatesForAccessoryWithOperationalPublicKey_rootCertificate_completionHandler___block_invoke(uint64_t a1)
{
  v62[2] = *MEMORY[0x263EF8340];
  uint64_t v2 = *MEMORY[0x263F16FA8];
  v61[0] = *MEMORY[0x263F16F68];
  v61[1] = v2;
  uint64_t v3 = *MEMORY[0x263F16FB8];
  v62[0] = *MEMORY[0x263F16F80];
  v62[1] = v3;
  CFDictionaryRef v4 = [NSDictionary dictionaryWithObjects:v62 forKeys:v61 count:2];
  CFErrorRef error = 0;
  SecKeyRef v5 = SecKeyCreateWithData(*(CFDataRef *)(a1 + 32), v4, &error);
  if (v5)
  {
    SecKeyRef v6 = v5;
    uint64_t v7 = [*(id *)(a1 + 40) commissioneeAccessoryServer];

    if (v7)
    {
      if (*(void *)(a1 + 48))
      {
        id v8 = (void *)MEMORY[0x263F10CC0];
        id v9 = [*(id *)(a1 + 40) nocSigner];
        uint64_t v10 = *(void *)(a1 + 48);
        id v11 = [*(id *)(a1 + 40) commissioneeAccessoryServer];
        id v12 = [v11 fabricID];
        id v13 = [*(id *)(a1 + 40) commissioneeAccessoryServer];
        id v14 = [v13 nodeID];
        id v55 = 0;
        id v15 = [v8 createOperationalCertificate:v9 signingCertificate:v10 operationalPublicKey:v6 fabricID:v12 nodeID:v14 caseAuthenticatedTags:0 error:&v55];
        id v16 = (__CFError *)v55;

        id v17 = (void *)MEMORY[0x2533B64D0]();
        id v18 = *(id *)(a1 + 40);
        id v19 = HMFGetOSLogHandle();
        uint64_t v20 = v19;
        if (v15)
        {
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            os_log_type_t v21 = HMFGetLogIdentifier();
            id v22 = [*(id *)(a1 + 40) commissioneeAccessoryServer];
            id v23 = [v22 nodeID];
            *(_DWORD *)buf = 138543618;
            v58 = v21;
            __int16 v59 = 2112;
            CFErrorRef v60 = v23;
            _os_log_impl(&dword_252495000, v20, OS_LOG_TYPE_INFO, "%{public}@Successfully generated Operational Certificate for accessory with Node ID %@", buf, 0x16u);
          }
          (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
        }
        else
        {
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            __int16 v50 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            v58 = v50;
            __int16 v59 = 2112;
            CFErrorRef v60 = v16;
            _os_log_impl(&dword_252495000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to Generate Operational Certificate for Accessory getting commissioned with error %@", buf, 0x16u);
          }
          uint64_t v51 = *(void *)(a1 + 56);
          uint64_t v52 = [MEMORY[0x263F087E8] hmfErrorWithCode:15];
          (*(void (**)(uint64_t, void, void, void *))(v51 + 16))(v51, 0, 0, v52);
        }
      }
      else
      {
        char v37 = (void *)MEMORY[0x2533B64D0]();
        id v38 = *(id *)(a1 + 40);
        uint64_t v39 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
        {
          id v40 = HMFGetLogIdentifier();
          uint64_t v41 = [*(id *)(a1 + 40) commissioneeAccessoryServer];
          id v42 = [v41 nodeID];
          *(_DWORD *)buf = 138543618;
          v58 = v40;
          __int16 v59 = 2112;
          CFErrorRef v60 = v42;
          _os_log_impl(&dword_252495000, v39, OS_LOG_TYPE_INFO, "%{public}@Requesting signed operational certificate from Resident device for commissionee with node ID %@", buf, 0x16u);
        }
        id v43 = [*(id *)(a1 + 40) delegate];
        id v44 = *(void **)(a1 + 40);
        uint64_t v45 = [v44 commissioneeAccessoryServer];
        long long v46 = [v45 nodeID];
        __int16 v47 = [*(id *)(a1 + 40) commissioneeAccessoryServer];
        __int16 v48 = [v47 fabricID];
        v53[0] = MEMORY[0x263EF8330];
        v53[1] = 3221225472;
        v53[2] = __132__HMMTRAccessoryServerBrowser_fetchCommissioningCertificatesForAccessoryWithOperationalPublicKey_rootCertificate_completionHandler___block_invoke_356;
        v53[3] = &unk_265376B18;
        uint64_t v49 = *(void *)(a1 + 32);
        v53[4] = *(void *)(a1 + 40);
        id v54 = *(id *)(a1 + 56);
        [v43 accessoryServerBrowser:v44 getCommissioningCertificatesForNodeID:v46 fabricID:v48 publicKey:v49 completion:v53];
      }
    }
    else
    {
      uint64_t v31 = (void *)MEMORY[0x2533B64D0]();
      id v32 = *(id *)(a1 + 40);
      uint64_t v33 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        uint64_t v34 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v58 = v34;
        _os_log_impl(&dword_252495000, v33, OS_LOG_TYPE_ERROR, "%{public}@Failed to find accessory getting paired", buf, 0xCu);
      }
      uint64_t v35 = *(void *)(a1 + 56);
      id v36 = [MEMORY[0x263F087E8] hmfErrorWithCode:15];
      (*(void (**)(uint64_t, void, void, void *))(v35 + 16))(v35, 0, 0, v36);
    }
  }
  else
  {
    CFErrorRef v24 = error;
    id v25 = (void *)MEMORY[0x2533B64D0]();
    id v26 = *(id *)(a1 + 40);
    long long v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      uint64_t v28 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v58 = v28;
      __int16 v59 = 2112;
      CFErrorRef v60 = v24;
      _os_log_impl(&dword_252495000, v27, OS_LOG_TYPE_ERROR, "%{public}@Failed to convert Public Key Data to SecKey with error %@", buf, 0x16u);
    }
    uint64_t v29 = *(void *)(a1 + 56);
    int v30 = [MEMORY[0x263F087E8] hmfErrorWithCode:3];
    (*(void (**)(uint64_t, void, void, void *))(v29 + 16))(v29, 0, 0, v30);
  }
}

void __132__HMMTRAccessoryServerBrowser_fetchCommissioningCertificatesForAccessoryWithOperationalPublicKey_rootCertificate_completionHandler___block_invoke_356(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = (void *)MEMORY[0x2533B64D0]();
  id v17 = *(id *)(a1 + 32);
  id v18 = HMFGetOSLogHandle();
  id v19 = v18;
  if (v11 && v12)
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      uint64_t v20 = HMFGetLogIdentifier();
      [*(id *)(a1 + 32) commissioneeAccessoryServer];
      os_log_type_t v21 = v25 = v13;
      [v21 nodeID];
      v22 = id v24 = v14;
      *(_DWORD *)buf = 138543874;
      long long v27 = v20;
      __int16 v28 = 2112;
      id v29 = v12;
      __int16 v30 = 2112;
      uint64_t v31 = v22;
      _os_log_impl(&dword_252495000, v19, OS_LOG_TYPE_INFO, "%{public}@Successfully received signed Operational Certificate %@ for Accessory with node ID %@ from Owner", buf, 0x20u);

      id v14 = v24;
      id v13 = v25;
    }
  }
  else if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    id v23 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    long long v27 = v23;
    __int16 v28 = 2112;
    id v29 = v15;
    _os_log_impl(&dword_252495000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to Get Root/Operational Certificate for accessory from Owner with error %@", buf, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)fetchCommissioningCertificatesForSharedAdminWithDeviceNodeID:(id)a3 forOwner:(BOOL)a4 publicKey:(id)a5 fabricID:(id)a6 completionHandler:(id)a7
{
  BOOL v10 = a4;
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (v10) {
    id v16 = "Owner";
  }
  else {
    id v16 = "Shared Admin";
  }
  id v17 = (void *)MEMORY[0x2533B64D0]();
  id v18 = self;
  id v19 = HMFGetOSLogHandle();
  BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_INFO);
  if (v12)
  {
    if (v20)
    {
      os_log_type_t v21 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      uint64_t v49 = v21;
      __int16 v50 = 2080;
      uint64_t v51 = (uint64_t)v16;
      __int16 v52 = 2112;
      id v53 = v12;
      _os_log_impl(&dword_252495000, v19, OS_LOG_TYPE_INFO, "%{public}@Received request from %s controller to generate Operational Certificate for Node ID %@", buf, 0x20u);
    }
  }
  else
  {
    if (v20)
    {
      id v22 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v49 = v22;
      __int16 v50 = 2080;
      uint64_t v51 = (uint64_t)v16;
      _os_log_impl(&dword_252495000, v19, OS_LOG_TYPE_INFO, "%{public}@Received request from %s controller to generate Operational certificate for itself", buf, 0x16u);
    }
    if (!v14 || [v14 isEqualToNumber:&unk_2702B5820])
    {
      id v23 = [(HMMTRAccessoryServerBrowser *)v18 storage];
      id v24 = [v23 fabricID];

      if (v24)
      {
        id v25 = [(HMMTRAccessoryServerBrowser *)v18 storage];
        uint64_t v26 = [v25 fabricID];
      }
      else
      {
        long long v27 = (void *)MEMORY[0x2533B64D0]();
        __int16 v28 = v18;
        id v29 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          __int16 v30 = v40 = v27;
          *(_DWORD *)buf = 138543362;
          uint64_t v49 = v30;
          _os_log_impl(&dword_252495000, v29, OS_LOG_TYPE_INFO, "%{public}@This resident is not configured for any fabric as fabricID is nil", buf, 0xCu);

          long long v27 = v40;
        }

        uint64_t v26 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[HMMTRAccessoryServerBrowser _getRandomFabricId](v28, "_getRandomFabricId"));

        uint64_t v31 = (void *)MEMORY[0x2533B64D0]();
        uint64_t v32 = v28;
        uint64_t v33 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          uint64_t v34 = v40 = v31;
          *(_DWORD *)buf = 138543618;
          uint64_t v49 = v34;
          __int16 v50 = 2112;
          uint64_t v51 = v26;
          _os_log_impl(&dword_252495000, v33, OS_LOG_TYPE_INFO, "%{public}@Generated new fabric ID: %@", buf, 0x16u);

          uint64_t v31 = v40;
        }
      }
      id v14 = (id)v26;
    }
  }
  uint64_t v35 = [(HAPAccessoryServerBrowser *)v18 workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __138__HMMTRAccessoryServerBrowser_fetchCommissioningCertificatesForSharedAdminWithDeviceNodeID_forOwner_publicKey_fabricID_completionHandler___block_invoke;
  block[3] = &unk_265376AF0;
  void block[4] = v18;
  id v42 = v14;
  id v43 = v12;
  id v44 = v13;
  BOOL v47 = v10;
  id v45 = v15;
  long long v46 = v16;
  id v36 = v15;
  id v37 = v13;
  id v38 = v12;
  id v39 = v14;
  dispatch_async(v35, block);
}

void __138__HMMTRAccessoryServerBrowser_fetchCommissioningCertificatesForSharedAdminWithDeviceNodeID_forOwner_publicKey_fabricID_completionHandler___block_invoke(uint64_t a1)
{
  v192[2] = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) storage];
  uint64_t v3 = [v2 fabricID];

  unint64_t v4 = 0x263F10000uLL;
  if (!v3)
  {
    v164 = 0;
    v166 = 0;
    id v11 = 0;
    goto LABEL_37;
  }
  SecKeyRef v5 = [*(id *)(a1 + 32) storage];
  id v6 = [v5 storageDataForKey:@"HMD.MTRPlugin.RootCert"];

  uint64_t v7 = [*(id *)(a1 + 32) storage];
  id v8 = [v7 storageDataForKey:@"HMD.MTRPlugin.OperationalCert"];

  v163 = [MEMORY[0x263F10CC0] convertX509Certificate:v8];
  id v9 = (void *)[objc_alloc(MEMORY[0x263F10CB8]) initWithTLVBytes:v163];
  BOOL v10 = [v9 subject];
  id v11 = [v10 nodeID];

  v165 = v9;
  id v12 = [v9 subject];
  id v13 = [v12 fabricID];
  int v14 = HMFEqualObjects();

  if (!v14)
  {
    id v17 = (void *)MEMORY[0x2533B64D0]();
    id v18 = *(id *)(a1 + 32);
    id v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      BOOL v20 = HMFGetLogIdentifier();
      os_log_type_t v21 = [v165 subject];
      [v21 fabricID];
      id v23 = v22 = v11;
      id v24 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      v178 = v20;
      __int16 v179 = 2112;
      uint64_t v180 = (uint64_t)v23;
      __int16 v181 = 2112;
      id v182 = v24;
      _os_log_impl(&dword_252495000, v19, OS_LOG_TYPE_INFO, "%{public}@Cached root/NOC in storage has invalid fabric ID %@ vs expected %@", buf, 0x20u);

      id v11 = v22;
    }

    uint64_t v3 = 0;
    id v6 = 0;
    id v8 = 0;
    id v11 = 0;
    goto LABEL_10;
  }
  id v15 = (void *)MEMORY[0x263F10CC0];
  id v16 = [*(id *)(a1 + 32) ownerSharedOperationalKeyPair];
  LOBYTE(v15) = [v15 keypair:v16 matchesCertificate:v8];

  if (v15)
  {
    uint64_t v3 = 0;
    if (!v6) {
      goto LABEL_10;
    }
LABEL_17:
    if (v11 && v8) {
      goto LABEL_22;
    }
    goto LABEL_10;
  }
  id v42 = (void *)MEMORY[0x263F10CC0];
  id v43 = [*(id *)(a1 + 32) nocSigner];
  id v44 = [*(id *)(a1 + 32) ownerSharedOperationalKeyPair];
  uint64_t v45 = [v44 publicKey];
  uint64_t v46 = *(void *)(a1 + 40);
  id v176 = 0;
  BOOL v47 = v11;
  uint64_t v48 = [v42 createOperationalCertificate:v43 signingCertificate:v6 operationalPublicKey:v45 fabricID:v46 nodeID:v11 caseAuthenticatedTags:0 error:&v176];
  id v49 = v176;

  __int16 v50 = (void *)MEMORY[0x2533B64D0]();
  id v51 = *(id *)(a1 + 32);
  __int16 v52 = HMFGetOSLogHandle();
  id v53 = v52;
  if (!v48)
  {
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
    {
      v156 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v178 = v156;
      __int16 v179 = 2112;
      uint64_t v180 = (uint64_t)v49;
      _os_log_impl(&dword_252495000, v53, OS_LOG_TYPE_ERROR, "%{public}@Failed to generate Operational Certificate with error %@", buf, 0x16u);
    }
    id v8 = 0;
    id v11 = v47;
    uint64_t v3 = v49;
    goto LABEL_10;
  }
  if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
  {
    uint64_t v54 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v178 = v54;
    _os_log_impl(&dword_252495000, v53, OS_LOG_TYPE_INFO, "%{public}@Successfully generated Operational Certificate using Root Certificate from storage", buf, 0xCu);
  }
  id v8 = (void *)v48;
  id v11 = v47;
  uint64_t v3 = v49;
  if (v6) {
    goto LABEL_17;
  }
LABEL_10:
  v161 = v3;
  id v25 = v8;
  uint64_t v26 = v6;
  long long v27 = v11;
  __int16 v28 = [*(id *)(a1 + 32) storage];
  id v29 = [*(id *)(a1 + 32) storage];
  __int16 v30 = [v29 fabricDataSource];
  uint64_t v31 = [v30 keyValueStore];
  uint64_t v32 = *(void *)(a1 + 40);
  uint64_t v33 = [*(id *)(a1 + 32) nocSigner];
  id v174 = v26;
  id v175 = v27;
  [v28 knownFabricInStorage:v31 fabricID:v32 keyPair:v33 controllerNodeID:&v175 rootCertificate:&v174];
  id v34 = v175;

  id v6 = v174;
  id v8 = v25;
  if (v6)
  {
    id v11 = v34;
    if (v34)
    {
      uint64_t v35 = (void *)MEMORY[0x263F10CC0];
      id v36 = [*(id *)(a1 + 32) nocSigner];
      id v37 = [*(id *)(a1 + 32) ownerSharedOperationalKeyPair];
      uint64_t v38 = [v37 publicKey];
      uint64_t v39 = *(void *)(a1 + 40);
      id v173 = v161;
      uint64_t v40 = [v35 createOperationalCertificate:v36 signingCertificate:v6 operationalPublicKey:v38 fabricID:v39 nodeID:v34 caseAuthenticatedTags:0 error:&v173];
      id v41 = v173;

      id v8 = (void *)v40;
      uint64_t v3 = v41;
      goto LABEL_22;
    }
  }
  else
  {
    id v11 = v34;
  }
  uint64_t v3 = v161;
LABEL_22:

  if (v6)
  {
    unint64_t v4 = 0x263F10000;
    if (v11 && v8)
    {
      id v55 = v6;
      v56 = (void *)MEMORY[0x2533B64D0]();
      id v57 = *(id *)(a1 + 32);
      v58 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
      {
        __int16 v59 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v178 = v59;
        _os_log_impl(&dword_252495000, v58, OS_LOG_TYPE_INFO, "%{public}@Successfully fetched Root certificate from storage", buf, 0xCu);
      }
      if (*(void *)(a1 + 48))
      {
        v159 = v11;
        id v160 = 0;
        id v162 = 0;
      }
      else
      {
        id v160 = v11;
        CFErrorRef v60 = (void *)MEMORY[0x2533B64D0]();
        id v61 = *(id *)(a1 + 32);
        id v62 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
        {
          id v63 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v178 = v63;
          _os_log_impl(&dword_252495000, v62, OS_LOG_TYPE_INFO, "%{public}@Successfully fetched Owner Node ID from storage", buf, 0xCu);
        }
        id v162 = v8;
        id v64 = (void *)MEMORY[0x2533B64D0]();
        id v65 = *(id *)(a1 + 32);
        long long v66 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
        {
          long long v67 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v178 = v67;
          _os_log_impl(&dword_252495000, v66, OS_LOG_TYPE_INFO, "%{public}@Successfully fetched Owner NOC from storage", buf, 0xCu);
        }
        id v8 = v162;
        v159 = v160;
      }
      id v68 = v55;
      goto LABEL_48;
    }
    v164 = v6;
    v166 = v8;
  }
  else
  {
    v164 = 0;
    v166 = v8;
    unint64_t v4 = 0x263F10000;
  }
LABEL_37:
  id v69 = (void *)MEMORY[0x2533B64D0]();
  id v70 = *(id *)(a1 + 32);
  id v71 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
  {
    __int16 v72 = HMFGetLogIdentifier();
    id v73 = [*(id *)(a1 + 32) storage];
    __int16 v74 = [v73 certificateIssuerID];
    *(_DWORD *)buf = 138543618;
    v178 = v72;
    __int16 v179 = 2112;
    uint64_t v180 = (uint64_t)v74;
    _os_log_impl(&dword_252495000, v71, OS_LOG_TYPE_INFO, "%{public}@Root Certificate not found in storage; generating a new one using issuer ID %@",
      buf,
      0x16u);

    unint64_t v4 = 0x263F10000uLL;
  }

  id v75 = *(void **)(v4 + 3264);
  __int16 v76 = [*(id *)(a1 + 32) nocSigner];
  id v77 = [*(id *)(a1 + 32) storage];
  __int16 v78 = [v77 certificateIssuerID];
  uint64_t v79 = *(void *)(a1 + 40);
  id v172 = v3;
  uint64_t v80 = [v75 createRootCertificate:v76 issuerID:v78 fabricID:v79 error:&v172];
  id v81 = v172;

  v159 = v11;
  if (*(void *)(a1 + 48))
  {
    id v160 = 0;
    id v162 = 0;
    id v8 = v166;
    id v55 = (id)v80;
  }
  else
  {
    uint64_t v82 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", +[HMMTRUtilities randomNodeID](HMMTRUtilities, "randomNodeID"));
    int v83 = (void *)MEMORY[0x2533B64D0]();
    id v84 = *(id *)(a1 + 32);
    v85 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v85, OS_LOG_TYPE_INFO))
    {
      v86 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v178 = v86;
      __int16 v179 = 2112;
      uint64_t v180 = v82;
      _os_log_impl(&dword_252495000, v85, OS_LOG_TYPE_INFO, "%{public}@Generating a random Node ID %@ for Owner", buf, 0x16u);
    }
    v87 = (void *)MEMORY[0x263F10CC0];
    v88 = [*(id *)(a1 + 32) nocSigner];
    v89 = [*(id *)(a1 + 32) ownerSharedOperationalKeyPair];
    uint64_t v90 = [v89 publicKey];
    uint64_t v91 = *(void *)(a1 + 40);
    id v171 = v81;
    id v55 = (id)v80;
    id v160 = (id)v82;
    id v162 = [v87 createOperationalCertificate:v88 signingCertificate:v80 operationalPublicKey:v90 fabricID:v91 nodeID:v82 caseAuthenticatedTags:0 error:&v171];
    id v92 = v171;

    v93 = (void *)MEMORY[0x2533B64D0]();
    id v94 = *(id *)(a1 + 32);
    v95 = HMFGetOSLogHandle();
    id v8 = v166;
    if (os_log_type_enabled(v95, OS_LOG_TYPE_INFO))
    {
      v96 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v178 = v96;
      __int16 v179 = 2112;
      uint64_t v180 = (uint64_t)v162;
      _os_log_impl(&dword_252495000, v95, OS_LOG_TYPE_INFO, "%{public}@Generating NOC for Owner %@", buf, 0x16u);

      id v55 = (id)v80;
    }

    id v81 = v92;
  }
  id v68 = v164;
  if (!v55)
  {
    v110 = 0;
    goto LABEL_72;
  }
  uint64_t v3 = v81;
  unint64_t v4 = 0x263F10000;
LABEL_48:
  uint64_t v97 = *MEMORY[0x263F16F80];
  uint64_t v98 = *MEMORY[0x263F16FA8];
  v191[0] = *MEMORY[0x263F16F68];
  v191[1] = v98;
  uint64_t v99 = *MEMORY[0x263F16FB8];
  v192[0] = v97;
  v192[1] = v99;
  CFDictionaryRef v100 = [NSDictionary dictionaryWithObjects:v192 forKeys:v191 count:2];
  CFErrorRef error = 0;
  SecKeyRef v101 = SecKeyCreateWithData(*(CFDataRef *)(a1 + 56), v100, &error);
  v164 = v68;
  id v167 = v55;
  CFDictionaryRef v158 = v100;
  if (!v101)
  {
    CFErrorRef v105 = error;
    v106 = (void *)MEMORY[0x2533B64D0]();
    id v107 = *(id *)(a1 + 32);
    v108 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v108, OS_LOG_TYPE_ERROR))
    {
      v109 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v178 = v109;
      __int16 v179 = 2112;
      uint64_t v180 = (uint64_t)v105;
      _os_log_impl(&dword_252495000, v108, OS_LOG_TYPE_ERROR, "%{public}@Failed to convert Public Key Data to SecKey with error %@", buf, 0x16u);
    }

    goto LABEL_68;
  }
  SecKeyRef v102 = v101;
  __int16 v103 = *(void **)(a1 + 48);
  if (v103)
  {
    id v104 = v103;
  }
  else
  {
    if (*(unsigned char *)(a1 + 80))
    {
      id v111 = v160;
    }
    else
    {
      objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", +[HMMTRUtilities randomNodeID](HMMTRUtilities, "randomNodeID"));
      id v111 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v104 = v111;
    v112 = (void *)MEMORY[0x2533B64D0]();
    id v113 = *(id *)(a1 + 32);
    v114 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v114, OS_LOG_TYPE_INFO))
    {
      v115 = HMFGetLogIdentifier();
      uint64_t v116 = *(void *)(a1 + 72);
      *(_DWORD *)buf = 138543874;
      v178 = v115;
      __int16 v179 = 2080;
      uint64_t v180 = v116;
      __int16 v181 = 2112;
      id v182 = v104;
      _os_log_impl(&dword_252495000, v114, OS_LOG_TYPE_INFO, "%{public}@Generating a Random Node ID for %s Controller as %@", buf, 0x20u);
    }
  }
  v117 = (void *)MEMORY[0x2533B64D0]();
  id v118 = *(id *)(a1 + 32);
  v119 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v119, OS_LOG_TYPE_INFO))
  {
    v120 = HMFGetLogIdentifier();
    v157 = v102;
    v121 = v117;
    id v122 = v104;
    v123 = v3;
    v124 = v8;
    uint64_t v125 = *(void *)(a1 + 72);
    v126 = [*(id *)(a1 + 32) nocSigner];
    uint64_t v127 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138544898;
    v178 = v120;
    __int16 v179 = 2080;
    uint64_t v180 = v125;
    id v8 = v124;
    uint64_t v3 = v123;
    id v104 = v122;
    v117 = v121;
    SecKeyRef v102 = v157;
    __int16 v181 = 2112;
    id v182 = v126;
    __int16 v183 = 2112;
    id v184 = v167;
    __int16 v185 = 2112;
    v186 = v157;
    __int16 v187 = 2112;
    uint64_t v188 = v127;
    __int16 v189 = 2112;
    id v190 = v104;
    _os_log_impl(&dword_252495000, v119, OS_LOG_TYPE_INFO, "%{public}@Generating a OP cert for %s Controller with nocSigner %@, rootCert = %@, pubKeyAsSecKey %@, fabricID %@, nodeID %@", buf, 0x48u);

    unint64_t v4 = 0x263F10000uLL;
  }

  v128 = *(void **)(v4 + 3264);
  v129 = [*(id *)(a1 + 32) nocSigner];
  uint64_t v130 = *(void *)(a1 + 40);
  id v169 = v3;
  v110 = [v128 createOperationalCertificate:v129 signingCertificate:v167 operationalPublicKey:v102 fabricID:v130 nodeID:v104 caseAuthenticatedTags:0 error:&v169];
  id v131 = v169;

  if (!v110)
  {
    uint64_t v3 = v131;
LABEL_68:
    v132 = (void *)MEMORY[0x2533B64D0]();
    id v133 = *(id *)(a1 + 32);
    v134 = HMFGetOSLogHandle();
    CFDictionaryRef v137 = v158;
    if (os_log_type_enabled(v134, OS_LOG_TYPE_ERROR))
    {
      v138 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v178 = v138;
      __int16 v179 = 2112;
      uint64_t v180 = (uint64_t)v3;
      _os_log_impl(&dword_252495000, v134, OS_LOG_TYPE_ERROR, "%{public}@Failed to generate Operational Certificate %@", buf, 0x16u);
    }
    v110 = 0;
    goto LABEL_71;
  }
  v132 = (void *)MEMORY[0x2533B64D0]();
  id v133 = *(id *)(a1 + 32);
  v134 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v134, OS_LOG_TYPE_INFO))
  {
    v135 = HMFGetLogIdentifier();
    uint64_t v136 = *(void *)(a1 + 72);
    *(_DWORD *)buf = 138543618;
    v178 = v135;
    __int16 v179 = 2080;
    uint64_t v180 = v136;
    _os_log_impl(&dword_252495000, v134, OS_LOG_TYPE_INFO, "%{public}@Successfully generated Operational Certificate for %s Controller", buf, 0x16u);
  }
  uint64_t v3 = v131;
  CFDictionaryRef v137 = v158;
LABEL_71:

  id v81 = v3;
  id v55 = v167;
LABEL_72:
  v168 = v8;
  if (*(void *)(a1 + 48))
  {
    v139 = (void *)MEMORY[0x2533B64D0]();
    id v140 = *(id *)(a1 + 32);
    v141 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v141, OS_LOG_TYPE_INFO))
    {
      v142 = HMFGetLogIdentifier();
      v143 = *(void **)(a1 + 72);
      *(_DWORD *)buf = 138544130;
      v178 = v142;
      __int16 v179 = 2112;
      uint64_t v180 = (uint64_t)v55;
      __int16 v181 = 2112;
      id v182 = v110;
      __int16 v183 = 2080;
      id v184 = v143;
      _os_log_impl(&dword_252495000, v141, OS_LOG_TYPE_INFO, "%{public}@Returning Root Certificate %@, Operational Certificate %@ to %s Controller", buf, 0x2Au);
    }
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    v144 = v160;
  }
  else
  {
    v145 = [*(id *)(a1 + 32) storage];
    v146 = [v145 ipkForFabricID:*(void *)(a1 + 40) forPairing:1];

    v147 = [*(id *)(a1 + 32) storage];
    [v147 setRootCert:v55];

    v148 = [*(id *)(a1 + 32) storage];
    [v148 setOperationalCert:v162];

    v149 = [*(id *)(a1 + 32) storage];
    v144 = v160;
    [v149 setControllerNodeID:v160];

    v150 = [*(id *)(a1 + 32) storage];
    [v150 setOwnerIPK:v146];

    v151 = (void *)MEMORY[0x2533B64D0]();
    id v152 = *(id *)(a1 + 32);
    v153 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v153, OS_LOG_TYPE_INFO))
    {
      v154 = HMFGetLogIdentifier();
      uint64_t v155 = *(void *)(a1 + 72);
      *(_DWORD *)buf = 138544642;
      v178 = v154;
      __int16 v179 = 2112;
      uint64_t v180 = (uint64_t)v55;
      __int16 v181 = 2112;
      id v182 = v110;
      __int16 v183 = 2112;
      id v184 = v160;
      __int16 v185 = 2112;
      v186 = v146;
      __int16 v187 = 2080;
      uint64_t v188 = v155;
      _os_log_impl(&dword_252495000, v153, OS_LOG_TYPE_INFO, "%{public}@Returning Root Certificate %@, Operational Certificate %@, Owner NodeID %@, and IPK %@ to %s Controller", buf, 0x3Eu);
    }
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
}

- (void)fetchCertificatesForMatterNodeWithCommissionerNodeID:(id)a3 commissioneeNodeID:(id)a4 forOwner:(BOOL)a5 publicKey:(id)a6 fabricID:(id)a7 completionHandler:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = [(HAPAccessoryServerBrowser *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __149__HMMTRAccessoryServerBrowser_fetchCertificatesForMatterNodeWithCommissionerNodeID_commissioneeNodeID_forOwner_publicKey_fabricID_completionHandler___block_invoke;
  block[3] = &unk_265376AC8;
  void block[4] = self;
  id v26 = v15;
  BOOL v31 = a5;
  id v27 = v16;
  id v28 = v17;
  id v29 = v14;
  id v30 = v18;
  id v20 = v14;
  id v21 = v17;
  id v22 = v16;
  id v23 = v15;
  id v24 = v18;
  dispatch_async(v19, block);
}

void __149__HMMTRAccessoryServerBrowser_fetchCertificatesForMatterNodeWithCommissionerNodeID_commissioneeNodeID_forOwner_publicKey_fabricID_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  if (([*(id *)(a1 + 32) _loadFabricKeyPairs] & 1) == 0)
  {
    id v12 = (void *)MEMORY[0x2533B64D0]();
    id v13 = *(id *)(a1 + 32);
    id v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      id v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v45 = v15;
      _os_log_impl(&dword_252495000, v14, OS_LOG_TYPE_ERROR, "%{public}@Fabric key pairs are missing. Declining to fetch certificates.", buf, 0xCu);
    }
    uint64_t v16 = *(void *)(a1 + 72);
    id v17 = (void *)MEMORY[0x263F087E8];
    unint64_t v4 = [MEMORY[0x263F087E8] hmmtrErrorWithCode:1];
    uint64_t v18 = [v17 hapErrorWithCode:36 description:0 reason:0 suggestion:0 underlyingError:v4];
    goto LABEL_14;
  }
  if ((isFeatureMatteriPhoneOnlyPairingControlEnabled() & 1) == 0)
  {
    id v20 = *(void **)(a1 + 32);
    uint64_t v21 = *(void *)(a1 + 40);
    uint64_t v22 = *(unsigned __int8 *)(a1 + 80);
    uint64_t v23 = *(void *)(a1 + 48);
    uint64_t v24 = *(void *)(a1 + 56);
    v42[0] = MEMORY[0x263EF8330];
    v42[1] = 3221225472;
    v42[2] = __149__HMMTRAccessoryServerBrowser_fetchCertificatesForMatterNodeWithCommissionerNodeID_commissioneeNodeID_forOwner_publicKey_fabricID_completionHandler___block_invoke_340;
    v42[3] = &unk_265376A50;
    id v43 = (char *)*(id *)(a1 + 72);
    [v20 fetchCommissioningCertificatesForSharedAdminWithDeviceNodeID:v21 forOwner:v22 publicKey:v23 fabricID:v24 completionHandler:v42];
    unint64_t v4 = v43;
    goto LABEL_16;
  }
  if (*(unsigned char *)(a1 + 80)) {
    uint64_t v2 = "Owner";
  }
  else {
    uint64_t v2 = "non-owner";
  }
  BOOL v3 = *(void *)(a1 + 40) != 0;
  unint64_t v4 = [*(id *)(a1 + 32) appleHomeFabricWithID:*(void *)(a1 + 56)];
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = (void *)MEMORY[0x2533B64D0]();
  id v7 = *(id *)(a1 + 32);
  id v8 = HMFGetOSLogHandle();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
  if (!v5)
  {
    if (v9)
    {
      id v25 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v45 = v25;
      __int16 v46 = 2080;
      BOOL v47 = v2;
      _os_log_impl(&dword_252495000, v8, OS_LOG_TYPE_INFO, "%{public}@Received request from %s controller to generate Operational certificate for itself", buf, 0x16u);
    }
    if (v4)
    {
      id v26 = *(void **)(a1 + 56);
      if (v26)
      {
        if (![v26 isEqualToNumber:&unk_2702B5820]) {
          goto LABEL_10;
        }
      }
    }
    id v27 = (void *)MEMORY[0x2533B64D0]();
    id v28 = *(id *)(a1 + 32);
    id v29 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      id v30 = HMFGetLogIdentifier();
      uint64_t v31 = *(void *)(a1 + 56);
      *(_DWORD *)buf = 138543874;
      uint64_t v45 = v30;
      __int16 v46 = 2112;
      BOOL v47 = v4;
      __int16 v48 = 2112;
      uint64_t v49 = v31;
      _os_log_impl(&dword_252495000, v29, OS_LOG_TYPE_ERROR, "%{public}@Cannot process request without fabric data created for fabric %@, fabricID %@", buf, 0x20u);
    }
    uint64_t v16 = *(void *)(a1 + 72);
    uint64_t v18 = [MEMORY[0x263F087E8] hmfErrorWithCode:3];
LABEL_14:
    id v19 = (void *)v18;
    (*(void (**)(uint64_t, void, void, void, void, uint64_t))(v16 + 16))(v16, 0, 0, 0, 0, v18);

    goto LABEL_16;
  }
  if (v9)
  {
    BOOL v10 = HMFGetLogIdentifier();
    uint64_t v11 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543874;
    uint64_t v45 = v10;
    __int16 v46 = 2080;
    BOOL v47 = v2;
    __int16 v48 = 2112;
    uint64_t v49 = v11;
    _os_log_impl(&dword_252495000, v8, OS_LOG_TYPE_INFO, "%{public}@Received request from %s controller to generate Operational Certificate for Node ID %@", buf, 0x20u);
  }
LABEL_10:
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __149__HMMTRAccessoryServerBrowser_fetchCertificatesForMatterNodeWithCommissionerNodeID_commissioneeNodeID_forOwner_publicKey_fabricID_completionHandler___block_invoke_344;
  v32[3] = &unk_265376AA0;
  void v32[4] = *(void *)(a1 + 32);
  unint64_t v4 = v4;
  uint64_t v33 = v4;
  id v38 = *(id *)(a1 + 72);
  char v40 = *(unsigned char *)(a1 + 80);
  id v34 = *(id *)(a1 + 40);
  id v35 = *(id *)(a1 + 48);
  id v36 = *(id *)(a1 + 64);
  uint64_t v39 = v2;
  BOOL v41 = v3;
  id v37 = *(id *)(a1 + 56);
  [v4 loadFabricAndControllerDataForPairing:0 fetchFromResident:0 completion:v32];

LABEL_16:
}

uint64_t __149__HMMTRAccessoryServerBrowser_fetchCertificatesForMatterNodeWithCommissionerNodeID_commissioneeNodeID_forOwner_publicKey_fabricID_completionHandler___block_invoke_340(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __149__HMMTRAccessoryServerBrowser_fetchCertificatesForMatterNodeWithCommissionerNodeID_commissioneeNodeID_forOwner_publicKey_fabricID_completionHandler___block_invoke_344(uint64_t a1, void *a2)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    unint64_t v4 = (void *)MEMORY[0x2533B64D0]();
    id v5 = *(id *)(a1 + 32);
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = HMFGetLogIdentifier();
      uint64_t v8 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      id v34 = v7;
      __int16 v35 = 2112;
      uint64_t v36 = v8;
      _os_log_impl(&dword_252495000, v6, OS_LOG_TYPE_ERROR, "%{public}@Cannot process request without fabric data for fabric %@", buf, 0x16u);
    }
    uint64_t v9 = *(void *)(a1 + 80);
    BOOL v10 = (void *)MEMORY[0x263F087E8];
    uint64_t v11 = [MEMORY[0x263F087E8] hmmtrErrorWithCode:2];
    id v12 = [v10 hapErrorWithCode:36 description:0 reason:0 suggestion:0 underlyingError:v11];
    (*(void (**)(uint64_t, void, void, void, void, void *))(v9 + 16))(v9, 0, 0, 0, 0, v12);
  }
  else
  {
    if ([*(id *)(a1 + 32) isCurrentDeviceMobileAndAllowedAccessoryControl]
      && *(unsigned char *)(a1 + 96)
      && !*(void *)(a1 + 48))
    {
      id v17 = [*(id *)(a1 + 32) workQueue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __149__HMMTRAccessoryServerBrowser_fetchCertificatesForMatterNodeWithCommissionerNodeID_commissioneeNodeID_forOwner_publicKey_fabricID_completionHandler___block_invoke_345;
      block[3] = &unk_265378900;
      uint64_t v18 = *(void **)(a1 + 40);
      void block[4] = *(void *)(a1 + 32);
      id v31 = v18;
      id v32 = *(id *)(a1 + 80);
      dispatch_async(v17, block);

      uint64_t v16 = v31;
    }
    else
    {
      id v13 = [*(id *)(a1 + 32) workQueue];
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __149__HMMTRAccessoryServerBrowser_fetchCertificatesForMatterNodeWithCommissionerNodeID_commissioneeNodeID_forOwner_publicKey_fabricID_completionHandler___block_invoke_346;
      v19[3] = &unk_265376A78;
      id v20 = *(id *)(a1 + 40);
      id v21 = *(id *)(a1 + 56);
      id v22 = *(id *)(a1 + 48);
      id v14 = *(id *)(a1 + 64);
      uint64_t v15 = *(void *)(a1 + 32);
      id v23 = v14;
      uint64_t v24 = v15;
      uint64_t v27 = *(void *)(a1 + 88);
      char v28 = *(unsigned char *)(a1 + 97);
      char v29 = *(unsigned char *)(a1 + 96);
      id v25 = *(id *)(a1 + 72);
      id v26 = *(id *)(a1 + 80);
      dispatch_async(v13, v19);

      uint64_t v16 = v20;
    }
  }
}

void __149__HMMTRAccessoryServerBrowser_fetchCertificatesForMatterNodeWithCommissionerNodeID_commissioneeNodeID_forOwner_publicKey_fabricID_completionHandler___block_invoke_345(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)MEMORY[0x2533B64D0]();
  id v3 = *(id *)(a1 + 32);
  unint64_t v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    id v23 = [*(id *)(a1 + 40) fabricData];
    id v6 = [v23 rootCert];
    id v21 = [*(id *)(a1 + 40) currentDeviceNodeData];
    id v7 = [v21 operationalCertificate];
    uint64_t v8 = [*(id *)(a1 + 40) fabricData];
    uint64_t v9 = [v8 residentNodeID];
    [*(id *)(a1 + 40) fabricData];
    BOOL v10 = v22 = v2;
    uint64_t v11 = [v10 ipk];
    *(_DWORD *)buf = 138544386;
    id v25 = v5;
    __int16 v26 = 2112;
    uint64_t v27 = v6;
    __int16 v28 = 2112;
    char v29 = v7;
    __int16 v30 = 2112;
    id v31 = v9;
    __int16 v32 = 2112;
    uint64_t v33 = v11;
    _os_log_impl(&dword_252495000, v4, OS_LOG_TYPE_INFO, "%{public}@Returning certificates fetched from disk: Root Certificate %@, Operational Certificate %@, Resident NodeID %@, and IPK %@", buf, 0x34u);

    uint64_t v2 = v22;
  }

  uint64_t v12 = *(void *)(a1 + 48);
  id v13 = [*(id *)(a1 + 40) fabricData];
  id v14 = [v13 rootCert];
  uint64_t v15 = [*(id *)(a1 + 40) currentDeviceNodeData];
  uint64_t v16 = [v15 operationalCertificate];
  id v17 = [*(id *)(a1 + 40) fabricData];
  uint64_t v18 = [v17 residentNodeID];
  id v19 = [*(id *)(a1 + 40) fabricData];
  id v20 = [v19 ipk];
  (*(void (**)(uint64_t, void *, void *, void *, void *, void))(v12 + 16))(v12, v14, v16, v18, v20, 0);
}

void __149__HMMTRAccessoryServerBrowser_fetchCertificatesForMatterNodeWithCommissionerNodeID_commissioneeNodeID_forOwner_publicKey_fabricID_completionHandler___block_invoke_346(uint64_t a1)
{
  v89[2] = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) fabricData];
  id v3 = [v2 rootCert];

  if (!v3)
  {
    uint64_t v12 = 0;
    id v13 = 0;
    goto LABEL_33;
  }
  uint64_t v4 = *MEMORY[0x263F16F80];
  uint64_t v5 = *MEMORY[0x263F16FA8];
  v88[0] = *MEMORY[0x263F16F68];
  v88[1] = v5;
  uint64_t v6 = *MEMORY[0x263F16FB8];
  v89[0] = v4;
  v89[1] = v6;
  CFDictionaryRef v7 = [NSDictionary dictionaryWithObjects:v89 forKeys:v88 count:2];
  CFErrorRef error = 0;
  SecKeyRef v8 = SecKeyCreateWithData(*(CFDataRef *)(a1 + 40), v7, &error);
  if (!v8)
  {
    CFErrorRef v14 = error;
    uint64_t v15 = (void *)MEMORY[0x2533B64D0]();
    id v16 = *(id *)(a1 + 64);
    id v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v73 = v18;
      __int16 v74 = 2112;
      CFErrorRef v75 = v14;
      _os_log_impl(&dword_252495000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to convert Public Key Data to SecKey with error %@", buf, 0x16u);
    }

    id v13 = 0;
    goto LABEL_29;
  }
  SecKeyRef v9 = v8;
  BOOL v10 = *(void **)(a1 + 48);
  if (v10) {
    goto LABEL_4;
  }
  id v19 = *(void **)(a1 + 56);
  if (v19)
  {
    if (([v19 isEqualToNumber:&unk_2702B5820] & 1) == 0)
    {
      id v20 = *(void **)(a1 + 48);
      id v21 = [*(id *)(a1 + 32) fabricData];
      id v22 = [v21 residentNodeID];
      LOBYTE(v20) = [v20 isEqualToNumber:v22];

      if ((v20 & 1) == 0)
      {
        BOOL v10 = *(void **)(a1 + 56);
LABEL_4:
        id v11 = v10;
        goto LABEL_15;
      }
    }
  }
  uint64_t v23 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", +[HMMTRUtilities randomNodeID](HMMTRUtilities, "randomNodeID"));
  uint64_t v24 = (void *)MEMORY[0x2533B64D0]();
  id v25 = *(id *)(a1 + 64);
  __int16 v26 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    uint64_t v27 = HMFGetLogIdentifier();
    __int16 v28 = *(__CFError **)(a1 + 88);
    *(_DWORD *)buf = 138543874;
    id v73 = v27;
    __int16 v74 = 2080;
    CFErrorRef v75 = v28;
    __int16 v76 = 2112;
    uint64_t v77 = v23;
    _os_log_impl(&dword_252495000, v26, OS_LOG_TYPE_INFO, "%{public}@Generating a Random Node ID for %s Controller as %@", buf, 0x20u);
  }
  id v11 = (id)v23;
LABEL_15:
  CFDictionaryRef v69 = v7;
  if (*(unsigned char *)(a1 + 96))
  {
    uint64_t v29 = 0;
LABEL_17:
    __int16 v30 = 0;
    goto LABEL_23;
  }
  int v31 = *(unsigned __int8 *)(a1 + 97);
  __int16 v32 = [*(id *)(a1 + 32) delegate];
  uint64_t v33 = v32;
  if (v31) {
    [v32 accessoryAdministerPrivilegeCATID:0];
  }
  else {
  uint64_t v29 = [v32 accessoryOperatePrivilegeCATID:0];
  }

  if (!v29) {
    goto LABEL_17;
  }
  __int16 v30 = [MEMORY[0x263EFFA08] setWithObject:v29];
LABEL_23:
  id v68 = (void *)v29;
  uint64_t v34 = (void *)MEMORY[0x2533B64D0]();
  id v35 = *(id *)(a1 + 64);
  uint64_t v36 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    uint64_t v37 = v67 = v34;
    id v38 = v11;
    uint64_t v39 = v3;
    char v40 = v9;
    BOOL v41 = *(__CFError **)(a1 + 88);
    id v42 = [*(id *)(a1 + 64) nocSigner];
    uint64_t v43 = *(void *)(a1 + 72);
    *(_DWORD *)buf = 138545154;
    id v73 = v37;
    __int16 v74 = 2080;
    CFErrorRef v75 = v41;
    SecKeyRef v9 = v40;
    id v3 = v39;
    id v11 = v38;
    __int16 v76 = 2112;
    uint64_t v77 = (uint64_t)v42;
    __int16 v78 = 2112;
    uint64_t v79 = v3;
    __int16 v80 = 2112;
    SecKeyRef v81 = v9;
    __int16 v82 = 2112;
    uint64_t v83 = v43;
    __int16 v84 = 2112;
    id v85 = v38;
    __int16 v86 = 2112;
    v87 = v30;
    _os_log_impl(&dword_252495000, v36, OS_LOG_TYPE_INFO, "%{public}@Generating a OP cert for %s with nocSigner %@, rootCert = %@, pubKeyAsSecKey %@, fabricID %@, nodeID %@ CATs = %@", buf, 0x52u);

    uint64_t v34 = v67;
  }

  id v44 = (void *)MEMORY[0x263F10CC0];
  uint64_t v45 = [*(id *)(a1 + 64) nocSigner];
  uint64_t v46 = *(void *)(a1 + 72);
  id v70 = 0;
  uint64_t v12 = [v44 createOperationalCertificate:v45 signingCertificate:v3 operationalPublicKey:v9 fabricID:v46 nodeID:v11 caseAuthenticatedTags:v30 error:&v70];
  id v13 = (__CFError *)v70;

  if (!v12)
  {
    CFDictionaryRef v7 = v69;
LABEL_29:
    BOOL v47 = (void *)MEMORY[0x2533B64D0]();
    id v48 = *(id *)(a1 + 64);
    uint64_t v49 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
    {
      __int16 v52 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v73 = v52;
      __int16 v74 = 2112;
      CFErrorRef v75 = v13;
      _os_log_impl(&dword_252495000, v49, OS_LOG_TYPE_ERROR, "%{public}@Failed to generate Operational Certificate %@", buf, 0x16u);
    }
    uint64_t v12 = 0;
    goto LABEL_32;
  }
  BOOL v47 = (void *)MEMORY[0x2533B64D0]();
  id v48 = *(id *)(a1 + 64);
  uint64_t v49 = HMFGetOSLogHandle();
  CFDictionaryRef v7 = v69;
  if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
  {
    uint64_t v50 = HMFGetLogIdentifier();
    id v51 = *(__CFError **)(a1 + 88);
    *(_DWORD *)buf = 138543618;
    id v73 = v50;
    __int16 v74 = 2080;
    CFErrorRef v75 = v51;
    _os_log_impl(&dword_252495000, v49, OS_LOG_TYPE_INFO, "%{public}@Successfully generated Operational Certificate for %s Controller", buf, 0x16u);
  }
LABEL_32:

LABEL_33:
  if (*(void *)(a1 + 48))
  {
    id v53 = (void *)MEMORY[0x2533B64D0]();
    id v54 = *(id *)(a1 + 64);
    id v55 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
    {
      v56 = HMFGetLogIdentifier();
      id v57 = *(void **)(a1 + 88);
      *(_DWORD *)buf = 138544130;
      id v73 = v56;
      __int16 v74 = 2112;
      CFErrorRef v75 = (CFErrorRef)v3;
      __int16 v76 = 2112;
      uint64_t v77 = (uint64_t)v12;
      __int16 v78 = 2080;
      uint64_t v79 = v57;
      _os_log_impl(&dword_252495000, v55, OS_LOG_TYPE_INFO, "%{public}@Returning Root Certificate %@, Operational Certificate %@ to %s Controller", buf, 0x2Au);
    }
    (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
  }
  else
  {
    v58 = [*(id *)(a1 + 32) fabricData];
    __int16 v59 = [v58 ipk];

    CFErrorRef v60 = [*(id *)(a1 + 32) fabricData];
    id v61 = [v60 residentNodeID];

    id v62 = (void *)MEMORY[0x2533B64D0]();
    id v63 = *(id *)(a1 + 64);
    id v64 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
    {
      id v65 = HMFGetLogIdentifier();
      uint64_t v66 = *(void *)(a1 + 88);
      *(_DWORD *)buf = 138544642;
      id v73 = v65;
      __int16 v74 = 2112;
      CFErrorRef v75 = (CFErrorRef)v3;
      __int16 v76 = 2112;
      uint64_t v77 = (uint64_t)v12;
      __int16 v78 = 2112;
      uint64_t v79 = v61;
      __int16 v80 = 2112;
      SecKeyRef v81 = v59;
      __int16 v82 = 2080;
      uint64_t v83 = v66;
      _os_log_impl(&dword_252495000, v64, OS_LOG_TYPE_INFO, "%{public}@Returning Root Certificate %@, Operational Certificate %@, Resident NodeID %@, and IPK %@ to %s Controller", buf, 0x3Eu);
    }
    (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
  }
}

- (void)_reportAccessoriesKnownToSystemCommissioner
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x2533B64D0](self, a2);
  uint64_t v4 = self;
  uint64_t v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    CFErrorRef v14 = v6;
    _os_log_impl(&dword_252495000, v5, OS_LOG_TYPE_INFO, "%{public}@Reporting accessories known to System Commissioner", buf, 0xCu);
  }
  CFDictionaryRef v7 = [(HMMTRAccessoryServerBrowser *)v4 discoveredAccessoryServers];
  SecKeyRef v8 = (void *)[v7 copy];

  SecKeyRef v9 = [(HMMTRAccessoryServerBrowser *)v4 systemCommissionerPairingManager];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __74__HMMTRAccessoryServerBrowser__reportAccessoriesKnownToSystemCommissioner__block_invoke;
  v11[3] = &unk_265376A28;
  v11[4] = v4;
  id v12 = v8;
  id v10 = v8;
  [v9 fetchSystemCommissionerPairingsWithCompletionHandler:v11];
}

void __74__HMMTRAccessoryServerBrowser__reportAccessoriesKnownToSystemCommissioner__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __74__HMMTRAccessoryServerBrowser__reportAccessoriesKnownToSystemCommissioner__block_invoke_2;
  block[3] = &unk_265376F38;
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void **)(a1 + 40);
  id v9 = v3;
  uint64_t v10 = v5;
  id v11 = v6;
  id v7 = v3;
  dispatch_async(v4, block);
}

void __74__HMMTRAccessoryServerBrowser__reportAccessoriesKnownToSystemCommissioner__block_invoke_2(id *a1)
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  uint64_t v2 = [MEMORY[0x263EFF9C0] set];
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v3 = a1[4];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v46 objects:v56 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v47;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v47 != v6) {
          objc_enumerationMutation(v3);
        }
        SecKeyRef v8 = [a1[5] _serverFromMTSDevicePairing:*(void *)(*((void *)&v46 + 1) + 8 * i)];
        [v2 addObject:v8];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v46 objects:v56 count:16];
    }
    while (v5);
  }

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v9 = a1[6];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v42 objects:v55 count:16];
  if (v10)
  {
    uint64_t v12 = v10;
    uint64_t v13 = *(void *)v43;
    *(void *)&long long v11 = 138543618;
    long long v34 = v11;
    obuint64_t j = v2;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v43 != v13) {
          objc_enumerationMutation(v9);
        }
        uint64_t v15 = *(void **)(*((void *)&v42 + 1) + 8 * j);
        if (objc_msgSend(v15, "isKnownToSystemCommissioner", v34)
          && ([v2 containsObject:v15] & 1) == 0)
        {
          id v16 = v9;
          id v17 = (void *)MEMORY[0x2533B64D0]();
          id v18 = a1[5];
          id v19 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            id v20 = HMFGetLogIdentifier();
            *(_DWORD *)buf = v34;
            __int16 v52 = v20;
            __int16 v53 = 2112;
            id v54 = v15;
            _os_log_impl(&dword_252495000, v19, OS_LOG_TYPE_INFO, "%{public}@Invalidating stale discovered server %@", buf, 0x16u);
          }
          id v21 = a1[5];
          id v22 = [MEMORY[0x263F087E8] hmmtrErrorWithCode:9];
          [v21 invalidateAccessoryServer:v15 reason:v22];

          id v9 = v16;
          uint64_t v2 = obj;
        }
      }
      uint64_t v12 = [v9 countByEnumeratingWithState:&v42 objects:v55 count:16];
    }
    while (v12);
  }

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obja = v2;
  uint64_t v23 = [obja countByEnumeratingWithState:&v38 objects:v50 count:16];
  if (v23)
  {
    uint64_t v25 = v23;
    uint64_t v26 = *(void *)v39;
    *(void *)&long long v24 = 138543618;
    long long v35 = v24;
    do
    {
      for (uint64_t k = 0; k != v25; ++k)
      {
        if (*(void *)v39 != v26) {
          objc_enumerationMutation(obja);
        }
        __int16 v28 = *(void **)(*((void *)&v38 + 1) + 8 * k);
        if (objc_msgSend(a1[5], "_delegateRespondsToSelector:", sel_accessoryServerBrowser_didFindAccessoryServer_stateChanged_stateNumber_, v35))
        {
          uint64_t v29 = (void *)MEMORY[0x2533B64D0]();
          id v30 = a1[5];
          int v31 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
          {
            __int16 v32 = HMFGetLogIdentifier();
            *(_DWORD *)buf = v35;
            __int16 v52 = v32;
            __int16 v53 = 2112;
            id v54 = v28;
            _os_log_impl(&dword_252495000, v31, OS_LOG_TYPE_INFO, "%{public}@Reporting SC server %@", buf, 0x16u);
          }
          uint64_t v33 = [a1[5] delegate];
          [v33 accessoryServerBrowser:a1[5] didFindAccessoryServer:v28 stateChanged:0 stateNumber:0];
        }
      }
      uint64_t v25 = [obja countByEnumeratingWithState:&v38 objects:v50 count:16];
    }
    while (v25);
  }
}

- (void)cleanUpStaleSystemCommissionerPairingsWithNewlyPairedUUID:(id)a3 vendorID:(id)a4 productID:(id)a5 serialNumber:(id)a6 setupPayload:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  id v17 = [(HMMTRAccessoryServerBrowser *)self systemCommissionerPairingManager];
  [v17 cleanUpStaleSystemCommissionerPairingsWithNewlyPairedUUID:v16 vendorID:v15 productID:v14 serialNumber:v13 setupPayload:v12];
}

- (void)finishSystemCommissionerFabricCommissioningWithFabricID:(id)a3 rootCACert:(id)a4 ipk:(id)a5 controllerNodeID:(id)a6 commissioneeNodeID:(id)a7 queue:(id)a8 completion:(id)a9
{
  id v12 = a3;
  id v13 = a7;
  id v14 = a8;
  id v15 = a9;
  id v16 = [(HAPAccessoryServerBrowser *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __155__HMMTRAccessoryServerBrowser_finishSystemCommissionerFabricCommissioningWithFabricID_rootCACert_ipk_controllerNodeID_commissioneeNodeID_queue_completion___block_invoke;
  block[3] = &unk_265377CF8;
  void block[4] = self;
  id v22 = v12;
  id v24 = v13;
  id v25 = v15;
  id v23 = v14;
  id v17 = v13;
  id v18 = v15;
  id v19 = v14;
  id v20 = v12;
  dispatch_async(v16, block);
}

void __155__HMMTRAccessoryServerBrowser_finishSystemCommissionerFabricCommissioningWithFabricID_rootCACert_ipk_controllerNodeID_commissioneeNodeID_queue_completion___block_invoke(uint64_t a1)
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  uint64_t v2 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F10BB0] code:1 userInfo:0];
  id v3 = [*(id *)(a1 + 32) systemCommissionerControllerWrapper];
  uint64_t v4 = [v3 controller];

  uint64_t v5 = (void *)MEMORY[0x2533B64D0]();
  id v6 = *(id *)(a1 + 32);
  id v7 = HMFGetOSLogHandle();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if (v4)
  {
    if (v8)
    {
      id v9 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      long long v44 = v9;
      _os_log_impl(&dword_252495000, v7, OS_LOG_TYPE_INFO, "%{public}@Connecting to the commissionee to complete commissioning...", buf, 0xCu);
    }
    uint64_t v10 = [MEMORY[0x263F10CA8] deviceWithNodeID:*(void *)(a1 + 56) controller:v4];
    if (v10)
    {
      id v11 = objc_alloc(MEMORY[0x263F10C90]);
      id v12 = [*(id *)(a1 + 32) workQueue];
      id v13 = (void *)[v11 initWithDevice:v10 endpointID:&unk_2702B5820 queue:v12];

      if (v13)
      {
        id v14 = (void *)MEMORY[0x2533B64D0]([*(id *)(a1 + 32) _notifyDelegateOfPairingStep:21]);
        id v15 = *(id *)(a1 + 32);
        id v16 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          id v17 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          long long v44 = v17;
          _os_log_impl(&dword_252495000, v16, OS_LOG_TYPE_INFO, "%{public}@Sending commissioning complete...", buf, 0xCu);
        }
        v33[0] = MEMORY[0x263EF8330];
        v33[1] = 3221225472;
        v33[2] = __155__HMMTRAccessoryServerBrowser_finishSystemCommissionerFabricCommissioningWithFabricID_rootCACert_ipk_controllerNodeID_commissioneeNodeID_queue_completion___block_invoke_333;
        v33[3] = &unk_265376A00;
        void v33[4] = *(void *)(a1 + 32);
        id v18 = (id *)v34;
        v34[0] = *(id *)(a1 + 48);
        v34[1] = v2;
        id v36 = *(id *)(a1 + 64);
        id v35 = v10;
        [v13 commissioningCompleteWithCompletion:v33];
      }
      else
      {
        __int16 v28 = (void *)MEMORY[0x2533B64D0]();
        id v29 = *(id *)(a1 + 32);
        id v30 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          int v31 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          long long v44 = v31;
          _os_log_impl(&dword_252495000, v30, OS_LOG_TYPE_ERROR, "%{public}@Unable to create GeneralCommissioning cluster object", buf, 0xCu);
        }
        __int16 v32 = *(NSObject **)(a1 + 48);
        v37[0] = MEMORY[0x263EF8330];
        v37[1] = 3221225472;
        void v37[2] = __155__HMMTRAccessoryServerBrowser_finishSystemCommissionerFabricCommissioningWithFabricID_rootCACert_ipk_controllerNodeID_commissioneeNodeID_queue_completion___block_invoke_332;
        v37[3] = &unk_2653770F0;
        v37[4] = v2;
        id v18 = &v38;
        id v38 = *(id *)(a1 + 64);
        dispatch_async(v32, v37);
      }
    }
    else
    {
      id v22 = (void *)MEMORY[0x2533B64D0]();
      id v23 = *(id *)(a1 + 32);
      id v24 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        id v25 = HMFGetLogIdentifier();
        uint64_t v26 = *(void *)(a1 + 56);
        *(_DWORD *)buf = 138543618;
        long long v44 = v25;
        __int16 v45 = 2112;
        uint64_t v46 = v26;
        _os_log_impl(&dword_252495000, v24, OS_LOG_TYPE_ERROR, "%{public}@Unable to get connected device (%@) to complete commissioning", buf, 0x16u);
      }
      uint64_t v27 = *(NSObject **)(a1 + 48);
      v39[0] = MEMORY[0x263EF8330];
      v39[1] = 3221225472;
      v39[2] = __155__HMMTRAccessoryServerBrowser_finishSystemCommissionerFabricCommissioningWithFabricID_rootCACert_ipk_controllerNodeID_commissioneeNodeID_queue_completion___block_invoke_330;
      v39[3] = &unk_2653770F0;
      v39[4] = v2;
      id v40 = *(id *)(a1 + 64);
      dispatch_async(v27, v39);
    }
  }
  else
  {
    if (v8)
    {
      id v19 = HMFGetLogIdentifier();
      uint64_t v20 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      long long v44 = v19;
      __int16 v45 = 2112;
      uint64_t v46 = v20;
      _os_log_impl(&dword_252495000, v7, OS_LOG_TYPE_INFO, "%{public}@Failed to start system commissioner controller for fabric ID: %@", buf, 0x16u);
    }
    id v21 = *(NSObject **)(a1 + 48);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __155__HMMTRAccessoryServerBrowser_finishSystemCommissionerFabricCommissioningWithFabricID_rootCACert_ipk_controllerNodeID_commissioneeNodeID_queue_completion___block_invoke_328;
    block[3] = &unk_2653770F0;
    void block[4] = v2;
    id v42 = *(id *)(a1 + 64);
    dispatch_async(v21, block);
  }
}

void __155__HMMTRAccessoryServerBrowser_finishSystemCommissionerFabricCommissioningWithFabricID_rootCACert_ipk_controllerNodeID_commissioneeNodeID_queue_completion___block_invoke_328(uint64_t a1)
{
  id v2 = +[HMMTRAccessoryPairingEndContext hmmtrContextWithStep:20 error:*(void *)(a1 + 32)];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __155__HMMTRAccessoryServerBrowser_finishSystemCommissionerFabricCommissioningWithFabricID_rootCACert_ipk_controllerNodeID_commissioneeNodeID_queue_completion___block_invoke_330(uint64_t a1)
{
  id v2 = +[HMMTRAccessoryPairingEndContext hmmtrContextWithStep:20 error:*(void *)(a1 + 32)];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __155__HMMTRAccessoryServerBrowser_finishSystemCommissionerFabricCommissioningWithFabricID_rootCACert_ipk_controllerNodeID_commissioneeNodeID_queue_completion___block_invoke_332(uint64_t a1)
{
  id v2 = +[HMMTRAccessoryPairingEndContext hmmtrContextWithStep:20 error:*(void *)(a1 + 32)];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __155__HMMTRAccessoryServerBrowser_finishSystemCommissionerFabricCommissioningWithFabricID_rootCACert_ipk_controllerNodeID_commissioneeNodeID_queue_completion___block_invoke_333(uint64_t a1, void *a2, void *a3)
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6) {
    goto LABEL_2;
  }
  uint64_t v17 = [v5 errorCode];
  if (!v17) {
    goto LABEL_7;
  }
  id v18 = (void *)v17;
  id v19 = [v5 errorCode];
  char v20 = [v19 isEqual:&unk_2702B5820];

  if ((v20 & 1) == 0)
  {
LABEL_2:
    id v7 = (void *)MEMORY[0x2533B64D0]();
    id v8 = *(id *)(a1 + 32);
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = HMFGetLogIdentifier();
      id v11 = [v5 errorCode];
      id v12 = [v5 debugText];
      *(_DWORD *)buf = 138544130;
      id v36 = v10;
      __int16 v37 = 2112;
      id v38 = v6;
      __int16 v39 = 2112;
      id v40 = v11;
      __int16 v41 = 2112;
      id v42 = v12;
      _os_log_impl(&dword_252495000, v9, OS_LOG_TYPE_ERROR, "%{public}@Commissioning complete failed with %@ (%@: %@)", buf, 0x2Au);
    }
    id v13 = *(NSObject **)(a1 + 40);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __155__HMMTRAccessoryServerBrowser_finishSystemCommissionerFabricCommissioningWithFabricID_rootCACert_ipk_controllerNodeID_commissioneeNodeID_queue_completion___block_invoke_334;
    block[3] = &unk_265378900;
    id v14 = v6;
    uint64_t v15 = *(void *)(a1 + 48);
    id v32 = v14;
    uint64_t v33 = v15;
    id v34 = *(id *)(a1 + 64);
    dispatch_async(v13, block);

    id v16 = v32;
  }
  else
  {
LABEL_7:
    id v21 = (void *)MEMORY[0x2533B64D0]();
    id v22 = *(id *)(a1 + 32);
    id v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      id v24 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v36 = v24;
      _os_log_impl(&dword_252495000, v23, OS_LOG_TYPE_INFO, "%{public}@Commissioning complete responded. Fetching serial number.", buf, 0xCu);
    }
    id v25 = *(void **)(a1 + 56);
    uint64_t v26 = [*(id *)(a1 + 32) workQueue];
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __155__HMMTRAccessoryServerBrowser_finishSystemCommissionerFabricCommissioningWithFabricID_rootCACert_ipk_controllerNodeID_commissioneeNodeID_queue_completion___block_invoke_335;
    v28[3] = &unk_2653769D8;
    uint64_t v27 = *(void **)(a1 + 40);
    v28[4] = *(void *)(a1 + 32);
    id v29 = v27;
    id v30 = *(id *)(a1 + 64);
    [v25 fetchSerialNumberWithCallbackQueue:v26 completionHandler:v28];

    id v16 = v29;
  }
}

void __155__HMMTRAccessoryServerBrowser_finishSystemCommissionerFabricCommissioningWithFabricID_rootCACert_ipk_controllerNodeID_commissioneeNodeID_queue_completion___block_invoke_334(void *a1)
{
  if (a1[4]) {
    +[HMMTRAccessoryPairingEndContext mtrContextWithStep:error:](HMMTRAccessoryPairingEndContext, "mtrContextWithStep:error:", 21);
  }
  else {
  uint64_t v2 = +[HMMTRAccessoryPairingEndContext hmmtrContextWithStep:21 error:a1[5]];
  }
  uint64_t v3 = a1[4];
  if (!v3) {
    uint64_t v3 = a1[5];
  }
  id v4 = (id)v2;
  (*(void (**)(void, void, uint64_t))(a1[6] + 16))(a1[6], 0, v3);
}

void __155__HMMTRAccessoryServerBrowser_finishSystemCommissionerFabricCommissioningWithFabricID_rootCACert_ipk_controllerNodeID_commissioneeNodeID_queue_completion___block_invoke_335(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x2533B64D0]();
  id v8 = *(id *)(a1 + 32);
  id v9 = HMFGetOSLogHandle();
  uint64_t v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v22 = v11;
      __int16 v23 = 2112;
      id v24 = v5;
      _os_log_impl(&dword_252495000, v10, OS_LOG_TYPE_INFO, "%{public}@Accessory returned Serial Number as %@", buf, 0x16u);
    }
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __155__HMMTRAccessoryServerBrowser_finishSystemCommissionerFabricCommissioningWithFabricID_rootCACert_ipk_controllerNodeID_commissioneeNodeID_queue_completion___block_invoke_337;
    block[3] = &unk_2653770F0;
    id v12 = &v18;
    id v13 = *(NSObject **)(a1 + 40);
    id v18 = *(id *)(a1 + 48);
    id v17 = v5;
    dispatch_async(v13, block);
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v22 = v14;
      __int16 v23 = 2112;
      id v24 = v6;
      _os_log_impl(&dword_252495000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to retrieve serial number: %@", buf, 0x16u);
    }
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __155__HMMTRAccessoryServerBrowser_finishSystemCommissionerFabricCommissioningWithFabricID_rootCACert_ipk_controllerNodeID_commissioneeNodeID_queue_completion___block_invoke_336;
    v19[3] = &unk_265377430;
    id v12 = &v20;
    uint64_t v15 = *(NSObject **)(a1 + 40);
    id v20 = *(id *)(a1 + 48);
    dispatch_async(v15, v19);
  }
}

uint64_t __155__HMMTRAccessoryServerBrowser_finishSystemCommissionerFabricCommissioningWithFabricID_rootCACert_ipk_controllerNodeID_commissioneeNodeID_queue_completion___block_invoke_336(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __155__HMMTRAccessoryServerBrowser_finishSystemCommissionerFabricCommissioningWithFabricID_rootCACert_ipk_controllerNodeID_commissioneeNodeID_queue_completion___block_invoke_337(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0, 0);
}

- (void)_prepareForPairingWithSetupPayload:(id)a3 fabricID:(id)a4 controllerWrapper:(id)a5 hasPriorSuccessfulPairing:(BOOL)a6 category:(id)a7 completionHandler:(id)a8
{
  BOOL v10 = a6;
  uint64_t v86 = *MEMORY[0x263EF8340];
  id v14 = a3;
  uint64_t v15 = (char *)a4;
  id v16 = a5;
  id v75 = a7;
  id v74 = a8;
  id v17 = [(HAPAccessoryServerBrowser *)self workQueue];
  dispatch_assert_queue_V2(v17);

  id v18 = [(HMMTRAccessoryServerBrowser *)self storage];
  id v19 = [v18 dataSource];

  if (v19)
  {
    BOOL v20 = v10;
    id v21 = (void *)MEMORY[0x2533B64D0]([(HMMTRAccessoryServerBrowser *)self addFabricWithActiveClients:v15]);
    id v22 = self;
    __int16 v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      id v24 = HMFGetLogIdentifier();
      uint64_t v25 = [(HMMTRAccessoryServerBrowser *)v22 fabricsWithActiveClients];
      *(_DWORD *)buf = 138543874;
      uint64_t v79 = v24;
      __int16 v80 = 2112;
      SecKeyRef v81 = v15;
      __int16 v82 = 2112;
      uint64_t v83 = v25;
      _os_log_impl(&dword_252495000, v23, OS_LOG_TYPE_INFO, "%{public}@Added active client for pairing into fabric ID %@, currently active clients: %@", buf, 0x20u);
    }
    uint64_t v26 = [(HMMTRAccessoryServerBrowser *)v22 systemCommissionerFabricID];
    char v27 = HMFEqualObjects();

    if ((v27 & 1) == 0) {
      [(HMMTRAccessoryServerBrowser *)v22 setSystemCommissionerMode:0];
    }
    __int16 v72 = v15;
    id v73 = v16;
    __int16 v28 = [(HMMTRAccessoryServerBrowser *)v22 controllerFactoryEnablePerPrimaryResidentConfirmationToken];

    if (v28)
    {
      id v29 = [(HMMTRAccessoryServerBrowser *)v22 controllerFactory];
      id v30 = [(HMMTRAccessoryServerBrowser *)v22 controllerFactoryEnablePerPrimaryResidentConfirmationToken];
      [v29 enableNormalOperationWithToken:v30];

      [(HMMTRAccessoryServerBrowser *)v22 setControllerFactoryEnablePerPrimaryResidentConfirmationToken:0];
    }
    [(HMMTRAccessoryServerBrowser *)v22 _deleteOldPairings];
    int v31 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[HMMTRAccessoryServerBrowser _generateNodeID](v22, "_generateNodeID"));
    id v32 = [v14 discriminator];
    unsigned __int16 v33 = [v32 unsignedShortValue];

    if ([v14 hasShortDiscriminator]) {
      unsigned __int16 v34 = v33 << 8;
    }
    else {
      unsigned __int16 v34 = v33;
    }
    id v35 = [HMMTRAccessoryServerFactory alloc];
    id v36 = [(HAPAccessoryServerBrowser *)v22 keyStore];
    __int16 v37 = [(HMMTRAccessoryServerFactory *)v35 initWithKeystore:v36 browser:v22];

    id v38 = [v14 setupCode];
    __int16 v39 = [NSNumber numberWithUnsignedShort:v34];
    id v40 = [v14 vendorID];
    __int16 v41 = [v14 productID];
    id v42 = [v14 serialNumber];
    id v71 = v37;
    uint64_t v43 = [(HMMTRAccessoryServerFactory *)v37 vendAccessoryServerWithNodeID:v31 setupCode:v38 discriminator:v39 category:v75 vendorID:v40 productID:v41 serialNumber:v42 firmwareRevision:@"1.0.0"];

    if (v43)
    {
      [v43 setHasPriorSuccessfulPairing:v20];
      objc_msgSend(v43, "setDiscriminatorIsOriginatedFromShort:", objc_msgSend(v14, "hasShortDiscriminator"));
      long long v44 = [v14 setupPayloadString];
      [v43 setSetupPayloadString:v44];

      [v43 setControllerWrapper:v73];
      if ((_os_feature_enabled_impl() & 1) != 0 || HM_FEATURE_RVC_DEFAULTS_ENABLED()) {
        [v73 resume];
      }
      __int16 v45 = [(HMMTRAccessoryServerBrowser *)v22 pairingWindowInfoTable];
      uint64_t v46 = [v14 setupPayloadString];
      uint64_t v47 = [MEMORY[0x263EFF910] now];
      long long v48 = [v45 retrieveAccessoryServerForPairingWindowWithSetupPayload:v46 currentDate:v47];

      if (v48)
      {
        if ([v48 isWEDDevice])
        {
          [v43 setWedDevice:1];
          long long v49 = [v48 eMACAddress];
          [v43 setEMACAddress:v49];
        }
        uint64_t v50 = (void *)MEMORY[0x2533B64D0](objc_msgSend(v43, "setLinkLayerType:", objc_msgSend(v48, "linkLayerType")));
        id v51 = v22;
        __int16 v52 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
        {
          __int16 v53 = HMFGetLogIdentifier();
          if ([v43 isWEDDevice]) {
            id v54 = " WED";
          }
          else {
            id v54 = "";
          }
          uint64_t v55 = [v43 linkLayerType];
          v56 = "non-Thread";
          *(_DWORD *)buf = 138544130;
          uint64_t v79 = v53;
          __int16 v80 = 2080;
          if (v55 == 4) {
            v56 = "Thread";
          }
          SecKeyRef v81 = v54;
          __int16 v82 = 2080;
          uint64_t v83 = v56;
          __int16 v84 = 2112;
          id v85 = v43;
          _os_log_impl(&dword_252495000, v52, OS_LOG_TYPE_INFO, "%{public}@Pairing with%s %s accessory %@ via locally opened pairing window", buf, 0x2Au);
        }
      }
      uint64_t v57 = (void *)MEMORY[0x2533B64D0]();
      v58 = v22;
      __int16 v59 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
      {
        CFErrorRef v60 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        uint64_t v79 = v60;
        __int16 v80 = 2112;
        SecKeyRef v81 = (const char *)v43;
        _os_log_impl(&dword_252495000, v59, OS_LOG_TYPE_INFO, "%{public}@Ready to pair with Accessory %@.", buf, 0x16u);
      }
      [v58[7] addObject:v43];
      id v61 = v74;
      (*((void (**)(id, void, void *, void))v74 + 2))(v74, 0, v43, 0);
      if ([v58 _delegateRespondsToSelector:sel_accessoryServerBrowser_didFindAccessoryServer_stateChanged_stateNumber_])
      {
        id v62 = [v58 delegateQueue];
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __146__HMMTRAccessoryServerBrowser__prepareForPairingWithSetupPayload_fabricID_controllerWrapper_hasPriorSuccessfulPairing_category_completionHandler___block_invoke;
        block[3] = &unk_265376E98;
        void block[4] = v58;
        id v77 = v43;
        dispatch_async(v62, block);
      }
    }
    else
    {
      long long v67 = (void *)MEMORY[0x2533B64D0]();
      id v68 = v22;
      CFDictionaryRef v69 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
      {
        id v70 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        uint64_t v79 = v70;
        _os_log_impl(&dword_252495000, v69, OS_LOG_TYPE_ERROR, "%{public}@Unable to create server...pairing won't work.", buf, 0xCu);
      }
      long long v48 = [MEMORY[0x263F087E8] hmfErrorWithCode:15];
      id v61 = v74;
      (*((void (**)(id, void, void, void *))v74 + 2))(v74, 0, 0, v48);
    }
    uint64_t v15 = v72;

    id v16 = v73;
  }
  else
  {
    id v63 = (void *)MEMORY[0x2533B64D0]();
    id v64 = self;
    id v65 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
    {
      uint64_t v66 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v79 = v66;
      _os_log_impl(&dword_252495000, v65, OS_LOG_TYPE_ERROR, "%{public}@CHIP Storage has not been initialized...pairing won't work", buf, 0xCu);
    }
    int v31 = [MEMORY[0x263F087E8] hmfErrorWithCode:15];
    id v61 = v74;
    (*((void (**)(id, void, void, void *))v74 + 2))(v74, 0, 0, v31);
  }
}

void __146__HMMTRAccessoryServerBrowser__prepareForPairingWithSetupPayload_fabricID_controllerWrapper_hasPriorSuccessfulPairing_category_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 accessoryServerBrowser:*(void *)(a1 + 32) didFindAccessoryServer:*(void *)(a1 + 40) stateChanged:0 stateNumber:0];
}

- (void)prepareForPairingWithSetupPayload:(id)a3 fabric:(id)a4 targetFabricUUID:(id)a5 fabricID:(id)a6 owner:(BOOL)a7 ownerCertFetchSupported:(BOOL)a8 completionHandler:(id)a9
{
  BOOL v54 = a8;
  BOOL v9 = a7;
  uint64_t v79 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v55 = a6;
  id v17 = a9;
  id v18 = (void *)MEMORY[0x2533B64D0]();
  id v19 = self;
  BOOL v20 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    id v21 = HMFGetLogIdentifier();
    HMFBooleanToString();
    id v52 = v17;
    id v22 = v15;
    id v23 = v16;
    v25 = BOOL v24 = v9;
    uint64_t v26 = HMFBooleanToString();
    *(_DWORD *)buf = 138544386;
    id v70 = v21;
    __int16 v71 = 2112;
    uint64_t v72 = (uint64_t)v14;
    __int16 v73 = 2112;
    id v74 = v55;
    __int16 v75 = 2112;
    __int16 v76 = v25;
    __int16 v77 = 2112;
    __int16 v78 = v26;
    _os_log_impl(&dword_252495000, v20, OS_LOG_TYPE_INFO, "%{public}@Prepare pairing with setup payload: %@, fabric ID: %@, owner: %@, ownerCertFetchSupported: %@", buf, 0x34u);

    BOOL v9 = v24;
    id v16 = v23;
    id v15 = v22;
    id v17 = v52;
  }
  int v27 = !v9;
  __int16 v28 = [(HMMTRAccessoryServerBrowser *)v19 storage];
  [v28 setSharedAdmin:!v9];

  v64[0] = MEMORY[0x263EF8330];
  v64[1] = 3221225472;
  v64[2] = __146__HMMTRAccessoryServerBrowser_prepareForPairingWithSetupPayload_fabric_targetFabricUUID_fabricID_owner_ownerCertFetchSupported_completionHandler___block_invoke;
  v64[3] = &unk_265376960;
  v64[4] = v19;
  id v29 = v17;
  id v68 = v29;
  id v30 = v15;
  id v65 = v30;
  id v31 = v16;
  id v66 = v31;
  id v32 = v14;
  id v67 = v32;
  unsigned __int16 v33 = (void *)MEMORY[0x2533B66E0](v64);
  if ([(HMMTRAccessoryServerBrowser *)v19 _createOperationalKeyPairIfAbsent])
  {
    if (isFeatureMatterLocalFabricConfigEnabled())
    {
      v61[0] = MEMORY[0x263EF8330];
      v61[1] = 3221225472;
      void v61[2] = __146__HMMTRAccessoryServerBrowser_prepareForPairingWithSetupPayload_fabric_targetFabricUUID_fabricID_owner_ownerCertFetchSupported_completionHandler___block_invoke_321;
      v61[3] = &unk_265377368;
      v61[4] = v19;
      id v63 = v33;
      id v34 = v55;
      id v62 = v34;
      [v30 loadFabricAndControllerDataForPairing:1 fetchFromResident:v27 | v54 completion:v61];

      id v35 = v63;
    }
    else
    {
      BOOL v53 = v9;
      if (v55) {
        int v41 = 1;
      }
      else {
        int v41 = v54;
      }
      char v42 = v41 | v27;
      if (v41) {
        uint64_t v43 = v55;
      }
      else {
        uint64_t v43 = 0;
      }
      if ((v42 & 1) == 0)
      {
        uint64_t v44 = [(HMMTRAccessoryServerBrowser *)v19 _getRandomFabricId];
        uint64_t v56 = [NSNumber numberWithUnsignedLongLong:v44];
        __int16 v45 = (void *)MEMORY[0x2533B64D0]();
        uint64_t v46 = v19;
        uint64_t v47 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v48 = id v51 = v45;
          *(_DWORD *)buf = 138543618;
          id v70 = v48;
          __int16 v71 = 2112;
          uint64_t v72 = v56;
          _os_log_impl(&dword_252495000, v47, OS_LOG_TYPE_INFO, "%{public}@Generated new fabric ID: %@", buf, 0x16u);

          __int16 v45 = v51;
        }

        uint64_t v43 = (void *)v56;
      }
      char v49 = v42 ^ 1;
      uint64_t v50 = [(HMMTRAccessoryServerBrowser *)v19 storage];
      v57[0] = MEMORY[0x263EF8330];
      v57[1] = 3221225472;
      v57[2] = __146__HMMTRAccessoryServerBrowser_prepareForPairingWithSetupPayload_fabric_targetFabricUUID_fabricID_owner_ownerCertFetchSupported_completionHandler___block_invoke_322;
      v57[3] = &unk_2653769B0;
      v57[4] = v19;
      id v59 = v33;
      id v34 = v43;
      id v58 = v34;
      char v60 = v49;
      [v50 fetchCertForFabricWithID:v34 isOwner:v53 forPairing:1 forceFetchFromResident:v54 completion:v57];

      id v35 = v59;
    }
  }
  else
  {
    id v36 = (void *)MEMORY[0x2533B64D0]();
    __int16 v37 = v19;
    id v38 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      __int16 v39 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v70 = v39;
      _os_log_impl(&dword_252495000, v38, OS_LOG_TYPE_ERROR, "%{public}@Key pair creation failed. Cannot move on with pairing preparation.", buf, 0xCu);
    }
    id v40 = [MEMORY[0x263F087E8] hmfErrorWithCode:15];
    (*((void (**)(id, void, void, void *))v29 + 2))(v29, 0, 0, v40);

    id v34 = v55;
  }
}

void __146__HMMTRAccessoryServerBrowser_prepareForPairingWithSetupPayload_fabric_targetFabricUUID_fabricID_owner_ownerCertFetchSupported_completionHandler___block_invoke(id *a1, void *a2, int a3, void *a4)
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a4;
  if (!v8)
  {
    if (a3)
    {
      id v13 = a1[4];
      v48[0] = MEMORY[0x263EF8330];
      v48[1] = 3221225472;
      v48[2] = __146__HMMTRAccessoryServerBrowser_prepareForPairingWithSetupPayload_fabric_targetFabricUUID_fabricID_owner_ownerCertFetchSupported_completionHandler___block_invoke_319;
      v48[3] = &unk_265376938;
      v48[4] = v13;
      id v53 = a1[8];
      id v49 = a1[5];
      id v50 = v7;
      id v51 = a1[6];
      id v52 = a1[7];
      [v13 _setupAndPersistStorageStateForHomeFabricID:v50 completion:v48];

      goto LABEL_30;
    }
    id v14 = v7;
    id v15 = v14;
    if (v14 && ![v14 isEqualToNumber:&unk_2702B5820])
    {
      uint64_t v21 = (uint64_t)v15;
    }
    else
    {
      if (isFeatureMatterLocalFabricConfigEnabled())
      {
        id v16 = [a1[5] fabricData];
        [v16 rootCert];
      }
      else
      {
        id v16 = [a1[4] storage];
        [v16 rootCertForCurrentFabric];
      id v17 = };

      id v18 = [MEMORY[0x263F10CC0] convertX509Certificate:v17];
      id v19 = (void *)[objc_alloc(MEMORY[0x263F10CB8]) initWithTLVBytes:v18];
      BOOL v20 = [v19 issuer];
      uint64_t v21 = [v20 fabricID];

      id v22 = (void *)MEMORY[0x2533B64D0]();
      id v23 = a1[4];
      BOOL v24 = HMFGetOSLogHandle();
      uint64_t v25 = v24;
      if (!v21)
      {
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          char v42 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          id v55 = v42;
          __int16 v56 = 2112;
          uint64_t v57 = (uint64_t)v19;
          _os_log_impl(&dword_252495000, v25, OS_LOG_TYPE_ERROR, "%{public}@Could not obtain fabric ID for pairing from root cert %@", buf, 0x16u);
        }
        id v43 = a1[8];
        uint64_t v44 = [MEMORY[0x263F087E8] hmfErrorWithCode:15];
        (*((void (**)(id, void, void, void *))v43 + 2))(v43, 0, 0, v44);

        goto LABEL_29;
      }
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        uint64_t v26 = v47 = v22;
        *(_DWORD *)buf = 138543618;
        id v55 = v26;
        __int16 v56 = 2112;
        uint64_t v57 = v21;
        _os_log_impl(&dword_252495000, v25, OS_LOG_TYPE_INFO, "%{public}@Using fabric ID %@ for pairing from retrieved cert", buf, 0x16u);

        id v22 = v47;
      }
    }
    int v27 = [a1[4] storage];
    [v27 prepareStorageForFabricID:v21];

    id v18 = [a1[4] _currentHomeFabricDeviceControllerStartupParams];
    if (!v18) {
      goto LABEL_22;
    }
    __int16 v45 = [a1[5] controllerEntityIdentifier];
    __int16 v28 = [a1[4] homeFabricControllers];
    uint64_t v46 = v21;
    id v29 = [v28 cachedWrapperWithFabricID:v21];

    id v30 = [a1[4] homeFabricControllers];
    id v31 = a1[6];
    id v32 = [a1[4] storage];
    unsigned __int16 v33 = [v32 dataSource];
    id v34 = [v33 allTargetFabricUUIDs];
    id v19 = [v30 wrapperWithTargetFabricUUID:v31 startupParams:v18 allTargetFabricUUIDs:v34 entityIdentifier:v45];

    if (v29 != v19) {
      [v29 remove];
    }

    uint64_t v21 = v46;
    if (v19)
    {
      [a1[4] _prepareForPairingWithSetupPayload:a1[7] fabricID:v46 controllerWrapper:v19 hasPriorSuccessfulPairing:0 category:0 completionHandler:a1[8]];
    }
    else
    {
LABEL_22:
      id v35 = (void *)MEMORY[0x2533B64D0]();
      id v36 = a1[4];
      __int16 v37 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        uint64_t v38 = v21;
        v40 = __int16 v39 = v18;
        *(_DWORD *)buf = 138543618;
        id v55 = v40;
        __int16 v56 = 2112;
        uint64_t v57 = v38;
        _os_log_impl(&dword_252495000, v37, OS_LOG_TYPE_ERROR, "%{public}@Failed to get controller wrapper for the fabric ID %@", buf, 0x16u);

        id v18 = v39;
        uint64_t v21 = v38;
      }

      id v41 = a1[8];
      id v19 = [MEMORY[0x263F087E8] hmfErrorWithCode:15];
      (*((void (**)(id, void, void, void *))v41 + 2))(v41, 0, 0, v19);
    }
    id v17 = (void *)v21;
LABEL_29:

    goto LABEL_30;
  }
  BOOL v9 = (void *)MEMORY[0x2533B64D0]();
  id v10 = a1[4];
  id v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    id v12 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v55 = v12;
    __int16 v56 = 2112;
    uint64_t v57 = (uint64_t)v8;
    _os_log_impl(&dword_252495000, v11, OS_LOG_TYPE_INFO, "%{public}@Failed to fetch certificates required for pairing with error %@", buf, 0x16u);
  }
  (*((void (**)(void))a1[8] + 2))();
LABEL_30:
}

void __146__HMMTRAccessoryServerBrowser_prepareForPairingWithSetupPayload_fabric_targetFabricUUID_fabricID_owner_ownerCertFetchSupported_completionHandler___block_invoke_321(id *a1, void *a2)
{
  id v3 = a2;
  id v4 = [a1[4] workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __146__HMMTRAccessoryServerBrowser_prepareForPairingWithSetupPayload_fabric_targetFabricUUID_fabricID_owner_ownerCertFetchSupported_completionHandler___block_invoke_2;
  block[3] = &unk_265378900;
  id v9 = a1[6];
  id v7 = a1[5];
  id v8 = v3;
  id v5 = v3;
  dispatch_async(v4, block);
}

void __146__HMMTRAccessoryServerBrowser_prepareForPairingWithSetupPayload_fabric_targetFabricUUID_fabricID_owner_ownerCertFetchSupported_completionHandler___block_invoke_322(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __146__HMMTRAccessoryServerBrowser_prepareForPairingWithSetupPayload_fabric_targetFabricUUID_fabricID_owner_ownerCertFetchSupported_completionHandler___block_invoke_2_323;
  v7[3] = &unk_265376988;
  id v10 = *(id *)(a1 + 48);
  id v5 = *(id *)(a1 + 40);
  char v11 = *(unsigned char *)(a1 + 56);
  id v8 = v5;
  id v9 = v3;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __146__HMMTRAccessoryServerBrowser_prepareForPairingWithSetupPayload_fabric_targetFabricUUID_fabricID_owner_ownerCertFetchSupported_completionHandler___block_invoke_2_323(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), *(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 56), *(void *)(a1 + 40));
}

uint64_t __146__HMMTRAccessoryServerBrowser_prepareForPairingWithSetupPayload_fabric_targetFabricUUID_fabricID_owner_ownerCertFetchSupported_completionHandler___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[6] + 16))(a1[6], a1[4], 0, a1[5]);
}

void __146__HMMTRAccessoryServerBrowser_prepareForPairingWithSetupPayload_fabric_targetFabricUUID_fabricID_owner_ownerCertFetchSupported_completionHandler___block_invoke_319(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = (void *)MEMORY[0x2533B64D0]();
    id v5 = *(id *)(a1 + 32);
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = HMFGetLogIdentifier();
      int v18 = 138543362;
      id v19 = v7;
      _os_log_impl(&dword_252495000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to setup storage for new fabric. Aborting pairing prep.", (uint8_t *)&v18, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
  else
  {
    id v8 = [*(id *)(a1 + 32) _currentHomeFabricDeviceControllerStartupParams];
    id v9 = [*(id *)(a1 + 40) controllerEntityIdentifier];
    id v10 = [*(id *)(a1 + 32) homeFabricControllers];
    char v11 = [v10 cachedWrapperWithFabricID:*(void *)(a1 + 48)];

    id v12 = [*(id *)(a1 + 32) homeFabricControllers];
    uint64_t v13 = *(void *)(a1 + 56);
    id v14 = [*(id *)(a1 + 32) storage];
    id v15 = [v14 dataSource];
    id v16 = [v15 allTargetFabricUUIDs];
    id v17 = [v12 wrapperWithTargetFabricUUID:v13 startupParams:v8 allTargetFabricUUIDs:v16 entityIdentifier:v9];

    if (v11 != v17) {
      [v11 remove];
    }
    [*(id *)(a1 + 32) _prepareForPairingWithSetupPayload:*(void *)(a1 + 64) fabricID:*(void *)(a1 + 48) controllerWrapper:v17 hasPriorSuccessfulPairing:0 category:0 completionHandler:*(void *)(a1 + 72)];
  }
}

- (void)_deleteOldPairings
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v3 = [(HMMTRAccessoryServerBrowser *)self storage];
  char v4 = [v3 isSystemCommissionerFabric];

  if ((v4 & 1) == 0)
  {
    id v5 = [(HMMTRAccessoryServerBrowser *)self storage];
    id v6 = [v5 fabricDataSource];
    id v7 = [v6 allNodeIDs];

    id v8 = [(HMMTRAccessoryServerBrowser *)self storage];
    id v9 = [v8 pairedNodeIDs];

    id v10 = (void *)MEMORY[0x2533B64D0]();
    id v31 = self;
    char v11 = HMFGetOSLogHandle();
    id v12 = v11;
    if (v9)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v13 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        __int16 v39 = v13;
        __int16 v40 = 2112;
        id v41 = v9;
        __int16 v42 = 2112;
        id v43 = v7;
        _os_log_impl(&dword_252495000, v12, OS_LOG_TYPE_DEBUG, "%{public}@Preparing for cleanup: comparing paired node IDs %@ vs all node IDs %@", buf, 0x20u);
      }
      if (v7)
      {
        long long v35 = 0u;
        long long v36 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        id v30 = v9;
        id v14 = v9;
        uint64_t v15 = [v14 countByEnumeratingWithState:&v33 objects:v37 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v34;
          do
          {
            for (uint64_t i = 0; i != v16; ++i)
            {
              if (*(void *)v34 != v17) {
                objc_enumerationMutation(v14);
              }
              id v19 = *(void **)(*((void *)&v33 + 1) + 8 * i);
              if (([v7 containsObject:v19] & 1) == 0)
              {
                uint64_t v20 = v7;
                uint64_t v21 = (void *)MEMORY[0x2533B64D0]();
                id v22 = v31;
                id v23 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
                {
                  BOOL v24 = HMFGetLogIdentifier();
                  *(_DWORD *)buf = 138543618;
                  __int16 v39 = v24;
                  __int16 v40 = 2112;
                  id v41 = v19;
                  _os_log_impl(&dword_252495000, v23, OS_LOG_TYPE_INFO, "%{public}@Cleaning up unpaired server with nodeID:%@", buf, 0x16u);
                }
                uint64_t v25 = [(HMMTRAccessoryServerBrowser *)v22 deviceController];
                uint64_t v26 = [v19 unsignedLongLongValue];
                int v27 = [(HAPAccessoryServerBrowser *)v22 workQueue];
                v32[0] = MEMORY[0x263EF8330];
                v32[1] = 3221225472;
                v32[2] = __49__HMMTRAccessoryServerBrowser__deleteOldPairings__block_invoke;
                v32[3] = &unk_2653768C0;
                void v32[4] = v22;
                void v32[5] = v19;
                [v25 getBaseDevice:v26 queue:v27 completionHandler:v32];

                id v7 = v20;
              }
            }
            uint64_t v16 = [v14 countByEnumeratingWithState:&v33 objects:v37 count:16];
          }
          while (v16);
        }

        __int16 v28 = [(HMMTRAccessoryServerBrowser *)v31 storage];
        [v28 removeAndSyncAllKeysNotIncludedInActiveNodeIDs:v7];

        id v9 = v30;
      }
    }
    else
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        id v29 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        __int16 v39 = v29;
        _os_log_impl(&dword_252495000, v12, OS_LOG_TYPE_INFO, "%{public}@No paired nodeIDs... Is this the first pairing?", buf, 0xCu);
      }
    }
  }
}

void __49__HMMTRAccessoryServerBrowser__deleteOldPairings__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = (void *)MEMORY[0x2533B64D0]();
    id v8 = *(id *)(a1 + 32);
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = HMFGetLogIdentifier();
      uint64_t v11 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      uint64_t v17 = v10;
      __int16 v18 = 2112;
      uint64_t v19 = v11;
      _os_log_impl(&dword_252495000, v9, OS_LOG_TYPE_ERROR, "%{public}@Unable to get connected device(%@), cleaning up locally", buf, 0x16u);
    }
  }
  else
  {
    id v12 = [*(id *)(a1 + 32) workQueue];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __49__HMMTRAccessoryServerBrowser__deleteOldPairings__block_invoke_318;
    v13[3] = &unk_265376898;
    long long v14 = *(_OWORD *)(a1 + 32);
    id v15 = 0;
    [v5 unpairDevice:v12 completionHandler:v13];
  }
}

void __49__HMMTRAccessoryServerBrowser__deleteOldPairings__block_invoke_318(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  char v4 = (void *)MEMORY[0x2533B64D0]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    id v7 = HMFGetLogIdentifier();
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 48);
    int v10 = 138543874;
    uint64_t v11 = v7;
    __int16 v12 = 2112;
    uint64_t v13 = v8;
    __int16 v14 = 2112;
    uint64_t v15 = v9;
    _os_log_impl(&dword_252495000, v6, OS_LOG_TYPE_ERROR, "%{public}@Notified device(%@) of removal, cleaning up locally. Error: %@", (uint8_t *)&v10, 0x20u);
  }
}

- (void)_setupAndPersistStorageStateForHomeFabricID:(id)a3 completion:(id)a4
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t))a4;
  uint64_t v8 = (void *)MEMORY[0x2533B64D0]();
  uint64_t v9 = self;
  int v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = HMFGetLogIdentifier();
    int v34 = 138543618;
    long long v35 = v11;
    __int16 v36 = 2112;
    id v37 = v6;
    _os_log_impl(&dword_252495000, v10, OS_LOG_TYPE_INFO, "%{public}@Setting up storage state to persist for Home Fabric ID = %@", (uint8_t *)&v34, 0x16u);
  }
  if (v6)
  {
    [(HMMTRAccessoryServerBrowser *)v9 setCurrentFabricID:v6];
    [(HMMTRAccessoryServerBrowser *)v9 setSystemCommissionerMode:0];
    uint64_t v12 = [(HMMTRAccessoryServerBrowser *)v9 isSystemCommissionerMode];
    uint64_t v13 = [(HMMTRAccessoryServerBrowser *)v9 storage];
    [v13 setSystemCommissionerFabric:v12];

    __int16 v14 = [(HMMTRAccessoryServerBrowser *)v9 storage];
    [v14 prepareStorageForFabricID:v6 forInitialSetup:1];

    uint64_t v15 = [(HMMTRAccessoryServerBrowser *)v9 _currentHomeFabricDeviceControllerStartupParams];
    uint64_t v16 = [(HMMTRAccessoryServerBrowser *)v9 ownerSharedOperationalKeyPair];
    uint64_t v17 = [v16 serialize];

    if (v17)
    {
      __int16 v18 = [(HMMTRAccessoryServerBrowser *)v9 controllerFactory];
      uint64_t v19 = [v18 stackStorageWithStartupParams:v15 operationalKeyPairTLV:v17];

      uint64_t v20 = [(HMMTRAccessoryServerBrowser *)v9 storage];
      [v20 persistLegacyControllerNodeWithDictionary:v19];

      uint64_t v21 = [(HMMTRAccessoryServerBrowser *)v9 storage];
      id v22 = [v21 fabricDataSource];
      id v23 = [v22 keyValueStore];
      BOOL v24 = +[HMMTRStorage matterItemsFromDictionary:v23];
      [(HMMTRAccessoryServerBrowser *)v9 setMatterStorageItems:v24];

      uint64_t v25 = 0;
    }
    else
    {
      id v30 = (void *)MEMORY[0x2533B64D0]();
      id v31 = v9;
      id v32 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        long long v33 = HMFGetLogIdentifier();
        int v34 = 138543362;
        long long v35 = v33;
        _os_log_impl(&dword_252495000, v32, OS_LOG_TYPE_ERROR, "%{public}@Failed to serialize operational key pair for new fabric. Aborting pairing prep.", (uint8_t *)&v34, 0xCu);
      }
      uint64_t v25 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F10BB0] code:4 userInfo:0];
      uint64_t v19 = (void *)v25;
    }
    v7[2](v7, v25);
  }
  else
  {
    uint64_t v26 = (void *)MEMORY[0x2533B64D0]();
    int v27 = v9;
    __int16 v28 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      id v29 = HMFGetLogIdentifier();
      int v34 = 138543362;
      long long v35 = v29;
      _os_log_impl(&dword_252495000, v28, OS_LOG_TYPE_ERROR, "%{public}@Storage state cannot be setup without fabric ID", (uint8_t *)&v34, 0xCu);
    }
  }
}

- (void)_setupStorageStateAfterCertFetchForHomeFabricID:(id)a3 completion:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, id))a4;
  uint64_t v8 = (void *)MEMORY[0x2533B64D0]();
  uint64_t v9 = self;
  int v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = HMFGetLogIdentifier();
    int v25 = 138543618;
    uint64_t v26 = v11;
    __int16 v27 = 2112;
    uint64_t v28 = (uint64_t)v6;
    _os_log_impl(&dword_252495000, v10, OS_LOG_TYPE_INFO, "%{public}@Setting up storage state after cert fetch for Home Fabric ID = %@", (uint8_t *)&v25, 0x16u);
  }
  if (!v6 || [v6 isEqual:&unk_2702B5820])
  {
    uint64_t v12 = (void *)MEMORY[0x263F10CC0];
    uint64_t v13 = [(HMMTRAccessoryServerBrowser *)v9 storage];
    __int16 v14 = [v13 rootCertForCurrentFabric];
    uint64_t v15 = [v12 convertX509Certificate:v14];

    uint64_t v16 = (void *)[objc_alloc(MEMORY[0x263F10CB8]) initWithTLVBytes:v15];
    uint64_t v17 = [v16 issuer];
    __int16 v18 = [v17 fabricID];
    uint64_t v19 = [v18 unsignedLongLongValue];

    uint64_t v20 = (void *)MEMORY[0x2533B64D0]();
    uint64_t v21 = v9;
    id v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      id v23 = HMFGetLogIdentifier();
      int v25 = 138543874;
      uint64_t v26 = v23;
      __int16 v27 = 2048;
      uint64_t v28 = v19;
      __int16 v29 = 2112;
      id v30 = v16;
      _os_log_impl(&dword_252495000, v22, OS_LOG_TYPE_INFO, "%{public}@Using fabricID = %lld for pairing. Root Certificate %@", (uint8_t *)&v25, 0x20u);
    }
    uint64_t v24 = [NSNumber numberWithUnsignedLongLong:v19];

    id v6 = (id)v24;
  }
  [(HMMTRAccessoryServerBrowser *)v9 _setupStorageStateForHomeFabricID:v6];
  v7[2](v7, v6);
}

- (void)_setupStorageStateForHomeFabricID:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x2533B64D0]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    int v23 = 138543618;
    uint64_t v24 = v8;
    __int16 v25 = 2112;
    id v26 = v4;
    _os_log_impl(&dword_252495000, v7, OS_LOG_TYPE_INFO, "%{public}@Setting up storage state for Home Fabric ID = %@", (uint8_t *)&v23, 0x16u);
  }
  if (v4)
  {
    [(HMMTRAccessoryServerBrowser *)v6 setCurrentFabricID:v4];
    [(HMMTRAccessoryServerBrowser *)v6 setSystemCommissionerMode:0];
    uint64_t v9 = [(HMMTRAccessoryServerBrowser *)v6 isSystemCommissionerMode];
    int v10 = [(HMMTRAccessoryServerBrowser *)v6 storage];
    [v10 setSystemCommissionerFabric:v9];

    uint64_t v11 = [(HMMTRAccessoryServerBrowser *)v6 storage];
    [v11 prepareStorageForFabricID:v4];

    uint64_t v12 = [(HMMTRAccessoryServerBrowser *)v6 deviceController];

    if (!v12)
    {
      uint64_t v13 = (void *)MEMORY[0x2533B64D0]();
      __int16 v14 = v6;
      uint64_t v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        uint64_t v16 = HMFGetLogIdentifier();
        uint64_t v17 = [(HMMTRAccessoryServerBrowser *)v14 storage];
        __int16 v18 = [v17 fabricID];
        int v23 = 138543618;
        uint64_t v24 = v16;
        __int16 v25 = 2112;
        id v26 = v18;
        _os_log_impl(&dword_252495000, v15, OS_LOG_TYPE_INFO, "%{public}@Failed to start matter stack for fabric ID: %@", (uint8_t *)&v23, 0x16u);
      }
    }
    [(HMMTRAccessoryServerBrowser *)v6 setPreWarmedFabricID:0];
    [(HMMTRAccessoryServerBrowser *)v6 setBrowserState:1];
  }
  else
  {
    uint64_t v19 = (void *)MEMORY[0x2533B64D0]();
    uint64_t v20 = v6;
    uint64_t v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      id v22 = HMFGetLogIdentifier();
      int v23 = 138543362;
      uint64_t v24 = v22;
      _os_log_impl(&dword_252495000, v21, OS_LOG_TYPE_ERROR, "%{public}@Storage state cannot be setup without fabric ID", (uint8_t *)&v23, 0xCu);
    }
  }
}

- (void)didFinishPairingAccessoryServer:(id)a3 operationDisabled:(BOOL)a4
{
  [(HMMTRAccessoryServerBrowser *)self disableUnrestrictedOperationsForAccessoryServer:a3];
  [(HMMTRAccessoryServerBrowser *)self resumeAllOperations];
  id v6 = [(HMMTRAccessoryServerBrowser *)self threadRadioManager];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __81__HMMTRAccessoryServerBrowser_didFinishPairingAccessoryServer_operationDisabled___block_invoke;
  v7[3] = &unk_265376E00;
  void v7[4] = self;
  [v6 stopAccessoryPairingWithCompletion:v7];

  if (!a4) {
    [(HMMTRAccessoryServerBrowser *)self restartDiscovery];
  }
}

void __81__HMMTRAccessoryServerBrowser_didFinishPairingAccessoryServer_operationDisabled___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x2533B64D0]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    int v8 = 138543618;
    uint64_t v9 = v7;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_252495000, v6, OS_LOG_TYPE_INFO, "%{public}@stopAccessoryPairingWithCompletion completed, error: %@", (uint8_t *)&v8, 0x16u);
  }
}

- (void)_restartDiscovery
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v3 = [(HMMTRAccessoryServerBrowser *)self currentFabric];
  BOOL v4 = [(HMMTRAccessoryServerBrowser *)self isCurrentDeviceAllowedAccessoryControlDespiteReachableResidentForFabric:v3];

  if (!v4) {
    return;
  }
  id v5 = [(HMMTRAccessoryServerBrowser *)self currentHomeFabricDeviceControllerWrapper];
  [v5 resume];

  id v6 = [(HMMTRAccessoryServerBrowser *)self currentFabricID];
  [(HMMTRAccessoryServerBrowser *)self _connectPendingFabricConnectionsForFabricID:v6];

  BOOL v7 = [(HMMTRAccessoryServerBrowser *)self isSystemCommissionerMode];
  int v8 = [(HMMTRAccessoryServerBrowser *)self threadRadioManager];
  if (v7)
  {
    uint64_t v9 = [(HMMTRAccessoryServerBrowser *)self systemCommissionerFabricID];
    [v8 startThreadRadioForSystemCommissionerFabricID:v9];
  }
  else
  {
    __int16 v10 = [(HMMTRAccessoryServerBrowser *)self currentFabricID];
    int v11 = [v8 hasMatterThreadAccessoryInHomeWithFabricID:v10];

    if (!v11)
    {
      uint64_t v12 = (void *)MEMORY[0x2533B64D0]();
      uint64_t v13 = self;
      __int16 v14 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        uint64_t v15 = HMFGetLogIdentifier();
        uint64_t v16 = [(HMMTRAccessoryServerBrowser *)v13 currentFabricID];
        int v26 = 138543618;
        uint64_t v27 = v15;
        __int16 v28 = 2112;
        __int16 v29 = v16;
        _os_log_impl(&dword_252495000, v14, OS_LOG_TYPE_INFO, "%{public}@Not starting thread because fabric %@ has no thread accessories", (uint8_t *)&v26, 0x16u);
      }
      goto LABEL_10;
    }
    int v8 = [(HMMTRAccessoryServerBrowser *)self threadRadioManager];
    uint64_t v9 = [(HMMTRAccessoryServerBrowser *)self currentFabricID];
    [v8 startThreadRadioForHomeWithFabricID:v9];
  }

LABEL_10:
  if (![(HMMTRAccessoryServerBrowser *)self isSystemCommissionerMode])
  {
    uint64_t v17 = (void *)MEMORY[0x2533B64D0]();
    __int16 v18 = self;
    uint64_t v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      uint64_t v20 = HMFGetLogIdentifier();
      uint64_t v21 = [(HMMTRAccessoryServerBrowser *)v18 currentFabricID];
      int v26 = 138543618;
      uint64_t v27 = v20;
      __int16 v28 = 2112;
      __int16 v29 = v21;
      _os_log_impl(&dword_252495000, v19, OS_LOG_TYPE_INFO, "%{public}@Starting discovery for fabric %@", (uint8_t *)&v26, 0x16u);
    }
    id v22 = [(HMMTRAccessoryServerBrowser *)v18 storage];
    int v23 = [v22 fabricDataSource];
    uint64_t v24 = [v23 keyValueStore];
    __int16 v25 = +[HMMTRStorage matterItemsFromDictionary:v24];
    [(HMMTRAccessoryServerBrowser *)v18 setMatterStorageItems:v25];

    [(HMMTRAccessoryServerBrowser *)v18 setupPairedDevices];
    [(HMMTRAccessoryServerBrowser *)v18 startDiscoveringAccessoryServers];
  }
}

- (void)restartDiscovery
{
  objc_initWeak(&location, self);
  id v3 = [(HAPAccessoryServerBrowser *)self workQueue];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __47__HMMTRAccessoryServerBrowser_restartDiscovery__block_invoke;
  v4[3] = &unk_265376E28;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __47__HMMTRAccessoryServerBrowser_restartDiscovery__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _restartDiscovery];
}

- (void)_stopMatterStackWithReason:(id)a3
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x2533B64D0]();
  id v6 = self;
  BOOL v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = HMFGetLogIdentifier();
    uint64_t v9 = [(HMMTRAccessoryServerBrowser *)v6 currentFabricID];
    *(_DWORD *)buf = 138543618;
    __int16 v40 = v8;
    __int16 v41 = 2112;
    __int16 v42 = v9;
    _os_log_impl(&dword_252495000, v7, OS_LOG_TYPE_INFO, "%{public}@Stopping the matter stack for FabricID = %@", buf, 0x16u);
  }
  __int16 v10 = [MEMORY[0x263EFF980] array];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  int v11 = v6->_discoveredAccessoryServers;
  uint64_t v12 = [(NSMutableSet *)v11 countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v34 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        uint64_t v17 = [v16 fabricID];
        __int16 v18 = [(HMMTRAccessoryServerBrowser *)v6 currentFabricID];

        if (v17 == v18) {
          [v10 addObject:v16];
        }
      }
      uint64_t v13 = [(NSMutableSet *)v11 countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v13);
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v19 = v10;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v30;
    do
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        if (*(void *)v30 != v22) {
          objc_enumerationMutation(v19);
        }
        uint64_t v24 = *(void **)(*((void *)&v29 + 1) + 8 * j);
        objc_msgSend(v24, "disable", (void)v29);
        [(HMMTRAccessoryServerBrowser *)v6 _invalidateAccessoryServer:v24 reason:v4 withCompletion:0];
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v29 objects:v37 count:16];
    }
    while (v21);
  }

  __int16 v25 = [(HMMTRAccessoryServerBrowser *)v6 currentFabricID];
  [(HMMTRAccessoryServerBrowser *)v6 _suspendOperationsForFabricID:v25];

  if (![(HMMTRAccessoryServerBrowser *)v6 preventThreadStopDuringStackRestart])
  {
    int v26 = [(HMMTRAccessoryServerBrowser *)v6 threadRadioManager];
    uint64_t v27 = [(HMMTRAccessoryServerBrowser *)v6 currentFabricID];
    [v26 stopThreadRadioForHomeWithFabricID:v27];
  }
  -[HMMTRAccessoryServerBrowser setPreventThreadStopDuringStackRestart:](v6, "setPreventThreadStopDuringStackRestart:", 0, (void)v29);
  __int16 v28 = [(HMMTRAccessoryServerBrowser *)v6 currentHomeFabricDeviceControllerWrapper];
  [v28 suspendOrShutdown];

  [(HMMTRAccessoryServerBrowser *)v6 setCurrentFabricID:0];
}

- (void)handlePairingForThreadAccessoryWithFabricID:(id)a3 nodeID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [(HAPAccessoryServerBrowser *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __82__HMMTRAccessoryServerBrowser_handlePairingForThreadAccessoryWithFabricID_nodeID___block_invoke;
  block[3] = &unk_265376F38;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __82__HMMTRAccessoryServerBrowser_handlePairingForThreadAccessoryWithFabricID_nodeID___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _setupStorageStateIfNotFabricID:*(void *)(a1 + 40) rediscoverAccessories:0];
  if ([*(id *)(a1 + 32) canEstablishConnectionForNodeID:*(void *)(a1 + 48)])
  {
    id v3 = [*(id *)(a1 + 32) threadRadioManager];
    id v2 = [*(id *)(a1 + 32) currentFabricID];
    [v3 startThreadRadioForHomeWithFabricID:v2];
  }
}

- (void)addFabricWithActiveClientForFabricID:(id)a3
{
  id v4 = a3;
  id v5 = [(HAPAccessoryServerBrowser *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __68__HMMTRAccessoryServerBrowser_addFabricWithActiveClientForFabricID___block_invoke;
  v7[3] = &unk_265376E98;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __68__HMMTRAccessoryServerBrowser_addFabricWithActiveClientForFabricID___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x2533B64D0]([*(id *)(a1 + 32) addFabricWithActiveClients:*(void *)(a1 + 40)]);
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    id v7 = [*(id *)(a1 + 32) fabricsWithActiveClients];
    int v8 = 138543874;
    id v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2112;
    id v13 = v7;
    _os_log_impl(&dword_252495000, v4, OS_LOG_TYPE_INFO, "%{public}@Added active client for pairing into fabric ID %@, currently active clients: %@", (uint8_t *)&v8, 0x20u);
  }
}

- (void)_setupStorageStateIfNotFabricID:(id)a3 rediscoverAccessories:(BOOL)a4
{
  BOOL v4 = a4;
  id v8 = a3;
  uint64_t v6 = [(HMMTRAccessoryServerBrowser *)self currentFabricID];
  char v7 = [v6 isEqual:v8];

  if ((v7 & 1) == 0) {
    [(HMMTRAccessoryServerBrowser *)self _setupStorageStateForUpdatedHomeFabricID:v8 rediscoverAccessories:v4];
  }
}

- (void)_setupStorageStateForUpdatedHomeFabricID:(id)a3 rediscoverAccessories:(BOOL)a4 overrideAccessoryControlAllowed:(BOOL)a5
{
  BOOL v6 = a4;
  uint64_t v73 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = (void *)MEMORY[0x2533B64D0]();
  __int16 v10 = self;
  uint64_t v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    __int16 v12 = HMFGetLogIdentifier();
    id v13 = [(HMMTRAccessoryServerBrowser *)v10 currentFabricID];
    int v67 = 138543874;
    id v68 = v12;
    __int16 v69 = 2112;
    id v70 = v8;
    __int16 v71 = 2112;
    uint64_t v72 = v13;
    _os_log_impl(&dword_252495000, v11, OS_LOG_TYPE_INFO, "%{public}@Setting up controller wrapper for Home FabricID = %@, currentFabricID = %@", (uint8_t *)&v67, 0x20u);
  }
  uint64_t v14 = [(HMMTRAccessoryServerBrowser *)v10 currentFabricID];
  if (v14)
  {
    uint64_t v15 = (void *)v14;
    uint64_t v16 = [(HMMTRAccessoryServerBrowser *)v10 currentFabricID];
    if ([v8 isEqual:v16])
    {
      uint64_t v17 = [(HMMTRAccessoryServerBrowser *)v10 storage];
      __int16 v18 = [v17 fabricID];
      char v19 = [v8 isEqual:v18];

      if (v19) {
        goto LABEL_9;
      }
    }
    else
    {
    }
    uint64_t v20 = [(HMMTRAccessoryServerBrowser *)v10 storage];
    [v20 setRootCert:0];

    uint64_t v21 = [(HMMTRAccessoryServerBrowser *)v10 storage];
    [v21 setOperationalCert:0];

    uint64_t v22 = [(HMMTRAccessoryServerBrowser *)v10 storage];
    [v22 setOwnerNodeID:0];

    int v23 = [(HMMTRAccessoryServerBrowser *)v10 storage];
    [v23 setOwnerIPK:0];
  }
LABEL_9:
  if (v8)
  {
    uint64_t v24 = [(HMMTRAccessoryServerBrowser *)v10 currentFabricID];
    if (v24)
    {
      __int16 v25 = (void *)v24;
      int v26 = [(HMMTRAccessoryServerBrowser *)v10 currentFabricID];
      int v27 = [v26 isEqualToNumber:v8];

      if (v27) {
        [(HMMTRAccessoryServerBrowser *)v10 setPreventThreadStopDuringStackRestart:1];
      }
    }
  }
  if (![(HMMTRAccessoryServerBrowser *)v10 preventThreadStopDuringStackRestart])
  {
    __int16 v28 = [(HMMTRAccessoryServerBrowser *)v10 threadRadioManager];
    long long v29 = [(HMMTRAccessoryServerBrowser *)v10 systemCommissionerFabricID];
    [v28 stopThreadRadioForSystemCommissionerFabricID:v29];

    long long v30 = [(HMMTRAccessoryServerBrowser *)v10 threadRadioManager];
    long long v31 = [(HMMTRAccessoryServerBrowser *)v10 currentFabricID];
    [v30 stopThreadRadioForHomeWithFabricID:v31];
  }
  [(HMMTRAccessoryServerBrowser *)v10 setPreventThreadStopDuringStackRestart:0];
  [(HMMTRAccessoryServerBrowser *)v10 _setupStorageStateForHomeFabricID:v8];
  if (isFeatureMatteriPhoneOnlyPairingControlEnabled())
  {
    if (!v8)
    {
      long long v32 = [(HMMTRAccessoryServerBrowser *)v10 threadRadioManager];
      [v32 allowDisconnect];

      long long v33 = [(HMMTRAccessoryServerBrowser *)v10 fabricsWithActiveClients];
      uint64_t v34 = [v33 count];

      if (v34)
      {
        long long v35 = [(HMMTRAccessoryServerBrowser *)v10 fabricsWithActiveClients];
        id v8 = [v35 anyObject];

        long long v36 = (void *)MEMORY[0x2533B64D0]();
        id v37 = v10;
        uint64_t v38 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
        {
          __int16 v39 = HMFGetLogIdentifier();
          int v67 = 138543618;
          id v68 = v39;
          __int16 v69 = 2112;
          id v70 = v8;
          _os_log_impl(&dword_252495000, v38, OS_LOG_TYPE_INFO, "%{public}@no fabricID was provided, restarting with fabric with active client: %@", (uint8_t *)&v67, 0x16u);
        }
        [(HMMTRAccessoryServerBrowser *)v37 _setupStorageStateForHomeFabricID:v8];
      }
      else
      {
        id v8 = 0;
      }
    }
    __int16 v40 = [(HMMTRAccessoryServerBrowser *)v10 currentFabricID];

    if (v40)
    {
      if (a5
        || ([(HMMTRAccessoryServerBrowser *)v10 currentFabric],
            __int16 v41 = objc_claimAutoreleasedReturnValue(),
            BOOL v42 = [(HMMTRAccessoryServerBrowser *)v10 isCurrentDeviceAllowedAccessoryControlDespiteReachableResidentForFabric:v41], v41, v42))
      {
        uint64_t v43 = [(HMMTRAccessoryServerBrowser *)v10 currentHomeFabricDeviceControllerWrapper];
        [v43 resume];

        if (v6
          && ([(HMMTRAccessoryServerBrowser *)v10 fabricsWithActiveClients],
              uint64_t v44 = objc_claimAutoreleasedReturnValue(),
              [(HMMTRAccessoryServerBrowser *)v10 currentFabricID],
              __int16 v45 = objc_claimAutoreleasedReturnValue(),
              int v46 = [v44 containsObject:v45],
              v45,
              v44,
              v46))
        {
          uint64_t v47 = (void *)MEMORY[0x2533B64D0]();
          long long v48 = v10;
          id v49 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
          {
            id v50 = HMFGetLogIdentifier();
            id v51 = [(HMMTRAccessoryServerBrowser *)v48 currentFabricID];
            int v67 = 138543618;
            id v68 = v50;
            __int16 v69 = 2112;
            id v70 = v51;
            _os_log_impl(&dword_252495000, v49, OS_LOG_TYPE_INFO, "%{public}@Starting discovery for fabricID %@ because there are active clients", (uint8_t *)&v67, 0x16u);
          }
          [(HMMTRAccessoryServerBrowser *)v48 _restartDiscovery];
        }
        else
        {
          __int16 v56 = [(HMMTRAccessoryServerBrowser *)v10 threadRadioManager];
          uint64_t v57 = [(HMMTRAccessoryServerBrowser *)v10 currentFabricID];
          int v58 = [v56 hasMatterThreadAccessoryInHomeWithFabricID:v57];

          if (v58)
          {
            id v59 = (void *)MEMORY[0x2533B64D0]();
            char v60 = v10;
            id v61 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
            {
              id v62 = HMFGetLogIdentifier();
              id v63 = [(HMMTRAccessoryServerBrowser *)v60 currentFabricID];
              int v67 = 138543618;
              id v68 = v62;
              __int16 v69 = 2112;
              id v70 = v63;
              _os_log_impl(&dword_252495000, v61, OS_LOG_TYPE_INFO, "%{public}@Starting thread for fabricID %@ because it became the current fabric", (uint8_t *)&v67, 0x16u);
            }
            id v64 = [(HMMTRAccessoryServerBrowser *)v60 threadRadioManager];
            id v65 = [(HMMTRAccessoryServerBrowser *)v60 currentFabricID];
            [v64 startThreadRadioForHomeWithFabricID:v65];
          }
        }
        goto LABEL_40;
      }
      id v52 = (void *)MEMORY[0x2533B64D0]();
      id v53 = v10;
      BOOL v54 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
      {
        id v55 = HMFGetLogIdentifier();
        id v66 = [(HMMTRAccessoryServerBrowser *)v53 currentFabricID];
        int v67 = 138543618;
        id v68 = v55;
        __int16 v69 = 2112;
        id v70 = v66;
        _os_log_impl(&dword_252495000, v54, OS_LOG_TYPE_INFO, "%{public}@Not starting local discovery for fabricID %@, resident available", (uint8_t *)&v67, 0x16u);

        goto LABEL_38;
      }
    }
    else
    {
      id v52 = (void *)MEMORY[0x2533B64D0]();
      id v53 = v10;
      BOOL v54 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
      {
        id v55 = HMFGetLogIdentifier();
        int v67 = 138543362;
        id v68 = v55;
        _os_log_impl(&dword_252495000, v54, OS_LOG_TYPE_INFO, "%{public}@Fabric not provided and no active clients, not configuring any controller wrapper", (uint8_t *)&v67, 0xCu);
LABEL_38:
      }
    }
  }
LABEL_40:
}

- (void)_setupStorageStateForUpdatedHomeFabricID:(id)a3 rediscoverAccessories:(BOOL)a4
{
}

- (void)_setupStorageStateForUpdatedHomeFabricID:(id)a3
{
}

- (void)setupStorageStateWithoutRediscoveringAccessoriesForHomeFabricID:(id)a3
{
  id v4 = a3;
  id v5 = [(HAPAccessoryServerBrowser *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __95__HMMTRAccessoryServerBrowser_setupStorageStateWithoutRediscoveringAccessoriesForHomeFabricID___block_invoke;
  v7[3] = &unk_265376E98;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __95__HMMTRAccessoryServerBrowser_setupStorageStateWithoutRediscoveringAccessoriesForHomeFabricID___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setupStorageStateForUpdatedHomeFabricID:*(void *)(a1 + 40) rediscoverAccessories:0];
}

- (void)setupStorageStateAndRediscoverAccessoriesForHomeFabricID:(id)a3
{
  id v4 = a3;
  id v5 = [(HAPAccessoryServerBrowser *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __88__HMMTRAccessoryServerBrowser_setupStorageStateAndRediscoverAccessoriesForHomeFabricID___block_invoke;
  v7[3] = &unk_265376E98;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __88__HMMTRAccessoryServerBrowser_setupStorageStateAndRediscoverAccessoriesForHomeFabricID___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setupStorageStateForUpdatedHomeFabricID:*(void *)(a1 + 40)];
}

- (void)setupStorageStateAfterCertFetchForHomeFabricID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HAPAccessoryServerBrowser *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __89__HMMTRAccessoryServerBrowser_setupStorageStateAfterCertFetchForHomeFabricID_completion___block_invoke;
  block[3] = &unk_265378900;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __89__HMMTRAccessoryServerBrowser_setupStorageStateAfterCertFetchForHomeFabricID_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setupStorageStateAfterCertFetchForHomeFabricID:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (void)setupStorageStateForHomeFabricID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HAPAccessoryServerBrowser *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __75__HMMTRAccessoryServerBrowser_setupStorageStateForHomeFabricID_completion___block_invoke;
  block[3] = &unk_265378900;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __75__HMMTRAccessoryServerBrowser_setupStorageStateForHomeFabricID_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _setupStorageStateForHomeFabricID:*(void *)(a1 + 40)];
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v2();
}

- (void)setupStorageStateForHomeFabricID:(id)a3
{
  id v4 = a3;
  id v5 = [(HAPAccessoryServerBrowser *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __64__HMMTRAccessoryServerBrowser_setupStorageStateForHomeFabricID___block_invoke;
  v7[3] = &unk_265376E98;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __64__HMMTRAccessoryServerBrowser_setupStorageStateForHomeFabricID___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setupStorageStateForHomeFabricID:*(void *)(a1 + 40)];
}

- (void)createNewFabricDataForFabric:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HAPAccessoryServerBrowser *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __71__HMMTRAccessoryServerBrowser_createNewFabricDataForFabric_completion___block_invoke;
  block[3] = &unk_265378900;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __71__HMMTRAccessoryServerBrowser_createNewFabricDataForFabric_completion___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x2533B64D0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    __int16 v18 = v5;
    __int16 v19 = 2112;
    uint64_t v20 = v6;
    _os_log_impl(&dword_252495000, v4, OS_LOG_TYPE_INFO, "%{public}@Creating new fabric data for fabric ID: %@", buf, 0x16u);
  }
  if ([*(id *)(a1 + 32) _createFabricKeyPairsIfAbsent])
  {
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __71__HMMTRAccessoryServerBrowser_createNewFabricDataForFabric_completion___block_invoke_315;
    v14[3] = &unk_265377368;
    id v7 = *(void **)(a1 + 40);
    v14[4] = *(void *)(a1 + 32);
    id v15 = v7;
    id v16 = *(id *)(a1 + 48);
    [v15 createNewFabricIdentityWithCompletion:v14];
  }
  else
  {
    id v8 = (void *)MEMORY[0x2533B64D0]();
    id v9 = *(id *)(a1 + 32);
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v18 = v11;
      _os_log_impl(&dword_252495000, v10, OS_LOG_TYPE_ERROR, "%{public}@Key pairs are not present. Cannot move forward.", buf, 0xCu);
    }
    uint64_t v12 = *(void *)(a1 + 48);
    id v13 = [MEMORY[0x263F087E8] hapErrorWithCode:1];
    (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v13);
  }
}

void __71__HMMTRAccessoryServerBrowser_createNewFabricDataForFabric_completion___block_invoke_315(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = (void *)MEMORY[0x2533B64D0]();
    id v5 = *(id *)(a1 + 32);
    uint64_t v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = HMFGetLogIdentifier();
      uint64_t v8 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      uint64_t v21 = v7;
      __int16 v22 = 2112;
      uint64_t v23 = v8;
      __int16 v24 = 2112;
      id v25 = v3;
      _os_log_impl(&dword_252495000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch cert for fabric ID: %@, error: %@", buf, 0x20u);
    }
  }
  id v9 = (void *)MEMORY[0x2533B64D0]();
  id v10 = *(id *)(a1 + 32);
  uint64_t v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    uint64_t v12 = HMFGetLogIdentifier();
    uint64_t v13 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    uint64_t v21 = v12;
    __int16 v22 = 2112;
    uint64_t v23 = v13;
    _os_log_impl(&dword_252495000, v11, OS_LOG_TYPE_INFO, "%{public}@Successfully created fabric data for %@", buf, 0x16u);
  }
  uint64_t v14 = [*(id *)(a1 + 32) workQueue];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __71__HMMTRAccessoryServerBrowser_createNewFabricDataForFabric_completion___block_invoke_316;
  v17[3] = &unk_2653770F0;
  id v15 = *(id *)(a1 + 48);
  id v18 = v3;
  id v19 = v15;
  id v16 = v3;
  dispatch_async(v14, v17);
}

uint64_t __71__HMMTRAccessoryServerBrowser_createNewFabricDataForFabric_completion___block_invoke_316(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)createNewFabricDataForFabricID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HAPAccessoryServerBrowser *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __73__HMMTRAccessoryServerBrowser_createNewFabricDataForFabricID_completion___block_invoke;
  block[3] = &unk_265378900;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __73__HMMTRAccessoryServerBrowser_createNewFabricDataForFabricID_completion___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x2533B64D0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    uint64_t v21 = v5;
    __int16 v22 = 2112;
    uint64_t v23 = v6;
    _os_log_impl(&dword_252495000, v4, OS_LOG_TYPE_INFO, "%{public}@Creating new fabric data for fabric ID: %@", buf, 0x16u);
  }
  if ([*(id *)(a1 + 32) _createFabricKeyPairsIfAbsent])
  {
    id v7 = [*(id *)(a1 + 32) storage];
    [v7 setSharedAdmin:0];

    uint64_t v8 = [*(id *)(a1 + 32) storage];
    [v8 setFabricCreationInProgress:1];

    id v9 = [*(id *)(a1 + 32) storage];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __73__HMMTRAccessoryServerBrowser_createNewFabricDataForFabricID_completion___block_invoke_313;
    v17[3] = &unk_265377368;
    id v10 = *(void **)(a1 + 40);
    void v17[4] = *(void *)(a1 + 32);
    id v18 = v10;
    id v19 = *(id *)(a1 + 48);
    [v9 fetchCertForFabricWithID:v18 isOwner:1 forPairing:1 forceFetchFromResident:0 completion:v17];
  }
  else
  {
    uint64_t v11 = (void *)MEMORY[0x2533B64D0]();
    id v12 = *(id *)(a1 + 32);
    id v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v21 = v14;
      _os_log_impl(&dword_252495000, v13, OS_LOG_TYPE_ERROR, "%{public}@Key pairs are not present. Cannot move forward.", buf, 0xCu);
    }
    uint64_t v15 = *(void *)(a1 + 48);
    id v16 = [MEMORY[0x263F087E8] hapErrorWithCode:1];
    (*(void (**)(uint64_t, void *))(v15 + 16))(v15, v16);
  }
}

void __73__HMMTRAccessoryServerBrowser_createNewFabricDataForFabricID_completion___block_invoke_313(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = (void *)MEMORY[0x2533B64D0]();
    id v5 = *(id *)(a1 + 32);
    uint64_t v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = HMFGetLogIdentifier();
      uint64_t v8 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      uint64_t v15 = v7;
      __int16 v16 = 2112;
      uint64_t v17 = v8;
      __int16 v18 = 2112;
      id v19 = v3;
      _os_log_impl(&dword_252495000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch cert for fabric ID: %@, error: %@", buf, 0x20u);
    }
    id v9 = [*(id *)(a1 + 32) storage];
    [v9 setFabricCreationInProgress:0];

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v10 = *(void **)(a1 + 32);
    uint64_t v11 = *(void *)(a1 + 40);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __73__HMMTRAccessoryServerBrowser_createNewFabricDataForFabricID_completion___block_invoke_314;
    v12[3] = &unk_265378578;
    v12[4] = v10;
    id v13 = *(id *)(a1 + 48);
    [v10 _setupAndPersistStorageStateForHomeFabricID:v11 completion:v12];
  }
}

void __73__HMMTRAccessoryServerBrowser_createNewFabricDataForFabricID_completion___block_invoke_314(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v5 = a2;
  id v4 = [v3 storage];
  [v4 setFabricCreationInProgress:0];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)createNewFabricIDWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(HAPAccessoryServerBrowser *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __63__HMMTRAccessoryServerBrowser_createNewFabricIDWithCompletion___block_invoke;
  v7[3] = &unk_2653770F0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __63__HMMTRAccessoryServerBrowser_createNewFabricIDWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) _getRandomFabricId];
  id v3 = [NSNumber numberWithUnsignedLongLong:v2];
  id v4 = (void *)MEMORY[0x2533B64D0]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    int v8 = 138543618;
    id v9 = v7;
    __int16 v10 = 2112;
    uint64_t v11 = v3;
    _os_log_impl(&dword_252495000, v6, OS_LOG_TYPE_INFO, "%{public}@Generated new fabric ID: %@", (uint8_t *)&v8, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (unint64_t)_getRandomFabricId
{
  uint64_t v2 = self;
  id v3 = [(HMMTRAccessoryServerBrowser *)self storage];
  id v4 = [v3 dataSource];

  id v5 = [v4 allFabricIDs];
  uint64_t v15 = v2;
  do
  {
    unint64_t v6 = +[HMMTRUtilities randomNodeID];
    id v7 = [NSNumber numberWithUnsignedLongLong:v6];
    if ([v5 containsObject:v7])
    {
      do
      {

        unint64_t v6 = +[HMMTRUtilities randomNodeID];
        id v7 = [NSNumber numberWithUnsignedLongLong:v6];
      }
      while (([v5 containsObject:v7] & 1) != 0);
    }
    int v8 = [(HMMTRAccessoryServerBrowser *)v2 storage];
    id v9 = [v8 fabricID];
    __int16 v10 = [NSNumber numberWithUnsignedLongLong:v6];
    if ([v9 isEqualToNumber:v10])
    {
      int v11 = 0;
    }
    else
    {
      uint64_t v12 = [(HMMTRAccessoryServerBrowser *)v2 systemCommissionerFabricID];
      [NSNumber numberWithUnsignedLongLong:v6];
      id v13 = v16 = v8;
      int v11 = [v12 isEqualToNumber:v13] ^ 1;

      int v8 = v16;
      uint64_t v2 = v15;
    }
  }
  while (!v11);

  return v6;
}

- (unint64_t)_generateNodeID
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = [(HMMTRAccessoryServerBrowser *)self storage];
  id v4 = [v3 fabricDataSource];
  id v5 = [v4 allNodeIDs];

  do
  {
    unint64_t v6 = +[HMMTRUtilities randomNodeID];
    id v7 = [NSNumber numberWithUnsignedLongLong:v6];
    char v8 = [v5 containsObject:v7];
  }
  while ((v8 & 1) != 0);
  id v9 = (void *)MEMORY[0x2533B64D0]();
  __int16 v10 = self;
  int v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    uint64_t v12 = HMFGetLogIdentifier();
    int v14 = 138543618;
    uint64_t v15 = v12;
    __int16 v16 = 2048;
    unint64_t v17 = v6;
    _os_log_impl(&dword_252495000, v11, OS_LOG_TYPE_INFO, "%{public}@Picking nodeID = %llu for the pairing request", (uint8_t *)&v14, 0x16u);
  }

  return v6;
}

- (BOOL)_delegateRespondsToSelector:(SEL)a3
{
  id v4 = [(HMMTRAccessoryServerBrowser *)self delegate];
  if (v4)
  {
    id v5 = [(HMMTRAccessoryServerBrowser *)self delegateQueue];
    if (v5)
    {
      unint64_t v6 = [(HMMTRAccessoryServerBrowser *)self delegate];
      char v7 = objc_opt_respondsToSelector();
    }
    else
    {
      char v7 = 0;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7 & 1;
}

- (id)_allServers
{
  id v3 = [(HMMTRAccessoryServerBrowser *)self discoveredAccessoryServers];
  id v4 = (void *)[v3 mutableCopy];

  id v5 = [(HMMTRAccessoryServerBrowser *)self stagedAccessoryServers];
  [v4 unionSet:v5];

  return v4;
}

- (void)announceOtaProviderForNodeID:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(HMMTRAccessoryServerBrowser *)self isCurrentDevicePrimaryResident]
    || [(HMMTRAccessoryServerBrowser *)self isCurrentDeviceMobileAndAllowedAccessoryControl]|| [(HMMTRAccessoryServerBrowser *)self isCurrentDeviceAllowedAccessoryControlDespiteReachableResident])
  {
    if ((_os_feature_enabled_impl() & 1) != 0
      || CFPreferencesGetAppBooleanValue(@"MatterOTA", @"/Library/Managed Preferences/mobile/com.apple.homed.plist", 0))
    {
      id v5 = [(HMMTRAccessoryServerBrowser *)self accessoryServerWithNodeID:v4];
      unint64_t v6 = v5;
      if (v5)
      {
        char v7 = [v5 matterFirmwareUpdateStatus];
        [v7 updateFirmwareUpdateStatus:3];

        char v8 = [(HMMTRAccessoryServerBrowser *)self deviceController];
        id v9 = [v8 controllerNodeId];
        v18[0] = MEMORY[0x263EF8330];
        v18[1] = 3221225472;
        v18[2] = __60__HMMTRAccessoryServerBrowser_announceOtaProviderForNodeID___block_invoke;
        v18[3] = &unk_265378660;
        v18[4] = self;
        id v19 = v6;
        [v19 announceOtaProvider:v9 providerEndpoint:&unk_2702B5820 immediateAnnouncement:0 completionHandler:v18];
      }
      else
      {
        __int16 v10 = (void *)MEMORY[0x2533B64D0]();
        int v11 = self;
        uint64_t v12 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          id v13 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          uint64_t v21 = v13;
          __int16 v22 = 2112;
          id v23 = v4;
          _os_log_impl(&dword_252495000, v12, OS_LOG_TYPE_ERROR, "%{public}@Could not associate with a paired accessory for announceOtaProviderForNodeID:%@", buf, 0x16u);
        }
      }
    }
  }
  else
  {
    int v14 = (void *)MEMORY[0x2533B64D0]();
    uint64_t v15 = self;
    __int16 v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      unint64_t v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v21 = v17;
      _os_log_impl(&dword_252495000, v16, OS_LOG_TYPE_INFO, "%{public}@Current device cannot be an OTA provider", buf, 0xCu);
    }
  }
}

void __60__HMMTRAccessoryServerBrowser_announceOtaProviderForNodeID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x2533B64D0]();
  id v5 = *(id *)(a1 + 32);
  unint64_t v6 = HMFGetOSLogHandle();
  char v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      char v8 = HMFGetLogIdentifier();
      uint64_t v9 = *(void *)(a1 + 40);
      int v15 = 138543874;
      __int16 v16 = v8;
      __int16 v17 = 2112;
      uint64_t v18 = v9;
      __int16 v19 = 2112;
      id v20 = v3;
      __int16 v10 = "%{public}@OTA Announce failed for server %@: %@";
      int v11 = v7;
      os_log_type_t v12 = OS_LOG_TYPE_ERROR;
      uint32_t v13 = 32;
LABEL_6:
      _os_log_impl(&dword_252495000, v11, v12, v10, (uint8_t *)&v15, v13);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    char v8 = HMFGetLogIdentifier();
    uint64_t v14 = *(void *)(a1 + 40);
    int v15 = 138543618;
    __int16 v16 = v8;
    __int16 v17 = 2112;
    uint64_t v18 = v14;
    __int16 v10 = "%{public}@OTA Announce completed for server: %@";
    int v11 = v7;
    os_log_type_t v12 = OS_LOG_TYPE_INFO;
    uint32_t v13 = 22;
    goto LABEL_6;
  }
}

- (void)_updateAccessoryControlListForServer:(id)a3 completion:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  char v8 = [v6 populateACLEntriesAfterPairing];
  uint64_t v9 = [v8 objectForKeyedSubscript:@"adminNodesForPairing"];
  __int16 v10 = [v8 objectForKeyedSubscript:@"regularNodesForPairing"];
  int v11 = [(HMMTRAccessoryServerBrowser *)self nodesWithPendingACLOverwrite];
  os_log_type_t v12 = [v6 nodeID];
  int v13 = [v11 containsObject:v12];

  if (v13)
  {
    uint64_t v14 = (void *)MEMORY[0x2533B64D0]();
    int v15 = self;
    __int16 v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      __int16 v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      long long v29 = v17;
      _os_log_impl(&dword_252495000, v16, OS_LOG_TYPE_INFO, "%{public}@Overwriting ACL on accessory to remove node ID of shared Admin controller", buf, 0xCu);
    }
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __79__HMMTRAccessoryServerBrowser__updateAccessoryControlListForServer_completion___block_invoke;
    v25[3] = &unk_265377368;
    uint64_t v18 = &v26;
    v25[4] = v15;
    id v26 = v6;
    __int16 v19 = &v27;
    id v27 = v7;
    id v20 = v7;
    [v6 updateAccessoryControlToAdministratorNodes:v9 sharedUserNodes:v10 completion:v25];
  }
  else
  {
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __79__HMMTRAccessoryServerBrowser__updateAccessoryControlListForServer_completion___block_invoke_312;
    v22[3] = &unk_265377368;
    uint64_t v18 = &v23;
    v22[4] = self;
    id v23 = v6;
    __int16 v19 = &v24;
    id v24 = v7;
    id v21 = v7;
    [v6 updateAccessoryControlToIncludeAdministratorNodes:v9 sharedUserNodes:v10 completion:v22];
  }
}

void __79__HMMTRAccessoryServerBrowser__updateAccessoryControlListForServer_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x2533B64D0]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  id v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      char v8 = HMFGetLogIdentifier();
      int v13 = 138543618;
      uint64_t v14 = v8;
      __int16 v15 = 2112;
      id v16 = v3;
      _os_log_impl(&dword_252495000, v7, OS_LOG_TYPE_ERROR, "%{public}@Failed to update Access Control List on the accessory with error %@", (uint8_t *)&v13, 0x16u);
    }
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = HMFGetLogIdentifier();
      __int16 v10 = *(void **)(a1 + 40);
      int v13 = 138543618;
      uint64_t v14 = v9;
      __int16 v15 = 2112;
      id v16 = v10;
      _os_log_impl(&dword_252495000, v7, OS_LOG_TYPE_INFO, "%{public}@Updated Access Control List on accessory %@", (uint8_t *)&v13, 0x16u);
    }
    int v11 = [*(id *)(a1 + 32) nodesWithPendingACLOverwrite];
    os_log_type_t v12 = [*(id *)(a1 + 40) nodeID];
    [v11 removeObject:v12];
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __79__HMMTRAccessoryServerBrowser__updateAccessoryControlListForServer_completion___block_invoke_312(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x2533B64D0]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  id v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      char v8 = HMFGetLogIdentifier();
      int v15 = 138543618;
      id v16 = v8;
      __int16 v17 = 2112;
      id v18 = v3;
      uint64_t v9 = "%{public}@Failed to update Access Control List on the accessory with error %@";
      __int16 v10 = v7;
      os_log_type_t v11 = OS_LOG_TYPE_ERROR;
LABEL_6:
      _os_log_impl(&dword_252495000, v10, v11, v9, (uint8_t *)&v15, 0x16u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    char v8 = HMFGetLogIdentifier();
    os_log_type_t v12 = *(void **)(a1 + 40);
    int v15 = 138543618;
    id v16 = v8;
    __int16 v17 = 2112;
    id v18 = v12;
    uint64_t v9 = "%{public}@Updated Access Control List on accessory %@";
    __int16 v10 = v7;
    os_log_type_t v11 = OS_LOG_TYPE_INFO;
    goto LABEL_6;
  }

  (*(void (**)(void, id, uint64_t, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v3, v13, v14);
}

- (id)_createCHIPAccessoryForNodeID:(unint64_t)a3 ifPaired:(BOOL)a4 fatalError:(id *)a5
{
  uint64_t v207 = *MEMORY[0x263EF8340];
  if (a4 && ![(HMMTRAccessoryServerBrowser *)self _isDevicePaired:a3])
  {
    id v27 = (void *)MEMORY[0x2533B64D0]();
    __int16 v28 = self;
    long long v29 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      uint64_t v30 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v192 = v30;
      __int16 v193 = 2048;
      unint64_t v194 = a3;
      _os_log_impl(&dword_252495000, v29, OS_LOG_TYPE_INFO, "%{public}@No CHIP accessory for nodeID %llu, skipping...", buf, 0x16u);
    }
LABEL_14:
    int v15 = 0;
    goto LABEL_92;
  }
  char v8 = [(HMMTRAccessoryServerBrowser *)self storage];
  uint64_t v9 = [NSNumber numberWithUnsignedLongLong:a3];
  int v10 = [v8 isStagedForNode:v9];

  if (v10)
  {
    os_log_type_t v11 = (void *)MEMORY[0x2533B64D0]();
    os_log_type_t v12 = self;
    uint64_t v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      uint64_t v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v192 = v14;
      __int16 v193 = 2048;
      unint64_t v194 = a3;
      _os_log_impl(&dword_252495000, v13, OS_LOG_TYPE_INFO, "%{public}@Found staged accessory %llu in storage, skipping...", buf, 0x16u);
    }
    if (a5)
    {
      [MEMORY[0x263F087E8] hapErrorWithCode:18];
      int v15 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_92;
    }
    goto LABEL_14;
  }
  id v16 = [(HMMTRAccessoryServerBrowser *)self storage];
  __int16 v17 = [NSNumber numberWithUnsignedLongLong:a3];
  id v18 = [v16 vendorIDForNode:v17];

  uint64_t v19 = [(HMMTRAccessoryServerBrowser *)self storage];
  id v20 = [NSNumber numberWithUnsignedLongLong:a3];
  id v21 = [v19 productIDForNode:v20];

  __int16 v22 = [(HMMTRAccessoryServerBrowser *)self storage];
  id v23 = [NSNumber numberWithUnsignedLongLong:a3];
  id v171 = [v22 categoryForNode:v23];

  id v24 = [(HMMTRAccessoryServerBrowser *)self storage];
  id v25 = [NSNumber numberWithUnsignedLongLong:a3];
  v170 = [v24 configNumberForNode:v25];

  id v167 = a5;
  unint64_t v169 = a3;
  if (v18 && v21)
  {
    id v26 = v18;
  }
  else
  {
    long long v31 = [(HMMTRAccessoryServerBrowser *)self storage];
    long long v32 = [v31 fabricDataSource];
    [NSNumber numberWithUnsignedLongLong:a3];
    v34 = unint64_t v33 = a3;
    long long v35 = [v32 storageDataSourceForDeviceWithNodeID:v34];
    uint64_t v36 = [v35 vendorID];

    id v37 = [(HMMTRAccessoryServerBrowser *)self storage];
    uint64_t v38 = [v37 fabricDataSource];
    __int16 v39 = [NSNumber numberWithUnsignedLongLong:v33];
    __int16 v40 = [v38 storageDataSourceForDeviceWithNodeID:v39];
    uint64_t v41 = [v40 productID];

    id v21 = (void *)v41;
    id v26 = (void *)v36;
  }
  BOOL v42 = v21;
  if (v26) {
    BOOL v43 = v21 == 0;
  }
  else {
    BOOL v43 = 1;
  }
  char v44 = !v43;
  if (v43 || !v171 || !v170)
  {
    __int16 v45 = (void *)MEMORY[0x2533B64D0]();
    int v46 = self;
    uint64_t v47 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
    {
      long long v48 = HMFGetLogIdentifier();
      id v49 = [NSNumber numberWithUnsignedLongLong:v169];
      *(_DWORD *)buf = 138544642;
      v192 = v48;
      __int16 v193 = 2112;
      unint64_t v194 = (unint64_t)v26;
      __int16 v195 = 2112;
      v196 = v42;
      __int16 v197 = 2112;
      v198 = v171;
      __int16 v199 = 2112;
      v200 = v170;
      __int16 v201 = 2112;
      v202 = v49;
      _os_log_impl(&dword_252495000, v47, OS_LOG_TYPE_INFO, "%{public}@vendorID = %@, productID = %@, category = %@, configNumber = %@, nodeID = %@", buf, 0x3Eu);
    }
    id v50 = (void *)MEMORY[0x2533B64D0]();
    id v51 = v46;
    id v52 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
    {
      id v53 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v192 = v53;
      _os_log_impl(&dword_252495000, v52, OS_LOG_TYPE_INFO, "%{public}@All parameters are not available", buf, 0xCu);
    }
  }
  BOOL v54 = [HMMTRAccessoryServerFactory alloc];
  id v55 = [(HAPAccessoryServerBrowser *)self keyStore];
  __int16 v56 = [(HMMTRAccessoryServerFactory *)v54 initWithKeystore:v55 browser:self];

  uint64_t v57 = [NSNumber numberWithUnsignedLongLong:v169];
  obuint64_t j = v26;
  int v58 = [(HMMTRAccessoryServerFactory *)v56 vendAccessoryServerWithNodeID:v57 setupCode:0 discriminator:0 category:v171 vendorID:v26 productID:v42 serialNumber:0 firmwareRevision:@"1.0.0"];

  if (!v58)
  {
    id v70 = (void *)MEMORY[0x2533B64D0]();
    __int16 v71 = self;
    uint64_t v72 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
    {
      uint64_t v73 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v192 = v73;
      __int16 v193 = 2048;
      unint64_t v194 = v169;
      _os_log_impl(&dword_252495000, v72, OS_LOG_TYPE_ERROR, "%{public}@Unable to recover stored accessory for NodeID %llu...skipping", buf, 0x16u);
    }
    id v74 = obj;
    if (v167)
    {
      [MEMORY[0x263F087E8] hapErrorWithCode:1];
      int v15 = 0;
      *id v167 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      int v15 = 0;
    }
    goto LABEL_91;
  }
  char v165 = v44;
  id v59 = (void *)MEMORY[0x2533B64D0](objc_msgSend(v58, "setConfigNumber:", objc_msgSend(v170, "integerValue")));
  char v60 = self;
  id v61 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
  {
    id v62 = HMFGetLogIdentifier();
    uint64_t v63 = [v58 configNumber];
    *(_DWORD *)buf = 138543618;
    v192 = v62;
    __int16 v193 = 2048;
    unint64_t v194 = v63;
    _os_log_impl(&dword_252495000, v61, OS_LOG_TYPE_DEBUG, "%{public}@Loading with config number %tu", buf, 0x16u);
  }
  id v174 = v42;

  v166 = v56;
  id v64 = v58;
  if (![v58 knownToSystemCommissioner])
  {
    __int16 v75 = [(HMMTRAccessoryServerBrowser *)v60 storage];
    __int16 v76 = [v75 fabricDataSource];
    __int16 v77 = [NSNumber numberWithUnsignedLongLong:v169];
    int v67 = [v76 storageDataSourceForDeviceWithNodeID:v77];

    objc_msgSend(v58, "setWedDevice:", objc_msgSend(v67, "wedSupport"));
    __int16 v78 = [v67 extendedMACAddress];
    [v58 setEMACAddress:v78];

    uint64_t v79 = [v67 supportedLinkLayerTypes];
    [v58 setSupportedLinkLayerTypes:v79];

    id v68 = [v67 softwareVersionNumber];
    if (v68)
    {
      __int16 v80 = (void *)MEMORY[0x2533B64D0]();
      SecKeyRef v81 = v60;
      __int16 v82 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v82, OS_LOG_TYPE_INFO))
      {
        uint64_t v83 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v192 = v83;
        __int16 v193 = 2112;
        unint64_t v194 = (unint64_t)v68;
        _os_log_impl(&dword_252495000, v82, OS_LOG_TYPE_INFO, "%{public}@Accessory software version number = %@", buf, 0x16u);
      }
      [v64 updateSoftwareVersion:v68];
      [v64 notifyMatterFirmwareRevisionNumberCharacteristicChanged];
    }
    goto LABEL_44;
  }
  if (isFeatureMatteriPhoneOnlyPairingControlEnabled())
  {
    id v65 = [(HMMTRAccessoryServerBrowser *)v60 storage];
    id v66 = [NSNumber numberWithUnsignedLongLong:v169];
    objc_msgSend(v58, "setWedDevice:", objc_msgSend(v65, "wedSupportedForSystemCommissionerFabricNode:", v66));

    int v67 = [(HMMTRAccessoryServerBrowser *)v60 storage];
    id v68 = [NSNumber numberWithUnsignedLongLong:v169];
    __int16 v69 = [v67 extendedMACAddressForSystemCommissionerFabricNode:v68];
    [v58 setEMACAddress:v69];

LABEL_44:
  }
  __int16 v84 = v64;
  id v85 = [v64 supportedLinkLayerTypes];
  [v85 unsignedIntValue];

  uint64_t v86 = [v64 supportedLinkLayerTypes];
  [v86 unsignedIntValue];

  v87 = [v64 supportedLinkLayerTypes];
  [v87 unsignedIntValue];

  v88 = (void *)MEMORY[0x2533B64D0]();
  v89 = v60;
  int v15 = v84;
  uint64_t v90 = v89;
  uint64_t v91 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v91, OS_LOG_TYPE_INFO))
  {
    v163 = HMFGetLogIdentifier();
    id v92 = [NSNumber numberWithUnsignedLongLong:v169];
    [v84 isWEDDevice];
    HMFBooleanToString();
    v93 = v164 = v88;
    id v94 = [v84 eMACAddress];
    v95 = [v84 supportedLinkLayerTypes];
    v96 = HMFBooleanToString();
    uint64_t v97 = HMFBooleanToString();
    uint64_t v98 = HMFBooleanToString();
    *(_DWORD *)buf = 138545154;
    v192 = v163;
    __int16 v193 = 2112;
    unint64_t v194 = (unint64_t)v92;
    __int16 v195 = 2112;
    v196 = v93;
    __int16 v197 = 2112;
    v198 = v94;
    __int16 v199 = 2112;
    v200 = v95;
    __int16 v201 = 2112;
    v202 = v96;
    __int16 v203 = 2112;
    v204 = v97;
    __int16 v205 = 2112;
    uint64_t v206 = v98;
    uint64_t v99 = (void *)v98;
    _os_log_impl(&dword_252495000, v91, OS_LOG_TYPE_INFO, "%{public}@nodeID: %@ WED: %@ eMAC: %@, supportedLinkLayerTypes: %@ [WiFi:%@, Ethernet:%@, Thread:%@]", buf, 0x52u);

    v88 = v164;
  }

  long long v187 = 0u;
  long long v188 = 0u;
  long long v185 = 0u;
  long long v186 = 0u;
  CFDictionaryRef v100 = [(HMMTRAccessoryServerBrowser *)v90 _allServers];
  uint64_t v101 = [v100 countByEnumeratingWithState:&v185 objects:v190 count:16];
  if (!v101)
  {
    char v107 = v165;
    id v74 = obj;
    goto LABEL_62;
  }
  uint64_t v102 = v101;
  __int16 v103 = v90;
  uint64_t v104 = *(void *)v186;
  while (2)
  {
    for (uint64_t i = 0; i != v102; ++i)
    {
      if (*(void *)v186 != v104) {
        objc_enumerationMutation(v100);
      }
      v106 = *(void **)(*((void *)&v185 + 1) + 8 * i);
      if ([v106 isEqual:v15])
      {
        uint64_t v90 = v103;
        if ([(HMMTRAccessoryServerBrowser *)v103 isCurrentDeviceMobileAndAllowedAccessoryControl])
        {
          if ([v106 delayDiscovery])
          {
            v108 = (void *)MEMORY[0x2533B64D0]();
            v109 = v103;
            v110 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v110, OS_LOG_TYPE_INFO))
            {
              id v111 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543874;
              v192 = v111;
              __int16 v193 = 2048;
              unint64_t v194 = v169;
              __int16 v195 = 2112;
              v196 = v106;
              _os_log_impl(&dword_252495000, v110, OS_LOG_TYPE_INFO, "%{public}@Found existing server for nodeID %llu in unpaired state, but discovery is delayed for server %@", buf, 0x20u);
            }
LABEL_90:

            int v15 = 0;
            id v74 = obj;
            BOOL v42 = v174;
            __int16 v56 = v166;
            goto LABEL_91;
          }
          if ([v106 pairedState] != 3)
          {
            CFDictionaryRef v158 = (void *)MEMORY[0x2533B64D0]();
            v159 = v103;
            id v160 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v160, OS_LOG_TYPE_INFO))
            {
              v161 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543874;
              v192 = v161;
              __int16 v193 = 2048;
              unint64_t v194 = v169;
              __int16 v195 = 2112;
              v196 = v15;
              _os_log_impl(&dword_252495000, v160, OS_LOG_TYPE_INFO, "%{public}@Found existing server for nodeID %llu in unpaired state, using it instead of new server = %@ ", buf, 0x20u);
            }
            id v162 = v106;

            int v15 = v162;
            char v107 = v165;
            id v74 = obj;
            goto LABEL_62;
          }
        }
        v153 = (void *)MEMORY[0x2533B64D0]();
        v154 = v103;
        uint64_t v155 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v155, OS_LOG_TYPE_ERROR))
        {
          v156 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v192 = v156;
          __int16 v193 = 2048;
          unint64_t v194 = v169;
          _os_log_impl(&dword_252495000, v155, OS_LOG_TYPE_ERROR, "%{public}@Found existing server for node %llu...skipping", buf, 0x16u);
        }
        if (v167)
        {
          *id v167 = [MEMORY[0x263F087E8] hapErrorWithCode:18];
        }
        goto LABEL_90;
      }
    }
    uint64_t v102 = [v100 countByEnumeratingWithState:&v185 objects:v190 count:16];
    if (v102) {
      continue;
    }
    break;
  }
  id v74 = obj;
  char v107 = v165;
  uint64_t v90 = v103;
LABEL_62:

  unint64_t v112 = v169;
  __int16 v56 = v166;
  if (v107)
  {
    v168 = v15;
    id v113 = v74;
    v114 = v90;
    v115 = [(HMMTRAccessoryServerBrowser *)v90 storage];
    uint64_t v116 = [v115 fabricDataSource];
    v117 = [NSNumber numberWithUnsignedLongLong:v169];
    id v118 = [v116 allStorageDataSourcesForDeviceWithNodeID:v117];

    long long v183 = 0u;
    long long v184 = 0u;
    long long v181 = 0u;
    long long v182 = 0u;
    id obja = v118;
    uint64_t v119 = [obja countByEnumeratingWithState:&v181 objects:v189 count:16];
    if (v119)
    {
      uint64_t v120 = v119;
      uint64_t v121 = *(void *)v182;
      do
      {
        for (uint64_t j = 0; j != v120; ++j)
        {
          if (*(void *)v182 != v121) {
            objc_enumerationMutation(obja);
          }
          v123 = *(void **)(*((void *)&v181 + 1) + 8 * j);
          v178[0] = MEMORY[0x263EF8330];
          v178[1] = 3221225472;
          v178[2] = __81__HMMTRAccessoryServerBrowser__createCHIPAccessoryForNodeID_ifPaired_fatalError___block_invoke;
          v178[3] = &unk_265376898;
          v178[4] = v114;
          id v124 = v113;
          id v179 = v124;
          id v180 = v174;
          [v123 updateVendorID:v124 productID:v180 completion:v178];
        }
        uint64_t v120 = [obja countByEnumeratingWithState:&v181 objects:v189 count:16];
      }
      while (v120);
    }

    id v74 = v113;
    int v15 = v168;
    unint64_t v112 = v169;
    __int16 v56 = v166;
    uint64_t v90 = v114;
  }
  [v15 setPairedState:3];
  if ([(HMMTRAccessoryServerBrowser *)v90 isSystemCommissionerMode])
  {
    uint64_t v125 = (void *)MEMORY[0x2533B64D0]();
    v126 = v90;
    uint64_t v127 = HMFGetOSLogHandle();
    BOOL v42 = v174;
    if (os_log_type_enabled(v127, OS_LOG_TYPE_INFO))
    {
      v128 = HMFGetLogIdentifier();
      [NSNumber numberWithUnsignedLongLong:v169];
      uint64_t v130 = v129 = v74;
      *(_DWORD *)buf = 138543874;
      v192 = v128;
      __int16 v193 = 2112;
      unint64_t v194 = (unint64_t)v15;
      __int16 v195 = 2112;
      v196 = v130;
      _os_log_impl(&dword_252495000, v127, OS_LOG_TYPE_INFO, "%{public}@Created %@ for System Commissioner Fabric Node %@", buf, 0x20u);

      id v74 = v129;
      __int16 v56 = v166;
    }
    id v131 = [(HMMTRAccessoryServerBrowser *)v126 systemCommissionerControllerWrapper];
    [v15 setControllerWrapper:v131];
  }
  else
  {
    v132 = [(HMMTRAccessoryServerBrowser *)v90 currentHomeFabricDeviceControllerWrapper];
    [v15 setControllerWrapper:v132];

    id v133 = [(HMMTRAccessoryServerBrowser *)v90 storage];
    v134 = [NSNumber numberWithUnsignedLongLong:v112];
    v135 = [v133 topologyForNode:v134];
    [v15 setTopology:v135];

    uint64_t v136 = [v15 topology];

    CFDictionaryRef v137 = v90;
    BOOL v42 = v174;
    if (!v136)
    {
      v138 = (void *)MEMORY[0x2533B64D0]();
      v139 = v137;
      id v140 = v137;
      v141 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v141, OS_LOG_TYPE_INFO))
      {
        v142 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v192 = v142;
        _os_log_impl(&dword_252495000, v141, OS_LOG_TYPE_INFO, "%{public}@Failed to fetch topology from storage. This would require rebuilding topology again from resident", buf, 0xCu);
      }
      CFDictionaryRef v137 = v139;
    }
    v143 = v15;
    v144 = v74;
    if ([(HMMTRAccessoryServerBrowser *)v137 isCurrentDevicePrimaryResident])
    {
      v177[0] = MEMORY[0x263EF8330];
      v177[1] = 3221225472;
      v177[2] = __81__HMMTRAccessoryServerBrowser__createCHIPAccessoryForNodeID_ifPaired_fatalError___block_invoke_310;
      v177[3] = &unk_265376E00;
      v177[4] = v137;
      [(HMMTRAccessoryServerBrowser *)v137 _updateAccessoryControlListForServer:v143 completion:v177];
    }
    v175[0] = MEMORY[0x263EF8330];
    v175[1] = 3221225472;
    v175[2] = __81__HMMTRAccessoryServerBrowser__createCHIPAccessoryForNodeID_ifPaired_fatalError___block_invoke_311;
    v175[3] = &unk_265378660;
    v175[4] = v137;
    id v145 = v143;
    id v176 = v145;
    v146 = (void *)MEMORY[0x2533B64D0]([v145 enumerateHAPServices:v175]);
    v147 = v137;
    v148 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v148, OS_LOG_TYPE_INFO))
    {
      v149 = HMFGetLogIdentifier();
      v150 = [v145 identifier];
      *(_DWORD *)buf = 138543618;
      v192 = v149;
      __int16 v193 = 2112;
      unint64_t v194 = (unint64_t)v150;
      _os_log_impl(&dword_252495000, v148, OS_LOG_TYPE_INFO, "%{public}@Adding previously paired server with Identifier %@", buf, 0x16u);

      __int16 v56 = v166;
    }

    v151 = v176;
    id v152 = v145;

    id v74 = v144;
    int v15 = v152;
  }
LABEL_91:

LABEL_92:
  return v15;
}

void __81__HMMTRAccessoryServerBrowser__createCHIPAccessoryForNodeID_ifPaired_fatalError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = (void *)MEMORY[0x2533B64D0]();
    id v5 = *(id *)(a1 + 32);
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = HMFGetLogIdentifier();
      uint64_t v8 = *(void *)(a1 + 40);
      uint64_t v9 = *(void *)(a1 + 48);
      int v10 = 138544386;
      os_log_type_t v11 = v7;
      __int16 v12 = 2080;
      uint64_t v13 = "-[HMMTRAccessoryServerBrowser _createCHIPAccessoryForNodeID:ifPaired:fatalError:]_block_invoke";
      __int16 v14 = 2112;
      uint64_t v15 = v8;
      __int16 v16 = 2112;
      uint64_t v17 = v9;
      __int16 v18 = 2112;
      id v19 = v3;
      _os_log_impl(&dword_252495000, v6, OS_LOG_TYPE_ERROR, "%{public}@%s: Failed to update vendorID to %@ and productID to %@ with error: %@", (uint8_t *)&v10, 0x34u);
    }
  }
}

void __81__HMMTRAccessoryServerBrowser__createCHIPAccessoryForNodeID_ifPaired_fatalError___block_invoke_310(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = (void *)MEMORY[0x2533B64D0]();
    id v5 = *(id *)(a1 + 32);
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = HMFGetLogIdentifier();
      int v8 = 138543618;
      uint64_t v9 = v7;
      __int16 v10 = 2112;
      id v11 = v3;
      _os_log_impl(&dword_252495000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to update ACL on accessory with error %@", (uint8_t *)&v8, 0x16u);
    }
  }
}

void __81__HMMTRAccessoryServerBrowser__createCHIPAccessoryForNodeID_ifPaired_fatalError___block_invoke_311(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x2533B64D0]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    uint64_t v8 = *(void *)(a1 + 40);
    int v13 = 138543874;
    __int16 v14 = v7;
    __int16 v15 = 2112;
    uint64_t v16 = v8;
    __int16 v17 = 2112;
    id v18 = v3;
    _os_log_impl(&dword_252495000, v6, OS_LOG_TYPE_INFO, "%{public}@Enumerated HAP Services for server :%@ with Error: %@", (uint8_t *)&v13, 0x20u);
  }
  if ((_os_feature_enabled_impl() & 1) != 0
    || CFPreferencesGetAppBooleanValue(@"MatterOTA", @"/Library/Managed Preferences/mobile/com.apple.homed.plist", 0))
  {
    uint64_t v9 = (void *)MEMORY[0x2533B64D0]();
    id v10 = *(id *)(a1 + 32);
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = HMFGetLogIdentifier();
      int v13 = 138543362;
      __int16 v14 = v12;
      _os_log_impl(&dword_252495000, v11, OS_LOG_TYPE_INFO, "%{public}@Not sending an OTA announcement or setting this device as a OTA provider", (uint8_t *)&v13, 0xCu);
    }
  }
}

- (id)_createCHIPAccessoryForNodeID:(unint64_t)a3
{
  return [(HMMTRAccessoryServerBrowser *)self _createCHIPAccessoryForNodeID:a3 ifPaired:1 fatalError:0];
}

- (void)_reenumeratePairedDevices
{
  uint64_t v2 = self;
  uint64_t v27 = *MEMORY[0x263EF8340];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v3 = self->_discoveredAccessoryServers;
  uint64_t v4 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)v19;
    *(void *)&long long v5 = 138543618;
    long long v16 = v5;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if ((objc_msgSend(v9, "removalInProgress", v16) & 1) == 0)
        {
          id v10 = (void *)MEMORY[0x2533B64D0]();
          id v11 = v2;
          uint64_t v12 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            int v13 = v3;
            v15 = __int16 v14 = v2;
            *(_DWORD *)buf = v16;
            id v23 = v15;
            __int16 v24 = 2112;
            id v25 = v9;
            _os_log_impl(&dword_252495000, v12, OS_LOG_TYPE_INFO, "%{public}@Re-enumerating server %@", buf, 0x16u);

            uint64_t v2 = v14;
            id v3 = v13;
          }

          v17[0] = MEMORY[0x263EF8330];
          v17[1] = 3221225472;
          v17[2] = __56__HMMTRAccessoryServerBrowser__reenumeratePairedDevices__block_invoke;
          v17[3] = &unk_265378660;
          void v17[4] = v11;
          void v17[5] = v9;
          [v9 enumerateHAPServices:v17];
        }
      }
      uint64_t v6 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v6);
  }
}

void __56__HMMTRAccessoryServerBrowser__reenumeratePairedDevices__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = (void *)MEMORY[0x2533B64D0]();
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v7 = HMFGetLogIdentifier();
    uint64_t v8 = *(void *)(a1 + 40);
    int v9 = 138543874;
    id v10 = v7;
    __int16 v11 = 2112;
    uint64_t v12 = v8;
    __int16 v13 = 2112;
    id v14 = v3;
    _os_log_impl(&dword_252495000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Re-enumeration completed for server %@, error: %@", (uint8_t *)&v9, 0x20u);
  }
}

- (void)_setupPairedDevices
{
  uint64_t v70 = *MEMORY[0x263EF8340];
  if (![(HMMTRAccessoryServerBrowser *)self isCurrentDevicePrimaryResident]
    && ![(HMMTRAccessoryServerBrowser *)self isCurrentDeviceMobileAndAllowedAccessoryControl])
  {
    int v46 = (void *)MEMORY[0x2533B64D0]();
    uint64_t v47 = self;
    long long v48 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
    {
      id v49 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v66 = v49;
      id v50 = "%{public}@Not the primary Resident, not restoring previously paired accessories...";
      goto LABEL_44;
    }
LABEL_45:

    id v33 = [(HMMTRAccessoryServerBrowser *)v47 nodesAddedToHome];
    [v33 removeAllObjects];
    goto LABEL_46;
  }
  id v3 = [(HMMTRAccessoryServerBrowser *)self nodesAddedToHome];
  if ([v3 count])
  {
    uint64_t v4 = [(HMMTRAccessoryServerBrowser *)self controllerFactoryEnablePerPrimaryResidentConfirmationToken];

    if (v4)
    {
      id v5 = (void *)MEMORY[0x2533B64D0]();
      uint64_t v6 = self;
      uint64_t v7 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        uint64_t v8 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        id v66 = v8;
        _os_log_impl(&dword_252495000, v7, OS_LOG_TYPE_INFO, "%{public}@Voting to enable controller factory when setting up paired devices", buf, 0xCu);
      }
      int v9 = [(HMMTRAccessoryServerBrowser *)v6 controllerFactory];
      id v10 = [(HMMTRAccessoryServerBrowser *)v6 controllerFactoryEnablePerPrimaryResidentConfirmationToken];
      [v9 enableNormalOperationWithToken:v10];

      [(HMMTRAccessoryServerBrowser *)v6 setControllerFactoryEnablePerPrimaryResidentConfirmationToken:0];
    }
  }
  else
  {
  }
  __int16 v11 = [(HMMTRAccessoryServerBrowser *)self deviceController];
  char v12 = [v11 isRunning];

  if ((v12 & 1) == 0)
  {
    int v46 = (void *)MEMORY[0x2533B64D0]();
    uint64_t v47 = self;
    long long v48 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
    {
      id v49 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v66 = v49;
      id v50 = "%{public}@CHIP Controller hasn't been setup, maybe storage isn't available yet?";
LABEL_44:
      _os_log_impl(&dword_252495000, v48, OS_LOG_TYPE_INFO, v50, buf, 0xCu);

      goto LABEL_45;
    }
    goto LABEL_45;
  }
  if ([(HMMTRAccessoryServerBrowser *)self isCurrentDeviceMobileAndAllowedAccessoryControl]&& ![(HMMTRAccessoryServerBrowser *)self isSystemCommissionerMode])
  {
    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    __int16 v13 = [(HMMTRAccessoryServerBrowser *)self storage];
    id v14 = [v13 fabricDataSource];
    uint64_t v15 = [v14 allNodeIDs];

    uint64_t v16 = [v15 countByEnumeratingWithState:&v60 objects:v69 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v61;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v61 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = *(void *)(*((void *)&v60 + 1) + 8 * i);
          if (v20)
          {
            if (([*(id *)(*((void *)&v60 + 1) + 8 * i) isEqual:&unk_2702B5820] & 1) == 0)
            {
              long long v21 = [(HMMTRAccessoryServerBrowser *)self accessoryServerWithNodeID:v20];

              if (!v21)
              {
                __int16 v22 = [(HMMTRAccessoryServerBrowser *)self nodesAddedToHome];
                [v22 addObject:v20];
              }
            }
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v60 objects:v69 count:16];
      }
      while (v17);
    }
  }
  id v23 = (void *)MEMORY[0x2533B64D0]();
  __int16 v24 = self;
  id v25 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    id v26 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v66 = v26;
    _os_log_impl(&dword_252495000, v25, OS_LOG_TYPE_INFO, "%{public}@Checking for new devices in storage...", buf, 0xCu);
  }
  uint64_t v27 = [(HMMTRAccessoryServerBrowser *)v24 nodesAddedToHome];
  __int16 v28 = (void *)[v27 copy];

  long long v29 = (void *)MEMORY[0x2533B64D0]();
  uint64_t v30 = v24;
  long long v31 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
  {
    long long v32 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v66 = v32;
    __int16 v67 = 2112;
    id v68 = v28;
    _os_log_impl(&dword_252495000, v31, OS_LOG_TYPE_INFO, "%{public}@Looking through all paired NodeIDs: %@", buf, 0x16u);
  }
  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id v33 = v28;
  uint64_t v54 = [v33 countByEnumeratingWithState:&v56 objects:v64 count:16];
  if (v54)
  {
    uint64_t v53 = *(void *)v57;
    *(void *)&long long v34 = 138543618;
    long long v51 = v34;
    obuint64_t j = v33;
    do
    {
      for (uint64_t j = 0; j != v54; ++j)
      {
        if (*(void *)v57 != v53) {
          objc_enumerationMutation(obj);
        }
        uint64_t v36 = *(void **)(*((void *)&v56 + 1) + 8 * j);
        id v37 = (void *)MEMORY[0x2533B64D0]();
        uint64_t v38 = [v36 unsignedLongLongValue];
        id v55 = 0;
        __int16 v39 = [(HMMTRAccessoryServerBrowser *)v30 _createCHIPAccessoryForNodeID:v38 ifPaired:0 fatalError:&v55];
        id v40 = v55;
        if (v39)
        {
          uint64_t v41 = (void *)MEMORY[0x2533B64D0]();
          BOOL v42 = v30;
          BOOL v43 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
          {
            char v44 = HMFGetLogIdentifier();
            *(_DWORD *)buf = v51;
            id v66 = v44;
            __int16 v67 = 2112;
            id v68 = v36;
            _os_log_impl(&dword_252495000, v43, OS_LOG_TYPE_INFO, "%{public}@Found new device(%@) in storage...", buf, 0x16u);
          }
          [v42[7] addObject:v39];
        }
        __int16 v45 = [(HMMTRAccessoryServerBrowser *)v30 nodesAddedToHome];
        [v45 removeObject:v36];
      }
      id v33 = obj;
      uint64_t v54 = [obj countByEnumeratingWithState:&v56 objects:v64 count:16];
    }
    while (v54);
  }

LABEL_46:
}

- (void)setupPairedDevices
{
  id v3 = [(HAPAccessoryServerBrowser *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__HMMTRAccessoryServerBrowser_setupPairedDevices__block_invoke;
  block[3] = &unk_265378638;
  void block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __49__HMMTRAccessoryServerBrowser_setupPairedDevices__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setupPairedDevices];
}

- (BOOL)_isNodeIDPaired:(id)a3 fabricID:(id *)a4
{
  id v6 = a3;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  uint64_t v7 = [(HMMTRAccessoryServerBrowser *)self storage];
  uint64_t v8 = [v7 dataSource];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __56__HMMTRAccessoryServerBrowser__isNodeIDPaired_fabricID___block_invoke;
  v11[3] = &unk_265376910;
  id v9 = v6;
  id v12 = v9;
  __int16 v13 = &v15;
  id v14 = a4;
  [v8 forAllStorageDataSourcesDo:v11];

  LOBYTE(a4) = *((unsigned char *)v16 + 24);
  _Block_object_dispose(&v15, 8);

  return (char)a4;
}

uint64_t __56__HMMTRAccessoryServerBrowser__isNodeIDPaired_fabricID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 allNodeIDs];
  int v5 = [v4 containsObject:*(void *)(a1 + 32)];
  if (v5)
  {
    **(void **)(a1 + 48) = [v3 fabricID];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }

  return v5 ^ 1u;
}

- (BOOL)_isDeviceIDPaired:(id)a3 nodeID:(id *)a4 fabricID:(id *)a5
{
  id v8 = a3;
  uint64_t v18 = 0;
  long long v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  id v9 = [(HMMTRAccessoryServerBrowser *)self storage];
  id v10 = [v9 dataSource];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __65__HMMTRAccessoryServerBrowser__isDeviceIDPaired_nodeID_fabricID___block_invoke;
  v13[3] = &unk_2653768E8;
  id v11 = v8;
  uint64_t v16 = a4;
  uint64_t v17 = a5;
  id v14 = v11;
  uint64_t v15 = &v18;
  [v10 forAllStorageDataSourcesDo:v13];

  LOBYTE(a5) = *((unsigned char *)v19 + 24);
  _Block_object_dispose(&v18, 8);

  return (char)a5;
}

uint64_t __65__HMMTRAccessoryServerBrowser__isDeviceIDPaired_nodeID_fabricID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  [v3 allNodeIDs];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v10 = *(void **)(a1 + 32);
        id v11 = +[HMMTRUtilities identifierStringWithCHIPNodeID:](HMMTRUtilities, "identifierStringWithCHIPNodeID:", v9, (void)v14);
        LODWORD(v10) = [v10 hasPrefix:v11];

        if (v10)
        {
          **(void **)(a1 + 48) = v9;
          [v3 fabricID];
          uint64_t v12 = 0;
          **(void **)(a1 + 56) = (id)objc_claimAutoreleasedReturnValue();
          *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  uint64_t v12 = 1;
LABEL_11:

  return v12;
}

- (BOOL)_isDevicePaired:(unint64_t)a3
{
  uint64_t v5 = [(HMMTRAccessoryServerBrowser *)self storage];
  uint64_t v6 = [v5 fabricDataSource];
  uint64_t v7 = [v6 allNodeIDs];

  id v8 = [(HMMTRAccessoryServerBrowser *)self storage];
  char v9 = 1;
  id v10 = [v8 pairedNodeIDsOnSystemCommissionerFabric:1];

  id v11 = [NSNumber numberWithUnsignedLongLong:a3];
  if (([v7 containsObject:v11] & 1) == 0)
  {
    uint64_t v12 = [NSNumber numberWithUnsignedLongLong:a3];
    char v9 = [v10 containsObject:v12];
  }
  return v9;
}

- (void)_cleanupStagedServers
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x2533B64D0](self, a2);
  id v4 = self;
  uint64_t v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v10 = v6;
    _os_log_impl(&dword_252495000, v5, OS_LOG_TYPE_INFO, "%{public}@Deleting staged accessory pairings", buf, 0xCu);
  }
  uint64_t v7 = [(HAPAccessoryServerBrowser *)v4 workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__HMMTRAccessoryServerBrowser__cleanupStagedServers__block_invoke;
  block[3] = &unk_265378638;
  void block[4] = v4;
  dispatch_async(v7, block);
}

void __52__HMMTRAccessoryServerBrowser__cleanupStagedServers__block_invoke(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) storage];
  id v3 = [v2 pairedNodeIDs];

  __int16 v24 = [MEMORY[0x263EFF980] array];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v28;
    id v23 = v26;
    *(void *)&long long v6 = 138543618;
    long long v22 = v6;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v28 != v8) {
          objc_enumerationMutation(v4);
        }
        id v10 = *(void **)(*((void *)&v27 + 1) + 8 * v9);
        uint64_t v11 = objc_msgSend(*(id *)(a1 + 32), "storage", v22, v23);
        int v12 = [v11 isStagedForNode:v10];

        if (v12)
        {
          __int16 v13 = (void *)MEMORY[0x2533B64D0]();
          id v14 = *(id *)(a1 + 32);
          long long v15 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            long long v16 = HMFGetLogIdentifier();
            *(_DWORD *)buf = v22;
            long long v32 = v16;
            __int16 v33 = 2112;
            long long v34 = v10;
            _os_log_impl(&dword_252495000, v15, OS_LOG_TYPE_INFO, "%{public}@Deleting staged accessory for nodeID %@...", buf, 0x16u);
          }
          long long v17 = [*(id *)(a1 + 32) deviceController];
          uint64_t v18 = [v10 unsignedLongLongValue];
          uint64_t v19 = [*(id *)(a1 + 32) workQueue];
          v25[0] = MEMORY[0x263EF8330];
          v25[1] = 3221225472;
          v26[0] = __52__HMMTRAccessoryServerBrowser__cleanupStagedServers__block_invoke_306;
          v26[1] = &unk_2653768C0;
          v26[2] = *(void *)(a1 + 32);
          v26[3] = v10;
          [v17 getBaseDevice:v18 queue:v19 completionHandler:v25];

          [v24 addObject:v10];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v4 countByEnumeratingWithState:&v27 objects:v35 count:16];
    }
    while (v7);
  }

  uint64_t v20 = [*(id *)(a1 + 32) storage];
  char v21 = [*(id *)(a1 + 32) storage];
  objc_msgSend(v20, "removeRecordsForNodeIDs:systemCommissionerFabric:", v24, objc_msgSend(v21, "isSystemCommissionerFabric"));
}

void __52__HMMTRAccessoryServerBrowser__cleanupStagedServers__block_invoke_306(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = (void *)MEMORY[0x2533B64D0]();
    id v8 = *(id *)(a1 + 32);
    uint64_t v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = HMFGetLogIdentifier();
      uint64_t v11 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      long long v17 = v10;
      __int16 v18 = 2112;
      uint64_t v19 = v11;
      _os_log_impl(&dword_252495000, v9, OS_LOG_TYPE_ERROR, "%{public}@Unable to get connected device(%@), cleaning up locally", buf, 0x16u);
    }
  }
  else
  {
    int v12 = [*(id *)(a1 + 32) workQueue];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __52__HMMTRAccessoryServerBrowser__cleanupStagedServers__block_invoke_307;
    v13[3] = &unk_265376898;
    long long v14 = *(_OWORD *)(a1 + 32);
    id v15 = 0;
    [v5 unpairDevice:v12 completionHandler:v13];
  }
}

void __52__HMMTRAccessoryServerBrowser__cleanupStagedServers__block_invoke_307(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x2533B64D0]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    uint64_t v7 = HMFGetLogIdentifier();
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 48);
    int v10 = 138543874;
    uint64_t v11 = v7;
    __int16 v12 = 2112;
    uint64_t v13 = v8;
    __int16 v14 = 2112;
    uint64_t v15 = v9;
    _os_log_impl(&dword_252495000, v6, OS_LOG_TYPE_ERROR, "%{public}@Notified device(%@) of removal, cleaning up locally. Error: %@", (uint8_t *)&v10, 0x20u);
  }
}

- (NSNumber)systemCommissionerFabricID
{
  uint64_t v2 = [(HMMTRAccessoryServerBrowser *)self systemCommissionerControllerWrapper];
  id v3 = [v2 startupParams];
  id v4 = [v3 fabricID];

  return (NSNumber *)v4;
}

- (HMMTRMatterKeypair)systemCommissionerNocSigner
{
  id v3 = [(HMMTRAccessoryServerBrowser *)self systemCommissionerControllerParams];
  id v10 = 0;
  id v11 = 0;
  int v4 = [v3 fetchControllerParamsAllowingNew:0 nocSigner:&v11 controllerWrapper:&v10];
  id v5 = v11;
  id v6 = v10;

  id v7 = 0;
  if (v4)
  {
    uint64_t v8 = [(HMMTRAccessoryServerBrowser *)self storage];
    [v8 setSystemCommissionerNocSigner:v5];

    id v7 = v5;
  }

  return (HMMTRMatterKeypair *)v7;
}

- (HMMTRControllerWrapper)systemCommissionerControllerWrapper
{
  id v3 = [(HMMTRAccessoryServerBrowser *)self systemCommissionerControllerParams];
  id v10 = 0;
  id v11 = 0;
  int v4 = [v3 fetchControllerParamsAllowingNew:0 nocSigner:&v11 controllerWrapper:&v10];
  id v5 = v11;
  id v6 = v10;

  id v7 = 0;
  if (v4)
  {
    uint64_t v8 = [(HMMTRAccessoryServerBrowser *)self storage];
    [v8 setSystemCommissionerNocSigner:v5];

    id v7 = v6;
  }

  return (HMMTRControllerWrapper *)v7;
}

- (void)waitForDeviceControllerWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(HAPAccessoryServerBrowser *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __69__HMMTRAccessoryServerBrowser_waitForDeviceControllerWithCompletion___block_invoke;
  v7[3] = &unk_2653770F0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __69__HMMTRAccessoryServerBrowser_waitForDeviceControllerWithCompletion___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isSystemCommissionerMode] & 1) != 0
    || ([*(id *)(a1 + 32) storage],
        uint64_t v2 = objc_claimAutoreleasedReturnValue(),
        [v2 fabricID],
        id v8 = (id)objc_claimAutoreleasedReturnValue(),
        v2,
        !v8))
  {
    id v4 = 0;
    id v8 = 0;
  }
  else
  {
    id v3 = [*(id *)(a1 + 32) homeFabricControllers];
    id v4 = [v3 cachedWrapperWithFabricID:v8];
  }
  id v5 = [v4 controller];
  if ([v5 isRunning])
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v6 = [*(id *)(a1 + 32) deviceControllerHandlers];
    id v7 = (void *)MEMORY[0x2533B66E0](*(void *)(a1 + 40));
    [v6 addObject:v7];
  }
}

- (MTRDeviceController)deviceController
{
  if ([(HMMTRAccessoryServerBrowser *)self isSystemCommissionerMode])
  {
    id v3 = [(HMMTRAccessoryServerBrowser *)self systemCommissionerControllerWrapper];
    id v4 = [v3 controller];
  }
  else
  {
    uint64_t v5 = [(HMMTRAccessoryServerBrowser *)self _currentHomeFabricDeviceController];
    if (v5)
    {
      id v6 = (void *)v5;
      id v7 = [(HAPAccessoryServerBrowser *)self workQueue];
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __47__HMMTRAccessoryServerBrowser_deviceController__block_invoke;
      v9[3] = &unk_265376E98;
      v9[4] = self;
      id v4 = v6;
      id v10 = v4;
      dispatch_async(v7, v9);
    }
    else
    {
      id v4 = 0;
    }
  }
  return (MTRDeviceController *)v4;
}

void __47__HMMTRAccessoryServerBrowser_deviceController__block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) deviceControllerHandlers];
  id v3 = (void *)[v2 copy];

  id v4 = [*(id *)(a1 + 32) deviceControllerHandlers];
  [v4 removeAllObjects];

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v10 + 1) + 8 * v9) + 16))(*(void *)(*((void *)&v10 + 1) + 8 * v9));
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (id)_currentHomeFabricDeviceController
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v3 = [(HMMTRAccessoryServerBrowser *)self storage];
  id v4 = [v3 fabricID];

  if (v4)
  {
    id v5 = [(HMMTRAccessoryServerBrowser *)self _currentHomeFabricDeviceControllerStartupParams];
    if (v5)
    {
      uint64_t v6 = [(HMMTRAccessoryServerBrowser *)self storage];
      uint64_t v7 = [v6 fabricID];
      uint64_t v8 = [(HMMTRAccessoryServerBrowser *)self appleHomeFabricWithID:v7];
      uint64_t v9 = [v8 controllerEntityIdentifier];

      long long v10 = [(HMMTRAccessoryServerBrowser *)self storage];
      long long v11 = [v10 fabricID];
      long long v12 = [(HMMTRAccessoryServerBrowser *)self appleHomeFabricWithID:v11];
      long long v13 = [v12 targetFabricUUID];

      if (v13) {
        goto LABEL_5;
      }
      __int16 v14 = [(HMMTRAccessoryServerBrowser *)self storage];
      uint64_t v15 = [v14 fabricID];
      long long v13 = [(HMMTRAccessoryServerBrowser *)self appleHomeTargetFabricUUIDWithID:v15];

      if (v13)
      {
LABEL_5:
        uint64_t v16 = [(HMMTRAccessoryServerBrowser *)self homeFabricControllers];
        long long v17 = [(HMMTRAccessoryServerBrowser *)self storage];
        __int16 v18 = [v17 fabricID];
        uint64_t v19 = [v16 cachedWrapperWithFabricID:v18];

        uint64_t v20 = [(HMMTRAccessoryServerBrowser *)self homeFabricControllers];
        char v21 = [(HMMTRAccessoryServerBrowser *)self storage];
        long long v22 = [v21 dataSource];
        id v23 = [v22 allTargetFabricUUIDs];
        __int16 v24 = [v20 wrapperWithTargetFabricUUID:v13 startupParams:v5 allTargetFabricUUIDs:v23 entityIdentifier:v9];

        if (v19 != v24) {
          [v19 remove];
        }
        id v25 = [v24 controller];
      }
      else
      {
        long long v27 = (void *)MEMORY[0x2533B64D0]();
        long long v28 = self;
        long long v29 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          long long v30 = HMFGetLogIdentifier();
          long long v31 = [(HMMTRAccessoryServerBrowser *)v28 storage];
          long long v32 = [v31 fabricID];
          int v33 = 138543618;
          long long v34 = v30;
          __int16 v35 = 2112;
          uint64_t v36 = v32;
          _os_log_impl(&dword_252495000, v29, OS_LOG_TYPE_INFO, "%{public}@Cannot retrieve current home fabric device controller because of missing target fabric for fabric ID %@", (uint8_t *)&v33, 0x16u);
        }
        id v25 = 0;
      }
    }
    else
    {
      id v25 = 0;
    }
  }
  else
  {
    id v25 = 0;
  }
  return v25;
}

- (id)currentHomeFabricDeviceControllerWrapper
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v3 = [(HMMTRAccessoryServerBrowser *)self storage];
  id v4 = [v3 fabricID];

  if (v4)
  {
    id v5 = [(HMMTRAccessoryServerBrowser *)self _currentHomeFabricDeviceControllerStartupParams];
    if (v5)
    {
      uint64_t v6 = [(HMMTRAccessoryServerBrowser *)self storage];
      uint64_t v7 = [v6 fabricID];
      uint64_t v8 = [(HMMTRAccessoryServerBrowser *)self appleHomeFabricWithID:v7];
      uint64_t v9 = [v8 controllerEntityIdentifier];

      long long v10 = [(HMMTRAccessoryServerBrowser *)self storage];
      long long v11 = [v10 fabricID];
      long long v12 = [(HMMTRAccessoryServerBrowser *)self appleHomeFabricWithID:v11];
      long long v13 = [v12 targetFabricUUID];

      if (v13) {
        goto LABEL_5;
      }
      __int16 v14 = [(HMMTRAccessoryServerBrowser *)self storage];
      uint64_t v15 = [v14 fabricID];
      long long v13 = [(HMMTRAccessoryServerBrowser *)self appleHomeTargetFabricUUIDWithID:v15];

      if (v13)
      {
LABEL_5:
        uint64_t v16 = [(HMMTRAccessoryServerBrowser *)self homeFabricControllers];
        long long v17 = [(HMMTRAccessoryServerBrowser *)self storage];
        __int16 v18 = [v17 fabricID];
        uint64_t v19 = [v16 cachedWrapperWithFabricID:v18];

        uint64_t v20 = [(HMMTRAccessoryServerBrowser *)self homeFabricControllers];
        char v21 = [(HMMTRAccessoryServerBrowser *)self storage];
        long long v22 = [v21 dataSource];
        id v23 = [v22 allTargetFabricUUIDs];
        __int16 v24 = [v20 wrapperWithTargetFabricUUID:v13 startupParams:v5 allTargetFabricUUIDs:v23 entityIdentifier:v9];

        if (v19 != v24) {
          [v19 remove];
        }
      }
      else
      {
        id v26 = (void *)MEMORY[0x2533B64D0]();
        long long v27 = self;
        long long v28 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          long long v29 = HMFGetLogIdentifier();
          long long v30 = [(HMMTRAccessoryServerBrowser *)v27 storage];
          long long v31 = [v30 fabricID];
          int v32 = 138543618;
          int v33 = v29;
          __int16 v34 = 2112;
          __int16 v35 = v31;
          _os_log_impl(&dword_252495000, v28, OS_LOG_TYPE_INFO, "%{public}@Cannot retrieve current home fabric device controller wrapper because of missing target fabric for fabric ID %@", (uint8_t *)&v32, 0x16u);
        }
        __int16 v24 = 0;
      }
    }
    else
    {
      __int16 v24 = 0;
    }
  }
  else
  {
    __int16 v24 = 0;
  }
  return v24;
}

- (id)_currentHomeFabricDeviceControllerStartupParams2
{
  uint64_t v103 = *MEMORY[0x263EF8340];
  id v3 = [(HMMTRAccessoryServerBrowser *)self storage];
  id v4 = [v3 rootCertForCurrentFabric];

  id v5 = [(HMMTRAccessoryServerBrowser *)self storage];
  uint64_t v6 = [v5 operationalCertForCurrentFabric];

  uint64_t v7 = [(HMMTRAccessoryServerBrowser *)self ownerSharedOperationalKeyPair];
  uint64_t v8 = [(HMMTRAccessoryServerBrowser *)self ownerLocalOperationalKeyPair];
  uint64_t v90 = v8;
  if (![(HMMTRAccessoryServerBrowser *)self isCurrentDevicePrimaryResident]
    && v8
    && [MEMORY[0x263F10CC0] keypair:v8 matchesCertificate:v6])
  {
    id v9 = v8;

    uint64_t v7 = v9;
  }
  dispatch_queue_t v10 = dispatch_queue_create("HMMTRPerControllerStorage queue", 0);
  long long v11 = [HMMTRPerControllerStorage alloc];
  long long v12 = [(HMMTRAccessoryServerBrowser *)self storage];
  long long v13 = [v12 fabricID];
  __int16 v14 = [(HMMTRAccessoryServerBrowser *)self appleHomeFabricWithID:v13];
  uint64_t v15 = [(HMMTRPerControllerStorage *)v11 initWithQueue:v10 fabric:v14];

  uint64_t v16 = [(HMMTRAccessoryServerBrowser *)self storage];
  uint64_t v17 = [v16 ipkForCurrentFabric];

  __int16 v18 = [HMMTRControllerParameters alloc];
  uint64_t v19 = [MEMORY[0x263F08C38] UUID];
  dispatch_queue_t v88 = v10;
  v89 = (void *)v6;
  uint64_t v86 = (void *)v17;
  v87 = (void *)v15;
  uint64_t v20 = [(HMMTRControllerParameters *)v18 initWithStorageDelegate:v15 storageDelegateQueue:v10 uniqueIdentifier:v19 ipk:v17 vendorID:&unk_2702B5838 operationalKeypair:v7 operationalCertificate:v6 intermediateCertificate:0 rootCertificate:v4];

  char v21 = [(HMMTRAccessoryServerBrowser *)self storage];
  if ([v21 isSharedAdmin])
  {
    BOOL v22 = 1;
  }
  else
  {
    id v23 = [(HMMTRAccessoryServerBrowser *)self nocSigner];
    BOOL v22 = v23 == 0;
  }
  if (![(HMMTRAccessoryServerBrowser *)self isCurrentDevicePrimaryResident] && v22)
  {

    id v4 = 0;
  }
  __int16 v24 = [HMMTROperationalCertificateIssuer alloc];
  id v25 = [(HAPAccessoryServerBrowser *)self workQueue];
  id v26 = [(HMMTROperationalCertificateIssuer *)v24 initWithQueue:v25 rootCertificate:v4 browser:self];
  [(HMMTRControllerParameters *)v20 setOperationalCertificateIssuer:v26];

  long long v27 = [(HAPAccessoryServerBrowser *)self workQueue];
  [(HMMTRControllerParameters *)v20 setOperationalCertificateIssuerQueue:v27];

  long long v28 = [(HMMTRAccessoryServerBrowser *)self otaProviderDelegate];
  [(HMMTRControllerParameters *)v20 setOtaProviderDelegate:v28];

  long long v29 = [(HAPAccessoryServerBrowser *)self workQueue];
  [(HMMTRControllerParameters *)v20 setOtaProviderDelegateQueue:v29];

  long long v30 = [(HMMTRAccessoryServerBrowser *)self attestationDataStore];
  long long v31 = [v30 cdCertificates];
  [(HMMTRControllerParameters *)v20 setCertificationDeclarationCertificates:v31];

  int v32 = [(HMMTRAccessoryServerBrowser *)self attestationDataStore];
  int v33 = [v32 paaCertificates];
  [(HMMTRControllerParameters *)v20 setProductAttestationAuthorityCertificates:v33];

  if ((_os_feature_enabled_impl() & 1) != 0 || HM_FEATURE_RVC_DEFAULTS_ENABLED()) {
    [(HMMTRControllerParameters *)v20 setStartSuspended:1];
  }
  __int16 v34 = [MEMORY[0x263F42620] productInfo];
  uint64_t v35 = [v34 productPlatform];

  if (v35 == 4)
  {
    uint64_t v36 = (void *)MEMORY[0x2533B64D0]([(HMMTRControllerParameters *)v20 setShouldAdvertiseOperational:1]);
    uint64_t v37 = self;
    uint64_t v38 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    {
      __int16 v39 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v92 = v39;
      _os_log_impl(&dword_252495000, v38, OS_LOG_TYPE_INFO, "%{public}@Requesting operational discovery for current controller node", buf, 0xCu);
    }
  }
  id v40 = v7;
  uint64_t v41 = (void *)MEMORY[0x2533B64D0]();
  BOOL v42 = self;
  BOOL v43 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
  {
    char v44 = HMFGetLogIdentifier();
    __int16 v45 = [(HMMTRControllerParameters *)v20 rootCertificate];
    int v46 = [(HMMTRControllerParameters *)v20 operationalCertificate];
    uint64_t v47 = [(HMMTRControllerParameters *)v20 uniqueIdentifier];
    long long v48 = (void *)v47;
    *(_DWORD *)buf = 138544642;
    id v49 = "shared";
    id v92 = v44;
    id v50 = "local";
    if (v40 == v90) {
      id v49 = "local";
    }
    if (!v4) {
      id v50 = "remote";
    }
    __int16 v93 = 2112;
    id v94 = v45;
    __int16 v95 = 2112;
    v96 = v46;
    __int16 v97 = 2112;
    uint64_t v98 = v47;
    __int16 v99 = 2080;
    CFDictionaryRef v100 = v49;
    __int16 v101 = 2080;
    uint64_t v102 = v50;
    _os_log_impl(&dword_252495000, v43, OS_LOG_TYPE_INFO, "%{public}@Setting root and operational cert in start up params %@ %@ for current home controller with UUID %@ using %s operational key and %s NOC issuer", buf, 0x3Eu);
  }
  uint64_t v51 = [(HMMTRControllerParameters *)v20 rootCertificate];
  if (v51
    && (id v52 = (void *)v51,
        [(HMMTRControllerParameters *)v20 operationalCertificate],
        uint64_t v53 = objc_claimAutoreleasedReturnValue(),
        v53,
        v52,
        v53))
  {
    uint64_t v54 = (void *)MEMORY[0x2533B64D0]();
    id v55 = v42;
    long long v56 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
    {
      long long v57 = HMFGetLogIdentifier();
      long long v58 = (void *)MEMORY[0x263F10CC0];
      long long v59 = [(HMMTRControllerParameters *)v20 rootCertificate];
      long long v60 = [v58 shortDescriptionForX509Certificate:v59];
      *(_DWORD *)buf = 138543618;
      id v92 = v57;
      __int16 v93 = 2112;
      id v94 = v60;
      _os_log_impl(&dword_252495000, v56, OS_LOG_TYPE_INFO, "%{public}@Controller Root certificate: %@", buf, 0x16u);
    }
    long long v61 = (void *)MEMORY[0x263F10CC0];
    long long v62 = [(HMMTRControllerParameters *)v20 rootCertificate];
    [v61 printX509Certificate:v62];

    long long v63 = (void *)MEMORY[0x2533B64D0]();
    id v64 = v55;
    id v65 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
    {
      id v66 = HMFGetLogIdentifier();
      __int16 v67 = (void *)MEMORY[0x263F10CC0];
      id v68 = [(HMMTRControllerParameters *)v20 operationalCertificate];
      __int16 v69 = [v67 shortDescriptionForX509Certificate:v68];
      *(_DWORD *)buf = 138543618;
      id v92 = v66;
      __int16 v93 = 2112;
      id v94 = v69;
      _os_log_impl(&dword_252495000, v65, OS_LOG_TYPE_INFO, "%{public}@Controller NOC: %@", buf, 0x16u);
    }
    uint64_t v70 = (void *)MEMORY[0x263F10CC0];
    __int16 v71 = [(HMMTRControllerParameters *)v20 operationalCertificate];
    [v70 printX509Certificate:v71];

    uint64_t v72 = (void *)MEMORY[0x2533B64D0]();
    uint64_t v73 = v64;
    id v74 = HMFGetOSLogHandle();
    __int16 v75 = v86;
    if (os_log_type_enabled(v74, OS_LOG_TYPE_INFO))
    {
      __int16 v76 = HMFGetLogIdentifier();
      __int16 v77 = objc_msgSend(v86, "hmmtr_sha256hash");
      *(_DWORD *)buf = 138543618;
      id v92 = v76;
      __int16 v93 = 2112;
      id v94 = v77;
      _os_log_impl(&dword_252495000, v74, OS_LOG_TYPE_INFO, "%{public}@IPK: %@", buf, 0x16u);
    }
    __int16 v78 = v20;
  }
  else
  {
    uint64_t v79 = (void *)MEMORY[0x2533B64D0]();
    __int16 v80 = v42;
    SecKeyRef v81 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
    {
      __int16 v82 = HMFGetLogIdentifier();
      uint64_t v83 = [MEMORY[0x263F08B88] callStackSymbols];
      __int16 v84 = [v83 description];
      *(_DWORD *)buf = 138543618;
      id v92 = v82;
      __int16 v93 = 2112;
      id v94 = v84;
      _os_log_impl(&dword_252495000, v81, OS_LOG_TYPE_ERROR, "%{public}@Bad params: %@", buf, 0x16u);
    }
    __int16 v78 = 0;
    __int16 v75 = v86;
  }

  return v78;
}

- (id)_currentHomeFabricDeviceControllerStartupParams1
{
  uint64_t v75 = *MEMORY[0x263EF8340];
  id v3 = [(HMMTRAccessoryServerBrowser *)self storage];
  id v4 = [v3 rootCertForCurrentFabric];

  id v5 = [(HMMTRAccessoryServerBrowser *)self storage];
  uint64_t v6 = [v5 operationalCertForCurrentFabric];

  uint64_t v7 = [(HMMTRAccessoryServerBrowser *)self ownerSharedOperationalKeyPair];
  uint64_t v8 = [(HMMTRAccessoryServerBrowser *)self ownerLocalOperationalKeyPair];
  if (![(HMMTRAccessoryServerBrowser *)self isCurrentDevicePrimaryResident]
    && v8
    && [MEMORY[0x263F10CC0] keypair:v8 matchesCertificate:v6])
  {
    id v9 = v8;

    uint64_t v7 = v9;
  }
  dispatch_queue_t v10 = [(HMMTRAccessoryServerBrowser *)self storage];
  uint64_t v11 = [v10 ipkForCurrentFabric];

  id v64 = (void *)v11;
  long long v12 = [[HMMTRControllerParameters alloc] initWithIPK:v11 operationalKeypair:v7 operationalCertificate:v6 intermediateCertificate:0 rootCertificate:v4];
  [(HMMTRControllerParameters *)v12 setVendorID:&unk_2702B5838];
  long long v13 = [(HMMTRAccessoryServerBrowser *)self storage];
  if ([v13 isSharedAdmin])
  {
    BOOL v14 = 1;
  }
  else
  {
    uint64_t v15 = [(HMMTRAccessoryServerBrowser *)self nocSigner];
    BOOL v14 = v15 == 0;
  }
  long long v63 = (void *)v6;
  if (![(HMMTRAccessoryServerBrowser *)self isCurrentDevicePrimaryResident] && v14)
  {

    id v4 = 0;
  }
  uint64_t v16 = [HMMTROperationalCertificateIssuer alloc];
  uint64_t v17 = [(HAPAccessoryServerBrowser *)self workQueue];
  __int16 v18 = [(HMMTROperationalCertificateIssuer *)v16 initWithQueue:v17 rootCertificate:v4 browser:self];
  [(HMMTRControllerParameters *)v12 setOperationalCertificateIssuer:v18];

  uint64_t v19 = [(HAPAccessoryServerBrowser *)self workQueue];
  [(HMMTRControllerParameters *)v12 setOperationalCertificateIssuerQueue:v19];

  uint64_t v20 = (void *)MEMORY[0x2533B64D0]();
  char v21 = self;
  BOOL v22 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    id v23 = HMFGetLogIdentifier();
    __int16 v24 = [(HMMTRControllerParameters *)v12 rootCertificate];
    uint64_t v25 = [(HMMTRControllerParameters *)v12 operationalCertificate];
    id v26 = (void *)v25;
    long long v27 = "shared";
    *(_DWORD *)buf = 138544386;
    id v66 = v23;
    long long v28 = "local";
    if (v7 == v8) {
      long long v27 = "local";
    }
    __int16 v67 = 2112;
    __int16 v69 = 2112;
    id v68 = v24;
    if (!v4) {
      long long v28 = "remote";
    }
    uint64_t v70 = v25;
    __int16 v71 = 2080;
    uint64_t v72 = v27;
    __int16 v73 = 2080;
    id v74 = v28;
    _os_log_impl(&dword_252495000, v22, OS_LOG_TYPE_INFO, "%{public}@Setting root and operational cert in start up params %@ %@ for current home controller using %s operational key and %s NOC issuer", buf, 0x34u);
  }
  uint64_t v29 = [(HMMTRControllerParameters *)v12 rootCertificate];
  if (v29
    && (long long v30 = (void *)v29,
        [(HMMTRControllerParameters *)v12 operationalCertificate],
        long long v31 = objc_claimAutoreleasedReturnValue(),
        v31,
        v30,
        v31))
  {
    int v32 = (void *)MEMORY[0x2533B64D0]();
    int v33 = v21;
    __int16 v34 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      uint64_t v35 = HMFGetLogIdentifier();
      uint64_t v36 = (void *)MEMORY[0x263F10CC0];
      uint64_t v37 = [(HMMTRControllerParameters *)v12 rootCertificate];
      uint64_t v38 = [v36 shortDescriptionForX509Certificate:v37];
      *(_DWORD *)buf = 138543618;
      id v66 = v35;
      __int16 v67 = 2112;
      id v68 = v38;
      _os_log_impl(&dword_252495000, v34, OS_LOG_TYPE_INFO, "%{public}@Controller Root certificate: %@", buf, 0x16u);
    }
    __int16 v39 = (void *)MEMORY[0x263F10CC0];
    id v40 = [(HMMTRControllerParameters *)v12 rootCertificate];
    [v39 printX509Certificate:v40];

    uint64_t v41 = (void *)MEMORY[0x2533B64D0]();
    BOOL v42 = v33;
    BOOL v43 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
    {
      char v44 = HMFGetLogIdentifier();
      __int16 v45 = (void *)MEMORY[0x263F10CC0];
      int v46 = [(HMMTRControllerParameters *)v12 operationalCertificate];
      uint64_t v47 = [v45 shortDescriptionForX509Certificate:v46];
      *(_DWORD *)buf = 138543618;
      id v66 = v44;
      __int16 v67 = 2112;
      id v68 = v47;
      _os_log_impl(&dword_252495000, v43, OS_LOG_TYPE_INFO, "%{public}@Controller NOC: %@", buf, 0x16u);
    }
    long long v48 = (void *)MEMORY[0x263F10CC0];
    id v49 = [(HMMTRControllerParameters *)v12 operationalCertificate];
    [v48 printX509Certificate:v49];

    id v50 = (void *)MEMORY[0x2533B64D0]();
    uint64_t v51 = v42;
    id v52 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
    {
      uint64_t v53 = HMFGetLogIdentifier();
      uint64_t v54 = objc_msgSend(v64, "hmmtr_sha256hash");
      *(_DWORD *)buf = 138543618;
      id v66 = v53;
      __int16 v67 = 2112;
      id v68 = v54;
      _os_log_impl(&dword_252495000, v52, OS_LOG_TYPE_INFO, "%{public}@IPK: %@", buf, 0x16u);
    }
    id v55 = v12;
  }
  else
  {
    long long v56 = (void *)MEMORY[0x2533B64D0]();
    long long v57 = v21;
    long long v58 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
    {
      long long v59 = HMFGetLogIdentifier();
      long long v60 = [MEMORY[0x263F08B88] callStackSymbols];
      long long v61 = [v60 description];
      *(_DWORD *)buf = 138543618;
      id v66 = v59;
      __int16 v67 = 2112;
      id v68 = v61;
      _os_log_impl(&dword_252495000, v58, OS_LOG_TYPE_ERROR, "%{public}@Bad params: %@", buf, 0x16u);
    }
    id v55 = 0;
  }

  return v55;
}

- (id)_currentHomeFabricDeviceControllerStartupParams
{
  if ([(HMMTRAccessoryServerBrowser *)self _isPerControllerStorageEnabled]) {
    [(HMMTRAccessoryServerBrowser *)self _currentHomeFabricDeviceControllerStartupParams2];
  }
  else {
  id v3 = [(HMMTRAccessoryServerBrowser *)self _currentHomeFabricDeviceControllerStartupParams1];
  }
  return v3;
}

- (void)_updateLocallyDiscoveredServerPairedStates
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v3 = self->_discoveredAccessoryServers;
  uint64_t v4 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v18 objects:v28 count:16];
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)v19;
    *(void *)&long long v5 = 138543874;
    long long v17 = v5;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v3);
        }
        id v9 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if (objc_msgSend(v9, "locallyDiscovered", v17, (void)v18))
        {
          dispatch_queue_t v10 = [(HMMTRAccessoryServerBrowser *)self stagedAccessoryServers];
          int v11 = [v10 containsObject:v9];

          int v12 = [v9 isPairedInStorage];
          if ([v9 pairedState])
          {
            if ((([v9 storageUpdatePending] | v12 | v11) & 1) == 0
              && ([v9 removalInProgress] & 1) == 0
              && ([v9 blockInvalidation] & 1) == 0)
            {
              long long v13 = (void *)MEMORY[0x2533B64D0]();
              BOOL v14 = self;
              uint64_t v15 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
              {
                uint64_t v16 = HMFGetLogIdentifier();
                *(_DWORD *)buf = v17;
                id v23 = v16;
                __int16 v24 = 1024;
                int v25 = 1;
                __int16 v26 = 2112;
                long long v27 = v9;
                _os_log_impl(&dword_252495000, v15, OS_LOG_TYPE_INFO, "%{public}@Updating server paired state because it was removed from storage(%d). Server:%@", buf, 0x1Cu);
              }
              [v9 setPairedState:0];
            }
          }
        }
      }
      uint64_t v6 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v18 objects:v28 count:16];
    }
    while (v6);
  }
}

- (void)_cleanupDiscoveredServersWithReason:(id)a3 completion:(id)a4
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v35 = a3;
  id v32 = a4;
  __int16 v34 = [MEMORY[0x263EFF9C0] set];
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  uint64_t v6 = self->_discoveredAccessoryServers;
  uint64_t v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v44 objects:v57 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v45;
    uint64_t v33 = *(void *)v45;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v45 != v9) {
          objc_enumerationMutation(v6);
        }
        int v11 = *(void **)(*((void *)&v44 + 1) + 8 * v10);
        if (([v11 isKnownToSystemCommissioner] & 1) == 0)
        {
          int v12 = [(HMMTRAccessoryServerBrowser *)self stagedAccessoryServers];
          int v13 = [v12 containsObject:v11];

          int v14 = [v11 isPairedInStorage];
          if (![v11 pairedState]
            || (([v11 storageUpdatePending] | v14 | v13) & 1) != 0
            || ([v11 removalInProgress] & 1) != 0)
          {
            int v15 = 0;
          }
          else
          {
            int v15 = [v11 blockInvalidation] ^ 1;
          }
          if (([v11 isDisabled] & 1) != 0 || v15)
          {
            uint64_t v16 = (void *)MEMORY[0x2533B64D0]();
            long long v17 = self;
            long long v18 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              long long v20 = v19 = v6;
              int v21 = [v11 isDisabled];
              *(_DWORD *)buf = 138544130;
              id v50 = v20;
              __int16 v51 = 1024;
              int v52 = v21;
              __int16 v53 = 1024;
              int v54 = v15;
              __int16 v55 = 2112;
              long long v56 = v11;
              _os_log_impl(&dword_252495000, v18, OS_LOG_TYPE_INFO, "%{public}@Invalidating server because it is disabled(%d) or was removed from storage(%d). Server:%@", buf, 0x22u);

              uint64_t v6 = v19;
              uint64_t v9 = v33;
            }

            [v34 addObject:v11];
          }
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v22 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v44 objects:v57 count:16];
      uint64_t v8 = v22;
    }
    while (v22);
  }

  id v23 = dispatch_group_create();
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v24 = v34;
  uint64_t v25 = [v24 countByEnumeratingWithState:&v40 objects:v48 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v41 != v27) {
          objc_enumerationMutation(v24);
        }
        uint64_t v29 = *(void *)(*((void *)&v40 + 1) + 8 * i);
        dispatch_group_enter(v23);
        v38[0] = MEMORY[0x263EF8330];
        v38[1] = 3221225472;
        v38[2] = __78__HMMTRAccessoryServerBrowser__cleanupDiscoveredServersWithReason_completion___block_invoke;
        v38[3] = &unk_265378638;
        __int16 v39 = v23;
        [(HMMTRAccessoryServerBrowser *)self invalidateAccessoryServer:v29 reason:v35 withCompletion:v38];
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v40 objects:v48 count:16];
    }
    while (v26);
  }

  long long v30 = [(HAPAccessoryServerBrowser *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __78__HMMTRAccessoryServerBrowser__cleanupDiscoveredServersWithReason_completion___block_invoke_2;
  block[3] = &unk_2653770F0;
  void block[4] = self;
  id v37 = v32;
  id v31 = v32;
  dispatch_group_notify(v23, v30, block);
}

void __78__HMMTRAccessoryServerBrowser__cleanupDiscoveredServersWithReason_completion___block_invoke(uint64_t a1)
{
}

uint64_t __78__HMMTRAccessoryServerBrowser__cleanupDiscoveredServersWithReason_completion___block_invoke_2(uint64_t result)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (*(void *)(result + 40))
  {
    uint64_t v1 = result;
    uint64_t v2 = (void *)MEMORY[0x2533B64D0]();
    id v3 = *(id *)(v1 + 32);
    uint64_t v4 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      long long v5 = HMFGetLogIdentifier();
      uint64_t v6 = *(void *)(*(void *)(v1 + 32) + 56);
      int v12 = 138543618;
      int v13 = v5;
      __int16 v14 = 2112;
      uint64_t v15 = v6;
      _os_log_impl(&dword_252495000, v4, OS_LOG_TYPE_DEBUG, "%{public}@Discovered Servers: %@", (uint8_t *)&v12, 0x16u);
    }
    uint64_t v7 = (void *)MEMORY[0x2533B64D0]();
    id v8 = *(id *)(v1 + 32);
    uint64_t v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v10 = HMFGetLogIdentifier();
      uint64_t v11 = *(void *)(*(void *)(v1 + 32) + 240);
      int v12 = 138543618;
      int v13 = v10;
      __int16 v14 = 2112;
      uint64_t v15 = v11;
      _os_log_impl(&dword_252495000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Staged Servers: %@", (uint8_t *)&v12, 0x16u);
    }
    return (*(uint64_t (**)(void))(*(void *)(v1 + 40) + 16))();
  }
  return result;
}

- (void)_cleanupDiscoveredServers
{
  id v3 = [MEMORY[0x263F087E8] hmmtrErrorWithCode:9];
  [(HMMTRAccessoryServerBrowser *)self _cleanupDiscoveredServersWithReason:v3 completion:0];
}

- (void)handleThreadNetworkStateChangedNotification:(id)a3
{
  uint64_t v4 = [(HAPAccessoryServerBrowser *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __75__HMMTRAccessoryServerBrowser_handleThreadNetworkStateChangedNotification___block_invoke;
  block[3] = &unk_265378638;
  void block[4] = self;
  dispatch_async(v4, block);
}

uint64_t __75__HMMTRAccessoryServerBrowser_handleThreadNetworkStateChangedNotification___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)MEMORY[0x2533B64D0]();
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    long long v5 = HMFGetLogIdentifier();
    int v7 = 138543362;
    id v8 = v5;
    _os_log_impl(&dword_252495000, v4, OS_LOG_TYPE_INFO, "%{public}@Handling thread network state changed notification", (uint8_t *)&v7, 0xCu);
  }
  return [*(id *)(a1 + 32) handleThreadRadioStateChanged];
}

- (void)handleThreadRadioStateChanged
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v2 = [(HMMTRAccessoryServerBrowser *)self fabricsWithActiveConnections];
  [v2 count];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = v2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "retryOperations", (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)_abortAllOperationsForFabricID:(id)a3 reason:(id)a4
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v28 = a4;
  locuint64_t k = (os_unfair_lock_s *)((char *)self + (int)*MEMORY[0x263F35B40]);
  os_unfair_lock_lock_with_options();
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v7 = self->_fabricsWithActiveConnections;
  uint64_t v8 = [(NSMutableOrderedSet *)v7 countByEnumeratingWithState:&v33 objects:v42 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v34;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v34 != v9) {
        objc_enumerationMutation(v7);
      }
      long long v11 = *(void **)(*((void *)&v33 + 1) + 8 * v10);
      int v12 = objc_msgSend(v11, "fabricID", lock);
      char v13 = HMFEqualObjects();

      if (v13) {
        break;
      }
      if (v8 == ++v10)
      {
        uint64_t v8 = [(NSMutableOrderedSet *)v7 countByEnumeratingWithState:&v33 objects:v42 count:16];
        if (v8) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v14 = v11;

    if (!v14) {
      goto LABEL_12;
    }
    os_unfair_lock_unlock(lock);
    goto LABEL_23;
  }
LABEL_9:

LABEL_12:
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v15 = self->_fabricsWithPendingConnections;
  id v14 = (id)[(NSMutableOrderedSet *)v15 countByEnumeratingWithState:&v29 objects:v41 count:16];
  if (v14)
  {
    uint64_t v16 = *(void *)v30;
    while (2)
    {
      for (uint64_t i = 0; i != v14; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v30 != v16) {
          objc_enumerationMutation(v15);
        }
        long long v18 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        long long v19 = objc_msgSend(v18, "fabricID", lock);
        long long v20 = [v18 fabricID];
        int v21 = HMFEqualObjects();

        if (v21)
        {
          id v14 = v18;
          goto LABEL_22;
        }
      }
      id v14 = (id)[(NSMutableOrderedSet *)v15 countByEnumeratingWithState:&v29 objects:v41 count:16];
      if (v14) {
        continue;
      }
      break;
    }
  }
LABEL_22:

  os_unfair_lock_unlock(lock);
  if (v14)
  {
LABEL_23:
    uint64_t v22 = (void *)MEMORY[0x2533B64D0]();
    id v23 = self;
    id v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      uint64_t v25 = HMFGetLogIdentifier();
      uint64_t v26 = [v14 fabricID];
      *(_DWORD *)buf = 138543618;
      uint64_t v38 = v25;
      __int16 v39 = 2112;
      long long v40 = v26;
      _os_log_impl(&dword_252495000, v24, OS_LOG_TYPE_INFO, "%{public}@Aborting operations for fabric: %@", buf, 0x16u);
    }
    [v14 abortAllOperationsWithReason:v28];
  }
}

- (void)_connectPendingFabricConnectionsForFabricID:(id)a3
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x2533B64D0]();
  id v6 = self;
  uint64_t v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    int v54 = v8;
    __int16 v55 = 2112;
    id v56 = v4;
    _os_log_impl(&dword_252495000, v7, OS_LOG_TYPE_INFO, "%{public}@_connectPendingFabricConnectionsForFabricID for fabricID - %@", buf, 0x16u);
  }
  uint64_t v9 = (void *)MEMORY[0x2533B64D0]();
  uint64_t v10 = v6;
  long long v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    int v12 = HMFGetLogIdentifier();
    char v13 = [v10 fabricsWithPendingConnections];
    id v14 = [v10 fabricsWithActiveConnections];
    *(_DWORD *)buf = 138543874;
    int v54 = v12;
    __int16 v55 = 2112;
    id v56 = v13;
    __int16 v57 = 2112;
    uint64_t v58 = v14;
    _os_log_impl(&dword_252495000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Current pending connections: %@, Connected/Connecting: %@", buf, 0x20u);
  }
  uint64_t v15 = (os_unfair_lock_s *)((char *)v10 + (int)*MEMORY[0x263F35B40]);
  os_unfair_lock_lock_with_options();
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v16 = v10[11];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v47 objects:v52 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v48;
    while (2)
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v48 != v18) {
          objc_enumerationMutation(v16);
        }
        long long v20 = *(void **)(*((void *)&v47 + 1) + 8 * i);
        int v21 = [v20 fabricID];
        int v22 = HMFEqualObjects();

        if (v22)
        {
          id v42 = v20;
          goto LABEL_15;
        }
      }
      uint64_t v17 = [v16 countByEnumeratingWithState:&v47 objects:v52 count:16];
      if (v17) {
        continue;
      }
      break;
    }
  }
  id v42 = 0;
LABEL_15:

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v23 = v10[12];
  id v24 = (id)[v23 countByEnumeratingWithState:&v43 objects:v51 count:16];
  if (v24)
  {
    uint64_t v25 = *(void *)v44;
    while (2)
    {
      for (uint64_t j = 0; j != v24; uint64_t j = (char *)j + 1)
      {
        if (*(void *)v44 != v25) {
          objc_enumerationMutation(v23);
        }
        uint64_t v27 = *(void **)(*((void *)&v43 + 1) + 8 * (void)j);
        id v28 = [v27 fabricID];
        int v29 = HMFEqualObjects();

        if (v29)
        {
          id v24 = v27;
          goto LABEL_25;
        }
      }
      id v24 = (id)[v23 countByEnumeratingWithState:&v43 objects:v51 count:16];
      if (v24) {
        continue;
      }
      break;
    }
  }
LABEL_25:

  os_unfair_lock_unlock(v15);
  if (v42)
  {
    long long v30 = (void *)MEMORY[0x2533B64D0]();
    long long v31 = v10;
    long long v32 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      long long v33 = HMFGetLogIdentifier();
      long long v34 = [v42 fabricID];
      *(_DWORD *)buf = 138543618;
      int v54 = v33;
      __int16 v55 = 2112;
      id v56 = v34;
      _os_log_impl(&dword_252495000, v32, OS_LOG_TYPE_INFO, "%{public}@Re-starting operations for fabric: %@", buf, 0x16u);
    }
    [v42 startOperations];
  }
  else
  {
    long long v35 = (void *)MEMORY[0x2533B64D0]();
    long long v36 = v10;
    id v37 = HMFGetOSLogHandle();
    BOOL v38 = os_log_type_enabled(v37, OS_LOG_TYPE_INFO);
    if (v24)
    {
      if (v38)
      {
        __int16 v39 = HMFGetLogIdentifier();
        long long v40 = [v24 fabricID];
        *(_DWORD *)buf = 138543618;
        int v54 = v39;
        __int16 v55 = 2112;
        id v56 = v40;
        _os_log_impl(&dword_252495000, v37, OS_LOG_TYPE_INFO, "%{public}@Connecting pending fabric fabric: %@", buf, 0x16u);
      }
      [v36 _removeFromPendingFabrics:v24];
      [v36 _establishConnectionWhenAllowedWithFabricConnectionRequest:v24];
    }
    else
    {
      if (v38)
      {
        long long v41 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        int v54 = v41;
        __int16 v55 = 2112;
        id v56 = v4;
        _os_log_impl(&dword_252495000, v37, OS_LOG_TYPE_INFO, "%{public}@fabric %@ not found in either lists", buf, 0x16u);
      }
    }
  }
}

- (void)_suspendOperationsForFabricID:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = (os_unfair_lock_s *)((char *)self + (int)*MEMORY[0x263F35B40]);
  os_unfair_lock_lock_with_options();
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = self->_fabricsWithActiveConnections;
  id v7 = (id)[(NSMutableOrderedSet *)v6 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        long long v11 = objc_msgSend(v10, "fabricID", (void)v19);
        int v12 = HMFEqualObjects();

        if (v12)
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }
      id v7 = (id)[(NSMutableOrderedSet *)v6 countByEnumeratingWithState:&v19 objects:v27 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  os_unfair_lock_unlock(v5);
  if (v7)
  {
    char v13 = (void *)MEMORY[0x2533B64D0]();
    id v14 = self;
    uint64_t v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      id v16 = HMFGetLogIdentifier();
      uint64_t v17 = [v7 fabricID];
      *(_DWORD *)buf = 138543618;
      id v24 = v16;
      __int16 v25 = 2112;
      uint64_t v26 = v17;
      _os_log_impl(&dword_252495000, v15, OS_LOG_TYPE_INFO, "%{public}@Suspending operations for fabric: %@", buf, 0x16u);
    }
    [v7 suspendOperations];
  }
  uint64_t v18 = [(HMMTRAccessoryServerBrowser *)self threadSoftwareUpdateController];
  [v18 suspendOperationsForFabricID:v4];
}

- (void)_connectPendingFabricConnections
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x2533B64D0](self, a2);
  id v4 = self;
  uint64_t v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    id v6 = HMFGetLogIdentifier();
    id v7 = [(HMMTRAccessoryServerBrowser *)v4 fabricsWithPendingConnections];
    uint64_t v8 = [(HMMTRAccessoryServerBrowser *)v4 fabricsWithActiveConnections];
    *(_DWORD *)buf = 138543874;
    long long v32 = v6;
    __int16 v33 = 2112;
    long long v34 = v7;
    __int16 v35 = 2112;
    long long v36 = v8;
    _os_log_impl(&dword_252495000, v5, OS_LOG_TYPE_DEBUG, "%{public}@Current pending connections: %@, Connected/Connecting: %@", buf, 0x20u);
  }
  uint64_t v9 = [(HMMTRAccessoryServerBrowser *)v4 fabricsWithPendingConnections];
  uint64_t v10 = [v9 count];

  if (v10)
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v11 = [(HMMTRAccessoryServerBrowser *)v4 fabricsWithPendingConnections];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      id v14 = 0;
      uint64_t v15 = *(void *)v27;
      while (2)
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v27 != v15) {
            objc_enumerationMutation(v11);
          }
          uint64_t v17 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          if (!v14) {
            id v14 = v17;
          }
          if ([v17 hasPendingHighPriorityConnectionRequest])
          {
            id v18 = v17;

            id v14 = v18;
            goto LABEL_16;
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v26 objects:v30 count:16];
        if (v13) {
          continue;
        }
        break;
      }
LABEL_16:

      if (v14)
      {
        [(HMMTRAccessoryServerBrowser *)v4 _removeFromPendingFabrics:v14];
        [(HMMTRAccessoryServerBrowser *)v4 _establishConnectionWhenAllowedWithFabricConnectionRequest:v14];

        return;
      }
    }
    else
    {
    }
    long long v19 = (void *)MEMORY[0x2533B64D0]();
    long long v20 = v4;
    long long v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      long long v22 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      long long v32 = v22;
      id v23 = "%{public}@No fabric to connect";
      id v24 = v21;
      os_log_type_t v25 = OS_LOG_TYPE_ERROR;
      goto LABEL_23;
    }
  }
  else
  {
    long long v19 = (void *)MEMORY[0x2533B64D0]();
    long long v20 = v4;
    long long v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      long long v22 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      long long v32 = v22;
      id v23 = "%{public}@No more pending fabric connection requests";
      id v24 = v21;
      os_log_type_t v25 = OS_LOG_TYPE_DEBUG;
LABEL_23:
      _os_log_impl(&dword_252495000, v24, v25, v23, buf, 0xCu);
    }
  }
}

- (void)_operationsCompletedForFabricConnectionRequest:(id)a3 reason:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)MEMORY[0x2533B64D0]();
  uint64_t v9 = self;
  uint64_t v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    long long v11 = HMFGetLogIdentifier();
    uint64_t v12 = [v6 fabricID];
    int v14 = 138543618;
    uint64_t v15 = v11;
    __int16 v16 = 2112;
    uint64_t v17 = v12;
    _os_log_impl(&dword_252495000, v10, OS_LOG_TYPE_INFO, "%{public}@Marking operation complete for fabric: %@", (uint8_t *)&v14, 0x16u);
  }
  [(HMMTRAccessoryServerBrowser *)v9 _removeFromActiveFabrics:v6];
  uint64_t v13 = [v6 fabricID];
  [(HMMTRAccessoryServerBrowser *)v9 _disconnectFromIdleFabric:v13 reason:v7];

  [(HMMTRAccessoryServerBrowser *)v9 _connectPendingFabricConnections];
}

- (void)operationsStartedForFabricConnectionRequest:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(HAPAccessoryServerBrowser *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)MEMORY[0x2533B64D0]();
  id v7 = self;
  uint64_t v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = HMFGetLogIdentifier();
    uint64_t v10 = [v4 fabricID];
    int v18 = 138543618;
    long long v19 = v9;
    __int16 v20 = 2112;
    long long v21 = v10;
    _os_log_impl(&dword_252495000, v8, OS_LOG_TYPE_INFO, "%{public}@Starting operations for fabric: %@", (uint8_t *)&v18, 0x16u);
  }
  if ([v4 systemCommissionerFabric])
  {
    [(HMMTRAccessoryServerBrowser *)v7 setSystemCommissionerMode:1];
  }
  else
  {
    long long v11 = [v4 fabricID];
    [(HMMTRAccessoryServerBrowser *)v7 _setupStorageStateIfNotFabricID:v11 rediscoverAccessories:0];
  }
  if ([v4 systemCommissionerFabric])
  {
    uint64_t v12 = [(HMMTRAccessoryServerBrowser *)v7 threadRadioManager];
    uint64_t v13 = [v4 fabricID];
    [v12 startThreadRadioForSystemCommissionerFabricID:v13];
LABEL_11:

    goto LABEL_12;
  }
  uint64_t v12 = [(HMMTRAccessoryServerBrowser *)v7 currentFabric];
  if (![(HMMTRAccessoryServerBrowser *)v7 isCurrentDeviceAllowedAccessoryControlDespiteReachableResidentForFabric:v12])
  {
LABEL_12:

    goto LABEL_13;
  }
  int v14 = [(HMMTRAccessoryServerBrowser *)v7 threadRadioManager];
  uint64_t v15 = [(HMMTRAccessoryServerBrowser *)v7 currentFabricID];
  int v16 = [v14 hasMatterThreadAccessoryInHomeWithFabricID:v15];

  if (v16)
  {
    uint64_t v12 = [(HMMTRAccessoryServerBrowser *)v7 threadRadioManager];
    uint64_t v13 = [(HMMTRAccessoryServerBrowser *)v7 currentFabricID];
    [v12 startThreadRadioForHomeWithFabricID:v13];
    goto LABEL_11;
  }
LABEL_13:
  if ((_os_feature_enabled_impl() & 1) != 0 || HM_FEATURE_RVC_DEFAULTS_ENABLED())
  {
    uint64_t v17 = [(HMMTRAccessoryServerBrowser *)v7 currentHomeFabricDeviceControllerWrapper];
    [v17 resume];
  }
}

- (void)_establishConnectionWhenAllowedWithFabricConnectionRequest:(id)a3
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x2533B64D0]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    uint64_t v9 = [v4 fabricID];
    uint64_t v10 = [(HMMTRAccessoryServerBrowser *)v6 fabricsWithActiveConnections];
    uint64_t v11 = [v10 count];
    uint64_t v12 = [(HMMTRAccessoryServerBrowser *)v6 fabricsWithPendingConnections];
    *(_DWORD *)buf = 138544130;
    int v54 = v8;
    __int16 v55 = 2112;
    id v56 = v9;
    __int16 v57 = 2048;
    uint64_t v58 = v11;
    __int16 v59 = 2048;
    uint64_t v60 = [v12 count];
    _os_log_impl(&dword_252495000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Connection request for fabric %@, Current active fabric count: %tu, Pending: %tu", buf, 0x2Au);
  }
  uint64_t v13 = [(HMMTRAccessoryServerBrowser *)v6 fabricsWithActiveConnections];
  uint64_t v14 = [v13 count];

  uint64_t v15 = (void *)MEMORY[0x2533B64D0]();
  int v16 = v6;
  uint64_t v17 = HMFGetOSLogHandle();
  BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
  if (v14)
  {
    if (v18)
    {
      long long v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      int v54 = v19;
      __int16 v55 = 2112;
      id v56 = v4;
      _os_log_impl(&dword_252495000, v17, OS_LOG_TYPE_ERROR, "%{public}@establishConnectionWhenAllowedWithFabricConnectionRequest add to pending %@", buf, 0x16u);
    }
    [(HMMTRAccessoryServerBrowser *)v16 _addToPendingFabrics:v4];
    __int16 v20 = [v4 fabricID];
    long long v21 = [(HMMTRAccessoryServerBrowser *)v16 currentFabricID];
    char v22 = HMFEqualObjects();

    if ((v22 & 1) != 0
      || ([v4 fabricID],
          id v23 = objc_claimAutoreleasedReturnValue(),
          [(HMMTRAccessoryServerBrowser *)v16 systemCommissionerFabricID],
          id v24 = objc_claimAutoreleasedReturnValue(),
          int v25 = HMFEqualObjects(),
          v24,
          v23,
          v25))
    {
      long long v26 = (void *)MEMORY[0x2533B64D0]();
      long long v27 = v16;
      long long v28 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        long long v29 = HMFGetLogIdentifier();
        long long v30 = [v4 fabricID];
        *(_DWORD *)buf = 138543618;
        int v54 = v29;
        __int16 v55 = 2112;
        id v56 = v30;
        _os_log_impl(&dword_252495000, v28, OS_LOG_TYPE_INFO, "%{public}@Making room for fabricID: %@", buf, 0x16u);
      }
      long long v50 = 0u;
      long long v51 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      long long v31 = [(HMMTRAccessoryServerBrowser *)v27 fabricsWithActiveConnections];
      uint64_t v32 = [v31 countByEnumeratingWithState:&v48 objects:v52 count:16];
      if (v32)
      {
        uint64_t v33 = v32;
        uint64_t v34 = *(void *)v49;
        while (2)
        {
          for (uint64_t i = 0; i != v33; ++i)
          {
            if (*(void *)v49 != v34) {
              objc_enumerationMutation(v31);
            }
            long long v36 = *(void **)(*((void *)&v48 + 1) + 8 * i);
            uint64_t v37 = [v4 fabricID];
            BOOL v38 = [v36 fabricID];
            char v39 = HMFEqualObjects();

            if ((v39 & 1) == 0)
            {
              long long v41 = (void *)MEMORY[0x2533B64D0]();
              id v42 = v27;
              long long v43 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
              {
                long long v44 = HMFGetLogIdentifier();
                long long v45 = [v36 fabricID];
                *(_DWORD *)buf = 138543618;
                int v54 = v44;
                __int16 v55 = 2112;
                id v56 = v45;
                _os_log_impl(&dword_252495000, v43, OS_LOG_TYPE_INFO, "%{public}@Evicting fabricID: %@", buf, 0x16u);
              }
              long long v46 = [v36 fabricID];
              long long v47 = [MEMORY[0x263F087E8] hmmtrErrorWithCode:5];
              [(HMMTRAccessoryServerBrowser *)v42 _abortAllOperationsForFabricID:v46 reason:v47];

              goto LABEL_25;
            }
          }
          uint64_t v33 = [v31 countByEnumeratingWithState:&v48 objects:v52 count:16];
          if (v33) {
            continue;
          }
          break;
        }
      }
LABEL_25:
    }
  }
  else
  {
    if (v18)
    {
      long long v40 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      int v54 = v40;
      __int16 v55 = 2112;
      id v56 = v4;
      _os_log_impl(&dword_252495000, v17, OS_LOG_TYPE_ERROR, "%{public}@establishConnectionWhenAllowedWithFabricConnectionRequest add to active %@", buf, 0x16u);
    }
    [(HMMTRAccessoryServerBrowser *)v16 _addToActiveFabrics:v4];
  }
}

- (void)_establishConnectionWhenAllowedWithAccessoryConnectionRequest:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x2533B64D0]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    uint64_t v9 = [(HMMTRAccessoryServerBrowser *)v6 fabricsWithActiveConnections];
    uint64_t v10 = [v9 count];
    uint64_t v11 = [(HMMTRAccessoryServerBrowser *)v6 fabricsWithPendingConnections];
    int v25 = 138544130;
    long long v26 = v8;
    __int16 v27 = 2112;
    id v28 = v4;
    __int16 v29 = 2048;
    uint64_t v30 = v10;
    __int16 v31 = 2048;
    uint64_t v32 = [v11 count];
    _os_log_impl(&dword_252495000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Connection request for accessory %@. Current active fabric count: %tu, Pending: %tu", (uint8_t *)&v25, 0x2Au);
  }
  uint64_t v12 = [v4 server];
  BOOL v13 = [(HMMTRAccessoryServerBrowser *)v6 isOperationAllowedForAccessoryServer:v12];

  if (!v13)
  {
    long long v19 = (void *)MEMORY[0x2533B64D0]();
    __int16 v20 = v6;
    long long v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      char v22 = HMFGetLogIdentifier();
      id v23 = [v4 nodeID];
      id v24 = [(HMMTRAccessoryServerBrowser *)v20 allowedNodeIDsForConnectionRequests];
      int v25 = 138543874;
      long long v26 = v22;
      __int16 v27 = 2112;
      id v28 = v23;
      __int16 v29 = 2112;
      uint64_t v30 = (uint64_t)v24;
      _os_log_impl(&dword_252495000, v21, OS_LOG_TYPE_ERROR, "%{public}@Connection requests rejected for nodeID %@: Allowed NodeIDs: %@", (uint8_t *)&v25, 0x20u);
    }
    BOOL v18 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F41FD8] code:9 userInfo:0];
    [v4 abortAllPendingOperations:v18];
    goto LABEL_9;
  }
  if (![(HMMTRAccessoryServerBrowser *)v6 _tryAddAccessoryConnectionRequestToExistingFabric:v4])
  {
    uint64_t v14 = [HMMTRFabricConnectionRequest alloc];
    uint64_t v15 = [(HAPAccessoryServerBrowser *)v6 workQueue];
    int v16 = [v4 fabricID];
    uint64_t v17 = [v4 server];
    BOOL v18 = -[HMMTRFabricConnectionRequest initWithQueue:browser:fabricID:systemCommissionerFabric:](v14, "initWithQueue:browser:fabricID:systemCommissionerFabric:", v15, v6, v16, [v17 knownToSystemCommissioner]);

    [(HMMTRAccessoryServerBrowser *)v6 _establishConnectionWhenAllowedWithFabricConnectionRequest:v18];
    [(HMMTRFabricConnectionRequest *)v18 connectToAccessoryWhenAllowed:v4];
LABEL_9:
  }
}

- (void)disableUnrestrictedOperationsForAccessoryServer:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(HMMTRAccessoryServerBrowser *)self allowedNodeIDsForConnectionRequests];
  id v6 = [v4 nodeID];
  [v5 removeObject:v6];

  id v7 = (void *)MEMORY[0x2533B64D0]();
  uint64_t v8 = self;
  uint64_t v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = HMFGetLogIdentifier();
    uint64_t v11 = [(HMMTRAccessoryServerBrowser *)v8 allowedNodeIDsForConnectionRequests];
    int v12 = 138543618;
    BOOL v13 = v10;
    __int16 v14 = 2112;
    uint64_t v15 = v11;
    _os_log_impl(&dword_252495000, v9, OS_LOG_TYPE_INFO, "%{public}@Connection requests: Allowed NodeIDs: %@", (uint8_t *)&v12, 0x16u);
  }
}

- (void)enableUnrestrictedOperationsForAccessoryServer:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(HMMTRAccessoryServerBrowser *)self setConnectionRequestSuspended:1];
  uint64_t v5 = [(HMMTRAccessoryServerBrowser *)self allowedNodeIDsForConnectionRequests];
  id v6 = [v4 nodeID];
  [v5 addObject:v6];

  id v7 = (void *)MEMORY[0x2533B64D0]();
  uint64_t v8 = self;
  uint64_t v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = HMFGetLogIdentifier();
    uint64_t v11 = [(HMMTRAccessoryServerBrowser *)v8 allowedNodeIDsForConnectionRequests];
    int v12 = 138543618;
    BOOL v13 = v10;
    __int16 v14 = 2112;
    uint64_t v15 = v11;
    _os_log_impl(&dword_252495000, v9, OS_LOG_TYPE_INFO, "%{public}@Connection requests: Allowed NodeIDs: %@", (uint8_t *)&v12, 0x16u);
  }
}

- (void)resumeAllOperations
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = [(HMMTRAccessoryServerBrowser *)self allowedNodeIDsForConnectionRequests];
  [v3 removeAllObjects];

  id v4 = (void *)MEMORY[0x2533B64D0]([(HMMTRAccessoryServerBrowser *)self setConnectionRequestSuspended:0]);
  uint64_t v5 = self;
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    int v8 = 138543362;
    uint64_t v9 = v7;
    _os_log_impl(&dword_252495000, v6, OS_LOG_TYPE_INFO, "%{public}@Connection requests resumed", (uint8_t *)&v8, 0xCu);
  }
}

- (void)abortAndSuspendAllOperationsWithReason:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HAPAccessoryServerBrowser *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __70__HMMTRAccessoryServerBrowser_abortAndSuspendAllOperationsWithReason___block_invoke;
  v7[3] = &unk_265376E98;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __70__HMMTRAccessoryServerBrowser_abortAndSuspendAllOperationsWithReason___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) connectionRequestSuspended])
  {
    uint64_t v2 = (void *)MEMORY[0x2533B64D0]();
    id v3 = *(id *)(a1 + 32);
    id v4 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v28 = v5;
      _os_log_impl(&dword_252495000, v4, OS_LOG_TYPE_INFO, "%{public}@Connection requests already suspended", buf, 0xCu);
    }
  }
  else
  {
    [*(id *)(a1 + 32) setConnectionRequestSuspended:1];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v6 = [*(id *)(a1 + 32) fabricsWithActiveConnections];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v22;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v22 != v9) {
            objc_enumerationMutation(v6);
          }
          [*(id *)(*((void *)&v21 + 1) + 8 * v10++) abortAllOperationsWithReason:*(void *)(a1 + 40)];
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v8);
    }

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v11 = objc_msgSend(*(id *)(a1 + 32), "fabricsWithPendingConnections", 0);
    uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v18;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v18 != v14) {
            objc_enumerationMutation(v11);
          }
          [*(id *)(*((void *)&v17 + 1) + 8 * v15++) abortAllOperationsWithReason:*(void *)(a1 + 40)];
        }
        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
      }
      while (v13);
    }

    uint64_t v16 = [*(id *)(a1 + 32) threadSoftwareUpdateController];
    [v16 suspendOperations];
  }
}

- (BOOL)isOperationAllowedForAccessoryServer:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(HMMTRAccessoryServerBrowser *)self connectionRequestSuspended])
  {
    uint64_t v5 = (void *)MEMORY[0x2533B64D0]();
    id v6 = self;
    uint64_t v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = HMFGetLogIdentifier();
      uint64_t v9 = [(HMMTRAccessoryServerBrowser *)v6 allowedNodeIDsForConnectionRequests];
      *(_DWORD *)buf = 138543618;
      long long v23 = v8;
      __int16 v24 = 2112;
      int v25 = v9;
      _os_log_impl(&dword_252495000, v7, OS_LOG_TYPE_INFO, "%{public}@Connection requests are currently suspended. Only allowing nodeIDs: %@", buf, 0x16u);
    }
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v10 = [(HMMTRAccessoryServerBrowser *)v6 allowedNodeIDsForConnectionRequests];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v18;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v10);
          }
          uint64_t v14 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          uint64_t v15 = [v4 nodeID];
          LOBYTE(v14) = [v14 isEqualToNumber:v15];

          if (v14)
          {
            LOBYTE(v11) = 1;
            goto LABEL_15;
          }
        }
        uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
LABEL_15:
  }
  else
  {
    LOBYTE(v11) = 1;
  }

  return v11;
}

- (void)setConnectionRequestSuspended:(BOOL)a3
{
  if (self->_connectionRequestSuspended != a3) {
    self->_connectionRequestSuspended = a3;
  }
}

- (void)abortOperationsForAccessoryServer:(id)a3 reason:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HAPAccessoryServerBrowser *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __72__HMMTRAccessoryServerBrowser_abortOperationsForAccessoryServer_reason___block_invoke;
  block[3] = &unk_265376F38;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __72__HMMTRAccessoryServerBrowser_abortOperationsForAccessoryServer_reason___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v2 = [HMMTRAccessoryConnectionRequest alloc];
  id v3 = [*(id *)(a1 + 32) workQueue];
  id v4 = [(HMMTRAccessoryConnectionRequest *)v2 initWithQueue:v3 server:*(void *)(a1 + 40) highPriority:0 completion:&__block_literal_global_293];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v5 = [*(id *)(a1 + 32) fabricsWithActiveConnections];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v19 != v8) {
        objc_enumerationMutation(v5);
      }
      if ([*(id *)(*((void *)&v18 + 1) + 8 * v9) abortOperationsForConnectionRequest:v4 reason:*(void *)(a1 + 48)])break; {
      if (v7 == ++v9)
      }
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v23 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:

    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v5 = objc_msgSend(*(id *)(a1 + 32), "fabricsWithPendingConnections", 0);
    uint64_t v10 = [v5 countByEnumeratingWithState:&v14 objects:v22 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v15;
LABEL_11:
      uint64_t v13 = 0;
      while (1)
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v5);
        }
        if ([*(id *)(*((void *)&v14 + 1) + 8 * v13) abortOperationsForConnectionRequest:v4 reason:*(void *)(a1 + 48)])break; {
        if (v11 == ++v13)
        }
        {
          uint64_t v11 = [v5 countByEnumeratingWithState:&v14 objects:v22 count:16];
          if (v11) {
            goto LABEL_11;
          }
          break;
        }
      }
    }
  }
}

- (void)connectToAccessoryWhenAllowed:(id)a3 highPriority:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = [(HAPAccessoryServerBrowser *)self workQueue];

  if (v10)
  {
    uint64_t v11 = [(HAPAccessoryServerBrowser *)self workQueue];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __85__HMMTRAccessoryServerBrowser_connectToAccessoryWhenAllowed_highPriority_completion___block_invoke;
    v12[3] = &unk_265376988;
    v12[4] = self;
    id v13 = v8;
    BOOL v15 = a4;
    id v14 = v9;
    dispatch_async(v11, v12);
  }
  else
  {
    (*((void (**)(id, void))v9 + 2))(v9, 0);
  }
}

void __85__HMMTRAccessoryServerBrowser_connectToAccessoryWhenAllowed_highPriority_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [HMMTRAccessoryConnectionRequest alloc];
  id v3 = [*(id *)(a1 + 32) workQueue];
  id v4 = [(HMMTRAccessoryConnectionRequest *)v2 initWithQueue:v3 server:*(void *)(a1 + 40) highPriority:*(unsigned __int8 *)(a1 + 56) completion:*(void *)(a1 + 48)];

  [*(id *)(a1 + 32) _establishConnectionWhenAllowedWithAccessoryConnectionRequest:v4];
}

- (void)_removeFromPendingFabrics:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = (os_unfair_lock_s *)((char *)self + (int)*MEMORY[0x263F35B40]);
  os_unfair_lock_lock_with_options();
  if ([(NSMutableOrderedSet *)self->_fabricsWithPendingConnections containsObject:v4])
  {
    [(NSMutableOrderedSet *)self->_fabricsWithPendingConnections removeObject:v4];
    os_unfair_lock_unlock(v5);
    uint64_t v6 = (void *)MEMORY[0x2533B64D0]();
    uint64_t v7 = self;
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = HMFGetLogIdentifier();
      uint64_t v10 = [v4 fabricID];
      int v11 = 138543618;
      uint64_t v12 = v9;
      __int16 v13 = 2112;
      id v14 = v10;
      _os_log_impl(&dword_252495000, v8, OS_LOG_TYPE_INFO, "%{public}@Removed pending connection for fabric: %@", (uint8_t *)&v11, 0x16u);
    }
  }
  else
  {
    os_unfair_lock_unlock(v5);
  }
}

- (void)_addToPendingFabrics:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = (os_unfair_lock_s *)((char *)self + (int)*MEMORY[0x263F35B40]);
  os_unfair_lock_lock_with_options();
  if ([(NSMutableOrderedSet *)self->_fabricsWithPendingConnections containsObject:v4])
  {
    os_unfair_lock_unlock(v5);
  }
  else
  {
    [(NSMutableOrderedSet *)self->_fabricsWithPendingConnections addObject:v4];
    os_unfair_lock_unlock(v5);
    uint64_t v6 = (void *)MEMORY[0x2533B64D0]();
    uint64_t v7 = self;
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = HMFGetLogIdentifier();
      uint64_t v10 = [v4 fabricID];
      int v11 = 138543618;
      uint64_t v12 = v9;
      __int16 v13 = 2112;
      id v14 = v10;
      _os_log_impl(&dword_252495000, v8, OS_LOG_TYPE_INFO, "%{public}@Pending connection to fabric: %@", (uint8_t *)&v11, 0x16u);
    }
  }
}

- (id)fabricsWithPendingConnections
{
  id v3 = (os_unfair_lock_s *)((char *)self + (int)*MEMORY[0x263F35B40]);
  os_unfair_lock_lock_with_options();
  id v4 = (void *)MEMORY[0x263EFF8C0];
  uint64_t v5 = [(NSMutableOrderedSet *)self->_fabricsWithPendingConnections array];
  uint64_t v6 = [v4 arrayWithArray:v5];

  os_unfair_lock_unlock(v3);
  return v6;
}

- (BOOL)_tryAddAccessoryConnectionRequestToExistingFabric:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v4 = a3;
  locuint64_t k = (os_unfair_lock_s *)((char *)self + (int)*MEMORY[0x263F35B40]);
  os_unfair_lock_lock_with_options();
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v5 = self->_fabricsWithActiveConnections;
  id v6 = (id)[(NSMutableOrderedSet *)v5 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v29;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v29 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        uint64_t v10 = [v9 fabricID];
        int v11 = [v4 fabricID];
        int v12 = HMFEqualObjects();

        if (v12)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[(NSMutableOrderedSet *)v5 countByEnumeratingWithState:&v28 objects:v33 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  __int16 v13 = self->_fabricsWithPendingConnections;
  uint64_t v14 = [(NSMutableOrderedSet *)v13 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v25;
    while (2)
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v25 != v15) {
          objc_enumerationMutation(v13);
        }
        long long v17 = *(void **)(*((void *)&v24 + 1) + 8 * j);
        long long v18 = [v17 fabricID];
        long long v19 = [v4 fabricID];
        int v20 = HMFEqualObjects();

        if (v20)
        {
          id v21 = v17;

          id v6 = v21;
          goto LABEL_21;
        }
      }
      uint64_t v14 = [(NSMutableOrderedSet *)v13 countByEnumeratingWithState:&v24 objects:v32 count:16];
      if (v14) {
        continue;
      }
      break;
    }
  }
LABEL_21:

  os_unfair_lock_unlock(lock);
  if (v6) {
    [v6 connectToAccessoryWhenAllowed:v4];
  }

  return v6 != 0;
}

- (void)_removeFromActiveFabrics:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = (os_unfair_lock_s *)((char *)self + (int)*MEMORY[0x263F35B40]);
  os_unfair_lock_lock_with_options();
  if ([(NSMutableOrderedSet *)self->_fabricsWithActiveConnections containsObject:v4])
  {
    [(NSMutableOrderedSet *)self->_fabricsWithActiveConnections removeObject:v4];
    os_unfair_lock_unlock(v5);
    id v6 = (void *)MEMORY[0x2533B64D0]();
    uint64_t v7 = self;
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = HMFGetLogIdentifier();
      uint64_t v10 = [v4 fabricID];
      int v11 = 138543618;
      int v12 = v9;
      __int16 v13 = 2112;
      uint64_t v14 = v10;
      _os_log_impl(&dword_252495000, v8, OS_LOG_TYPE_INFO, "%{public}@Removed active connection for fabric: %@", (uint8_t *)&v11, 0x16u);
    }
    [v4 stopOperations];
  }
  else
  {
    os_unfair_lock_unlock(v5);
  }
}

- (void)_addToActiveFabrics:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = (os_unfair_lock_s *)((char *)self + (int)*MEMORY[0x263F35B40]);
  os_unfair_lock_lock_with_options();
  if ([(NSMutableOrderedSet *)self->_fabricsWithActiveConnections containsObject:v4])
  {
    os_unfair_lock_unlock(v5);
  }
  else
  {
    [(NSMutableOrderedSet *)self->_fabricsWithActiveConnections addObject:v4];
    os_unfair_lock_unlock(v5);
    id v6 = (void *)MEMORY[0x2533B64D0]();
    uint64_t v7 = self;
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = HMFGetLogIdentifier();
      uint64_t v10 = [v4 fabricID];
      int v11 = 138543618;
      int v12 = v9;
      __int16 v13 = 2112;
      uint64_t v14 = v10;
      _os_log_impl(&dword_252495000, v8, OS_LOG_TYPE_INFO, "%{public}@Adding active connection for fabric: %@", (uint8_t *)&v11, 0x16u);
    }
    [v4 startOperations];
  }
}

- (id)fabricsWithActiveConnections
{
  id v3 = (os_unfair_lock_s *)((char *)self + (int)*MEMORY[0x263F35B40]);
  os_unfair_lock_lock_with_options();
  id v4 = (void *)MEMORY[0x263EFF8C0];
  uint64_t v5 = [(NSMutableOrderedSet *)self->_fabricsWithActiveConnections array];
  id v6 = [v4 arrayWithArray:v5];

  os_unfair_lock_unlock(v3);
  return v6;
}

- (void)registerPairingWindowWithSetupPayload:(id)a3 duration:(double)a4 accessoryServer:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v11 = [(HMMTRAccessoryServerBrowser *)self pairingWindowInfoTable];
  uint64_t v10 = [MEMORY[0x263EFF910] now];
  [v11 registerPairingWindowWithSetupPayload:v9 currentDate:v10 duration:v8 accessoryServer:a4];
}

- (BOOL)supportsCommissioningCertificateRetrievalForHomeUUID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HMMTRAccessoryServerBrowser *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v6 = [(HMMTRAccessoryServerBrowser *)self delegate];
    char v7 = [v6 supportsCommissioningCertificateRetrievalForHomeUUID:v4];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (BOOL)supportsCommissioningCertificateRetrievalForCurrentlyPairingAccessory
{
  id v3 = [(HMMTRAccessoryServerBrowser *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v4 = [(HMMTRAccessoryServerBrowser *)self delegate];
    char v5 = [v4 supportsCommissioningCertificateRetrievalForCurrentlyPairingAccessory];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (void)createMatterOperationalKeyPairIfAbsentWithCompletion:(id)a3
{
  id v4 = a3;
  char v5 = [(HAPAccessoryServerBrowser *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __84__HMMTRAccessoryServerBrowser_createMatterOperationalKeyPairIfAbsentWithCompletion___block_invoke;
  v7[3] = &unk_2653770F0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __84__HMMTRAccessoryServerBrowser_createMatterOperationalKeyPairIfAbsentWithCompletion___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) _createOperationalKeyPairIfAbsent];
  uint64_t v3 = *(void *)(a1 + 40);
  if (v2)
  {
    id v4 = *(void (**)(uint64_t, void))(v3 + 16);
    v4(v3, 0);
  }
  else
  {
    id v5 = [MEMORY[0x263F087E8] hapErrorWithCode:1];
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v5);
  }
}

- (BOOL)_createOperationalKeyPairIfAbsent
{
  uint64_t v3 = [(HMMTRAccessoryServerBrowser *)self storage];
  id v4 = [v3 operationalKeyPair];

  if (!v4)
  {
    id v5 = [(HMMTRAccessoryServerBrowser *)self ownerLocalOperationalKeyPair];
    id v6 = [(HMMTRAccessoryServerBrowser *)self storage];
    [v6 setOperationalKeyPair:v5];
  }
  char v7 = [(HMMTRAccessoryServerBrowser *)self storage];
  id v8 = [v7 operationalKeyPair];
  BOOL v9 = v8 != 0;

  return v9;
}

- (BOOL)_createFabricKeyPairsIfAbsent
{
  uint64_t v3 = [(HMMTRAccessoryServerBrowser *)self nocSigner];

  if (!v3)
  {
    id v4 = [[HMMTRMatterKeypair alloc] initWithAccount:@"CHIPPlugin.nodeopcerts.CA:0"];
    [(HMMTRAccessoryServerBrowser *)self setNocSigner:v4];

    id v5 = [(HMMTRAccessoryServerBrowser *)self nocSigner];
    id v6 = [(HMMTRAccessoryServerBrowser *)self storage];
    [v6 setNocSigner:v5];
  }
  char v7 = [(HMMTRAccessoryServerBrowser *)self ownerSharedOperationalKeyPair];

  if (!v7)
  {
    id v8 = [[HMMTRMatterKeypair alloc] initWithAccount:@"CHIPPlugin.nodeOperationalKeyPair.CA:0"];
    [(HMMTRAccessoryServerBrowser *)self setOwnerSharedOperationalKeyPair:v8];

    BOOL v9 = [(HMMTRAccessoryServerBrowser *)self ownerSharedOperationalKeyPair];

    if (v9)
    {
      uint64_t v10 = [(HMMTRAccessoryServerBrowser *)self ownerSharedOperationalKeyPair];
      id v11 = [(HMMTRAccessoryServerBrowser *)self storage];
      [v11 setOperationalKeyPair:v10];
    }
  }
  int v12 = [(HMMTRAccessoryServerBrowser *)self nocSigner];
  if (v12)
  {
    __int16 v13 = [(HMMTRAccessoryServerBrowser *)self ownerSharedOperationalKeyPair];
    BOOL v14 = v13 != 0;
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (BOOL)_loadFabricKeyPairs
{
  uint64_t v3 = [(HMMTRAccessoryServerBrowser *)self nocSigner];

  if (!v3)
  {
    id v4 = [[HMMTRMatterKeypair alloc] initWithV0Account:@"CHIPPlugin.nodeopcerts.CA:0"];
    [(HMMTRAccessoryServerBrowser *)self setNocSigner:v4];

    id v5 = [(HMMTRAccessoryServerBrowser *)self nocSigner];
    id v6 = [(HMMTRAccessoryServerBrowser *)self storage];
    [v6 setNocSigner:v5];
  }
  char v7 = [(HMMTRAccessoryServerBrowser *)self ownerSharedOperationalKeyPair];

  if (!v7)
  {
    id v8 = [[HMMTRMatterKeypair alloc] initWithV0Account:@"CHIPPlugin.nodeOperationalKeyPair.CA:0"];
    [(HMMTRAccessoryServerBrowser *)self setOwnerSharedOperationalKeyPair:v8];

    BOOL v9 = [(HMMTRAccessoryServerBrowser *)self ownerSharedOperationalKeyPair];
    uint64_t v10 = [(HMMTRAccessoryServerBrowser *)self storage];
    [v10 setOperationalKeyPair:v9];
  }
  id v11 = [(HMMTRAccessoryServerBrowser *)self nocSigner];
  if (v11)
  {
    int v12 = [(HMMTRAccessoryServerBrowser *)self ownerSharedOperationalKeyPair];
    BOOL v13 = v12 != 0;
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (void)commitStagedAccessoryServer:(id)a3
{
  id v4 = a3;
  id v5 = [(HAPAccessoryServerBrowser *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __59__HMMTRAccessoryServerBrowser_commitStagedAccessoryServer___block_invoke;
  v7[3] = &unk_265376E98;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __59__HMMTRAccessoryServerBrowser_commitStagedAccessoryServer___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  int v2 = (void *)MEMORY[0x2533B64D0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    int v11 = 138543618;
    int v12 = v5;
    __int16 v13 = 2112;
    uint64_t v14 = v6;
    _os_log_impl(&dword_252495000, v4, OS_LOG_TYPE_INFO, "%{public}@Committing staged server: %@", (uint8_t *)&v11, 0x16u);
  }
  [*(id *)(a1 + 40) commitStagedPairing];
  char v7 = *(void **)(a1 + 32);
  id v8 = [*(id *)(a1 + 40) identifier];
  [v7 registerPairedAccessoryWithIdentifier:v8];

  BOOL v9 = [*(id *)(a1 + 32) discoveredAccessoryServers];
  [v9 addObject:*(void *)(a1 + 40)];

  uint64_t v10 = [*(id *)(a1 + 32) stagedAccessoryServers];
  [v10 removeObject:*(void *)(a1 + 40)];
}

- (void)invalidateAccessoryServer:(id)a3 reason:(id)a4
{
}

- (void)_invalidateAccessoryServer:(id)a3 reason:(id)a4 withCompletion:(id)a5
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(void))a5;
  int v11 = v10;
  if (v8)
  {
    int v12 = [v8 removeReason];
    uint64_t v13 = [v8 pairingEndContextWhenRemove];
    uint64_t v14 = (void *)v13;
    if (!v12 || !v13)
    {
      id v15 = v9;

      uint64_t v16 = +[HMMTRAccessoryPairingEndContext hmmtrContextWithCancelledError:v15];

      uint64_t v14 = (void *)v16;
      int v12 = v15;
    }
    long long v17 = (void *)MEMORY[0x2533B64D0]();
    long long v18 = self;
    long long v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      int v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138544130;
      long long v40 = v20;
      __int16 v41 = 2112;
      id v42 = v8;
      __int16 v43 = 2112;
      long long v44 = v12;
      __int16 v45 = 2112;
      long long v46 = v14;
      _os_log_impl(&dword_252495000, v19, OS_LOG_TYPE_INFO, "%{public}@Invalidating accessory Server: %@ for reason: %@ context: %@", buf, 0x2Au);
    }
    [v8 setRemoveReason:0 pairingEndContextWhenRemove:0];
    if (([v8 locallyDiscovered] & 1) == 0) {
      [(NSMutableSet *)v18->_discoveredAccessoryServers removeObject:v8];
    }
    [(NSMutableSet *)v18->_stagedAccessoryServers removeObject:v8];
    if ([v8 locallyDiscovered])
    {
      id v21 = (void *)MEMORY[0x2533B64D0]();
      long long v22 = v18;
      long long v23 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        long long v24 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        long long v40 = v24;
        __int16 v41 = 2112;
        id v42 = v8;
        _os_log_impl(&dword_252495000, v23, OS_LOG_TYPE_INFO, "%{public}@Keeping the locally discovered server: %@", buf, 0x16u);
      }
    }
    else
    {
      [v8 setReachable:0];
      [v8 setControllerWrapper:0];
    }
    [v8 setSecuritySessionOpen:0];
    if (([v8 locallyDiscovered] & 1) == 0)
    {
      long long v25 = [(HMMTRAccessoryServerBrowser *)v18 delegate];
      if ([v25 conformsToProtocol:&unk_2702F5170]) {
        long long v26 = v25;
      }
      else {
        long long v26 = 0;
      }
      id v27 = v26;

      if (v27)
      {
        long long v28 = [(HMMTRAccessoryServerBrowser *)v18 delegateQueue];
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __80__HMMTRAccessoryServerBrowser__invalidateAccessoryServer_reason_withCompletion___block_invoke;
        block[3] = &unk_265376870;
        id v34 = v27;
        __int16 v35 = v18;
        id v36 = v8;
        id v37 = v12;
        id v38 = v14;
        dispatch_async(v28, block);
      }
      else
      {
        long long v29 = (void *)MEMORY[0x2533B64D0]();
        long long v30 = v18;
        long long v31 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          uint64_t v32 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          long long v40 = v32;
          _os_log_impl(&dword_252495000, v31, OS_LOG_TYPE_ERROR, "%{public}@Unable to find delegate conforming to HMMTRHAPAccessoryServerBrowserPairingDelegate", buf, 0xCu);
        }
      }
    }
    if (v11) {
      v11[2](v11);
    }
  }
  else if (v10)
  {
    v10[2](v10);
  }
}

uint64_t __80__HMMTRAccessoryServerBrowser__invalidateAccessoryServer_reason_withCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) accessoryServerBrowser:*(void *)(a1 + 40) didRemoveAccessoryServer:*(void *)(a1 + 48) error:*(void *)(a1 + 56) matterPairingEndContext:*(void *)(a1 + 64)];
}

- (void)invalidateAccessoryServer:(id)a3 reason:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __79__HMMTRAccessoryServerBrowser_invalidateAccessoryServer_reason_withCompletion___block_invoke;
  v14[3] = &unk_265376848;
  objc_copyWeak(&v18, &location);
  id v11 = v8;
  id v15 = v11;
  id v12 = v9;
  id v16 = v12;
  id v13 = v10;
  id v17 = v13;
  [(HMMTRAccessoryServerBrowser *)self dispatchBlock:v14];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

void __79__HMMTRAccessoryServerBrowser_invalidateAccessoryServer_reason_withCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained _invalidateAccessoryServer:*(void *)(a1 + 32) reason:*(void *)(a1 + 40) withCompletion:*(void *)(a1 + 48)];
}

- (void)invalidateAllDiscoveredServersWithReason:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = [(HAPAccessoryServerBrowser *)self workQueue];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __83__HMMTRAccessoryServerBrowser_invalidateAllDiscoveredServersWithReason_completion___block_invoke;
  v11[3] = &unk_265376620;
  objc_copyWeak(&v14, &location);
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __83__HMMTRAccessoryServerBrowser_invalidateAllDiscoveredServersWithReason_completion___block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  int v2 = (void *)MEMORY[0x2533B64D0]();
  id v3 = WeakRetained;
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    long long v26 = v5;
    _os_log_impl(&dword_252495000, v4, OS_LOG_TYPE_INFO, "%{public}@Disabling and invalidating all servers...", buf, 0xCu);
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v6 = [v3 _allServers];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if (([v11 isKnownToSystemCommissioner] & 1) == 0)
        {
          if ([v11 pairedState] && (objc_msgSend(v11, "removalInProgress") & 1) == 0)
          {
            id v16 = (void *)MEMORY[0x2533B64D0]();
            id v17 = v3;
            id v18 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
            {
              long long v19 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543618;
              long long v26 = v19;
              __int16 v27 = 2112;
              long long v28 = v11;
              _os_log_impl(&dword_252495000, v18, OS_LOG_TYPE_INFO, "%{public}@Disabling server: %@", buf, 0x16u);
            }
            [v11 disable];
          }
          else
          {
            id v12 = (void *)MEMORY[0x2533B64D0]();
            id v13 = v3;
            id v14 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
            {
              id v15 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543618;
              long long v26 = v15;
              __int16 v27 = 2112;
              long long v28 = v11;
              _os_log_impl(&dword_252495000, v14, OS_LOG_TYPE_DEBUG, "%{public}@Ignoring unpaired server: %@", buf, 0x16u);
            }
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v8);
  }

  [v3 _cleanupDiscoveredServersWithReason:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
}

- (void)handleHomeRemovedAccessoryWithNodeID:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __68__HMMTRAccessoryServerBrowser_handleHomeRemovedAccessoryWithNodeID___block_invoke;
  v6[3] = &unk_265376E98;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(HMMTRAccessoryServerBrowser *)self dispatchBlock:v6];
}

uint64_t __68__HMMTRAccessoryServerBrowser_handleHomeRemovedAccessoryWithNodeID___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  int v2 = (void *)MEMORY[0x2533B64D0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    int v8 = 138543618;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    _os_log_impl(&dword_252495000, v4, OS_LOG_TYPE_INFO, "%{public}@Accessory with node ID %@ was removed from home", (uint8_t *)&v8, 0x16u);
  }
  return [*(id *)(a1 + 32) _cleanupDiscoveredServers];
}

- (void)handleHomeAddedAccessoryWithNodeID:(id)a3 fabric:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [(HAPAccessoryServerBrowser *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __73__HMMTRAccessoryServerBrowser_handleHomeAddedAccessoryWithNodeID_fabric___block_invoke;
  block[3] = &unk_265376F38;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __73__HMMTRAccessoryServerBrowser_handleHomeAddedAccessoryWithNodeID_fabric___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  int v2 = [*(id *)(a1 + 32) nodesAddedToHome];
  [v2 addObject:*(void *)(a1 + 40)];

  id v3 = (void *)MEMORY[0x2533B64D0]();
  id v4 = *(id *)(a1 + 32);
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    uint64_t v7 = *(void *)(a1 + 40);
    uint64_t v8 = *(void *)(a1 + 48);
    int v10 = 138543874;
    uint64_t v11 = v6;
    __int16 v12 = 2112;
    uint64_t v13 = v7;
    __int16 v14 = 2112;
    uint64_t v15 = v8;
    _os_log_impl(&dword_252495000, v5, OS_LOG_TYPE_INFO, "%{public}@Accessory with node ID %@ was added to home with fabric %@", (uint8_t *)&v10, 0x20u);
  }
  uint64_t result = [*(id *)(a1 + 32) _setupPairedDevices];
  if (*(void *)(a1 + 48)) {
    return objc_msgSend(*(id *)(a1 + 32), "getNOCFromResidentForSharedUserForFabric:");
  }
  return result;
}

- (id)nodeIDForFabricID:(id)a3 deviceIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  int v20 = __Block_byref_object_copy__7596;
  long long v21 = __Block_byref_object_dispose__7597;
  id v22 = 0;
  uint64_t v8 = [(HAPAccessoryServerBrowser *)self workQueue];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __66__HMMTRAccessoryServerBrowser_nodeIDForFabricID_deviceIdentifier___block_invoke;
  v13[3] = &unk_265376820;
  void v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  uint64_t v16 = &v17;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(v8, v13);

  id v11 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v11;
}

void __66__HMMTRAccessoryServerBrowser_nodeIDForFabricID_deviceIdentifier___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) storage];
  uint64_t v2 = [v5 nodeIDForFabricID:*(void *)(a1 + 40) deviceIdentifier:*(void *)(a1 + 48)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)accessoryServerForSystemCommissionerDeviceWithNodeID:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HAPAccessoryServerBrowser *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __102__HMMTRAccessoryServerBrowser_accessoryServerForSystemCommissionerDeviceWithNodeID_completionHandler___block_invoke;
  block[3] = &unk_265378900;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __102__HMMTRAccessoryServerBrowser_accessoryServerForSystemCommissionerDeviceWithNodeID_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _accessoryServerForSystemCommissionerDeviceWithNodeID:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

- (void)readCommissioningWindowStatusForSystemCommissionerDeviceWithNodeID:(id)a3 completionHandler:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)MEMORY[0x2533B64D0]();
  id v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    uint64_t v19 = v11;
    __int16 v20 = 2112;
    id v21 = v6;
    _os_log_impl(&dword_252495000, v10, OS_LOG_TYPE_INFO, "%{public}@Received request to read commissioning window status for node (%@) from System Commissioner Fabric", buf, 0x16u);
  }
  id v12 = [(HAPAccessoryServerBrowser *)v9 workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __116__HMMTRAccessoryServerBrowser_readCommissioningWindowStatusForSystemCommissionerDeviceWithNodeID_completionHandler___block_invoke;
  block[3] = &unk_265378900;
  void block[4] = v9;
  id v16 = v6;
  id v17 = v7;
  id v13 = v7;
  id v14 = v6;
  dispatch_async(v12, block);
}

void __116__HMMTRAccessoryServerBrowser_readCommissioningWindowStatusForSystemCommissionerDeviceWithNodeID_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __116__HMMTRAccessoryServerBrowser_readCommissioningWindowStatusForSystemCommissionerDeviceWithNodeID_completionHandler___block_invoke_2;
  v7[3] = &unk_2653767D0;
  id v4 = *(id *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(a1 + 40);
  id v9 = v4;
  void v7[4] = v5;
  id v8 = v6;
  [v2 _accessoryServerForSystemCommissionerDeviceWithNodeID:v3 completionHandler:v7];
}

void __116__HMMTRAccessoryServerBrowser_readCommissioningWindowStatusForSystemCommissionerDeviceWithNodeID_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    [v5 readPairingWindowStatusWithCompletionHandler:*(void *)(a1 + 48)];
  }
  else
  {
    id v7 = (void *)MEMORY[0x2533B64D0]();
    id v8 = *(id *)(a1 + 32);
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = HMFGetLogIdentifier();
      uint64_t v11 = *(void *)(a1 + 40);
      int v12 = 138543874;
      id v13 = v10;
      __int16 v14 = 2112;
      uint64_t v15 = v11;
      __int16 v16 = 2112;
      id v17 = v6;
      _os_log_impl(&dword_252495000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to retrieve accessory server for node %@ to read commissioning window status, error: %@", (uint8_t *)&v12, 0x20u);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)openCommissioningWindowForSystemCommissionerDeviceWithNodeID:(id)a3 duration:(double)a4 completionHandler:(id)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  id v10 = (void *)MEMORY[0x2533B64D0]();
  uint64_t v11 = self;
  int v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    id v13 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    uint64_t v22 = v13;
    __int16 v23 = 2112;
    id v24 = v8;
    __int16 v25 = 2048;
    double v26 = a4;
    _os_log_impl(&dword_252495000, v12, OS_LOG_TYPE_INFO, "%{public}@Received request to open commissioning window for node (%@) from System Commissioner Fabric, for %fs", buf, 0x20u);
  }
  __int16 v14 = [(HAPAccessoryServerBrowser *)v11 workQueue];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __119__HMMTRAccessoryServerBrowser_openCommissioningWindowForSystemCommissionerDeviceWithNodeID_duration_completionHandler___block_invoke;
  v17[3] = &unk_265377408;
  void v17[4] = v11;
  id v18 = v8;
  double v20 = a4;
  id v19 = v9;
  id v15 = v9;
  id v16 = v8;
  dispatch_async(v14, v17);
}

void __119__HMMTRAccessoryServerBrowser_openCommissioningWindowForSystemCommissionerDeviceWithNodeID_duration_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __119__HMMTRAccessoryServerBrowser_openCommissioningWindowForSystemCommissionerDeviceWithNodeID_duration_completionHandler___block_invoke_2;
  v4[3] = &unk_2653767F8;
  uint64_t v7 = *(void *)(a1 + 56);
  void v4[4] = v2;
  id v6 = *(id *)(a1 + 48);
  id v5 = *(id *)(a1 + 40);
  [v2 _accessoryServerForSystemCommissionerDeviceWithNodeID:v3 completionHandler:v4];
}

void __119__HMMTRAccessoryServerBrowser_openCommissioningWindowForSystemCommissionerDeviceWithNodeID_duration_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    double v7 = *(double *)(a1 + 56);
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __119__HMMTRAccessoryServerBrowser_openCommissioningWindowForSystemCommissionerDeviceWithNodeID_duration_completionHandler___block_invoke_3;
    v13[3] = &unk_265377548;
    void v13[4] = *(void *)(a1 + 32);
    id v14 = *(id *)(a1 + 48);
    [v5 openPairingWindowWithPINForDuration:v13 completionHandler:v7];
  }
  else
  {
    id v8 = (void *)MEMORY[0x2533B64D0]();
    id v9 = *(id *)(a1 + 32);
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      uint64_t v12 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      id v16 = v11;
      __int16 v17 = 2112;
      uint64_t v18 = v12;
      __int16 v19 = 2112;
      id v20 = v6;
      _os_log_impl(&dword_252495000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to retrieve accessory server for node %@ to open commissioning window, error: %@", buf, 0x20u);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __119__HMMTRAccessoryServerBrowser_openCommissioningWindowForSystemCommissionerDeviceWithNodeID_duration_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (!v5)
  {
    id v9 = 0;
    goto LABEL_5;
  }
  id v15 = 0;
  uint64_t v7 = [MEMORY[0x263F10FE0] setupPayloadWithOnboardingPayload:v5 error:&v15];
  id v8 = v15;
  id v9 = v8;
  if (v7)
  {

    id v9 = (void *)v7;
LABEL_5:
    id v10 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    goto LABEL_9;
  }
  uint64_t v11 = (void *)MEMORY[0x2533B64D0]();
  id v12 = *(id *)(a1 + 32);
  id v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    id v14 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    __int16 v17 = v14;
    _os_log_impl(&dword_252495000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to convert onboarding payload to setup payload", buf, 0xCu);
  }
  id v10 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
LABEL_9:
  v10();
}

- (void)removeAllDevicePairingsForSystemCommissionerDeviceWithNodeID:(id)a3 completionHandler:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x2533B64D0]();
  id v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    __int16 v19 = v11;
    __int16 v20 = 2112;
    id v21 = v6;
    _os_log_impl(&dword_252495000, v10, OS_LOG_TYPE_INFO, "%{public}@Received request to remove node (%@) from System Commissioner Fabric", buf, 0x16u);
  }
  id v12 = [MEMORY[0x263F087E8] hmmtrErrorWithCode:9];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __110__HMMTRAccessoryServerBrowser_removeAllDevicePairingsForSystemCommissionerDeviceWithNodeID_completionHandler___block_invoke;
  v15[3] = &unk_265378900;
  void v15[4] = v9;
  id v16 = v6;
  id v17 = v7;
  id v13 = v7;
  id v14 = v6;
  [(HMMTRAccessoryServerBrowser *)v9 invalidateAllDiscoveredServersWithReason:v12 completion:v15];
}

void __110__HMMTRAccessoryServerBrowser_removeAllDevicePairingsForSystemCommissionerDeviceWithNodeID_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __110__HMMTRAccessoryServerBrowser_removeAllDevicePairingsForSystemCommissionerDeviceWithNodeID_completionHandler___block_invoke_2;
  v4[3] = &unk_2653767D0;
  void v4[4] = v3;
  id v5 = v2;
  id v6 = *(id *)(a1 + 48);
  [v3 _accessoryServerForSystemCommissionerDeviceWithNodeID:v5 completionHandler:v4];
}

void __110__HMMTRAccessoryServerBrowser_removeAllDevicePairingsForSystemCommissionerDeviceWithNodeID_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) storage];
  [v4 removeRecordsForSystemCommissionerFabricNode:*(void *)(a1 + 40)];

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  if (v3)
  {
    [v3 setRemovalInProgress:1];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __110__HMMTRAccessoryServerBrowser_removeAllDevicePairingsForSystemCommissionerDeviceWithNodeID_completionHandler___block_invoke_3;
    v14[3] = &unk_265376E98;
    id v5 = v3;
    uint64_t v6 = *(void *)(a1 + 32);
    id v15 = v5;
    uint64_t v16 = v6;
    id v7 = (void *)MEMORY[0x2533B66E0](v14);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __110__HMMTRAccessoryServerBrowser_removeAllDevicePairingsForSystemCommissionerDeviceWithNodeID_completionHandler___block_invoke_4;
    v10[3] = &unk_2653767A8;
    id v8 = *(void **)(a1 + 40);
    void v10[4] = *(void *)(a1 + 32);
    id v11 = v8;
    id v12 = v5;
    id v13 = v7;
    id v9 = v7;
    [v12 fetchPairingsWithCompletionHandler:v10];
  }
}

uint64_t __110__HMMTRAccessoryServerBrowser_removeAllDevicePairingsForSystemCommissionerDeviceWithNodeID_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2)
  {
    [v2 disable];
    uint64_t v4 = *(void *)(a1 + 32);
    id v3 = *(void **)(a1 + 40);
    id v5 = [MEMORY[0x263F087E8] hmmtrErrorWithCode:12];
    [v3 invalidateAccessoryServer:v4 reason:v5];
  }
  uint64_t v6 = *(void **)(a1 + 40);
  return [v6 setSystemCommissionerMode:0];
}

void __110__HMMTRAccessoryServerBrowser_removeAllDevicePairingsForSystemCommissionerDeviceWithNodeID_completionHandler___block_invoke_4(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v33 = a3;
  id v8 = a4;
  uint64_t v42 = 0;
  __int16 v43 = &v42;
  uint64_t v44 = 0x3032000000;
  __int16 v45 = __Block_byref_object_copy__7596;
  long long v46 = __Block_byref_object_dispose__7597;
  id v47 = [MEMORY[0x263EFF980] array];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v38 objects:v54 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v39;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v39 != v11) {
          objc_enumerationMutation(v9);
        }
        id v13 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        id v14 = [v13 vendorID];
        BOOL v15 = [v14 integerValue] == 4937;

        if (v15)
        {
          uint64_t v16 = (void *)v43[5];
          id v17 = [v13 nodeID];
          [v16 addObject:v17];

          uint64_t v18 = (void *)MEMORY[0x2533B64D0]();
          id v19 = *(id *)(a1 + 32);
          HMFGetOSLogHandle();
          __int16 v20 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            id v21 = (id)objc_claimAutoreleasedReturnValue();
            uint64_t v22 = [v13 nodeID];
            uint64_t v23 = *(void *)(a1 + 40);
            *(_DWORD *)buf = 138543874;
            id v49 = v21;
            __int16 v50 = 2112;
            long long v51 = v22;
            __int16 v52 = 2112;
            uint64_t v53 = v23;
            _os_log_impl(&dword_252495000, v20, OS_LOG_TYPE_INFO, "%{public}@Found Apple Home pairing with node id %@ during removeAllDevicePairingsForSystemCommissionerDeviceWithNodeID: %@", buf, 0x20u);
          }
          goto LABEL_13;
        }
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v38 objects:v54 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  id v24 = (void *)MEMORY[0x2533B64D0]([*(id *)(a1 + 48) setBlockInvalidation:1]);
  id v25 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  double v26 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    uint64_t v27 = HMFGetLogIdentifier();
    long long v28 = *(void **)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    id v49 = v27;
    __int16 v50 = 2112;
    long long v51 = v28;
    _os_log_impl(&dword_252495000, v26, OS_LOG_TYPE_INFO, "%{public}@Now removing all connected services for %@ ...", buf, 0x16u);
  }
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  void v34[2] = __110__HMMTRAccessoryServerBrowser_removeAllDevicePairingsForSystemCommissionerDeviceWithNodeID_completionHandler___block_invoke_193;
  v34[3] = &unk_265378A18;
  long long v29 = *(void **)(a1 + 48);
  id v30 = *(id *)(a1 + 56);
  uint64_t v31 = *(void *)(a1 + 32);
  uint64_t v32 = *(void **)(a1 + 40);
  id v36 = v30;
  v34[4] = v31;
  id v35 = v32;
  id v37 = &v42;
  [v29 removeAllPairingsWithCompletionHandler:v34];

  _Block_object_dispose(&v42, 8);
}

void __110__HMMTRAccessoryServerBrowser_removeAllDevicePairingsForSystemCommissionerDeviceWithNodeID_completionHandler___block_invoke_193(uint64_t a1, void *a2)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
  id v5 = (void *)MEMORY[0x2533B64D0](v4);
  id v6 = *(id *)(a1 + 32);
  id v7 = HMFGetOSLogHandle();
  id v8 = v7;
  if (v3)
  {
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    id v9 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    uint64_t v32 = v9;
    __int16 v33 = 2112;
    id v34 = v3;
    uint64_t v10 = "%{public}@Failed remove all connected services for node (%@) with error";
    uint64_t v11 = v8;
    os_log_type_t v12 = OS_LOG_TYPE_ERROR;
  }
  else
  {
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO)) {
      goto LABEL_7;
    }
    id v9 = HMFGetLogIdentifier();
    id v13 = *(void **)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    uint64_t v32 = v9;
    __int16 v33 = 2112;
    id v34 = v13;
    uint64_t v10 = "%{public}@Successfully removed all connected services for node (%@)";
    uint64_t v11 = v8;
    os_log_type_t v12 = OS_LOG_TYPE_INFO;
  }
  _os_log_impl(&dword_252495000, v11, v12, v10, buf, 0x16u);

LABEL_7:
  id v25 = v3;

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v14 = *(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  uint64_t v15 = [v14 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v27 != v17) {
          objc_enumerationMutation(v14);
        }
        id v19 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        __int16 v20 = (void *)MEMORY[0x2533B64D0]();
        id v21 = *(id *)(a1 + 32);
        uint64_t v22 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          uint64_t v23 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          uint64_t v32 = v23;
          __int16 v33 = 2112;
          id v34 = v19;
          _os_log_impl(&dword_252495000, v22, OS_LOG_TYPE_INFO, "%{public}@Apple Home pairing is present. Removing accessory from Apple Home with node ID %@", buf, 0x16u);
        }
        id v24 = [*(id *)(a1 + 32) accessoryServerBrowserDelegate];
        [v24 browser:*(void *)(a1 + 32) didRemoveAccessoryPairingWithNodeID:v19];
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v16);
  }
}

- (void)_fetchDevicePairingsForSystemCommissionerDeviceWithNodeID:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __107__HMMTRAccessoryServerBrowser__fetchDevicePairingsForSystemCommissionerDeviceWithNodeID_completionHandler___block_invoke;
  v10[3] = &unk_2653767D0;
  id v11 = v6;
  id v12 = v7;
  void v10[4] = self;
  id v8 = v6;
  id v9 = v7;
  [(HMMTRAccessoryServerBrowser *)self _accessoryServerForSystemCommissionerDeviceWithNodeID:v8 completionHandler:v10];
}

void __107__HMMTRAccessoryServerBrowser__fetchDevicePairingsForSystemCommissionerDeviceWithNodeID_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __107__HMMTRAccessoryServerBrowser__fetchDevicePairingsForSystemCommissionerDeviceWithNodeID_completionHandler___block_invoke_2;
    v22[3] = &unk_265376780;
    id v23 = *(id *)(a1 + 48);
    id v7 = (void *)MEMORY[0x2533B66E0](v22);
    id v8 = (void *)MEMORY[0x2533B64D0]();
    id v9 = *(id *)(a1 + 32);
    uint64_t v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v11 = HMFGetLogIdentifier();
      uint64_t v12 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      id v25 = v11;
      __int16 v26 = 2112;
      uint64_t v27 = v12;
      _os_log_impl(&dword_252495000, v10, OS_LOG_TYPE_INFO, "%{public}@Now fetching connected services for %@ ...", buf, 0x16u);
    }
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __107__HMMTRAccessoryServerBrowser__fetchDevicePairingsForSystemCommissionerDeviceWithNodeID_completionHandler___block_invoke_191;
    v17[3] = &unk_2653767A8;
    id v13 = v5;
    uint64_t v14 = *(void *)(a1 + 32);
    uint64_t v15 = *(void **)(a1 + 40);
    id v18 = v13;
    uint64_t v19 = v14;
    id v21 = v7;
    id v20 = v15;
    id v16 = v7;
    [v13 fetchPairingsWithCompletionHandler:v17];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

uint64_t __107__HMMTRAccessoryServerBrowser__fetchDevicePairingsForSystemCommissionerDeviceWithNodeID_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __107__HMMTRAccessoryServerBrowser__fetchDevicePairingsForSystemCommissionerDeviceWithNodeID_completionHandler___block_invoke_191(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void *)MEMORY[0x2533B64D0]([*(id *)(a1 + 32) setBlockInvalidation:0]);
  id v11 = *(id *)(a1 + 40);
  uint64_t v12 = HMFGetOSLogHandle();
  id v13 = v12;
  if (v8)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = HMFGetLogIdentifier();
      int v20 = 138543618;
      id v21 = v14;
      __int16 v22 = 2112;
      id v23 = v8;
      _os_log_impl(&dword_252495000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch connected services for node (%@) with error", (uint8_t *)&v20, 0x16u);
    }
    uint64_t v15 = *(void *)(a1 + 56);
    uint64_t v16 = *(void *)(a1 + 32);
    uint64_t v17 = [MEMORY[0x263F087E8] hmfErrorWithCode:2];
    (*(void (**)(uint64_t, void, uint64_t, void *))(v15 + 16))(v15, 0, v16, v17);
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      id v18 = HMFGetLogIdentifier();
      uint64_t v19 = *(void **)(a1 + 48);
      int v20 = 138543874;
      id v21 = v18;
      __int16 v22 = 2112;
      id v23 = v19;
      __int16 v24 = 2112;
      id v25 = v7;
      _os_log_impl(&dword_252495000, v13, OS_LOG_TYPE_INFO, "%{public}@Successfully fetched connected services for node (%@) %@", (uint8_t *)&v20, 0x20u);
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

- (void)_accessoryServerForSystemCommissionerDeviceWithNodeID:(id)a3 completionHandler:(id)a4
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMMTRAccessoryServerBrowser *)self systemCommissionerFabricID];

  if (v8)
  {
    v41[0] = MEMORY[0x263EF8330];
    v41[1] = 3221225472;
    v41[2] = __103__HMMTRAccessoryServerBrowser__accessoryServerForSystemCommissionerDeviceWithNodeID_completionHandler___block_invoke;
    v41[3] = &unk_265376758;
    v41[4] = self;
    id v36 = v7;
    id v42 = v7;
    id v9 = (void (**)(void, void, void))MEMORY[0x2533B66E0](v41);
    [(HMMTRAccessoryServerBrowser *)self setSystemCommissionerMode:1];
    uint64_t v10 = [(HMMTRAccessoryServerBrowser *)self storage];
    [v10 setSystemCommissionerFabric:1];

    id v11 = [(HMMTRAccessoryServerBrowser *)self storage];
    uint64_t v12 = [(HMMTRAccessoryServerBrowser *)self systemCommissionerFabricID];
    [v11 prepareStorageForFabricID:v12];

    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v13 = [(HMMTRAccessoryServerBrowser *)self _allServers];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v37 objects:v47 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v38;
LABEL_4:
      uint64_t v17 = 0;
      while (1)
      {
        if (*(void *)v38 != v16) {
          objc_enumerationMutation(v13);
        }
        id v18 = *(void **)(*((void *)&v37 + 1) + 8 * v17);
        uint64_t v19 = [v18 nodeID];
        char v20 = [v19 isEqualToNumber:v6];

        if (v20) {
          break;
        }
        if (v15 == ++v17)
        {
          uint64_t v15 = [v13 countByEnumeratingWithState:&v37 objects:v47 count:16];
          if (v15) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
      id v21 = v18;

      if (v21) {
        goto LABEL_13;
      }
    }
    else
    {
LABEL_10:
    }
    -[HMMTRAccessoryServerBrowser _createCHIPAccessoryForNodeID:](self, "_createCHIPAccessoryForNodeID:", [v6 unsignedLongLongValue]);
    id v21 = (id)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
LABEL_13:
      __int16 v22 = (void *)MEMORY[0x2533B64D0]();
      id v23 = self;
      __int16 v24 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        id v25 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        uint64_t v44 = v25;
        __int16 v45 = 2112;
        id v46 = v6;
        _os_log_impl(&dword_252495000, v24, OS_LOG_TYPE_INFO, "%{public}@Found paired device (%@) in System Commissioner Storage", buf, 0x16u);
      }
      [v21 setBlockInvalidation:1];
      uint64_t v26 = [(HMMTRAccessoryServerBrowser *)v23 systemCommissionerControllerWrapper];
      [v21 setControllerWrapper:v26];

      ((void (**)(void, id, void))v9)[2](v9, v21, 0);
    }
    else
    {
      uint64_t v32 = (void *)MEMORY[0x2533B64D0]();
      __int16 v33 = self;
      id v34 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        uint64_t v35 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        uint64_t v44 = v35;
        __int16 v45 = 2112;
        id v46 = v6;
        _os_log_impl(&dword_252495000, v34, OS_LOG_TYPE_INFO, "%{public}@Failed to create server with node ID (%@)", buf, 0x16u);
      }
      id v21 = [MEMORY[0x263F087E8] hmfErrorWithCode:11];
      ((void (**)(void, void, id))v9)[2](v9, 0, v21);
    }
    id v7 = v36;
  }
  else
  {
    uint64_t v27 = (void *)MEMORY[0x2533B64D0]();
    uint64_t v28 = self;
    long long v29 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      id v30 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v44 = v30;
      _os_log_impl(&dword_252495000, v29, OS_LOG_TYPE_ERROR, "%{public}@System Commissioner Fabric is not set up yet", buf, 0xCu);
    }
    uint64_t v31 = [MEMORY[0x263F087E8] hmfErrorWithCode:2];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v31);
  }
}

void __103__HMMTRAccessoryServerBrowser__accessoryServerForSystemCommissionerDeviceWithNodeID_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  [v5 setSystemCommissionerMode:0];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)removeDevicePairingFabricForSystemCommissionerDeviceWithNodeID:(id)a3 fabric:(id)a4 completionHandler:(id)a5
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(HAPAccessoryServerBrowser *)self workQueue];
  dispatch_assert_queue_V2(v11);

  uint64_t v12 = (void *)MEMORY[0x2533B64D0]();
  id v13 = self;
  uint64_t v14 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    uint64_t v15 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    uint64_t v28 = v15;
    __int16 v29 = 2112;
    id v30 = v9;
    __int16 v31 = 2112;
    id v32 = v8;
    _os_log_impl(&dword_252495000, v14, OS_LOG_TYPE_INFO, "%{public}@Received request to remove connected service with UUID %@ for node (%@)", buf, 0x20u);
  }
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  void v25[2] = __119__HMMTRAccessoryServerBrowser_removeDevicePairingFabricForSystemCommissionerDeviceWithNodeID_fabric_completionHandler___block_invoke;
  v25[3] = &unk_265378578;
  v25[4] = v13;
  id v26 = v10;
  id v16 = v10;
  uint64_t v17 = (void *)MEMORY[0x2533B66E0](v25);
  [(HMMTRAccessoryServerBrowser *)v13 setSystemCommissionerMode:1];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __119__HMMTRAccessoryServerBrowser_removeDevicePairingFabricForSystemCommissionerDeviceWithNodeID_fabric_completionHandler___block_invoke_2;
  v21[3] = &unk_265376730;
  v21[4] = v13;
  id v22 = v9;
  id v23 = v8;
  id v24 = v17;
  id v18 = v8;
  id v19 = v17;
  id v20 = v9;
  [(HMMTRAccessoryServerBrowser *)v13 _fetchDevicePairingsForSystemCommissionerDeviceWithNodeID:v18 completionHandler:v21];
}

void __119__HMMTRAccessoryServerBrowser_removeDevicePairingFabricForSystemCommissionerDeviceWithNodeID_fabric_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 setSystemCommissionerMode:0];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __119__HMMTRAccessoryServerBrowser_removeDevicePairingFabricForSystemCommissionerDeviceWithNodeID_fabric_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v78 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (!v9)
  {
    uint64_t v59 = a1;
    id v54 = v7;
    long long v69 = 0u;
    long long v70 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    id v16 = v7;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v67 objects:v71 count:16];
    uint64_t v55 = v8;
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v58 = 0;
      obuint64_t j = v16;
      uint64_t v57 = *(void *)v68;
LABEL_7:
      uint64_t v19 = 0;
      while (1)
      {
        if (*(void *)v68 != v57) {
          objc_enumerationMutation(obj);
        }
        id v20 = *(void **)(*((void *)&v67 + 1) + 8 * v19);
        id v21 = objc_alloc(MEMORY[0x263F11040]);
        id v22 = [v20 vendorID];
        id v23 = [v20 vendorName];
        id v24 = (void *)[v21 initWithIdentifier:v22 displayName:v23];

        id v25 = objc_alloc(MEMORY[0x263F11028]);
        id v26 = [v20 rootPublicKey];
        uint64_t v27 = (void *)[v25 initWithRootPublicKey:v26 vendor:v24];

        id v28 = objc_alloc(MEMORY[0x263F11030]);
        __int16 v29 = [v20 fabricID];
        id v30 = [v20 fabricID];
        __int16 v31 = [v20 fabricLabel];
        id v32 = (void *)[v28 initWithIdentifier:v29 index:v30 displayName:v31 ecosystem:v27];

        id v33 = objc_alloc(MEMORY[0x263F11020]);
        id v34 = [v20 nodeID];
        uint64_t v35 = (void *)[v33 initWithNodeID:v34 fabric:v32];

        id v36 = [v35 uuid];
        int v37 = [v36 isEqual:*(void *)(v59 + 40)];

        if (v37)
        {
          id v38 = v20;

          uint64_t v58 = v38;
        }

        if (v37) {
          break;
        }
        if (v18 == ++v19)
        {
          uint64_t v18 = [obj countByEnumeratingWithState:&v67 objects:v71 count:16];
          if (v18) {
            goto LABEL_7;
          }
          break;
        }
      }

      if (v58)
      {
        long long v39 = (void *)MEMORY[0x2533B64D0]();
        id v40 = *(id *)(v59 + 32);
        long long v41 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
        {
          id v42 = HMFGetLogIdentifier();
          uint64_t v43 = *(void *)(v59 + 40);
          *(_DWORD *)buf = 138543618;
          __int16 v73 = v42;
          __int16 v74 = 2112;
          uint64_t v75 = v43;
          _os_log_impl(&dword_252495000, v41, OS_LOG_TYPE_INFO, "%{public}@Now removing connected service (%@)", buf, 0x16u);
        }
        [v55 setBlockInvalidation:1];
        v60[0] = MEMORY[0x263EF8330];
        v60[1] = 3221225472;
        v60[2] = __119__HMMTRAccessoryServerBrowser_removeDevicePairingFabricForSystemCommissionerDeviceWithNodeID_fabric_completionHandler___block_invoke_189;
        v60[3] = &unk_265376938;
        id v44 = v55;
        uint64_t v45 = *(void *)(v59 + 32);
        id v46 = *(void **)(v59 + 40);
        id v61 = v44;
        uint64_t v62 = v45;
        id v63 = v46;
        id v66 = *(id *)(v59 + 56);
        id v64 = *(id *)(v59 + 48);
        id v65 = v58;
        id v47 = v58;
        [v44 removePairing:v47 completionHandler:v60];

LABEL_23:
        id v7 = v54;
        id v8 = v55;
        id v9 = 0;
        goto LABEL_24;
      }
    }
    else
    {
    }
    uint64_t v48 = (void *)MEMORY[0x2533B64D0]();
    id v49 = *(id *)(v59 + 32);
    __int16 v50 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
    {
      long long v51 = HMFGetLogIdentifier();
      uint64_t v52 = *(void *)(v59 + 40);
      *(_DWORD *)buf = 138543874;
      __int16 v73 = v51;
      __int16 v74 = 2112;
      uint64_t v75 = v52;
      __int16 v76 = 2112;
      id v77 = 0;
      _os_log_impl(&dword_252495000, v50, OS_LOG_TYPE_INFO, "%{public}@Couldn't find connected service (%@) to remove for node (%@) with error", buf, 0x20u);
    }
    uint64_t v53 = *(void *)(v59 + 56);
    id v47 = [MEMORY[0x263F087E8] hmfErrorWithCode:2];
    (*(void (**)(uint64_t, id))(v53 + 16))(v53, v47);
    goto LABEL_23;
  }
  id v10 = (void *)MEMORY[0x2533B64D0]();
  uint64_t v11 = a1;
  id v12 = *(id *)(a1 + 32);
  id v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    uint64_t v14 = HMFGetLogIdentifier();
    uint64_t v15 = *(void *)(v11 + 40);
    *(_DWORD *)buf = 138543874;
    __int16 v73 = v14;
    __int16 v74 = 2112;
    uint64_t v75 = v15;
    __int16 v76 = 2112;
    id v77 = v9;
    _os_log_impl(&dword_252495000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to remove connected service (%@) for node (%@) with error", buf, 0x20u);
  }
  (*(void (**)(void))(*(void *)(v11 + 56) + 16))();
LABEL_24:
}

void __119__HMMTRAccessoryServerBrowser_removeDevicePairingFabricForSystemCommissionerDeviceWithNodeID_fabric_completionHandler___block_invoke_189(uint64_t a1, void *a2)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v3 = a2;
  [*(id *)(a1 + 32) setBlockInvalidation:0];
  [*(id *)(a1 + 32) disable];
  uint64_t v5 = *(void *)(a1 + 32);
  id v4 = *(void **)(a1 + 40);
  id v6 = [MEMORY[0x263F087E8] hmmtrErrorWithCode:12];
  [v4 invalidateAccessoryServer:v5 reason:v6];

  id v7 = (void *)MEMORY[0x2533B64D0]();
  id v8 = *(id *)(a1 + 40);
  id v9 = HMFGetOSLogHandle();
  id v10 = v9;
  if (v3)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      id v12 = *(void **)(a1 + 48);
      int v28 = 138543874;
      __int16 v29 = v11;
      __int16 v30 = 2112;
      __int16 v31 = v12;
      __int16 v32 = 2112;
      id v33 = v3;
      _os_log_impl(&dword_252495000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to remove connected service (%@) for node (%@) with error", (uint8_t *)&v28, 0x20u);
    }
    uint64_t v13 = *(void *)(a1 + 72);
    uint64_t v14 = [MEMORY[0x263F087E8] hmfErrorWithCode:15];
    (*(void (**)(uint64_t, void *))(v13 + 16))(v13, v14);
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v15 = HMFGetLogIdentifier();
      id v16 = *(void **)(a1 + 48);
      uint64_t v17 = *(void **)(a1 + 56);
      int v28 = 138543874;
      __int16 v29 = v15;
      __int16 v30 = 2112;
      __int16 v31 = v16;
      __int16 v32 = 2112;
      id v33 = v17;
      _os_log_impl(&dword_252495000, v10, OS_LOG_TYPE_INFO, "%{public}@Successfully removed connected services (%@) for node (%@)", (uint8_t *)&v28, 0x20u);
    }
    uint64_t v18 = [*(id *)(a1 + 64) vendorID];
    uint64_t v19 = [v18 integerValue];

    if (v19 == 4937)
    {
      id v20 = (void *)MEMORY[0x2533B64D0]();
      id v21 = *(id *)(a1 + 40);
      id v22 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        id v23 = HMFGetLogIdentifier();
        id v24 = [*(id *)(a1 + 64) nodeID];
        int v28 = 138543618;
        __int16 v29 = v23;
        __int16 v30 = 2112;
        __int16 v31 = v24;
        _os_log_impl(&dword_252495000, v22, OS_LOG_TYPE_INFO, "%{public}@Apple Home pairing has been removed. Removing accessory from Apple Home with node ID %@", (uint8_t *)&v28, 0x16u);
      }
      id v25 = [*(id *)(a1 + 40) accessoryServerBrowserDelegate];
      uint64_t v26 = *(void *)(a1 + 40);
      uint64_t v27 = [*(id *)(a1 + 64) nodeID];
      [v25 browser:v26 didRemoveAccessoryPairingWithNodeID:v27];
    }
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
}

- (void)fetchAllDevicePairingsForSystemCommissionerDeviceWithNodeID:(id)a3 completionHandler:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x2533B64D0]();
  id v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    uint64_t v18 = v11;
    __int16 v19 = 2112;
    id v20 = v6;
    _os_log_impl(&dword_252495000, v10, OS_LOG_TYPE_INFO, "%{public}@Received request to fetch connected services for node (%@)", buf, 0x16u);
  }
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __109__HMMTRAccessoryServerBrowser_fetchAllDevicePairingsForSystemCommissionerDeviceWithNodeID_completionHandler___block_invoke;
  v14[3] = &unk_265376708;
  id v15 = v6;
  id v16 = v7;
  void v14[4] = v9;
  id v12 = v6;
  id v13 = v7;
  [(HMMTRAccessoryServerBrowser *)v9 _fetchDevicePairingsForSystemCommissionerDeviceWithNodeID:v12 completionHandler:v14];
}

void __109__HMMTRAccessoryServerBrowser_fetchAllDevicePairingsForSystemCommissionerDeviceWithNodeID_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  [v8 disable];
  id v10 = *(void **)(a1 + 32);
  uint64_t v11 = [MEMORY[0x263F087E8] hmmtrErrorWithCode:12];
  [v10 invalidateAccessoryServer:v8 reason:v11];

  if (v9)
  {
    id v12 = (void *)MEMORY[0x2533B64D0]();
    id v13 = *(id *)(a1 + 32);
    uint64_t v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      id v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v56 = v15;
      __int16 v57 = 2112;
      id v58 = v9;
      _os_log_impl(&dword_252495000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch connected services for node (%@) with error", buf, 0x16u);
    }
    uint64_t v16 = *(void *)(a1 + 48);
    uint64_t v17 = [MEMORY[0x263F087E8] hmfErrorWithCode:2];
    uint64_t v18 = *(void (**)(uint64_t, void, uint64_t))(v16 + 16);
    uint64_t v19 = v16;
    id v20 = (void *)v17;
    v18(v19, 0, v17);
  }
  else
  {
    uint64_t v46 = a1;
    id v47 = v8;
    id v20 = [MEMORY[0x263EFF980] array];
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id v48 = v7;
    obuint64_t j = v7;
    uint64_t v21 = [obj countByEnumeratingWithState:&v51 objects:v61 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v50 = *(void *)v52;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          id v24 = v20;
          if (*(void *)v52 != v50) {
            objc_enumerationMutation(obj);
          }
          id v25 = *(void **)(*((void *)&v51 + 1) + 8 * i);
          id v26 = objc_alloc(MEMORY[0x263F11040]);
          uint64_t v27 = [v25 vendorID];
          int v28 = [v25 vendorName];
          __int16 v29 = (void *)[v26 initWithIdentifier:v27 displayName:v28];

          id v30 = objc_alloc(MEMORY[0x263F11028]);
          __int16 v31 = [v25 rootPublicKey];
          __int16 v32 = (void *)[v30 initWithRootPublicKey:v31 vendor:v29];

          id v33 = objc_alloc(MEMORY[0x263F11030]);
          uint64_t v34 = [v25 fabricID];
          uint64_t v35 = [v25 fabricID];
          id v36 = [v25 fabricLabel];
          int v37 = (void *)[v33 initWithIdentifier:v34 index:v35 displayName:v36 ecosystem:v32];

          id v38 = objc_alloc(MEMORY[0x263F11020]);
          long long v39 = [v25 nodeID];
          id v40 = (void *)[v38 initWithNodeID:v39 fabric:v37];

          id v20 = v24;
          [v24 addObject:v40];
        }
        uint64_t v22 = [obj countByEnumeratingWithState:&v51 objects:v61 count:16];
      }
      while (v22);
    }

    long long v41 = (void *)MEMORY[0x2533B64D0]();
    id v42 = *(id *)(v46 + 32);
    uint64_t v43 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
    {
      id v44 = HMFGetLogIdentifier();
      uint64_t v45 = *(void **)(v46 + 40);
      *(_DWORD *)buf = 138543874;
      id v56 = v44;
      __int16 v57 = 2112;
      id v58 = v45;
      __int16 v59 = 2112;
      uint64_t v60 = v20;
      _os_log_impl(&dword_252495000, v43, OS_LOG_TYPE_INFO, "%{public}@Successfully fetched connected services for node (%@) as %@", buf, 0x20u);
    }
    (*(void (**)(void))(*(void *)(v46 + 48) + 16))();
    id v8 = v47;
    id v7 = v48;
    id v9 = 0;
  }
}

- (void)removeSystemCommissionerFabricAccessoryWithNodeID:(id)a3 completionHandler:(id)a4
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  id v8 = (void *)MEMORY[0x2533B64D0]();
  id v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v11;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v6;
    _os_log_impl(&dword_252495000, v10, OS_LOG_TYPE_INFO, "%{public}@Received request to remove node (%@) from System Commissioner Fabric", buf, 0x16u);
  }
  id v12 = [(HMMTRAccessoryServerBrowser *)v9 systemCommissionerFabricID];
  BOOL v13 = v12 == 0;

  if (v13)
  {
    __int16 v32 = (void *)MEMORY[0x2533B64D0]();
    id v33 = v9;
    uint64_t v34 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      uint64_t v35 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v35;
      _os_log_impl(&dword_252495000, v34, OS_LOG_TYPE_ERROR, "%{public}@System Commissioner Fabric is not set up yet", buf, 0xCu);
    }
    id v36 = [(HMMTRAccessoryServerBrowser *)v33 storage];
    [v36 removeRecordsForSystemCommissionerFabricNode:v6];

    int v37 = [MEMORY[0x263F087E8] hmfErrorWithCode:2];
    v7[2](v7, v37);
  }
  else
  {
    [(HMMTRAccessoryServerBrowser *)v9 setSystemCommissionerMode:1];
    uint64_t v14 = [(HMMTRAccessoryServerBrowser *)v9 storage];
    [v14 setSystemCommissionerFabric:1];

    id v15 = [(HMMTRAccessoryServerBrowser *)v9 storage];
    uint64_t v16 = [(HMMTRAccessoryServerBrowser *)v9 systemCommissionerFabricID];
    [v15 prepareStorageForFabricID:v16];

    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    long long v52 = __Block_byref_object_copy__7596;
    long long v53 = __Block_byref_object_dispose__7597;
    id v54 = 0;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    uint64_t v17 = [(HMMTRAccessoryServerBrowser *)v9 _allServers];
    uint64_t v18 = [v17 countByEnumeratingWithState:&v42 objects:v50 count:16];
    if (v18)
    {
      uint64_t v19 = *(void *)v43;
      while (2)
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v43 != v19) {
            objc_enumerationMutation(v17);
          }
          uint64_t v21 = *(void **)(*((void *)&v42 + 1) + 8 * i);
          uint64_t v22 = [v21 nodeID];
          int v23 = [v22 isEqualToNumber:v6];

          if (v23)
          {
            objc_storeStrong((id *)(*(void *)&buf[8] + 40), v21);
            goto LABEL_14;
          }
        }
        uint64_t v18 = [v17 countByEnumeratingWithState:&v42 objects:v50 count:16];
        if (v18) {
          continue;
        }
        break;
      }
    }
LABEL_14:

    if (!*(void *)(*(void *)&buf[8] + 40))
    {
      uint64_t v24 = -[HMMTRAccessoryServerBrowser _createCHIPAccessoryForNodeID:](v9, "_createCHIPAccessoryForNodeID:", [v6 unsignedLongLongValue]);
      id v25 = *(void **)(*(void *)&buf[8] + 40);
      *(void *)(*(void *)&buf[8] + 40) = v24;
    }
    uint64_t v26 = [(HMMTRAccessoryServerBrowser *)v9 setSystemCommissionerMode:0];
    if (*(void *)(*(void *)&buf[8] + 40))
    {
      uint64_t v27 = (void *)MEMORY[0x2533B64D0](v26);
      int v28 = v9;
      HMFGetOSLogHandle();
      __int16 v29 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        id v30 = HMFGetLogIdentifier();
        *(_DWORD *)uint64_t v46 = 138543618;
        id v47 = v30;
        __int16 v48 = 2112;
        id v49 = v6;
        _os_log_impl(&dword_252495000, v29, OS_LOG_TYPE_INFO, "%{public}@Found paired device (%@) in System Commissioner Storage", v46, 0x16u);
      }
      [*(id *)(*(void *)&buf[8] + 40) setRemovalInProgress:1];
    }
    __int16 v31 = [MEMORY[0x263F087E8] hmmtrErrorWithCode:9];
    v38[0] = MEMORY[0x263EF8330];
    v38[1] = 3221225472;
    v38[2] = __99__HMMTRAccessoryServerBrowser_removeSystemCommissionerFabricAccessoryWithNodeID_completionHandler___block_invoke;
    v38[3] = &unk_2653781A0;
    void v38[4] = v9;
    id v39 = v6;
    long long v41 = buf;
    id v40 = v7;
    [(HMMTRAccessoryServerBrowser *)v9 invalidateAllDiscoveredServersWithReason:v31 completion:v38];

    _Block_object_dispose(buf, 8);
  }
}

void __99__HMMTRAccessoryServerBrowser_removeSystemCommissionerFabricAccessoryWithNodeID_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) storage];
  [v2 removeRecordsForSystemCommissionerFabricNode:*(void *)(a1 + 40)];

  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setBlockInvalidation:1];
  id v3 = [*(id *)(a1 + 32) workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __99__HMMTRAccessoryServerBrowser_removeSystemCommissionerFabricAccessoryWithNodeID_completionHandler___block_invoke_2;
  block[3] = &unk_265377430;
  id v12 = *(id *)(a1 + 48);
  dispatch_async(v3, block);

  id v4 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  uint64_t v5 = [*(id *)(a1 + 32) workQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __99__HMMTRAccessoryServerBrowser_removeSystemCommissionerFabricAccessoryWithNodeID_completionHandler___block_invoke_3;
  v8[3] = &unk_265378700;
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(a1 + 40);
  uint64_t v10 = *(void *)(a1 + 56);
  v8[4] = v6;
  id v9 = v7;
  [v4 removePairingForCurrentControllerOnQueue:v5 completion:v8];
}

uint64_t __99__HMMTRAccessoryServerBrowser_removeSystemCommissionerFabricAccessoryWithNodeID_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __99__HMMTRAccessoryServerBrowser_removeSystemCommissionerFabricAccessoryWithNodeID_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a2;
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setBlockInvalidation:0];
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  uint64_t v6 = [MEMORY[0x263F087E8] hmmtrErrorWithCode:12];
  [v4 invalidateAccessoryServer:v5 reason:v6];

  id v7 = (void *)MEMORY[0x2533B64D0]();
  id v8 = *(id *)(a1 + 32);
  id v9 = HMFGetOSLogHandle();
  uint64_t v10 = v9;
  if (v3)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      int v14 = 138543618;
      id v15 = v11;
      __int16 v16 = 2112;
      id v17 = v3;
      _os_log_impl(&dword_252495000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to remove node (%@) from System Commissioner Fabric with error", (uint8_t *)&v14, 0x16u);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v12 = HMFGetLogIdentifier();
    BOOL v13 = *(void **)(a1 + 40);
    int v14 = 138543618;
    id v15 = v12;
    __int16 v16 = 2112;
    id v17 = v13;
    _os_log_impl(&dword_252495000, v10, OS_LOG_TYPE_INFO, "%{public}@Successfully removed node (%@) from System Commissioner Fabric", (uint8_t *)&v14, 0x16u);
  }
}

- (void)discardStagedAccessoryServerWithIdentifier:(id)a3 completionHandler:(id)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  uint64_t v6 = (__CFString *)a3;
  id v7 = a4;
  id v8 = [(HMMTRAccessoryServerBrowser *)self stagedAccessoryServerWithIdentifier:v6];
  if (v8)
  {
    uint64_t v9 = MEMORY[0x2533B66E0](v7);
    if (v9) {
      uint64_t v10 = (void (**)(void *, void *))v9;
    }
    else {
      uint64_t v10 = (void (**)(void *, void *))&__block_literal_global_7635;
    }
    uint64_t v11 = (void *)MEMORY[0x2533B64D0]();
    id v12 = self;
    BOOL v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v14 = HMFGetLogIdentifier();
      int v29 = 138543874;
      id v30 = v14;
      __int16 v31 = 2114;
      __int16 v32 = @"hmmtrAccessoryServerMetricsStagedPairingCancelled";
      __int16 v33 = 2112;
      uint64_t v34 = @"Pairing Cancelled";
      _os_log_impl(&dword_252495000, v13, OS_LOG_TYPE_ERROR, "%{public}@tag=\"%{public}@\" desc=\"%@\"", (uint8_t *)&v29, 0x20u);
    }
    id v15 = [MEMORY[0x263F499E0] sharedInstance];
    id v16 = objc_alloc(MEMORY[0x263F499F0]);
    id v17 = (void *)[v16 initWithTag:@"hmmtrAccessoryServerMetricsStagedPairingCancelled" data:MEMORY[0x263EFFA78]];
    uint64_t v18 = [(__CFString *)v8 activity];
    uint64_t v19 = [v18 tagProcessorList];
    [v15 submitTaggedEvent:v17 processorList:v19];

    id v20 = (void *)MEMORY[0x2533B64D0]();
    uint64_t v21 = v12;
    uint64_t v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      int v23 = HMFGetLogIdentifier();
      int v29 = 138543618;
      id v30 = v23;
      __int16 v31 = 2112;
      __int16 v32 = v8;
      _os_log_impl(&dword_252495000, v22, OS_LOG_TYPE_INFO, "%{public}@Attempting to discard staged server: %@", (uint8_t *)&v29, 0x16u);
    }
    uint64_t v24 = [(__CFString *)v8 nodeID];
    [(HMMTRAccessoryServerBrowser *)v21 removeSystemCommissionerFabricAccessoryWithNodeID:v24 completionHandler:v10];
    goto LABEL_14;
  }
  id v25 = (void *)MEMORY[0x2533B64D0]();
  uint64_t v26 = self;
  uint64_t v27 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    int v28 = HMFGetLogIdentifier();
    int v29 = 138543618;
    id v30 = v28;
    __int16 v31 = 2112;
    __int16 v32 = v6;
    _os_log_impl(&dword_252495000, v27, OS_LOG_TYPE_INFO, "%{public}@Did not find staged accessory server to discard with identifier: %@", (uint8_t *)&v29, 0x16u);
  }
  uint64_t v10 = (void (**)(void *, void *))MEMORY[0x2533B66E0](v7);
  if (v10)
  {
    uint64_t v24 = [MEMORY[0x263F087E8] hmfErrorWithCode:2];
    v10[2](v10, v24);
LABEL_14:
  }
}

- (id)stagedAccessoryServerWithIdentifier:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x2533B64D0]();
  uint64_t v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v8;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v4;
    _os_log_impl(&dword_252495000, v7, OS_LOG_TYPE_INFO, "%{public}@Looking for staged server with identifier: %@", buf, 0x16u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  id v17 = __Block_byref_object_copy__7596;
  uint64_t v18 = __Block_byref_object_dispose__7597;
  id v19 = 0;
  uint64_t v9 = [(HAPAccessoryServerBrowser *)v6 workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __67__HMMTRAccessoryServerBrowser_stagedAccessoryServerWithIdentifier___block_invoke;
  block[3] = &unk_265377F50;
  void block[4] = v6;
  id v14 = v4;
  id v15 = buf;
  id v10 = v4;
  dispatch_sync(v9, block);

  id v11 = *(id *)(*(void *)&buf[8] + 40);
  _Block_object_dispose(buf, 8);

  return v11;
}

void __67__HMMTRAccessoryServerBrowser_stagedAccessoryServerWithIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v52 = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) isSystemCommissionerFeatureEnabled])
  {
    long long v40 = 0uLL;
    long long v41 = 0uLL;
    long long v38 = 0uLL;
    long long v39 = 0uLL;
    obuint64_t j = [*(id *)(v1 + 32) discoveredAccessoryServers];
    uint64_t v2 = [obj countByEnumeratingWithState:&v38 objects:v51 count:16];
    if (v2)
    {
      uint64_t v4 = v2;
      uint64_t v5 = *(void *)v39;
      *(void *)&long long v3 = 138544130;
      long long v30 = v3;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v39 != v5) {
            objc_enumerationMutation(obj);
          }
          id v7 = *(void **)(*((void *)&v38 + 1) + 8 * i);
          if ((objc_msgSend(v7, "removalInProgress", v30) & 1) == 0)
          {
            id v8 = (void *)MEMORY[0x2533B64D0]();
            id v9 = *(id *)(v1 + 32);
            id v10 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
            {
              id v11 = HMFGetLogIdentifier();
              id v12 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v7, "pairedState"));
              [v7 knownToSystemCommissioner];
              BOOL v13 = HMFBooleanToString();
              *(_DWORD *)buf = v30;
              long long v44 = v11;
              __int16 v45 = 2112;
              uint64_t v46 = v7;
              __int16 v47 = 2112;
              __int16 v48 = v12;
              __int16 v49 = 2112;
              uint64_t v50 = v13;
              _os_log_impl(&dword_252495000, v10, OS_LOG_TYPE_INFO, "%{public}@Found staged server: %@, state = %@, knownToSystemCommissioner %@", buf, 0x2Au);

              uint64_t v1 = a1;
            }

            if ([v7 pairedState] == 3)
            {
              id v14 = [v7 identifier];
              if ([v14 isEqualToString:*(void *)(v1 + 40)])
              {
                char v15 = [v7 knownToSystemCommissioner];

                if (v15) {
                  goto LABEL_31;
                }
              }
              else
              {
              }
            }
          }
        }
        uint64_t v4 = [obj countByEnumeratingWithState:&v38 objects:v51 count:16];
      }
      while (v4);
    }
  }
  else
  {
    long long v36 = 0uLL;
    long long v37 = 0uLL;
    long long v34 = 0uLL;
    long long v35 = 0uLL;
    obuint64_t j = [*(id *)(v1 + 32) stagedAccessoryServers];
    uint64_t v16 = [obj countByEnumeratingWithState:&v34 objects:v42 count:16];
    if (v16)
    {
      uint64_t v18 = v16;
      uint64_t v19 = *(void *)v35;
      *(void *)&long long v17 = 138543618;
      long long v31 = v17;
      while (2)
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v35 != v19) {
            objc_enumerationMutation(obj);
          }
          id v7 = *(void **)(*((void *)&v34 + 1) + 8 * j);
          if ((objc_msgSend(v7, "removalInProgress", v31) & 1) == 0)
          {
            uint64_t v21 = (void *)MEMORY[0x2533B64D0]();
            id v22 = *(id *)(v1 + 32);
            int v23 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
            {
              uint64_t v24 = HMFGetLogIdentifier();
              *(_DWORD *)buf = v31;
              long long v44 = v24;
              __int16 v45 = 2112;
              uint64_t v46 = v7;
              _os_log_impl(&dword_252495000, v23, OS_LOG_TYPE_INFO, "%{public}@Found staged server: %@", buf, 0x16u);

              uint64_t v1 = a1;
            }

            if ([v7 pairedState] == 2)
            {
              id v25 = [v7 identifier];
              char v26 = [v25 isEqualToString:*(void *)(v1 + 40)];

              if (v26)
              {
LABEL_31:
                uint64_t v27 = *(void *)(*(void *)(v1 + 48) + 8);
                id v28 = v7;
                int v29 = *(void **)(v27 + 40);
                *(void *)(v27 + 40) = v28;

                goto LABEL_32;
              }
            }
          }
        }
        uint64_t v18 = [obj countByEnumeratingWithState:&v34 objects:v42 count:16];
        if (v18) {
          continue;
        }
        break;
      }
    }
  }
LABEL_32:
}

- (void)_stageAccessoryServerWithSetupPayload:(id)a3 deviceCredentialHandler:(id)a4 wifiScanResultsHandler:(id)a5 threadScanResultsHandler:(id)a6 readyToCancelHandler:(id)a7 progressUpdateHandler:(id)a8 scanningNetworks:(BOOL)a9 hasPriorSuccessfulPairing:(BOOL)a10 category:(id)a11 completionHandler:(id)a12
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  id v50 = a3;
  id v48 = a4;
  id v18 = a5;
  id v19 = a6;
  id v49 = a7;
  id v51 = a8;
  id v20 = a11;
  id v21 = a12;
  LODWORD(a7) = [(HMMTRAccessoryServerBrowser *)self isSystemCommissionerFeatureEnabled];
  id v22 = (void *)MEMORY[0x2533B64D0]();
  int v23 = self;
  uint64_t v24 = HMFGetOSLogHandle();
  id v25 = v24;
  if (a7)
  {
    __int16 v47 = v19;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      char v26 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v64 = v26;
      _os_log_impl(&dword_252495000, v25, OS_LOG_TYPE_INFO, "%{public}@Received request for staging. Enabling system commissioner mode", buf, 0xCu);
    }
    [(HMMTRAccessoryServerBrowser *)v23 setSystemCommissionerMode:1];
    uint64_t v27 = [(HMMTRAccessoryServerBrowser *)v23 systemCommissionerControllerParams];
    id v61 = 0;
    id v62 = 0;
    int v28 = [v27 fetchControllerParamsAllowingNew:1 nocSigner:&v62 controllerWrapper:&v61];
    id v29 = v62;
    id v30 = v61;

    long long v31 = [v30 startupParams];
    id v32 = [v31 fabricID];

    if (v28 && v32)
    {
      __int16 v33 = [(HMMTRAccessoryServerBrowser *)v23 storage];
      [v33 setSystemCommissionerNocSigner:v29];

      long long v34 = [(HMMTRAccessoryServerBrowser *)v23 storage];
      [v34 setSystemCommissionerFabric:1];

      long long v35 = [(HMMTRAccessoryServerBrowser *)v23 storage];
      [v35 prepareStorageForFabricID:v32];

      v52[0] = MEMORY[0x263EF8330];
      v52[1] = 3221225472;
      v52[2] = __254__HMMTRAccessoryServerBrowser__stageAccessoryServerWithSetupPayload_deviceCredentialHandler_wifiScanResultsHandler_threadScanResultsHandler_readyToCancelHandler_progressUpdateHandler_scanningNetworks_hasPriorSuccessfulPairing_category_completionHandler___block_invoke;
      v52[3] = &unk_2653766C0;
      v52[4] = v23;
      id v53 = v32;
      id v54 = v21;
      long long v36 = v48;
      id v55 = v48;
      id v56 = v18;
      id v57 = v47;
      long long v37 = v49;
      id v58 = v49;
      id v59 = v51;
      BOOL v60 = a9;
      id v19 = v47;
      id v32 = v32;
      long long v38 = v50;
      [(HMMTRAccessoryServerBrowser *)v23 _prepareForPairingWithSetupPayload:v50 fabricID:v32 controllerWrapper:v30 hasPriorSuccessfulPairing:a10 category:v20 completionHandler:v52];
    }
    else
    {
      long long v40 = (void *)MEMORY[0x2533B64D0]();
      long long v41 = v23;
      long long v42 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        id v43 = v20;
        v45 = id v44 = v18;
        *(_DWORD *)buf = 138543362;
        id v64 = v45;
        _os_log_impl(&dword_252495000, v42, OS_LOG_TYPE_ERROR, "%{public}@System commissioner controller is not ready to start. Aborting staging.", buf, 0xCu);

        id v18 = v44;
        id v20 = v43;
      }

      uint64_t v46 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F10BB0] code:6 userInfo:0];
      (*((void (**)(id, void, void, void *))v21 + 2))(v21, 0, 0, v46);

      long long v37 = v49;
      long long v38 = v50;
      id v19 = v47;
      long long v36 = v48;
    }
  }
  else
  {
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      long long v39 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v64 = v39;
      _os_log_impl(&dword_252495000, v25, OS_LOG_TYPE_ERROR, "%{public}@Staging is no longer supported when system commissioner feature is disabled", buf, 0xCu);
    }
    id v32 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F10BB0] code:6 userInfo:0];
    (*((void (**)(id, void, void, id))v21 + 2))(v21, 0, 0, v32);
    long long v37 = v49;
    long long v38 = v50;
    long long v36 = v48;
  }
}

void __254__HMMTRAccessoryServerBrowser__stageAccessoryServerWithSetupPayload_deviceCredentialHandler_wifiScanResultsHandler_threadScanResultsHandler_readyToCancelHandler_progressUpdateHandler_scanningNetworks_hasPriorSuccessfulPairing_category_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [*(id *)(a1 + 32) workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __254__HMMTRAccessoryServerBrowser__stageAccessoryServerWithSetupPayload_deviceCredentialHandler_wifiScanResultsHandler_threadScanResultsHandler_readyToCancelHandler_progressUpdateHandler_scanningNetworks_hasPriorSuccessfulPairing_category_completionHandler___block_invoke_2;
  block[3] = &unk_265376698;
  id v9 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v14 = v6;
  id v15 = v9;
  id v10 = *(id *)(a1 + 48);
  id v16 = v7;
  id v17 = v10;
  id v18 = *(id *)(a1 + 56);
  id v19 = *(id *)(a1 + 64);
  id v20 = *(id *)(a1 + 72);
  id v21 = *(id *)(a1 + 80);
  id v22 = *(id *)(a1 + 88);
  char v23 = *(unsigned char *)(a1 + 96);
  id v11 = v7;
  id v12 = v6;
  dispatch_async(v8, block);
}

void __254__HMMTRAccessoryServerBrowser__stageAccessoryServerWithSetupPayload_deviceCredentialHandler_wifiScanResultsHandler_threadScanResultsHandler_readyToCancelHandler_progressUpdateHandler_scanningNetworks_hasPriorSuccessfulPairing_category_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)MEMORY[0x2533B64D0]();
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 138543874;
    long long v31 = v5;
    __int16 v32 = 2112;
    uint64_t v33 = v6;
    __int16 v34 = 2112;
    uint64_t v35 = v7;
    _os_log_impl(&dword_252495000, v4, OS_LOG_TYPE_INFO, "%{public}@Staging server: %@ with fabric ID %@", buf, 0x20u);
  }
  if (*(void *)(a1 + 40))
  {
    id v8 = [*(id *)(a1 + 32) deviceController];
    char v9 = [v8 isRunning];

    if (v9)
    {
      id v10 = [*(id *)(a1 + 40) nodeID];
      id v11 = [*(id *)(a1 + 32) systemCommissionerControllerParams];
      [v11 setCommissioneeNodeID:v10];

      uint64_t v12 = *(void *)(a1 + 72);
      uint64_t v13 = *(void *)(a1 + 80);
      uint64_t v14 = *(void *)(a1 + 88);
      uint64_t v15 = *(void *)(a1 + 96);
      uint64_t v16 = *(void *)(a1 + 104);
      uint64_t v17 = *(unsigned __int8 *)(a1 + 112);
      v28[0] = MEMORY[0x263EF8330];
      v28[1] = 3221225472;
      v28[2] = __254__HMMTRAccessoryServerBrowser__stageAccessoryServerWithSetupPayload_deviceCredentialHandler_wifiScanResultsHandler_threadScanResultsHandler_readyToCancelHandler_progressUpdateHandler_scanningNetworks_hasPriorSuccessfulPairing_category_completionHandler___block_invoke_177;
      v28[3] = &unk_265376670;
      id v18 = *(void **)(a1 + 40);
      v28[4] = *(void *)(a1 + 32);
      id v29 = *(id *)(a1 + 64);
      [v18 startStagedPairingWithDeviceCredentialHandler:v12 wifiScanResultsHandler:v13 threadScanResultsHandler:v14 readyToCancelHandler:v15 progressUpdateHandler:v16 scanningNetworks:v17 completion:v28];
      id v19 = [*(id *)(a1 + 32) stagedAccessoryServers];
      [v19 addObject:*(void *)(a1 + 40)];
    }
    else
    {
      id v21 = (void *)MEMORY[0x2533B64D0]();
      id v22 = *(id *)(a1 + 32);
      char v23 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        uint64_t v24 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        long long v31 = v24;
        _os_log_impl(&dword_252495000, v23, OS_LOG_TYPE_INFO, "%{public}@CHIP Stack is not running. Aborting pairing.", buf, 0xCu);
      }
      uint64_t v25 = *(void *)(a1 + 64);
      char v26 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F10BB0] code:6 userInfo:0];
      (*(void (**)(uint64_t, void, void, void *))(v25 + 16))(v25, 0, 0, v26);
    }
  }
  else
  {
    uint64_t v20 = *(void *)(a1 + 64);
    if (*(void *)(a1 + 56))
    {
      (*(void (**)(void, void, void))(v20 + 16))(*(void *)(a1 + 64), 0, 0);
    }
    else
    {
      uint64_t v27 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F10BB0] code:6 userInfo:0];
      (*(void (**)(uint64_t, void, void, void *))(v20 + 16))(v20, 0, 0, v27);
    }
  }
}

void __254__HMMTRAccessoryServerBrowser__stageAccessoryServerWithSetupPayload_deviceCredentialHandler_wifiScanResultsHandler_threadScanResultsHandler_readyToCancelHandler_progressUpdateHandler_scanningNetworks_hasPriorSuccessfulPairing_category_completionHandler___block_invoke_177(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([*(id *)(a1 + 32) isSystemCommissionerMode])
  {
    id v8 = (void *)MEMORY[0x2533B64D0]([*(id *)(a1 + 32) setSystemCommissionerMode:0]);
    id v9 = *(id *)(a1 + 32);
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v11 = HMFGetLogIdentifier();
      int v13 = 138543362;
      uint64_t v14 = v11;
      _os_log_impl(&dword_252495000, v10, OS_LOG_TYPE_INFO, "%{public}@Staging is complete. Disabling system commissioner mode", (uint8_t *)&v13, 0xCu);
    }
  }
  uint64_t v12 = [*(id *)(a1 + 32) systemCommissionerControllerParams];
  [v12 setCommissioneeNodeID:0];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)stageAccessoryServerWithSetupPayload:(id)a3 fabricID:(id)a4 deviceCredentialHandler:(id)a5 wifiScanResultsHandler:(id)a6 threadScanResultsHandler:(id)a7 readyToCancelHandler:(id)a8 progressUpdateHandler:(id)a9 scanningNetworks:(BOOL)a10 completionHandler:(id)a11
{
  id v16 = a3;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = a11;
  char v23 = [(HAPAccessoryServerBrowser *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __227__HMMTRAccessoryServerBrowser_stageAccessoryServerWithSetupPayload_fabricID_deviceCredentialHandler_wifiScanResultsHandler_threadScanResultsHandler_readyToCancelHandler_progressUpdateHandler_scanningNetworks_completionHandler___block_invoke;
  block[3] = &unk_265376648;
  void block[4] = self;
  id v32 = v16;
  id v33 = v17;
  id v34 = v18;
  id v35 = v19;
  id v36 = v20;
  BOOL v39 = a10;
  id v37 = v21;
  id v38 = v22;
  id v24 = v22;
  id v25 = v21;
  id v26 = v20;
  id v27 = v19;
  id v28 = v18;
  id v29 = v17;
  id v30 = v16;
  dispatch_async(v23, block);
}

uint64_t __227__HMMTRAccessoryServerBrowser_stageAccessoryServerWithSetupPayload_fabricID_deviceCredentialHandler_wifiScanResultsHandler_threadScanResultsHandler_readyToCancelHandler_progressUpdateHandler_scanningNetworks_completionHandler___block_invoke(uint64_t a1)
{
  LOWORD(v2) = *(unsigned __int8 *)(a1 + 96);
  return objc_msgSend(*(id *)(a1 + 32), "_stageAccessoryServerWithSetupPayload:deviceCredentialHandler:wifiScanResultsHandler:threadScanResultsHandler:readyToCancelHandler:progressUpdateHandler:scanningNetworks:hasPriorSuccessfulPairing:category:completionHandler:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), v2, 0, *(void *)(a1 + 88));
}

- (void)stageAccessoryServerWithSetupPayload:(id)a3 hasPriorSuccessfulPairing:(BOOL)a4 category:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  int v13 = [(HAPAccessoryServerBrowser *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __121__HMMTRAccessoryServerBrowser_stageAccessoryServerWithSetupPayload_hasPriorSuccessfulPairing_category_completionHandler___block_invoke;
  block[3] = &unk_265377480;
  void block[4] = self;
  id v18 = v10;
  BOOL v21 = a4;
  id v19 = v11;
  id v20 = v12;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(v13, block);
}

uint64_t __121__HMMTRAccessoryServerBrowser_stageAccessoryServerWithSetupPayload_hasPriorSuccessfulPairing_category_completionHandler___block_invoke(uint64_t a1)
{
  BYTE1(v2) = *(unsigned char *)(a1 + 64);
  LOBYTE(v2) = 0;
  return objc_msgSend(*(id *)(a1 + 32), "_stageAccessoryServerWithSetupPayload:deviceCredentialHandler:wifiScanResultsHandler:threadScanResultsHandler:readyToCancelHandler:progressUpdateHandler:scanningNetworks:hasPriorSuccessfulPairing:category:completionHandler:", *(void *)(a1 + 40), 0, 0, 0, 0, 0, v2, *(void *)(a1 + 48), *(void *)(a1 + 56));
}

- (void)stageAccessoryServerWithSetupPayload:(id)a3 fabricID:(id)a4 completionHandler:(id)a5
{
  LOBYTE(v5) = 0;
  [(HMMTRAccessoryServerBrowser *)self stageAccessoryServerWithSetupPayload:a3 fabricID:a4 deviceCredentialHandler:0 wifiScanResultsHandler:0 threadScanResultsHandler:0 readyToCancelHandler:0 progressUpdateHandler:0 scanningNetworks:v5 completionHandler:a5];
}

- (void)matchAccessoryServerWithSetupID:(id)a3 serverIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __98__HMMTRAccessoryServerBrowser_matchAccessoryServerWithSetupID_serverIdentifier_completionHandler___block_invoke;
  v14[3] = &unk_265376848;
  objc_copyWeak(&v18, &location);
  id v11 = v10;
  id v17 = v11;
  id v12 = v8;
  id v15 = v12;
  id v13 = v9;
  id v16 = v13;
  [(HMMTRAccessoryServerBrowser *)self dispatchBlock:v14];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

void __98__HMMTRAccessoryServerBrowser_matchAccessoryServerWithSetupID_serverIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v3 = WeakRetained;
  if (*(void *)(a1 + 48))
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v4 = [WeakRetained _allServers];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v21 objects:v35 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v22;
      while (2)
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v22 != v6) {
            objc_enumerationMutation(v4);
          }
          id v8 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          if ([v8 matchesSetupID:*(void *)(a1 + 32) serverIdentifier:*(void *)(a1 + 40)]&& (objc_msgSend(v8, "removalInProgress") & 1) == 0)
          {
            id v10 = [v8 identifier];
            uint64_t v11 = [v3 isPaired:v10];

            uint64_t v12 = [v8 hasPairings];
            id v13 = (void *)MEMORY[0x2533B64D0]();
            id v14 = v3;
            id v15 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
            {
              uint64_t v16 = HMFGetLogIdentifier();
              uint64_t v19 = *(void *)(a1 + 32);
              id v20 = (void *)v16;
              id v17 = [NSNumber numberWithBool:v11];
              id v18 = [NSNumber numberWithBool:v12];
              *(_DWORD *)buf = 138544386;
              id v26 = v20;
              __int16 v27 = 2112;
              id v28 = v8;
              __int16 v29 = 2112;
              uint64_t v30 = v19;
              __int16 v31 = 2112;
              id v32 = v17;
              __int16 v33 = 2112;
              id v34 = v18;
              _os_log_impl(&dword_252495000, v15, OS_LOG_TYPE_INFO, "%{public}@CHIP Accessory server %@ matches setupID %@ and is paired/hasPairings: (%@/%@)", buf, 0x34u);
            }
            id v9 = v8;
            goto LABEL_15;
          }
        }
        uint64_t v5 = [v4 countByEnumeratingWithState:&v21 objects:v35 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }
    id v9 = 0;
LABEL_15:

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)indicateNotificationFromServer:(id)a3 notifyType:(unint64_t)a4 withDictionary:(id)a5
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a5;
  id v9 = (void *)MEMORY[0x2533B64D0]();
  id v10 = self;
  uint64_t v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    uint64_t v12 = HMFGetLogIdentifier();
    id v13 = [v7 nodeID];
    int v14 = 138543618;
    id v15 = v12;
    __int16 v16 = 2112;
    id v17 = v13;
    _os_log_impl(&dword_252495000, v11, OS_LOG_TYPE_INFO, "%{public}@Received notification from accessory server with nodeID %@", (uint8_t *)&v14, 0x16u);
  }
}

- (void)discoverAccessoryServerWithNodeID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = [(HAPAccessoryServerBrowser *)self workQueue];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __76__HMMTRAccessoryServerBrowser_discoverAccessoryServerWithNodeID_completion___block_invoke;
  v11[3] = &unk_265376620;
  objc_copyWeak(&v14, &location);
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __76__HMMTRAccessoryServerBrowser_discoverAccessoryServerWithNodeID_completion___block_invoke(id *a1)
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  id v3 = (void *)MEMORY[0x2533B64D0]();
  id v4 = WeakRetained;
  uint64_t v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    id v7 = a1[4];
    *(_DWORD *)buf = 138543618;
    long long v40 = v6;
    __int16 v41 = 2112;
    long long v42 = v7;
    _os_log_impl(&dword_252495000, v5, OS_LOG_TYPE_INFO, "%{public}@discoverAccessoryServerWithNideId %@", buf, 0x16u);
  }
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v8 = [v4 discoveredAccessoryServers];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v35 objects:v45 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v36;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v36 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        id v14 = a1[4];
        id v15 = [v13 nodeID];
        if ([v14 isEqual:v15] && (objc_msgSend(v13, "isDisabled") & 1) == 0)
        {
          char v16 = [v13 serviceEnumerationFailed];

          if ((v16 & 1) == 0)
          {
            v33[0] = MEMORY[0x263EF8330];
            v33[1] = 3221225472;
            v33[2] = __76__HMMTRAccessoryServerBrowser_discoverAccessoryServerWithNodeID_completion___block_invoke_173;
            v33[3] = &unk_265377640;
            void v33[4] = v4;
            void v33[5] = v13;
            id v34 = a1[5];
            [v13 isDiscoverableWithCompletion:v33];

            goto LABEL_21;
          }
        }
        else
        {
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v35 objects:v45 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  id v17 = a1[4];
  id v32 = 0;
  int v18 = [v4 _isNodeIDPaired:v17 fabricID:&v32];
  id v8 = v32;
  if (v18 && isFeatureMatteriPhoneOnlyPairingControlEnabled())
  {
    uint64_t v19 = (void *)MEMORY[0x2533B64D0]();
    id v20 = v4;
    long long v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      long long v22 = HMFGetLogIdentifier();
      long long v23 = +[HMMTRUtilities identifierStringWithCHIPNodeID:a1[4]];
      id v24 = a1[4];
      *(_DWORD *)buf = 138543874;
      long long v40 = v22;
      __int16 v41 = 2112;
      long long v42 = v23;
      __int16 v43 = 2112;
      id v44 = v24;
      _os_log_impl(&dword_252495000, v21, OS_LOG_TYPE_INFO, "%{public}@Paired device %@ with node ID %@ fakes discovery for local fallback", buf, 0x20u);
    }
    id v25 = [v20 appleHomeFabricWithID:v8];
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __76__HMMTRAccessoryServerBrowser_discoverAccessoryServerWithNodeID_completion___block_invoke_175;
    v27[3] = &unk_2653765F8;
    v27[4] = v20;
    id v8 = v8;
    id v28 = v8;
    id v29 = v25;
    id v30 = a1[4];
    id v31 = a1[5];
    id v26 = v25;
    [v26 loadFabricAndControllerDataForPairing:0 fetchFromResident:0 completion:v27];
  }
  else
  {
    (*((void (**)(void))a1[5] + 2))();
  }
LABEL_21:
}

void __76__HMMTRAccessoryServerBrowser_discoverAccessoryServerWithNodeID_completion___block_invoke_173(uint64_t a1, char a2)
{
  id v4 = [*(id *)(a1 + 32) workQueue];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __76__HMMTRAccessoryServerBrowser_discoverAccessoryServerWithNodeID_completion___block_invoke_2;
  v5[3] = &unk_265376988;
  char v8 = a2;
  long long v6 = *(_OWORD *)(a1 + 32);
  id v7 = *(id *)(a1 + 48);
  dispatch_async(v4, v5);
}

void __76__HMMTRAccessoryServerBrowser_discoverAccessoryServerWithNodeID_completion___block_invoke_175(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) workQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __76__HMMTRAccessoryServerBrowser_discoverAccessoryServerWithNodeID_completion___block_invoke_2_176;
  v8[3] = &unk_265378818;
  uint64_t v5 = *(void *)(a1 + 32);
  long long v6 = *(void **)(a1 + 40);
  id v9 = v3;
  uint64_t v10 = v5;
  id v11 = v6;
  id v12 = *(id *)(a1 + 48);
  id v13 = *(id *)(a1 + 56);
  id v14 = *(id *)(a1 + 64);
  id v7 = v3;
  dispatch_async(v4, v8);
}

void __76__HMMTRAccessoryServerBrowser_discoverAccessoryServerWithNodeID_completion___block_invoke_2_176(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  if (*(void *)(a1 + 32))
  {
    uint64_t v2 = (void *)MEMORY[0x2533B64D0]();
    id v3 = *(id *)(a1 + 40);
    id v4 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = HMFGetLogIdentifier();
      long long v6 = *(void **)(a1 + 48);
      uint64_t v7 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543874;
      id v20 = v5;
      __int16 v21 = 2112;
      id v22 = v6;
      __int16 v23 = 2112;
      uint64_t v24 = v7;
      _os_log_impl(&dword_252495000, v4, OS_LOG_TYPE_ERROR, "%{public}@Failed to load certificates for fabric ID %@ with error %@", buf, 0x20u);
    }
  }
  objc_msgSend(*(id *)(a1 + 40), "_setupStorageStateForUpdatedHomeFabricID:rediscoverAccessories:overrideAccessoryControlAllowed:", *(void *)(a1 + 48), 0, objc_msgSend(*(id *)(a1 + 40), "isCurrentDeviceAllowedAccessoryControlPerExplicitRequestDespiteReachableResidentForFabric:", *(void *)(a1 + 56)));
  char v8 = *(void **)(a1 + 40);
  uint64_t v9 = [*(id *)(a1 + 64) unsignedLongLongValue];
  id v18 = 0;
  uint64_t v10 = [v8 _createCHIPAccessoryForNodeID:v9 ifPaired:1 fatalError:&v18];
  id v11 = v18;
  if (v10)
  {
    id v12 = [*(id *)(a1 + 40) discoveredAccessoryServers];
    [v12 addObject:v10];

    id v13 = *(void (**)(void))(*(void *)(a1 + 72) + 16);
  }
  else
  {
    id v14 = (void *)MEMORY[0x2533B64D0]();
    id v15 = *(id *)(a1 + 40);
    char v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      id v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v20 = v17;
      __int16 v21 = 2112;
      id v22 = v11;
      _os_log_impl(&dword_252495000, v16, OS_LOG_TYPE_ERROR, "%{public}@Could not create server for local try: %@", buf, 0x16u);
    }
    id v13 = *(void (**)(void))(*(void *)(a1 + 72) + 16);
  }
  v13();
}

uint64_t __76__HMMTRAccessoryServerBrowser_discoverAccessoryServerWithNodeID_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  int v2 = *(unsigned __int8 *)(a1 + 56);
  id v3 = (void *)MEMORY[0x2533B64D0]();
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = HMFGetOSLogHandle();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (v2)
  {
    if (v6)
    {
      uint64_t v7 = HMFGetLogIdentifier();
      uint64_t v8 = *(void *)(a1 + 40);
      int v12 = 138543618;
      id v13 = v7;
      __int16 v14 = 2112;
      uint64_t v15 = v8;
      _os_log_impl(&dword_252495000, v5, OS_LOG_TYPE_INFO, "%{public}@Found server %@", (uint8_t *)&v12, 0x16u);
    }
  }
  else if (v6)
  {
    uint64_t v9 = HMFGetLogIdentifier();
    uint64_t v10 = *(void *)(a1 + 40);
    int v12 = 138543618;
    id v13 = v9;
    __int16 v14 = 2112;
    uint64_t v15 = v10;
    _os_log_impl(&dword_252495000, v5, OS_LOG_TYPE_INFO, "%{public}@Failed to discover server: %@", (uint8_t *)&v12, 0x16u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)discoverAccessoryServerWithIdentifier:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __69__HMMTRAccessoryServerBrowser_discoverAccessoryServerWithIdentifier___block_invoke;
  v6[3] = &unk_2653765D0;
  objc_copyWeak(&v8, &location);
  id v5 = v4;
  id v7 = v5;
  [(HMMTRAccessoryServerBrowser *)self dispatchAfterConfiguration:v6];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __69__HMMTRAccessoryServerBrowser_discoverAccessoryServerWithIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = (void *)MEMORY[0x2533B64D0]();
  id v4 = WeakRetained;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    BOOL v6 = HMFGetLogIdentifier();
    uint64_t v7 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    id v44 = v6;
    __int16 v45 = 2112;
    uint64_t v46 = v7;
    _os_log_impl(&dword_252495000, v5, OS_LOG_TYPE_INFO, "%{public}@discoverAccessoryServerWithIdentifier %@", buf, 0x16u);
  }
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v8 = [v4 discoveredAccessoryServers];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v39 objects:v49 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v40;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v40 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        __int16 v14 = *(void **)(a1 + 32);
        uint64_t v15 = [v13 identifier];
        if ([v14 isEqual:v15] && (objc_msgSend(v13, "isDisabled") & 1) == 0)
        {
          char v16 = [v13 serviceEnumerationFailed];

          if ((v16 & 1) == 0)
          {
            v37[0] = MEMORY[0x263EF8330];
            v37[1] = 3221225472;
            void v37[2] = __69__HMMTRAccessoryServerBrowser_discoverAccessoryServerWithIdentifier___block_invoke_163;
            v37[3] = &unk_265376558;
            v37[4] = v4;
            void v37[5] = v13;
            id v38 = *(id *)(a1 + 32);
            [v13 isDiscoverableWithCompletion:v37];

            goto LABEL_23;
          }
        }
        else
        {
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v39 objects:v49 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  uint64_t v17 = *(void *)(a1 + 32);
  id v35 = 0;
  id v36 = 0;
  int v18 = [v4 _isDeviceIDPaired:v17 nodeID:&v36 fabricID:&v35];
  id v8 = v36;
  id v19 = v35;
  if (v18 && isFeatureMatteriPhoneOnlyPairingControlEnabled())
  {
    id v20 = (void *)MEMORY[0x2533B64D0]();
    id v21 = v4;
    id v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      __int16 v23 = HMFGetLogIdentifier();
      uint64_t v24 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543874;
      id v44 = v23;
      __int16 v45 = 2112;
      uint64_t v46 = v24;
      __int16 v47 = 2112;
      id v48 = v8;
      _os_log_impl(&dword_252495000, v22, OS_LOG_TYPE_INFO, "%{public}@Paired device %@ with node ID %@ fakes discovery for local fallback", buf, 0x20u);
    }
    uint64_t v25 = [v21 appleHomeFabricWithID:v19];
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __69__HMMTRAccessoryServerBrowser_discoverAccessoryServerWithIdentifier___block_invoke_168;
    v30[3] = &unk_2653765A8;
    void v30[4] = v21;
    id v31 = v19;
    id v32 = v25;
    id v33 = v8;
    id v34 = *(id *)(a1 + 32);
    id v26 = v25;
    [v26 loadFabricAndControllerDataForPairing:0 fetchFromResident:0 completion:v30];
  }
  else if ([v4 _delegateRespondsToSelector:sel_accessoryServerBrowser_didFailToDiscoverAccessoryServerWithIdentifier_])
  {
    __int16 v27 = [v4 delegateQueue];
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __69__HMMTRAccessoryServerBrowser_discoverAccessoryServerWithIdentifier___block_invoke_172;
    v28[3] = &unk_265376E98;
    v28[4] = v4;
    id v29 = *(id *)(a1 + 32);
    dispatch_async(v27, v28);
  }
LABEL_23:
}

void __69__HMMTRAccessoryServerBrowser_discoverAccessoryServerWithIdentifier___block_invoke_163(uint64_t a1, char a2)
{
  id v4 = [*(id *)(a1 + 32) workQueue];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __69__HMMTRAccessoryServerBrowser_discoverAccessoryServerWithIdentifier___block_invoke_2;
  v5[3] = &unk_265376530;
  char v8 = a2;
  long long v6 = *(_OWORD *)(a1 + 32);
  id v7 = *(id *)(a1 + 48);
  dispatch_async(v4, v5);
}

void __69__HMMTRAccessoryServerBrowser_discoverAccessoryServerWithIdentifier___block_invoke_168(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) workQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __69__HMMTRAccessoryServerBrowser_discoverAccessoryServerWithIdentifier___block_invoke_2_169;
  v8[3] = &unk_265376580;
  uint64_t v5 = *(void *)(a1 + 32);
  long long v6 = *(void **)(a1 + 40);
  id v9 = v3;
  uint64_t v10 = v5;
  id v11 = v6;
  id v12 = *(id *)(a1 + 48);
  id v13 = *(id *)(a1 + 56);
  id v14 = *(id *)(a1 + 64);
  id v7 = v3;
  dispatch_async(v4, v8);
}

void __69__HMMTRAccessoryServerBrowser_discoverAccessoryServerWithIdentifier___block_invoke_172(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  int v2 = (void *)MEMORY[0x2533B64D0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    int v8 = 138543618;
    id v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    _os_log_impl(&dword_252495000, v4, OS_LOG_TYPE_INFO, "%{public}@Failed to discover server with identifier: %@", (uint8_t *)&v8, 0x16u);
  }
  id v7 = [*(id *)(a1 + 32) delegate];
  [v7 accessoryServerBrowser:*(void *)(a1 + 32) didFailToDiscoverAccessoryServerWithIdentifier:*(void *)(a1 + 40)];
}

void __69__HMMTRAccessoryServerBrowser_discoverAccessoryServerWithIdentifier___block_invoke_2_169(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  if (*(void *)(a1 + 32))
  {
    int v2 = (void *)MEMORY[0x2533B64D0]();
    id v3 = *(id *)(a1 + 40);
    id v4 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = HMFGetLogIdentifier();
      uint64_t v6 = *(void **)(a1 + 48);
      uint64_t v7 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543874;
      id v26 = v5;
      __int16 v27 = 2112;
      id v28 = v6;
      __int16 v29 = 2112;
      uint64_t v30 = v7;
      _os_log_impl(&dword_252495000, v4, OS_LOG_TYPE_ERROR, "%{public}@Failed to load certificates for fabric ID %@ with error %@", buf, 0x20u);
    }
  }
  objc_msgSend(*(id *)(a1 + 40), "_setupStorageStateForUpdatedHomeFabricID:rediscoverAccessories:overrideAccessoryControlAllowed:", *(void *)(a1 + 48), 0, objc_msgSend(*(id *)(a1 + 40), "isCurrentDeviceAllowedAccessoryControlPerExplicitRequestDespiteReachableResidentForFabric:", *(void *)(a1 + 56)));
  int v8 = *(void **)(a1 + 40);
  uint64_t v9 = [*(id *)(a1 + 64) unsignedLongLongValue];
  id v24 = 0;
  __int16 v10 = [v8 _createCHIPAccessoryForNodeID:v9 ifPaired:1 fatalError:&v24];
  id v11 = v24;
  if (v10)
  {
    uint64_t v12 = [*(id *)(a1 + 40) discoveredAccessoryServers];
    [v12 addObject:v10];

    if ([*(id *)(a1 + 40) _delegateRespondsToSelector:sel_accessoryServerBrowser_didFindAccessoryServer_stateChanged_stateNumber_])
    {
      id v13 = [*(id *)(a1 + 40) delegateQueue];
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __69__HMMTRAccessoryServerBrowser_discoverAccessoryServerWithIdentifier___block_invoke_2_171;
      v20[3] = &unk_265376E98;
      v20[4] = *(void *)(a1 + 40);
      id v14 = &v21;
      id v21 = v10;
      uint64_t v15 = v20;
LABEL_12:
      dispatch_async(v13, v15);
    }
  }
  else
  {
    char v16 = (void *)MEMORY[0x2533B64D0]();
    id v17 = *(id *)(a1 + 40);
    int v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      id v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v26 = v19;
      __int16 v27 = 2112;
      id v28 = v11;
      _os_log_impl(&dword_252495000, v18, OS_LOG_TYPE_ERROR, "%{public}@Could not create server for local try: %@", buf, 0x16u);
    }
    if ([*(id *)(a1 + 40) _delegateRespondsToSelector:sel_accessoryServerBrowser_didFailToDiscoverAccessoryServerWithIdentifier_])
    {
      id v13 = [*(id *)(a1 + 40) delegateQueue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __69__HMMTRAccessoryServerBrowser_discoverAccessoryServerWithIdentifier___block_invoke_170;
      block[3] = &unk_265376E98;
      void block[4] = *(void *)(a1 + 40);
      id v14 = &v23;
      id v23 = *(id *)(a1 + 72);
      uint64_t v15 = block;
      goto LABEL_12;
    }
  }
}

void __69__HMMTRAccessoryServerBrowser_discoverAccessoryServerWithIdentifier___block_invoke_170(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 accessoryServerBrowser:*(void *)(a1 + 32) didFailToDiscoverAccessoryServerWithIdentifier:*(void *)(a1 + 40)];
}

void __69__HMMTRAccessoryServerBrowser_discoverAccessoryServerWithIdentifier___block_invoke_2_171(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x2533B64D0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    int v8 = 138543618;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    _os_log_impl(&dword_252495000, v4, OS_LOG_TYPE_INFO, "%{public}@Found server %@", (uint8_t *)&v8, 0x16u);
  }
  uint64_t v7 = [*(id *)(a1 + 32) delegate];
  [v7 accessoryServerBrowser:*(void *)(a1 + 32) didFindAccessoryServer:*(void *)(a1 + 40) stateChanged:0 stateNumber:0];
}

void __69__HMMTRAccessoryServerBrowser_discoverAccessoryServerWithIdentifier___block_invoke_2(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 56);
  id v3 = *(void **)(a1 + 32);
  if (v2)
  {
    if (![v3 _delegateRespondsToSelector:sel_accessoryServerBrowser_didFindAccessoryServer_stateChanged_stateNumber_])return; {
    id v4 = [*(id *)(a1 + 32) delegateQueue];
    }
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __69__HMMTRAccessoryServerBrowser_discoverAccessoryServerWithIdentifier___block_invoke_3;
    block[3] = &unk_265376E98;
    long long v10 = *(_OWORD *)(a1 + 32);
    dispatch_async(v4, block);
  }
  else
  {
    if (![v3 _delegateRespondsToSelector:sel_accessoryServerBrowser_didFailToDiscoverAccessoryServerWithIdentifier_])return; {
    uint64_t v5 = [*(id *)(a1 + 32) delegateQueue];
    }
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __69__HMMTRAccessoryServerBrowser_discoverAccessoryServerWithIdentifier___block_invoke_166;
    v6[3] = &unk_265376F38;
    long long v7 = *(_OWORD *)(a1 + 32);
    int v8 = *(id *)(a1 + 48);
    dispatch_async(v5, v6);

    id v4 = v8;
  }
}

void __69__HMMTRAccessoryServerBrowser_discoverAccessoryServerWithIdentifier___block_invoke_3(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  int v2 = (void *)MEMORY[0x2533B64D0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    int v8 = 138543618;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    _os_log_impl(&dword_252495000, v4, OS_LOG_TYPE_INFO, "%{public}@Found server %@", (uint8_t *)&v8, 0x16u);
  }
  long long v7 = [*(id *)(a1 + 32) delegate];
  [v7 accessoryServerBrowser:*(void *)(a1 + 32) didFindAccessoryServer:*(void *)(a1 + 40) stateChanged:0 stateNumber:0];
}

void __69__HMMTRAccessoryServerBrowser_discoverAccessoryServerWithIdentifier___block_invoke_166(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  int v2 = (void *)MEMORY[0x2533B64D0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    int v8 = 138543618;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    _os_log_impl(&dword_252495000, v4, OS_LOG_TYPE_INFO, "%{public}@Failed to discover server: %@", (uint8_t *)&v8, 0x16u);
  }
  long long v7 = [*(id *)(a1 + 32) delegate];
  [v7 accessoryServerBrowser:*(void *)(a1 + 32) didFailToDiscoverAccessoryServerWithIdentifier:*(void *)(a1 + 48)];
}

- (void)stopDiscoveringAccessoryServers
{
  id v3 = [(HAPAccessoryServerBrowser *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __62__HMMTRAccessoryServerBrowser_stopDiscoveringAccessoryServers__block_invoke;
  block[3] = &unk_265378638;
  void block[4] = self;
  dispatch_async(v3, block);
}

void __62__HMMTRAccessoryServerBrowser_stopDiscoveringAccessoryServers__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  int v2 = (void *)MEMORY[0x2533B64D0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v9 = v5;
    _os_log_impl(&dword_252495000, v4, OS_LOG_TYPE_INFO, "%{public}@Stopping browse for CHIP accessories", buf, 0xCu);
  }
  if ([*(id *)(a1 + 32) _delegateRespondsToSelector:sel_accessoryServerBrowser_didStopDiscoveringWithError_])
  {
    uint64_t v6 = [*(id *)(a1 + 32) delegateQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __62__HMMTRAccessoryServerBrowser_stopDiscoveringAccessoryServers__block_invoke_162;
    block[3] = &unk_265378638;
    void block[4] = *(void *)(a1 + 32);
    dispatch_async(v6, block);
  }
}

void __62__HMMTRAccessoryServerBrowser_stopDiscoveringAccessoryServers__block_invoke_162(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 accessoryServerBrowser:*(void *)(a1 + 32) didStopDiscoveringWithError:0];
}

- (void)startDiscoveringAccessoryServers
{
  objc_initWeak(&location, self);
  id v3 = [(HAPAccessoryServerBrowser *)self workQueue];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __63__HMMTRAccessoryServerBrowser_startDiscoveringAccessoryServers__block_invoke;
  v4[3] = &unk_265376E28;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __63__HMMTRAccessoryServerBrowser_startDiscoveringAccessoryServers__block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [MEMORY[0x263F42620] productInfo];
  uint64_t v3 = [v2 productPlatform];

  if (v3 == 4)
  {
LABEL_6:
    long long v24 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v21 = 0u;
    uint64_t v10 = [WeakRetained discoveredAccessoryServers];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v22 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          if ([v15 pairedState]
            && ([v15 isDisabled] & 1) == 0
            && ([v15 removalInProgress] & 1) == 0
            && (![WeakRetained isCurrentDeviceMobileAndAllowedAccessoryControl]
             || ([v15 delayDiscovery] & 1) == 0))
          {
            char v16 = [WeakRetained delegateQueue];
            block[0] = MEMORY[0x263EF8330];
            block[1] = 3221225472;
            block[2] = __63__HMMTRAccessoryServerBrowser_startDiscoveringAccessoryServers__block_invoke_159;
            block[3] = &unk_265376E98;
            void block[4] = WeakRetained;
            void block[5] = v15;
            dispatch_async(v16, block);
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v12);
    }

    [WeakRetained setBrowserState:2];
    if ([WeakRetained _delegateRespondsToSelector:sel_accessoryServerBrowser_didStopDiscoveringWithError_])
    {
      id v17 = [WeakRetained delegateQueue];
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __63__HMMTRAccessoryServerBrowser_startDiscoveringAccessoryServers__block_invoke_2;
      v19[3] = &unk_265378638;
      void v19[4] = WeakRetained;
      dispatch_async(v17, v19);
    }
    goto LABEL_24;
  }
  int v4 = [WeakRetained isCurrentDeviceMobileAndAllowedAccessoryControl];
  id v5 = (void *)MEMORY[0x2533B64D0]();
  id v6 = WeakRetained;
  long long v7 = HMFGetOSLogHandle();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if (v4)
  {
    if (v8)
    {
      uint64_t v9 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v27 = v9;
      _os_log_impl(&dword_252495000, v7, OS_LOG_TYPE_INFO, "%{public}@startDiscoveringAccessoryServers invoked while resident is down - allowing discovery", buf, 0xCu);
    }
    goto LABEL_6;
  }
  if (v8)
  {
    int v18 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    __int16 v27 = v18;
    _os_log_impl(&dword_252495000, v7, OS_LOG_TYPE_INFO, "%{public}@startDiscoveringAccessoryServers: resident is up - preventing discovery of all accessory servers", buf, 0xCu);
  }
LABEL_24:
}

void __63__HMMTRAccessoryServerBrowser_startDiscoveringAccessoryServers__block_invoke_159(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 accessoryServerBrowser:*(void *)(a1 + 32) didFindAccessoryServer:*(void *)(a1 + 40) stateChanged:0 stateNumber:0];
}

void __63__HMMTRAccessoryServerBrowser_startDiscoveringAccessoryServers__block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 accessoryServerBrowser:*(void *)(a1 + 32) didStopDiscoveringWithError:0];
}

- (void)_clearLocallyDiscoveredFlags
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = [(HMMTRAccessoryServerBrowser *)self discoveredAccessoryServers];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) setLocallyDiscovered:0];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)_cleanupDisappearedServersOverBLE
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  uint64_t v3 = [MEMORY[0x263EFF9C0] set];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v4 = self->_discoveredAccessoryServers;
  uint64_t v5 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v31 objects:v42 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v32;
    *(void *)&long long v6 = 138543874;
    long long v24 = v6;
    uint64_t v25 = v3;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v32 != v8) {
          objc_enumerationMutation(v4);
        }
        long long v10 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        if (objc_msgSend(v10, "discoveredOverBLE", v24)
          && [v10 bleScanPending])
        {
          [v10 setLocallyDiscovered:0];
          uint64_t v11 = [v10 setupPayloadString];

          if (v11)
          {
            [v10 setDiscoveredOverBLE:0];
          }
          else if (([v10 isPairingInProgress] & 1) == 0 {
                 && (![v10 pairedState] || objc_msgSend(v10, "isDisabled")))
          }
          {
            uint64_t v12 = (void *)MEMORY[0x2533B64D0]();
            uint64_t v13 = self;
            id v14 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v15 = id v26 = v12;
              char v16 = [v10 identifier];
              *(_DWORD *)buf = v24;
              long long v37 = v15;
              __int16 v38 = 2112;
              long long v39 = v16;
              __int16 v40 = 1024;
              int v41 = 0;
              _os_log_impl(&dword_252495000, v14, OS_LOG_TYPE_INFO, "%{public}@Invalidating server disappeared from BLE, id %@, pairingInProgress %d", buf, 0x1Cu);

              uint64_t v3 = v25;
              uint64_t v12 = v26;
            }

            [v3 addObject:v10];
          }
        }
      }
      uint64_t v7 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v31 objects:v42 count:16];
    }
    while (v7);
  }

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v17 = v3;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v28;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v28 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v22 = *(void *)(*((void *)&v27 + 1) + 8 * j);
        long long v23 = [MEMORY[0x263F087E8] hmmtrErrorWithCode:13];
        [(HMMTRAccessoryServerBrowser *)self invalidateAccessoryServer:v22 reason:v23];
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v27 objects:v35 count:16];
    }
    while (v19);
  }
}

- (void)_prepareServerForBLEDiscovery
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = self->_discoveredAccessoryServers;
  uint64_t v3 = [(NSMutableSet *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if (objc_msgSend(v7, "discoveredOverBLE", (void)v8)) {
          [v7 setBleScanPending:1];
        }
      }
      uint64_t v4 = [(NSMutableSet *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)_cleanupLocallyDiscoveredServers
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  uint64_t v3 = [MEMORY[0x263EFF9C0] set];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v4 = self->_discoveredAccessoryServers;
  uint64_t v5 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v32 objects:v41 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v33;
    *(void *)&long long v6 = 138543618;
    long long v25 = v6;
    id v26 = self;
    long long v27 = v4;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v33 != v8) {
          objc_enumerationMutation(v4);
        }
        long long v10 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        if (objc_msgSend(v10, "locallyDiscovered", v25)
          && (![v10 pairedState] && !objc_msgSend(v10, "isPairingInProgress")
           || [v10 isDisabled]))
        {
          long long v11 = (void *)MEMORY[0x2533B64D0]();
          uint64_t v12 = self;
          uint64_t v13 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v15 = id v14 = v3;
            [v10 identifier];
            v17 = uint64_t v16 = v8;
            *(_DWORD *)buf = v25;
            __int16 v38 = v15;
            __int16 v39 = 2112;
            __int16 v40 = v17;
            _os_log_impl(&dword_252495000, v13, OS_LOG_TYPE_INFO, "%{public}@Invalidating only locally discovered server, id %@", buf, 0x16u);

            uint64_t v8 = v16;
            uint64_t v3 = v14;
            self = v26;
            uint64_t v4 = v27;
          }

          [v10 setLocallyDiscovered:0];
          [v3 addObject:v10];
        }
      }
      uint64_t v7 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v32 objects:v41 count:16];
    }
    while (v7);
  }

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v18 = v3;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v29;
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v29 != v21) {
          objc_enumerationMutation(v18);
        }
        uint64_t v23 = *(void *)(*((void *)&v28 + 1) + 8 * j);
        long long v24 = [MEMORY[0x263F087E8] hmmtrErrorWithCode:9];
        [(HMMTRAccessoryServerBrowser *)self invalidateAccessoryServer:v23 reason:v24];
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v28 objects:v36 count:16];
    }
    while (v20);
  }
}

- (void)_handleBLEAddOrUpdateWithDiscriminator:(id)a3 vendorID:(id)a4 productID:(id)a5
{
}

- (void)_handleBonjourRemoveWithDiscriminator:(id)a3 vendorID:(id)a4 productID:(id)a5 txtRecordRemove:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = [(HMMTRAccessoryServerBrowser *)self _discoveredServerWithDiscriminator:v10 vendorID:v11 productID:v12];
  if ([v13 locallyDiscovered])
  {
    id v14 = (void *)MEMORY[0x2533B64D0]();
    uint64_t v15 = self;
    uint64_t v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      id v17 = HMFGetLogIdentifier();
      if (v6) {
        id v18 = "remove";
      }
      else {
        id v18 = "non-commissioning";
      }
      uint64_t v19 = [v13 identifier];
      int v21 = 138543874;
      uint64_t v22 = v17;
      __int16 v23 = 2080;
      long long v24 = v18;
      __int16 v25 = 2112;
      id v26 = v19;
      _os_log_impl(&dword_252495000, v16, OS_LOG_TYPE_INFO, "%{public}@Received bonjour %s for server id %@", (uint8_t *)&v21, 0x20u);
    }
    [v13 setLocallyDiscovered:0];
    if (([v13 isPairingInProgress] & 1) == 0
      && (![v13 pairedState] || objc_msgSend(v13, "isDisabled")))
    {
      uint64_t v20 = [MEMORY[0x263F087E8] hmmtrErrorWithCode:13];
      [(HMMTRAccessoryServerBrowser *)v15 invalidateAccessoryServer:v13 reason:v20];
    }
  }
}

- (void)_handleBonjourAddOrUpdateWithDiscriminator:(id)a3 vendorID:(id)a4 productID:(id)a5
{
}

- (void)_handleAddOrUpdateWithDiscriminator:(id)a3 vendorID:(id)a4 productID:(id)a5 overBLE:(BOOL)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = [MEMORY[0x263F087E8] hmmtrErrorWithCode:9];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __94__HMMTRAccessoryServerBrowser__handleAddOrUpdateWithDiscriminator_vendorID_productID_overBLE___block_invoke;
  v17[3] = &unk_265376508;
  void v17[4] = self;
  id v18 = v10;
  id v19 = v11;
  id v20 = v12;
  BOOL v21 = a6;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  [(HMMTRAccessoryServerBrowser *)self _cleanupDiscoveredServersWithReason:v13 completion:v17];
}

void __94__HMMTRAccessoryServerBrowser__handleAddOrUpdateWithDiscriminator_vendorID_productID_overBLE___block_invoke(uint64_t a1)
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) _discoveredServerWithDiscriminator:*(void *)(a1 + 40) vendorID:*(void *)(a1 + 48) productID:*(void *)(a1 + 56)];
  uint64_t v3 = v2;
  if (v2)
  {
    if ([v2 pairedState] && !objc_msgSend(v3, "isDisabled"))
    {
      long long v30 = (void *)MEMORY[0x2533B64D0]();
      id v31 = *(id *)(a1 + 32);
      long long v32 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        long long v33 = HMFGetLogIdentifier();
        uint64_t v34 = [v3 identifier];
        long long v35 = (void *)v34;
        int v36 = *(unsigned __int8 *)(a1 + 64);
        *(_DWORD *)buf = 138543874;
        uint64_t v46 = v33;
        if (v36) {
          long long v37 = "BLE";
        }
        else {
          long long v37 = "Bonjour";
        }
        __int16 v47 = 2114;
        uint64_t v48 = v34;
        __int16 v49 = 2080;
        uint64_t v50 = (uint64_t)v37;
        _os_log_impl(&dword_252495000, v32, OS_LOG_TYPE_ERROR, "%{public}@CHIP accessory server %{public}@ paired or being paired was unexpectedly discovered over %s", buf, 0x20u);
      }
    }
    else
    {
      if (!*(unsigned char *)(a1 + 64)
        || ![v3 locallyDiscovered]
        || ![v3 discoveredOverBLE]
        || [v3 bleScanPending])
      {
        uint64_t v4 = (void *)MEMORY[0x2533B64D0]();
        id v5 = *(id *)(a1 + 32);
        BOOL v6 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v7 = HMFGetLogIdentifier();
          uint64_t v8 = [v3 identifier];
          long long v9 = (void *)v8;
          int v10 = *(unsigned __int8 *)(a1 + 64);
          *(_DWORD *)buf = 138543874;
          uint64_t v46 = v7;
          if (v10) {
            id v11 = "BLE";
          }
          else {
            id v11 = "Bonjour";
          }
          __int16 v47 = 2114;
          uint64_t v48 = v8;
          __int16 v49 = 2080;
          uint64_t v50 = (uint64_t)v11;
          _os_log_impl(&dword_252495000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Updating CHIP accessory server %{public}@ with new discovery over %s", buf, 0x20u);
        }
      }
      [v3 setLocallyDiscovered:1];
      [v3 setDiscoveredOverBLE:*(unsigned __int8 *)(a1 + 64)];
      [v3 setBleScanPending:0];
    }
  }
  else
  {
    id v12 = [HMMTRAccessoryServerFactory alloc];
    uint64_t v13 = [*(id *)(a1 + 32) keyStore];
    id v14 = [(HMMTRAccessoryServerFactory *)v12 initWithKeystore:v13 browser:*(void *)(a1 + 32)];

    id v15 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(*(id *)(a1 + 32), "_generateNodeID"));
    id v16 = [(HMMTRAccessoryServerFactory *)v14 vendAccessoryServerWithNodeID:v15 setupCode:0 discriminator:*(void *)(a1 + 40) category:0 vendorID:*(void *)(a1 + 48) productID:*(void *)(a1 + 56) serialNumber:0 firmwareRevision:@"1.0.0"];
    id v17 = v16;
    if (v16)
    {
      [v16 setFabricID:0];
      id v18 = (void *)MEMORY[0x2533B64D0]([v17 setKnownToSystemCommissioner:0]);
      id v19 = *(id *)(a1 + 32);
      id v20 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        BOOL v21 = v42 = v14;
        uint64_t v22 = [v17 name];
        uint64_t v23 = [v17 identifier];
        long long v24 = (void *)v23;
        int v25 = *(unsigned __int8 *)(a1 + 64);
        uint64_t v26 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138544386;
        if (v25) {
          uint64_t v27 = "BLE";
        }
        else {
          uint64_t v27 = "Bonjour";
        }
        uint64_t v46 = v21;
        __int16 v47 = 2112;
        uint64_t v48 = (uint64_t)v22;
        __int16 v49 = 2114;
        uint64_t v50 = v23;
        __int16 v51 = 2080;
        uint64_t v52 = v27;
        __int16 v53 = 2112;
        uint64_t v54 = v26;
        _os_log_impl(&dword_252495000, v20, OS_LOG_TYPE_INFO, "%{public}@Discovered new accessory server %@/%{public}@ with new discovery over %s, D=%@", buf, 0x34u);

        id v14 = v42;
      }

      [v17 setLocallyDiscovered:1];
      [v17 setDiscoveredOverBLE:*(unsigned __int8 *)(a1 + 64)];
      [v17 setBleScanPending:0];
      long long v28 = [*(id *)(a1 + 32) discoveredAccessoryServers];
      [v28 addObject:v17];

      if ([*(id *)(a1 + 32) _delegateRespondsToSelector:sel_accessoryServerBrowser_didFindAccessoryServer_stateChanged_stateNumber_])
      {
        long long v29 = [*(id *)(a1 + 32) delegateQueue];
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __94__HMMTRAccessoryServerBrowser__handleAddOrUpdateWithDiscriminator_vendorID_productID_overBLE___block_invoke_156;
        block[3] = &unk_265376E98;
        void block[4] = *(void *)(a1 + 32);
        id v44 = v17;
        dispatch_async(v29, block);
      }
      [v17 registerForNotifications:*(void *)(a1 + 32)];
    }
    else
    {
      __int16 v38 = (void *)MEMORY[0x2533B64D0]();
      id v39 = *(id *)(a1 + 32);
      __int16 v40 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        int v41 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        uint64_t v46 = v41;
        _os_log_impl(&dword_252495000, v40, OS_LOG_TYPE_ERROR, "%{public}@Failed to create an accessory server from a new discovery", buf, 0xCu);
      }
    }
  }
}

void __94__HMMTRAccessoryServerBrowser__handleAddOrUpdateWithDiscriminator_vendorID_productID_overBLE___block_invoke_156(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 accessoryServerBrowser:*(void *)(a1 + 32) didFindAccessoryServer:*(void *)(a1 + 40) stateChanged:0 stateNumber:0];
}

- (void)_setReachability:(BOOL)a3 forServer:(id)a4
{
  BOOL v4 = a3;
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = objc_msgSend(a4, "accessories", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) setReachable:v4];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (id)_discoveredServerWithDiscriminator:(id)a3 vendorID:(id)a4 productID:(id)a5
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v19 = a3;
  id v8 = a4;
  id v9 = a5;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v10 = self->_discoveredAccessoryServers;
  id v11 = (id)[(NSMutableSet *)v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v11; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v10);
        }
        id v14 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if (([v14 removalInProgress] & 1) == 0)
        {
          uint64_t v15 = [v14 vendorID];
          if (![v15 isEqual:v8]) {
            goto LABEL_12;
          }
          id v16 = [v14 productID];
          if (([v16 isEqual:v9] & 1) == 0)
          {

LABEL_12:
            continue;
          }
          int v17 = [v14 doesMatchDiscriminator:v19];

          if (v17)
          {
            id v11 = v14;
            goto LABEL_15;
          }
        }
      }
      id v11 = (id)[(NSMutableSet *)v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v11);
  }
LABEL_15:

  return v11;
}

- (int)_discriminator:(id *)a3 vendorID:(id *)a4 productID:(id *)a5 CM:(id *)a6 fromTXTRecord:(id)a7
{
  uint64_t v12 = a7;
  *a3 = 0;
  *a4 = 0;
  *a5 = 0;
  uint64_t v36 = 0;
  long long v37 = &v36;
  uint64_t v38 = 0x3032000000;
  id v39 = __Block_byref_object_copy__7596;
  __int16 v40 = __Block_byref_object_dispose__7597;
  id v41 = &unk_2702B5820;
  uint64_t v30 = 0;
  id v31 = &v30;
  uint64_t v32 = 0x3032000000;
  long long v33 = __Block_byref_object_copy__7596;
  uint64_t v34 = __Block_byref_object_dispose__7597;
  id v35 = &unk_2702B5820;
  access_value[0] = MEMORY[0x263EF8330];
  access_value[1] = 3221225472;
  access_value[2] = __82__HMMTRAccessoryServerBrowser__discriminator_vendorID_productID_CM_fromTXTRecord___block_invoke;
  access_value[3] = &unk_2653764B8;
  access_value[4] = self;
  access_value[5] = &v36;
  access_value[6] = &v30;
  if (nw_txt_record_access_key(v12, "VP", access_value))
  {
    uint64_t v23 = 0;
    long long v24 = &v23;
    uint64_t v25 = 0x3032000000;
    uint64_t v26 = __Block_byref_object_copy__7596;
    uint64_t v27 = __Block_byref_object_dispose__7597;
    id v28 = &unk_2702B5820;
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __82__HMMTRAccessoryServerBrowser__discriminator_vendorID_productID_CM_fromTXTRecord___block_invoke_147;
    v22[3] = &unk_2653764E0;
    void v22[4] = self;
    void v22[5] = &v23;
    if (nw_txt_record_access_key(v12, "D", v22))
    {
      uint64_t v16 = 0;
      int v17 = &v16;
      uint64_t v18 = 0x3032000000;
      id v19 = __Block_byref_object_copy__7596;
      long long v20 = __Block_byref_object_dispose__7597;
      id v21 = &unk_2702B5820;
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __82__HMMTRAccessoryServerBrowser__discriminator_vendorID_productID_CM_fromTXTRecord___block_invoke_149;
      v15[3] = &unk_2653764E0;
      void v15[4] = self;
      void v15[5] = &v16;
      nw_txt_record_access_key(v12, "CM", v15);
      *a4 = (id) v37[5];
      *a5 = (id) v31[5];
      *a3 = (id) v24[5];
      *a6 = (id) v17[5];
      _Block_object_dispose(&v16, 8);

      int v13 = 0;
    }
    else
    {
      int v13 = -6737;
    }
    _Block_object_dispose(&v23, 8);
  }
  else
  {
    int v13 = -6737;
  }
  _Block_object_dispose(&v30, 8);

  _Block_object_dispose(&v36, 8);
  return v13;
}

uint64_t __82__HMMTRAccessoryServerBrowser__discriminator_vendorID_productID_CM_fromTXTRecord___block_invoke(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  if (a3 == 4)
  {
    uint64_t v6 = (void *)[[NSString alloc] initWithBytes:a4 length:a5 encoding:1];
    uint64_t v7 = [v6 componentsSeparatedByString:@"+"];
    id v8 = (void *)MEMORY[0x2533B64D0]();
    id v9 = *(id *)(a1 + 32);
    long long v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      id v11 = HMFGetLogIdentifier();
      int v34 = 138543874;
      id v35 = v11;
      __int16 v36 = 2112;
      long long v37 = v6;
      __int16 v38 = 2112;
      id v39 = v7;
      _os_log_impl(&dword_252495000, v10, OS_LOG_TYPE_DEBUG, "%{public}@VP value: %@, split int components: %@", (uint8_t *)&v34, 0x20u);
    }
    if ([v7 count] == 2)
    {
      uint64_t v12 = NSNumber;
      int v13 = [v7 objectAtIndexedSubscript:0];
      uint64_t v14 = objc_msgSend(v12, "numberWithInteger:", objc_msgSend(v13, "integerValue"));
      uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v16 = *(void **)(v15 + 40);
      *(void *)(v15 + 40) = v14;

      int v17 = NSNumber;
      uint64_t v18 = [v7 objectAtIndexedSubscript:1];
      uint64_t v19 = objc_msgSend(v17, "numberWithInteger:", objc_msgSend(v18, "integerValue"));
      uint64_t v20 = *(void *)(*(void *)(a1 + 48) + 8);
      id v21 = *(void **)(v20 + 40);
      *(void *)(v20 + 40) = v19;

      if (([*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) isEqual:&unk_2702B5820] & 1) == 0
        && ![*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) isEqual:&unk_2702B5820])
      {
        uint64_t v32 = 1;
        goto LABEL_16;
      }
      long long v22 = (void *)MEMORY[0x2533B64D0]();
      id v23 = *(id *)(a1 + 32);
      long long v24 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        uint64_t v25 = HMFGetLogIdentifier();
        int v34 = 138543618;
        id v35 = v25;
        __int16 v36 = 2112;
        long long v37 = v7;
        uint64_t v26 = "%{public}@Invalid VP values in TXT record: %@";
LABEL_14:
        _os_log_impl(&dword_252495000, v24, OS_LOG_TYPE_ERROR, v26, (uint8_t *)&v34, 0x16u);
      }
    }
    else
    {
      long long v22 = (void *)MEMORY[0x2533B64D0]();
      id v23 = *(id *)(a1 + 32);
      long long v24 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        uint64_t v25 = HMFGetLogIdentifier();
        int v34 = 138543618;
        id v35 = v25;
        __int16 v36 = 2112;
        long long v37 = v6;
        uint64_t v26 = "%{public}@Invalid VP value format in TXT record: %@";
        goto LABEL_14;
      }
    }

    uint64_t v32 = 0;
LABEL_16:

    return v32;
  }
  id v28 = (void *)MEMORY[0x2533B64D0]();
  id v29 = *(id *)(a1 + 32);
  uint64_t v30 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
  {
    id v31 = HMFGetLogIdentifier();
    int v34 = 138543618;
    id v35 = v31;
    __int16 v36 = 1024;
    LODWORD(v37) = a3;
    _os_log_impl(&dword_252495000, v30, OS_LOG_TYPE_INFO, "%{public}@Missing VP value in TXT record: %d", (uint8_t *)&v34, 0x12u);
  }
  return 0;
}

uint64_t __82__HMMTRAccessoryServerBrowser__discriminator_vendorID_productID_CM_fromTXTRecord___block_invoke_147(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  if (a3 == 4)
  {
    uint64_t v6 = (void *)[[NSString alloc] initWithBytes:a4 length:a5 encoding:1];
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v6, "integerValue"));
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    int v10 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) isEqual:&unk_2702B5820];
    if (v10)
    {
      id v11 = (void *)MEMORY[0x2533B64D0]();
      id v12 = *(id *)(a1 + 32);
      int v13 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        uint64_t v14 = HMFGetLogIdentifier();
        uint64_t v15 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
        int v22 = 138543618;
        id v23 = v14;
        __int16 v24 = 2112;
        uint64_t v25 = v15;
        _os_log_impl(&dword_252495000, v13, OS_LOG_TYPE_ERROR, "%{public}@Invalid discriminator value in TXT record: %@", (uint8_t *)&v22, 0x16u);
      }
    }
    uint64_t v16 = v10 ^ 1u;
  }
  else
  {
    int v17 = (void *)MEMORY[0x2533B64D0]();
    id v18 = *(id *)(a1 + 32);
    uint64_t v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      uint64_t v20 = HMFGetLogIdentifier();
      int v22 = 138543362;
      id v23 = v20;
      _os_log_impl(&dword_252495000, v19, OS_LOG_TYPE_INFO, "%{public}@Missing discriminator value in TXT record", (uint8_t *)&v22, 0xCu);
    }
    return 0;
  }
  return v16;
}

BOOL __82__HMMTRAccessoryServerBrowser__discriminator_vendorID_productID_CM_fromTXTRecord___block_invoke_149(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (a3 == 4)
  {
    uint64_t v7 = (void *)[[NSString alloc] initWithBytes:a4 length:a5 encoding:1];
    uint64_t v8 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v7, "integerValue"));
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    int v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
  else
  {
    id v11 = (void *)MEMORY[0x2533B64D0]();
    id v12 = *(id *)(a1 + 32);
    int v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      uint64_t v14 = HMFGetLogIdentifier();
      int v16 = 138543362;
      int v17 = v14;
      _os_log_impl(&dword_252495000, v13, OS_LOG_TYPE_INFO, "%{public}@Missing CM value in TXT record", (uint8_t *)&v16, 0xCu);
    }
  }
  return a3 == 4;
}

- (void)_handleBonjourBrowserBatchResults
{
  uint64_t v71 = *MEMORY[0x263EF8340];
  uint64_t v3 = (void *)MEMORY[0x2533B64D0](self, a2);
  BOOL v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v65 = v6;
    _os_log_impl(&dword_252495000, v5, OS_LOG_TYPE_INFO, "%{public}@Handle bonjour results batch", buf, 0xCu);
  }
  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  obuint64_t j = [(HMMTRAccessoryServerBrowser *)v4 bonjourBrowserChanges];
  uint64_t v7 = v4;
  uint64_t v50 = [obj countByEnumeratingWithState:&v60 objects:v70 count:16];
  if (v50)
  {
    uint64_t v49 = *(void *)v61;
    unint64_t v9 = 0x263EFF000uLL;
    *(void *)&long long v8 = 138543874;
    long long v45 = v8;
    __int16 v47 = v4;
    do
    {
      for (uint64_t i = 0; i != v50; ++i)
      {
        if (*(void *)v61 != v49) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v60 + 1) + 8 * i);
        id v12 = objc_msgSend(v11, "objectAtIndexedSubscript:", 0, v45);
        int v13 = [v11 objectAtIndexedSubscript:1];
        uint64_t v14 = [*(id *)(v9 + 2512) null];
        int v15 = [v12 isEqual:v14];

        if (v15)
        {

          id v12 = 0;
        }
        int v16 = [*(id *)(v9 + 2512) null];
        int v17 = [v13 isEqual:v16];

        if (v17)
        {

          int v13 = 0;
        }
        uint64_t v18 = (void *)MEMORY[0x2533B64D0]();
        uint64_t v19 = v7;
        uint64_t v20 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          id v21 = HMFGetLogIdentifier();
          *(_DWORD *)buf = v45;
          uint64_t v65 = v21;
          __int16 v66 = 2112;
          long long v67 = v12;
          __int16 v68 = 2112;
          long long v69 = v13;
          _os_log_impl(&dword_252495000, v20, OS_LOG_TYPE_DEBUG, "%{public}@Batch result: %@ -> %@", buf, 0x20u);
        }
        char changes = nw_browse_result_get_changes(v12, v13);
        __int16 v51 = v12;
        if ((changes & 0x22) != 0)
        {
          nw_txt_record_t v23 = nw_browse_result_copy_txt_record_object(v13);
          __int16 v24 = (void *)MEMORY[0x2533B64D0]();
          uint64_t v25 = v19;
          uint64_t v26 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v27 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            uint64_t v65 = v27;
            __int16 v66 = 2112;
            long long v67 = v23;
            _os_log_impl(&dword_252495000, v26, OS_LOG_TYPE_DEBUG, "%{public}@New txt record: %@", buf, 0x16u);
          }
          if (v23)
          {
            uint64_t v48 = v13;
            id v58 = 0;
            id v59 = 0;
            id v56 = 0;
            id v57 = 0;
            int v28 = [(HMMTRAccessoryServerBrowser *)v25 _discriminator:&v59 vendorID:&v58 productID:&v57 CM:&v56 fromTXTRecord:v23];
            id v29 = v59;
            id v30 = v58;
            id v31 = v57;
            id v32 = v56;
            long long v33 = v32;
            if (!v28)
            {
              if ([v32 isEqual:&unk_2702B5820]) {
                [(HMMTRAccessoryServerBrowser *)v25 _handleBonjourRemoveWithDiscriminator:v29 vendorID:v30 productID:v31 txtRecordRemove:0];
              }
              else {
                [(HMMTRAccessoryServerBrowser *)v25 _handleBonjourAddOrUpdateWithDiscriminator:v29 vendorID:v30 productID:v31];
              }
            }

            uint64_t v7 = v47;
            int v13 = v48;
          }

          unint64_t v9 = 0x263EFF000;
          id v12 = v51;
        }
        if ((changes & 4) != 0)
        {
          nw_txt_record_t v34 = nw_browse_result_copy_txt_record_object(v12);
          id v35 = (void *)MEMORY[0x2533B64D0]();
          __int16 v36 = v19;
          long long v37 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
          {
            __int16 v38 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            uint64_t v65 = v38;
            __int16 v66 = 2112;
            long long v67 = v34;
            _os_log_impl(&dword_252495000, v37, OS_LOG_TYPE_DEBUG, "%{public}@Removed txt record: %@", buf, 0x16u);
          }
          if (v34)
          {
            id v54 = 0;
            id v55 = 0;
            id v52 = 0;
            id v53 = 0;
            int v39 = [(HMMTRAccessoryServerBrowser *)v36 _discriminator:&v55 vendorID:&v54 productID:&v53 CM:&v52 fromTXTRecord:v34];
            id v40 = v55;
            id v41 = v54;
            id v42 = v53;
            id v43 = v52;
            if (!v39) {
              [(HMMTRAccessoryServerBrowser *)v36 _handleBonjourRemoveWithDiscriminator:v40 vendorID:v41 productID:v42 txtRecordRemove:1];
            }

            uint64_t v7 = v47;
            unint64_t v9 = 0x263EFF000;
          }

          id v12 = v51;
        }
      }
      uint64_t v50 = [obj countByEnumeratingWithState:&v60 objects:v70 count:16];
    }
    while (v50);
  }

  id v44 = [(HMMTRAccessoryServerBrowser *)v7 bonjourBrowserChanges];
  [v44 removeAllObjects];
}

- (void)_queueBonjourBrowserOldResult:(id)a3 newResult:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  long long v8 = (void *)MEMORY[0x2533B64D0]();
  unint64_t v9 = self;
  int v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    uint64_t v18 = v11;
    __int16 v19 = 2112;
    id v20 = v6;
    __int16 v21 = 2112;
    id v22 = v7;
    _os_log_impl(&dword_252495000, v10, OS_LOG_TYPE_INFO, "%{public}@Queued bonjour old result: %@, new result: %@", buf, 0x20u);
  }
  id v12 = [(HMMTRAccessoryServerBrowser *)v9 bonjourBrowserChanges];
  int v13 = v6;
  if (!v6)
  {
    int v13 = [MEMORY[0x263EFF9D0] null];
  }
  v16[0] = v13;
  uint64_t v14 = v7;
  if (!v7)
  {
    uint64_t v14 = objc_msgSend(MEMORY[0x263EFF9D0], "null", v16[0]);
  }
  v16[1] = v14;
  int v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:2];
  [v12 addObject:v15];

  if (!v7)
  {

    if (v6) {
      goto LABEL_9;
    }
LABEL_11:

    goto LABEL_9;
  }
  if (!v6) {
    goto LABEL_11;
  }
LABEL_9:
}

- (int)_initializeAndStartBonjourBrowser
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(HMMTRAccessoryServerBrowser *)self bonjourBrowser];

  BOOL v4 = v3 == 0;
  id v5 = (void *)MEMORY[0x2533B64D0]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if (v4)
  {
    if (v8)
    {
      id v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v29 = v11;
      _os_log_impl(&dword_252495000, v7, OS_LOG_TYPE_INFO, "%{public}@Starting Bonjour Browser...", buf, 0xCu);
    }
    id v12 = objc_alloc_init(MEMORY[0x263EFF980]);
    [(HMMTRAccessoryServerBrowser *)v6 setBonjourBrowserChanges:v12];

    bonjour_service = nw_browse_descriptor_create_bonjour_service("_matterc._udp", "local");
    nw_browse_descriptor_set_include_txt_record(bonjour_service, 1);
    uint64_t v14 = nw_browser_create(bonjour_service, 0);
    if (v14)
    {
      [(HMMTRAccessoryServerBrowser *)v6 setBonjourBrowser:v14];
      int v15 = [(HAPAccessoryServerBrowser *)v6 workQueue];
      nw_browser_set_queue(v14, v15);

      objc_initWeak((id *)buf, v6);
      state_changed_handler[0] = MEMORY[0x263EF8330];
      state_changed_handler[1] = 3221225472;
      state_changed_handler[2] = __64__HMMTRAccessoryServerBrowser__initializeAndStartBonjourBrowser__block_invoke;
      state_changed_handler[3] = &unk_265376468;
      objc_copyWeak(&v27, (id *)buf);
      uint64_t v26 = v14;
      nw_browser_set_state_changed_handler(v26, state_changed_handler);
      int v16 = [(HMMTRAccessoryServerBrowser *)v6 bonjourBrowser];
      handler[0] = MEMORY[0x263EF8330];
      handler[1] = 3221225472;
      handler[2] = __64__HMMTRAccessoryServerBrowser__initializeAndStartBonjourBrowser__block_invoke_136;
      handler[3] = &unk_265376490;
      objc_copyWeak(&v24, (id *)buf);
      nw_browser_set_browse_results_changed_handler(v16, handler);

      int v17 = [(HMMTRAccessoryServerBrowser *)v6 bonjourBrowser];
      nw_browser_start(v17);

      objc_destroyWeak(&v24);
      objc_destroyWeak(&v27);
      objc_destroyWeak((id *)buf);
      int v10 = 0;
    }
    else
    {
      uint64_t v18 = (void *)MEMORY[0x2533B64D0]();
      __int16 v19 = v6;
      id v20 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        __int16 v21 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        id v29 = v21;
        _os_log_impl(&dword_252495000, v20, OS_LOG_TYPE_ERROR, "%{public}@nw_browser_create failed", buf, 0xCu);
      }
      int v10 = -6728;
    }
  }
  else
  {
    if (v8)
    {
      unint64_t v9 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v29 = v9;
      _os_log_impl(&dword_252495000, v7, OS_LOG_TYPE_INFO, "%{public}@Bonjour Browser already active", buf, 0xCu);
    }
    return 0;
  }
  return v10;
}

void __64__HMMTRAccessoryServerBrowser__initializeAndStartBonjourBrowser__block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v7 = (void *)MEMORY[0x2533B64D0]();
  id v8 = WeakRetained;
  unint64_t v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v10 = HMFGetLogIdentifier();
    int v11 = 138543874;
    id v12 = v10;
    __int16 v13 = 1024;
    int v14 = a2;
    __int16 v15 = 2112;
    id v16 = v5;
    _os_log_impl(&dword_252495000, v9, OS_LOG_TYPE_INFO, "%{public}@Bonjour browser state: %d, error: %@", (uint8_t *)&v11, 0x1Cu);
  }
  if (a2 == 2) {
    goto LABEL_6;
  }
  if (a2 == 3)
  {
    nw_browser_set_browse_results_changed_handler(*(nw_browser_t *)(a1 + 32), 0);
    nw_browser_set_state_changed_handler(*(nw_browser_t *)(a1 + 32), 0);
LABEL_6:
    [v8 setBonjourBrowser:0];
  }
}

void __64__HMMTRAccessoryServerBrowser__initializeAndStartBonjourBrowser__block_invoke_136(uint64_t a1, void *a2, void *a3, int a4)
{
  id v6 = (id *)(a1 + 32);
  id v7 = a3;
  id v8 = a2;
  id WeakRetained = objc_loadWeakRetained(v6);
  [WeakRetained _queueBonjourBrowserOldResult:v8 newResult:v7];

  if (a4) {
    [WeakRetained _handleBonjourBrowserBatchResults];
  }
}

- (void)setSystemCommissionerMode:(BOOL)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (self->_systemCommissionerMode != a3)
  {
    id v5 = (void *)MEMORY[0x2533B64D0]();
    id v6 = self;
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = HMFGetLogIdentifier();
      unint64_t v9 = HMFBooleanToString();
      int v10 = HMFBooleanToString();
      int v11 = 138543874;
      id v12 = v8;
      __int16 v13 = 2112;
      int v14 = v9;
      __int16 v15 = 2112;
      id v16 = v10;
      _os_log_impl(&dword_252495000, v7, OS_LOG_TYPE_INFO, "%{public}@Changing System Commissioner Mode from %@ to %@", (uint8_t *)&v11, 0x20u);
    }
    self->_systemCommissionerMode = a3;
  }
}

- (BOOL)systemCommissionerMode
{
  return self->_systemCommissionerMode;
}

- (void)handleSystemKeychainStoreUpdatedNotification:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x2533B64D0]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v12 = v8;
    _os_log_impl(&dword_252495000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling system keychain store updated notification", buf, 0xCu);
  }
  unint64_t v9 = [(HAPAccessoryServerBrowser *)v6 workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __76__HMMTRAccessoryServerBrowser_handleSystemKeychainStoreUpdatedNotification___block_invoke;
  block[3] = &unk_265378638;
  void block[4] = v6;
  dispatch_async(v9, block);
}

void __76__HMMTRAccessoryServerBrowser_handleSystemKeychainStoreUpdatedNotification___block_invoke(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) nocSigner];

  if (!v2)
  {
    int v10 = [[HMMTRMatterKeypair alloc] initWithV0Account:@"CHIPPlugin.nodeopcerts.CA:0"];
    [*(id *)(a1 + 32) setNocSigner:v10];

    int v11 = [*(id *)(a1 + 32) nocSigner];

    if (v11)
    {
      id v12 = (void *)MEMORY[0x2533B64D0]();
      id v13 = *(id *)(a1 + 32);
      int v14 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        __int16 v15 = HMFGetLogIdentifier();
        int v34 = 138543362;
        id v35 = v15;
        _os_log_impl(&dword_252495000, v14, OS_LOG_TYPE_INFO, "%{public}@Apple Home fabrics root key pair is loaded", (uint8_t *)&v34, 0xCu);
      }
      id v16 = [*(id *)(a1 + 32) nocSigner];
      uint64_t v17 = [*(id *)(a1 + 32) storage];
      [v17 setNocSigner:v16];
    }
    goto LABEL_10;
  }
  uint64_t v3 = [*(id *)(a1 + 32) nocSigner];
  int v4 = [v3 reload];

  if (!v4)
  {
LABEL_10:
    int v9 = 0;
    goto LABEL_11;
  }
  id v5 = (void *)MEMORY[0x2533B64D0]();
  id v6 = *(id *)(a1 + 32);
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    int v34 = 138543362;
    id v35 = v8;
    _os_log_impl(&dword_252495000, v7, OS_LOG_TYPE_INFO, "%{public}@Apple Home fabrics root keypair has changed.", (uint8_t *)&v34, 0xCu);
  }
  int v9 = 1;
LABEL_11:
  uint64_t v18 = [*(id *)(a1 + 32) ownerSharedOperationalKeyPair];

  if (v18)
  {
    __int16 v19 = [*(id *)(a1 + 32) ownerSharedOperationalKeyPair];
    int v20 = [v19 reload];

    v9 |= v20;
    if (v20)
    {
      __int16 v21 = (void *)MEMORY[0x2533B64D0]();
      id v22 = *(id *)(a1 + 32);
      uint64_t v23 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        id v24 = HMFGetLogIdentifier();
        int v34 = 138543362;
        id v35 = v24;
        _os_log_impl(&dword_252495000, v23, OS_LOG_TYPE_INFO, "%{public}@Operational keypair for Apple Home fabrics has changed.", (uint8_t *)&v34, 0xCu);
      }
    }
  }
  else
  {
    uint64_t v25 = [[HMMTRMatterKeypair alloc] initWithV0Account:@"CHIPPlugin.nodeOperationalKeyPair.CA:0"];
    [*(id *)(a1 + 32) setOwnerSharedOperationalKeyPair:v25];

    if (v25)
    {
      uint64_t v26 = (void *)MEMORY[0x2533B64D0]();
      id v27 = *(id *)(a1 + 32);
      int v28 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        id v29 = HMFGetLogIdentifier();
        int v34 = 138543362;
        id v35 = v29;
        _os_log_impl(&dword_252495000, v28, OS_LOG_TYPE_INFO, "%{public}@Operational key pair for Apple Home fabrics is loaded.", (uint8_t *)&v34, 0xCu);
      }
      uint64_t v30 = [*(id *)(a1 + 32) ownerSharedOperationalKeyPair];
      id v31 = [*(id *)(a1 + 32) storage];
      [v31 setOperationalKeyPair:v30];
    }
  }
  id v32 = [*(id *)(a1 + 32) systemCommissionerControllerParams];
  [v32 handleKeyPairDataChanged];

  if (v9)
  {
    long long v33 = [*(id *)(a1 + 32) homeFabricControllers];
    [v33 removeAllGetters];
  }
}

- (void)setDelegate:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = [(HAPAccessoryServerBrowser *)self workQueue];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __49__HMMTRAccessoryServerBrowser_setDelegate_queue___block_invoke;
  v11[3] = &unk_265376440;
  objc_copyWeak(&v14, &location);
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __49__HMMTRAccessoryServerBrowser_setDelegate_queue___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v3 = (void *)MEMORY[0x2533B64D0]();
  id v4 = WeakRetained;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    int v7 = 138543362;
    id v8 = v6;
    _os_log_impl(&dword_252495000, v5, OS_LOG_TYPE_INFO, "%{public}@Setting Delegate...", (uint8_t *)&v7, 0xCu);
  }
  [v4 setDelegate:*(void *)(a1 + 32)];
  [v4 setDelegateQueue:*(void *)(a1 + 40)];
}

- (id)discoveredAccessoryServers
{
  uint64_t v3 = [(HAPAccessoryServerBrowser *)self workQueue];
  dispatch_assert_queue_V2(v3);

  [(HMMTRAccessoryServerBrowser *)self _cleanupDiscoveredServers];
  discoveredAccessoryServers = self->_discoveredAccessoryServers;
  return discoveredAccessoryServers;
}

- (int64_t)linkType
{
  return 1;
}

- (id)appleHomeTargetFabricUUIDWithID:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(HMMTRAccessoryServerBrowser *)self storage];
    id v6 = [v5 dataSource];
    int v7 = [v6 appleHomeTargetFabricUUIDWithID:v4];
  }
  else
  {
    int v7 = 0;
  }
  return v7;
}

- (id)appleHomeFabricWithUUID:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(HMMTRAccessoryServerBrowser *)self storage];
    id v6 = [v5 dataSource];
    int v7 = [v6 appleHomeFabricWithUUID:v4];
  }
  else
  {
    int v7 = 0;
  }
  return v7;
}

- (id)appleHomeFabricWithID:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(HMMTRAccessoryServerBrowser *)self storage];
    id v6 = [v5 dataSource];
    int v7 = [v6 appleHomeFabricWithID:v4];
  }
  else
  {
    int v7 = 0;
  }
  return v7;
}

- (id)currentFabric
{
  uint64_t v3 = [(HMMTRAccessoryServerBrowser *)self currentFabricID];
  id v4 = [(HMMTRAccessoryServerBrowser *)self appleHomeFabricWithID:v3];

  return v4;
}

- (BOOL)_isPerControllerStorageEnabled
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (!isFeatureMatterLocalFabricConfigEnabled()) {
    return 0;
  }
  uint64_t v3 = (void *)CFPreferencesCopyAppValue(@"hmmtr.feature.PerControllerStorageAPIEnabled", (CFStringRef)*MEMORY[0x263EFFE60]);
  id v4 = v3;
  if (v3) {
    char v5 = [v3 BOOLValue];
  }
  else {
    char v5 = 1;
  }
  id v6 = (void *)MEMORY[0x2533B64D0]();
  int v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = HMFGetLogIdentifier();
    id v10 = HMFBooleanToString();
    int v12 = 138543874;
    id v13 = v9;
    __int16 v14 = 2112;
    __int16 v15 = v10;
    __int16 v16 = 2112;
    uint64_t v17 = v4;
    _os_log_impl(&dword_252495000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Per controller storage API enabled = %@ (pref value %@)", (uint8_t *)&v12, 0x20u);
  }

  return v5;
}

- (BOOL)_isSystemCommissionerFeaturePreferenceEnabled
{
  return 1;
}

- (NSData)appleHomeFabricRootPublicKey
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if ([(HMMTRMatterKeypair *)self->_nocSigner publicKey])
  {
    CFDataRef v3 = SecKeyCopyExternalRepresentation([(HMMTRMatterKeypair *)self->_nocSigner publicKey], 0);
    if (v3) {
      goto LABEL_9;
    }
    id v4 = (void *)MEMORY[0x2533B64D0]();
    char v5 = self;
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = HMFGetLogIdentifier();
      int v11 = 138543362;
      int v12 = v7;
      id v8 = "%{public}@Failed to fetch Apple Home fabric public key";
LABEL_7:
      _os_log_impl(&dword_252495000, v6, OS_LOG_TYPE_ERROR, v8, (uint8_t *)&v11, 0xCu);
    }
  }
  else
  {
    id v4 = (void *)MEMORY[0x2533B64D0]();
    uint64_t v9 = self;
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = HMFGetLogIdentifier();
      int v11 = 138543362;
      int v12 = v7;
      id v8 = "%{public}@Failed to fetch Apple Home fabric public key; Key-pair doesn't exist";
      goto LABEL_7;
    }
  }

  CFDataRef v3 = 0;
LABEL_9:
  return (NSData *)v3;
}

- (NSData)systemCommissionerFabricRootPublicKey
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  CFDataRef v3 = [(HMMTRAccessoryServerBrowser *)self systemCommissionerNocSigner];
  id v4 = v3;
  if (v3 && [v3 publicKey])
  {
    char v5 = v4;
    goto LABEL_6;
  }
  id v6 = [(HMMTRAccessoryServerBrowser *)self systemCommissionerControllerParams];
  char v5 = [v6 v0MatterKeypairFromKeychain];

  if (v5 && [v5 publicKey])
  {
LABEL_6:
    CFDataRef v7 = SecKeyCopyExternalRepresentation((SecKeyRef)[v5 publicKey], 0);
    if (v7)
    {
      CFDataRef v8 = v7;
      goto LABEL_14;
    }
    uint64_t v9 = (void *)MEMORY[0x2533B64D0]();
    __int16 v14 = self;
    int v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v12 = HMFGetLogIdentifier();
      int v16 = 138543362;
      uint64_t v17 = v12;
      uint64_t v13 = "%{public}@Failed to fetch system commissioner fabric public key";
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  uint64_t v9 = (void *)MEMORY[0x2533B64D0]();
  id v10 = self;
  int v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    int v12 = HMFGetLogIdentifier();
    int v16 = 138543362;
    uint64_t v17 = v12;
    uint64_t v13 = "%{public}@Failed to fetch system commissioner fabric public key; Key-pair doesn't exist";
LABEL_12:
    _os_log_impl(&dword_252495000, v11, OS_LOG_TYPE_ERROR, v13, (uint8_t *)&v16, 0xCu);
  }
LABEL_13:

  CFDataRef v8 = 0;
LABEL_14:

  return (NSData *)v8;
}

- (void)dealloc
{
  int homeKeychainReadyNotificationToken = self->_homeKeychainReadyNotificationToken;
  if (homeKeychainReadyNotificationToken) {
    notify_cancel(homeKeychainReadyNotificationToken);
  }
  int mtsKeychainReadyNotificationToken = self->_mtsKeychainReadyNotificationToken;
  if (mtsKeychainReadyNotificationToken) {
    notify_cancel(mtsKeychainReadyNotificationToken);
  }
  if (self->_lockStateNotificationRegistered) {
    notify_cancel(self->_lockStateNotificationRegistrationToken);
  }
  v5.receiver = self;
  v5.super_class = (Class)HMMTRAccessoryServerBrowser;
  [(HMMTRAccessoryServerBrowser *)&v5 dealloc];
}

- (void)setSystemCommissionerPairingManager:(id)a3
{
}

- (void)dispatchAfterConfiguration:(id)a3
{
  id v4 = a3;
  group = [(HMMTRAccessoryServerBrowser *)self configureDispatchGroup];
  objc_super v5 = [(HAPAccessoryServerBrowser *)self workQueue];
  dispatch_group_notify(group, v5, v4);
}

- (void)configureControllerForFabric:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(HMMTRAccessoryServerBrowser *)self configureDispatchGroup];
  dispatch_group_enter(v5);

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __60__HMMTRAccessoryServerBrowser_configureControllerForFabric___block_invoke;
  v7[3] = &unk_265376E98;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(HMMTRAccessoryServerBrowser *)self dispatchBlock:v7];
}

void __60__HMMTRAccessoryServerBrowser_configureControllerForFabric___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  if (![*(id *)(a1 + 32) _isPerControllerStorageEnabled]) {
    goto LABEL_4;
  }
  uint64_t v2 = [*(id *)(a1 + 40) fabricID];
  if (!v2) {
    goto LABEL_4;
  }
  CFDataRef v3 = (void *)v2;
  id v4 = [*(id *)(a1 + 40) fabricID];
  char v5 = [v4 isEqual:&unk_2702B5820];

  if ((v5 & 1) == 0)
  {
    int v12 = (void *)MEMORY[0x2533B64D0]();
    id v13 = *(id *)(a1 + 32);
    __int16 v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      __int16 v15 = HMFGetLogIdentifier();
      int v16 = [*(id *)(a1 + 40) fabricID];
      *(_DWORD *)buf = 138543618;
      __int16 v21 = v15;
      __int16 v22 = 2112;
      uint64_t v23 = v16;
      _os_log_impl(&dword_252495000, v14, OS_LOG_TYPE_INFO, "%{public}@configuring controller for fabric ID %@", buf, 0x16u);
    }
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __60__HMMTRAccessoryServerBrowser_configureControllerForFabric___block_invoke_126;
    v18[3] = &unk_265378660;
    uint64_t v17 = *(void **)(a1 + 40);
    v18[4] = *(void *)(a1 + 32);
    id v19 = v17;
    [v19 loadFabricAndControllerDataForPairing:0 fetchFromResident:0 completion:v18];
  }
  else
  {
LABEL_4:
    id v6 = (void *)MEMORY[0x2533B64D0]();
    id v7 = *(id *)(a1 + 32);
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = HMFGetLogIdentifier();
      id v10 = [*(id *)(a1 + 40) fabricID];
      *(_DWORD *)buf = 138543618;
      __int16 v21 = v9;
      __int16 v22 = 2112;
      uint64_t v23 = v10;
      _os_log_impl(&dword_252495000, v8, OS_LOG_TYPE_INFO, "%{public}@Per-controller storage is not enabled to configure controller for fabric ID %@ upfront", buf, 0x16u);
    }
    int v11 = [*(id *)(a1 + 32) configureDispatchGroup];
    dispatch_group_leave(v11);
  }
}

void __60__HMMTRAccessoryServerBrowser_configureControllerForFabric___block_invoke_126(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __60__HMMTRAccessoryServerBrowser_configureControllerForFabric___block_invoke_2;
  v6[3] = &unk_265376F38;
  id v7 = v3;
  id v8 = v4;
  id v9 = *(id *)(a1 + 40);
  id v5 = v3;
  [v4 dispatchBlock:v6];
}

void __60__HMMTRAccessoryServerBrowser_configureControllerForFabric___block_invoke_2(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (*(void *)(a1 + 32))
  {
    uint64_t v2 = (void *)MEMORY[0x2533B64D0]();
    id v3 = *(id *)(a1 + 40);
    id v4 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      id v5 = HMFGetLogIdentifier();
      id v6 = [*(id *)(a1 + 48) fabricID];
      *(_DWORD *)buf = 138543618;
      int v12 = v5;
      __int16 v13 = 2112;
      __int16 v14 = v6;
      _os_log_impl(&dword_252495000, v4, OS_LOG_TYPE_INFO, "%{public}@No fabric parameters for fabric ID %@ - no controller configured", buf, 0x16u);
    }
    id v7 = [*(id *)(a1 + 40) configureDispatchGroup];
    dispatch_group_leave(v7);
  }
  else
  {
    id v8 = *(void **)(a1 + 40);
    id v9 = [*(id *)(a1 + 48) fabricID];
    [v8 _setupStorageStateForHomeFabricID:v9];

    id v10 = [*(id *)(a1 + 40) configureDispatchGroup];
    dispatch_group_leave(v10);
  }
}

- (void)configure
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  [(HMMTRAccessoryServerBrowser *)self _logHMMTRFeatures];
  id v3 = [MEMORY[0x263F42620] productInfo];
  if ([v3 productPlatform] == 4
    && ![(HMMTRAccessoryServerBrowser *)self isCurrentDevicePrimaryResident])
  {
    __int16 v13 = [(HMMTRAccessoryServerBrowser *)self controllerFactoryEnablePerPrimaryResidentConfirmationToken];

    if (!v13)
    {
      __int16 v14 = (void *)MEMORY[0x2533B64D0]();
      uint64_t v15 = self;
      int v16 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        uint64_t v17 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        uint64_t v26 = v17;
        _os_log_impl(&dword_252495000, v16, OS_LOG_TYPE_INFO, "%{public}@Disable controller factory operation while not a primary resident", buf, 0xCu);
      }
      uint64_t v18 = [(HMMTRAccessoryServerBrowser *)v15 controllerFactory];
      id v19 = [v18 disableNormalOperation];
      [(HMMTRAccessoryServerBrowser *)v15 setControllerFactoryEnablePerPrimaryResidentConfirmationToken:v19];
    }
  }
  else
  {
  }
  int out_token = 0;
  objc_initWeak(&location, self);
  id v4 = [(HAPAccessoryServerBrowser *)self workQueue];
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __40__HMMTRAccessoryServerBrowser_configure__block_invoke;
  handler[3] = &unk_265376418;
  objc_copyWeak(&v22, &location);
  uint32_t v5 = notify_register_dispatch("com.apple.springboard.lockstate", &out_token, v4, handler);

  id v6 = (void *)MEMORY[0x2533B64D0]();
  id v7 = self;
  if (v5)
  {
    HMFGetOSLogHandle();
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v26 = v9;
      __int16 v27 = 1024;
      uint32_t v28 = v5;
      _os_log_impl(&dword_252495000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to register a handler for lock state notification with status: %u", buf, 0x12u);
    }
  }
  else
  {
    HMFGetOSLogHandle();
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v26 = v11;
      _os_log_impl(&dword_252495000, v10, OS_LOG_TYPE_INFO, "%{public}@Registered lock state notification handler", buf, 0xCu);
    }
    [(HMMTRAccessoryServerBrowser *)v7 setLockStateNotificationRegistrationToken:out_token];
  }
  [(HMMTRAccessoryServerBrowser *)v7 setLockStateNotificationRegistered:v5 == 0];
  if (isFeatureMatteriPhoneOnlyPairingControlForThreadEnabled()
    && CFPreferencesGetAppBooleanValue(@"StartThreadOnWake", @"/Library/Managed Preferences/mobile/com.apple.homed.plist", 0))
  {
    dispatch_time_t v12 = dispatch_time(0, 150000000);
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __40__HMMTRAccessoryServerBrowser_configure__block_invoke_124;
    v20[3] = &unk_265378638;
    v20[4] = v7;
    [(HMMTRAccessoryServerBrowser *)v7 dispatchAfter:v12 block:v20];
  }
  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
}

void __40__HMMTRAccessoryServerBrowser_configure__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleLockStateNotification];
}

uint64_t __40__HMMTRAccessoryServerBrowser_configure__block_invoke_124(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleLockStateNotification];
}

- (void)_logHMMTRFeatures
{
  uint64_t v83 = *MEMORY[0x263EF8340];
  if (!isFeatureMatteriPhoneOnlyPairingControlEnabled())
  {
    id v6 = (void *)MEMORY[0x2533B64D0]();
    dispatch_time_t v12 = self;
    id v8 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    id v10 = HMFGetLogIdentifier();
    int v81 = 138543362;
    __int16 v82 = v10;
    int v11 = "%{public}@iPhoneOnly Pairing and Control feature is disabled";
    goto LABEL_8;
  }
  id v3 = [MEMORY[0x263F42620] productInfo];
  uint64_t v4 = [v3 productClass];

  if (v4 != 3)
  {
    uint64_t v29 = [MEMORY[0x263F42620] productInfo];
    uint64_t v30 = [v29 productPlatform];

    if (v30 == 1)
    {
      int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"MatteriPhoneOnlyPairingForMacEnabled", @"/Library/Managed Preferences/mobile/com.apple.homed.plist", 0);
      id v6 = (void *)MEMORY[0x2533B64D0]();
      id v32 = self;
      id v8 = HMFGetOSLogHandle();
      BOOL v33 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
      if (!AppBooleanValue)
      {
        if (v33)
        {
          id v10 = HMFGetLogIdentifier();
          int v81 = 138543362;
          __int16 v82 = v10;
          int v11 = "%{public}@iPhoneOnly Pairing and Control feature for Mac is enabled";
          goto LABEL_8;
        }
        goto LABEL_9;
      }
      if (!v33) {
        goto LABEL_9;
      }
      id v10 = HMFGetLogIdentifier();
      int v81 = 138543362;
      __int16 v82 = v10;
      int v11 = "%{public}@iPhoneOnly Pairing and Control feature for Mac is enabled through profile";
    }
    else
    {
      int v78 = CFPreferencesGetAppBooleanValue(@"MatteriPhoneOnlyPairingEnabled", @"/Library/Managed Preferences/mobile/com.apple.homed.plist", 0);
      id v6 = (void *)MEMORY[0x2533B64D0]();
      uint64_t v79 = self;
      id v8 = HMFGetOSLogHandle();
      BOOL v80 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
      if (!v78)
      {
        if (v80)
        {
          id v10 = HMFGetLogIdentifier();
          int v81 = 138543362;
          __int16 v82 = v10;
          int v11 = "%{public}@iPhoneOnly Pairing and Control feature is enabled";
          goto LABEL_8;
        }
        goto LABEL_9;
      }
      if (!v80) {
        goto LABEL_9;
      }
      id v10 = HMFGetLogIdentifier();
      int v81 = 138543362;
      __int16 v82 = v10;
      int v11 = "%{public}@iPhoneOnly Pairing and Control feature is enabled through profile";
    }
LABEL_8:
    _os_log_impl(&dword_252495000, v8, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v81, 0xCu);

    goto LABEL_9;
  }
  int v5 = CFPreferencesGetAppBooleanValue(@"MatteriPhoneOnlyPairingForIPadEnabled", @"/Library/Managed Preferences/mobile/com.apple.homed.plist", 0);
  id v6 = (void *)MEMORY[0x2533B64D0]();
  id v7 = self;
  id v8 = HMFGetOSLogHandle();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (!v9) {
      goto LABEL_9;
    }
    id v10 = HMFGetLogIdentifier();
    int v81 = 138543362;
    __int16 v82 = v10;
    int v11 = "%{public}@iPhoneOnly Pairing and Control feature for iPad is enabled through profile";
    goto LABEL_8;
  }
  if (v9)
  {
    id v10 = HMFGetLogIdentifier();
    int v81 = 138543362;
    __int16 v82 = v10;
    int v11 = "%{public}@iPhoneOnly Pairing and Control feature for iPad is enabled";
    goto LABEL_8;
  }
LABEL_9:

  uint64_t v13 = isFeatureMatteriPhoneOnlyPairingControlForThreadEnabled();
  if (!v13)
  {
    uint64_t v24 = (void *)MEMORY[0x2533B64D0](v13, v14);
    uint64_t v25 = self;
    uint64_t v26 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_40;
    }
    __int16 v27 = HMFGetLogIdentifier();
    int v81 = 138543362;
    __int16 v82 = v27;
    uint32_t v28 = "%{public}@ThreadService feature is disabled";
    goto LABEL_39;
  }
  uint64_t v15 = CFPreferencesGetAppBooleanValue(@"ThreadServiceEnabled", @"/Library/Managed Preferences/mobile/com.apple.homed.plist", 0);
  int v16 = v15;
  uint64_t v18 = (void *)MEMORY[0x2533B64D0](v15, v17);
  id v19 = self;
  int v20 = HMFGetOSLogHandle();
  BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
  if (v16)
  {
    if (!v21) {
      goto LABEL_22;
    }
    id v22 = HMFGetLogIdentifier();
    int v81 = 138543362;
    __int16 v82 = v22;
    uint64_t v23 = "%{public}@ThreadService feature is enabled through profile";
  }
  else
  {
    if (!v21) {
      goto LABEL_22;
    }
    id v22 = HMFGetLogIdentifier();
    int v81 = 138543362;
    __int16 v82 = v22;
    uint64_t v23 = "%{public}@ThreadService feature is enabled";
  }
  _os_log_impl(&dword_252495000, v20, OS_LOG_TYPE_DEFAULT, v23, (uint8_t *)&v81, 0xCu);

LABEL_22:
  uint64_t v34 = CFPreferencesGetAppBooleanValue(@"StartThreadOnWake", @"/Library/Managed Preferences/mobile/com.apple.homed.plist", 0);
  int v35 = v34;
  long long v37 = (void *)MEMORY[0x2533B64D0](v34, v36);
  __int16 v38 = v19;
  int v39 = HMFGetOSLogHandle();
  BOOL v40 = os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT);
  if (v35)
  {
    if (!v40) {
      goto LABEL_28;
    }
    id v41 = HMFGetLogIdentifier();
    int v81 = 138543362;
    __int16 v82 = v41;
    id v42 = "%{public}@StartThreadOnWake feature is enabled through profile";
  }
  else
  {
    if (!v40) {
      goto LABEL_28;
    }
    id v41 = HMFGetLogIdentifier();
    int v81 = 138543362;
    __int16 v82 = v41;
    id v42 = "%{public}@StartThreadOnWake feature is disabled";
  }
  _os_log_impl(&dword_252495000, v39, OS_LOG_TYPE_DEFAULT, v42, (uint8_t *)&v81, 0xCu);

LABEL_28:
  uint64_t v43 = CFPreferencesGetAppBooleanValue(@"StartThreadOnWakeBypassAccessoryRequirement", @"/Library/Managed Preferences/mobile/com.apple.homed.plist", 0);
  int v44 = v43;
  uint64_t v46 = (void *)MEMORY[0x2533B64D0](v43, v45);
  __int16 v47 = v38;
  uint64_t v48 = HMFGetOSLogHandle();
  BOOL v49 = os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT);
  if (v44)
  {
    if (!v49) {
      goto LABEL_34;
    }
    uint64_t v50 = HMFGetLogIdentifier();
    int v81 = 138543362;
    __int16 v82 = v50;
    __int16 v51 = "%{public}@StartThreadOnWakeBypassAccessoryRequirement feature is enabled through profile";
  }
  else
  {
    if (!v49) {
      goto LABEL_34;
    }
    uint64_t v50 = HMFGetLogIdentifier();
    int v81 = 138543362;
    __int16 v82 = v50;
    __int16 v51 = "%{public}@StartThreadOnWakeBypassAccessoryRequirement feature is disabled";
  }
  _os_log_impl(&dword_252495000, v48, OS_LOG_TYPE_DEFAULT, v51, (uint8_t *)&v81, 0xCu);

LABEL_34:
  uint64_t v52 = CFPreferencesGetAppBooleanValue(@"StartThreadOnWakeAllowHomeThreadStop", @"/Library/Managed Preferences/mobile/com.apple.homed.plist", 0);
  int v53 = v52;
  uint64_t v24 = (void *)MEMORY[0x2533B64D0](v52, v54);
  id v55 = v47;
  uint64_t v26 = HMFGetOSLogHandle();
  BOOL v56 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
  if (v53)
  {
    if (!v56) {
      goto LABEL_40;
    }
    __int16 v27 = HMFGetLogIdentifier();
    int v81 = 138543362;
    __int16 v82 = v27;
    uint32_t v28 = "%{public}@StartThreadOnWakeAllowHomeThreadStop feature is enabled through profile";
  }
  else
  {
    if (!v56) {
      goto LABEL_40;
    }
    __int16 v27 = HMFGetLogIdentifier();
    int v81 = 138543362;
    __int16 v82 = v27;
    uint32_t v28 = "%{public}@StartThreadOnWakeAllowHomeThreadStop feature is disabled";
  }
LABEL_39:
  _os_log_impl(&dword_252495000, v26, OS_LOG_TYPE_DEFAULT, v28, (uint8_t *)&v81, 0xCu);

LABEL_40:
  uint64_t v57 = _os_feature_enabled_impl();
  if (v57)
  {
    id v59 = (void *)MEMORY[0x2533B64D0](v57, v58);
    long long v60 = self;
    long long v61 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_49;
    }
    long long v62 = HMFGetLogIdentifier();
    int v81 = 138543362;
    __int16 v82 = v62;
    long long v63 = "%{public}@RVC feature is enabled";
  }
  else
  {
    uint64_t v64 = HM_FEATURE_RVC_DEFAULTS_ENABLED();
    int v65 = v64;
    id v59 = (void *)MEMORY[0x2533B64D0](v64, v66);
    long long v67 = self;
    long long v61 = HMFGetOSLogHandle();
    BOOL v68 = os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT);
    if (v65)
    {
      if (!v68) {
        goto LABEL_49;
      }
      long long v62 = HMFGetLogIdentifier();
      int v81 = 138543362;
      __int16 v82 = v62;
      long long v63 = "%{public}@RVC feature is enabled through profile";
    }
    else
    {
      if (!v68) {
        goto LABEL_49;
      }
      long long v62 = HMFGetLogIdentifier();
      int v81 = 138543362;
      __int16 v82 = v62;
      long long v63 = "%{public}@RVC feature is disabled";
    }
  }
  _os_log_impl(&dword_252495000, v61, OS_LOG_TYPE_DEFAULT, v63, (uint8_t *)&v81, 0xCu);

LABEL_49:
  uint64_t v69 = isFeatureMatterLocalFabricConfigEnabled();
  int v70 = v69;
  uint64_t v72 = (void *)MEMORY[0x2533B64D0](v69, v71);
  __int16 v73 = self;
  __int16 v74 = HMFGetOSLogHandle();
  BOOL v75 = os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT);
  if (v70)
  {
    if (v75)
    {
      __int16 v76 = HMFGetLogIdentifier();
      int v81 = 138543362;
      __int16 v82 = v76;
      id v77 = "%{public}@Local fabric config feature is enabled";
LABEL_54:
      _os_log_impl(&dword_252495000, v74, OS_LOG_TYPE_DEFAULT, v77, (uint8_t *)&v81, 0xCu);
    }
  }
  else if (v75)
  {
    __int16 v76 = HMFGetLogIdentifier();
    int v81 = 138543362;
    __int16 v82 = v76;
    id v77 = "%{public}@Local fabric config feature is disabled";
    goto LABEL_54;
  }
}

- (void)removeFabricWithActiveSecondaryClients:(id)a3
{
  p_fabricSetLocuint64_t k = &self->_fabricSetLock;
  id v5 = a3;
  os_unfair_lock_lock(p_fabricSetLock);
  [(NSMutableSet *)self->_fabricsWithActiveSecondaryClients removeObject:v5];

  os_unfair_lock_unlock(p_fabricSetLock);
}

- (void)addFabricWithActiveSecondaryClients:(id)a3
{
  p_fabricSetLocuint64_t k = &self->_fabricSetLock;
  id v5 = a3;
  os_unfair_lock_lock(p_fabricSetLock);
  [(NSMutableSet *)self->_fabricsWithActiveSecondaryClients addObject:v5];

  os_unfair_lock_unlock(p_fabricSetLock);
}

- (void)removeFabricWithActiveClients:(id)a3
{
  p_fabricSetLocuint64_t k = &self->_fabricSetLock;
  id v5 = a3;
  os_unfair_lock_lock(p_fabricSetLock);
  [(NSMutableSet *)self->_fabricsWithActiveClients removeObject:v5];

  os_unfair_lock_unlock(p_fabricSetLock);
}

- (void)addFabricWithActiveClients:(id)a3
{
  p_fabricSetLocuint64_t k = &self->_fabricSetLock;
  id v5 = a3;
  os_unfair_lock_lock(p_fabricSetLock);
  [(NSMutableSet *)self->_fabricsWithActiveClients addObject:v5];

  os_unfair_lock_unlock(p_fabricSetLock);
}

- (NSSet)fabricsWithActiveSecondaryClients
{
  p_fabricSetLocuint64_t k = &self->_fabricSetLock;
  os_unfair_lock_lock(&self->_fabricSetLock);
  uint64_t v4 = (void *)[(NSMutableSet *)self->_fabricsWithActiveSecondaryClients copy];
  os_unfair_lock_unlock(p_fabricSetLock);
  return (NSSet *)v4;
}

- (NSSet)fabricsWithActiveClients
{
  p_fabricSetLocuint64_t k = &self->_fabricSetLock;
  os_unfair_lock_lock(&self->_fabricSetLock);
  uint64_t v4 = (void *)[(NSMutableSet *)self->_fabricsWithActiveClients copy];
  os_unfair_lock_unlock(p_fabricSetLock);
  return (NSSet *)v4;
}

- (id)_populateControllerFactoryParams
{
  if ([(HMMTRAccessoryServerBrowser *)self _isPerControllerStorageEnabled])
  {
    id v3 = 0;
  }
  else
  {
    id v3 = +[HMMTRControllerFactory factoryParamsWithCommonStorage];
    uint64_t v4 = [(HMMTRAttestationDataStore *)self->_attestationDataStore paaCertificates];
    [v3 setProductAttestationAuthorityCertificates:v4];

    id v5 = [(HMMTRAttestationDataStore *)self->_attestationDataStore cdCertificates];
    [v3 setCertificationDeclarationCertificates:v5];

    if ((_os_feature_enabled_impl() & 1) != 0
      || CFPreferencesGetAppBooleanValue(@"MatterOTA", @"/Library/Managed Preferences/mobile/com.apple.homed.plist", 0))
    {
      [v3 setOtaProviderDelegate:self->_otaProviderDelegate];
    }
  }
  return v3;
}

- (HMMTRAccessoryServerBrowser)initWithQueue:(id)a3 storeDirectoryURL:(id)a4
{
  uint64_t v102 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v99.receiver = self;
  v99.super_class = (Class)HMMTRAccessoryServerBrowser;
  id v8 = [(HAPAccessoryServerBrowser *)&v99 initWithQueue:v6];
  if (v8)
  {
    uint64_t v9 = [MEMORY[0x263EFF9C0] set];
    discoveredAccessoryServers = v8->_discoveredAccessoryServers;
    v8->_discoveredAccessoryServers = (NSMutableSet *)v9;

    uint64_t v11 = [MEMORY[0x263EFF9C0] set];
    stagedAccessoryServers = v8->_stagedAccessoryServers;
    v8->_stagedAccessoryServers = (NSMutableSet *)v11;

    uint64_t v13 = [[HMMTRStorage alloc] initWithQueue:v6];
    storage = v8->_storage;
    v8->_storage = v13;

    [(HMMTRStorage *)v8->_storage setDelegate:v8];
    uint64_t v15 = objc_alloc_init(HMMTRResidentStateManager);
    residentStateManager = v8->_residentStateManager;
    v8->_residentStateManager = v15;

    currentFabricID = v8->_currentFabricID;
    v8->_currentFabricID = 0;

    v8->_browserState = 0;
    [(HMMTRResidentStateManager *)v8->_residentStateManager setDelegate:v8];
    v8->_fabricSetLock._os_unfair_lock_opaque = 0;
    uint64_t v18 = [MEMORY[0x263EFF9C0] set];
    fabricsWithActiveClients = v8->_fabricsWithActiveClients;
    v8->_fabricsWithActiveClients = (NSMutableSet *)v18;

    uint64_t v20 = [MEMORY[0x263EFF9C0] set];
    fabricsWithActiveSecondaryClients = v8->_fabricsWithActiveSecondaryClients;
    v8->_fabricsWithActiveSecondaryClients = (NSMutableSet *)v20;

    uint64_t v22 = [MEMORY[0x263EFF9B0] orderedSet];
    fabricsWithActiveConnections = v8->_fabricsWithActiveConnections;
    v8->_fabricsWithActiveConnections = (NSMutableOrderedSet *)v22;

    uint64_t v24 = [MEMORY[0x263EFF9B0] orderedSet];
    fabricsWithPendingConnections = v8->_fabricsWithPendingConnections;
    v8->_fabricsWithPendingConnections = (NSMutableOrderedSet *)v24;

    v8->_connectionRequestSuspended = 0;
    uint64_t v26 = [MEMORY[0x263EFF9C0] set];
    allowedNodeIDsForConnectionRequests = v8->_allowedNodeIDsForConnectionRequests;
    v8->_allowedNodeIDsForConnectionRequests = (NSMutableSet *)v26;

    uint32_t v28 = [[HMMTRThreadRadioManager alloc] initWithBrowser:v8];
    threadRadioManager = v8->_threadRadioManager;
    v8->_threadRadioManager = v28;

    uint64_t v30 = [v7 URLByAppendingPathComponent:@"chip-vendor-metadata"];
    uint64_t v31 = [v30 URLByAppendingPathExtension:@"plist"];

    __int16 v97 = (void *)v31;
    id v32 = [[HMMTRVendorMetadataFileStore alloc] initWithFileURL:v31];
    vendorMetadataStore = v8->_vendorMetadataStore;
    v8->_vendorMetadataStore = (HMMTRVendorMetadataStore *)v32;

    id v98 = v7;
    uint64_t v34 = [v7 URLByAppendingPathComponent:@"chip-attestation-data-store"];
    int v35 = [v34 URLByAppendingPathExtension:@"plist"];

    uint64_t v36 = [[HMMTRAttestationDataStore alloc] initWithFileURL:v35];
    attestationDataStore = v8->_attestationDataStore;
    v8->_attestationDataStore = v36;

    __int16 v38 = [[HMMTRUIDialogPresenter alloc] initWithQueue:v6 context:v8];
    uiDialogPresenter = v8->_uiDialogPresenter;
    v8->_uiDialogPresenter = v38;

    BOOL v40 = [[HMMTRAttestationStatus alloc] initWithQueue:v6 uiDialogPresenter:v8->_uiDialogPresenter failSafeExpiryTimeoutSecs:&unk_2702B5808];
    attestationStatus = v8->_attestationStatus;
    v8->_attestationStatus = v40;

    v96 = [[HMMTRUserAuthorizationForPairing alloc] initWithUiDialogPresenter:v8->_uiDialogPresenter];
    -[HMMTRAttestationStatus setUserAuthorizationDelegate:](v8->_attestationStatus, "setUserAuthorizationDelegate:");
    if ((_os_feature_enabled_impl() & 1) != 0
      || CFPreferencesGetAppBooleanValue(@"MatterOTA", @"/Library/Managed Preferences/mobile/com.apple.homed.plist", 0))
    {
      id v42 = [[HMMTRSoftwareUpdateProvider alloc] initWithQueue:v6 browser:v8];
      softwareUpdateProvider = v8->_softwareUpdateProvider;
      v8->_softwareUpdateProvider = v42;

      int v44 = [[HMMTROTAProviderDelegate alloc] initWithQueue:v6 browser:v8];
      otaProviderDelegate = v8->_otaProviderDelegate;
      v8->_otaProviderDelegate = v44;

      uint64_t v46 = [[HMMTRThreadSoftwareUpdateController alloc] initWithQueue:v6 browser:v8];
      threadSoftwareUpdateController = v8->_threadSoftwareUpdateController;
      v8->_threadSoftwareUpdateController = v46;
    }
    uint64_t v48 = [[HMMTRSystemCommissionerPairingManager alloc] initWithQueue:v6 accessoryServerBrowser:v8];
    systemCommissionerPairingManager = v8->_systemCommissionerPairingManager;
    v8->_systemCommissionerPairingManager = v48;

    v8->_requestedBLEScan = 0;
    v8->_bleScanActive = 0;
    v8->_restartCount = 0;
    uint64_t v50 = [MEMORY[0x263EFF9C0] set];
    nodesWithPendingACLOverwrite = v8->_nodesWithPendingACLOverwrite;
    v8->_nodesWithPendingACLOverwrite = (NSMutableSet *)v50;

    uint64_t v52 = [[HMMTRMatterKeypair alloc] initWithV0Account:@"CHIPPlugin.nodeopcerts.CA:0"];
    nocSigner = v8->_nocSigner;
    v8->_nocSigner = v52;

    v8->_systemCommissionerFeatureEnabled = [(HMMTRAccessoryServerBrowser *)v8 _isSystemCommissionerFeaturePreferenceEnabled];
    uint64_t v54 = v8->_nocSigner;
    if (!v54)
    {
      id v55 = (void *)MEMORY[0x2533B64D0]();
      BOOL v56 = v8;
      uint64_t v57 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
      {
        uint64_t v58 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        __int16 v101 = v58;
        _os_log_impl(&dword_252495000, v57, OS_LOG_TYPE_ERROR, "%{public}@!!! NOC Signer keypair failed to load, browser may not be operational !!!", buf, 0xCu);
      }
      uint64_t v54 = v8->_nocSigner;
    }
    [(HMMTRStorage *)v8->_storage setNocSigner:v54];
    id v59 = NSNumber;
    long long v60 = [(HMMTRAccessoryServerBrowser *)v8 appleHomeFabricRootPublicKey];
    long long v61 = objc_msgSend(v59, "numberWithUnsignedInteger:", objc_msgSend(v60, "hash"));
    [(HMMTRStorage *)v8->_storage setCertificateIssuerID:v61];

    long long v62 = [[HMMTRMatterKeypair alloc] initWithV0Account:@"CHIPPlugin.nodeOperationalKeyPair.CA:0"];
    ownerSharedOperationalKeyPair = v8->_ownerSharedOperationalKeyPair;
    v8->_ownerSharedOperationalKeyPair = v62;

    [(HMMTRStorage *)v8->_storage setOperationalKeyPair:v8->_ownerSharedOperationalKeyPair];
    uint64_t v64 = [[HMMTRMatterKeypair alloc] initAsDeviceLocal];
    ownerLocalOperationalKeyPair = v8->_ownerLocalOperationalKeyPair;
    v8->_ownerLocalOperationalKeyPair = v64;

    uint64_t v66 = objc_alloc_init(HMMTRRegulatoryInfo);
    regulatoryInfo = v8->_regulatoryInfo;
    v8->_regulatoryInfo = v66;

    uint64_t v68 = [MEMORY[0x263EFF9C0] set];
    nodesAddedToHome = v8->_nodesAddedToHome;
    v8->_nodesAddedToHome = (NSMutableSet *)v68;

    int v70 = [MEMORY[0x263F08A00] defaultCenter];
    uint64_t v71 = *MEMORY[0x263F357C0];
    uint64_t v72 = [MEMORY[0x263F35AD0] systemStore];
    [v70 addObserver:v8 selector:sel_handleSystemKeychainStoreUpdatedNotification_ name:v71 object:v72];

    __int16 v73 = [MEMORY[0x263F08A00] defaultCenter];
    [v73 addObserver:v8 selector:sel_handleThreadNetworkStateChangedNotification_ name:@"HMMTRThreadRadioStateChangedNotification" object:0];

    __int16 v74 = [HMMTRControllerFactory alloc];
    dispatch_queue_t v75 = dispatch_queue_create("HMMTRControllerFactory queue", 0);
    __int16 v76 = [(HMMTRAccessoryServerBrowser *)v8 _populateControllerFactoryParams];
    uint64_t v77 = [(HMMTRControllerFactory *)v74 initWithWorkQueue:v75 factoryParams:v76];
    controllerFactory = v8->_controllerFactory;
    v8->_controllerFactory = (HMMTRControllerFactory *)v77;

    uint64_t v79 = [HMMTRFabricControllerStore alloc];
    dispatch_queue_t v80 = dispatch_queue_create("HMMTRFabricControllerStore queue", 0);
    uint64_t v81 = [(HMMTRFabricControllerStore *)v79 initWithQueue:v80 controllerFactory:v8->_controllerFactory];
    homeFabricControllers = v8->_homeFabricControllers;
    v8->_homeFabricControllers = (HMMTRFabricControllerStore *)v81;

    uint64_t v83 = [HMMTRSystemCommissionerControllerParams alloc];
    dispatch_queue_t v84 = dispatch_queue_create("HMMTRSystemCommissionerControllerParams queue", 0);
    uint64_t v85 = [(HMMTRSystemCommissionerControllerParams *)v83 initWithQueue:v84 controllerFactory:v8->_controllerFactory];
    systemCommissionerControllerParams = v8->_systemCommissionerControllerParams;
    v8->_systemCommissionerControllerParams = (HMMTRSystemCommissionerControllerParams *)v85;

    if ([(HMMTRAccessoryServerBrowser *)v8 _isSystemCommissionerFeaturePreferenceEnabled]&& [(HMMTRAccessoryServerBrowser *)v8 _isPerControllerStorageEnabled])
    {
      v87 = [(HMMTRAttestationDataStore *)v8->_attestationDataStore paaCertificates];
      [(HMMTRSystemCommissionerControllerParams *)v8->_systemCommissionerControllerParams setProductAttestationAuthorityCertificates:v87];

      dispatch_queue_t v88 = [(HMMTRAttestationDataStore *)v8->_attestationDataStore cdCertificates];
      [(HMMTRSystemCommissionerControllerParams *)v8->_systemCommissionerControllerParams setCertificationDeclarationCertificates:v88];
    }
    v89 = objc_alloc_init(HMMTRPairingWindowInfoTable);
    pairingWindowInfoTable = v8->_pairingWindowInfoTable;
    v8->_pairingWindowInfoTable = v89;

    uint64_t v91 = [MEMORY[0x263EFF980] array];
    deviceControllerHandlers = v8->_deviceControllerHandlers;
    v8->_deviceControllerHandlers = (NSMutableArray *)v91;

    dispatch_group_t v93 = dispatch_group_create();
    configureDispatchGroup = v8->_configureDispatchGroup;
    v8->_configureDispatchGroup = (OS_dispatch_group *)v93;

    id v7 = v98;
  }

  return v8;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t426 != -1) {
    dispatch_once(&logCategory__hmf_once_t426, &__block_literal_global_391);
  }
  uint64_t v2 = (void *)logCategory__hmf_once_v427;
  return v2;
}

uint64_t __42__HMMTRAccessoryServerBrowser_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v427;
  logCategory__hmf_once_v427 = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

@end