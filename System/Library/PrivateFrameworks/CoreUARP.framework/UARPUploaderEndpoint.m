@interface UARPUploaderEndpoint
- (BOOL)handlePersonalizationResponse:(id)a3;
- (BOOL)hasFullPersonality:(id)a3;
- (BOOL)im4mAssetReceived:(id)a3;
- (BOOL)isDownstreamEndpoint;
- (NSArray)rxDynamicAssets;
- (NSArray)txDynamicAssets;
- (NSArray)txFirmwareAssets;
- (NSSet)applePropertiesToQuery;
- (NSSet)infoPropertiesToQuery;
- (NSString)appleModelNumber;
- (NSString)friendlyName;
- (NSString)hardwareVersion;
- (NSString)hwFusingType;
- (NSString)manufacturerName;
- (NSString)modelName;
- (NSString)serialNumber;
- (UARPAccessory)accessory;
- (UARPAssetVersion)firmwareVersion;
- (UARPAssetVersion)stagedFirmwareVersion;
- (UARPUploaderEndpoint)directEndpoint;
- (UARPUploaderEndpoint)initWithUARPAccessory:(id)a3 layer2Context:(uarpPlatformRemoteEndpoint *)a4 uploader:(id)a5;
- (UARPUploaderEndpoint)initWithUARPAccessory:(id)a3 uploader:(id)a4;
- (UARPUploaderUARP)uploader;
- (id)downstreamEndpoint:(unint64_t)a3;
- (id)findMatch:(id)a3;
- (id)idealTxFirmwareAsset;
- (id)initDownstreamWithDirectEndpoint:(id)a3 layer2Context:(void *)a4 uploader:(id)a5;
- (uarpPlatformOptionsObj)uarpOptions;
- (uarpPlatformRemoteEndpoint)uarpEndpoint;
- (unint64_t)uarpVersion;
- (unsigned)downstreamID;
- (void)abandonRxDynamicAsset:(id)a3;
- (void)abandonTxDynamicAsset:(id)a3;
- (void)addDownstreamEndpoint:(id)a3;
- (void)addRxDynamicAsset:(id)a3;
- (void)addTxDynamicAsset:(id)a3;
- (void)addTxFirmwareAsset:(id)a3;
- (void)cancelLayer2WatchdogTimer;
- (void)clearQueuedAppleProperties;
- (void)clearQueuedInfoProperties;
- (void)dealloc;
- (void)dumpRxUARPMsg:(id)a3;
- (void)dumpTxUARPMsg:(id)a3;
- (void)handleLayer2WatchdogTimer:(id)a3;
- (void)handlePersonalizationRequest;
- (void)handlePersonalizationRequest:(id)a3 tatsuSigningServer:(id)a4;
- (void)qcancelLayer2WatchdogTimer;
- (void)queueAppleProperty:(unsigned int)a3;
- (void)queueInfoProperty:(unsigned int)a3;
- (void)removeAsset:(id)a3;
- (void)removeDownstreamEndpoint:(id)a3;
- (void)respondIM4M:(id)a3;
- (void)setAppleModelNumber:(id)a3;
- (void)setFirmwareVersion:(id)a3;
- (void)setFriendlyName:(id)a3;
- (void)setHardwareVersion:(id)a3;
- (void)setHwFusingType:(id)a3;
- (void)setLayer2WatchdogTimer:(id)a3 timeoutMS:(unint64_t)a4;
- (void)setManufacturerName:(id)a3;
- (void)setModelName:(id)a3;
- (void)setSerialNumber:(id)a3;
- (void)setStagedFirmwareVersion:(id)a3;
- (void)setUarpVersion:(unint64_t)a3;
@end

@implementation UARPUploaderEndpoint

