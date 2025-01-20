@interface UARPController
- (BOOL)accessoryIDKnown:(id)a3;
- (BOOL)accessoryKnown:(id)a3;
- (BOOL)accessoryReachable:(id)a3;
- (BOOL)accessoryReachableInternal:(id)a3;
- (BOOL)accessoryUnreachable:(id)a3;
- (BOOL)accessoryUnreachableInternal:(id)a3;
- (BOOL)addAccessory:(id)a3 assetID:(id)a4;
- (BOOL)applyStagedFirmwareOnAccessoryList:(id)a3 withUserIntent:(BOOL)a4;
- (BOOL)cancelFirmwareStagingForAccessory:(id)a3 assetID:(id)a4;
- (BOOL)cancelFirmwareUpdateOnAccessoryList:(id)a3;
- (BOOL)changeAssetLocation:(id)a3 assetID:(id)a4;
- (BOOL)checkForUpdate:(id)a3;
- (BOOL)createUploader;
- (BOOL)disableTRMSystemAuthenticationForRegistryEntryID:(id)a3;
- (BOOL)downloadAvailableFirmwareUpdate:(id)a3 assetID:(id)a4 withUserIntent:(BOOL)a5;
- (BOOL)downloadReleaseNotes:(id)a3 assetID:(id)a4;
- (BOOL)dynamicAssetAvailableForAccessory:(id)a3 assetID:(id)a4 error:(id *)a5;
- (BOOL)enableTRMSystemAuthenticationForRegistryEntryID:(id)a3;
- (BOOL)getAttestationCertificates:(id)a3 assetLocationType:(int64_t)a4;
- (BOOL)getAttestationCertificatesInternal:(id)a3 assetID:(id)a4;
- (BOOL)getBatchedSupportedAccessories:(id)a3 assetLocationType:(int64_t)a4;
- (BOOL)getSupportedAccessories:(id)a3 assetLocationType:(int64_t)a4;
- (BOOL)getSupportedAccessoriesInternal:(id)a3 assetID:(id)a4 batchRequest:(BOOL)a5;
- (BOOL)pauseAssetTransfersForAccessory:(id)a3;
- (BOOL)personalizationVectorForAccessory:(id)a3 assetTag:(unsigned int)a4 outVector:(unsigned int *)a5;
- (BOOL)recvDataFromAccessory:(id)a3 data:(id)a4 error:(id *)a5;
- (BOOL)registerForAssetAvailabilityNotification:(id)a3;
- (BOOL)registerForAttestationCertificatesAvailability:(id)a3;
- (BOOL)registerForGenericNotification:(id)a3 notificationName:(id)a4;
- (BOOL)registerForSupplementalAssetAvailabilityNotification:(id)a3;
- (BOOL)registerForSupportedAccessoriesAvailability:(id)a3;
- (BOOL)removeAccessory:(id)a3;
- (BOOL)requestConsent:(id)a3;
- (BOOL)rescindStagedFirmwareOnAccessoryList:(id)a3 withUserIntent:(BOOL)a4;
- (BOOL)resumeAssetTransfersForAccessory:(id)a3;
- (BOOL)revokeConsentRequest:(id)a3;
- (BOOL)solicitDynamicAsset:(id)a3 assetID:(id)a4;
- (BOOL)stageFirmwareUpdateOnAccessoryList:(id)a3 withUserIntent:(BOOL)a4;
- (BOOL)startPacketCapture:(id)a3;
- (BOOL)startTapToRadar:(id)a3;
- (BOOL)triggerUnsolicitedDynamicAsset:(id)a3 assetTag:(id)a4;
- (BOOL)updateProperty:(unint64_t)a3 value:(id)a4 forAccessory:(id)a5;
- (NSArray)accessoryList;
- (UARPController)init;
- (UARPControllerDelegateProtocol)delegate;
- (id)assetAvailabilityTokenForAccessory:(id)a3;
- (id)createSupportedAccessory:(id)a3 accessoryMetadata:(id)a4;
- (id)pendingAssetForAccessory:(id)a3 assetID:(id)a4;
- (id)pendingTatsuRequests;
- (id)supplementalAssetAvailabilityTokenForAccessory:(id)a3;
- (id)unsolicitedDynamicAssetOffered:(id)a3 assetID:(id)a4;
- (int64_t)queryProperty:(unint64_t)a3 forAccessory:(id)a4;
- (int64_t)queryPropertyInternal:(unint64_t)a3 forAccessory:(id)a4;
- (void)accessoryTransportNeeded:(id)a3 isNeeded:(BOOL)a4;
- (void)assetAvailabilityNotificationPosted:(int)a3;
- (void)assetAvailablityUpdateForAccessory:(id)a3 assetID:(id)a4;
- (void)assetAvailablityUpdateForAccessoryID:(id)a3 assetID:(id)a4;
- (void)assetSolicitationComplete:(id)a3 assetID:(id)a4 withStatus:(unint64_t)a5;
- (void)assetSolicitationProgress:(id)a3 assetID:(id)a4 bytesReceived:(unint64_t)a5 bytesTotal:(unint64_t)a6;
- (void)assetStagingPause:(id)a3;
- (void)assetStagingResume:(id)a3;
- (void)availabilityNotificationForAttestationCertificatesPosted:(int)a3;
- (void)availabilityNotificationForSupportedAccessoriesPosted:(int)a3;
- (void)createUploader;
- (void)dealloc;
- (void)firmwareStagingComplete:(id)a3 assetID:(id)a4 withStatus:(unint64_t)a5;
- (void)firmwareStagingDataBlockTransferred:(id)a3 assetID:(id)a4 offset:(unsigned int)a5 blockSize:(unsigned int)a6;
- (void)firmwareStagingProgress:(id)a3 assetID:(id)a4 bytesSent:(unint64_t)a5 bytesTotal:(unint64_t)a6 filterProgress:(BOOL)a7;
- (void)firmwareUpdateResult:(id)a3 vendorSpecificStatus:(unsigned int)a4 error:(id)a5;
- (void)genericNotificationPosted:(int)a3;
- (void)handleReceivedAttestationCertificates:(id)a3 forSubjectKeyIdentifier:(id)a4;
- (void)manifestPropertiesReceivedForAccessory:(id)a3 assetTag:(unsigned int)a4 properties:(id)a5;
- (void)progressForUARPConsent:(id)a3 bytesSent:(unint64_t)a4 bytesTotal:(unint64_t)a5;
- (void)progressForUARPConsentInPostLogout:(id)a3 bytesSent:(unint64_t)a4 bytesTotal:(unint64_t)a5;
- (void)queryCompleteForAccessory:(id)a3 appleModelNumber:(id)a4 error:(id)a5;
- (void)queryCompleteForAccessory:(id)a3 boardID:(unint64_t)a4 error:(id)a5;
- (void)queryCompleteForAccessory:(id)a3 chipID:(unint64_t)a4 error:(id)a5;
- (void)queryCompleteForAccessory:(id)a3 chipRevision:(unint64_t)a4 error:(id)a5;
- (void)queryCompleteForAccessory:(id)a3 ecid:(unint64_t)a4 error:(id)a5;
- (void)queryCompleteForAccessory:(id)a3 enableMixMatch:(BOOL)a4 error:(id)a5;
- (void)queryCompleteForAccessory:(id)a3 epoch:(unint64_t)a4 error:(id)a5;
- (void)queryCompleteForAccessory:(id)a3 firmwareVersion:(id)a4 error:(id)a5;
- (void)queryCompleteForAccessory:(id)a3 friendlyName:(id)a4 error:(id)a5;
- (void)queryCompleteForAccessory:(id)a3 hardwareVersion:(id)a4 error:(id)a5;
- (void)queryCompleteForAccessory:(id)a3 hwFusingType:(id)a4 error:(id)a5;
- (void)queryCompleteForAccessory:(id)a3 liveNonce:(BOOL)a4 error:(id)a5;
- (void)queryCompleteForAccessory:(id)a3 manifestPrefix:(id)a4 error:(id)a5;
- (void)queryCompleteForAccessory:(id)a3 manufacturer:(id)a4 error:(id)a5;
- (void)queryCompleteForAccessory:(id)a3 modelName:(id)a4 error:(id)a5;
- (void)queryCompleteForAccessory:(id)a3 prefixNeedsLUN:(BOOL)a4 error:(id)a5;
- (void)queryCompleteForAccessory:(id)a3 productionMode:(unint64_t)a4 error:(id)a5;
- (void)queryCompleteForAccessory:(id)a3 securityDomain:(unint64_t)a4 error:(id)a5;
- (void)queryCompleteForAccessory:(id)a3 securityMode:(unint64_t)a4 error:(id)a5;
- (void)queryCompleteForAccessory:(id)a3 serialNumber:(id)a4 error:(id)a5;
- (void)queryCompleteForAccessory:(id)a3 stagedFirmwareVersion:(id)a4 error:(id)a5;
- (void)queryCompleteForAccessory:(id)a3 stats:(id)a4 error:(id)a5;
- (void)queryCompleteForAccessory:(id)a3 suffixNeedsLUN:(BOOL)a4 error:(id)a5;
- (void)queryFirmwareUpdateResultForAccessory:(id)a3;
- (void)sendFirmwareUpdateProgressForAccessory:(id)a3 assetID:(id)a4 bytesSent:(unint64_t)a5 bytesTotal:(unint64_t)a6;
- (void)sendFirmwareUpdateProgressForUARPConsent:(id)a3 bytesSent:(unint64_t)a4 bytesTotal:(unint64_t)a5;
- (void)sendMessageToAccessory:(id)a3 uarpMsg:(id)a4;
- (void)sendUpdateFirmwareAnalyticsEventForAccessoryID:(id)a3 assetID:(id)a4 params:(id)a5;
- (void)setChipInfoDelegate:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPowerLogStagingWindowPeriodSeconds:(unsigned int)a3;
- (void)stagedFirmwareApplicationComplete:(id)a3 withStatus:(unint64_t)a4;
- (void)stagedFirmwareRescindComplete:(id)a3 withStatus:(unint64_t)a4;
- (void)startPersonalizationHelperService:(id)a3 entitlement:(id)a4;
- (void)stopPacketCapture;
- (void)stopTapToRadar;
- (void)supplementalAssetAvailabilityNotificationPosted:(int)a3;
- (void)supplementalAssetAvailablityUpdateForAccessory:(id)a3 assetName:(id)a4;
- (void)supplementalAssetAvailablityUpdateForAccessoryID:(id)a3 assetName:(id)a4;
- (void)supportedAccessories:(id)a3 forProductGroup:(id)a4 isComplete:(BOOL)a5;
- (void)tssResponse:(id)a3;
- (void)unregisterForAllAssetAvailabilityNotifications;
- (void)unregisterForAllAttestationCertificatesAvailabilityNotifications;
- (void)unregisterForAllGenericNotifications;
- (void)unregisterForAllSupplementalAssetAvailabilityNotifications;
- (void)unregisterForAssetAvailabilityNotification:(id)a3;
- (void)unregisterForAttestationCertificatesAvailability:(int)a3;
- (void)unregisterForSupplementalAssetAvailabilityNotification:(id)a3;
- (void)unregisterForSupportedAccessoriesAvailability:(int)a3;
- (void)updatePendingAssetsForAccessory:(id)a3 assetID:(id)a4;
@end

@implementation UARPController

- (UARPController)init
{
  v32.receiver = self;
  v32.super_class = (Class)UARPController;
  v2 = [(UARPController *)&v32 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    accessories = v2->_accessories;
    v2->_accessories = (NSMutableDictionary *)v3;

    v5 = (NSCache *)objc_alloc_init(MEMORY[0x263EFF8E0]);
    assetCache = v2->_assetCache;
    v2->_assetCache = v5;

    dispatch_queue_t v7 = dispatch_queue_create("UARPController internal", 0);
    internalQueue = v2->_internalQueue;
    v2->_internalQueue = (OS_dispatch_queue *)v7;

    dispatch_queue_t v9 = dispatch_queue_create("UARPController delegate", 0);
    delegateQueue = v2->_delegateQueue;
    v2->_delegateQueue = (OS_dispatch_queue *)v9;

    os_log_t v11 = os_log_create("com.apple.accessoryupdater.uarp", "xpc");
    xpcLog = v2->_xpcLog;
    v2->_xpcLog = (OS_os_log *)v11;

    os_log_t v13 = os_log_create("com.apple.accessoryupdater.uarp", "uarpController");
    controllerLog = v2->_controllerLog;
    v2->_controllerLog = (OS_os_log *)v13;

    v15 = [[UARPControllerXPC alloc] initWithController:v2];
    internalDelegate = v2->_internalDelegate;
    v2->_internalDelegate = (UARPControllerInternalDelegate *)v15;

    v17 = objc_alloc_init(UARPPowerLogManager);
    powerLogManager = v2->_powerLogManager;
    v2->_powerLogManager = v17;

    v19 = [[UARPAnalyticsUpdateFirmwareManager alloc] initWithController:v2 queue:v2->_internalQueue];
    updateFirmwareAnalytics = v2->_updateFirmwareAnalytics;
    v2->_updateFirmwareAnalytics = v19;

    uint64_t v21 = [MEMORY[0x263EFF9A0] dictionary];
    assetAvailabilityNotificationTokenDict = v2->_assetAvailabilityNotificationTokenDict;
    v2->_assetAvailabilityNotificationTokenDict = (NSMutableDictionary *)v21;

    uint64_t v23 = [MEMORY[0x263EFF9A0] dictionary];
    supplementalAssetAvailabilityNotificationTokenDict = v2->_supplementalAssetAvailabilityNotificationTokenDict;
    v2->_supplementalAssetAvailabilityNotificationTokenDict = (NSMutableDictionary *)v23;

    uint64_t v25 = [MEMORY[0x263EFF9A0] dictionary];
    assetAvailabilityUARPProductGroupNotificationTokenDict = v2->_assetAvailabilityUARPProductGroupNotificationTokenDict;
    v2->_assetAvailabilityUARPProductGroupNotificationTokenDict = (NSMutableDictionary *)v25;

    uint64_t v27 = [MEMORY[0x263EFF9A0] dictionary];
    attestationCertificatesAvailabilitySubjectKeyIdentifierNotificationTokenDict = v2->_attestationCertificatesAvailabilitySubjectKeyIdentifierNotificationTokenDict;
    v2->_attestationCertificatesAvailabilitySubjectKeyIdentifierNotificationTokenDict = (NSMutableDictionary *)v27;

    uint64_t v29 = [MEMORY[0x263EFF9A0] dictionary];
    generalNotificationTokenDict = v2->_generalNotificationTokenDict;
    v2->_generalNotificationTokenDict = (NSMutableDictionary *)v29;

    v2->_isInternalBuild = MGGetBoolAnswer();
  }
  return v2;
}

- (void)setChipInfoDelegate:(id)a3
{
  v4 = (UARPControllerChipInfoDelegate *)a3;
  obj = self;
  objc_sync_enter(obj);
  chipInfoDelegate = obj->_chipInfoDelegate;
  obj->_chipInfoDelegate = v4;

  objc_sync_exit(obj);
}

- (void)dealloc
{
  [(UARPController *)self unregisterForAllAssetAvailabilityNotifications];
  [(UARPController *)self unregisterForAllSupplementalAssetAvailabilityNotifications];
  [(UARPController *)self unregisterForAllGenericNotifications];
  [(UARPController *)self unregisterForAllAttestationCertificatesAvailabilityNotifications];
  v3.receiver = self;
  v3.super_class = (Class)UARPController;
  [(UARPController *)&v3 dealloc];
}

- (BOOL)accessoryReachableInternal:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  accessories = self->_accessories;
  v6 = [v4 getID];
  dispatch_queue_t v7 = [(NSMutableDictionary *)accessories objectForKeyedSubscript:v6];

  objc_msgSend(v7, "setSuppressAutomaticDynamicAssets:", objc_msgSend(v4, "suppressAutomaticDynamicAssets"));
  objc_msgSend(v7, "setSuppressInfoQueries:", objc_msgSend(v4, "suppressInfoQueries"));
  controllerLog = self->_controllerLog;
  if (os_log_type_enabled(controllerLog, OS_LOG_TYPE_INFO))
  {
    int v16 = 138412290;
    id v17 = v4;
    _os_log_impl(&dword_21E079000, controllerLog, OS_LOG_TYPE_INFO, "Accessory reported as reachable %@", (uint8_t *)&v16, 0xCu);
  }
  if (![(UARPController *)self createUploader]) {
    goto LABEL_12;
  }
  if (v7)
  {
    char v9 = [v7 reachable];
    v10 = self->_controllerLog;
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
    if (v9)
    {
      if (v11)
      {
        int v16 = 138412290;
        id v17 = v7;
        _os_log_impl(&dword_21E079000, v10, OS_LOG_TYPE_INFO, "Accessory is already reachable %@", (uint8_t *)&v16, 0xCu);
      }
      goto LABEL_11;
    }
    if (v11)
    {
      int v16 = 138412290;
      id v17 = v7;
      _os_log_impl(&dword_21E079000, v10, OS_LOG_TYPE_INFO, "Accessory is newly reachable %@", (uint8_t *)&v16, 0xCu);
    }
    [v7 setReachable:1];
    if ([(UARPUploader *)self->_uploader accessoryReachable:v4 error:0]) {
      goto LABEL_11;
    }
LABEL_12:
    BOOL v14 = 0;
    goto LABEL_13;
  }
LABEL_11:
  powerLogManager = self->_powerLogManager;
  os_log_t v13 = [v4 getID];
  [(UARPPowerLogManager *)powerLogManager setAccessoryIDReachable:v13];

  BOOL v14 = 1;
LABEL_13:

  return v14;
}

- (BOOL)accessoryReachable:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__UARPController_accessoryReachable___block_invoke;
  block[3] = &unk_264492AD0;
  id v9 = v4;
  v10 = &v11;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(internalQueue, block);
  LOBYTE(internalQueue) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)internalQueue;
}

