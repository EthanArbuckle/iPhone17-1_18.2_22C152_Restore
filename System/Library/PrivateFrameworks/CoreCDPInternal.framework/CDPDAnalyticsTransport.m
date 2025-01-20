@interface CDPDAnalyticsTransport
+ (BOOL)isEventPrivacyApproved:(id)a3;
+ (id)defaultTransport;
+ (id)getAllowedADPEvents;
+ (id)getAllowedCfuType;
+ (id)getAllowedDNUEvents;
+ (id)getAllowedErrorDomain;
+ (id)getAllowedEscapeOffer;
+ (id)getAllowedLocalSecretType;
+ (id)getAllowedSecurityEvents;
+ (id)getAllowedStringsForTelemetry;
+ (id)getApprovedEvents:(id)a3;
+ (id)getApprovedEventsForADPAndDNU;
+ (id)transportForClientType:(id)a3 clientBundleId:(id)a4 clientName:(id)a5;
+ (id)transportForEvent:(id)a3;
+ (void)flushCaches;
+ (void)flushTransportCache;
- (AAFAnalyticsTransportInProcessRTC)transport;
- (BOOL)shouldEnforcePrivacyComplianceForEvent:(id)a3;
- (CDPDAnalyticsTransport)initWithClientType:(id)a3 clientBundleId:(id)a4 clientName:(id)a5;
- (CDPDTTRController)ttrController;
- (NSNumber)clientType;
- (NSString)clientBundleId;
- (NSString)clientName;
- (NSString)debugDescription;
- (id)_sendEvent:(id)a3;
- (void)_appendCountryFieldToEvent:(id)a3 withCurrentEstimates:(id)a4;
- (void)_updateEventWithDefaultMetadata:(id)a3;
- (void)configureSessionForEvent:(id)a3 sendEventBlock:(id)a4 telemetryQueue:(id)a5;
- (void)enforcePrivacyComplianceOnEvent:(id)a3 key:(id)a4 value:(id)a5;
- (void)sendEvent:(id)a3;
- (void)setClientBundleId:(id)a3;
- (void)setClientName:(id)a3;
- (void)setClientType:(id)a3;
- (void)setTransport:(id)a3;
- (void)setTtrController:(id)a3;
@end

@implementation CDPDAnalyticsTransport

- (CDPDAnalyticsTransport)initWithClientType:(id)a3 clientBundleId:(id)a4 clientName:(id)a5
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v26.receiver = self;
  v26.super_class = (Class)CDPDAnalyticsTransport;
  v12 = [(CDPDAnalyticsTransport *)&v26 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_clientType, a3);
    p_clientBundleId = (void **)&v13->_clientBundleId;
    objc_storeStrong((id *)&v13->_clientBundleId, a4);
    objc_storeStrong((id *)&v13->_clientName, a5);
    if (!v10)
    {
      v15 = _CDPLogSystem();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
        -[CDPDAnalyticsTransport initWithClientType:clientBundleId:clientName:]((uint64_t)v9, (uint64_t)v11, v15);
      }

      v16 = *p_clientBundleId;
      *p_clientBundleId = @"unknown";
    }
    uint64_t v17 = [MEMORY[0x263F202C0] analyticsTransportRTCWithClientType:v9 clientBundleId:v10 clientName:v11];
    transport = v13->_transport;
    v13->_transport = (AAFAnalyticsTransportInProcessRTC *)v17;

    if (!v13->_transport)
    {
      v19 = _CDPLogSystem();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      {
        v25 = *p_clientBundleId;
        *(_DWORD *)buf = 138412802;
        id v28 = v9;
        __int16 v29 = 2112;
        v30 = v25;
        __int16 v31 = 2112;
        id v32 = v11;
        _os_log_fault_impl(&dword_218640000, v19, OS_LOG_TYPE_FAULT, "Underlying transport is nil. clientType = %@, clientBundleId = %@, clientName = %@", buf, 0x20u);
      }
    }
    uint64_t v20 = +[CDPDAnalyticsTransport getAllowedStringsForTelemetry];
    v21 = (void *)allowedStringsForTelemetry;
    allowedStringsForTelemetry = v20;

    v22 = objc_alloc_init(CDPDTTRController);
    ttrController = v13->_ttrController;
    v13->_ttrController = v22;
  }
  return v13;
}

+ (id)defaultTransport
{
  uint64_t v3 = *MEMORY[0x263F34828];
  v4 = [MEMORY[0x263F086E0] mainBundle];
  v5 = [v4 bundleIdentifier];
  v6 = [a1 transportForClientType:v3 clientBundleId:v5 clientName:*MEMORY[0x263F34820]];

  return v6;
}

+ (id)transportForEvent:(id)a3
{
  id v3 = a3;
  v4 = _CDPLogSystemAnalytics();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    +[CDPDAnalyticsTransport transportForEvent:](v3);
  }

  v5 = [v3 clientName];
  int v6 = [v5 isEqualToString:*MEMORY[0x263F34820]];

  if (v6)
  {
    v7 = [v3 objectForKeyedSubscript:*MEMORY[0x263F20328]];

    if (v7)
    {
      [v3 setClientName:*MEMORY[0x263F34818]];
      v8 = _CDPLogSystemAnalytics();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        +[CDPDAnalyticsTransport transportForEvent:](v3);
      }
    }
  }
  id v9 = [v3 clientType];
  id v10 = [MEMORY[0x263F086E0] mainBundle];
  id v11 = [v10 bundleIdentifier];
  v12 = [v3 clientName];
  v13 = +[CDPDAnalyticsTransport transportForClientType:v9 clientBundleId:v11 clientName:v12];

  return v13;
}

+ (void)flushTransportCache
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "Flushing transport caches", v2, v3, v4, v5, v6);
}

+ (void)flushCaches
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "Flushing transport and sequence caches", v2, v3, v4, v5, v6);
}

+ (id)getAllowedSecurityEvents
{
  if (getAllowedSecurityEvents_onceToken != -1) {
    dispatch_once(&getAllowedSecurityEvents_onceToken, &__block_literal_global_41);
  }
  uint64_t v2 = (void *)getAllowedSecurityEvents_approvedSecurityEvents;
  return v2;
}