- (UARPUploaderEndpoint)initWithUARPAccessory:(id)a3 layer2Context:(uarpPlatformRemoteEndpoint *)a4 uploader:(id)a5
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a5;
  v45.receiver = self;
  v45.super_class = (Class)UARPUploaderEndpoint;
  v11 = [(UARPUploaderEndpoint *)&v45 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_accessory, a3);
    objc_storeWeak((id *)&v12->_uploader, v10);
    os_log_t v13 = os_log_create("com.apple.accessoryupdater.uarp", "uploader");
    log = v12->_log;
    v12->_log = (OS_os_log *)v13;

    dispatch_queue_t v15 = dispatch_queue_create("com.apple.UARPUploaderUARP.accessory", 0);
    queue = v12->_queue;
    v12->_queue = (OS_dispatch_queue *)v15;

    dispatch_queue_t v17 = dispatch_queue_create("com.apple.UARPUploaderEndpoint.personalization", 0);
    personalizationQueue = v12->_personalizationQueue;
    v12->_personalizationQueue = (OS_dispatch_queue *)v17;

    if (a4)
    {
      *(_WORD *)buf = 0;
      uarpDownstreamEndpointGetID((uint64_t)a4, buf);
      unsigned __int16 v19 = *(_WORD *)buf;
    }
    else
    {
      a4 = (uarpPlatformRemoteEndpoint *)malloc_type_calloc(1uLL, 0xB8uLL, 0x10A00403E4BE566uLL);
      unsigned __int16 v19 = 0;
    }
    v12->_downstreamID = v19;
    v12->_uarpEndpoint = a4;
    v20 = [v9 modelNumber];
    v21 = +[UARPSupportedAccessory findByAppleModelNumber:v20];

    *(_DWORD *)&v12->_uarpOptions.upgradeOnly = 0;
    *(_OWORD *)&v12->_uarpOptions.maxTxPayloadLength = 0u;
    *(_OWORD *)&v12->_uarpOptions.responseTimeout = 0u;
    *(void *)&v12->_uarpOptions.maxTxPayloadLength = 0x800000008000;
    v12->_uarpOptions.payloadWindowLength = 0x8000;
    v12->_uarpOptions.protocolVersion = 4;
    v12->_uarpOptions.reofferFirmwareOnSync = 0;
    v12->_uarpOptions.responseTimeout = [v21 uploaderResponseTimeout];
    v12->_uarpOptions.retryLimit = [v21 uploaderRetryLimit];
    uint64_t v22 = [v9 productGroup];
    BOOL v25 = 0;
    if (v22)
    {
      v23 = (void *)v22;
      v24 = [v9 productNumber];

      if (v24) {
        BOOL v25 = 1;
      }
    }
    v12->_uarpOptions.endpointType = v25;
    v12->_uarpVersion = 0;
    if ([v21 reofferFirmwareOnSync]) {
      v12->_uarpOptions.reofferFirmwareOnSync = 1;
    }
    v12->_uarpOptions.upgradeOnly = 1;
    v26 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    txFirmwareAssets = v12->_txFirmwareAssets;
    v12->_txFirmwareAssets = v26;

    v28 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    txDynamicAssets = v12->_txDynamicAssets;
    v12->_txDynamicAssets = v28;

    v30 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    rxDynamicAssets = v12->_rxDynamicAssets;
    v12->_rxDynamicAssets = v30;

    v32 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    downstreamEndpoints = v12->_downstreamEndpoints;
    v12->_downstreamEndpoints = v32;

    v34 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    infoPropertiesToQuery = v12->_infoPropertiesToQuery;
    v12->_infoPropertiesToQuery = v34;

    v36 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    applePropertiesToQuery = v12->_applePropertiesToQuery;
    v12->_applePropertiesToQuery = v36;

    uint64_t v38 = [MEMORY[0x263F08C38] UUID];
    uuid = v12->_uuid;
    v12->_uuid = (NSUUID *)v38;

    v40 = v12->_log;
    if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
    {
      v41 = v12->_uuid;
      v42 = v40;
      v43 = [(NSUUID *)v41 UUIDString];
      *(_DWORD *)buf = 138412290;
      v47 = v43;
      _os_log_impl(&dword_21E079000, v42, OS_LOG_TYPE_INFO, "New Remote Endpoint: UUID <%@>", buf, 0xCu);
    }
  }

  return v12;
}

- (UARPUploaderEndpoint)initWithUARPAccessory:(id)a3 uploader:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(UARPUploaderEndpoint *)self initWithUARPAccessory:v6 layer2Context:0 uploader:v7];
  if (v8)
  {
    id v9 = (void *)MEMORY[0x223C1FC50]();
    id v10 = UARPStringPcapFilesFilepath();
    UARPCleanupAgedFiles(v10, 259200.0);

    v11 = UARPStringLogsDirectoryFilePath();
    UARPCleanupAgedFiles(v11, 259200.0);

    v12 = UARPStringCrashAnalyticsDirectoryFilePath();
    UARPCleanupAgedFiles(v12, 604800.0);

    [v7 ageOutUnprocessedDynamicAssets];
    os_log_t v13 = UARPStringSysdiagnoseDirectoryFilePath();
    UARPCleanupAgedFiles(v13, 604800.0);

    v14 = [(UARPAccessory *)v8->_accessory getID];
    dispatch_queue_t v15 = [v14 modelIdentifier];
    v16 = UARPStringPcapFilesFilepath();
    dispatch_queue_t v17 = UARPUniqueFilename(v15, 0, v16, 0, @".pcap");

    log = v8->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG)) {
      -[UARPUploaderEndpoint initWithUARPAccessory:uploader:]((uint64_t)v17, log, v19, v20, v21, v22, v23, v24);
    }
    BOOL v25 = [[UARPPacketDumper alloc] initWithFileName:v17];
    packetDumper = v8->_packetDumper;
    v8->_packetDumper = v25;
  }
  return v8;
}

- (void)dealloc
{
  packetDumper = self->_packetDumper;
  self->_packetDumper = 0;

  if (!self->_downstreamID) {
    free(self->_uarpEndpoint);
  }
  layer2WatchdogTimer = self->_layer2WatchdogTimer;
  if (layer2WatchdogTimer)
  {
    dispatch_source_cancel(layer2WatchdogTimer);
    v5 = self->_layer2WatchdogTimer;
    self->_layer2WatchdogTimer = 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)UARPUploaderEndpoint;
  [(UARPUploaderEndpoint *)&v6 dealloc];
}