uint64_t __37__UARPController_accessoryReachable___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) accessoryReachableInternal:*(void *)(a1 + 40)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (BOOL)accessoryUnreachableInternal:(id)a3
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v4 = a3;
  accessories = self->_accessories;
  id v6 = [v4 getID];
  dispatch_queue_t v7 = [(NSMutableDictionary *)accessories objectForKeyedSubscript:v6];

  controllerLog = self->_controllerLog;
  if (os_log_type_enabled(controllerLog, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v36 = v4;
    _os_log_impl(&dword_21E079000, controllerLog, OS_LOG_TYPE_INFO, "Accessory reported as unreachable %@", buf, 0xCu);
  }
  if (!v7) {
    goto LABEL_20;
  }
  int v9 = [v7 reachable];
  v10 = self->_controllerLog;
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
  if (!v9)
  {
    if (v11)
    {
      *(_DWORD *)buf = 138412290;
      id v36 = v7;
      BOOL v24 = 1;
      _os_log_impl(&dword_21E079000, v10, OS_LOG_TYPE_INFO, "Accessory is already unreachable %@", buf, 0xCu);
    }
    else
    {
      BOOL v24 = 1;
    }
    goto LABEL_24;
  }
  if (v11)
  {
    *(_DWORD *)buf = 138412290;
    id v36 = v7;
    _os_log_impl(&dword_21E079000, v10, OS_LOG_TYPE_INFO, "Accessory is newly unreachable %@", buf, 0xCu);
  }
  if (![(UARPUploader *)self->_uploader accessoryUnreachable:v4 error:0])
  {
LABEL_20:
    BOOL v24 = 0;
    goto LABEL_24;
  }
  id v30 = v4;
  [v7 setReachable:0];
  v12 = [v7 pendingAssets];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v32 != v15) {
          objc_enumerationMutation(v12);
        }
        id v17 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        uint64_t v18 = [v17 id];
        v19 = [v7 getID];
        int v20 = [v18 isStagingInProgressOnAccessoryID:v19];

        if (v20)
        {
          uint64_t v21 = self->_controllerLog;
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            id v36 = v17;
            __int16 v37 = 2112;
            v38 = v7;
            _os_log_impl(&dword_21E079000, v21, OS_LOG_TYPE_DEFAULT, "Asset %@ not being staged anymore on %@", buf, 0x16u);
          }
          v22 = [v17 id];
          uint64_t v23 = [v7 getID];
          [v22 stagingCompleteOnAccessoryID:v23];
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v31 objects:v39 count:16];
    }
    while (v14);
  }

  BOOL v24 = 1;
  id v4 = v30;
LABEL_24:
  updateFirmwareAnalytics = self->_updateFirmwareAnalytics;
  v26 = [v4 getID];
  [(UARPAnalyticsUpdateFirmwareManager *)updateFirmwareAnalytics setAccessoryIDUnreachable:v26];

  powerLogManager = self->_powerLogManager;
  v28 = [v4 getID];
  [(UARPPowerLogManager *)powerLogManager setAccessoryIDUnreachable:v28];

  return v24;
}

- (BOOL)accessoryUnreachable:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__UARPController_accessoryUnreachable___block_invoke;
  block[3] = &unk_264492AD0;
  id v9 = v4;
  v10 = &v11;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(internalQueue, block);
  LOBYTE(internalQueue) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)internalQueue;
}

uint64_t __39__UARPController_accessoryUnreachable___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) accessoryUnreachableInternal:*(void *)(a1 + 40)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (NSArray)accessoryList
{
  uint64_t v6 = 0;
  dispatch_queue_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__3;
  v10 = __Block_byref_object_dispose__3;
  id v11 = 0;
  internalQueue = self->_internalQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __31__UARPController_accessoryList__block_invoke;
  v5[3] = &unk_264492AF8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __31__UARPController_accessoryList__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(*(void *)(a1 + 32) + 8) allValues];
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (BOOL)stageFirmwareUpdateOnAccessoryList:(id)a3 withUserIntent:(BOOL)a4
{
  id v6 = a3;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __68__UARPController_stageFirmwareUpdateOnAccessoryList_withUserIntent___block_invoke;
  block[3] = &unk_264492B20;
  id v11 = v6;
  v12 = self;
  BOOL v13 = a4;
  id v8 = v6;
  dispatch_sync(internalQueue, block);

  return 1;
}

void __68__UARPController_stageFirmwareUpdateOnAccessoryList_withUserIntent___block_invoke(uint64_t a1)
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v28 = [obj countByEnumeratingWithState:&v37 objects:v46 count:16];
  if (v28)
  {
    uint64_t v27 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v28; ++i)
      {
        if (*(void *)v38 != v27) {
          objc_enumerationMutation(obj);
        }
        uint64_t v3 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        id v4 = *(NSObject **)(*(void *)(a1 + 40) + 32);
        if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v42 = v3;
          _os_log_impl(&dword_21E079000, v4, OS_LOG_TYPE_INFO, "stage assets for accessory %@", buf, 0xCu);
        }
        id v5 = [v3 pendingAssets];
        if ([v5 count])
        {
          uint64_t v29 = v5;
          uint64_t v30 = i;
          long long v35 = 0u;
          long long v36 = 0u;
          long long v33 = 0u;
          long long v34 = 0u;
          id v32 = v5;
          uint64_t v6 = [v32 countByEnumeratingWithState:&v33 objects:v45 count:16];
          if (v6)
          {
            uint64_t v7 = v6;
            uint64_t v8 = *(void *)v34;
            do
            {
              uint64_t v9 = 0;
              uint64_t v31 = v7;
              do
              {
                if (*(void *)v34 != v8) {
                  objc_enumerationMutation(v32);
                }
                v10 = *(void **)(*((void *)&v33 + 1) + 8 * v9);
                id v11 = [v10 id];
                v12 = [v3 getID];
                int v13 = [v11 isStagingInProgressOnAccessoryID:v12];

                char v14 = *(NSObject **)(*(void *)(a1 + 40) + 32);
                if (v13)
                {
                  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412546;
                    v42 = v10;
                    __int16 v43 = 2112;
                    v44 = v3;
                    _os_log_impl(&dword_21E079000, v14, OS_LOG_TYPE_DEFAULT, "Asset %@ already being staged on accessory %@", buf, 0x16u);
                  }
                }
                else
                {
                  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138412546;
                    v42 = v10;
                    __int16 v43 = 2112;
                    v44 = v3;
                    _os_log_impl(&dword_21E079000, v14, OS_LOG_TYPE_INFO, "staging %@ for accessory %@", buf, 0x16u);
                  }
                  objc_msgSend(v3, "setFirmwareUpdateBytesTotal:", objc_msgSend(v10, "fileLength"));
                  uint64_t v15 = [v10 id];
                  int v16 = [v3 getID];
                  [v15 stagingStartedOnAccessoryID:v16];

                  id v17 = *(void **)(*(void *)(a1 + 40) + 88);
                  uint64_t v18 = [v3 getID];
                  v19 = [v10 id];
                  [v17 stagingStartedForAccessoryID:v18 assetID:v19 userIntent:*(unsigned __int8 *)(a1 + 48)];

                  int v20 = *(void **)(*(void *)(a1 + 40) + 144);
                  uint64_t v21 = [v3 getID];
                  v22 = [v10 id];
                  uint64_t v23 = [v22 assetVersion];
                  BOOL v24 = [v3 firmwareVersion];
                  [v20 setAssetOfferedForAccessoryID:v21 offeredFirmwareVersion:v23 activeFirmwareVersion:v24];

                  [*(id *)(*(void *)(a1 + 40) + 64) offerAssetToAccessory:v3 asset:v10 error:0];
                  uint64_t v7 = v31;
                }
                ++v9;
              }
              while (v7 != v9);
              uint64_t v7 = [v32 countByEnumeratingWithState:&v33 objects:v45 count:16];
            }
            while (v7);
          }

          id v5 = v29;
          uint64_t i = v30;
        }
        else
        {
          uint64_t v25 = *(NSObject **)(*(void *)(a1 + 40) + 32);
          if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v42 = v3;
            _os_log_impl(&dword_21E079000, v25, OS_LOG_TYPE_INFO, "no assets to stage for accessory %@", buf, 0xCu);
          }
        }
      }
      uint64_t v28 = [obj countByEnumeratingWithState:&v37 objects:v46 count:16];
    }
    while (v28);
  }
}

- (BOOL)applyStagedFirmwareOnAccessoryList:(id)a3 withUserIntent:(BOOL)a4
{
  id v5 = a3;
  internalQueue = self->_internalQueue;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __68__UARPController_applyStagedFirmwareOnAccessoryList_withUserIntent___block_invoke;
  v9[3] = &unk_2644914C0;
  id v10 = v5;
  id v11 = self;
  id v7 = v5;
  dispatch_sync(internalQueue, v9);

  return 1;
}

void __68__UARPController_applyStagedFirmwareOnAccessoryList_withUserIntent___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a1 + 32);
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
        objc_msgSend(*(id *)(*(void *)(a1 + 40) + 64), "applyStagedAssetsForAccessory:error:", *(void *)(*((void *)&v7 + 1) + 8 * v6++), 0, (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (BOOL)rescindStagedFirmwareOnAccessoryList:(id)a3 withUserIntent:(BOOL)a4
{
  id v5 = a3;
  internalQueue = self->_internalQueue;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __70__UARPController_rescindStagedFirmwareOnAccessoryList_withUserIntent___block_invoke;
  v9[3] = &unk_2644914C0;
  id v10 = v5;
  id v11 = self;
  id v7 = v5;
  dispatch_sync(internalQueue, v9);

  return 1;
}

void __70__UARPController_rescindStagedFirmwareOnAccessoryList_withUserIntent___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a1 + 32);
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
        objc_msgSend(*(id *)(*(void *)(a1 + 40) + 64), "rescindStagedAssetsForAccessory:error:", *(void *)(*((void *)&v7 + 1) + 8 * v6++), 0, (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (BOOL)cancelFirmwareUpdateOnAccessoryList:(id)a3
{
  return a3 != 0;
}

- (BOOL)cancelFirmwareStagingForAccessory:(id)a3 assetID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  internalQueue = self->_internalQueue;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __60__UARPController_cancelFirmwareStagingForAccessory_assetID___block_invoke;
  v12[3] = &unk_264492B48;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  uint64_t v15 = &v16;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(internalQueue, v12);
  LOBYTE(internalQueue) = *((unsigned char *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  return (char)internalQueue;
}

void __60__UARPController_cancelFirmwareStagingForAccessory_assetID___block_invoke(uint64_t a1)
{
  uint64_t v2 = a1 + 40;
  uint64_t v3 = [*(id *)(a1 + 32) pendingAssetForAccessory:*(void *)(a1 + 40) assetID:*(void *)(a1 + 48)];
  uint64_t v4 = *(void *)(v2 - 8);
  if (v3)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(v4 + 64) cancelAssetStagingForAccessory:*(void *)(a1 + 40) asset:v3];
  }
  else if (os_log_type_enabled(*(os_log_t *)(v4 + 32), OS_LOG_TYPE_ERROR))
  {
    __60__UARPController_cancelFirmwareStagingForAccessory_assetID___block_invoke_cold_1();
  }
}

- (BOOL)recvDataFromAccessory:(id)a3 data:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if ([v9 length])
  {
    uint64_t v32 = 0;
    long long v33 = &v32;
    uint64_t v34 = 0x2020000000;
    char v35 = 0;
    uint64_t v26 = 0;
    uint64_t v27 = &v26;
    uint64_t v28 = 0x3032000000;
    uint64_t v29 = __Block_byref_object_copy__3;
    uint64_t v30 = __Block_byref_object_dispose__3;
    id v31 = 0;
    internalQueue = self->_internalQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __51__UARPController_recvDataFromAccessory_data_error___block_invoke;
    block[3] = &unk_264492B70;
    BOOL v24 = &v32;
    void block[4] = self;
    id v22 = v8;
    id v23 = v9;
    uint64_t v25 = &v26;
    dispatch_sync(internalQueue, block);
    if (a5) {
      *a5 = (id) v27[5];
    }
    BOOL v11 = *((unsigned char *)v33 + 24) != 0;

    _Block_object_dispose(&v26, 8);
    _Block_object_dispose(&v32, 8);
  }
  else
  {
    controllerLog = self->_controllerLog;
    if (os_log_type_enabled(controllerLog, OS_LOG_TYPE_ERROR)) {
      -[UARPController recvDataFromAccessory:data:error:](controllerLog, v13, v14, v15, v16, v17, v18, v19);
    }
    BOOL v11 = 0;
  }

  return v11;
}

void __51__UARPController_recvDataFromAccessory_data_error___block_invoke(void *a1)
{
  uint64_t v2 = a1[5];
  uint64_t v3 = *(void **)(a1[4] + 64);
  uint64_t v4 = a1[6];
  uint64_t v5 = *(void *)(a1[8] + 8);
  id obj = *(id *)(v5 + 40);
  char v6 = [v3 recvDataFromAccessory:v2 data:v4 error:&obj];
  objc_storeStrong((id *)(v5 + 40), obj);
  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = v6;
  uint64_t v7 = a1[6];
  if (*(unsigned char *)(*(void *)(a1[7] + 8) + 24)) {
    uint64_t v8 = 0;
  }
  else {
    uint64_t v8 = 11;
  }
  id v9 = (void *)a1[5];
  id v10 = *(void **)(a1[4] + 96);
  BOOL v11 = [v9 getID];
  [v10 dump:v7 accessoryID:v11 uarpStatus:v8 direction:1];
}

- (BOOL)accessoryKnown:(id)a3
{
  accessories = self->_accessories;
  uint64_t v4 = [a3 getID];
  uint64_t v5 = [(NSMutableDictionary *)accessories objectForKeyedSubscript:v4];
  LOBYTE(accessories) = v5 != 0;

  return (char)accessories;
}

- (BOOL)accessoryIDKnown:(id)a3
{
  uint64_t v3 = [(NSMutableDictionary *)self->_accessories objectForKeyedSubscript:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)updatePendingAssetsForAccessory:(id)a3 assetID:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 localURL];
  if (!v8 || [v7 downloadStatus] != 1) {
    goto LABEL_21;
  }
  uint64_t v9 = [v7 updateAvailabilityStatus];

  if (v9 == 3)
  {
    uint64_t v8 = [(UARPController *)self pendingAssetForAccessory:v6 assetID:v7];
    if (v8)
    {
      xpcLog = self->_xpcLog;
      if (os_log_type_enabled(xpcLog, OS_LOG_TYPE_DEFAULT))
      {
        int v23 = 136315394;
        BOOL v24 = "-[UARPController updatePendingAssetsForAccessory:assetID:]";
        __int16 v25 = 2112;
        uint64_t v26 = (uint64_t)v7;
        _os_log_impl(&dword_21E079000, xpcLog, OS_LOG_TYPE_DEFAULT, "%s: AssetID %@ already present in accessory's pending list", (uint8_t *)&v23, 0x16u);
      }
      goto LABEL_21;
    }
    uint64_t v11 = [(NSCache *)self->_assetCache objectForKey:v7];
    if (!v11)
    {
      uint64_t v12 = [(UARPControllerInternalDelegate *)self->_internalDelegate getSandboxExtensionTokenForAssetID:v7];
      uint64_t v13 = [UARPAsset alloc];
      if (v12) {
        uint64_t v14 = [(UARPAsset *)v13 initWithID:v7 sandboxToken:v12];
      }
      else {
        uint64_t v14 = [(UARPAsset *)v13 initWithID:v7];
      }
      uint64_t v11 = v14;
      if (!v14)
      {
        id v22 = self->_xpcLog;
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          -[UARPController updatePendingAssetsForAccessory:assetID:](v22);
        }
        goto LABEL_20;
      }
      [(NSCache *)self->_assetCache setObject:v14 forKey:v7];
    }
    uint64_t v15 = self->_xpcLog;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = v15;
      uint64_t v17 = [v6 pendingAssets];
      int v23 = 136315650;
      BOOL v24 = "-[UARPController updatePendingAssetsForAccessory:assetID:]";
      __int16 v25 = 2112;
      uint64_t v26 = (uint64_t)v6;
      __int16 v27 = 2112;
      uint64_t v28 = v17;
      _os_log_impl(&dword_21E079000, v16, OS_LOG_TYPE_DEFAULT, "%s: Current PendingAssetList for %@: %@", (uint8_t *)&v23, 0x20u);
    }
    uint64_t v18 = self->_xpcLog;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      int v23 = 136315394;
      BOOL v24 = "-[UARPController updatePendingAssetsForAccessory:assetID:]";
      __int16 v25 = 2112;
      uint64_t v26 = v11;
      _os_log_impl(&dword_21E079000, v18, OS_LOG_TYPE_DEFAULT, "%s: Adding Asset %@", (uint8_t *)&v23, 0x16u);
    }
    [v6 addPendingAsset:v11];
    uint64_t v19 = self->_xpcLog;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = v19;
      uint64_t v21 = [v6 pendingAssets];
      int v23 = 136315650;
      BOOL v24 = "-[UARPController updatePendingAssetsForAccessory:assetID:]";
      __int16 v25 = 2112;
      uint64_t v26 = (uint64_t)v6;
      __int16 v27 = 2112;
      uint64_t v28 = v21;
      _os_log_impl(&dword_21E079000, v20, OS_LOG_TYPE_DEFAULT, "%s: Updated PendingAssetList for %@: %@", (uint8_t *)&v23, 0x20u);
    }
    uint64_t v12 = (void *)v11;
LABEL_20:

LABEL_21:
  }
}

- (id)pendingAssetForAccessory:(id)a3 assetID:(id)a4
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  xpcLog = self->_xpcLog;
  if (os_log_type_enabled(xpcLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    long long v33 = "-[UARPController pendingAssetForAccessory:assetID:]";
    __int16 v34 = 2112;
    id v35 = v7;
    _os_log_impl(&dword_21E079000, xpcLog, OS_LOG_TYPE_DEFAULT, "%s: Looking for matching asset on pending queue for asset %@", buf, 0x16u);
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = [v6 pendingAssets];
  uint64_t v9 = [obj countByEnumeratingWithState:&v28 objects:v38 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    id v26 = v6;
    uint64_t v11 = *(void *)v29;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v29 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        uint64_t v14 = [v13 id];
        uint64_t v15 = [v14 firmwareHash];
        uint64_t v16 = [v7 firmwareHash];
        int v17 = [v15 isEqualToString:v16];

        uint64_t v18 = self->_xpcLog;
        BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
        if (v17)
        {
          if (v19)
          {
            int v23 = v18;
            BOOL v24 = [v13 id];
            *(_DWORD *)buf = 136315650;
            long long v33 = "-[UARPController pendingAssetForAccessory:assetID:]";
            __int16 v34 = 2112;
            id v35 = v24;
            __int16 v36 = 2112;
            id v37 = v7;
            _os_log_impl(&dword_21E079000, v23, OS_LOG_TYPE_DEFAULT, "%s: Assets matched %@ and %@", buf, 0x20u);
          }
          id v22 = v13;
          goto LABEL_17;
        }
        if (v19)
        {
          int v20 = v18;
          uint64_t v21 = [v13 id];
          *(_DWORD *)buf = 136315650;
          long long v33 = "-[UARPController pendingAssetForAccessory:assetID:]";
          __int16 v34 = 2112;
          id v35 = v21;
          __int16 v36 = 2112;
          id v37 = v7;
          _os_log_impl(&dword_21E079000, v20, OS_LOG_TYPE_DEFAULT, "%s: Assets NOT matched %@ and %@", buf, 0x20u);
        }
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v28 objects:v38 count:16];
      if (v10) {
        continue;
      }
      break;
    }
    id v22 = 0;
LABEL_17:
    id v6 = v26;
  }
  else
  {
    id v22 = 0;
  }

  return v22;
}

