@interface UARPPowerLogAccessory
- (BOOL)isEqual:(id)a3;
- (BOOL)reachable;
- (BOOL)stagingInProgress;
- (NSUUID)uuid;
- (UARPPowerLogAccessory)initWithModelNumber:(id)a3 uuid:(id)a4 stagingWindowPeriodSeconds:(unsigned int)a5;
- (id)description;
- (void)dealloc;
- (void)resetStagingWindowStartOffset;
- (void)setAssetOfferedWithVersion:(id)a3 activeFirmwareVersion:(id)a4;
- (void)setReachableWithActiveFirmwareVersion:(id)a3 stagedFirmwareVersion:(id)a4;
- (void)setStagingCompleteForStagedFirmareVersion:(id)a3 activeFirmareVersion:(id)a4 status:(unint64_t)a5;
- (void)setStagingWindowStartOffset:(unsigned int)a3;
- (void)setUnreachable;
- (void)stagingStopped;
- (void)stagingWindowTimeFired;
- (void)startStagingWindowTimer;
- (void)updateStagingProgressWithRequestedOffset:(unsigned int)a3 requestedLength:(unsigned int)a4;
@end

@implementation UARPPowerLogAccessory

- (UARPPowerLogAccessory)initWithModelNumber:(id)a3 uuid:(id)a4 stagingWindowPeriodSeconds:(unsigned int)a5
{
  id v8 = a3;
  id v9 = a4;
  v18.receiver = self;
  v18.super_class = (Class)UARPPowerLogAccessory;
  v10 = [(UARPPowerLogAccessory *)&v18 init];
  if (v10)
  {
    os_log_t v11 = os_log_create("com.apple.accessoryupdater.uarp", "powerLogAccessory");
    log = v10->_log;
    v10->_log = (OS_os_log *)v11;

    uint64_t v13 = [v8 copy];
    modelNumber = v10->_modelNumber;
    v10->_modelNumber = (NSString *)v13;

    objc_storeStrong((id *)&v10->_uuid, a4);
    dispatch_queue_t v15 = dispatch_queue_create("UARPPowerLogAccessory", 0);
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v15;

    v10->_stagingWindowTimerIntervalNS = 1000000000 * a5;
  }

  return v10;
}

- (void)dealloc
{
  if (self->_stagingInProgress) {
    [(UARPPowerLogAccessory *)self stagingStopped];
  }
  v3.receiver = self;
  v3.super_class = (Class)UARPPowerLogAccessory;
  [(UARPPowerLogAccessory *)&v3 dealloc];
}

- (void)setReachableWithActiveFirmwareVersion:(id)a3 stagedFirmwareVersion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __85__UARPPowerLogAccessory_setReachableWithActiveFirmwareVersion_stagedFirmwareVersion___block_invoke;
  block[3] = &unk_264492C38;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(queue, block);
}

void __85__UARPPowerLogAccessory_setReachableWithActiveFirmwareVersion_stagedFirmwareVersion___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 80))
  {
    objc_super v3 = *(NSObject **)(v2 + 24);
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_INFO)) {
      return;
    }
    uint64_t v4 = *(void *)(a1 + 32);
    int v12 = 138412290;
    uint64_t v13 = v4;
    v5 = "%@ marked reachable, but already reachable";
    id v6 = v3;
    uint32_t v7 = 12;
  }
  else
  {
    *(unsigned char *)(v2 + 80) = 1;
    UARPPowerLogAccessoryReachable(*(void **)(*(void *)(a1 + 32) + 8), *(void **)(a1 + 40), *(void **)(a1 + 48));
    id v8 = *(NSObject **)(*(void *)(a1 + 32) + 24);
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO)) {
      return;
    }
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    uint64_t v11 = *(void *)(a1 + 48);
    int v12 = 138412802;
    uint64_t v13 = v9;
    __int16 v14 = 2112;
    uint64_t v15 = v10;
    __int16 v16 = 2112;
    uint64_t v17 = v11;
    v5 = "%@ reachable activeFW=%@, stagedFW=%@";
    id v6 = v8;
    uint32_t v7 = 32;
  }
  _os_log_impl(&dword_21E079000, v6, OS_LOG_TYPE_INFO, v5, (uint8_t *)&v12, v7);
}

- (void)setUnreachable
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__UARPPowerLogAccessory_setUnreachable__block_invoke;
  block[3] = &unk_264492750;
  block[4] = self;
  dispatch_sync(queue, block);
}

void __39__UARPPowerLogAccessory_setUnreachable__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 80))
  {
    *(unsigned char *)(v2 + 80) = 0;
    UARPPowerLogAccessoryUnreachable(*(void **)(*(void *)(a1 + 32) + 8));
    [*(id *)(a1 + 32) stagingStopped];
    objc_super v3 = *(NSObject **)(*(void *)(a1 + 32) + 24);
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_INFO)) {
      return;
    }
    uint64_t v4 = *(void *)(a1 + 32);
    int v7 = 138412290;
    uint64_t v8 = v4;
    v5 = "%@ unreachable";
  }
  else
  {
    objc_super v3 = *(NSObject **)(v2 + 24);
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_INFO)) {
      return;
    }
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412290;
    uint64_t v8 = v6;
    v5 = "%@ marked unreachable, but already unreachable";
  }
  _os_log_impl(&dword_21E079000, v3, OS_LOG_TYPE_INFO, v5, (uint8_t *)&v7, 0xCu);
}