uint64_t __50__CDPDAnalyticsTransport_getAllowedSecurityEvents__block_invoke()
{
  objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"com.apple.security.primaryAccountAdded", @"com.apple.security.idMSSecurityLevel", @"com.apple.security.cloudKitAccountAvailability", @"com.apple.security.initiatorCreatesPacket1", @"com.apple.security.acceptorCreatesPacket2", @"com.apple.security.kVSSyncAndWait", @"com.apple.security.flush", @"com.apple.security.validatedStashedAccountCredential", @"com.apple.security.initiatorCreatesPacket3", @"com.apple.security.fetchMachineID", @"com.apple.security.prepareIdentityInTPH", @"com.apple.security.createSOSApplication", @"com.apple.security.acceptorCreatesPacket4", @"com.apple.security.verifySOSApplication", @"com.apple.security.createSOSCircleBlob", @"com.apple.security.trustedDeviceListRefresh", @"com.apple.security.cKKSTLKFetch",
    @"com.apple.security.updateTrust",
    @"com.apple.security.initiatorJoinsTrustSystems",
    @"com.apple.security.initaitorJoinSOS",
    @"com.apple.security.updateTDL",
    @"com.apple.security.fetchAndPersistChanges",
    @"com.apple.security.fetchPolicyDocument",
    @"com.apple.security.join",
    @"com.apple.security.initiatorWaitsForUpgrade",
    @"com.apple.security.preApprovedJoin",
    @"com.apple.security.acceptorCreatesPacket5",
    @"com.apple.security.initiatorImportsInitialSyncData",
    @"com.apple.security.acceptorCreatesVoucher",
    @"com.apple.security.acceptorFetchesInitialSyncData",
    @"com.apple.security.ckks.launchStart",
    @"com.apple.security.ckks.syncingPolicySet",
    @"com.apple.security.ckks.CKAccountLogin",
    @"com.apple.security.ckks.zoneChangeFetch",
    @"com.apple.security.ckks.zoneCreation",
    @"com.apple.security.ckks.trustGain",
    @"com.apple.security.ckks.trustLoss",
    @"com.apple.security.ckks.healKeyHierarchy",
    @"com.apple.security.ckks.healKeyHierarchy.healBrokenRecords",
    @"com.apple.security.ckks.healKeyHierarchy.uploadHealedTLKShares",
    @"com.apple.security.ckks.healTLKShares",
    @"com.apple.security.ckks.healTLKShares.createMissingTLKShares",
    @"com.apple.security.ckks.healTLKShares.uploadMissingTLKShares",
    @"com.apple.security.ckks.processIncomingQueue",
    @"com.apple.security.ckks.processIncomingQueue.loadAndProcessIQEs",
    @"com.apple.security.ckks.processIncomingQueue.fixMismatchedViewItems",
    @"com.apple.security.ckks.processReceivedKeys",
    @"com.apple.security.ckks.scanLocalItems",
    @"com.apple.security.ckks.scanLocalItems.querySyncableItems",
    @"com.apple.security.ckks.scanLocalItems.onboardMissingItems",
    @"com.apple.security.ckks.processOutgoingQueue",
    @"com.apple.security.ckks.processOutgoingQueue.uploadOQEstoCK",
    @"com.apple.security.ckks.processOutgoingQueue.saveCKMirrorEntries",
    @"com.apple.security.ckks.firstManateeKeyFetch",
    @"com.apple.security.ckks.localSyncFinish",
    @"com.apple.security.ckks.contentSyncFinish",
    @"com.apple.security.ckks.deviceLocked",
    @"com.apple.security.ckks.deviceUnlocked",
    @"com.apple.security.ckks.localReset",
    @"com.apple.security.cliqueMemberIdentifier",
  getAllowedSecurityEvents_approvedSecurityEvents = @"com.apple.security.duplicateMachineID");
  return MEMORY[0x270F9A758]();
}

+ (id)getAllowedDNUEvents
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__CDPDAnalyticsTransport_getAllowedDNUEvents__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (getAllowedDNUEvents_onceToken != -1) {
    dispatch_once(&getAllowedDNUEvents_onceToken, block);
  }
  uint64_t v2 = (void *)getAllowedDNUEvents_approvedEvents;
  return v2;
}

void __45__CDPDAnalyticsTransport_getAllowedDNUEvents__block_invoke(uint64_t a1)
{
  objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"com.apple.appleaccount.inheritance.preflightCheckEvent", @"com.apple.authkit.accountRecoveryStart", @"com.apple.authkit.accountRecoveryFinish", @"com.apple.authkit.serverUIStart", @"com.apple.authkit.serverUIFinish", @"com.apple.authkit.nativeRecoveryStart", @"com.apple.authkit.nativeRecoveryFinish", @"com.apple.appleAccount.recoveryContactCodeEntryLanding", @"com.apple.appleAccount.recoveryContactRecoveryLanding", @"com.apple.authkit.osVersionAttestationReq", @"com.apple.authkit.sendAttestedOSVersion", @"com.apple.authkit.generateOSVersionAttestationData", @"com.apple.authkit.generateDCRT", @"com.apple.authkit.generateOSBoundRefKey", @"com.apple.authkit.updateRefkeyWithNonce", @"com.apple.authkit.retrieveDAK", @"com.apple.authkit.sendLivenessNonce",
    *MEMORY[0x263F34590],
    *MEMORY[0x263F345A8],
    *MEMORY[0x263F345C8],
    *MEMORY[0x263F345A0],
    *MEMORY[0x263F34578],
    *MEMORY[0x263F34570],
    *MEMORY[0x263F34588],
    *MEMORY[0x263F34580],
    *MEMORY[0x263F345C0],
    *MEMORY[0x263F345B8],
    *MEMORY[0x263F345B0],
    *MEMORY[0x263F34560],
    *MEMORY[0x263F345E0],
    *MEMORY[0x263F345D8],
    *MEMORY[0x263F34568],
    *MEMORY[0x263F345D0],
    *MEMORY[0x263F34598],
  v7 = 0);
  uint64_t v2 = [*(id *)(a1 + 32) getApprovedEventsForADPAndDNU];
  uint64_t v3 = v2;
  if (v7)
  {
    [v2 unionSet:v7];
    uint64_t v4 = [MEMORY[0x263EFFA08] setWithSet:v3];
    uint64_t v5 = (void *)getAllowedDNUEvents_approvedEvents;
    getAllowedDNUEvents_approvedEvents = v4;
  }
  else
  {
    uint64_t v6 = getAllowedDNUEvents_approvedEvents;
    getAllowedDNUEvents_approvedEvents = (uint64_t)v2;
    uint64_t v3 = (void *)v6;
  }
}

+ (id)getAllowedADPEvents
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__CDPDAnalyticsTransport_getAllowedADPEvents__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (getAllowedADPEvents_onceToken != -1) {
    dispatch_once(&getAllowedADPEvents_onceToken, block);
  }
  uint64_t v2 = (void *)getAllowedADPEvents_approvedEvents;
  return v2;
}