- (void)firmwareStagingComplete:(id)a3 assetID:(id)a4 withStatus:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [v8 getID];
  [v9 stagingCompleteOnAccessoryID:v10];

  uint64_t v11 = [(UARPController *)self pendingAssetForAccessory:v8 assetID:v9];
  if (v11) {
    [v8 removePendingAsset:v11];
  }
  if (([v9 isDynamicAsset] & 1) == 0)
  {
    updateFirmwareAnalytics = self->_updateFirmwareAnalytics;
    uint64_t v13 = [v8 getID];
    [(UARPAnalyticsUpdateFirmwareManager *)updateFirmwareAnalytics stagingCompleteForAccessoryID:v13 assetID:v9 status:a5];

    powerLogManager = self->_powerLogManager;
    uint64_t v15 = [v8 getID];
    uint64_t v16 = [v9 assetVersion];
    int v17 = [v8 firmwareVersion];
    [(UARPPowerLogManager *)powerLogManager setStagingCompleteForAccessoryID:v15 stagedFirmwareVersion:v16 activeFirmareVersion:v17 status:a5];

    if (self->_isInternalBuild)
    {
      internalDelegate = self->_internalDelegate;
      BOOL v19 = [v8 getID];
      [(UARPControllerInternalDelegate *)internalDelegate stagingCompleteForAccessoryID:v19 assetID:v9 status:a5];
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    int v21 = [v9 reportProgressToDelegates];

    if (v21)
    {
      delegateQueue = self->_delegateQueue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __61__UARPController_firmwareStagingComplete_assetID_withStatus___block_invoke;
      block[3] = &unk_264492B98;
      void block[4] = self;
      id v31 = v8;
      id v32 = v9;
      unint64_t v33 = a5;
      dispatch_async(delegateQueue, block);
    }
  }
  else
  {
  }
  id v23 = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    int v24 = [v9 reportProgressToDelegates];

    if (v24)
    {
      __int16 v25 = self->_delegateQueue;
      v26[0] = MEMORY[0x263EF8330];
      v26[1] = 3221225472;
      v26[2] = __61__UARPController_firmwareStagingComplete_assetID_withStatus___block_invoke_2;
      v26[3] = &unk_264492B98;
      v26[4] = self;
      id v27 = v8;
      id v28 = v9;
      unint64_t v29 = a5;
      dispatch_async(v25, v26);
    }
  }
  else
  {
  }
}

void __61__UARPController_firmwareStagingComplete_assetID_withStatus___block_invoke(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 168));
  [WeakRetained firmwareUpdateComplete:a1[5] assetID:a1[6] withStatus:a1[7]];
}

void __61__UARPController_firmwareStagingComplete_assetID_withStatus___block_invoke_2(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 168));
  [WeakRetained firmwareStagingComplete:a1[5] assetID:a1[6] withStatus:a1[7]];
}

- (void)stagedFirmwareApplicationComplete:(id)a3 withStatus:(unint64_t)a4
{
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    delegateQueue = self->_delegateQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __63__UARPController_stagedFirmwareApplicationComplete_withStatus___block_invoke;
    block[3] = &unk_2644927A0;
    void block[4] = self;
    id v11 = v6;
    unint64_t v12 = a4;
    dispatch_async(delegateQueue, block);
  }
}

void __63__UARPController_stagedFirmwareApplicationComplete_withStatus___block_invoke(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 168));
  [WeakRetained stagedFirmwareApplicationComplete:a1[5] withStatus:a1[6]];
}

- (void)stagedFirmwareRescindComplete:(id)a3 withStatus:(unint64_t)a4
{
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    delegateQueue = self->_delegateQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __59__UARPController_stagedFirmwareRescindComplete_withStatus___block_invoke;
    block[3] = &unk_2644927A0;
    void block[4] = self;
    id v11 = v6;
    unint64_t v12 = a4;
    dispatch_async(delegateQueue, block);
  }
}

void __59__UARPController_stagedFirmwareRescindComplete_withStatus___block_invoke(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 168));
  [WeakRetained stagedFirmwareRescindComplete:a1[5] withStatus:a1[6]];
}

- (BOOL)personalizationVectorForAccessory:(id)a3 assetTag:(unsigned int)a4 outVector:(unsigned int *)a5
{
  return [(UARPControllerInternalDelegate *)self->_internalDelegate personalizationVectorForAccessory:a3 assetTag:*(void *)&a4 outVector:a5];
}

- (void)manifestPropertiesReceivedForAccessory:(id)a3 assetTag:(unsigned int)a4 properties:(id)a5
{
}

- (BOOL)updateProperty:(unint64_t)a3 value:(id)a4 forAccessory:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = v9;
  char v11 = 0;
  switch(a3)
  {
    case 0uLL:
      [v9 setManufacturer:v8];
      goto LABEL_15;
    case 1uLL:
      [v9 setModelName:v8];
      goto LABEL_15;
    case 2uLL:
      [v9 setSerialNumber:v8];
      goto LABEL_15;
    case 3uLL:
      [v9 setHwRevision:v8];
      goto LABEL_15;
    case 4uLL:
      [v9 setFirmwareVersion:v8];
      powerLogManager = self->_powerLogManager;
      uint64_t v13 = [v10 getID];
      [(UARPPowerLogManager *)powerLogManager setActiveFirmwareVersionForAccessoryID:v13 activeFirmwareVersion:v8];
      goto LABEL_10;
    case 5uLL:
      [v9 setStagedFirmwareVersion:v8];
      uint64_t v14 = self->_powerLogManager;
      uint64_t v13 = [v10 getID];
      [(UARPPowerLogManager *)v14 setStagedFirmwareVersionForAccessoryID:v13 stagedFirmwareVersion:v8];
LABEL_10:

      goto LABEL_15;
    case 6uLL:
    case 9uLL:
    case 0xAuLL:
    case 0xBuLL:
      goto LABEL_16;
    case 7uLL:
      [v9 setProductGroup:v8];
      goto LABEL_15;
    case 8uLL:
      [v9 setProductNumber:v8];
      goto LABEL_15;
    case 0xCuLL:
      [v9 setHwFusingType:v8];
      goto LABEL_15;
    case 0xDuLL:
      [v9 setFriendlyName:v8];
      goto LABEL_15;
    default:
      if (a3 != 35) {
        goto LABEL_16;
      }
LABEL_15:
      char v11 = [(UARPControllerInternalDelegate *)self->_internalDelegate updateProperty:a3 value:v8 forAccessory:v10];
LABEL_16:

      return v11;
  }
}

- (void)sendMessageToAccessory:(id)a3 uarpMsg:(id)a4
{
  id v6 = a3;
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x3032000000;
  v12[3] = __Block_byref_object_copy__3;
  v12[4] = __Block_byref_object_dispose__3;
  id v13 = [MEMORY[0x263EFF8F8] dataWithData:a4];
  delegateQueue = self->_delegateQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__UARPController_sendMessageToAccessory_uarpMsg___block_invoke;
  block[3] = &unk_2644926C8;
  void block[4] = self;
  id v10 = v6;
  char v11 = v12;
  id v8 = v6;
  dispatch_async(delegateQueue, block);

  _Block_object_dispose(v12, 8);
}

void __49__UARPController_sendMessageToAccessory_uarpMsg___block_invoke(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 168));
  uint64_t v3 = a1[5];
  uint64_t v4 = *(void *)(*(void *)(a1[6] + 8) + 40);
  id v15 = 0;
  char v5 = [WeakRetained sendMessageToAccessory:v3 uarpMsg:v4 error:&v15];
  id v6 = v15;

  if ((v5 & 1) == 0)
  {
    id v7 = os_log_create("com.apple.accessoryupdater.uarp", "uploader");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __49__UARPController_sendMessageToAccessory_uarpMsg___block_invoke_cold_1();
    }
  }
  uint64_t v8 = a1[4];
  id v9 = *(NSObject **)(v8 + 40);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__UARPController_sendMessageToAccessory_uarpMsg___block_invoke_24;
  block[3] = &unk_264492BC0;
  char v14 = v5;
  void block[4] = v8;
  long long v11 = *(_OWORD *)(a1 + 5);
  id v10 = (id)v11;
  long long v13 = v11;
  dispatch_async(v9, block);
}

void __49__UARPController_sendMessageToAccessory_uarpMsg___block_invoke_24(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 56)) {
    uint64_t v1 = 0;
  }
  else {
    uint64_t v1 = 11;
  }
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 96);
  uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  id v4 = [*(id *)(a1 + 40) getID];
  [v2 dump:v3 accessoryID:v4 uarpStatus:v1 direction:0];
}

- (BOOL)startPacketCapture:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  unint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__UARPController_startPacketCapture___block_invoke;
  block[3] = &unk_2644926C8;
  void block[4] = self;
  id v9 = v4;
  id v10 = &v11;
  id v6 = v4;
  dispatch_sync(internalQueue, block);
  LOBYTE(internalQueue) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)internalQueue;
}

void __37__UARPController_startPacketCapture___block_invoke(void *a1)
{
  if (!*(void *)(a1[4] + 96))
  {
    uint64_t v2 = [[UARPPacketDumper alloc] initWithFileName:a1[5]];
    uint64_t v3 = a1[4];
    id v4 = *(void **)(v3 + 96);
    *(void *)(v3 + 96) = v2;

    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = *(void *)(a1[4] + 96) != 0;
  }
}

- (void)stopPacketCapture
{
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35__UARPController_stopPacketCapture__block_invoke;
  block[3] = &unk_264492750;
  void block[4] = self;
  dispatch_sync(internalQueue, block);
}

void __35__UARPController_stopPacketCapture__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 96);
  *(void *)(v1 + 96) = 0;
}

- (BOOL)solicitDynamicAsset:(id)a3 assetID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0;
  int v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  uint64_t v8 = [v7 localURL];

  if (v8)
  {
    internalQueue = self->_internalQueue;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __46__UARPController_solicitDynamicAsset_assetID___block_invoke;
    v12[3] = &unk_264492B48;
    v12[4] = self;
    id v13 = v6;
    id v14 = v7;
    id v15 = &v16;
    dispatch_sync(internalQueue, v12);
    BOOL v10 = *((unsigned char *)v17 + 24) != 0;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)self->_xpcLog, OS_LOG_TYPE_ERROR)) {
      -[UARPController solicitDynamicAsset:assetID:]();
    }
    BOOL v10 = 0;
  }
  _Block_object_dispose(&v16, 8);

  return v10;
}

void __46__UARPController_solicitDynamicAsset_assetID___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 8);
  uint64_t v3 = [*(id *)(a1 + 40) getID];
  id v4 = [v2 objectForKeyedSubscript:v3];

  if (v4)
  {
    char v5 = (void *)(a1 + 48);
    id v6 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKey:*(void *)(a1 + 48)];
    if (v6)
    {
LABEL_5:
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(*(void *)(a1 + 32) + 64) solicitDynamicAssetForAccessory:*(void *)(a1 + 40) asset:v6 error:0];

      goto LABEL_6;
    }
    id v7 = [[UARPAsset alloc] initWithID:*(void *)(a1 + 48)];
    uint64_t v8 = *(void *)(a1 + 32);
    if (v7)
    {
      id v6 = v7;
      [*(id *)(v8 + 16) setObject:v7 forKey:*v5];
      goto LABEL_5;
    }
    id v9 = *(NSObject **)(v8 + 24);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __46__UARPController_solicitDynamicAsset_assetID___block_invoke_cold_1((uint64_t)v5, v9);
    }
  }
LABEL_6:
}

- (void)assetSolicitationComplete:(id)a3 assetID:(id)a4 withStatus:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  BOOL v10 = [(UARPController *)self pendingAssetForAccessory:v8 assetID:v9];
  if (v10) {
    [v8 removePendingAsset:v10];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    int v12 = [v9 reportProgressToDelegates];

    if (v12)
    {
      delegateQueue = self->_delegateQueue;
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __63__UARPController_assetSolicitationComplete_assetID_withStatus___block_invoke;
      v14[3] = &unk_264492B98;
      v14[4] = self;
      id v15 = v8;
      id v16 = v9;
      unint64_t v17 = a5;
      dispatch_async(delegateQueue, v14);
    }
  }
  else
  {
  }
}

void __63__UARPController_assetSolicitationComplete_assetID_withStatus___block_invoke(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 168));
  [WeakRetained assetSolicitationComplete:a1[5] assetID:a1[6] withStatus:a1[7]];
}

- (BOOL)dynamicAssetAvailableForAccessory:(id)a3 assetID:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v26 = 0;
  id v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  uint64_t v20 = 0;
  int v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = __Block_byref_object_copy__3;
  int v24 = __Block_byref_object_dispose__3;
  id v25 = 0;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __66__UARPController_dynamicAssetAvailableForAccessory_assetID_error___block_invoke;
  block[3] = &unk_264492BE8;
  void block[4] = self;
  id v11 = v8;
  id v16 = v11;
  id v12 = v9;
  id v17 = v12;
  uint64_t v18 = &v26;
  char v19 = &v20;
  dispatch_sync(internalQueue, block);
  if (a5) {
    *a5 = (id) v21[5];
  }
  char v13 = *((unsigned char *)v27 + 24);

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v13;
}

void __66__UARPController_dynamicAssetAvailableForAccessory_assetID_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 8);
  uint64_t v3 = [*(id *)(a1 + 40) getID];
  id v4 = [v2 objectForKeyedSubscript:v3];

  if (v4)
  {
    char v5 = (void *)(a1 + 48);
    id v6 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKey:*(void *)(a1 + 48)];
    if (v6)
    {
LABEL_5:
      uint64_t v9 = *(void *)(a1 + 40);
      BOOL v10 = *(void **)(*(void *)(a1 + 32) + 64);
      uint64_t v11 = *(void *)(*(void *)(a1 + 64) + 8);
      id obj = *(id *)(v11 + 40);
      char v12 = [v10 offerDynamicAssetToAccessory:v9 asset:v6 error:&obj];
      objc_storeStrong((id *)(v11 + 40), obj);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v12;

      goto LABEL_6;
    }
    id v7 = [[UARPAsset alloc] initWithID:*(void *)(a1 + 48)];
    uint64_t v8 = *(void *)(a1 + 32);
    if (v7)
    {
      id v6 = v7;
      [*(id *)(v8 + 16) setObject:v7 forKey:*v5];
      goto LABEL_5;
    }
    char v13 = *(NSObject **)(v8 + 24);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      __66__UARPController_dynamicAssetAvailableForAccessory_assetID_error___block_invoke_cold_1((uint64_t)v5, v13);
    }
  }
LABEL_6:
}

- (BOOL)triggerUnsolicitedDynamicAsset:(id)a3 assetTag:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  internalQueue = self->_internalQueue;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __58__UARPController_triggerUnsolicitedDynamicAsset_assetTag___block_invoke;
  v12[3] = &unk_264492C10;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v15 = &v16;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(internalQueue, v12);
  LOBYTE(internalQueue) = *((unsigned char *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  return (char)internalQueue;
}

void __58__UARPController_triggerUnsolicitedDynamicAsset_assetTag___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 8);
  uint64_t v3 = [*(id *)(a1 + 40) getID];
  id v4 = [v2 objectForKeyedSubscript:v3];

  if (v4) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(*(void *)(a1 + 32) + 64) unsolicitedDynamicAssetForAccessory:*(void *)(a1 + 40) assetTag:*(void *)(a1 + 48) error:0];
  }
}

- (void)setPowerLogStagingWindowPeriodSeconds:(unsigned int)a3
{
}

- (void)assetAvailablityUpdateForAccessory:(id)a3 assetID:(id)a4
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  xpcLog = self->_xpcLog;
  if (os_log_type_enabled(xpcLog, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    unint64_t v33 = "-[UARPController assetAvailablityUpdateForAccessory:assetID:]";
    __int16 v34 = 2112;
    id v35 = v6;
    __int16 v36 = 2112;
    id v37 = v7;
    _os_log_impl(&dword_21E079000, xpcLog, OS_LOG_TYPE_INFO, "RECEIVED %s: %@ %@", buf, 0x20u);
  }
  uint64_t v9 = [v7 assetVersion];
  if (!v9) {
    goto LABEL_6;
  }
  id v10 = (void *)v9;
  uint64_t v11 = [v6 stagedFirmwareVersion];

  if (!v11) {
    goto LABEL_6;
  }
  char v12 = [v6 stagedFirmwareVersion];
  id v13 = [v7 assetVersion];
  uint64_t v14 = uarpVersionCompareStrings((uint64_t)v12, v13);

  if (v14 != 1)
  {
    uint64_t v22 = self->_xpcLog;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      id v23 = v22;
      int v24 = [v7 assetVersion];
      id v25 = [v6 stagedFirmwareVersion];
      *(_DWORD *)buf = 138412802;
      unint64_t v33 = v24;
      __int16 v34 = 2112;
      id v35 = v25;
      __int16 v36 = 2112;
      id v37 = v6;
      _os_log_impl(&dword_21E079000, v23, OS_LOG_TYPE_DEFAULT, "assetID assetVersion %@ is not greater than staged version %@ for accessory %@", buf, 0x20u);
    }
  }
  else
  {
LABEL_6:
    id v15 = [v7 assetVersion];
    [v6 setAvailableFirmwareVersion:v15];

    [(UARPController *)self updatePendingAssetsForAccessory:v6 assetID:v7];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v17 = objc_opt_respondsToSelector();

    if (v17)
    {
      delegateQueue = self->_delegateQueue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __61__UARPController_assetAvailablityUpdateForAccessory_assetID___block_invoke;
      block[3] = &unk_264492C38;
      void block[4] = self;
      id v30 = v6;
      id v31 = v7;
      dispatch_async(delegateQueue, block);
    }
    id v19 = objc_loadWeakRetained((id *)&self->_delegate);
    char v20 = objc_opt_respondsToSelector();

    if (v20)
    {
      int v21 = self->_delegateQueue;
      v26[0] = MEMORY[0x263EF8330];
      v26[1] = 3221225472;
      v26[2] = __61__UARPController_assetAvailablityUpdateForAccessory_assetID___block_invoke_2;
      v26[3] = &unk_264492C38;
      v26[4] = self;
      id v27 = v6;
      id v28 = v7;
      dispatch_async(v21, v26);
    }
  }
}