- (uarpPlatformRemoteEndpoint)uarpEndpoint
{
  return self->_uarpEndpoint;
}

- (uarpPlatformOptionsObj)uarpOptions
{
  return &self->_uarpOptions;
}

- (UARPUploaderEndpoint)directEndpoint
{
  return self->_directEndpoint;
}

- (NSArray)txFirmwareAssets
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = [MEMORY[0x263EFF8C0] arrayWithArray:v2->_txFirmwareAssets];
  objc_sync_exit(v2);

  return (NSArray *)v3;
}

- (NSArray)txDynamicAssets
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = [MEMORY[0x263EFF8C0] arrayWithArray:v2->_txDynamicAssets];
  objc_sync_exit(v2);

  return (NSArray *)v3;
}

- (NSArray)rxDynamicAssets
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = [MEMORY[0x263EFF8C0] arrayWithArray:v2->_rxDynamicAssets];
  objc_sync_exit(v2);

  return (NSArray *)v3;
}

- (void)addTxFirmwareAsset:(id)a3
{
}

- (void)addTxDynamicAsset:(id)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    int v5 = 138412290;
    id v6 = v4;
    _os_log_impl(&dword_21E079000, &_os_log_internal, OS_LOG_TYPE_INFO, "Add Tx Dynamic Asset %@", (uint8_t *)&v5, 0xCu);
  }
  [(NSMutableArray *)self->_txDynamicAssets addObject:v4];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
    -[UARPUploaderEndpoint addTxDynamicAsset:]();
  }
}

- (void)addRxDynamicAsset:(id)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    int v5 = 138412290;
    id v6 = v4;
    _os_log_impl(&dword_21E079000, &_os_log_internal, OS_LOG_TYPE_INFO, "Add Rx Dynamic Asset %@", (uint8_t *)&v5, 0xCu);
  }
  [(NSMutableArray *)self->_rxDynamicAssets addObject:v4];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
    -[UARPUploaderEndpoint addRxDynamicAsset:]();
  }
}

- (void)removeAsset:(id)a3
{
  txFirmwareAssets = self->_txFirmwareAssets;
  id v5 = a3;
  [(NSMutableArray *)txFirmwareAssets removeObject:v5];
  [(NSMutableArray *)self->_txDynamicAssets removeObject:v5];
}

- (id)findMatch:(id)a3
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v5 = self->_txFirmwareAssets;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v33 objects:v39 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v34;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v34 != v8) {
        objc_enumerationMutation(v5);
      }
      id v10 = *(void **)(*((void *)&v33 + 1) + 8 * v9);
      v11 = [v10 asset];
      char v12 = [v4 isEqual:v11];

      if (v12) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v33 objects:v39 count:16];
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

    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v5 = self->_txDynamicAssets;
    uint64_t v13 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v29 objects:v38 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v30;
LABEL_11:
      uint64_t v16 = 0;
      while (1)
      {
        if (*(void *)v30 != v15) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v29 + 1) + 8 * v16);
        dispatch_queue_t v17 = [v10 asset];
        char v18 = [v4 isEqual:v17];

        if (v18) {
          break;
        }
        if (v14 == ++v16)
        {
          uint64_t v14 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v29 objects:v38 count:16];
          if (v14) {
            goto LABEL_11;
          }
          goto LABEL_17;
        }
      }
    }
    else
    {
LABEL_17:

      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      id v5 = self->_rxDynamicAssets;
      id v19 = (id)[(NSMutableArray *)v5 countByEnumeratingWithState:&v25 objects:v37 count:16];
      if (!v19) {
        goto LABEL_27;
      }
      uint64_t v20 = *(void *)v26;
LABEL_19:
      uint64_t v21 = 0;
      while (1)
      {
        if (*(void *)v26 != v20) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v25 + 1) + 8 * v21);
        uint64_t v22 = objc_msgSend(v10, "asset", (void)v25);
        char v23 = [v4 isEqual:v22];

        if (v23) {
          break;
        }
        if (v19 == (id)++v21)
        {
          id v19 = (id)[(NSMutableArray *)v5 countByEnumeratingWithState:&v25 objects:v37 count:16];
          if (v19) {
            goto LABEL_19;
          }
          goto LABEL_27;
        }
      }
    }
  }
  id v19 = v10;
LABEL_27:

  return v19;
}

- (void)handleLayer2WatchdogTimer:(id)a3
{
  layer2WatchdogTimer = self->_layer2WatchdogTimer;
  self->_layer2WatchdogTimer = 0;
  id v5 = a3;

  [v5 watchdogExpireLayer2:self];
}

- (void)cancelLayer2WatchdogTimer
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__UARPUploaderEndpoint_cancelLayer2WatchdogTimer__block_invoke;
  block[3] = &unk_264492750;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __49__UARPUploaderEndpoint_cancelLayer2WatchdogTimer__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) qcancelLayer2WatchdogTimer];
}