uint64_t __45__CDPDAnalyticsTransport_getAllowedADPEvents__block_invoke(uint64_t a1)
{
  getAllowedADPEvents_approvedEvents = [*(id *)(a1 + 32) getApprovedEventsForADPAndDNU];
  return MEMORY[0x270F9A758]();
}

+ (id)getApprovedEventsForADPAndDNU
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__CDPDAnalyticsTransport_getApprovedEventsForADPAndDNU__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (getApprovedEventsForADPAndDNU_onceToken != -1) {
    dispatch_once(&getApprovedEventsForADPAndDNU_onceToken, block);
  }
  uint64_t v2 = (void *)getApprovedEventsForADPAndDNU_approvedEvents;
  return v2;
}

void __55__CDPDAnalyticsTransport_getApprovedEventsForADPAndDNU__block_invoke(uint64_t a1)
{
  objc_msgSend(MEMORY[0x263EFF9C0], "setWithObjects:", *MEMORY[0x263F34630], *MEMORY[0x263F34670], *MEMORY[0x263F344F0], *MEMORY[0x263F34530], *MEMORY[0x263F34780], *MEMORY[0x263F34720], *MEMORY[0x263F34728], *MEMORY[0x263F345F0], *MEMORY[0x263F34600], *MEMORY[0x263F34548], *MEMORY[0x263F34798], *MEMORY[0x263F34648], *MEMORY[0x263F34730], *MEMORY[0x263F346C8], *MEMORY[0x263F34608], *MEMORY[0x263F34618], *MEMORY[0x263F34790],
    *MEMORY[0x263F34788],
    *MEMORY[0x263F344F8],
    *MEMORY[0x263F34508],
    *MEMORY[0x263F34500],
    *MEMORY[0x263F34540],
    *MEMORY[0x263F346B8],
    *MEMORY[0x263F346C0],
    *MEMORY[0x263F34700],
    *MEMORY[0x263F346B0],
    *MEMORY[0x263F346A8],
    *MEMORY[0x263F34658],
    *MEMORY[0x263F34748],
    *MEMORY[0x263F34750],
    *MEMORY[0x263F34768],
    *MEMORY[0x263F34760],
    *MEMORY[0x263F34758],
    *MEMORY[0x263F34740],
    *MEMORY[0x263F347D0],
    *MEMORY[0x263F347D8],
    *MEMORY[0x263F346E8],
    *MEMORY[0x263F346E0],
    *MEMORY[0x263F346D8],
    kAKAnalyticsEventMIDInvalidation,
    @"com.apple.authkit.proximityAuthentication",
    *MEMORY[0x263F34738],
    @"com.apple.appleaccount.iCloudAuthLoginAndUpdate",
    @"com.apple.appleaccount.iCloudAuthPreflightSave",
    *MEMORY[0x263F34640],
    @"com.apple.appleid.accountHealthEvent",
    @"com.apple.appleaccount.iCloudAccountAdd",
    *MEMORY[0x263F347C8],
    *MEMORY[0x263F346D0],
    *MEMORY[0x263F25BC8],
    *MEMORY[0x263F25BD0],
    *MEMORY[0x263F25AD0],
    *MEMORY[0x263F25AC8],
    *MEMORY[0x263F25AE0],
    *MEMORY[0x263F25AE8],
    *MEMORY[0x263F25AF0],
    *MEMORY[0x263F25AD8],
    *MEMORY[0x263F25AC0],
    @"com.apple.appleaccount.addRecoveryContactLanding",
    @"com.apple.appleaccount.localSecretCollection",
  uint64_t v1 = @"com.apple.appleaccount.selectRecoveryContact");
  uint64_t v2 = (void *)getApprovedEventsForADPAndDNU_approvedEvents;
  getApprovedEventsForADPAndDNU_approvedEvents = v1;

  uint64_t v3 = (void *)getApprovedEventsForADPAndDNU_approvedEvents;
  uint64_t v5 = [*(id *)(a1 + 32) getAllowedSecurityEvents];
  [v3 unionSet:v5];
}

+ (id)getApprovedEvents:(id)a3
{
  id v3 = a3;
  uint64_t v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 objectForKeyedSubscript:*MEMORY[0x263F20328]];

    if (v5) {
      +[CDPDAnalyticsTransport getAllowedADPEvents];
    }
    else {
    uint64_t v6 = +[CDPDAnalyticsTransport getAllowedDNUEvents];
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

+ (BOOL)isEventPrivacyApproved:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[CDPDAnalyticsTransport getApprovedEvents:v3];
  uint64_t v5 = [v3 eventName];

  LOBYTE(v3) = [v4 containsObject:v5];
  return (char)v3;
}

+ (id)getAllowedLocalSecretType
{
  if (getAllowedLocalSecretType_onceToken != -1) {
    dispatch_once(&getAllowedLocalSecretType_onceToken, &__block_literal_global_456);
  }
  uint64_t v2 = (void *)getAllowedLocalSecretType_approvedSecretTypes;
  return v2;
}

uint64_t __51__CDPDAnalyticsTransport_getAllowedLocalSecretType__block_invoke()
{
  getAllowedLocalSecretType_approvedSecretTypes = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"None", @"Passcode", @"Password", 0);
  return MEMORY[0x270F9A758]();
}

+ (id)getAllowedEscapeOffer
{
  if (getAllowedEscapeOffer_onceToken != -1) {
    dispatch_once(&getAllowedEscapeOffer_onceToken, &__block_literal_global_467);
  }
  uint64_t v2 = (void *)getAllowedEscapeOffer_approvedEscapeOffers;
  return v2;
}

uint64_t __47__CDPDAnalyticsTransport_getAllowedEscapeOffer__block_invoke()
{
  objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", *MEMORY[0x263F34850], *MEMORY[0x263F34858], *MEMORY[0x263F34868], *MEMORY[0x263F34878], *MEMORY[0x263F34880], *MEMORY[0x263F34888], *MEMORY[0x263F34938], *MEMORY[0x263F34940], *MEMORY[0x263F34948], *MEMORY[0x263F34838], *MEMORY[0x263F34840], *MEMORY[0x263F34848], *MEMORY[0x263F34890], *MEMORY[0x263F34898], *MEMORY[0x263F348A8], *MEMORY[0x263F348A0], *MEMORY[0x263F348B8],
    *MEMORY[0x263F348C0],
    *MEMORY[0x263F348C8],
    *MEMORY[0x263F348D0],
    *MEMORY[0x263F348D8],
    *MEMORY[0x263F348E0],
    *MEMORY[0x263F348E8],
    *MEMORY[0x263F348F0],
    *MEMORY[0x263F348F8],
    *MEMORY[0x263F34900],
    *MEMORY[0x263F34908],
    *MEMORY[0x263F34910],
    *MEMORY[0x263F34918],
    *MEMORY[0x263F34920],
    *MEMORY[0x263F34930],
    *MEMORY[0x263F34870],
    *MEMORY[0x263F34928],
    *MEMORY[0x263F34860],
  getAllowedEscapeOffer_approvedEscapeOffers = 0);
  return MEMORY[0x270F9A758]();
}