void __61__UARPController_assetAvailablityUpdateForAccessory_assetID___block_invoke(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 168));
  [WeakRetained assetAvailablityUpdateForAccessory:a1[5] assetID:a1[6]];
}

void __61__UARPController_assetAvailablityUpdateForAccessory_assetID___block_invoke_2(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 168));
  [WeakRetained assetAvailablityUpdateForAccessoryID:a1[5] assetID:a1[6]];
}

- (void)assetAvailablityUpdateForAccessoryID:(id)a3 assetID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__UARPController_assetAvailablityUpdateForAccessoryID_assetID___block_invoke;
  block[3] = &unk_264492C38;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(internalQueue, block);
}

void __63__UARPController_assetAvailablityUpdateForAccessoryID_assetID___block_invoke(void *a1)
{
  uint64_t v2 = a1 + 5;
  uint64_t v3 = [*(id *)(a1[4] + 8) objectForKeyedSubscript:a1[5]];
  id v4 = (os_log_t *)*(v2 - 1);
  if (v3)
  {
    [(os_log_t *)v4 assetAvailablityUpdateForAccessory:v3 assetID:a1[6]];
  }
  else if (os_log_type_enabled(v4[3], OS_LOG_TYPE_ERROR))
  {
    __63__UARPController_assetAvailablityUpdateForAccessoryID_assetID___block_invoke_cold_1();
  }
}

- (void)supplementalAssetAvailablityUpdateForAccessory:(id)a3 assetName:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  xpcLog = self->_xpcLog;
  if (os_log_type_enabled(xpcLog, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v16 = "-[UARPController supplementalAssetAvailablityUpdateForAccessory:assetName:]";
    __int16 v17 = 2112;
    id v18 = v6;
    __int16 v19 = 2112;
    id v20 = v7;
    _os_log_impl(&dword_21E079000, xpcLog, OS_LOG_TYPE_INFO, "RECEIVED %s: %@ %@", buf, 0x20u);
  }
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __75__UARPController_supplementalAssetAvailablityUpdateForAccessory_assetName___block_invoke;
  block[3] = &unk_264492C38;
  void block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(internalQueue, block);
}

uint64_t __75__UARPController_supplementalAssetAvailablityUpdateForAccessory_assetName___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 64) supplementalAssetUpdated:a1[5] assetName:a1[6] error:0];
}

- (void)supplementalAssetAvailablityUpdateForAccessoryID:(id)a3 assetName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __77__UARPController_supplementalAssetAvailablityUpdateForAccessoryID_assetName___block_invoke;
  block[3] = &unk_264492C38;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(internalQueue, block);
}

void __77__UARPController_supplementalAssetAvailablityUpdateForAccessoryID_assetName___block_invoke(void *a1)
{
  uint64_t v2 = a1 + 5;
  uint64_t v3 = [*(id *)(a1[4] + 8) objectForKeyedSubscript:a1[5]];
  id v4 = (os_log_t *)*(v2 - 1);
  if (v3)
  {
    [(os_log_t *)v4 supplementalAssetAvailablityUpdateForAccessory:v3 assetName:a1[6]];
  }
  else if (os_log_type_enabled(v4[3], OS_LOG_TYPE_ERROR))
  {
    __77__UARPController_supplementalAssetAvailablityUpdateForAccessoryID_assetName___block_invoke_cold_1();
  }
}

- (void)supportedAccessories:(id)a3 forProductGroup:(id)a4 isComplete:(BOOL)a5
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v11 = v8;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v25;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v25 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = [(UARPController *)self createSupportedAccessory:v9 accessoryMetadata:*(void *)(*((void *)&v24 + 1) + 8 * v15)];
        if (v16) {
          [v10 addObject:v16];
        }

        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v13);
  }

  if (![v10 count])
  {

    id v10 = 0;
  }
  delegateQueue = self->_delegateQueue;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __66__UARPController_supportedAccessories_forProductGroup_isComplete___block_invoke;
  v20[3] = &unk_264492C60;
  v20[4] = self;
  id v21 = v10;
  id v22 = v9;
  BOOL v23 = a5;
  id v18 = v9;
  id v19 = v10;
  dispatch_async(delegateQueue, v20);
}

void __66__UARPController_supportedAccessories_forProductGroup_isComplete___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 168));
  char v3 = objc_opt_respondsToSelector();

  id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 168));
  id v15 = v4;
  if (v3)
  {
    [v4 supportedAccessories:*(void *)(a1 + 40) forProductGroup:*(void *)(a1 + 48) isComplete:*(unsigned __int8 *)(a1 + 56)];
LABEL_5:

    return;
  }
  char v5 = objc_opt_respondsToSelector();

  uint64_t v6 = *(void *)(a1 + 32);
  if (v5)
  {
    id v15 = objc_loadWeakRetained((id *)(v6 + 168));
    [v15 supportedAccessories:*(void *)(a1 + 40) forProductGroup:*(void *)(a1 + 48)];
    goto LABEL_5;
  }
  id v7 = *(NSObject **)(v6 + 24);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    __66__UARPController_supportedAccessories_forProductGroup_isComplete___block_invoke_cold_1(v7, v8, v9, v10, v11, v12, v13, v14);
  }
}

- (void)handleReceivedAttestationCertificates:(id)a3 forSubjectKeyIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  delegateQueue = self->_delegateQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __80__UARPController_handleReceivedAttestationCertificates_forSubjectKeyIdentifier___block_invoke;
  block[3] = &unk_264492C38;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(delegateQueue, block);
}

void __80__UARPController_handleReceivedAttestationCertificates_forSubjectKeyIdentifier___block_invoke(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 168));
  [WeakRetained attestationCertificates:a1[5] forSubjectKeyIdentifier:a1[6]];
}

- (id)createSupportedAccessory:(id)a3 accessoryMetadata:(id)a4
{
  id v4 = a4;
  if ([v4 accessoryCapability] == 16)
  {
    char v5 = [UARPAccessoryHardwareCHIP alloc];
    id v6 = [v4 productGroup];
    unsigned __int16 v7 = [v6 integerValue];
    uint64_t v8 = [v4 productNumber];
    id v9 = -[UARPAccessoryHardwareCHIP initWithVendorID:productID:hardwareID:metadata:](v5, "initWithVendorID:productID:hardwareID:metadata:", v7, (unsigned __int16)[v8 integerValue], 0, v4);

    id v10 = [UARPSupportedAccessory alloc];
    uint64_t v11 = [v4 productGroup];
    id v12 = [v4 productNumber];
    id v13 = -[UARPSupportedAccessory initWithHardwareID:productGroup:productNumber:capabilities:](v10, "initWithHardwareID:productGroup:productNumber:capabilities:", v9, v11, v12, [v4 accessoryCapability]);
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

- (void)queryFirmwareUpdateResultForAccessory:(id)a3
{
  id v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __56__UARPController_queryFirmwareUpdateResultForAccessory___block_invoke;
  v7[3] = &unk_2644914C0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(internalQueue, v7);
}

uint64_t __56__UARPController_queryFirmwareUpdateResultForAccessory___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 64) queryFirmwareUpdateResultForAccessory:*(void *)(a1 + 40)];
}

- (int64_t)queryProperty:(unint64_t)a3 forAccessory:(id)a4
{
  id v6 = a4;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000;
  uint64_t v18 = 0;
  internalQueue = self->_internalQueue;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __45__UARPController_queryProperty_forAccessory___block_invoke;
  v11[3] = &unk_264492C88;
  id v13 = &v15;
  unint64_t v14 = a3;
  v11[4] = self;
  id v12 = v6;
  id v8 = v6;
  dispatch_sync(internalQueue, v11);
  int64_t v9 = v16[3];

  _Block_object_dispose(&v15, 8);
  return v9;
}

uint64_t __45__UARPController_queryProperty_forAccessory___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) queryPropertyInternal:*(void *)(a1 + 56) forAccessory:*(void *)(a1 + 40)];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    char v3 = *(void **)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 56);
    return [v3 addPendingClientPropertyQuery:v4];
  }
  return result;
}

- (int64_t)queryPropertyInternal:(unint64_t)a3 forAccessory:(id)a4
{
  return [(UARPUploader *)self->_uploader queryProperty:a3 forAccessory:a4];
}

- (void)firmwareUpdateResult:(id)a3 vendorSpecificStatus:(unsigned int)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  delegateQueue = self->_delegateQueue;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __66__UARPController_firmwareUpdateResult_vendorSpecificStatus_error___block_invoke;
  v13[3] = &unk_264492CB0;
  v13[4] = self;
  id v14 = v8;
  unsigned int v16 = a4;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(delegateQueue, v13);
}

void __66__UARPController_firmwareUpdateResult_vendorSpecificStatus_error___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 168));
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 168));
    [v4 firmwareUpdateResult:*(void *)(a1 + 40) vendorSpecificStatus:*(unsigned int *)(a1 + 56) error:*(void *)(a1 + 48)];
  }
}

- (void)queryCompleteForAccessory:(id)a3 manufacturer:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [(UARPController *)self updateProperty:0 value:v9 forAccessory:v8];
  if ([v8 clientQueryPendingForProperty:0])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v12 = objc_opt_respondsToSelector();

    if (v12)
    {
      delegateQueue = self->_delegateQueue;
      uint64_t v15 = MEMORY[0x263EF8330];
      uint64_t v16 = 3221225472;
      uint64_t v17 = __63__UARPController_queryCompleteForAccessory_manufacturer_error___block_invoke;
      uint64_t v18 = &unk_264492CD8;
      id v19 = self;
      id v14 = v8;
      id v20 = v14;
      id v21 = v9;
      id v22 = v10;
      dispatch_async(delegateQueue, &v15);
      objc_msgSend(v14, "removePendingClientPropertyQuery:", 0, v15, v16, v17, v18, v19);
    }
  }
}

void __63__UARPController_queryCompleteForAccessory_manufacturer_error___block_invoke(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 168));
  [WeakRetained queryCompleteForAccessory:a1[5] manufacturer:a1[6] error:a1[7]];
}

- (void)queryCompleteForAccessory:(id)a3 modelName:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [(UARPController *)self updateProperty:1 value:v9 forAccessory:v8];
  if ([v8 clientQueryPendingForProperty:1])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v12 = objc_opt_respondsToSelector();

    if (v12)
    {
      delegateQueue = self->_delegateQueue;
      uint64_t v15 = MEMORY[0x263EF8330];
      uint64_t v16 = 3221225472;
      uint64_t v17 = __60__UARPController_queryCompleteForAccessory_modelName_error___block_invoke;
      uint64_t v18 = &unk_264492CD8;
      id v19 = self;
      id v14 = v8;
      id v20 = v14;
      id v21 = v9;
      id v22 = v10;
      dispatch_async(delegateQueue, &v15);
      objc_msgSend(v14, "removePendingClientPropertyQuery:", 1, v15, v16, v17, v18, v19);
    }
  }
}

void __60__UARPController_queryCompleteForAccessory_modelName_error___block_invoke(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 168));
  [WeakRetained queryCompleteForAccessory:a1[5] modelName:a1[6] error:a1[7]];
}

- (void)queryCompleteForAccessory:(id)a3 firmwareVersion:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [(UARPController *)self updateProperty:4 value:v9 forAccessory:v8];
  if ([v8 clientQueryPendingForProperty:4])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v12 = objc_opt_respondsToSelector();

    if (v12)
    {
      delegateQueue = self->_delegateQueue;
      uint64_t v15 = MEMORY[0x263EF8330];
      uint64_t v16 = 3221225472;
      uint64_t v17 = __66__UARPController_queryCompleteForAccessory_firmwareVersion_error___block_invoke;
      uint64_t v18 = &unk_264492CD8;
      id v19 = self;
      id v14 = v8;
      id v20 = v14;
      id v21 = v9;
      id v22 = v10;
      dispatch_async(delegateQueue, &v15);
      objc_msgSend(v14, "removePendingClientPropertyQuery:", 4, v15, v16, v17, v18, v19);
    }
  }
}

void __66__UARPController_queryCompleteForAccessory_firmwareVersion_error___block_invoke(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 168));
  [WeakRetained queryCompleteForAccessory:a1[5] firmwareVersion:a1[6] error:a1[7]];
}

- (void)queryCompleteForAccessory:(id)a3 stagedFirmwareVersion:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [(UARPController *)self updateProperty:5 value:v9 forAccessory:v8];
  if ([v8 clientQueryPendingForProperty:5])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v12 = objc_opt_respondsToSelector();

    if (v12)
    {
      delegateQueue = self->_delegateQueue;
      uint64_t v15 = MEMORY[0x263EF8330];
      uint64_t v16 = 3221225472;
      uint64_t v17 = __72__UARPController_queryCompleteForAccessory_stagedFirmwareVersion_error___block_invoke;
      uint64_t v18 = &unk_264492CD8;
      id v19 = self;
      id v14 = v8;
      id v20 = v14;
      id v21 = v9;
      id v22 = v10;
      dispatch_async(delegateQueue, &v15);
      objc_msgSend(v14, "removePendingClientPropertyQuery:", 5, v15, v16, v17, v18, v19);
    }
  }
}

void __72__UARPController_queryCompleteForAccessory_stagedFirmwareVersion_error___block_invoke(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 168));
  [WeakRetained queryCompleteForAccessory:a1[5] stagedFirmwareVersion:a1[6] error:a1[7]];
}

- (void)queryCompleteForAccessory:(id)a3 stats:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 clientQueryPendingForProperty:6])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v12 = objc_opt_respondsToSelector();

    if (v12)
    {
      delegateQueue = self->_delegateQueue;
      uint64_t v15 = MEMORY[0x263EF8330];
      uint64_t v16 = 3221225472;
      uint64_t v17 = __56__UARPController_queryCompleteForAccessory_stats_error___block_invoke;
      uint64_t v18 = &unk_264492CD8;
      id v19 = self;
      id v14 = v8;
      id v20 = v14;
      id v21 = v9;
      id v22 = v10;
      dispatch_async(delegateQueue, &v15);
      objc_msgSend(v14, "removePendingClientPropertyQuery:", 6, v15, v16, v17, v18, v19);
    }
  }
}

void __56__UARPController_queryCompleteForAccessory_stats_error___block_invoke(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 168));
  [WeakRetained queryCompleteForAccessory:a1[5] stats:a1[6] error:a1[7]];
}

- (void)queryCompleteForAccessory:(id)a3 hardwareVersion:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [(UARPController *)self updateProperty:3 value:v9 forAccessory:v8];
  if ([v8 clientQueryPendingForProperty:3])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v12 = objc_opt_respondsToSelector();

    if (v12)
    {
      delegateQueue = self->_delegateQueue;
      uint64_t v15 = MEMORY[0x263EF8330];
      uint64_t v16 = 3221225472;
      uint64_t v17 = __66__UARPController_queryCompleteForAccessory_hardwareVersion_error___block_invoke;
      uint64_t v18 = &unk_264492CD8;
      id v19 = self;
      id v14 = v8;
      id v20 = v14;
      id v21 = v9;
      id v22 = v10;
      dispatch_async(delegateQueue, &v15);
      objc_msgSend(v14, "removePendingClientPropertyQuery:", 3, v15, v16, v17, v18, v19);
    }
  }
}

void __66__UARPController_queryCompleteForAccessory_hardwareVersion_error___block_invoke(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 168));
  [WeakRetained queryCompleteForAccessory:a1[5] hardwareVersion:a1[6] error:a1[7]];
}

- (void)queryCompleteForAccessory:(id)a3 serialNumber:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [(UARPController *)self updateProperty:2 value:v9 forAccessory:v8];
  if ([v8 clientQueryPendingForProperty:2])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v12 = objc_opt_respondsToSelector();

    if (v12)
    {
      delegateQueue = self->_delegateQueue;
      uint64_t v15 = MEMORY[0x263EF8330];
      uint64_t v16 = 3221225472;
      uint64_t v17 = __63__UARPController_queryCompleteForAccessory_serialNumber_error___block_invoke;
      uint64_t v18 = &unk_264492CD8;
      id v19 = self;
      id v14 = v8;
      id v20 = v14;
      id v21 = v9;
      id v22 = v10;
      dispatch_async(delegateQueue, &v15);
      objc_msgSend(v14, "removePendingClientPropertyQuery:", 2, v15, v16, v17, v18, v19);
    }
  }
}

void __63__UARPController_queryCompleteForAccessory_serialNumber_error___block_invoke(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 168));
  [WeakRetained queryCompleteForAccessory:a1[5] serialNumber:a1[6] error:a1[7]];
}

- (void)queryCompleteForAccessory:(id)a3 appleModelNumber:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [(UARPController *)self updateProperty:11 value:v9 forAccessory:v8];
  if ([v8 clientQueryPendingForProperty:11])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v12 = objc_opt_respondsToSelector();

    if (v12)
    {
      delegateQueue = self->_delegateQueue;
      uint64_t v15 = MEMORY[0x263EF8330];
      uint64_t v16 = 3221225472;
      uint64_t v17 = __67__UARPController_queryCompleteForAccessory_appleModelNumber_error___block_invoke;
      uint64_t v18 = &unk_264492CD8;
      id v19 = self;
      id v14 = v8;
      id v20 = v14;
      id v21 = v9;
      id v22 = v10;
      dispatch_async(delegateQueue, &v15);
      objc_msgSend(v14, "removePendingClientPropertyQuery:", 11, v15, v16, v17, v18, v19);
    }
  }
}

void __67__UARPController_queryCompleteForAccessory_appleModelNumber_error___block_invoke(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 168));
  [WeakRetained queryCompleteForAccessory:a1[5] appleModelNumber:a1[6] error:a1[7]];
}