- (void)qcancelLayer2WatchdogTimer
{
  layer2WatchdogTimer = self->_layer2WatchdogTimer;
  if (layer2WatchdogTimer)
  {
    dispatch_source_cancel(layer2WatchdogTimer);
    id v4 = self->_layer2WatchdogTimer;
    self->_layer2WatchdogTimer = 0;
  }
}

- (void)setLayer2WatchdogTimer:(id)a3 timeoutMS:(unint64_t)a4
{
  id v6 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__UARPUploaderEndpoint_setLayer2WatchdogTimer_timeoutMS___block_invoke;
  block[3] = &unk_2644927A0;
  id v10 = v6;
  unint64_t v11 = a4;
  block[4] = self;
  id v8 = v6;
  dispatch_async(queue, block);
}

void __57__UARPUploaderEndpoint_setLayer2WatchdogTimer_timeoutMS___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) qcancelLayer2WatchdogTimer];
  dispatch_source_t v2 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, *(dispatch_queue_t *)(*(void *)(a1 + 32) + 16));
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 32);
  *(void *)(v3 + 32) = v2;

  if ((unint64_t)(1000000 * *(void *)(a1 + 48)) <= 1) {
    int64_t v5 = 1;
  }
  else {
    int64_t v5 = 1000000 * *(void *)(a1 + 48);
  }
  dispatch_time_t v6 = dispatch_time(0, v5);
  dispatch_source_set_timer(*(dispatch_source_t *)(*(void *)(a1 + 32) + 32), v6, 0xFFFFFFFFFFFFFFFFLL, 0xF4240uLL);
  objc_initWeak(&location, *(id *)(a1 + 32));
  uint64_t v7 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __57__UARPUploaderEndpoint_setLayer2WatchdogTimer_timeoutMS___block_invoke_2;
  handler[3] = &unk_264492778;
  objc_copyWeak(&v10, &location);
  id v9 = *(id *)(a1 + 40);
  dispatch_source_set_event_handler(v7, handler);
  dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 32));

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __57__UARPUploaderEndpoint_setLayer2WatchdogTimer_timeoutMS___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained handleLayer2WatchdogTimer:*(void *)(a1 + 32)];
}

- (id)initDownstreamWithDirectEndpoint:(id)a3 layer2Context:(void *)a4 uploader:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  unint64_t v11 = [v9 accessory];
  char v12 = [(UARPUploaderEndpoint *)self initWithUARPAccessory:v11 layer2Context:a4 uploader:v10];

  if (v12)
  {
    v12->_isDownstreamEndpoint = 1;
    objc_storeStrong((id *)&v12->_directEndpoint, a3);
  }

  return v12;
}

- (BOOL)isDownstreamEndpoint
{
  return self->_isDownstreamEndpoint;
}

- (void)addDownstreamEndpoint:(id)a3
{
}

- (void)removeDownstreamEndpoint:(id)a3
{
}

- (id)downstreamEndpoint:(unint64_t)a3
{
  unsigned __int16 v3 = a3;
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = self->_downstreamEndpoints;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "downstreamID", (void)v12) == v3)
        {
          id v10 = v9;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  id v10 = 0;
LABEL_11:

  return v10;
}

- (BOOL)hasFullPersonality:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(UARPUploaderEndpoint *)self serialNumber];

  if (!v5) {
    goto LABEL_10;
  }
  uint64_t v6 = [(UARPUploaderEndpoint *)self appleModelNumber];

  if (!v6) {
    goto LABEL_10;
  }
  uint64_t v7 = [(UARPUploaderEndpoint *)self hwFusingType];

  if (v7
    && ([(UARPUploaderEndpoint *)self firmwareVersion],
        id v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        v8))
  {
    if ([v4 isTapToRadarMode]) {
      [v4 solicitDynamicAssetsForTapToRadar:self];
    }
    if ([(UARPUploaderEndpoint *)self isDownstreamEndpoint]) {
      [v4 offerFirmwareAssetToDownstreamEndpoint:self error:0];
    }
    BOOL v9 = 1;
  }
  else
  {
LABEL_10:
    BOOL v9 = 0;
  }

  return v9;
}

- (void)dumpTxUARPMsg:(id)a3
{
  packetDumper = self->_packetDumper;
  if (packetDumper)
  {
    accessory = self->_accessory;
    id v5 = a3;
    id v6 = [(UARPAccessory *)accessory getID];
    [(UARPPacketDumper *)packetDumper dump:v5 accessoryID:v6 uarpStatus:0 direction:0];
  }
}

- (void)dumpRxUARPMsg:(id)a3
{
  packetDumper = self->_packetDumper;
  if (packetDumper)
  {
    accessory = self->_accessory;
    id v5 = a3;
    id v6 = [(UARPAccessory *)accessory getID];
    [(UARPPacketDumper *)packetDumper dump:v5 accessoryID:v6 uarpStatus:0 direction:1];
  }
}

