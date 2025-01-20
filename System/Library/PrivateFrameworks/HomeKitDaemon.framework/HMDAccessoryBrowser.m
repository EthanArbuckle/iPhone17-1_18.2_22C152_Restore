@interface HMDAccessoryBrowser
+ (id)logCategory;
- (BOOL)__isAccessoryBrowsingRequested;
- (BOOL)__isMediaAccessoryBrowsingRequested;
- (BOOL)_isAccessoryServerTombstoned:(id)a3;
- (BOOL)_isHomeHubAvailableWithConfiguration:(id)a3;
- (BOOL)_isHomeHubMatterSharedAdminPairingCapableWithConfiguration:(id)a3;
- (BOOL)_isOwnerPairingAccessoryWithConfiguration:(id)a3;
- (BOOL)_isPrimaryResidentReachableWithConfiguration:(id)a3;
- (BOOL)_shouldAccessoryServerBeTombstoned:(id)a3;
- (BOOL)active;
- (BOOL)areThereAnyAssociatedAirPlayAccessories;
- (BOOL)areThereAnyPairedAccessories;
- (BOOL)areThereAnyPairedBTLEAccessories;
- (BOOL)areThereAnyPairedUnknownLinkTypeAccessories;
- (BOOL)btlePowerState;
- (BOOL)doesLinkTypeNumber:(uint64_t)a3 matchLinkType:;
- (BOOL)hasActiveWACPairing;
- (BOOL)internalDiscoveryRequest;
- (BOOL)isBrowsingAllowed;
- (BOOL)isDiscoveringAccessoriesWithLinkType:(int64_t)a3;
- (BOOL)isServerLinkTypeBrowseable:(int64_t)a3;
- (BOOL)supportsCommissioningCertificateRetrievalForCurrentlyPairingAccessory;
- (BOOL)supportsCommissioningCertificateRetrievalForHomeUUID:(id)a3;
- (BOOL)unitTestEnableWHB;
- (HAPAccessoryServerBrowser)hap2AccessoryServerBrowser;
- (HAPAccessoryServerBrowserBTLE)btleAccessoryServerBrowser;
- (HAPAccessoryServerBrowserIP)ipAccessoryServerBrowser;
- (HMDAccessoryBrowser)initWithMessageDispatcher:(id)a3;
- (HMDAccessoryBrowser)initWithMessageDispatcher:(id)a3 injectedSettings:(id)a4;
- (HMDAccessoryBrowserManagerDelegate)managerDelegate;
- (HMDAccessoryBrowserUnpairedAccessoryManagerDelegate)unpairedAccessoryManagerDelegate;
- (HMDAccessoryServerBrowserDemo)demoAccessoryServerBrowser;
- (HMDAuthServer)authServer;
- (HMDHAP2Storage)hap2Storage;
- (HMDHomeManager)homeManager;
- (HMDMediaBrowser)mediaBrowser;
- (HMDUnassociatedWACAccessory)getActiveWACSession;
- (HMDWACBrowser)wacBrowser;
- (HMFMessageDispatcher)messageDispatcher;
- (HMFTimer)stopBrowsingAccessoriesNeedingReprovisioningTimer;
- (HMFTimer)stopReprovisioningTimer;
- (HMMTRAccessoryServerBrowser)chipAccessoryServerBrowser;
- (NSArray)browseableLinkTypes;
- (NSArray)deviceSetupMediaAccessories;
- (NSArray)unassociatedAccessories;
- (NSArray)unassociatedMediaAccessories;
- (NSArray)unpairedHAPAccessories;
- (NSData)wiFiPSKForAccessoryReprovisioning;
- (NSHashTable)discoveringAccessoryServerBrowsers;
- (NSHashTable)discoveringBLEAccessoryServerIdentifiers;
- (NSHashTable)tombstonedHAPAccessoryServers;
- (NSMutableArray)accessoryServerBrowsers;
- (NSMutableArray)currentlyPairingAccessories;
- (NSMutableArray)currentlyPairingProgressHandlers;
- (NSMutableArray)pairedAccessories;
- (NSMutableSet)discoveredAccessoryServerIdentifiers;
- (NSString)countrycodeForAccessoryReprovisioning;
- (NSString)identifierOfAccessoryBeingReprovisioned;
- (NSUUID)uuid;
- (OS_dispatch_queue)workQueue;
- (OS_dispatch_source)reachabilityTimerForBTLE;
- (id)__identifiersOfPairedAccessoriesWithTransports:(unint64_t)a3;
- (id)_getHAPMetadataFromHMMetadata:(id)a3;
- (id)_pairingInformationForAccessoryIdentifier:(id)a3;
- (id)_pairingInformationForUnpairedAccessory:(id)a3;
- (id)_progressHandlerForUnpairedAccessory:(id)a3;
- (id)_requiredCharacteristicsTypesToReadFromBTLEServer:(id)a3;
- (id)_tombstonedAccessoryServerWithServerIdentifier:(id)a3;
- (id)_unassociatedMediaAccessoryWithIdentifier:(id)a3;
- (id)_unpairedAccessoryMatchingPairingInfo:(id)a3;
- (id)beginActiveAssertionWithReason:(id)a3;
- (id)browsingConnections;
- (id)currentControllerPairingIdentity;
- (id)discoveredAccessoryServers;
- (id)dumpBrowsingConnections;
- (id)dumpRegisteredPairedAccessories;
- (id)dumpUnassociatedAccessories;
- (id)findAccessoryServerForAccessoryDescription:(id)a3;
- (id)identifiersOfAssociatedMediaAccessories;
- (id)identifiersOfPairedBTLEAccessories;
- (id)identifiersOfPairedUnknownLinkTypeAccessories;
- (id)messageDestination;
- (id)pairedAccessoryInformationWithIdentifier:(id)a3;
- (id)pairedAccessoryInformationWithSetupID:(id)a3;
- (id)pairedHMDHAPAccessoryWithAccessoryServer:(id)a3;
- (id)unassociatedAccessoriesForClientRequest:(id)a3;
- (id)unpairedAccessoryForServer:(id)a3;
- (id)unpairedAccessoryWithServerIdentifier:(id)a3;
- (id)unpairedAccessoryWithUUID:(id)a3;
- (id)unpairedHAPAccessoryWithAccessoryDescription:(id)a3;
- (unint64_t)generationCounter;
- (unint64_t)numPairedIPAccessories;
- (unint64_t)unitTestBTLEReachabilityInterval;
- (void)__activate;
- (void)__addBrowsingConnection:(id)a3;
- (void)__handleProcessStateChange:(id)a3;
- (void)__inactivate;
- (void)__removeBrowsingObserver:(id)a3 error:(id)a4;
- (void)__resetBrowsingConnections;
- (void)_accessoryServer:(id)a3 didStopPairingWithError:(id)a4 matterPairingEndContext:(id)a5;
- (void)_accessoryServerBrowser:(id)a3 didRemoveAccessoryServer:(id)a4 error:(id)a5 matterPairingEndContext:(id)a6;
- (void)_addDiscoveredAccessoryServerIdentifier:(id)a3;
- (void)_addReconfirmTimer:(id)a3 accessoryServer:(id)a4;
- (void)_addUnpairedAccessoryForServer:(id)a3;
- (void)_associate:(BOOL)a3 hapAccessoryWithAdvertisement:(id)a4;
- (void)_associateMediaAccessoryForServer:(id)a3;
- (void)_btleAccessoryReachabilityProbeTimer:(BOOL)a3;
- (void)_callProgressOrErrorOut:(id)a3 pairingInfo:(id)a4 accessoryInfo:(id)a5 unpairedAccessory:(id)a6 progress:(int64_t)a7 certStatus:(unint64_t)a8;
- (void)_cancelCurrentlyPairingAccessories:(int64_t)a3 linkType:(id)a4;
- (void)_cancelPairingWithAccessory:(id)a3 error:(id)a4 context:(id)a5;
- (void)_cancelPairingWithAccessoryDescription:(id)a3 error:(id)a4 context:(id)a5;
- (void)_checkIfPairingWithPairedAccessoryServer:(id)a3 errorCode:(int64_t)a4;
- (void)_continueAfterPPIDValidation:(BOOL)a3 server:(id)a4;
- (void)_discoverAccessories:(id)a3;
- (void)_discoverAccessoryServer:(id)a3 linkType:(int64_t)a4 errorHandler:(id)a5;
- (void)_handleAddedAccessory:(id)a3;
- (void)_handleAddedAccessoryAdvertisements:(id)a3;
- (void)_handleCurrentWiFiNetworkChangedNotification:(id)a3;
- (void)_handlePairingInterruptedTimeout:(id)a3 error:(id)a4;
- (void)_handleRemovedAccessory:(id)a3;
- (void)_handleRemovedAccessoryAdvertisements:(id)a3;
- (void)_handleRemovedUnpairedHAPAccessory:(id)a3;
- (void)_handleRequestFetchNewAccessories:(id)a3;
- (void)_handleRequestSearchForNewAccessories:(id)a3;
- (void)_handleSetupCodeAvailable:(id)a3;
- (void)_handleTestModeConfigRequest:(id)a3;
- (void)_handleWACAccessoryFound;
- (void)_notifyDelegateOfAccessoryServer:(id)a3 didDiscoverAccessories:(id)a4 transaction:(id)a5 error:(id)a6;
- (void)_notifyDelegateOfAccessoryServer:(id)a3 didStopPairingWithError:(id)a4;
- (void)_notifyDelegateOfAccessoryServer:(id)a3 didUpdateCategory:(id)a4;
- (void)_notifyDelegateOfAccessoryServer:(id)a3 didUpdateHasPairings:(BOOL)a4;
- (void)_notifyDelegateOfAccessoryServer:(id)a3 didUpdateValuesForCharacteristics:(id)a4 stateNumber:(id)a5 broadcast:(BOOL)a6;
- (void)_notifyDelegateOfAccessoryServerNeedingReprovisioning:(id)a3 error:(id)a4;
- (void)_notifyDelegateOfDiscoveryFailure:(id)a3 accessoryServer:(id)a4 linkType:(int64_t)a5;
- (void)_notifyDelegateOfNewPairedAccessoryServer:(id)a3 stateChanged:(BOOL)a4 stateNumber:(id)a5;
- (void)_notifyDelegateOfReachabilityChange:(BOOL)a3 forAccessoryWithIdentifier:(id)a4;
- (void)_notifyDelegateOfReachabilityChangeChange:(BOOL)a3 forBTLEAccessories:(id)a4;
- (void)_notifyDelegateOfRemovedAccessoryServer:(id)a3 error:(id)a4;
- (void)_notifyDelegateOfTombstonedAccessoryServer:(id)a3;
- (void)_notifyDelegateOfWACCompletionForAccessoryServerWithIdentifier:(id)a3 error:(id)a4;
- (void)_notifyManagerOfNewAccessory;
- (void)_pairAccessory:(id)a3 configuration:(id)a4 completionHandler:(id)a5;
- (void)_pairAccessoryWithDescription:(id)a3 configuration:(id)a4 progressHandler:(id)a5 completionHandler:(id)a6;
- (void)_promptForPairingPasswordForServer:(id)a3 reason:(id)a4;
- (void)_registerForMessages;
- (void)_registerForNotifications;
- (void)_removeBrowsingConnection:(id)a3 error:(id)a4;
- (void)_removeDiscoveredAccessoryServerIdentifier:(id)a3;
- (void)_removePairingInformation:(id)a3 error:(id)a4 context:(id)a5;
- (void)_removePairingInformationForUnpairedAccessory:(id)a3;
- (void)_reprovisionAccessoryWithIdentifier:(id)a3 wiFiPSK:(id)a4 countryCode:(id)a5 withCompletion:(id)a6;
- (void)_restartBrowsers;
- (void)_resurrectAccessoryServer:(id)a3;
- (void)_sendNewAccessoryData:(id)a3 messageName:(id)a4;
- (void)_sendPairingCompletionStatusForServer:(id)a3 error:(id)a4 matterPairingEndContext:(id)a5 completionHandler:(id)a6;
- (void)_setBTLEPowerChangeCompletionHandler;
- (void)_setupHMMTRAccessoryServer:(id)a3 pairingInfo:(id)a4;
- (void)_startDiscoveringAccessoriesNeedingReprovisioning;
- (void)_startDiscoveringAccessoriesWithLinkType:(id)a3;
- (void)_startDiscoveringMediaAccessories;
- (void)_startDiscoveringPairedAccessories:(id)a3;
- (void)_startDiscoveryForAccessoryServerBrowser:(id)a3;
- (void)_startPairingInterruptionTimer:(id)a3;
- (void)_stopBtleAccessoryReachabilityProbeTimer;
- (void)_stopDiscoveringAccessoriesWithError:(id)a3;
- (void)_stopDiscoveringAccessoriesWithLinkType:(id)a3 force:(BOOL)a4 error:(id)a5;
- (void)_stopDiscoveringMediaAccessories;
- (void)_stopDiscoveryForAccessoryServerBrowser:(id)a3;
- (void)_stopReconfirmTimer:(id)a3;
- (void)_stopReprovisioningTimerHandler;
- (void)_tombstoneAccessoryServer:(id)a3 forceNotify:(BOOL)a4;
- (void)_updateHasActiveWACPairing:(int64_t)a3;
- (void)_updatePairingRetryTimerForAccessory:(id)a3 delay:(int64_t)a4;
- (void)accessoryServer:(id)a3 authenticateUUID:(id)a4 token:(id)a5;
- (void)accessoryServer:(id)a3 confirmUUID:(id)a4 token:(id)a5;
- (void)accessoryServer:(id)a3 didDisconnectWithError:(id)a4;
- (void)accessoryServer:(id)a3 didDiscoverAccessories:(id)a4 transaction:(id)a5 error:(id)a6;
- (void)accessoryServer:(id)a3 didFinishAuth:(id)a4;
- (void)accessoryServer:(id)a3 didReceiveBadPasswordThrottleAttemptsWithDelay:(int64_t)a4;
- (void)accessoryServer:(id)a3 didStopPairingWithError:(id)a4;
- (void)accessoryServer:(id)a3 didStopPairingWithError:(id)a4 matterPairingEndContext:(id)a5;
- (void)accessoryServer:(id)a3 didUpdateCategory:(id)a4;
- (void)accessoryServer:(id)a3 didUpdateConnectionState:(BOOL)a4 linkLayerType:(int64_t)a5 bookkeeping:(id)a6 withError:(id)a7;
- (void)accessoryServer:(id)a3 didUpdateConnectionState:(BOOL)a4 linkLayerType:(int64_t)a5 withError:(id)a6;
- (void)accessoryServer:(id)a3 didUpdateConnectionState:(BOOL)a4 sessionInfo:(id)a5 linkLayerType:(int64_t)a6 withError:(id)a7;
- (void)accessoryServer:(id)a3 didUpdateHasPairings:(BOOL)a4;
- (void)accessoryServer:(id)a3 didUpdateName:(id)a4;
- (void)accessoryServer:(id)a3 didUpdateValuesForCharacteristics:(id)a4 stateNumber:(id)a5 broadcast:(BOOL)a6;
- (void)accessoryServer:(id)a3 didUpdateWakeNumber:(id)a4;
- (void)accessoryServer:(id)a3 promptUserForPasswordWithType:(unint64_t)a4;
- (void)accessoryServer:(id)a3 promtDialog:(id)a4 forNotCertifiedAccessory:(id)a5 completion:(id)a6;
- (void)accessoryServer:(id)a3 requestUserPermission:(int64_t)a4 accessoryInfo:(id)a5 error:(id)a6;
- (void)accessoryServer:(id)a3 updatePairingProgress:(int64_t)a4;
- (void)accessoryServer:(id)a3 validateCert:(id)a4 model:(id)a5;
- (void)accessoryServer:(id)a3 validateUUID:(id)a4 token:(id)a5 model:(id)a6;
- (void)accessoryServerBrowser:(id)a3 accessoryServer:(id)a4 didUpdateValuesForCharacteristics:(id)a5 stateNumber:(id)a6 broadcast:(BOOL)a7;
- (void)accessoryServerBrowser:(id)a3 cacheOperationalCertData:(id)a4 forFabricID:(id)a5;
- (void)accessoryServerBrowser:(id)a3 didChangeReachability:(BOOL)a4 forAccessoryServerWithIdentifier:(id)a5;
- (void)accessoryServerBrowser:(id)a3 didFailToDiscoverAccessoryServerWithIdentifier:(id)a4;
- (void)accessoryServerBrowser:(id)a3 didFindAccessoryServer:(id)a4 stateChanged:(BOOL)a5 stateNumber:(id)a6;
- (void)accessoryServerBrowser:(id)a3 didFindAccessoryServerForReprovisioning:(id)a4;
- (void)accessoryServerBrowser:(id)a3 didFindAccessoryServerNeedingReprovisioning:(id)a4 error:(id)a5;
- (void)accessoryServerBrowser:(id)a3 didFinishPairingForAccessoryServer:(id)a4;
- (void)accessoryServerBrowser:(id)a3 didFinishWACForAccessoryWithIdentifier:(id)a4 error:(id)a5;
- (void)accessoryServerBrowser:(id)a3 didRemoveAccessoryServer:(id)a4 error:(id)a5;
- (void)accessoryServerBrowser:(id)a3 didRemoveAccessoryServer:(id)a4 error:(id)a5 matterPairingEndContext:(id)a6;
- (void)accessoryServerBrowser:(id)a3 didStartDiscoveringWithError:(id)a4;
- (void)accessoryServerBrowser:(id)a3 didStopDiscoveringWithError:(id)a4;
- (void)accessoryServerBrowser:(id)a3 getCacheForAccessoryWithIdentifier:(id)a4 withCompletion:(id)a5;
- (void)accessoryServerBrowser:(id)a3 getCachedOperationalCertificateDataForFabricID:(id)a4 completion:(id)a5;
- (void)accessoryServerBrowser:(id)a3 getCommissioningCertificatesForNodeID:(id)a4 fabricID:(id)a5 publicKey:(id)a6 completion:(id)a7;
- (void)accessoryServerBrowser:(id)a3 getLockedState:(BOOL *)a4;
- (void)accessoryServerBrowser:(id)a3 getThreadNetworkCredentialsForAccessoryWithIdentifier:(id)a4 withCompletion:(id)a5;
- (void)accessoryServerBrowser:(id)a3 removeCacheForAccessoryWithIdentifier:(id)a4;
- (void)accessoryServerBrowser:(id)a3 saveCache:(id)a4 serverIdentifier:(id)a5;
- (void)accessoryServerDidUpdateStateNumber:(id)a3;
- (void)accessoryServerNeedsOwnershipToken:(id)a3;
- (void)activate:(BOOL)a3;
- (void)addPairedAccessory:(id)a3;
- (void)addUnassociatedAccessory:(id)a3 forDeviceSetup:(BOOL)a4;
- (void)addUnassociatedMediaAccessory:(id)a3 forDeviceSetup:(BOOL)a4;
- (void)addUnassociatedWACAccessory:(id)a3;
- (void)addUnpairedAccessoryServer:(id)a3 identifier:(id)a4;
- (void)addUnpairedHAPAccessory:(id)a3;
- (void)browser:(id)a3 didAddAdvertisements:(id)a4;
- (void)browser:(id)a3 didFindAssociatedMediaAccessory:(id)a4;
- (void)browser:(id)a3 didLoseAssociatedMediaAccessory:(id)a4 error:(id)a5;
- (void)browser:(id)a3 didRemoveAdvertisements:(id)a4;
- (void)browser:(id)a3 didRemoveSessions:(id)a4;
- (void)browser:(id)a3 didUpdateEndpoints:(id)a4;
- (void)btleAccessoryReachabilityProbeTimer:(BOOL)a3;
- (void)cancelPairingWithAccessory:(id)a3 error:(id)a4 context:(id)a5;
- (void)cancelPairingWithAccessoryDescription:(id)a3 error:(id)a4;
- (void)cancelPairingWithAccessoryDescription:(id)a3 error:(id)a4 context:(id)a5;
- (void)configureAccessory:(id)a3 trackState:(BOOL)a4 connectionPriority:(BOOL)a5;
- (void)configureDemoBrowserWithDemoAccessories:(id)a3 finalized:(BOOL)a4;
- (void)configureWithHomeManager:(id)a3;
- (void)configureWithHomeManager:(id)a3 mediaBrowserFactory:(id)a4;
- (void)continueAddingAccessoryToHomeAfterUserConfirmation:(id)a3 withError:(id)a4;
- (void)currentlyFoundHAPAccessoryServerWithIdentifier:(id)a3 linkType:(int64_t)a4 completion:(id)a5;
- (void)dealloc;
- (void)deregisterPairedAccessory:(id)a3;
- (void)didFinishActivation:(id)a3 context:(id)a4;
- (void)didReceiveUserConsentResponseForSetupAccessoryDetail:(id)a3 consent:(BOOL)a4;
- (void)discoverAccessories:(id)a3;
- (void)discoverAccessoryServer:(id)a3 linkType:(int64_t)a4 errorHandler:(id)a5;
- (void)endActiveAssertion:(id)a3;
- (void)evaluateAccessoryDiscoveryState;
- (void)fetchAccessoryCacheForIdentifier:(id)a3 completion:(id)a4;
- (void)handleActivationResponse:(id)a3 context:(id)a4;
- (void)handleAddedAccessory:(id)a3;
- (void)handleConnectionDeactivation:(id)a3;
- (void)handleConnectionUpdateWithBonjourDeviceInfo:(id)a3 socketInfo:(id)a4;
- (void)handleNewlyPairedAccessory:(id)a3 linkType:(int64_t)a4;
- (void)handlePPIDInfoResponse:(id)a3 context:(id)a4 error:(id)a5;
- (void)handleRemovedAccessory:(id)a3;
- (void)handleSetupCodeAvailable:(id)a3;
- (void)handleXPCConnectionInvalidated:(id)a3;
- (void)homeLocationChangeNotification:(id)a3;
- (void)notifyMTRMetrics:(id)a3;
- (void)notifyMatterAccessoryPairingStep:(unint64_t)a3;
- (void)pairAccessory:(id)a3 configuration:(id)a4 completionHandler:(id)a5;
- (void)pairAccessoryWithDescription:(id)a3 configuration:(id)a4 progressHandler:(id)a5 completionHandler:(id)a6;
- (void)populateUnassociatedCurrentAccessory;
- (void)probeReachabilityForBTLEAccessoryServersWithIdentifiers:(id)a3 forceScan:(BOOL)a4 withCompletion:(id)a5;
- (void)registerPairedAccessory:(id)a3 transports:(unint64_t)a4 setupHash:(id)a5 delegate:(id)a6;
- (void)registerProgressHandler:(id)a3 unpairedAccessoryUUID:(id)a4;
- (void)removeAccessoryCacheForIdentifier:(id)a3;
- (void)removePairedAccessory:(id)a3;
- (void)removePairedAccessoryInfoWithIdentifier:(id)a3;
- (void)removePairingInformationForAccessoryServer:(id)a3;
- (void)removeUnassociatedAccessory:(id)a3;
- (void)removeUnassociatedAccessoryWithIdentifier:(id)a3;
- (void)removeUnassociatedMediaAccessory:(id)a3;
- (void)removeUnassociatedWACAccessory:(id)a3;
- (void)removeUnpairedHAPAccessory:(id)a3;
- (void)reprovisionAccessoryWithIdentifier:(id)a3 wiFiPSK:(id)a4 countryCode:(id)a5 withCompletion:(id)a6;
- (void)requestPermissionToAssociateWACAccessory:(id)a3 completionHandler:(id)a4;
- (void)resetConfiguration;
- (void)resetPairedAccessories;
- (void)resetUnassociatedCurrentAccessory;
- (void)restartBrowsers;
- (void)resurrectAccessoryServer:(id)a3;
- (void)retrieveCurrentStateForIdentifier:(id)a3 stateNumber:(id *)a4 isReachable:(BOOL *)a5 linkQuality:(unint64_t *)a6 lastSeen:(id *)a7;
- (void)saveAccessoryCache:(id)a3 forIdentifier:(id)a4;
- (void)setAccessoryServerBrowsers:(id)a3;
- (void)setActive:(BOOL)a3;
- (void)setActiveWACSession:(id)a3;
- (void)setAuthServer:(id)a3;
- (void)setBrowseableLinkTypes:(id)a3;
- (void)setBtleAccessoryServerBrowser:(id)a3;
- (void)setBtlePowerState:(BOOL)a3;
- (void)setCountrycodeForAccessoryReprovisioning:(id)a3;
- (void)setCurrentlyPairingAccessories:(id)a3;
- (void)setCurrentlyPairingProgressHandlers:(id)a3;
- (void)setDemoAccessoryServerBrowser:(id)a3;
- (void)setDiscoveredAccessoryServerIdentifiers:(id)a3;
- (void)setDiscoveringAccessoryServerBrowsers:(id)a3;
- (void)setGenerationCounter:(unint64_t)a3;
- (void)setHap2AccessoryServerBrowser:(id)a3;
- (void)setHap2Storage:(id)a3;
- (void)setHasActiveWACPairing:(BOOL)a3;
- (void)setHomeManager:(id)a3;
- (void)setIdentifierOfAccessoryBeingReprovisioned:(id)a3;
- (void)setInternalDiscoveryRequest:(BOOL)a3;
- (void)setIpAccessoryServerBrowser:(id)a3;
- (void)setManagerDelegate:(id)a3;
- (void)setMediaBrowser:(id)a3;
- (void)setMessageDispatcher:(id)a3;
- (void)setPairedAccessories:(id)a3;
- (void)setQOS:(int64_t)a3;
- (void)setReachabilityTimerForBTLE:(id)a3;
- (void)setUnitTestBTLEReachabilityInterval:(unint64_t)a3;
- (void)setUnitTestEnableWHB:(BOOL)a3;
- (void)setUnpairedAccessoryManagerDelegate:(id)a3;
- (void)setUuid:(id)a3;
- (void)setWacBrowser:(id)a3;
- (void)setWiFiPSKForAccessoryReprovisioning:(id)a3;
- (void)setWorkQueue:(id)a3;
- (void)startDiscoveringAccessories;
- (void)startDiscoveringAccessoriesNeedingReprovisioning;
- (void)startDiscoveringAccessoriesWithLinkType:(int64_t)a3;
- (void)startDiscoveringMediaAccessories;
- (void)startDiscoveringPairedAccessories;
- (void)startDiscoveringPairedAccessoriesWithLinkType:(int64_t)a3;
- (void)stopDiscoveringAccessories;
- (void)stopDiscoveringAccessoriesWithLinkType:(int64_t)a3;
- (void)stopDiscoveringForUnpairedAccessoriesWithLinkType:(int64_t)a3;
- (void)stopDiscoveringMediaAccessories;
- (void)stopTrackingBTLEAccessoriesWithIdentifiers:(id)a3;
- (void)timerDidFire:(id)a3;
- (void)tombstoneAccessoryServer:(id)a3;
- (void)unassociatedWACAccessoryDidFinishAssociation:(id)a3 withError:(id)a4;
- (void)unassociatedWACAccessoryDidStartAssociation:(id)a3;
- (void)updateAlreadyPairingProgressForAccessoryServerIdentifier:(id)a3 progressHandler:(id)a4;
- (void)updateBroadcastKeyForIdentifier:(id)a3 key:(id)a4 keyUpdatedStateNumber:(id)a5 keyUpdatedTime:(double)a6;
- (void)updatePairingWithProgress:(int64_t)a3 accessoryServer:(id)a4;
- (void)updateProgressForMappedErrors:(id)a3 accessoryServer:(id)a4 progressHandler:(id)a5;
- (void)updateRemoteAccessoryBrowsing:(BOOL)a3 whbScan:(BOOL)a4;
- (void)updateStateForIdentifier:(id)a3 stateNumber:(id)a4;
- (void)validateLinkTypes:(id)a3;
- (void)vendorModel:(id *)a3 vendorManufacturer:(id *)a4 accessoryInfo:(id)a5;
@end

@implementation HMDAccessoryBrowser

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_discoveringBLEAccessoryServerIdentifiers, 0);
  objc_storeStrong((id *)&self->_tombstonedHAPAccessoryServers, 0);
  objc_storeStrong((id *)&self->_currentlyPairingProgressHandlers, 0);
  objc_storeStrong((id *)&self->_currentlyPairingAccessories, 0);
  objc_storeStrong((id *)&self->_reachabilityTimerForBTLE, 0);
  objc_storeStrong((id *)&self->_pairedAccessories, 0);
  objc_storeStrong((id *)&self->_countrycodeForAccessoryReprovisioning, 0);
  objc_storeStrong((id *)&self->_wiFiPSKForAccessoryReprovisioning, 0);
  objc_storeStrong((id *)&self->_identifierOfAccessoryBeingReprovisioned, 0);
  objc_storeStrong((id *)&self->_stopBrowsingAccessoriesNeedingReprovisioningTimer, 0);
  objc_storeStrong((id *)&self->_stopReprovisioningTimer, 0);
  objc_storeStrong((id *)&self->_demoAccessoryServerBrowser, 0);
  objc_storeStrong((id *)&self->_authServer, 0);
  objc_storeStrong((id *)&self->_wacBrowser, 0);
  objc_storeStrong((id *)&self->_mediaBrowser, 0);
  objc_storeStrong((id *)&self->_hap2Storage, 0);
  objc_storeStrong((id *)&self->_hap2AccessoryServerBrowser, 0);
  objc_storeStrong((id *)&self->_btleAccessoryServerBrowser, 0);
  objc_storeStrong((id *)&self->_ipAccessoryServerBrowser, 0);
  objc_storeStrong((id *)&self->_discoveringAccessoryServerBrowsers, 0);
  objc_storeStrong((id *)&self->_accessoryServerBrowsers, 0);
  objc_destroyWeak((id *)&self->_homeManager);
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_browseableLinkTypes, 0);
  objc_destroyWeak((id *)&self->_unpairedAccessoryManagerDelegate);
  objc_destroyWeak((id *)&self->_managerDelegate);
  objc_storeStrong((id *)&self->_accessoryPerformingWAC, 0);
  objc_storeStrong((id *)&self->_chipAccessoryServerBrowser, 0);
  objc_storeStrong((id *)&self->_discoveredAccessoryServerIdentifiers, 0);
  objc_storeStrong((id *)&self->_activeAssertions, 0);
  objc_storeStrong((id *)&self->_browsingConnections, 0);
  objc_storeStrong((id *)&self->_unassociatedCurrentAccessory, 0);
  objc_storeStrong((id *)&self->_unassociatedWACAccessories, 0);
  objc_storeStrong((id *)&self->_deviceSetupMediaAccessories, 0);
  objc_storeStrong((id *)&self->_unassociatedMediaAccessories, 0);
  objc_storeStrong((id *)&self->_unpairedHAPAccessories, 0);
}

- (void)setHasActiveWACPairing:(BOOL)a3
{
  self->_hasActiveWACPairing = a3;
}

- (BOOL)hasActiveWACPairing
{
  return self->_hasActiveWACPairing;
}

- (void)setDiscoveredAccessoryServerIdentifiers:(id)a3
{
}

- (NSMutableSet)discoveredAccessoryServerIdentifiers
{
  return self->_discoveredAccessoryServerIdentifiers;
}

- (NSHashTable)discoveringBLEAccessoryServerIdentifiers
{
  return self->_discoveringBLEAccessoryServerIdentifiers;
}

- (NSHashTable)tombstonedHAPAccessoryServers
{
  return self->_tombstonedHAPAccessoryServers;
}

- (void)setCurrentlyPairingProgressHandlers:(id)a3
{
}

- (NSMutableArray)currentlyPairingProgressHandlers
{
  return self->_currentlyPairingProgressHandlers;
}

- (void)setCurrentlyPairingAccessories:(id)a3
{
}

- (NSMutableArray)currentlyPairingAccessories
{
  return self->_currentlyPairingAccessories;
}

- (void)setReachabilityTimerForBTLE:(id)a3
{
}

- (OS_dispatch_source)reachabilityTimerForBTLE
{
  return self->_reachabilityTimerForBTLE;
}

- (void)setPairedAccessories:(id)a3
{
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (BOOL)active
{
  return self->_active;
}

- (void)setCountrycodeForAccessoryReprovisioning:(id)a3
{
}

- (NSString)countrycodeForAccessoryReprovisioning
{
  return self->_countrycodeForAccessoryReprovisioning;
}

- (void)setWiFiPSKForAccessoryReprovisioning:(id)a3
{
}

- (NSData)wiFiPSKForAccessoryReprovisioning
{
  return self->_wiFiPSKForAccessoryReprovisioning;
}

- (void)setIdentifierOfAccessoryBeingReprovisioned:(id)a3
{
}

- (NSString)identifierOfAccessoryBeingReprovisioned
{
  return self->_identifierOfAccessoryBeingReprovisioned;
}

- (HMFTimer)stopBrowsingAccessoriesNeedingReprovisioningTimer
{
  return self->_stopBrowsingAccessoriesNeedingReprovisioningTimer;
}

- (HMFTimer)stopReprovisioningTimer
{
  return self->_stopReprovisioningTimer;
}

- (void)setDemoAccessoryServerBrowser:(id)a3
{
}

- (HMDAccessoryServerBrowserDemo)demoAccessoryServerBrowser
{
  return self->_demoAccessoryServerBrowser;
}

- (void)setAuthServer:(id)a3
{
}

- (HMDAuthServer)authServer
{
  return self->_authServer;
}

- (void)setWacBrowser:(id)a3
{
}

- (HMDWACBrowser)wacBrowser
{
  return self->_wacBrowser;
}

- (void)setMediaBrowser:(id)a3
{
}

- (HMDMediaBrowser)mediaBrowser
{
  return self->_mediaBrowser;
}

- (void)setHap2Storage:(id)a3
{
}

- (HMDHAP2Storage)hap2Storage
{
  return self->_hap2Storage;
}

- (void)setHap2AccessoryServerBrowser:(id)a3
{
}

- (HAPAccessoryServerBrowser)hap2AccessoryServerBrowser
{
  return self->_hap2AccessoryServerBrowser;
}

- (void)setBtleAccessoryServerBrowser:(id)a3
{
}

- (HAPAccessoryServerBrowserBTLE)btleAccessoryServerBrowser
{
  return self->_btleAccessoryServerBrowser;
}

- (void)setIpAccessoryServerBrowser:(id)a3
{
}

- (HAPAccessoryServerBrowserIP)ipAccessoryServerBrowser
{
  return self->_ipAccessoryServerBrowser;
}

- (void)setDiscoveringAccessoryServerBrowsers:(id)a3
{
}

- (NSHashTable)discoveringAccessoryServerBrowsers
{
  return self->_discoveringAccessoryServerBrowsers;
}

- (void)setAccessoryServerBrowsers:(id)a3
{
}

- (NSMutableArray)accessoryServerBrowsers
{
  return self->_accessoryServerBrowsers;
}

- (void)setHomeManager:(id)a3
{
}

- (HMDHomeManager)homeManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_homeManager);
  return (HMDHomeManager *)WeakRetained;
}

- (void)setGenerationCounter:(unint64_t)a3
{
  self->_generationCounter = a3;
}

- (unint64_t)generationCounter
{
  return self->_generationCounter;
}

- (void)setMessageDispatcher:(id)a3
{
}

- (HMFMessageDispatcher)messageDispatcher
{
  return self->_messageDispatcher;
}

- (void)setUuid:(id)a3
{
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setWorkQueue:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setUnitTestBTLEReachabilityInterval:(unint64_t)a3
{
  self->_unitTestBTLEReachabilityInterval = a3;
}

- (unint64_t)unitTestBTLEReachabilityInterval
{
  return self->_unitTestBTLEReachabilityInterval;
}

- (void)setUnitTestEnableWHB:(BOOL)a3
{
  self->_unitTestEnableWHB = a3;
}

- (BOOL)unitTestEnableWHB
{
  return self->_unitTestEnableWHB;
}

- (NSArray)browseableLinkTypes
{
  return self->_browseableLinkTypes;
}

- (HMDAccessoryBrowserManagerDelegate)managerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_managerDelegate);
  return (HMDAccessoryBrowserManagerDelegate *)WeakRetained;
}

- (void)setBtlePowerState:(BOOL)a3
{
  self->_btlePowerState = a3;
}

- (BOOL)btlePowerState
{
  return self->_btlePowerState;
}

- (HMMTRAccessoryServerBrowser)chipAccessoryServerBrowser
{
  return (HMMTRAccessoryServerBrowser *)objc_getProperty(self, a2, 88, 1);
}

- (id)dumpRegisteredPairedAccessories
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v3 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v4 = [(HMDAccessoryBrowser *)self pairedAccessories];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v10 = [v9 identifier];
        [v9 transports];
        v11 = HMAccessoryTransportTypesToString();
        v12 = [v9 delegate];
        [v3 appendFormat:@"Accessory identifier: %@, Transports: %@, Delegate: %@\n", v10, v11, v12];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)dumpUnassociatedAccessories
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:2];
  v4 = (void *)MEMORY[0x263EFF980];
  uint64_t v5 = [(HMDAccessoryBrowser *)self unassociatedAccessories];
  uint64_t v6 = objc_msgSend(v4, "arrayWithCapacity:", objc_msgSend(v5, "count"));

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v7 = [(HMDAccessoryBrowser *)self unassociatedAccessories];
  v8 = (void *)[v7 copy];

  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = [*(id *)(*((void *)&v17 + 1) + 8 * i) dumpDescription];
        if (v13) {
          [v6 addObject:v13];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }

  if ([v6 count]) {
    [v3 setObject:v6 forKey:@"kDumpStateUnassociatedAccyDescriptionKey"];
  }
  long long v14 = [(HMDAccessoryBrowser *)self mediaBrowser];
  long long v15 = [v14 dumpDescription];

  if ([v15 count]) {
    [v3 setObject:v15 forKey:@"Media Advertisements"];
  }

  return v3;
}

- (void)accessoryServerBrowser:(id)a3 didRemoveAccessoryServer:(id)a4 error:(id)a5 matterPairingEndContext:(id)a6
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v13)
  {
    long long v14 = +[HMDMatterAccessoryPairingEndContext contextFromMTRContext:v13];
  }
  else
  {
    long long v14 = 0;
  }
  long long v15 = (void *)MEMORY[0x230FBD990]();
  long long v16 = self;
  long long v17 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    long long v18 = HMFGetLogIdentifier();
    int v19 = 138544130;
    long long v20 = v18;
    __int16 v21 = 2112;
    id v22 = v12;
    __int16 v23 = 2112;
    id v24 = v13;
    __int16 v25 = 2112;
    v26 = v14;
    _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_INFO, "%{public}@Handling matter didRemoveAccessoryServer with error %@ mtrContext %@ -> hmdContext %@", (uint8_t *)&v19, 0x2Au);
  }
  [(HMDAccessoryBrowser *)v16 _accessoryServerBrowser:v10 didRemoveAccessoryServer:v11 error:v12 matterPairingEndContext:v14];
}

- (void)notifyMatterAccessoryPairingStep:(unint64_t)a3
{
  if (a3 - 1 < 0x16) {
    unint64_t v3 = a3 + 1;
  }
  else {
    unint64_t v3 = 0;
  }
  notifyMatterMetricPairingStep(self, v3);
}

- (void)notifyMTRMetrics:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v4 = (void *)MEMORY[0x263F08A00];
  id v5 = a3;
  uint64_t v6 = self;
  id v14 = [v4 defaultCenter];
  uint64_t v7 = v6;
  id v8 = v5;
  uint64_t v9 = (void *)MEMORY[0x230FBD990]();
  id v10 = v7;
  id v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    id v12 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    *(void *)&buf[4] = v12;
    _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Notifying mtr metrics", buf, 0xCu);
  }
  long long v15 = @"HMDMatterAccessoryPairingMTRMetricsKey";
  *(void *)buf = v8;
  id v13 = [NSDictionary dictionaryWithObjects:buf forKeys:&v15 count:1];
  [v14 postNotificationName:@"HMDMatterAccessoryUpdatePairingMetricNotification" object:0 userInfo:v13];
}

- (void)accessoryServer:(id)a3 didStopPairingWithError:(id)a4 matterPairingEndContext:(id)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    id v11 = +[HMDMatterAccessoryPairingEndContext contextFromMTRContext:v10];
  }
  else
  {
    id v11 = 0;
  }
  id v12 = (void *)MEMORY[0x230FBD990]();
  id v13 = self;
  id v14 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    long long v15 = HMFGetLogIdentifier();
    int v16 = 138544130;
    uint64_t v17 = v15;
    __int16 v18 = 2112;
    id v19 = v9;
    __int16 v20 = 2112;
    id v21 = v10;
    __int16 v22 = 2112;
    __int16 v23 = v11;
    _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@Handling matter didStopPairing with error %@ mtrContext %@ -> hmdContext %@", (uint8_t *)&v16, 0x2Au);
  }
  [(HMDAccessoryBrowser *)v13 _accessoryServer:v8 didStopPairingWithError:v9 matterPairingEndContext:v11];
}

- (void)vendorModel:(id *)a3 vendorManufacturer:(id *)a4 accessoryInfo:(id)a5
{
  id v7 = a5;
  if (!((unint64_t)a3 | (unint64_t)a4)) {
    goto LABEL_11;
  }
  id v18 = v7;
  uint64_t v8 = [v7 modelName];
  if (v8)
  {
    id v9 = (void *)v8;
    id v10 = [v18 manufacturer];

    if (v10)
    {
      id v11 = +[HMDVendorDataManager sharedVendorDataManager];
      id v12 = [v18 manufacturer];
      id v13 = [v18 modelName];
      id v14 = [v11 vendorModelEntryForManufacturer:v12 model:v13];

      long long v15 = [v14 model];
      id v10 = [v14 manufacturer];

      if (v15)
      {
        if (v10) {
          goto LABEL_6;
        }
LABEL_16:
        uint64_t v17 = [v18 manufacturer];
        id v10 = anonymizeUnknownVendorString(v17);

        if (!a3) {
          goto LABEL_8;
        }
        goto LABEL_7;
      }
    }
  }
  else
  {
    id v10 = 0;
  }
  int v16 = [v18 modelName];
  long long v15 = anonymizeUnknownVendorString(v16);

  if (!v10) {
    goto LABEL_16;
  }
LABEL_6:
  if (a3) {
LABEL_7:
  }
    *a3 = v15;
LABEL_8:
  if (a4) {
    *a4 = v10;
  }

  id v7 = v18;
LABEL_11:
}

- (void)handlePPIDInfoResponse:(id)a3 context:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(HMDAccessoryBrowser *)self workQueue];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __60__HMDAccessoryBrowser_handlePPIDInfoResponse_context_error___block_invoke;
  v15[3] = &unk_264A2E610;
  id v16 = v9;
  uint64_t v17 = self;
  id v18 = v8;
  id v19 = v10;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  dispatch_async(v11, v15);
}

void __60__HMDAccessoryBrowser_handlePPIDInfoResponse_context_error___block_invoke(id *a1)
{
  id v2 = a1[4];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unint64_t v3 = v2;
  }
  else {
    unint64_t v3 = 0;
  }
  id v4 = v3;

  id v19 = 0;
  id v20 = 0;
  [a1[5] vendorModel:&v20 vendorManufacturer:&v19 accessoryInfo:a1[6]];
  id v5 = v20;
  id v6 = v19;
  v13[0] = (id)MEMORY[0x263EF8330];
  v13[1] = (id)3221225472;
  v13[2] = __60__HMDAccessoryBrowser_handlePPIDInfoResponse_context_error___block_invoke_2;
  v13[3] = &unk_264A2E908;
  id v7 = v4;
  id v14 = v7;
  id v8 = v5;
  id v15 = v8;
  id v9 = v6;
  id v16 = v9;
  id v17 = a1[6];
  id v18 = a1[7];
  __60__HMDAccessoryBrowser_handlePPIDInfoResponse_context_error___block_invoke_2(v13);
  id v10 = [a1[6] name];

  if (v10)
  {
    id v11 = a1[5];
    id v12 = [a1[6] name];
    [v11 accessoryServer:v7 didUpdateName:v12];
  }
  [a1[5] accessoryServer:v7 requestUserPermission:2 accessoryInfo:a1[6] error:a1[7]];
}

void __60__HMDAccessoryBrowser_handlePPIDInfoResponse_context_error___block_invoke_2(id *a1)
{
  id v2 = [a1[4] pairingActivity];

  if (v2)
  {
    id v5 = [a1[4] pairingActivity];
    [a1[4] category];

    [a1[7] isCertified];
    id v3 = (id)HMFBooleanToString();
    [a1[7] isDenylisted];
    id v4 = (id)HMFBooleanToString();
    [a1[8] domain];

    [a1[8] code];
  }
}

- (void)handleActivationResponse:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDAccessoryBrowser *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__HMDAccessoryBrowser_handleActivationResponse_context___block_invoke;
  block[3] = &unk_264A2F2F8;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

void __56__HMDAccessoryBrowser_handleActivationResponse_context___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    int v14 = 138543874;
    id v15 = v5;
    __int16 v16 = 2112;
    uint64_t v17 = v6;
    __int16 v18 = 2112;
    uint64_t v19 = v7;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Got Token activation response for server: %@, T1: %@", (uint8_t *)&v14, 0x20u);
  }
  id v8 = *(id *)(a1 + 40);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }
  id v10 = v9;

  if ([v10 isPreSoftAuthWacStarted])
  {
    [v10 setToken:*(void *)(a1 + 48)];
    [v10 pairSetupStartSoftAuthWAC];
  }
  else
  {
    id v11 = *(id *)(a1 + 40);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v12 = v11;
    }
    else {
      id v12 = 0;
    }
    id v13 = v12;

    [v13 provisionToken:*(void *)(a1 + 48)];
  }
}

- (void)didFinishActivation:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDAccessoryBrowser *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__HMDAccessoryBrowser_didFinishActivation_context___block_invoke;
  block[3] = &unk_264A2F2F8;
  id v12 = v7;
  id v13 = v6;
  int v14 = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

void __51__HMDAccessoryBrowser_didFinishActivation_context___block_invoke(id *a1)
{
  id v2 = a1[4];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  uint64_t v6 = MEMORY[0x263EF8330];
  uint64_t v7 = 3221225472;
  id v8 = __51__HMDAccessoryBrowser_didFinishActivation_context___block_invoke_2;
  id v9 = &unk_264A2F820;
  id v10 = v4;
  id v11 = a1[5];
  id v5 = v4;
  __51__HMDAccessoryBrowser_didFinishActivation_context___block_invoke_2((uint64_t)&v6);
  objc_msgSend(a1[6], "accessoryServer:didFinishAuth:", v5, a1[5], v6, v7, v8, v9);
}

void __51__HMDAccessoryBrowser_didFinishActivation_context___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) pairingActivity];

  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) pairingActivity];
    [*(id *)(a1 + 40) domain];

    [*(id *)(a1 + 40) code];
  }
}

- (void)browser:(id)a3 didLoseAssociatedMediaAccessory:(id)a4 error:(id)a5
{
  id v6 = a4;
  uint64_t v7 = [(HMDAccessoryBrowser *)self pairedAccessoryInformationWithIdentifier:v6];
  id v8 = [v7 delegate];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }
  id v10 = v9;

  id v11 = [v10 accessories];

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __69__HMDAccessoryBrowser_browser_didLoseAssociatedMediaAccessory_error___block_invoke;
  v14[3] = &unk_264A27218;
  id v15 = v6;
  id v12 = v6;
  id v13 = objc_msgSend(v11, "na_firstObjectPassingTest:", v14);

  [v13 setReachable:0];
}

uint64_t __69__HMDAccessoryBrowser_browser_didLoseAssociatedMediaAccessory_error___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 identifier];
  uint64_t v4 = [v2 isEqualToString:v3];

  return v4;
}

- (void)browser:(id)a3 didFindAssociatedMediaAccessory:(id)a4
{
  id v5 = a4;
  id v6 = [(HMDAccessoryBrowser *)self pairedAccessoryInformationWithIdentifier:v5];
  uint64_t v7 = [v6 delegate];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;

  id v10 = [v9 accessories];

  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __63__HMDAccessoryBrowser_browser_didFindAssociatedMediaAccessory___block_invoke;
  v13[3] = &unk_264A27218;
  id v14 = v5;
  id v11 = v5;
  id v12 = objc_msgSend(v10, "na_firstObjectPassingTest:", v13);

  [v12 setReachable:1];
}

uint64_t __63__HMDAccessoryBrowser_browser_didFindAssociatedMediaAccessory___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 identifier];
  uint64_t v4 = [v2 isEqualToString:v3];

  return v4;
}

- (void)browser:(id)a3 didUpdateEndpoints:(id)a4
{
  id v5 = a4;
  id v6 = [(HMDAccessoryBrowser *)self workQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __50__HMDAccessoryBrowser_browser_didUpdateEndpoints___block_invoke;
  v8[3] = &unk_264A2F820;
  id v9 = v5;
  id v10 = self;
  id v7 = v5;
  dispatch_async(v6, v8);
}

void __50__HMDAccessoryBrowser_browser_didUpdateEndpoints___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v14 = [obj countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v14)
  {
    uint64_t v13 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(obj);
        }
        id v3 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v4 = [v3 advertisements];
        long long v15 = 0u;
        long long v16 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        id v5 = v4;
        id v6 = (void *)[v5 countByEnumeratingWithState:&v15 objects:v23 count:16];
        if (v6)
        {
          uint64_t v7 = *(void *)v16;
          while (2)
          {
            for (j = 0; j != v6; j = (char *)j + 1)
            {
              if (*(void *)v16 != v7) {
                objc_enumerationMutation(v5);
              }
              id v9 = [*(id *)(*((void *)&v15 + 1) + 8 * (void)j) identifier];
              id v10 = [*(id *)(a1 + 40) pairedAccessoryInformationWithIdentifier:v9];
              id v11 = [v10 delegate];

              if (v11)
              {
                id v6 = [v10 delegate];

                goto LABEL_16;
              }
            }
            id v6 = (void *)[v5 countByEnumeratingWithState:&v15 objects:v23 count:16];
            if (v6) {
              continue;
            }
            break;
          }
        }
LABEL_16:

        if (objc_opt_respondsToSelector()) {
          [v6 accessoryBrowser:*(void *)(a1 + 40) didUpdateEndpoint:v3];
        }
      }
      uint64_t v14 = [obj countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v14);
  }
}

- (void)browser:(id)a3 didRemoveSessions:(id)a4
{
  id v5 = a4;
  id v6 = [(HMDAccessoryBrowser *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__HMDAccessoryBrowser_browser_didRemoveSessions___block_invoke;
  block[3] = &unk_264A2F7F8;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, block);
}

void __49__HMDAccessoryBrowser_browser_didRemoveSessions___block_invoke(uint64_t a1)
{
  v6[1] = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) count])
  {
    id v2 = [MEMORY[0x263F08A00] defaultCenter];
    uint64_t v3 = *(void *)(a1 + 32);
    id v5 = @"kRemovedMediaSessionIdentifiersKey";
    v6[0] = v3;
    uint64_t v4 = [NSDictionary dictionaryWithObjects:v6 forKeys:&v5 count:1];
    [v2 postNotificationName:@"HMDMediaSessionsRemovedNotification" object:0 userInfo:v4];
  }
}

- (void)browser:(id)a3 didRemoveAdvertisements:(id)a4
{
  id v5 = a4;
  id v6 = [(HMDAccessoryBrowser *)self workQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __55__HMDAccessoryBrowser_browser_didRemoveAdvertisements___block_invoke;
  v8[3] = &unk_264A2F820;
  void v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

uint64_t __55__HMDAccessoryBrowser_browser_didRemoveAdvertisements___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleRemovedAccessoryAdvertisements:*(void *)(a1 + 40)];
}

- (void)browser:(id)a3 didAddAdvertisements:(id)a4
{
  id v5 = a4;
  id v6 = [(HMDAccessoryBrowser *)self workQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __52__HMDAccessoryBrowser_browser_didAddAdvertisements___block_invoke;
  v8[3] = &unk_264A2F820;
  void v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

uint64_t __52__HMDAccessoryBrowser_browser_didAddAdvertisements___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleAddedAccessoryAdvertisements:*(void *)(a1 + 40)];
}

- (void)accessoryServer:(id)a3 didUpdateConnectionState:(BOOL)a4 linkLayerType:(int64_t)a5 bookkeeping:(id)a6 withError:(id)a7
{
  BOOL v10 = a4;
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  long long v15 = (void *)MEMORY[0x230FBD990]();
  long long v16 = self;
  long long v17 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    id v18 = (id)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      long long v19 = @"Connected";
    }
    else
    {
      long long v19 = [NSString stringWithFormat:@"Disconnected with error: %@", v14];
    }
    *(_DWORD *)buf = 138543874;
    id v24 = v18;
    __int16 v25 = 2112;
    id v26 = v12;
    __int16 v27 = 2114;
    v28 = v19;
    _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_INFO, "%{public}@Accessory server: %@, updated connection state to %{public}@", buf, 0x20u);
    if (!v10) {
  }
    }
  long long v20 = [v12 identifier];
  long long v21 = [(HMDAccessoryBrowser *)v16 pairedAccessoryInformationWithIdentifier:v20];

  long long v22 = [v21 delegate];
  [v22 accessoryBrowser:v16 accessoryServer:v12 didUpdateConnectionState:v10 linkLayerType:a5 bookkeeping:v13 withError:v14];
}

- (void)accessoryServer:(id)a3 didUpdateConnectionState:(BOOL)a4 sessionInfo:(id)a5 linkLayerType:(int64_t)a6 withError:(id)a7
{
  BOOL v10 = a4;
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a5;
  id v14 = a7;
  long long v15 = (void *)MEMORY[0x230FBD990]();
  long long v16 = self;
  long long v17 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    id v18 = (id)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      long long v19 = @"Connected";
    }
    else
    {
      long long v19 = [NSString stringWithFormat:@"Disconnected with error: %@", v14];
    }
    *(_DWORD *)buf = 138543874;
    id v24 = v18;
    __int16 v25 = 2112;
    id v26 = v12;
    __int16 v27 = 2114;
    v28 = v19;
    _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_INFO, "%{public}@Accessory server: %@, updated connection state to %{public}@", buf, 0x20u);
    if (!v10) {
  }
    }
  long long v20 = [v12 identifier];
  long long v21 = [(HMDAccessoryBrowser *)v16 pairedAccessoryInformationWithIdentifier:v20];

  long long v22 = [v21 delegate];
  [v22 accessoryBrowser:v16 accessoryServer:v12 didUpdateConnectionState:v10 sessionInfo:v13 linkLayerType:a6 withError:v14];
}

- (void)accessoryServer:(id)a3 didUpdateConnectionState:(BOOL)a4 linkLayerType:(int64_t)a5 withError:(id)a6
{
}

- (void)accessoryServer:(id)a3 confirmUUID:(id)a4 token:(id)a5
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(HMDAccessoryBrowser *)self workQueue];
  dispatch_assert_queue_V2(v11);

  id v12 = [(HMDAccessoryBrowser *)self unpairedAccessoryForServer:v8];
  if (!v12)
  {
    id v13 = (void *)MEMORY[0x230FBD990]();
    id v14 = self;
    long long v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      long long v16 = HMFGetLogIdentifier();
      int v25 = 138543618;
      id v26 = v16;
      __int16 v27 = 2112;
      id v28 = v8;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_ERROR, "%{public}@While confirming UUID, cannot find unpaired accessory for server %@", (uint8_t *)&v25, 0x16u);
    }
  }
  long long v17 = [(HMDAccessoryBrowser *)self _pairingInformationForUnpairedAccessory:v12];
  id v18 = v17;
  if (v17
    && ([v17 setupAuthToken], long long v19 = objc_claimAutoreleasedReturnValue(), v19, v19))
  {
    long long v20 = (void *)MEMORY[0x230FBD990]([(HMDAccessoryBrowser *)self accessoryServer:v8 updatePairingProgress:5]);
    long long v21 = self;
    long long v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      __int16 v23 = HMFGetLogIdentifier();
      int v25 = 138543362;
      id v26 = v23;
      _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_DEBUG, "%{public}@Wrap up internal setup token authentication", (uint8_t *)&v25, 0xCu);
    }
    [(HMDAccessoryBrowser *)v21 didFinishActivation:0 context:v8];
  }
  else
  {
    id v24 = [(HMDAccessoryBrowser *)self authServer];
    [v24 sendActivationConfirmation:v10 uuid:v9 context:v8];
  }
}

- (void)accessoryServer:(id)a3 authenticateUUID:(id)a4 token:(id)a5
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(HMDAccessoryBrowser *)self workQueue];
  dispatch_assert_queue_V2(v11);

  id v12 = [(HMDAccessoryBrowser *)self unpairedAccessoryForServer:v8];
  if (!v12)
  {
    id v13 = (void *)MEMORY[0x230FBD990]();
    id v14 = self;
    long long v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      long long v16 = HMFGetLogIdentifier();
      int v25 = 138543618;
      id v26 = v16;
      __int16 v27 = 2112;
      id v28 = v8;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_ERROR, "%{public}@While authenticating UUID, cannot find unpaired accessory for server %@", (uint8_t *)&v25, 0x16u);
    }
  }
  long long v17 = [(HMDAccessoryBrowser *)self _pairingInformationForUnpairedAccessory:v12];
  id v18 = v17;
  if (v17
    && ([v17 setupAuthToken], long long v19 = objc_claimAutoreleasedReturnValue(), v19, v19))
  {
    long long v20 = (void *)MEMORY[0x230FBD990]([(HMDAccessoryBrowser *)self accessoryServer:v8 updatePairingProgress:5]);
    long long v21 = self;
    long long v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      __int16 v23 = HMFGetLogIdentifier();
      int v25 = 138543362;
      id v26 = v23;
      _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_DEBUG, "%{public}@Emulating auth token activation following internal setup token authentication", (uint8_t *)&v25, 0xCu);
    }
    id v24 = objc_alloc_init(MEMORY[0x263EFF990]);
    LOWORD(v26) = 8270;
    int v25 = 1881788898;
    [v24 appendBytes:&v25 length:6];
    [(HMDAccessoryBrowser *)v21 handleActivationResponse:v24 context:v8];
  }
  else
  {
    id v24 = [(HMDAccessoryBrowser *)self authServer];
    [v24 sendActivationRequest:v10 uuid:v9 context:v8];
  }
}

- (void)accessoryServer:(id)a3 validateCert:(id)a4 model:(id)a5
{
  id v8 = (void *)MEMORY[0x263EFF960];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v13 = [v8 currentLocale];
  id v12 = [(HMDAccessoryBrowser *)self authServer];
  [v12 getPPIDInfo:v13 model:v9 cert:v10 context:v11];
}

- (void)accessoryServer:(id)a3 validateUUID:(id)a4 token:(id)a5 model:(id)a6
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v46 = a4;
  id v11 = a5;
  id v45 = a6;
  id v12 = [(HMDAccessoryBrowser *)self workQueue];
  dispatch_assert_queue_V2(v12);

  id v13 = [MEMORY[0x263EFF960] currentLocale];
  if ([v10 compatibilityFeatures]) {
    uint64_t v14 = 2;
  }
  else {
    uint64_t v14 = 1;
  }
  [(HMDAccessoryBrowser *)self accessoryServer:v10 updatePairingProgress:5];
  long long v15 = [(HMDAccessoryBrowser *)self unpairedAccessoryForServer:v10];
  if (!v15)
  {
    long long v16 = (void *)MEMORY[0x230FBD990]();
    long long v17 = self;
    id v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      long long v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v48 = v19;
      __int16 v49 = 2112;
      id v50 = v10;
      _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_ERROR, "%{public}@While validating UUID, cannot find unpaired accessory for server %@", buf, 0x16u);
    }
  }
  long long v20 = [(HMDAccessoryBrowser *)self _pairingInformationForUnpairedAccessory:v15];
  long long v21 = v20;
  if (!v20
    || ([v20 setupAuthToken], long long v22 = objc_claimAutoreleasedReturnValue(), v22, !v22))
  {
    v34 = [(HMDAccessoryBrowser *)self authServer];
    v33 = v45;
    v35 = v46;
    [v34 sendPPIDInfoRequest:v13 model:v45 token:v11 authFeatures:v14 uuid:v46 context:v10];
    goto LABEL_20;
  }
  __int16 v23 = (void *)MEMORY[0x230FBD990]();
  id v24 = self;
  int v25 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
  {
    id v26 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v48 = v26;
    _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_DEBUG, "%{public}@Authentication using internal setup auth token", buf, 0xCu);
  }
  __int16 v27 = [v21 setupAuthToken];
  if ([v11 isEqualToData:v27])
  {
    id v28 = [v21 setupAuthTokenUUID];
    int v29 = objc_msgSend(v46, "hmf_isEqualToUUID:", v28);

    if (v29)
    {
      id v42 = objc_alloc(MEMORY[0x263F35868]);
      v41 = [v10 name];
      v44 = [v10 primaryAccessory];
      v40 = [v44 manufacturer];
      [v10 category];
      v30 = v43 = v13;
      v31 = [MEMORY[0x263F08C38] UUID];
      v32 = [v31 UUIDString];
      v33 = v45;
      v34 = (void *)[v42 initWithName:v41 manufacturer:v40 modelName:v45 category:v30 certificationStatus:@"CERTIFIED" denylisted:@"NO" ppid:v32];

      id v13 = v43;
      [(HMDAccessoryBrowser *)v24 handlePPIDInfoResponse:v34 context:v10 error:0];
      v35 = v46;
      goto LABEL_20;
    }
  }
  else
  {
  }
  v36 = (void *)MEMORY[0x230FBD990]();
  v37 = v24;
  v38 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
  {
    v39 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v48 = v39;
    _os_log_impl(&dword_22F52A000, v38, OS_LOG_TYPE_ERROR, "%{public}@Internal token auth failed", buf, 0xCu);
  }
  v34 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F0C710] code:-1 userInfo:0];
  [(HMDAccessoryBrowser *)v37 didFinishActivation:v34 context:v10];
  v33 = v45;
  v35 = v46;
LABEL_20:
}

- (void)accessoryServerNeedsOwnershipToken:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDAccessoryBrowser *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(HMDAccessoryBrowser *)self unpairedAccessoryForServer:v4];
  if (v6)
  {
    id v7 = [(HMDAccessoryBrowser *)self _pairingInformationForUnpairedAccessory:v6];
    id v8 = [v7 addAccessoryProgressHandler];
    if (v8) {
      goto LABEL_4;
    }
    id v9 = [v6 uuid];
    id v10 = [(HMDAccessoryBrowser *)self _progressHandlerForUnpairedAccessory:v9];
    id v8 = [v10 progressHandler];

    if (v8)
    {
LABEL_4:
      id v11 = [HMDAddAccessoryProgressState alloc];
      id v12 = [v6 uuid];
      id v13 = [v6 name];
      uint64_t v14 = [v6 category];
      long long v15 = [v4 productData];
      long long v16 = [(HMDAddAccessoryProgressState *)v11 initWithUUID:v12 accessoryName:v13 manufacturerName:0 category:v14 certificationStatus:0 productData:v15];

      ((void (**)(void, uint64_t, HMDAddAccessoryProgressState *))v8)[2](v8, 8, v16);
    }
  }
  else
  {
    long long v17 = (void *)MEMORY[0x230FBD990]();
    id v18 = self;
    long long v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      long long v20 = HMFGetLogIdentifier();
      int v21 = 138543618;
      long long v22 = v20;
      __int16 v23 = 2112;
      id v24 = v4;
      _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_ERROR, "%{public}@No unpaired accessory for server %@", (uint8_t *)&v21, 0x16u);
    }
  }
}

- (void)accessoryServer:(id)a3 didFinishAuth:(id)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDAccessoryBrowser *)self workQueue];
  dispatch_assert_queue_V2(v8);

  uint64_t v9 = [v6 tearDownSessionOnAuthCompletion];
  if (v7)
  {
    id v10 = (void *)MEMORY[0x230FBD990](v9);
    id v11 = self;
    id v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = HMFGetLogIdentifier();
      int v30 = 138543618;
      v31 = v13;
      __int16 v32 = 2112;
      id v33 = v7;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, "%{public}@Auth Finished with error: %@", (uint8_t *)&v30, 0x16u);
    }
    if ([v7 isHAPError])
    {
      unint64_t v14 = [v7 code];
      if (v14 > 0x20) {
        uint64_t v15 = 52;
      }
      else {
        uint64_t v15 = qword_2303E47F0[v14];
      }
    }
    else if ([v7 isHMError])
    {
      uint64_t v15 = [v7 code];
    }
    else
    {
      uint64_t v15 = 55;
    }
    id v18 = [MEMORY[0x263F087E8] hmErrorWithCode:v15 description:@"Authentication failed" reason:0 suggestion:0 underlyingError:v7];
    [(HMDAccessoryBrowser *)v11 continueAddingAccessoryToHomeAfterUserConfirmation:v6 withError:v18];
  }
  else
  {
    id v16 = v6;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      long long v17 = v16;
    }
    else {
      long long v17 = 0;
    }
    id v18 = v17;

    int v19 = [v18 isPostSoftAuthWacStarted];
    long long v20 = (void *)MEMORY[0x230FBD990]();
    int v21 = self;
    long long v22 = HMFGetOSLogHandle();
    BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG);
    if (v19)
    {
      if (v23)
      {
        id v24 = HMFGetLogIdentifier();
        int v30 = 138543362;
        v31 = v24;
        _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_DEBUG, "%{public}@Auth finished with success", (uint8_t *)&v30, 0xCu);
      }
      [v18 resetPostSoftAuthWAC];
    }
    else
    {
      if (v23)
      {
        uint64_t v25 = HMFGetLogIdentifier();
        int v30 = 138543362;
        v31 = v25;
        _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_DEBUG, "%{public}@Auth finished with success .. Do regular pair-setup", (uint8_t *)&v30, 0xCu);
      }
      id v26 = [(HMDAccessoryBrowser *)v21 unpairedAccessoryForServer:v16];
      __int16 v27 = [(HMDAccessoryBrowser *)v21 _pairingInformationForUnpairedAccessory:v26];
      id v28 = [v27 pairingRequest];
      int v29 = (void *)[v28 copy];

      [v29 setRequiresUserConsent:0];
      [v16 startPairingWithRequest:v29];
    }
  }
}

- (void)accessoryServer:(id)a3 didUpdateName:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDAccessoryBrowser *)self unpairedAccessoryForServer:v6];
  uint64_t v9 = (void *)MEMORY[0x230FBD990]();
  id v10 = self;
  id v11 = HMFGetOSLogHandle();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
  if (v8)
  {
    if (v12)
    {
      id v13 = HMFGetLogIdentifier();
      int v15 = 138543874;
      id v16 = v13;
      __int16 v17 = 2112;
      id v18 = v6;
      __int16 v19 = 2112;
      id v20 = v7;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Accessory: %@, Updated Name to %@", (uint8_t *)&v15, 0x20u);
    }
    [v8 setName:v7];
  }
  else
  {
    if (v12)
    {
      unint64_t v14 = HMFGetLogIdentifier();
      int v15 = 138543874;
      id v16 = v14;
      __int16 v17 = 2112;
      id v18 = v6;
      __int16 v19 = 2112;
      id v20 = v7;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Accessory: %@, is paired - dropping provided name update to %@", (uint8_t *)&v15, 0x20u);
    }
  }
}

- (void)accessoryServer:(id)a3 didUpdateCategory:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = [(HMDAccessoryBrowser *)self unpairedAccessoryForServer:v9];
  id v8 = v7;
  if (v7) {
    [v7 updateCategoryWithCategoryIdentifier:v6];
  }
  else {
    [(HMDAccessoryBrowser *)self _notifyDelegateOfAccessoryServer:v9 didUpdateCategory:v6];
  }
}

- (void)_notifyDelegateOfAccessoryServer:(id)a3 didUpdateCategory:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 identifier];
  id v9 = [(HMDAccessoryBrowser *)self pairedAccessoryInformationWithIdentifier:v8];

  id v10 = [v9 delegate];
  if (objc_opt_respondsToSelector())
  {
    id v11 = (void *)MEMORY[0x230FBD990]();
    BOOL v12 = self;
    id v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      unint64_t v14 = HMFGetLogIdentifier();
      int v15 = 138544130;
      id v16 = v14;
      __int16 v17 = 2112;
      id v18 = v10;
      __int16 v19 = 2112;
      id v20 = v6;
      __int16 v21 = 2112;
      id v22 = v7;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Notifying '%@' that an accessory server %@ updated category to %@", (uint8_t *)&v15, 0x2Au);
    }
    [v10 accessoryBrowser:v12 accessoryServer:v6 didUpdateCategory:v7];
  }
}

- (void)accessoryServerDidUpdateStateNumber:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    int v9 = 138543618;
    id v10 = v8;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Accessory: %@, Updated State", (uint8_t *)&v9, 0x16u);
  }
}

- (void)accessoryServer:(id)a3 didUpdateHasPairings:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [(HMDAccessoryBrowser *)self workQueue];
  dispatch_assert_queue_V2(v7);

  id v8 = (void *)MEMORY[0x230FBD990]();
  int v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    __int16 v11 = HMFGetLogIdentifier();
    id v12 = [v6 identifier];
    int v20 = 138543874;
    __int16 v21 = v11;
    __int16 v22 = 2112;
    uint64_t v23 = v12;
    __int16 v24 = 1024;
    BOOL v25 = v4;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Updating accessory server %@ with new value of hasPairings: %d", (uint8_t *)&v20, 0x1Cu);
  }
  if ([v6 isPaired])
  {
    [(HMDAccessoryBrowser *)v9 _notifyDelegateOfAccessoryServer:v6 didUpdateHasPairings:v4];
  }
  else
  {
    uint64_t v13 = [(HMDAccessoryBrowser *)v9 unpairedAccessoryForServer:v6];
    unint64_t v14 = [(HMDAccessoryBrowser *)v9 _pairingInformationForUnpairedAccessory:v13];
    if (v14)
    {
      int v15 = (void *)MEMORY[0x230FBD990]();
      id v16 = v9;
      __int16 v17 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        id v18 = HMFGetLogIdentifier();
        __int16 v19 = [v6 identifier];
        int v20 = 138543618;
        __int16 v21 = v18;
        __int16 v22 = 2112;
        uint64_t v23 = v19;
        _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_INFO, "%{public}@Ignoring pairing update for accessory server %@", (uint8_t *)&v20, 0x16u);
      }
    }
    else if (v4)
    {
      if (v13) {
        [(HMDAccessoryBrowser *)v9 removeUnpairedHAPAccessory:v13];
      }
    }
    else if (!v13)
    {
      [(HMDAccessoryBrowser *)v9 _addUnpairedAccessoryForServer:v6];
    }
  }
}

- (void)_notifyDelegateOfAccessoryServer:(id)a3 didUpdateHasPairings:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [v6 identifier];
  id v8 = [(HMDAccessoryBrowser *)self pairedAccessoryInformationWithIdentifier:v7];

  int v9 = [v8 delegate];
  if (objc_opt_respondsToSelector())
  {
    id v10 = (void *)MEMORY[0x230FBD990]();
    __int16 v11 = self;
    id v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      uint64_t v13 = HMFGetLogIdentifier();
      unint64_t v14 = HMFBooleanToString();
      int v15 = 138544130;
      id v16 = v13;
      __int16 v17 = 2112;
      id v18 = v9;
      __int16 v19 = 2112;
      id v20 = v6;
      __int16 v21 = 2112;
      __int16 v22 = v14;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Notifying '%@' that an accessory server %@ updated hasPairings to %@", (uint8_t *)&v15, 0x2Au);
    }
    [v9 accessoryBrowser:v11 accessoryServer:v6 didUpdateHasPairings:v4];
  }
}

- (void)accessoryServer:(id)a3 didUpdateWakeNumber:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = [v9 primaryAccessory];
  if (v7)
  {
    id v8 = [(HMDAccessoryBrowser *)self pairedHMDHAPAccessoryWithAccessoryServer:v9];
    [v8 updateSuspendedStateWithWakeNumber:v6 hapAccessory:v7];
  }
}

- (void)accessoryServer:(id)a3 didDisconnectWithError:(id)a4
{
  id v7 = a3;
  id v5 = [v7 primaryAccessory];
  if (v5)
  {
    id v6 = [(HMDAccessoryBrowser *)self pairedHMDHAPAccessoryWithAccessoryServer:v7];
    [v6 updateSuspendedStateWithConnectionState:0 hapAccessory:v5];
  }
}

- (void)accessoryServer:(id)a3 didUpdateValuesForCharacteristics:(id)a4 stateNumber:(id)a5 broadcast:(BOOL)a6
{
  BOOL v6 = a6;
  id v13 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = [(HMDAccessoryBrowser *)self unpairedAccessoryForServer:v13];
  if (!v12) {
    [(HMDAccessoryBrowser *)self _notifyDelegateOfAccessoryServer:v13 didUpdateValuesForCharacteristics:v10 stateNumber:v11 broadcast:v6];
  }
}

- (void)_notifyDelegateOfAccessoryServer:(id)a3 didUpdateValuesForCharacteristics:(id)a4 stateNumber:(id)a5 broadcast:(BOOL)a6
{
  uint64_t v6 = a6;
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = [v10 identifier];
  unint64_t v14 = [(HMDAccessoryBrowser *)self pairedAccessoryInformationWithIdentifier:v13];

  int v15 = [v14 delegate];
  if (objc_opt_respondsToSelector())
  {
    id v16 = (void *)MEMORY[0x230FBD990]();
    __int16 v17 = self;
    id v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      __int16 v19 = HMFGetLogIdentifier();
      [v10 deviceID];
      id v20 = v21 = v6;
      *(_DWORD *)buf = 138544130;
      uint64_t v23 = v19;
      __int16 v24 = 2112;
      BOOL v25 = v15;
      __int16 v26 = 2112;
      __int16 v27 = v20;
      __int16 v28 = 2112;
      id v29 = v12;
      _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_INFO, "%{public}@Notifying '%@' that an accessory server %@ updated values for characteristics at state number %@", buf, 0x2Au);

      uint64_t v6 = v21;
    }

    [v15 accessoryBrowser:v17 accessoryServer:v10 didUpdateValuesForCharacteristics:v11 stateNumber:v12 broadcast:v6];
  }
}

- (void)continueAddingAccessoryToHomeAfterUserConfirmation:(id)a3 withError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDAccessoryBrowser *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __84__HMDAccessoryBrowser_continueAddingAccessoryToHomeAfterUserConfirmation_withError___block_invoke;
  block[3] = &unk_264A2F2F8;
  id v12 = v7;
  id v13 = self;
  id v14 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

void __84__HMDAccessoryBrowser_continueAddingAccessoryToHomeAfterUserConfirmation_withError___block_invoke(id *a1)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  if (a1[4])
  {
    id v2 = (void *)MEMORY[0x230FBD990]();
    id v3 = a1[5];
    BOOL v4 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v5 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v27 = v5;
      _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_ERROR, "%{public}@Authentication failed for adding accessory to home", buf, 0xCu);
    }
    if ([a1[6] communicationProtocol] == 2)
    {
      id v6 = +[HMDMatterAccessoryPairingEndContext hmdContextWithStep:2 error:a1[4]];
    }
    else
    {
      id v6 = 0;
    }
    id v14 = a1[6];
    int v15 = [a1[5] workQueue];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __84__HMDAccessoryBrowser_continueAddingAccessoryToHomeAfterUserConfirmation_withError___block_invoke_578;
    v21[3] = &unk_264A28C88;
    id v16 = a1[6];
    v21[4] = a1[5];
    id v22 = v16;
    id v23 = a1[4];
    __int16 v24 = v6;
    [v14 removePairingForCurrentControllerOnQueue:v15 completion:v21];
  }
  else
  {
    id v6 = [a1[5] unpairedAccessoryForServer:a1[6]];
    [a1[5] _sendPairingCompletionStatusForServer:a1[6] error:0 matterPairingEndContext:0 completionHandler:0];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v7 = objc_msgSend(v6, "accessoryServers", 0);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v25 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          uint64_t v13 = [v12 linkType];
          if (v13 != [a1[6] linkType]) {
            [a1[5] _discoverAccessories:v12];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v25 count:16];
      }
      while (v9);
    }
  }
}

uint64_t __84__HMDAccessoryBrowser_continueAddingAccessoryToHomeAfterUserConfirmation_withError___block_invoke_578(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendPairingCompletionStatusForServer:*(void *)(a1 + 40) error:*(void *)(a1 + 48) matterPairingEndContext:*(void *)(a1 + 56) completionHandler:0];
}

- (void)accessoryServer:(id)a3 didDiscoverAccessories:(id)a4 transaction:(id)a5 error:(id)a6
{
  uint64_t v72 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(HMDAccessoryBrowser *)self workQueue];
  dispatch_assert_queue_V2(v14);

  if ([v10 linkType] == 2)
  {
    int v15 = (void *)MEMORY[0x230FBD990]();
    id v16 = self;
    long long v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      long long v18 = v54 = v12;
      [v10 identifier];
      long long v19 = v50 = v11;
      long long v20 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v10, "hasPairings"));
      unsigned int v21 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v10, "stateNumber"));
      *(_DWORD *)buf = 138544130;
      v65 = v18;
      __int16 v66 = 2112;
      id v67 = v19;
      __int16 v68 = 2112;
      id v69 = v20;
      __int16 v70 = 2112;
      v71 = v21;
      _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_INFO, "%{public}@Removing BLE Accessory: %@ that has pairings: %@ with state number: %@", buf, 0x2Au);

      id v11 = v50;
      id v12 = v54;
    }

    id v22 = [(HMDAccessoryBrowser *)v16 discoveringBLEAccessoryServerIdentifiers];
    id v23 = [v10 identifier];
    [v22 removeObject:v23];
  }
  __int16 v24 = [(HMDAccessoryBrowser *)self unpairedAccessoryForServer:v10];
  if (v24)
  {
    v60[0] = MEMORY[0x263EF8330];
    v60[1] = 3221225472;
    v60[2] = __80__HMDAccessoryBrowser_accessoryServer_didDiscoverAccessories_transaction_error___block_invoke;
    v60[3] = &unk_264A2F820;
    id v25 = v10;
    id v61 = v25;
    id v26 = v13;
    id v62 = v26;
    __80__HMDAccessoryBrowser_accessoryServer_didDiscoverAccessories_transaction_error___block_invoke((uint64_t)v60);
    id v55 = v12;
    if (v26)
    {
      id v27 = v26;
      uint64_t v28 = v27;
      if (([v27 isHMError] & 1) == 0)
      {
        id v29 = [v27 domain];
        if ([v29 isEqualToString:*MEMORY[0x263F355F0]])
        {
          uint64_t v30 = [v27 code];

          if (v30 == 7) {
            uint64_t v31 = 66;
          }
          else {
            uint64_t v31 = 57;
          }
        }
        else
        {

          uint64_t v31 = 57;
        }
        uint64_t v28 = [MEMORY[0x263F087E8] hmErrorWithCode:v31 description:@"Discovery failed." reason:0 suggestion:0 underlyingError:v27];
      }
      id v53 = v13;
      id v42 = v11;
      v43 = (void *)MEMORY[0x230FBD990]();
      v44 = self;
      id v45 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        id v46 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        v65 = v46;
        __int16 v66 = 2112;
        id v67 = v25;
        __int16 v68 = 2114;
        id v69 = v27;
        _os_log_impl(&dword_22F52A000, v45, OS_LOG_TYPE_ERROR, "%{public}@Failed HAP service discovery on accessory server %@ with error: %{public}@", buf, 0x20u);
      }
      v47 = [v25 identifier];
      [(HMDAccessoryBrowser *)v44 deregisterPairedAccessory:v47];

      if ([v24 supportsCHIP])
      {
        v48 = +[HMDMatterAccessoryPairingEndContext hmdContextWithStep:2 error:v27];
      }
      else
      {
        v48 = 0;
      }
      id v11 = v42;
      id v12 = v55;
      [(HMDAccessoryBrowser *)v44 _sendPairingCompletionStatusForServer:v25 error:v28 matterPairingEndContext:v48 completionHandler:0];
      __int16 v49 = [(HMDAccessoryBrowser *)v44 workQueue];
      [v25 removePairingForCurrentControllerOnQueue:v49 completion:0];

      id v13 = v53;
    }
    else
    {
      __int16 v32 = (void *)MEMORY[0x230FBD990]();
      id v33 = self;
      uint64_t v34 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        v35 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v65 = v35;
        __int16 v66 = 2112;
        id v67 = v25;
        _os_log_impl(&dword_22F52A000, v34, OS_LOG_TYPE_INFO, "%{public}@Completed accessory discovery on accessory server %@", buf, 0x16u);
      }
      [(HMDAccessoryBrowser *)v33 _sendPairingCompletionStatusForServer:v25 error:0 matterPairingEndContext:0 completionHandler:0];
      long long v58 = 0u;
      long long v59 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      uint64_t v28 = [v24 accessoryServers];
      uint64_t v36 = [v28 countByEnumeratingWithState:&v56 objects:v63 count:16];
      if (v36)
      {
        uint64_t v37 = v36;
        id v51 = v11;
        id v52 = v13;
        uint64_t v38 = *(void *)v57;
        do
        {
          for (uint64_t i = 0; i != v37; ++i)
          {
            if (*(void *)v57 != v38) {
              objc_enumerationMutation(v28);
            }
            v40 = *(void **)(*((void *)&v56 + 1) + 8 * i);
            uint64_t v41 = [v40 linkType];
            if (v41 != [v25 linkType]) {
              [(HMDAccessoryBrowser *)v33 _discoverAccessories:v40];
            }
          }
          uint64_t v37 = [v28 countByEnumeratingWithState:&v56 objects:v63 count:16];
        }
        while (v37);
        id v11 = v51;
        id v13 = v52;
      }
      id v12 = v55;
    }
  }
  else
  {
    [(HMDAccessoryBrowser *)self _notifyDelegateOfAccessoryServer:v10 didDiscoverAccessories:v11 transaction:v12 error:v13];
  }
}

void __80__HMDAccessoryBrowser_accessoryServer_didDiscoverAccessories_transaction_error___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) pairingActivity];

  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) pairingActivity];
    [*(id *)(a1 + 40) domain];

    [*(id *)(a1 + 40) code];
  }
}

- (void)updateProgressForMappedErrors:(id)a3 accessoryServer:(id)a4 progressHandler:(id)a5
{
  id v10 = a3;
  id v7 = a4;
  if ([v10 isHMError] && _os_feature_enabled_impl())
  {
    uint64_t v8 = [v10 code];
    switch(v8)
    {
      case 11:
        uint64_t v9 = 11;
        break;
      case 2015:
        uint64_t v9 = 9;
        break;
      case 2016:
        uint64_t v9 = 10;
        break;
      default:
        goto LABEL_10;
    }
    [(HMDAccessoryBrowser *)self accessoryServer:v7 updatePairingProgress:v9];
  }
LABEL_10:
}

- (void)updateAlreadyPairingProgressForAccessoryServerIdentifier:(id)a3 progressHandler:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t, void *))a4;
  uint64_t v8 = [(HMDAccessoryBrowser *)self pairedAccessoryInformationWithIdentifier:v6];
  uint64_t v9 = [v8 delegate];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v10 = v9;
  }
  else {
    id v10 = 0;
  }
  id v11 = v10;

  uint64_t v12 = [v11 hapAccessoryWithIdentifier:v6];
  id v13 = (void *)v12;
  if (v7 && v12 && _os_feature_enabled_impl())
  {
    __int16 v24 = [HMDAddAccessoryProgressState alloc];
    id v23 = [v13 uuid];
    id v14 = [v13 name];
    int v15 = [v13 manufacturer];
    id v16 = [v13 category];
    long long v17 = [v13 productData];
    long long v18 = [(HMDAddAccessoryProgressState *)v24 initWithUUID:v23 accessoryName:v14 manufacturerName:v15 category:v16 certificationStatus:0 productData:v17];

    long long v19 = (void *)MEMORY[0x230FBD990]();
    long long v20 = self;
    unsigned int v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      id v22 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v26 = v22;
      __int16 v27 = 2112;
      uint64_t v28 = v18;
      _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_INFO, "%{public}@Calling progress handler to inform already paired accessory with state: %@", buf, 0x16u);
    }
    v7[2](v7, 47, v18);
  }
}

- (void)updatePairingWithProgress:(int64_t)a3 accessoryServer:(id)a4
{
  id v6 = a4;
  id v7 = [(HMDAccessoryBrowser *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__HMDAccessoryBrowser_updatePairingWithProgress_accessoryServer___block_invoke;
  block[3] = &unk_264A2E458;
  void block[4] = self;
  id v10 = v6;
  int64_t v11 = a3;
  id v8 = v6;
  dispatch_async(v7, block);
}

uint64_t __65__HMDAccessoryBrowser_updatePairingWithProgress_accessoryServer___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) accessoryServer:*(void *)(a1 + 40) updatePairingProgress:*(void *)(a1 + 48)];
}

- (void)_updateHasActiveWACPairing:(int64_t)a3
{
  id v5 = [(HMDAccessoryBrowser *)self workQueue];
  dispatch_assert_queue_V2(v5);

  if ((unint64_t)a3 <= 0x31)
  {
    if (((1 << a3) & 0x19000) != 0)
    {
      if ([(HMDAccessoryBrowser *)self hasActiveWACPairing]) {
        return;
      }
      uint64_t v6 = 1;
    }
    else
    {
      if (((1 << a3) & 0x2000000002008) == 0
        || ![(HMDAccessoryBrowser *)self hasActiveWACPairing])
      {
        return;
      }
      uint64_t v6 = 0;
    }
    [(HMDAccessoryBrowser *)self setHasActiveWACPairing:v6];
  }
}

- (void)accessoryServer:(id)a3 updatePairingProgress:(int64_t)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [(HMDAccessoryBrowser *)self workQueue];
  dispatch_assert_queue_V2(v7);

  id v8 = [(HMDAccessoryBrowser *)self unpairedAccessoryForServer:v6];
  if (v8)
  {
    uint64_t v9 = [(HMDAccessoryBrowser *)self _pairingInformationForUnpairedAccessory:v8];
    id v10 = [v9 addAccessoryProgressHandler];
    if (v10) {
      goto LABEL_4;
    }
    int64_t v11 = [v8 uuid];
    uint64_t v12 = [(HMDAccessoryBrowser *)self _progressHandlerForUnpairedAccessory:v11];
    id v10 = [v12 progressHandler];

    if (v10)
    {
LABEL_4:
      __int16 v24 = v9;
      if ((unint64_t)(a4 - 1) > 0x25) {
        uint64_t v13 = 15;
      }
      else {
        uint64_t v13 = qword_2303E3F88[a4 - 1];
      }
      long long v18 = [HMDAddAccessoryProgressState alloc];
      long long v19 = [v8 uuid];
      long long v20 = [v8 name];
      unsigned int v21 = [v8 category];
      id v22 = [v6 productData];
      id v23 = [(HMDAddAccessoryProgressState *)v18 initWithUUID:v19 accessoryName:v20 manufacturerName:0 category:v21 certificationStatus:0 productData:v22];

      [(HMDAccessoryBrowser *)self _updateHasActiveWACPairing:v13];
      ((void (**)(void, uint64_t, HMDAddAccessoryProgressState *))v10)[2](v10, v13, v23);
      if (v13 == 36) {
        ((void (**)(void, uint64_t, HMDAddAccessoryProgressState *))v10)[2](v10, 3, v23);
      }

      uint64_t v9 = v24;
    }
  }
  else
  {
    id v14 = (void *)MEMORY[0x230FBD990]();
    int v15 = self;
    id v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      long long v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v26 = v17;
      __int16 v27 = 2112;
      id v28 = v6;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_ERROR, "%{public}@No unpaired accessory for server %@", buf, 0x16u);
    }
  }
}

- (void)_notifyDelegateOfAccessoryServer:(id)a3 didDiscoverAccessories:(id)a4 transaction:(id)a5 error:(id)a6
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [v10 identifier];
  int v15 = [(HMDAccessoryBrowser *)self pairedAccessoryInformationWithIdentifier:v14];

  id v16 = [v15 delegate];
  if (objc_opt_respondsToSelector())
  {
    long long v17 = (void *)MEMORY[0x230FBD990]();
    long long v18 = self;
    long long v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      long long v20 = HMFGetLogIdentifier();
      int v21 = 138544130;
      id v22 = v20;
      __int16 v23 = 2112;
      __int16 v24 = v16;
      __int16 v25 = 2112;
      id v26 = v10;
      __int16 v27 = 2112;
      id v28 = v13;
      _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_INFO, "%{public}@Notifying '%@' that an accessory server %@ finished discovering accessories [error %@]", (uint8_t *)&v21, 0x2Au);
    }
    [v16 accessoryBrowser:v18 accessoryServer:v10 didDiscoverAccessories:v11 transaction:v12 error:v13];
  }
}

- (void)_accessoryServer:(id)a3 didStopPairingWithError:(id)a4 matterPairingEndContext:(id)a5
{
  uint64_t v77 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v66 = a5;
  id v10 = [(HMDAccessoryBrowser *)self workQueue];
  dispatch_assert_queue_V2(v10);

  id v11 = [v8 pairingActivity];
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __88__HMDAccessoryBrowser__accessoryServer_didStopPairingWithError_matterPairingEndContext___block_invoke;
  aBlock[3] = &unk_264A271F0;
  id v12 = v11;
  id v68 = v12;
  id v13 = (void (**)(void *, void *, uint64_t))_Block_copy(aBlock);
  if ([v8 linkType] == 2)
  {
    v63 = v13;
    id v14 = (void *)MEMORY[0x230FBD990]();
    int v15 = self;
    id v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      long long v17 = HMFGetLogIdentifier();
      long long v18 = [v8 identifier];
      *(_DWORD *)buf = 138543618;
      __int16 v70 = v17;
      __int16 v71 = 2112;
      id v72 = v18;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@Removing BLE Accessory: %@ from discovering list", buf, 0x16u);
    }
    long long v19 = [(HMDAccessoryBrowser *)v15 discoveringBLEAccessoryServerIdentifiers];
    long long v20 = [v8 identifier];
    [v19 removeObject:v20];

    id v13 = v63;
  }
  id v21 = v9;
  id v22 = v21;
  if (v21)
  {
    __int16 v23 = v21;
    if (([v21 isHMError] & 1) == 0)
    {
      __int16 v23 = mapHAPPairingErrorToHMError(v22);
    }
  }
  else
  {
    __int16 v23 = 0;
  }
  __int16 v24 = [(HMDAccessoryBrowser *)self unpairedAccessoryForServer:v8];
  if (!v24)
  {
    [(HMDAccessoryBrowser *)self _notifyDelegateOfAccessoryServer:v8 didStopPairingWithError:v23];
    goto LABEL_34;
  }
  id v62 = v12;
  __int16 v25 = [(HMDAccessoryBrowser *)self _pairingInformationForUnpairedAccessory:v24];
  if (!v25)
  {
    id v26 = v23;
    __int16 v27 = (void *)MEMORY[0x230FBD990]();
    id v28 = self;
    uint64_t v29 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      uint64_t v30 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      __int16 v70 = v30;
      __int16 v71 = 2112;
      id v72 = v22;
      __int16 v73 = 2112;
      id v74 = v8;
      _os_log_impl(&dword_22F52A000, v29, OS_LOG_TYPE_INFO, "%{public}@Error %@ reported for accessory server %@ corresponding to unpaired accessory that is not in list of currently pairing accessories", buf, 0x20u);
    }
    __int16 v23 = v26;
    __int16 v25 = 0;
  }
  uint64_t v31 = [v25 addAccessoryProgressHandler];
  __int16 v32 = (void (**)(void, void, void))v31;
  if (!v22)
  {
    long long v59 = v23;
    if (v31) {
      goto LABEL_22;
    }
    v39 = [v24 uuid];
    v40 = [(HMDAccessoryBrowser *)self _progressHandlerForUnpairedAccessory:v39];
    __int16 v32 = [v40 progressHandler];

    if (v32)
    {
LABEL_22:
      uint64_t v58 = [v24 certificationStatus];
      uint64_t v41 = [HMDAddAccessoryProgressState alloc];
      id v42 = [v24 uuid];
      [v24 name];
      v43 = v60 = v25;
      [v24 category];
      v44 = v64 = v13;
      id v45 = [v8 productData];
      id v46 = [(HMDAddAccessoryProgressState *)v41 initWithUUID:v42 accessoryName:v43 manufacturerName:0 category:v44 certificationStatus:v58 productData:v45];

      id v13 = v64;
      __int16 v25 = v60;

      ((void (**)(void, uint64_t, HMDAddAccessoryProgressState *))v32)[2](v32, 3, v46);
      ((void (**)(void, uint64_t, HMDAddAccessoryProgressState *))v32)[2](v32, 19, v46);
    }
    v47 = [v8 identifier];
    uint64_t v48 = [v24 transportTypes];
    __int16 v49 = [v8 setupHash];
    [(HMDAccessoryBrowser *)self registerPairedAccessory:v47 transports:v48 setupHash:v49 delegate:0];

    [(HMDAccessoryBrowser *)self _discoverAccessories:v8];
    id v12 = v62;
    __int16 v23 = v59;
    goto LABEL_33;
  }
  [(HMDAccessoryBrowser *)self updateProgressForMappedErrors:v23 accessoryServer:v8 progressHandler:v31];

  int v33 = isIrrecoverableError(v22);
  uint64_t v34 = (void *)MEMORY[0x230FBD990]();
  v35 = self;
  uint64_t v36 = HMFGetOSLogHandle();
  BOOL v37 = os_log_type_enabled(v36, OS_LOG_TYPE_INFO);
  if (!v33)
  {
    if (v37)
    {
      HMFGetLogIdentifier();
      id v50 = v65 = v34;
      [v24 name];
      id v61 = v25;
      v52 = id v51 = v23;
      id v53 = [v24 identifier];
      *(_DWORD *)buf = 138544130;
      __int16 v70 = v50;
      __int16 v71 = 2112;
      id v72 = v22;
      __int16 v73 = 2112;
      id v74 = v52;
      __int16 v75 = 2112;
      v76 = v53;
      _os_log_impl(&dword_22F52A000, v36, OS_LOG_TYPE_INFO, "%{public}@Ignoring didStopPairingWithError:(%@) and starting a pairing interrupted timer for unpaired accessory %@/%@", buf, 0x2Au);

      __int16 v23 = v51;
      __int16 v25 = v61;

      uint64_t v34 = v65;
    }

    id v54 = [v25 pairingRetryTimer];

    if (!v54) {
      v13[2](v13, v22, 1);
    }
    [(HMDAccessoryBrowser *)v35 _startPairingInterruptionTimer:v24];
    id v12 = v62;
    if ([v8 linkType] == 1) {
      [(HMDAccessoryBrowser *)v35 _addReconfirmTimer:v24 accessoryServer:v8];
    }
    if ([v8 linkType] == 2)
    {
      id v55 = [(HMDAccessoryBrowser *)v35 btleAccessoryServerBrowser];
      uint64_t v56 = [v55 scanState];

      if (!v56)
      {
        long long v57 = [(HMDAccessoryBrowser *)v35 btleAccessoryServerBrowser];
        [(HMDAccessoryBrowser *)v35 _startDiscoveryForAccessoryServerBrowser:v57];
      }
    }
LABEL_33:

    goto LABEL_34;
  }
  if (v37)
  {
    uint64_t v38 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    __int16 v70 = v38;
    __int16 v71 = 2112;
    id v72 = v8;
    __int16 v73 = 2112;
    id v74 = v22;
    _os_log_impl(&dword_22F52A000, v36, OS_LOG_TYPE_INFO, "%{public}@Accessory server %@ failed to pair with irrecoverable error: %@", buf, 0x20u);
  }
  v13[2](v13, v22, 0);
  [(HMDAccessoryBrowser *)v35 _sendPairingCompletionStatusForServer:v8 error:v23 matterPairingEndContext:v66 completionHandler:0];

  id v12 = v62;
LABEL_34:
}

void __88__HMDAccessoryBrowser__accessoryServer_didStopPairingWithError_matterPairingEndContext___block_invoke(uint64_t a1, void *a2, char a3)
{
  id v5 = a2;
  id v6 = [v5 userInfo];
  id v7 = [v6 objectForKeyedSubscript:*MEMORY[0x263F08608]];

  if (!v7) {
    id v7 = v5;
  }
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __88__HMDAccessoryBrowser__accessoryServer_didStopPairingWithError_matterPairingEndContext___block_invoke_2;
  v9[3] = &unk_264A2DFC8;
  id v10 = *(id *)(a1 + 32);
  id v11 = v7;
  char v12 = a3;
  id v8 = v7;
  __88__HMDAccessoryBrowser__accessoryServer_didStopPairingWithError_matterPairingEndContext___block_invoke_2(v9);
}

void *__88__HMDAccessoryBrowser__accessoryServer_didStopPairingWithError_matterPairingEndContext___block_invoke_2(void *result)
{
  v1 = (void *)result[4];
  if (v1)
  {
    id v2 = result;
    id v3 = (void *)result[5];
    id v4 = v1;
    [v3 domain];

    [(id)v2[5] code];
    return (id)HMFBooleanToString();
  }
  return result;
}

- (void)accessoryServer:(id)a3 didStopPairingWithError:(id)a4
{
}

- (void)_notifyDelegateOfAccessoryServer:(id)a3 didStopPairingWithError:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 identifier];
  id v9 = [(HMDAccessoryBrowser *)self pairedAccessoryInformationWithIdentifier:v8];

  id v10 = [v9 delegate];
  if (objc_opt_respondsToSelector())
  {
    id v11 = (void *)MEMORY[0x230FBD990]();
    char v12 = self;
    id v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      id v14 = HMFGetLogIdentifier();
      int v15 = 138543874;
      id v16 = v14;
      __int16 v17 = 2112;
      long long v18 = v10;
      __int16 v19 = 2112;
      id v20 = v6;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Notifying '%@' that an accessory server stopped pairing %@", (uint8_t *)&v15, 0x20u);
    }
    [v10 accessoryBrowser:v12 accessoryServer:v6 didStopPairingWithError:v7];
  }
}

- (void)accessoryServer:(id)a3 didReceiveBadPasswordThrottleAttemptsWithDelay:(int64_t)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [(HMDAccessoryBrowser *)self workQueue];
  dispatch_assert_queue_V2(v7);

  if (a4 < 1)
  {
    id v9 = (void *)MEMORY[0x230FBD990]();
    id v10 = self;
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      char v12 = HMFGetLogIdentifier();
      int v13 = 138543618;
      id v14 = v12;
      __int16 v15 = 2112;
      id v16 = v6;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Bad password for server %@ - re-prompting for setup code and re-start pairing", (uint8_t *)&v13, 0x16u);
    }
    [(HMDAccessoryBrowser *)v10 _promptForPairingPasswordForServer:v6 reason:@"HMSetupCodeProviderReasonBadPassword"];
  }
  else
  {
    id v8 = [(HMDAccessoryBrowser *)self unpairedAccessoryForServer:v6];
    [(HMDAccessoryBrowser *)self _updatePairingRetryTimerForAccessory:v8 delay:a4];
  }
}

- (void)accessoryServer:(id)a3 promptUserForPasswordWithType:(unint64_t)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [(HMDAccessoryBrowser *)self workQueue];
  dispatch_assert_queue_V2(v7);

  id v8 = [(HMDAccessoryBrowser *)self unpairedAccessoryForServer:v6];
  id v9 = [(HMDAccessoryBrowser *)self _pairingInformationForUnpairedAccessory:v8];
  id v10 = [v9 setupCode];
  if (v10)
  {
    id v11 = (void *)MEMORY[0x230FBD990]();
    char v12 = self;
    int v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      id v14 = HMFGetLogIdentifier();
      int v31 = 138543874;
      __int16 v32 = v14;
      __int16 v33 = 2112;
      id v34 = v6;
      __int16 v35 = 2112;
      uint64_t v36 = v10;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Have a pair setup password for server %@ - trying %@", (uint8_t *)&v31, 0x20u);
    }
    __int16 v15 = _normalizeSetupCode(v10);
    [v6 tryPairingPassword:v15 onboardingSetupPayloadString:0 error:0];
  }
  else
  {
    id v16 = (void *)MEMORY[0x230FBD990]();
    uint64_t v17 = self;
    long long v18 = HMFGetOSLogHandle();
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_INFO);
    if (a4 == 2)
    {
      if (v19)
      {
        id v20 = HMFGetLogIdentifier();
        int v31 = 138543618;
        __int16 v32 = v20;
        __int16 v33 = 2112;
        id v34 = v6;
        _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_INFO, "%{public}@Need ownership proof token for server %@ but there is no productData to look up the app that can provide it", (uint8_t *)&v31, 0x16u);
      }
      uint64_t v21 = [v9 addAccessoryProgressHandler];
      if (v21) {
        goto LABEL_10;
      }
      id v22 = [v8 uuid];
      __int16 v23 = [(HMDAccessoryBrowser *)v17 _progressHandlerForUnpairedAccessory:v22];
      uint64_t v21 = [v23 progressHandler];

      if (v21)
      {
LABEL_10:
        __int16 v24 = [HMDAddAccessoryProgressState alloc];
        __int16 v25 = [v8 uuid];
        id v26 = [v8 name];
        __int16 v27 = [v8 category];
        id v28 = [v6 productData];
        uint64_t v29 = [(HMDAddAccessoryProgressState *)v24 initWithUUID:v25 accessoryName:v26 manufacturerName:0 category:v27 certificationStatus:0 productData:v28];

        ((void (**)(void, uint64_t, HMDAddAccessoryProgressState *))v21)[2](v21, 10, v29);
      }
    }
    else
    {
      if (v19)
      {
        uint64_t v30 = HMFGetLogIdentifier();
        int v31 = 138543618;
        __int16 v32 = v30;
        __int16 v33 = 2112;
        id v34 = v6;
        _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_INFO, "%{public}@Do not have a pair setup password for server %@ - requesting it", (uint8_t *)&v31, 0x16u);
      }
      [(HMDAccessoryBrowser *)v17 _promptForPairingPasswordForServer:v6 reason:@"HMSetupCodeProviderReasonInitial"];
    }
  }
}

- (void)accessoryServer:(id)a3 requestUserPermission:(int64_t)a4 accessoryInfo:(id)a5 error:(id)a6
{
  uint64_t v115 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  val = self;
  int v13 = [(HMDAccessoryBrowser *)self workQueue];
  dispatch_assert_queue_V2(v13);

  v109[0] = 0;
  v109[1] = v109;
  v109[2] = 0x2020000000;
  char v110 = 1;
  id v14 = [v10 pairingActivity];
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __81__HMDAccessoryBrowser_accessoryServer_requestUserPermission_accessoryInfo_error___block_invoke;
  aBlock[3] = &unk_264A27128;
  id v15 = v14;
  id v104 = v15;
  v107 = v109;
  id v16 = v11;
  id v105 = v16;
  v106 = self;
  int64_t v108 = a4;
  v80 = (void (**)(void))_Block_copy(aBlock);
  v100[0] = MEMORY[0x263EF8330];
  v100[1] = 3221225472;
  v100[2] = __81__HMDAccessoryBrowser_accessoryServer_requestUserPermission_accessoryInfo_error___block_invoke_3;
  v100[3] = &unk_264A27178;
  id v76 = v15;
  id v101 = v76;
  int64_t v102 = a4;
  uint64_t v17 = _Block_copy(v100);
  objc_initWeak(&location, self);
  v93[0] = MEMORY[0x263EF8330];
  v93[1] = 3221225472;
  v93[2] = __81__HMDAccessoryBrowser_accessoryServer_requestUserPermission_accessoryInfo_error___block_invoke_5;
  v93[3] = &unk_264A271A0;
  objc_copyWeak(v98, &location);
  id v18 = v10;
  id v94 = v18;
  id v19 = v17;
  id v96 = v19;
  v97 = v109;
  v98[1] = (id)a4;
  id v75 = v12;
  id v95 = v75;
  id v20 = _Block_copy(v93);
  uint64_t v21 = [(HMDAccessoryBrowser *)self unpairedAccessoryForServer:v18];
  id v22 = [(HMDAccessoryBrowser *)self _pairingInformationForUnpairedAccessory:v21];
  v81 = +[HMDUIDialogPresenter sharedUIDialogPresenter];
  v82 = +[HMDHAPMetadata getSharedInstance];
  __int16 v23 = [v82 categoryForOther];
  __int16 v24 = [v16 category];

  if (v24)
  {
    __int16 v25 = [v16 category];
    uint64_t v26 = [v82 categoryForIdentifier:v25];

    __int16 v27 = (void *)v26;
  }
  else
  {
    __int16 v27 = v23;
  }
  uint64_t v77 = v27;
  v79 = [v27 name];
  v84[0] = MEMORY[0x263EF8330];
  v84[1] = 3221225472;
  v84[2] = __81__HMDAccessoryBrowser_accessoryServer_requestUserPermission_accessoryInfo_error___block_invoke_564;
  v84[3] = &unk_264A271C8;
  objc_copyWeak(&v92, &location);
  id v28 = v20;
  id v89 = v28;
  id v74 = v19;
  id v90 = v74;
  v91 = v109;
  id v29 = v22;
  id v85 = v29;
  id v30 = v18;
  id v86 = v30;
  id v31 = v16;
  id v87 = v31;
  id v32 = v21;
  id v88 = v32;
  __int16 v33 = _Block_copy(v84);
  v78 = v33;
  switch(a4)
  {
    case 0:
      if (!objc_msgSend(v29, "allowAddUnauthenticatedAccessory", v74, v75, v76)) {
        goto LABEL_38;
      }
      uint64_t v36 = (void *)MEMORY[0x230FBD990]();
      uint64_t v37 = val;
      HMFGetOSLogHandle();
      uint64_t v38 = (id)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v38, OS_LOG_TYPE_INFO)) {
        goto LABEL_37;
      }
      goto LABEL_36;
    case 1:
      if (objc_msgSend(v29, "provideNetworkCredentialsToAccessory", v74, v75, v76))
      {
        uint64_t v36 = (void *)MEMORY[0x230FBD990]();
        id v53 = val;
        HMFGetOSLogHandle();
        uint64_t v38 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
        {
          id v54 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v112 = v54;
          _os_log_impl(&dword_22F52A000, v38, OS_LOG_TYPE_INFO, "%{public}@Accessory Browser: User already consented to providing network credentials to accessory - skipping prompt", buf, 0xCu);
        }
      }
      else
      {
        if (!skipAuthPromptDialog)
        {
          v80[2]();
          v47 = [v30 name];
          uint64_t v48 = [(HMDAccessoryBrowser *)val workQueue];
          [v81 requestUserPermissionForLegacyWACAccessory:v47 withContext:v30 queue:v48 completionHandler:v28];
          goto LABEL_47;
        }
        uint64_t v36 = (void *)MEMORY[0x230FBD990]();
        id v67 = val;
        HMFGetOSLogHandle();
        uint64_t v38 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
        {
          id v68 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v112 = v68;
          _os_log_impl(&dword_22F52A000, v38, OS_LOG_TYPE_INFO, "%{public}@Accessory Browser: Defaults write set - skipping auth prompt", buf, 0xCu);
        }
      }
      goto LABEL_37;
    case 2:
      v39 = (void *)MEMORY[0x230FBD990](v33, v34, v35);
      v40 = val;
      HMFGetOSLogHandle();
      uint64_t v41 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
      {
        id v42 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v112 = v42;
        __int16 v113 = 2112;
        int64_t v114 = (int64_t)v31;
        _os_log_impl(&dword_22F52A000, v41, OS_LOG_TYPE_DEBUG, "%{public}@Confirming Accessory Info: %@", buf, 0x16u);
      }
      if (objc_msgSend(v31, "isCertified", v74, v75, v76))
      {
        v43 = (void *)MEMORY[0x230FBD990]();
        v44 = v40;
        HMFGetOSLogHandle();
        id v45 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
        {
          id v46 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v112 = v46;
          _os_log_impl(&dword_22F52A000, v45, OS_LOG_TYPE_INFO, "%{public}@need to confirm PPID", buf, 0xCu);
        }
        if (showAuthDialog)
        {
          v80[2]();
          v47 = [v30 name];
          uint64_t v48 = [(HMDAccessoryBrowser *)v44 workQueue];
          [v81 requestUserPermissionWithAccessoryPPIDInfo:v31 name:v47 category:v79 withContext:v30 queue:v48 completionHandler:v28];
          goto LABEL_47;
        }
LABEL_30:
        -[HMDAccessoryBrowser _callProgressOrErrorOut:pairingInfo:accessoryInfo:unpairedAccessory:progress:certStatus:](val, "_callProgressOrErrorOut:pairingInfo:accessoryInfo:unpairedAccessory:progress:certStatus:", v30, v29, v31, v32, 6, 1, v74);
      }
      else if ([v29 allowAddUnauthenticatedAccessory])
      {
        uint64_t v36 = (void *)MEMORY[0x230FBD990]();
        id v69 = v40;
        HMFGetOSLogHandle();
        uint64_t v38 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
        {
LABEL_36:
          __int16 v70 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v112 = v70;
          _os_log_impl(&dword_22F52A000, v38, OS_LOG_TYPE_INFO, "%{public}@Accessory Browser: User already consented to adding unauthenticated accessory to home - skipping auth prompt", buf, 0xCu);
        }
LABEL_37:

        [v30 continuePairingAfterAuthPrompt];
      }
      else
      {
LABEL_38:
        if (!skipAuthPromptDialog) {
          v80[2]();
        }
        [(HMDAccessoryBrowser *)val accessoryServer:v30 promtDialog:v81 forNotCertifiedAccessory:v32 completion:v78];
      }
      goto LABEL_48;
    case 3:
      id v55 = (void *)MEMORY[0x230FBD990](v33, v34, v35);
      uint64_t v56 = val;
      HMFGetOSLogHandle();
      long long v57 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
      {
        uint64_t v58 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v112 = v58;
        _os_log_impl(&dword_22F52A000, v57, OS_LOG_TYPE_INFO, "%{public}@need to confirm accessory info with user", buf, 0xCu);
      }
      if (!showAuthDialog) {
        goto LABEL_30;
      }
      ((void (*)(void (**)(void), uint64_t, uint64_t))v80[2])(v80, v59, v60);
      v47 = objc_msgSend(v30, "name", v74, v75, v76);
      uint64_t v48 = [(HMDAccessoryBrowser *)v56 workQueue];
      [v81 requestUserPermissionWithAccessoryPPIDInfo:v31 name:v47 category:v79 withContext:v30 queue:v48 completionHandler:v28];
      goto LABEL_47;
    case 4:
      if (showAuthDialog)
      {
        ((void (*)(void (**)(void), uint64_t, uint64_t))v80[2])(v80, v34, v35);
        v47 = objc_msgSend(v30, "name", v74, v75, v76);
        uint64_t v48 = [(HMDAccessoryBrowser *)val workQueue];
        [v81 showUserDialogForIncompatibleAccessory:v31 name:v47 category:v79 withContext:v30 queue:v48 completionHandler:v28];
        goto LABEL_47;
      }
      __int16 v49 = (void *)MEMORY[0x230FBD990](v33, v34, v35);
      __int16 v71 = val;
      HMFGetOSLogHandle();
      id v51 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
      {
        id v72 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v112 = v72;
        _os_log_impl(&dword_22F52A000, v51, OS_LOG_TYPE_ERROR, "%{public}@Accessory is in-compatible .. cancelling", buf, 0xCu);
      }
LABEL_43:

      uint64_t v73 = 1;
      goto LABEL_45;
    case 5:
      id v61 = (void *)MEMORY[0x230FBD990](v33, v34, v35);
      id v62 = val;
      HMFGetOSLogHandle();
      v63 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
      {
        v64 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v112 = v64;
        _os_log_impl(&dword_22F52A000, v63, OS_LOG_TYPE_INFO, "%{public}@need to confirm accessory information with user", buf, 0xCu);
      }
      if (showAuthDialog)
      {
        ((void (*)(void (**)(void), uint64_t, uint64_t))v80[2])(v80, v65, v66);
        v47 = objc_msgSend(v30, "name", v74, v75, v76);
        uint64_t v48 = [(HMDAccessoryBrowser *)v62 workQueue];
        [v81 requestUserPermissionWithAccessoryPPIDInfo:v31 name:v47 category:v79 withContext:v30 queue:v48 completionHandler:v28];
LABEL_47:
      }
      else
      {
        uint64_t v73 = 0;
LABEL_45:
        (*((void (**)(id, uint64_t))v28 + 2))(v28, v73);
      }
LABEL_48:

      objc_destroyWeak(&v92);
      objc_destroyWeak(v98);
      objc_destroyWeak(&location);

      _Block_object_dispose(v109, 8);
      return;
    default:
      __int16 v49 = (void *)MEMORY[0x230FBD990](v33, v34, v35);
      id v50 = val;
      HMFGetOSLogHandle();
      id v51 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
      {
        id v52 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v112 = v52;
        __int16 v113 = 2048;
        int64_t v114 = a4;
        _os_log_impl(&dword_22F52A000, v51, OS_LOG_TYPE_INFO, "%{public}@Accessory Browser: Request user permission - unsupported type %tu - cancelling...", buf, 0x16u);
      }
      goto LABEL_43;
  }
}

void __81__HMDAccessoryBrowser_accessoryServer_requestUserPermission_accessoryInfo_error___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
    if (*(void *)(a1 + 40))
    {
      id v2 = *(void **)(a1 + 48);
      id v13 = 0;
      id v14 = 0;
      objc_msgSend(v2, "vendorModel:vendorManufacturer:accessoryInfo:", &v14, &v13);
      id v3 = v14;
      id v4 = v13;
    }
    else
    {
      id v3 = 0;
      id v4 = 0;
    }
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __81__HMDAccessoryBrowser_accessoryServer_requestUserPermission_accessoryInfo_error___block_invoke_2;
    v8[3] = &unk_264A2AA20;
    id v9 = *(id *)(a1 + 32);
    id v10 = v3;
    uint64_t v5 = *(void *)(a1 + 64);
    id v11 = v4;
    uint64_t v12 = v5;
    id v6 = v4;
    id v7 = v3;
    __81__HMDAccessoryBrowser_accessoryServer_requestUserPermission_accessoryInfo_error___block_invoke_2(v8);
  }
}

void __81__HMDAccessoryBrowser_accessoryServer_requestUserPermission_accessoryInfo_error___block_invoke_3(uint64_t a1, void *a2, char a3, char a4)
{
  id v7 = a2;
  id v8 = *(void **)(a1 + 32);
  if (v8 && (a4 & 1) == 0)
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __81__HMDAccessoryBrowser_accessoryServer_requestUserPermission_accessoryInfo_error___block_invoke_4;
    v11[3] = &unk_264A27150;
    id v9 = v8;
    uint64_t v10 = *(void *)(a1 + 40);
    id v12 = v9;
    uint64_t v14 = v10;
    char v15 = a3;
    id v13 = v7;
    __81__HMDAccessoryBrowser_accessoryServer_requestUserPermission_accessoryInfo_error___block_invoke_4((uint64_t)v11);
  }
}

void __81__HMDAccessoryBrowser_accessoryServer_requestUserPermission_accessoryInfo_error___block_invoke_5(uint64_t a1, char a2)
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  uint64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = [WeakRetained workQueue];
    dispatch_assert_queue_V2(v6);

    if (a2)
    {
      uint64_t v7 = *(void *)(a1 + 72);
      id v8 = (void *)MEMORY[0x230FBD990]();
      id v9 = v5;
      uint64_t v10 = HMFGetOSLogHandle();
      id v11 = v10;
      if (v7 == 2)
      {
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          id v12 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          uint64_t v48 = v12;
          _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@User denied adding accessory after PPID conf.", buf, 0xCu);
        }
        [v9 _continueAfterPPIDValidation:0 server:*(void *)(a1 + 32)];
      }
      else
      {
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          id v16 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          uint64_t v48 = v16;
          _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_ERROR, "%{public}@User canceled pairing, stopping pairing...\n", buf, 0xCu);
        }
        [*(id *)(a1 + 32) stopPairingWithError:0];
        uint64_t v17 = [MEMORY[0x263F087E8] hmPrivateErrorWithCode:2001];
        uint64_t v45 = *MEMORY[0x263F08608];
        id v46 = v17;
        id v18 = [NSDictionary dictionaryWithObjects:&v46 forKeys:&v45 count:1];
        id v19 = [MEMORY[0x263F087E8] hmErrorWithCode:23 userInfo:v18];
        id v20 = v17;
        uint64_t v21 = v20;
        if (*(void *)(a1 + 72) == 4)
        {
          id v22 = [MEMORY[0x263F087E8] hmErrorWithCode:93 userInfo:0];

          id v19 = v22;
          __int16 v23 = v19;
        }
        else
        {
          __int16 v23 = v20;
        }
        (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
        if ([*(id *)(a1 + 32) communicationProtocol] == 2)
        {
          __int16 v24 = +[HMDMatterAccessoryPairingEndContext hmdContextWithStep:2 error:*(void *)(a1 + 40)];
        }
        else
        {
          __int16 v24 = 0;
        }
        [v9 _sendPairingCompletionStatusForServer:*(void *)(a1 + 32) error:v19 matterPairingEndContext:v24 completionHandler:0];
      }
    }
    else
    {
      id v13 = [v5 unpairedAccessoryForServer:*(void *)(a1 + 32)];
      uint64_t v14 = [v5 _pairingInformationForUnpairedAccessory:v13];
      uint64_t v15 = (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
      switch(*(void *)(a1 + 72))
      {
        case 0:
          [v14 setAllowAddUnauthenticatedAccessory:1];
          goto LABEL_38;
        case 1:
          [v14 setProvideNetworkCredentialsToAccessory:1];
          __int16 v25 = [v14 setupCode];

          if (v25)
          {
            uint64_t v26 = (void *)MEMORY[0x230FBD990]();
            id v27 = v5;
            id v28 = HMFGetOSLogHandle();
            if (!os_log_type_enabled(v28, OS_LOG_TYPE_INFO)) {
              goto LABEL_36;
            }
            id v29 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543362;
            uint64_t v48 = v29;
            id v30 = "%{public}@Legacy WAC accessory - password provided ahead of time - continuing pairing process...\n";
          }
          else
          {
            int v42 = [v14 setupCodeProvided];
            uint64_t v26 = (void *)MEMORY[0x230FBD990]();
            id v43 = v5;
            id v28 = HMFGetOSLogHandle();
            BOOL v44 = os_log_type_enabled(v28, OS_LOG_TYPE_INFO);
            if (v42)
            {
              if (!v44) {
                goto LABEL_36;
              }
              id v29 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543362;
              uint64_t v48 = v29;
              id v30 = "%{public}@Legacy WAC accessory - setup code provided by user - continuing pairing process...\n";
            }
            else
            {
              if (!v44) {
                goto LABEL_36;
              }
              id v29 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543362;
              uint64_t v48 = v29;
              id v30 = "%{public}@Legacy WAC accessory - continuing pairing even though setup code is yet to be provided...\n";
            }
          }
          _os_log_impl(&dword_22F52A000, v28, OS_LOG_TYPE_INFO, v30, buf, 0xCu);

LABEL_36:
LABEL_37:
LABEL_38:
          [*(id *)(a1 + 32) continuePairingAfterAuthPrompt];
LABEL_39:

          break;
        case 2:
          id v31 = (void *)MEMORY[0x230FBD990](v15);
          id v32 = v5;
          __int16 v33 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
          {
            uint64_t v34 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543362;
            uint64_t v48 = v34;
            _os_log_impl(&dword_22F52A000, v33, OS_LOG_TYPE_INFO, "%{public}@User confirmed accessory PPID Info .. continuing with auth.", buf, 0xCu);
          }
          [v32 _continueAfterPPIDValidation:1 server:*(void *)(a1 + 32)];
          goto LABEL_39;
        case 3:
          uint64_t v26 = (void *)MEMORY[0x230FBD990](v15);
          id v35 = v5;
          uint64_t v36 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
          {
            uint64_t v37 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543362;
            uint64_t v48 = v37;
            _os_log_impl(&dword_22F52A000, v36, OS_LOG_TYPE_INFO, "%{public}@User confirmed accessory Info .. continuing pairing", buf, 0xCu);
          }
          goto LABEL_37;
        case 5:
          uint64_t v38 = (void *)MEMORY[0x230FBD990](v15);
          id v39 = v5;
          v40 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
          {
            uint64_t v41 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543362;
            uint64_t v48 = v41;
            _os_log_impl(&dword_22F52A000, v40, OS_LOG_TYPE_INFO, "%{public}@User confirmed accessory Info .. continuing wac pairing", buf, 0xCu);
          }
          [*(id *)(a1 + 32) continuePairingUsingWAC];
          goto LABEL_39;
        default:
          goto LABEL_39;
      }
    }
  }
}

void __81__HMDAccessoryBrowser_accessoryServer_requestUserPermission_accessoryInfo_error___block_invoke_564(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    uint64_t v5 = [WeakRetained workQueue];
    dispatch_assert_queue_V2(v5);

    if (a2)
    {
      (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
      [*(id *)(a1 + 32) setAllowAddUnauthenticatedAccessory:1];
      [v6 _callProgressOrErrorOut:*(void *)(a1 + 40) pairingInfo:*(void *)(a1 + 32) accessoryInfo:*(void *)(a1 + 48) unpairedAccessory:*(void *)(a1 + 56) progress:6 certStatus:2];
    }
    id WeakRetained = v6;
  }
}

void __81__HMDAccessoryBrowser_accessoryServer_requestUserPermission_accessoryInfo_error___block_invoke_4(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  if (v1)
  {
    id v6 = v1;
    id v3 = (id)HAPUserPermissionTypeDescription();
    id v4 = (id)[NSNumber numberWithInteger:*(void *)(a1 + 48)];
    id v5 = (id)HMFBooleanToString();
    [*(id *)(a1 + 40) domain];

    [*(id *)(a1 + 40) code];
  }
}

void *__81__HMDAccessoryBrowser_accessoryServer_requestUserPermission_accessoryInfo_error___block_invoke_2(void *result)
{
  if (result[4])
  {
    v1 = result;
    id v2 = (id)HAPUserPermissionTypeDescription();
    return (id)[NSNumber numberWithInteger:v1[7]];
  }
  return result;
}

- (void)accessoryServer:(id)a3 promtDialog:(id)a4 forNotCertifiedAccessory:(id)a5 completion:(id)a6
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, void))a6;
  uint64_t v14 = [v12 setCertificationStatus:1];
  int v15 = skipAuthPromptDialog;
  id v16 = (void *)MEMORY[0x230FBD990](v14);
  uint64_t v17 = self;
  id v18 = HMFGetOSLogHandle();
  BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_INFO);
  if (v15)
  {
    if (v19)
    {
      id v20 = HMFGetLogIdentifier();
      int v24 = 138543362;
      __int16 v25 = v20;
      _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_INFO, "%{public}@Accessory Browser: Defaults write set - skipping auth prompt", (uint8_t *)&v24, 0xCu);
    }
    if (v13) {
      v13[2](v13, 0);
    }
  }
  else
  {
    if (v19)
    {
      uint64_t v21 = HMFGetLogIdentifier();
      int v24 = 138543362;
      __int16 v25 = v21;
      _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_INFO, "%{public}@Prompting for not certified confirmation", (uint8_t *)&v24, 0xCu);
    }
    id v22 = [v10 name];
    __int16 v23 = [(HMDAccessoryBrowser *)v17 workQueue];
    [v11 requestUserPermissionForUnauthenticatedAccessory:v22 withContext:v10 queue:v23 completionHandler:v13];
  }
}

- (void)_callProgressOrErrorOut:(id)a3 pairingInfo:(id)a4 accessoryInfo:(id)a5 unpairedAccessory:(id)a6 progress:(int64_t)a7 certStatus:(unint64_t)a8
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = [(HMDAccessoryBrowser *)self workQueue];
  dispatch_assert_queue_V2(v18);

  if ([v16 isDenylisted])
  {
    BOOL v19 = (void *)MEMORY[0x230FBD990]();
    id v20 = self;
    uint64_t v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      id v22 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v49 = v22;
      _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@Accessory is blacklisted - Stopping pairing", buf, 0xCu);
    }
    [v14 stopPairingWithError:0];
    __int16 v23 = [MEMORY[0x263F087E8] hmErrorWithCode:55 userInfo:0];
    int v24 = 0;
    if ([v17 supportsCHIP])
    {
      int v24 = +[HMDMatterAccessoryPairingEndContext hmdContextWithStep:2 error:v23];
    }
    [(HMDAccessoryBrowser *)v20 _sendPairingCompletionStatusForServer:v14 error:v23 matterPairingEndContext:v24 completionHandler:0];
  }
  else
  {
    int64_t v44 = a7;
    __int16 v25 = [HMDAddAccessoryProgressState alloc];
    uint64_t v26 = [v17 uuid];
    [v17 name];
    uint64_t v45 = v17;
    v28 = id v27 = v15;
    uint64_t v29 = [v16 manufacturer];
    id v30 = v16;
    id v31 = (void *)v29;
    id v32 = (void *)MEMORY[0x263F0DF40];
    id v46 = v30;
    [v30 category];
    v34 = __int16 v33 = v14;
    id v35 = [v32 categoryWithCategoryIdentifier:v34];
    v47 = v33;
    uint64_t v36 = [v33 productData];
    __int16 v23 = [(HMDAddAccessoryProgressState *)v25 initWithUUID:v26 accessoryName:v28 manufacturerName:v31 category:v35 certificationStatus:a8 productData:v36];

    id v15 = v27;
    id v17 = v45;

    uint64_t v37 = [v15 addAccessoryProgressHandler];
    if (v37) {
      goto LABEL_9;
    }
    uint64_t v38 = [v45 uuid];
    id v39 = [(HMDAccessoryBrowser *)self _progressHandlerForUnpairedAccessory:v38];
    uint64_t v37 = [v39 progressHandler];

    if (v37)
    {
LABEL_9:
      ((void (**)(void, int64_t, HMDAddAccessoryProgressState *))v37)[2](v37, v44, v23);

      id v14 = v47;
    }
    else
    {
      v40 = (void *)MEMORY[0x230FBD990]();
      uint64_t v41 = self;
      int v42 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        id v43 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        uint64_t v49 = v43;
        _os_log_impl(&dword_22F52A000, v42, OS_LOG_TYPE_DEFAULT, "%{public}@no progress handler available - implicit auth", buf, 0xCu);
      }
      id v14 = v47;
      [v47 continueAuthAfterValidation:1];
    }
    id v16 = v46;
  }
}

- (void)_continueAfterPPIDValidation:(BOOL)a3 server:(id)a4
{
}

- (id)_getHAPMetadataFromHMMetadata:(id)a3
{
  if (a3)
  {
    id v3 = (objc_class *)MEMORY[0x263F35AF8];
    id v4 = a3;
    id v5 = [v3 alloc];
    id v6 = [v4 name];
    uint64_t v7 = [v4 channel];
    id v8 = [v4 PANID];
    id v9 = [v4 extendedPANID];
    id v10 = [v4 masterKey];
    id v11 = [v4 passPhrase];
    id v12 = [v4 PSKc];
    id v13 = [v4 operationalDataset];

    id v14 = (void *)[v5 initWithName:v6 channel:v7 PANID:v8 extendedPANID:v9 masterKey:v10 passPhrase:v11 PSKc:v12 activeOperationalDataSet:v13];
  }
  else
  {
    id v14 = 0;
  }
  return v14;
}

- (void)accessoryServerBrowser:(id)a3 getLockedState:(BOOL *)a4
{
  *a4 = isDeviceLocked();
}

- (void)accessoryServerBrowser:(id)a3 getThreadNetworkCredentialsForAccessoryWithIdentifier:(id)a4 withCompletion:(id)a5
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v39 = a3;
  id v38 = a4;
  id v8 = (void (**)(id, void *, void))a5;
  id v9 = [(HMDAccessoryBrowser *)self homeManager];
  id v10 = [(HMDAccessoryBrowser *)self currentlyPairingAccessories];
  id v11 = [v10 firstObject];
  id v12 = [v11 homeUUID];

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  v40 = v9;
  id v13 = [v9 homes];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v44 objects:v52 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v45;
LABEL_3:
    uint64_t v17 = 0;
    while (1)
    {
      if (*(void *)v45 != v16) {
        objc_enumerationMutation(v13);
      }
      id v18 = *(void **)(*((void *)&v44 + 1) + 8 * v17);
      BOOL v19 = objc_msgSend(v18, "uuid", v38);
      char v20 = [v19 isEqual:v12];

      if (v20) {
        break;
      }
      if (v15 == ++v17)
      {
        uint64_t v15 = [v13 countByEnumeratingWithState:&v44 objects:v52 count:16];
        if (v15) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v21 = v18;

    if (!v21) {
      goto LABEL_15;
    }
    __int16 v23 = v38;
    id v22 = v39;
    if (isFeatureMatteriPhoneOnlyPairingControlEnabled()
      && [v21 isSharedAdmin])
    {
      int v24 = [v21 threadOperationalDataset];

      if (v24)
      {
        id v25 = objc_alloc(MEMORY[0x263F35AF8]);
        uint64_t v26 = [v21 threadOperationalDataset];
        id v27 = (void *)[v25 initWithActiveOperationalDataSet:v26];

        v8[2](v8, v27, 0);
        goto LABEL_22;
      }
      __int16 v33 = (void *)MEMORY[0x230FBD990]();
      uint64_t v34 = self;
      id v35 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        uint64_t v36 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        uint64_t v49 = v36;
        _os_log_impl(&dword_22F52A000, v35, OS_LOG_TYPE_INFO, "%{public}@Unexpected, shared admin does not have thread operational dataset for home. Falling back to request credentials from primary resident", buf, 0xCu);
      }
    }
    uint64_t v37 = [(HMDAccessoryBrowser *)self workQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __115__HMDAccessoryBrowser_accessoryServerBrowser_getThreadNetworkCredentialsForAccessoryWithIdentifier_withCompletion___block_invoke;
    block[3] = &unk_264A2EE80;
    void block[4] = self;
    id v43 = v8;
    id v21 = v21;
    id v42 = v21;
    dispatch_async(v37, block);
  }
  else
  {
LABEL_9:

LABEL_15:
    id v28 = (void *)MEMORY[0x230FBD990]();
    uint64_t v29 = self;
    id v30 = HMFGetOSLogHandle();
    id v22 = v39;
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      id v31 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v49 = v31;
      __int16 v50 = 2112;
      id v51 = v12;
      _os_log_impl(&dword_22F52A000, v30, OS_LOG_TYPE_ERROR, "%{public}@no home found for home uuid %@", buf, 0x16u);
    }
    id v32 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
    ((void (**)(id, void *, void *))v8)[2](v8, 0, v32);

    id v21 = 0;
    __int16 v23 = v38;
  }
LABEL_22:
}

void __115__HMDAccessoryBrowser_accessoryServerBrowser_getThreadNetworkCredentialsForAccessoryWithIdentifier_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v3 = MEMORY[0x263EF8330];
  uint64_t v4 = 3221225472;
  id v5 = __115__HMDAccessoryBrowser_accessoryServerBrowser_getThreadNetworkCredentialsForAccessoryWithIdentifier_withCompletion___block_invoke_2;
  id v6 = &unk_264A27100;
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(id *)(a1 + 48);
  id v2 = _Block_copy(&v3);
  objc_msgSend(*(id *)(a1 + 40), "retrieveThreadNetworkMetadataWithCompletion:", v2, v3, v4, v5, v6, v7);
}

void __115__HMDAccessoryBrowser_accessoryServerBrowser_getThreadNetworkCredentialsForAccessoryWithIdentifier_withCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = (void *)MEMORY[0x230FBD990]();
    id v8 = *(id *)(a1 + 32);
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = HMFGetLogIdentifier();
      int v16 = 138543362;
      uint64_t v17 = v10;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to retrieve Thread Network metadata", (uint8_t *)&v16, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v11 = [*(id *)(a1 + 32) _getHAPMetadataFromHMMetadata:v5];
    id v12 = (void *)MEMORY[0x230FBD990]();
    id v13 = *(id *)(a1 + 32);
    uint64_t v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      uint64_t v15 = HMFGetLogIdentifier();
      int v16 = 138543618;
      uint64_t v17 = v15;
      __int16 v18 = 2112;
      BOOL v19 = v11;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@Returning Thread Credentials as %@", (uint8_t *)&v16, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)accessoryServerBrowser:(id)a3 didFinishPairingForAccessoryServer:(id)a4
{
  id v5 = a4;
  id v6 = [v5 identifier];
  id v8 = [(HMDAccessoryBrowser *)self pairedAccessoryInformationWithIdentifier:v6];

  uint64_t v7 = [v8 delegate];
  [v7 accessoryBrowser:self didFinishPairingForAccessoryServer:v5];
}

- (void)accessoryServerBrowser:(id)a3 getCachedOperationalCertificateDataForFabricID:(id)a4 completion:(id)a5
{
  id v6 = (void (**)(id, id))a5;
  id v7 = a4;
  id v8 = +[HMDHomeLocalOperationalCertificateDataStore localOperationalCertDataStore];
  id v9 = [v8 operationalCertDataForFabricID:v7];

  v6[2](v6, v9);
}

- (void)accessoryServerBrowser:(id)a3 cacheOperationalCertData:(id)a4 forFabricID:(id)a5
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)MEMORY[0x230FBD990]();
  id v12 = self;
  id v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    uint64_t v14 = HMFGetLogIdentifier();
    int v16 = 138543618;
    uint64_t v17 = v14;
    __int16 v18 = 2112;
    id v19 = v10;
    _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Caching operational certificate data for fabric %@", (uint8_t *)&v16, 0x16u);
  }
  uint64_t v15 = +[HMDHomeLocalOperationalCertificateDataStore localOperationalCertDataStore];
  [v15 saveOperationalCertData:v9 forFabricID:v10];
}

- (BOOL)supportsCommissioningCertificateRetrievalForHomeUUID:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDAccessoryBrowser *)self homeManager];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v6 = objc_msgSend(v5, "homes", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v26;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v26 != v9) {
        objc_enumerationMutation(v6);
      }
      id v11 = *(void **)(*((void *)&v25 + 1) + 8 * v10);
      id v12 = [v11 uuid];
      uint64_t v13 = [v12 isEqual:v4];

      if (v13) {
        break;
      }
      if (v8 == ++v10)
      {
        uint64_t v8 = [v6 countByEnumeratingWithState:&v25 objects:v33 count:16];
        if (v8) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v14 = v11;

    if (!v14) {
      goto LABEL_16;
    }
    int v15 = [v14 hasAnyResident];
    if (!v15) {
      goto LABEL_14;
    }
    int v16 = [v14 primaryResident];
    if (!v16)
    {
      char v19 = 1;
      goto LABEL_22;
    }
    self = v16;
    id v11 = [v14 primaryResident];
    uint64_t v13 = [v11 capabilities];
    if (!v13)
    {
      char v19 = 1;
    }
    else
    {
LABEL_14:
      uint64_t v17 = [v14 primaryResident];
      __int16 v18 = [v17 capabilities];
      char v19 = [v18 supportsMatterOwnerCertFetch];

      if (!v15) {
        goto LABEL_22;
      }
    }
  }
  else
  {
LABEL_9:

LABEL_16:
    uint64_t v20 = (void *)MEMORY[0x230FBD990]();
    id v21 = self;
    id v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      __int16 v23 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v30 = v23;
      __int16 v31 = 2112;
      id v32 = v4;
      _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_ERROR, "%{public}@no home found for home uuid %@", buf, 0x16u);
    }
    id v14 = 0;
    char v19 = 0;
  }
LABEL_22:

  return v19;
}

- (BOOL)supportsCommissioningCertificateRetrievalForCurrentlyPairingAccessory
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(HMDAccessoryBrowser *)self homeManager];
  id v4 = [(HMDAccessoryBrowser *)self currentlyPairingAccessories];
  id v5 = [v4 firstObject];
  id v6 = [v5 homeUUID];

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v7 = objc_msgSend(v3, "homes", 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v25;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v25 != v10) {
        objc_enumerationMutation(v7);
      }
      id v12 = *(void **)(*((void *)&v24 + 1) + 8 * v11);
      uint64_t v13 = [v12 uuid];
      char v14 = [v13 isEqual:v6];

      if (v14) {
        break;
      }
      if (v9 == ++v11)
      {
        uint64_t v9 = [v7 countByEnumeratingWithState:&v24 objects:v32 count:16];
        if (v9) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v15 = v12;

    if (!v15) {
      goto LABEL_12;
    }
    int v16 = [v15 primaryResident];
    uint64_t v17 = [v16 capabilities];
    char v18 = [v17 supportsMatterOwnerCertFetch];
  }
  else
  {
LABEL_9:

LABEL_12:
    char v19 = (void *)MEMORY[0x230FBD990]();
    uint64_t v20 = self;
    id v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      id v22 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v29 = v22;
      __int16 v30 = 2112;
      __int16 v31 = v6;
      _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_ERROR, "%{public}@no home found for home uuid %@", buf, 0x16u);
    }
    id v15 = 0;
    char v18 = 0;
  }

  return v18;
}

- (void)accessoryServerBrowser:(id)a3 getCommissioningCertificatesForNodeID:(id)a4 fabricID:(id)a5 publicKey:(id)a6 completion:(id)a7
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v39 = a3;
  id v38 = a4;
  id v37 = a5;
  id v36 = a6;
  id v12 = a7;
  uint64_t v13 = [(HMDAccessoryBrowser *)self homeManager];
  char v14 = [(HMDAccessoryBrowser *)self currentlyPairingAccessories];
  id v15 = [v14 firstObject];
  int v16 = [v15 homeUUID];

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v35 = v13;
  uint64_t v17 = [v13 homes];
  uint64_t v18 = [v17 countByEnumeratingWithState:&v40 objects:v48 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v41;
LABEL_3:
    uint64_t v21 = 0;
    while (1)
    {
      if (*(void *)v41 != v20) {
        objc_enumerationMutation(v17);
      }
      id v22 = *(void **)(*((void *)&v40 + 1) + 8 * v21);
      __int16 v23 = [v22 uuid];
      char v24 = [v23 isEqual:v16];

      if (v24) {
        break;
      }
      if (v19 == ++v21)
      {
        uint64_t v19 = [v17 countByEnumeratingWithState:&v40 objects:v48 count:16];
        if (v19) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v26 = v22;

    long long v25 = v39;
    if (!v26) {
      goto LABEL_12;
    }
    long long v28 = v37;
    long long v27 = v38;
    uint64_t v29 = v36;
    [v26 retrieveOperationalCertificatesForFabricID:v37 commissionerNodeID:0 commissioneeNodeID:v38 publicKey:v36 completion:v12];
  }
  else
  {
LABEL_9:

    long long v25 = v39;
LABEL_12:
    __int16 v30 = (void *)MEMORY[0x230FBD990]();
    __int16 v31 = self;
    id v32 = HMFGetOSLogHandle();
    uint64_t v29 = v36;
    long long v28 = v37;
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      uint64_t v33 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      long long v45 = v33;
      __int16 v46 = 2112;
      long long v47 = v16;
      _os_log_impl(&dword_22F52A000, v32, OS_LOG_TYPE_ERROR, "%{public}@no home found for home uuid %@", buf, 0x16u);
    }
    uint64_t v34 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
    (*((void (**)(id, void, void, void, void, void *))v12 + 2))(v12, 0, 0, 0, 0, v34);

    id v26 = 0;
    long long v27 = v38;
  }
}

- (void)removeAccessoryCacheForIdentifier:(id)a3
{
}

- (void)fetchAccessoryCacheForIdentifier:(id)a3 completion:(id)a4
{
}

- (void)saveAccessoryCache:(id)a3 forIdentifier:(id)a4
{
}

- (BOOL)isServerLinkTypeBrowseable:(int64_t)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = [(HMDAccessoryBrowser *)self browseableLinkTypes];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v27 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v6);
        }
        if ((int)[*(id *)(*((void *)&v17 + 1) + 8 * i) intValue] == a3)
        {
          LOBYTE(v7) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v27 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  os_unfair_lock_unlock(p_lock);
  uint64_t v10 = (void *)MEMORY[0x230FBD990]();
  uint64_t v11 = self;
  id v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = HMFGetLogIdentifier();
    char v14 = HAPLinkTypeDescription();
    id v15 = HMFBooleanToString();
    *(_DWORD *)buf = 138543874;
    id v22 = v13;
    __int16 v23 = 2112;
    char v24 = v14;
    __int16 v25 = 2112;
    id v26 = v15;
    _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@LinkType %@ browseable %@", buf, 0x20u);
  }
  return v7;
}

- (void)accessoryServerBrowser:(id)a3 removeCacheForAccessoryWithIdentifier:(id)a4
{
}

- (void)accessoryServerBrowser:(id)a3 getCacheForAccessoryWithIdentifier:(id)a4 withCompletion:(id)a5
{
  id v7 = a5;
  id v8 = +[HMDHomeManager getAccessoryCacheForIdentifier:a4];
  (*((void (**)(id, id))a5 + 2))(v7, v8);
}

- (void)accessoryServerBrowser:(id)a3 saveCache:(id)a4 serverIdentifier:(id)a5
{
  if (a5) {
    +[HMDHomeManager saveAccessoryCache:a4 forIdentifier:a5];
  }
}

- (void)_notifyDelegateOfReachabilityChangeChange:(BOOL)a3 forBTLEAccessories:(id)a4
{
  BOOL v4 = a3;
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = [(HMDAccessoryBrowser *)self pairedAccessoryInformationWithIdentifier:v6];
  id v8 = [v7 delegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v9 = (void *)MEMORY[0x230FBD990]();
    uint64_t v10 = self;
    uint64_t v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      id v12 = HMFGetLogIdentifier();
      uint64_t v13 = HMFBooleanToString();
      int v14 = 138544130;
      id v15 = v12;
      __int16 v16 = 2112;
      long long v17 = v8;
      __int16 v18 = 2112;
      long long v19 = v13;
      __int16 v20 = 2112;
      id v21 = v6;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Notifying '%@' that reachability has changed to %@ for BTLE accessories %@", (uint8_t *)&v14, 0x2Au);
    }
    [v8 accessoryBrowser:v10 didUpdateReachability:v4 forBTLEAccessoriesWithServerIdentifier:v6];
  }
}

- (void)accessoryServerBrowser:(id)a3 didChangeReachability:(BOOL)a4 forAccessoryServerWithIdentifier:(id)a5
{
}

- (void)accessoryServerBrowser:(id)a3 didFailToDiscoverAccessoryServerWithIdentifier:(id)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDAccessoryBrowser *)self workQueue];
  dispatch_assert_queue_V2(v8);

  if ([v6 linkType] == 2)
  {
    uint64_t v9 = (void *)MEMORY[0x230FBD990]();
    uint64_t v10 = self;
    uint64_t v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v12 = HMFGetLogIdentifier();
      int v31 = 138543618;
      id v32 = v12;
      __int16 v33 = 2112;
      id v34 = v7;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Removing BLE Accessory: %@ from discovering list", (uint8_t *)&v31, 0x16u);
    }
    uint64_t v13 = [(HMDAccessoryBrowser *)v10 discoveringBLEAccessoryServerIdentifiers];
    [v13 removeObject:v7];
    goto LABEL_5;
  }
  if ([v6 linkType] == 1)
  {
    int v14 = [(HMDAccessoryBrowser *)self ipAccessoryServerBrowser];
    if ([v6 isEqual:v14])
    {
      id v15 = [(HMDAccessoryBrowser *)self hap2AccessoryServerBrowser];

      if (v15)
      {
        __int16 v16 = (void *)MEMORY[0x230FBD990]();
        long long v17 = self;
        __int16 v18 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          long long v19 = HMFGetLogIdentifier();
          int v31 = 138543618;
          id v32 = v19;
          __int16 v33 = 2112;
          id v34 = v7;
          _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_INFO, "%{public}@IP Browser couldn't find Server with Identifier %@. Giving HAP2 a chance...", (uint8_t *)&v31, 0x16u);
        }
        __int16 v20 = [(HMDAccessoryBrowser *)v17 hap2AccessoryServerBrowser];
LABEL_19:
        id v26 = v20;
        [v20 discoverAccessoryServerWithIdentifier:v7];
        goto LABEL_25;
      }
    }
    else
    {
    }
  }
  if ([v6 linkType] == 1)
  {
    uint64_t v13 = [(HMDAccessoryBrowser *)self hap2AccessoryServerBrowser];
    if (([v6 isEqual:v13] & 1) == 0)
    {
LABEL_5:

      goto LABEL_20;
    }
    id v21 = [(HMDAccessoryBrowser *)self chipAccessoryServerBrowser];

    if (v21)
    {
      uint64_t v22 = (void *)MEMORY[0x230FBD990]();
      __int16 v23 = self;
      char v24 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        __int16 v25 = HMFGetLogIdentifier();
        int v31 = 138543618;
        id v32 = v25;
        __int16 v33 = 2112;
        id v34 = v7;
        _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_INFO, "%{public}@HAP2 Browser couldn't find Server with Identifier %@. Maybe it's a CHIP accessory, checking...", (uint8_t *)&v31, 0x16u);
      }
      __int16 v20 = [(HMDAccessoryBrowser *)v23 chipAccessoryServerBrowser];
      goto LABEL_19;
    }
  }
LABEL_20:
  long long v27 = [(HMDAccessoryBrowser *)self _tombstonedAccessoryServerWithServerIdentifier:v7];
  uint64_t v28 = v27;
  if (v27 && (uint64_t v29 = [v27 linkType], v29 == objc_msgSend(v6, "linkType"))) {
    uint64_t v30 = 53;
  }
  else {
    uint64_t v30 = 4;
  }
  id v26 = [MEMORY[0x263F087E8] hmErrorWithCode:v30];
  -[HMDAccessoryBrowser _notifyDelegateOfDiscoveryFailure:accessoryServer:linkType:](self, "_notifyDelegateOfDiscoveryFailure:accessoryServer:linkType:", v26, v7, [v6 linkType]);

LABEL_25:
}

- (void)_notifyDelegateOfDiscoveryFailure:(id)a3 accessoryServer:(id)a4 linkType:(int64_t)a5
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [(HMDAccessoryBrowser *)self workQueue];
  dispatch_assert_queue_V2(v10);

  uint64_t v11 = [(HMDAccessoryBrowser *)self _pairingInformationForAccessoryIdentifier:v9];
  id v12 = [v11 pairingActivity];

  if (v12)
  {
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __82__HMDAccessoryBrowser__notifyDelegateOfDiscoveryFailure_accessoryServer_linkType___block_invoke;
    v27[3] = &unk_264A2F820;
    id v28 = v12;
    id v29 = v8;
    __82__HMDAccessoryBrowser__notifyDelegateOfDiscoveryFailure_accessoryServer_linkType___block_invoke((uint64_t)v27);
  }
  uint64_t v13 = [(HMDAccessoryBrowser *)self pairedAccessoryInformationWithIdentifier:v9];
  int v14 = v13;
  if (v13)
  {
    id v15 = [v13 delegate];
    if (objc_opt_respondsToSelector())
    {
      __int16 v16 = (void *)MEMORY[0x230FBD990]();
      long long v17 = self;
      __int16 v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        long long v19 = HMFGetLogIdentifier();
        id v26 = v16;
        if ((unint64_t)a5 > 2) {
          __int16 v20 = @"Undefined";
        }
        else {
          __int16 v20 = off_264A1CE08[a5];
        }
        __int16 v25 = v20;
        *(_DWORD *)buf = 138544130;
        int v31 = v19;
        __int16 v32 = 2112;
        id v33 = v15;
        __int16 v34 = 2112;
        id v35 = v9;
        __int16 v36 = 2112;
        id v37 = v25;
        _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_INFO, "%{public}@Notifying '%@' that accessory server discovery failed %@ over %@", buf, 0x2Au);

        __int16 v16 = v26;
      }

      [v15 accessoryBrowser:v17 discoveryFailedWithError:v8 accessoryServer:v9 linkType:a5];
    }
  }
  else
  {
    id v21 = (void *)MEMORY[0x230FBD990]();
    uint64_t v22 = self;
    __int16 v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      char v24 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      int v31 = v24;
      __int16 v32 = 2112;
      id v33 = v9;
      _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_INFO, "%{public}@Not notifying of discovery failure for %@ because no paired accessory information exists", buf, 0x16u);
    }
  }
}

void __82__HMDAccessoryBrowser__notifyDelegateOfDiscoveryFailure_accessoryServer_linkType___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  if (v1)
  {
    uint64_t v3 = *(void **)(a1 + 40);
    id v4 = v1;
    [v3 domain];

    [*(id *)(a1 + 40) code];
  }
}

- (void)accessoryServerBrowser:(id)a3 didStopDiscoveringWithError:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v8 = [(HMDAccessoryBrowser *)self discoveredAccessoryServerIdentifiers];
  id v9 = (void *)[v8 copy];

  uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v30 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        id v15 = [(HMDAccessoryBrowser *)self pairedAccessoryInformationWithIdentifier:v14];
        if (!v15) {
          [(HMDAccessoryBrowser *)self _removeDiscoveredAccessoryServerIdentifier:v14];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v30 count:16];
    }
    while (v11);
  }

  if (v7)
  {
    __int16 v16 = (void *)MEMORY[0x230FBD990]();
    long long v17 = self;
    __int16 v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      long long v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      __int16 v25 = v19;
      __int16 v26 = 2112;
      id v27 = v6;
      __int16 v28 = 2112;
      id v29 = v7;
      _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_ERROR, "%{public}@Failed to stop discovering accessories for server browser %@ with error %@", buf, 0x20u);
    }
  }
}

- (void)accessoryServerBrowser:(id)a3 didStartDiscoveringWithError:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = (void *)MEMORY[0x230FBD990]();
    id v9 = self;
    uint64_t v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      int v12 = 138543874;
      uint64_t v13 = v11;
      __int16 v14 = 2112;
      id v15 = v6;
      __int16 v16 = 2112;
      id v17 = v7;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to start discovering accessories for server browser %@ with error %@", (uint8_t *)&v12, 0x20u);
    }
  }
}

- (void)_accessoryServerBrowser:(id)a3 didRemoveAccessoryServer:(id)a4 error:(id)a5 matterPairingEndContext:(id)a6
{
  uint64_t v71 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  __int16 v14 = [(HMDAccessoryBrowser *)self workQueue];
  dispatch_assert_queue_V2(v14);

  id v15 = [v11 identifier];
  [(HMDAccessoryBrowser *)self _removeDiscoveredAccessoryServerIdentifier:v15];

  if ([v10 linkType] == 2)
  {
    __int16 v16 = [(HMDAccessoryBrowser *)self discoveringBLEAccessoryServerIdentifiers];
    id v17 = [v11 identifier];
    [v16 removeObject:v17];
  }
  uint64_t v18 = [(HMDAccessoryBrowser *)self unpairedAccessoryForServer:v11];
  if (!v18)
  {
    if (![v11 isPaired]) {
      goto LABEL_28;
    }
    goto LABEL_27;
  }
  id v19 = v11;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (v19 && (isKindOfClass & 1) != 0)
  {
    id v21 = v12;
    id v58 = v10;
    long long v22 = (void *)MEMORY[0x230FBD990]();
    long long v23 = self;
    char v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      __int16 v25 = v56 = v13;
      __int16 v26 = [v18 name];
      [v18 identifier];
      id v27 = v54 = v22;
      *(_DWORD *)buf = 138544386;
      id v62 = v25;
      __int16 v63 = 2112;
      v64 = v26;
      __int16 v65 = 2112;
      uint64_t v66 = v27;
      __int16 v67 = 2112;
      id v68 = v21;
      __int16 v69 = 2112;
      id v70 = v56;
      _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_INFO, "%{public}@Removing unpaired accessory server %@/%@ error %@ context %@", buf, 0x34u);

      long long v22 = v54;
      id v13 = v56;
    }

    id v10 = v58;
    id v12 = v21;
  }
  [v18 removeAccessoryServer:v19];
  __int16 v28 = [(HMDAccessoryBrowser *)self _pairingInformationForUnpairedAccessory:v18];
  id v29 = v28;
  if (!v28)
  {
    __int16 v36 = [v18 accessoryServers];
    uint64_t v37 = [v36 count];

    if (!v37)
    {
      id v55 = v12;
      id v59 = v10;
      uint64_t v38 = (void *)MEMORY[0x230FBD990]();
      id v39 = self;
      long long v40 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        long long v41 = v53 = v38;
        long long v42 = [v19 name];
        [v19 identifier];
        v43 = id v57 = v13;
        *(_DWORD *)buf = 138543874;
        id v62 = v41;
        __int16 v63 = 2112;
        v64 = v42;
        __int16 v65 = 2112;
        uint64_t v66 = v43;
        _os_log_impl(&dword_22F52A000, v40, OS_LOG_TYPE_INFO, "%{public}@Removing unpaired accessory server %@ (%@)", buf, 0x20u);

        id v13 = v57;
        uint64_t v38 = v53;
      }

      [(HMDAccessoryBrowser *)v39 removeUnpairedHAPAccessory:v18];
      id v10 = v59;
      id v12 = v55;
    }
LABEL_26:

    if ([v19 isPaired]) {
      goto LABEL_27;
    }
    goto LABEL_28;
  }
  uint64_t v30 = [v28 setupID];

  if (v30)
  {
    id v31 = v10;
    id v32 = v12;
    id v33 = v12;
    __int16 v34 = v33;
    if (v33 && ([v33 isHMError] & 1) == 0)
    {
      uint64_t v35 = mapHAPPairingErrorToHMError(v34);
    }
    else
    {
      uint64_t v35 = [MEMORY[0x263F087E8] hmErrorWithCode:79];
    }
    id v52 = (void *)v35;

    [(HMDAccessoryBrowser *)self _cancelPairingWithAccessory:v18 error:v52 context:v13];
    id v10 = v31;
    id v12 = v32;
    goto LABEL_26;
  }

  if ([v19 isPaired])
  {
LABEL_27:
    [(HMDAccessoryBrowser *)self _notifyDelegateOfRemovedAccessoryServer:v11 error:v12];
    goto LABEL_28;
  }
  [(HMDAccessoryBrowser *)self _stopReconfirmTimer:v18];
  long long v44 = (void *)MEMORY[0x230FBD990]([(HMDAccessoryBrowser *)self accessoryServer:v19 updatePairingProgress:9]);
  long long v45 = self;
  __int16 v46 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v47 = uint64_t v60 = v44;
    uint64_t v48 = [v18 name];
    [v18 identifier];
    v50 = id v49 = v13;
    *(_DWORD *)buf = 138543874;
    id v62 = v47;
    __int16 v63 = 2112;
    v64 = v48;
    __int16 v65 = 2112;
    uint64_t v66 = v50;
    _os_log_impl(&dword_22F52A000, v46, OS_LOG_TYPE_INFO, "%{public}@Lost the accessory before setup code was scanned - likely unplugged: %@/%@", buf, 0x20u);

    id v13 = v49;
    long long v44 = v60;
  }

  id v51 = [MEMORY[0x263F087E8] hmPrivateErrorWithCode:2015];
  [(HMDAccessoryBrowser *)v45 _handlePairingInterruptedTimeout:v18 error:v51];

LABEL_28:
}

- (void)accessoryServerBrowser:(id)a3 didRemoveAccessoryServer:(id)a4 error:(id)a5
{
}

- (void)_addReconfirmTimer:(id)a3 accessoryServer:(id)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDAccessoryBrowser *)self workQueue];
  dispatch_assert_queue_V2(v8);

  id v9 = [(HMDAccessoryBrowser *)self _pairingInformationForUnpairedAccessory:v6];
  id v10 = v9;
  if (!v9)
  {
    id v12 = (void *)MEMORY[0x230FBD990]();
    id v13 = self;
    __int16 v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      id v15 = HMFGetLogIdentifier();
      __int16 v16 = [v6 name];
      id v17 = [v6 identifier];
      int v28 = 138543874;
      id v29 = v15;
      __int16 v30 = 2112;
      id v31 = v16;
      __int16 v32 = 2112;
      id v33 = v17;
      uint64_t v18 = "%{public}@Not starting a reconfirm timer for unpaired accessory %@/%@ - pairing information does not exist";
      goto LABEL_7;
    }
LABEL_8:

    goto LABEL_12;
  }
  id v11 = [v9 reconfirmTimer];

  if (v11)
  {
    id v12 = (void *)MEMORY[0x230FBD990]();
    id v13 = self;
    __int16 v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      id v15 = HMFGetLogIdentifier();
      __int16 v16 = [v6 name];
      id v17 = [v6 identifier];
      int v28 = 138543874;
      id v29 = v15;
      __int16 v30 = 2112;
      id v31 = v16;
      __int16 v32 = 2112;
      id v33 = v17;
      uint64_t v18 = "%{public}@WAC/Bonjour reconfirm timer exists for unpaired accessory %@/%@ - skipping";
LABEL_7:
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, v18, (uint8_t *)&v28, 0x20u);

      goto LABEL_8;
    }
    goto LABEL_8;
  }
  id v19 = (void *)MEMORY[0x230FBD990]([v7 reconfirm]);
  long long v20 = self;
  id v21 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    long long v22 = HMFGetLogIdentifier();
    long long v23 = [v6 name];
    char v24 = [v6 identifier];
    int v28 = 138543874;
    id v29 = v22;
    __int16 v30 = 2112;
    id v31 = v23;
    __int16 v32 = 2112;
    id v33 = v24;
    _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_INFO, "%{public}@Starting a WAC/Bonjour reconfirm timer for unpaired accessory %@/%@", (uint8_t *)&v28, 0x20u);
  }
  id v25 = objc_alloc(MEMORY[0x263F42658]);
  __int16 v26 = (void *)[v25 initWithTimeInterval:0 options:*(double *)&pairingReconfirmWaitPeriod];
  [v10 setReconfirmTimer:v26];
  [v26 setDelegate:v20];
  id v27 = [(HMDAccessoryBrowser *)v20 workQueue];
  [v26 setDelegateQueue:v27];

  [v26 resume];
LABEL_12:
}

- (void)_startPairingInterruptionTimer:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDAccessoryBrowser *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(HMDAccessoryBrowser *)self _pairingInformationForUnpairedAccessory:v4];
  id v7 = v6;
  if (v6)
  {
    id v8 = [v6 pairingInterruptionTimer];

    if (!v8)
    {
      id v16 = objc_alloc(MEMORY[0x263F42658]);
      id v17 = (void *)[v16 initWithTimeInterval:0 options:*(double *)&pairingInterruptionGracePeriod];
      [v7 setPairingInterruptionTimer:v17];
      [v17 setDelegate:self];
      uint64_t v18 = [(HMDAccessoryBrowser *)self workQueue];
      [v17 setDelegateQueue:v18];

      [v17 resume];
      goto LABEL_10;
    }
    id v9 = (void *)MEMORY[0x230FBD990]();
    id v10 = self;
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v12 = HMFGetLogIdentifier();
      id v13 = [v4 name];
      __int16 v14 = [v4 identifier];
      int v19 = 138543874;
      long long v20 = v12;
      __int16 v21 = 2112;
      long long v22 = v13;
      __int16 v23 = 2112;
      char v24 = v14;
      id v15 = "%{public}@Pairing interrupted timer exists for unpaired accessory %@/%@ - skipping";
LABEL_7:
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, v15, (uint8_t *)&v19, 0x20u);
    }
  }
  else
  {
    id v9 = (void *)MEMORY[0x230FBD990]();
    id v10 = self;
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v12 = HMFGetLogIdentifier();
      id v13 = [v4 name];
      __int16 v14 = [v4 identifier];
      int v19 = 138543874;
      long long v20 = v12;
      __int16 v21 = 2112;
      long long v22 = v13;
      __int16 v23 = 2112;
      char v24 = v14;
      id v15 = "%{public}@Not starting a pairing interrupted timer for unpaired accessory %@/%@ - pairing information does not exist";
      goto LABEL_7;
    }
  }

LABEL_10:
}

- (void)_stopReconfirmTimer:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDAccessoryBrowser *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(HMDAccessoryBrowser *)self _pairingInformationForUnpairedAccessory:v4];
  id v7 = [v6 reconfirmTimer];

  if (v7)
  {
    id v8 = (void *)MEMORY[0x230FBD990]();
    id v9 = self;
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v11 = HMFGetLogIdentifier();
      id v12 = [v4 name];
      id v13 = [v4 identifier];
      int v15 = 138543874;
      id v16 = v11;
      __int16 v17 = 2112;
      uint64_t v18 = v12;
      __int16 v19 = 2112;
      long long v20 = v13;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Canceling reconfirm timer for unpaired accessory %@/%@", (uint8_t *)&v15, 0x20u);
    }
    __int16 v14 = [v6 reconfirmTimer];
    [v14 suspend];

    [v6 setReconfirmTimer:0];
  }
}

- (void)_handlePairingInterruptedTimeout:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = +[HMDUIDialogPresenter sharedUIDialogPresenter];
  id v9 = [(HMDAccessoryBrowser *)self workQueue];
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  id v16 = __62__HMDAccessoryBrowser__handlePairingInterruptedTimeout_error___block_invoke;
  __int16 v17 = &unk_264A2B5D8;
  objc_copyWeak(&v20, &location);
  id v10 = v6;
  id v18 = v10;
  id v11 = v7;
  id v19 = v11;
  [v8 dismissPendingDialogWithContext:v10 queue:v9 completionHandler:&v14];

  id v12 = objc_msgSend(v10, "accessoryServers", v14, v15, v16, v17);
  uint64_t v13 = [v12 count];

  if (!v13) {
    [(HMDAccessoryBrowser *)self removeUnpairedHAPAccessory:v10];
  }

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

void __62__HMDAccessoryBrowser__handlePairingInterruptedTimeout_error___block_invoke(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained workQueue];
    dispatch_assert_queue_V2(v4);

    if ([*(id *)(a1 + 32) supportsCHIP])
    {
      id v5 = +[HMDMatterAccessoryPairingEndContext hmdContextWithCancelledError:*(void *)(a1 + 40)];
      id v6 = (void *)MEMORY[0x230FBD990]();
      id v7 = v3;
      id v8 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        id v9 = HMFGetLogIdentifier();
        id v10 = [*(id *)(a1 + 32) name];
        id v11 = [*(id *)(a1 + 32) identifier];
        uint64_t v12 = *(void *)(a1 + 40);
        int v23 = 138544386;
        char v24 = v9;
        __int16 v25 = 2112;
        __int16 v26 = v10;
        __int16 v27 = 2112;
        int v28 = v11;
        __int16 v29 = 2112;
        uint64_t v30 = v12;
        __int16 v31 = 2112;
        __int16 v32 = v5;
        _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Indicating addAccessory failure for matter accessory %@(%@) with error %@ context %@", (uint8_t *)&v23, 0x34u);
      }
    }
    else
    {
      id v6 = (void *)MEMORY[0x230FBD990]();
      id v13 = v3;
      id v8 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        uint64_t v14 = HMFGetLogIdentifier();
        uint64_t v15 = [*(id *)(a1 + 32) name];
        id v16 = [*(id *)(a1 + 32) identifier];
        uint64_t v17 = *(void *)(a1 + 40);
        int v23 = 138544130;
        char v24 = v14;
        __int16 v25 = 2112;
        __int16 v26 = v15;
        __int16 v27 = 2112;
        int v28 = v16;
        __int16 v29 = 2112;
        uint64_t v30 = v17;
        _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Indicating addAccessory failure for accessory %@(%@) with error %@", (uint8_t *)&v23, 0x2Au);
      }
      id v5 = 0;
    }

    [v3 _cancelPairingWithAccessory:*(void *)(a1 + 32) error:*(void *)(a1 + 40) context:v5];
    id v18 = [v3 _pairingInformationForUnpairedAccessory:*(void *)(a1 + 32)];
    if (v18)
    {
      id v19 = [v3 currentlyPairingAccessories];
      [v19 removeObject:v18];
    }
    id v20 = [*(id *)(a1 + 32) uuid];
    uint64_t v21 = [v3 _progressHandlerForUnpairedAccessory:v20];

    if (v21)
    {
      long long v22 = [v3 currentlyPairingProgressHandlers];
      [v22 removeObject:v21];
    }
  }
}

- (void)_notifyDelegateOfRemovedAccessoryServer:(id)a3 error:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 identifier];
  id v9 = [(HMDAccessoryBrowser *)self pairedAccessoryInformationWithIdentifier:v8];

  id v10 = [v9 delegate];
  if (objc_opt_respondsToSelector())
  {
    id v11 = (void *)MEMORY[0x230FBD990]();
    uint64_t v12 = self;
    id v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      uint64_t v14 = HMFGetLogIdentifier();
      int v15 = 138544130;
      id v16 = v14;
      __int16 v17 = 2112;
      id v18 = v10;
      __int16 v19 = 2112;
      id v20 = v6;
      __int16 v21 = 2112;
      id v22 = v7;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Notifying '%@' that a paired accessory server %@ was removed with error: %@", (uint8_t *)&v15, 0x2Au);
    }
    [v10 accessoryBrowser:v12 didRemoveAccessoryServer:v6 error:v7];
  }
}

- (void)accessoryServerBrowser:(id)a3 didFinishWACForAccessoryWithIdentifier:(id)a4 error:(id)a5
{
  id v10 = a4;
  id v7 = a5;
  id v8 = [(HMDAccessoryBrowser *)self identifierOfAccessoryBeingReprovisioned];
  int v9 = [v8 isEqual:v10];

  if (v9)
  {
    [(HMDAccessoryBrowser *)self setIdentifierOfAccessoryBeingReprovisioned:0];
    [(HMDAccessoryBrowser *)self _notifyDelegateOfWACCompletionForAccessoryServerWithIdentifier:v10 error:v7];
  }
}

- (void)_notifyDelegateOfAccessoryServerNeedingReprovisioning:(id)a3 error:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 identifier];
  int v9 = [(HMDAccessoryBrowser *)self pairedAccessoryInformationWithIdentifier:v8];

  id v10 = [v9 delegate];
  if (objc_opt_respondsToSelector())
  {
    id v11 = (void *)MEMORY[0x230FBD990]();
    uint64_t v12 = self;
    id v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      uint64_t v14 = HMFGetLogIdentifier();
      int v15 = 138544130;
      id v16 = v14;
      __int16 v17 = 2112;
      id v18 = v10;
      __int16 v19 = 2112;
      id v20 = v6;
      __int16 v21 = 2112;
      id v22 = v7;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Notifying '%@'' that a paired accessory server %@ needs reprovisioning with error: %@", (uint8_t *)&v15, 0x2Au);
    }
    [v10 accessoryBrowser:v12 didFindAccessoryServerNeedingReprovisioning:v6 error:v7];
  }
}

- (void)accessoryServerBrowser:(id)a3 didFindAccessoryServerNeedingReprovisioning:(id)a4 error:(id)a5
{
}

- (void)_notifyDelegateOfWACCompletionForAccessoryServerWithIdentifier:(id)a3 error:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDAccessoryBrowser *)self pairedAccessoryInformationWithIdentifier:v6];
  int v9 = [v8 delegate];
  if (objc_opt_respondsToSelector())
  {
    id v10 = (void *)MEMORY[0x230FBD990]();
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = HMFGetLogIdentifier();
      int v13 = 138544130;
      uint64_t v14 = v12;
      __int16 v15 = 2112;
      id v16 = v9;
      __int16 v17 = 2112;
      id v18 = v6;
      __int16 v19 = 2112;
      id v20 = v7;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@[Accessory Browser] Notifying '%@' on provision complete for accessory: %@ with error: %@", (uint8_t *)&v13, 0x2Au);
    }
    [v9 accessoryBrowser:self didFinishWACForAccessoryWithIdentifier:v6 error:v7];
  }
}

- (void)accessoryServerBrowser:(id)a3 didFindAccessoryServerForReprovisioning:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDAccessoryBrowser *)self workQueue];
  dispatch_assert_queue_V2(v8);

  int v9 = [v7 identifier];
  id v10 = (void *)MEMORY[0x230FBD990]();
  id v11 = self;
  uint64_t v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    int v13 = HMFGetLogIdentifier();
    uint64_t v14 = [(HMDAccessoryBrowser *)v11 identifierOfAccessoryBeingReprovisioned];
    int v24 = 138543874;
    __int16 v25 = v13;
    __int16 v26 = 2112;
    __int16 v27 = v14;
    __int16 v28 = 2112;
    id v29 = v7;
    _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_DEBUG, "%{public}@Currently reprovisioning:%@,  Found accessory server: %@ for reprovisioning", (uint8_t *)&v24, 0x20u);
  }
  __int16 v15 = [(HMDAccessoryBrowser *)v11 workQueue];
  [v7 setDelegate:v11 queue:v15];

  if ([v7 isPaired])
  {
    id v16 = [(HMDAccessoryBrowser *)v11 identifierOfAccessoryBeingReprovisioned];
    int v17 = [v16 isEqual:v9];

    if (v17)
    {
      id v18 = objc_alloc_init(MEMORY[0x263F35870]);
      __int16 v19 = [(HMDAccessoryBrowser *)v11 wiFiPSKForAccessoryReprovisioning];
      [v18 setPsk:v19];

      id v20 = [(HMDAccessoryBrowser *)v11 countrycodeForAccessoryReprovisioning];
      [v18 setIsoCountryCode:v20];

      id v21 = v7;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v22 = v21;
      }
      else {
        id v22 = 0;
      }
      id v23 = v22;

      [v23 startReprovisioningWithPairingRequest:v18];
    }
  }
}

- (void)accessoryServerBrowser:(id)a3 didFindAccessoryServer:(id)a4 stateChanged:(BOOL)a5 stateNumber:(id)a6
{
  BOOL v7 = a5;
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  int v13 = [(HMDAccessoryBrowser *)self workQueue];
  dispatch_assert_queue_V2(v13);

  uint64_t v14 = [v11 identifier];
  [(HMDAccessoryBrowser *)self _addDiscoveredAccessoryServerIdentifier:v14];
  __int16 v15 = [(HMDAccessoryBrowser *)self workQueue];
  [v11 setDelegate:self queue:v15];

  if (([v11 isKnownToSystemCommissioner] & 1) == 0 && objc_msgSend(v11, "isPaired"))
  {
    [(HMDAccessoryBrowser *)self _checkIfPairingWithPairedAccessoryServer:v11 errorCode:13];
    [(HMDAccessoryBrowser *)self _notifyDelegateOfNewPairedAccessoryServer:v11 stateChanged:v7 stateNumber:v12];
    goto LABEL_14;
  }
  id v16 = +[HMDDeviceCapabilities deviceCapabilities];
  if (([v16 isRemoteGatewayCapable] & 1) != 0 || !objc_msgSend(v11, "hasPairings"))
  {
  }
  else
  {
    char v17 = [v11 isKnownToSystemCommissioner];

    if ((v17 & 1) == 0)
    {
      id v18 = (void *)MEMORY[0x230FBD990]();
      __int16 v19 = self;
      id v20 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        id v21 = HMFGetLogIdentifier();
        int v27 = 138543618;
        __int16 v28 = v21;
        __int16 v29 = 2112;
        id v30 = v11;
        _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_INFO, "%{public}@Ignoring found accessory server %@ that already has pairings", (uint8_t *)&v27, 0x16u);
      }
      [(HMDAccessoryBrowser *)v19 _checkIfPairingWithPairedAccessoryServer:v11 errorCode:11];
      id v22 = [MEMORY[0x263F087E8] hmErrorWithCode:53];
      -[HMDAccessoryBrowser _notifyDelegateOfDiscoveryFailure:accessoryServer:linkType:](v19, "_notifyDelegateOfDiscoveryFailure:accessoryServer:linkType:", v22, v14, [v10 linkType]);

      goto LABEL_14;
    }
  }
  id v23 = (void *)MEMORY[0x230FBD990]();
  int v24 = self;
  __int16 v25 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    __int16 v26 = HMFGetLogIdentifier();
    int v27 = 138543362;
    __int16 v28 = v26;
    _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_INFO, "%{public}@Found unpaired accessory server and notifying delegates", (uint8_t *)&v27, 0xCu);
  }
  [(HMDAccessoryBrowser *)v24 _addUnpairedAccessoryForServer:v11];
LABEL_14:
}

- (void)_checkIfPairingWithPairedAccessoryServer:(id)a3 errorCode:(int64_t)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v6 = a3;
  BOOL v7 = [(HMDAccessoryBrowser *)self workQueue];
  dispatch_assert_queue_V2(v7);

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v8 = [(HMDAccessoryBrowser *)self currentlyPairingAccessories];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v26 objects:v36 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v27;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v27 != v11) {
        objc_enumerationMutation(v8);
      }
      int v13 = *(void **)(*((void *)&v26 + 1) + 8 * v12);
      if ([v13 matchesAccessoryServer:v6]) {
        break;
      }
      if (v10 == ++v12)
      {
        uint64_t v10 = [v8 countByEnumeratingWithState:&v26 objects:v36 count:16];
        if (v10) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v14 = v13;

    if (!v14) {
      goto LABEL_18;
    }
    __int16 v15 = (void *)MEMORY[0x230FBD990]();
    id v16 = self;
    char v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      id v18 = HMFGetLogIdentifier();
      __int16 v19 = [v6 identifier];
      *(_DWORD *)buf = 138543874;
      uint64_t v31 = v18;
      __int16 v32 = 2112;
      uint64_t v33 = v19;
      __int16 v34 = 2112;
      id v35 = v14;
      _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_INFO, "%{public}@Paired Accessory server %@ matches accessory pending to be paired %@ - aborting the operation", buf, 0x20u);
    }
    id v20 = [v6 identifier];
    id v21 = [v14 addAccessoryProgressHandler];
    [(HMDAccessoryBrowser *)v16 updateAlreadyPairingProgressForAccessoryServerIdentifier:v20 progressHandler:v21];

    id v22 = [MEMORY[0x263F087E8] hmErrorWithCode:a4];
    id v23 = v6;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    __int16 v25 = 0;
    if (v23 && (isKindOfClass & 1) != 0)
    {
      __int16 v25 = +[HMDMatterAccessoryPairingEndContext hmdContextWithCancelledError:v22];
    }
    [(HMDAccessoryBrowser *)v16 _removePairingInformation:v14 error:v22 context:v25];
  }
  else
  {
LABEL_9:
    id v14 = v8;
  }

LABEL_18:
}

- (void)_removePairingInformation:(id)a3 error:(id)a4 context:(id)a5
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(HMDAccessoryBrowser *)self workQueue];
  dispatch_assert_queue_V2(v11);

  uint64_t v12 = (void *)MEMORY[0x230FBD990]();
  int v13 = self;
  id v14 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    __int16 v15 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    id v35 = v15;
    __int16 v36 = 2112;
    id v37 = v8;
    __int16 v38 = 2112;
    id v39 = v9;
    _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@Removing current pairing info %@ error %@", buf, 0x20u);
  }
  uint64_t v28 = MEMORY[0x263EF8330];
  uint64_t v29 = 3221225472;
  id v30 = __63__HMDAccessoryBrowser__removePairingInformation_error_context___block_invoke;
  uint64_t v31 = &unk_264A2F820;
  id v16 = v8;
  id v32 = v16;
  id v17 = v9;
  id v33 = v17;
  __63__HMDAccessoryBrowser__removePairingInformation_error_context___block_invoke((uint64_t)&v28);
  id v18 = objc_msgSend(v16, "addAccessoryCompletionHandler", v28, v29, v30, v31);

  if (v18)
  {
    __int16 v19 = [v16 addAccessoryCompletionHandler];
    ((void (**)(void, void, void, void, void, void, id, id))v19)[2](v19, 0, 0, 0, 0, 0, v17, v10);
  }
  else
  {
    id v20 = (void *)MEMORY[0x230FBD990]();
    id v21 = v13;
    id v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      id v23 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v35 = v23;
      _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_INFO, "%{public}@No addAccessory completion handler", buf, 0xCu);
    }
  }
  int v24 = [(HMDAccessoryBrowser *)v13 currentlyPairingAccessories];
  [v24 removeObject:v16];

  __int16 v25 = [v16 accessoryUUID];
  long long v26 = [(HMDAccessoryBrowser *)v13 _progressHandlerForUnpairedAccessory:v25];

  if (v26)
  {
    long long v27 = [(HMDAccessoryBrowser *)v13 currentlyPairingProgressHandlers];
    [v27 removeObject:v26];
  }
}

void __63__HMDAccessoryBrowser__removePairingInformation_error_context___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) pairingActivity];

  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) pairingActivity];
    [*(id *)(a1 + 40) domain];

    [*(id *)(a1 + 40) code];
  }
}

- (void)accessoryServerBrowser:(id)a3 accessoryServer:(id)a4 didUpdateValuesForCharacteristics:(id)a5 stateNumber:(id)a6 broadcast:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = [(HMDAccessoryBrowser *)self unpairedAccessoryForServer:v13];
  id v17 = [v13 identifier];
  [(HMDAccessoryBrowser *)self _addDiscoveredAccessoryServerIdentifier:v17];

  id v18 = [(HMDAccessoryBrowser *)self workQueue];
  [v13 setDelegate:self queue:v18];

  if (!v16)
  {
    __int16 v19 = (void *)MEMORY[0x230FBD990]();
    id v20 = self;
    id v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      id v22 = HMFGetLogIdentifier();
      HMFBooleanToString();
      id v23 = v24 = v19;
      *(_DWORD *)buf = 138544130;
      long long v26 = v22;
      __int16 v27 = 2112;
      id v28 = v14;
      __int16 v29 = 2112;
      id v30 = v15;
      __int16 v31 = 2112;
      id v32 = v23;
      _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_INFO, "%{public}@Notifying delegate of value update for :%@, stateNumber: %@, broadcast:%@", buf, 0x2Au);

      __int16 v19 = v24;
    }

    [(HMDAccessoryBrowser *)v20 _notifyDelegateOfAccessoryServer:v13 didUpdateValuesForCharacteristics:v14 stateNumber:v15 broadcast:v7];
  }
}

- (void)_notifyDelegateOfNewPairedAccessoryServer:(id)a3 stateChanged:(BOOL)a4 stateNumber:(id)a5
{
  BOOL v6 = a4;
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  id v10 = [(HMDAccessoryBrowser *)self workQueue];
  dispatch_assert_queue_V2(v10);

  uint64_t v11 = [v8 identifier];
  id v12 = [(HMDAccessoryBrowser *)self pairedAccessoryInformationWithIdentifier:v11];

  id v13 = [v12 delegate];
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  BOOL v22 = 0;
  BOOL v22 = [(HMDAccessoryBrowser *)self _shouldAccessoryServerBeTombstoned:v8];
  if (v13 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v14 = (void *)MEMORY[0x230FBD990]();
    id v15 = self;
    HMFGetOSLogHandle();
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      id v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      int v24 = v17;
      __int16 v25 = 2112;
      long long v26 = v13;
      __int16 v27 = 2112;
      id v28 = v8;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@Notifying delegate %@ that a paired accessory server was added %@", buf, 0x20u);
    }
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __90__HMDAccessoryBrowser__notifyDelegateOfNewPairedAccessoryServer_stateChanged_stateNumber___block_invoke;
    v18[3] = &unk_264A270D8;
    v18[4] = v15;
    id v20 = v21;
    id v19 = v8;
    [v13 accessoryBrowser:v15 didFindAccessoryServer:v19 stateChanged:v6 stateNumber:v9 completion:v18];
  }
  _Block_object_dispose(v21, 8);
}

void __90__HMDAccessoryBrowser__notifyDelegateOfNewPairedAccessoryServer_stateChanged_stateNumber___block_invoke(uint64_t a1, char a2, char a3)
{
  BOOL v6 = [*(id *)(a1 + 32) workQueue];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __90__HMDAccessoryBrowser__notifyDelegateOfNewPairedAccessoryServer_stateChanged_stateNumber___block_invoke_2;
  v10[3] = &unk_264A270B0;
  BOOL v7 = *(void **)(a1 + 40);
  uint64_t v13 = *(void *)(a1 + 48);
  char v14 = a2;
  id v8 = v7;
  uint64_t v9 = *(void *)(a1 + 32);
  id v11 = v8;
  uint64_t v12 = v9;
  char v15 = a3;
  dispatch_async(v6, v10);
}

void __90__HMDAccessoryBrowser__notifyDelegateOfNewPairedAccessoryServer_stateChanged_stateNumber___block_invoke_2(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)
    || *(unsigned char *)(a1 + 56)
    || (int v2 = [*(id *)(a1 + 32) isPaired],
        v2 == [*(id *)(a1 + 32) hasPairings]))
  {
    if (*(unsigned char *)(a1 + 57))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      BOOL v6 = *(void **)(a1 + 40);
      [v6 _discoverAccessories:v7];
    }
    else
    {
      id v8 = (void *)MEMORY[0x230FBD990]();
      id v9 = *(id *)(a1 + 40);
      id v10 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        id v11 = HMFGetLogIdentifier();
        uint64_t v12 = *(void *)(a1 + 32);
        int v13 = 138543618;
        char v14 = v11;
        __int16 v15 = 2112;
        uint64_t v16 = v12;
        _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Not allowed to discover accessory server: %@", (uint8_t *)&v13, 0x16u);
      }
    }
  }
  else
  {
    uint64_t v4 = *(void *)(a1 + 32);
    id v3 = *(void **)(a1 + 40);
    uint64_t v5 = *(unsigned __int8 *)(a1 + 57);
    [v3 _tombstoneAccessoryServer:v4 forceNotify:v5];
  }
}

- (void)_resurrectAccessoryServer:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(HMDAccessoryBrowser *)self workQueue];
  dispatch_assert_queue_V2(v5);

  if ([(HMDAccessoryBrowser *)self _isAccessoryServerTombstoned:v4])
  {
    BOOL v6 = (void *)MEMORY[0x230FBD990]();
    uint64_t v7 = self;
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = HMFGetLogIdentifier();
      id v10 = [v4 identifier];
      int v12 = 138543618;
      int v13 = v9;
      __int16 v14 = 2112;
      __int16 v15 = v10;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Resurrecting paired accessory server '%@'", (uint8_t *)&v12, 0x16u);
    }
    id v11 = [(HMDAccessoryBrowser *)v7 tombstonedHAPAccessoryServers];
    [v11 removeObject:v4];

    if ([v4 isPaired]) {
      [(HMDAccessoryBrowser *)v7 _discoverAccessories:v4];
    }
  }
}

- (void)_discoverAccessories:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(HMDAccessoryBrowser *)self workQueue];
  dispatch_assert_queue_V2(v5);

  if ([v4 linkType] == 2)
  {
    BOOL v6 = [(HMDAccessoryBrowser *)self discoveringBLEAccessoryServerIdentifiers];
    uint64_t v7 = [v4 identifier];
    char v8 = [v6 containsObject:v7];

    if (v8)
    {
      id v9 = (void *)MEMORY[0x230FBD990]();
      id v10 = self;
      id v11 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        int v12 = HMFGetLogIdentifier();
        int v25 = 138543618;
        long long v26 = v12;
        __int16 v27 = 2112;
        id v28 = v4;
        _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Accessory discovery already in progress for BLE Accessory with server: %@", (uint8_t *)&v25, 0x16u);
      }
    }
    else
    {
      id v13 = v4;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        __int16 v14 = v13;
      }
      else {
        __int16 v14 = 0;
      }
      id v15 = v14;

      uint64_t v16 = [(HMDAccessoryBrowser *)self _requiredCharacteristicsTypesToReadFromBTLEServer:v15];
      uint64_t v17 = (void *)MEMORY[0x230FBD990]();
      id v18 = self;
      id v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        id v20 = HMFGetLogIdentifier();
        id v21 = [v13 shortDescription];
        BOOL v22 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", objc_msgSend(v15, "connectReason"));
        int v25 = 138544130;
        long long v26 = v20;
        __int16 v27 = 2112;
        id v28 = v21;
        __int16 v29 = 2112;
        id v30 = v22;
        __int16 v31 = 2112;
        id v32 = v16;
        _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_INFO, "%{public}@Adding BLE Accessory server: %@ to the discovering list. Connection Reason: %@. Reading characteristic types: %@", (uint8_t *)&v25, 0x2Au);
      }
      id v23 = [(HMDAccessoryBrowser *)v18 discoveringBLEAccessoryServerIdentifiers];
      int v24 = [v13 identifier];
      [v23 addObject:v24];

      [v15 discoverAccessoriesAndReadCharacteristicTypes:v16];
    }
  }
  else
  {
    [v4 discoverAccessories];
  }
}

- (id)_requiredCharacteristicsTypesToReadFromBTLEServer:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HMDAccessoryBrowser *)self workQueue];
  dispatch_assert_queue_V2(v5);

  if (v4)
  {
    uint64_t v6 = [(HMDAccessoryBrowser *)self pairedHMDHAPAccessoryWithAccessoryServer:v4];
    uint64_t v7 = [v4 identifier];
    uint64_t v8 = [(HMDAccessoryBrowser *)self _pairingInformationForAccessoryIdentifier:v7];

    if (v6 | v8)
    {
      id v9 = [MEMORY[0x263EFF9C0] set];
      id v10 = [(id)v6 productData];

      if (!v10) {
        [v9 addObject:@"00000220-0000-1000-8000-0026BB765291"];
      }
      id v11 = [(id)v6 providedName];

      if (!v11) {
        [v9 addObject:*MEMORY[0x263F0C298]];
      }
      int v12 = [(id)v6 model];

      if (!v12) {
        [v9 addObject:*MEMORY[0x263F0C278]];
      }
      id v13 = [(id)v6 manufacturer];

      if (!v13) {
        [v9 addObject:*MEMORY[0x263F0C270]];
      }
      __int16 v14 = [(id)v6 serialNumber];

      if (!v14) {
        [v9 addObject:*MEMORY[0x263F0C3C0]];
      }
      uint64_t v15 = [(id)v6 firmwareVersion];
      if (!v15
        || (uint64_t v16 = (void *)v15,
            uint64_t v17 = [(id)v6 configNumber],
            uint64_t v18 = [v4 configNumber],
            v16,
            v17 != v18))
      {
        [v9 addObject:*MEMORY[0x263F0C190]];
        if ([(id)v6 supportsCHIP]) {
          [v9 addObject:*MEMORY[0x263F354F0]];
        }
      }
      id v19 = [(id)v6 accessoryFlags];

      if (!v19) {
        [v9 addObject:@"000000A6-0000-1000-8000-0026BB765291"];
      }
      if (v8)
      {
        [v9 addObject:@"00000703-0000-1000-8000-0026BB765291"];
        [v9 addObject:@"0000022B-0000-1000-8000-0026BB765291"];
        [v9 addObject:@"00000702-0000-1000-8000-0026BB765291"];
      }
      id v20 = [v9 allObjects];
    }
    else
    {
      id v20 = 0;
    }
  }
  else
  {
    id v20 = 0;
  }

  return v20;
}

- (void)_tombstoneAccessoryServer:(id)a3 forceNotify:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if ([(HMDAccessoryBrowser *)self _isAccessoryServerTombstoned:v6])
  {
    if (!v4) {
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v7 = (void *)MEMORY[0x230FBD990]();
    uint64_t v8 = self;
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v10 = HMFGetLogIdentifier();
      id v11 = [v6 identifier];
      int v14 = 138543618;
      uint64_t v15 = v10;
      __int16 v16 = 2114;
      uint64_t v17 = v11;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Tombstoning paired accessory server '%{public}@'", (uint8_t *)&v14, 0x16u);
    }
    int v12 = [(HMDAccessoryBrowser *)v8 tombstonedHAPAccessoryServers];
    [v12 addObject:v6];
  }
  [(HMDAccessoryBrowser *)self _notifyDelegateOfTombstonedAccessoryServer:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v13 = [(HMDAccessoryBrowser *)self btleAccessoryServerBrowser];
    [v13 disconnectFromBTLEAccessoryServer:v6];
  }
LABEL_9:
}

- (void)_notifyDelegateOfTombstonedAccessoryServer:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 identifier];
  id v6 = [(HMDAccessoryBrowser *)self pairedAccessoryInformationWithIdentifier:v5];

  uint64_t v7 = [v6 delegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v8 = (void *)MEMORY[0x230FBD990]();
    id v9 = self;
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v11 = HMFGetLogIdentifier();
      int v12 = [v6 delegate];
      int v13 = 138543874;
      int v14 = v11;
      __int16 v15 = 2112;
      __int16 v16 = v12;
      __int16 v17 = 2112;
      id v18 = v4;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Notifying '%@' that an accessory server %@ was tombstoned", (uint8_t *)&v13, 0x20u);
    }
    [v7 accessoryBrowser:v9 didTombstoneAccessoryServer:v4];
  }
}

- (BOOL)_shouldAccessoryServerBeTombstoned:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HMDAccessoryBrowser *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(HMDAccessoryBrowser *)self unpairedAccessoryForServer:v4];
  uint64_t v7 = [(HMDAccessoryBrowser *)self _pairingInformationForUnpairedAccessory:v6];
  uint64_t v8 = (void *)v7;
  if (v6 && v7)
  {
    LOBYTE(v9) = 0;
  }
  else
  {
    int v10 = [v4 isPaired];
    int v9 = v10 ^ [v4 hasPairings];
  }

  return v9;
}

- (id)_tombstonedAccessoryServerWithServerIdentifier:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [(HMDAccessoryBrowser *)self tombstonedHAPAccessoryServers];
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
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
        int v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        int v10 = [v9 identifier];
        char v11 = [v10 isEqual:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (BOOL)_isAccessoryServerTombstoned:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HMDAccessoryBrowser *)self tombstonedHAPAccessoryServers];
  char v6 = [v5 containsObject:v4];

  return v6;
}

- (id)messageDestination
{
  id v3 = objc_alloc(MEMORY[0x263F42570]);
  id v4 = [(HMDAccessoryBrowser *)self messageTargetUUID];
  uint64_t v5 = (void *)[v3 initWithTarget:v4];

  return v5;
}

- (void)_sendPairingCompletionStatusForServer:(id)a3 error:(id)a4 matterPairingEndContext:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  long long v14 = +[HMDUIDialogPresenter sharedUIDialogPresenter];
  long long v15 = [(HMDAccessoryBrowser *)self unpairedAccessoryForServer:v10];
  if (v15)
  {
    objc_initWeak(&location, self);
    long long v16 = [(HMDAccessoryBrowser *)self workQueue];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __109__HMDAccessoryBrowser__sendPairingCompletionStatusForServer_error_matterPairingEndContext_completionHandler___block_invoke;
    v19[3] = &unk_264A27088;
    objc_copyWeak(&v25, &location);
    id v24 = v13;
    id v20 = v15;
    id v21 = v10;
    id v22 = v11;
    id v23 = v12;
    [v14 dismissPendingDialogWithContext:v20 queue:v16 completionHandler:v19];

    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }
  else
  {
    __int16 v17 = _Block_copy(v13);
    uint64_t v18 = v17;
    if (v17) {
      (*((void (**)(void *))v17 + 2))(v17);
    }
  }
}

void __109__HMDAccessoryBrowser__sendPairingCompletionStatusForServer_error_matterPairingEndContext_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained workQueue];
    dispatch_assert_queue_V2(v4);

    uint64_t v5 = [v3 _pairingInformationForUnpairedAccessory:*(void *)(a1 + 32)];
    char v6 = [v5 addAccessoryCompletionHandler];
    uint64_t v7 = [v5 setAddAccessoryCompletionHandler:0];
    if (!v6)
    {
      id v22 = (void *)MEMORY[0x230FBD990](v7);
      id v23 = v3;
      id v24 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        id v25 = HMFGetLogIdentifier();
        uint64_t v26 = *(void *)(a1 + 32);
        uint64_t v27 = *(void *)(a1 + 48);
        *(_DWORD *)buf = 138543874;
        id v49 = v25;
        __int16 v50 = 2112;
        uint64_t v51 = v26;
        __int16 v52 = 2112;
        uint64_t v53 = v27;
        _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_INFO, "%{public}@No addAccessory completion handler for %@ - error %@", buf, 0x20u);
      }
      goto LABEL_27;
    }
    id v8 = *(id *)(a1 + 40);
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    id v10 = (void *)MEMORY[0x230FBD990]();
    id v11 = v3;
    id v12 = HMFGetOSLogHandle();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
    if ((isKindOfClass & 1) != 0 && v8)
    {
      if (v13)
      {
        long long v14 = HMFGetLogIdentifier();
        uint64_t v15 = *(void *)(a1 + 48);
        uint64_t v16 = *(void *)(a1 + 56);
        *(_DWORD *)buf = 138543874;
        id v49 = v14;
        __int16 v50 = 2112;
        uint64_t v51 = v15;
        __int16 v52 = 2112;
        uint64_t v53 = v16;
        __int16 v17 = "%{public}@Invoking addAccessory completion handler with error %@ context %@";
        uint64_t v18 = v12;
        uint32_t v19 = 32;
LABEL_15:
        _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_INFO, v17, buf, v19);
      }
    }
    else if (v13)
    {
      long long v14 = HMFGetLogIdentifier();
      uint64_t v28 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138543618;
      id v49 = v14;
      __int16 v50 = 2112;
      uint64_t v51 = v28;
      __int16 v17 = "%{public}@Invoking addAccessory completion handler with error %@";
      uint64_t v18 = v12;
      uint32_t v19 = 22;
      goto LABEL_15;
    }

    uint64_t v29 = [*(id *)(a1 + 32) certificationStatus];
    if (v29) {
      uint64_t v30 = v29;
    }
    else {
      uint64_t v30 = 2;
    }
    id v31 = *(id *)(a1 + 40);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v32 = v31;
    }
    else {
      id v32 = 0;
    }
    id v33 = v32;

    if (v33)
    {
      if ([v33 isCertified]) {
        uint64_t v30 = 2;
      }
      else {
        uint64_t v30 = 1;
      }
    }
    uint64_t v34 = *(void *)(a1 + 40);
    id v35 = [*(id *)(a1 + 32) uuid];
    ((void (**)(void, uint64_t, void *, uint64_t, uint64_t, uint64_t, void, void))v6)[2](v6, v34, v35, v30, [v5 wacAccessory], objc_msgSend(v5, "legacyWAC"), *(void *)(a1 + 48), *(void *)(a1 + 56));

LABEL_27:
    if (*(void *)(a1 + 48) && [*(id *)(a1 + 40) pendingRemovePairing] != 1)
    {
      __int16 v36 = [MEMORY[0x263F35AD0] systemStore];
      id v37 = [*(id *)(a1 + 32) identifier];
      id v47 = 0;
      [v36 removeAccessoryKeyForName:v37 error:&v47];
      id v38 = v47;

      if (v38)
      {
        id v39 = (void *)MEMORY[0x230FBD990]();
        id v40 = v3;
        long long v41 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        {
          long long v42 = HMFGetLogIdentifier();
          uint64_t v43 = *(void *)(a1 + 32);
          uint64_t v44 = *(void *)(a1 + 48);
          *(_DWORD *)buf = 138543874;
          id v49 = v42;
          __int16 v50 = 2112;
          uint64_t v51 = v43;
          __int16 v52 = 2112;
          uint64_t v53 = v44;
          _os_log_impl(&dword_22F52A000, v41, OS_LOG_TYPE_ERROR, "%{public}@Failed to remove keychain entry for accessory %@ - error %@", buf, 0x20u);
        }
      }
    }
    long long v45 = _Block_copy(*(const void **)(a1 + 64));
    __int16 v46 = v45;
    if (v45) {
      (*((void (**)(void *))v45 + 2))(v45);
    }

    goto LABEL_37;
  }
  id v20 = _Block_copy(*(const void **)(a1 + 64));
  id v21 = v20;
  if (v20) {
    (*((void (**)(void *))v20 + 2))(v20);
  }

LABEL_37:
}

- (void)_updatePairingRetryTimerForAccessory:(id)a3 delay:(int64_t)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = [(HMDAccessoryBrowser *)self workQueue];
  dispatch_assert_queue_V2(v7);

  id v8 = [(HMDAccessoryBrowser *)self _pairingInformationForUnpairedAccessory:v6];
  int v9 = v8;
  if (v8)
  {
    id v10 = [v8 pairingRetryTimer];
    if (v10)
    {
      id v11 = v10;
      [v10 suspend];
      [v9 setPairingRetryTimer:0];
    }
    id v12 = (void *)[objc_alloc(MEMORY[0x263F42658]) initWithTimeInterval:0 options:(double)a4];
    [v9 setPairingRetryTimer:v12];
    [v12 setDelegate:self];
    BOOL v13 = [(HMDAccessoryBrowser *)self workQueue];
    [v12 setDelegateQueue:v13];

    [v12 resume];
  }
  else
  {
    long long v14 = (void *)MEMORY[0x230FBD990]();
    uint64_t v15 = self;
    uint64_t v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      __int16 v17 = HMFGetLogIdentifier();
      uint64_t v18 = [v6 name];
      uint32_t v19 = [v6 identifier];
      int v20 = 138543874;
      id v21 = v17;
      __int16 v22 = 2112;
      id v23 = v18;
      __int16 v24 = 2112;
      id v25 = v19;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@Not starting a pairing retry timer for unpaired accessory %@/%@ - pairing information does not exist", (uint8_t *)&v20, 0x20u);
    }
  }
}

- (void)_promptForPairingPasswordForServer:(id)a3 reason:(id)a4
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v30 = a4;
  uint64_t v7 = [(HMDAccessoryBrowser *)self workQueue];
  dispatch_assert_queue_V2(v7);

  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __65__HMDAccessoryBrowser__promptForPairingPasswordForServer_reason___block_invoke;
  aBlock[3] = &unk_264A2B7B0;
  id v8 = v6;
  id v43 = v8;
  int v9 = _Block_copy(aBlock);
  id v10 = [(HMDAccessoryBrowser *)self unpairedAccessoryForServer:v8];
  if (v10)
  {
    id v11 = [(HMDAccessoryBrowser *)self _pairingInformationForUnpairedAccessory:v10];
    id v12 = [v11 setupCodeProviderCompletionHandler];
    if (v12)
    {
      id inited = objc_initWeak(&location, self);
      long long v14 = (void *)MEMORY[0x230FBD990](inited);
      uint64_t v15 = self;
      HMFGetOSLogHandle();
      uint64_t v16 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        __int16 v17 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        long long v45 = v17;
        __int16 v46 = 2112;
        id v47 = v10;
        _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@Invoking setupCode provider for accessory %@", buf, 0x16u);
      }
      v38[0] = MEMORY[0x263EF8330];
      v38[1] = 3221225472;
      v38[2] = __65__HMDAccessoryBrowser__promptForPairingPasswordForServer_reason___block_invoke_516;
      v38[3] = &unk_264A2F820;
      id v18 = v8;
      id v39 = v18;
      id v19 = v30;
      id v40 = v19;
      __65__HMDAccessoryBrowser__promptForPairingPasswordForServer_reason___block_invoke_516((uint64_t)v38);
      v31[0] = MEMORY[0x263EF8330];
      v31[1] = 3221225472;
      v31[2] = __65__HMDAccessoryBrowser__promptForPairingPasswordForServer_reason___block_invoke_2_521;
      v31[3] = &unk_264A27060;
      objc_copyWeak(&v37, &location);
      id v36 = v9;
      id v32 = v19;
      id v33 = v18;
      id v34 = v10;
      id v11 = v11;
      id v35 = v11;
      ((void (**)(void, id, id, void *))v12)[2](v12, v34, v32, v31);

      objc_destroyWeak(&v37);
      objc_destroyWeak(&location);
    }
    else
    {
      __int16 v24 = (void *)MEMORY[0x230FBD990]();
      id v25 = self;
      uint64_t v26 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        uint64_t v27 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        long long v45 = v27;
        __int16 v46 = 2112;
        id v47 = v8;
        _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_INFO, "%{public}@Received request to prompt for pairing password for accessory server %@ but there is no setupCodeProvider", buf, 0x16u);
      }
      uint64_t v28 = [MEMORY[0x263F087E8] hmPrivateErrorWithCode:2002];
      (*((void (**)(void *, id, void *))v9 + 2))(v9, v30, v28);
      [v8 stopPairingWithError:0];
      if ([v10 supportsCHIP])
      {
        uint64_t v29 = +[HMDMatterAccessoryPairingEndContext hmdContextWithStep:2 error:v28];
      }
      else
      {
        uint64_t v29 = 0;
      }
      [(HMDAccessoryBrowser *)v25 _sendPairingCompletionStatusForServer:v8 error:v28 matterPairingEndContext:v29 completionHandler:0];

      id v12 = 0;
    }
  }
  else
  {
    int v20 = (void *)MEMORY[0x230FBD990]();
    id v21 = self;
    __int16 v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      id v23 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      long long v45 = v23;
      __int16 v46 = 2112;
      id v47 = v8;
      _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_INFO, "%{public}@Received request to prompt for pairing password for accessory server %@ that cannot be mapped to an unpaired accessory", buf, 0x16u);
    }
    id v11 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
    if ([0 supportsCHIP])
    {
      id v12 = +[HMDMatterAccessoryPairingEndContext hmdContextWithStep:2 error:v11];
    }
    else
    {
      id v12 = 0;
    }
    [(HMDAccessoryBrowser *)v21 _sendPairingCompletionStatusForServer:v8 error:v11 matterPairingEndContext:v12 completionHandler:0];
    [v8 stopPairingWithError:0];
  }
}

void __65__HMDAccessoryBrowser__promptForPairingPasswordForServer_reason___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [v6 userInfo];
  id v8 = [v7 objectForKeyedSubscript:*MEMORY[0x263F08608]];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int v9 = v8;
  }
  else {
    int v9 = 0;
  }
  id v10 = v9;

  if (!v10) {
    id v8 = v6;
  }
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __65__HMDAccessoryBrowser__promptForPairingPasswordForServer_reason___block_invoke_2;
  v13[3] = &unk_264A2F2F8;
  id v14 = *(id *)(a1 + 32);
  id v15 = v5;
  id v16 = v8;
  id v11 = v8;
  id v12 = v5;
  __65__HMDAccessoryBrowser__promptForPairingPasswordForServer_reason___block_invoke_2((uint64_t)v13);
}

void __65__HMDAccessoryBrowser__promptForPairingPasswordForServer_reason___block_invoke_516(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) pairingActivity];

  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) pairingActivity];
  }
}

void __65__HMDAccessoryBrowser__promptForPairingPasswordForServer_reason___block_invoke_2_521(id *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained(a1 + 9);
  id v11 = WeakRetained;
  if (WeakRetained)
  {
    id v12 = [WeakRetained workQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __65__HMDAccessoryBrowser__promptForPairingPasswordForServer_reason___block_invoke_3;
    block[3] = &unk_264A27038;
    id v22 = a1[8];
    id v14 = a1[4];
    id v15 = v9;
    id v16 = a1[5];
    id v17 = a1[6];
    id v18 = v11;
    id v19 = v7;
    id v20 = a1[7];
    id v21 = v8;
    dispatch_async(v12, block);
  }
}

void __65__HMDAccessoryBrowser__promptForPairingPasswordForServer_reason___block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 96) + 16))();
  if (*(void *)(a1 + 40))
  {
    [*(id *)(a1 + 48) stopPairingWithError:0];
    int v2 = [*(id *)(a1 + 56) supportsCHIP];
    uint64_t v3 = 0;
    if (v2)
    {
      uint64_t v3 = +[HMDMatterAccessoryPairingEndContext hmdContextWithStep:2 error:*(void *)(a1 + 40)];
    }
    id v5 = (id)v3;
    [*(id *)(a1 + 64) _sendPairingCompletionStatusForServer:*(void *)(a1 + 48) error:*(void *)(a1 + 40) matterPairingEndContext:v3 completionHandler:0];
  }
  else
  {
    if (!*(void *)(a1 + 72)) {
      return;
    }
    objc_msgSend(*(id *)(a1 + 80), "setSetupCode:");
    id v4 = *(void **)(a1 + 48);
    _normalizeSetupCode(*(void **)(a1 + 72));
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "tryPairingPassword:onboardingSetupPayloadString:error:");
  }
}

void __65__HMDAccessoryBrowser__promptForPairingPasswordForServer_reason___block_invoke_2(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) pairingActivity];

  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) pairingActivity];
    [*(id *)(a1 + 48) domain];

    [*(id *)(a1 + 48) code];
  }
}

- (void)_pairAccessory:(id)a3 configuration:(id)a4 completionHandler:(id)a5
{
  v126[2] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v103 = a4;
  id aBlock = a5;
  id v9 = [(HMDAccessoryBrowser *)self workQueue];
  dispatch_assert_queue_V2(v9);

  id v10 = (void *)MEMORY[0x230FBD990]();
  id v11 = self;
  id v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    BOOL v13 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v13;
    __int16 v116 = 2112;
    id v117 = v8;
    _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Received request to start pairing accessory %@", buf, 0x16u);
  }
  int64_t v102 = [MEMORY[0x263F424F0] currentActivity];
  id v14 = [(HMDAccessoryBrowser *)v11 identifierOfAccessoryBeingReprovisioned];

  if (!v14)
  {
    v106 = [v8 preferredAccessoryServer];
    if (!v106)
    {
      id v37 = (void *)MEMORY[0x230FBD990]();
      id v38 = v11;
      id v39 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        id v40 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v40;
        __int16 v116 = 2112;
        id v117 = v8;
        _os_log_impl(&dword_22F52A000, v39, OS_LOG_TYPE_ERROR, "%{public}@Could not find a server for unpaired accessory %@", buf, 0x16u);
      }
      v125[0] = *MEMORY[0x263F08320];
      long long v41 = [NSString stringWithFormat:@"Failed to start pairing with the accessory %@", v8];
      v126[0] = v41;
      v125[1] = *MEMORY[0x263F08338];
      long long v42 = [MEMORY[0x263F086E0] mainBundle];
      id v43 = [v42 localizedStringForKey:@"There was no server present for the accessory." value:&stru_26E2EB898 table:0];
      v126[1] = v43;
      id v104 = [NSDictionary dictionaryWithObjects:v126 forKeys:v125 count:2];

      id v19 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F0C710] code:2 userInfo:v104];
      id v25 = +[HMDMatterAccessoryPairingEndContext hmdContextWithStep:2 error:v19];
      uint64_t v44 = [v8 uuid];
      (*((void (**)(id, void, void *, uint64_t, void, void, HMDUnpairedHAPAccessoryPairingInformation *, id))aBlock
       + 2))(aBlock, 0, v44, [v8 certificationStatus], 0, 0, v19, v25);

      goto LABEL_48;
    }
    id v20 = [v8 identifier];
    id v104 = [(HMDAccessoryBrowser *)v11 pairedAccessoryInformationWithIdentifier:v20];

    if (v104 && ([v104 transports] & 0x10) == 0)
    {
      v123[0] = *MEMORY[0x263F08320];
      id v21 = [NSString stringWithFormat:@"Accessory %@ is already associated with a home", v8];
      v123[1] = *MEMORY[0x263F08338];
      v124[0] = v21;
      id v22 = NSString;
      id v23 = [MEMORY[0x263F087E8] hmStringFromErrorCode:15];
      __int16 v24 = [v22 stringWithFormat:@"%ld (%@) This accessory is already part of a home.", 13, v23];
      v124[1] = v24;
      id v19 = [NSDictionary dictionaryWithObjects:v124 forKeys:v123 count:2];

      id v25 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F0C710] code:15 userInfo:v19];
      uint64_t v26 = +[HMDMatterAccessoryPairingEndContext hmdContextWithStep:2 error:v25];
      uint64_t v27 = [v8 uuid];
      (*((void (**)(id, void, void *, uint64_t, void, void, id, void *))aBlock + 2))(aBlock, 0, v27, [v8 certificationStatus], 0, 0, v25, v26);

LABEL_48:
      goto LABEL_49;
    }
    id context = v106;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0) {
      goto LABEL_15;
    }
    if (![(HMDAccessoryBrowser *)v11 _isHomeHubMatterSharedAdminPairingCapableWithConfiguration:v103])
    {
      id v85 = (void *)MEMORY[0x230FBD990]();
      id v86 = v11;
      id v87 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v87, OS_LOG_TYPE_INFO))
      {
        id v88 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = v88;
        _os_log_impl(&dword_22F52A000, v87, OS_LOG_TYPE_INFO, "%{public}@HomeHub is not capable to handle Matter Shared Admin Pairing requests", buf, 0xCu);
      }
      id v19 = [MEMORY[0x263F087E8] hmErrorWithCode:92];
      id v25 = +[HMDMatterAccessoryPairingEndContext hmdContextWithStep:2 error:v19];
      (*((void (**)(id, void, void, void, void, void, HMDUnpairedHAPAccessoryPairingInformation *, id))aBlock
       + 2))(aBlock, 0, 0, 0, 0, 0, v19, v25);
      goto LABEL_48;
    }
    if (isFeatureMatteriPhoneOnlyPairingControlEnabled())
    {
LABEL_15:
      long long v113 = 0u;
      long long v114 = 0u;
      long long v111 = 0u;
      long long v112 = 0u;
      uint64_t v29 = [(HMDAccessoryBrowser *)v11 currentlyPairingAccessories];
      uint64_t v30 = [v29 countByEnumeratingWithState:&v111 objects:v122 count:16];
      if (v30)
      {
        uint64_t v31 = *(void *)v112;
LABEL_17:
        uint64_t v32 = 0;
        while (1)
        {
          if (*(void *)v112 != v31) {
            objc_enumerationMutation(v29);
          }
          id v33 = *(void **)(*((void *)&v111 + 1) + 8 * v32);
          id v34 = [v33 accessoryUUID];
          id v35 = [v8 uuid];
          char v36 = [v34 isEqual:v35];

          if (v36) {
            break;
          }
          if (v30 == ++v32)
          {
            uint64_t v30 = [v29 countByEnumeratingWithState:&v111 objects:v122 count:16];
            if (v30) {
              goto LABEL_17;
            }
            goto LABEL_23;
          }
        }
        id v19 = v33;

        if (!v19) {
          goto LABEL_31;
        }
        long long v45 = (void *)MEMORY[0x230FBD990]();
        __int16 v46 = v11;
        id v47 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
        {
          uint64_t v48 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          *(void *)&uint8_t buf[4] = v48;
          __int16 v116 = 2112;
          id v117 = v8;
          _os_log_impl(&dword_22F52A000, v47, OS_LOG_TYPE_INFO, "%{public}@Accessory %@ is currently being paired", buf, 0x16u);
        }
        v120[0] = *MEMORY[0x263F08320];
        id v49 = [NSString stringWithFormat:@"Failed to start pairing with the accessory %@", v8];
        v120[1] = *MEMORY[0x263F08338];
        v121[0] = v49;
        __int16 v50 = NSString;
        uint64_t v51 = [MEMORY[0x263F087E8] hmStringFromErrorCode:15];
        __int16 v52 = [v50 stringWithFormat:@"%ld (%@) This accessory is already being added to a home.", 15, v51];
        v121[1] = v52;
        id v25 = [NSDictionary dictionaryWithObjects:v121 forKeys:v120 count:2];

        id v53 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F0C710] code:15 userInfo:v25];
        id v54 = +[HMDMatterAccessoryPairingEndContext hmdContextWithStep:2 error:v53];
        id v55 = [v8 uuid];
        (*((void (**)(id, void, void *, uint64_t, void, void, id, id))aBlock + 2))(aBlock, 0, v55, [v8 certificationStatus], 0, 0, v53, v54);
      }
      else
      {
LABEL_23:

LABEL_31:
        id v25 = objc_alloc_init(MEMORY[0x263F35870]);
        id v56 = [(HMDAccessoryBrowser *)v11 currentControllerPairingIdentity];
        [v25 setPairingIdentity:v56];

        [v25 setRequiresUserConsent:1];
        id v57 = [v103 networkCredential];
        id v58 = [v57 wiFiPSK];
        [v25 setPsk:v58];

        id v59 = [v103 isoCountryCode];
        [v25 setIsoCountryCode:v59];

        uint64_t v60 = [v103 chipFabricID];
        [v25 setChipFabricID:v60];

        objc_msgSend(v25, "setOwnerPairing:", -[HMDAccessoryBrowser _isOwnerPairingAccessoryWithConfiguration:](v11, "_isOwnerPairingAccessoryWithConfiguration:", v103));
        id v61 = [HMDUnpairedHAPAccessoryPairingInformation alloc];
        id v62 = [v8 uuid];
        __int16 v63 = [v8 name];
        uint64_t v64 = [context linkType];
        __int16 v65 = [v103 setupCode];
        uint64_t v66 = [v103 setupCodeProvider];
        __int16 v67 = [(HMDUnpairedHAPAccessoryPairingInformation *)v61 initWithAccessoryUUID:v62 accessoryName:v63 linkType:v64 setupCode:v65 completionHandler:aBlock setupCodeProvider:v66 pairingRequest:v25];

        [(HMDUnpairedHAPAccessoryPairingInformation *)v67 setPairingActivity:v102];
        id v68 = [v103 homeUUID];
        [(HMDUnpairedHAPAccessoryPairingInformation *)v67 setHomeUUID:v68];

        id v69 = context;
        objc_opt_class();
        char v70 = objc_opt_isKindOfClass();
        if (v70) {
          uint64_t v71 = v69;
        }
        else {
          uint64_t v71 = 0;
        }
        id v53 = v71;

        if (v70)
        {
          -[HMDUnpairedHAPAccessoryPairingInformation setWacAccessory:](v67, "setWacAccessory:", [v69 isWacAccessory]);
          -[HMDUnpairedHAPAccessoryPairingInformation setLegacyWAC:](v67, "setLegacyWAC:", [v69 isWacLegacy]);
        }
        id v72 = v69;
        objc_opt_class();
        char v73 = objc_opt_isKindOfClass();
        if (v73) {
          id v74 = v72;
        }
        else {
          id v74 = 0;
        }
        id v54 = v74;

        if (v73) {
          [(HMDAccessoryBrowser *)v11 _setupHMMTRAccessoryServer:v72 pairingInfo:v67];
        }
        id v75 = [(HMDAccessoryBrowser *)v11 currentlyPairingAccessories];
        [v75 addObject:v67];

        contexta = (void *)MEMORY[0x230FBD990]();
        id v76 = v11;
        uint64_t v77 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v77, OS_LOG_TYPE_INFO))
        {
          v78 = HMFGetLogIdentifier();
          v79 = [(HMDUnpairedHAPAccessoryPairingInformation *)v67 pairingRequest];
          *(_DWORD *)buf = 138543874;
          *(void *)&uint8_t buf[4] = v78;
          __int16 v116 = 2112;
          id v117 = v8;
          __int16 v118 = 2112;
          v119 = v79;
          _os_log_impl(&dword_22F52A000, v77, OS_LOG_TYPE_INFO, "%{public}@Starting pairing with accessory %@, request: %@", buf, 0x20u);
        }
        v107[0] = MEMORY[0x263EF8330];
        v107[1] = 3221225472;
        v107[2] = __70__HMDAccessoryBrowser__pairAccessory_configuration_completionHandler___block_invoke;
        v107[3] = &unk_264A2F2F8;
        id v80 = v102;
        v81 = v67;
        id v82 = v80;
        id v108 = v80;
        id v19 = v81;
        v109 = v19;
        id v83 = v72;
        id v110 = v83;
        __70__HMDAccessoryBrowser__pairAccessory_configuration_completionHandler___block_invoke(v107);
        [v82 begin];
        *(void *)buf = v82;
        v84 = [(HMDUnpairedHAPAccessoryPairingInformation *)v19 pairingRequest];
        [v83 startPairingWithRequest:v84];

        __HMFActivityScopeLeave();
        id v55 = v108;
      }

      goto LABEL_48;
    }
    if ([(HMDAccessoryBrowser *)v11 _isHomeHubAvailableWithConfiguration:v103])
    {
      if ([(HMDAccessoryBrowser *)v11 _isPrimaryResidentReachableWithConfiguration:v103])
      {
        goto LABEL_15;
      }
      id v89 = (void *)MEMORY[0x230FBD990]();
      id v90 = v11;
      v91 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR))
      {
        id v92 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = v92;
        _os_log_impl(&dword_22F52A000, v91, OS_LOG_TYPE_ERROR, "%{public}@Primary resident is not reachable", buf, 0xCu);
      }
      id v19 = [MEMORY[0x263F087E8] hmPrivateErrorWithCode:2709];
      id v25 = +[HMDMatterAccessoryPairingEndContext hmdContextWithStep:2 error:v19];
      v93 = _Block_copy(aBlock);
      id v94 = v93;
      if (v93) {
        (*((void (**)(void *, void, void, void, void, void, HMDUnpairedHAPAccessoryPairingInformation *, id))v93
      }
         + 2))(v93, 0, 0, 0, 0, 0, v19, v25);
    }
    else
    {
      id v95 = (void *)MEMORY[0x230FBD990]();
      id v96 = v11;
      v97 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR))
      {
        v98 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = v98;
        _os_log_impl(&dword_22F52A000, v97, OS_LOG_TYPE_ERROR, "%{public}@HomeHub is not available", buf, 0xCu);
      }
      id v19 = [MEMORY[0x263F087E8] hmErrorWithCode:91];
      id v25 = +[HMDMatterAccessoryPairingEndContext hmdContextWithStep:2 error:v19];
      v99 = _Block_copy(aBlock);
      id v94 = v99;
      if (v99) {
        (*((void (**)(void *, void, void, void, void, void, HMDUnpairedHAPAccessoryPairingInformation *, id))v99
      }
         + 2))(v99, 0, 0, 0, 0, 0, v19, v25);
    }

    goto LABEL_48;
  }
  id v15 = (void *)MEMORY[0x230FBD990]();
  id v16 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    id v17 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v17;
    __int16 v116 = 2112;
    id v117 = v8;
    _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@[Accessory Browser] Pairing accessory %@ failed since reprovisioning is in progress", buf, 0x16u);
  }
  v106 = [MEMORY[0x263F087E8] hmErrorWithCode:15];
  id v104 = +[HMDMatterAccessoryPairingEndContext hmdContextWithStep:2 error:v106];
  id v18 = (HMDUnpairedHAPAccessoryPairingInformation *)_Block_copy(aBlock);
  id v19 = v18;
  if (v18) {
    ((void (*)(HMDUnpairedHAPAccessoryPairingInformation *, void, void, void, void, void, void *, void *))v18->_linkType)(v18, 0, 0, 0, 0, 0, v106, v104);
  }
LABEL_49:
}

void *__70__HMDAccessoryBrowser__pairAccessory_configuration_completionHandler___block_invoke(void *result)
{
  v1 = (void *)result[4];
  if (v1)
  {
    int v2 = result;
    id v3 = (void *)result[5];
    id v4 = v1;
    [v3 accessoryUUID];

    id v5 = [(id)v2[5] setupID];
    id v6 = (id)HMFBooleanToString();

    [(id)v2[5] wacAccessory];
    id v7 = (id)HMFBooleanToString();
    [(id)v2[5] legacyWAC];
    id v8 = (id)HMFBooleanToString();
    [(id)v2[5] linkType];
    id v9 = (id)HAPLinkTypeDescription();
    [(id)v2[6] communicationProtocol];

    return (id)HAPCommunicationProtocolDescription();
  }
  return result;
}

- (BOOL)_isHomeHubMatterSharedAdminPairingCapableWithConfiguration:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDAccessoryBrowser *)self homeManager];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = objc_msgSend(v5, "homes", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v11 = [v10 uuid];
        id v12 = [v4 homeUUID];
        int v13 = HMFEqualObjects();

        if (v13)
        {
          if ([v10 isOwnerUser])
          {
            LOBYTE(v7) = 1;
          }
          else
          {
            id v14 = [v10 primaryResident];
            id v15 = [v14 capabilities];
            LOBYTE(v7) = [v15 supportsMatterSharedAdminPairing];
          }
          goto LABEL_13;
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  return v7;
}

- (BOOL)_isHomeHubAvailableWithConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDAccessoryBrowser *)self homeManager];
  id v6 = [v5 homes];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __60__HMDAccessoryBrowser__isHomeHubAvailableWithConfiguration___block_invoke;
  v11[3] = &unk_264A2B2D0;
  id v12 = v4;
  id v7 = v4;
  uint64_t v8 = objc_msgSend(v6, "na_firstObjectPassingTest:", v11);

  id v9 = [v8 primaryResident];
  LOBYTE(v5) = v9 != 0;

  return (char)v5;
}

BOOL __60__HMDAccessoryBrowser__isHomeHubAvailableWithConfiguration___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 uuid];
  id v4 = [*(id *)(a1 + 32) homeUUID];
  BOOL v5 = v3 == v4;

  return v5;
}

- (BOOL)_isPrimaryResidentReachableWithConfiguration:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(HMDAccessoryBrowser *)self homeManager];
  id v6 = [v5 homes];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __68__HMDAccessoryBrowser__isPrimaryResidentReachableWithConfiguration___block_invoke;
  v11[3] = &unk_264A2B2D0;
  id v12 = v4;
  id v7 = v4;
  uint64_t v8 = objc_msgSend(v6, "na_firstObjectPassingTest:", v11);

  id v9 = [v8 primaryResident];
  LOBYTE(v6) = [v9 isReachable];

  return (char)v6;
}

BOOL __68__HMDAccessoryBrowser__isPrimaryResidentReachableWithConfiguration___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 uuid];
  id v4 = [*(id *)(a1 + 32) homeUUID];
  BOOL v5 = v3 == v4;

  return v5;
}

- (BOOL)_isOwnerPairingAccessoryWithConfiguration:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [(HMDAccessoryBrowser *)self homeManager];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = objc_msgSend(v5, "homes", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v11 = [v10 uuid];
        id v12 = [v4 homeUUID];
        int v13 = HMFEqualObjects();

        if (v13)
        {
          LOBYTE(v7) = [v10 isOwnerUser];
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

- (void)_pairAccessoryWithDescription:(id)a3 configuration:(id)a4 progressHandler:(id)a5 completionHandler:(id)a6
{
  uint64_t v243 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v188 = a4;
  v189 = (void (**)(id, uint64_t, void *))a5;
  id aBlock = a6;
  id v11 = [(HMDAccessoryBrowser *)self workQueue];
  dispatch_assert_queue_V2(v11);

  v187 = [MEMORY[0x263F424F0] currentActivity];
  id v12 = (void *)MEMORY[0x230FBD990]();
  v191 = self;
  int v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    id v14 = HMFGetLogIdentifier();
    long long v15 = [v10 debugDescription];
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v14;
    *(_WORD *)&unsigned char buf[12] = 2112;
    *(void *)&buf[14] = v15;
    _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Received request to start pairing accessory with description %@", buf, 0x16u);
  }
  long long v16 = [(HMDAccessoryBrowser *)v191 identifierOfAccessoryBeingReprovisioned];

  if (v16)
  {
    long long v17 = (void *)MEMORY[0x230FBD990]();
    long long v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      long long v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v19;
      *(_WORD *)&unsigned char buf[12] = 2112;
      *(void *)&buf[14] = v10;
      _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_INFO, "%{public}@[Accessory Browser] Pairing accessory with description %@ failed since reprovisioning is in progress", buf, 0x16u);
    }
    id v20 = [MEMORY[0x263F087E8] hmErrorWithCode:15];
    v193 = +[HMDMatterAccessoryPairingEndContext hmdContextWithStep:2 error:v20];
    id v21 = _Block_copy(aBlock);
    uint64_t v22 = v21;
    if (v21) {
      (*((void (**)(void *, void, void, void, void, void, id, void *))v21 + 2))(v21, 0, 0, 0, 0, 0, v20, v193);
    }

    goto LABEL_24;
  }
  long long v232 = 0u;
  long long v233 = 0u;
  long long v230 = 0u;
  long long v231 = 0u;
  id v20 = [(HMDAccessoryBrowser *)v191 tombstonedHAPAccessoryServers];
  uint64_t v23 = [v20 countByEnumeratingWithState:&v230 objects:v242 count:16];
  if (v23)
  {
    uint64_t v24 = *(void *)v231;
    while (2)
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v231 != v24) {
          objc_enumerationMutation(v20);
        }
        uint64_t v26 = *(void **)(*((void *)&v230 + 1) + 8 * i);
        if ([v10 matchesAccessoryServer:v26])
        {
          uint64_t v32 = (void *)MEMORY[0x230FBD990]();
          id v33 = v191;
          id v34 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
          {
            id v35 = HMFGetLogIdentifier();
            char v36 = [v10 debugDescription];
            *(_DWORD *)buf = 138543874;
            *(void *)&uint8_t buf[4] = v35;
            *(_WORD *)&unsigned char buf[12] = 2112;
            *(void *)&buf[14] = v26;
            *(_WORD *)&buf[22] = 2112;
            v237 = v36;
            _os_log_impl(&dword_22F52A000, v34, OS_LOG_TYPE_INFO, "%{public}@A tombstoned accessoryServer %@ matches the accessory with description %@", buf, 0x20u);
          }
          id v37 = [v26 identifier];
          [(HMDAccessoryBrowser *)v33 updateAlreadyPairingProgressForAccessoryServerIdentifier:v37 progressHandler:v189];

          v193 = [MEMORY[0x263F087E8] hmErrorWithCode:13];
          id v38 = +[HMDMatterAccessoryPairingEndContext hmdContextWithStep:2 error:v193];
          (*((void (**)(id, void *, void, void, void, void, void *, void *))aBlock + 2))(aBlock, v26, 0, 0, 0, 0, v193, v38);

          goto LABEL_24;
        }
      }
      uint64_t v23 = [v20 countByEnumeratingWithState:&v230 objects:v242 count:16];
      if (v23) {
        continue;
      }
      break;
    }
  }

  if ([v10 isPaired])
  {
    uint64_t v27 = (void *)MEMORY[0x230FBD990]();
    uint64_t v28 = v191;
    uint64_t v29 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      uint64_t v30 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v30;
      _os_log_impl(&dword_22F52A000, v29, OS_LOG_TYPE_INFO, "%{public}@Accessory description indicates that the accessory is already paired - aborting...", buf, 0xCu);
    }
    id v20 = [MEMORY[0x263F087E8] hmErrorWithCode:11];
    v194 = +[HMDMatterAccessoryPairingEndContext hmdContextWithStep:2 error:v20];
    uint64_t v31 = [MEMORY[0x263F087E8] hmErrorWithCode:11];
    (*((void (**)(id, void, void, void, void, void, void *, void *))aBlock + 2))(aBlock, 0, 0, 0, 0, 0, v31, v194);

    goto LABEL_25;
  }
  id v39 = [v10 setupAccessoryPayload];
  id v40 = [v39 chipAccessorySetupPayload];

  if (!v40) {
    goto LABEL_29;
  }
  if ([(HMDAccessoryBrowser *)v191 _isHomeHubMatterSharedAdminPairingCapableWithConfiguration:v188])
  {
    if (isFeatureMatteriPhoneOnlyPairingControlEnabled()) {
      goto LABEL_29;
    }
    if (![(HMDAccessoryBrowser *)v191 _isHomeHubAvailableWithConfiguration:v188])
    {
      v128 = (void *)MEMORY[0x230FBD990]();
      v129 = v191;
      v130 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v130, OS_LOG_TYPE_ERROR))
      {
        v131 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = v131;
        _os_log_impl(&dword_22F52A000, v130, OS_LOG_TYPE_ERROR, "%{public}@HomeHub is not available", buf, 0xCu);
      }
      id v20 = [MEMORY[0x263F087E8] hmErrorWithCode:91];
      v193 = +[HMDMatterAccessoryPairingEndContext hmdContextWithStep:2 error:v20];
      v132 = _Block_copy(aBlock);
      v93 = v132;
      if (v132) {
        (*((void (**)(void *, void, void, void, void, void, id, void *))v132 + 2))(v132, 0, 0, 0, 0, 0, v20, v193);
      }
      goto LABEL_73;
    }
    if (![(HMDAccessoryBrowser *)v191 _isPrimaryResidentReachableWithConfiguration:v188])
    {
      id v88 = (void *)MEMORY[0x230FBD990]();
      id v89 = v191;
      id v90 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v90, OS_LOG_TYPE_ERROR))
      {
        v91 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = v91;
        _os_log_impl(&dword_22F52A000, v90, OS_LOG_TYPE_ERROR, "%{public}@Primary resident is not reachable", buf, 0xCu);
      }
      id v20 = [MEMORY[0x263F087E8] hmPrivateErrorWithCode:2709];
      v193 = +[HMDMatterAccessoryPairingEndContext hmdContextWithStep:2 error:v20];
      id v92 = _Block_copy(aBlock);
      v93 = v92;
      if (v92) {
        (*((void (**)(void *, void, void, void, void, void, id, void *))v92 + 2))(v92, 0, 0, 0, 0, 0, v20, v193);
      }
LABEL_73:

LABEL_24:
      goto LABEL_25;
    }
LABEL_29:
    long long v228 = 0u;
    long long v229 = 0u;
    long long v226 = 0u;
    long long v227 = 0u;
    id obj = [(HMDAccessoryBrowser *)v191 unpairedHAPAccessories];
    uint64_t v41 = [obj countByEnumeratingWithState:&v226 objects:v241 count:16];
    if (v41)
    {
      v193 = 0;
      uint64_t v42 = *(void *)v227;
      while (2)
      {
        for (uint64_t j = 0; j != v41; ++j)
        {
          if (*(void *)v227 != v42) {
            objc_enumerationMutation(obj);
          }
          uint64_t v44 = *(void **)(*((void *)&v226 + 1) + 8 * j);
          long long v222 = 0u;
          long long v223 = 0u;
          long long v224 = 0u;
          long long v225 = 0u;
          long long v45 = [v44 accessoryServers];
          uint64_t v46 = [v45 countByEnumeratingWithState:&v222 objects:v240 count:16];
          if (v46)
          {
            uint64_t v47 = *(void *)v223;
LABEL_36:
            uint64_t v48 = 0;
            while (1)
            {
              if (*(void *)v223 != v47) {
                objc_enumerationMutation(v45);
              }
              id v49 = *(void **)(*((void *)&v222 + 1) + 8 * v48);
              if ([v10 matchesAccessoryServer:v49]) {
                break;
              }
              if (v46 == ++v48)
              {
                uint64_t v46 = [v45 countByEnumeratingWithState:&v222 objects:v240 count:16];
                if (v46) {
                  goto LABEL_36;
                }
                goto LABEL_42;
              }
            }
            id v50 = v44;

            id v20 = v49;
            if (!v20)
            {
              v193 = v50;
              continue;
            }

            uint64_t v51 = (void *)MEMORY[0x230FBD990]();
            __int16 v52 = v191;
            id v53 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
            {
              id v54 = HMFGetLogIdentifier();
              id v55 = [v10 debugDescription];
              *(_DWORD *)buf = 138543874;
              *(void *)&uint8_t buf[4] = v54;
              *(_WORD *)&unsigned char buf[12] = 2112;
              *(void *)&buf[14] = v20;
              *(_WORD *)&buf[22] = 2112;
              v237 = v55;
              _os_log_impl(&dword_22F52A000, v53, OS_LOG_TYPE_INFO, "%{public}@Matched accessoryServer %@ to pair accessory %@", buf, 0x20u);
            }
            if (([v20 isPaired] & 1) != 0 || objc_msgSend(v20, "hasPairings"))
            {
              id v56 = (void *)MEMORY[0x230FBD990]();
              id v57 = v52;
              id v58 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
              {
                id v59 = HMFGetLogIdentifier();
                uint64_t v60 = [v10 debugDescription];
                *(_DWORD *)buf = 138543874;
                *(void *)&uint8_t buf[4] = v59;
                *(_WORD *)&unsigned char buf[12] = 2112;
                *(void *)&buf[14] = v20;
                *(_WORD *)&buf[22] = 2112;
                v237 = v60;
                _os_log_impl(&dword_22F52A000, v58, OS_LOG_TYPE_INFO, "%{public}@Matched accessoryServer %@ is already paired while attempting to pair accessory %@", buf, 0x20u);
              }
              if (!aBlock)
              {

                goto LABEL_25;
              }
              id v61 = [v20 identifier];
              [(HMDAccessoryBrowser *)v57 updateAlreadyPairingProgressForAccessoryServerIdentifier:v61 progressHandler:v189];

              id v62 = [MEMORY[0x263F087E8] hmErrorWithCode:13];
              obja = +[HMDMatterAccessoryPairingEndContext hmdContextWithStep:2 error:v62];
              (*((void (**)(id, id, void, void, void, void, id, HMDUnpairedHAPAccessoryPairingInformation *))aBlock
               + 2))(aBlock, v20, 0, 0, 0, 0, v62, obja);
            }
            else
            {
              v120 = [v20 identifier];
              id v62 = [(HMDAccessoryBrowser *)v52 pairedAccessoryInformationWithIdentifier:v120];

              if (!v62 || ([v62 transports] & 0x10) != 0)
              {
                v133 = [v10 accessoryName];
                BOOL v134 = v133 == 0;

                if (v134)
                {
                  v135 = [v50 name];
                  [v10 setAccessoryName:v135];
                }
                v136 = [v10 accessoryUUID];
                BOOL v137 = v136 == 0;

                if (v137)
                {
                  v138 = [v50 uuid];
                  [v10 setAccessoryUUID:v138];
                }
                obja = [(HMDAccessoryBrowser *)v52 _pairingInformationForUnpairedAccessory:v50];
                if (obja)
                {
                  v139 = (void *)MEMORY[0x230FBD990]();
                  v140 = v52;
                  v141 = HMFGetOSLogHandle();
                  if (os_log_type_enabled(v141, OS_LOG_TYPE_INFO))
                  {
                    v142 = HMFGetLogIdentifier();
                    *(_DWORD *)buf = 138543618;
                    *(void *)&uint8_t buf[4] = v142;
                    *(_WORD *)&unsigned char buf[12] = 2112;
                    *(void *)&buf[14] = v50;
                    _os_log_impl(&dword_22F52A000, v141, OS_LOG_TYPE_INFO, "%{public}@Accessory %@ is currently being paired", buf, 0x16u);
                  }
                  v234[0] = *MEMORY[0x263F08320];
                  v143 = [NSString stringWithFormat:@"Failed to start pairing with the accessory %@", v50];
                  v235[0] = v143;
                  v234[1] = *MEMORY[0x263F08338];
                  v144 = NSString;
                  v145 = [MEMORY[0x263F087E8] hmStringFromErrorCode:15];
                  v146 = [v144 stringWithFormat:@"%ld (%@) This accessory is already being added to a home.", 15, v145];
                  v235[1] = v146;
                  id v196 = [NSDictionary dictionaryWithObjects:v235 forKeys:v234 count:2];

                  id v127 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F0C710] code:15 userInfo:v196];
                  id v192 = +[HMDMatterAccessoryPairingEndContext hmdContextWithStep:2 error:v127];
                  v147 = _Block_copy(aBlock);
                  if (v147)
                  {
                    v148 = [v50 uuid];
                    (*((void (**)(void *, void, void *, uint64_t, void, void, id, id))v147 + 2))(v147, 0, v148, [v50 certificationStatus], 0, 0, v127, v192);
                  }
                }
                else
                {
                  id v196 = objc_alloc_init(MEMORY[0x263F35870]);
                  v149 = [(HMDAccessoryBrowser *)v52 currentControllerPairingIdentity];
                  [v196 setPairingIdentity:v149];

                  objc_msgSend(v196, "setRequiresUserConsent:", objc_msgSend(v188, "requiresUserConsent"));
                  v150 = [v10 ownershipToken];
                  v151 = [v150 internalData];
                  [v196 setOwnershipToken:v151];

                  v152 = [v188 networkCredential];
                  v153 = [v152 wiFiPSK];
                  [v196 setPsk:v153];

                  v154 = [v188 isoCountryCode];
                  [v196 setIsoCountryCode:v154];

                  v155 = [v188 chipFabricID];
                  [v196 setChipFabricID:v155];

                  objc_msgSend(v196, "setDoNetworkScan:", objc_msgSend(v10, "doNetworkScan"));
                  objc_msgSend(v196, "setOwnerPairing:", -[HMDAccessoryBrowser _isOwnerPairingAccessoryWithConfiguration:](v52, "_isOwnerPairingAccessoryWithConfiguration:", v188));
                  objb = -[HMDUnpairedHAPAccessoryPairingInformation initWithAccessoryDescription:linkType:completionHandler:progressHandler:pairingRequest:]([HMDUnpairedHAPAccessoryPairingInformation alloc], "initWithAccessoryDescription:linkType:completionHandler:progressHandler:pairingRequest:", v10, [v20 linkType], aBlock, v189, v196);
                  [(HMDUnpairedHAPAccessoryPairingInformation *)objb setPairingActivity:v187];
                  v156 = [(HMDUnpairedHAPAccessoryPairingInformation *)objb homeUUID];
                  LODWORD(v155) = v156 == 0;

                  if (v155)
                  {
                    v157 = [v188 homeUUID];
                    [(HMDUnpairedHAPAccessoryPairingInformation *)objb setHomeUUID:v157];
                  }
                  id v158 = v20;
                  objc_opt_class();
                  if (objc_opt_isKindOfClass()) {
                    v159 = v158;
                  }
                  else {
                    v159 = 0;
                  }
                  id v127 = v159;

                  if (v127)
                  {
                    -[HMDUnpairedHAPAccessoryPairingInformation setWacAccessory:](objb, "setWacAccessory:", [v127 isWacAccessory]);
                    -[HMDUnpairedHAPAccessoryPairingInformation setLegacyWAC:](objb, "setLegacyWAC:", [v127 isWacLegacy]);
                  }
                  id v183 = v158;
                  objc_opt_class();
                  if (objc_opt_isKindOfClass()) {
                    v160 = v183;
                  }
                  else {
                    v160 = 0;
                  }
                  id v192 = v160;

                  if (v192) {
                    [(HMDAccessoryBrowser *)v52 _setupHMMTRAccessoryServer:v192 pairingInfo:objb];
                  }
                  v161 = [(HMDAccessoryBrowser *)v52 currentlyPairingAccessories];
                  [v161 addObject:objb];

                  if (v189) {
                    goto LABEL_127;
                  }
                  v162 = [v50 uuid];
                  v163 = [(HMDAccessoryBrowser *)v52 _progressHandlerForUnpairedAccessory:v162];
                  v189 = [v163 progressHandler];

                  if (v189)
                  {
LABEL_127:
                    v164 = [HMDAddAccessoryProgressState alloc];
                    v181 = [v50 uuid];
                    v165 = [v50 name];
                    v166 = [v50 category];
                    v167 = [v183 productData];
                    v168 = [(HMDAddAccessoryProgressState *)v164 initWithUUID:v181 accessoryName:v165 manufacturerName:0 category:v166 certificationStatus:0 productData:v167];

                    v189[2](v189, 2, v168);
                  }
                  else
                  {
                    v189 = 0;
                  }
                  v169 = (void *)MEMORY[0x230FBD990]();
                  v170 = v52;
                  v171 = HMFGetOSLogHandle();
                  if (os_log_type_enabled(v171, OS_LOG_TYPE_INFO))
                  {
                    v172 = HMFGetLogIdentifier();
                    [v188 requiresUserConsent];
                    HMFBooleanToString();
                    v173 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138543874;
                    *(void *)&uint8_t buf[4] = v172;
                    *(_WORD *)&unsigned char buf[12] = 2112;
                    *(void *)&buf[14] = v50;
                    *(_WORD *)&buf[22] = 2112;
                    v237 = v173;
                    _os_log_impl(&dword_22F52A000, v171, OS_LOG_TYPE_INFO, "%{public}@Starting pairing with accessory %@, needs consent: %@", buf, 0x20u);
                  }
                  v197[0] = MEMORY[0x263EF8330];
                  v197[1] = 3221225472;
                  v197[2] = __101__HMDAccessoryBrowser__pairAccessoryWithDescription_configuration_progressHandler_completionHandler___block_invoke_495;
                  v197[3] = &unk_264A2F2F8;
                  id v174 = v187;
                  id v198 = v174;
                  obja = objb;
                  v199 = obja;
                  id v175 = v183;
                  id v200 = v175;
                  __101__HMDAccessoryBrowser__pairAccessoryWithDescription_configuration_progressHandler_completionHandler___block_invoke_495(v197);
                  [v174 begin];
                  *(void *)buf = v174;
                  v176 = [(HMDUnpairedHAPAccessoryPairingInformation *)obja pairingRequest];
                  [v175 startPairingWithRequest:v176];

                  __HMFActivityScopeLeave();
                  v147 = v198;
                }
              }
              else
              {
                v121 = (void *)MEMORY[0x230FBD990]();
                v122 = v52;
                v123 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v123, OS_LOG_TYPE_INFO))
                {
                  v124 = HMFGetLogIdentifier();
                  v125 = [v10 debugDescription];
                  *(_DWORD *)buf = 138543874;
                  *(void *)&uint8_t buf[4] = v124;
                  *(_WORD *)&unsigned char buf[12] = 2112;
                  *(void *)&buf[14] = v20;
                  *(_WORD *)&buf[22] = 2112;
                  v237 = v125;
                  _os_log_impl(&dword_22F52A000, v123, OS_LOG_TYPE_INFO, "%{public}@Matched accessoryServer %@ is part of paired accessories while attempting to pair accessory %@", buf, 0x20u);
                }
                obja = [MEMORY[0x263F087E8] hmErrorWithCode:13];
                id v196 = +[HMDMatterAccessoryPairingEndContext hmdContextWithStep:2 error:obja];
                v126 = _Block_copy(aBlock);
                id v127 = v126;
                if (v126) {
                  (*((void (**)(void *, id, void, void, void, void, HMDUnpairedHAPAccessoryPairingInformation *, id))v126
                }
                   + 2))(v126, v20, 0, 0, 0, 0, obja, v196);
              }
            }
            v193 = v50;
            goto LABEL_139;
          }
LABEL_42:
        }
        uint64_t v41 = [obj countByEnumeratingWithState:&v226 objects:v241 count:16];
        if (v41) {
          continue;
        }
        break;
      }
    }
    else
    {
      v193 = 0;
    }

    id v62 = objc_alloc_init(MEMORY[0x263F35870]);
    __int16 v67 = [(HMDAccessoryBrowser *)v191 currentControllerPairingIdentity];
    [v62 setPairingIdentity:v67];

    objc_msgSend(v62, "setRequiresUserConsent:", objc_msgSend(v188, "requiresUserConsent"));
    id v68 = [v10 ownershipToken];
    id v69 = [v68 internalData];
    [v62 setOwnershipToken:v69];

    char v70 = [v188 networkCredential];
    uint64_t v71 = [v70 wiFiPSK];
    [v62 setPsk:v71];

    id v72 = [v188 isoCountryCode];
    [v62 setIsoCountryCode:v72];

    char v73 = [v188 chipFabricID];
    [v62 setChipFabricID:v73];

    objc_msgSend(v62, "setDoNetworkScan:", objc_msgSend(v10, "doNetworkScan"));
    objc_msgSend(v62, "setOwnerPairing:", -[HMDAccessoryBrowser _isOwnerPairingAccessoryWithConfiguration:](v191, "_isOwnerPairingAccessoryWithConfiguration:", v188));
    id v74 = [[HMDUnpairedHAPAccessoryPairingInformation alloc] initWithAccessoryDescription:v10 linkType:0 completionHandler:aBlock progressHandler:v189 pairingRequest:v62];
    [(HMDUnpairedHAPAccessoryPairingInformation *)v74 setPairingActivity:v187];
    id v75 = [(HMDUnpairedHAPAccessoryPairingInformation *)v74 homeUUID];
    LODWORD(v73) = v75 == 0;

    if (v73)
    {
      id v76 = [v188 homeUUID];
      [(HMDUnpairedHAPAccessoryPairingInformation *)v74 setHomeUUID:v76];
    }
    uint64_t v77 = [(HMDAccessoryBrowser *)v191 currentlyPairingAccessories];
    [v77 addObject:v74];

    v216[0] = MEMORY[0x263EF8330];
    v216[1] = 3221225472;
    v216[2] = __101__HMDAccessoryBrowser__pairAccessoryWithDescription_configuration_progressHandler_completionHandler___block_invoke;
    v216[3] = &unk_264A26F70;
    v216[4] = v191;
    v189 = v189;
    v220 = v189;
    id v78 = aBlock;
    id v221 = v78;
    id v217 = v187;
    obja = v74;
    v218 = obja;
    id v79 = v10;
    id v219 = v79;
    id v80 = _Block_copy(v216);
    v182 = [v79 accessoryServerIdentifier];
    if (v182)
    {
      v81 = [(HMDAccessoryBrowser *)v191 pairedAccessoryInformationWithIdentifier:v182];
      BOOL v82 = v81 == 0;

      if (!v82)
      {
        id v83 = (void *)MEMORY[0x230FBD990]();
        v84 = v191;
        id v85 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v85, OS_LOG_TYPE_INFO))
        {
          id v86 = HMFGetLogIdentifier();
          id v87 = [v79 debugDescription];
          *(_DWORD *)buf = 138543874;
          *(void *)&uint8_t buf[4] = v86;
          *(_WORD *)&unsigned char buf[12] = 2112;
          *(void *)&buf[14] = v182;
          *(_WORD *)&buf[22] = 2112;
          v237 = v87;
          _os_log_impl(&dword_22F52A000, v85, OS_LOG_TYPE_INFO, "%{public}@Accessory with identifier %@ is already paired while attempting to pair %@", buf, 0x20u);
        }
        (*((void (**)(void *, uint64_t, void, void, void))v80 + 2))(v80, 1, 0, 0, 0);
LABEL_138:

        id v20 = 0;
LABEL_139:

        goto LABEL_24;
      }
    }
    v180 = [v79 setupID];
    id v94 = v180;
    if (v180)
    {
      id v95 = [(HMDAccessoryBrowser *)v191 pairedAccessoryInformationWithSetupID:v180];
      id v94 = v180;
      if (v95)
      {
        id v96 = (void *)MEMORY[0x230FBD990]();
        v97 = v191;
        v98 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v98, OS_LOG_TYPE_INFO))
        {
          v99 = HMFGetLogIdentifier();
          v100 = [v79 debugDescription];
          *(_DWORD *)buf = 138543874;
          *(void *)&uint8_t buf[4] = v99;
          *(_WORD *)&unsigned char buf[12] = 2112;
          *(void *)&buf[14] = v180;
          *(_WORD *)&buf[22] = 2112;
          v237 = v100;
          _os_log_impl(&dword_22F52A000, v98, OS_LOG_TYPE_INFO, "%{public}@Accessory with setupID %@ is already paired while attempting to pair %@", buf, 0x20u);
        }
        id v101 = (void *)MEMORY[0x230FBD990]();
        int64_t v102 = v97;
        id v103 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v103, OS_LOG_TYPE_INFO))
        {
          id v104 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          *(void *)&uint8_t buf[4] = v104;
          *(_WORD *)&unsigned char buf[12] = 2112;
          *(void *)&buf[14] = v95;
          _os_log_impl(&dword_22F52A000, v103, OS_LOG_TYPE_INFO, "%{public}@Already paired accessory info: %@", buf, 0x16u);
        }
        id v105 = [v95 identifier];
        [(HMDAccessoryBrowser *)v102 updateAlreadyPairingProgressForAccessoryServerIdentifier:v105 progressHandler:v189];

        v106 = [MEMORY[0x263F087E8] hmErrorWithCode:13];
        v107 = +[HMDMatterAccessoryPairingEndContext hmdContextWithStep:2 error:v106];
        id v108 = _Block_copy(v78);
        v109 = v108;
        if (v108) {
          (*((void (**)(void *, void, void, void, void, void, void *, void *))v108 + 2))(v108, 0, 0, 0, 0, 0, v106, v107);
        }

        goto LABEL_137;
      }
    }
    v214[0] = 0;
    v214[1] = v214;
    v214[2] = 0x2020000000;
    char v215 = 0;
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v237 = __Block_byref_object_copy__210267;
    v238 = __Block_byref_object_dispose__210268;
    id v239 = 0;
    dispatch_group_t v110 = dispatch_group_create();
    v208[0] = MEMORY[0x263EF8330];
    v208[1] = 3221225472;
    v208[2] = __101__HMDAccessoryBrowser__pairAccessoryWithDescription_configuration_progressHandler_completionHandler___block_invoke_486;
    v208[3] = &unk_264A26FC0;
    long long v111 = v110;
    v209 = v111;
    id v210 = v94;
    id v211 = v182;
    v212 = buf;
    v213 = v214;
    long long v112 = (void (**)(void *, void *))_Block_copy(v208);
    long long v113 = [v79 setupAccessoryPayload];
    long long v114 = v113;
    if ((!v113 || [v113 supportsIP])
      && ([(HMDAccessoryBrowser *)v191 ipAccessoryServerBrowser],
          uint64_t v115 = objc_claimAutoreleasedReturnValue(),
          v112[2](v112, v115),
          v115,
          !v114)
      || [v114 supportsBTLE])
    {
      __int16 v116 = [(HMDAccessoryBrowser *)v191 btleAccessoryServerBrowser];
      v112[2](v112, v116);
    }
    id v117 = [(HMDAccessoryBrowser *)v191 chipAccessoryServerBrowser];
    __int16 v118 = v117;
    if (v117)
    {
      if (v114)
      {
        BOOL v119 = [v114 communicationProtocol] == 2;

        if (!v119) {
          goto LABEL_136;
        }
      }
      else
      {
      }
      v177 = [(HMDAccessoryBrowser *)v191 chipAccessoryServerBrowser];
      v112[2](v112, v177);
    }
LABEL_136:
    v178 = [(HMDAccessoryBrowser *)v191 workQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __101__HMDAccessoryBrowser__pairAccessoryWithDescription_configuration_progressHandler_completionHandler___block_invoke_3;
    block[3] = &unk_264A27010;
    id v202 = v114;
    v203 = v191;
    v206 = buf;
    id v204 = v188;
    id v205 = v80;
    v207 = v214;
    id v179 = v114;
    dispatch_group_notify(v111, v178, block);

    _Block_object_dispose(buf, 8);
    _Block_object_dispose(v214, 8);
LABEL_137:

    goto LABEL_138;
  }
  __int16 v63 = (void *)MEMORY[0x230FBD990]();
  uint64_t v64 = v191;
  __int16 v65 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
  {
    uint64_t v66 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    *(void *)&uint8_t buf[4] = v66;
    _os_log_impl(&dword_22F52A000, v65, OS_LOG_TYPE_INFO, "%{public}@HomeHub is not capable to handle Matter Shared Admin Pairing requests", buf, 0xCu);
  }
  id v20 = [MEMORY[0x263F087E8] hmErrorWithCode:92];
  v195 = +[HMDMatterAccessoryPairingEndContext hmdContextWithStep:2 error:v20];
  (*((void (**)(id, void, void, void, void, void, id, void *))aBlock + 2))(aBlock, 0, 0, 0, 0, 0, v20, v195);

LABEL_25:
}

void __101__HMDAccessoryBrowser__pairAccessoryWithDescription_configuration_progressHandler_completionHandler___block_invoke(uint64_t a1, int a2, void *a3, void *a4, void *a5)
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = [v9 pendingRemovePairing];
  BOOL v13 = v12 != 0;
  if (v12)
  {
    id v14 = (void *)MEMORY[0x230FBD990]();
    id v15 = *(id *)(a1 + 32);
    long long v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      long long v17 = HMFGetLogIdentifier();
      long long v18 = [v9 identifier];
      *(_DWORD *)buf = 138543618;
      id v49 = v17;
      __int16 v50 = 2112;
      uint64_t v51 = v18;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@Waiting for the prior pending pairing to be removed from the accessory before proceeding with adding accessory %@", buf, 0x16u);
    }
  }
  else if (a2)
  {
    if (v9)
    {
      long long v19 = *(void **)(a1 + 32);
      id v20 = [v9 identifier];
      [v19 updateAlreadyPairingProgressForAccessoryServerIdentifier:v20 progressHandler:*(void *)(a1 + 64)];

      uint64_t v21 = 13;
    }
    else
    {
      uint64_t v21 = 11;
    }
    uint64_t v32 = [MEMORY[0x263F087E8] hmErrorWithCode:v21];
    id v37 = +[HMDMatterAccessoryPairingEndContext hmdContextWithStep:2 error:v32];
    if (*(void *)(a1 + 72))
    {
      id v38 = (void *)MEMORY[0x230FBD990]();
      id v39 = *(id *)(a1 + 32);
      id v40 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        uint64_t v41 = HMFGetLogIdentifier();
        [v9 identifier];
        uint64_t v42 = v43 = v38;
        *(_DWORD *)buf = 138543618;
        id v49 = v41;
        __int16 v50 = 2112;
        uint64_t v51 = v42;
        _os_log_impl(&dword_22F52A000, v40, OS_LOG_TYPE_ERROR, "%{public}@Pairing failed because its already associated to home %@", buf, 0x16u);

        id v38 = v43;
      }

      (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
    }

    goto LABEL_29;
  }
  if (!v10)
  {
    v44[0] = MEMORY[0x263EF8330];
    v44[1] = 3221225472;
    v44[2] = __101__HMDAccessoryBrowser__pairAccessoryWithDescription_configuration_progressHandler_completionHandler___block_invoke_480;
    v44[3] = &unk_264A2DFC8;
    id v45 = *(id *)(a1 + 40);
    id v46 = *(id *)(a1 + 48);
    BOOL v47 = v13;
    id v25 = __101__HMDAccessoryBrowser__pairAccessoryWithDescription_configuration_progressHandler_completionHandler___block_invoke_480(v44);
    if (!v9)
    {
      uint64_t v26 = (void *)MEMORY[0x230FBD990](v25);
      id v27 = *(id *)(a1 + 32);
      uint64_t v28 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        uint64_t v29 = HMFGetLogIdentifier();
        uint64_t v30 = [*(id *)(a1 + 48) setupID];
        uint64_t v31 = [*(id *)(a1 + 56) debugDescription];
        *(_DWORD *)buf = 138543874;
        id v49 = v29;
        __int16 v50 = 2112;
        uint64_t v51 = v30;
        __int16 v52 = 2112;
        id v53 = v31;
        _os_log_impl(&dword_22F52A000, v28, OS_LOG_TYPE_INFO, "%{public}@Waiting for discovery of accessory with setupID %@ (%@) to start pairing", buf, 0x20u);
      }
    }

    uint64_t v32 = v45;
    goto LABEL_29;
  }
  if (!v11)
  {
    uint64_t v22 = (void *)[v10 copy];
    id v11 = +[HMDMatterAccessoryPairingEndContext hmdContextWithStep:2 error:v22];
  }
  if (*(void *)(a1 + 72))
  {
    uint64_t v23 = [v10 domain];
    if (v23 == (void *)*MEMORY[0x263F355F0])
    {
      mapHAPPairingErrorToHMError(v10);
      id v24 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v24 = v10;
    }
    uint64_t v32 = v24;

    id v33 = (void *)MEMORY[0x230FBD990]();
    id v34 = *(id *)(a1 + 32);
    id v35 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      char v36 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v49 = v36;
      _os_log_impl(&dword_22F52A000, v35, OS_LOG_TYPE_ERROR, "%{public}@Pairing failed with fatal error", buf, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
LABEL_29:
  }
}

void __101__HMDAccessoryBrowser__pairAccessoryWithDescription_configuration_progressHandler_completionHandler___block_invoke_486(uint64_t a1, void *a2)
{
  id v3 = *(NSObject **)(a1 + 32);
  id v4 = a2;
  dispatch_group_enter(v3);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __101__HMDAccessoryBrowser__pairAccessoryWithDescription_configuration_progressHandler_completionHandler___block_invoke_2;
  v7[3] = &unk_264A26F98;
  long long v9 = *(_OWORD *)(a1 + 56);
  id v8 = *(id *)(a1 + 32);
  [v4 matchAccessoryServerWithSetupID:v5 serverIdentifier:v6 completionHandler:v7];
}

void __101__HMDAccessoryBrowser__pairAccessoryWithDescription_configuration_progressHandler_completionHandler___block_invoke_3(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) chipAccessorySetupPayload];
  id v3 = [*(id *)(a1 + 40) chipAccessoryServerBrowser];
  if (!v3 || *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
  {

LABEL_4:
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    goto LABEL_5;
  }

  if (!v2) {
    goto LABEL_4;
  }
  id v4 = [*(id *)(a1 + 40) homeManager];
  uint64_t v5 = [*(id *)(a1 + 48) homeUUID];
  uint64_t v6 = [v4 _homeWithUUID:v5];

  uint64_t v7 = [v6 fabric];
  id v8 = v7;
  long long v17 = v6;
  if (v7) {
    [v7 targetFabricUUID];
  }
  else {
  long long v16 = [v6 altTargetFabricUUID];
  }
  long long v9 = [*(id *)(a1 + 40) chipAccessoryServerBrowser];
  id v10 = [v2 chipSetupPayload];
  id v11 = [*(id *)(a1 + 48) chipFabricID];
  uint64_t v12 = [*(id *)(a1 + 40) _isOwnerPairingAccessoryWithConfiguration:*(void *)(a1 + 48)];
  BOOL v13 = *(void **)(a1 + 40);
  id v14 = [*(id *)(a1 + 48) homeUUID];
  uint64_t v15 = [v13 supportsCommissioningCertificateRetrievalForHomeUUID:v14];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __101__HMDAccessoryBrowser__pairAccessoryWithDescription_configuration_progressHandler_completionHandler___block_invoke_4;
  v18[3] = &unk_264A26FE8;
  id v19 = *(id *)(a1 + 56);
  [v9 prepareForPairingWithSetupPayload:v10 fabric:v8 targetFabricUUID:v16 fabricID:v11 owner:v12 ownerCertFetchSupported:v15 completionHandler:v18];

LABEL_5:
}

void *__101__HMDAccessoryBrowser__pairAccessoryWithDescription_configuration_progressHandler_completionHandler___block_invoke_495(void *result)
{
  v1 = (void *)result[4];
  if (v1)
  {
    int v2 = result;
    id v3 = (void *)result[5];
    id v4 = v1;
    [v3 accessoryUUID];

    uint64_t v5 = [(id)v2[5] setupID];
    id v6 = (id)HMFBooleanToString();

    [(id)v2[5] wacAccessory];
    id v7 = (id)HMFBooleanToString();
    [(id)v2[5] legacyWAC];
    id v8 = (id)HMFBooleanToString();
    [(id)v2[5] linkType];
    id v9 = (id)HAPLinkTypeDescription();
    [(id)v2[6] communicationProtocol];

    return (id)HAPCommunicationProtocolDescription();
  }
  return result;
}

void __101__HMDAccessoryBrowser__pairAccessoryWithDescription_configuration_progressHandler_completionHandler___block_invoke_4(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v10 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v6)
  {
    id v8 = (void *)[v6 copy];
    id v9 = +[HMDMatterAccessoryPairingEndContext hmmtrContextWithStep:2 error:v8];
  }
  else
  {
    id v9 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __101__HMDAccessoryBrowser__pairAccessoryWithDescription_configuration_progressHandler_completionHandler___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v6 = a3;
  if (v6 && !*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a2;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void *__101__HMDAccessoryBrowser__pairAccessoryWithDescription_configuration_progressHandler_completionHandler___block_invoke_480(void *result)
{
  v1 = (void *)result[4];
  if (v1)
  {
    int v2 = result;
    id v3 = (void *)result[5];
    id v4 = v1;
    uint64_t v5 = [v3 setupID];
    id v6 = (id)HMFBooleanToString();

    [(id)v2[5] wacAccessory];
    id v7 = (id)HMFBooleanToString();
    [(id)v2[5] linkType];

    id v8 = (id)HAPLinkTypeDescription();
    return (id)HMFBooleanToString();
  }
  return result;
}

- (void)_cancelPairingWithAccessoryDescription:(id)a3 error:(id)a4 context:(id)a5
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(HMDAccessoryBrowser *)self workQueue];
  dispatch_assert_queue_V2(v11);

  uint64_t v12 = [v8 cancellationReason];
  BOOL v13 = v12;
  if (!v12) {
    goto LABEL_5;
  }
  if ([v12 isHMError])
  {
    uint64_t v14 = +[HMDMatterAccessoryPairingEndContext hmContextWithCancelledError:v13];

    id v10 = (id)v14;
  }
  if (([v13 isHMError] & 1) == 0)
  {
LABEL_5:
    id v15 = v9;

    BOOL v13 = v15;
  }
  long long v16 = [(HMDAccessoryBrowser *)self unpairedHAPAccessoryWithAccessoryDescription:v8];
  if (v16)
  {
    [(HMDAccessoryBrowser *)self _cancelPairingWithAccessory:v16 error:v13 context:v10];
  }
  else
  {
    long long v17 = (void *)MEMORY[0x230FBD990]();
    long long v18 = self;
    id v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      id v20 = HMFGetLogIdentifier();
      uint64_t v21 = [v8 debugDescription];
      *(_DWORD *)buf = 138543618;
      id v45 = v20;
      __int16 v46 = 2112;
      BOOL v47 = v21;
      _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_INFO, "%{public}@There is no unpaired accessory for %@ - removing with pairingInfo", buf, 0x16u);
    }
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    uint64_t v22 = [(HMDAccessoryBrowser *)v18 currentlyPairingAccessories];
    uint64_t v23 = [v22 countByEnumeratingWithState:&v40 objects:v50 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      id v37 = v18;
      id v38 = v10;
      id v39 = v9;
      uint64_t v25 = *(void *)v41;
LABEL_12:
      uint64_t v26 = 0;
      while (1)
      {
        if (*(void *)v41 != v25) {
          objc_enumerationMutation(v22);
        }
        id v27 = *(void **)(*((void *)&v40 + 1) + 8 * v26);
        uint64_t v28 = objc_msgSend(v27, "setupID", v37);
        uint64_t v29 = [v27 accessoryServerIdentifier];
        char v30 = [v8 matchesSetupID:v28 serverIdentifier:v29];

        if (v30) {
          break;
        }
        if (v24 == ++v26)
        {
          uint64_t v24 = [v22 countByEnumeratingWithState:&v40 objects:v50 count:16];
          if (v24) {
            goto LABEL_12;
          }
          id v31 = v22;
          id v10 = v38;
          id v9 = v39;
          long long v16 = 0;
          goto LABEL_24;
        }
      }
      id v31 = v27;

      id v10 = v38;
      id v9 = v39;
      long long v16 = 0;
      if (!v31) {
        goto LABEL_25;
      }
      uint64_t v32 = (void *)MEMORY[0x230FBD990]();
      id v33 = v37;
      id v34 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        id v35 = HMFGetLogIdentifier();
        char v36 = [v8 debugDescription];
        *(_DWORD *)buf = 138543874;
        id v45 = v35;
        __int16 v46 = 2112;
        BOOL v47 = v36;
        __int16 v48 = 2112;
        id v49 = v31;
        _os_log_impl(&dword_22F52A000, v34, OS_LOG_TYPE_INFO, "%{public}@Accessory description %@ matches accessory pending to be paired %@ - aborting the operation", buf, 0x20u);

        id v10 = v38;
        id v9 = v39;
      }

      [(HMDAccessoryBrowser *)v33 _removePairingInformation:v31 error:v13 context:v10];
    }
    else
    {
      id v31 = v22;
    }
LABEL_24:
  }
LABEL_25:
}

- (void)cancelPairingWithAccessoryDescription:(id)a3 error:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(HMDAccessoryBrowser *)self workQueue];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __75__HMDAccessoryBrowser_cancelPairingWithAccessoryDescription_error_context___block_invoke;
  v15[3] = &unk_264A2E610;
  void v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

uint64_t __75__HMDAccessoryBrowser_cancelPairingWithAccessoryDescription_error_context___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cancelPairingWithAccessoryDescription:*(void *)(a1 + 40) error:*(void *)(a1 + 48) context:*(void *)(a1 + 56)];
}

- (void)cancelPairingWithAccessoryDescription:(id)a3 error:(id)a4
{
}

- (id)currentControllerPairingIdentity
{
  int v2 = [(HMDAccessoryBrowser *)self homeManager];
  id v3 = [v2 bgOpsManager];
  id v4 = [v3 getHH2ControllerKey];

  return v4;
}

- (id)findAccessoryServerForAccessoryDescription:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v5 = [(HMDAccessoryBrowser *)self unpairedHAPAccessories];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v27;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v27 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        id v11 = [v10 uuid];
        id v12 = [v4 accessoryUUID];
        char v13 = [v11 isEqual:v12];

        if (v13)
        {
          id v20 = [v10 preferredAccessoryServer];
          goto LABEL_22;
        }
        long long v24 = 0u;
        long long v25 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        id v14 = objc_msgSend(v10, "accessoryServers", 0);
        uint64_t v15 = [v14 countByEnumeratingWithState:&v22 objects:v30 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v23;
LABEL_9:
          uint64_t v18 = 0;
          while (1)
          {
            if (*(void *)v23 != v17) {
              objc_enumerationMutation(v14);
            }
            id v19 = *(void **)(*((void *)&v22 + 1) + 8 * v18);
            if ([v4 matchesAccessoryServer:v19]) {
              break;
            }
            if (v16 == ++v18)
            {
              uint64_t v16 = [v14 countByEnumeratingWithState:&v22 objects:v30 count:16];
              if (v16) {
                goto LABEL_9;
              }
              goto LABEL_15;
            }
          }
          id v20 = v19;

          if (v20) {
            goto LABEL_22;
          }
        }
        else
        {
LABEL_15:
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v26 objects:v31 count:16];
      id v20 = 0;
      if (v7) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v20 = 0;
  }
LABEL_22:

  return v20;
}

- (void)_cancelPairingWithAccessory:(id)a3 error:(id)a4 context:(id)a5
{
  uint64_t v85 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(HMDAccessoryBrowser *)self workQueue];
  dispatch_assert_queue_V2(v11);

  id v69 = v8;
  if ([v8 supportsCHIP])
  {
    id v12 = (void *)MEMORY[0x230FBD990]();
    char v13 = self;
    id v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v16 = id v15 = v10;
      *(_DWORD *)buf = 138543874;
      id v75 = v16;
      __int16 v76 = 2112;
      id v77 = v9;
      __int16 v78 = 2112;
      id v79 = v15;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@Cancel pairing matter accessory with error %@ context %@", buf, 0x20u);

      id v10 = v15;
    }
  }
  uint64_t v17 = [(HMDAccessoryBrowser *)self _pairingInformationForUnpairedAccessory:v69];
  uint64_t v18 = [v17 addAccessoryCompletionHandler];
  id v60 = v9;
  id v62 = v17;
  if (!v18)
  {
    id v19 = (void *)MEMORY[0x230FBD990]();
    id v20 = self;
    uint64_t v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      long long v22 = HMFGetLogIdentifier();
      long long v23 = [v69 name];
      long long v24 = [v69 uuid];
      *(_DWORD *)buf = 138543874;
      id v75 = v22;
      __int16 v76 = 2112;
      id v77 = v23;
      __int16 v78 = 2112;
      id v79 = v24;
      _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_INFO, "%{public}@Cancel pairing with accessory but addAccessoryCompletion is nil %@/%@", buf, 0x20u);

      uint64_t v18 = 0;
    }

    id v9 = v60;
    uint64_t v17 = v62;
  }
  long long v72 = 0u;
  long long v73 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  id obj = [v69 accessoryServers];
  id v61 = self;
  uint64_t v68 = [obj countByEnumeratingWithState:&v70 objects:v84 count:16];
  if (v68)
  {
    uint64_t v67 = *(void *)v71;
    *(void *)&long long v25 = 138544386;
    long long v59 = v25;
    do
    {
      for (uint64_t i = 0; i != v68; ++i)
      {
        if (*(void *)v71 != v67) {
          objc_enumerationMutation(obj);
        }
        long long v27 = *(void **)(*((void *)&v70 + 1) + 8 * i);
        if (v17)
        {
          uint64_t v28 = [v17 linkType];
          BOOL v29 = v28 == [v27 linkType];
        }
        else
        {
          BOOL v29 = 0;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          BOOL v30 = v17 != 0;
        }
        else {
          BOOL v30 = v29;
        }
        if (v30)
        {
          if ([v27 isPaired])
          {
            id v31 = (void *)MEMORY[0x230FBD990]();
            uint64_t v32 = self;
            id v33 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
            {
              id v34 = HMFGetLogIdentifier();
              __int16 v63 = v31;
              id v35 = [v69 name];
              char v36 = [v69 uuid];
              id v37 = [v36 UUIDString];
              [v27 identifier];
              __int16 v65 = v18;
              v39 = id v38 = v10;
              *(_DWORD *)buf = 138544130;
              id v75 = v34;
              __int16 v76 = 2112;
              id v77 = v35;
              __int16 v78 = 2112;
              id v79 = v37;
              __int16 v80 = 2112;
              id v81 = v39;
              _os_log_impl(&dword_22F52A000, v33, OS_LOG_TYPE_INFO, "%{public}@Cancelling pairing of the accessory that completed pair-setup: %@/%@/%@", buf, 0x2Au);

              id v10 = v38;
              uint64_t v18 = v65;

              id v31 = v63;
              self = v61;

              uint64_t v17 = v62;
              id v9 = v60;
            }
          }
          if (objc_msgSend(v69, "supportsCHIP", v59) && !v10)
          {
            id v10 = +[HMDMatterAccessoryPairingEndContext hmContextWithCancelledError:v9];
          }
          if (v18)
          {
            if ([v69 supportsCHIP])
            {
              uint64_t v66 = v18;
              long long v40 = (void *)MEMORY[0x230FBD990]();
              long long v41 = self;
              long long v42 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
              {
                long long v43 = HMFGetLogIdentifier();
                uint64_t v44 = [v69 name];
                [v69 uuid];
                v46 = id v45 = v10;
                *(_DWORD *)buf = v59;
                id v75 = v43;
                __int16 v76 = 2112;
                id v77 = v44;
                __int16 v78 = 2112;
                id v79 = v46;
                __int16 v80 = 2112;
                id v81 = v9;
                __int16 v82 = 2112;
                id v83 = v45;
                _os_log_impl(&dword_22F52A000, v42, OS_LOG_TYPE_INFO, "%{public}@Calling addAccessoryCompletion for unpaired accessory %@/%@, error %@, context %@", buf, 0x34u);

                id v10 = v45;
                uint64_t v17 = v62;

                self = v61;
              }

              uint64_t v18 = v66;
            }
            BOOL v47 = [v69 uuid];
            ((void (**)(void, void *, void *, uint64_t, uint64_t, uint64_t, id, id))v18)[2](v18, v27, v47, [v69 certificationStatus], objc_msgSend(v17, "wacAccessory"), objc_msgSend(v17, "legacyWAC"), v9, v10);
          }
          [v27 stopPairingWithError:0];
          uint64_t v18 = 0;
        }
      }
      uint64_t v68 = [obj countByEnumeratingWithState:&v70 objects:v84 count:16];
    }
    while (v68);
  }

  if (v18)
  {
    if ([v69 supportsCHIP])
    {
      __int16 v48 = (void *)MEMORY[0x230FBD990]();
      id v49 = self;
      __int16 v50 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
      {
        uint64_t v51 = HMFGetLogIdentifier();
        __int16 v52 = [v69 name];
        [v69 uuid];
        v54 = id v53 = v10;
        *(_DWORD *)buf = 138544386;
        id v75 = v51;
        __int16 v76 = 2112;
        id v77 = v52;
        __int16 v78 = 2112;
        id v79 = v54;
        __int16 v80 = 2112;
        id v81 = v60;
        __int16 v82 = 2112;
        id v83 = v53;
        _os_log_impl(&dword_22F52A000, v50, OS_LOG_TYPE_INFO, "%{public}@Calling addAccessoryCompletion explicitly because accessoryServer went away %@/%@, error %@, context %@", buf, 0x34u);

        id v10 = v53;
        self = v61;
      }
      id v9 = v60;
      uint64_t v17 = v62;
    }
    id v55 = objc_msgSend(v69, "uuid", v59);
    ((void (**)(void, void, void *, uint64_t, uint64_t, uint64_t, id, id))v18)[2](v18, 0, v55, [v69 certificationStatus], objc_msgSend(v17, "wacAccessory"), objc_msgSend(v17, "legacyWAC"), v9, v10);
  }
  -[HMDAccessoryBrowser _removePairingInformationForUnpairedAccessory:](self, "_removePairingInformationForUnpairedAccessory:", v69, v59);
  id v56 = [v69 identifier];
  [(HMDAccessoryBrowser *)self removePairedAccessoryInfoWithIdentifier:v56];

  id v57 = [v69 accessoryServers];
  uint64_t v58 = [v57 count];

  if (!v58) {
    [(HMDAccessoryBrowser *)self removeUnpairedHAPAccessory:v69];
  }
}

- (void)_handleSetupCodeAvailable:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(HMDAccessoryBrowser *)self workQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = [(HMDAccessoryBrowser *)self _pairingInformationForUnpairedAccessory:v4];
  if ([v6 provideNetworkCredentialsToAccessory])
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v7 = [v4 accessoryServers];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v32 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v23;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v23 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          uint64_t v13 = [v12 linkType];
          if (v13 == [v6 linkType])
          {
            id v14 = (void *)MEMORY[0x230FBD990]();
            id v15 = self;
            uint64_t v16 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
            {
              uint64_t v17 = HMFGetLogIdentifier();
              uint64_t v18 = [v4 name];
              id v19 = [v4 uuid];
              [v19 UUIDString];
              id v20 = v21 = v14;
              *(_DWORD *)buf = 138543874;
              long long v27 = v17;
              __int16 v28 = 2112;
              BOOL v29 = v18;
              __int16 v30 = 2112;
              id v31 = v20;
              _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@WAC accessory %@/%@: continuing pairing after setup code has been provided", buf, 0x20u);

              id v14 = v21;
            }

            [v12 continuePairingAfterAuthPrompt];
            goto LABEL_15;
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v22 objects:v32 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
LABEL_15:
  }
  else
  {
    [v6 setSetupCodeProvided:1];
  }
}

- (void)_notifyManagerOfNewAccessory
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = [(HMDAccessoryBrowser *)self managerDelegate];
  if (v3)
  {
    id v4 = (void *)MEMORY[0x230FBD990]();
    uint64_t v5 = self;
    uint64_t v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = HMFGetLogIdentifier();
      int v8 = 138543362;
      uint64_t v9 = v7;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Notifying Home manager that a new unpaired accessory was discovered", (uint8_t *)&v8, 0xCu);
    }
    [v3 accessoryBrowserDidFindNewAccessory];
  }
}

- (id)unpairedAccessoryForServer:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 identifier];

  if (v5)
  {
    uint64_t v6 = [v4 identifier];
    uint64_t v7 = [(HMDAccessoryBrowser *)self unpairedAccessoryWithServerIdentifier:v6];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)unpairedAccessoryWithServerIdentifier:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [(HMDAccessoryBrowser *)self unpairedHAPAccessories];
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
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
        uint64_t v10 = [v9 identifier];
        char v11 = [v4 isEqualToString:v10];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)_setBTLEPowerChangeCompletionHandler
{
  objc_initWeak(&location, self);
  uint64_t v5 = MEMORY[0x263EF8330];
  uint64_t v6 = 3221225472;
  uint64_t v7 = __59__HMDAccessoryBrowser__setBTLEPowerChangeCompletionHandler__block_invoke;
  int v8 = &unk_264A26F48;
  objc_copyWeak(&v9, &location);
  id v3 = _Block_copy(&v5);
  id v4 = [(HMDAccessoryBrowser *)self btleAccessoryServerBrowser];
  [v4 setReachabilityCompletionHandler:v3];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __59__HMDAccessoryBrowser__setBTLEPowerChangeCompletionHandler__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained
    && [v7 code] != 48
    && [WeakRetained btlePowerState] != a2)
  {
    uint64_t v6 = [WeakRetained workQueue];
    dispatch_assert_queue_V2(v6);

    [WeakRetained setBtlePowerState:a2];
    if (a2) {
      [WeakRetained _btleAccessoryReachabilityProbeTimer:1];
    }
    else {
      [WeakRetained _notifyDelegateOfReachabilityChangeChange:0 forBTLEAccessories:0];
    }
  }
}

- (void)handleXPCConnectionInvalidated:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HMDAccessoryBrowser *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __54__HMDAccessoryBrowser_handleXPCConnectionInvalidated___block_invoke;
  v7[3] = &unk_264A2F820;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __54__HMDAccessoryBrowser_handleXPCConnectionInvalidated___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  int v2 = [*(id *)(a1 + 32) userInfo];
  id v3 = [v2 objectForKeyedSubscript:@"connection"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  if (v5)
  {
    id v6 = *(void **)(a1 + 40);
    id v7 = [MEMORY[0x263F087E8] hmPrivateErrorWithCode:2503];
    [v6 _removeBrowsingConnection:v5 error:v7];
  }
  else
  {
    id v8 = (void *)MEMORY[0x230FBD990]();
    id v9 = *(id *)(a1 + 40);
    uint64_t v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      char v11 = HMFGetLogIdentifier();
      uint64_t v12 = *(void *)(a1 + 32);
      int v13 = 138543618;
      long long v14 = v11;
      __int16 v15 = 2112;
      uint64_t v16 = v12;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@Received connection invalidated notification, but no connection object was found: %@", (uint8_t *)&v13, 0x16u);
    }
  }
}

- (void)_handleRequestSearchForNewAccessories:(id)a3
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDAccessoryBrowser *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [v4 messagePayload];
  id v7 = [v6 valueForKey:@"kStartSearch"];

  if (v7)
  {
    id v8 = [v4 transport];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v9 = v8;
    }
    else {
      id v9 = 0;
    }
    id v10 = v9;

    if (v10)
    {
      int v11 = [v4 BOOLForKey:@"kStartSearch"];
      uint64_t v12 = (void *)MEMORY[0x230FBD990]();
      int v13 = self;
      long long v14 = HMFGetOSLogHandle();
      BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_INFO);
      if (!v11)
      {
        if (v15)
        {
          long long v27 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          long long v41 = v27;
          __int16 v42 = 2112;
          id v43 = v10;
          _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@Received request to stop searching for new accessories for XPC connection: %@", buf, 0x16u);
        }
        id v20 = [v4 errorForKey:@"kStopSearchReason"];
        if (!v20 || ([v4 isEntitledForSPIAccess] & 1) != 0)
        {
          [(HMDAccessoryBrowser *)v13 _removeBrowsingConnection:v10 error:v20];
          id v19 = -[HMDAccessoryBrowserXPCMessageSendPolicyParameters initWithEntitlements:browsing:]([HMDAccessoryBrowserXPCMessageSendPolicyParameters alloc], "initWithEntitlements:browsing:", [v10 entitlements], 0);
          [v10 updateSendPolicyParameters:v19];
          uint64_t v21 = 0;
          goto LABEL_20;
        }
        uint64_t v32 = (void *)MEMORY[0x230FBD990]();
        uint64_t v33 = v13;
        id v34 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          id v35 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          long long v41 = v35;
          _os_log_impl(&dword_22F52A000, v34, OS_LOG_TYPE_ERROR, "%{public}@Received invalid request to stop searching for new accessories with stop reason", buf, 0xCu);
        }
        char v36 = [MEMORY[0x263F087E8] hmErrorWithCode:80];
        [v4 respondWithError:v36];

LABEL_25:
        goto LABEL_26;
      }
      if (v15)
      {
        uint64_t v16 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        long long v41 = v16;
        __int16 v42 = 2112;
        id v43 = v10;
        _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@Received request to start searching for new accessories for XPC connection: %@", buf, 0x16u);
      }
      uint64_t v17 = [v4 proxyConnection];
      uint64_t v18 = [v17 processInfo];
      id v37 = 0;
      id v19 = [v18 clientIdentifierSalt:&v37];
      id v20 = v37;

      if (v19)
      {
        id v38 = @"kIdentifierSaltKey";
        id v39 = v19;
        uint64_t v21 = [NSDictionary dictionaryWithObjects:&v39 forKeys:&v38 count:1];
        [(HMDAccessoryBrowser *)v13 __addBrowsingConnection:v10];
        long long v22 = -[HMDAccessoryBrowserXPCMessageSendPolicyParameters initWithEntitlements:browsing:]([HMDAccessoryBrowserXPCMessageSendPolicyParameters alloc], "initWithEntitlements:browsing:", [v10 entitlements], 1);
        [v10 updateSendPolicyParameters:v22];

LABEL_20:
        [v4 respondWithPayload:v21];

LABEL_26:
        goto LABEL_27;
      }
      __int16 v28 = (void *)MEMORY[0x230FBD990]();
      BOOL v29 = v13;
      __int16 v30 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        id v31 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        long long v41 = v31;
        __int16 v42 = 2112;
        id v43 = v20;
        _os_log_impl(&dword_22F52A000, v30, OS_LOG_TYPE_ERROR, "%{public}@Cannot search for new accessories because client identifier salt could not be determined: %@", buf, 0x16u);
      }
    }
    else
    {
      id v20 = [MEMORY[0x263F087E8] hmErrorWithCode:3];
    }
    [v4 respondWithError:v20];
    goto LABEL_25;
  }
  long long v23 = (void *)MEMORY[0x230FBD990]();
  long long v24 = self;
  long long v25 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    long long v26 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    long long v41 = v26;
    _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@Received invalid message in _handleRequestSearchForNewAccessories", buf, 0xCu);
  }
LABEL_27:
}

- (void)_handleRequestFetchNewAccessories:(id)a3
{
  v43[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 numberForKey:@"kConfigGenerationCounterKey"];
  id v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 unsignedIntegerValue];
    unint64_t v8 = [(HMDAccessoryBrowser *)self generationCounter];
    id v9 = (void *)MEMORY[0x230FBD990]();
    id v10 = self;
    int v11 = HMFGetOSLogHandle();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
    if (v7 == v8)
    {
      if (v12)
      {
        int v13 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        id v37 = v13;
        __int16 v38 = 2048;
        uint64_t v39 = [(HMDAccessoryBrowser *)v10 generationCounter];
        _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Accessory browser's generation counter matches client's value of %lu", buf, 0x16u);
      }
      __int16 v42 = @"kConfigGenerationCounterKey";
      long long v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDAccessoryBrowser generationCounter](v10, "generationCounter"));
      v43[0] = v14;
      BOOL v15 = [NSDictionary dictionaryWithObjects:v43 forKeys:&v42 count:1];
    }
    else
    {
      if (v12)
      {
        uint64_t v17 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        id v37 = v17;
        __int16 v38 = 2048;
        uint64_t v39 = [(HMDAccessoryBrowser *)v10 generationCounter];
        __int16 v40 = 2048;
        uint64_t v41 = [v6 unsignedIntegerValue];
        _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Accessory browser's generation counter %lu does not match client's value of %lu", buf, 0x20u);
      }
      uint64_t v18 = [(HMDAccessoryBrowser *)v10 unassociatedAccessoriesForClientRequest:v4];
      long long v14 = encodeRootObjectForIncomingXPCMessage(v18, v4);

      v35[0] = v14;
      v34[0] = @"kAccessoriesInfoDataKey";
      v34[1] = @"kConfigGenerationCounterKey";
      id v19 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDAccessoryBrowser generationCounter](v10, "generationCounter"));
      v35[1] = v19;
      BOOL v15 = [NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:2];
    }
    [v4 respondWithPayload:v15];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v20 = [(HMDAccessoryBrowser *)v10 unassociatedAccessories];
    uint64_t v21 = [v20 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v30 != v23) {
            objc_enumerationMutation(v20);
          }
          id v25 = *(id *)(*((void *)&v29 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            long long v26 = v25;
          }
          else {
            long long v26 = 0;
          }
          id v27 = v26;

          if ([v27 hasIPLink])
          {
            __int16 v28 = [v27 preferredAccessoryServer];
            [v28 reconfirm];
          }
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v22);
    }
  }
  else
  {
    uint64_t v16 = [MEMORY[0x263F087E8] hmErrorWithCode:20];
    [v4 respondWithError:v16];
  }
}

- (void)_handleCurrentWiFiNetworkChangedNotification:(id)a3
{
  id v4 = +[HMDThreadNetworkMetadataStore defaultStore];
  id v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    void v6[2] = __68__HMDAccessoryBrowser__handleCurrentWiFiNetworkChangedNotification___block_invoke;
    v6[3] = &unk_264A2F3E8;
    v6[4] = self;
    [v4 triggerPreferredNetworkUpdateWithCompletion:v6];
  }
}

void __68__HMDAccessoryBrowser__handleCurrentWiFiNetworkChangedNotification___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = HMFGetLogIdentifier();
    unint64_t v8 = (void *)v7;
    id v9 = @" not";
    if (!v3) {
      id v9 = &stru_26E2EB898;
    }
    int v10 = 138543618;
    uint64_t v11 = v7;
    __int16 v12 = 2112;
    int v13 = v9;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@WiFi network connection changed; Thread preferred network database%@ updated",
      (uint8_t *)&v10,
      0x16u);
  }
}

- (void)__handleProcessStateChange:(id)a3
{
  id v4 = [a3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:@"processInfo"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  unint64_t v8 = [v7 bundleIdentifier];
  int v9 = [v8 isEqual:*MEMORY[0x263F0CEB8]];

  if (v9)
  {
    int v10 = [(HMDAccessoryBrowser *)self workQueue];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __50__HMDAccessoryBrowser___handleProcessStateChange___block_invoke;
    v11[3] = &unk_264A2F820;
    id v12 = v7;
    int v13 = self;
    dispatch_async(v10, v11);
  }
}

unint64_t __50__HMDAccessoryBrowser___handleProcessStateChange___block_invoke(uint64_t a1)
{
  unint64_t result = [*(id *)(a1 + 32) state];
  if (result <= 4 && ((1 << result) & 0x1A) != 0)
  {
    id v4 = *(void **)(a1 + 40);
    return [v4 _cancelCurrentlyPairingAccessories:2501 linkType:0];
  }
  return result;
}

- (void)_cancelCurrentlyPairingAccessories:(int64_t)a3 linkType:(id)a4
{
  v74[1] = *MEMORY[0x263EF8340];
  id v57 = a4;
  id v6 = [(HMDAccessoryBrowser *)self workQueue];
  dispatch_assert_queue_V2(v6);

  int64_t v48 = a3;
  uint64_t v7 = [MEMORY[0x263F087E8] hmErrorWithCode:a3];
  unint64_t v8 = (void *)MEMORY[0x263F087E8];
  uint64_t v73 = *MEMORY[0x263F08608];
  v74[0] = v7;
  id v56 = (void *)v7;
  int v9 = [NSDictionary dictionaryWithObjects:v74 forKeys:&v73 count:1];
  id v49 = [v8 hmErrorWithCode:79 userInfo:v9];

  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  int v10 = [(HMDAccessoryBrowser *)self currentlyPairingAccessories];
  uint64_t v11 = (void *)[v10 copy];

  id obj = v11;
  uint64_t v55 = [v11 countByEnumeratingWithState:&v58 objects:v72 count:16];
  if (v55)
  {
    uint64_t v54 = *(void *)v59;
    *(void *)&long long v12 = 138543874;
    long long v47 = v12;
    uint64_t v51 = self;
    do
    {
      for (uint64_t i = 0; i != v55; ++i)
      {
        if (*(void *)v59 != v54) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void **)(*((void *)&v58 + 1) + 8 * i);
        BOOL v15 = -[HMDAccessoryBrowser _unpairedAccessoryMatchingPairingInfo:](self, "_unpairedAccessoryMatchingPairingInfo:", v14, v47);
        uint64_t v16 = +[HMDMatterAccessoryPairingEndContext hmdContextWithCancelledError:v56];
        if (v15)
        {
          if (-[HMDAccessoryBrowser doesLinkTypeNumber:matchLinkType:]((uint64_t)self, v57, [v15 linkType]))
          {
            uint64_t v17 = (void *)MEMORY[0x230FBD990]();
            uint64_t v18 = self;
            id v19 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
            {
              id v20 = HMFGetLogIdentifier();
              [MEMORY[0x263F087E8] hmStringFromErrorCode:v48];
              uint64_t v21 = v53 = v17;
              uint64_t v22 = [v15 name];
              uint64_t v23 = [v15 identifier];
              *(_DWORD *)buf = 138544130;
              __int16 v63 = v20;
              __int16 v64 = 2112;
              __int16 v65 = v21;
              __int16 v66 = 2112;
              uint64_t v67 = v22;
              __int16 v68 = 2112;
              id v69 = v23;
              _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_INFO, "%{public}@%@ - sending addAccessory failure for accessory %@/%@", buf, 0x2Au);

              self = v51;
              uint64_t v17 = v53;
            }
            if ([v15 supportsCHIP]) {
              long long v24 = v16;
            }
            else {
              long long v24 = 0;
            }
            [(HMDAccessoryBrowser *)v18 _cancelPairingWithAccessory:v15 error:v49 context:v24];
LABEL_18:
            long long v32 = [(HMDAccessoryBrowser *)self currentlyPairingAccessories];
            [v32 removeObject:v14];

            uint64_t v33 = [v14 accessoryUUID];
            id v34 = [(HMDAccessoryBrowser *)self _progressHandlerForUnpairedAccessory:v33];

            if (v34)
            {
              id v35 = [(HMDAccessoryBrowser *)self currentlyPairingProgressHandlers];
              [v35 removeObject:v34];
            }
            goto LABEL_24;
          }
        }
        else if (-[HMDAccessoryBrowser doesLinkTypeNumber:matchLinkType:]((uint64_t)self, v57, [v14 linkType]))
        {
          id v25 = (void *)MEMORY[0x230FBD990]();
          long long v26 = self;
          id v27 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
          {
            __int16 v28 = HMFGetLogIdentifier();
            long long v29 = [v14 accessoryName];
            long long v30 = [v14 accessoryUUID];
            *(_DWORD *)buf = v47;
            __int16 v63 = v28;
            __int16 v64 = 2112;
            __int16 v65 = v29;
            __int16 v66 = 2112;
            uint64_t v67 = v30;
            _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_INFO, "%{public}@Removing pending pairing for accessory %@/%@", buf, 0x20u);

            self = v51;
          }

          long long v31 = (void *)[v56 copy];
          [(HMDAccessoryBrowser *)v26 _removePairingInformation:v14 error:v31 context:v16];

          goto LABEL_18;
        }
        char v36 = (void *)MEMORY[0x230FBD990]();
        id v37 = self;
        __int16 v38 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
        {
          uint64_t v39 = HMFGetLogIdentifier();
          [v14 accessoryName];
          v40 = __int16 v50 = v36;
          uint64_t v41 = [v14 accessoryUUID];
          __int16 v42 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v14, "linkType"));
          *(_DWORD *)buf = 138544386;
          __int16 v63 = v39;
          __int16 v64 = 2112;
          __int16 v65 = v40;
          __int16 v66 = 2112;
          uint64_t v67 = v41;
          __int16 v68 = 2112;
          id v69 = v42;
          __int16 v70 = 2112;
          id v71 = v57;
          _os_log_impl(&dword_22F52A000, v38, OS_LOG_TYPE_INFO, "%{public}@Not canceling pairing for accessory %@/%@ as link type %@ does not match stopped link type %@", buf, 0x34u);

          self = v51;
          char v36 = v50;
        }
LABEL_24:
      }
      uint64_t v55 = [obj countByEnumeratingWithState:&v58 objects:v72 count:16];
    }
    while (v55);
  }

  if (!v57)
  {
    id v43 = [(HMDAccessoryBrowser *)self currentlyPairingAccessories];
    [v43 removeAllObjects];

    uint64_t v44 = [(HMDAccessoryBrowser *)self currentlyPairingProgressHandlers];
    [v44 removeAllObjects];
  }
  id v45 = [(HMDAccessoryBrowser *)self getActiveWACSession];
  __int16 v46 = v45;
  if (v45) {
    [v45 cancelConfigurationWithCompletionHandler:&__block_literal_global_465];
  }
}

- (BOOL)doesLinkTypeNumber:(uint64_t)a3 matchLinkType:
{
  id v5 = a2;
  id v6 = v5;
  if (a1)
  {
    if (v5) {
      BOOL v7 = [v5 integerValue] == a3;
    }
    else {
      BOOL v7 = 1;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)_registerForNotifications
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:self selector:sel___handleProcessStateChange_ name:HMDProcessMonitorProcessStateDidChangeNotification object:0];

  id v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 addObserver:self selector:sel_handleXPCConnectionInvalidated_ name:@"HMDXPCClientConnectionDidInvalidateNotification" object:0];

  id v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 addObserver:self selector:sel__handleCurrentWiFiNetworkChangedNotification_ name:*MEMORY[0x263F424E8] object:0];
}

- (void)_registerForMessages
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x230FBD990](self, a2);
  id v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v20 = v6;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@Registering remote account message filter", buf, 0xCu);
  }
  BOOL v7 = [HMDRemoteAccountMessageFilter alloc];
  unint64_t v8 = [(HMDAccessoryBrowser *)v4 messageDestination];
  int v9 = [(HMDRemoteAccountMessageFilter *)v7 initWithTarget:v8];

  int v10 = [(HMDAccessoryBrowser *)v4 homeManager];
  uint64_t v11 = [v10 msgFilterChain];
  [v11 addMessageFilter:v9];

  long long v12 = [(HMDAccessoryBrowser *)v4 messageDispatcher];
  int v13 = [MEMORY[0x263F42620] productInfo];
  uint64_t v14 = [v13 productPlatform];

  if (v14 == 1) {
    uint64_t v15 = 5;
  }
  else {
    uint64_t v15 = 1;
  }
  uint64_t v16 = +[HMDXPCMessagePolicy policyWithEntitlements:v15];
  uint64_t v18 = v16;
  uint64_t v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v18 count:1];

  [v12 registerForMessage:@"kFetchNewAccessoriesRequestKey" receiver:v4 policies:v17 selector:sel__handleRequestFetchNewAccessories_];
  [v12 registerForMessage:@"kSearchForNewAccessoriesRequestKey" receiver:v4 policies:v17 selector:sel__handleRequestSearchForNewAccessories_];
}

- (void)setUnpairedAccessoryManagerDelegate:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock_with_options();
  objc_storeWeak((id *)&self->_unpairedAccessoryManagerDelegate, v5);

  os_unfair_lock_unlock(p_lock);
}

- (HMDAccessoryBrowserUnpairedAccessoryManagerDelegate)unpairedAccessoryManagerDelegate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_unpairedAccessoryManagerDelegate);
  os_unfair_lock_unlock(p_lock);
  return (HMDAccessoryBrowserUnpairedAccessoryManagerDelegate *)WeakRetained;
}

- (void)setManagerDelegate:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock_with_options();
  objc_storeWeak((id *)&self->_managerDelegate, v5);

  os_unfair_lock_unlock(p_lock);
}

- (void)resurrectAccessoryServer:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDAccessoryBrowser *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __48__HMDAccessoryBrowser_resurrectAccessoryServer___block_invoke;
  v7[3] = &unk_264A2F820;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __48__HMDAccessoryBrowser_resurrectAccessoryServer___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _resurrectAccessoryServer:*(void *)(a1 + 40)];
}

- (void)tombstoneAccessoryServer:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDAccessoryBrowser *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __48__HMDAccessoryBrowser_tombstoneAccessoryServer___block_invoke;
  v7[3] = &unk_264A2F820;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __48__HMDAccessoryBrowser_tombstoneAccessoryServer___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _tombstoneAccessoryServer:*(void *)(a1 + 40) forceNotify:0];
}

- (void)discoverAccessories:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDAccessoryBrowser *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __43__HMDAccessoryBrowser_discoverAccessories___block_invoke;
  v7[3] = &unk_264A2F820;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __43__HMDAccessoryBrowser_discoverAccessories___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _discoverAccessories:*(void *)(a1 + 40)];
}

- (void)handleConnectionUpdateWithBonjourDeviceInfo:(id)a3 socketInfo:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HMDAccessoryBrowser *)self ipAccessoryServerBrowser];
  [v8 handleConnectionUpdateWithBonjourDeviceInfo:v7 socketInfo:v6];
}

- (void)restartBrowsers
{
  id v3 = [(HMDAccessoryBrowser *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__HMDAccessoryBrowser_restartBrowsers__block_invoke;
  block[3] = &unk_264A2F7F8;
  void block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __38__HMDAccessoryBrowser_restartBrowsers__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _restartBrowsers];
}

- (void)_restartBrowsers
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v3 = [(HMDAccessoryBrowser *)self accessoryServerBrowsers];
  id v4 = (void *)[v3 copy];

  id v5 = [(HMDAccessoryBrowser *)self accessoryServerBrowsers];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v25 = v4;
    id obj = v4;
    uint64_t v7 = [obj countByEnumeratingWithState:&v27 objects:v35 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v28 != v9) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          int v12 = [v11 recommendBrowserReset];
          int v13 = (void *)MEMORY[0x230FBD990]();
          uint64_t v14 = self;
          uint64_t v15 = HMFGetOSLogHandle();
          BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_INFO);
          if (v12)
          {
            if (v16)
            {
              uint64_t v17 = HMFGetLogIdentifier();
              uint64_t v18 = [v11 description];
              *(_DWORD *)buf = 138543618;
              long long v32 = v17;
              __int16 v33 = 2112;
              id v34 = v18;
              _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@Restarting browser %@", buf, 0x16u);
            }
            [v11 stopDiscoveringAccessoryServers];
            [v11 startDiscoveringAccessoryServers];
          }
          else
          {
            if (v16)
            {
              id v19 = HMFGetLogIdentifier();
              id v20 = [v11 description];
              *(_DWORD *)buf = 138543618;
              long long v32 = v19;
              __int16 v33 = 2112;
              id v34 = v20;
              _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@Skipping Restarting browser %@", buf, 0x16u);
            }
          }
        }
        uint64_t v8 = [obj countByEnumeratingWithState:&v27 objects:v35 count:16];
      }
      while (v8);
    }

    id v4 = v25;
  }
  else
  {
    uint64_t v21 = (void *)MEMORY[0x230FBD990]();
    uint64_t v22 = self;
    uint64_t v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      long long v24 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      long long v32 = v24;
      _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_ERROR, "%{public}@No accessory browsers yet --- reset request ignored", buf, 0xCu);
    }
  }
}

- (void)_startDiscoveringAccessoriesNeedingReprovisioning
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if ([(HMDAccessoryBrowser *)self isBrowsingAllowed])
  {
    id v3 = [(HMDAccessoryBrowser *)self identifierOfAccessoryBeingReprovisioned];

    if (v3)
    {
      id v4 = (void *)MEMORY[0x230FBD990]();
      id v5 = self;
      uint64_t v6 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        uint64_t v7 = HMFGetLogIdentifier();
        int v19 = 138543362;
        id v20 = v7;
        uint64_t v8 = "%{public}@Ignoring request for start discovering accessories need reprovision since provisioing is already in progress";
LABEL_7:
        _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, v8, (uint8_t *)&v19, 0xCu);

        goto LABEL_8;
      }
      goto LABEL_8;
    }
    uint64_t v9 = [(HMDAccessoryBrowser *)self ipAccessoryServerBrowser];
    if (v9)
    {
      int v10 = [(HMDAccessoryBrowser *)self identifierOfAccessoryBeingReprovisioned];

      uint64_t v11 = (void *)MEMORY[0x230FBD990]();
      if (v10)
      {
        int v12 = self;
        int v13 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          uint64_t v14 = HMFGetLogIdentifier();
          int v19 = 138543362;
          id v20 = v14;
          uint64_t v15 = "%{public}@Unable to start discovering accessories need reprovision since provisioing is in progress";
LABEL_16:
          _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, v15, (uint8_t *)&v19, 0xCu);
        }
      }
      else
      {
        BOOL v16 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v17 = HMFGetLogIdentifier();
          int v19 = 138543362;
          id v20 = v17;
          _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@Start discovering accessories need reprovision", (uint8_t *)&v19, 0xCu);
        }
        [v9 startDiscoveringWACAccessoryServers];
        uint64_t v18 = [(HMDAccessoryBrowser *)self stopBrowsingAccessoriesNeedingReprovisioningTimer];
        [v18 resume];

        uint64_t v11 = (void *)MEMORY[0x230FBD990]();
        HMFGetOSLogHandle();
        int v12 = (HMDAccessoryBrowser *)objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(&v12->super.super, OS_LOG_TYPE_INFO)) {
          goto LABEL_22;
        }
        int v13 = HMFGetLogIdentifier();
        int v19 = 138543362;
        id v20 = v13;
        _os_log_impl(&dword_22F52A000, &v12->super.super, OS_LOG_TYPE_INFO, "%{public}@Started the stop browsing accessories needing reprovisioning timer", (uint8_t *)&v19, 0xCu);
      }
    }
    else
    {
      uint64_t v11 = (void *)MEMORY[0x230FBD990]();
      int v12 = self;
      int v13 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        uint64_t v14 = HMFGetLogIdentifier();
        int v19 = 138543362;
        id v20 = v14;
        uint64_t v15 = "%{public}@Unable to start discovering accessories need reprovision without a IP accessory server browser";
        goto LABEL_16;
      }
    }

LABEL_22:

    return;
  }
  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = self;
  uint64_t v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = HMFGetLogIdentifier();
    int v19 = 138543362;
    id v20 = v7;
    uint64_t v8 = "%{public}@Ignoring request for start discovering accessories need reprovision since browsing is not allowed";
    goto LABEL_7;
  }
LABEL_8:
}

- (void)startDiscoveringAccessoriesNeedingReprovisioning
{
  id v3 = [(HMDAccessoryBrowser *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __71__HMDAccessoryBrowser_startDiscoveringAccessoriesNeedingReprovisioning__block_invoke;
  block[3] = &unk_264A2F7F8;
  void block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __71__HMDAccessoryBrowser_startDiscoveringAccessoriesNeedingReprovisioning__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startDiscoveringAccessoriesNeedingReprovisioning];
}

- (void)_stopDiscoveryForAccessoryServerBrowser:(id)a3
{
  id v9 = a3;
  [v9 stopDiscoveringAccessoryServers];
  id v4 = [(HMDAccessoryBrowser *)self btleAccessoryServerBrowser];
  int v5 = [v9 isEqual:v4];

  if (v5)
  {
    uint64_t v6 = [(HMDAccessoryBrowser *)self chipAccessoryServerBrowser];
    [v6 stopBluetoothScan];
  }
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  uint64_t v8 = [(HMDAccessoryBrowser *)self discoveringAccessoryServerBrowsers];
  [v8 removeObject:v9];

  os_unfair_lock_unlock(p_lock);
}

- (void)_stopDiscoveringAccessoriesWithError:(id)a3
{
  id v5 = a3;
  id v4 = [(HMDAccessoryBrowser *)self workQueue];
  dispatch_assert_queue_V2(v4);

  [(HMDAccessoryBrowser *)self _stopDiscoveringAccessoriesWithLinkType:0 force:0 error:v5];
}

- (void)_stopDiscoveringAccessoriesWithLinkType:(id)a3 force:(BOOL)a4 error:(id)a5
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  int v10 = [(HMDAccessoryBrowser *)self workQueue];
  dispatch_assert_queue_V2(v10);

  if (v8)
  {
    if (!-[HMDAccessoryBrowser doesLinkTypeNumber:matchLinkType:]((uint64_t)self, v8, 1)) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  [(HMDAccessoryBrowser *)self _stopDiscoveringMediaAccessories];
  if (self)
  {
LABEL_3:
    uint64_t v11 = [(HMDAccessoryBrowser *)self ipAccessoryServerBrowser];
    [v11 stopDiscoveringWACAccessoryServersWithInvalidation:1];
  }
LABEL_4:
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  int v12 = [(HMDAccessoryBrowser *)self accessoryServerBrowsers];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v31 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        if (-[HMDAccessoryBrowser doesLinkTypeNumber:matchLinkType:]((uint64_t)self, v8, [v17 linkType])
          && (a4
           || ![(HMDAccessoryBrowser *)self areThereAnyPairedAccessories]
           || [v17 linkType] != 1))
        {
          [(HMDAccessoryBrowser *)self _stopDiscoveryForAccessoryServerBrowser:v17];
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v14);
  }

  if (v9) {
    uint64_t v18 = [v9 code];
  }
  else {
    uint64_t v18 = 2504;
  }
  [(HMDAccessoryBrowser *)self _cancelCurrentlyPairingAccessories:v18 linkType:v8];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  int v19 = [(HMDAccessoryBrowser *)self unpairedHAPAccessories];
  id v20 = (void *)[v19 copy];

  uint64_t v21 = [v20 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v27;
    do
    {
      for (uint64_t j = 0; j != v22; ++j)
      {
        if (*(void *)v27 != v23) {
          objc_enumerationMutation(v20);
        }
        id v25 = *(void **)(*((void *)&v26 + 1) + 8 * j);
        if (([v25 hasIPLink] & 1) == 0) {
          [(HMDAccessoryBrowser *)self removeUnpairedHAPAccessory:v25];
        }
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v26 objects:v34 count:16];
    }
    while (v22);
  }

  [(HMDAccessoryBrowser *)self __resetBrowsingConnections];
}

- (void)_stopDiscoveringMediaAccessories
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = [(HMDAccessoryBrowser *)self mediaBrowser];
  [v3 stopDiscoveringUnassociatedAccessories];

  id v4 = [(HMDAccessoryBrowser *)self wacBrowser];
  [v4 stopBrowsingForAccessories];

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = [(HMDAccessoryBrowser *)self unassociatedMediaAccessories];
  uint64_t v6 = (void *)[v5 copy];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [(HMDAccessoryBrowser *)self removeUnassociatedMediaAccessory:*(void *)(*((void *)&v11 + 1) + 8 * v10++)];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)_startDiscoveringMediaAccessories
{
  id v3 = [(HMDAccessoryBrowser *)self mediaBrowser];
  [v3 startDiscoveringUnassociatedAccessories];

  id v5 = [(HMDAccessoryBrowser *)self wacBrowser];
  id v4 = [(HMDAccessoryBrowser *)self ipAccessoryServerBrowser];
  [v5 startBrowsingForAirPlayWACAccessoriesWithBrowser:v4];
}

- (void)_startDiscoveryForAccessoryServerBrowser:(id)a3
{
  id v9 = a3;
  [v9 startDiscoveringAccessoryServers];
  id v4 = [(HMDAccessoryBrowser *)self btleAccessoryServerBrowser];
  int v5 = [v9 isEqual:v4];

  if (v5)
  {
    uint64_t v6 = [(HMDAccessoryBrowser *)self chipAccessoryServerBrowser];
    [v6 startBluetoothScan];
  }
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  uint64_t v8 = [(HMDAccessoryBrowser *)self discoveringAccessoryServerBrowsers];
  [v8 addObject:v9];

  os_unfair_lock_unlock(p_lock);
}

- (void)_startDiscoveringAccessoriesWithLinkType:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(HMDAccessoryBrowser *)self isBrowsingAllowed])
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    int v5 = [(HMDAccessoryBrowser *)self accessoryServerBrowsers];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v19;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v19 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v18 + 1) + 8 * v9);
          if (!v4
            || (uint64_t v11 = [*(id *)(*((void *)&v18 + 1) + 8 * v9) linkType],
                v11 == [v4 integerValue]))
          {
            [(HMDAccessoryBrowser *)self _startDiscoveryForAccessoryServerBrowser:v10];
          }
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v7);
    }

    if ([(HMDAccessoryBrowser *)self __isAccessoryBrowsingRequested])
    {
      if (v4 && [v4 integerValue] != 1)
      {
        [(HMDAccessoryBrowser *)self __isMediaAccessoryBrowsingRequested];
        goto LABEL_22;
      }
      long long v12 = [(HMDAccessoryBrowser *)self ipAccessoryServerBrowser];
      [v12 startDiscoveringWACAccessoryServers];
    }
    BOOL v13 = [(HMDAccessoryBrowser *)self __isMediaAccessoryBrowsingRequested];
    if (!v4 && v13) {
      [(HMDAccessoryBrowser *)self _startDiscoveringMediaAccessories];
    }
  }
  else
  {
    long long v14 = (void *)MEMORY[0x230FBD990]();
    uint64_t v15 = self;
    uint64_t v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      uint64_t v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      long long v24 = v17;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@Ignoring request to start discovering accessories because browsing is not allowed", buf, 0xCu);
    }
  }
LABEL_22:
}

- (void)_startDiscoveringPairedAccessories:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(HMDAccessoryBrowser *)self areThereAnyPairedAccessories])
  {
    if ([(HMDAccessoryBrowser *)self isBrowsingAllowed])
    {
      if (!v4 || [v4 integerValue] == 1)
      {
        int v5 = [(HMDAccessoryBrowser *)self ipAccessoryServerBrowser];
        [(HMDAccessoryBrowser *)self _startDiscoveryForAccessoryServerBrowser:v5];

        uint64_t v6 = [(HMDAccessoryBrowser *)self mediaBrowser];
        uint64_t v7 = [(HMDAccessoryBrowser *)self identifiersOfAssociatedMediaAccessories];
        [v6 updateSessionsForAccessories:v7];

        uint64_t v8 = [(HMDAccessoryBrowser *)self demoAccessoryServerBrowser];

        if (v8)
        {
          uint64_t v9 = [(HMDAccessoryBrowser *)self demoAccessoryServerBrowser];
          [(HMDAccessoryBrowser *)self _startDiscoveryForAccessoryServerBrowser:v9];
        }
        uint64_t v10 = [(HMDAccessoryBrowser *)self hap2AccessoryServerBrowser];

        if (v10)
        {
          uint64_t v11 = [(HMDAccessoryBrowser *)self hap2AccessoryServerBrowser];
          [(HMDAccessoryBrowser *)self _startDiscoveryForAccessoryServerBrowser:v11];
        }
        long long v12 = [(HMDAccessoryBrowser *)self chipAccessoryServerBrowser];

        if (v12)
        {
          BOOL v13 = [(HMDAccessoryBrowser *)self chipAccessoryServerBrowser];
          [(HMDAccessoryBrowser *)self _startDiscoveryForAccessoryServerBrowser:v13];
        }
      }
      if ([(HMDAccessoryBrowser *)self areThereAnyPairedBTLEAccessories]
        || [(HMDAccessoryBrowser *)self areThereAnyPairedUnknownLinkTypeAccessories])
      {
        long long v14 = (void *)MEMORY[0x230FBD990]();
        uint64_t v15 = self;
        uint64_t v16 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v17 = HMFGetLogIdentifier();
          int v22 = 138543362;
          uint64_t v23 = v17;
          _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@Have paired BTLE accessories, starting reachability scan", (uint8_t *)&v22, 0xCu);
        }
        [(HMDAccessoryBrowser *)v15 _btleAccessoryReachabilityProbeTimer:1];
      }
    }
    else
    {
      long long v18 = (void *)MEMORY[0x230FBD990]();
      long long v19 = self;
      long long v20 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        long long v21 = HMFGetLogIdentifier();
        int v22 = 138543362;
        uint64_t v23 = v21;
        _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_INFO, "%{public}@Ignoring request for start discovering paired accessories", (uint8_t *)&v22, 0xCu);
      }
    }
  }
}

- (void)currentlyFoundHAPAccessoryServerWithIdentifier:(id)a3 linkType:(int64_t)a4 completion:(id)a5
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  if (v9)
  {
    if (a4 == 1)
    {
      uint64_t v10 = [(HMDAccessoryBrowser *)self ipAccessoryServerBrowser];
    }
    else
    {
      if (a4 != 2)
      {
        long long v12 = (void *)MEMORY[0x230FBD990]();
        BOOL v13 = self;
        long long v14 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          uint64_t v15 = HMFGetLogIdentifier();
          if ((unint64_t)a4 > 2) {
            uint64_t v16 = @"Undefined";
          }
          else {
            uint64_t v16 = off_264A1CE08[a4];
          }
          uint64_t v17 = v16;
          *(_DWORD *)buf = 138543874;
          long long v21 = v15;
          __int16 v22 = 2112;
          id v23 = v8;
          __int16 v24 = 2112;
          uint64_t v25 = v17;
          _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_ERROR, "%{public}@Unable to retrieve server for identifier %@ for link type: %@", buf, 0x20u);
        }
        goto LABEL_14;
      }
      uint64_t v10 = [(HMDAccessoryBrowser *)self btleAccessoryServerBrowser];
    }
    uint64_t v11 = (void *)v10;
    if (v10)
    {
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __90__HMDAccessoryBrowser_currentlyFoundHAPAccessoryServerWithIdentifier_linkType_completion___block_invoke;
      v18[3] = &unk_264A26F18;
      id v19 = v9;
      [v11 matchAccessoryServerWithSetupID:0 serverIdentifier:v8 completionHandler:v18];

      goto LABEL_15;
    }
LABEL_14:
    (*((void (**)(id, void))v9 + 2))(v9, 0);
  }
LABEL_15:
}

uint64_t __90__HMDAccessoryBrowser_currentlyFoundHAPAccessoryServerWithIdentifier_linkType_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_discoverAccessoryServer:(id)a3 linkType:(int64_t)a4 errorHandler:(id)a5
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v8 = (__CFString *)a3;
  id v9 = (void (**)(id, void *))a5;
  if (!v8)
  {
    uint64_t v17 = (void *)MEMORY[0x230FBD990]();
    long long v18 = self;
    id v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      long long v20 = HMFGetLogIdentifier();
      if ((unint64_t)a4 > 2) {
        long long v21 = @"Undefined";
      }
      else {
        long long v21 = off_264A1CE08[a4];
      }
      long long v27 = v21;
      int v30 = 138543618;
      long long v31 = v20;
      __int16 v32 = 2112;
      long long v33 = v27;
      _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_ERROR, "%{public}@Unable to discover accessory for link type: %@ due to missing server identifier", (uint8_t *)&v30, 0x16u);
    }
    goto LABEL_21;
  }
  switch(a4)
  {
    case 0:
      __int16 v22 = [(HMDAccessoryBrowser *)self btleAccessoryServerBrowser];
      [v22 discoverAccessoryServerWithIdentifier:v8];

      goto LABEL_13;
    case 1:
LABEL_13:
      id v23 = [(HMDAccessoryBrowser *)self demoAccessoryServerBrowser];

      if (v23) {
        [(HMDAccessoryBrowser *)self demoAccessoryServerBrowser];
      }
      else {
      __int16 v24 = [(HMDAccessoryBrowser *)self ipAccessoryServerBrowser];
      }
      goto LABEL_25;
    case 2:
      uint64_t v10 = [(HMDAccessoryBrowser *)self discoveringBLEAccessoryServerIdentifiers];
      int v11 = [v10 containsObject:v8];

      if (v11)
      {
        long long v12 = (void *)MEMORY[0x230FBD990]();
        BOOL v13 = self;
        long long v14 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          uint64_t v15 = HMFGetLogIdentifier();
          uint64_t v16 = @"BTLE";
          int v30 = 138543874;
          long long v31 = v15;
          __int16 v32 = 2112;
          long long v33 = v8;
          __int16 v34 = 2112;
          id v35 = @"BTLE";
          _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_ERROR, "%{public}@Retrieval already in progress for accessory with server %@/%@", (uint8_t *)&v30, 0x20u);
        }
LABEL_26:
        long long v28 = 0;
        if (!v9) {
          goto LABEL_23;
        }
        goto LABEL_22;
      }
      __int16 v24 = [(HMDAccessoryBrowser *)self btleAccessoryServerBrowser];
LABEL_25:
      long long v29 = v24;
      [v24 discoverAccessoryServerWithIdentifier:v8];

      goto LABEL_26;
  }
  uint64_t v17 = (void *)MEMORY[0x230FBD990]();
  long long v18 = self;
  id v19 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    uint64_t v25 = HMFGetLogIdentifier();
    uint64_t v26 = @"Undefined";
    int v30 = 138543874;
    long long v31 = v25;
    __int16 v32 = 2112;
    long long v33 = v8;
    __int16 v34 = 2112;
    id v35 = @"Undefined";
    _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_ERROR, "%{public}@Unable to retrieve server for accessory with identifier %@, due to unknown link type: %@", (uint8_t *)&v30, 0x20u);
  }
LABEL_21:

  long long v28 = [MEMORY[0x263F087E8] hmErrorWithCode:3];
  if (v9) {
LABEL_22:
  }
    v9[2](v9, v28);
LABEL_23:
}

- (void)timerDidFire:(id)a3
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = [(HMDAccessoryBrowser *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(HMDAccessoryBrowser *)self stopReprovisioningTimer];

  if (v6 == v4)
  {
    [(HMDAccessoryBrowser *)self _stopReprovisioningTimerHandler];
    goto LABEL_39;
  }
  id v7 = [(HMDAccessoryBrowser *)self stopBrowsingAccessoriesNeedingReprovisioningTimer];

  if (v7 == v4)
  {
    id v19 = [(HMDAccessoryBrowser *)self ipAccessoryServerBrowser];
    [v19 stopDiscoveringWACAccessoryServersWithInvalidation:1];

    goto LABEL_39;
  }
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v8 = [(HMDAccessoryBrowser *)self currentlyPairingAccessories];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v48 objects:v54 count:16];
  if (!v9) {
    goto LABEL_38;
  }
  uint64_t v10 = *(void *)v49;
  while (2)
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      if (*(void *)v49 != v10) {
        objc_enumerationMutation(v8);
      }
      long long v12 = *(void **)(*((void *)&v48 + 1) + 8 * i);
      id v13 = [v12 pairingInterruptionTimer];
      BOOL v14 = v13 == v4;

      if (v14)
      {
        __int16 v34 = [(HMDAccessoryBrowser *)self _unpairedAccessoryMatchingPairingInfo:v12];
        long long v20 = [MEMORY[0x263F087E8] hmErrorWithCode:4];
        [(HMDAccessoryBrowser *)self _handlePairingInterruptedTimeout:v34 error:v20];
LABEL_37:

        goto LABEL_38;
      }
      id v15 = [v12 reconfirmTimer];
      BOOL v16 = v15 == v4;

      if (v16)
      {
        __int16 v34 = [(HMDAccessoryBrowser *)self _unpairedAccessoryMatchingPairingInfo:v12];
        long long v46 = 0u;
        long long v47 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        long long v20 = [v34 accessoryServers];
        uint64_t v21 = [v20 countByEnumeratingWithState:&v44 objects:v53 count:16];
        if (v21)
        {
          uint64_t v22 = *(void *)v45;
          while (2)
          {
            for (uint64_t j = 0; j != v21; ++j)
            {
              if (*(void *)v45 != v22) {
                objc_enumerationMutation(v20);
              }
              __int16 v24 = *(void **)(*((void *)&v44 + 1) + 8 * j);
              uint64_t v25 = [v24 linkType];
              if (v25 == [v12 linkType])
              {
                long long v31 = [v12 pairingActivity];
                v40[0] = MEMORY[0x263EF8330];
                v40[1] = 3221225472;
                v40[2] = __36__HMDAccessoryBrowser_timerDidFire___block_invoke;
                v40[3] = &unk_264A2F2F8;
                id v32 = v31;
                id v41 = v32;
                __int16 v42 = v12;
                id v43 = v24;
                __36__HMDAccessoryBrowser_timerDidFire___block_invoke(v40);
                [v32 begin];
                id v39 = v32;
                long long v33 = [v12 pairingRequest];
                [v24 startPairingWithRequest:v33];

                __HMFActivityScopeLeave();
                goto LABEL_37;
              }
            }
            uint64_t v21 = [v20 countByEnumeratingWithState:&v44 objects:v53 count:16];
            if (v21) {
              continue;
            }
            break;
          }
        }
        goto LABEL_37;
      }
      id v17 = [v12 pairingRetryTimer];
      BOOL v18 = v17 == v4;

      if (v18)
      {
        __int16 v34 = [(HMDAccessoryBrowser *)self _unpairedAccessoryMatchingPairingInfo:v12];
        long long v37 = 0u;
        long long v38 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        long long v20 = [v34 accessoryServers];
        uint64_t v26 = [v20 countByEnumeratingWithState:&v35 objects:v52 count:16];
        if (v26)
        {
          uint64_t v27 = *(void *)v36;
          while (2)
          {
            for (uint64_t k = 0; k != v26; ++k)
            {
              if (*(void *)v36 != v27) {
                objc_enumerationMutation(v20);
              }
              long long v29 = *(void **)(*((void *)&v35 + 1) + 8 * k);
              uint64_t v30 = [v29 linkType];
              if (v30 == [v12 linkType])
              {
                [(HMDAccessoryBrowser *)self _promptForPairingPasswordForServer:v29 reason:@"HMSetupCodeProviderReasontTimeoutRetry"];
                goto LABEL_37;
              }
            }
            uint64_t v26 = [v20 countByEnumeratingWithState:&v35 objects:v52 count:16];
            if (v26) {
              continue;
            }
            break;
          }
        }
        goto LABEL_37;
      }
    }
    uint64_t v9 = [v8 countByEnumeratingWithState:&v48 objects:v54 count:16];
    if (v9) {
      continue;
    }
    break;
  }
LABEL_38:

LABEL_39:
}

void *__36__HMDAccessoryBrowser_timerDidFire___block_invoke(void *result)
{
  v1 = (void *)result[4];
  if (v1)
  {
    int v2 = result;
    id v3 = (void *)result[5];
    id v4 = v1;
    [v3 accessoryUUID];

    int v5 = [(id)v2[5] setupID];
    id v6 = (id)HMFBooleanToString();

    [(id)v2[5] wacAccessory];
    id v7 = (id)HMFBooleanToString();
    [(id)v2[5] legacyWAC];
    id v8 = (id)HMFBooleanToString();
    [(id)v2[5] linkType];
    id v9 = (id)HAPLinkTypeDescription();
    [(id)v2[6] communicationProtocol];

    return (id)HAPCommunicationProtocolDescription();
  }
  return result;
}

- (void)_stopReprovisioningTimerHandler
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = [(HMDAccessoryBrowser *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)MEMORY[0x230FBD990]();
  int v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    int v18 = 138543362;
    id v19 = v6;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@[Accessory Browser] Stop reprovisioning timer fired", (uint8_t *)&v18, 0xCu);
  }
  id v7 = [(HMDAccessoryBrowser *)self currentlyPairingAccessories];
  uint64_t v8 = [v7 count];

  if (!v8)
  {
    id v9 = (void *)MEMORY[0x230FBD990]();
    uint64_t v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v11 = HMFGetLogIdentifier();
      int v18 = 138543362;
      id v19 = v11;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@[Accessory Browser] Stopping browsing for WAC servers", (uint8_t *)&v18, 0xCu);
    }
    long long v12 = [(HMDAccessoryBrowser *)self ipAccessoryServerBrowser];
    [v12 stopDiscoveringWACAccessoryServersWithInvalidation:1];
  }
  id v13 = [MEMORY[0x263F087E8] hmErrorWithCode:8];
  BOOL v14 = [(HMDAccessoryBrowser *)self identifierOfAccessoryBeingReprovisioned];
  [(HMDAccessoryBrowser *)self _notifyDelegateOfWACCompletionForAccessoryServerWithIdentifier:v14 error:v13];

  id v15 = (void *)MEMORY[0x230FBD990]();
  BOOL v16 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    id v17 = HMFGetLogIdentifier();
    int v18 = 138543362;
    id v19 = v17;
    _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@[Accessory Browser] Clean up reprovisioning accessory", (uint8_t *)&v18, 0xCu);
  }
  [(HMDAccessoryBrowser *)self setIdentifierOfAccessoryBeingReprovisioned:0];
  [(HMDAccessoryBrowser *)self setWiFiPSKForAccessoryReprovisioning:0];
}

- (void)evaluateAccessoryDiscoveryState
{
  if (isWatch())
  {
    id v3 = [(HMDAccessoryBrowser *)self workQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __54__HMDAccessoryBrowser_evaluateAccessoryDiscoveryState__block_invoke;
    block[3] = &unk_264A2F7F8;
    void block[4] = self;
    dispatch_async(v3, block);
  }
}

uint64_t __54__HMDAccessoryBrowser_evaluateAccessoryDiscoveryState__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startOrStopAccessoryDiscovery];
}

- (void)_stopBtleAccessoryReachabilityProbeTimer
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (isBTLECapableDevice())
  {
    id v3 = [(HMDAccessoryBrowser *)self reachabilityTimerForBTLE];

    if (v3)
    {
      id v4 = (void *)MEMORY[0x230FBD990]();
      int v5 = self;
      id v6 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        id v7 = HMFGetLogIdentifier();
        int v9 = 138543362;
        uint64_t v10 = v7;
        _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Suspending the BTLE reachability probe timer", (uint8_t *)&v9, 0xCu);
      }
      uint64_t v8 = [(HMDAccessoryBrowser *)v5 reachabilityTimerForBTLE];
      dispatch_source_cancel(v8);

      [(HMDAccessoryBrowser *)v5 setReachabilityTimerForBTLE:0];
    }
    [(HMDAccessoryBrowser *)self _notifyDelegateOfReachabilityChangeChange:0 forBTLEAccessories:0];
  }
}

- (void)_btleAccessoryReachabilityProbeTimer:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v36 = *MEMORY[0x263EF8340];
  if (isBTLECapableDevice())
  {
    if ([(HMDAccessoryBrowser *)self isBrowsingAllowed])
    {
      int v5 = [(HMDAccessoryBrowser *)self reachabilityTimerForBTLE];

      if (v5)
      {
        id v6 = [(HMDAccessoryBrowser *)self reachabilityTimerForBTLE];
        dispatch_source_cancel(v6);

        [(HMDAccessoryBrowser *)self setReachabilityTimerForBTLE:0];
      }
      id v7 = [(HMDAccessoryBrowser *)self workQueue];
      dispatch_source_t v8 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, v7);
      [(HMDAccessoryBrowser *)self setReachabilityTimerForBTLE:v8];

      uint64_t v9 = btleReachabilityLeewayNanoseconds;
      uint64_t v10 = btleReachabilityTimerNanoseconds;
      if (v3) {
        int64_t v11 = 0;
      }
      else {
        int64_t v11 = btleReachabilityTimerNanoseconds;
      }
      dispatch_time_t v12 = dispatch_time(0, v11);
      id v13 = [(HMDAccessoryBrowser *)self homeManager];
      BOOL v14 = [v13 homes];
      id v15 = objc_msgSend(v14, "na_firstObjectPassingTest:", &__block_literal_global_440_210336);

      if (v15)
      {
        uint64_t v10 = btleReachabilityTimerNanoseconds / (unint64_t)btleReachabilityProbeReduceFactor;
        if (!v3) {
          dispatch_time_t v12 = dispatch_time(0, btleReachabilityTimerNanoseconds / (unint64_t)btleReachabilityProbeReduceFactor);
        }
        BOOL v16 = (void *)MEMORY[0x230FBD990]();
        id v17 = self;
        int v18 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          id v19 = HMFGetLogIdentifier();
          uint64_t v20 = [v15 shortDescription];
          *(_DWORD *)buf = 138543874;
          long long v31 = v19;
          __int16 v32 = 2112;
          long long v33 = v20;
          __int16 v34 = 2048;
          unint64_t v35 = v10 / 0x3B9ACA00;
          _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_DEBUG, "%{public}@In home: %@ location probing reachability every %llu sec", buf, 0x20u);
        }
      }
      isWatch();
      if ([(HMDAccessoryBrowser *)self unitTestBTLEReachabilityInterval])
      {
        uint64_t v10 = [(HMDAccessoryBrowser *)self unitTestBTLEReachabilityInterval];
        uint64_t v9 = 0;
      }
      uint64_t v21 = [(HMDAccessoryBrowser *)self reachabilityTimerForBTLE];
      dispatch_source_set_timer(v21, v12, v10, v9);

      objc_initWeak((id *)buf, self);
      uint64_t v22 = [(HMDAccessoryBrowser *)self reachabilityTimerForBTLE];
      handler[0] = MEMORY[0x263EF8330];
      handler[1] = 3221225472;
      handler[2] = __60__HMDAccessoryBrowser__btleAccessoryReachabilityProbeTimer___block_invoke_441;
      handler[3] = &unk_264A2C170;
      objc_copyWeak(&v29, (id *)buf);
      dispatch_source_set_event_handler(v22, handler);

      id v23 = [(HMDAccessoryBrowser *)self reachabilityTimerForBTLE];
      dispatch_resume(v23);

      objc_destroyWeak(&v29);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      __int16 v24 = (void *)MEMORY[0x230FBD990]();
      uint64_t v25 = self;
      uint64_t v26 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        uint64_t v27 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        long long v31 = v27;
        _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_INFO, "%{public}@Ignoring request to start BTLE reachability timer", buf, 0xCu);
      }
    }
  }
}

void __60__HMDAccessoryBrowser__btleAccessoryReachabilityProbeTimer___block_invoke_441(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  BOOL v3 = [WeakRetained identifiersOfPairedBTLEAccessories];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __60__HMDAccessoryBrowser__btleAccessoryReachabilityProbeTimer___block_invoke_2;
  v23[3] = &unk_264A2C320;
  v23[4] = WeakRetained;
  id v4 = objc_msgSend(v3, "na_map:", v23);

  if ([WeakRetained areThereAnyPairedUnknownLinkTypeAccessories])
  {
    int v5 = [WeakRetained identifiersOfPairedUnknownLinkTypeAccessories];
    uint64_t v6 = [v4 arrayByAddingObjectsFromArray:v5];

    id v4 = (void *)v6;
  }
  if (([WeakRetained active] & 1) == 0)
  {

    id v4 = 0;
  }
  id v7 = [WeakRetained btleAccessoryServerBrowser];
  if (v7)
  {
    BOOL v8 = [v4 count] == 0;

    if (!v8)
    {
      uint64_t v18 = MEMORY[0x263EF8330];
      uint64_t v19 = 3221225472;
      uint64_t v20 = __60__HMDAccessoryBrowser__btleAccessoryReachabilityProbeTimer___block_invoke_3;
      uint64_t v21 = &unk_264A26EF0;
      objc_copyWeak(&v22, v1);
      uint64_t v9 = _Block_copy(&v18);
      id v13 = (void *)MEMORY[0x230FBD990](v9, v10, v11, v12);
      id v14 = WeakRetained;
      HMFGetOSLogHandle();
      id v15 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        BOOL v16 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        uint64_t v25 = v16;
        _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@BTLE reachability probe timer fired.", buf, 0xCu);
      }
      id v17 = objc_msgSend(v14, "btleAccessoryServerBrowser", v18, v19, v20, v21);
      [v17 probeReachabilityForAccessoryServersWithIdentifiers:v4 forceScan:0 withCompletion:v9];

      objc_destroyWeak(&v22);
    }
  }
}

id __60__HMDAccessoryBrowser__btleAccessoryReachabilityProbeTimer___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) pairedAccessoryInformationWithIdentifier:v3];
  int v5 = [v4 delegate];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = v6;

  if ([v7 isCurrentDeviceAvailableResident])
  {
    id v8 = v3;
    goto LABEL_12;
  }
  if (!v7) {
    goto LABEL_11;
  }
  uint64_t v9 = +[HMDDeviceCapabilities deviceCapabilities];
  char v10 = [v9 isResidentCapable];

  if (v10) {
    goto LABEL_11;
  }
  uint64_t v11 = [v7 hapAccessoryWithIdentifier:v3 instanceID:0];
  uint64_t v12 = v11;
  if (!v11 || ([v11 reachableTransports] & 9) != 0)
  {

LABEL_11:
    id v8 = 0;
    goto LABEL_12;
  }
  id v8 = v3;

LABEL_12:
  return v8;
}

void __60__HMDAccessoryBrowser__btleAccessoryReachabilityProbeTimer___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = (id *)(a1 + 32);
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained _notifyDelegateOfReachabilityChangeChange:a3 forBTLEAccessories:v5];
}

uint64_t __60__HMDAccessoryBrowser__btleAccessoryReachabilityProbeTimer___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 homeLocation] == 1 || (objc_msgSend(v2, "isAnyBTLEAccessoryReachable") & 1) != 0) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = [v2 isCurrentDeviceAvailableResident];
  }

  return v3;
}

- (void)cancelPairingWithAccessory:(id)a3 error:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(HMDAccessoryBrowser *)self workQueue];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __64__HMDAccessoryBrowser_cancelPairingWithAccessory_error_context___block_invoke;
  v15[3] = &unk_264A2E610;
  void v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

void __64__HMDAccessoryBrowser_cancelPairingWithAccessory_error_context___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _cancelPairingWithAccessory:*(void *)(a1 + 40) error:*(void *)(a1 + 48) context:*(void *)(a1 + 56)];
  id v7 = [*(id *)(a1 + 32) _pairingInformationForUnpairedAccessory:*(void *)(a1 + 40)];
  if (v7)
  {
    id v2 = [*(id *)(a1 + 32) currentlyPairingAccessories];
    [v2 removeObject:v7];
  }
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) uuid];
  id v5 = [v3 _progressHandlerForUnpairedAccessory:v4];

  if (v5)
  {
    uint64_t v6 = [*(id *)(a1 + 32) currentlyPairingProgressHandlers];
    [v6 removeObject:v5];
  }
}

- (void)handleSetupCodeAvailable:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDAccessoryBrowser *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __48__HMDAccessoryBrowser_handleSetupCodeAvailable___block_invoke;
  v7[3] = &unk_264A2F820;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __48__HMDAccessoryBrowser_handleSetupCodeAvailable___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleSetupCodeAvailable:*(void *)(a1 + 40)];
}

- (void)didReceiveUserConsentResponseForSetupAccessoryDetail:(id)a3 consent:(BOOL)a4
{
  id v6 = a3;
  id v7 = [(HMDAccessoryBrowser *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __84__HMDAccessoryBrowser_didReceiveUserConsentResponseForSetupAccessoryDetail_consent___block_invoke;
  block[3] = &unk_264A2DFC8;
  void block[4] = self;
  id v10 = v6;
  BOOL v11 = a4;
  id v8 = v6;
  dispatch_async(v7, block);
}

void __84__HMDAccessoryBrowser_didReceiveUserConsentResponseForSetupAccessoryDetail_consent___block_invoke(uint64_t a1)
{
  id v16 = [*(id *)(a1 + 32) findAccessoryServerForAccessoryDescription:*(void *)(a1 + 40)];
  id v2 = objc_msgSend(*(id *)(a1 + 32), "unpairedAccessoryForServer:");
  uint64_t v3 = [*(id *)(a1 + 32) _pairingInformationForUnpairedAccessory:v2];
  id v4 = v3;
  if (*(unsigned char *)(a1 + 48))
  {
    id v5 = [v3 addAccessoryProgressHandler];
    if (v5) {
      goto LABEL_4;
    }
    id v6 = *(void **)(a1 + 32);
    id v7 = [v2 uuid];
    id v8 = [v6 _progressHandlerForUnpairedAccessory:v7];
    id v5 = [v8 progressHandler];

    if (v5)
    {
LABEL_4:
      id v9 = [HMDAddAccessoryProgressState alloc];
      id v10 = [v2 uuid];
      BOOL v11 = [v2 name];
      id v12 = [v2 category];
      id v13 = [v16 productData];
      id v14 = [(HMDAddAccessoryProgressState *)v9 initWithUUID:v10 accessoryName:v11 manufacturerName:0 category:v12 certificationStatus:1 productData:v13];

      ((void (**)(void, uint64_t, HMDAddAccessoryProgressState *))v5)[2](v5, 2, v14);
      ((void (**)(void, uint64_t, HMDAddAccessoryProgressState *))v5)[2](v5, 7, v14);
    }
    BOOL v15 = *(unsigned char *)(a1 + 48) != 0;
  }
  else
  {
    BOOL v15 = 0;
  }
  [*(id *)(a1 + 32) _continueAfterPPIDValidation:v15 server:v16];
}

- (void)removePairingInformationForAccessoryServer:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDAccessoryBrowser *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __66__HMDAccessoryBrowser_removePairingInformationForAccessoryServer___block_invoke;
  v7[3] = &unk_264A2F820;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __66__HMDAccessoryBrowser_removePairingInformationForAccessoryServer___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) unpairedAccessoryForServer:*(void *)(a1 + 40)];
  if (v2)
  {
    uint64_t v3 = v2;
    [*(id *)(a1 + 32) _removePairingInformationForUnpairedAccessory:v2];
    id v2 = v3;
  }
}

- (id)unpairedHAPAccessoryWithAccessoryDescription:(id)a3
{
  id v4 = [(HMDAccessoryBrowser *)self findAccessoryServerForAccessoryDescription:a3];
  id v5 = [(HMDAccessoryBrowser *)self unpairedAccessoryForServer:v4];

  return v5;
}

- (void)pairAccessoryWithDescription:(id)a3 configuration:(id)a4 progressHandler:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(HMDAccessoryBrowser *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __100__HMDAccessoryBrowser_pairAccessoryWithDescription_configuration_progressHandler_completionHandler___block_invoke;
  block[3] = &unk_264A26EC8;
  void block[4] = self;
  id v20 = v10;
  id v21 = v11;
  id v22 = v12;
  id v23 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  dispatch_async(v14, block);
}

uint64_t __100__HMDAccessoryBrowser_pairAccessoryWithDescription_configuration_progressHandler_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _pairAccessoryWithDescription:*(void *)(a1 + 40) configuration:*(void *)(a1 + 48) progressHandler:*(void *)(a1 + 56) completionHandler:*(void *)(a1 + 64)];
}

- (void)pairAccessory:(id)a3 configuration:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(HMDAccessoryBrowser *)self workQueue];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __69__HMDAccessoryBrowser_pairAccessory_configuration_completionHandler___block_invoke;
  v15[3] = &unk_264A2EE30;
  void v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

uint64_t __69__HMDAccessoryBrowser_pairAccessory_configuration_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _pairAccessory:*(void *)(a1 + 40) configuration:*(void *)(a1 + 48) completionHandler:*(void *)(a1 + 56)];
}

- (void)registerProgressHandler:(id)a3 unpairedAccessoryUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDAccessoryBrowser *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __69__HMDAccessoryBrowser_registerProgressHandler_unpairedAccessoryUUID___block_invoke;
  block[3] = &unk_264A2EE80;
  void block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

void __69__HMDAccessoryBrowser_registerProgressHandler_unpairedAccessoryUUID___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _progressHandlerForUnpairedAccessory:*(void *)(a1 + 40)];
  if (v2)
  {
    uint64_t v3 = [*(id *)(a1 + 32) currentlyPairingProgressHandlers];
    [v3 removeObject:v2];
  }
  id v5 = [[HMDUnpairedHAPAccessoryProgressHandler alloc] initWithAccessoryUUID:*(void *)(a1 + 40) progressHandler:*(void *)(a1 + 48)];

  id v4 = [*(id *)(a1 + 32) currentlyPairingProgressHandlers];
  [v4 addObject:v5];
}

- (void)_removeDiscoveredAccessoryServerIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = v4;
    os_unfair_lock_lock_with_options();
    [(NSMutableSet *)self->_discoveredAccessoryServerIdentifiers removeObject:v5];
    os_unfair_lock_unlock(&self->_lock);
    id v4 = v5;
  }
}

- (void)_addDiscoveredAccessoryServerIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = v4;
    os_unfair_lock_lock_with_options();
    [(NSMutableSet *)self->_discoveredAccessoryServerIdentifiers addObject:v5];
    os_unfair_lock_unlock(&self->_lock);
    id v4 = v5;
  }
}

- (id)discoveredAccessoryServers
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = (void *)[(NSMutableSet *)self->_discoveredAccessoryServerIdentifiers copy];
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)addUnpairedAccessoryServer:(id)a3 identifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDAccessoryBrowser *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __61__HMDAccessoryBrowser_addUnpairedAccessoryServer_identifier___block_invoke;
  block[3] = &unk_264A2F2F8;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __61__HMDAccessoryBrowser_addUnpairedAccessoryServer_identifier___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v2 = *(void **)(a1 + 32);
  if (v2)
  {
    id v3 = v2;
  }
  else
  {
    id v3 = [*(id *)(a1 + 40) _tombstonedAccessoryServerWithServerIdentifier:*(void *)(a1 + 48)];
    if (!v3) {
      goto LABEL_14;
    }
  }
  if ([*(id *)(a1 + 40) _isAccessoryServerTombstoned:v3]
    && ([*(id *)(a1 + 40) _shouldAccessoryServerBeTombstoned:v3] & 1) == 0)
  {
    [*(id *)(a1 + 40) _resurrectAccessoryServer:v3];
  }
  if ([v3 linkType] == 1 && (objc_msgSend(v3, "hasPairings") & 1) == 0)
  {
    if ([v3 isPaired])
    {
      id v4 = (void *)MEMORY[0x230FBD990]();
      id v5 = *(id *)(a1 + 40);
      id v6 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        id v7 = HMFGetLogIdentifier();
        id v8 = [v3 identifier];
        int v9 = 138543618;
        id v10 = v7;
        __int16 v11 = 2112;
        id v12 = v8;
        _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Accessory server %@ reports it is unpaired, but we have pairings for it", (uint8_t *)&v9, 0x16u);
      }
    }
    else
    {
      [*(id *)(a1 + 40) _addUnpairedAccessoryForServer:v3];
      [v3 reconfirm];
    }
  }
LABEL_14:
}

- (void)deregisterPairedAccessory:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    id v5 = (void *)MEMORY[0x230FBD990]();
    id v6 = self;
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v18 = v8;
      __int16 v19 = 2112;
      id v20 = v4;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@De-registering accessory server %@", buf, 0x16u);
    }
    [(HMDAccessoryBrowser *)v6 removePairedAccessoryInfoWithIdentifier:v4];
    int v9 = [(HMDAccessoryBrowser *)v6 btleAccessoryServerBrowser];
    [v9 deRegisterAccessoryWithIdentifier:v4];

    id v10 = [(HMDAccessoryBrowser *)v6 ipAccessoryServerBrowser];
    [v10 deRegisterAccessoryWithIdentifier:v4];

    __int16 v11 = [(HMDAccessoryBrowser *)v6 hap2AccessoryServerBrowser];
    [v11 deRegisterAccessoryWithIdentifier:v4];

    id v12 = [(HMDAccessoryBrowser *)v6 hap2Storage];
    [v12 deregisterPairedAccessoryWithIdentifier:v4];

    uint64_t v13 = [(HMDAccessoryBrowser *)v6 chipAccessoryServerBrowser];
    [v13 deRegisterAccessoryWithIdentifier:v4];

    id v14 = [(HMDAccessoryBrowser *)v6 mediaBrowser];
    id v16 = v4;
    id v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v16 count:1];
    [v14 deregisterAccessories:v15];
  }
}

- (void)registerPairedAccessory:(id)a3 transports:(unint64_t)a4 setupHash:(id)a5 delegate:(id)a6
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if (!v10) {
    goto LABEL_20;
  }
  if (a4)
  {
    if ((a4 & 2) != 0)
    {
      uint64_t v13 = (void *)MEMORY[0x230FBD990]();
      id v14 = self;
      id v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        id v16 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        long long v46 = v16;
        __int16 v47 = 2112;
        id v48 = v10;
        _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@Registering BTLE accessory server %@", buf, 0x16u);
      }
      id v17 = [(HMDAccessoryBrowser *)v14 btleAccessoryServerBrowser];
      [v17 registerPairedAccessoryWithIdentifier:v10];
    }
    if ((a4 & 0x10) != 0)
    {
      id v18 = (void *)MEMORY[0x230FBD990]();
      __int16 v19 = self;
      id v20 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        uint64_t v21 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        long long v46 = v21;
        __int16 v47 = 2112;
        id v48 = v10;
        _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_INFO, "%{public}@Registering media accessory %@", buf, 0x16u);
      }
      id v22 = [(HMDAccessoryBrowser *)v19 mediaBrowser];
      id v43 = v10;
      id v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v43 count:1];
      [v22 registerAccessories:v23];

      goto LABEL_15;
    }
  }
  else
  {
    __int16 v24 = (void *)MEMORY[0x230FBD990]();
    uint64_t v25 = self;
    uint64_t v26 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      uint64_t v27 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      long long v46 = v27;
      __int16 v47 = 2112;
      id v48 = v10;
      _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_INFO, "%{public}@Registering paired accessory: %@ with all browser types since transport type is none", buf, 0x16u);
    }
    long long v28 = [(HMDAccessoryBrowser *)v25 btleAccessoryServerBrowser];
    [v28 registerPairedAccessoryWithIdentifier:v10];

    id v29 = [(HMDAccessoryBrowser *)v25 mediaBrowser];
    id v44 = v10;
    uint64_t v30 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v44 count:1];
    [v29 registerAccessories:v30];

    long long v31 = [(HMDAccessoryBrowser *)v25 hap2AccessoryServerBrowser];
    [v31 registerPairedAccessoryWithIdentifier:v10];

    __int16 v32 = [(HMDAccessoryBrowser *)v25 hap2Storage];
    [v32 registerPairedAccessoryWithIdentifier:v10];

    long long v33 = [(HMDAccessoryBrowser *)v25 ipAccessoryServerBrowser];
    [v33 registerPairedAccessoryWithIdentifier:v10];

    __int16 v34 = [(HMDAccessoryBrowser *)v25 chipAccessoryServerBrowser];
    [v34 registerPairedAccessoryWithIdentifier:v10];
  }
  unint64_t v35 = [(HMDAccessoryBrowser *)self hap2AccessoryServerBrowser];
  [v35 registerPairedAccessoryWithIdentifier:v10];

  id v22 = [(HMDAccessoryBrowser *)self hap2Storage];
  [v22 registerPairedAccessoryWithIdentifier:v10];
LABEL_15:

  if (a4)
  {
    uint64_t v36 = (void *)MEMORY[0x230FBD990]();
    long long v37 = self;
    long long v38 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    {
      id v39 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      long long v46 = v39;
      __int16 v47 = 2112;
      id v48 = v10;
      _os_log_impl(&dword_22F52A000, v38, OS_LOG_TYPE_INFO, "%{public}@Registering IP accessory server %@", buf, 0x16u);
    }
    __int16 v40 = [(HMDAccessoryBrowser *)v37 ipAccessoryServerBrowser];
    [v40 registerPairedAccessoryWithIdentifier:v10];

    id v41 = [(HMDAccessoryBrowser *)v37 chipAccessoryServerBrowser];
    [v41 registerPairedAccessoryWithIdentifier:v10];
  }
  __int16 v42 = [[HMDPairedAccessoryInformation alloc] initWithIdentifier:v10 transports:a4 setupHash:v11 delegate:v12];
  [(HMDAccessoryBrowser *)self addPairedAccessory:v42];

LABEL_20:
}

- (void)_addUnpairedAccessoryForServer:(id)a3
{
  uint64_t v105 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDAccessoryBrowser *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [v4 identifier];
  id v7 = [(HMDAccessoryBrowser *)self unpairedAccessoryWithServerIdentifier:v6];

  if (v7)
  {
    id v8 = (void *)MEMORY[0x230FBD990]();
    int v9 = self;
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v11 = HMFGetLogIdentifier();
      unint64_t v12 = [v4 linkType];
      if (v12 > 2) {
        uint64_t v13 = @"Undefined";
      }
      else {
        uint64_t v13 = off_264A1CE08[v12];
      }
      id v23 = v13;
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = v11;
      __int16 v101 = 2112;
      int64_t v102 = (HMDUnpairedHAPAccessory *)v23;
      __int16 v103 = 2112;
      id v104 = v7;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Found accessory server (transport %@) for unpaired accessory: %@", buf, 0x20u);
    }
    [(HMDUnpairedHAPAccessory *)v7 addAccessoryServer:v4];
    [(HMDAccessoryBrowser *)v9 _associateMediaAccessoryForServer:v4];
    v91 = [(HMDAccessoryBrowser *)v9 _pairingInformationForUnpairedAccessory:v7];
    if (v91)
    {
      uint64_t v24 = [v91 linkType];
      if (v24 == [v4 linkType])
      {
        id v25 = v4;
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          uint64_t v26 = v25;
        }
        else {
          uint64_t v26 = 0;
        }
        id v89 = v26;

        if (v89)
        {
          objc_msgSend(v91, "setWacAccessory:", objc_msgSend(v89, "isWacAccessory"));
          uint64_t v27 = objc_msgSend(v91, "setLegacyWAC:", objc_msgSend(v89, "isWacLegacy"));
        }
        long long v28 = (void *)MEMORY[0x230FBD990](v27);
        id v29 = v9;
        uint64_t v30 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
          long long v31 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          *(void *)&uint8_t buf[4] = v31;
          __int16 v101 = 2112;
          int64_t v102 = v7;
          _os_log_impl(&dword_22F52A000, v30, OS_LOG_TYPE_INFO, "%{public}@Restarting the pairing process for unpaired accessory: %@", buf, 0x16u);
        }
        __int16 v32 = [v91 pairingActivity];
        v92[0] = MEMORY[0x263EF8330];
        v92[1] = 3221225472;
        v92[2] = __54__HMDAccessoryBrowser__addUnpairedAccessoryForServer___block_invoke_435;
        v92[3] = &unk_264A2F2F8;
        id v87 = v32;
        id v93 = v87;
        id v33 = v91;
        id v94 = v33;
        id v83 = v25;
        id v95 = v83;
        __54__HMDAccessoryBrowser__addUnpairedAccessoryForServer___block_invoke_435(v92);
        __int16 v34 = [v33 addAccessoryProgressHandler];
        if (v34) {
          goto LABEL_25;
        }
        unint64_t v35 = [(HMDUnassociatedAccessory *)v7 uuid];
        uint64_t v36 = [(HMDAccessoryBrowser *)v29 _progressHandlerForUnpairedAccessory:v35];
        __int16 v34 = [v36 progressHandler];

        if (v34)
        {
LABEL_25:
          long long v37 = [HMDAddAccessoryProgressState alloc];
          long long v38 = [(HMDUnassociatedAccessory *)v7 uuid];
          id v39 = [(HMDUnassociatedAccessory *)v7 name];
          __int16 v40 = [(HMDUnassociatedAccessory *)v7 category];
          id v41 = [v83 productData];
          __int16 v42 = [(HMDAddAccessoryProgressState *)v37 initWithUUID:v38 accessoryName:v39 manufacturerName:0 category:v40 certificationStatus:0 productData:v41];

          ((void (**)(void, uint64_t, HMDAddAccessoryProgressState *))v34)[2](v34, 11, v42);
        }
        objc_msgSend(v87, "begin", v83);
        id v43 = v87;
        *(void *)buf = v43;
        id v44 = [v33 pairingRequest];
        [v84 startPairingWithRequest:v44];

        __HMFActivityScopeLeave();
      }
    }
    [(HMDAccessoryBrowser *)v9 _handleAddedAccessory:v7];
  }
  else
  {
    id v14 = [HMDUnpairedHAPAccessory alloc];
    id v15 = [(HMDAccessoryBrowser *)self messageDispatcher];
    id v7 = [(HMDUnpairedHAPAccessory *)v14 initWithAccessoryServer:v4 messageDispatcher:v15];

    v91 = [(HMDAccessoryBrowser *)self unpairedAccessoryManagerDelegate];
    if (v91)
    {
      id v16 = [v91 updatedUUIDForDiscoveredUnpairedAccessory:v7];
      if (v16) {
        [(HMDUnassociatedAccessory *)v7 setUUID:v16];
      }
    }
    id v17 = (void *)MEMORY[0x230FBD990]();
    id v18 = self;
    __int16 v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      id v20 = HMFGetLogIdentifier();
      unint64_t v21 = [v4 linkType];
      if (v21 > 2) {
        id v22 = @"Undefined";
      }
      else {
        id v22 = off_264A1CE08[v21];
      }
      long long v45 = v22;
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = v20;
      __int16 v101 = 2112;
      int64_t v102 = v7;
      __int16 v103 = 2112;
      id v104 = (HMDUnpairedHAPAccessory *)v45;
      _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_INFO, "%{public}@Found new unpaired accessory: %@ with transport %@", buf, 0x20u);
    }
    [(HMDAccessoryBrowser *)v18 addUnpairedHAPAccessory:v7];
    [(HMDAccessoryBrowser *)v18 _associateMediaAccessoryForServer:v4];
    id v46 = v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      __int16 v47 = v46;
    }
    else {
      __int16 v47 = 0;
    }
    id v90 = v47;

    if ([v90 isWacAccessory]) {
      [(HMDAccessoryBrowser *)v18 _handleWACAccessoryFound];
    }
    id v48 = v46;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v49 = v48;
    }
    else {
      uint64_t v49 = 0;
    }
    id v88 = v49;

    if (v88) {
      int v50 = [v88 isLocallyDiscoveredServer] ^ 1;
    }
    else {
      LOBYTE(v50) = 0;
    }
    long long v51 = [(HMDAccessoryBrowser *)v18 _pairingInformationForUnpairedAccessory:v7];
    if (v51)
    {
      __int16 v52 = (void *)MEMORY[0x230FBD990]();
      id v53 = v18;
      uint64_t v54 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
      {
        uint64_t v55 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        *(void *)&uint8_t buf[4] = v55;
        __int16 v101 = 2112;
        int64_t v102 = v7;
        __int16 v103 = 2112;
        id v104 = v51;
        _os_log_impl(&dword_22F52A000, v54, OS_LOG_TYPE_INFO, "%{public}@Starting the pairing process for unpaired accessory: %@ matching setup description %@", buf, 0x20u);
      }
      id v56 = [(HMDUnpairedHAPAccessory *)v51 accessoryName];
      BOOL v57 = v56 == 0;

      if (v57)
      {
        long long v58 = [(HMDUnassociatedAccessory *)v7 name];
        [(HMDUnpairedHAPAccessory *)v51 setAccessoryName:v58];
      }
      long long v59 = [(HMDUnpairedHAPAccessory *)v51 accessoryUUID];
      BOOL v60 = v59 == 0;

      if (v60)
      {
        long long v61 = [(HMDUnassociatedAccessory *)v7 uuid];
        [(HMDUnpairedHAPAccessory *)v51 setAccessoryUUID:v61];
      }
      id v62 = [(HMDUnpairedHAPAccessory *)v51 accessoryServerIdentifier];
      BOOL v63 = v62 == 0;

      if (v63)
      {
        __int16 v64 = [(HMDUnassociatedAccessory *)v7 identifier];
        [(HMDUnpairedHAPAccessory *)v51 setAccessoryServerIdentifier:v64];
      }
      if (![(HMDUnpairedHAPAccessory *)v51 linkType]) {
        -[HMDUnpairedHAPAccessory setLinkType:](v51, "setLinkType:", [v48 linkType]);
      }
      -[HMDUnpairedHAPAccessory setWacAccessory:](v51, "setWacAccessory:", [v90 isWacAccessory]);
      -[HMDUnpairedHAPAccessory setLegacyWAC:](v51, "setLegacyWAC:", [v90 isWacLegacy]);
      id v65 = v48;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        __int16 v66 = v65;
      }
      else {
        __int16 v66 = 0;
      }
      id v85 = v66;

      if (v85) {
        [(HMDAccessoryBrowser *)v53 _setupHMMTRAccessoryServer:v85 pairingInfo:v51];
      }
      uint64_t v67 = [(HMDUnpairedHAPAccessory *)v51 addAccessoryProgressHandler];
      if (!v67)
      {
        __int16 v68 = [(HMDUnassociatedAccessory *)v7 uuid];
        id v69 = [(HMDAccessoryBrowser *)v53 _progressHandlerForUnpairedAccessory:v68];
        uint64_t v67 = [v69 progressHandler];
      }
      if (v67) {
        char v70 = v50;
      }
      else {
        char v70 = 1;
      }
      if ((v70 & 1) == 0)
      {
        id v71 = [HMDAddAccessoryProgressState alloc];
        long long v72 = [(HMDUnassociatedAccessory *)v7 uuid];
        uint64_t v73 = [(HMDUnassociatedAccessory *)v7 name];
        id v74 = [(HMDUnassociatedAccessory *)v7 category];
        id v75 = [v65 productData];
        __int16 v76 = [(HMDAddAccessoryProgressState *)v71 initWithUUID:v72 accessoryName:v73 manufacturerName:0 category:v74 certificationStatus:0 productData:v75];

        ((void (**)(void, uint64_t, HMDAddAccessoryProgressState *))v67)[2](v67, 2, v76);
      }
      id v77 = [(HMDUnpairedHAPAccessory *)v51 pairingActivity];
      v96[0] = MEMORY[0x263EF8330];
      v96[1] = 3221225472;
      v96[2] = __54__HMDAccessoryBrowser__addUnpairedAccessoryForServer___block_invoke;
      v96[3] = &unk_264A2F2F8;
      id v78 = v77;
      id v97 = v78;
      id v79 = v51;
      v98 = v79;
      id v80 = v65;
      id v99 = v80;
      __54__HMDAccessoryBrowser__addUnpairedAccessoryForServer___block_invoke(v96);
      [v78 begin];
      id v81 = v78;
      *(void *)buf = v81;
      __int16 v82 = [(HMDUnpairedHAPAccessory *)v79 pairingRequest];
      [v80 startPairingWithRequest:v82];

      __HMFActivityScopeLeave();
    }
  }
}

void *__54__HMDAccessoryBrowser__addUnpairedAccessoryForServer___block_invoke(void *result)
{
  v1 = (void *)result[4];
  if (v1)
  {
    id v2 = result;
    id v3 = (void *)result[5];
    id v4 = v1;
    [v3 accessoryUUID];

    id v5 = [(id)v2[5] setupID];
    id v6 = (id)HMFBooleanToString();

    [(id)v2[5] wacAccessory];
    id v7 = (id)HMFBooleanToString();
    [(id)v2[5] legacyWAC];
    id v8 = (id)HMFBooleanToString();
    [(id)v2[5] linkType];
    id v9 = (id)HAPLinkTypeDescription();
    [(id)v2[6] communicationProtocol];

    return (id)HAPCommunicationProtocolDescription();
  }
  return result;
}

void *__54__HMDAccessoryBrowser__addUnpairedAccessoryForServer___block_invoke_435(void *result)
{
  v1 = (void *)result[4];
  if (v1)
  {
    id v2 = result;
    id v3 = (void *)result[5];
    id v4 = v1;
    [v3 accessoryUUID];

    id v5 = [(id)v2[5] setupID];
    id v6 = (id)HMFBooleanToString();

    [(id)v2[5] wacAccessory];
    id v7 = (id)HMFBooleanToString();
    [(id)v2[5] legacyWAC];
    id v8 = (id)HMFBooleanToString();
    [(id)v2[5] linkType];
    id v9 = (id)HAPLinkTypeDescription();
    [(id)v2[6] communicationProtocol];

    return (id)HAPCommunicationProtocolDescription();
  }
  return result;
}

- (void)_setupHMMTRAccessoryServer:(id)a3 pairingInfo:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 homeUUID];
  [v6 setPairingTargetHomeUUID:v8];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v9 = [(HMDAccessoryBrowser *)self homeManager];
  id v10 = [v9 homes];

  uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v21;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v21 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        id v16 = [v15 uuid];
        id v17 = [v7 homeUUID];
        int v18 = [v16 isEqual:v17];

        if (v18)
        {
          __int16 v19 = [v15 fabric];
          [v6 setPairingTargetFabric:v19];

          goto LABEL_11;
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (void)_handleWACAccessoryFound
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v2 = [(HMDAccessoryBrowser *)self homeManager];
  id v3 = [v2 homes];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        id v9 = [v8 homeLocationHandler];
        id v10 = [v9 isoCountryCode];

        if (!v10)
        {
          uint64_t v11 = [v8 homeLocationHandler];
          [v11 updateHomeLocation];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
}

- (void)_removePairingInformationForUnpairedAccessory:(id)a3
{
  id v16 = a3;
  uint64_t v4 = [(HMDAccessoryBrowser *)self workQueue];
  dispatch_assert_queue_V2(v4);

  uint64_t v5 = [(HMDAccessoryBrowser *)self _pairingInformationForUnpairedAccessory:v16];
  uint64_t v6 = [v5 pairingRetryTimer];

  if (v6)
  {
    id v7 = [v5 pairingRetryTimer];
    [v7 suspend];

    [v5 setPairingRetryTimer:0];
  }
  id v8 = [v5 pairingInterruptionTimer];

  if (v8)
  {
    id v9 = [v5 pairingInterruptionTimer];
    [v9 suspend];

    [v5 setPairingInterruptionTimer:0];
  }
  id v10 = [v5 reconfirmTimer];

  if (v10)
  {
    uint64_t v11 = [v5 reconfirmTimer];
    [v11 suspend];

    [v5 setReconfirmTimer:0];
  }
  if (v5)
  {
    long long v12 = [(HMDAccessoryBrowser *)self currentlyPairingAccessories];
    [v12 removeObject:v5];
  }
  long long v13 = [v16 uuid];
  long long v14 = [(HMDAccessoryBrowser *)self _progressHandlerForUnpairedAccessory:v13];

  if (v14)
  {
    long long v15 = [(HMDAccessoryBrowser *)self currentlyPairingProgressHandlers];
    [v15 removeObject:v14];
  }
}

- (void)_handleRemovedUnpairedHAPAccessory:(id)a3
{
  id v5 = a3;
  uint64_t v4 = [(HMDAccessoryBrowser *)self workQueue];
  dispatch_assert_queue_V2(v4);

  [(HMDAccessoryBrowser *)self _removePairingInformationForUnpairedAccessory:v5];
}

- (void)removeUnpairedHAPAccessory:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock_with_options();
    if ([(NSMutableSet *)self->_unpairedHAPAccessories containsObject:v4])
    {
      [(NSMutableSet *)self->_unpairedHAPAccessories removeObject:v4];
      id v5 = [(HMDAccessoryBrowser *)self workQueue];
      v6[0] = MEMORY[0x263EF8330];
      v6[1] = 3221225472;
      void v6[2] = __50__HMDAccessoryBrowser_removeUnpairedHAPAccessory___block_invoke;
      v6[3] = &unk_264A2F820;
      v6[4] = self;
      id v7 = v4;
      dispatch_async(v5, v6);
    }
    os_unfair_lock_unlock(&self->_lock);
  }
}

uint64_t __50__HMDAccessoryBrowser_removeUnpairedHAPAccessory___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _handleRemovedAccessory:*(void *)(a1 + 40)];
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  return [v2 _handleRemovedUnpairedHAPAccessory:v3];
}

- (void)addUnpairedHAPAccessory:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock_with_options();
    if (([(NSMutableSet *)self->_unpairedHAPAccessories containsObject:v4] & 1) == 0)
    {
      [(NSMutableSet *)self->_unpairedHAPAccessories addObject:v4];
      id v5 = [(HMDAccessoryBrowser *)self workQueue];
      v6[0] = MEMORY[0x263EF8330];
      v6[1] = 3221225472;
      void v6[2] = __47__HMDAccessoryBrowser_addUnpairedHAPAccessory___block_invoke;
      v6[3] = &unk_264A2F820;
      v6[4] = self;
      id v7 = v4;
      dispatch_async(v5, v6);
    }
    os_unfair_lock_unlock(&self->_lock);
  }
}

uint64_t __47__HMDAccessoryBrowser_addUnpairedHAPAccessory___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleAddedAccessory:*(void *)(a1 + 40)];
}

- (void)unassociatedWACAccessoryDidFinishAssociation:(id)a3 withError:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = +[HMDUIDialogPresenter sharedUIDialogPresenter];
  id v9 = [(HMDAccessoryBrowser *)self workQueue];
  [v8 dismissPendingDialogWithContext:v6 queue:v9 completionHandler:&__block_literal_global_427_210352];

  if (v7)
  {
    id v10 = (void *)MEMORY[0x230FBD990]();
    uint64_t v11 = self;
    long long v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      long long v13 = HMFGetLogIdentifier();
      int v14 = 138543874;
      long long v15 = v13;
      __int16 v16 = 2112;
      id v17 = v6;
      __int16 v18 = 2112;
      id v19 = v7;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@WAC session for %@ failed with %@", (uint8_t *)&v14, 0x20u);
    }
    [(HMDAccessoryBrowser *)v11 setActiveWACSession:0];
  }
}

- (void)unassociatedWACAccessoryDidStartAssociation:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    id v5 = (void *)MEMORY[0x230FBD990]();
    id v6 = self;
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = HMFGetLogIdentifier();
      int v9 = 138543618;
      id v10 = v8;
      __int16 v11 = 2112;
      id v12 = v4;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Tracking active WAC session: %@", (uint8_t *)&v9, 0x16u);
    }
    [(HMDAccessoryBrowser *)v6 setActiveWACSession:v4];
  }
}

- (void)requestPermissionToAssociateWACAccessory:(id)a3 completionHandler:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t))a4;
  id v8 = [(HMDAccessoryBrowser *)self getActiveWACSession];

  if (v8)
  {
    v7[2](v7, 1);
  }
  else
  {
    int v9 = (void *)MEMORY[0x230FBD990]();
    id v10 = self;
    __int16 v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v12 = HMFGetLogIdentifier();
      int v16 = 138543362;
      id v17 = v12;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Requesting permission from user to share network credentials with WAC accessory", (uint8_t *)&v16, 0xCu);
    }
    uint64_t v13 = +[HMDUIDialogPresenter sharedUIDialogPresenter];
    int v14 = [v6 name];
    long long v15 = [(HMDAccessoryBrowser *)v10 workQueue];
    [v13 requestUserPermissionForLegacyWACAccessory:v14 withContext:v6 queue:v15 completionHandler:v7];
  }
}

- (HMDUnassociatedWACAccessory)getActiveWACSession
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_accessoryPerformingWAC;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setActiveWACSession:(id)a3
{
  id v5 = a3;
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  objc_storeStrong((id *)&self->_accessoryPerformingWAC, a3);
  id v7 = [(HMDAccessoryBrowser *)self workQueue];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __43__HMDAccessoryBrowser_setActiveWACSession___block_invoke;
  v9[3] = &unk_264A2F820;
  id v10 = v5;
  __int16 v11 = self;
  id v8 = v5;
  dispatch_async(v7, v9);

  os_unfair_lock_unlock(p_lock);
}

void __43__HMDAccessoryBrowser_setActiveWACSession___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) wacBrowser];
  id v3 = v2;
  if (v1) {
    [v2 requestBackoff];
  }
  else {
    [v2 clearBackoff];
  }
}

- (void)removeUnassociatedWACAccessory:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock_with_options();
    if ([(NSMutableSet *)self->_unassociatedWACAccessories containsObject:v4])
    {
      [(NSMutableSet *)self->_unassociatedWACAccessories removeObject:v4];
      id v5 = [(HMDAccessoryBrowser *)self workQueue];
      v6[0] = MEMORY[0x263EF8330];
      v6[1] = 3221225472;
      void v6[2] = __54__HMDAccessoryBrowser_removeUnassociatedWACAccessory___block_invoke;
      v6[3] = &unk_264A2F820;
      id v7 = v4;
      id v8 = self;
      dispatch_async(v5, v6);
    }
    os_unfair_lock_unlock(&self->_lock);
  }
}

void __54__HMDAccessoryBrowser_removeUnassociatedWACAccessory___block_invoke(uint64_t a1)
{
  id v4 = +[HMDUIDialogPresenter sharedUIDialogPresenter];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) workQueue];
  [v4 dismissPendingDialogWithContext:v2 queue:v3 completionHandler:&__block_literal_global_425];

  [*(id *)(a1 + 40) _handleRemovedAccessory:*(void *)(a1 + 32)];
}

- (void)addUnassociatedWACAccessory:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v6 = v4;
    os_unfair_lock_lock_with_options();
    if (([(NSMutableSet *)self->_unassociatedWACAccessories containsObject:v6] & 1) == 0)
    {
      [(NSMutableSet *)self->_unassociatedWACAccessories addObject:v6];
      id v5 = [(HMDAccessoryBrowser *)self workQueue];
      [v6 setDelegate:self withQueue:v5];

      [(HMDAccessoryBrowser *)self handleAddedAccessory:v6];
    }
    os_unfair_lock_unlock(&self->_lock);
    id v4 = v6;
  }
}

- (void)removeUnassociatedMediaAccessory:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock_with_options();
    int v5 = [(NSMutableSet *)self->_unassociatedMediaAccessories containsObject:v4];
    if (v5) {
      [(NSMutableSet *)self->_unassociatedMediaAccessories removeObject:v4];
    }
    if ([(NSMutableSet *)self->_deviceSetupMediaAccessories containsObject:v4])
    {
      [(NSMutableSet *)self->_deviceSetupMediaAccessories removeObject:v4];
    }
    else if (!v5)
    {
LABEL_8:
      os_unfair_lock_unlock(&self->_lock);
      goto LABEL_9;
    }
    id v6 = [(HMDAccessoryBrowser *)self workQueue];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __56__HMDAccessoryBrowser_removeUnassociatedMediaAccessory___block_invoke;
    v7[3] = &unk_264A2F820;
    id v8 = v4;
    int v9 = self;
    dispatch_async(v6, v7);

    goto LABEL_8;
  }
LABEL_9:
}

void __56__HMDAccessoryBrowser_removeUnassociatedMediaAccessory___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) isHAPAirPlay2Accessory];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(a1 + 40);
  if (v2)
  {
    id v6 = [*(id *)(a1 + 32) advertisement];
    [v4 _associate:0 hapAccessoryWithAdvertisement:v6];
  }
  else
  {
    int v5 = *(void **)(a1 + 40);
    [v5 _handleRemovedAccessory:v3];
  }
}

- (void)_associateMediaAccessoryForServer:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 compatibilityFeatures])
  {
    int v5 = (void *)MEMORY[0x230FBD990]();
    id v6 = self;
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      id v8 = HMFGetLogIdentifier();
      int v16 = 138543618;
      id v17 = v8;
      __int16 v18 = 2112;
      id v19 = v4;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Found server: %@ supporting HAP+AP2", (uint8_t *)&v16, 0x16u);
    }
    int v9 = [v4 identifier];
    id v10 = [(HMDAccessoryBrowser *)v6 _unassociatedMediaAccessoryWithIdentifier:v9];

    if (v10 && [v10 isHAPAirPlay2Accessory])
    {
      __int16 v11 = (void *)MEMORY[0x230FBD990]();
      id v12 = v6;
      uint64_t v13 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        int v14 = HMFGetLogIdentifier();
        int v16 = 138543874;
        id v17 = v14;
        __int16 v18 = 2112;
        id v19 = v4;
        __int16 v20 = 2112;
        long long v21 = v10;
        _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_DEBUG, "%{public}@Associating unpaired HAP Accessory: %@ with media Accessory: %@", (uint8_t *)&v16, 0x20u);
      }
      long long v15 = [v10 advertisement];
      [(HMDAccessoryBrowser *)v12 _associate:1 hapAccessoryWithAdvertisement:v15];
    }
  }
}

- (void)_associate:(BOOL)a3 hapAccessoryWithAdvertisement:(id)a4
{
  BOOL v25 = a3;
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v5 = a4;
  locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v6 = self->_unpairedHAPAccessories;
  uint64_t v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v27 objects:v37 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v28;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v28 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        __int16 v11 = [v10 identifier];
        id v12 = [v5 identifier];
        int v13 = [v11 isEqualToString:v12];

        if (v13)
        {
          __int16 v18 = (void *)MEMORY[0x230FBD990]();
          id v19 = self;
          if (v25)
          {
            HMFGetOSLogHandle();
            __int16 v20 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
            {
              long long v21 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543874;
              __int16 v32 = v21;
              __int16 v33 = 2112;
              id v34 = v5;
              __int16 v35 = 2112;
              uint64_t v36 = v10;
              _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_DEBUG, "%{public}@Associating Advertisement: %@ with HAPAccessory: %@", buf, 0x20u);
            }
            id v22 = v5;
          }
          else
          {
            HMFGetOSLogHandle();
            long long v23 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v24 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543874;
              __int16 v32 = v24;
              __int16 v33 = 2112;
              id v34 = v5;
              __int16 v35 = 2112;
              uint64_t v36 = v10;
              _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_DEBUG, "%{public}@Disassociating Advertisement: %@ from HAPAccessory: %@", buf, 0x20u);
            }
            id v22 = 0;
          }
          [v10 associateWithAccessoryAdvertisement:v22];

          goto LABEL_20;
        }
      }
      uint64_t v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v27 objects:v37 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  int v14 = (void *)MEMORY[0x230FBD990]();
  long long v15 = self;
  HMFGetOSLogHandle();
  int v16 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    id v17 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    __int16 v32 = v17;
    __int16 v33 = 2112;
    id v34 = v5;
    _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_DEBUG, "%{public}@No unpaired HAP accessory yet for advertisement: %@", buf, 0x16u);
  }
LABEL_20:
  os_unfair_lock_unlock(lock);
}

- (void)addUnassociatedMediaAccessory:(id)a3 forDeviceSetup:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (v6)
  {
    os_unfair_lock_lock_with_options();
    BOOL v18 = v4;
    if (v4)
    {
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      uint64_t v7 = self->_deviceSetupMediaAccessories;
      id v8 = (id)[(NSMutableSet *)v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v8)
      {
        uint64_t v9 = *(void *)v26;
        while (2)
        {
          for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v26 != v9) {
              objc_enumerationMutation(v7);
            }
            __int16 v11 = *(void **)(*((void *)&v25 + 1) + 8 * i);
            id v12 = [v11 identifier];
            int v13 = [v6 identifier];
            int v14 = [v12 isEqual:v13];

            if (v14)
            {
              id v8 = v11;
              [(NSMutableSet *)self->_deviceSetupMediaAccessories removeObject:v8];
              goto LABEL_15;
            }
          }
          id v8 = (id)[(NSMutableSet *)v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
          if (v8) {
            continue;
          }
          break;
        }
      }
LABEL_15:

      [(NSMutableSet *)self->_deviceSetupMediaAccessories addObject:v6];
    }
    else
    {
      if ([(NSMutableSet *)self->_unassociatedMediaAccessories containsObject:v6])
      {
        char v15 = 0;
        id v8 = 0;
LABEL_18:
        int v16 = [(HMDAccessoryBrowser *)self workQueue];
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __68__HMDAccessoryBrowser_addUnassociatedMediaAccessory_forDeviceSetup___block_invoke;
        block[3] = &unk_264A26EA0;
        id v20 = v8;
        long long v21 = self;
        id v22 = v6;
        char v23 = v15;
        BOOL v24 = v18;
        id v17 = v8;
        dispatch_async(v16, block);

        os_unfair_lock_unlock(&self->_lock);
        goto LABEL_19;
      }
      [(NSMutableSet *)self->_unassociatedMediaAccessories addObject:v6];
      id v8 = 0;
    }
    char v15 = 1;
    goto LABEL_18;
  }
LABEL_19:
}

void __68__HMDAccessoryBrowser_addUnassociatedMediaAccessory_forDeviceSetup___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (*(void *)(a1 + 32))
  {
    int v2 = (void *)MEMORY[0x230FBD990]();
    id v3 = *(id *)(a1 + 40);
    BOOL v4 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      id v5 = HMFGetLogIdentifier();
      uint64_t v6 = *(void *)(a1 + 48);
      uint64_t v7 = *(void *)(a1 + 32);
      int v15 = 138543874;
      int v16 = v5;
      __int16 v17 = 2112;
      uint64_t v18 = v6;
      __int16 v19 = 2112;
      uint64_t v20 = v7;
      _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@DeviceSetup accessory %@ already has a previous instance %@ - removing it", (uint8_t *)&v15, 0x20u);
    }
    [*(id *)(a1 + 40) _handleRemovedAccessory:*(void *)(a1 + 32)];
  }
  if (*(unsigned char *)(a1 + 56))
  {
    if ([*(id *)(a1 + 48) isHAPAirPlay2Accessory])
    {
      id v8 = *(void **)(a1 + 40);
      uint64_t v9 = [*(id *)(a1 + 48) advertisement];
      [v8 _associate:1 hapAccessoryWithAdvertisement:v9];
    }
    else
    {
      if (*(unsigned char *)(a1 + 57))
      {
        id v10 = (void *)MEMORY[0x230FBD990]();
        id v11 = *(id *)(a1 + 40);
        id v12 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          int v13 = HMFGetLogIdentifier();
          uint64_t v14 = *(void *)(a1 + 48);
          int v15 = 138543618;
          int v16 = v13;
          __int16 v17 = 2112;
          uint64_t v18 = v14;
          _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Adding accessory %@ for deviceSetup", (uint8_t *)&v15, 0x16u);
        }
      }
      [*(id *)(a1 + 40) _handleAddedAccessory:*(void *)(a1 + 48)];
    }
  }
}

- (id)_progressHandlerForUnpairedAccessory:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDAccessoryBrowser *)self workQueue];
  dispatch_assert_queue_V2(v5);

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = [(HMDAccessoryBrowser *)self currentlyPairingProgressHandlers];
  id v7 = (id)[v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v11 = [v10 accessoryUUID];
        char v12 = [v11 isEqual:v4];

        if (v12)
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }
      id v7 = (id)[v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

- (id)_pairingInformationForAccessoryIdentifier:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDAccessoryBrowser *)self workQueue];
  dispatch_assert_queue_V2(v5);

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v6 = [(HMDAccessoryBrowser *)self currentlyPairingAccessories];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        char v12 = [v11 accessoryServerIdentifier];
        char v13 = [v12 isEqualToString:v4];

        if (v13)
        {
          id v14 = v11;
          goto LABEL_12;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  uint64_t v6 = [(HMDAccessoryBrowser *)self unpairedAccessoryWithServerIdentifier:v4];
  if (v6)
  {
    id v14 = [(HMDAccessoryBrowser *)self _pairingInformationForUnpairedAccessory:v6];
LABEL_12:
    long long v15 = v14;
  }
  else
  {
    long long v15 = 0;
  }

  return v15;
}

- (id)_pairingInformationForUnpairedAccessory:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDAccessoryBrowser *)self workQueue];
  dispatch_assert_queue_V2(v5);

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v6 = [(HMDAccessoryBrowser *)self currentlyPairingAccessories];
  id v7 = (id)[v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v10 matchesUnpairedAccessory:v4])
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }
      id v7 = (id)[v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

- (id)_unpairedAccessoryMatchingPairingInfo:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [(HMDAccessoryBrowser *)self unpairedHAPAccessories];
  id v6 = (id)[v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ([v4 matchesUnpairedAccessory:v9])
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)unpairedAccessoryWithUUID:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDAccessoryBrowser *)self unpairedHAPAccessories];
  id v6 = objc_msgSend(v5, "hmf_firstObjectWithUUID:", v4);

  return v6;
}

- (NSArray)unpairedHAPAccessories
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = [(NSMutableSet *)self->_unpairedHAPAccessories allObjects];
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (void)probeReachabilityForBTLEAccessoryServersWithIdentifiers:(id)a3 forceScan:(BOOL)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [(HMDAccessoryBrowser *)self workQueue];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __104__HMDAccessoryBrowser_probeReachabilityForBTLEAccessoryServersWithIdentifiers_forceScan_withCompletion___block_invoke;
  v13[3] = &unk_264A2B340;
  void v13[4] = self;
  id v14 = v8;
  BOOL v16 = a4;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

void __104__HMDAccessoryBrowser_probeReachabilityForBTLEAccessoryServersWithIdentifiers_forceScan_withCompletion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) btleAccessoryServerBrowser];
  [v2 probeReachabilityForAccessoryServersWithIdentifiers:*(void *)(a1 + 40) forceScan:*(unsigned __int8 *)(a1 + 56) withCompletion:*(void *)(a1 + 48)];
}

- (BOOL)isBrowsingAllowed
{
  return 1;
}

- (void)handleNewlyPairedAccessory:(id)a3 linkType:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [(HMDAccessoryBrowser *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__HMDAccessoryBrowser_handleNewlyPairedAccessory_linkType___block_invoke;
  block[3] = &unk_264A2E458;
  void block[4] = self;
  id v10 = v6;
  int64_t v11 = a4;
  id v8 = v6;
  dispatch_async(v7, block);
}

void __59__HMDAccessoryBrowser_handleNewlyPairedAccessory_linkType___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) unpairedAccessoryWithServerIdentifier:*(void *)(a1 + 40)];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v3 = objc_msgSend(v2, "accessoryServers", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v24 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
    while (2)
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        if (*(void *)(*((void *)&v14 + 1) + 8 * v7))
        {
          objc_msgSend(*(id *)(a1 + 32), "_discoverAccessories:");
          [*(id *)(a1 + 32) removeUnpairedHAPAccessory:v2];

          goto LABEL_13;
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v24 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  id v8 = (void *)MEMORY[0x230FBD990]();
  id v9 = *(id *)(a1 + 32);
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int64_t v11 = HMFGetLogIdentifier();
    uint64_t v12 = *(void *)(a1 + 40);
    long long v13 = HAPLinkTypeDescription();
    *(_DWORD *)buf = 138543874;
    long long v19 = v11;
    __int16 v20 = 2112;
    uint64_t v21 = v12;
    __int16 v22 = 2112;
    char v23 = v13;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Discovering accessory server for newly added accessory: %@/%@", buf, 0x20u);
  }
  [*(id *)(a1 + 32) _discoverAccessoryServer:*(void *)(a1 + 40) linkType:*(void *)(a1 + 48) errorHandler:0];
LABEL_13:
}

- (void)homeLocationChangeNotification:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x230FBD990]();
  uint64_t v6 = self;
  uint64_t v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    id v9 = [v4 name];
    *(_DWORD *)buf = 138543618;
    long long v16 = v8;
    __int16 v17 = 2112;
    long long v18 = v9;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Received notification: %@", buf, 0x16u);
  }
  id v10 = [(HMDAccessoryBrowser *)v6 workQueue];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __54__HMDAccessoryBrowser_homeLocationChangeNotification___block_invoke;
  v12[3] = &unk_264A2F820;
  id v13 = v4;
  long long v14 = v6;
  id v11 = v4;
  dispatch_async(v10, v12);
}

uint64_t __54__HMDAccessoryBrowser_homeLocationChangeNotification___block_invoke(uint64_t a1)
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) name];
  int v3 = [v2 isEqualToString:@"HMDHomeRegionExitedNotificationKey"];

  if (v3)
  {
    id v4 = [*(id *)(a1 + 40) homeManager];
    uint64_t v5 = [v4 homes];

    if (v5)
    {
      uint64_t v6 = [MEMORY[0x263EFF980] array];
      long long v44 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      __int16 v35 = v5;
      id obj = v5;
      uint64_t v38 = [obj countByEnumeratingWithState:&v44 objects:v55 count:16];
      if (v38)
      {
        uint64_t v37 = *(void *)v45;
        do
        {
          for (uint64_t i = 0; i != v38; ++i)
          {
            if (*(void *)v45 != v37) {
              objc_enumerationMutation(obj);
            }
            id v8 = *(void **)(*((void *)&v44 + 1) + 8 * i);
            uint64_t v43 = 0;
            uint64_t v9 = [v8 getReachableIPAccessories:&v43 btleAccessories:0 mediaAccessories:0];
            uint64_t v10 = v43;
            id v11 = (void *)MEMORY[0x230FBD990](v9);
            id v12 = *(id *)(a1 + 40);
            id v13 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
            {
              long long v14 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543874;
              int v50 = v14;
              __int16 v51 = 2112;
              __int16 v52 = v8;
              __int16 v53 = 2048;
              uint64_t v54 = v43;
              _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Home: %@ Reachable IP accessories: %tu", buf, 0x20u);
            }
            long long v15 = [v8 homeLocationHandler];
            uint64_t v16 = [v15 regionStateAtHome];

            if (v16 == 2 && v10 == 0)
            {
              long long v18 = (void *)MEMORY[0x230FBD990]();
              id v19 = *(id *)(a1 + 40);
              __int16 v20 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
              {
                uint64_t v21 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138543618;
                int v50 = v21;
                __int16 v51 = 2112;
                __int16 v52 = v8;
                _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_INFO, "%{public}@Outside home region for home %@", buf, 0x16u);
              }
              __int16 v22 = [v8 accessories];
              char v23 = (void *)[v22 copy];

              long long v41 = 0u;
              long long v42 = 0u;
              long long v39 = 0u;
              long long v40 = 0u;
              id v24 = v23;
              uint64_t v25 = [v24 countByEnumeratingWithState:&v39 objects:v48 count:16];
              if (v25)
              {
                uint64_t v26 = v25;
                uint64_t v27 = *(void *)v40;
                do
                {
                  for (uint64_t j = 0; j != v26; ++j)
                  {
                    if (*(void *)v40 != v27) {
                      objc_enumerationMutation(v24);
                    }
                    id v29 = *(id *)(*((void *)&v39 + 1) + 8 * j);
                    objc_opt_class();
                    if (objc_opt_isKindOfClass()) {
                      uint64_t v30 = v29;
                    }
                    else {
                      uint64_t v30 = 0;
                    }
                    id v31 = v30;

                    if ([v31 hasBTLELink])
                    {
                      __int16 v32 = [v31 identifier];
                      [v6 addObject:v32];
                    }
                  }
                  uint64_t v26 = [v24 countByEnumeratingWithState:&v39 objects:v48 count:16];
                }
                while (v26);
              }
            }
          }
          uint64_t v38 = [obj countByEnumeratingWithState:&v44 objects:v55 count:16];
        }
        while (v38);
      }

      if ([v6 count])
      {
        __int16 v33 = [*(id *)(a1 + 40) btleAccessoryServerBrowser];
        [v33 resetLastSeenForAccessoryServersWithIdentifiers:v6];
      }
      uint64_t v5 = v35;
    }
  }
  return [*(id *)(a1 + 40) btleAccessoryReachabilityProbeTimer:1];
}

- (void)updateRemoteAccessoryBrowsing:(BOOL)a3 whbScan:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v32 = *MEMORY[0x263EF8340];
  if ([(HMDAccessoryBrowser *)self supportsRemoteBrowsing])
  {
    BOOL v7 = v5 && v4;
    id v8 = (void *)MEMORY[0x230FBD990]();
    uint64_t v9 = self;
    uint64_t v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v11 = HMFGetLogIdentifier();
      id v12 = HMFBooleanToString();
      id v13 = HMFBooleanToString();
      int v26 = 138543874;
      uint64_t v27 = v11;
      __int16 v28 = 2112;
      id v29 = v12;
      __int16 v30 = 2112;
      id v31 = v13;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Updating WHB Browsing (%@) and Scan (%@).", (uint8_t *)&v26, 0x20u);
    }
    long long v14 = [(HMDAccessoryBrowser *)v9 btleAccessoryServerBrowser];
    [v14 updateRemoteBrowsing:v5 shouldScan:v4];

    if (v5 && v4)
    {
      long long v15 = [&unk_26E474410 arrayByAddingObject:&unk_26E472B80];
      [(HMDAccessoryBrowser *)v9 setBrowseableLinkTypes:v15];
    }
    else
    {
      [(HMDAccessoryBrowser *)v9 setBrowseableLinkTypes:&unk_26E474410];
    }
    uint64_t v16 = [(HMDAccessoryBrowser *)v9 btleAccessoryServerBrowser];
    uint64_t v17 = [v16 scanState];

    if (v17)
    {
      if (v7)
      {
        if ([(HMDAccessoryBrowser *)v9 areThereAnyPairedBTLEAccessories]
          || [(HMDAccessoryBrowser *)v9 areThereAnyPairedUnknownLinkTypeAccessories])
        {
          long long v18 = (void *)MEMORY[0x230FBD990]();
          id v19 = v9;
          __int16 v20 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            uint64_t v21 = HMFGetLogIdentifier();
            int v26 = 138543362;
            uint64_t v27 = v21;
            _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_INFO, "%{public}@Start probing for paired BTLE accessories due to remote browsing change.", (uint8_t *)&v26, 0xCu);
          }
          [(HMDAccessoryBrowser *)v19 btleAccessoryReachabilityProbeTimer:1];
        }
      }
      else
      {
        [(HMDAccessoryBrowser *)v9 stopDiscoveringAccessoriesWithLinkType:2];
      }
    }
    else
    {
      __int16 v22 = (void *)MEMORY[0x230FBD990]();
      char v23 = v9;
      id v24 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        uint64_t v25 = HMFGetLogIdentifier();
        int v26 = 138543362;
        uint64_t v27 = v25;
        _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_INFO, "%{public}@Skipping start/stop of BTLE browser since it's in idle state.", (uint8_t *)&v26, 0xCu);
      }
    }
  }
}

- (void)handleConnectionDeactivation:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(HMDAccessoryBrowser *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __52__HMDAccessoryBrowser_handleConnectionDeactivation___block_invoke;
  v7[3] = &unk_264A2F820;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __52__HMDAccessoryBrowser_handleConnectionDeactivation___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) userInfo];
  int v3 = [v2 objectForKeyedSubscript:@"connection"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v7 = v4;

  if (v7)
  {
    BOOL v5 = *(void **)(a1 + 40);
    id v6 = [MEMORY[0x263F087E8] hmPrivateErrorWithCode:2503];
    [v5 _removeBrowsingConnection:v7 error:v6];
  }
}

- (void)_reprovisionAccessoryWithIdentifier:(id)a3 wiFiPSK:(id)a4 countryCode:(id)a5 withCompletion:(id)a6
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  long long v14 = [(HMDAccessoryBrowser *)self workQueue];
  dispatch_assert_queue_V2(v14);

  long long v15 = [(HMDAccessoryBrowser *)self ipAccessoryServerBrowser];
  if (!v15)
  {
    __int16 v22 = (void *)MEMORY[0x230FBD990]();
    char v23 = self;
    id v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      uint64_t v25 = HMFGetLogIdentifier();
      *(_DWORD *)long long v42 = 138543362;
      *(void *)&v42[4] = v25;
      _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_ERROR, "%{public}@Unable to reprovision accessory without a IP accessory server browser", v42, 0xCu);
    }
    int v26 = _Block_copy(v13);
    if (!v26) {
      goto LABEL_16;
    }
    uint64_t v27 = (void *)MEMORY[0x263F087E8];
    uint64_t v28 = 57;
    goto LABEL_15;
  }
  uint64_t v16 = [(HMDAccessoryBrowser *)self identifierOfAccessoryBeingReprovisioned];

  if (v16)
  {
    uint64_t v17 = (void *)MEMORY[0x230FBD990]();
    long long v18 = self;
    id v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      __int16 v20 = HMFGetLogIdentifier();
      *(_DWORD *)long long v42 = 138543362;
      *(void *)&v42[4] = v20;
      uint64_t v21 = "%{public}@Unable to reprovision accessory since provisioing is already in progress";
LABEL_12:
      _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_ERROR, v21, v42, 0xCu);

      goto LABEL_13;
    }
    goto LABEL_13;
  }
  id v29 = [(HMDAccessoryBrowser *)self currentlyPairingAccessories];
  uint64_t v30 = [v29 count];

  if (v30)
  {
    uint64_t v17 = (void *)MEMORY[0x230FBD990]();
    long long v18 = self;
    id v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      __int16 v20 = HMFGetLogIdentifier();
      *(_DWORD *)long long v42 = 138543362;
      *(void *)&v42[4] = v20;
      uint64_t v21 = "%{public}@Unable to reprovision accessory since an addAccessory operation is already in progress";
      goto LABEL_12;
    }
LABEL_13:

    int v26 = _Block_copy(v13);
    if (!v26)
    {
LABEL_16:

      goto LABEL_17;
    }
    uint64_t v27 = (void *)MEMORY[0x263F087E8];
    uint64_t v28 = 15;
LABEL_15:
    id v31 = objc_msgSend(v27, "hmErrorWithCode:", v28, *(_OWORD *)v42);
    (*((void (**)(void *, void *))v26 + 2))(v26, v31);

    goto LABEL_16;
  }
  [(HMDAccessoryBrowser *)self setIdentifierOfAccessoryBeingReprovisioned:v10];
  [(HMDAccessoryBrowser *)self setWiFiPSKForAccessoryReprovisioning:v11];
  uint64_t v32 = (void *)MEMORY[0x230FBD990]([(HMDAccessoryBrowser *)self setCountrycodeForAccessoryReprovisioning:v12]);
  __int16 v33 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    id v34 = HMFGetLogIdentifier();
    *(_DWORD *)long long v42 = 138543618;
    *(void *)&v42[4] = v34;
    *(_WORD *)&v42[12] = 2112;
    *(void *)&v42[14] = v10;
    _os_log_impl(&dword_22F52A000, v33, OS_LOG_TYPE_DEFAULT, "%{public}@Start searching for accessory: %@ for reprovisioning", v42, 0x16u);
  }
  [v15 startDiscoveringWACAccessoryServerWithIdentifier:v10];
  __int16 v35 = [(HMDAccessoryBrowser *)self stopReprovisioningTimer];
  [v35 resume];

  uint64_t v36 = _Block_copy(v13);
  uint64_t v37 = v36;
  if (v36) {
    (*((void (**)(void *, void))v36 + 2))(v36, 0);
  }

  uint64_t v38 = (void *)MEMORY[0x230FBD990]();
  long long v39 = self;
  long long v40 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
  {
    long long v41 = HMFGetLogIdentifier();
    *(_DWORD *)long long v42 = 138543362;
    *(void *)&v42[4] = v41;
    _os_log_impl(&dword_22F52A000, v40, OS_LOG_TYPE_INFO, "%{public}@Started the stop reprovisioning timer", v42, 0xCu);
  }
LABEL_17:
}

- (void)reprovisionAccessoryWithIdentifier:(id)a3 wiFiPSK:(id)a4 countryCode:(id)a5 withCompletion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  long long v14 = [(HMDAccessoryBrowser *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __93__HMDAccessoryBrowser_reprovisionAccessoryWithIdentifier_wiFiPSK_countryCode_withCompletion___block_invoke;
  block[3] = &unk_264A2DDC0;
  void block[4] = self;
  id v20 = v10;
  id v21 = v11;
  id v22 = v12;
  id v23 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  dispatch_async(v14, block);
}

uint64_t __93__HMDAccessoryBrowser_reprovisionAccessoryWithIdentifier_wiFiPSK_countryCode_withCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reprovisionAccessoryWithIdentifier:*(void *)(a1 + 40) wiFiPSK:*(void *)(a1 + 48) countryCode:*(void *)(a1 + 56) withCompletion:*(void *)(a1 + 64)];
}

- (void)activate:(BOOL)a3
{
  BOOL v5 = [(HMDAccessoryBrowser *)self workQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  void v6[2] = __32__HMDAccessoryBrowser_activate___block_invoke;
  v6[3] = &unk_264A2B870;
  void v6[4] = self;
  BOOL v7 = a3;
  dispatch_sync(v5, v6);
}

uint64_t __32__HMDAccessoryBrowser_activate___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    BOOL v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(unsigned __int8 *)(a1 + 40);
    int v11 = 138543618;
    id v12 = v5;
    __int16 v13 = 2048;
    uint64_t v14 = v6;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Activating with startDiscovery %ld", (uint8_t *)&v11, 0x16u);
  }
  if (*(unsigned char *)(a1 + 40)) {
    [*(id *)(a1 + 32) _startDiscoveringPairedAccessories:0];
  }
  BOOL v7 = [MEMORY[0x263F08A00] defaultCenter];
  [v7 addObserver:*(void *)(a1 + 32) selector:sel_homeLocationChangeNotification_ name:@"HMDHomeRegionExitedNotificationKey" object:0];

  id v8 = [MEMORY[0x263F08A00] defaultCenter];
  [v8 addObserver:*(void *)(a1 + 32) selector:sel_homeLocationChangeNotification_ name:@"HMDHomeRegionEnteredNotificationKey" object:0];

  uint64_t v9 = [MEMORY[0x263F08A00] defaultCenter];
  [v9 addObserver:*(void *)(a1 + 32) selector:sel_handleConnectionDeactivation_ name:@"HMDXPCClientConnectionDidDeactivateNotification" object:0];

  return [*(id *)(a1 + 32) _setBTLEPowerChangeCompletionHandler];
}

- (void)discoverAccessoryServer:(id)a3 linkType:(int64_t)a4 errorHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [(HMDAccessoryBrowser *)self workQueue];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __69__HMDAccessoryBrowser_discoverAccessoryServer_linkType_errorHandler___block_invoke;
  v13[3] = &unk_264A2F470;
  void v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  int64_t v16 = a4;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

uint64_t __69__HMDAccessoryBrowser_discoverAccessoryServer_linkType_errorHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _discoverAccessoryServer:*(void *)(a1 + 40) linkType:*(void *)(a1 + 56) errorHandler:*(void *)(a1 + 48)];
}

- (void)stopTrackingBTLEAccessoriesWithIdentifiers:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(HMDAccessoryBrowser *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __66__HMDAccessoryBrowser_stopTrackingBTLEAccessoriesWithIdentifiers___block_invoke;
  v7[3] = &unk_264A2F820;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __66__HMDAccessoryBrowser_stopTrackingBTLEAccessoriesWithIdentifiers___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) btleAccessoryServerBrowser];
  [v2 stopTrackingBTLEAccessoriesWithIdentifiers:*(void *)(a1 + 40)];
}

- (void)btleAccessoryReachabilityProbeTimer:(BOOL)a3
{
  BOOL v5 = [(HMDAccessoryBrowser *)self workQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  void v6[2] = __59__HMDAccessoryBrowser_btleAccessoryReachabilityProbeTimer___block_invoke;
  v6[3] = &unk_264A2B870;
  void v6[4] = self;
  BOOL v7 = a3;
  dispatch_async(v5, v6);
}

uint64_t __59__HMDAccessoryBrowser_btleAccessoryReachabilityProbeTimer___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _btleAccessoryReachabilityProbeTimer:*(unsigned __int8 *)(a1 + 40)];
}

- (void)stopDiscoveringMediaAccessories
{
  id v3 = [(HMDAccessoryBrowser *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__HMDAccessoryBrowser_stopDiscoveringMediaAccessories__block_invoke;
  block[3] = &unk_264A2F7F8;
  void block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __54__HMDAccessoryBrowser_stopDiscoveringMediaAccessories__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _stopDiscoveringMediaAccessories];
}

- (void)stopDiscoveringForUnpairedAccessoriesWithLinkType:(int64_t)a3
{
  BOOL v5 = [(HMDAccessoryBrowser *)self workQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  void v6[2] = __73__HMDAccessoryBrowser_stopDiscoveringForUnpairedAccessoriesWithLinkType___block_invoke;
  v6[3] = &unk_264A2C6A0;
  void v6[4] = self;
  void v6[5] = a3;
  dispatch_async(v5, v6);
}

void __73__HMDAccessoryBrowser_stopDiscoveringForUnpairedAccessoriesWithLinkType___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    BOOL v5 = HMFGetLogIdentifier();
    id v6 = HAPLinkTypeDescription();
    int v9 = 138543618;
    id v10 = v5;
    __int16 v11 = 2112;
    id v12 = v6;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Stopping discovery for unpaired accessories with link type: %@", (uint8_t *)&v9, 0x16u);
  }
  BOOL v7 = *(void **)(a1 + 32);
  id v8 = [NSNumber numberWithInteger:*(void *)(a1 + 40)];
  [v7 _stopDiscoveringAccessoriesWithLinkType:v8 force:0 error:0];
}

- (void)stopDiscoveringAccessoriesWithLinkType:(int64_t)a3
{
  BOOL v5 = [(HMDAccessoryBrowser *)self workQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  void v6[2] = __62__HMDAccessoryBrowser_stopDiscoveringAccessoriesWithLinkType___block_invoke;
  v6[3] = &unk_264A2C6A0;
  void v6[4] = self;
  void v6[5] = a3;
  dispatch_async(v5, v6);
}

void __62__HMDAccessoryBrowser_stopDiscoveringAccessoriesWithLinkType___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    BOOL v5 = HMFGetLogIdentifier();
    id v6 = HAPLinkTypeDescription();
    int v9 = 138543618;
    id v10 = v5;
    __int16 v11 = 2112;
    id v12 = v6;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Stopping discovery for accessories with link type: %@", (uint8_t *)&v9, 0x16u);
  }
  BOOL v7 = *(void **)(a1 + 32);
  id v8 = [NSNumber numberWithInteger:*(void *)(a1 + 40)];
  [v7 _stopDiscoveringAccessoriesWithLinkType:v8 force:1 error:0];
}

- (void)stopDiscoveringAccessories
{
  id v3 = [(HMDAccessoryBrowser *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__HMDAccessoryBrowser_stopDiscoveringAccessories__block_invoke;
  block[3] = &unk_264A2F7F8;
  void block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __49__HMDAccessoryBrowser_stopDiscoveringAccessories__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    BOOL v5 = HMFGetLogIdentifier();
    int v7 = 138543362;
    id v8 = v5;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Stopping discovery for accessories", (uint8_t *)&v7, 0xCu);
  }
  return [*(id *)(a1 + 32) _stopDiscoveringAccessoriesWithLinkType:0 force:1 error:0];
}

- (void)startDiscoveringMediaAccessories
{
  id v3 = [(HMDAccessoryBrowser *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__HMDAccessoryBrowser_startDiscoveringMediaAccessories__block_invoke;
  block[3] = &unk_264A2F7F8;
  void block[4] = self;
  dispatch_async(v3, block);
}

void __55__HMDAccessoryBrowser_startDiscoveringMediaAccessories__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) isBrowsingAllowed])
  {
    id v2 = *(void **)(a1 + 32);
    [v2 _startDiscoveringMediaAccessories];
  }
  else
  {
    id v3 = (void *)MEMORY[0x230FBD990]();
    id v4 = *(id *)(a1 + 32);
    BOOL v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = HMFGetLogIdentifier();
      int v7 = 138543362;
      id v8 = v6;
      _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@Ignoring request to start discovering media accessories", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (void)startDiscoveringAccessoriesWithLinkType:(int64_t)a3
{
  BOOL v5 = [(HMDAccessoryBrowser *)self workQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  void v6[2] = __63__HMDAccessoryBrowser_startDiscoveringAccessoriesWithLinkType___block_invoke;
  v6[3] = &unk_264A2C6A0;
  void v6[4] = self;
  void v6[5] = a3;
  dispatch_async(v5, v6);
}

void __63__HMDAccessoryBrowser_startDiscoveringAccessoriesWithLinkType___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    BOOL v5 = HMFGetLogIdentifier();
    id v6 = HAPLinkTypeDescription();
    int v9 = 138543618;
    id v10 = v5;
    __int16 v11 = 2112;
    id v12 = v6;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Starting discovery for accessories with link Type: %@", (uint8_t *)&v9, 0x16u);
  }
  int v7 = *(void **)(a1 + 32);
  id v8 = [NSNumber numberWithInteger:*(void *)(a1 + 40)];
  [v7 _startDiscoveringAccessoriesWithLinkType:v8];
}

- (void)startDiscoveringAccessories
{
  id v3 = [(HMDAccessoryBrowser *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__HMDAccessoryBrowser_startDiscoveringAccessories__block_invoke;
  block[3] = &unk_264A2F7F8;
  void block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __50__HMDAccessoryBrowser_startDiscoveringAccessories__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    BOOL v5 = HMFGetLogIdentifier();
    int v7 = 138543362;
    id v8 = v5;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Starting discovery for accessories", (uint8_t *)&v7, 0xCu);
  }
  return [*(id *)(a1 + 32) _startDiscoveringAccessoriesWithLinkType:0];
}

- (void)startDiscoveringPairedAccessoriesWithLinkType:(int64_t)a3
{
  BOOL v5 = [(HMDAccessoryBrowser *)self workQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  void v6[2] = __69__HMDAccessoryBrowser_startDiscoveringPairedAccessoriesWithLinkType___block_invoke;
  v6[3] = &unk_264A2C6A0;
  void v6[4] = self;
  void v6[5] = a3;
  dispatch_async(v5, v6);
}

void __69__HMDAccessoryBrowser_startDiscoveringPairedAccessoriesWithLinkType___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v2 = [NSNumber numberWithInteger:*(void *)(a1 + 40)];
  [v1 _startDiscoveringPairedAccessories:v2];
}

- (void)startDiscoveringPairedAccessories
{
  id v3 = [(HMDAccessoryBrowser *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__HMDAccessoryBrowser_startDiscoveringPairedAccessories__block_invoke;
  block[3] = &unk_264A2F7F8;
  void block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __56__HMDAccessoryBrowser_startDiscoveringPairedAccessories__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startDiscoveringPairedAccessories:0];
}

- (BOOL)isDiscoveringAccessoriesWithLinkType:(int64_t)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = [(HMDAccessoryBrowser *)self discoveringAccessoryServerBrowsers];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v6);
        }
        if ([*(id *)(*((void *)&v12 + 1) + 8 * i) linkType] == a3)
        {
          BOOL v10 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v10 = 0;
LABEL_11:

  os_unfair_lock_unlock(p_lock);
  return v10;
}

- (void)resetConfiguration
{
  id v3 = [(HMDAccessoryBrowser *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__HMDAccessoryBrowser_resetConfiguration__block_invoke;
  block[3] = &unk_264A2F7F8;
  void block[4] = self;
  dispatch_async(v3, block);
}

void __41__HMDAccessoryBrowser_resetConfiguration__block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) btleAccessoryServerBrowser];
  [v2 resetPairedAccessories];

  id v3 = [*(id *)(a1 + 32) ipAccessoryServerBrowser];
  [v3 resetPairedAccessories];

  id v4 = [*(id *)(a1 + 32) chipAccessoryServerBrowser];
  [v4 resetPairedAccessories];

  BOOL v5 = [*(id *)(a1 + 32) hap2Storage];
  [v5 resetPairedAccessoryIdentifiers];

  id v6 = [*(id *)(a1 + 32) mediaBrowser];
  uint64_t v7 = [*(id *)(a1 + 32) identifiersOfAssociatedMediaAccessories];
  [v6 deregisterAccessories:v7];

  [*(id *)(a1 + 32) resetPairedAccessories];
  uint64_t v8 = *(void **)(a1 + 32);
  uint64_t v9 = [MEMORY[0x263F087E8] hmPrivateErrorWithCode:2500];
  [v8 _stopDiscoveringAccessoriesWithError:v9];

  [*(id *)(a1 + 32) _cancelCurrentlyPairingAccessories:2500 linkType:0];
  BOOL v10 = [*(id *)(a1 + 32) unpairedHAPAccessories];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v25;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(v10);
        }
        [*(id *)(a1 + 32) removeUnpairedHAPAccessory:*(void *)(*((void *)&v24 + 1) + 8 * v14++)];
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v12);
  }
  long long v15 = [*(id *)(a1 + 32) unassociatedMediaAccessories];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v21;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v21 != v18) {
          objc_enumerationMutation(v15);
        }
        [*(id *)(a1 + 32) removeUnassociatedMediaAccessory:*(void *)(*((void *)&v20 + 1) + 8 * v19++)];
      }
      while (v17 != v19);
      uint64_t v17 = [v15 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v17);
  }
}

- (void)_handleRemovedAccessoryAdvertisements:(id)a3
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id obj = a3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v42 objects:v53 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v43;
    uint64_t v30 = *(void *)v43;
    do
    {
      uint64_t v7 = 0;
      uint64_t v31 = v5;
      do
      {
        if (*(void *)v43 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v42 + 1) + 8 * v7);
        uint64_t v9 = [v8 identifier];
        BOOL v10 = [(HMDAccessoryBrowser *)self pairedAccessoryInformationWithIdentifier:v9];

        uint64_t v11 = [v10 delegate];
        if (objc_opt_respondsToSelector())
        {
          [v11 accessoryBrowser:self didRemoveAccessoryAdvertisement:v8];
          uint64_t v12 = [v8 identifier];
          [(HMDAccessoryBrowser *)self _notifyDelegateOfReachabilityChange:0 forAccessoryWithIdentifier:v12];
        }
        else
        {
          uint64_t v36 = v8;
          long long v40 = 0u;
          long long v41 = 0u;
          long long v38 = 0u;
          long long v39 = 0u;
          uint64_t v12 = [(HMDAccessoryBrowser *)self unassociatedAccessories];
          uint64_t v13 = [v12 countByEnumeratingWithState:&v38 objects:v52 count:16];
          if (v13)
          {
            uint64_t v14 = v13;
            __int16 v33 = v11;
            id v34 = v10;
            uint64_t v35 = v7;
            uint64_t v15 = *(void *)v39;
            uint64_t v16 = v36;
            id v37 = v12;
            do
            {
              for (uint64_t i = 0; i != v14; ++i)
              {
                if (*(void *)v39 != v15) {
                  objc_enumerationMutation(v37);
                }
                uint64_t v18 = *(void **)(*((void *)&v38 + 1) + 8 * i);
                uint64_t v19 = [v18 identifier];
                long long v20 = [v16 identifier];
                int v21 = [v19 isEqual:v20];

                if (v21)
                {
                  id v22 = v18;
                  objc_opt_class();
                  if (objc_opt_isKindOfClass()) {
                    long long v23 = v22;
                  }
                  else {
                    long long v23 = 0;
                  }
                  id v24 = v23;

                  if (v24)
                  {
                    [(HMDAccessoryBrowser *)self removeUnassociatedMediaAccessory:v24];
                  }
                  else
                  {
                    long long v25 = (void *)MEMORY[0x230FBD990]();
                    long long v26 = self;
                    long long v27 = HMFGetOSLogHandle();
                    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
                    {
                      HMFGetLogIdentifier();
                      id v29 = v28 = self;
                      *(_DWORD *)buf = 138543874;
                      long long v47 = v29;
                      __int16 v48 = 2112;
                      uint64_t v49 = v36;
                      __int16 v50 = 2112;
                      id v51 = v22;
                      _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_ERROR, "%{public}@HAP accessory advertisement data not routed through AccessoryBrowser: %@ - %@", buf, 0x20u);

                      self = v28;
                    }

                    uint64_t v16 = v36;
                  }
                }
              }
              uint64_t v12 = v37;
              uint64_t v14 = [v37 countByEnumeratingWithState:&v38 objects:v52 count:16];
            }
            while (v14);
            uint64_t v6 = v30;
            uint64_t v5 = v31;
            BOOL v10 = v34;
            uint64_t v7 = v35;
            uint64_t v11 = v33;
          }
        }

        ++v7;
      }
      while (v7 != v5);
      uint64_t v5 = [obj countByEnumeratingWithState:&v42 objects:v53 count:16];
    }
    while (v5);
  }
}

- (void)_handleAddedAccessoryAdvertisements:(id)a3
{
  uint64_t v80 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v65 = [(HMDAccessoryBrowser *)self __isAccessoryBrowsingRequested];
  BOOL v64 = [(HMDAccessoryBrowser *)self __isMediaAccessoryBrowsingRequested];
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  id v5 = v4;
  uint64_t v67 = [v5 countByEnumeratingWithState:&v68 objects:v79 count:16];
  if (!v67) {
    goto LABEL_55;
  }
  uint64_t v66 = *(void *)v69;
  id v63 = v5;
  while (2)
  {
    uint64_t v6 = 0;
    do
    {
      if (*(void *)v69 != v66) {
        objc_enumerationMutation(v5);
      }
      uint64_t v7 = *(void **)(*((void *)&v68 + 1) + 8 * v6);
      uint64_t v8 = [v7 identifier];
      uint64_t v9 = [v7 identifier];
      BOOL v10 = [(HMDAccessoryBrowser *)self pairedAccessoryInformationWithIdentifier:v9];

      if (v10)
      {
        id v11 = v7;
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
          [v13 setAssociated:1];
          [(HMDAccessoryBrowser *)self _associate:1 hapAccessoryWithAdvertisement:v13];
          id v14 = [v10 delegate];
          if (objc_opt_respondsToSelector()) {
            [v14 accessoryBrowser:self didAddAccessoryAdvertisement:v11];
          }
          uint64_t v15 = [(HMDAccessoryBrowser *)self mediaBrowser];
          id v78 = v8;
          uint64_t v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v78 count:1];
          [v15 updateSessionsForAccessories:v16];
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
LABEL_32:
            [(HMDAccessoryBrowser *)self _notifyDelegateOfReachabilityChange:1 forAccessoryWithIdentifier:v8];
LABEL_33:

            goto LABEL_34;
          }
          id v25 = v11;
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            long long v26 = v25;
          }
          else {
            long long v26 = 0;
          }
          id v14 = v26;

          long long v27 = (void *)MEMORY[0x230FBD990]();
          uint64_t v28 = self;
          id v29 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            uint64_t v30 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            uint64_t v73 = v30;
            __int16 v74 = 2112;
            id v75 = v14;
            _os_log_impl(&dword_22F52A000, v29, OS_LOG_TYPE_ERROR, "%{public}@Unsupported operation - not creating HMDHAPAccessory from advertisement data: %@", buf, 0x16u);

            id v5 = v63;
          }
        }

        goto LABEL_32;
      }
      if (!v65) {
        goto LABEL_34;
      }
      id v17 = v7;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v18 = v17;
      }
      else {
        uint64_t v18 = 0;
      }
      id v13 = v18;

      if (!v13)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          id v13 = 0;
          goto LABEL_33;
        }
        id v31 = v17;
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          uint64_t v32 = v31;
        }
        else {
          uint64_t v32 = 0;
        }
        id v20 = v32;

        __int16 v33 = (void *)MEMORY[0x230FBD990]();
        id v34 = self;
        uint64_t v35 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          uint64_t v36 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          uint64_t v73 = v36;
          __int16 v74 = 2112;
          id v75 = v20;
          _os_log_impl(&dword_22F52A000, v35, OS_LOG_TYPE_ERROR, "%{public}@Unsupported operation - not  creating HMDHAPUnassociatedAccessory from advertisement data: %@", buf, 0x16u);

          id v5 = v63;
        }

LABEL_52:

        goto LABEL_33;
      }
      if (v64)
      {
        [v13 setAssociated:0];
        uint64_t v19 = [(HMDAccessoryBrowser *)self _unassociatedMediaAccessoryWithIdentifier:v8];
        if (v19)
        {
          id v20 = (id)v19;
          int v21 = (void *)MEMORY[0x230FBD990]();
          id v22 = self;
          long long v23 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
          {
            id v24 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543362;
            uint64_t v73 = v24;
            _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_DEBUG, "%{public}@Advertisement is for known accessory, updating", buf, 0xCu);

            id v5 = v63;
          }

          [v20 updateAdvertisementData:v13];
        }
        else
        {
          id v37 = [(HMDAccessoryBrowser *)self getActiveWACSession];

          if (v37 && [v13 conformsToProtocol:&unk_26E597C88])
          {
            long long v38 = (void *)MEMORY[0x230FBD990]();
            long long v39 = self;
            long long v40 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
            {
              long long v41 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543362;
              uint64_t v73 = v41;
              _os_log_impl(&dword_22F52A000, v40, OS_LOG_TYPE_INFO, "%{public}@Advertisement supports WAC matching, checking active sessions for match", buf, 0xCu);
            }
            id v42 = v13;
            long long v61 = v39;
            long long v43 = [(HMDAccessoryBrowser *)v39 getActiveWACSession];
            long long v44 = [v43 wacDeviceID];
            int v62 = [v42 matchesWACDeviceID:v44];
            id v45 = v42;

            if (v62)
            {
              __int16 v48 = [(HMDAccessoryBrowser *)v61 mediaBrowser];
              uint64_t v49 = [v48 unassociatedAccessoryFromAdvertisementData:v42];

              __int16 v50 = [(HMDAccessoryBrowser *)v61 getActiveWACSession];
              id v51 = [v50 uuid];
              [v49 setUUID:v51];

              __int16 v52 = (void *)MEMORY[0x230FBD990]();
              __int16 v53 = v61;
              uint64_t v54 = HMFGetOSLogHandle();
              uint64_t v55 = v54;
              uint64_t v56 = v45;
              if (v49)
              {
                if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
                {
                  BOOL v57 = HMFGetLogIdentifier();
                  *(_DWORD *)buf = 138543362;
                  uint64_t v73 = v57;
                  _os_log_impl(&dword_22F52A000, v55, OS_LOG_TYPE_INFO, "%{public}@Advertisement matches WAC device, performing handoff", buf, 0xCu);
                }
                long long v58 = [(HMDAccessoryBrowser *)v53 getActiveWACSession];
                [v58 updateWithMatchingUnassociatedAccessory:v49];
              }
              else
              {
                if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
                {
                  long long v59 = HMFGetLogIdentifier();
                  BOOL v60 = [(HMDAccessoryBrowser *)v53 getActiveWACSession];
                  *(_DWORD *)buf = 138543874;
                  uint64_t v73 = v59;
                  __int16 v74 = 2112;
                  id v75 = v56;
                  __int16 v76 = 2112;
                  id v77 = v60;
                  _os_log_impl(&dword_22F52A000, v55, OS_LOG_TYPE_ERROR, "%{public}@Could not create accessory from advertisement %@ for matching WAC device %@", buf, 0x20u);
                }
                long long v58 = [(HMDAccessoryBrowser *)v53 getActiveWACSession];
                [v58 cancelConfigurationWithCompletionHandler:&__block_literal_global_411];
              }

              [(HMDAccessoryBrowser *)v53 setActiveWACSession:0];
              goto LABEL_55;
            }
          }
          long long v46 = [(HMDAccessoryBrowser *)self mediaBrowser];
          id v20 = [v46 unassociatedAccessoryFromAdvertisementData:v13];

          if (!v20) {
            goto LABEL_33;
          }
          [(HMDAccessoryBrowser *)self addUnassociatedAccessory:v20 forDeviceSetup:0];
        }
        goto LABEL_52;
      }
      BOOL v10 = v13;
LABEL_34:

      ++v6;
    }
    while (v67 != v6);
    uint64_t v47 = [v5 countByEnumeratingWithState:&v68 objects:v79 count:16];
    uint64_t v67 = v47;
    if (v47) {
      continue;
    }
    break;
  }
LABEL_55:
}

- (void)_notifyDelegateOfReachabilityChange:(BOOL)a3 forAccessoryWithIdentifier:(id)a4
{
  BOOL v4 = a3;
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a4;
  uint64_t v7 = [(HMDAccessoryBrowser *)self pairedAccessoryInformationWithIdentifier:v6];
  uint64_t v8 = [v7 delegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v9 = (void *)MEMORY[0x230FBD990]();
    BOOL v10 = self;
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = HMFGetLogIdentifier();
      id v13 = @"unreachable";
      int v14 = 138544130;
      uint64_t v15 = v12;
      if (v4) {
        id v13 = @"reachable";
      }
      __int16 v16 = 2112;
      id v17 = v8;
      __int16 v18 = 2112;
      id v19 = v6;
      __int16 v20 = 2112;
      int v21 = v13;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Notifying '%@' that accessory with identifier %@ is %@", (uint8_t *)&v14, 0x2Au);
    }
    [v8 accessoryBrowser:v10 identifier:v6 reachable:v4];
  }
}

- (void)__inactivate
{
  id v3 = [(HMDAccessoryBrowser *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35__HMDAccessoryBrowser___inactivate__block_invoke;
  block[3] = &unk_264A2F7F8;
  void block[4] = self;
  dispatch_async(v3, block);
}

void __35__HMDAccessoryBrowser___inactivate__block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v2 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 8);
  os_unfair_lock_lock_with_options();
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v3 = *(id *)(*(void *)(a1 + 32) + 64);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v25 objects:v31 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v26;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v26 != v5) {
          objc_enumerationMutation(v3);
        }
        if (objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * i), "isValid", (void)v25))
        {

          os_unfair_lock_unlock(v2);
          id v11 = (void *)MEMORY[0x230FBD990]();
          id v12 = *(id *)(a1 + 32);
          id v13 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            int v14 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543362;
            uint64_t v30 = v14;
            _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Not inactivating, there is an active assertion", buf, 0xCu);
          }
          return;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v25 objects:v31 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }

  os_unfair_lock_unlock(v2);
  uint64_t v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = *(id *)(a1 + 32);
  uint64_t v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    BOOL v10 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v30 = v10;
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Inactivating", buf, 0xCu);
  }
  [*(id *)(a1 + 32) setActive:0];
  if (isWatch())
  {
    [*(id *)(a1 + 32) _startOrStopAccessoryDiscovery];
  }
  else
  {
    uint64_t v15 = (void *)MEMORY[0x230FBD990]();
    id v16 = *(id *)(a1 + 32);
    id v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v30 = v18;
      _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@No HomeKit App in foreground - disabling BTLE scanning", buf, 0xCu);
    }
    id v19 = *(void **)(a1 + 32);
    __int16 v20 = [v19 btleAccessoryServerBrowser];
    [v19 _stopDiscoveryForAccessoryServerBrowser:v20];

    int v21 = [*(id *)(a1 + 32) btleAccessoryServerBrowser];
    [v21 updateScanInBackground:0];

    uint64_t v22 = [*(id *)(a1 + 32) ipAccessoryServerBrowser];
    [v22 stopDiscoveringWACAccessoryServersWithInvalidation:1];

    if (isiOSDevice() || isMac())
    {
      long long v23 = objc_msgSend(*(id *)(a1 + 32), "hap2AccessoryServerBrowser", (void)v25);
      [v23 stopConfirmingPairedAccessoryReachability];
    }
    id v24 = objc_msgSend(*(id *)(a1 + 32), "mediaBrowser", (void)v25);
    [v24 stopDiscoveringAssociatedAccessoriesViaBonjour];
  }
}

- (void)__activate
{
  id v3 = [(HMDAccessoryBrowser *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __33__HMDAccessoryBrowser___activate__block_invoke;
  block[3] = &unk_264A2F7F8;
  void block[4] = self;
  dispatch_async(v3, block);
}

void __33__HMDAccessoryBrowser___activate__block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = HMFGetLogIdentifier();
    int v16 = 138543362;
    id v17 = v5;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Activating", (uint8_t *)&v16, 0xCu);
  }
  [*(id *)(a1 + 32) setActive:1];
  BOOL v6 = isWatch();
  uint64_t v7 = *(void **)(a1 + 32);
  if (v6)
  {
    [v7 _startOrStopAccessoryDiscovery];
  }
  else
  {
    if ([v7 areThereAnyPairedBTLEAccessories]) {
      int v8 = 1;
    }
    else {
      int v8 = [*(id *)(a1 + 32) areThereAnyPairedUnknownLinkTypeAccessories];
    }
    if ([*(id *)(a1 + 32) areThereAnyAssociatedAirPlayAccessories])
    {
      uint64_t v9 = [*(id *)(a1 + 32) mediaBrowser];
      [v9 startDiscoveringAssociatedAccessoriesViaBonjour];
    }
    if (v8)
    {
      BOOL v10 = (void *)MEMORY[0x230FBD990]();
      id v11 = *(id *)(a1 + 32);
      id v12 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        id v13 = HMFGetLogIdentifier();
        int v16 = 138543362;
        id v17 = v13;
        _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@HomeKit App came into foreground - enabling BTLE scanning since there is atleast one paired (potential) BTLE accessory", (uint8_t *)&v16, 0xCu);
      }
      [*(id *)(a1 + 32) btleAccessoryReachabilityProbeTimer:1];
    }
    if (isiOSDevice() || isMac())
    {
      int v14 = [*(id *)(a1 + 32) hap2AccessoryServerBrowser];
      [v14 startConfirmingPairedAccessoryReachability];
    }
    uint64_t v15 = [*(id *)(a1 + 32) btleAccessoryServerBrowser];
    [v15 updateScanInBackground:1];
  }
}

- (void)endActiveAssertion:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = v5;

  if (!v6)
  {
    id v12 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:@"Invalid assertion object" userInfo:0];
    goto LABEL_11;
  }
  uint64_t v7 = [v6 accessoryBrowser];

  if (v7 != self)
  {
    id v12 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:@"Invalid assertion object not created by HMHomeManager instance" userInfo:0];
LABEL_11:
    objc_exception_throw(v12);
  }
  int v8 = (void *)MEMORY[0x230FBD990]();
  uint64_t v9 = self;
  BOOL v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    int v13 = 138543618;
    int v14 = v11;
    __int16 v15 = 2112;
    id v16 = v6;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Releasing active assertion : %@", (uint8_t *)&v13, 0x16u);
  }
  [v6 invalidate];
  os_unfair_lock_lock_with_options();
  [(NSHashTable *)v9->_activeAssertions removeObject:v6];
  os_unfair_lock_unlock(&v9->_lock);
}

- (id)beginActiveAssertionWithReason:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  uint64_t v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = HMFGetLogIdentifier();
    int v11 = 138543618;
    id v12 = v8;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Taking active assertion with reason: %@", (uint8_t *)&v11, 0x16u);
  }
  uint64_t v9 = [[__HMDPairedAccessoryBrowseAssertion alloc] initWithAccessoryBrowser:v6 reason:v4];
  os_unfair_lock_lock_with_options();
  [(NSHashTable *)v6->_activeAssertions addObject:v9];
  os_unfair_lock_unlock(&v6->_lock);

  return v9;
}

- (unint64_t)numPairedIPAccessories
{
  id v2 = [(HMDAccessoryBrowser *)self __identifiersOfPairedAccessoriesWithTransports:1];
  unint64_t v3 = [v2 count];

  return v3;
}

- (BOOL)areThereAnyAssociatedAirPlayAccessories
{
  id v2 = [(HMDAccessoryBrowser *)self identifiersOfAssociatedMediaAccessories];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (id)identifiersOfAssociatedMediaAccessories
{
  return [(HMDAccessoryBrowser *)self __identifiersOfPairedAccessoriesWithTransports:16];
}

- (BOOL)areThereAnyPairedBTLEAccessories
{
  id v2 = [(HMDAccessoryBrowser *)self identifiersOfPairedBTLEAccessories];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (id)identifiersOfPairedUnknownLinkTypeAccessories
{
  id v2 = [(HMDAccessoryBrowser *)self pairedAccessories];
  BOOL v3 = objc_msgSend(v2, "na_map:", &__block_literal_global_387_210440);

  return v3;
}

id __68__HMDAccessoryBrowser_identifiersOfPairedUnknownLinkTypeAccessories__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 transports])
  {
    BOOL v3 = 0;
  }
  else
  {
    BOOL v3 = [v2 identifier];
  }

  return v3;
}

- (BOOL)areThereAnyPairedUnknownLinkTypeAccessories
{
  id v2 = [(HMDAccessoryBrowser *)self pairedAccessories];
  char v3 = objc_msgSend(v2, "na_any:", &__block_literal_global_384_210443);

  return v3;
}

BOOL __66__HMDAccessoryBrowser_areThereAnyPairedUnknownLinkTypeAccessories__block_invoke(uint64_t a1, void *a2)
{
  return [a2 transports] == 0;
}

- (id)identifiersOfPairedBTLEAccessories
{
  return [(HMDAccessoryBrowser *)self __identifiersOfPairedAccessoriesWithTransports:2];
}

- (BOOL)areThereAnyPairedAccessories
{
  id v2 = [(HMDAccessoryBrowser *)self pairedAccessories];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (id)__identifiersOfPairedAccessoriesWithTransports:(unint64_t)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = [(HMDAccessoryBrowser *)self pairedAccessories];
  uint64_t v5 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        int v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if ((objc_msgSend(v11, "transports", (void)v15) & a3) != 0)
        {
          id v12 = [v11 identifier];
          [v5 addObject:v12];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  __int16 v13 = (void *)[v5 copy];
  return v13;
}

- (id)pairedHMDHAPAccessoryWithAccessoryServer:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 identifier];
  id v6 = [(HMDAccessoryBrowser *)self pairedAccessoryInformationWithIdentifier:v5];
  uint64_t v7 = [v6 delegate];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 0;
  }
  id v9 = v8;

  if (v9)
  {
    BOOL v10 = [v4 primaryAccessory];
    int v11 = [v9 hmdHAPAccessoryWithHAPAccessory:v10];
  }
  else
  {
    int v11 = 0;
  }

  return v11;
}

- (id)pairedAccessoryInformationWithSetupID:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = [(HMDAccessoryBrowser *)self pairedAccessories];
  id v6 = (id)[v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        BOOL v10 = [v9 setupHash];
        int v11 = [v9 identifier];
        char v12 = HAPValidateSetupHash();

        if (v12)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)pairedAccessoryInformationWithIdentifier:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [(HMDAccessoryBrowser *)self pairedAccessories];
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
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
        id v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        BOOL v10 = [v9 identifier];
        char v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)removePairedAccessoryInfoWithIdentifier:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = self->_pairedAccessories;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        BOOL v10 = [v9 identifier];
        char v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          id v12 = v9;

          if (v12) {
            [(NSMutableArray *)self->_pairedAccessories removeObject:v12];
          }
          goto LABEL_12;
        }
      }
      uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  id v12 = 0;
LABEL_12:

  os_unfair_lock_unlock(&self->_lock);
}

- (void)resetPairedAccessories
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  [(NSMutableArray *)self->_pairedAccessories removeAllObjects];
  os_unfair_lock_unlock(p_lock);
}

- (void)removePairedAccessory:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = v4;
    os_unfair_lock_lock_with_options();
    [(NSMutableArray *)self->_pairedAccessories removeObject:v5];
    os_unfair_lock_unlock(&self->_lock);
    id v4 = v5;
  }
}

- (void)addPairedAccessory:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock_with_options();
    pairedAccessories = self->_pairedAccessories;
    uint64_t v14 = MEMORY[0x263EF8330];
    uint64_t v15 = 3221225472;
    long long v16 = __42__HMDAccessoryBrowser_addPairedAccessory___block_invoke;
    long long v17 = &unk_264A26E38;
    id v6 = v4;
    id v18 = v6;
    uint64_t v7 = [(NSMutableArray *)pairedAccessories hmf_objectPassingTest:&v14];
    if (v7)
    {
      uint64_t v8 = (void *)MEMORY[0x230FBD990]();
      id v9 = self;
      HMFGetOSLogHandle();
      BOOL v10 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        long long v13 = v8;
        HMFGetLogIdentifier();
        id v11 = (id)objc_claimAutoreleasedReturnValue();
        id v12 = [v7 identifier];
        *(_DWORD *)buf = 138543618;
        id v20 = v11;
        __int16 v21 = 2112;
        uint64_t v22 = v12;
        _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Removing existing paired accessory instance %@", buf, 0x16u);

        uint64_t v8 = v13;
      }

      [(NSMutableArray *)self->_pairedAccessories removeObject:v7];
    }
    -[NSMutableArray addObject:](self->_pairedAccessories, "addObject:", v6, v13, v14, v15, v16, v17);

    os_unfair_lock_unlock(&self->_lock);
  }
}

uint64_t __42__HMDAccessoryBrowser_addPairedAccessory___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isEqual:*(void *)(a1 + 32)];
}

- (NSMutableArray)pairedAccessories
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = (void *)[(NSMutableArray *)self->_pairedAccessories copy];
  os_unfair_lock_unlock(p_lock);
  return (NSMutableArray *)v4;
}

- (void)_removeBrowsingConnection:(id)a3 error:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HMDAccessoryBrowser *)self workQueue];
  dispatch_assert_queue_V2(v8);

  if (v6)
  {
    id v9 = [(HMDAccessoryBrowser *)self browsingConnections];
    BOOL v10 = observerMatchingConnection(v6, v9);

    if (v10)
    {
      id v11 = (void *)MEMORY[0x230FBD990]();
      id v12 = self;
      long long v13 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        uint64_t v14 = HMFGetLogIdentifier();
        int v15 = 138543618;
        long long v16 = v14;
        __int16 v17 = 2112;
        id v18 = v6;
        _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@De-registering connection for accessory browsing: %@", (uint8_t *)&v15, 0x16u);
      }
      [(HMDAccessoryBrowser *)v12 __removeBrowsingObserver:v10 error:v7];
    }
  }
}

- (void)__addBrowsingConnection:(id)a3
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDAccessoryBrowser *)self browsingConnections];
  id v6 = observerMatchingConnection(v4, v5);

  if (v6)
  {
    id v7 = (void *)MEMORY[0x230FBD990]();
    uint64_t v8 = self;
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      BOOL v10 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      long long v44 = v10;
      __int16 v45 = 2112;
      id v46 = v4;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Already have an active accessory browsing request from the connection: %@", buf, 0x16u);
    }
  }
  else
  {
    id v11 = (void *)[objc_alloc(MEMORY[0x263F425D8]) initWithObservedObject:v4];
    id v12 = (void *)MEMORY[0x230FBD990]();
    long long v13 = self;
    uint64_t v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      int v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      long long v44 = v15;
      __int16 v45 = 2112;
      id v46 = v4;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@Registering connection for accessory browsing: %@", buf, 0x16u);
    }
    objc_initWeak(&location, v13);
    objc_initWeak(&from, v11);
    v37[0] = MEMORY[0x263EF8330];
    v37[1] = 3221225472;
    v37[2] = __47__HMDAccessoryBrowser___addBrowsingConnection___block_invoke;
    v37[3] = &unk_264A26E10;
    id v31 = &v38;
    objc_copyWeak(&v38, &location);
    uint64_t v32 = &v39;
    objc_copyWeak(&v39, &from);
    [v11 setDeallocationBlock:v37];
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v16 = v5;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v33 objects:v42 count:16];
    if (v17)
    {
      uint64_t v18 = *(void *)v34;
      while (2)
      {
        uint64_t v19 = 0;
        do
        {
          if (*(void *)v34 != v18) {
            objc_enumerationMutation(v16);
          }
          id v20 = objc_msgSend(*(id *)(*((void *)&v33 + 1) + 8 * v19), "observedObject", v31, v32, (void)v33);
          objc_opt_class();
          unsigned __int8 isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & (v20 != 0)) != 0)
          {
            char v22 = 1;
            goto LABEL_17;
          }
          ++v19;
        }
        while (v17 != v19);
        uint64_t v17 = [v16 countByEnumeratingWithState:&v33 objects:v42 count:16];
        if (v17) {
          continue;
        }
        break;
      }
    }
    char v22 = 0;
LABEL_17:

    os_unfair_lock_lock_with_options();
    [(NSMutableSet *)v13->_browsingConnections addObject:v11];
    os_unfair_lock_unlock(&v13->_lock);
    id v5 = [(HMDAccessoryBrowser *)v13 browsingConnections];

    if ([v5 count] == 1)
    {
      uint64_t v23 = (void *)MEMORY[0x230FBD990]();
      id v24 = v13;
      HMFGetOSLogHandle();
      long long v25 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        long long v26 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        long long v44 = v26;
        _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_INFO, "%{public}@First connection interested in accessory(and media) browsing - starting", buf, 0xCu);
      }
      [(HMDAccessoryBrowser *)v24 _startDiscoveringAccessoriesWithLinkType:0];
    }
    else if ((v22 & 1) == 0)
    {
      long long v27 = (void *)MEMORY[0x230FBD990]();
      long long v28 = v13;
      HMFGetOSLogHandle();
      id v29 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        uint64_t v30 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        long long v44 = v30;
        _os_log_impl(&dword_22F52A000, v29, OS_LOG_TYPE_INFO, "%{public}@First connection interested in media accessory browsing - starting", buf, 0xCu);
      }
      [(HMDAccessoryBrowser *)v28 _startDiscoveringMediaAccessories];
    }
    objc_destroyWeak(v32);
    objc_destroyWeak(v31);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
}

void __47__HMDAccessoryBrowser___addBrowsingConnection___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = v3;
  if (WeakRetained && v3)
  {
    id v5 = (void *)MEMORY[0x230FBD990]();
    id v6 = WeakRetained;
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = HMFGetLogIdentifier();
      id v9 = [v4 observedObject];
      *(_DWORD *)buf = 138543618;
      uint64_t v14 = v8;
      __int16 v15 = 2112;
      id v16 = v9;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling de-allocation of connection for accessory browsing: %@", buf, 0x16u);
    }
    BOOL v10 = [v6 workQueue];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __47__HMDAccessoryBrowser___addBrowsingConnection___block_invoke_379;
    v11[3] = &unk_264A2F820;
    void v11[4] = v6;
    id v12 = v4;
    dispatch_async(v10, v11);
  }
}

void __47__HMDAccessoryBrowser___addBrowsingConnection___block_invoke_379(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = [MEMORY[0x263F087E8] hmPrivateErrorWithCode:2504];
  objc_msgSend(v1, "__removeBrowsingObserver:error:", v2, v3);
}

- (void)__removeBrowsingObserver:(id)a3 error:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HMDAccessoryBrowser *)self workQueue];
  dispatch_assert_queue_V2(v8);

  if (v6)
  {
    id v9 = [(HMDAccessoryBrowser *)self browsingConnections];
    if ([v9 containsObject:v6])
    {
      [v6 setDeallocationBlock:0];
      os_unfair_lock_lock_with_options();
      [(NSMutableSet *)self->_browsingConnections removeObject:v6];
      os_unfair_lock_unlock(&self->_lock);
      BOOL v10 = [(HMDAccessoryBrowser *)self browsingConnections];

      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v9 = v10;
      uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v26 count:16];
      if (v11)
      {
        uint64_t v12 = *(void *)v21;
        while (2)
        {
          uint64_t v13 = 0;
          do
          {
            if (*(void *)v21 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v14 = objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * v13), "observedObject", (void)v20);
            objc_opt_class();
            unsigned __int8 isKindOfClass = objc_opt_isKindOfClass();

            if ((isKindOfClass & (v14 != 0)) != 0)
            {

              goto LABEL_15;
            }
            ++v13;
          }
          while (v11 != v13);
          uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v26 count:16];
          if (v11) {
            continue;
          }
          break;
        }
      }

      id v16 = (void *)MEMORY[0x230FBD990]();
      uint64_t v17 = self;
      uint64_t v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        uint64_t v19 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        long long v25 = v19;
        _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_INFO, "%{public}@No more clients interested in accessory browsing - stopping", buf, 0xCu);
      }
      [(HMDAccessoryBrowser *)v17 _stopDiscoveringAccessoriesWithError:v7];
    }
LABEL_15:
  }
}

- (BOOL)__isMediaAccessoryBrowsingRequested
{
  uint64_t v2 = [(HMDAccessoryBrowser *)self browsingConnections];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (BOOL)__isAccessoryBrowsingRequested
{
  uint64_t v2 = [(HMDAccessoryBrowser *)self browsingConnections];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (void)__resetBrowsingConnections
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  [(NSMutableSet *)self->_browsingConnections removeAllObjects];
  os_unfair_lock_unlock(p_lock);
}

- (id)browsingConnections
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = (void *)[(NSMutableSet *)self->_browsingConnections copy];
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setInternalDiscoveryRequest:(BOOL)a3
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_internalDiscoveryRequest = a3;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)internalDiscoveryRequest
{
  uint64_t v2 = self;
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_internalDiscoveryRequest;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (id)dumpBrowsingConnections
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  BOOL v3 = objc_opt_new();
  id v4 = [(HMDAccessoryBrowser *)self browsingConnections];
  if ([v4 count])
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v5);
          }
          BOOL v10 = [*(id *)(*((void *)&v15 + 1) + 8 * i) observedObject];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            uint64_t v11 = v10;
          }
          else {
            uint64_t v11 = 0;
          }
          id v12 = v11;

          if (v12) {
            [v3 appendFormat:@"Browsing(Media): %@\n", v12];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v7);
    }

    uint64_t v13 = v3;
  }
  else
  {
    uint64_t v13 = @"None";
  }

  return v13;
}

- (void)_sendNewAccessoryData:(id)a3 messageName:(id)a4
{
  v33[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([(HMDAccessoryBrowser *)self __isAccessoryBrowsingRequested])
  {
    v33[0] = v6;
    uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v33 count:1];
    uint64_t v27 = encodeRootObjectForIncomingXPCMessage(v8, 0);

    id v32 = v6;
    id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v32 count:1];
    long long v26 = encodeRootObjectForSPIClients(v9);

    uint64_t v30 = @"kAccessoriesInfoDataKey";
    id v31 = v27;
    long long v25 = [NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
    long long v28 = @"kAccessoriesInfoDataKey";
    id v29 = v26;
    BOOL v10 = [NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
    uint64_t v11 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"BF2B0921-858B-42F5-B2EB-C915FB953E5B"];
    id v12 = (void *)[objc_alloc(MEMORY[0x263F42570]) initWithTarget:v11];
    uint64_t v13 = [MEMORY[0x263F42590] messageWithName:v7 destination:v12 payload:v25];
    id v14 = v6;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      long long v15 = v14;
    }
    else {
      long long v15 = 0;
    }
    id v16 = v14;
    id v17 = v15;
    objc_opt_class();
    unsigned __int8 isKindOfClass = objc_opt_isKindOfClass();

    int v19 = (v16 != 0) & isKindOfClass;
    if (!v17) {
      int v19 = 1;
    }
    if (v19) {
      uint64_t v20 = 1;
    }
    else {
      uint64_t v20 = 5;
    }

    long long v21 = [[HMDAccessoryBrowserXPCMessageSendPolicy alloc] initWithRequiredEntitlements:v20];
    [v13 setSendPolicy:v21];

    [v13 setRequiresNoSPIEntitlement:1];
    long long v22 = [(HMDAccessoryBrowser *)self messageDispatcher];
    [v22 sendMessage:v13 completionHandler:0];

    long long v23 = (void *)[v13 mutableCopy];
    [v23 setMessagePayload:v10];
    [v23 setRequiresNoSPIEntitlement:0];
    [v23 setRequiresSPIEntitlement:1];
    id v24 = [(HMDAccessoryBrowser *)self messageDispatcher];
    [v24 sendMessage:v23 completionHandler:0];
  }
}

- (void)_handleRemovedAccessory:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    id v5 = (void *)MEMORY[0x230FBD990]();
    id v6 = self;
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = HMFGetLogIdentifier();
      int v9 = 138543618;
      BOOL v10 = v8;
      __int16 v11 = 2112;
      id v12 = v4;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Removed accessory: %@", (uint8_t *)&v9, 0x16u);
    }
    [(HMDAccessoryBrowser *)v6 _sendNewAccessoryData:v4 messageName:@"kNewAccessoriesRemovedNotificationKey"];
    [(HMDAccessoryBrowser *)v6 setGenerationCounter:[(HMDAccessoryBrowser *)v6 generationCounter] + 1];
  }
}

- (void)handleRemovedAccessory:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(HMDAccessoryBrowser *)self workQueue];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    void v6[2] = __46__HMDAccessoryBrowser_handleRemovedAccessory___block_invoke;
    v6[3] = &unk_264A2F820;
    void v6[4] = self;
    id v7 = v4;
    dispatch_async(v5, v6);
  }
}

uint64_t __46__HMDAccessoryBrowser_handleRemovedAccessory___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleRemovedAccessory:*(void *)(a1 + 40)];
}

- (void)_handleAddedAccessory:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    id v5 = (void *)MEMORY[0x230FBD990]();
    id v6 = self;
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = HMFGetLogIdentifier();
      int v9 = 138543618;
      BOOL v10 = v8;
      __int16 v11 = 2112;
      id v12 = v4;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Added accessory: %@", (uint8_t *)&v9, 0x16u);
    }
    [(HMDAccessoryBrowser *)v6 _sendNewAccessoryData:v4 messageName:@"kNewAccessoriesFoundNotificationKey"];
    [(HMDAccessoryBrowser *)v6 _notifyManagerOfNewAccessory];
    [(HMDAccessoryBrowser *)v6 setGenerationCounter:[(HMDAccessoryBrowser *)v6 generationCounter] + 1];
  }
}

- (void)handleAddedAccessory:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(HMDAccessoryBrowser *)self workQueue];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    void v6[2] = __44__HMDAccessoryBrowser_handleAddedAccessory___block_invoke;
    v6[3] = &unk_264A2F820;
    void v6[4] = self;
    id v7 = v4;
    dispatch_async(v5, v6);
  }
}

uint64_t __44__HMDAccessoryBrowser_handleAddedAccessory___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleAddedAccessory:*(void *)(a1 + 40)];
}

- (NSArray)deviceSetupMediaAccessories
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = [(NSMutableSet *)self->_deviceSetupMediaAccessories allObjects];
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (NSArray)unassociatedMediaAccessories
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = [(NSMutableSet *)self->_unassociatedMediaAccessories allObjects];
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (id)_unassociatedMediaAccessoryWithIdentifier:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [(HMDAccessoryBrowser *)self unassociatedMediaAccessories];
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
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
        int v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        BOOL v10 = [v9 identifier];
        char v11 = [v4 isEqual:v10];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)unassociatedAccessoriesForClientRequest:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  int v4 = [a3 isEntitledForSPIAccess];
  if (v4) {
    [(HMDAccessoryBrowser *)self populateUnassociatedCurrentAccessory];
  }
  id v5 = [(HMDAccessoryBrowser *)self unassociatedAccessories];
  uint64_t v18 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = v5;
  uint64_t v6 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(id *)(*((void *)&v20 + 1) + 8 * i);
        objc_opt_class();
        int isKindOfClass = objc_opt_isKindOfClass();

        BOOL v12 = v10 != 0;
        int v13 = isKindOfClass & v12;
        id v14 = v10;
        objc_opt_class();
        int v15 = objc_opt_isKindOfClass();

        if (((v4 | v13) & 1) != 0 || (v15 & v12) != 0) {
          objc_msgSend(v18, "addObject:", v14, v18);
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v7);
  }

  long long v16 = (void *)[v18 copy];
  return v16;
}

- (void)resetUnassociatedCurrentAccessory
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  int v4 = self->_unassociatedCurrentAccessory;
  unassociatedCurrentAccessory = self->_unassociatedCurrentAccessory;
  self->_unassociatedCurrentAccessory = 0;

  os_unfair_lock_unlock(p_lock);
  if (v4)
  {
    uint64_t v6 = (void *)MEMORY[0x230FBD990]();
    uint64_t v7 = self;
    uint64_t v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v9 = HMFGetLogIdentifier();
      int v10 = 138543362;
      char v11 = v9;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Resetting unassociated current accessory", (uint8_t *)&v10, 0xCu);
    }
    [(HMDAccessoryBrowser *)v7 _sendNewAccessoryData:v4 messageName:@"kNewAccessoriesRemovedNotificationKey"];
  }
}

- (void)populateUnassociatedCurrentAccessory
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self->_unassociatedCurrentAccessory)
  {
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    int v4 = [(HMDAccessoryBrowser *)self mediaBrowser];
    id v5 = [v4 currentAccessory];
    objc_storeStrong((id *)&self->_unassociatedCurrentAccessory, v5);

    os_unfair_lock_unlock(p_lock);
    if (v5)
    {
      uint64_t v6 = (void *)MEMORY[0x230FBD990]();
      uint64_t v7 = self;
      uint64_t v8 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        int v9 = HMFGetLogIdentifier();
        int v10 = 138543618;
        char v11 = v9;
        __int16 v12 = 2112;
        int v13 = v5;
        _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Populated unassociated current accessory: %@", (uint8_t *)&v10, 0x16u);
      }
      [(HMDAccessoryBrowser *)v7 _sendNewAccessoryData:v5 messageName:@"kNewAccessoriesFoundNotificationKey"];
    }
  }
}

- (NSArray)unassociatedAccessories
{
  BOOL v3 = [MEMORY[0x263EFF980] array];
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v5 = [(NSMutableSet *)self->_unpairedHAPAccessories allObjects];
  [v3 addObjectsFromArray:v5];

  uint64_t v6 = [(NSMutableSet *)self->_unassociatedMediaAccessories allObjects];
  [v3 addObjectsFromArray:v6];

  uint64_t v7 = [(NSMutableSet *)self->_deviceSetupMediaAccessories allObjects];
  [v3 addObjectsFromArray:v7];

  uint64_t v8 = [(NSMutableSet *)self->_unassociatedWACAccessories allObjects];
  [v3 addObjectsFromArray:v8];

  int v9 = self->_unassociatedCurrentAccessory;
  if (v9) {
    [v3 addObject:v9];
  }

  os_unfair_lock_unlock(p_lock);
  int v10 = (void *)[v3 copy];

  return (NSArray *)v10;
}

- (void)removeUnassociatedAccessory:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;
  if (v6)
  {
    [(HMDAccessoryBrowser *)self removeUnassociatedMediaAccessory:v6];
  }
  else
  {
    id v7 = v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v8 = v7;
    }
    else {
      uint64_t v8 = 0;
    }
    id v9 = v8;

    if (v9)
    {
      [(HMDAccessoryBrowser *)self removeUnassociatedWACAccessory:v9];
    }
    else
    {
      id v10 = v7;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        char v11 = v10;
      }
      else {
        char v11 = 0;
      }
      id v12 = v11;

      if (v12)
      {
        [(HMDAccessoryBrowser *)self removeUnpairedHAPAccessory:v12];
      }
      else
      {
        int v13 = (void *)MEMORY[0x230FBD990]();
        uint64_t v14 = self;
        int v15 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          long long v16 = HMFGetLogIdentifier();
          int v17 = 138543618;
          uint64_t v18 = v16;
          __int16 v19 = 2112;
          id v20 = v10;
          _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@Unknown unassociated accessory type: %@ - dropping...", (uint8_t *)&v17, 0x16u);
        }
      }
    }
  }
}

- (void)removeUnassociatedAccessoryWithIdentifier:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(HMDAccessoryBrowser *)self unassociatedAccessories];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        char v11 = objc_msgSend(v10, "identifier", (void)v17);
        int v12 = [v4 isEqual:v11];

        if (v12)
        {
          int v13 = (void *)MEMORY[0x230FBD990]();
          uint64_t v14 = self;
          int v15 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            long long v16 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            long long v22 = v16;
            __int16 v23 = 2112;
            id v24 = v10;
            _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@Removing unassociated accessory: %@", buf, 0x16u);
          }
          [(HMDAccessoryBrowser *)v14 removeUnassociatedAccessory:v10];
          goto LABEL_13;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v25 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_13:
}

- (void)addUnassociatedAccessory:(id)a3 forDeviceSetup:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }
  id v8 = v7;
  if (v8)
  {
    [(HMDAccessoryBrowser *)self addUnassociatedMediaAccessory:v8 forDeviceSetup:v4];
  }
  else
  {
    id v9 = v6;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v10 = v9;
    }
    else {
      id v10 = 0;
    }
    id v11 = v10;

    if (v11)
    {
      [(HMDAccessoryBrowser *)self addUnpairedHAPAccessory:v11];
    }
    else
    {
      int v12 = (void *)MEMORY[0x230FBD990]();
      int v13 = self;
      uint64_t v14 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = HMFGetLogIdentifier();
        int v16 = 138543618;
        long long v17 = v15;
        __int16 v18 = 2112;
        id v19 = v9;
        _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@Unknown unassociated accessory type: %@ - dropping...", (uint8_t *)&v16, 0x16u);
      }
    }
  }
}

- (void)_handleTestModeConfigRequest:(id)a3
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = [v4 BOOLForKey:@"kConfigTestingResetAccessoriesKey"];
  id v6 = [v4 arrayForKey:@"kConfigTestingAddAccessoriesKey"];
  if (!v6 && !v5)
  {
    uint64_t v7 = [v4 messagePayload];
    id v8 = objc_msgSend(v7, "hmf_dictionaryForKey:", @"kConfigTestingAccessoryControlKey");

    if ([v8 count])
    {
      id v9 = [(HMDAccessoryBrowser *)self demoAccessoryServerBrowser];

      if (v9)
      {
        id v10 = [(HMDAccessoryBrowser *)self demoAccessoryServerBrowser];
        id v36 = 0;
        id v11 = [v10 _handleTestModeConfigRequest:v8 response:&v36];
        id v12 = v36;

LABEL_24:
        [v4 respondWithPayload:v12 error:v11];

        goto LABEL_25;
      }
      id v32 = (void *)MEMORY[0x230FBD990]();
      long long v33 = self;
      long long v34 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        long long v35 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        id v38 = v35;
        _os_log_impl(&dword_22F52A000, v34, OS_LOG_TYPE_DEFAULT, "%{public}@Demo accessory browser not yet started", buf, 0xCu);
      }
      id v11 = [MEMORY[0x263F087E8] hmErrorWithCode:21];
    }
    else
    {
      id v11 = 0;
    }
    id v12 = 0;
    goto LABEL_24;
  }
  if ((v5 & 1) != 0
    || ([(HMDAccessoryBrowser *)self demoAccessoryServerBrowser],
        int v13 = objc_claimAutoreleasedReturnValue(),
        v13,
        !v13))
  {
    uint64_t v14 = [(HMDAccessoryBrowser *)self demoAccessoryServerBrowser];

    if (v14)
    {
      int v15 = [(HMDAccessoryBrowser *)self demoAccessoryServerBrowser];
      [v15 resetDemoAccessories];

      int v16 = [(HMDAccessoryBrowser *)self accessoryServerBrowsers];
      long long v17 = [(HMDAccessoryBrowser *)self demoAccessoryServerBrowser];
      [v16 removeObject:v17];
    }
    __int16 v18 = [HMDAccessoryServerBrowserDemo alloc];
    id v19 = [(HMDAccessoryBrowser *)self workQueue];
    uint64_t v20 = [(HAPAccessoryServerBrowser *)v18 initWithQueue:v19];
    [(HMDAccessoryBrowser *)self setDemoAccessoryServerBrowser:v20];

    uint64_t v21 = [(HMDAccessoryBrowser *)self demoAccessoryServerBrowser];
    long long v22 = [(HMDAccessoryBrowser *)self workQueue];
    [v21 setDelegate:self queue:v22];

    __int16 v23 = [(HMDAccessoryBrowser *)self accessoryServerBrowsers];
    id v24 = [(HMDAccessoryBrowser *)self demoAccessoryServerBrowser];
    [v23 addObject:v24];
  }
  if ([v6 count]) {
    char v25 = 1;
  }
  else {
    char v25 = v5;
  }
  if (v25)
  {
    uint64_t v26 = [(HMDAccessoryBrowser *)self demoAccessoryServerBrowser];
    [v26 appendDemoData:v6];

    [v4 respondWithSuccess];
  }
  else
  {
    uint64_t v27 = (void *)MEMORY[0x230FBD990]();
    long long v28 = self;
    id v29 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v30 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v38 = v30;
      _os_log_impl(&dword_22F52A000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@Request to add test/demo accessories but none found", buf, 0xCu);
    }
    id v31 = [MEMORY[0x263F087E8] hmErrorWithCode:3];
    [v4 respondWithError:v31];
  }
LABEL_25:
}

- (void)configureDemoBrowserWithDemoAccessories:(id)a3 finalized:(BOOL)a4
{
  BOOL v4 = a4;
  id v15 = a3;
  id v6 = [(HMDAccessoryBrowser *)self demoAccessoryServerBrowser];

  if (v15 && !v6)
  {
    uint64_t v7 = [HMDAccessoryServerBrowserDemo alloc];
    id v8 = [(HMDAccessoryBrowser *)self workQueue];
    id v9 = [(HAPAccessoryServerBrowser *)v7 initWithQueue:v8];
    [(HMDAccessoryBrowser *)self setDemoAccessoryServerBrowser:v9];

    id v10 = [(HMDAccessoryBrowser *)self demoAccessoryServerBrowser];
    id v11 = [(HMDAccessoryBrowser *)self workQueue];
    [v10 setDelegate:self queue:v11];

    id v12 = [(HMDAccessoryBrowser *)self demoAccessoryServerBrowser];
    [v12 loadDemoData:v15 finalized:v4];

    int v13 = [(HMDAccessoryBrowser *)self accessoryServerBrowsers];
    uint64_t v14 = [(HMDAccessoryBrowser *)self demoAccessoryServerBrowser];
    [v13 addObject:v14];
  }
}

- (void)setBrowseableLinkTypes:(id)a3
{
  BOOL v4 = (NSArray *)a3;
  [(HMDAccessoryBrowser *)self validateLinkTypes:v4];
  os_unfair_lock_lock_with_options();
  browseableLinkTypes = self->_browseableLinkTypes;
  self->_browseableLinkTypes = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)validateLinkTypes:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a3;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
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
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) intValue];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)dealloc
{
  id v3 = [(HMDAccessoryBrowser *)self messageDispatcher];
  [v3 deregisterReceiver:self];

  uint64_t v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)HMDAccessoryBrowser;
  [(HMDAccessoryBrowser *)&v5 dealloc];
}

- (void)updateBroadcastKeyForIdentifier:(id)a3 key:(id)a4 keyUpdatedStateNumber:(id)a5 keyUpdatedTime:(double)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = [(HMDAccessoryBrowser *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __96__HMDAccessoryBrowser_updateBroadcastKeyForIdentifier_key_keyUpdatedStateNumber_keyUpdatedTime___block_invoke;
  block[3] = &unk_264A297C0;
  void block[4] = self;
  id v18 = v10;
  id v19 = v11;
  id v20 = v12;
  double v21 = a6;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(v13, block);
}

void __96__HMDAccessoryBrowser_updateBroadcastKeyForIdentifier_key_keyUpdatedStateNumber_keyUpdatedTime___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) btleAccessoryServerBrowser];
  [v2 updateBroadcastKeyForIdentifier:*(void *)(a1 + 40) key:*(void *)(a1 + 48) keyUpdatedStateNumber:*(void *)(a1 + 56) keyUpdatedTime:*(double *)(a1 + 64)];
}

- (void)updateStateForIdentifier:(id)a3 stateNumber:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HMDAccessoryBrowser *)self btleAccessoryServerBrowser];
  [v8 updateStateForIdentifier:v7 stateNumber:v6];
}

- (void)retrieveCurrentStateForIdentifier:(id)a3 stateNumber:(id *)a4 isReachable:(BOOL *)a5 linkQuality:(unint64_t *)a6 lastSeen:(id *)a7
{
  id v12 = a3;
  id v13 = [(HMDAccessoryBrowser *)self btleAccessoryServerBrowser];
  [v13 retrieveCurrentStateForIdentifier:v12 stateNumber:a4 isReachable:a5 linkQuality:a6 lastSeen:a7];
}

- (void)setQOS:(int64_t)a3
{
  objc_super v5 = [(HMDAccessoryBrowser *)self workQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  void v6[2] = __30__HMDAccessoryBrowser_setQOS___block_invoke;
  v6[3] = &unk_264A2C6A0;
  void v6[4] = self;
  void v6[5] = a3;
  dispatch_async(v5, v6);
}

void __30__HMDAccessoryBrowser_setQOS___block_invoke(uint64_t a1)
{
  BOOL v1 = *(void *)(a1 + 40) == 1;
  id v2 = [*(id *)(a1 + 32) btleAccessoryServerBrowser];
  [v2 configureBTLEQoSLimits:v1];
}

- (void)configureAccessory:(id)a3 trackState:(BOOL)a4 connectionPriority:(BOOL)a5
{
  id v8 = a3;
  long long v9 = [(HMDAccessoryBrowser *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __72__HMDAccessoryBrowser_configureAccessory_trackState_connectionPriority___block_invoke;
  block[3] = &unk_264A26DE8;
  void block[4] = self;
  id v12 = v8;
  BOOL v13 = a4;
  BOOL v14 = a5;
  id v10 = v8;
  dispatch_async(v9, block);
}

void __72__HMDAccessoryBrowser_configureAccessory_trackState_connectionPriority___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) btleAccessoryServerBrowser];
  id v2 = [*(id *)(a1 + 40) identifier];
  [v3 configureAccessoryWithIdentifier:v2 trackState:*(unsigned __int8 *)(a1 + 48) connectionPriority:*(unsigned __int8 *)(a1 + 49)];
}

- (void)configureWithHomeManager:(id)a3 mediaBrowserFactory:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDAccessoryBrowser *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __68__HMDAccessoryBrowser_configureWithHomeManager_mediaBrowserFactory___block_invoke;
  block[3] = &unk_264A2EE80;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __68__HMDAccessoryBrowser_configureWithHomeManager_mediaBrowserFactory___block_invoke(uint64_t a1)
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  objc_storeWeak((id *)(*(void *)(a1 + 32) + 168), *(id *)(a1 + 40));
  if (isFeatureMatterLocalFabricConfigEnabled())
  {
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v2 = [*(id *)(a1 + 40) homes];
    uint64_t v3 = [v2 countByEnumeratingWithState:&v38 objects:v43 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v39;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v39 != v5) {
            objc_enumerationMutation(v2);
          }
          id v7 = *(void **)(*((void *)&v38 + 1) + 8 * v6);
          id v8 = [*(id *)(a1 + 32) chipAccessoryServerBrowser];
          id v9 = [v8 storage];
          id v10 = [v7 fabric];
          [v10 setStorage:v9];

          id v11 = [v7 currentUser];
          unint64_t v12 = +[HMDUser hmmtrUserPrivilegeFromHMDUserPrivilege:](HMDUser, "hmmtrUserPrivilegeFromHMDUserPrivilege:", [v11 privilege]);
          id v13 = [v7 fabric];
          BOOL v14 = [v13 accessControl];
          [v14 setCurrentUserPrivilege:v12];

          ++v6;
        }
        while (v4 != v6);
        uint64_t v4 = [v2 countByEnumeratingWithState:&v38 objects:v43 count:16];
      }
      while (v4);
    }
  }
  id v15 = [*(id *)(a1 + 40) chipDataSource];
  id v16 = [*(id *)(a1 + 32) chipAccessoryServerBrowser];
  [v15 configureWithAccessoryServerBrowser:v16];

  if ((_os_feature_enabled_impl() & 1) != 0
    || CFPreferencesGetAppBooleanValue(@"MatterOTA", @"/Library/Managed Preferences/mobile/com.apple.homed.plist", 0))
  {
    long long v17 = [*(id *)(a1 + 40) matterSoftwareUpdateProviderDelegate];
    id v18 = [*(id *)(a1 + 32) chipAccessoryServerBrowser];
    id v19 = [v18 softwareUpdateProvider];
    [v17 configureWithSoftwareUpdateProvider:v19];
  }
  id v20 = *(void **)(a1 + 32);
  double v21 = (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  [v20 setMediaBrowser:v21];

  long long v22 = [*(id *)(a1 + 32) mediaBrowser];
  [v22 setDelegate:*(void *)(a1 + 32)];

  __int16 v23 = [*(id *)(a1 + 32) identifiersOfAssociatedMediaAccessories];
  if ([v23 count])
  {
    id v24 = [*(id *)(a1 + 32) mediaBrowser];
    [v24 registerAccessories:v23];
  }
  char v25 = [*(id *)(a1 + 32) chipAccessoryServerBrowser];
  [v25 configure];

  if ((_os_feature_enabled_impl() & 1) != 0 || HM_FEATURE_RVC_DEFAULTS_ENABLED())
  {
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    uint64_t v26 = objc_msgSend(*(id *)(a1 + 40), "homes", 0);
    uint64_t v27 = [v26 countByEnumeratingWithState:&v34 objects:v42 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v35;
      do
      {
        uint64_t v30 = 0;
        do
        {
          if (*(void *)v35 != v29) {
            objc_enumerationMutation(v26);
          }
          id v31 = *(void **)(*((void *)&v34 + 1) + 8 * v30);
          id v32 = [*(id *)(a1 + 32) chipAccessoryServerBrowser];
          long long v33 = [v31 fabric];
          [v32 configureControllerForFabric:v33];

          ++v30;
        }
        while (v28 != v30);
        uint64_t v28 = [v26 countByEnumeratingWithState:&v34 objects:v42 count:16];
      }
      while (v28);
    }
  }
}

- (void)configureWithHomeManager:(id)a3
{
}

HMDMediaBrowser *__48__HMDAccessoryBrowser_configureWithHomeManager___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [[HMDMediaBrowser alloc] initWithHomeManager:v2];

  return v3;
}

- (HMDAccessoryBrowser)initWithMessageDispatcher:(id)a3 injectedSettings:(id)a4
{
  uint64_t v77 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  v72.receiver = self;
  v72.super_class = (Class)HMDAccessoryBrowser;
  id v9 = [(HMDAccessoryBrowser *)&v72 init];
  if (v9)
  {
    uint64_t v10 = [objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"BF2B0921-858B-42F5-B2EB-C915FB953E5B"];
    uuid = v9->_uuid;
    v9->_uuid = (NSUUID *)v10;

    uint64_t v12 = [v8 workQueue];
    workQueue = v9->_workQueue;
    v9->_workQueue = (OS_dispatch_queue *)v12;

    v9->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v9->_messageDispatcher, a3);
    v9->_generationCounter = 0;
    v9->_btlePowerState = 0;
    uint64_t v14 = [MEMORY[0x263EFF980] array];
    accessoryServerBrowsers = v9->_accessoryServerBrowsers;
    v9->_accessoryServerBrowsers = (NSMutableArray *)v14;

    uint64_t v16 = [v8 createIpAccessoryBrowser];
    ipAccessoryServerBrowser = v9->_ipAccessoryServerBrowser;
    v9->_ipAccessoryServerBrowser = (HAPAccessoryServerBrowserIP *)v16;

    [(HAPAccessoryServerBrowserIP *)v9->_ipAccessoryServerBrowser setDelegate:v9 queue:v9->_workQueue];
    [(NSMutableArray *)v9->_accessoryServerBrowsers addObject:v9->_ipAccessoryServerBrowser];
    uint64_t v18 = [v8 createBtleAccessoryBrowser];
    btleAccessoryServerBrowser = v9->_btleAccessoryServerBrowser;
    v9->_btleAccessoryServerBrowser = (HAPAccessoryServerBrowserBTLE *)v18;

    [(HAPAccessoryServerBrowserBTLE *)v9->_btleAccessoryServerBrowser setDelegate:v9 queue:v9->_workQueue];
    [(NSMutableArray *)v9->_accessoryServerBrowsers addObject:v9->_btleAccessoryServerBrowser];
    uint64_t v20 = [v8 createCHIPAccessoryBrowser];
    chipAccessoryServerBrowser = v9->_chipAccessoryServerBrowser;
    v9->_chipAccessoryServerBrowser = (HMMTRAccessoryServerBrowser *)v20;

    [(HMMTRAccessoryServerBrowser *)v9->_chipAccessoryServerBrowser setDelegate:v9 queue:v9->_workQueue];
    [(NSMutableArray *)v9->_accessoryServerBrowsers addObject:v9->_chipAccessoryServerBrowser];
    long long v22 = [[HMDHAP2Storage alloc] initWithAccessoryBrowser:v9];
    hap2Storage = v9->_hap2Storage;
    v9->_hap2Storage = v22;

    id v24 = [(HMDAccessoryBrowser *)v9 hap2Storage];
    uint64_t v25 = [v8 createHap2AccessoryBrowserWithStorage:v24];
    hap2AccessoryServerBrowser = v9->_hap2AccessoryServerBrowser;
    v9->_hap2AccessoryServerBrowser = (HAPAccessoryServerBrowser *)v25;

    uint64_t v27 = v9->_hap2AccessoryServerBrowser;
    if (v27)
    {
      [(HAPAccessoryServerBrowser *)v27 setDelegate:v9 queue:v9->_workQueue];
      [(NSMutableArray *)v9->_accessoryServerBrowsers addObject:v9->_hap2AccessoryServerBrowser];
    }
    uint64_t v28 = [MEMORY[0x263EFF980] array];
    pairedAccessories = v9->_pairedAccessories;
    v9->_pairedAccessories = (NSMutableArray *)v28;

    uint64_t v30 = [MEMORY[0x263EFF9C0] set];
    unpairedHAPAccessories = v9->_unpairedHAPAccessories;
    v9->_unpairedHAPAccessories = (NSMutableSet *)v30;

    uint64_t v32 = [MEMORY[0x263EFF9C0] set];
    unassociatedMediaAccessories = v9->_unassociatedMediaAccessories;
    v9->_unassociatedMediaAccessories = (NSMutableSet *)v32;

    uint64_t v34 = [MEMORY[0x263EFF9C0] set];
    deviceSetupMediaAccessories = v9->_deviceSetupMediaAccessories;
    v9->_deviceSetupMediaAccessories = (NSMutableSet *)v34;

    uint64_t v36 = [MEMORY[0x263EFF9C0] set];
    unassociatedWACAccessories = v9->_unassociatedWACAccessories;
    v9->_unassociatedWACAccessories = (NSMutableSet *)v36;

    long long v38 = [HMDWACBrowser alloc];
    long long v39 = objc_alloc_init(HMDWACScanner);
    uint64_t v40 = [(HMDWACBrowser *)v38 initWithWACScanner:v39 messageDispatcher:v9->_messageDispatcher];
    wacBrowser = v9->_wacBrowser;
    v9->_wacBrowser = (HMDWACBrowser *)v40;

    [(HMDWACBrowser *)v9->_wacBrowser setDelegate:v9 queue:v9->_workQueue];
    uint64_t v42 = [MEMORY[0x263EFF9C0] set];
    browsingConnections = v9->_browsingConnections;
    v9->_browsingConnections = (NSMutableSet *)v42;

    uint64_t v44 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    activeAssertions = v9->_activeAssertions;
    v9->_activeAssertions = (NSHashTable *)v44;

    uint64_t v46 = [MEMORY[0x263EFF9C0] set];
    discoveredAccessoryServerIdentifiers = v9->_discoveredAccessoryServerIdentifiers;
    v9->_discoveredAccessoryServerIdentifiers = (NSMutableSet *)v46;

    uint64_t v48 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    tombstonedHAPAccessoryServers = v9->_tombstonedHAPAccessoryServers;
    v9->_tombstonedHAPAccessoryServers = (NSHashTable *)v48;

    uint64_t v50 = [MEMORY[0x263EFF980] array];
    currentlyPairingAccessories = v9->_currentlyPairingAccessories;
    v9->_currentlyPairingAccessories = (NSMutableArray *)v50;

    uint64_t v52 = [MEMORY[0x263EFF980] array];
    currentlyPairingProgressHandlers = v9->_currentlyPairingProgressHandlers;
    v9->_currentlyPairingProgressHandlers = (NSMutableArray *)v52;

    uint64_t v54 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    discoveringBLEAccessoryServerIdentifiers = v9->_discoveringBLEAccessoryServerIdentifiers;
    v9->_discoveringBLEAccessoryServerIdentifiers = (NSHashTable *)v54;

    uint64_t v56 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    discoveringAccessoryServerBrowsers = v9->_discoveringAccessoryServerBrowsers;
    v9->_discoveringAccessoryServerBrowsers = (NSHashTable *)v56;

    v9->_active = 0;
    uint64_t v58 = [v8 createAuthServerWithDelegate:v9];
    authServer = v9->_authServer;
    v9->_authServer = (HMDAuthServer *)v58;

    uint64_t v60 = [objc_alloc(MEMORY[0x263F42658]) initWithTimeInterval:0 options:120.0];
    stopReprovisioningTimer = v9->_stopReprovisioningTimer;
    v9->_stopReprovisioningTimer = (HMFTimer *)v60;

    [(HMFTimer *)v9->_stopReprovisioningTimer setDelegate:v9];
    int v62 = [(HMDAccessoryBrowser *)v9 workQueue];
    [(HMFTimer *)v9->_stopReprovisioningTimer setDelegateQueue:v62];

    uint64_t v63 = [objc_alloc(MEMORY[0x263F42658]) initWithTimeInterval:0 options:60.0];
    stopBrowsingAccessoriesNeedingReprovisioningTimer = v9->_stopBrowsingAccessoriesNeedingReprovisioningTimer;
    v9->_stopBrowsingAccessoriesNeedingReprovisioningTimer = (HMFTimer *)v63;

    [(HMFTimer *)v9->_stopBrowsingAccessoriesNeedingReprovisioningTimer setDelegate:v9];
    BOOL v65 = [(HMDAccessoryBrowser *)v9 workQueue];
    [(HMFTimer *)v9->_stopBrowsingAccessoriesNeedingReprovisioningTimer setDelegateQueue:v65];

    uint64_t v66 = (void *)MEMORY[0x230FBD990]();
    uint64_t v67 = v9;
    long long v68 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
    {
      long long v69 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v74 = v69;
      __int16 v75 = 2112;
      __int16 v76 = @"Enabled";
      _os_log_impl(&dword_22F52A000, v68, OS_LOG_TYPE_INFO, "%{public}@Whole Home Bluetooth %@ on target OS", buf, 0x16u);
    }
    browseableLinkTypes = v67->_browseableLinkTypes;
    v67->_browseableLinkTypes = (NSArray *)&unk_26E4743F8;

    [(HMDAccessoryBrowser *)v67 _registerForMessages];
    [(HMDAccessoryBrowser *)v67 _registerForNotifications];
  }

  return v9;
}

- (HMDAccessoryBrowser)initWithMessageDispatcher:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_alloc_init(HMDAccessoryBrowserInjectedSettingsDevice);
  uint64_t v6 = [(HMDAccessoryBrowser *)self initWithMessageDispatcher:v4 injectedSettings:v5];

  return v6;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t373 != -1) {
    dispatch_once(&logCategory__hmf_once_t373, &__block_literal_global_620);
  }
  id v2 = (void *)logCategory__hmf_once_v374;
  return v2;
}

void __34__HMDAccessoryBrowser_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  BOOL v1 = (void *)logCategory__hmf_once_v374;
  logCategory__hmf_once_v374 = v0;
}

@end