- (void)queryCompleteForAccessory:(id)a3 hwFusingType:(id)a4 error:(id)a5
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = (__CFString *)a4;
  id v10 = a5;
  id v11 = [v8 modelNumber];
  char v12 = +[UARPSupportedAccessory findByAppleModelNumber:v11];

  if (!self->_isInternalBuild
    && [(__CFString *)v9 isEqualToString:@"unfused"]
    && ([v12 fusingOverrideUnfused],
        id v13 = objc_claimAutoreleasedReturnValue(),
        v13,
        v13))
  {
    id v14 = [v12 fusingOverrideUnfused];
    int v15 = [v14 isEqualToString:@"dev"];

    if (v15) {
      uint64_t v16 = @"dev";
    }
    else {
      uint64_t v16 = @"prod";
    }
    xpcLog = self->_xpcLog;
    if (os_log_type_enabled(xpcLog, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      id v31 = v8;
      __int16 v32 = 2114;
      unint64_t v33 = v9;
      __int16 v34 = 2114;
      id v35 = v16;
      _os_log_error_impl(&dword_21E079000, xpcLog, OS_LOG_TYPE_ERROR, "Overriding hw fusing for %{public}@, from %{public}@ to %{public}@", buf, 0x20u);
    }
  }
  else
  {
    uint64_t v16 = v9;
  }
  [(UARPController *)self updateProperty:12 value:v16 forAccessory:v8];
  if ([v8 clientQueryPendingForProperty:12])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v19 = objc_opt_respondsToSelector();

    if (v19)
    {
      delegateQueue = self->_delegateQueue;
      uint64_t v22 = MEMORY[0x263EF8330];
      uint64_t v23 = 3221225472;
      long long v24 = __63__UARPController_queryCompleteForAccessory_hwFusingType_error___block_invoke;
      long long v25 = &unk_264492CD8;
      long long v26 = self;
      id v21 = v8;
      id v27 = v21;
      id v28 = v16;
      id v29 = v10;
      dispatch_async(delegateQueue, &v22);
      objc_msgSend(v21, "removePendingClientPropertyQuery:", 12, v22, v23, v24, v25, v26);
    }
  }
}

void __63__UARPController_queryCompleteForAccessory_hwFusingType_error___block_invoke(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 168));
  [WeakRetained queryCompleteForAccessory:a1[5] hwFusingType:a1[6] error:a1[7]];
}

- (void)queryCompleteForAccessory:(id)a3 friendlyName:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [(UARPController *)self updateProperty:13 value:v9 forAccessory:v8];
  if ([v8 clientQueryPendingForProperty:13])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v12 = objc_opt_respondsToSelector();

    if (v12)
    {
      delegateQueue = self->_delegateQueue;
      uint64_t v15 = MEMORY[0x263EF8330];
      uint64_t v16 = 3221225472;
      uint64_t v17 = __63__UARPController_queryCompleteForAccessory_friendlyName_error___block_invoke;
      uint64_t v18 = &unk_264492CD8;
      char v19 = self;
      id v14 = v8;
      id v20 = v14;
      id v21 = v9;
      id v22 = v10;
      dispatch_async(delegateQueue, &v15);
      objc_msgSend(v14, "removePendingClientPropertyQuery:", 13, v15, v16, v17, v18, v19);
    }
  }
}

void __63__UARPController_queryCompleteForAccessory_friendlyName_error___block_invoke(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 168));
  [WeakRetained queryCompleteForAccessory:a1[5] friendlyName:a1[6] error:a1[7]];
}

- (void)queryCompleteForAccessory:(id)a3 manifestPrefix:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 clientQueryPendingForProperty:14]
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    delegateQueue = self->_delegateQueue;
    uint64_t v13 = MEMORY[0x263EF8330];
    uint64_t v14 = 3221225472;
    uint64_t v15 = __65__UARPController_queryCompleteForAccessory_manifestPrefix_error___block_invoke;
    uint64_t v16 = &unk_264492CD8;
    uint64_t v17 = self;
    id v12 = v8;
    id v18 = v12;
    id v19 = v9;
    id v20 = v10;
    dispatch_async(delegateQueue, &v13);
    objc_msgSend(v12, "removePendingClientPropertyQuery:", 14, v13, v14, v15, v16, v17);
  }
}

uint64_t __65__UARPController_queryCompleteForAccessory_manifestPrefix_error___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 80) queryCompleteForAccessory:a1[5] manifestPrefix:a1[6] error:a1[7]];
}

- (void)queryCompleteForAccessory:(id)a3 boardID:(unint64_t)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if ([v8 clientQueryPendingForProperty:15]
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    delegateQueue = self->_delegateQueue;
    uint64_t v12 = MEMORY[0x263EF8330];
    uint64_t v13 = 3221225472;
    uint64_t v14 = __58__UARPController_queryCompleteForAccessory_boardID_error___block_invoke;
    uint64_t v15 = &unk_264492B98;
    uint64_t v16 = self;
    id v11 = v8;
    id v17 = v11;
    unint64_t v19 = a4;
    id v18 = v9;
    dispatch_async(delegateQueue, &v12);
    objc_msgSend(v11, "removePendingClientPropertyQuery:", 15, v12, v13, v14, v15, v16);
  }
}

uint64_t __58__UARPController_queryCompleteForAccessory_boardID_error___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 80) queryCompleteForAccessory:a1[5] boardID:a1[7] error:a1[6]];
}

- (void)queryCompleteForAccessory:(id)a3 chipID:(unint64_t)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if ([v8 clientQueryPendingForProperty:16]
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    delegateQueue = self->_delegateQueue;
    uint64_t v12 = MEMORY[0x263EF8330];
    uint64_t v13 = 3221225472;
    uint64_t v14 = __57__UARPController_queryCompleteForAccessory_chipID_error___block_invoke;
    uint64_t v15 = &unk_264492B98;
    uint64_t v16 = self;
    id v11 = v8;
    id v17 = v11;
    unint64_t v19 = a4;
    id v18 = v9;
    dispatch_async(delegateQueue, &v12);
    objc_msgSend(v11, "removePendingClientPropertyQuery:", 16, v12, v13, v14, v15, v16);
  }
}

uint64_t __57__UARPController_queryCompleteForAccessory_chipID_error___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 80) queryCompleteForAccessory:a1[5] chipID:a1[7] error:a1[6]];
}

- (void)queryCompleteForAccessory:(id)a3 chipRevision:(unint64_t)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if ([v8 clientQueryPendingForProperty:17]
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    delegateQueue = self->_delegateQueue;
    uint64_t v12 = MEMORY[0x263EF8330];
    uint64_t v13 = 3221225472;
    uint64_t v14 = __63__UARPController_queryCompleteForAccessory_chipRevision_error___block_invoke;
    uint64_t v15 = &unk_264492B98;
    uint64_t v16 = self;
    id v11 = v8;
    id v17 = v11;
    unint64_t v19 = a4;
    id v18 = v9;
    dispatch_async(delegateQueue, &v12);
    objc_msgSend(v11, "removePendingClientPropertyQuery:", 17, v12, v13, v14, v15, v16);
  }
}

uint64_t __63__UARPController_queryCompleteForAccessory_chipRevision_error___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 80) queryCompleteForAccessory:a1[5] chipRevision:a1[7] error:a1[6]];
}

- (void)queryCompleteForAccessory:(id)a3 ecid:(unint64_t)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if ([v8 clientQueryPendingForProperty:18]
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    delegateQueue = self->_delegateQueue;
    uint64_t v12 = MEMORY[0x263EF8330];
    uint64_t v13 = 3221225472;
    uint64_t v14 = __55__UARPController_queryCompleteForAccessory_ecid_error___block_invoke;
    uint64_t v15 = &unk_264492B98;
    uint64_t v16 = self;
    id v11 = v8;
    id v17 = v11;
    unint64_t v19 = a4;
    id v18 = v9;
    dispatch_async(delegateQueue, &v12);
    objc_msgSend(v11, "removePendingClientPropertyQuery:", 18, v12, v13, v14, v15, v16);
  }
}

uint64_t __55__UARPController_queryCompleteForAccessory_ecid_error___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 80) queryCompleteForAccessory:a1[5] ecid:a1[7] error:a1[6]];
}

- (void)queryCompleteForAccessory:(id)a3 securityDomain:(unint64_t)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if ([v8 clientQueryPendingForProperty:19]
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    delegateQueue = self->_delegateQueue;
    uint64_t v12 = MEMORY[0x263EF8330];
    uint64_t v13 = 3221225472;
    uint64_t v14 = __65__UARPController_queryCompleteForAccessory_securityDomain_error___block_invoke;
    uint64_t v15 = &unk_264492B98;
    uint64_t v16 = self;
    id v11 = v8;
    id v17 = v11;
    unint64_t v19 = a4;
    id v18 = v9;
    dispatch_async(delegateQueue, &v12);
    objc_msgSend(v11, "removePendingClientPropertyQuery:", 19, v12, v13, v14, v15, v16);
  }
}

uint64_t __65__UARPController_queryCompleteForAccessory_securityDomain_error___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 80) queryCompleteForAccessory:a1[5] securityDomain:a1[7] error:a1[6]];
}

- (void)queryCompleteForAccessory:(id)a3 securityMode:(unint64_t)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if ([v8 clientQueryPendingForProperty:20]
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    delegateQueue = self->_delegateQueue;
    uint64_t v12 = MEMORY[0x263EF8330];
    uint64_t v13 = 3221225472;
    uint64_t v14 = __63__UARPController_queryCompleteForAccessory_securityMode_error___block_invoke;
    uint64_t v15 = &unk_264492B98;
    uint64_t v16 = self;
    id v11 = v8;
    id v17 = v11;
    unint64_t v19 = a4;
    id v18 = v9;
    dispatch_async(delegateQueue, &v12);
    objc_msgSend(v11, "removePendingClientPropertyQuery:", 20, v12, v13, v14, v15, v16);
  }
}

uint64_t __63__UARPController_queryCompleteForAccessory_securityMode_error___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 80) queryCompleteForAccessory:a1[5] securityMode:a1[7] error:a1[6]];
}

- (void)queryCompleteForAccessory:(id)a3 productionMode:(unint64_t)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if ([v8 clientQueryPendingForProperty:21]
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    delegateQueue = self->_delegateQueue;
    uint64_t v12 = MEMORY[0x263EF8330];
    uint64_t v13 = 3221225472;
    uint64_t v14 = __65__UARPController_queryCompleteForAccessory_productionMode_error___block_invoke;
    uint64_t v15 = &unk_264492B98;
    uint64_t v16 = self;
    id v11 = v8;
    id v17 = v11;
    unint64_t v19 = a4;
    id v18 = v9;
    dispatch_async(delegateQueue, &v12);
    objc_msgSend(v11, "removePendingClientPropertyQuery:", 21, v12, v13, v14, v15, v16);
  }
}

uint64_t __65__UARPController_queryCompleteForAccessory_productionMode_error___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 80) queryCompleteForAccessory:a1[5] productionMode:a1[7] error:a1[6]];
}

- (void)queryCompleteForAccessory:(id)a3 epoch:(unint64_t)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if ([v8 clientQueryPendingForProperty:22]
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    delegateQueue = self->_delegateQueue;
    uint64_t v12 = MEMORY[0x263EF8330];
    uint64_t v13 = 3221225472;
    uint64_t v14 = __56__UARPController_queryCompleteForAccessory_epoch_error___block_invoke;
    uint64_t v15 = &unk_264492B98;
    uint64_t v16 = self;
    id v11 = v8;
    id v17 = v11;
    unint64_t v19 = a4;
    id v18 = v9;
    dispatch_async(delegateQueue, &v12);
    objc_msgSend(v11, "removePendingClientPropertyQuery:", 22, v12, v13, v14, v15, v16);
  }
}

uint64_t __56__UARPController_queryCompleteForAccessory_epoch_error___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 80) queryCompleteForAccessory:a1[5] epoch:a1[7] error:a1[6]];
}

- (void)queryCompleteForAccessory:(id)a3 enableMixMatch:(BOOL)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if ([v8 clientQueryPendingForProperty:23]
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    delegateQueue = self->_delegateQueue;
    uint64_t v12 = MEMORY[0x263EF8330];
    uint64_t v13 = 3221225472;
    uint64_t v14 = __65__UARPController_queryCompleteForAccessory_enableMixMatch_error___block_invoke;
    uint64_t v15 = &unk_264492C60;
    uint64_t v16 = self;
    id v11 = v8;
    id v17 = v11;
    BOOL v19 = a4;
    id v18 = v9;
    dispatch_async(delegateQueue, &v12);
    objc_msgSend(v11, "removePendingClientPropertyQuery:", 23, v12, v13, v14, v15, v16);
  }
}

uint64_t __65__UARPController_queryCompleteForAccessory_enableMixMatch_error___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 80) queryCompleteForAccessory:*(void *)(a1 + 40) enableMixMatch:*(unsigned __int8 *)(a1 + 56) error:*(void *)(a1 + 48)];
}

- (void)queryCompleteForAccessory:(id)a3 liveNonce:(BOOL)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if ([v8 clientQueryPendingForProperty:24]
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    delegateQueue = self->_delegateQueue;
    uint64_t v12 = MEMORY[0x263EF8330];
    uint64_t v13 = 3221225472;
    uint64_t v14 = __60__UARPController_queryCompleteForAccessory_liveNonce_error___block_invoke;
    uint64_t v15 = &unk_264492C60;
    uint64_t v16 = self;
    id v11 = v8;
    id v17 = v11;
    BOOL v19 = a4;
    id v18 = v9;
    dispatch_async(delegateQueue, &v12);
    objc_msgSend(v11, "removePendingClientPropertyQuery:", 24, v12, v13, v14, v15, v16);
  }
}

uint64_t __60__UARPController_queryCompleteForAccessory_liveNonce_error___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 80) queryCompleteForAccessory:*(void *)(a1 + 40) liveNonce:*(unsigned __int8 *)(a1 + 56) error:*(void *)(a1 + 48)];
}

- (void)queryCompleteForAccessory:(id)a3 prefixNeedsLUN:(BOOL)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if ([v8 clientQueryPendingForProperty:25]
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    delegateQueue = self->_delegateQueue;
    uint64_t v12 = MEMORY[0x263EF8330];
    uint64_t v13 = 3221225472;
    uint64_t v14 = __65__UARPController_queryCompleteForAccessory_prefixNeedsLUN_error___block_invoke;
    uint64_t v15 = &unk_264492C60;
    uint64_t v16 = self;
    id v11 = v8;
    id v17 = v11;
    BOOL v19 = a4;
    id v18 = v9;
    dispatch_async(delegateQueue, &v12);
    objc_msgSend(v11, "removePendingClientPropertyQuery:", 25, v12, v13, v14, v15, v16);
  }
}

uint64_t __65__UARPController_queryCompleteForAccessory_prefixNeedsLUN_error___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 80) queryCompleteForAccessory:*(void *)(a1 + 40) prefixNeedsLUN:*(unsigned __int8 *)(a1 + 56) error:*(void *)(a1 + 48)];
}

- (void)queryCompleteForAccessory:(id)a3 suffixNeedsLUN:(BOOL)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if ([v8 clientQueryPendingForProperty:26]
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    delegateQueue = self->_delegateQueue;
    uint64_t v12 = MEMORY[0x263EF8330];
    uint64_t v13 = 3221225472;
    uint64_t v14 = __65__UARPController_queryCompleteForAccessory_suffixNeedsLUN_error___block_invoke;
    uint64_t v15 = &unk_264492C60;
    uint64_t v16 = self;
    id v11 = v8;
    id v17 = v11;
    BOOL v19 = a4;
    id v18 = v9;
    dispatch_async(delegateQueue, &v12);
    objc_msgSend(v11, "removePendingClientPropertyQuery:", 26, v12, v13, v14, v15, v16);
  }
}

uint64_t __65__UARPController_queryCompleteForAccessory_suffixNeedsLUN_error___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 80) queryCompleteForAccessory:*(void *)(a1 + 40) suffixNeedsLUN:*(unsigned __int8 *)(a1 + 56) error:*(void *)(a1 + 48)];
}

- (void)firmwareStagingProgress:(id)a3 assetID:(id)a4 bytesSent:(unint64_t)a5 bytesTotal:(unint64_t)a6 filterProgress:(BOOL)a7
{
  id v12 = a3;
  id v13 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    int v15 = [v13 reportProgressToDelegates];

    if (v15)
    {
      delegateQueue = self->_delegateQueue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __86__UARPController_firmwareStagingProgress_assetID_bytesSent_bytesTotal_filterProgress___block_invoke;
      block[3] = &unk_264492D00;
      void block[4] = self;
      id v18 = v12;
      id v19 = v13;
      unint64_t v20 = a5;
      unint64_t v21 = a6;
      dispatch_async(delegateQueue, block);
    }
  }
  else
  {
  }
  if (!a7) {
    [(UARPControllerInternalDelegate *)self->_internalDelegate sendFirmwareUpdateProgressForAccessory:v12 assetID:v13 bytesSent:a5 bytesTotal:a6];
  }
}

void __86__UARPController_firmwareStagingProgress_assetID_bytesSent_bytesTotal_filterProgress___block_invoke(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 168));
  [WeakRetained firmwareStagingProgress:a1[5] assetID:a1[6] bytesSent:a1[7] bytesTotal:a1[8]];
}

- (void)firmwareStagingDataBlockTransferred:(id)a3 assetID:(id)a4 offset:(unsigned int)a5 blockSize:(unsigned int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v7 = *(void *)&a5;
  powerLogManager = self->_powerLogManager;
  id v9 = [a3 getID];
  [(UARPPowerLogManager *)powerLogManager updateStagingProgressForAccessoryID:v9 requestedOffset:v7 requestedLength:v6];
}

- (void)assetSolicitationProgress:(id)a3 assetID:(id)a4 bytesReceived:(unint64_t)a5 bytesTotal:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    int v13 = [v11 reportProgressToDelegates];

    if (v13)
    {
      delegateQueue = self->_delegateQueue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __77__UARPController_assetSolicitationProgress_assetID_bytesReceived_bytesTotal___block_invoke;
      block[3] = &unk_264492D00;
      void block[4] = self;
      id v16 = v10;
      id v17 = v11;
      unint64_t v18 = a5;
      unint64_t v19 = a6;
      dispatch_async(delegateQueue, block);
    }
  }
  else
  {
  }
}