- (void)setAssetOfferedWithVersion:(id)a3 activeFirmwareVersion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __74__UARPPowerLogAccessory_setAssetOfferedWithVersion_activeFirmwareVersion___block_invoke;
  block[3] = &unk_264492C38;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_sync(queue, block);
}

void __74__UARPPowerLogAccessory_setAssetOfferedWithVersion_activeFirmwareVersion___block_invoke(id *a1)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  uint64_t v2 = (uint64_t)(a1 + 4);
  id v1 = a1[4];
  if (*((unsigned char *)v1 + 81))
  {
    objc_super v3 = *((void *)v1 + 3);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __74__UARPPowerLogAccessory_setAssetOfferedWithVersion_activeFirmwareVersion___block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  else
  {
    UARPPowerLogAssetOffered(*((void **)v1 + 1), a1[5], a1[6]);
    [a1[4] startStagingWindowTimer];
    uint64_t v11 = [a1[5] copy];
    id v12 = a1[4];
    id v13 = (void *)v12[8];
    v12[8] = v11;

    uint64_t v14 = [a1[6] copy];
    uint64_t v15 = a1[4];
    __int16 v16 = (void *)v15[9];
    v15[9] = v14;

    [a1[4] resetStagingWindowStartOffset];
    *((unsigned char *)a1[4] + 81) = 1;
    uint64_t v17 = *((void *)a1[4] + 3);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      id v19 = a1[5];
      id v18 = a1[6];
      id v20 = a1[4];
      int v21 = 138412802;
      id v22 = v20;
      __int16 v23 = 2112;
      id v24 = v18;
      __int16 v25 = 2112;
      id v26 = v19;
      _os_log_impl(&dword_21E079000, v17, OS_LOG_TYPE_INFO, "%@ asset offered. offeredFW=%@, activeFW=%@", (uint8_t *)&v21, 0x20u);
    }
  }
}

- (void)setStagingCompleteForStagedFirmareVersion:(id)a3 activeFirmareVersion:(id)a4 status:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  queue = self->_queue;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __95__UARPPowerLogAccessory_setStagingCompleteForStagedFirmareVersion_activeFirmareVersion_status___block_invoke;
  v13[3] = &unk_264492B98;
  v13[4] = self;
  id v14 = v9;
  id v15 = v8;
  unint64_t v16 = a5;
  id v11 = v8;
  id v12 = v9;
  dispatch_sync(queue, v13);
}

void __95__UARPPowerLogAccessory_setStagingCompleteForStagedFirmareVersion_activeFirmareVersion_status___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v2 = a1 + 32;
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 81))
  {
    UARPPowerLogStagingComplete(*(void **)(v1 + 8), *(void **)(a1 + 40), *(void **)(a1 + 48), *(void *)(a1 + 56));
    [*(id *)(a1 + 32) stagingStopped];
    uint64_t v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = *(void *)(a1 + 40);
      uint64_t v5 = *(void *)(a1 + 48);
      uint64_t v7 = *(void *)(a1 + 32);
      int v15 = 138412802;
      uint64_t v16 = v7;
      __int16 v17 = 2112;
      uint64_t v18 = v5;
      __int16 v19 = 2112;
      uint64_t v20 = v6;
      _os_log_impl(&dword_21E079000, v4, OS_LOG_TYPE_INFO, "%@ staging complete. stagedFW=%@, activeFW=%@", (uint8_t *)&v15, 0x20u);
    }
  }
  else
  {
    id v8 = *(NSObject **)(v1 + 24);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __95__UARPPowerLogAccessory_setStagingCompleteForStagedFirmareVersion_activeFirmareVersion_status___block_invoke_cold_1(v2, v8, v9, v10, v11, v12, v13, v14);
    }
  }
}

- (void)startStagingWindowTimer
{
  objc_super v3 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF8400], 0, 0, (dispatch_queue_t)self->_queue);
  stagingWindowTimer = self->_stagingWindowTimer;
  self->_stagingWindowTimer = v3;

  objc_initWeak(&location, self);
  uint64_t v5 = self->_stagingWindowTimer;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __48__UARPPowerLogAccessory_startStagingWindowTimer__block_invoke;
  v7[3] = &unk_264491768;
  objc_copyWeak(&v8, &location);
  dispatch_source_set_event_handler(v5, v7);
  dispatch_time_t v6 = dispatch_time(0, self->_stagingWindowTimerIntervalNS);
  dispatch_source_set_timer((dispatch_source_t)self->_stagingWindowTimer, v6, self->_stagingWindowTimerIntervalNS, 0x5F5E100uLL);
  dispatch_resume((dispatch_object_t)self->_stagingWindowTimer);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __48__UARPPowerLogAccessory_startStagingWindowTimer__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained stagingWindowTimeFired];
}