+ (id)getAllowedErrorDomain
{
  if (getAllowedErrorDomain_onceToken != -1) {
    dispatch_once(&getAllowedErrorDomain_onceToken, &__block_literal_global_469);
  }
  uint64_t v2 = (void *)getAllowedErrorDomain_approvedErrorDomains;
  return v2;
}

uint64_t __47__CDPDAnalyticsTransport_getAllowedErrorDomain__block_invoke()
{
  objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", *MEMORY[0x263F07F70], *MEMORY[0x263F08410], *MEMORY[0x263F08438], *MEMORY[0x263F08570], *MEMORY[0x263F16CD0], *MEMORY[0x263EFD498], *MEMORY[0x263EFD4C0], *MEMORY[0x263EFF150], *MEMORY[0x263F342B0], *MEMORY[0x263F28F30], *MEMORY[0x263F32A28], *MEMORY[0x263F329B0], *MEMORY[0x263F329A8], *MEMORY[0x263F28F10], @"securityd", @"EscrowProxyErrorDomain", @"FLErrorDomain",
    @"SyncedDefaults",
    @"AKUnderlyingADIErrors",
    @"CKKSResultOperationError",
    @"com.apple.security.trustedpeers",
    @"com.apple.security.trustedpeers.EscrowKeys",
    @"com.apple.security.trustedpeers.container",
    @"com.apple.security.trustedpeers.peerstatus",
    @"com.apple.security.sos.error",
    @"com.apple.security.keychaincircle",
    @"com.apple.LocalAuthentication",
    @"com.apple.AppleIDAuthSupport",
    @"com.apple.appleaccount",
    @"com.apple.protectedcloudstorage",
    @"com.apple.security.octagon",
    @"com.apple.accounts",
    @"com.apple.accounts.keychain",
    @"AOSErrorDomain",
    @"AKAuthenticationServerError",
    @"com.apple.AppleAccount.Error",
    @"com.apple.utilities.sqlite3",
    @"com.apple.security.kcparingchannel",
    @"CKKSResultOperationDescriptionError",
    @"com.appple.ckks.state",
    @"com.apple.security.octagon.state",
    @"AACustodianErrors",
    @"AACustodianRecoveryErrors",
    @"CKKSResultOperationDescriptionError",
    @"com.apple.security.trustedpeers.RecoveryKeySetError",
    @"com.apple.security.octagon.state",
    @"com.apple.MobileActivation.ErrorDomain",
    @"com.apple.MobileActivation.ServerErrorDomain",
    @"CryptoTokenKit",
  getAllowedErrorDomain_approvedErrorDomains = 0);
  return MEMORY[0x270F9A758]();
}

+ (id)getAllowedCfuType
{
  if (getAllowedCfuType_onceToken != -1) {
    dispatch_once(&getAllowedCfuType_onceToken, &__block_literal_global_570);
  }
  uint64_t v2 = (void *)getAllowedCfuType_approvedCFUTypes;
  return v2;
}

uint64_t __43__CDPDAnalyticsTransport_getAllowedCfuType__block_invoke()
{
  getAllowedCfuType_approvedCFUTypes = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"RepairCDPState", @"OfflineLocalSecretChange", @"RegenerateCDPRecoveryKey", @"SecureTerms", @"ConfirmExistingSecret", @"kCDPConfirmExistingSecret", @"SOSCompatibilityMode", @"com.apple.AAFollowUpIdentifier.RenewCredentials", @"com.apple.AAFollowUpIdentifier.custodianRemoved", @"com.apple.AAFollowUpIdentifier.custodianWalrusNoLiveness", @"com.apple.AAFollowUpIdentifier.custodianWalrusRemoved", @"com.apple.AAFollowUpIdentifier.walrusUserRecoveryFactorsMissing", @"com.apple.AAFollowUpIdentifier.RecoveryKeyMismatch", @"com.apple.CDPFollowUpIdentifier.adpStateHealing", @"edpOnlyRepair", 0);
  return MEMORY[0x270F9A758]();
}

+ (id)getAllowedStringsForTelemetry
{
  if (getAllowedStringsForTelemetry_onceToken != -1) {
    dispatch_once(&getAllowedStringsForTelemetry_onceToken, &__block_literal_global_617);
  }
  uint64_t v2 = (void *)getAllowedStringsForTelemetry_allowedStringsDict;
  return v2;
}

void __55__CDPDAnalyticsTransport_getAllowedStringsForTelemetry__block_invoke()
{
  v11[8] = *MEMORY[0x263EF8340];
  v10[0] = *MEMORY[0x263F34678];
  v0 = +[CDPDAnalyticsTransport getAllowedLocalSecretType];
  v11[0] = v0;
  v10[1] = *MEMORY[0x263F345E8];
  uint64_t v1 = +[CDPDAnalyticsTransport getAllowedEscapeOffer];
  v11[1] = v1;
  v10[2] = *MEMORY[0x263F345F8];
  uint64_t v2 = +[CDPDAnalyticsTransport getAllowedEscapeOffer];
  v11[2] = v2;
  v10[3] = *MEMORY[0x263F20340];
  id v3 = +[CDPDAnalyticsTransport getAllowedErrorDomain];
  v11[3] = v3;
  v10[4] = *MEMORY[0x263F34520];
  uint64_t v4 = +[CDPDAnalyticsTransport getAllowedCfuType];
  v11[4] = v4;
  v10[5] = @"underlyingErrorDomain1";
  uint64_t v5 = +[CDPDAnalyticsTransport getAllowedErrorDomain];
  v11[5] = v5;
  v10[6] = @"underlyingErrorDomain2";
  uint64_t v6 = +[CDPDAnalyticsTransport getAllowedErrorDomain];
  v11[6] = v6;
  v10[7] = @"underlyingErrorDomain3";
  v7 = +[CDPDAnalyticsTransport getAllowedErrorDomain];
  v11[7] = v7;
  uint64_t v8 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:8];
  id v9 = (void *)getAllowedStringsForTelemetry_allowedStringsDict;
  getAllowedStringsForTelemetry_allowedStringsDict = v8;
}