void __77__UARPController_assetSolicitationProgress_assetID_bytesReceived_bytesTotal___block_invoke(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 168));
  [WeakRetained assetSolicitationProgress:a1[5] assetID:a1[6] bytesReceived:a1[7] bytesTotal:a1[8]];
}

- (id)unsolicitedDynamicAssetOffered:(id)a3 assetID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  unint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  unint64_t v20 = __Block_byref_object_copy__3;
  unint64_t v21 = __Block_byref_object_dispose__3;
  id v22 = 0;
  internalQueue = self->_internalQueue;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __57__UARPController_unsolicitedDynamicAssetOffered_assetID___block_invoke;
  v13[3] = &unk_264492C10;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v16 = &v17;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(internalQueue, v13);
  id v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v11;
}

void __57__UARPController_unsolicitedDynamicAssetOffered_assetID___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 8);
  char v3 = [*(id *)(a1 + 40) getID];
  id v4 = [v2 objectForKeyedSubscript:v3];

  if (v4)
  {
    char v5 = (void *)(a1 + 48);
    uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKey:*(void *)(a1 + 48)];
    uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
    {
      id v9 = [[UARPAsset alloc] initWithID:*(void *)(a1 + 48)];
      uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
      id v11 = *(void **)(v10 + 40);
      *(void *)(v10 + 40) = v9;

      uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      uint64_t v13 = *(void *)(a1 + 32);
      if (v12)
      {
        [*(id *)(v13 + 16) setObject:v12 forKey:*v5];
      }
      else
      {
        id v14 = *(NSObject **)(v13 + 24);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          __46__UARPController_solicitDynamicAsset_assetID___block_invoke_cold_1((uint64_t)v5, v14);
        }
      }
    }
  }
}

- (void)accessoryTransportNeeded:(id)a3 isNeeded:(BOOL)a4
{
  id v6 = a3;
  if (os_log_type_enabled((os_log_t)self->_xpcLog, OS_LOG_TYPE_ERROR)) {
    -[UARPController accessoryTransportNeeded:isNeeded:]();
  }
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__UARPController_accessoryTransportNeeded_isNeeded___block_invoke;
  block[3] = &unk_264492B20;
  void block[4] = self;
  id v10 = v6;
  BOOL v11 = a4;
  id v8 = v6;
  dispatch_sync(internalQueue, block);
}

void __52__UARPController_accessoryTransportNeeded_isNeeded___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 8);
  char v3 = [*(id *)(a1 + 40) getID];
  id v4 = [v2 objectForKeyedSubscript:v3];

  if (v4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 168));
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      uint64_t v7 = *(void *)(a1 + 32);
      id v8 = *(NSObject **)(v7 + 48);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __52__UARPController_accessoryTransportNeeded_isNeeded___block_invoke_2;
      block[3] = &unk_264492B20;
      void block[4] = v7;
      id v10 = *(id *)(a1 + 40);
      char v11 = *(unsigned char *)(a1 + 48);
      dispatch_async(v8, block);
    }
  }
}

void __52__UARPController_accessoryTransportNeeded_isNeeded___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 168));
  [WeakRetained accessoryTransportNeeded:*(void *)(a1 + 40) isNeeded:*(unsigned __int8 *)(a1 + 48)];
}

- (BOOL)addAccessory:(id)a3 assetID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  internalQueue = self->_internalQueue;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __39__UARPController_addAccessory_assetID___block_invoke;
  v12[3] = &unk_264492D28;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v15 = &v16;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(internalQueue, v12);
  LOBYTE(internalQueue) = *((unsigned char *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  return (char)internalQueue;
}

void __39__UARPController_addAccessory_assetID___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(*(void *)(a1 + 32) + 72) addAccessory:*(void *)(a1 + 40) assetID:*(void *)(a1 + 48)];
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    uint64_t v2 = *(void **)(a1 + 40);
    char v3 = *(void **)(*(void *)(a1 + 32) + 8);
    id v4 = [v2 getID];
    [v3 setObject:v2 forKeyedSubscript:v4];

    if ([*(id *)(*(void *)(a1 + 32) + 72) useAssetAvailabilityNotifications])
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(a1 + 32) registerForAssetAvailabilityNotification:*(void *)(a1 + 40)];
      if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
        [*(id *)(a1 + 32) removeAccessory:*(void *)(a1 + 40)];
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(a1 + 32) registerForSupplementalAssetAvailabilityNotification:*(void *)(a1 + 40)];
      if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
        [*(id *)(a1 + 32) removeAccessory:*(void *)(a1 + 40)];
      }
    }
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    char v5 = [*(id *)(a1 + 40) bsdNotifications];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v23 count:16];
    if (v6)
    {
      uint64_t v8 = v6;
      uint64_t v9 = *(void *)v18;
      *(void *)&long long v7 = 138412290;
      long long v16 = v7;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v18 != v9) {
            objc_enumerationMutation(v5);
          }
          uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * i);
          uint64_t v12 = *(NSObject **)(*(void *)(a1 + 32) + 32);
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v16;
            uint64_t v22 = v11;
            _os_log_debug_impl(&dword_21E079000, v12, OS_LOG_TYPE_DEBUG, "registering bsd notification; %@", buf, 0xCu);
          }
          objc_msgSend(*(id *)(a1 + 32), "registerForGenericNotification:notificationName:", *(void *)(a1 + 40), v11, v16);
        }
        uint64_t v8 = [v5 countByEnumeratingWithState:&v17 objects:v23 count:16];
      }
      while (v8);
    }

    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
    {
      id v13 = *(void **)(a1 + 40);
      id v14 = *(void **)(*(void *)(a1 + 32) + 144);
      id v15 = [v13 getID];
      [v14 addAccessoryID:v15];
    }
  }
}

- (BOOL)removeAccessory:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __34__UARPController_removeAccessory___block_invoke;
  block[3] = &unk_264492AD0;
  id v9 = v4;
  id v10 = &v11;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(internalQueue, block);
  LOBYTE(internalQueue) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)internalQueue;
}

void __34__UARPController_removeAccessory___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(*(void *)(a1 + 32) + 72) removeAccessory:*(void *)(a1 + 40)];
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    [*(id *)(a1 + 32) accessoryUnreachableInternal:*(void *)(a1 + 40)];
    uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 8);
    char v3 = [*(id *)(a1 + 40) getID];
    [v2 removeObjectForKey:v3];

    [*(id *)(a1 + 32) unregisterForAssetAvailabilityNotification:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) unregisterForSupplementalAssetAvailabilityNotification:*(void *)(a1 + 40)];
    id v4 = *(void **)(a1 + 40);
    char v5 = *(void **)(*(void *)(a1 + 32) + 144);
    id v6 = [v4 getID];
    [v5 removeAccessoryID:v6];
  }
}

- (BOOL)changeAssetLocation:(id)a3 assetID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0;
  long long v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  internalQueue = self->_internalQueue;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __46__UARPController_changeAssetLocation_assetID___block_invoke;
  v12[3] = &unk_264492D28;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v15 = &v16;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(internalQueue, v12);
  LOBYTE(internalQueue) = *((unsigned char *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  return (char)internalQueue;
}

uint64_t __46__UARPController_changeAssetLocation_assetID___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 72) changeAssetLocation:a1[5] assetID:a1[6]];
  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = result;
  return result;
}

- (BOOL)requestConsent:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __33__UARPController_requestConsent___block_invoke;
  block[3] = &unk_264492AD0;
  id v9 = v4;
  id v10 = &v11;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(internalQueue, block);
  LOBYTE(internalQueue) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)internalQueue;
}

uint64_t __33__UARPController_requestConsent___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 72) requestConsent:a1[5]];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = result;
  return result;
}

- (BOOL)revokeConsentRequest:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__UARPController_revokeConsentRequest___block_invoke;
  block[3] = &unk_264492AD0;
  id v9 = v4;
  id v10 = &v11;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(internalQueue, block);
  LOBYTE(internalQueue) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)internalQueue;
}

uint64_t __39__UARPController_revokeConsentRequest___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 72) revokeConsentRequest:a1[5]];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = result;
  return result;
}

- (BOOL)pauseAssetTransfersForAccessory:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__UARPController_pauseAssetTransfersForAccessory___block_invoke;
  block[3] = &unk_2644926C8;
  void block[4] = self;
  id v9 = v4;
  id v10 = &v11;
  id v6 = v4;
  dispatch_sync(internalQueue, block);
  LOBYTE(internalQueue) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)internalQueue;
}

void __50__UARPController_pauseAssetTransfersForAccessory___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 8);
  char v3 = [*(id *)(a1 + 40) getID];
  id v5 = [v2 objectForKeyedSubscript:v3];

  id v4 = v5;
  if (v5)
  {
    if ([v5 assetTransfersPaused])
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    }
    else
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(*(void *)(a1 + 32) + 64) pauseAssetTransfersForAccessory:*(void *)(a1 + 40)];
      id v4 = v5;
      if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        goto LABEL_7;
      }
      [v5 setAssetTransfersPaused:1];
    }
    id v4 = v5;
  }
LABEL_7:
}

- (BOOL)resumeAssetTransfersForAccessory:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__UARPController_resumeAssetTransfersForAccessory___block_invoke;
  block[3] = &unk_2644926C8;
  void block[4] = self;
  id v9 = v4;
  id v10 = &v11;
  id v6 = v4;
  dispatch_sync(internalQueue, block);
  LOBYTE(internalQueue) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)internalQueue;
}

void __51__UARPController_resumeAssetTransfersForAccessory___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 8);
  char v3 = [*(id *)(a1 + 40) getID];
  id v5 = [v2 objectForKeyedSubscript:v3];

  id v4 = v5;
  if (v5)
  {
    if ([v5 assetTransfersPaused])
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(*(void *)(a1 + 32) + 64) resumeAssetTransfersForAccessory:*(void *)(a1 + 40)];
      id v4 = v5;
      if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        goto LABEL_7;
      }
      [v5 setAssetTransfersPaused:0];
    }
    else
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    }
    id v4 = v5;
  }
LABEL_7:
}

- (BOOL)downloadAvailableFirmwareUpdate:(id)a3 assetID:(id)a4 withUserIntent:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v19 = 0;
  long long v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __73__UARPController_downloadAvailableFirmwareUpdate_assetID_withUserIntent___block_invoke;
  block[3] = &unk_264492D50;
  void block[4] = self;
  id v15 = v8;
  id v16 = v9;
  long long v17 = &v19;
  BOOL v18 = a5;
  id v11 = v9;
  id v12 = v8;
  dispatch_sync(internalQueue, block);
  LOBYTE(internalQueue) = *((unsigned char *)v20 + 24);

  _Block_object_dispose(&v19, 8);
  return (char)internalQueue;
}

uint64_t __73__UARPController_downloadAvailableFirmwareUpdate_assetID_withUserIntent___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 72) downloadAvailableFirmwareUpdate:*(void *)(a1 + 40) assetID:*(void *)(a1 + 48) withUserIntent:*(unsigned __int8 *)(a1 + 64)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = result;
  return result;
}

- (BOOL)downloadReleaseNotes:(id)a3 assetID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0;
  long long v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  internalQueue = self->_internalQueue;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __47__UARPController_downloadReleaseNotes_assetID___block_invoke;
  v12[3] = &unk_264492D28;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v15 = &v16;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(internalQueue, v12);
  LOBYTE(internalQueue) = *((unsigned char *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  return (char)internalQueue;
}

uint64_t __47__UARPController_downloadReleaseNotes_assetID___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 72) downloadReleaseNotes:a1[5] assetID:a1[6]];
  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = result;
  return result;
}

- (void)sendFirmwareUpdateProgressForAccessory:(id)a3 assetID:(id)a4 bytesSent:(unint64_t)a5 bytesTotal:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __86__UARPController_sendFirmwareUpdateProgressForAccessory_assetID_bytesSent_bytesTotal___block_invoke;
  block[3] = &unk_264492D00;
  void block[4] = self;
  id v16 = v10;
  id v17 = v11;
  unint64_t v18 = a5;
  unint64_t v19 = a6;
  id v13 = v11;
  id v14 = v10;
  dispatch_sync(internalQueue, block);
}

uint64_t __86__UARPController_sendFirmwareUpdateProgressForAccessory_assetID_bytesSent_bytesTotal___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 72) sendFirmwareUpdateProgressForAccessory:a1[5] assetID:a1[6] bytesSent:a1[7] bytesTotal:a1[8]];
}

- (void)sendFirmwareUpdateProgressForUARPConsent:(id)a3 bytesSent:(unint64_t)a4 bytesTotal:(unint64_t)a5
{
  id v8 = a3;
  internalQueue = self->_internalQueue;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __80__UARPController_sendFirmwareUpdateProgressForUARPConsent_bytesSent_bytesTotal___block_invoke;
  v11[3] = &unk_264492D78;
  v11[4] = self;
  id v12 = v8;
  unint64_t v13 = a4;
  unint64_t v14 = a5;
  id v10 = v8;
  dispatch_sync(internalQueue, v11);
}

uint64_t __80__UARPController_sendFirmwareUpdateProgressForUARPConsent_bytesSent_bytesTotal___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 72) sendFirmwareUpdateProgressForUARPConsent:a1[5] bytesSent:a1[6] bytesTotal:a1[7]];
}

- (void)progressForUARPConsent:(id)a3 bytesSent:(unint64_t)a4 bytesTotal:(unint64_t)a5
{
  id v8 = a3;
  internalQueue = self->_internalQueue;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __62__UARPController_progressForUARPConsent_bytesSent_bytesTotal___block_invoke;
  v11[3] = &unk_264492D78;
  v11[4] = self;
  id v12 = v8;
  unint64_t v13 = a4;
  unint64_t v14 = a5;
  id v10 = v8;
  dispatch_sync(internalQueue, v11);
}

uint64_t __62__UARPController_progressForUARPConsent_bytesSent_bytesTotal___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 72) progressForUARPConsent:a1[5] bytesSent:a1[6] bytesTotal:a1[7]];
}

- (void)progressForUARPConsentInPostLogout:(id)a3 bytesSent:(unint64_t)a4 bytesTotal:(unint64_t)a5
{
  id v8 = a3;
  internalQueue = self->_internalQueue;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __74__UARPController_progressForUARPConsentInPostLogout_bytesSent_bytesTotal___block_invoke;
  v11[3] = &unk_264492D78;
  v11[4] = self;
  id v12 = v8;
  unint64_t v13 = a4;
  unint64_t v14 = a5;
  id v10 = v8;
  dispatch_sync(internalQueue, v11);
}

uint64_t __74__UARPController_progressForUARPConsentInPostLogout_bytesSent_bytesTotal___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 72) progressForUARPConsentInPostLogout:a1[5] bytesSent:a1[6] bytesTotal:a1[7]];
}

- (BOOL)enableTRMSystemAuthenticationForRegistryEntryID:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __66__UARPController_enableTRMSystemAuthenticationForRegistryEntryID___block_invoke;
  block[3] = &unk_264492AD0;
  id v9 = v4;
  id v10 = &v11;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(internalQueue, block);
  LOBYTE(internalQueue) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)internalQueue;
}

uint64_t __66__UARPController_enableTRMSystemAuthenticationForRegistryEntryID___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 72) enableTRMSystemAuthenticationForRegistryEntryID:a1[5]];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = result;
  return result;
}

- (BOOL)disableTRMSystemAuthenticationForRegistryEntryID:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __67__UARPController_disableTRMSystemAuthenticationForRegistryEntryID___block_invoke;
  block[3] = &unk_264492AD0;
  id v9 = v4;
  id v10 = &v11;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(internalQueue, block);
  LOBYTE(internalQueue) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)internalQueue;
}

uint64_t __67__UARPController_disableTRMSystemAuthenticationForRegistryEntryID___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 72) disableTRMSystemAuthenticationForRegistryEntryID:a1[5]];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = result;
  return result;
}

- (BOOL)checkForUpdate:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __33__UARPController_checkForUpdate___block_invoke;
  block[3] = &unk_264492AD0;
  id v9 = v4;
  id v10 = &v11;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(internalQueue, block);
  LOBYTE(internalQueue) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)internalQueue;
}

uint64_t __33__UARPController_checkForUpdate___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 72) checkForUpdate:a1[5]];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = result;
  return result;
}

- (void)sendUpdateFirmwareAnalyticsEventForAccessoryID:(id)a3 assetID:(id)a4 params:(id)a5
{
}

- (BOOL)getSupportedAccessoriesInternal:(id)a3 assetID:(id)a4 batchRequest:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v19 = 0;
  long long v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __71__UARPController_getSupportedAccessoriesInternal_assetID_batchRequest___block_invoke;
  block[3] = &unk_264492D50;
  void block[4] = self;
  id v15 = v8;
  id v16 = v9;
  id v17 = &v19;
  BOOL v18 = a5;
  id v11 = v9;
  id v12 = v8;
  dispatch_sync(internalQueue, block);
  LOBYTE(internalQueue) = *((unsigned char *)v20 + 24);

  _Block_object_dispose(&v19, 8);
  return (char)internalQueue;
}

void __71__UARPController_getSupportedAccessoriesInternal_assetID_batchRequest___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 72);
  char v3 = [*(id *)(a1 + 40) identifier];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v2 getSupportedAccessories:v3 assetID:*(void *)(a1 + 48) batchRequest:*(unsigned __int8 *)(a1 + 64)];

  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    if ([*(id *)(*(void *)(a1 + 32) + 72) useAssetAvailabilityNotifications])
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(a1 + 32) registerForSupportedAccessoriesAvailability:*(void *)(a1 + 40)];
      if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)
        && os_log_type_enabled(*(os_log_t *)(*(void *)(a1 + 32) + 32), OS_LOG_TYPE_ERROR))
      {
        __71__UARPController_getSupportedAccessoriesInternal_assetID_batchRequest___block_invoke_cold_1();
      }
    }
  }
}

- (BOOL)getSupportedAccessories:(id)a3 assetLocationType:(int64_t)a4
{
  id v6 = a3;
  id v7 = [[UARPAssetID alloc] initWithLocationType:a4 remoteURL:0];
  LOBYTE(self) = [(UARPController *)self getSupportedAccessoriesInternal:v6 assetID:v7 batchRequest:0];

  return (char)self;
}

- (BOOL)getBatchedSupportedAccessories:(id)a3 assetLocationType:(int64_t)a4
{
  id v6 = a3;
  id v7 = [[UARPAssetID alloc] initWithLocationType:a4 remoteURL:0];
  LOBYTE(self) = [(UARPController *)self getSupportedAccessoriesInternal:v6 assetID:v7 batchRequest:1];

  return (char)self;
}