- (void)abandonRxDynamicAsset:(id)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    int v5 = 138412290;
    id v6 = v4;
    _os_log_impl(&dword_21E079000, &_os_log_internal, OS_LOG_TYPE_INFO, "Remove Rx Dynamic Asset %@", (uint8_t *)&v5, 0xCu);
  }
  if ([v4 internalSolicit])
  {
    [(NSMutableArray *)self->_rxDynamicAssets removeObject:v4];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
      -[UARPUploaderEndpoint addRxDynamicAsset:]();
    }
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
    {
      int v5 = 138412290;
      id v6 = v4;
      _os_log_impl(&dword_21E079000, &_os_log_internal, OS_LOG_TYPE_INFO, "Do not abandon internally solicited Rx Dynamic Asset %@", (uint8_t *)&v5, 0xCu);
    }
    [v4 setUarpSuperBinary:0];
    [v4 setUarpPlatformAsset:0];
  }
}

- (void)abandonTxDynamicAsset:(id)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    int v5 = 138412290;
    id v6 = v4;
    _os_log_impl(&dword_21E079000, &_os_log_internal, OS_LOG_TYPE_INFO, "Remove Tx Dynamic Asset %@", (uint8_t *)&v5, 0xCu);
  }
  [(NSMutableArray *)self->_txDynamicAssets removeObject:v4];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
    -[UARPUploaderEndpoint addTxDynamicAsset:]();
  }
}

- (void)queueInfoProperty:(unsigned int)a3
{
  obj = self;
  objc_sync_enter(obj);
  id v4 = [NSNumber numberWithUnsignedLong:a3];
  [(NSMutableSet *)obj->_infoPropertiesToQuery addObject:v4];

  objc_sync_exit(obj);
}

- (void)queueAppleProperty:(unsigned int)a3
{
  obj = self;
  objc_sync_enter(obj);
  id v4 = [NSNumber numberWithUnsignedLong:a3];
  [(NSMutableSet *)obj->_applePropertiesToQuery addObject:v4];

  objc_sync_exit(obj);
}

- (NSSet)infoPropertiesToQuery
{
  return (NSSet *)[MEMORY[0x263EFFA08] setWithSet:self->_infoPropertiesToQuery];
}

- (NSSet)applePropertiesToQuery
{
  return (NSSet *)[MEMORY[0x263EFFA08] setWithSet:self->_applePropertiesToQuery];
}

- (void)clearQueuedInfoProperties
{
}

- (void)clearQueuedAppleProperties
{
}

- (id)idealTxFirmwareAsset
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  dispatch_source_t v2 = self->_txFirmwareAssets;
  uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    id v5 = 0;
    uint64_t v6 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v23 != v6) {
          objc_enumerationMutation(v2);
        }
        id v8 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if (v5)
        {
          uint64_t v20 = 0;
          uint64_t v21 = 0;
          BOOL v9 = [v8 assetVersion];
          LODWORD(v20) = [v9 majorVersion];

          id v10 = [v8 assetVersion];
          HIDWORD(v20) = [v10 minorVersion];

          unint64_t v11 = [v8 assetVersion];
          HIDWORD(v21) = [v11 buildVersion];

          long long v12 = [v8 assetVersion];
          LODWORD(v21) = [v12 releaseVersion];

          long long v13 = objc_msgSend(v5, "assetVersion", 0, 0);
          v19[0] = [v13 majorVersion];

          long long v14 = [v5 assetVersion];
          v19[1] = [v14 minorVersion];

          long long v15 = [v5 assetVersion];
          v19[3] = [v15 buildVersion];

          uint64_t v16 = [v5 assetVersion];
          v19[2] = [v16 releaseVersion];

          if (uarpVersionCompare(v19, &v20) == 1)
          {
            id v17 = v8;

            id v5 = v17;
          }
        }
        else
        {
          id v5 = v8;
        }
      }
      uint64_t v4 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v4);
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (BOOL)im4mAssetReceived:(id)a3
{
  id v4 = a3;
  id v5 = [v4 asset];
  uint64_t v6 = [v5 id];
  uint64_t v7 = [v6 tag];

  id v8 = (char *)uarpAssetTagStructPersonalization();
  BOOL v9 = [[UARPAssetTag alloc] initWithChar1:*v8 char2:v8[1] char3:v8[2] char4:v8[3]];
  int v10 = [v7 isEqual:v9];
  if (v10)
  {
    unint64_t v11 = [v4 asset];
    long long v12 = [v11 id];
    long long v13 = [v12 localURL];
    long long v14 = (void *)[v13 copy];

    long long v15 = [NSURL URLWithString:@"https://gs.apple.com:443"];
    uint64_t v16 = [[UARPDynamicAssetPersonalization alloc] initWithEndpoint:self url:v14 tatsuServerURL:v15];
    id v34 = 0;
    LODWORD(v13) = [(UARPDynamicAssetPersonalization *)v16 processDynamicAsset:&v34];
    id v17 = v34;
    char v18 = v17;
    if (v13)
    {
      long long v32 = v14;
      id v33 = v17;
      [v4 setPendingTssRequest:v16];
      id v19 = (const char *)[@"com.apple.uarp.internal.personalization" UTF8String];
      uint64_t v20 = [(UARPAccessory *)self->_accessory modelNumber];
      uint64_t v21 = +[UARPSupportedAccessory findByAppleModelNumber:v20];

      long long v22 = [v21 personalizationNotification];

      if (v22)
      {
        id v23 = [v21 personalizationNotification];
        id v19 = (const char *)[v23 UTF8String];
      }
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG)) {
        -[UARPUploaderEndpoint im4mAssetReceived:]((uint64_t)v19, log, v25, v26, v27, v28, v29, v30);
      }
      notify_post(v19);

      long long v14 = v32;
      char v18 = v33;
    }
  }
  return v10;
}