+ (id)transportForClientType:(id)a3 clientBundleId:(id)a4 clientName:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (transportCacheToken == -1)
  {
    if (!v8) {
      goto LABEL_7;
    }
  }
  else
  {
    dispatch_once(&transportCacheToken, &__block_literal_global_629);
    if (!v8) {
      goto LABEL_7;
    }
  }
  if (v9 && v10)
  {
    id v11 = [NSString stringWithFormat:@"%@-%@-%@", v10, v8, v9];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __75__CDPDAnalyticsTransport_transportForClientType_clientBundleId_clientName___block_invoke_2;
    v15[3] = &unk_26432F540;
    id v16 = v11;
    id v20 = a1;
    id v17 = v8;
    id v18 = v9;
    id v19 = v10;
    v12 = v11;
    os_unfair_lock_lock((os_unfair_lock_t)&cacheLock);
    v13 = __75__CDPDAnalyticsTransport_transportForClientType_clientBundleId_clientName___block_invoke_2((uint64_t)v15);
    os_unfair_lock_unlock((os_unfair_lock_t)&cacheLock);

    goto LABEL_10;
  }
LABEL_7:
  v12 = _CDPLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    +[CDPDAnalyticsTransport transportForClientType:clientBundleId:clientName:]();
  }
  v13 = 0;
LABEL_10:

  return v13;
}

uint64_t __75__CDPDAnalyticsTransport_transportForClientType_clientBundleId_clientName___block_invoke()
{
  transportCache = (uint64_t)objc_alloc_init(MEMORY[0x263EFF9A0]);
  return MEMORY[0x270F9A758]();
}

id __75__CDPDAnalyticsTransport_transportForClientType_clientBundleId_clientName___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = _CDPLogSystemAnalytics();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __75__CDPDAnalyticsTransport_transportForClientType_clientBundleId_clientName___block_invoke_2_cold_2();
  }

  id v3 = [(id)transportCache objectForKeyedSubscript:*(void *)(a1 + 32)];
  if (!v3)
  {
    id v3 = (void *)[objc_alloc(*(Class *)(a1 + 64)) initWithClientType:*(void *)(a1 + 40) clientBundleId:*(void *)(a1 + 48) clientName:*(void *)(a1 + 56)];
    [(id)transportCache setObject:v3 forKeyedSubscript:*(void *)(a1 + 32)];
  }
  uint64_t v4 = _CDPLogSystemAnalytics();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __75__CDPDAnalyticsTransport_transportForClientType_clientBundleId_clientName___block_invoke_2_cold_1();
  }

  return v3;
}

- (void)enforcePrivacyComplianceOnEvent:(id)a3 key:(id)a4 value:(id)a5
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [v7 objectForKeyedSubscript:v8];

  if (v10)
  {
    if ([v8 isEqualToString:*MEMORY[0x263F345E8]])
    {
      id v11 = objc_alloc_init(MEMORY[0x263EFF980]);
      id v30 = v8;
      v12 = [v7 objectForKeyedSubscript:v8];
      v13 = [v12 componentsSeparatedByString:@","];

      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      id v14 = v13;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v31 objects:v41 count:16];
      if (v15)
      {
        uint64_t v17 = v15;
        uint64_t v18 = *(void *)v32;
        uint64_t v19 = *MEMORY[0x263F34950];
        *(void *)&long long v16 = 138412802;
        long long v28 = v16;
        id v29 = v7;
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v32 != v18) {
              objc_enumerationMutation(v14);
            }
            uint64_t v21 = *(void *)(*((void *)&v31 + 1) + 8 * i);
            if (objc_msgSend(v9, "containsObject:", v21, v28))
            {
              [v11 addObject:v21];
            }
            else
            {
              [v11 addObject:v19];
              v22 = _CDPLogSystem();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
              {
                v23 = [v7 eventName];
                *(_DWORD *)buf = v28;
                uint64_t v36 = v21;
                __int16 v37 = 2112;
                v38 = v23;
                __int16 v39 = 2112;
                id v40 = v30;
                _os_log_fault_impl(&dword_218640000, v22, OS_LOG_TYPE_FAULT, "Received not approved data %@ for event %@ attribute %@", buf, 0x20u);

                id v7 = v29;
              }
            }
          }
          uint64_t v17 = [v14 countByEnumeratingWithState:&v31 objects:v41 count:16];
        }
        while (v17);
      }

      v24 = objc_msgSend(v11, "aaf_arrayAsCommaSeperatedString");
      id v8 = v30;
      [v7 setObject:v24 forKeyedSubscript:v30];
    }
    else
    {
      v25 = [v7 objectForKeyedSubscript:v8];
      char v26 = [v9 containsObject:v25];

      if ((v26 & 1) == 0)
      {
        v27 = _CDPLogSystem();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT)) {
          -[CDPDAnalyticsTransport enforcePrivacyComplianceOnEvent:key:value:](v7, (uint64_t)v8, v27);
        }

        [v7 setObject:*MEMORY[0x263F34950] forKeyedSubscript:v8];
      }
    }
  }
}

- (BOOL)shouldEnforcePrivacyComplianceForEvent:(id)a3
{
  id v3 = a3;
  if ([MEMORY[0x263F34400] isInternalBuild])
  {
    char v4 = 0;
  }
  else
  {
    uint64_t v5 = [v3 eventCategory];
    char v4 = [v5 isEqualToNumber:*MEMORY[0x263F34830]];
  }
  return v4;
}

- (void)sendEvent:(id)a3
{
  id v4 = a3;
  if (sendEvent__onceToken != -1) {
    dispatch_once(&sendEvent__onceToken, &__block_literal_global_642);
  }
  [(CDPDAnalyticsTransport *)self _updateEventWithDefaultMetadata:v4];
  uint64_t v5 = _CDPLogSystemAnalytics();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[CDPDAnalyticsTransport sendEvent:](v4);
  }

  uint64_t v6 = (void *)os_transaction_create();
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __36__CDPDAnalyticsTransport_sendEvent___block_invoke_645;
  aBlock[3] = &unk_26432F590;
  aBlock[4] = self;
  id v7 = v6;
  id v17 = v7;
  id v8 = _Block_copy(aBlock);
  id v9 = [(CDPDAnalyticsTransport *)self transport];
  char v10 = [v9 conformsToProtocol:&unk_26C9ECE58];

  if (v10)
  {
    id v11 = sendEvent__telemetryQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __36__CDPDAnalyticsTransport_sendEvent___block_invoke_709;
    block[3] = &unk_26432F5B8;
    block[4] = self;
    id v14 = v4;
    id v15 = v8;
    dispatch_async(v11, block);
  }
  else
  {
    v12 = _CDPLogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      -[CDPDAnalyticsTransport sendEvent:]();
    }
  }
}