- (void)stagingWindowTimeFired
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  UARPPowerLogStagingStatus(self->_modelNumber, self->_stagingActiveFirmwareVersion, self->_stagingStagingFirmwareVersion, self->_stagingWindowStartOffset, self->_stagingWindowBytesTransferred);
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    stagingActiveFirmwareVersion = self->_stagingActiveFirmwareVersion;
    stagingStagingFirmwareVersion = self->_stagingStagingFirmwareVersion;
    unsigned int stagingWindowStartOffset = self->_stagingWindowStartOffset;
    unsigned int stagingWindowBytesTransferred = self->_stagingWindowBytesTransferred;
    int v8 = 138413314;
    uint64_t v9 = self;
    __int16 v10 = 2112;
    uint64_t v11 = stagingActiveFirmwareVersion;
    __int16 v12 = 2112;
    uint64_t v13 = stagingStagingFirmwareVersion;
    __int16 v14 = 1024;
    unsigned int v15 = stagingWindowStartOffset;
    __int16 v16 = 1024;
    unsigned int v17 = stagingWindowBytesTransferred;
    _os_log_impl(&dword_21E079000, log, OS_LOG_TYPE_INFO, "%@ staging timer fired. activeFW=%@, stagingFW=%@, off=%u, tx=%u", (uint8_t *)&v8, 0x2Cu);
  }
  self->_stagingWindowStartOffset += self->_stagingWindowBytesTransferred;
  self->_unsigned int stagingWindowBytesTransferred = 0;
}

- (void)updateStagingProgressWithRequestedOffset:(unsigned int)a3 requestedLength:(unsigned int)a4
{
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __82__UARPPowerLogAccessory_updateStagingProgressWithRequestedOffset_requestedLength___block_invoke;
  v5[3] = &unk_264492E98;
  v5[4] = self;
  unsigned int v6 = a3;
  unsigned int v7 = a4;
  dispatch_sync(queue, v5);
}

void __82__UARPPowerLogAccessory_updateStagingProgressWithRequestedOffset_requestedLength___block_invoke(uint64_t a1)
{
  uint64_t v3 = a1 + 32;
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 81))
  {
    [(id)v2 setStagingWindowStartOffset:*(unsigned int *)(a1 + 40)];
    *(_DWORD *)(*(void *)(a1 + 32) + 56) += *(_DWORD *)(a1 + 44);
  }
  else
  {
    uint64_t v4 = *(NSObject **)(v2 + 24);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __82__UARPPowerLogAccessory_updateStagingProgressWithRequestedOffset_requestedLength___block_invoke_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

- (void)setStagingWindowStartOffset:(unsigned int)a3
{
  if (!self->_stagingWindowStartOffsetInitialUpdateComplete)
  {
    self->_unsigned int stagingWindowStartOffset = a3;
    self->_stagingWindowStartOffsetInitialUpdateComplete = 1;
  }
}

- (void)resetStagingWindowStartOffset
{
  self->_unsigned int stagingWindowStartOffset = 0;
  self->_stagingWindowStartOffsetInitialUpdateComplete = 0;
}

- (void)stagingStopped
{
  stagingWindowTimer = self->_stagingWindowTimer;
  if (stagingWindowTimer)
  {
    dispatch_source_cancel(stagingWindowTimer);
    uint64_t v4 = self->_stagingWindowTimer;
    self->_stagingWindowTimer = 0;
  }
  stagingActiveFirmwareVersion = self->_stagingActiveFirmwareVersion;
  self->_stagingActiveFirmwareVersion = 0;

  stagingStagingFirmwareVersion = self->_stagingStagingFirmwareVersion;
  self->_stagingStagingFirmwareVersion = 0;

  self->_stagingInProgress = 0;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uuid = self->_uuid;
    uint64_t v6 = [v4 uuid];
    char v7 = [(NSUUID *)uuid isEqual:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (id)description
{
  uint64_t v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  modelNumber = self->_modelNumber;
  uuid = self->_uuid;
  uint64_t v8 = [NSNumber numberWithBool:self->_reachable];
  uint64_t v9 = [NSNumber numberWithBool:self->_stagingInProgress];
  uint64_t v10 = [v3 stringWithFormat:@"<%@: %@ %@ reachable=%@, staging=%@>", v5, modelNumber, uuid, v8, v9];

  return v10;
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 88, 1);
}

- (BOOL)reachable
{
  return self->_reachable;
}

- (BOOL)stagingInProgress
{
  return self->_stagingInProgress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_stagingStagingFirmwareVersion, 0);
  objc_storeStrong((id *)&self->_stagingActiveFirmwareVersion, 0);
  objc_storeStrong((id *)&self->_stagingWindowTimer, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_modelNumber, 0);
}

void __74__UARPPowerLogAccessory_setAssetOfferedWithVersion_activeFirmwareVersion___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __95__UARPPowerLogAccessory_setStagingCompleteForStagedFirmareVersion_activeFirmareVersion_status___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __82__UARPPowerLogAccessory_updateStagingProgressWithRequestedOffset_requestedLength___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end