- (void)handlePersonalizationRequest
{
}

void __52__UARPUploaderEndpoint_handlePersonalizationRequest__block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  dispatch_source_t v2 = [NSURL URLWithString:@"https://gs.apple.com:443"];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id obj = *(id *)(*(void *)(a1 + 32) + 104);
  uint64_t v3 = [obj countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v3)
  {
    uint64_t v5 = v3;
    uint64_t v6 = *(void *)v16;
    *(void *)&long long v4 = 136315138;
    long long v13 = v4;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        BOOL v9 = *(NSObject **)(*(void *)(a1 + 32) + 8);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          uint64_t v20 = "-[UARPUploaderEndpoint handlePersonalizationRequest]_block_invoke";
          __int16 v21 = 2112;
          long long v22 = v8;
          _os_log_impl(&dword_21E079000, v9, OS_LOG_TYPE_INFO, "%s: Check asset for pending tss request, %@", buf, 0x16u);
        }
        int v10 = objc_msgSend(v8, "pendingTssRequest", v13);

        unint64_t v11 = *(NSObject **)(*(void *)(a1 + 32) + 8);
        BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
        if (v10)
        {
          if (v12)
          {
            *(_DWORD *)buf = v13;
            uint64_t v20 = "-[UARPUploaderEndpoint handlePersonalizationRequest]_block_invoke";
            _os_log_impl(&dword_21E079000, v11, OS_LOG_TYPE_INFO, "%s: Check asset; pending tss request", buf, 0xCu);
          }
          [*(id *)(a1 + 32) handlePersonalizationRequest:v8 tatsuSigningServer:v2];
        }
        else if (v12)
        {
          *(_DWORD *)buf = v13;
          uint64_t v20 = "-[UARPUploaderEndpoint handlePersonalizationRequest]_block_invoke";
          _os_log_impl(&dword_21E079000, v11, OS_LOG_TYPE_INFO, "%s: Check asset; no pending tss request", buf, 0xCu);
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v5);
  }
}

- (void)handlePersonalizationRequest:(id)a3 tatsuSigningServer:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    long long v17 = "-[UARPUploaderEndpoint handlePersonalizationRequest:tatsuSigningServer:]";
    __int16 v18 = 2112;
    id v19 = self;
    _os_log_impl(&dword_21E079000, log, OS_LOG_TYPE_INFO, "%s: Handling TSS request for %@", buf, 0x16u);
  }
  BOOL v9 = [v6 pendingTssRequest];
  id v15 = 0;
  char v10 = [v9 tssRequest:v7 error:&v15];
  id v11 = v15;

  if ((v10 & 1) == 0)
  {
    BOOL v12 = self->_log;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[UARPUploaderEndpoint handlePersonalizationRequest:tatsuSigningServer:](v12);
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_uploader);
    [WeakRetained rescindAssets:self];
  }
  long long v14 = self->_log;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    long long v17 = "-[UARPUploaderEndpoint handlePersonalizationRequest:tatsuSigningServer:]";
    __int16 v18 = 2112;
    id v19 = self;
    _os_log_impl(&dword_21E079000, v14, OS_LOG_TYPE_INFO, "%s: Respond with IM4M %@", buf, 0x16u);
  }
  [(UARPUploaderEndpoint *)self respondIM4M:v6];
}