void __36__CDPDAnalyticsTransport_sendEvent___block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = (void *)flowToSequenceMap;
  flowToSequenceMap = v0;

  id v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v2 = dispatch_queue_create("com.apple.cdpd.telemetryQueue", v4);
  id v3 = (void *)sendEvent__telemetryQueue;
  sendEvent__telemetryQueue = (uint64_t)v2;
}

void __36__CDPDAnalyticsTransport_sendEvent___block_invoke_645(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _CDPLogSystemAnalytics();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __36__CDPDAnalyticsTransport_sendEvent___block_invoke_645_cold_1(a1);
  }

  uint64_t v5 = [*(id *)(a1 + 32) _sendEvent:v3];

  if (v5)
  {
    dispatch_time_t v6 = dispatch_time(0, 300000000000);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __36__CDPDAnalyticsTransport_sendEvent___block_invoke_646;
    block[3] = &unk_26432F568;
    id v8 = *(id *)(a1 + 40);
    dispatch_after(v6, MEMORY[0x263EF83A0], block);
  }
}

void __36__CDPDAnalyticsTransport_sendEvent___block_invoke_646()
{
  uint64_t v0 = _CDPLogSystemAnalytics();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG)) {
    __36__CDPDAnalyticsTransport_sendEvent___block_invoke_646_cold_1();
  }
}

void __36__CDPDAnalyticsTransport_sendEvent___block_invoke_709(uint64_t a1)
{
  dispatch_queue_t v2 = (id *)(a1 + 32);
  id v3 = [*(id *)(a1 + 32) transport];
  uint64_t v4 = [v3 sessionState];

  switch(v4)
  {
    case 3:
      id v9 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
      v9();
      break;
    case 2:
      char v10 = _CDPLogSystemAnalytics();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        __36__CDPDAnalyticsTransport_sendEvent___block_invoke_709_cold_2();
      }

      id v11 = [*(id *)(a1 + 32) transport];
      v12 = [v11 eventQueue];
      [v12 addObject:*(void *)(a1 + 40)];

      v13 = _CDPLogSystemAnalytics();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        __36__CDPDAnalyticsTransport_sendEvent___block_invoke_709_cold_1(v2);
      }

      break;
    case 1:
      uint64_t v5 = *(void **)(a1 + 32);
      uint64_t v6 = *(void *)(a1 + 40);
      uint64_t v7 = *(void *)(a1 + 48);
      uint64_t v8 = sendEvent__telemetryQueue;
      [v5 configureSessionForEvent:v6 sendEventBlock:v7 telemetryQueue:v8];
      break;
  }
}

- (void)configureSessionForEvent:(id)a3 sendEventBlock:(id)a4 telemetryQueue:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = _CDPLogSystemAnalytics();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[CDPDAnalyticsTransport configureSessionForEvent:sendEventBlock:telemetryQueue:]();
  }

  v12 = [(CDPDAnalyticsTransport *)self transport];
  [v12 setSessionState:2];

  v13 = [(CDPDAnalyticsTransport *)self transport];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __81__CDPDAnalyticsTransport_configureSessionForEvent_sendEventBlock_telemetryQueue___block_invoke;
  v19[3] = &unk_26432F608;
  id v20 = v10;
  uint64_t v21 = self;
  id v22 = v9;
  id v14 = v9;
  id v15 = v10;
  [v13 configureReportingSessionWithCompletion:v19];

  long long v16 = _CDPLogSystemAnalytics();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    -[CDPDAnalyticsTransport configureSessionForEvent:sendEventBlock:telemetryQueue:]();
  }

  id v17 = [(CDPDAnalyticsTransport *)self transport];
  uint64_t v18 = [v17 eventQueue];
  [v18 addObject:v8];
}

void __81__CDPDAnalyticsTransport_configureSessionForEvent_sendEventBlock_telemetryQueue___block_invoke(uint64_t a1)
{
  uint64_t v6 = MEMORY[0x263EF8330];
  uint64_t v7 = 3221225472;
  id v8 = __81__CDPDAnalyticsTransport_configureSessionForEvent_sendEventBlock_telemetryQueue___block_invoke_2;
  id v9 = &unk_26432F430;
  dispatch_queue_t v2 = *(NSObject **)(a1 + 32);
  id v3 = *(void **)(a1 + 48);
  uint64_t v10 = *(void *)(a1 + 40);
  id v11 = v3;
  dispatch_async(v2, &v6);
  uint64_t v4 = objc_msgSend(*(id *)(a1 + 40), "transport", v6, v7, v8, v9, v10);
  dispatch_time_t v5 = dispatch_time(0, 1000000000 * [v4 sessionGracePeriod]);
  dispatch_after(v5, MEMORY[0x263EF83A0], &__block_literal_global_714);
}

void __81__CDPDAnalyticsTransport_configureSessionForEvent_sendEventBlock_telemetryQueue___block_invoke_2(uint64_t a1)
{
  dispatch_queue_t v2 = _CDPLogSystemAnalytics();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __81__CDPDAnalyticsTransport_configureSessionForEvent_sendEventBlock_telemetryQueue___block_invoke_2_cold_1(a1);
  }

  id v3 = [*(id *)(a1 + 32) transport];
  [v3 setSessionState:3];

  uint64_t v4 = [*(id *)(a1 + 32) transport];
  dispatch_time_t v5 = [v4 eventQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __81__CDPDAnalyticsTransport_configureSessionForEvent_sendEventBlock_telemetryQueue___block_invoke_710;
  v8[3] = &unk_26432F5E0;
  id v9 = *(id *)(a1 + 40);
  [v5 enumerateObjectsUsingBlock:v8];

  uint64_t v6 = [*(id *)(a1 + 32) transport];
  uint64_t v7 = [v6 eventQueue];
  [v7 removeAllObjects];
}

uint64_t __81__CDPDAnalyticsTransport_configureSessionForEvent_sendEventBlock_telemetryQueue___block_invoke_710(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __81__CDPDAnalyticsTransport_configureSessionForEvent_sendEventBlock_telemetryQueue___block_invoke_2_712()
{
  uint64_t v0 = _CDPLogSystemAnalytics();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG)) {
    __81__CDPDAnalyticsTransport_configureSessionForEvent_sendEventBlock_telemetryQueue___block_invoke_2_712_cold_1();
  }

  return +[CDPDAnalyticsTransport flushTransportCache];
}