- (BOOL)getAttestationCertificatesInternal:(id)a3 assetID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  internalQueue = self->_internalQueue;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __61__UARPController_getAttestationCertificatesInternal_assetID___block_invoke;
  v12[3] = &unk_264492D28;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v15 = &v16;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(internalQueue, v12);
  LOBYTE(internalQueue) = *((unsigned char *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  return (char)internalQueue;
}

void __61__UARPController_getAttestationCertificatesInternal_assetID___block_invoke(uint64_t a1)
{
  uint64_t v2 = a1 + 40;
  *(unsigned char *)(*(void *)(*(void *)(v2 + 16) + 8) + 24) = [*(id *)(*(void *)(a1 + 32) + 72) getAttestationCertificates:*(void *)(a1 + 40) assetID:*(void *)(a1 + 48)];
  if (*(unsigned char *)(*(void *)(*(void *)(v2 + 16) + 8) + 24))
  {
    if ([*(id *)(*(void *)(a1 + 32) + 72) useAssetAvailabilityNotifications])
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(a1 + 32) registerForAttestationCertificatesAvailability:*(void *)(a1 + 40)];
      if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)
        && os_log_type_enabled(*(os_log_t *)(*(void *)(a1 + 32) + 32), OS_LOG_TYPE_ERROR))
      {
        __61__UARPController_getAttestationCertificatesInternal_assetID___block_invoke_cold_1();
      }
    }
  }
}

- (BOOL)getAttestationCertificates:(id)a3 assetLocationType:(int64_t)a4
{
  id v6 = a3;
  id v7 = [[UARPAssetID alloc] initWithLocationType:a4 remoteURL:0];
  LOBYTE(self) = [(UARPController *)self getAttestationCertificatesInternal:v6 assetID:v7];

  return (char)self;
}

- (void)assetAvailabilityNotificationPosted:(int)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  assetAvailabilityNotificationTokenDict = self->_assetAvailabilityNotificationTokenDict;
  id v5 = objc_msgSend(NSNumber, "numberWithInt:");
  id v6 = [(NSMutableDictionary *)assetAvailabilityNotificationTokenDict objectForKeyedSubscript:v5];

  controllerLog = self->_controllerLog;
  if (v6)
  {
    if (os_log_type_enabled(controllerLog, OS_LOG_TYPE_INFO))
    {
      int v11 = 136315394;
      id v12 = "-[UARPController assetAvailabilityNotificationPosted:]";
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_impl(&dword_21E079000, controllerLog, OS_LOG_TYPE_INFO, "%s: Asset availability notification for %@", (uint8_t *)&v11, 0x16u);
    }
    internalDelegate = self->_internalDelegate;
    id v9 = [v6 getID];
    id v10 = [(UARPControllerInternalDelegate *)internalDelegate getAssetIDForAccessoryID:v9];

    if (v10)
    {
      [(UARPController *)self assetAvailablityUpdateForAccessory:v6 assetID:v10];
    }
    else if (os_log_type_enabled((os_log_t)self->_controllerLog, OS_LOG_TYPE_ERROR))
    {
      -[UARPController assetAvailabilityNotificationPosted:]();
    }
  }
  else if (os_log_type_enabled(controllerLog, OS_LOG_TYPE_ERROR))
  {
    -[UARPController assetAvailabilityNotificationPosted:]();
  }
}

- (BOOL)registerForAssetAvailabilityNotification:(id)a3
{
  id v4 = a3;
  int out_token = -1;
  id v5 = [v4 getID];
  id v6 = (const char *)[v5 assetAvailabilityUpdateNotification];

  objc_initWeak(&location, self);
  internalQueue = self->_internalQueue;
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __59__UARPController_registerForAssetAvailabilityNotification___block_invoke;
  handler[3] = &unk_264492DA0;
  objc_copyWeak(&v13, &location);
  uint32_t v8 = notify_register_dispatch(v6, &out_token, internalQueue, handler);
  if (v8)
  {
    if (os_log_type_enabled((os_log_t)self->_controllerLog, OS_LOG_TYPE_ERROR)) {
      -[UARPController registerForAssetAvailabilityNotification:]();
    }
  }
  else
  {
    assetAvailabilityNotificationTokenDict = self->_assetAvailabilityNotificationTokenDict;
    id v10 = [NSNumber numberWithInt:out_token];
    [(NSMutableDictionary *)assetAvailabilityNotificationTokenDict setObject:v4 forKeyedSubscript:v10];
  }
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

  return v8 == 0;
}

void __59__UARPController_registerForAssetAvailabilityNotification___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained assetAvailabilityNotificationPosted:a2];
}

- (void)availabilityNotificationForSupportedAccessoriesPosted:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v17 = *MEMORY[0x263EF8340];
  assetAvailabilityUARPProductGroupNotificationTokenDict = self->_assetAvailabilityUARPProductGroupNotificationTokenDict;
  id v6 = objc_msgSend(NSNumber, "numberWithInt:");
  id v7 = [(NSMutableDictionary *)assetAvailabilityUARPProductGroupNotificationTokenDict objectForKeyedSubscript:v6];

  controllerLog = self->_controllerLog;
  if (os_log_type_enabled(controllerLog, OS_LOG_TYPE_INFO))
  {
    int v13 = 136315394;
    id v14 = "-[UARPController availabilityNotificationForSupportedAccessoriesPosted:]";
    __int16 v15 = 2112;
    uint64_t v16 = v7;
    _os_log_impl(&dword_21E079000, controllerLog, OS_LOG_TYPE_INFO, "%s: availability notification for supported accessories for productGroup %@", (uint8_t *)&v13, 0x16u);
  }
  id v9 = [MEMORY[0x263EFF9C0] set];
  internalDelegate = self->_internalDelegate;
  int v11 = [v7 identifier];
  uint64_t v12 = [(UARPControllerInternalDelegate *)internalDelegate getSupportedAccessories:v9 forProductGroup:v11];

  [(UARPController *)self supportedAccessories:v9 forProductGroup:v7 isComplete:v12];
  if (v12) {
    [(UARPController *)self unregisterForSupportedAccessoriesAvailability:v3];
  }
}

- (BOOL)registerForSupportedAccessoriesAvailability:(id)a3
{
  id v4 = a3;
  int out_token = -1;
  id v5 = [v4 identifier];

  id v6 = NSString;
  if (v5)
  {
    id v7 = [v4 identifier];
    uint32_t v8 = [v6 stringWithFormat:@"%@-%@", @"com.apple.accessoryUpdater.uarp.supportedAccessoriesMetadataAvailable", v7];
  }
  else
  {
    uint32_t v8 = [NSString stringWithFormat:@"%@", @"com.apple.accessoryUpdater.uarp.supportedAccessoriesMetadataAvailable"];
  }
  objc_initWeak(&location, self);
  id v9 = v8;
  id v10 = (const char *)[v9 UTF8String];
  internalQueue = self->_internalQueue;
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __62__UARPController_registerForSupportedAccessoriesAvailability___block_invoke;
  handler[3] = &unk_264492DA0;
  objc_copyWeak(&v17, &location);
  uint32_t v12 = notify_register_dispatch(v10, &out_token, internalQueue, handler);
  if (v12)
  {
    if (os_log_type_enabled((os_log_t)self->_controllerLog, OS_LOG_TYPE_ERROR)) {
      -[UARPController registerForSupportedAccessoriesAvailability:]();
    }
  }
  else if (v4)
  {
    assetAvailabilityUARPProductGroupNotificationTokenDict = self->_assetAvailabilityUARPProductGroupNotificationTokenDict;
    id v14 = [NSNumber numberWithInt:out_token];
    [(NSMutableDictionary *)assetAvailabilityUARPProductGroupNotificationTokenDict setObject:v4 forKeyedSubscript:v14];
  }
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

  return v12 == 0;
}

void __62__UARPController_registerForSupportedAccessoriesAvailability___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained availabilityNotificationForSupportedAccessoriesPosted:a2];
}

- (id)assetAvailabilityTokenForAccessory:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = self->_assetAvailabilityNotificationTokenDict;
  uint64_t v6 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint32_t v8 = 0;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v5);
        }
        int v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint32_t v12 = -[NSMutableDictionary objectForKeyedSubscript:](self->_assetAvailabilityNotificationTokenDict, "objectForKeyedSubscript:", v11, (void)v15);
        if ([v4 isEqual:v12])
        {
          id v13 = v11;

          uint32_t v8 = v13;
        }
      }
      uint64_t v7 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }
  else
  {
    uint32_t v8 = 0;
  }

  return v8;
}

- (void)unregisterForAssetAvailabilityNotification:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(UARPController *)self assetAvailabilityTokenForAccessory:v4];
  uint64_t v6 = v5;
  if (v5)
  {
    notify_cancel([v5 intValue]);
    [(NSMutableDictionary *)self->_assetAvailabilityNotificationTokenDict removeObjectForKey:v6];
    controllerLog = self->_controllerLog;
    if (os_log_type_enabled(controllerLog, OS_LOG_TYPE_INFO))
    {
      int v8 = 136315394;
      uint64_t v9 = "-[UARPController unregisterForAssetAvailabilityNotification:]";
      __int16 v10 = 2112;
      id v11 = v4;
      _os_log_impl(&dword_21E079000, controllerLog, OS_LOG_TYPE_INFO, "%s: unregistered %@", (uint8_t *)&v8, 0x16u);
    }
  }
}

- (void)unregisterForSupportedAccessoriesAvailability:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v10 = *MEMORY[0x263EF8340];
  notify_cancel(a3);
  assetAvailabilityUARPProductGroupNotificationTokenDict = self->_assetAvailabilityUARPProductGroupNotificationTokenDict;
  uint64_t v6 = [NSNumber numberWithInt:v3];
  [(NSMutableDictionary *)assetAvailabilityUARPProductGroupNotificationTokenDict removeObjectForKey:v6];

  controllerLog = self->_controllerLog;
  if (os_log_type_enabled(controllerLog, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315138;
    uint64_t v9 = "-[UARPController unregisterForSupportedAccessoriesAvailability:]";
    _os_log_impl(&dword_21E079000, controllerLog, OS_LOG_TYPE_DEFAULT, "%s: unregistered for SupportedAccessoriesAvailability", (uint8_t *)&v8, 0xCu);
  }
}

- (void)unregisterForAllAssetAvailabilityNotifications
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v3 = self->_assetAvailabilityNotificationTokenDict;
  uint64_t v4 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v18;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(v3);
        }
        notify_cancel([*(id *)(*((void *)&v17 + 1) + 8 * v7++) intValue]);
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v5);
  }

  [(NSMutableDictionary *)self->_assetAvailabilityNotificationTokenDict removeAllObjects];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  int v8 = self->_assetAvailabilityUARPProductGroupNotificationTokenDict;
  uint64_t v9 = [(NSMutableDictionary *)v8 countByEnumeratingWithState:&v13 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        notify_cancel(objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v12++), "intValue", (void)v13));
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableDictionary *)v8 countByEnumeratingWithState:&v13 objects:v21 count:16];
    }
    while (v10);
  }

  [(NSMutableDictionary *)self->_assetAvailabilityUARPProductGroupNotificationTokenDict removeAllObjects];
}

- (void)supplementalAssetAvailabilityNotificationPosted:(int)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  supplementalAssetAvailabilityNotificationTokenDict = self->_supplementalAssetAvailabilityNotificationTokenDict;
  uint64_t v5 = objc_msgSend(NSNumber, "numberWithInt:");
  uint64_t v6 = [(NSMutableDictionary *)supplementalAssetAvailabilityNotificationTokenDict objectForKeyedSubscript:v5];

  controllerLog = self->_controllerLog;
  if (v6)
  {
    if (os_log_type_enabled(controllerLog, OS_LOG_TYPE_INFO))
    {
      int v11 = 136315394;
      uint64_t v12 = "-[UARPController supplementalAssetAvailabilityNotificationPosted:]";
      __int16 v13 = 2112;
      long long v14 = v6;
      _os_log_impl(&dword_21E079000, controllerLog, OS_LOG_TYPE_INFO, "%s: Supplemental Asset availability notification for %@", (uint8_t *)&v11, 0x16u);
    }
    internalDelegate = self->_internalDelegate;
    uint64_t v9 = [v6 getID];
    uint64_t v10 = [(UARPControllerInternalDelegate *)internalDelegate getSupplementalAssetNameForAccessoryID:v9];

    if (v10)
    {
      [(UARPController *)self supplementalAssetAvailablityUpdateForAccessory:v6 assetName:v10];
    }
    else if (os_log_type_enabled((os_log_t)self->_controllerLog, OS_LOG_TYPE_ERROR))
    {
      -[UARPController supplementalAssetAvailabilityNotificationPosted:]();
    }
  }
  else if (os_log_type_enabled(controllerLog, OS_LOG_TYPE_ERROR))
  {
    -[UARPController supplementalAssetAvailabilityNotificationPosted:]();
  }
}

- (BOOL)registerForSupplementalAssetAvailabilityNotification:(id)a3
{
  id v4 = a3;
  int out_token = -1;
  uint64_t v5 = [v4 getID];
  uint64_t v6 = (const char *)[v5 supplementalAssetAvailabilityUpdateNotification];

  objc_initWeak(&location, self);
  internalQueue = self->_internalQueue;
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __71__UARPController_registerForSupplementalAssetAvailabilityNotification___block_invoke;
  handler[3] = &unk_264492DA0;
  objc_copyWeak(&v13, &location);
  uint32_t v8 = notify_register_dispatch(v6, &out_token, internalQueue, handler);
  if (v8)
  {
    if (os_log_type_enabled((os_log_t)self->_controllerLog, OS_LOG_TYPE_ERROR)) {
      -[UARPController registerForAssetAvailabilityNotification:]();
    }
  }
  else
  {
    supplementalAssetAvailabilityNotificationTokenDict = self->_supplementalAssetAvailabilityNotificationTokenDict;
    uint64_t v10 = [NSNumber numberWithInt:out_token];
    [(NSMutableDictionary *)supplementalAssetAvailabilityNotificationTokenDict setObject:v4 forKeyedSubscript:v10];
  }
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

  return v8 == 0;
}

void __71__UARPController_registerForSupplementalAssetAvailabilityNotification___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained supplementalAssetAvailabilityNotificationPosted:a2];
}

- (id)supplementalAssetAvailabilityTokenForAccessory:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v5 = self->_supplementalAssetAvailabilityNotificationTokenDict;
  uint64_t v6 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint32_t v8 = 0;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v5);
        }
        int v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v12 = -[NSMutableDictionary objectForKeyedSubscript:](self->_supplementalAssetAvailabilityNotificationTokenDict, "objectForKeyedSubscript:", v11, (void)v15);
        if ([v4 isEqual:v12])
        {
          id v13 = v11;

          uint32_t v8 = v13;
        }
      }
      uint64_t v7 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }
  else
  {
    uint32_t v8 = 0;
  }

  return v8;
}

- (void)unregisterForSupplementalAssetAvailabilityNotification:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(UARPController *)self supplementalAssetAvailabilityTokenForAccessory:v4];
  uint64_t v6 = v5;
  if (v5)
  {
    notify_cancel([v5 intValue]);
    [(NSMutableDictionary *)self->_supplementalAssetAvailabilityNotificationTokenDict removeObjectForKey:v6];
    controllerLog = self->_controllerLog;
    if (os_log_type_enabled(controllerLog, OS_LOG_TYPE_INFO))
    {
      int v8 = 136315394;
      uint64_t v9 = "-[UARPController unregisterForSupplementalAssetAvailabilityNotification:]";
      __int16 v10 = 2112;
      id v11 = v4;
      _os_log_impl(&dword_21E079000, controllerLog, OS_LOG_TYPE_INFO, "%s: unregistered %@", (uint8_t *)&v8, 0x16u);
    }
  }
}

- (void)unregisterForAllSupplementalAssetAvailabilityNotifications
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v3 = self->_supplementalAssetAvailabilityNotificationTokenDict;
  uint64_t v4 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
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
        notify_cancel(objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "intValue", (void)v8));
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }

  [(NSMutableDictionary *)self->_supplementalAssetAvailabilityNotificationTokenDict removeAllObjects];
}

- (void)availabilityNotificationForAttestationCertificatesPosted:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v14 = *MEMORY[0x263EF8340];
  attestationCertificatesAvailabilitySubjectKeyIdentifierNotificationTokenDict = self->_attestationCertificatesAvailabilitySubjectKeyIdentifierNotificationTokenDict;
  uint64_t v6 = objc_msgSend(NSNumber, "numberWithInt:");
  uint64_t v7 = [(NSMutableDictionary *)attestationCertificatesAvailabilitySubjectKeyIdentifierNotificationTokenDict objectForKeyedSubscript:v6];

  controllerLog = self->_controllerLog;
  if (os_log_type_enabled(controllerLog, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315394;
    long long v11 = "-[UARPController availabilityNotificationForAttestationCertificatesPosted:]";
    __int16 v12 = 2112;
    uint64_t v13 = v7;
    _os_log_impl(&dword_21E079000, controllerLog, OS_LOG_TYPE_INFO, "%s: availability notification for attestation certificates for subjectKeyIdentifier %@", (uint8_t *)&v10, 0x16u);
  }
  long long v9 = [(UARPControllerInternalDelegate *)self->_internalDelegate getAttestationCertificates:v7];
  [(UARPController *)self handleReceivedAttestationCertificates:v9 forSubjectKeyIdentifier:v7];
  [(UARPController *)self unregisterForAttestationCertificatesAvailability:v3];
}