- (BOOL)handlePersonalizationResponse:(id)a3
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  long long v32 = (UARPUploaderEndpoint *)a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v39 = "-[UARPUploaderEndpoint handlePersonalizationResponse:]";
    __int16 v40 = 2112;
    v41 = self;
    _os_log_impl(&dword_21E079000, log, OS_LOG_TYPE_INFO, "%s: Checking pending TSS requests for %@", buf, 0x16u);
  }
  if (v32)
  {
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id obj = self->_rxDynamicAssets;
    uint64_t v5 = [(NSMutableArray *)obj countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v34;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v34 != v7) {
            objc_enumerationMutation(obj);
          }
          BOOL v9 = *(UARPUploaderEndpoint **)(*((void *)&v33 + 1) + 8 * i);
          char v10 = [(UARPUploaderEndpoint *)v9 pendingTssRequest];

          id v11 = self->_log;
          BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
          if (v10)
          {
            if (v12)
            {
              *(_DWORD *)buf = 136315394;
              v39 = "-[UARPUploaderEndpoint handlePersonalizationResponse:]";
              __int16 v40 = 2112;
              v41 = self;
              _os_log_impl(&dword_21E079000, v11, OS_LOG_TYPE_INFO, "%s: Pending TSS requests for %@", buf, 0x16u);
            }
            long long v13 = self->_log;
            if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315394;
              v39 = "-[UARPUploaderEndpoint handlePersonalizationResponse:]";
              __int16 v40 = 2112;
              v41 = v32;
              _os_log_impl(&dword_21E079000, v13, OS_LOG_TYPE_INFO, "%s: Pending TSS requests for %@", buf, 0x16u);
            }
            long long v14 = self->_log;
            if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
            {
              id v15 = v14;
              long long v16 = [(UARPUploaderEndpoint *)v9 pendingTssRequest];
              *(_DWORD *)buf = 136315394;
              v39 = "-[UARPUploaderEndpoint handlePersonalizationResponse:]";
              __int16 v40 = 2112;
              v41 = v16;
              _os_log_impl(&dword_21E079000, v15, OS_LOG_TYPE_INFO, "%s: Pending TSS requests for %@", buf, 0x16u);
            }
            long long v17 = [(UARPUploaderEndpoint *)v9 pendingTssRequest];
            int v18 = [v17 compareTssResponse:v32];

            if (v18)
            {
              id v23 = self->_log;
              if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 136315394;
                v39 = "-[UARPUploaderEndpoint handlePersonalizationResponse:]";
                __int16 v40 = 2112;
                v41 = self;
                _os_log_impl(&dword_21E079000, v23, OS_LOG_TYPE_INFO, "%s: Matched TSS response for %@", buf, 0x16u);
              }
              uint64_t v25 = [(UARPUploaderEndpoint *)v9 pendingTssRequest];
              char v26 = [v25 processTssResponse:v32];

              if ((v26 & 1) == 0)
              {
                uint64_t v27 = self->_log;
                if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 136315394;
                  v39 = "-[UARPUploaderEndpoint handlePersonalizationResponse:]";
                  __int16 v40 = 2112;
                  v41 = self;
                  _os_log_impl(&dword_21E079000, v27, OS_LOG_TYPE_INFO, "%s: Failed TSS query for %@", buf, 0x16u);
                }
                id WeakRetained = objc_loadWeakRetained((id *)&self->_uploader);
                [WeakRetained rescindAssets:self];
              }
              uint64_t v29 = self->_log;
              if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 136315394;
                v39 = "-[UARPUploaderEndpoint handlePersonalizationResponse:]";
                __int16 v40 = 2112;
                v41 = self;
                _os_log_impl(&dword_21E079000, v29, OS_LOG_TYPE_INFO, "%s: Respond with IM4M %@", buf, 0x16u);
              }
              [(UARPUploaderEndpoint *)self respondIM4M:v9];

              BOOL v22 = 1;
              goto LABEL_37;
            }
          }
          else if (v12)
          {
            *(_DWORD *)buf = 136315394;
            v39 = "-[UARPUploaderEndpoint handlePersonalizationResponse:]";
            __int16 v40 = 2112;
            v41 = v9;
            _os_log_impl(&dword_21E079000, v11, OS_LOG_TYPE_INFO, "%s: No pending TSS requests for %@", buf, 0x16u);
          }
        }
        uint64_t v6 = [(NSMutableArray *)obj countByEnumeratingWithState:&v33 objects:v37 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }

    id v19 = self->_log;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v39 = "-[UARPUploaderEndpoint handlePersonalizationResponse:]";
      __int16 v40 = 2112;
      v41 = self;
      _os_log_impl(&dword_21E079000, v19, OS_LOG_TYPE_INFO, "%s: No pending/matching TSS requests for %@", buf, 0x16u);
    }
  }
  else
  {
    uint64_t v20 = self->_log;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[UARPUploaderEndpoint handlePersonalizationResponse:]((uint64_t)self, v20);
    }
    id v21 = objc_loadWeakRetained((id *)&self->_uploader);
    [v21 rescindAssets:self];
  }
  BOOL v22 = 0;
LABEL_37:

  return v22;
}

- (void)respondIM4M:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 pendingTssRequest];
  uint64_t v6 = [v5 tagIM4M];
  uint64_t v7 = uarpDynamicAssetURL(v6);

  id v8 = [v4 pendingTssRequest];
  id v20 = 0;
  char v9 = [v8 prepareDynamicAsset:v7 error:&v20];
  id v10 = v20;

  if (v9)
  {
    id v11 = [UARPAssetID alloc];
    BOOL v12 = [v4 pendingTssRequest];
    long long v13 = [v12 tagIM4M];
    long long v14 = [(UARPAssetID *)v11 initWithLocationType:0 assetTag:v13 url:v7];

    id v15 = [[UARPAsset alloc] initWithID:v14];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_uploader);
    long long v17 = [v4 pendingTssRequest];
    int v18 = [v17 tagIM4M];
    [WeakRetained offerDynamicAssetToAccessory:self asset:v15 internalOffer:1 tag:v18];
  }
  else
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
      -[UARPUploaderEndpoint respondIM4M:](log);
    }
    long long v14 = (UARPAssetID *)objc_loadWeakRetained((id *)&self->_uploader);
    [(UARPAssetID *)v14 rescindAssets:self];
  }
}