- (void)_updateEventWithDefaultMetadata:(id)a3
{
  id v4 = a3;
  uint64_t v5 = *MEMORY[0x263F347F8];
  uint64_t v6 = [v4 objectForKeyedSubscript:*MEMORY[0x263F347F8]];

  if (!v6)
  {
    uint64_t v7 = [MEMORY[0x263F08D68] currentConnection];
    id v8 = v7;
    if (v7)
    {
      uint64_t v9 = objc_msgSend(v7, "aaf_processName");
      if (v9)
      {
        uint64_t v10 = (void *)v9;
        [v4 setObject:v9 forKeyedSubscript:v5];
      }
    }
  }
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x3032000000;
  v32[3] = __Block_byref_object_copy__2;
  v32[4] = __Block_byref_object_dispose__2;
  id v33 = 0;
  id v11 = [v4 objectForKeyedSubscript:*MEMORY[0x263F20350]];
  v12 = v11;
  if (v11)
  {
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v27 = __58__CDPDAnalyticsTransport__updateEventWithDefaultMetadata___block_invoke;
    long long v28 = &unk_26432F630;
    long long v31 = v32;
    id v29 = v11;
    id v30 = v4;
    v13 = v26;
    os_unfair_lock_lock((os_unfair_lock_t)&cacheLock);
    v27((uint64_t)v13);

    os_unfair_lock_unlock((os_unfair_lock_t)&cacheLock);
  }
  if ([MEMORY[0x263F34400] isInternalBuild])
  {
    uint64_t v14 = *MEMORY[0x263F20360];
    id v15 = [v4 objectForKeyedSubscript:*MEMORY[0x263F20360]];

    if (!v15)
    {
      long long v16 = (void *)CFPreferencesCopyAppValue(@"TelemetryInternalSignature", @"com.apple.AAAFoundation");
      if (v16)
      {
        [v4 setObject:v16 forKeyedSubscript:v14];
      }
      else
      {
        id v17 = [MEMORY[0x263F290F0] sharedInstance];
        uint64_t v18 = [MEMORY[0x263F290F0] sharedInstance];
        uint64_t v19 = [v18 primaryAuthKitAccount];
        id v20 = [v17 DSIDForAccount:v19];

        uint64_t v21 = [MEMORY[0x263F343A8] sharedInstance];
        id v22 = [v21 serialNumber];

        v23 = [NSString stringWithFormat:@"%@;%@", v20, v22];
        [v4 setObject:v23 forKeyedSubscript:v14];
      }
    }
  }
  if ([MEMORY[0x263F34400] isVirtualMachine])
  {
    v24 = @"VM";
LABEL_18:
    [v4 setObject:v24 forKeyedSubscript:*MEMORY[0x263F34550]];
    goto LABEL_19;
  }
  if ([MEMORY[0x263F34400] isDemoDevice])
  {
    v24 = @"Demo";
    goto LABEL_18;
  }
LABEL_19:
  v25 = [MEMORY[0x263F62D20] currentEstimates];
  [(CDPDAnalyticsTransport *)self _appendCountryFieldToEvent:v4 withCurrentEstimates:v25];

  _Block_object_dispose(v32, 8);
}

void __58__CDPDAnalyticsTransport__updateEventWithDefaultMetadata___block_invoke(uint64_t a1)
{
  uint64_t v2 = [(id)flowToSequenceMap objectForKeyedSubscript:*(void *)(a1 + 32)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  if (v6)
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithLong:", objc_msgSend(v6, "longValue") + 1);
    uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v6 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
  }
  else
  {
    *(void *)(v5 + 40) = &unk_26C9D2FF8;
  }

  [(id)flowToSequenceMap setObject:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) forKeyedSubscript:*(void *)(a1 + 32)];
  [*(id *)(a1 + 40) setObject:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) forKeyedSubscript:*MEMORY[0x263F34800]];
  uint64_t v9 = _CDPLogSystemAnalytics();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    __58__CDPDAnalyticsTransport__updateEventWithDefaultMetadata___block_invoke_cold_1();
  }
}

- (void)_appendCountryFieldToEvent:(id)a3 withCurrentEstimates:(id)a4
{
  id v9 = a3;
  id v5 = a4;
  uint64_t v6 = [v5 firstObject];

  if (v6)
  {
    uint64_t v7 = [v5 firstObject];
    uint64_t v8 = [v7 countryCode];
    [v9 setObject:v8 forKeyedSubscript:*MEMORY[0x263F347F0]];
  }
}

- (id)_sendEvent:(id)a3
{
  id v4 = a3;
  if ([(CDPDAnalyticsTransport *)self shouldEnforcePrivacyComplianceForEvent:v4])
  {
    if (!+[CDPDAnalyticsTransport isEventPrivacyApproved:v4])
    {
      uint64_t v6 = 0;
      goto LABEL_18;
    }
    id v5 = (void *)allowedStringsForTelemetry;
    uint64_t v12 = MEMORY[0x263EF8330];
    uint64_t v13 = 3221225472;
    uint64_t v14 = __37__CDPDAnalyticsTransport__sendEvent___block_invoke;
    id v15 = &unk_26432F658;
    long long v16 = self;
    id v17 = v4;
    [v5 enumerateKeysAndObjectsUsingBlock:&v12];
  }
  uint64_t v6 = objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x263F34800], v12, v13, v14, v15, v16);
  if (v6)
  {
    uint64_t v7 = _CDPLogSystemAnalytics();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[CDPDAnalyticsTransport _sendEvent:](v4);
    }
  }
  transport = self->_transport;
  if (!transport)
  {
    id v9 = _CDPLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      -[CDPDAnalyticsTransport _sendEvent:]();
    }

    transport = self->_transport;
  }
  [(AAFAnalyticsTransportInProcessRTC *)transport sendEvent:v4];
  if (v6)
  {
    uint64_t v10 = _CDPLogSystemAnalytics();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[CDPDAnalyticsTransport _sendEvent:](v4);
    }
  }
  [(CDPDTTRController *)self->_ttrController requestTTRIfSupportedForEvent:v4];
LABEL_18:

  return v6;
}

uint64_t __37__CDPDAnalyticsTransport__sendEvent___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) enforcePrivacyComplianceOnEvent:*(void *)(a1 + 40) key:a2 value:a3];
}