- (BOOL)registerForAttestationCertificatesAvailability:(id)a3
{
  id v4 = a3;
  int out_token = -1;
  if (v4) {
    [NSString stringWithFormat:@"%@-%@", @"com.apple.accessoryUpdater.uarp.attestationCertificatesAvailable", v4];
  }
  else {
  uint64_t v5 = [NSString stringWithFormat:@"%@", @"com.apple.accessoryUpdater.uarp.attestationCertificatesAvailable", v13];
  }
  objc_initWeak(&location, self);
  id v6 = v5;
  uint64_t v7 = (const char *)[v6 UTF8String];
  internalQueue = self->_internalQueue;
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __65__UARPController_registerForAttestationCertificatesAvailability___block_invoke;
  handler[3] = &unk_264492DA0;
  objc_copyWeak(&v15, &location);
  uint32_t v9 = notify_register_dispatch(v7, &out_token, internalQueue, handler);
  if (v9)
  {
    if (os_log_type_enabled((os_log_t)self->_controllerLog, OS_LOG_TYPE_ERROR)) {
      -[UARPController registerForSupportedAccessoriesAvailability:]();
    }
  }
  else if (v4)
  {
    attestationCertificatesAvailabilitySubjectKeyIdentifierNotificationTokenDict = self->_attestationCertificatesAvailabilitySubjectKeyIdentifierNotificationTokenDict;
    long long v11 = [NSNumber numberWithInt:out_token];
    [(NSMutableDictionary *)attestationCertificatesAvailabilitySubjectKeyIdentifierNotificationTokenDict setObject:v4 forKeyedSubscript:v11];
  }
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  return v9 == 0;
}

void __65__UARPController_registerForAttestationCertificatesAvailability___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained availabilityNotificationForAttestationCertificatesPosted:a2];
}

- (void)unregisterForAttestationCertificatesAvailability:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v10 = *MEMORY[0x263EF8340];
  notify_cancel(a3);
  attestationCertificatesAvailabilitySubjectKeyIdentifierNotificationTokenDict = self->_attestationCertificatesAvailabilitySubjectKeyIdentifierNotificationTokenDict;
  id v6 = [NSNumber numberWithInt:v3];
  [(NSMutableDictionary *)attestationCertificatesAvailabilitySubjectKeyIdentifierNotificationTokenDict removeObjectForKey:v6];

  controllerLog = self->_controllerLog;
  if (os_log_type_enabled(controllerLog, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315138;
    uint32_t v9 = "-[UARPController unregisterForAttestationCertificatesAvailability:]";
    _os_log_impl(&dword_21E079000, controllerLog, OS_LOG_TYPE_DEFAULT, "%s: unregistered for AttestationCertificatesAvailability", (uint8_t *)&v8, 0xCu);
  }
}

- (void)unregisterForAllAttestationCertificatesAvailabilityNotifications
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v3 = self->_attestationCertificatesAvailabilitySubjectKeyIdentifierNotificationTokenDict;
  uint64_t v4 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
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
        notify_cancel(objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "intValue", (void)v8));
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }

  [(NSMutableDictionary *)self->_attestationCertificatesAvailabilitySubjectKeyIdentifierNotificationTokenDict removeAllObjects];
}

- (BOOL)registerForGenericNotification:(id)a3 notificationName:(id)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  controllerLog = self->_controllerLog;
  if (os_log_type_enabled(controllerLog, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v33 = v7;
    _os_log_impl(&dword_21E079000, controllerLog, OS_LOG_TYPE_INFO, "Registering for BSD notification %@", buf, 0xCu);
  }
  [(NSMutableDictionary *)self->_generalNotificationTokenDict allValues];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = [v9 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v28;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v28 != v11) {
          objc_enumerationMutation(v9);
        }
        if ([*(id *)(*((void *)&v27 + 1) + 8 * i) isEqualToString:v7])
        {
          long long v19 = self->_controllerLog;
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            id v33 = v7;
            _os_log_impl(&dword_21E079000, v19, OS_LOG_TYPE_INFO, "Already registered for notification %@", buf, 0xCu);
          }

          BOOL v17 = 1;
          goto LABEL_21;
        }
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  int out_token = -1;
  objc_initWeak(&location, self);
  id v13 = v7;
  uint64_t v14 = (const char *)[v13 UTF8String];
  internalQueue = self->_internalQueue;
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __66__UARPController_registerForGenericNotification_notificationName___block_invoke;
  handler[3] = &unk_264492DA0;
  objc_copyWeak(&v24, &location);
  uint32_t v16 = notify_register_dispatch(v14, &out_token, internalQueue, handler);
  BOOL v17 = v16 == 0;
  long long v18 = self->_controllerLog;
  if (v16)
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[UARPController registerForSupportedAccessoriesAvailability:]();
    }
  }
  else
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v33 = v13;
      _os_log_impl(&dword_21E079000, v18, OS_LOG_TYPE_INFO, "Registered for BSD notification %@", buf, 0xCu);
    }
    generalNotificationTokenDict = self->_generalNotificationTokenDict;
    uint64_t v21 = [NSNumber numberWithInt:out_token];
    [(NSMutableDictionary *)generalNotificationTokenDict setObject:v13 forKeyedSubscript:v21];
  }
  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
LABEL_21:

  return v17;
}

void __66__UARPController_registerForGenericNotification_notificationName___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained genericNotificationPosted:a2];
}

- (void)genericNotificationPosted:(int)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  generalNotificationTokenDict = self->_generalNotificationTokenDict;
  uint64_t v5 = objc_msgSend(NSNumber, "numberWithInt:");
  id v6 = [(NSMutableDictionary *)generalNotificationTokenDict objectForKeyedSubscript:v5];

  controllerLog = self->_controllerLog;
  if (v6)
  {
    if (os_log_type_enabled(controllerLog, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      id v24 = "-[UARPController genericNotificationPosted:]";
      __int16 v25 = 2112;
      long long v26 = v6;
      _os_log_impl(&dword_21E079000, controllerLog, OS_LOG_TYPE_INFO, "%s: Notification posted %@", buf, 0x16u);
    }
    long long v8 = [(NSMutableDictionary *)self->_accessories allValues];
    id v9 = (void *)[v8 copy];

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v10 = v9;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v10);
          }
          id v15 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          uint32_t v16 = objc_msgSend(v15, "bsdNotifications", (void)v18);
          int v17 = [v16 containsObject:v6];

          if (v17) {
            [(UARPUploader *)self->_uploader genericNotification:v15 notificationName:v6 error:0];
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v12);
    }
  }
  else if (os_log_type_enabled(controllerLog, OS_LOG_TYPE_ERROR))
  {
    -[UARPController genericNotificationPosted:]();
  }
}

- (void)unregisterForAllGenericNotifications
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v3 = self->_generalNotificationTokenDict;
  uint64_t v4 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
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
        notify_cancel(objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "intValue", (void)v8));
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }

  [(NSMutableDictionary *)self->_generalNotificationTokenDict removeAllObjects];
}

- (BOOL)createUploader
{
  if (self->_uploader) {
    goto LABEL_6;
  }
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    uint64_t v6 = objc_loadWeakRetained((id *)p_delegate);
    uint64_t v7 = (UARPUploader *)[v6 newUploader];
    uploader = self->_uploader;
    self->_uploader = v7;
  }
  else
  {
    long long v9 = objc_alloc_init(UARPUploaderUARP);
    uint64_t v6 = self->_uploader;
    self->_uploader = &v9->super;
  }

  if ([(UARPUploader *)self->_uploader setController:self])
  {
LABEL_6:
    LOBYTE(v10) = 1;
  }
  else
  {
    controllerLog = self->_controllerLog;
    BOOL v10 = os_log_type_enabled(controllerLog, OS_LOG_TYPE_ERROR);
    if (v10)
    {
      -[UARPController createUploader](controllerLog);
      LOBYTE(v10) = 0;
    }
  }
  return v10;
}

- (BOOL)startTapToRadar:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 1;
  if ([(UARPController *)self createUploader])
  {
    internalQueue = self->_internalQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __34__UARPController_startTapToRadar___block_invoke;
    block[3] = &unk_264492DC8;
    void block[4] = self;
    BOOL v10 = &v11;
    id v9 = v4;
    dispatch_async(internalQueue, block);
    BOOL v6 = *((unsigned char *)v12 + 24) != 0;
  }
  else
  {
    BOOL v6 = 0;
  }
  _Block_object_dispose(&v11, 8);

  return v6;
}

void __34__UARPController_startTapToRadar___block_invoke(void *a1)
{
  uint64_t v2 = *(NSObject **)(a1[4] + 32);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)BOOL v6 = 0;
    _os_log_impl(&dword_21E079000, v2, OS_LOG_TYPE_INFO, "start TTR called.", v6, 2u);
  }
  uint64_t v3 = a1[4];
  id v4 = *(void **)(v3 + 64);
  if (v4)
  {
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = [v4 startTapToRadar:a1[5]];
  }
  else
  {
    char v5 = *(NSObject **)(v3 + 32);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __34__UARPController_startTapToRadar___block_invoke_cold_1(v5);
    }
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 0;
  }
}

- (void)stopTapToRadar
{
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __32__UARPController_stopTapToRadar__block_invoke;
  block[3] = &unk_264492750;
  void block[4] = self;
  dispatch_async(internalQueue, block);
}

uint64_t __32__UARPController_stopTapToRadar__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_21E079000, v2, OS_LOG_TYPE_INFO, "stop TTR called.", v4, 2u);
  }
  return [*(id *)(*(void *)(a1 + 32) + 64) stopTapToRadar];
}

- (void)startPersonalizationHelperService:(id)a3 entitlement:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  long long v8 = (OS_dispatch_queue *)dispatch_queue_create("UARPController personalization", 0);
  personalizationQueue = self->_personalizationQueue;
  self->_personalizationQueue = v8;

  BOOL v10 = [[UARPPersonalizationManager alloc] initWithMachServiceName:v7 entitlement:v6 delegate:self queue:self->_personalizationQueue];
  personalizationManager = self->_personalizationManager;
  self->_personalizationManager = v10;
}

- (id)pendingTatsuRequests
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__3;
  char v14 = __Block_byref_object_dispose__3;
  id v15 = (id)objc_opt_new();
  controllerLog = self->_controllerLog;
  if (os_log_type_enabled(controllerLog, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    int v17 = "-[UARPController pendingTatsuRequests]";
    _os_log_impl(&dword_21E079000, controllerLog, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }
  internalQueue = self->_internalQueue;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __38__UARPController_pendingTatsuRequests__block_invoke;
  v9[3] = &unk_264492650;
  void v9[4] = self;
  v9[5] = &v10;
  dispatch_sync(internalQueue, v9);
  char v5 = self->_controllerLog;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = v11[5];
    *(_DWORD *)buf = 136315394;
    int v17 = "-[UARPController pendingTatsuRequests]";
    __int16 v18 = 2112;
    uint64_t v19 = v6;
    _os_log_impl(&dword_21E079000, v5, OS_LOG_TYPE_INFO, "%s: Pending Tatsu Requests %@", buf, 0x16u);
  }
  id v7 = [MEMORY[0x263EFF8C0] arrayWithArray:v11[5]];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __38__UARPController_pendingTatsuRequests__block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    char v5 = "-[UARPController pendingTatsuRequests]_block_invoke";
    _os_log_impl(&dword_21E079000, v2, OS_LOG_TYPE_INFO, "%s: on queue", (uint8_t *)&v4, 0xCu);
  }
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 64) pendingTssRequests];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObjectsFromArray:v3];
}

- (void)tssResponse:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  controllerLog = self->_controllerLog;
  if (os_log_type_enabled(controllerLog, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v11 = "-[UARPController tssResponse:]";
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl(&dword_21E079000, controllerLog, OS_LOG_TYPE_INFO, "%s: Tatsu Response, %@", buf, 0x16u);
  }
  internalQueue = self->_internalQueue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __30__UARPController_tssResponse___block_invoke;
  v8[3] = &unk_2644914C0;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_sync(internalQueue, v8);
}

uint64_t __30__UARPController_tssResponse___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    char v5 = "-[UARPController tssResponse:]_block_invoke";
    _os_log_impl(&dword_21E079000, v2, OS_LOG_TYPE_INFO, "%s: on queue", (uint8_t *)&v4, 0xCu);
  }
  return [*(id *)(*(void *)(a1 + 32) + 64) tssResponse:*(void *)(a1 + 40)];
}

- (void)assetStagingPause:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    delegateQueue = self->_delegateQueue;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __36__UARPController_assetStagingPause___block_invoke;
    v8[3] = &unk_2644914C0;
    v8[4] = self;
    id v9 = v4;
    dispatch_async(delegateQueue, v8);
  }
}

void __36__UARPController_assetStagingPause___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 168));
  [WeakRetained assetStagingPause:*(void *)(a1 + 40)];
}

- (void)assetStagingResume:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    delegateQueue = self->_delegateQueue;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __37__UARPController_assetStagingResume___block_invoke;
    v8[3] = &unk_2644914C0;
    v8[4] = self;
    id v9 = v4;
    dispatch_async(delegateQueue, v8);
  }
}

void __37__UARPController_assetStagingResume___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 168));
  [WeakRetained assetStagingResume:*(void *)(a1 + 40)];
}

- (UARPControllerDelegateProtocol)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (UARPControllerDelegateProtocol *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_personalizationManager, 0);
  objc_storeStrong((id *)&self->_powerLogManager, 0);
  objc_storeStrong((id *)&self->_generalNotificationTokenDict, 0);
  objc_storeStrong((id *)&self->_attestationCertificatesAvailabilitySubjectKeyIdentifierNotificationTokenDict, 0);
  objc_storeStrong((id *)&self->_assetAvailabilityUARPProductGroupNotificationTokenDict, 0);
  objc_storeStrong((id *)&self->_supplementalAssetAvailabilityNotificationTokenDict, 0);
  objc_storeStrong((id *)&self->_assetAvailabilityNotificationTokenDict, 0);
  objc_storeStrong((id *)&self->_packetDumper, 0);
  objc_storeStrong((id *)&self->_updateFirmwareAnalytics, 0);
  objc_storeStrong((id *)&self->_chipInfoDelegate, 0);
  objc_storeStrong((id *)&self->_internalDelegate, 0);
  objc_storeStrong((id *)&self->_uploader, 0);
  objc_storeStrong((id *)&self->_personalizationQueue, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_controllerLog, 0);
  objc_storeStrong((id *)&self->_xpcLog, 0);
  objc_storeStrong((id *)&self->_assetCache, 0);
  objc_storeStrong((id *)&self->_accessories, 0);
}

void __60__UARPController_cancelFirmwareStagingForAccessory_assetID___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_9(*MEMORY[0x263EF8340]);
  int v2 = 136315650;
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_2(&dword_21E079000, v0, v1, "%s: Unable to find pending asset for %@ with ID %@", v2);
}

- (void)recvDataFromAccessory:(uint64_t)a3 data:(uint64_t)a4 error:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)updatePendingAssetsForAccessory:(void *)a1 assetID:.cold.1(void *a1)
{
  id v2 = a1;
  uint64_t v3 = [(id)OUTLINED_FUNCTION_14() localURL];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_1(&dword_21E079000, v4, v5, "Unable to initialize asset at %@", v6, v7, v8, v9, v10);
}

void __49__UARPController_sendMessageToAccessory_uarpMsg___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_3(&dword_21E079000, v0, v1, "Failed to send message to %@ (%@)");
}

- (void)solicitDynamicAsset:assetID:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_21E079000, v0, v1, "Attempting to solicit a dynamic asset without a valid URL; %@",
    v2,
    v3,
    v4,
    v5,
    v6);
}

void __46__UARPController_solicitDynamicAsset_assetID___block_invoke_cold_1(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [(id)OUTLINED_FUNCTION_14() localURL];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_1(&dword_21E079000, v5, v6, "Unable to initialize asset at %@", v7, v8, v9, v10, v11);
}

void __66__UARPController_dynamicAssetAvailableForAccessory_assetID_error___block_invoke_cold_1(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [(id)OUTLINED_FUNCTION_14() localPath];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_1(&dword_21E079000, v5, v6, "Unable to initialize dynamic asset at %@", v7, v8, v9, v10, v11);
}

void __63__UARPController_assetAvailablityUpdateForAccessoryID_assetID___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_1(&dword_21E079000, v0, v1, "%{public}s: Unrecognized accessory %@", v2, v3, v4, v5, 2u);
}

void __77__UARPController_supplementalAssetAvailablityUpdateForAccessoryID_assetName___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_1(&dword_21E079000, v0, v1, "%{public}s: Unrecognized accessory %@", v2, v3, v4, v5, 2u);
}

void __66__UARPController_supportedAccessories_forProductGroup_isComplete___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)accessoryTransportNeeded:isNeeded:.cold.1()
{
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_3(&dword_21E079000, v0, v1, "Accessory busy state %@ for %@");
}

void __71__UARPController_getSupportedAccessoriesInternal_assetID_batchRequest___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_9(*MEMORY[0x263EF8340]);
  int v2 = 136315650;
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_2(&dword_21E079000, v0, v1, "%s: Unable to register for Supported Accessories Availability for productGroup %@, assetID %@", v2);
}

void __61__UARPController_getAttestationCertificatesInternal_assetID___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_9(*MEMORY[0x263EF8340]);
  int v2 = 136315650;
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_2(&dword_21E079000, v0, v1, "%s: Unable to register for Attestation Certificates Availability for subjectKeyIdentifier %@, assetID %@", v2);
}

- (void)assetAvailabilityNotificationPosted:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10(&dword_21E079000, v0, v1, "%s: Unable to locate accessory for token %d", v2, v3, v4, v5, 2u);
}

- (void)assetAvailabilityNotificationPosted:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_21E079000, v0, v1, "%s: Unable to retrieve asset ID for %@", v2, v3, v4, v5, 2u);
}

- (void)registerForAssetAvailabilityNotification:.cold.1()
{
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_1_4(&dword_21E079000, v0, v1, "notify_register_dispatch failed for %s (%u)", v2, v3);
}

- (void)registerForSupportedAccessoriesAvailability:.cold.1()
{
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_1_4(&dword_21E079000, v0, v1, "notify_register_dispatch failed for %@ (%u)");
}

- (void)supplementalAssetAvailabilityNotificationPosted:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10(&dword_21E079000, v0, v1, "%s: Unable to locate accessory for token %d", v2, v3, v4, v5, 2u);
}

- (void)supplementalAssetAvailabilityNotificationPosted:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_21E079000, v0, v1, "%s: Unable to retrieve asset Name for %@", v2, v3, v4, v5, 2u);
}

- (void)genericNotificationPosted:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10(&dword_21E079000, v0, v1, "%s: Unable to locate notification name for token %d", v2, v3, v4, v5, 2u);
}

- (void)createUploader
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_21E079000, log, OS_LOG_TYPE_ERROR, "Unable to create Uploader.", v1, 2u);
}

void __34__UARPController_startTapToRadar___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_21E079000, log, OS_LOG_TYPE_ERROR, "Cannot Start TTR Mode - no accessories connected.", v1, 2u);
}

@end