- (UARPUploaderUARP)uploader
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_uploader);
  return (UARPUploaderUARP *)WeakRetained;
}

- (UARPAccessory)accessory
{
  return (UARPAccessory *)objc_getProperty(self, a2, 192, 1);
}

- (unint64_t)uarpVersion
{
  return self->_uarpVersion;
}

- (void)setUarpVersion:(unint64_t)a3
{
  self->_uarpVersion = a3;
}

- (unsigned)downstreamID
{
  return self->_downstreamID;
}

- (NSString)manufacturerName
{
  return (NSString *)objc_getProperty(self, a2, 208, 1);
}

- (void)setManufacturerName:(id)a3
{
}

- (NSString)modelName
{
  return (NSString *)objc_getProperty(self, a2, 216, 1);
}

- (void)setModelName:(id)a3
{
}

- (NSString)serialNumber
{
  return (NSString *)objc_getProperty(self, a2, 224, 1);
}

- (void)setSerialNumber:(id)a3
{
}

- (NSString)friendlyName
{
  return (NSString *)objc_getProperty(self, a2, 232, 1);
}

- (void)setFriendlyName:(id)a3
{
}

- (NSString)appleModelNumber
{
  return (NSString *)objc_getProperty(self, a2, 240, 1);
}

- (void)setAppleModelNumber:(id)a3
{
}

- (NSString)hwFusingType
{
  return (NSString *)objc_getProperty(self, a2, 248, 1);
}

- (void)setHwFusingType:(id)a3
{
}

- (NSString)hardwareVersion
{
  return (NSString *)objc_getProperty(self, a2, 256, 1);
}

- (void)setHardwareVersion:(id)a3
{
}

- (UARPAssetVersion)firmwareVersion
{
  return (UARPAssetVersion *)objc_getProperty(self, a2, 264, 1);
}

- (void)setFirmwareVersion:(id)a3
{
}

- (UARPAssetVersion)stagedFirmwareVersion
{
  return (UARPAssetVersion *)objc_getProperty(self, a2, 272, 1);
}

- (void)setStagedFirmwareVersion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stagedFirmwareVersion, 0);
  objc_storeStrong((id *)&self->_firmwareVersion, 0);
  objc_storeStrong((id *)&self->_hardwareVersion, 0);
  objc_storeStrong((id *)&self->_hwFusingType, 0);
  objc_storeStrong((id *)&self->_appleModelNumber, 0);
  objc_storeStrong((id *)&self->_friendlyName, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_modelName, 0);
  objc_storeStrong((id *)&self->_manufacturerName, 0);
  objc_storeStrong((id *)&self->_accessory, 0);
  objc_destroyWeak((id *)&self->_uploader);
  objc_storeStrong((id *)&self->_applePropertiesToQuery, 0);
  objc_storeStrong((id *)&self->_infoPropertiesToQuery, 0);
  objc_storeStrong((id *)&self->_packetDumper, 0);
  objc_storeStrong((id *)&self->_directEndpoint, 0);
  objc_storeStrong((id *)&self->_downstreamEndpoints, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_rxDynamicAssets, 0);
  objc_storeStrong((id *)&self->_txDynamicAssets, 0);
  objc_storeStrong((id *)&self->_txFirmwareAssets, 0);
  objc_storeStrong((id *)&self->_layer2WatchdogTimer, 0);
  objc_storeStrong((id *)&self->_personalizationQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

- (void)initWithUARPAccessory:(uint64_t)a3 uploader:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)addTxDynamicAsset:.cold.1()
{
  OUTLINED_FUNCTION_2_2(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_6(&dword_21E079000, &_os_log_internal, v0, "Tx Dynamic Assets %@", v1, v2, v3, v4, v5);
}

- (void)addRxDynamicAsset:.cold.1()
{
  OUTLINED_FUNCTION_2_2(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_6(&dword_21E079000, &_os_log_internal, v0, "Rx Dynamic Assets %@", v1, v2, v3, v4, v5);
}

- (void)im4mAssetReceived:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
    a5,
    a6,
    a7,
    a8,
    2u);
}

- (void)handlePersonalizationRequest:(os_log_t)log tatsuSigningServer:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_21E079000, log, OS_LOG_TYPE_ERROR, "Personalization Tatsu request failed", v1, 2u);
}

- (void)handlePersonalizationResponse:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  uint64_t v3 = "-[UARPUploaderEndpoint handlePersonalizationResponse:]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_21E079000, a2, OS_LOG_TYPE_ERROR, "%s: TSS response is nil for %@", (uint8_t *)&v2, 0x16u);
}

- (void)respondIM4M:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_21E079000, log, OS_LOG_TYPE_ERROR, "Failed to prepare IM4M", v1, 2u);
}

@end