- (NSString)debugDescription
{
  return (NSString *)[(AAFAnalyticsTransportInProcessRTC *)self->_transport debugDescription];
}

- (NSNumber)clientType
{
  return self->_clientType;
}

- (void)setClientType:(id)a3
{
}

- (NSString)clientBundleId
{
  return self->_clientBundleId;
}

- (void)setClientBundleId:(id)a3
{
}

- (NSString)clientName
{
  return self->_clientName;
}

- (void)setClientName:(id)a3
{
}

- (CDPDTTRController)ttrController
{
  return self->_ttrController;
}

- (void)setTtrController:(id)a3
{
}

- (AAFAnalyticsTransportInProcessRTC)transport
{
  return self->_transport;
}

- (void)setTransport:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transport, 0);
  objc_storeStrong((id *)&self->_ttrController, 0);
  objc_storeStrong((id *)&self->_clientName, 0);
  objc_storeStrong((id *)&self->_clientBundleId, 0);
  objc_storeStrong((id *)&self->_clientType, 0);
}

- (void)initWithClientType:(uint64_t)a1 clientBundleId:(uint64_t)a2 clientName:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_fault_impl(&dword_218640000, log, OS_LOG_TYPE_FAULT, "clientBundleID is nil, transport will not be initialized properly. clientType = %@, clientName = %@", (uint8_t *)&v3, 0x16u);
}

+ (void)transportForEvent:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1 = [a1 eventName];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_218640000, v2, v3, "Enabling Opt-In collection for event: %@", v4, v5, v6, v7, v8);
}

+ (void)transportForEvent:(void *)a1 .cold.2(void *a1)
{
  uint64_t v1 = [a1 eventName];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_218640000, v2, v3, "Fetching telemetry transport for event: %@", v4, v5, v6, v7, v8);
}

+ (void)transportForClientType:clientBundleId:clientName:.cold.1()
{
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_218640000, v0, OS_LOG_TYPE_ERROR, "Failed to initialize CDPDAnalyticsTransport. Please check if all required parameters are provided and consider using default transport.", v1, 2u);
}

void __75__CDPDAnalyticsTransport_transportForClientType_clientBundleId_clientName___block_invoke_2_cold_1()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_9();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_debug_impl(&dword_218640000, v1, OS_LOG_TYPE_DEBUG, "Returning transport for key: %@ - %@", v2, 0x16u);
}

void __75__CDPDAnalyticsTransport_transportForClientType_clientBundleId_clientName___block_invoke_2_cold_2()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_2_2(&dword_218640000, v0, v1, "Fetching Analytics transport for key: %@", v2);
}

- (void)enforcePrivacyComplianceOnEvent:(void *)a1 key:(uint64_t)a2 value:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v6 = [a1 objectForKeyedSubscript:a2];
  uint64_t v7 = [a1 eventName];
  int v8 = 138412802;
  id v9 = v6;
  __int16 v10 = 2112;
  id v11 = v7;
  __int16 v12 = 2112;
  uint64_t v13 = a2;
  _os_log_fault_impl(&dword_218640000, a3, OS_LOG_TYPE_FAULT, "Received not approved data %@ for event %@ attribute %@", (uint8_t *)&v8, 0x20u);
}

- (void)sendEvent:.cold.1()
{
  OUTLINED_FUNCTION_3();
  _os_log_fault_impl(&dword_218640000, v0, OS_LOG_TYPE_FAULT, "Non-conforming transport protocol passed to the telemetry system.  Likely build mismatch with AAAFoundation", v1, 2u);
}

- (void)sendEvent:(void *)a1 .cold.2(void *a1)
{
  uint64_t v1 = [a1 debugDescription];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_218640000, v2, v3, "Dispatching event to telemetry queue: %@", v4, v5, v6, v7, v8);
}

void __36__CDPDAnalyticsTransport_sendEvent___block_invoke_645_cold_1(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) transport];
  [v1 sessionState];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_218640000, v2, v3, "Session state is (%lu), proceeding with send...", v4, v5, v6, v7, v8);
}

void __36__CDPDAnalyticsTransport_sendEvent___block_invoke_646_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "Releasing analytics transaction upon timeout", v2, v3, v4, v5, v6);
}

void __36__CDPDAnalyticsTransport_sendEvent___block_invoke_709_cold_1(id *a1)
{
  uint64_t v1 = [*a1 transport];
  uint64_t v2 = [v1 eventQueue];
  [v2 count];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_218640000, v3, v4, "Event added to the queue, current queue size: %lu", v5, v6, v7, v8, v9);
}

void __36__CDPDAnalyticsTransport_sendEvent___block_invoke_709_cold_2()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_2_2(&dword_218640000, v0, v1, "Session is still being configured... queuing event: %@", v2);
}

- (void)configureSessionForEvent:sendEventBlock:telemetryQueue:.cold.1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_2(&dword_218640000, v0, v1, "Adding event to queue: %@", v2);
}

- (void)configureSessionForEvent:sendEventBlock:telemetryQueue:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "Session configuration required...", v2, v3, v4, v5, v6);
}

void __81__CDPDAnalyticsTransport_configureSessionForEvent_sendEventBlock_telemetryQueue___block_invoke_2_cold_1(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) transport];
  uint64_t v2 = [v1 eventQueue];
  [v2 count];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_218640000, v3, v4, "Session is configured... event queue size: %lu", v5, v6, v7, v8, v9);
}

void __81__CDPDAnalyticsTransport_configureSessionForEvent_sendEventBlock_telemetryQueue___block_invoke_2_712_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "Telemetry grace period timeout expired", v2, v3, v4, v5, v6);
}

void __58__CDPDAnalyticsTransport__updateEventWithDefaultMetadata___block_invoke_cold_1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_2_2(&dword_218640000, v0, v1, "Event sequence map: %@", v2);
}

- (void)_sendEvent:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1 = [a1 eventName];
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_6_0(&dword_218640000, v2, v3, "[%@] [%@] DELIVERY END", v4, v5, v6, v7, v8);
}

- (void)_sendEvent:.cold.2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2();
  _os_log_fault_impl(&dword_218640000, v0, OS_LOG_TYPE_FAULT, "Transport is nil, event: %@ will not be sent.", v1, 0xCu);
}

- (void)_sendEvent:(void *)a1 .cold.3(void *a1)
{
  uint64_t v1 = [a1 eventName];
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_6_0(&dword_218640000, v2, v3, "[%@] [%@] DELIVERY BEGIN", v4, v5, v6, v7, v8);
}

@end